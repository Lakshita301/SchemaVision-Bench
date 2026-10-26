"""Exercise archive -> verify -> extract -> report replay without providers/DB."""
import hashlib
import json
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch

import yaml
from er2sql.module7_evaluation.reproducibility import freeze_bundle, verify_bundle, safe_entry
from er2sql.module7_evaluation.replay import replay_snapshot
from er2sql.module7_evaluation.evaluator import evaluate_results_dir


class ReproducibilityTests(unittest.TestCase):
    def fixture(self, root, with_results=True):
        diagrams, sql = root/'images', root/'sql'
        diagrams.mkdir()
        sql.mkdir()
        (diagrams/'schema_1.png').write_bytes(b'synthetic image bytes; never sent')
        ddl = 'CREATE TABLE t(id INT PRIMARY KEY);'
        (sql/'schema_1.sql').write_text(ddl)
        config = {'llm':{role:{'model':'offline', 'api_key_env':'UNUSED'} for role in
                  ('module2_parsing','module3_generation','module6_direct_baseline')},
                  'dataset':{'tiers':{tier:{'diagrams_dir':str(diagrams), 'sql_dir':str(sql)} for tier in ('tier2','tier3')}}}
        config['database'] = {'password':'DO_NOT_ARCHIVE_THIS_SECRET', 'host':'localhost',
                              'port':5432, 'dbname':'unused', 'user':'unused', 'password_env':'UNUSED_DB'}
        (root/'model.yaml').write_text(yaml.safe_dump(config))
        run = root/'run'
        manifest = {'version':1, 'experiment':{'name':'test', 'output_root':str(run), 'verify':False},
                    'models':[{'name':'offline', 'config':str(root/'model.yaml'),
                               'arms':['structured','direct'], 'prompt_version':'v1'}]}
        path = root/'experiment.yaml'
        path.write_text(yaml.safe_dump(manifest))
        if with_results:
            for arm in ('structured','direct'):
                base = run/'results'/'offline'/arm
                if arm == 'direct':
                    base = base/'module6_direct_baseline'
                for tier in ('tier2','tier3'):
                    target = base/tier/'schema_1.json'
                    target.parent.mkdir(parents=True)
                    target.write_text(json.dumps({'schema_id':'schema_1', 'tier':tier,
                        'ground_truth_sql':ddl,
                        'module3_generation' if arm == 'structured' else 'module6_direct_baseline':
                            {'success':True, 'sql_ddl':ddl}}))
                (base/'api_attempts.jsonl').write_text('')
            (run/'reports').mkdir()
            (run/'reports'/'summary.csv').write_text('metric,value\nsynthetic,1\n')
        return path, run

    def test_round_trip_reports_hashes_redaction_and_no_calls(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            manifest, run = self.fixture(root)
            with patch('er2sql.config.load_dotenv') as dotenv, \
                 patch('er2sql.llm_client.LLMClient', side_effect=AssertionError('No model clients')), \
                 patch('psycopg2.connect', side_effect=AssertionError('No database')):
                bundle = root/'snapshot.zip'
                inventory = freeze_bundle(manifest, bundle, True, True)
                self.assertTrue(inventory['all_selected_artifacts_present'])
                self.assertEqual(verify_bundle(bundle), inventory)
                with zipfile.ZipFile(bundle) as archive:
                    self.assertIn('run/reports/summary.csv', archive.namelist())
                    self.assertNotIn(b'DO_NOT_ARCHIVE_THIS_SECRET', archive.read('configs/offline.json'))
                    self.assertFalse(any(n.endswith('.env') for n in archive.namelist()))
                    snapshot = root/'extracted'
                    archive.extractall(snapshot)
                products = replay_snapshot(snapshot, root/'replayed')
                self.assertEqual(len(products), 2)
                expected = evaluate_results_dir(run/'results'/'offline'/'structured', arm='structured', model_name='offline')
                actual = json.loads((root/'replayed'/'offline'/'structured'/'evaluation_report.json').read_text())
                self.assertEqual(actual['overall'], expected.overall)
                dotenv.assert_not_called()
                with self.assertRaisesRegex(ValueError, 'overwrite'):
                    freeze_bundle(manifest, bundle)
                (snapshot/'inputs'/'offline'/'tier2'/'schema_1.sql').write_text('tampered')
                with self.assertRaisesRegex(ValueError, 'checksum'):
                    replay_snapshot(snapshot, root/'second_replay')

    def test_preparation_archive_is_not_a_complete_experiment(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            manifest, _ = self.fixture(root, False)
            bundle = root/'snapshot.zip'
            inventory = freeze_bundle(manifest, bundle, True, True)
            self.assertFalse(inventory['all_selected_artifacts_present'])
            with zipfile.ZipFile(bundle) as archive:
                archive.extractall(root/'extracted')
            with self.assertRaisesRegex(ValueError, 'preparation-only'):
                replay_snapshot(root/'extracted', root/'replayed')

    def test_unsafe_archive_names(self):
        for name in ('../x', '/x', 'C:/x', 'C:x', 'a\\b', 'a/../b', './x', 'a//b'):
            with self.subTest(name=name), self.assertRaises(ValueError):
                safe_entry(name)

    def test_missing_duplicate_and_plan_tampering(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            manifest, _ = self.fixture(root, False)
            original = root/'original.zip'
            freeze_bundle(manifest, original, True)
            with zipfile.ZipFile(original) as archive:
                data = {n: archive.read(n) for n in archive.namelist()}
            plan = json.loads(data['resolved_plan.json'])
            plan['models'][0]['prompt_version'] = 'tampered'
            data['resolved_plan.json'] = json.dumps(plan).encode()
            inventory = json.loads(data['bundle_manifest.json'])
            inventory['files']['resolved_plan.json'] = hashlib.sha256(data['resolved_plan.json']).hexdigest()
            data['bundle_manifest.json'] = json.dumps(inventory).encode()
            target = root/'tampered.zip'
            with zipfile.ZipFile(target, 'w') as archive:
                for n, content in data.items():
                    archive.writestr(n, content)
            with self.assertRaisesRegex(ValueError, 'fingerprint'):
                verify_bundle(target)

"""Pre-paid protocol pinning and fixture regressions; no LLM calls."""
import hashlib
import tempfile
import unittest
from pathlib import Path

from er2sql.module7_evaluation.protocol import validate_protocol
from er2sql.module7_evaluation.orchestrator import load_experiment_manifest, prepare_experiment, ExperimentManifestError
from er2sql.module4_constraint_tests.gold_schema import parse_ground_truth_sql
from er2sql.module4_constraint_tests.value_factory import EnsureRowBuilder, ValueFactory, build_schema_index
from er2sql.module4_constraint_tests.check_solver import parsed_checks, witness


class PrepaidProtocolTests(unittest.TestCase):
    def test_evidence_path_identity_does_not_depend_on_file_existence(self):
        from er2sql.module7_evaluation.orchestrator import _resolve_input_path
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root/'pyproject.toml').write_text('')
            (root/'config').mkdir()
            manifest = root/'config'/'experiment.yaml'
            before = _resolve_input_path('docs/audits/new.json', manifest)
            before.parent.mkdir(parents=True)
            before.write_text('{}')
            self.assertEqual(before, _resolve_input_path('docs/audits/new.json', manifest))
            self.assertEqual(before, root/'docs'/'audits'/'new.json')
            self.assertEqual(_resolve_input_path('../input.sql', manifest), root/'input.sql')

    def test_paper_manifests_pin_identical_protocol(self):
        for path in ('config/experiment.paper-pilot-v2.yaml', 'config/experiment.paper-final-v2.yaml'):
            spec = load_experiment_manifest(path)
            rules = validate_protocol(spec.protocol_file, spec.protocol_sha256)
            self.assertFalse(rules['repair'])
            self.assertEqual(rules['tiers']['tier3'], 'cardinality_hidden_key_badges_retained')
            self.assertFalse(rules['selection']['automatic_exclusions'])

    def test_protocol_tampering_rejected_before_preparing_models(self):
        with tempfile.TemporaryDirectory() as d:
            target = Path(d)/'protocol.yaml'
            source = Path('config/paper_protocol_v1.yaml').read_bytes()
            target.write_bytes(source + b'\n# unapproved change\n')
            with self.assertRaisesRegex(ValueError, 'Frozen protocol changed'):
                validate_protocol(target, hashlib.sha256(source).hexdigest())

    def test_protocol_v5_is_supported_and_pins_contamination_policy(self):
        path = Path('config/paper_protocol_v5.yaml')
        rules = validate_protocol(path, hashlib.sha256(path.read_bytes()).hexdigest())
        self.assertEqual(rules['protocol_version'], 5)
        self.assertTrue(rules['contamination']['required_before_paid_runs'])
        self.assertTrue(rules['reporting']['report_low_risk_only_sensitivity'])
        self.assertEqual(rules['contamination']['split_file'], 'config/paper_splits_v5.json')
        import json
        source_split = json.loads(Path(rules['contamination']['split_file']).read_text(encoding='utf-8-sig'))
        eligible_split = json.loads(Path(rules['contamination']['eligible_split_file']).read_text(encoding='utf-8-sig'))
        self.assertEqual([len(source_split[k]) for k in ('development', 'pilot', 'final')], [78, 24, 612])
        self.assertEqual([len(eligible_split[k]) for k in ('development', 'pilot', 'final')], [76, 11, 264])
        for phase in ('development', 'pilot', 'final'):
            self.assertTrue(set(eligible_split[phase]).issubset(source_split[phase]))

    def test_v5_paid_manifest_requires_full_contamination_split(self):
        import yaml
        with tempfile.TemporaryDirectory() as d:
            raw = yaml.safe_load(Path('config/experiment.paper-pilot-v3.yaml').read_text())
            protocol = Path('config/paper_protocol_v5.yaml')
            raw['experiment']['protocol_file'] = str(protocol.resolve())
            raw['experiment']['protocol_sha256'] = hashlib.sha256(protocol.read_bytes()).hexdigest()
            raw['experiment'].pop('contamination_split_file', None)
            target = Path(d) / 'manifest.yaml'
            target.write_text(yaml.safe_dump(raw))
            with self.assertRaisesRegex(ExperimentManifestError, 'require contamination_split_file'):
                prepare_experiment(target, load_environment=False)

    def test_pre_v5_paid_manifest_is_rejected_before_provider_setup(self):
        with self.assertRaisesRegex(ExperimentManifestError, 'require prospective protocol v5'):
            prepare_experiment('config/experiment.paper-pilot-v3.yaml', load_environment=False)

    def test_paper_manifest_cannot_omit_protocol(self):
        import yaml
        with tempfile.TemporaryDirectory() as d:
            raw = yaml.safe_load(Path('config/experiment.paper-pilot-v2.yaml').read_text())
            raw['experiment'].pop('protocol_file')
            target = Path(d)/'manifest.yaml'
            target.write_text(yaml.safe_dump(raw))
            with self.assertRaisesRegex(ExperimentManifestError, 'protocol_file'):
                prepare_experiment(target, load_environment=False)

    def test_partial_fk_resolution_never_overwrites_forced_null_or_sentinel(self):
        ir = parse_ground_truth_sql('CREATE TABLE p(a INT,b INT,PRIMARY KEY(a,b)); CREATE TABLE c(x INT NOT NULL,y INT,FOREIGN KEY(x,y) REFERENCES p(a,b));', 's').ir
        for value in (None, -1):
            builder = EnsureRowBuilder(build_schema_index(ir), ValueFactory())
            row = builder.build_row_values('c', {'x':value})
            self.assertEqual(row['x'], value)

    def test_numeric_check_witness_fits_declared_precision(self):
        table = parse_ground_truth_sql('CREATE TABLE t(a NUMERIC(4,2) CHECK(a BETWEEN 1 AND 10),b INT CHECK(b BETWEEN 1000 AND 2000));','s').ir['tables'][0]
        nodes, _ = parsed_checks(table)
        candidate = witness(table, nodes, {'a':1.0, 'b':1000}, reject_index=0)
        self.assertIsNotNone(candidate)
        self.assertLess(abs(candidate['a']), 100)

    def test_zero_behavioral_denominators_are_disclosed(self):
        from er2sql.module7_evaluation.evaluator import _schema_metrics, _aggregate_rows
        rows = [_schema_metrics({'schema_id':'s', 'tier':t, 'ground_truth_sql':'CREATE TABLE t(x INT);',
                                 'module3_generation':{'success':False}}, 'structured') for t in ('tier1','tier2','tier3')]
        aggregate = _aggregate_rows(rows)
        self.assertEqual(aggregate['zero_behavioral_test_schema_count'], 1)
        self.assertEqual(aggregate['zero_behavioral_test_artifact_count'], 3)
        self.assertIsNone(aggregate['macro_cer_all'])

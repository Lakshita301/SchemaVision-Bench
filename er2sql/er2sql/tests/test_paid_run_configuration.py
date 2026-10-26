"""Guard the frozen paper protocol hash and least-privilege DB profiles."""
import hashlib
from pathlib import Path
import unittest

import yaml


ROOT = Path(__file__).resolve().parents[1]


class PaidRunConfigurationTests(unittest.TestCase):
    def test_v3_manifests_pin_the_current_protocol(self):
        protocol = ROOT / "config" / "paper_protocol_v3.yaml"
        expected = hashlib.sha256(protocol.read_bytes()).hexdigest()
        for name in ("experiment.paper-pilot-v3.yaml", "experiment.paper-final-v3.yaml"):
            with self.subTest(manifest=name):
                data = yaml.safe_load((ROOT / "config" / name).read_text(encoding="utf-8"))
                experiment = data["experiment"]
                self.assertEqual(experiment["protocol_sha256"], expected)
                self.assertEqual(experiment["protocol_file"], "config/paper_protocol_v3.yaml")

    def test_paper_model_profiles_use_isolated_non_superuser_database_role(self):
        for name in (
            "mistral-small-4.yaml",
            "groq-qwen3.8-27b.yaml",
            "model.template.yaml",
        ):
            with self.subTest(profile=name):
                data = yaml.safe_load((ROOT / "config" / "models" / name).read_text(encoding="utf-8"))
                database = data["database"]
                self.assertEqual(database["dbname"], "er2sql_paper_verify")
                self.assertEqual(database["user"], "er2sql_runner")
                self.assertEqual(database["password_env"], "ER2SQL_VERIFY_DB_PASSWORD")


if __name__ == "__main__":
    unittest.main()

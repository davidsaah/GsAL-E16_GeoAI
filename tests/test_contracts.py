import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class ContractTests(unittest.TestCase):
    def test_schema_files_are_valid_json_objects(self):
        schemas = sorted((ROOT / "schemas").glob("*.json"))
        self.assertGreaterEqual(len(schemas), 3)
        for path in schemas:
            with self.subTest(path=path.name):
                data = json.loads(path.read_text(encoding="utf-8"))
                self.assertEqual(data.get("type"), "object")
                self.assertIn("required", data)

    def test_all_agent_roles_exist(self):
        expected = {
            "organizer.md",
            "researcher.md",
            "pedagogy-architect.md",
            "course-builder.md",
            "student-tester.md",
            "visual-designer.md",
            "critic.md",
            "publisher.md",
        }
        actual = {path.name for path in (ROOT / "agents").glob("*.md")}
        self.assertTrue(expected.issubset(actual))

    def test_constitution_preserves_no_code_course(self):
        constitution = (ROOT / "standards" / "course-constitution.md").read_text(
            encoding="utf-8"
        )
        required_phrases = [
            "Eight class meetings",
            "No programming required",
            "Approximately one hour per lecture",
            "ArcGIS Pro",
            "Week 8",
            "David Saah",
        ]
        for phrase in required_phrases:
            with self.subTest(phrase=phrase):
                self.assertIn(phrase, constitution)


if __name__ == "__main__":
    unittest.main()

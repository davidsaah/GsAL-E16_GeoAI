#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

required_files=(
  "README.md"
  ".env.example"
  "agents/organizer.md"
  "agents/researcher.md"
  "agents/pedagogy-architect.md"
  "agents/course-builder.md"
  "agents/student-tester.md"
  "agents/visual-designer.md"
  "agents/critic.md"
  "agents/publisher.md"
  "standards/course-constitution.md"
  "standards/pedagogy-rubric.md"
  "standards/design-system.md"
  "standards/scientific-qa.md"
  "standards/accessibility-checklist.md"
  "standards/source-policy.md"
  "schemas/evidence-pack.schema.json"
  "schemas/class-package.schema.json"
  "schemas/review-report.schema.json"
  "workflows/course-production.yaml"
  "infrastructure/docker-compose.yml"
)

missing=0
for path in "${required_files[@]}"; do
  if [[ ! -s "$path" ]]; then
    echo "Missing or empty required file: $path"
    missing=1
  fi
done

if [[ "$missing" -ne 0 ]]; then
  exit 1
fi

python3 - <<'PY'
import json
from pathlib import Path

for path in sorted(Path("schemas").glob("*.json")):
    with path.open(encoding="utf-8") as handle:
        data = json.load(handle)
    if data.get("type") != "object":
        raise SystemExit(f"Schema root must be an object: {path}")
    print(f"Valid JSON schema: {path}")
PY

for forbidden in '.env' 'credentials' 'secrets'; do
  if git ls-files --error-unmatch "$forbidden" >/dev/null 2>&1; then
    echo "Forbidden tracked path: $forbidden"
    exit 1
  fi
done

if rg -n --hidden --glob '!.git/**' --glob '!scripts/validate_repo.sh' \
  '(sk-[A-Za-z0-9_-]{20,}|AIza[0-9A-Za-z_-]{25,}|ANTHROPIC_API_KEY=[^[:space:]]+|OPENAI_API_KEY=[^[:space:]]+|GOOGLE_API_KEY=[^[:space:]]+)' \
  . | rg -v '^\.\/\.env\.example:'; then
  echo "Possible secret detected. Review before committing."
  exit 1
fi

echo "Repository validation passed."

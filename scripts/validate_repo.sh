#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "[validate] shell syntax"
while IFS= read -r -d '' f; do
  bash -n "$f"
done < <(find scripts -type f -name '*.sh' -print0)

echo "[validate] python syntax"
if ls scripts/*.py >/dev/null 2>&1; then
  python3 -m py_compile scripts/*.py
fi

echo "[validate] privacy patterns"
if grep -R -nE '/home/hun|hun-thinkpad|root@hun-thinkpad' . --exclude-dir=.git --exclude='*.pyc' --exclude='*.log' --exclude='validate_repo.sh'; then
  echo "[validate] FAIL: private pattern detected" >&2
  exit 1
fi

echo "[validate] placeholder patterns"
if grep -R -n '<your-username>' README*.md templates/PROJECT_BOOTSTRAP_PROMPT.md; then
  echo "[validate] FAIL: unresolved placeholder detected" >&2
  exit 1
fi

echo "[validate] OK"

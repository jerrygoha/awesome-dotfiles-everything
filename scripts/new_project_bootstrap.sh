#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <project-path>"
  exit 1
fi

BASE="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_PATH="$1"
mkdir -p "$PROJECT_PATH"

mkdir -p "$PROJECT_PATH/.bootstrap"
cp -f "$BASE/templates/PROJECT_BOOTSTRAP_PROMPT.md" "$PROJECT_PATH/.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md"

mkdir -p "$PROJECT_PATH/memory"
: > "$PROJECT_PATH/memory/decisions.md"
: > "$PROJECT_PATH/memory/tasks.md"
: > "$PROJECT_PATH/memory/meetings.md"
: > "$PROJECT_PATH/memory/events.jsonl"

cat > "$PROJECT_PATH/README_BOOTSTRAP.md" <<'EOF'
# Bootstrap Ready

이 프로젝트는 awesome-dotfiles-everything 기준으로 초기화되었습니다.

다음 단계:
1) Claude/Codex에 `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md`를 전달
2) research + plan 산출
3) 새 세션에서 subagent-driven-development 실행
EOF

echo "[bootstrap] ready: $PROJECT_PATH"

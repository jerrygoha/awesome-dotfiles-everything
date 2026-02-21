#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  new_project_bootstrap.sh <project-path> [--mode local|clone] [--repo-url <url>] [--ref <branch-or-tag>]

Examples:
  # Use current local baseline repo
  bash scripts/new_project_bootstrap.sh ~/Projects/my-app

  # Recommended: clone baseline into each target project
  bash scripts/new_project_bootstrap.sh ~/Projects/my-app --mode clone

  # Clone a pinned tag
  bash scripts/new_project_bootstrap.sh ~/Projects/my-app --mode clone --ref v0.1.0
EOF
}

PROJECT_PATH=""
MODE="local"
REPO_URL="https://github.com/jerrygoha/awesome-dotfiles-everything.git"
REF="main"

while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --mode)
      MODE="${2:-}"
      shift 2
      ;;
    --repo-url)
      REPO_URL="${2:-}"
      shift 2
      ;;
    --ref)
      REF="${2:-}"
      shift 2
      ;;
    --*)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
    *)
      if [ -z "$PROJECT_PATH" ]; then
        PROJECT_PATH="$1"
        shift
      else
        echo "Unexpected argument: $1" >&2
        usage
        exit 1
      fi
      ;;
  esac
done

if [ -z "$PROJECT_PATH" ]; then
  usage
  exit 1
fi

if [ "$MODE" != "local" ] && [ "$MODE" != "clone" ]; then
  echo "Invalid --mode: $MODE (must be local or clone)" >&2
  exit 1
fi

if [ "$MODE" = "local" ]; then
  SOURCE_BASE="$(cd "$(dirname "$0")/.." && pwd)"
else
  SOURCE_BASE="$PROJECT_PATH/.tooling/awesome-dotfiles-everything"
  mkdir -p "$PROJECT_PATH/.tooling"
  if [ ! -d "$SOURCE_BASE/.git" ]; then
    git clone --depth 1 --branch "$REF" "$REPO_URL" "$SOURCE_BASE"
  else
    (
      cd "$SOURCE_BASE"
      git fetch --depth 1 origin "$REF" || true
      git checkout -q "$REF" || true
      git reset --hard "origin/$REF" || true
    )
  fi
fi

mkdir -p "$PROJECT_PATH/.bootstrap"
cp -f "$SOURCE_BASE/templates/PROJECT_BOOTSTRAP_PROMPT.md" "$PROJECT_PATH/.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md"

mkdir -p "$PROJECT_PATH/memory"
touch "$PROJECT_PATH/memory/decisions.md"
touch "$PROJECT_PATH/memory/tasks.md"
touch "$PROJECT_PATH/memory/meetings.md"
touch "$PROJECT_PATH/memory/events.jsonl"

cat > "$PROJECT_PATH/.bootstrap/BASELINE_META.json" <<EOF
{
  "repo_url": "$REPO_URL",
  "ref": "$REF",
  "mode": "$MODE"
}
EOF

cat > "$PROJECT_PATH/README_BOOTSTRAP.md" <<'EOF'
# Bootstrap Ready

This project has been initialized with awesome-dotfiles-everything baseline.

Next steps:
1) Give `.bootstrap/PROJECT_BOOTSTRAP_PROMPT.md` to Claude/Codex
2) Produce a research + plan markdown
3) Open a new session
4) Run `/subagent-driven-development`
EOF

echo "[bootstrap] ready: $PROJECT_PATH (mode=$MODE)"

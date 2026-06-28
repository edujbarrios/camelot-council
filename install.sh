#!/usr/bin/env bash
set -euo pipefail

CODEX_DIR="${HOME}/.codex"
DRY_RUN=0
COPY_CONFIGS=0
MODE=""

usage() {
  cat <<'USAGE'
Camelot Council installer

Usage:
  ./install.sh --codex
  ./install.sh --codex-only
  ./install.sh --codex-dir /path/to/.codex
  ./install.sh --dry-run
  ./install.sh --copy-configs

Examples:
  ./install.sh --codex-only
  ./install.sh --codex-only --copy-configs
  ./install.sh --codex-dir "$HOME/.codex" --dry-run

Then in Codex:
  /roundtable Should we open-source this tool?
  /roundtable --quick Should we add caching here?
  /roundtable --triad security Review this auth flow.
USAGE
}

say() {
  printf '%s\n' "$*"
}

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    say "dry-run: $*"
  else
    "$@"
  fi
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --codex|--codex-only)
      MODE="codex"
      ;;
    --codex-dir)
      shift
      if [ "$#" -eq 0 ]; then
        say "error: --codex-dir requires a path"
        exit 2
      fi
      CODEX_DIR="$1"
      ;;
    --dry-run)
      DRY_RUN=1
      ;;
    --copy-configs)
      COPY_CONFIGS=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      say "error: unknown option: $1"
      usage
      exit 2
      ;;
  esac
  shift
done

if [ -z "$MODE" ]; then
  MODE="codex"
fi

if [ ! -f "SKILL.codex.md" ] || [ ! -d "agents" ] || [ ! -d "configs" ]; then
  say "error: run this installer from the camelot-council repository root"
  exit 1
fi

bash scripts/validate-structure.sh

SKILL_DIR="${CODEX_DIR}/skills/camelot-council"
CONFIG_DIR="${SKILL_DIR}/configs"
AGENT_DIR="${SKILL_DIR}/agents"

say "Installing Camelot Council for Codex"
say "Codex directory: ${CODEX_DIR}"

run mkdir -p "$SKILL_DIR" "$AGENT_DIR"
run cp "SKILL.codex.md" "${SKILL_DIR}/SKILL.md"
run cp "SKILL.md" "${SKILL_DIR}/README.md"
run cp agents/*.md "$AGENT_DIR/"

if [ "$COPY_CONFIGS" -eq 1 ]; then
  run mkdir -p "$CONFIG_DIR"
  run cp configs/*.yaml "$CONFIG_DIR/"
fi

say ""
say "Done."
say ""
say "Try these in Codex:"
say "  /roundtable Should we open-source this tool?"
say "  /roundtable --quick Should we add caching here?"
say "  /roundtable --duo Should we use microservices or a monolith?"
say "  /roundtable --triad security Review this auth flow."

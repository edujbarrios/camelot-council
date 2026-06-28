#!/usr/bin/env bash
set -euo pipefail

missing=0

require_file() {
  if [ ! -f "$1" ]; then
    printf 'missing file: %s\n' "$1"
    missing=1
  fi
}

require_dir() {
  if [ ! -d "$1" ]; then
    printf 'missing directory: %s\n' "$1"
    missing=1
  fi
}

require_executable() {
  if [ ! -x "$1" ]; then
    printf 'not executable: %s\n' "$1"
    missing=1
  fi
}

require_dir ".github/workflows"
require_dir "agents"
require_dir "assets"
require_dir "configs"
require_dir "demos"
require_dir "scripts"

for file in \
  AGENTS.md CHANGELOG.md CITATION.cff CONTRIBUTING.md LICENSE README.md \
  SKILL.md SKILL.codex.md install.sh .editorconfig .gitattributes .gitignore
do
  require_file "$file"
done

for agent in \
  merlin arthur lancelot gawain galahad percival bedivere kay morgana nimue
do
  require_file "agents/roundtable-${agent}.md"
done

require_file "configs/roundtable-triads.yaml"
require_file "configs/roundtable-profiles.yaml"
require_file "configs/provider-model-slots.example.yaml"

for demo in \
  product-decision security-review architecture-review code-review startup-strategy
do
  require_file "demos/${demo}.md"
done

require_file "scripts/roundtable-simulation-checklist.sh"
require_executable "install.sh"

if [ "$missing" -ne 0 ]; then
  printf 'Camelot Council structure validation failed.\n'
  exit 1
fi

printf 'Camelot Council structure validation passed.\n'

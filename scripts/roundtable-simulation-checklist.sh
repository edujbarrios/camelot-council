#!/usr/bin/env bash
set -euo pipefail

check() {
  printf '[ok] %s\n' "$1"
}

[ -f "SKILL.codex.md" ] && check "Codex skill file exists"
[ -f "configs/roundtable-triads.yaml" ] && check "Triad config exists"
[ -f "configs/roundtable-profiles.yaml" ] && check "Profile config exists"

check "Full mode example: /roundtable Should we open-source this tool?"
check "Quick mode example: /roundtable --quick Should we add caching here?"
check "Duo mode example: /roundtable --duo Should we use microservices or a monolith?"
check "Triad example: /roundtable --triad security Review this auth flow."

printf 'Simulation checklist complete. Run examples inside Codex to exercise the protocol.\n'

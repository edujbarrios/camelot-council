# AGENTS.md

Camelot Council is maintained as a Codex-first project. Treat this repository as a set of compact protocol files, not as a runtime package.

## Maintenance Rules

- Keep agents in `agents/*.md` with YAML frontmatter and concise operational instructions.
- Prefer small edits that preserve token efficiency.
- Do not add biographies, long lore, or roleplay.
- Update `configs/roundtable-triads.yaml` when adding a triad.
- Update `configs/roundtable-profiles.yaml` when adding a profile.
- Run `bash scripts/validate-structure.sh` before committing structural changes.
- Keep `SKILL.codex.md` as the source of truth for Codex behavior.

## Documentation

- Write for OpenAI Codex first.
- Mention other assistants only when explaining that they are outside the primary target.
- Keep examples short and command-oriented.

## Commit Style

Use Conventional Commits:

- `feat:` for new agents, protocols, configs, scripts, or install behavior.
- `docs:` for README, demos, citation, and usage guidance.
- `test:` for validation checks.
- `chore:` for repository scaffolding.
- `refactor:` for tightening existing protocol text without changing behavior.

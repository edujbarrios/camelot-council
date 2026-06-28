# Contributing

Thanks for helping improve Camelot Council.

## Principles

- Keep the project Codex-first.
- Keep agents short and operational.
- Prefer structured bullets over narrative.
- Do not add long character lore or roleplay.
- Preserve clean-room originality.

## Local Checks

Run:

```sh
bash scripts/validate-structure.sh
bash scripts/roundtable-simulation-checklist.sh
```

## Pull Requests

Use focused pull requests and Conventional Commits. Include:

- What changed.
- Why the change improves deliberation quality or developer experience.
- Any new command, config, or agent behavior.

## Agent Changes

When changing an agent:

- Keep YAML frontmatter valid.
- Keep `max_words` tight.
- Maintain a clear lens and output contract.
- Avoid overlap with other agents unless the tension is intentional.

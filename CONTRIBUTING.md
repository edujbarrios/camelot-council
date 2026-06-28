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

On Windows without WSL, inspect the same required files manually or run the checks in GitHub Actions after pushing a branch.

## Issues

Before opening an issue:

- Search for an existing issue or pull request.
- Use the matching issue template.
- Include the exact `/roundtable` command when reporting behavior.
- Keep examples short and remove private context.

## Pull Requests

Use focused pull requests and Conventional Commits. Include:

- What changed.
- Why the change improves deliberation quality or developer experience.
- Any new command, config, or agent behavior.

Pull requests should stay clean-room original. Do not copy agent text, docs, prompts, scripts, or examples from other projects.

## Security

Do not open public issues for sensitive reports. Follow [SECURITY.md](SECURITY.md).

## Conduct

Participation in this project is covered by [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Agent Changes

When changing an agent:

- Keep YAML frontmatter valid.
- Keep `max_words` tight.
- Maintain a clear lens and output contract.
- Avoid overlap with other agents unless the tension is intentional.

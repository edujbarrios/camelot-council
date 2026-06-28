# Camelot Council

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-blue.svg)](LICENSE)
[![Target: OpenAI Codex](https://img.shields.io/badge/Target-OpenAI%20Codex-111111.svg)](SKILL.codex.md)

Camelot Council is a Codex-first structured deliberation framework inspired by the Arthurian Round Table. It gives OpenAI Codex a compact council of Markdown agents for product decisions, code review, security review, architecture choices, startup strategy, and other moments where one-pass reasoning is too thin.

The project is open source, file-based, token-conscious, and command-oriented.

## Table of Contents

- [Quickstart](#quickstart)
- [Codex Usage](#codex-usage)
- [Why Structured Deliberation](#why-structured-deliberation)
- [Round Table Members](#round-table-members)
- [Modes](#modes)
- [Triads](#triads)
- [Profiles](#profiles)
- [Protocol](#protocol)
- [Installation](#installation)
- [Requirements](#requirements)
- [Repository Layout](#repository-layout)
- [Open Source Health](#open-source-health)
- [Contributing](#contributing)
- [Citation](#citation)
- [License](#license)

## Quickstart

```sh
git clone https://github.com/edujbarrios/camelot-council.git
cd camelot-council
./install.sh --codex-only
```

Then in Codex:

```text
/roundtable Should we open-source this tool?
/roundtable --quick Should we add caching here?
/roundtable --duo Should we use microservices or a monolith?
/roundtable --triad security Review this auth flow.
```

## Codex Usage

Camelot Council is designed for OpenAI Codex. The primary skill file is [SKILL.codex.md](SKILL.codex.md), which tells Codex how to parse `/roundtable`, choose agents, load only the needed Markdown files, run the selected deliberation mode, and return a compact verdict.

The default assumption is simple:

- Codex executes the protocol itself.
- Codex loads selected agents from `agents/*.md`.
- Codex uses triad and profile YAML only when needed.
- Codex emits the final verdict.
- Multi-provider routing is optional future extension, not required.

## Why Structured Deliberation

Single-pass answers often collapse uncertainty too early. Camelot Council keeps multiple useful pressures alive long enough to improve the decision:

- execution versus maintenance
- speed versus safety
- user clarity versus growth incentives
- ethics versus optimization pressure
- assumptions versus confident plans

The point is not theatrical debate. The point is compact dissent, explicit tradeoffs, and a verdict that names what still matters.

## Round Table Members

| Member | File | Lens |
| --- | --- | --- |
| Merlin | `roundtable-merlin.md` | Orchestration, synthesis, second-order consequences |
| Arthur | `roundtable-arthur.md` | Final decision, legitimacy, alignment |
| Lancelot | `roundtable-lancelot.md` | Execution, implementation, shipping path |
| Gawain | `roundtable-gawain.md` | Security, abuse cases, edge conditions |
| Galahad | `roundtable-galahad.md` | Ethics, integrity, user trust |
| Percival | `roundtable-percival.md` | Assumptions, unknowns, reframing |
| Bedivere | `roundtable-bedivere.md` | Cost, maintenance, technical debt |
| Kay | `roundtable-kay.md` | Devil's advocate, contradictions, weakest links |
| Morgana | `roundtable-morgana.md` | Adversarial incentives, exploitation, dark patterns |
| Nimue | `roundtable-nimue.md` | User experience, clarity, simplicity |

Agents are Markdown files with YAML frontmatter. They are intentionally short so Codex can load only what it needs.

## Modes

### Full

```text
/roundtable --full Should we rewrite this subsystem?
```

Full mode runs a restate gate, independent analysis, synthesis, cross-examination, enforcement scan, final crystallization, and verdict. If no mode is provided, full mode is the default.

### Quick

```text
/roundtable --quick Should we add caching here?
```

Quick mode is for tactical questions. It gives a compact frame, short member positions, and a direct verdict.

### Duo

```text
/roundtable --duo Should we refactor or patch?
/roundtable --duo --members lancelot,bedivere Should we refactor or patch?
```

Duo mode stages a focused tension between two poles, then returns a tie-aware verdict.

## Triads

Triads are three-member presets in [configs/roundtable-triads.yaml](configs/roundtable-triads.yaml).

```text
/roundtable --triad product Should we add public sharing?
/roundtable --triad security Review this auth flow.
/roundtable --triad architecture Should billing become a separate service?
/roundtable --triad code-review Review this cache patch.
/roundtable --triad startup Should we sell to startups first?
/roundtable --triad design Simplify this onboarding flow.
/roundtable --triad risk Evaluate this data-sharing feature.
/roundtable --triad shipping Should this release go out today?
```

Available triads:

- `product`: Lancelot, Nimue, Morgana
- `security`: Gawain, Morgana, Bedivere
- `architecture`: Merlin, Bedivere, Percival
- `code-review`: Lancelot, Gawain, Kay
- `startup`: Arthur, Morgana, Lancelot
- `design`: Nimue, Percival, Bedivere
- `risk`: Gawain, Galahad, Morgana
- `shipping`: Lancelot, Bedivere, Arthur

## Profiles

Profiles are broader member sets in [configs/roundtable-profiles.yaml](configs/roundtable-profiles.yaml).

- `classic`: all ten agents
- `execution-lean`: Lancelot, Bedivere, Arthur, Gawain, Nimue
- `risk-heavy`: Gawain, Morgana, Galahad, Kay, Merlin
- `product-focused`: Nimue, Lancelot, Morgana, Percival, Arthur
- `architecture-focused`: Merlin, Bedivere, Percival, Gawain, Lancelot

## Protocol

Camelot Council uses lightweight enforcement to prevent shallow consensus:

- **Dissent quota**: at least one selected member challenges the leading answer.
- **Novelty gate**: repeated points are dropped.
- **Assumption check**: hidden assumptions are named before the verdict.
- **Anti-recursion rule**: no extra rounds unless new decision-relevant facts appear.
- **Vote tally**: support, oppose, modify, and defer are counted.
- **Unresolved questions**: decision-changing unknowns are surfaced.
- **Follow-up actions**: verdicts end with concrete next steps.

Token efficiency rules:

- Load only selected agents.
- Default to three-agent triads when possible.
- Use full council only when requested or implied by no mode.
- Never restate the full user problem after Round 0.
- Use short problem handles after framing.
- Enforce each agent's word budget.
- Replace prior round detail with compact synthesis before moving on.
- Avoid biographies, lore, and verbose narrative.

## Installation

```sh
./install.sh --codex
./install.sh --codex-only
./install.sh --codex-dir /path/to/.codex
./install.sh --dry-run
./install.sh --copy-configs
```

The installer validates the repository, creates a Codex skill directory, copies the Codex skill file, copies the agents, and optionally copies configs.

This project does not require Claude Code. It is intentionally Codex-first.

## Requirements

- OpenAI Codex
- Bash-compatible shell for `install.sh` and validation scripts
- Git for normal development workflows

## Repository Layout

```text
agents/      Compact Markdown Round Table members
assets/      Agent template and supporting assets
configs/     Triads, profiles, and optional model slots
demos/       Short example deliberations
scripts/     Structure validation and simulation checklist
SKILL.md     General skill entry
SKILL.codex.md  Primary Codex skill
```

## Open Source Health

Camelot Council includes the usual community files for a public GitHub project:

- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Contributing Guide](CONTRIBUTING.md)
- [Security Policy](SECURITY.md)
- [Support Policy](SUPPORT.md)
- GitHub issue templates for bugs, features, and agent changes
- Pull request template
- Apache-2.0 license and citation metadata

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md). Keep changes compact, original, and Codex-first.

## Citation

If you use Camelot Council in research, writing, or tooling, cite the project with [CITATION.cff](CITATION.cff).

## License

Apache License 2.0. See [LICENSE](LICENSE).

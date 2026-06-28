# Camelot Council Codex Skill

Camelot Council turns a user prompt into a compact, structured Round Table deliberation inside OpenAI Codex.

## Trigger

Run this skill when the user invokes `/roundtable` or asks for a Camelot Council review.

## Command Grammar

Supported forms:

- `/roundtable QUESTION`
- `/roundtable --full QUESTION`
- `/roundtable --quick QUESTION`
- `/roundtable --duo QUESTION`
- `/roundtable --triad NAME QUESTION`
- `/roundtable --members merlin,gawain,bedivere QUESTION`
- `/roundtable --duo --members lancelot,bedivere QUESTION`

Accept en dash variants from pasted text, but normalize internally to `--`.

## Selection Order

1. If `--members` is present, use exactly those members.
2. Else if `--triad` is present, read `configs/roundtable-triads.yaml` and select that triad.
3. Else if a profile is explicitly requested, read `configs/roundtable-profiles.yaml`.
4. Else if `--quick`, default to `lancelot,nimue,kay`.
5. Else if `--duo`, default to `lancelot,bedivere`.
6. Else full mode uses all ten agents.

Load only selected agent files. Do not load every agent for triad, quick, or duo work.

## Member Map

- `merlin` -> `agents/roundtable-merlin.md`
- `arthur` -> `agents/roundtable-arthur.md`
- `lancelot` -> `agents/roundtable-lancelot.md`
- `gawain` -> `agents/roundtable-gawain.md`
- `galahad` -> `agents/roundtable-galahad.md`
- `percival` -> `agents/roundtable-percival.md`
- `bedivere` -> `agents/roundtable-bedivere.md`
- `kay` -> `agents/roundtable-kay.md`
- `morgana` -> `agents/roundtable-morgana.md`
- `nimue` -> `agents/roundtable-nimue.md`

## Token Rules

- Load only selected agents.
- Prefer 3-agent triads for targeted work.
- Use full council only when full mode is requested or implied by no mode.
- Never restate the full user problem after Round 0.
- Create a short problem handle after framing, such as `Handle: auth-cache-risk`.
- Keep each agent within its `max_words` frontmatter value.
- Before each new round, replace prior detail with a compact synthesis.
- Do not include biographies, lore, or in-character speech.
- Do not repeat another agent unless directly challenging it.
- Require dissent, but prevent endless debate.
- Verdicts prioritize unresolved questions and next actions.
- Prefer structured bullets over narrative.

## Full Mode

Use when the user gives no mode or requests `--full`.

1. **Routing Plan**: State whether Codex will execute locally or whether provider slots are advisory only.
2. **Round 0: Restate Gate**: Restate the problem once, name the decision boundary, and create a short handle.
3. **Round 1: Independent Analysis**: Each selected agent answers from its lens.
4. **Synthesis A**: Compress Round 1 into shared facts, tensions, and open questions.
5. **Round 2: Cross-Examination**: Each agent challenges one weak point, assumption, or missing risk.
6. **Enforcement Scan**: Apply the mechanisms below.
7. **Round 3: Final Crystallization**: Each agent gives a final position.
8. **Verdict**: Provide decision, confidence, rationale, unresolved questions, and next actions.

## Quick Mode

Use for small tactical questions.

1. **Restate + Rapid Analysis**: One compact frame and short handle.
2. **Agent Positions**: Selected agents give brief positions.
3. **Compact Verdict**: Decision, reason, risk, next step.

## Duo Mode

Use for tension between two poles or when `--duo` is present.

1. **Opening Positions**: Each member states the strongest case.
2. **Direct Response**: Each member challenges the other.
3. **Final Statements**: Each member names what would change its mind.
4. **Tie-Aware Verdict**: Decide, split the difference, or name the blocking uncertainty.

## Enforcement Mechanisms

- **Dissent quota**: At least one selected agent must challenge the leading answer.
- **Novelty gate**: Drop points that merely restate prior claims.
- **Assumption check**: Name unstated assumptions before the verdict.
- **Anti-recursion rule**: Do not add rounds unless a new decision-relevant fact appears.
- **Vote tally**: Count support, oppose, modify, and defer.
- **Unresolved questions**: Surface questions that would change the decision.
- **Follow-up actions**: End with concrete next steps.

## Output Shape

Use this shape unless the user asks otherwise:

```md
## Camelot Council

Mode:
Members:
Handle:

### Round 0
- Decision boundary:
- Key constraints:

### Deliberation
- Merlin:
- Gawain:
- Bedivere:

### Enforcement Scan
- Dissent:
- Assumptions:
- Novelty:
- Vote:

### Verdict
- Decision:
- Confidence:
- Why:
- Unresolved:
- Next actions:
```

Omit unused sections in quick mode. Keep the final answer compact.

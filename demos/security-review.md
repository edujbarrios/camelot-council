# Security Review Demo

## Command

`/roundtable --triad security Review this password-reset flow.`

## Selected Agents

Gawain, Morgana, Bedivere

## Compact Round Output

- Gawain: Token reuse, account enumeration, and weak expiry are the primary risks.
- Morgana: Attackers will automate reset requests to harass users or map valid emails.
- Bedivere: Keep controls maintainable: rate limits, logs, and tested expiry are cheaper than custom recovery logic.

## Final Verdict

Proceed only with single-use tokens, short expiry, neutral messages, throttling, and observable reset events. Block launch if enumeration remains visible.

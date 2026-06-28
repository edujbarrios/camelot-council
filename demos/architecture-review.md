# Architecture Review Demo

## Command

`/roundtable --triad architecture Should we split billing into a separate service?`

## Selected Agents

Merlin, Bedivere, Percival

## Compact Round Output

- Merlin: The deeper question is whether billing changes independently enough to justify a boundary.
- Bedivere: A new service adds deployment, monitoring, data consistency, and ownership cost.
- Percival: Unknown: current failure rate, release cadence, and whether billing blocks product deploys.

## Final Verdict

Defer the split. First isolate billing behind an internal module boundary, measure release friction, and revisit when ownership or scaling pressure is real.

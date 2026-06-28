# Code Review Demo

## Command

`/roundtable --triad code-review Review this cache invalidation patch.`

## Selected Agents

Lancelot, Gawain, Kay

## Compact Round Output

- Lancelot: The patch is shippable if tests cover stale reads and explicit invalidation.
- Gawain: Watch authorization drift if cached objects outlive permission changes.
- Kay: The patch claims correctness but has no proof for concurrent writes.

## Final Verdict

Modify before merge. Add permission-change invalidation, concurrent write tests, and a short comment naming the cache consistency guarantee.

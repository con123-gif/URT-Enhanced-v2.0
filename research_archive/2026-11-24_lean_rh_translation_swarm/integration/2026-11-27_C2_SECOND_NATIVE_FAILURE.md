# C2: actual second native replay and the next repair

27 November 2026. RH and the human reconstruction remain **OPEN**.
Compact source `72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.

The source-built Carrier cache was reused in a separate, clean worktree.
There was no second source build. The one-process input contained the
standard-pair helper, the exact original equal-rank statement, four exact
exchange/matching/Carrier consumers and seven original axiom probes.
The combined source blob was `c361030a3f5d35d0d5cdf297b518b12804cc4956`.

Actual compiler result: **exit 1, 1835.41 seconds**. All six candidates
reported `sorryAx` from failed elaboration and are rejected. The four
propagation type/direct-edge guards printed, but those guards do not accept
proofs containing the upstream error placeholders. All seven original
probes report only `propext`, `Classical.choice`, `Quot.sound`.

The first fixes resolved the missing character inference and unchanged-simp
errors. The remaining failures are now substantive proof-state identities:

1. Expanding the local standard column datum during the partner-law flip
   calculation leaves an unsolved finite-function identity.
2. The final `simp [*]` can use the specialized standard theta equality `K`
   to rewrite the source side of its own conversion. Its original general
   proof did not match that standard-data rewrite pattern.
3. The equal-rank proof still contains partially applied standard-row
   functions. The equation lemma used by `simp [stdRowDatum]` does not
   normalize those function arguments before the theta data expand.

The derived adapter now keeps the finite datum abstract inside the flip
calculation, consumes and clears `K` before the final conversion, and states
the two empty/full row function identities explicitly. The pinned peer and
original source files remain immutable. The new combined input blob is
`e9a9079ae44b8d700433abec41490d075b039c27`; **PREPARED, not checked**.
First replay only its helper and the two finite-function identities, so a
failed helper does not trigger another full downstream proof attempt.

Exact failed input, log and receipt are retained in
`2026-11-27_c2_second_native_receipt/`. No C2 frontier, signed-height
supplier, reciprocal-volume argument or RH root is retired by this result.

# B2 and C2: completed local dependency audits

27 November 2026. REPLAYED / AUDITED for the explicitly listed local
interfaces. The complete human RH reconstruction remains OPEN.

Original mathematics: Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

## What completed

| Local frontier | Original/replacement roots | Union declarations | Reference edges | Missing |
|---|---:|---:|---:|---:|
| Fused B2 count, pair bound and energy chain | 8 | 94,382 | 2,857,836 | 0 |
| C2 equal-rank, exchange, matching and two Carrier callers | 10 | 119,274 | 3,862,637 | 0 |

These counts include Mathlib and structural dependencies. The frontiers
overlap; adding their counts is not a count of distinct declarations or
a completion percentage.

Every projected root passed the independent `verify_graph_v2.mjs` check
(source blob 2e431301970196a6b786d004fb16a4320a25fe8e). This includes
type/value constants, projection carriers, literal dependencies, inductive
constructors, recursor rules, mutual blocks and the quotient package.
The independently reconstructed axiom closure agrees with Lean's own
`collectAxioms`. There are no missing bodies, unresolved collector nodes,
nonstandard axioms, `sorryAx`, or unsafe/partial reachable declarations.
Only `propext`, `Classical.choice`, and `Quot.sound` are reported.

All advertised transitive substitution guards passed. The fused B2 roots
consume the replacement count, skew and labelled-uniqueness suppliers;
their superseded original targets and unfused active suppliers are absent
on the replacement paths. C2's five replacement stages consume their
replacement predecessors, with the original targets absent from those
descendant paths. The standard-pair helper reaches every replacement C2
root. General exchange is absent from the new equal-rank root and remains
present at the four outer C2 roots, as required by their unchanged proofs.

## Compiler evidence and exporter boundary

B2's joint eleven-declaration replay was already accepted: five complete
original statement comparisons, direct supplier guards and standard axiom
reports; compiler exit 0 in 757.04 s. Its authenticated native graph
exporter completed in 192.76 s, and all eight independent root verifiers
and fifteen caller guards passed. The earlier collector failure and
36,306-record interpreted/native comparison remain preserved separately.

C2's repaired six-declaration replay completed with compiler exit 0 in
126.63 s. Five complete original statements and direct-edge guards, plus
seven original axiom probes, passed. Exact combined source blob:
`aba46120ca4118decd864f817b51bcca2bc31c19`. Checked object SHA256:
`9ee60a0ff16a5f1fd6756906e050081de2b0f7afba39334b0534e436b4f46df3`.
The third replay is saved in [the exact receipt folder](2026-11-27_c2_third_native_receipt/).
The first two failed native attempts remain unchanged.

The full interpreted C2 export completed in 254.5 s. All ten independent
root verifiers and thirteen transitive caller guards passed. The separate full native/interpreted comparison also PASSED:
all 119,274 records, headers, footers and the entire raw byte stream are
identical, SHA256 `531283d9520b938399b9b973d932506ac9cf18379e50592ec74afc051e55a11e`.
The native graph independently passed all ten root verifiers and all
thirteen caller guards as well. [Exact comparison and runtime receipts](2026-11-27_c2_native_equivalence_receipt/).
Five actual comparison controls passed, including rejection of a truncated
stream, duplicate node, data after the footer, and a changed record.
Compatibility is now checked on this complete local C2 frontier, rather
than inferred from the earlier core-only comparison.

## Evidence and limits

- [B2 graph manifests, per-root verifier logs and caller guards](2026-11-27_b2_fused_graph_receipt/).
- [C2 graph manifests, per-root verifier logs and caller guards](2026-11-27_c2_graph_receipt/).
- [Machine-readable joint audit and per-root dependency counts](2026-11-27_B2_C2_GRAPH_AUDIT_RESULTS.json).

The local declaration counts have not decreased: B2 replacements add
5–8 reachable declarations; the C2 equal-rank count is unchanged and its
outer replacements add 13–16. This establishes valid replacement paths,
not a global proof-size reduction or an established URT speed advantage.

The whole human B2 assembly, weighted packing primitives, common C2
normalizations, nonvanishing, reciprocal signed-height budgets and crude
row completion remain separate obligations. No full `Main`/A/B/C root
graph or whole-RH replay was completed by these checks. Native runtime
inspection of an already checked object is not a new proof compilation.

## RESUME HERE

The local B2 and C2 recursive audits and full C2 exporter comparison are
complete. Resume the unresolved mathematical supplier frontier in
LIVE_OBLIGATIONS rather than replaying these accepted local replacements.
For C2, reconcile the already-written unified determinant witness with
`New/Rows/LiftVolumeHeight.lean: heightLe_liftVolume_ratio`, preserving the
same Data, fit-twist family, integrality, testedness and signed budgets.
The graph audits do not supply those remaining estimates.

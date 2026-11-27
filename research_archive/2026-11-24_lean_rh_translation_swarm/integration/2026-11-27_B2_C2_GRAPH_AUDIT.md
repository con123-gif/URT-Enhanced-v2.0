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
| New restricted determinant route and Carrier transport | 4 | 119,299 | 3,865,789 | 0 |
| Preferred direct determinant line and Carrier transport | 4 | 119,266 | 3,862,429 | 0 |

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

The first full C2 export was a native runtime inspection (254.50 s), as
was the repeated export (271.52 s). Their byte identity establishes
repeatability. The earlier description of the first run as interpreted was
incorrect: both original receipts have native_graph_execution=true and
new_Lean_execution=false. Those original records remain preserved.

A genuine interpreted Lean command has now completed successfully in
177.98 s, with native_graph_execution=false and new_Lean_execution=true.
Its complete 119,274-record graph, headers, footer and raw byte stream are
identical to the accepted native graph, SHA256
`531283d9520b938399b9b973d932506ac9cf18379e50592ec74afc051e55a11e`.
The existing independent verifier certificates therefore apply to the
identical interpreted stream. This is graph-export compatibility, not a
new RH proof compilation or a controlled speed benchmark.
[Actual engine-aware comparison and correction](2026-11-27_c2_genuine_mode_equivalence/).

The comparison checker now requires successful execution receipts from
the two distinct engines. It rejects the actual two-native pair even
though those graph bytes match. The genuine core pair and genuine full
C2 pair both pass. The earlier five graph-structure controls remain
preserved separately. The saved-evidence checker also requires the engine
receipts and their exact hashes before accepting a cross-mode claim.

## Preferred direct determinant line

The newer direct-line kernel proof and all three exact caller transports passed. Its complete four-root graph passed all four unchanged independent Node verifiers and all 52 guards, with zero missing references and standard axioms only. The determinant closure falls from 119,078 to 118,952; the Carrier closure grows from 119,250 to 119,262. Thus the determinant saves 126 declarations relative to the previous restricted proof and 136 relative to the native original, while the Carrier retains its complement branch. The current/general root sets differ between audit rows: do not compare union totals as a global proof-size reduction.

The real_matching membership mask is 13: present at the old determinant and both Carrier roots, absent at the new determinant. All new polynomial/action/continuous-line suppliers are reached. Native Fischer polarisation and finite exchange remain. Native inspection took 219.84 s; this is not a fresh theorem compilation or speed benchmark. [Preferred mathematical derivation and all kernel receipts](2026-11-27_DIRECT_DETERMINANT_LINE.md); [complete graph certificates](2026-11-27_direct_determinant_graph_receipt/).

## Evidence and limits

- [B2 graph manifests, per-root verifier logs and caller guards](2026-11-27_b2_fused_graph_receipt/).
- [C2 graph manifests, per-root verifier logs and caller guards](2026-11-27_c2_graph_receipt/).
- [Machine-readable joint audit and per-root dependency counts](2026-11-27_B2_C2_GRAPH_AUDIT_RESULTS.json).

The earlier B2 replacements add 5–8 reachable declarations; the earlier C2 equal-rank count is unchanged and its outer replacements add 13–16. The newer complete determinant statement has ten fewer reachable declarations (119,088 to 119,078), while its transported Carrier statement adds 37 (119,213 to 119,250). This establishes one local unchanged-statement reduction, not a global proof-size reduction or an established URT speed advantage.

The new four-root audit passed all four independent verifiers and all 35 supplier guards. General exchange and the superseded original determinant suppliers are absent transitively from the new determinant path. The Carrier's separate nonzero-complement branch still consumes run79_explicit_matching and exchange_of_partners. Native inspection took 178.27 s; it is distinct from the two preceding kernel compilations (64.18 s and 90.66 s). [Exact new proof/compilation evidence](2026-11-27_determinant_class_sum_receipt/); [complete graph certificates](2026-11-27_determinant_carrier_graph_receipt/).

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


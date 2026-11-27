# Direct determinant line — kernel and full local graph PASS

27 November 2026. All new proof files below passed actual normal Lean 4.35.0 kernel execution, with propext, Classical.choice and Quot.sound only. Both complete original determinant and Carrier statements are unchanged. The four-root constructor-inclusive audit also passed: all four independent verifiers and all 52 supplier guards, with zero missing references. General real_matching is absent transitively from the new determinant path and retained in the Carrier complement. Reciprocal height, human assembly and RH remain OPEN.

For the definite square polynomial D=product_tau det(X_tau)^card(iota_tau), the exact native real Weil action gives the covariance
    M(P(u^T X)) = product_tau det(u_tau)^card(iota_tau) * M(P).
The retained native Fischer polarisation theorem then gives
    Fischer(P,D) M(D) = M(P) Fischer(D,D).
D has real coefficients and is nonzero, so Fischer(D,D)>0. Consequently every polynomial value is a fixed scalar times M(D). Polynomial density and the closed one-dimensional scalar range extend this simultaneously to every invariant continuous Fock functional:
    exists kappa(v), forall ell invariant, ell(v)=kappa(v) ell(v_D).
The scalar is chosen before the entire functional/modulus/character family. No new coefficient is chosen for each character.

The empty stacked determinant is exactly D, and the matched empty polynomial is exactly 1. This supplies the complete canonical real-matching interface using the common coefficient above. Ordinary checked proof transport substitutes that interface into the accepted empty matching, then its complete determinant class sum, then the unchanged Carrier formula. It retains the actual finite exchange, both finite datum identities, original class integral, tame character conversion and rank-zero Haar normalization. The Carrier's distinct nonzero-complement matching branch is retained.

| Accepted local file | Named declarations | Seconds | Source blob |
|---|---:|---:|---|
| C2_DETERMINANT_FIXED_LINE.lean | 1 | 125.03 | 2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261 |
| C2_DETERMINANT_WEIL_ACTION.lean | 2 | 109.25 | 3f9228248dd81112be16a0f6e1b79170715683f0 |
| C2_DETERMINANT_CONTINUOUS_LINE.lean | 1 | 65.09 | e70b65e517b843ab4f1ce6e438879e80463db998 |
| C2_DIRECT_REAL_MATCHING.lean | 3 | 71.98 | aaec88856a302d40e1e501395da463f7a0f28d50 |
| C2_DIRECT_DETERMINANT_TRANSPORT.lean | 3 | 108.46 | 1c1c1a5370e06e831e900cae35cdc68cb0eebd37 |

[Polynomial receipts and two rejected attempts](2026-11-27_fixed_line_receipt/); [exact Weil action receipts](2026-11-27_definite_weil_receipt/); [continuous coefficient and rejected attempts](2026-11-27_continuous_line_receipt/); [complete canonical interface and rejected model adapter](2026-11-27_direct_real_receipt/); [all three exact caller transports](2026-11-27_direct_transport_receipt/). Transport module SHA256: 7fe2d3bce78da632daf4c67a5f457b0c75866722ebd4af64321b008ce301f418.

This formal implementation continues the human fixed-line idea already archived in character-box RUN66. Its native proof retains Fischer polarisation; it does not claim to formalize RUN66's alternative compact-average/polar-decomposition derivation or remove the Fischer supplier itself. The critical integral-measure human construction is already in RUN65. Do not duplicate it.

The [complete four-root graph](2026-11-27_direct_determinant_graph_receipt/) has 119,266 union declarations and 3,862,429 edges. The determinant closure falls from 119,078 to 118,952 (126 fewer); the Carrier closure grows from 119,250 to 119,262 (12 more). The current determinant has 136 fewer declarations than the earlier audited native original. These are local unchanged-statement counts, not a global RH reduction. The native export took 219.84 s. All 52 guards and reconstructed axiom closures passed.

Next: replay [C2_VALUE_FAMILY_TRANSPORT.lean](C2_VALUE_FAMILY_TRANSPORT.lean) against the original ValueFamilies, TwistForRows and FitTwistsExist modules. This prepared source preserves their complete types and changes only each intended supplier. It retains the original C1 row, period-ring, denominator and finite-prime budget inputs; it is distinct from RUN84's budget split. It has not been compiled. Reuse the queued C1 original build and retained cache, rather than repeat its source closure.

The graph's optional archive-before-audit storage path was checked on the existing Nat.le_refl stream: unchanged independent Node verifier passed for both plain and archived/random-access inputs, and all four output files were byte-identical. This is byte-preserving transport, not a new Lean proof. [Exact control](2026-11-27_compressed_graph_control/).

The independent shared-source run 46050109450 is still replaying the earlier accepted determinant/Carrier chain from source aceceb93b79727aac30ebcb24388c58aebc5adbf. These newer direct-line files are outside that snapshot and have only the explicit local kernel executions above so far. The queued C1 build now retains its original cache, including the overlapping ValueFamilies closure if built, for coordinated continuation.

Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

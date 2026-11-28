# RH — live proof spine (compact source)

28 November 2026. **INCOMPLETE.** This is the sole concise editorial proof path, not an independently established RH proof or a completed ten-page paper. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. The old source pin and full research evidence remain separate.

The ten-page target includes essential derivations and references, not just a statement of A/B/C as assumptions. This spine is a conditional assembly to be filled in with the shortest audited proofs of its actual suppliers. For the exact live gaps see [LIVE_OBLIGATIONS.md](LIVE_OBLIGATIONS.md). For full derivations and prior attempts see [HUMAN_PROOF_COMPACT.md](HUMAN_PROOF_COMPACT.md).

## 1. Governing inequality

For the SAME native admissible data D, put d=dim(rows)>0, v=dim(columns)>0, B=fa(log b)^3, L=(log b)B, H=mk dirCost, R=remainder, h=H-mR+L. The goal is mR <= (log b)^2 B. Fix parameters and scales exactly as in the source. Do not independently optimize choices in A, B or C.

## 2. A — short integral forms

For the native maps B_s=qP_s, a single rational normalization q=prod_l l^floor(allowedLoss(l)-1_nonsplit(l) gain(l)) makes the local and archimedean constraints simultaneous. Height cancellation gives heightPerRow<=H-mR+B. The required A output is a spanning set S of integral ramified columns, squared norms of Theta_1 B_s(phi) <= exp(h) at every conjugate, and IndexLe budget delta <= |t|vB for each finite translate selection t and its independent rows. Actual lift norms, marked local divisibility, short-column span and scale guards must be proved or cited precisely: A1–A3 in ledger.

## 3. B — enough of the same forms

Native IsSpread with eta=b^-2 gives a translate increasing a span of rank deficit r by at least v(r/(2d)-eta). While r>4eta d, the potential 5d log(1+r/(eta d)) decreases by at least v. Thus choose t with |t|v<=5d log(1+b²) and span dimension n>=(1-4/b²)d. Extract ONE independent basis y from the images B_s(S). Then delta<=5d log(1+b²)B, and the all-conjugate squared Gram determinant is <=exp(V) with V=nh by Hadamard.

The spread supplier still requires B1–B4. The [link-to-pair caller audit](integration/2026-11-27_INTERACTIVE_LINK_PAIR_CALLER_AUDIT.md) records the native suppliers. The joint eleven-declaration labelled/skew count-to-energy module has passed whole-file kernel execution, five complete original-statement comparisons, standard axiom checks and its eight-root constructor-inclusive dependency audit. [Accepted evidence and remaining scope](integration/2026-11-27_B2_C2_GRAPH_AUDIT.md). The weighted packing primitives and complete human assembly remain open. The B3 direct-chart floor/self/position chain now has an accepted six-root native receipt (run 46082365501, [actual receipt](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-compact-b3-direct-term-repair-20261127/outputs/b3/run86_receipt.json), blob e8e0f2b74b30ae902042f24852d1c673402ed239): 42,657 union declarations, 952,599 edges, zero missing, 13 guards; original gauge and Parseval dependencies retained as specified. The two exact shell callers are [prepared](specialists/landau_criterion/COMPACT_RUN90_SHELL_CALLER_TRANSPORT.lean), not replayed. Both B2 energy paths now feed the common A/B/C star in a [single integration candidate](integration/2026-11-28_BOTH_ENERGY_COMMON_ABC_STAR.lean), also not replayed. No B3/B4 root closure.

## 4. C — reciprocal height

For the same independent y, same D and one actual fit-twist family theta, use the native two signed HeightLe bounds on the SAME nonzero chain-volume ratio z(theta)/z(1):
- HeightLe(V+2delta+db, z(theta)/z(1)).
- HeightLe(2d(2L-H), z(1)^2/z(theta)^2).

Write r_i=z(theta_i)/z(1) != 0, a=V+2delta+db and c=d(2L-H). Square the FIRST height and multiply by the second: HeightLe(2a+2c, r²·r⁻²)=HeightLe(2a+2c,1). At the witness level, if the two original nonzero global witnesses are U,W with archimedean budgets α,β and local budgets e_l,f_l, use U²W, 2α+β, 2e_l+f_l, and a common sufficiently large cutoff. All embeddings and signs are retained; neither a nor c is assumed nonnegative. The product formula gives 0<=2(a+c), so V+2delta>=d(H-2L-b)>=d(H-3L) since b<=L and d>=0. No square root or separate local witness choices are necessary. This is the actual native LongForms.lean `Data.integral_forms_long` argument (blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05; Heights.lean blob a18a99e1f76a6e963113cae8f906ddc99814f518). The shorter [squared-witness replacement](specialists/character_boxes/RUN90_COMPACT_C2_SQUARED_WITNESS.lean) is PREPARED, not replayed; the older root-based generic proof and its verified graph remain valid archive evidence. C1–C3 are still required. The preferred direct determinant-line replacement and its complete determinant/Carrier statements have passed local kernel and full transitive audits. General real matching and exchange are absent from the determinant path; the Carrier's separate complement retains them. [Current proof and exact evidence](integration/2026-11-27_DIRECT_DETERMINANT_LINE.md). The four actual integral-measure, signed-family, common-twist and fit-family transports have now passed the shared C2 replay and its 12-root consumer graph (run 46055305146, [pipeline receipt](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-compact-c1-fit-budget-replay-20261127/outputs/c2_value_family/value_family_pipeline_results.json), blob 413058eacfda8683f5fb28c68148fd45d1bf1770). The separate C1 split in that same run failed with sorryAx in two fit-family candidates; do not import those candidates. The C2 result does not discharge C1 or the actual reciprocal-height callers. The generic single-witness junction has passed the normal kernel and its complete four-root supplier audit; [exact scope](integration/2026-11-27_COMMON_WITNESS_KERNEL_JUNCTION.md). The actual comparison-to-height and lower-bound callers remain prepared, not replayed.

## 5. The common term disappears

Use |H|+m|R|<=b²x^99 and L>=0, so -h<=b²x^99. The missing rank term costs at most (d-n)(-h)<=4dx^99. Hence

    d(H-3L) <= nh+2delta
              <= d[h+4x^99+10 log(1+b²)B].

Substitute h and cancel H; the native HasLogBound gives

    mR <= 4L+4x^99+10 log(1+b²)B <= fa(log b)^5.

This is the actual central star inequality conditional on the suppliers, not a new unconditional theorem.

## 6. From star to RH

Use the compact native primeError R_M(x) with lambda_M(n)=Lambda(n)(1-chi_d(n)) on n=1 mod M and zero otherwise:

    R_M(x)=sum_{n<=x} lambda_M(n)(1/n-1/x)
           - log(x)/phi(M) - Re logDerivMean(d,M,1).
    R=a[#thick(R_N0(x)-R_N0(x1))+#tops R_1(x1)].

Fix P and epsilon before x grows. DataExist and the second-scale bound lead to R_N0(x)<=x^(8epsilon-1/2) eventually. The preferred candidate human route is the classical fixed-modulus PNT second-scale elimination and the polar Mellin/Landau criterion, with the quadratic-twist selection fixed before x grows; see archive §§6a–c for exact proofs and premises. At modulus q=1 use N0=18480, class 9239, and a twist avoiding the hypothetical zero; the residue sign and the functional equation then give the critical-line conclusion. D1 admissible-data construction has independent human audit (39478bf0); E1 analytic implication has a source-matched editorial audit ([signed-residue caller](specialists/proof_editor/2026-11-27_D1_E1_SIGNED_RESIDUE_CALLER_AUDIT.lean)). Both retain their native replay frontier, and E1 is conditional on star. Do not substitute the old G(x) window formula or assume RH in any external theorem.

## Editorial rule

Only one preferred proof per actual interface, with source, premises, caller and status. Historical variants, duplicate algebra, failed ideas, benchmark output, and exhaustive dependency evidence remain in the archive, not in this spine. A local reduction, tested scalar identity, or prepared Lean file is not a closed root obligation. This document is deliberately a short skeleton, not the ten-page finished paper.

## RESUME HERE — editor, 28 November

Compile the existing `RUN90_COMPACT_C2_SQUARED_WITNESS.lean` as C2SquaredWitness in the authenticated retained compact workspace (artifact 15234434421), reusing accepted C2ValueFamilyTransport and the checked archimedean product-formula module; compare exact original C statement and standard axioms and audit old/new constructor-inclusive graphs before selecting it at the common star. Do not rebuild the already accepted C2 family or B3 local modules. The source-matched editorial correction above is independent of native replay; no new native engine execution or global dependency deletion is claimed. Earlier spine/ledger evidence is preserved in Git history; ledger should distinguish accepted C2 family/B3 local scopes from pending shell, signed-height and common star callers. Root obligations remain open. HANDOFF TO integration / character boxes / kernel / audit.

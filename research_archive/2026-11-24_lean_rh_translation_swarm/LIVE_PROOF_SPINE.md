# RH — live proof spine (compact source)

27 November 2026. **INCOMPLETE.** This is the sole concise editorial proof path, not an independently established RH proof or a completed ten-page paper. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. The old source pin and full research evidence remain separate.

The ten-page target includes essential derivations and references, not just a statement of A/B/C as assumptions. This spine is a conditional assembly to be filled in with the shortest audited proofs of its actual suppliers. For the exact live gaps see [LIVE_OBLIGATIONS.md](LIVE_OBLIGATIONS.md). For full derivations and prior attempts see [HUMAN_PROOF_COMPACT.md](HUMAN_PROOF_COMPACT.md).

## 1. Governing inequality

For the SAME native admissible data D, put d=dim(rows)>0, v=dim(columns)>0, B=fa(log b)^3, L=(log b)B, H=mk dirCost, R=remainder, h=H-mR+L. The goal is mR <= (log b)^2 B. Fix parameters and scales exactly as in the source. Do not independently optimize choices in A, B or C.

## 2. A — short integral forms

For the native maps B_s=qP_s, a single rational normalization q=prod_l l^floor(allowedLoss(l)-1_nonsplit(l) gain(l)) makes the local and archimedean constraints simultaneous. Height cancellation gives heightPerRow<=H-mR+B. The required A output is a spanning set S of integral ramified columns, squared norms of Theta_1 B_s(phi) <= exp(h) at every conjugate, and IndexLe budget delta <= |t|vB for each finite translate selection t and its independent rows. Actual lift norms, marked local divisibility, short-column span and scale guards must be proved or cited precisely: A1–A3 in ledger.

## 3. B — enough of the same forms

Native IsSpread with eta=b^-2 gives a translate increasing a span of rank deficit r by at least v(r/(2d)-eta). While r>4eta d, the potential 5d log(1+r/(eta d)) decreases by at least v. Thus choose t with |t|v<=5d log(1+b²) and span dimension n>=(1-4/b²)d. Extract ONE independent basis y from the images B_s(S). Then delta<=5d log(1+b²)B, and the all-conjugate squared Gram determinant is <=exp(V) with V=nh by Hadamard.

The spread supplier is not free: retain B1–B4. Candidate short route: absolute amplitude and cutoff -> exact character cancellation -> shared flags -> Gram normal form -> one lattice index -> link estimates and weighted packing -> finite Fourier/sieve and moments -> spread. The [link-to-pair caller audit](integration/2026-11-27_INTERACTIVE_LINK_PAIR_CALLER_AUDIT.md) connects the existing lift, marked common-link and pair derivations under their named primitive inputs; eight supporting certificates have since passed native replay, the corrected seven-declaration file has now passed whole-file Lean execution, exact original-type comparisons and direct dependency guards for the pair theorem and all three energy consumers, using only the standard axioms. [Exact receipt](integration/2026-11-27_b2_caller_receipt/README.md). A fresh shared source build independently confirmed the seven declarations, and the repaired skew/count module has also passed separately. [Shared receipts](integration/2026-11-27_b2_shared_receipt/README.md). The recursive graph rejected an older collector assumption about projection carriers; its strict Lean-4.35 adapter is prepared. The joint eleven-declaration labelled/skew count-to-energy module has now PASSED actual native execution, five complete original statement comparisons, all direct guards and standard axiom reports. [Exact joint receipt](integration/2026-11-27_B2_FUSED_NATIVE_PASS.md). Its eight-root constructor-inclusive graph, the actual weighted packing primitives and the complete human assembly remain open. Do not claim the entire chain established until its ledger is audited.

## 4. C — reciprocal height

For the same independent y, same D and one actual fit-twist family theta, use the native two signed HeightLe bounds on the SAME nonzero chain-volume ratio z(theta)/z(1):
- HeightLe(V+2delta+db, z(theta)/z(1)).
- HeightLe(2d(2L-H), z(1)^2/z(theta)^2).

Square the first ratio and multiply by the second. The ratio cancels identically to 1. The product formula gives V+2delta>=d(H-2L-b)>=d(H-3L). These are signed height budgets, not ordinary nonnegative heights; the auxiliary algebraic witnesses and all embeddings must be preserved. C1–C3 are still required.

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

# 27 November — single-translate, restricted-volume breakthrough candidate

Status: NEW CONDITIONAL ROUTE; exact finite-dimensional rank and endgame derivations from existing named inputs, restricted arithmetic repayment NOT established, no native replay or proof of RH. Keep the current proven-source reconstruction and all 15 lanes unchanged. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; current spine and ledger read; prior COMPACT_CENTERED_FILLING, COMPACT_UNIFIED_DETERMINANT_WITNESS and RUN50 StarOneSidedHeight checked. This is not a further greedy-constant optimization.

## 1. Remove the sharp main second moment from the rank requirement, conditionally on a new C

Set v=dim(Column)>0, d=dim(rows), B=budget, L=log b B, H=mainHeight, R=remainder. In native Fits.exists_translate_finrank_comap_le (New/Filling/Moments.lean), normalize P=Q/sqrt(c_native unipCovolume), Rgood=central orthogonal good projection. Reuse the first TWO explicit estimates in integration/2026-11-26_COMPACT_CENTERED_FILLING.md, not its third sharp main second moment:
    sum_i ||(P*P-I)e_i|| <= b^-4 v,
    tr((I-Rgood)PP*) <= 4b^-4 v.
The first follows from the Bessel identity block and complement bound; the second from re_trace_besselS_le, sum_norm_amplitudeSum_le and the two commuting central bad idempotents. They still require their own genuine geometric/energy suppliers.

Let K=ker(Rgood P), Pi_K its orthogonal projection. For E0=P*P-I, |tr(Pi_K E0)|<=sum_i||E0 e_i||, by expanding in the same column basis. Since P(K) lies in ker Rgood,
    dim K <= tr(Pi_K P*P)+b^-4 v
          = ||(I-Rgood)P Pi_K||_HS^2+b^-4 v
          <= ||(I-Rgood)P||_HS^2+b^-4 v
          <= 5b^-4 v.
This proves rank(Rgood P)>= (1-5b^-4)v without using sum_le_of_positive_type, energy_fixingSet_le, global sharp sieve, hD, d>0 or IsSpread. It is just the F=0 kernel estimate BEFORE any full moment/rank averaging. Because Rgood is central, multiplication by any rho(s) preserves this rank.

The actual E=ramifyingOp univ has nullity <= f v/(N-1), from the rank-only product in editor c1dc4f8b (or the original ChainValuation source). Composition with E loses at most nullity E. Exact source coordinate/range identification at FillingTheorem, scaledInclusion, nonzero seesaw scalar and q preserve rank. Thus the SAME map B_1 of Data.short_forms has rank n >= (1-5b^-4-f/(N-1))v >= v/2 >0 (native b>=1000,f<=b,N-1>=b^9). This also gives positive row dimension independently of the main moment, without using it circularly. A spanning short set S of ramified columns exists by A; choose independent y from B_1(S) spanning its image. The SAME y has IndexLe allowance delta<=vB (t={1}) and V=n(H-mR+L) by A and Hadamard. No few-translates lemma, near-full row dimension, or sharp main moment has been used.

## 2. Exactly what new C would suffice

For this actual span U=span(y), define z_U(theta)=det Gram(Theta_theta restricted to U) in a fixed basis; nonzero by injectivity. OneDeterminant.one_determinant applies directly with W=U and k=0, using the existing IndexLe recombination at BOTH conjugate embeddings and the same basis. No crude-row scalar, extra rows, or auxiliary archimedean height. Thus
    HeightLe(V+2delta, z_U(theta)/z_U(1)).
If the NEW rank-proportional reciprocal theorem
    HeightLe(2n(2L-H), z_U(1)^2/z_U(theta)^2)
can be established for ONE common fit-twist family, product formula gives
    V+2delta >= n(H-2L),
    mR <= 3L+2delta/n <= 3L+4B <= (log b)^2 B.
The last inequality holds for log b>=log 1000>4 (t^2>=3t+4 for t>=4). This is the original star_inequality with the same prime-error and admissible-data logic. The rank-proportional reciprocal theorem is the actual missing step; no use of full C or supposition of RH is permitted. It could remove the sharp main moment/greedy near-full-span AND crude-row completion/grid branch at the main caller if its exact proof avoids those branches. Other uses of those lemmas remain.

## 3. Concrete local bridge toward the restricted reciprocal bound

Read native New/Rows/LiftVolumeHeight.lean, ComparisonForms.lean, RowVolume.lean, New/Trace/GoodFormTransfer.lean, New/Selmer/FitTwists.lean, FitTwistsExist.lean and DenominatorBound.lean. In a single actual lift, u_v:W_j->V_v and gl_v satisfy u_v^* gl_v=gamma_v A_j with A_j surjective and common. For ANY fixed E_j<=W_j, write U_v=u_v|E_j, A_E=pr_E A_j, L_v=im U_v. The SAME relation restricts:
    U_v^* gl_v=gamma_v A_E,
and A_E is onto E_j. Consequently by the actual det_compressedGramOp,
    det(U_v^*U_v) det(k pr_{L_v} gl_v gl_v^*|L_v)
       = k^n |gamma_v|^(2n) det(A_E A_E^*).
The right constant is independent of the twist except gamma_v. The compressed Gram determinant is nonzero by surjectivity; the existing Hecke ratio heights can be raised to n instead of d. This local identity holds for an arbitrary E_j, but its arithmetic bound does NOT follow for arbitrary E_j.

Sufficient additional conditions at each j:
(a) E_j is an orthogonal sum of actual matched eigensystem/label subspaces that are covered by the row/Selmer witness (or another explicitly verified common spectral cut).
(b) E_j reduces A_j A_j^* and each u_v^*u_v, or prove the weaker exact inclusion pr_{im u_v} gl_v gl_v^*(L_v) <= L_v. Then for z=u_v e, the cross pair with u_v e' for e' perpendicular E_j equals |gamma_v|^2 <e',A_j A_j^*e>=0. The metric invariance gives u_v(E_j^perp)=im u_v intersect L_v^perp. If K_w=im e0 intersect ker H_w(testValue) contains the full good-lift image, K_w intersect L_v^perp splits orthogonally into full false-lift cut plus im u_v intersect L_v^perp. Existing full testedness plus cross pairing proves actual IsTested with the RESTRICTED L_v^perp. This is exactly the guard needed for norm_det_compressedGramOp_padic_le and generic AuxPair.normSqAt_starProjection_le; the latter explicitly accepts a subspace of K_w, not only the full lift.
(c) At exists_isFitFamily keep the actual simultaneous row witness H from exists_mFoldTwist_selmerLengthLe. Theorem denominatorLe_rowBudget accepts an arbitrary subspace Z spanned by eligible lifted eigen/label forms. Hence IF L_v is spanned by the required restricted eigen/label forms, the SAME construction gives DenominatorLe at the same budget for L_v, not by assuming full determinant bound controls every minor. The actual restricted source of the lifts and row witness must be checked.
(d) The full RowVolume factorization uses common Hecke operators and equality of their determinants over ALL good forms. For restricted U, one must prove matching restrictions on the SAME E_j (including multiplicities and all twists), or another valid partial-volume factorization. Full trace/determinant equality alone does not imply restriction equality.

These exact guards identify the possible breakthrough as a common arithmetic/spectral subspace, rather than recasting the entire proof. The hard part is connecting the actual short-image space span(B_1 S) to such a subspace without destroying its all-conjugate size and all-prime index. It is not known that this span is Hecke invariant or reduces A_j A_j^*. Projecting arbitrary short rows onto eigenspaces can incur denominators and invalidate A. Full determinant control does not bound individual eigenvalues or minors: diag(M,M^-1) has determinant 1 for arbitrary M and its first-coordinate compression is M. For example G1=diag(M,M^-1), G2=diag(M^-1,M) also have full determinant 1, but their compression ratio on e1 is M^2. A restricted repayment cannot be inferred from native C by replacing d with n.

## 4. Next research action

Investigate only this candidate as a bounded alternative, without replacing the current route or diverting the ordinary workers. Examine whether the actual B_1 map intertwines an existing Hecke action and whether comparison A_j A_j^* reduces the corresponding spectral cut; inspect exact comparisonForms and native common Hecke transfer. If not, try a different one-translate construction or prove a weighted partial-volume bound that pays for the mismatch, then compare its cost to B. Do not declare a breakthrough until the restricted volume identity and testedness/denominator/size guards are verified for the same witness. Keep the current proof and verification queue as fallback; no schedule change, no native replay, no deletion of dependency edges.

# Compact proof B: remove scalar second-moment component before rank estimate
26 November 2026. Source-matched human derivation of a stronger filling estimate and candidate constant 2 instead of 5 at Data.enough_forms. Native replay outstanding. External formal proof is distinct from incomplete human reconstruction. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Continue HUMAN_PROOF_COMPACT.md blob b46a4489e16416d203d326a5394a806cef055c37; preserve all original proofs and fallback. No new RH criterion.

## Actual native second-moment inputs

Use the context of Fits.exists_translate_finrank_comap_le in grh-compact/src/New/Filling/Moments.lean: finite group G=GRes, unitary representation rho on V, normalized P=tQ (t chosen with t² c_native unipCovolume=1), column dimension c=S.columnDim, two central orthogonal good projections g_i and their product R, W=range R, d=dim W>0. The final native Data filling lemma supplies positivity of d; for this direct replacement retain that original positivity proof, not circularly infer it using the new centered estimate. Let eta=b^-2, delta=b^-4=eta², b>=1000 (Setup). Define A=PP*, T=mean_s rho(s) A rho(s)*. T is positive semidefinite and commutes with every rho(s). It is an operator on the original V, not a surrogate matrix.

The exact three numerical inputs already used in the original Fits proof are:
1. Sum_i ||(P*P-I)e_i|| <= delta c. The native Bessel subgroup diagonal is exactly the identity, and sum_norm_amplitudeSum_le at zero central projection bounds the remaining row norms. For Hermitian E=P*P-I row norms and column norms agree. This is the epsilon argument in finrank_sub_le_re_inner_dyadSum.
2. tr((I-R)A) <= 4 delta c. Each bad central projection has trace contribution <=2 delta c by re_trace_besselS_le plus sum_norm_amplitudeSum_le, combined as hb' in the native proof. There are two factors (Fin 2). They commute, so I-R <= sum_i (I-R_i). This loses no extra factor. This follows directly from simultaneous 0/1 eigenvalues. The bound is for the same P normalized in (1).
3. ||T||_HS² = mean_s ||P* rho(s) P||_HS² <= (1+9delta)c²/d. The equality follows by expanding tr(T²), reducing the double group sum by s^-1 t, and cyclically permuting the trace. From hu, the moment equals (1/|G|) sum_s energy(amplitudeSum .univ){s} divided by unipCovolume², where energy includes that normalization by its definition. More precisely use hu directly to identify the normalized matrix entries as amplitudeSum/unipCovolume, as the original proof does in ?H; do not divide twice if energy is already normalized. The native sum_le_of_positive_type at A=empty gives sum of squared normalized entries <=(1+9delta) mainEnergy. Setup.mainEnergy=c²/(besselDegree*mass). Divide by |G| and use d<=|G| besselDegree mass (hD). This is the same second moment already consumed in the original proof, not a new bound on orbital integrals.

The trace estimates 1 and 2 and moment estimate 3 are explicit source-derived inputs; their deeper Bessel and sieve proofs are NOT eliminated. Native replay should extract them as named helper lemmas at the same source contexts.

## Exact centered variance argument

Let T_W=RTR restricted to W; since R commutes with rho, tr(T_W)=tr(RA)=tau. By (1), |tr A-c|<=delta c, and by (2), (1-5delta)c<=tau<=(1+delta)c. Orthogonal compression cannot increase HS norm, so from (3)
  ||T_W-(tau/d)I_W||_HS² = ||T_W||_HS²-tau²/d
      <= c²/d [(1+9delta)-(1-5delta)^2]
      <= 19delta c²/d.
All signs are justified by b>=1000. This removes the common scalar part exactly, before estimating the error. For any F subset W, let Pi_F be its orthogonal projection, phi=dim F/d, and K_F=Pi_F-phi I_W. Then tr K_F=0 and ||K_F||_HS²=d phi(1-phi). Hilbert-Schmidt Cauchy-Schwarz gives
  tr(Pi_F T_W) <= phi tau + c sqrt(19delta phi(1-phi)).
This uses exact trace orthogonality, not an assumed random distribution.

For each s let U_s={u: R rho(s) P u belongs to F}. If E=P*P-I, then |tr(Pi_U E)|<=sum_i ||E e_i||<=delta c, by expanding in the fixed column orthonormal basis. Hence dim U_s<=tr(Pi_U P*P)+delta c. On U_s, rho(s)P maps into F+W^perp. Orthogonality and positivity of squared norms imply
  dim U_s <= delta c + ||Pi_F rho(s)P||_HS² + ||(I-R)rho(s)P||_HS².
The last term is tr((I-R)A), independent of s. Average over s and choose a translate no larger than its mean. Consequently the original Fits conclusion can be strengthened to
  dim U_s/c <= phi + (5+phi)delta + sqrt(19delta phi(1-phi))
             <= phi + 6delta + sqrt(19delta(1-phi)).
This is a nonlinear deficit-dependent estimate. It is not uniformly smaller than the original bound at every phi, in particular very near phi=1, but is stronger in the range needed for the greedy step below. Scalar t!=0 does not affect inverse images of F, so it applies to the original Q. The proof uses only orthogonal projections and trace identities after the actual moments, avoiding the native uncentered dyadSum estimate at this consumer. No claim of a new moment theorem.

## Actual ramifying operator and greedy consequence

In Data.ramifiedColumns_fill_rows, the underlying domain is the FULL Column space of dimension c; the ramifyingOp univ maps onto ramifiedColumns and its preimage dimension loss is at most #piPlaces*c/(N-1), by actual New/Columns/ChainValuation.ramifyingOp_finrank_comap_and_short. Keep these range identities exactly as in original B. The original FillingTheorem proof invokes N-1>=b^9, card_piPlaces and the same HasLogBound arithmetic to absorb this loss into b^-2. In particular using the native size estimates #piPlaces=f<=b (or simply the weaker #piPlaces/(N-1)<=eta, which follows from those estimates), the relative ramifying loss is <=eta. This is a source-matched numerical guard, to be replayed explicitly at compact Data; no assumption that ramifyingOp is injective. The ambient c and d agree with the original filling_fits coordinate equivalences.

Write u=1-phi for the fraction of row dimensions still missing. Rank-nullity on the composite full-column map gives a translate adding at least
  c [u - 6eta² - sqrt(19) eta sqrt(u) - eta]
new dimensions. For u>4eta and eta<=10^-6,
  6eta²/u <= (3/2)eta,
  sqrt(19)eta/sqrt(u) <= (sqrt(19)/2)sqrt(eta),
  eta/u <= 1/4.
The sum is <1/3 (e.g. sqrt19<5), so the gain is >= (2/3)c u>0. The gain bound never demands more than the number of missing dimensions: it is derived from the actual map and rank-nullity.

Now choose a new translate whenever missing dimension r=d u>4eta d. Define the potential Phi(r)=2d log(1+r/(eta d)), replacing the coefficient 5 in the previous manuscript's direct greedy proof. The drop when adding dimension g>= (2/3)c r/d is
  Phi(r)-Phi(r-g) >= 2d g/(r+eta d) >= (4/3)c r/(r+eta d) > (16/15)c.
This follows from -log(1-z)>=z, with z=g/(r+eta d)<1. A selected translate could not already have been chosen because its gain is positive. Each step reduces the nonnegative integer r, so the process terminates. If r starts below threshold the empty family suffices. Telescoping the nonnegative potential gives
  |t| dim(Column) <= 2d log(1+b²),
  dim(sum_s range(projectedPoincare s)) >= (1-4/b²)d.
This is the stronger candidate for the actual theorem B on the same admissible data, not just a smaller constant for an unrelated set-cover model. All existing A hypotheses are compatible because B_s=q projectedPoincare s with q nonzero; the spanning-set selection can use precisely the same t.

At A+B/C recombination the index bound therefore becomes delta_index<=2 d log(1+b²) budget instead of 5 d log(1+b²) budget. In native star_inequality the resulting index term is 4 log(1+b²) budget instead of 10 log(1+b²) budget. The unchanged other errors and size comparison still give the original star bound (stronger bound implies old bound). This is a 60 percent reduction in the particular index allowance, not the whole proof or runtime. The dominant final exponent and deep orbital integral/geometry/number-theory suppliers remain. No unconditional new RH proof, no claim of removing the second moment itself.

## Sources and handoff
Retrieved compact pin:
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444: actual Fits.exists_translate_finrank_comap_le, re_trace_besselS_le, sum_norm_amplitudeSum_le, sum_le_of_positive_type, normalization hu and hb'.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727: b>=1000, columnDim, besselDegree, mainEnergy.
- New/Filling/RowDimension.lean 5f8292b806de0cc8a11c560b573efb6ec7fe7316: actual rowDim upper bound hD.
- New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76: native filling, coordinates and ramification loss, original positivity.
- New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7: actual preimage-dimension loss and span_short_ramifiedColumns.
- New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e: f scale. New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834; New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0. Preserve native HasLogBound proof of f<=b and card_piPlaces; no fresh compilation.
- New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6: original dyadSum and greedy coefficient 5; read preceding turn.
- New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a; New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05; New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 (preceding compact manuscript).
No native Lean replay, no synthetic numerical simulation, no measured acceleration. Human argument conditional on source moments/normalization and the native size/range guards; do not mark B's deep suppliers as closed.

RESUME: kernel/geometry/audit extract three exact moment inequalities in same context and verify centered trace lemma and native ramifying composition; then replay actual Data.enough_forms replacement and A+B scalar caller. Editor can use the centered argument as shorter conceptual proof of B's assembly, retaining original 5 fallback. Next substantive target: the actual energy_fixingSet_le and positive-type induction, not further optimizing greedy constants. 

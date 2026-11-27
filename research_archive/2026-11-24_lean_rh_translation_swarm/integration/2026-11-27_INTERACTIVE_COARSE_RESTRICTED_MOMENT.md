# 27 November — split the sharp global moment from coarse restricted energy

Continuation of 4f5a2082 (relaxed filling budget). NEW conditional source-matched reduction at actual B3 consumer; exact human inequalities, no fresh Lean replay, no claimed full RH proof or new closed primitive. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Preserve existing main proof and schedules.

## 1. An attempted shortcut that fails at the native denominator

Read New/Exchange/CrudeRows.lean e84f4b0e67ed7dbfd727f8ec2dbf05a8d1e5440c, GridFirstColumns.lean 3d2d63c9376d4b34605486faadd48ef399c39afa, GridMove.lean c1cb8b1e2cf780d03ae869204320c3f25573cc02, GridModuli.lean, New/Rows/MemberKernels.lean, New/Curve/ConjugatesOfJets.lean, New/Exchange/CrudeModularData.lean. The actual grid modulus is M^{b1} Q, not M Q. At a prime ell coprime to the twist, put N0=gProd^{b1}, r0=2 n_m, W=b1 r^4 (native bounds). The explicit common denominator used by the actual mem_raises_of_dvd argument may be chosen as
    nu=N0^(2 f r0^2) (N0 P.d)^W,
    N=(prod_tau (N0 N1)^(m |L_tau|)) nu^(2m).
Indeed normQ*N0 is in the grid modulus ideal; the datum is an indicator of a residue matrix, so the standardData scale costs N0^(2fnn'); mem_raises_of_dvd costs another (N0 P.d)^{boxes}; the two chains each have m edges; the native branching multiplier is the first product. Both stages retain exact integrality, including the scalar clearing branch in crude_rows. Thus log nu includes W*b1*log gProd, and the bound on W is linear in b1. The quadratic b dependence is not just caused by rounding a Gaussian size bound. Cannot assert the crude row penalty is O(b poly(x)) without a new local jet denominator result at the deep grid level. No such result found. Keep the prior b^2 penalty and the safe eta=b^(-5/4) target. Do not use the obsolete broad claim that all crude row size losses are archimedean. No lower bound on the actual optimal denominator is claimed; this is an obstruction to the existing estimate only.

## 2. One extremal argument with a smaller normalization

Read actual New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444 (energy_fixingSet_le, sum_le_of_positive_type), CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f (energy_le_of_linkEnergy_le), Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727, CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18, FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9, and the earlier COMPACT_EXTREMAL_POSITIVE_TYPE, COMPACT_NORMALIZED_LOCAL_ENERGY and COMPACT_COHERENT_LINK_ENERGY notes. The extremal proof is reused, not rediscovered.

Use the same normalized nonnegative positive-type weight Theta(s)=||P* rho(s) P||_HS^2 at Fits, with native energy normalization (no second division by unipCovolume^2). Let E=mainEnergy, E1=besselEnergy, tau=tailScale=b^(k f/4), f=numInfPlaces, n=rho+1, q0=levelPrime 0, b>=1000, eta=b^(-5/4) from 4f5a2082, and choose NEW normalizer J=b^(23k/4) (5.75k), not native b^(6k). For a fixed set A of chosen places and specified ordinary/dual nonzero frame vectors D, let F_{A,D}=Theta times the simultaneous stabilizer indicators, M(A,D)=sum F_{A,D}. Choose the finite maximum of J^|A| M(A,D). Tensor-product Gram representation and inherited pointwise domination by Theta are exactly as in the existing extremal proof. At a missing place w, every allowed vector-fixer mass of maximizing F is <=M/J.

For each singular leading size l<=n, actual card_mul_sum_det_le gives q0 * singular mass <=2M+q0^(l+r/2) M/J. Since r=k+2rho+1, l+r/2<=k/2+2rho+3/2<=0.501k (actual 1000(2rho+2)<=k), q0<=b^11, so q0^(l+r/2)<=b^(5.511k)<J. Union bound at ONE missing place gives mass outside actual fixingSet(A,D) <=3 b^-9 M. This uses the native existential nonzero-minor condition; at A=univ the complement is empty. Thus
    (1-3b^-9) M <= energy(amplitudeSum .univ, fixingSet(A,D)).
To prove the relaxed global moment it is enough to establish:
    (G) energy on fixingSet(empty) <= (1+eta/2) E;
    (R) energy on fixingSet(A,D) <= E J^(-|A|) for every nonempty A.
Indeed initial M(empty)<=J^|A*|M(A*) <=(1+eta/2)E/(1-3b^-9)<=(1+eta)E for b>=1000. Dividing by |GRes| and using the same hD gives M_relaxed of 4f5a2082 and therefore the SAME star inequality. Do not use this as an unconditional moment theorem; (G),(R) are actual remaining inputs.

## 3. Large fixing sets need NO coherent link or sieve estimate

Write a0=|A|, q0>=b^10. In the native CrudeEnergy.energy_le_of_linkEnergy_le, take T=univ, Omega=fixingSet(A,D), X=q0^a0, R_link=empty, w=0. The required FixesNormAtLeast witness is the set of selected places paired with their specified ordinary/dual flag; no double counting. All stability and nonnegativity guards follow exactly as in the original Moments caller. Unlike the original proof, one need not have A=univ to omit EVERY coherent link; only the explicit quantitative C guard is required.

Take C=E J^(-a0). Since tau^44 E1<=E,
    tau^20 E1<= E b^(-6kf)<=C   (a0<=f),
    E1<=C                      (tau>=1).
If 3 f<=4 a0, then
    tau^12 E / X^k <= E b^(3kf-10k a0)
                         <= E b^(-(23/4) k a0)=C,
because 3 f<=4 a0<= (17/4) a0. This proves ALL the source's omitted-link guards, even if a coherent nonzero-discriminant term exists. The chosen linkEnergy is exactly zero for R_link=empty, so the actual native bound yields
    energy(full amplitude, fixingSet(A,D)) <= b^-12 C <= E J^(-a0).
No local intermediateGroup, orbit packet, Siegel quadric, band limit or global sieve evaluation for these large-fixing-set cases. This is a genuine deletion of those suppliers for this CASE at the relaxed consumer. Other callers and smaller A still require them. The old B2 pair-energy theorem is retained; no claim that it itself is newly established.

The sufficient threshold can even be 12 f<=17 a0 (since 3f<=17a0/4), but use 3f<=4a0 for simplicity, not another constant optimization. At f=0 the setup is invalid; native f>=1. At E=0 the same inequalities give zero.

## 4. Small nonempty sets require only a coarse coherent bound

For 0<a0<3f/4 take R_link=univ, no omitted-link guard. Keep C=E J^(-a0) as above. It is enough to prove the much weaker coherent-link estimate
    linkEnergy <= (1/2) E J^(-a0) nu_unip^2.
Then native energy bound gives [(1+b^-4)^2/2+b^-12] E J^(-a0)<= E J^(-a0). Compared with the old coherent target (1+b^-4) E b^(-6k a0) nu_unip^2, the allowable factor is b^(k a0/4)/(2(1+b^-4)). Thus no near-unit constant is needed for any NONEMPTY fixed set. All errors may be charged against the gap in the stabilizer suppression exponent, provided their actual product is bounded by that allowance. Do not silently substitute the old sharp coherent bound as if a new producer had been proved.

For A=empty only, take R_link=univ, C=E (or E b^-6kf) and require
    linkEnergy <= (1+eta/4) E nu_unip^2.
Then [(1+b^-4)^2(1+eta/4)+b^-12] <=1+eta/2 for b>=1000. For example delta=b^-4 <=eta/1000, eta<=1: (1+delta)^2<=1+3delta, product <=1+eta/4+4delta, and delta^3<=delta. Also 3b^-9(1+eta)<=eta/2, proving the final extremal inequality. This is (G). At A=empty the native FixedLines.exists_intermediateGroup_lines can be replaced by Z=K, since no vectors are imposed and the comparison is equality. All native finite-system/Siegel/Poisson inputs for the full group still need proof/audit.

## 5. Consequence and priorities

Replace the uniformly sharp family demanded by energy_fixingSet_le at the main B3 consumer with three cases:
- EMPTY: one almost-sharp global regular-cell coherent estimate with Z=K; error eta/4.
- SMALL NONEMPTY: coarse suppression estimate only, exponentially more slack per chosen place.
- LARGE (3f<=4a0): no coherent-link estimate; the exact existing B2 crude-energy supplier suffices.
No change to the two first-moment bounds, which also use separate Bessel/complement calculations. Do not claim they follow from these estimates. The original stronger source theorem is a fallback.

RESUME HERE: B3 audit this exact actual-consumer substitution. Use the previous local normalized energy and coherent packet notes at EMPTY with Z=K and relaxed constant; for SMALL NONEMPTY use the b^(k a0/4) allowance to simplify local estimates (in particular inspect FixedLines and FiniteSystem without near-unit mass matching). For LARGE do not repeat orbital/sieve calculations. Inspect reverse dependencies before retiring any source edges. Prioritize actual native B2 caller verification still running, and A/C as scheduled. No new full replay, no artificial progress percentage, no runtime claim.

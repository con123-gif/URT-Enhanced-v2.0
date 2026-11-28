# 28 November — depth-discounted local fixing estimates for the actual B3 moment
Status: HUMAN DERIVATION / CONDITIONAL SUPPLIER WEAKENING. No native Lean replay or new unconditional RH proof.
Credit original compact proof Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Preserve prior exact C/weighted endpoint and existing work. This is NOT another optimization of greedy constants.

## Source-matched change at Moments.sum_le_of_positive_type
Read New/Filling/Moments.lean (energy_fixingSet_le, sum_le_of_positive_type, Fits.exists_translate_finrank_comap_le), New/Filling/CrudeBoundDefs.lean (fixingSet), New/Heights/OneDeterminant.lean (card_mul_sum_det_le), New/Filling/Setup.lean (q0 bounds, rho_le_k, succ_le_b), Lib/General/LinearAlgebra/ExtendColumns.lean (Shape.BesselIndex, Shape.n, leadingMinor), New/Filling/CrudeEnergy.lean (energy_le_of_linkEnergy_le). Read current mission and live ledger, previous relaxed filling and spectral deficit routes. This reduction targets the actual producer of the moment, not its downstream rank consumer.

Write b>=1000, k=shape.k, rho=shape.rho, q=levelPrime 0, E=mainEnergy>0. Native bounds b^10<=q<=b^11, 1000(2rho+2)<=k, rho+1<=b. The finite group at w acts in dimension r=k+2rho+1. Each bad leading minor has 1<=l<=rho+1 (order zero determinant is 1).
Set beta=b^(-23k/4), delta=b^-4. Replace the sharp energy requirements at nonempty masks A by the coarse requirement:
  energy(amplitudeSum univ)(fixingSet A D) <= 2 E beta^|A|  (A nonempty).
At A=empty keep the original sharp bound, or merely <=(1+8delta)E. No change to actual positive-type family, support, positivity, source D, or definition of energy. In particular do NOT replace fixingSet(empty) by the entire group.

## Proof: weighted recursion and strict slack
Let Theta be the actual nonnegative positive-type mass, with the original all-subsets energy domination; start with A empty. At a node A of depth j, Theta_A is the current positive-type function supported on prescribed vector fixers (on A), possibly zero. Define M_A=sum Theta_A. At a nonterminal node choose any w outside A. Every point outside fixingSet(A,D) in the support has a zero leading minor at this w. Union bound over nonzero orders l, then apply actual card_mul_sum_det_le. For each l its vector and dual-vector fixers have child weights Theta_A times the corresponding stabilizer indicator. This is positive type: tensor the existing Gram vectors with the orthonormal permutation vectors of the orbit, exactly as the native induction does. Nonnegativity keeps the same all-subsets domination. Each child is supported on A union {w}; no assertion of independence of fixers.
If Y is the maximum child mass (finite set of nonzero vectors and two directions), then
  M_A <= E_A + (2 n/q) M_A + (n/q) q^(n+r/2) Y,
where n=rho+1, E_A=energy(... fixingSet A D). At a terminal A=univ there is no bad part, so M_A<=E_A.
With x_A=M_A/(E beta^j), this becomes
  x_A <= e_A + a x_A + c max_child x_child,
  a=2n/q, c=(n/q) q^(n+r/2) beta.
Bound n+r/2=k/2+2rho+3/2 <= (501/1000) k using 1000(2rho+2)<=k. Therefore
  q^(n+r/2) beta <= b^((5511/1000-5750/1000)k)=b^(-239k/1000)<=1.
Thus a<=2b^-9 and c<=b^-9; these are conservative bounds, not fitted constants. All powers have positive bases. At j>=1 e_A<=2. Reverse induction (or maximal normalized node in finite tree) proves x_A<=3: terminal x<=2; elsewhere (1-a)x<=2+3c<=3(1-a), since 3(a+c)<=9b^-9<=1.
At root e_empty<=1+8delta, so
  (1-a)x_empty <= 1+8delta+3c <= (1-a)(1+9delta).
The last inequality follows from a(1+9delta)+3c<=7b^-9<=delta (1+9delta<=2). Consequently sum Theta<= (1+9b^-4) E: the original unweakened global moment, which is exactly the empty-mask call at Fits.exists_translate_finrank_comap_le.
The old local estimate implies the proposed coarse one, but its proof must not be imported as evidence of dependency removal.

## Why this matters / limitations
For j>=1 the required local upper bound increases by a factor approximately 2 b^(kj/4), relative to the old b^(-6kj) bound. It trades a very strict local normalization for an exponentially discounted error without altering the final global moment or arithmetic star. This is a mathematically proved conditional replacement at the real caller; it does not establish the coarser estimate independently, remove the sharp empty-mask energy, or close B3/B4. The exact gain in work/time is unknown. No simulation substitutes for actual Lean verification.

Source of potential savings: in energy_fixingSet_le for nonempty masks, try replacing the full sharp finite-sieve/topKernel normalisation by coarse linkEnergy control using existing energy_le_of_linkEnergy_le. The latter has an additive error term b^-12 C and requires actual fixing norms X and actual link conditions; it does not by itself prove the coarse supplier. Check the j=all-places special case separately. Do not weaken local guards elsewhere that use sharp bounds. The empty mask retains the full sharp estimate and all its real/finite analytic inputs.

RESUME HERE (B3 / Landau / integration): implement the weighted recursion by adapting the original induction in Moments.lean, using the actual finite-field card/shape casts; prove the nonempty-mask energy bound without the sharp local sieve normalization (or identify the precise surviving obstacle). Compare the resulting exact empty-mask theorem and full root dependencies; preserve original route. Native Lean replay outstanding. No schedules changed.
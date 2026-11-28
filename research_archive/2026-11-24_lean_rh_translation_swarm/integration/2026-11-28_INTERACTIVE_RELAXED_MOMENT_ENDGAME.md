# Relaxed moment sufficient for the actual RH endgame
28 November 2026. HUMAN DERIVATION, conditional on a relaxed arithmetic moment bound; no new Lean run, no root closure, no independent RH proof. Credit Alpöge, Sernau, Anthropic collaborators and Claude for the native proof. Follows interactive spectral reduction commit 0065aa17945a1d713072ad8c504d75e3c7714071. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.

## Exact statement
The existing native moment bound is (1+9 b^-4) v²/D0, where v=columnDim, D0=|G|*besselDegree*mass and d=rank R≤D0. It is sufficient for the actual output of Data.enough_forms to establish only
    tr(M²) ≤ (1+3 b^-2) v²/D0.
This weakens the allowed relative second-moment error by b²/3, at least 333333 at b≥1000. It is not an assertion that the relaxed estimate is already proved by simpler arithmetic or that all other precision requirements can be relaxed.

## Proof (no spectral gap or irreducibility assumed)
Put η=b^-2, e=η². Retain the normalized map T, finite unitary action U_s, central orthogonal projector R, and all normalization, bad central trace and ramification bounds from Moments.lean and FillingTheorem.lean. By the preceding interactive spectral note:
    K_c=min(TT*, I), C=E_s R U_s K_c U_s* R on W=range R,
    0≤C≤I_W, tr C≥(1-5e)v, tr C²≤tr M²,
    C≤E_s P_s, P_s=orthogonal projector onto range(R U_s T).
In particular d≥(1-5e)v>0 and v/(2d)<1. Only the sharp moment input (iii) is being relaxed; all other inputs are unchanged.

For F⊂W of codimension r, J the projector onto F^perp, use the Hilbert–Schmidt Cauchy–Schwarz inequality:
    tr[(I-J) C] ≤ sqrt((d-r) tr C²)
    ≤ v sqrt((1-r/d)(1+3η))
    ≤ (v/2)(2-r/d+3η).
The last inequality is AM–GM. Thus tr(J C)≥(v/2)(r/d-3η-10e).
Some s has rank(J R U_s T)≥tr(J P_s)≥tr(J C). The map before ramification is related by invertible column coordinates and nonzero scalar to the native projected Poincare map, as in FillingTheorem.lean. Restriction/precomposition by ramifyingOp loses at most ℓv in rank, where ℓ=f/(N-1) (ChainValuation.lean ramifyingOp_finrank_comap_and_short, ColumnDefs.lean card_piPlaces). The native f≤b and N-1≥b^9 imply ℓ≤b^-8. If f≤b is not directly available from the native Data guards, retain ℓ symbolically and use the sufficient guard ℓ≤η/100; audit that guard rather than assuming it.
Set θ=3η+10e+2ℓ. For b≥1000 and ℓ≤b^-8, θ≤3.01η, hence θ<4η.
The rank gain of a ramified translate is at least (v/2)(r/d-θ).
Choose such translates greedily until r≤4ηd. With α=v/(2d)∈(0,1), while above the stopping threshold,
    r_next ≤ (1-α)r+α θ d.
Each step increases rank strictly (and cannot repeat a previous translate). Iteration gives r_j≤θd+(1-α)^j(1-θ)d. With
    j*=ceil[(2d/v) log((1-θ)/(4η-θ))]
we reach r≤4ηd no later than j*. Since 4η-θ≥.99η, (1-θ)/(4η-θ)≤2/η, hence
    j*v ≤ 2d log(2b²)+v ≤ 2d log(2b²)+2d
        ≤ 5d log(1+b²).
For the last inequality put u=log(1+b²)≥log(1+1000²)>3; the LHS/d≤2u+2log 2+2≤5u. (Ceil bound includes one extra translate.) Positivity of v is the original column nontriviality. This recovers exactly the three outputs of Data.enough_forms, with no reliance on its stronger IsSpread premise with error η. The selected ramified ranges lie in the projected Poincare ranges, as in the native caller. Consequently the unchanged A/B/C star can use this output, subject to replay of the actual caller. No other RH error is changed.

## New arithmetic target; do not confuse with proof
Write C0=v²/(besselDegree*mass), t=b^(-6k), e=b^-4. The native recursive positive-type proof in Moments.lean 226–258 uses a fixing-set main energy bound (1-e)(1+9e) C0 t^|A|. The threshold factor (1+9e) is used to compare a hypothetical violating parent to the inductively bounded conditioned children; the local determinant/fixer relative-bad-mass estimate then makes the good mass at least (1-e) times the parent. Candidate substitute threshold (1+3η) everywhere and main energy target
    energy(fixingSet A D) ≤ (1-e)(1+3η) C0 t^|A|.
The determinant/fixer relative estimate and original support/positivity inputs must still be retained. Audit exact source inequality and replacement proof before selecting. No claim of an unconditional bypass: the open-cell integration, sieve, packet normalization, central trace and complement estimates remain until a new proof provides the needed bounds. Only slack in the main energy target has been demonstrated. Some estimates are shared with the unrelaxed complement, so they cannot be removed on this basis alone.

## Strong limitation / counterexample to symmetry alone
Take a representation with an invariant subspace of dimension d/2 and T an isometry into that subspace. Then T*T=I and the bad central trace vanishes if R=I, yet every translate lies in that subspace; half the rows can never be reached. The global moment bound (or an alternative arithmetic rank argument) is indispensable. Schur averaging only gives scalar on irreducible factors without multiplicity, and does not determine the sector weights.

## Handoff
1. Audit exact native f/(N-1) guard, source coordinates and the output replacement at Data.enough_forms; use the same data and normalization.
2. Trace all appearances of b^-4 in energy_fixingSet_le, packetConst_mul_mass_le, sieve, energy_le_of_linkEnergy_le. Separate shared complement constraints from main-only precision; try to replace main-only sharp bounds by a provable b^-2 tolerance. Do not reopen accepted modules.
3. Independently check whether the relaxed positive-type threshold substitution is purely scalar; if yes, verify the replacement in the native environment.
4. Compare proof lengths and dependency graphs, and select only genuine arithmetic supplier deletions. No claim that the remaining geometric machinery is already eliminated.
Sources: pinned New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444 lines 102–181, 220–345; New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76; New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a lines 173–178; New/Filling/CrudeEnergy.lean energy_le_of_linkEnergy_le.
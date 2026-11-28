# B3 — one normalized mixture sieve for the averaged prefix route

28 November 2026. Status: source-matched conditional human caller derivation, not native replay. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Read current mission/spine/ledger (blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 / 1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484), AGENTS, protocol, queue and expansion. Prior exact conditional reduction 2026-11-28_AVERAGED_PREFIX_FIXER_MOMENT.md (079c45753d32f62a7417b78fbf69f3715ebfbbf5) and RUN51 retained. Peer RUN90 shell transport PREPARED; do not duplicate its replay. B3 remains OPEN in the independent reconstruction.

## 1. Source and precise new junction

Read actual bodies of New/Filling/FixedLines.lean (a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9), FiniteSystem.lean (1c169e04852f767f1d1a0140448d902c16dd04e7), Moments.lean (ec2cb964ede0d5eeae41a077dc6dbfface9c0444), GlobalSieve.lean (0ad01a3eec4c5dcd2a51bb1d9773f7834970e372), EichlerFlag.lean (3da2606a049a092719b779802cb8ead3af7141ce), CrudeBoundDefs.lean (0ba0d2532b14c414b9032466b79e10d4d60c3d18), CrudeEnergy.lean (da67bf862a4c5e72ab6a81a7dfb462545cd8833f), and Setup.lean (622e7ebe5c04b7ae87652e460762da7fb2e40727). Use all actual admissibility, stable term, Haar, WeilData, frame, local frequency/head, absolute convergence, mass and normalization inputs. No new arithmetic estimate is presumed from positive type.

Write h=b^(-6k), delta=b^-4, u=b^-6, f=#chosenPlaces(0)=numInfPlaces E>0. Use L, p_w, W, good and e_s from the preceding note. Index a finite family by alpha=(j, a tuple of directions at the first j places), 0<=j<f. Direction probabilities are precisely the convex weights in p_w, including both dual sides and all permitted orders. Put c_alpha=L^j times the product of those probabilities; empty tuple weight 1. Write Omega_alpha=fixingSet(prefix_j, direction_tuple). As j<f, this is the intersection of good and the specified fixers, not the full-mask case. Thus

  sum_s e_s W(s) = sum_alpha c_alpha energy(A_univ,Omega_alpha).

All c_alpha>=0. Define P=sum_alpha c_alpha=sum_(j<f)L^j>0 and A=sum_alpha c_alpha h^j=sum_(j<f)(Lh)^j. Only these two scalar sums enter the new junction.

## 2. Convex closure at the exact SieveSystem interface

Fix the SAME finite places T and filling level F. For each alpha choose the Z_alpha from FixedLines.exists_intermediateGroup_lines. Their containment statements are for their own Omega_alpha, not all masks at once. For a common compact open additive L0, take the actual J_alpha from FiniteSystem.exists_finite_sieveSystem: F.floorForm(...,Z_alpha.besselVector,1)/Z_alpha.massRatio.toReal through order rho, and F.topKernel(L0,Z_alpha,...)/volume.real(L0)/Z_alpha.massRatio.toReal at the top. The source gives e_alpha=(1+u)h^j, common character, maps, head bound Lambda=finHeadWeight(n^6), and beta=frequencyGain T.

Set Jbar=(1/P) sum_alpha c_alpha J_alpha, ebar=(1/P) sum_alpha c_alpha e_alpha=(1+u)A/P. This is a SieveSystem with the SAME Lambda and beta:
* integrability and zero-frequency recurrence follow by finite linearity;
* unit-frequency and off-diagonal norm bounds follow by triangle inequality and sum(c_alpha/P)=1;
* top PSD follows by nonnegative weighted sum of quadratic forms, continuity by finite sums;
* bottom norm <= ebar by the same triangle inequality.

This is exact even for different subgroup indices and Haar ratios. No single intermediate group realizes Jbar in general. Never replace this by averaging besselVector or raw phase amplitudes before squaring, or by dividing by an averaged massRatio. Those operations do not preserve the required inequality. Convex closure applies AFTER each actual normalization. It also permits a weaker, direct averaged bottom bound in place of the individual norm_bot_le fields; the individual step, PSD, continuity and off-diagonal fields remain sufficient. It does not establish that weaker bound from nothing.

## 3. One actual global sieve for every prefix, with proper common cutoff

For each alpha use the actual sum_blocks_le_topKernel on its finite link-energy truncation (the link predicate in Moments.energy_fixingSet_le is fixed for all j<f: R contains all links; termDisc !=0). Do not apply that subgroup-dependent theorem to Jbar itself. The finite family of truncations has a common finite union of arithmetic head parameters and final t labels. Use the same T0 union and T admissible for all, the same hT and scale r of Moments, and choose L0 in the intersection of the finitely many small-set neighborhoods supplied by the separate top-kernel estimates. This is possible by the same closed-ball open subgroup basis used in Moments. Enlarging the head set A0 may be done in the initial truncation of the absolutely convergent coset sums: take common finite cutoffs directed by inclusion, not an assertion that the squared norm of an arbitrary partial sum grows monotonically. The source has successive frequently-atTop/tendsto steps for this reason. For each common t absent from one alpha truncation, its added full head quadratic form is nonnegative: both the actual real correlation Gram matrix (Hadamard product across places) and normalized finite top kernel are PSD on that common t fiber. Their entrywise product is PSD, hence its all-ones quadratic form is nonnegative. The Gram matching and head-density identity from Moments must be the SAME ones; they do not depend on the choice of Z. Do not pad a nonzero amplitude with an unrelated Gram matrix.

Multiply each top estimate by c_alpha and add. Finite linearity of the right side gives P times the top quadratic form with Jbar. Apply GlobalSieve.sieve ONCE to Jbar, with the common A0 and U0 subset A0. Its exact bound, before the unchanged packet/scale calibration in Moments, becomes

  C0 [ (prod_v ((1+b^-10)/deg_v)) (1+u) A
        + (besselDegree)^(-1) b^(-6kf-10) P ],

where C0=prod_(i<n)(vol(O_hat)/prod_v frameScaleSq(v,i)^2). In particular the additive frequency error is multiplied by P, not by A. This is the precise location at which an unnormalized mixture with the old frequency bound would be invalid.

Take the original directed limits simultaneously over the finite family of truncations (finite weighted sums commute with these limits); for the countable link sum use the same finite-subset upper bound as the native ENNReal.tsum argument. The joint estimate is for the sum of link energies, not the square of a weighted sum of amplitudes. No interchange of arbitrary unbounded signed sums is used.

## 4. Scalar reduction and crude-energy connection

The exact source scalar calibration at the end of energy_fixingSet_le (block beginning obtain D := nonneg mainEnergy, besselDegree_pos, volO_ne_zero) is retained; do not infer it from the current abstract mixture. It compares the preceding affine expression in e and frequency-error to (1+delta) h^j mainEnergy, after the common packet, r and nu factors. Since all these factors are independent of alpha, denote the resulting nonnegative coefficients of h^j and 1 by a and z, respectively, including all original scales. The individual calibration reads a h^j + z <= (1+delta) h^j E. In fact only the deepest proper prefix j=f-1 is needed for this scalar comparison: a+z/h^(f-1) bounds a+z/h^j for every j<f since 0<h<=1. Hence the exact same calibration implies

  a A + z P <= (1+delta) A E.

The mixture error cannot silently be deleted: directly P h^f <= A (termwise h^f<=h^j). The normalized sieve expression above has error b^-10 P h^f, therefore at most b^-10 A. This control is independent of the possibly huge L. It is not a proof that the source packet/r/nu calibration has been independently rederived; that scalar block remains a named supplier. As a check for the simpler fully canceled coefficient case, (1+u)(1+b^-9)[(1+u)(1+b^-10)^f+b^-10]<=1+9u<=1+delta for b>=1000,f<=b, using (1+b^-10)^f<=1+2b^-9. Do not substitute this simpler case for the actual calibration without proving its exact normalization.

For crude energy, let w_alpha be its actual nonnegative link-energy bound divided by nu^2 (nu>0). The weighted link estimate now gives sum c_alpha w_alpha <= (1+delta) A E. Use energy_le_of_linkEnergy_le separately with X=q^j, C_alpha=(1+delta)h^j E, all links R (no omitted-link hypothesis), the SAME original stable and full/cut hypotheses and the original tailScale^20 besselEnergy bound. This is a legitimate use of the theorem for varying w_alpha; no pointwise bound on w_alpha is needed. Multiply by c_alpha and sum:

  sum_s e_s W(s) <= [(1+delta)^3 + delta^3(1+delta)] A E
                  <= (1+8delta-9delta^2) A E.

The last inequality is a direct polynomial bound for delta<=1000^-4: the difference is delta*(5-12delta-2delta^2-delta^3)>=0. The prior geometric estimate A<=1+4b^-9/(1-4b^-9) implies AVG <=(1+8delta)E as in the preceding note. No division by E is required. Terminal full mask remains the original crude-energy estimate in the preceding note. Thus, CONDITIONAL on the retained source local and calibration suppliers and the common-head/Gram matching just described, the aggregate AVG can be reached using one global sieve rather than applying energy_fixingSet_le for every direction tuple. The local subgroup existence/containment and local analytic estimates have not been removed, and the actual one-prime floor estimate is still required for the stated ebar unless a direct averaged version is proved.

## 5. Verification and exact remaining gap

Local CPython Fraction checks actually executed: 122 assertions (four values b, sixteen binomial head cases, 48 scalar aggregate frequency cases, eight polynomial checks, one negative control and 49 rational PSD-mixture checks). Reproduction:

```python
from fractions import Fraction as Q
from itertools import product
checks=0
for b in [1000,1001,2000,10000]:
 u=Q(1,b**6); a=Q(1,b**9); v=Q(1,b**10); d=Q(1,b**4)
 assert (1+u)*(1+a)*((1+u)*(1+2*a)+v)<=1+9*u<=1+d; checks+=1
 assert (1+d)**3+d**3*(1+d)<=1+8*d-9*d*d; checks+=1
 for f in [1,2,5,20]:
  assert (1+v)**f<=1+2*a; checks+=1
  for h,L in [(Q(1,10),Q(5)),(Q(1,100),Q(1,3)),(Q(1,1000),Q(999))]:
   A=sum((L*h)**j for j in range(f)); B=sum(L**j for j in range(f)); assert B*h**f<=A; checks+=1
assert (Q(1,2)*(1+(-1)))**2==0 and Q(1,2)*(1**2+(-1)**2)==1; checks+=1
Gs=[((1,2),(2,4)),((4,-2),(-2,1)),((2,0),(0,3))]; weights=[Q(1,6),Q(1,3),Q(1,2)]
G=[[sum(w*M[i][j] for w,M in zip(weights,Gs)) for j in range(2)] for i in range(2)]
for x in product(range(-3,4), repeat=2):
 q=lambda M:sum(x[i]*M[i][j]*x[j] for i in range(2) for j in range(2))
 assert q(G)==sum(w*q(M) for w,M in zip(weights,Gs))>=0; checks+=1
print(checks)
```

Actual output 122. These test only the algebra and abstract Gram convexity, not the native arithmetic systems. No lean/lake executables found locally; no native rh_scan/prune/reduce/auto/frontier, no CI execution, no new axiom or graph PASS. Original source graph and accepted peer receipts preserved. Proposed interface graph: per-alpha subgroup and normalized local fields -> convex closure -> one GlobalSieve.sieve -> weighted link bound -> separate crude estimates -> AVG -> prior empty-mask reduction. All original local and analytic supplier nodes remain. No global dependency deletion claimed. Existing B3 shell caller remains separate.

RESUME HERE: independently audit the common finite-head/Gram matching in section 3 against the exact choose t,sigma,n,ht,L,H,H' and H' directed-limit witnesses of Moments.energy_fixingSet_le; prove a source-faithful common cutoff transport or reject the one-sieve caller if any Gram normalization varies with alpha. Then replay the convex SieveSystem closure and exact weighted caller on the existing shared compact workspace; retain the original sharp proof fallback. No new RH root closure. HANDOFF integration / Landau / positivity / audit.

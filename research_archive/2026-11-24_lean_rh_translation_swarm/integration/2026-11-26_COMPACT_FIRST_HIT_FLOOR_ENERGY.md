# Compact B: first-hit floor energy, exact off-congruence remainder
26 November 2026. Source-matched human derivation of a localized refinement of the native capped-pivot estimate, not a new uniform shell estimate. Native replay outstanding. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Continues 51e3e7cf3c80f75212b2bce440fc1f08bdb5ce1e. External machine-checked proof distinct from incomplete human reconstruction.

## 1. Exact native defect and what is actually required

For the congruence group C=K(g) and Z between C and K, set M=groupMeasure, I_Z(x)=integral_{y in Z} phase(g,yxy^-1)dM(y), Kappa(Z)=integral |I_Z|² dM. By floorZeroForm_on_congGroup the exact decomposition is
  Kappa(Z)=M(Z)^2 M(C)+Eoff(Z),
  Eoff(Z)=integral_{x outside C}|I_Z(x)|² dM(x).
Both terms nonnegative. The actual floorZeroForm_le_main_term requires only
  Eoff(Z)<=M(Z)M(C) v^(t+1) 2^-n,
where v=volume(R minus intUnits), n=rho+1, t+10^10 n^4<=k. Thus the dimensionless defect Eoff/[M(Z)M(C)M(K)] is sufficient for the relative energy bound, and the exact main term is not part of the estimation problem. Keep actual native phase, Haar and additive measures and finite positive mass guards.

## 2. Replace full future energy in the capped-pivot step by first-hit energy

Read LevelGauge.lean and FloorKernels.lean for the exact definitions. Fix F, Gamma, x in positions, the native pairing kernel k0, starting depth l and g. Write s=F.volumeExponent, Cg=Gamma.Lambda^(10^4 n)>=1. (Cg is a scalar, not the congruence group.) Write
  P_j(g)=floorWeight j g x
        = product_{a<j} volume(floorValues a g x)^s,
  v_j(g)=volume(floorValues j g x),
  A_j(g)=P_j(g)|upperPairing(j+1,k0,g,gx)|²,
  B_j(g)=weightedSquareSum(k0,x,j,g)
        =integral_{sigma} [A_j(sigma g)+B_{j+1}(sigma g)] dtheta_j.
These are exact native definitions, including B_j=0 at j>=n. Every P_j and v_j is finite positive by FlatCharts. floorWeight_succ gives P_{j+1}=P_j v_j^s, while P_j(sigma g)=P_j(g) for sigma in the relevant GT j. The latter and invariance of earlier floorValues under deeper floor groups are the native floorWeight_mul_left/floorValues_mul identities used by the capped-pivot proof. Preserve all almost-everywhere floor support and measurability facts.

Fix a cap epsilon in [0,1), and assume exactly the native cap coverage condition at l:
  for each sigma in GT l, k0(sigma g,sigma(gx))!=0 implies some a>=l, a<rho,
  has v_a(sigma g)<=epsilon.
This is not a statement that the same a works for all sigma. For the native bottom off-congruence proof the cap is min(v,1/2); the coverage implication follows by the existing primitive-unit floor-values argument, NOT solely by x outside C. Keep its full IsNear and integral-data guards. If epsilon=0, positivity of floor volumes makes every kernel on the reachable support zero; the pivot is zero. Otherwise use 0<epsilon<1.

Define a first-hit energy (a finite depth recursion, not an infinite stochastic process):
  J_rho(g)=0;
  J_j(g)=Cg integral_{sigma} [
       1_{v_j(sigma g)<=epsilon} A_j(sigma g)
     + 1_{v_j(sigma g)>epsilon} J_{j+1}(sigma g)] dtheta_j, j<rho.
For fixed x, epsilon, the sets and kernels are measurable by the native measurability of floor volumes/weighted squares, and the finite recursion. Each path stops at its first capped floor. This is a weighted sum over stopping paths, not an expectation against an assumed probability measure. It contains neither energies after the first hit nor a worst-depth factor on every hit.

Claim under the native cap coverage:
  pivotModulus(j,k0,g,gx)^2 <= epsilon^s J_j(g)/P_j(g).
The claim at rho is exactly the native empty-cap argument: if the pivot is nonzero, exists_ne_zero_of_pivotModulus gives a nonzero kernel at a reachable element, contradicting the required remaining cap. Thus zero <= zero (P_rho positive finite). For j<rho apply native IsPairingKernel.pivotModulus_sq_le with u(z)=P_j(z)/P_{j+1}(z), and the actual floorMassLe_floorWeight_div bound Cg. For a hit, exactly
  |upperPairing(j+1,k0,z,zx)|² = A_j(z)/P_j(z)
   <= epsilon^s A_j(z)/P_{j+1}(z)
   = u(z) epsilon^s A_j(z)/P_j(g),
where z=sigma g and P_j(z)=P_j(g) on the relevant floor support. For no hit, the cap condition passes to the next floor at z: deeper multiplication preserves this already-uncapped v_j, and preserves reachability in GT j, just as the native proof uses floorValues_mul and subgroup multiplication. Thus every nonzero remaining kernel has a cap at a>=j+1. By upperPairing <= pivotModulus and induction,
  |upperPairing(j+1,k0,z,zx)|²
       <= epsilon^s J_{j+1}(z)/P_{j+1}(z)
       = u(z) epsilon^s J_{j+1}(z)/P_j(g).
Use the sum of the two disjoint indicator terms as v in the actual Cauchy-Schwarz lemma. Multiply by Cg and integrate: the claimed inequality follows by definition of J_j. Zero terms and any extended-real infinite quantities can be handled using native ENNReal positive finite P_j, epsilon, Cg; never cancel infinity. For the finite real-valued case this is elementary weighted Cauchy-Schwarz.

Since all terms are nonnegative, backward comparison with the literal B_j recursion gives
  J_j(g)<=Cg^(rho-j) B_j(g).
Indeed at rho, J=0<=B_rho. At each earlier level, hit term Cg A_j <= Cg^(rho-j) A_j; no-hit term Cg J_{j+1} <= Cg^(rho-j) B_{j+1}; integrate. Therefore the native Gauge.pivotModulus_sq_le_of_capped follows exactly from the first-hit proof. No new uniform estimate is needed to use the original fallback. A more detailed form of J is a sum over depths a in [j,rho): each term is Cg^(a-j+1) times the iterated integral of A_a with all earlier uncapped indicators and the cap indicator at a. This follows by finite substitution and Tonelli. It makes the remaining geometric issue a first-hit distribution over the actual floor chain. Any attempt to bound this by a depth-independent quantity must prove the corresponding weighted mass inequality; neither an early hit nor a probabilistic distribution is assumed.

## 3. Shell layer is a different, retained mathematical estimate

TopFloor.lintegral_shells_le uses native content ideals to partition/bound positions, gauge rescaling and a zeta summation. The actual summation lemma in Lib/SiegelWeil/Mass/TorusMajorant.lean is lintegral_le_idealZeta_mul: if for almost every point x of the integration set one finds an ideal I of finite nonzero quotient cardinality and x in S_I with
  [R:I]^mu f(x) measure(S_I)<=V,
then integral f<=idealZeta(R,mu) V (given idealZeta<=2). This is an actual upper bound on shell integrals, not an identity between arbitrary shell representatives. The native proof uses a common content ideal of the matrix (x-1)/g and rescales the gauge; that produces the shell cost and powers of Lambda. The first-hit inequality by itself does not bound those shell costs, does not remove the zeta factor, and cannot improve the global tail budget. In particular the off-congruence uniform estimate still depends on Gauge.lintegral_positions_le (self-norm integral bounds) and the content-to-gauge cap construction in lintegral_shells_le. Do not report the entire energy theorem as newly proved. This note isolates a sharper actual subquantity that may help that supplier and gives an explicit human derivation of the existing capped estimate.

## Sources and status
- New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111: floorZeroForm, floorZeroForm_on_congGroup, lintegral_shells_le, floorZeroForm_le_main_term.
- New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6: pivotModulus_sq_le_of_capped, lintegral_positions_le, formMajorant_sq_le.
- New/RealPlace/LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e: volumeExponent, floorWeight, pivotModulus, weightedSquare, weightedSquareSum.
- New/RealPlace/FloorKernels.lean 594b1553ed02ba5c074180fb32d0f5215918ad52: actual weighted Cauchy-Schwarz, upperPairing domination, terminal support.
- New/RealPlace/FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4: floorValues invariance, positive finite masses, weight recurrence and measurability.
- New/RealPlace/WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd: actual floorMassLe_floorWeight_div.
- Lib/SiegelWeil/Mass/TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15: ideal zeta summation; Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271 inspected for content bounds.
No native Lean replay, no measured speedup, no proof of new uniform off-congruence estimate. The first-hit expression is a refinement under exactly the original cap condition; it can equal the old bound in a worst-depth case. It is not yet established that it shortens the final ten-page proof compared to using the native capped lemma directly.

RESUME: focus on actual uniform content-shell mass estimate and native gauge rescaling in TopFloor.lintegral_shells_le, or prove a first-hit averaged shell bound retaining exact measures. If no gain at the consumer, keep the native capped estimate and move on; do not repeatedly rewrite the stopping recursion. Audit native floor-index casts and support invariance when formalizing. Editor can use the exact main/off split and weighted Cauchy-Schwarz as short conceptual explanation. HANDOFF geometry/kernel/audit/editor/integration.

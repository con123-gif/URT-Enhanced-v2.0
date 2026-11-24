# Human-readable RH reconstruction — thirteenth edition, 24 November 2026, 19:56 UTC

**INCOMPLETE.** Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged). No independent kernel replay or URT acceleration claim. One linked manuscript: read [I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [V](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [VI](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [VII](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [VIII](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), [IX](2026-11-24_1856_INTEGRATED_MANUSCRIPT.md), then X here. This volume adds 9 primary and 1 supporting peer chapters to previous 125+10, excluding the editor's introductory proof by previous convention.

## Analytic approximation supplying QDChoice

SOURCE-MATCHED conditional human proof. Retain exact five input propositions ExplZeta, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet. Fix 0<epsilon<1/52. There exist x0 and C>0 uniform in x>=x0, Q>0, positive modulus q, nonprincipal chi, native GlobalTheoryTheory.GoodFor Q chi, and x^(epsilon/6)<=log Q<=x^(epsilon/4), such that

  |gChi(chi,x)+sum_{1<=n<=floor(x^400)} cn(x,n)chi(n)|<=x^epsilon,
  |logDerivativeAtOne(chi)|<=C log x.

Do not substitute the similarly named GL2PrimeSums.GoodFor for the native guard: the source projects primitive, real and zero-exclusion conditions.

### Complementary weights
Set a(n)=Lambda(n)chi(n), A(u)=sum_{n<=floor u}a(n), R(N)=sum_{1<=n<=N}a(n)/n, S=-L'(1,chi)/L(1,chi). Nonprincipal gChi is the smoothed sum minus xS. For 0<=x<=Z extend the smoothed sum to floor Z; extra terms vanish. Since max(x/n-1,0)+min(1,x/n)=x/n in both cases x>=n and x<=n,

  gChi(chi,x)+sum_{1<=n<=floor Z}cn(x,n)chi(n)=-x[S-R(floor Z)].

This is gChi_add_sum_eq. The negative sign disappears only in norms; the principal case is excluded.

### Convergence of the ordinary series at one
For fixed nonprincipal chi its primitive inducing character is nonprincipal because changeLevel preserves 1. The supplier exists_norm_psi0_le_exp_sqrt_log gives the primitive bound C N exp(-c sqrt(log N)), c>0. The two characters agree on integers coprime to q; their discrepancy is supported on prime powers of primes dividing q with norm at most Lambda(n). At most floor(log_2 N) powers of each occur and the radical of q divides q, hence the discrepancy norm is <=floor(log_2 N)log q. Exponential Taylor bounds give exp(-c sqrt(log N))<=24/(c^4 log^2 N) and floor(log_2 N)<=6N/(log 2 log^2 N) for N>=2. Thus |A(N)|<=K N/log^2 N with K=24|C|/c^4+6log q/log 2.

For real 1<=s<=2, Abel summation gives
  sum_{n=1}^N a(n)n^(-s)=A(N)(N+1)^(-s)+sum_{n=1}^N A(n)[n^(-s)-(n+1)^(-s)].
The first term tends to zero by the displayed estimate. Differentiation bounds the nonnegative difference by 2/n^2. The transformed sum is dominated for n>=2 by 2|K|/(n log^2 n), summable by integral comparison; n=1 has separate bound 2|a(1)|. Dominated convergence permits s down to 1. For s>1 the Mathlib twisted von Mangoldt series equals -L'/L, by local LFunction=LSeries and derivative equality. Nonprincipal differentiability and LFunction_apply_one_ne_zero give continuity at 1. Therefore R(N)->S, without asserting absolute convergence at 1. Primitive psi0 supplier and the named Mathlib facts remain dependencies.

### Two-regime tail bound
The actual power-saving and sqrt-log suppliers give common positive amplitude C1 (maximum of two constants) and c1>0 under the five inputs, Q>=3, nonprincipal chi and native GoodFor:
  |A(u)|<=C1[u^(1-1/400)log^2(uQ)+(u/Q)log^2(uQ)] for u>=2;
  |A(u)|<=C1 u exp(-c1 sqrt(log u)) for u>=exp((log Q)^2).
Their native explicit-formula derivations remain separate obligations.

Put L=log Q>=1, t=log u>0, c=min(1/2,c1/2), K1=8!/(1/2)^8, K2=4!/(c1/2)^4, K=4K1+K2. If t<=L^2, (t+L)^2 t^2<=4L^8<=4K1 exp(L/2)<=K Q^(1-c). If t>=L^2, v=sqrt(t)>=L gives v^4 exp(-c1 v)<=K2 exp(-c1 v/2)<=K Q^(-c). Consequently with E=K Q^(-c),

  |A(u)|/u<=C1[u^(-1/400)log^2(uQ)+E/log^2 u].

After division by u the majorant is continuous on [Z,U], 2<=Z<=U. The floor-defined summatory function is measurable, hence integrable there by domination. Define P(l)=400l^2+320000l+128000000. Since P/400-P'=l^2, the exact antiderivative of the majorant divided by C1 is -u^(-1/400)P(log(uQ))-E/log u. Drop the nonpositive U endpoint. As log(ZQ)>=1 and log Z>=2/3, P(l)<=128320400l^2, E/log Z<=2E and E/log^2 Z<=3E. Adding the endpoint term proves

  |A(Z)|/Z+integral_Z^U |A(u)|/u^2 du <= D[Z^(-1/400)log^2(ZQ)+Q^(-c)],

where D=C1(128320401+5K). This is the actual psi_tail_bound with its original constant and is uniform in U.

### Exact integral limit
KroneckerReal proves A(N)=N R(N)-sum_{k=0}^{N-1}R(k), so Cesaro convergence gives A(N)/N->0 and A(U)/U->0 via floor(U)/U->1. For real 1<=Z<=U partial summation gives
  integral_Z^U A(u)/u^2 du=R(floor U)-A(U)/U-R(floor Z)+A(Z)/Z.
The integral tends to I=S-R(floor Z)+A(Z)/Z. Thus S-R(floor Z)=I-A(Z)/Z. Apply the triangle inequality and pass to the limit in the uniform real integral bound to obtain tail_le. No unjustified exchange of limits or absolute convergence of R was used.

### Uniform threshold and both conclusion fields
Choose x0 so that all six source eventual guards hold:
400 log x<=x^(epsilon/4), log x<=c x^(epsilon/6), 5D<=x^(epsilon/2), x^(epsilon/6)>=2, log x>=1, x>=2. They follow from log=o(x^delta) for delta>0. Then Q>=3 by log Q<=Q-1, Z=x^400>=2, Z^(-1/400)=x^(-1), log(ZQ)<=2x^(epsilon/4), xQ^(-c)<=1. Hence

  x|S-R(floor(x^400))|<=D[4x^(epsilon/2)+1]<=5D x^(epsilon/2)<=x^epsilon.

Since epsilon<1 the unscaled tail is <=1. Mertens' first von Mangoldt estimate supplies CM>=0 with sum_{n<=y}Lambda(n)/n<=log y+CM for all y>=1; |chi(n)|<=1. Thus |S|<=1+400log x+CM<=(401+CM)log x. The source further enlarges x0 by max(1,2^(6/epsilon)) and C by max(C,1). The complementary-weight identity gives the first conclusion and |S| the second. This is g_chi_approximation_sum, the actual supplier used by both prime-pair selection stages in IX. All eight QDChoice antecedents retained; five enter this supplier. No extra hypotheses.

## Pinned source ledger
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GChiApproximationSumStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GChiApproximationSumStatement.lean) — c28ef32437a887bd41de63f6ba7fadddf97c05eb; g_chi_approximation_sum
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GChiApproximationSum.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GChiApproximationSum.lean) — e1d85bb425a416197bd3a9a41614f61f94c7681a; gChi_add_sum_eq, gChi_add_sum_bound
- [src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/TailAndSumBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/TailAndSumBound.lean) — 154c3ccc4202df3e9e91b311b5ddf183068afdcc; tail_le, tail_and_sum_bound
- [src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/KroneckerReal.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/KroneckerReal.lean) — f8180fd7e7cc5123da073efe7dd80f6efac71adb; sum_eq, kronecker_real, integral_eq, tail_integral
- [src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/Gl2L2IntegralityStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/Gl2L2IntegralityStatement.lean) — 3081aeedfb156d304a242cc89be98048048feacd; gl2a2_integral_bound_of_sums
- [src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/Gl2L2Integrality.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/Gl2L2Integrality.lean) — cf0c0254a6ab9e825cea4e6f5be9b595eba96ff9; error_terms, hasDerivAt_prim, psi_tail_bound
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicitStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicitStatement.lean) — a5540c20f7149430154fed6052fc55c4d6c4a53e; log_deriv_series_of_explicit
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicit.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicit.lean) — b48cd2a991db4b5f185564a3c75cbfa4577d2581; abel, rpow_diff_le, tendsto_of_partial_sums, norm_sub_primitive_le, logDerivSeries
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBoundStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBoundStatement.lean) — f4d889170d7422f5eb2d149fb958bc3e1979d70b; psi_chi_power_saving_bound
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBoundStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBoundStatement.lean) — 1e09c4f74145b1a4007a466133380d4d23388d47; psi_chi_sqrt_log_bound
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBound.lean) — 2b9bf9a3b5253439b7935dbd64a91ea5de640268; re_bounds, psiChi_bound_of_goodFor
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBound.lean) — 20d27b0261939669396c28bb80ab957c3329b7fb; inv_norm_le, psi_le_of_large
- [src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean) — 7a15775fd81401803807bd100f89eadb63bb7411; psiChi, zerosIn
- [Formalism/GL3MeanSquares/PrimeCountAsymptoticInProgressions.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/GL3MeanSquares/PrimeCountAsymptoticInProgressions.lean) — 7d9cc798a57f7b4bd98e95ae8b12e8c9c8499ce7; LogDerivSeries, PartialSumIntegralBound.
- [Formalism/GL3MeanSquares/SmoothedRemainderRealIntegralFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/GL3MeanSquares/SmoothedRemainderRealIntegralFormula.lean) — 9d9ece3ed20ea4480c0981c5a799d1de983701bb; psum, TailSumBound, SmoothedRemainderIntegralFormula.

15 source files retrieved, connector-returned blob identifiers recorded, not independently recomputed. Exact V8 regression executed: 5490 complementary weight, 620 Abel, 6510 finite integral, 1000 polynomial/endpoint, 12400 scale-budget cases; total 26020 plus two negative controls. These are finite exact arithmetic checks, not a replay of analytic or Lean proofs. Reproduce:
```js
function check(){
let weight=0,abel=0,integral=0,poly=0,budget=0,negative=0;
const ck=(v,m)=>{if(!v)throw Error(m)};
for(let x=0n;x<=60n;x++)for(let n=1n;n<=90n;n++){let m=x>n?x-n:0n,k=x<n?x:n;ck(m+k===x,"complement");weight++}
for(let seed=0n;seed<31n;seed++)for(let N=1n;N<=20n;N++){
let D=1n;for(let j=1n;j<=N+1n;j++)D*=j;
let A=0n,S=0n,R=0n;for(let n=1n;n<=N;n++){let a=(seed*13n+n*7n)%23n-11n;A+=a;S+=a*(D/n);R+=A*(D/n-D/(n+1n));}
ck(S===A*(D/(N+1n))+R,"Abel");abel++;
for(let Z=1n;Z<=N;Z++){let az=0n,sz=0n,I=0n,at=0n;for(let n=1n;n<=N;n++){let a=(seed*13n+n*7n)%23n-11n;at+=a;if(n<=Z){az+=a;sz+=a*(D/n)}if(n>=Z&&n<N)I+=at*(D/n-D/(n+1n));}ck(I===S-A*(D/N)-sz+az*(D/Z),"integral");integral++}
}
for(let l=1n;l<=1000n;l++){let P=400n*l*l+320000n*l+128000000n,Pp=800n*l+320000n;ck(P-400n*Pp===400n*l*l,"derivative polynomial");ck(P<=128320400n*l*l,"endpoint polynomial");poly++}
for(let C=1n;C<=80n;C++)for(let v=5n*C;v<=5n*C+30n;v++)for(let r=0n;r<=4n;r++){ck(C*(r*v+1n)<=v*v,"scale");budget++}
ck(400n*2n*2n+320000n*2n+128000000n-400n*(800n*2n+320001n)!==400n*2n*2n,"bad derivative");negative++;
ck(1n*(4n*1n+1n)>1n,"missing scale guard");negative++;
return {weight,abel,integral,poly,budget,negative,total:weight+abel+integral+poly+budget}
}
console.log(check())
```

## Integrated reading order and open obligations
Read this analytic chapter immediately before QDChoice in IX; character equivalence before changeLevel; induced evaluation/Iwahori before BoundB; local bridge conjugacy before transported weights; uniform levels before finite group identification; Fourier/Haar before singular extension; chart factorization and boundary decay before geometric comparison; StarAll before counting; positive-part before final Landau contradiction. Editorial joins only, not authenticated root-role edges.
1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt, native Signature/BoundB and representation leaves.
2. RecTExists/VWin, host design: QDChoice and analytic approximation conditional; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit and StagePow/ShortNorm.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH, local closure and attribution.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, native boundary/GAGA/slope/tDetD and low-prime/LinkG; StarAll branch estimates.
6. Zero-density, truncated explicit formula, native power-saving/sqrt-log and primitive psi0, Mertens, prime mean-square/count suppliers; final Landau contradiction and exact analytic joins.
7. Source/build/export correspondence, typed projection/challenge, metadata policy, independent kernel replay/axioms. Reported mixed-export denominator 1,484,705 declarations; authenticated translated numerator unknown. Peer RUN13 reports 47/47 requests, 3044 type, 10157 value, 2 structural edges, not full root coverage.
8. Independent proof/citation audit, interchapter joins and root reachability. Full translation incomplete.

Preflight: AGENTS, state/log/protocol/continuity excerpts, CI #390 (physical only), swarm, handoff, expansion, spine, preceding editor and recent peer resumes; actual source retrieved. Blueprint referenced, not reopened. No physics changes. Peer snapshot 712130df1ee577f240234fb9bb090f68623ace0d; pin text match, not independent mathematical verification.
RESUME HERE: reconstruct actual psiChi_bound_of_goodFor and psi_le_of_large with exact zero-window cutoffs, multiplicities, reciprocal norm bounds, errors; then primitive psi0 or ThinChoice if peers already cover these. Formal audit: sign, endpoint, uniform constants, GoodFor namespace, series convergence, imprimitive correction, both conclusion fields and five antecedents. Request role-labelled edges for g_chi_approximation_sum, gChi_add_sum_bound, gChi_add_sum_eq, tail_and_sum_bound, tail_le, psi_tail_bound, logDerivSeries and both psi bounds. HANDOFF TO formal audit, integration, dependencies, kernel, math, literature and all specialists. Project OPEN.

## Peer code/data links (not run here)
- [audit/2026-11-24_triv_endpoint_bound_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_triv_endpoint_bound_audit.mjs)
- [dependencies/rh_root_path_frontier_reconcile.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_root_path_frontier_reconcile.mjs)
- [integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.json](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.json)
- [integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.mjs)
- [math/verify_mulchar_unit_equivalence.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mulchar_unit_equivalence.py)
- [specialists/kernel_extractor/run13_downstream_replay.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run13_downstream_replay.mjs)
- [specialists/on_acceleration/role_reverse_run13.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/role_reverse_run13.mjs)
- [structure/2026-11-24_1924_terminal_motif_exact_order.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_1924_terminal_motif_exact_order.mjs)

## Peer chapters, verbatim


---

[integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.md) — blob cd4d7ce8c839b7462c21d026c1310a4550930f1b

# Induced evaluation and principal congruence Iwahori factorization — integration 19:00
2026-11-24. SOURCE-MATCHED / PARTIAL. Single contribution: expand two concrete suppliers of previous BoundB chapter. Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd. No source migration or independent Lean replay.

## Integration and peer handoff
Read SWARM_PROTOCOL first, AGENTS, state/log/protocol and continuity excerpts, HANDOFF_QUEUE, EXPANSION_15_LANES, previous 18:00 chapter, latest editor IX, peer RUN12 notes and core lane current commits/files. Root log/protocol guesses returned 404, recovered actual runner paths. Oversized lane-list request exceeded call limit; split. First line-anchor check failed because an induction declaration anchor was off by one; corrected to pinned blob plus exact anchor text. Some core scripts lack explicit RESUME HERE in tails; not an exhaustive nested Grok archive or blueprint reread. General CI checkpoint 388 PASS (45461125363), not RH validation.

Master reading index: [editor IX](../specialists/proof_editor/2026-11-24_1856_INTEGRATED_MANUSCRIPT.md) links I–VIII; append this chapter to [18:00](2026-11-24_1800_SIGNATURE_AND_UNITARY_BOUND.md). Editor counts 125 primary + 10 supporting entries before this contribution, not unique declarations. Reported full conservative export denominator 1,484,705 declarations; translation numerator not authenticated. No percentage computed.

| Lane | Observed commit | Next obligation |
|---|---|---|
| dependency | 79b0d65 | combined 47-target role projection |
| structure | 66ca007 | scoped out-tree role ordering |
| math | e8fb8e9 | MulChar.ext_iff / ofUnitHom |
| audit | 2c70f96 | derivative producer and domain controls |
| acceleration | ecf1b8d | combined role edges before reverse invalidation |
| kernel | c251ffa | downstream RC1 job status; per-role masking |
| prime | 9a24efb | residue-characteristic primality and StarAll |
| Landau | 29e3ad3 | kernel maximum and signed window inequalities |
| theta | 72b9ed7 | Afc.fcConj_of rational conjugation and ratV branch |
| Galois | 93e16ad | BridgeInd.exists_conj / repE_conj |
| boxes | 4aadbc7 | caller of exists_finite_group_goodSet_levels_characters |
| literature | bfcba16 | sec_smooth and chart factorization |
| geometry | 5c10037 | VuOnto.tendsto_arc_readsZ and both guards |
| editor | a22b20b | integrate latest conditional chapters |
| integration | 8d55d21 | this chapter |

Kernel reviewer RUN12 shows in 64 abstract role-frontier pairs that combined equality can hide per-role omissions. Native downstream propagation not yet tested in that note; no inference of kernel defect or independent approval of this chapter. No URT speed claim.

## 1. Smooth induction evaluation (ProdIrr.exists_mem_ind_apply_one, L16–72)
Let G be a topological group, with every identity neighborhood containing an open subgroup K. Let P≤G with subtype topology, W complex vector space, sigma a smooth representation of P, u any vector. No compactness, admissibility, nontriviality or irreducibility is assumed. Smoothness supplies an identity neighborhood N in G such that sigma(p)u=u for p∈P∩N. Choose K⊂N, so P∩K fixes u. Define F(g)=sigma(p)u if g=pc, p∈P,c∈K; otherwise F(g)=0. Retain classical witness choice.

If pc=p'c', then p'^(-1)p=c'c^(-1)∈P∩K. Apply sigma and multiply by sigma(p') to get sigma(p)u=sigma(p')u. Definition independent of factorization; PK need not be subgroup, K need not normal. For h∈P and g=pc, hg=(hp)c, so F(hg)=sigma(h)F(g); if g is outside PK but hg inside, multiply by h^(-1), contradiction. For c0∈K, g=pc implies gc0=p(cc0); if gc0 inside PK but g outside, multiply by c0^(-1) on right, contradiction. Thus F(gc0)=F(g) everywhere. Right K invariance and openness give membership in smoothPart(ind P sigma). Evaluate F(1)=u. Every value either zero or sigma(p)u; preserve this stronger conclusion.

## 2. Normalized parabolic induction (L82–107)
Let k nonarchimedean local field, α finite linearly ordered block index, m(a) finite with decidable equality, n finite with decidable equality, e:(Σ a,m(a))≃n, rho smooth Levi representation on complex W. Take G=GL(n,k), P=parab(k,e). Identity neighborhood basis from CentralExponent.exists_cong_subset and isOpen_cong (open imports). Levi projection continuous because each projected forward and inverse matrix entry is a block entry of p and p^(-1); use compatibility of projection with inversion and product topology. Use sigma=(rho twisted by deltaHalf) composed with leviProj. Smoothness uses isSmooth_comp, isSmooth_twist and isSmoothChar_deltaHalf (open imports). Section 1 supplies f∈IndSp e rho with f(1)=u and every f(g) either zero or c·rho(l)u, l=leviProj(p), c half-modulus scalar at p. The nonzero vector and finite-dimensional fixed-space construction in BoundB need separate nontriviality, smoothness and admissibility hypotheses.

## 3. Lexicographic elimination (IwahoriFactorization L17–199)
Let F a field, β:Fin n→α with α linearly ordered, not necessarily monotone β. Order indices by injective key (β(i),i). For current h, pivot a, E_ia=h_ia/h_aa when key(a)<key(i), all other entries zero. Only column a potentially nonzero, E_aa=0, hence E²=0 and (I−E)^(-1)=I+E. Nonzero off-diagonal entry implies β(i)≥β(a); hence I−E in opposite block-upper subgroup. Left multiplication subtracts E_ia times row a.

Abstract theorem assumes K subgroup; every diagonal of every h∈K nonzero; each I−E formed from h∈K belongs to K. Start q=I and process increasing key order (Lean inserts maximum into previously processed finite set). At pivot a current h=qg∈K, so h_aa nonzero. Column a entries below key diagonal vanish by division cancellation. For earlier j, h_aj=0 by key(j)<key(a); all h_ij with key(j)<key(i) already vanish, so the subtraction preserves them. Accumulate q=(I−E)q∈K∩Pbar, h=qg∈K∩P. All columns processed imply block-upper because β(j)<β(i) implies key(j)<key(i). Equal/nonmonotone labels allowed; empty matrix case vacuous.

Assume additionally ordinary and opposite Levi projections preserve K. Put p=q^(-1), h=qg, M1=leviProj_op(p), M2=leviProj(h), both in K∩M (Levi unchanged by reversing order). Kernel identities give M1^(-1)p∈Nbar, M2^(-1)h∈N. Conjugating the first by M1, which normalizes Nbar, gives pM1^(-1)∈Nbar. Define Z=pM1^(-1), Y=M1M2, X=M2^(-1)h. Each belongs to K and respectively Nbar,M,N. ZYX=ph=g. Existence, not uniqueness.

## 4. Principal congruence and order reversal (L218–376)
Over nonarchimedean local F, uniformizer ϖ, multiplicative valuation v, principal congruence K_m, m≥1. Sufficient membership criterion checks BOTH g−I and g^(-1)−I entries have valuation ≤v(ϖ)^m. This makes g and inverse integral by ultrametric inequality since v(ϖ)^m≤1 and I entries integral; then g∈K_m.

K_m⊂K_1⊂Iwahori gives v(h_aa)=1, hence pivots nonzero. For key(a)<key(i), i≠a, so v(h_ia)≤v(ϖ)^m and v(E_ia)=v(h_ia)/v(h_aa)≤v(ϖ)^m. Else zero. I−E and inverse I+E differ from I by ±E; criterion gives K_m membership. Levi projection keeps same-block entries, zeroes cross-block entries; these satisfy same bound, and applying it to g^(-1) gives inverse bound by compatibility of Levi projection with inversion. Both block orders allowed. All four abstract hypotheses supplied, giving ZYX for every g∈K_m. The neighboring theorem for Iwahori itself requires monotone β; not substituted here.

Apply ZYX to g^(-1), invert to get g=x^(-1)y^(-1)z^(-1), exactly X Y Z with factors in the same respective subgroups. This is the order needed by BoundB.zval, not an illicit exchange of noncommuting terms. m≥1 guards pivot method: a level-zero permutation matrix can have zero diagonal (not a general nonexistence claim).

## Evidence
Companion JSON records 21 typed nodes, 25 selected edges, two pinned blobs and 37 checked source anchors; graph checked reachable and acyclic. Executed JS V8 exact regression: {"matrixCases":20241,"pivots":115092,"factorizations":60723,"groupCases":62,"groupEquivariance":936,"groupSmoothness":936,"negative":3}. Matrices over finite quotient rings Z/p^k test congruence, square-zero operations, preservation of prior columns, both factor orders for all tested block labels; S3 subgroup fixtures test independence, covariance and right invariance. Negative guard controls: bad intersection, noncommuting order, zero pivot at level zero. Finite tests not independent proof of general field/topological theorems. Companion script reproduces anchor and arithmetic checks on pinned git checkout; git wrapper not executed locally. No Lean execution, authenticated root membership or axiom closure claimed. New CI verdict pending.

RESUME HERE: trace CentralExponent.exists_cong_subset/isOpen_cong and isSmoothChar_deltaHalf actual pinned imports; then expand leviProj_inv_mul_mem and conj_mem_unipotentRadical. Request authenticated membership and type/value direct edges for GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one, exists_mem_ind_apply_one, GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization', iwahoriFactorization_of_elim and prior BoundB anchors. HANDOFF TO dependencies, kernel, editor, audit, integration. Project OPEN.


---

[math/2026-11-24_mulchar_unit_equivalence.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_mulchar_unit_equivalence.md) — blob 4ec0b4c7b61ba02f25a904e25ea5026a8455cf98

# MATH lane — multiplicative characters are exactly homomorphisms on units

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the pinned Mathlib bridge behind
MulChar.ext_iff, MulChar.toUnitHom, and MulChar.ofUnitHom.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source pin and revision comparison

The RH source is pinned at 40e56bab026552e089d7afcfeff08d2defb9c005. Its lake-manifest.json,
blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f, pins Mathlib at
0df444a360eaa60ab8c11dca51a86af692955474.

| Exact source | Pinned blob | Declaration |
|---|---|---|
| Mathlib/NumberTheory/MulChar/Basic.lean | dc3c465d304326784909c686d278edfa30a75385 | MulChar, ext, toUnitHom, ofUnitHom, equivToUnitHom |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean | 4569ebb8e61f683a9c89877f0cda4d3add4d766d | changeLevel_def, changeLevel_injective |
| RH src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean | d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e | downstream project consumer |

The current RH head inspected on 2026-11-24 is
9282d3a102c4aff0e6026746db2a8990f5d9cddd. Its manifest pins Mathlib at
31ce06eaadf4a200c0e1407c5f10953cf606b8f8. The current relevant blobs are
acae35e68481b6095d7e1c154b0015383a7fe2f9 for MulChar/Basic.lean and
a954549811e3e87c5f4e85b5d37f359ddfc83a81 for DirichletCharacter/Basic.lean. The mathematical declarations and
proof structure below remain unchanged; the visible MulChar edit replaces simplifier names such as
dif_pos/dif_neg by dite_eq_left/dite_eq_right. This is a textual source comparison, not an
elaboration-equivalence proof.

## 1. Exact hypotheses and object

Fix:

- a type A with CommMonoid A;
- a type B with CommMonoidWithZero B.

A multiplicative character chi : MulChar A B is a monoid homomorphism A ->* B plus the additional
field

    map_nonunit' : forall a : A, not IsUnit(a) -> chi(a)=0.

The domain needs only a commutative monoid. The target supplies multiplication, one, and an
absorbing zero. Neither MulChar.ext nor the unit-homomorphism equivalence assumes Nontrivial B.
For a Dirichlet character, A is ZMod n and B is the coefficient monoid R; hence the public
DirichletCharacter definition assumes CommMonoidWithZero R.

This corrects a possible overreading of apply_eq_zero_iff. That later theorem assumes Nontrivial B
to prove the converse chi(a)=0 -> not IsUnit(a). Extensionality uses only the forward structural
rule for nonunits.

## 2. Why values on units determine the whole character

Pinned MulChar.ext has the exact input

    h : forall u : Units A, chi(u)=psi(u)

and concludes chi=psi. To compare values at an arbitrary a : A, split on IsUnit(a).

1. If a is a unit, the witness ha : IsUnit(a) supplies ha.unit : Units A whose underlying value is
   a. Thus h(ha.unit) is exactly chi(a)=psi(a).
2. If a is not a unit, map_nonunit gives chi(a)=0 and psi(a)=0, so the two values agree.

Function extensionality then identifies the structures. The theorem is tagged @[ext]. Mathlib's
extensionality machinery supplies the iff-form used downstream:

    MulChar.ext_iff : (chi=psi) iff
      (forall u : Units A, chi(u)=psi(u)).

There is no separate handwritten ext_iff proof in the pinned file; it is generated from the tagged
ext theorem. The reverse implication is the argument above, while the forward implication is
substitution.

The nonunit-zero field is essential. On ZMod 4, the constant-one monoid homomorphism and the
principal character agree on the units {1,3}, but differ at 0 and 2. The constant-one homomorphism
is not a MulChar because it sends those nonunits to one rather than zero.

## 3. Restriction to the unit groups

For chi : MulChar A B, Mathlib defines

    toUnitHom(chi) : Units A ->* Units B := Units.map chi.

A unit u has an inverse u^-1. Since chi is a monoid homomorphism,
chi(u)chi(u^-1)=chi(1)=1, so chi(u) is a unit in B. The underlying-value equation is definitionally

    coe_toUnitHom chi u : value(toUnitHom(chi)(u))=chi(u).

This is stronger than merely restricting chi as a function: the result records an actual
unit-group homomorphism.

## 4. Extension by zero

Given f : Units A ->* Units B, the pinned noncomputable definition is

    ofUnitHom(f)(a) =
      value(f(ha.unit)) if ha : IsUnit(a),
      0 otherwise.

Classical decidability chooses the unit/nonunit branch. The definition proves all required
structure fields:

- At one, isUnit_one.unit equals the unit-group identity, so f maps it to one.
- For x*y, IsUnit.mul_iff says the product is a unit exactly when both factors are units.
- If both are units, Units.ext proves
  (hx.mul hy).unit = hx.unit*hy.unit; multiplicativity of f then gives
  ofUnitHom(f)(xy)=ofUnitHom(f)(x)ofUnitHom(f)(y).
- If either factor is a nonunit, x*y is a nonunit and the appropriate zero_mul or mul_zero identity
  proves multiplicativity.
- The nonunit branch is definitionally zero, establishing map_nonunit'.

For u : Units A, ofUnitHom_coe states

    ofUnitHom(f)(value(u))=value(f(u)).

No value on a nonunit is chosen freely.

## 5. The two inverse laws

Mathlib packages restriction and extension as

    equivToUnitHom : MulChar A B ≃ (Units A ->* Units B).

For the left inverse, start with chi and compare ofUnitHom(toUnitHom chi) with chi using MulChar.ext.
At a unit u,

    ofUnitHom(toUnitHom chi)(u)
      = value(toUnitHom chi(u))
      = chi(u)

by ofUnitHom_coe and coe_toUnitHom.

For the right inverse, start with f and apply MonoidHom extensionality. At every unit u,

    toUnitHom(ofUnitHom f)(u)=f(u)

after comparing underlying values using the same two lemmas. Therefore restriction loses no
information precisely because MulChar already fixes every nonunit value.

## 6. Exact downstream rewrite in changeLevel_injective

For hnm : n divides m, DirichletCharacter.changeLevel is definitionally

    changeLevel hnm chi =
      ofUnitHom(chi.toUnitHom.comp(ZMod.unitsMap hnm)).

Suppose two changed-level characters are equal. The pinned proof performs

    rw [MulChar.ext_iff] at h

so h becomes equality at every z : Units(ZMod m). After choosing z whose unitsMap image is the
desired y : Units(ZMod n), the exact final line is

    simpa [changeLevel_def] using h z.

Unfolding changeLevel_def and applying ofUnitHom_coe changes h(z) into

    chi.toUnitHom(unitsMap hnm z)
      = psi.toUnitHom(unitsMap hnm z).

Substituting unitsMap hnm z=y yields equality at y, which is the extensionality goal at level n.
The previous MATH chapter separately established the surjectivity that supplies z; it is not
repeated here.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mulchar_unit_equivalence.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mulchar_unit_equivalence.py

Corrected execution output:

    MulChar unit-equivalence regression: OK; report_checks=27, unit_homs=24, multiplicativity_checks=1143, inverse_checks=158, extensionality_checks=70, change_level_checks=1090, negative_control_checks=36, trivial_target_checks=417

The certificate exhausts homomorphisms from Units(ZMod n) into the multiplicative units of F5 for
n=1,...,10; checks extension by zero is multiplicative; checks both inverse laws and unit
extensionality; checks the exact change-level composition formula over divisible nonzero levels;
and executes the ZMod 4 constant-one negative control.

This validates a finite model of the mathematical skeleton. It does not elaborate Lean, recreate
the generated ext_iff declaration in the kernel, or audit imported axioms.

## Failed attempts / limitations

- The first certificate run allowed source level 19 in exhaustive change-level testing and therefore
  attempted to enumerate 4^18 raw functions. It exceeded the 30-second execution window before
  reporting a result. The corrected certificate bounds exhaustive source levels to n<=10 while
  retaining target levels through 20.
- Searching DirichletCharacter/Basic.lean for definitions of ofUnitHom found only their uses.
  They live in its imported Mathlib/NumberTheory/MulChar/Basic.lean.
- Searching the pinned MulChar file for a handwritten declaration named ext_iff finds only uses.
  Its name is generated from @[ext] theorem ext; a text-only declaration search would miss it.
- Equality on units fails for arbitrary monoid homomorphisms: the ZMod 4 constant-one negative
  control agrees with the principal character on units but violates map_nonunit'.
- Nontrivial B must not be added to this theorem. It is required by apply_eq_zero_iff, not by ext,
  ofUnitHom, or equivToUnitHom.
- The finite F5 certificate cannot prove the polymorphic theorem or proof irrelevance for the
  selected IsUnit witness. Those remain supplied by the pinned Lean source and kernel.

## RESUME HERE

Trace the exact generated signature/provenance of MulChar.ext_iff from Mathlib's ext attribute and
reconstruct the Units.map mechanism that produces a target unit, using pinned Lean meta/source
declarations where available. Then return to the next unresolved imported character-box dependency;
do not repeat ofUnitHom, change-level surjectivity, or ind_unique.

**HANDOFF TO:** MATH, dependency, audit, integration.


---

[specialists/character_boxes/RUN13_GROUP_AND_UNIFORM_LEVEL_SUPPLIERS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN13_GROUP_AND_UNIFORM_LEVEL_SUPPLIERS.md) — blob f17a0d2c0e32707b57bc4d36d697f2615cb06f68

# RUN13 — Original suppliers of GrpAt and uniform LevOf
2026-11-24. SOURCE-MATCHED; DONE for the conditional prerequisite construction, OPEN for native antecedents and authenticated Main reachability. No Lean kernel execution or URT speed claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity and research-state/log/protocol excerpts, current CI summary #390 (not an RH check), RUN12 and recent peer handoffs (Galois, theta, Landau, prime, speed, math, integration, geometry, literature; other recent commit metadata checked, not every peer document). RUN12 proved the finite-group identification from GrpAt and LevOf. This note supplies actual upstream constructors of those premises, not a repeat of the identification. The direct caller of the outer wrapper remains unlocated: current GitHub code search for the wrapper and statement import returned zero results; this is not evidence of absence at P. Pinned IwasawaDecomposition directory tree 7501f7939fae16a6d24ad8f55ec8c9857c483a4d has 7769 entries, not truncated, and supplied ExistsLevOfAll. No physics queue/gate change. External blueprint not reread.

## Source and exact quantifiers
P = 40e56bab026552e089d7afcfeff08d2defb9c005, repo leanprover-community/riemann-hypothesis.
1. GlobalTheory.Mem.R3.Model.grpAt_iff (MemLevelOfLocalDepth.lean:130–159): for every X : Stages, px : PreX X.B.toPre, I : ColIn X.B px, with I.Ok, GrpAt X I iff for EVERY k : Fin 2 and v : X.toD7.nd.PlG k, I.C.P.Div k (X.toD7.naut.plGw k v).
2. grpAt_of_grpTrue (161): additionally Top.GrpTrue X.N I.C implies GrpAt X I. It uses hN.pl, not an independent assumption that GrpAt exists.
3. GlobalTheory.MtIn.LevAll.exists_levOf_all (ExistsLevOfAll.lean:17–53): for every X,px,I, given I.Ok and SelHalf I, for every initial subset U₀ and L₀ : LevCh X.toD7 (TupU I U₀) satisfying LevOf X I U₀ L₀, for EVERY subset U of I.ι there EXISTS L : LevCh X.toD7 (TupU I U) satisfying LevOf X I U L. The initial witness is fixed before U is supplied. Not a universal claim without SelHalf. In particular L may depend on U, and L itself is not asserted independent of U.
4. LevOf is a six-field proposition (IsAbsIrrCharCompIff.lean:206–218): L.Is at reference mu0F, exact C, exact xiH indexed by ixOf I U, exact Pg, exact Q indexed by ixOf I U, and beta=(all βV=1 and βX=1). GrpAt (248–255) requires place bijection with division condition, idempotence and centrality of the same e0. Preserve every dependent type and instance.

## Proof A: supply GrpAt without choosing an arbitrary place bijection
Let A_k=nd.PlG k and B_k=(X.B.primes px).vG k; B=B_0∪B_1. mem_vGs_iff follows directly from Finset.mem_union, h.pibar for both k, and Fin.exists_fin_two. The reverse implication assumes H(k,v): Div k (plGw k v). Define φ(k,v)=plGw(k,v) as a point of B, whose membership follows from H. By h.pibar it lies in B_k. If φ(k,v)=φ(k',v'), apply absolute norm. hPr.vG_norm identifies the two norms with g(k),g(k'). hPr.g_ne forces k=k' (Fin 2 case analysis); then native plGw_inj gives v=v'. For surjectivity, for any P∈B use mem_vGs_iff to choose k with Div k P. The restricted map A_k→B_k is injective; card_PlG, vG_card, card_Tau show equal finite cardinalities. Hence it is surjective and P has a preimage. Equiv.ofBijective gives the required bijection and retains the original place identity and division proof. Forward implication simply substitutes the place identity in GrpAt.pl. This constructs the *same* plg required by RUN12, with no extra premises. hPr comes from base_fields_primes_ok; its proof delegates to BasePrimes.primes_ok.

The other two fields are not supplied by the bijection. The original theorem GoodLatCompare.goodSeriesIdempotent_central_idempotent (IsCentralIdempotentOfGoodSeriesIdempotent.lean:342–367) uses good_sum with the indexed local eSer family, eSer_idem, eSer_central, eSer_orth, and injectivity of the monic polynomial coefficient encoding. In ordinary algebra: for a finite product of groups, let E_a be the tensor of local central pairwise orthogonal idempotents selected by tuple a. Then E_a E_b=0 for distinct tuples and E_a²=E_a. The coefficient expansion in lines 354–361 identifies e0 with the sum over goodTuple a of E_a. Each term is central; multiplying the sum by itself retains exactly its diagonal terms, proving e0²=e0. The Lean proof obtains centrality hc and the selected-term identity hm from good_sum, then uses Finset.mul_sum and hm on selected terms, zero on others. The local idempotent and orthogonality suppliers and the good_sum implementation are retained as dependencies, not claimed proved here. Finally grpAt_of_grpTrue obtains H from hN.pl.

## Proof B: from one admissible level to every selected subset
SelHalf I (IsAbsIrrCharCompIff:84–86) says: for every a,b and P∈I.Q a, P'∈I.Q b, if both lie over the same rational prime p, their ideals have identical contraction to O_K. It is an implication, not existence of a ramified place. The helper exists_under_of_selHalf (MemLevelOfLocalDepth:58–64) fixes p prime and splits on existence of a ramified occurrence over p. If present, choose one P' and use SelHalf plus HeightOneSpectrum.ext to make its contraction the common lower prime for all occurrences. If absent choose I.C.P.pb 0; the required universal implication is vacuous. This preserves the empty case and the order ∀p ∃ lower prime ∀ occurrences. It does not assert the same lower prime for different p.

Fix arbitrary U. From I.Ok obtain htw via isTwist_of_reads, hram via RamQ.ram_iff, and hQr (every P in I.Q a is ramified); twistPlaces supplies the requisite place conditions. Apply LevelChoices.exists_levCh to the frame, TupU I U, reference mu0F, the functions t↦I.xi(ixOf I U t) and t↦I.Q(ixOf I U t). Its inputs are injectivity from xi_inj and ixOf_injective, reference character one from ixOf_mu0F, the three htw conditions, both hpl conditions, the common lower prime for each of the two designated primes pde,pde' (primality is explicit), and hram. Obtain new provisional L0 with h1,h2,h3,h4 (the unused returned component is not a new assumption). h4.Pg identifies its place set with the designated division places. Rewrite by h1 and use mem_vGs_iff to get hPg: L0.Pg=B.

The final L is the new L0, except that all eight frame/adelic fields ΛY,ΛW,ΛX,ΛV,βY,βW,βX,βV are copied from the original L₀. Its character and level-set fields remain the new ones. The proof explicitly reconstructs the L.Is record: the 15 non-frame fields h4.mu0,eta,xi,xi_inj,xi_base,xi_fin,xi_triv,xi_tame,Pg,Q_pl,Q_off,Q_de,Q_ram,chi,xiR from new h4; four frame fields from hL₀.is.βY,βX,βV,βW. Then C=h1, xiH=congrFun h2, Pg=hPg, Q=congrFun h3, beta=hL₀.beta. This exact field-by-field split explains why the new character selection need not alter the existing coordinate frames. No induction over subsets is needed: direct universal construction. No claim that every arbitrary twist has an admissible level without the original hypotheses.

Initial level: MemLevelOfLocalDepth:96–128 contains exists_levOf_of and exists_levOf_empty (I.Ok alone gives a LevOf for U=∅). The latter uses ixOf_empty, reference character one, empty twist primes, vacuous place conditions, and LevelChoices.exists_levCh; the former normalizes βX,βV to identity and constructs the two coordinate lattices using stdLat_diag and isSDFrame_std. This is a real source producer, not an extra premise, but the imported LevelChoices.exists_levCh and standard-frame proofs still need expansion. Combining these named theorems, for fixed X,px,I with I.Ok and SelHalf I, one may obtain ∀U,∃L,LevOf X I U L by choosing the empty-subset witness first. This composition is a human consequence of the two source theorems, not an asserted separately named Lean declaration or root edge.

## Source checks and upstream comparison
Checked 72 source/hash assertions in connector V8 (five pinned blobs + literal anchors, one current-head blob check). Four complete theorem texts (4/4) are byte-identical after trim in current H=9282d3a102c4aff0e6026746db2a8990f5d9cddd: mem_vGs_iff, exists_under_of_selHalf, grpAt_iff, grpAt_of_grpTrue. H is unchanged from RUN12. Current MemLevelOfLocalDepth blob 54c6ca369a5a57139d8d9e86f427d4988f5db026, changed from P: original exists_levOf_of and exists_levOf_empty no longer in this file; ExistsLevOfAll original H path returned 404. Relocation versus removal unresolved; do not assert semantic equivalence or proof failure.
Reproduce the exact pinned anchor checks in a local upstream clone using Python (git show and rev-parse). This wrapper was not run in the connector; equivalent literal tests above were.
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
B="src/Development/AbelianVarietyTheory/"
rows=[["Definitions/AutomorphicMembership/MemLevelOfLocalDepth.lean","647ed4afd9b496566827be96b8f60b38e1121ed2",["theorem mem_vGs_iff","rw [Finset.mem_union, h.pibar, h.pibar, Fin.exists_fin_two]","theorem exists_under_of_selHalf","HeightOneSpectrum.ext (h a b P ha P' hb","I.C.P.pb 0","theorem exists_levOf_empty","theorem grpAt_iff","goodSeriesIdempotent_central_idempotent","hPr.vG_norm","hPr.g_ne","X.toD7.naut.plGw_inj","Fintype.bijective_iff_injective_and_card","hPr.vG_card","X.toD7.what₂.card_Tau","Equiv.ofBijective φ","theorem grpAt_of_grpTrue","hN.pl"]],["Definitions/AutomorphicMembership/IsAbsIrrCharCompIff.lean","01f74a4d9556ee699e36255b4ab59491e35ecd23",["def SelHalf","p.Prime","P.asIdeal.comap","structure LevOf","is : L.Is","C : L.C","xiH : ∀ t","Pg : L.Pg","Q : ∀ t","beta : (∀ i","structure GrpAt","pl : ∃ plg","idem : IsIdempotentElem","cen : X.toD7.ntypes.e0"]],["Proofs/IwasawaDecomposition/ExistsLevOfAll.lean","05a79753fd361dd3c71c966f8c67c974ac4e0d74",["theorem exists_levOf_all","I.Ok → SelHalf I","LevOf X I U₀ L₀ → ∀ U","isTwist_of_reads","RamQ.ram_iff","TwistPlaces.twistPlaces","GlobalTheory.LevelChoices.exists_levCh","ixOf_injective I U","exists_under_of_selHalf","X.B.host.pde_prime","X.B.host.pde'_prime","have hPg","Model.mem_vGs_iff","ΛY := L₀.ΛY","ΛW := L₀.ΛW","ΛX := L₀.ΛX","ΛV := L₀.ΛV","βY := L₀.βY","βW := L₀.βW","βX := L₀.βX","βV := L₀.βV","hL₀.is.βY","hL₀.is.βX","hL₀.is.βV","hL₀.is.βW","hL₀.beta"]],["Proofs/DivisorProofs/IsCentralIdempotentOfGoodSeriesIdempotent.lean","6b6aeb66f1163fde535a29312c20333b8aef1798",["theorem goodSeriesIdempotent_central_idempotent","good_sum","D.ntypes.eSer_idem","D.ntypes.eSer_central","D.ntypes.eSer_orth","Finset.mul_sum","rw [hm, if_pos ha]"]],["Proofs/IwasawaDecomposition/BaseFieldsPrimesOk.lean","352c685ba0759677354be0a2628666a2fb268dcb",["theorem base_fields_primes_ok","(GlobalTheory.BasePrimes.primes_ok B X).1"]]]
for p,h,anchors in rows:
    path=B+p
    assert subprocess.check_output(["git","rev-parse",P+":"+path]).decode().strip()==h
    s=subprocess.check_output(["git","show",P+":"+path]).decode()
    for a in anchors:
        assert a in s,(p,a)
print("pinned source anchors checked")
```
Finite logical regression executed in connector V8: {"maps":154,"half":27,"neg":3}. These are finite set models of injectivity/cardinality and the common-contraction guard, NOT native number-field calculations or a Lean replay. No assumptions removed, no runtime acceleration claimed. Reproduce in Node:
```js
function regress(){
 const assert=(v,m)=>{if(!v)throw Error(m)};
 let maps=0,half=0,neg=0;
 // enumerate all functions between equal-cardinality labelled finite sets; use only injective ones.
 for(let n=0;n<=5;n++){
  let accepted=0;const lim=n===0?1:n**n;
  for(let code=0;code<lim;code++){
   let x=code;const a=[];for(let i=0;i<n;i++){a.push(x%n);x=Math.floor(x/n)}
   if(new Set(a).size!==n)continue;
   accepted++; const b=a.map(v=>n+v);
   const all=[...a,...b];assert(new Set(all).size===2*n,"union injection");
   assert(Array.from({length:2*n},(_,i)=>i).every(i=>all.includes(i)),"union surjection");
   maps++;
  }
  let fact=1;for(let i=2;i<=n;i++)fact*=i;assert(accepted===fact,"permutation count");
 }
 // two possible contractions, 3 labelled potential occurrences; absent, under 0, under 1.
 for(let c=0;c<27;c++){let x=c,ys=[];for(let j=0;j<3;j++){ys.push(x%3-1);x=Math.floor(x/3)}
  let present=ys.filter(y=>y>=0);let pair=present.every(y=>present.every(z=>y===z));
  let ex=[0,1].some(z=>present.every(y=>y===z));assert(pair===ex,"SelHalf equivalence");
  if(pair){let w=present[0]??0;assert(present.every(y=>y===w),"witness")}
  half++;
 }
 assert(new Set([0,0]).size!==2,"drop family distinctness");neg++;
 assert(new Set([0]).size!==2,"drop equal cardinality");neg++;
 assert(![0,1].some(z=>[0,1].every(y=>y===z)),"drop SelHalf");neg++;
 return {maps,half,neg};
}
console.log(regress())
```

RESUME HERE: follow the actual import/declaration of GlobalTheory.LevelChoices.exists_levCh from the pinned ExistsLevOfAll and MemLevelOfLocalDepth chain, reconstruct the level construction's two designated-prime cases and standard-frame conditions; locate original caller of exists_finite_group_goodSet_levels_characters when reverse import index available. Request authenticated role-labelled edges for GlobalTheory.Mem.R3.Model.grpAt_iff, grpAt_of_grpTrue, exists_under_of_selHalf, exists_levOf_empty, exists_levOf_of, GlobalTheory.MtIn.LevAll.exists_levOf_all, GlobalTheory.GoodLatCompare.goodSeriesIdempotent_central_idempotent, LevelChoices.exists_levCh, plus RUN12 wrapper. Keep initial Top.GrpTrue, SelHalf, ReadL, MjHTie, IdxDefs suppliers and Keep/Pins connection open. HANDOFF TO dependencies, kernel, integration, editor, theta, Galois, audit. Project OPEN.


---

[specialists/galois_representations/RUN13_BRIDGE_CONJUGACY_AND_LOCAL_TRANSPORT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN13_BRIDGE_CONJUGACY_AND_LOCAL_TRANSPORT.md) — blob c097fce0d25615494340327c931e4f15d7cf71bc

# Run 13 — Local bridge conjugacy and exact representation transport
2026-11-24. RESULT: SOURCE-MATCHED / DONE for the two local bridge comparison lemmas and their immediate geometric-field suppliers; PARTIAL for the full Galois → nonvanishing chain. No Lean replay or URT speed claim.

## Continuity
Read AGENTS, research-state/log/protocol and continuity excerpts, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run 12; inspected latest commits and peer handoffs (theta Fourier/Haar, Landau uniform window, prime uniform counting, integration Iwahori, editor prime pair, geometry extension readout, math change-level, character boxes finite groups, literature smooth reducedness, acceleration reverse invalidation; structure/dependency/kernel/audit latest commit scopes inspected, not their full JS artifacts). No overlap with this task. Latest Cathedral CI summary 19:19:41Z run 45465413878 PASS, not RH evidence. Blueprint link and its limitations read in queue; PDF not reread this session. Run 12 leaves GlobalTheory.MemLoc.frob_laws and FrobLaws.exists_ext and EmbOrbitAlt open; this run neither solves nor deletes them. No physics files or queues changed.

## Provenance
Source leanprover-community/riemann-hypothesis.
P=40e56bab026552e089d7afcfeff08d2defb9c005.
H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by repository commit listing today; unchanged since Run 12).
Both files under src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/.
A=LocalIndepBridge.lean, P blob ff48b8f2c49031d3b2654a02a205535e1aa94206, H blob 04ecdc8caaa6393d4e692129dd97c0a53f902beb.
B=FiniteDimensionalAdjoinRange.lean, P blob ed59aaa465d09e1db63c3b92de8bcba34a59d712, H blob 48a35a7ff871d18c56cee54f4e7217a9465c5897.
A exact pinned source https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean
B exact pinned source https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalAdjoinRange.lean
Consumer C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean, P blob ffdce791714cb11064760245f465f9ba78449bbc; imports A directly (line 6). See Run 12 for exact C consumer bodies and H hash.

## 1. Identify the actual finite local fields (A14–28, B171–187)
Fix prime l, number field E, field Omega with E-algebra, algebraic local closure Om(l) of Q_l. A LocBridge B has ring embedding j:Omega→Om(l), finite extension K=B.Kw inside Om(l), image of E contained in K (j_E), and each element of K lies in closure of j(E) (j_dense). The coefficient algebra O is a commutative ring with Z_l-algebra and topology; the bridge uses a subgroup Gw of Aut_E(Omega).
Put S=Q_l(j(E)). It is finite dimensional over Q_l: choose the finite Q-basis b_i of E, and use x=sum_i a_i b_i to show S=Q_l(j(b_i):i). Every j(b_i) is algebraic over Q_l because Om(l) is algebraic; adjoining finitely many integral elements gives finite dimension. B.finiteDimensional_adjoin_range uses exactly this argument, not an assumption that j(E) itself contains Q_l.
S is closed in the norm topology of Om(l) by closed_of_finiteDimensional. Thus closure(j(E))⊆S and j_dense yields K⊆S. Conversely j_E and adjoin_le_iff yield S⊆K. Therefore K=Q_l(j(E)) (BridgeInd.kw_eq_adjoin). No completeness of Om(l) itself is required.

## 2. Construct the conjugating automorphism (B77–156)
Three genuine suppliers, not an abstract uniqueness-of-embedding assumption:
(a) PlaceBridge.denseRange_embedding: if Omega is algebraically closed, j(Omega) is dense in Om(l). For a∈Om(l) and δ>0 choose its monic minimal polynomial f over Q_l, degree n>0. Set ε=(δ/max(|a|,1))^n/(n+1)>0. Approximate its coefficients by rationals to get a monic polynomial g of exactly the same degree using exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt and Padic.denseRange_ratCast. The root perturbation theorem exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt gives a root b of the image of g with |a-b|<δ after the displayed ε normalization. Since g splits in Omega and ring-map compositions from Q coincide, roots_map identifies b=j(y) for some y∈Omega. This proves density for every a and δ. The two polynomial approximation/root estimates are actual imported leaves and are not reproved here.
(b) PlaceBridge.norm_eq_of_le_one_iff: suppose j,j' have the same unit ball for all x∈Omega. For b≠0 apply the hypothesis to a/b. This gives |j(a)|≤|j(b)| iff |j'(a)|≤|j'(b)|, while b=0 follows by injectivity. The resulting equivalent real absolute values are powers of one another with a positive real exponent c (AbsoluteValue.isEquiv_iff_exists_rpow_eq). Evaluate at l. Both embeddings fix l, and 0<|l|<1, so |l|^c=|l| forces c=1 by injectivity of real powers. Thus |j'(x)|=|j(x)| for all x. The same unit ball does not in general force equality without this calibration: |·| and |·|² have identical unit balls but unequal nonunit values.
(c) PlaceBridge.exists_algEquiv: given dense j and norm equality, endow Omega with the norm induced by j. Both j and f=incl∘j' into the complete p-adic field C_l are isometries. Extend f along j by IsDenseInducing.extendRingHom to a continuous ring hom t:Om(l)→C_l, satisfying t(j(x))=f(x). On the rational numbers it agrees with the standard inclusion; continuity and density of Q in Q_l make it Q_l-linear as a ring map, hence an algebra hom. Restrict to the normal algebraic extension Om(l)/Q_l by restrictNormal' to obtain g∈GQ(l)=Aut_{Q_l}(Om(l)); the commutation lemma gives g(j(x))=j'(x). Important: extension is into C_l, not an unjustified extension into the noncomplete algebraic closure. The uniform extension, normal restriction and absolute-value power theorem remain imported obligations.

## 3. BridgeInd.exists_conj (A40–57)
Now require Omega an algebraic closure of E, a valuation subring A of Omega, two local bridges B,B' on the same decomposition group Dec(A/E) with (possibly different) commutative Z_l-algebras O,O' and topologies, and both hB:Induces B, hB':Induces B'. These hypotheses give |j(x)|≤1 iff x∈A iff |j'(x)|≤1 for ALL x. Section 2 supplies g. By Section 1 and transport of field adjunction:
K'=Q_l(j'(E))=g(Q_l(j(E)))=g(K).
Consequently x∈K iff g(x)∈K'. Forward uses witness x for membership in the image; reverse takes y∈K with g(y)=g(x) and uses injectivity. The output is the simultaneous existential witness (g, hg, hK), not separate unrelated g's for the two conclusions. The field map g fixes Q_l; coefficient inclusions need not be identified with this automorphism.

## 4. Conjugating the fixing subgroups (A69–84)
Assume finite extensions K,K' and g with hK: x∈K iff gx∈K'. For h∈GK(K) and y∈K', g^{-1}y∈K, hence (ghg^{-1})(y)=g(h(g^{-1}y))=y. Thus ghg^{-1}∈GK(K'). Conversely for h'∈GK(K') and y∈K, gy∈K', so g^{-1}h'g(y)=y. These are the two native mem_GK_conj/ mem_GK_conj_inv lemmas. Preserve membership witnesses in the subgroup types; this gives a group identification, not equality of the subgroups as subsets.

## 5. Exact descent of the local representation (A319–335)
For B and B' with SAME Gw (not necessarily Dec here), the group isomorphisms e:Gw≃GK(K), e':Gw≃GK(K') obey the defining compatibility e(s)(j(x))=j(s(x)), and likewise for e',j'. Assume hg:g∘j=j'. For h∈GK(K), h'∈GK(K') with h'=ghg^{-1} in GQ(l), and every x∈Omega,
j'(e'^{-1}(h')(x))=h'(j'(x))=ghg^{-1}g(j(x))=g(h(j(x)))=g(j(e^{-1}(h)(x)))=j'(e^{-1}(h)(x)).
Injectivity of j' implies pointwise equality of global automorphisms and hence e'^{-1}(h')=e^{-1}(h) (e_symm_conj).
For any finite coefficient extension L and rank m, and common monoid representation r:Gw→GL_m(L), the local representation repE is defined using the inverse of e and the matrix action. Substitute the preceding equality in the actual definition: B'.repE(L,r)(h')=B.repE(L,r)(h) (repE_conj). No scalar conjugation of r, continuity, semisimplicity or potential semistability required in this last lemma itself; they remain required by the Run 12 parameter theorem where stated. The same r and same L are crucial; equality need not hold for unrelated representations.

## 6. Source edges and limits
C.wdAt_eq uses BridgeInd.exists_conj, then BridgeInd.repE_conj to discharge the conjugated representation hypothesis of C.wdPst_conj. C.exists_map_conj uses BridgeInd.e_symm_conj to transport Weil actions. These are source-call edges, not kernel-authenticated dependencies. Together with Run 12 they show precisely how two local bridges from one global representation give the same WD parameter after enlargement and monodromy rescaling under the stated potential semistability and dimension hypotheses. No remaining missing supplier is eliminated by these identities. A also proves the de Rham filtered multiplicity transport (mem_DdR_conj, mem_FildR_conj, multV_conj); not translated in this run. External caller of wdAt_indep_bridge remains unlocated: repository code search for exact name returned zero results, not proof of absence. The actual role-labelled root path to Main and the deeper analytic nonvanishing theorem remain OPEN.

## 7. Executed source checks
Two native files at two revisions fetched using GitHub connector. JS in this session ran 48 pinned declaration-anchor assertions across ten declarations; all passed. Then corrected explicit-line-range comparison (an inserted blank line in H had prematurely truncated the initial slice): all 10 whitespace-normalized full declarations matched, 9 exact. Four file blob IDs checked. Only whitespace insertion inside finiteDimensional_adjoin_range among these ten ranges; other import/section changes are not covered. No synthetic simulations or counted arithmetic exercises. No Lean compilation, axiom audit, independent kernel path, measured URT improvement, or full RH completion.
Source comparison reproducible with Python stdlib in a clone containing both commits. This Python equivalent is supplied but not separately executed; the JS comparisons above were executed. O(total text read plus selected slice lengths) for fixed ranges, no complexity claim about whole proof.
```python
import subprocess, sys
repo = sys.argv[1]
P = "40e56bab026552e089d7afcfeff08d2defb9c005"
H = "9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base = "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
files = [
 ("LocalIndepBridge.lean","ff48b8f2c49031d3b2654a02a205535e1aa94206","04ecdc8caaa6393d4e692129dd97c0a53f902beb",
 [(14,28,59,73),(40,57,85,102),(69,76,114,121),(78,84,123,129),(319,330,360,371),(332,335,373,376)]),
 ("FiniteDimensionalAdjoinRange.lean","ed59aaa465d09e1db63c3b92de8bcba34a59d712","48a35a7ff871d18c56cee54f4e7217a9465c5897",
 [(77,105,130,158),(107,130,160,183),(132,156,185,209),(171,187,224,241)])]
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
exact = total = 0
for file, ps, hs, ranges in files:
    path = base+file
    assert git("rev-parse",P+":"+path).strip()==ps
    assert git("rev-parse",H+":"+path).strip()==hs
    p,h = (git("show",r+":"+path).splitlines() for r in (P,H))
    for a,b,c,d in ranges:
        x,y = "\n".join(p[a-1:b]),"\n".join(h[c-1:d])
        assert "".join(x.split())=="".join(y.split()),(file,a)
        exact += x==y
        total += 1
        print(x.splitlines()[0],a,c,x==y)
assert (total,exact)==(10,9)
print("10 normalized, 9 exact; text comparison, not Lean verification")
```

## RESUME HERE
Translate A.mem_DdR_conj (P 170 vicinity), A.mem_FildR_conj and A.multV_conj with the actual tensor and filtration identities and transported coefficient embeddings, then locate the native de Rham-weight independence caller. Request authenticated role-labelled edges for GlobalTheory.Pst.BridgeInd.exists_conj, repE_conj, e_symm_conj, kw_eq_adjoin and GlobalTheory.PlaceBridge.denseRange_embedding, norm_eq_of_le_one_iff, exists_algEquiv. Retain the Run 11 fixed-field leaves and external wdAt_indep_bridge caller as open; do not repeat Run 13. HANDOFF TO Galois, integration, editor, dependency, kernel, audit, acceleration, theta. Project OPEN.


---

[specialists/landau_criterion/RUN13_POSITIVE_PART_AND_UNIFORM_WINDOW.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN13_POSITIVE_PART_AND_UNIFORM_WINDOW.md) — blob ea642e7422bf895c4c89455fee53e50a9aff34bd

# RUN13 — positive-part window inequality and uniform coefficient bound

2026-11-24. RESULT: DONE for the local source-matched window-inequality and coefficient assembly; full RH reconstruction OPEN. No independent Lean replay, no new arithmetic window supplier, no URT speed claim.

## Continuity / source provenance

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES; research-state/log/protocol/continuity excerpts, CI summary checkpoint 389 (19:19:41 UTC, general physical checks only), own RUN12; inspected 30 recent commit titles and 9 peer commit file lists, retrieved available RESUME HERE diff lines for prime, acceleration, integration and math. Some dependency/kernel/structure/audit scripts had no handoff lines in the returned patches; editor manuscript not reread in full. External blueprint noted, not reopened. No duplicate of this exact RUN13 task found. No physical gate or baseline Queue changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005. H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, latest upstream commit returned (2026-11-24 18:24:32 UTC, PR #1313 batch 8). Previous H=307cef33f046955ee79dba47e0d828d06496d75f. The H landauWindow blob is unchanged from RUN12. Paths relative to leanprover-community/riemann-hypothesis/src/Development/AutomorphicArithmetic/DedekindLFunctions/:
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872: PoleData, WindowHypU.
- P LandauTheorems/LandauKernelMax.lean blob b230a9e40c3710eac205f32ceb8a44f2d003b647: Deduction.landau_kernel_max.
- P LandauTheorems/landauWindowIneq.lean blob cda93b0185260d72395d2ef2c90314e0fa7128ef: Deduction.landau_window_ineq_int, landau_window_ineq.
- P LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a: Deduction.landau_window_key.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175: L865 kernel_max, L895–897 window_ineq_int, L899–end of member window_ineq, L1023–1056 window_key. Programmatically extracted theorem spans up to next theorem/end Deduction: kernel_max and window_ineq text identical; window_key body identical, header changes theta<1 to theta<2. Integrability proof in H now one line invoking landau_tails_integrable rather than P's exponential majorant. Hashes are GitHub connector blob identifiers. Edges below are source references, not authenticated elaborated type/value edges.

## 1. Pointwise kernel and integrability

For natural k, a>0 and u>=0, set K_k(a,u)=u^k exp(-au)/k!. Since the exponential series at au>=0 contains only nonnegative terms, (au)^k/k!<=exp(au). Multiply by exp(-au) and divide by a^k>0. Then K_k(a,u)<=a^(-k), exactly landau_kernel_max. This also covers k=0 and u=0 with 0^0=1 in the natural-power convention.

For sigma>2, a=(sigma-2)/2>0. The function h(u)=K_k(sigma-2,u) satisfies 0<=h(u)=K_k(a,u) exp(-au)<=a^(-k) exp(-au) on (0,infinity). The majorant is measurable and integrable, with integral a^(-k-1). Hence h integrable by domination, reproducing P landau_window_ineq_int. H uses RUN12's exact whole-domain integrability directly. Neither theorem holds as a convergence statement at sigma=2 for arbitrary k.

Optional sharper estimate (human derivation, not native theorem): for k>=1 the logarithmic derivative of t^k exp(-t) is k/t-1 for t>0. The function vanishes at t=0 and at infinity and maximizes at t=k. Therefore
  K_k(a,u) <= q_k / a^k,   q_k=k^k exp(-k)/k!, 0<q_k<1.
Strict inequality q_k<1 also follows from the other positive exponential-series terms at k>0. Set q_0=1. This refinement does not require Stirling's formula and leaves k=0 unchanged. It can improve the window term below but does not create an arithmetic window or remove a pole premise.

## 2. Native window inequality (all hypotheses)

Let real measurable g satisfy |g(u)|<=C0 exp(2u) for every u>=0. Evaluation at 0 implies C0>=0. Let sigma>2, theta<sigma (theta need not be positive for this LOCAL lemma), U>0, V real, k natural and gamma real. W=[U,V] is measurable and is a subset of D=(0,infinity); if V<U it is empty. R satisfies integrability of R(u)exp(-theta u) on W and, pointwise on W, R>=0 and g<=R. Do not require g>=0 or R>=0 outside W.

Put w=K_k(sigma,u), h=K_k(sigma-2,u),
  A_gamma=integral_D g(u) w(u) exp(-i gamma u) du,
  A_0=integral_D g(u) w(u) du (real).
The factorial is nonzero. Since |g|w<=C0 h and h integrable, |g|w, gw and the complex integrand are integrable (measurability, norm domination); taking the real part of the real-axis complex integral indeed gives A_0. The triangle inequality for the Bochner integral gives |A_gamma|<=integral_D |g|w, because the oscillatory factor has modulus 1.

**Core identity**: |g|+g=2 max(g,0). Consequently
  |A_gamma|+A_0 <= 2 integral_D max(g,0) w.
Split at the measurable W (endpoints do not matter). On W, g_+<=R (BOTH R>=0 and g<=R are needed), and
  w = K_k(sigma-theta,u) exp(-theta u)
    <= (sigma-theta)^(-k) exp(-theta u).
Off W, g_+ w <= |g|w <= C0 h. Both upper majorants are integrable on their respective domains by the stated assumptions. Integral monotonicity, then subtract A_0, yields exactly the native statement:
  |A_gamma| <= 2/(sigma-theta)^k integral_W R exp(-theta u)
                  - A_0 + 2 C0 integral_(D\\W) h.
Equivalently keep +A_0 on the left. This is the complete mathematical reason for the factor 2C0 and the signed real term. No estimate of |A_0| is substituted. The factor 2 is necessary in the pointwise positive-part identity (take g>0 and R=g); this does not assert global sharpness of the full theorem. Negative g is allowed and contributes zero to g_+. The stronger kernel estimate replaces ONLY 2/(sigma-theta)^k by 2q_k/(sigma-theta)^k in the displayed bound; no other part changes.

## 3. Uniform window coefficient assembly: native landau_window_key

P requires 0<theta<1, H 0<theta<2, both delta>0. PoleData contains seven obligations: meas, growth, laplace, pos, diff, iso, pole. The key uses meas/growth/laplace (landau_coeff) only, but the other four are needed later. In particular the pole field includes nonzero residue, real positive residue with zero imaginary part at a real pole, and analytic local remainder; no exceptional real zero is discarded.

WindowHypU: for EVERY eta>0 and EVERY real U0 there exist real U>=U0 and R such that on W=[U,(1+delta)U] R exp(-theta u) is integrable, R>=0, g<=R and integral_W R exp(-theta u)<=exp(eta U). This is an input, not an output.

By landau_tails (RUN12), choose sigma>2 and C_tail fixed from delta, before eta and U0, so for every U>=1 some natural k>=U has integral_(D\\W) h <= C_tail/sigma^k. Choose C0 from the growth field, nonnegative as above. Set C_key=2+2 C0 |C_tail|. Now fix arbitrary eta>0 and U0; use WindowHypU at max(U0,1), then choose k from landau_tails at that U. These same U,R,k work for EVERY gamma, not separately for different gamma. Because 0<theta<2<sigma (or P's stronger theta<1), 0<sigma-theta<=sigma; eta U>=0. Thus
  C_tail/sigma^k <= |C_tail| exp(eta U)/(sigma-theta)^k.
Even if C_tail were negative the first inequality to |C_tail|/sigma^k is valid; no sign on C_tail presumed. Multiply by 2C0>=0. Apply section 2 and the window cap, obtaining
  |A_gamma|+A_0 <= C_key exp(eta U)/(sigma-theta)^k.
By landau_coeff (RUN11), A_gamma=(-1)^k Phi^(k)(sigma+i gamma)/k!, and A_0 is the real part of the analogous real-axis coefficient. Their Laplace integral representations are legal at both points since real part sigma>2. This gives the exact source conclusion with existential sigma,C_key first, then universal eta,U0, existential U,k and universal gamma last. The local lemma in section 2 only needs theta<sigma, but this tail comparison specifically needs theta>=0. The H theorem allowing arbitrary theta later must use its separate reweighting argument (RUN5); do not silently generalize this calculation. Delta>0 and 0<theta<1 remain required in the pinned outer chain.

Supplemental: by RUN12 the tail can instead be bounded by C' exp(-cU)/sigma^k with c>0. The same native choices of k give
  |A_gamma|+A_0 <= [2 q_k exp(eta U)+2 C0 C' exp(-cU)]/(sigma-theta)^k.
This is a mathematical refinement conditional on the same WindowHypU and tail construction, not independent proof of zero exclusion. The original bound already suffices for the downstream exponential contradiction.

## 4. Certificate

Execute the following standalone JS (Node or compatible JS). It checks the exact finite algebraic inequality for arbitrary unit rational complex phases (a finite stronger analogue of the triangle step, NOT the continuum integral or actual L-function), scalar positive-part identity and cap, and numerical log-kernel maximization. Negative controls are pointwise and denominator-order counterexamples, not counterexamples to the native theorem. No native Lean kernel executed.

~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const phases=[[5,0],[3,4],[0,5],[-3,4],[-5,0],[0,-5]];
 let scalar=0,phase=0,kernel=0,negative=0;
 for(let g=-10;g<=10;g++)for(let w=0;w<=10;w++)for(let R=Math.max(g,0);R<=12;R++){
  ck((Math.abs(g)+g)*w===2*Math.max(g,0)*w,"positive part");
  ck((Math.abs(g)+g)*w<=2*R*w,"window cap");scalar+=2;
 }
 // Integer-scaled unit complex phases; no rounding in the finite triangle estimate.
 for(let x=-3;x<=3;x++)for(let y=-3;y<=3;y++)for(let a=1;a<=3;a++)for(let b=1;b<=3;b++)
 for(let mask=0;mask<4;mask++)for(const [r,i] of phases)for(const [s,j] of phases){
  const X=x*a,Y=y*b, real=r*X+s*Y,imag=i*X+j*Y;
  const window=(mask&1?Math.max(X,0):0)+(mask&2?Math.max(Y,0):0);
  const tail=(mask&1?0:Math.abs(X))+(mask&2?0:Math.abs(Y));
  const bound=2*(window+tail)-X-Y;
  ck(bound>=0 && real*real+imag*imag<=25*bound*bound,"finite window inequality");phase++;
 }
 // For k>0 compare the exact maximum formula with sample normalized kernel values in log scale.
 let lf=0;
 for(let k=1;k<=100;k++){
  lf+=Math.log(k);
  const logq=k*Math.log(k)-k-lf;
  ck(logq<0,"strict improvement");kernel++;
  for(const t of [.01,.1,.25,.5,1,2,3,5,10,20,50,100,200,k]){
   const logK=k*Math.log(t)-t-lf;
   ck(logK<=logq+1e-10,"maximum at k");kernel++;
  }
 }
 // Negative controls: removing factor 2 or the positivity condition is invalid at the pointwise step.
 ck(Math.abs(1)+1>1,"factor two window/tail");negative++;
 ck(Math.abs(-1)-1>2*(-1),"negative R");negative++;
 // For theta<0, sigma-theta>sigma: tail comparison used in window_key reverses.
 ck(1/3>1/4,"negative theta tail comparison");negative++;
 // k=0 kernel exact maximum at u=0; not a strict improvement.
 ck(Math.exp(0)===1,"k=0"); 
 return {scalar,phase,kernel,negative};
}
console.log(certificate());
~~~

Actual V8 execution: {"scalar":4796,"phase":63504,"kernel":1500,"negative":3}. All assertions completed. The first two counters are exact integer checks (bounded magnitudes far below 2^53); kernel checks use floating log values with tolerance 1e-10. These supplement, not replace, the derivation. No CI claim for this embedded check.

RESUME HERE: translate Deduction.landau_window_contra and the full two-branch final contradiction in P landauWindow.lean and H landauWindow.lean L1003–1021, L1057 onward; explicitly derive the distances d<e<=sigma-theta, bounds in each complex/real pole branch, sign of real residue, and choose eta/log growth rate preserving quantifier order. Compare RUN4 rather than duplicate nearest-pole construction. Request authenticated role-labelled type/value witnesses for landau_kernel_max, landau_window_ineq_int, landau_window_ineq, landau_window_key; do not promote source edges into kernel edges. HANDOFF TO editor, integration, audit, math, dependencies, kernel, acceleration. Project OPEN.


---

[specialists/literature_provenance/RUN13_NILPOTENT_CHART_FACTORIZATION_AND_SMOOTH_SECTIONS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN13_NILPOTENT_CHART_FACTORIZATION_AND_SMOOTH_SECTIONS.md) — blob 32f6faa82a7b00b9e4cd41d2e8143004db18012a

# RUN13 — Nilpotent chart factorization and smooth affine sections
2026-11-24. SOURCE-MATCHED / PARTIAL. RH pin P=40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib pin Q=0df444a360eaa60ab8c11dca51a86af692955474 (manifest checked in RUN12). Latest upstream commit observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from RUN12. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN12, relevant RUN11 and continuity/state/log/protocol excerpts, CI checkpoint 390 at 19:40:01 UTC (physical orchestrator only). Inspected recent peer commit patches for 12 distinct lanes and editor handoff; prime latest commit title checked, not its full note. No duplicate of this task observed. Blueprint referenced but not reopened. No physics changes. This closes the specific native chart source frontier in RUN11/RUN12 at the level of a human reconstruction, not kernel replay.

## 1. Resolve sec_smooth and the exact imported assumptions
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/.
The declaration GlobalTheory.PtVanish.sec_smooth is in the same original file CmpFormEqZeroOfPullbackVanishing.lean L133–139, not a remote axiom. Let s:X→Spec R be smooth, U an affine open. Because Spec R is affine, apply the smooth-ring-map property to the pair (Spec R,U) with containment U⊆s^{-1}(Spec R). The resulting map Γ(Spec R,O)→Γ(U,O) is smooth. Precompose with the canonical isomorphism R≅Γ(Spec R,O). Smoothness respects ring isomorphisms, so the map secMap s U is smooth. RingHom.Smooth is defined using the algebra structure induced by the ring homomorphism; the native proof concludes Algebra.Smooth R (Sec s U) by exact h2. The call at L153 uses hX:Smooth X.hom, after composition with identity (L152). This is not a proof of smoothness of an arbitrary X. The actual supplier of hX in root-reachable callers is still owed.

At Q, Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean L62–65 defines geometric smoothness by smoothness of all affine-section maps; L73–77 constructs the HasRingHomProperty instance by local ring smoothness and the affine-local characterization. RingHomProperties.lean L259–262 defines the class with locality and equality to the affine-local predicate; L293–295 proves appLE by rewriting this equality and applying the predicate to U,V,e. Mathlib/RingTheory/RingHom/Smooth.lean L74–76 defines ring-hom smoothness, L82–84 gives algebraMap equivalence and L154–155 gives respectsIso from locality. These have actual imported proof bodies or definitions, not new literature axioms. The deeper locality and exact elaborated instance terms remain open. The source of secMap itself was not separately expanded.

## 2. Chart factorization: exact source and proof
A=src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ExtensionDescent/ChartPullbacks/UniversalCharts/.
B=src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/.
Native import trace from TanSRestrict to ChartAway, TanLoc, IsUnivRingBc, EigLatBasis, LieEig, RestrictDiagCompInclFst, DualLiftInjective, IsUnivChart, LePreimageOfNil. The last file is the actual supplier. Prefix for the chart declarations below is ReciprocityTheory.ChartRestriction.G.Chart.

LePreimageOfNil.lean L40–43 defines Chart(G) as affine open U plus containment of the *entire* image of the identity section in U. No global affineness of G or smoothness is needed for this definition. Set C=Γ(U,O), i:Spec C→G the affine-open immersion. The base algebra R₀→C is obtained from G→Spec R₀ via ΓSpecIso (L47–56). For each R₀-algebra P and R₀-map h:C→P, pt(h)=i∘Spec(h) is a point over the base (L58–63). We use ordinary right-to-left composition in this note, unlike Lean's ≫.

Uniqueness (pt_injective L74–82): if i∘Spec(h)=i∘Spec(h'), cancel the monomorphism i, use faithfulness of Spec on commutative ring morphisms, then extensionality of algebra morphisms. No field or reducedness premise.

Existence (chart_eq L84–89; exists_pt L91–107): given a point x:Spec P→G over R₀ with x^{-1}(U)=Spec P, define h as the section pullback Γ(U,O)→Γ(Spec P,O) followed by the canonical identification with P. The compatibility of affine charts gives i∘Spec(h)=x. To establish that h is an R₀-algebra map rather than merely a ring map, compose this equality with G→Spec R₀, use x being over the base, and cancel Spec by faithfulness. Thus h composed with the structure map R₀→C equals R₀→P. This proves a unique affine-coordinate representation for any point with entire image in the chart. The identity section gives eps:C→R₀ (L156–172), and composition with R₀→P gives pt_eps (L176–186).

Nilpotent reduction (le_preimage_of_nil L109–140): let q:P→P₀ be a surjective R₀-algebra map with *each* element of ker q nilpotent; no uniform exponent is required. Assume x∘Spec(q)=pt(h₀) for some h₀:C→P₀. For any prime p⊂P, every a∈ker q is nilpotent, hence a∈p by primality. Therefore ker q⊆p. By the correspondence of prime ideals for a surjection, p₀=q(p) is prime in P₀, and q^{-1}(p₀)=p+ker q=p. Hence x(p)=pt(h₀)(p₀) lies in U. Since p was arbitrary, all of Spec P maps into U. This proves the required containment, not an arbitrary scheme morphism lift from P₀ to P. Only after this topological step does exists_pt produce the unique algebra map h. The stronger hypothesis that ker q is a nilpotent *ideal* is not needed in this lemma. Surjectivity is used explicitly in both prime correspondence steps. This is a proof via prime ideals, not an inference from set cardinality.

Negative control for dropping the nil-kernel premise: take P=k×k, P₀=k, q projection onto the first factor; G=G_m over k, U=G_m minus the point 2 over k=F₃. The point x on the two components has values 1,2 respectively. U is affine (principal open in G_m) and contains the identity. The reduced point under q lands in U, but x does not land entirely in U. ker q contains the nonzero idempotent (0,1). Negative control for dropping surjectivity: k[t]→k(t) has zero kernel but misses every non-generic prime; with G=G_a, U=D(t-1), and x the identity map A¹→A¹, the generic point factors through U while x does not. Both are mathematical counterexamples; the finite test below independently checks the prime-lifting mechanism for cyclic quotient rings, not the scheme examples or Lean.

## 3. Pullback compatibility and chart cover
IsUnivRingBc.lean L152–212: for R→R'→P with scalar-tower compatibility, G'=G×_Spec R Spec R'. pushR is projection on G (L167–172); pullR is the unique pullback lift of an R-point x and the fixed Spec P→Spec R' (L174–176). Projection after lift gives x (L178–182). Equality after projection gives equality before projection because the second components are the same structure map (L184–189). Base change of a point commutes with precomposition by a ring map (L191–196). The identity is preserved because pushR is multiplicative by the group pullback compatibility, and an idempotent element of a group equals 1 (L198–212); the actual group pullback supplier remains an imported local dependency, not replaced by an arbitrary pullback.

Consequently TanSRestrict L50–74 starts with a point on dual numbers reducing to 1, transports to G_s, and identifies its reduction with pt(eps_A). The projection A[ε]→A is surjective with square-zero kernel. The preceding nil-kernel theorem puts the entire dual-number point into the affine chart; existence and injectivity then show that its coordinate map h reduces exactly to eps_A. Push back to G. This preserves the scalar-tower hypotheses and explains why the original proof can work entirely with affine derivations after this step.

ChartAway.lean L22–54 proves that if an affine U contains the identity image over D(s), then its preimage on the base-changed scheme G_s is affine and contains the entire identity. Indeed Spec S[1/s]→Spec S is affine, its base change to G is affine, and primes of S[1/s] cannot contain s because s is a unit. The group identity square gives the stated inclusion. L56–81 constructs a finite cover: if the ideal generated by all eligible s is proper, choose a maximal ideal m containing it. Choose an affine neighborhood U of the identity at m; its inverse image under the identity section is an open containing m. The principal-open basis gives D(s) containing m and inside that inverse image. Then s is eligible but s∉m, a contradiction. A finite subfamily generates the unit ideal. This is not an assumed cover of arbitrary affine charts. Over a local base, LePreimageOfNil L146–152 similarly chooses an affine neighborhood of the identity at the closed point; every point specializes to the closed point, so the inverse-image open containing that point contains them all. L194–197 supplies chart_smooth given Smooth G.hom via the open immersion, composition and the affine Spec characterization.

## 4. External-assumption ledger delta
| Declaration or dependency | Classification | Source and residual |
|---|---|---|
| GlobalTheory.PtVanish.sec_smooth | internal theorem with body | D/CmpFormEqZeroOfPullbackVanishing L133–139; explicit local Smooth s, affine U; secMap definition and locality internals still owed |
| Chart, alg0, pt, eps | internal definitions | A/LePreimageOfNil L40–63,156–172; not independent proved propositions |
| pt_injective, chart_eq, exists_pt, le_preimage_of_nil, pt_eps | internal theorem bodies | A L74–140,176–186; preserve over-base compatibility, affine open and nil-kernel/surjectivity where used |
| exists_chart, chart_smooth | internal theorem bodies | A L146–152,194–197; local base or smoothness respectively |
| chart_away, exists_cover | internal theorem bodies | B/ChartAway L22–81; preserve base-change group compatibility, affine map and principal-open basis |
| pushR_pullR, pushR_inj, pushR_spMap, pushR_one | internal theorem bodies | B/IsUnivRingBc L178–212; scalar tower, group-pullback supplier |
| HasRingHomProperty.appLE, RingHom.Smooth.respectsIso | imported Mathlib theorem bodies | Q; actual locality suppliers remain unresolved |
| Spec.map_injective, affine-open immersion/cancellation, prime ideal correspondence, pullback extensionality | imported results referenced in actual proof bodies | exact deeper proof terms not traced in this run |
| Smooth X.hom; isGrpPullback_pullback | local premise / unresolved supplier respectively | do not erase or equate with new global axiom |
| PublishedTheorems/OpenLiteratureStatements | no newly introduced wrapper in this selected slice | prior audit ledger retained; this is a supplier expansion, not an inventory of every declaration |
No new hypotheses added to the source statements; no citation/priority claims; no evidence of a global empty axiom closure, no root-reachability inferred from import paths.

## 5. Reproducibility and observed checks
Eight pinned source identities and 50 exact position anchors were checked by live connector fetch. Reproduce with the following Python from RH checkout and pass a Mathlib checkout as argv[1]. This equivalent git command script was not executed here; the connector version was executed. Paths A,B,D as above.
```python
import subprocess,sys
P="40e56bab026552e089d7afcfeff08d2defb9c005"
Q="0df444a360eaa60ab8c11dca51a86af692955474"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/"
A="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ExtensionDescent/ChartPullbacks/UniversalCharts/"
def read(c,r,p,h):
    raw=subprocess.check_output(["git","-C",c,"show",r+":"+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==h
    return raw.decode().splitlines()
rows=[
(".",P,D+"CmpFormEqZeroOfPullbackVanishing.lean","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(133,"theorem sec_smooth"),(136,"HasRingHomProperty.appLE"),(138,"respectsIso.2"),(139,"exact h2"),(153,"sec_smooth")]),
(".",P,B+"TanSRestrict.lean","b36130c182a5a3003524e980725d171a67efa74c",[(52,"pushR"),(60,"have hnil"),(65,"le_preimage_of_nil"),(67,"exists_pt"),(71,"pt_injective")]),
(".",P,B+"ChartAway.lean","21462e72aa036bacd20498be57c7bcac921005b9",[(22,"theorem chart_away"),(56,"theorem exists_cover"),(60,"exists_le_maximal"),(69,"span_eq_top_iff_finite")]),
(".",P,B+"IsUnivRingBc.lean","8c59fe23ae14f1be2f93e4b5f40aec05ebfe16c7",[(160,"sp_hom_fB"),(167,"def pushR"),(174,"def pullR"),(182,"lift_fst"),(189,"hom_ext"),(212,"mul_eq_left")]),
(".",P,A+"LePreimageOfNil.lean","d90923f4aeb598cb16d46307c1f7fbeecfcd719e",[(40,"structure Chart"),(43,"he :"),(48,"ΓSpecIso"),(58,"def pt"),(78,"cancel_mono"),(79,"Spec.map_injective"),(87,"SpecMap_appLE_fromSpec"),(91,"theorem exists_pt"),(101,"Over.w"),(102,"Spec.map_injective"),(109,"theorem le_preimage_of_nil"),(117,"mem_of_pow_mem"),(120,"map_isPrime_of_surjective"),(124,"comap_map_of_surjective"),(129,"range_fromSpec"),(139,"hp₀"),(146,"theorem exists_chart"),(152,"specializes_closedPoint"),(176,"theorem pt_eps"),(194,"theorem chart_smooth")]),
(sys.argv[1],Q,"Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean","ccb5e910949c0a60e97d65ff05554966c7ffafaa",[(62,"class Smooth"),(64,"IsAffineOpen"),(73,"HasRingHomProperty")]),
(sys.argv[1],Q,"Mathlib/AlgebraicGeometry/Morphisms/RingHomProperties.lean","072da19404b28a564b237f5b04f341830dcd0be7",[(259,"class HasRingHomProperty"),(262,"affineLocally"),(293,"theorem appLE"),(294,"affineLocally_iff_affineOpens_le")]),
(sys.argv[1],Q,"Mathlib/RingTheory/RingHom/Smooth.lean","ca757ab5bba703c2bb97b7f0744c5dbb0e1ed19f",[(74,"def Smooth"),(76,"Algebra.Smooth"),(154,"respectsIso")])]
out=[]
for c,r,p,h,anchors in rows:
    s=read(c,r,p,h);out.append(s)
    for i,t in anchors:assert t in s[i-1],(p,i,t)
new=read(".",H,A+"LePreimageOfNil.lean","4e8ab3f01dc2ecb8dcd00a470b06e216f55a76c9")
assert out[4][73:140]==new[80:147]
new=read(".",H,D+"ExistsTangentVectorFunctionalGlobalFormsAbelianS.lean","0610edb6e4bb7564e19ef9d9da168bc35b880f00")
assert out[0][132:139]==new[231:238]
print(len(rows),sum(len(r[-1]) for r in rows),74)
```
Actual upstream checks: 67 old lines L74–140 match new L81–147 literally; seven sec_smooth lines L133–139 match consolidated L232–238 literally. Old CmpFormEqZeroOfPullbackVanishing path returns 404 at H; consolidation found in the named ExistsTangentVectorFunctionalGlobalFormsAbelianS file. This establishes local source equivalence only.

Additional executed JS regression: enumerate all cyclic ring quotients Z/m→Z/d for 2≤m≤80 and d|m. Compute kernel nilpotence by actual modular powers (at most m iterations per element, since the power sequence repeats or hits zero), and independently enumerate primes of the source and target and compare preimage membership.
```js
let elementTests=0,primeTests=0,quotients=0,negative=0;
const prime=n=>n>=2&&Array.from({length:n-2},(_,i)=>i+2).every(d=>n%d!==0);
for(let m=2;m<=80;m++)for(let d=1;d<=m;d++)if(m%d===0){
 const ker=Array.from({length:m},(_,i)=>i).filter(a=>a%d===0);
 const nil=ker.every(a=>{let v=1%m;for(let n=1;n<=m;n++){v=v*a%m;elementTests++;if(v===0)return true}return false});
 const pm=Array.from({length:m-1},(_,i)=>i+2).filter(p=>m%p===0&&prime(p)),pd=Array.from({length:d-1},(_,i)=>i+2).filter(p=>d%p===0&&prime(p));
 let surj=true;
 for(let p of pm){let target=Array.from({length:m},(_,i)=>i%p===0);let lift=pd.some(q=>{primeTests++;return target.every((t,i)=>t===((i%d)%q===0))});if(!lift)surj=false}
 if(nil!==surj)throw Error([m,d]);quotients++;if(!nil)negative++;
}
console.log({quotients,elementTests,primeTests,negative})
```
Actual result: 367 quotient cases, 11,767 modular power steps, 708 prime-preimage comparisons, 233 non-nil-kernel quotients correctly missing at least one prime. All assertions held. This is a finite arithmetic regression, not an exhaustive test of arbitrary schemes, not an independent Lean replay, and not a URT benchmark.

RESULT: SOURCE-MATCHED / PARTIAL. Native nilpotent chart factorization, chart existence, base-change point compatibility and smooth-section wrapper supplied with proof and guard ledger. Main-root typed witness status unresolved. No closure claim.

RESUME HERE: proceed to actual HC/HH comparison and system realization suppliers, starting from the pinned imports of AbelianDeRhamFreeOfCrystallineComparisonStatement and StructureSheafComparisonInjectiveStatement in CmpFormEqZeroOfPullbackVanishing L7–8; reconstruct the exact bodies and their comparison hypotheses, not names or external citations. Request authenticated role-labelled witnesses for GlobalTheory.PtVanish.sec_smooth, ReciprocityTheory.ChartRestriction.G.Chart.le_preimage_of_nil, exists_pt, pt_injective, exists_cover and pushR_inj (full prefix), prioritize root reachability. Remaining secMap definition, group pullback and Mathlib locality leaves kept open; do not repeat RUN12/RUN13. HANDOFF TO integration, editor, audit, dependencies, kernel, geometry, acceleration. Project OPEN.


---

[specialists/on_acceleration/RUN13_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN13_RESUME.md) — blob ee128470f6c1a6d3a7c8ed7f0d908a33d66e758b

# RUN13 — shared role-preserving reverse invalidation on real RH export (PARTIAL)

2026-11-24. Original source [pin](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); this does not independently bind export to source or check the kernel. Read swarm protocol, queue, expansion, repository continuity excerpts, CI summary and relevant lane handoffs. No physics changes or duplicate compression. Blueprint not reopened. Prior upstream HEAD not adopted. Dependency lane [combined native job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45457486389) passed: 47/47 requests, 3044 type, 10157 value, 2 structural edges, projection 65.810 s; entire CI job 1815.01 s. All 26 RUN12 targets included in that peer batch. Older six-anchor report [failed source-name comparison job](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45423163512) is used only as emitted direct reference evidence, NOT a passed source anchor audit; peer subsequently reconciled namespace. Native downstream fixture [run](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45456786809) confirms combined type/value axiom equality can mask a per-role omission; do not substitute combined reports for role edges.

## Inputs and replay
- [47-role projection](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json) Git blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b; job reported SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6, 4218336 bytes.
- [six-anchor projection](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json) Git blob 64b935e4ef309f6c555912a377012c7708eda510.
- Same solution archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e. Retrieved directly by exact Git blob using authenticated connector and executed identical semantic function in V8; independent byte hash and Node RSS unavailable in that environment. Native replay: `node role_reverse_run13.mjs solution_frontier_roles.json solution_direct_roles.json` checks both Git blob SHA1s before parsing and prints peak process RSS and high resolution timing. No new Lean execution. Local clocks millisecond resolution, first/repeated calls not OS cache cold/warm. No speed claim from sub-clock times.

## Algorithm and validity
Index reverse by archive-scoped numeric target ID, retain each original role/kind/witness object; distinct structural occurrences remain distinct. Owner IDs come from exact reports, no suffix name promotion. Seed changes and propagate to each observed owner depending on a seed via any observed edge, mark once; induction on path length establishes equality with a full-record fixed point on this partial graph. Type/value and structural edges stay queryable separately, mutual-block metadata counted but not treated as hard proof edges. Invalidation is conservative within the observed graph, never a cache reuse authorization. Unexpanded boundaries not proved leaves. Index expected O(B+V+E), shared union closure O(V_affected+E_affected+S) expected, per-seed independent closure sums affected sets. Selecting degree-ranked stress seeds sorts O(V log V) outside timed queries. Baseline full scans O(E*passes); stronger independent indexed baseline also measured. Memory O(B+V+E) for this projected graph, not full billion-expression bounded index. No dependency removed or proof-search complexity claim. No full-graph completeness, exact typed transitive proof of RH, or end-to-end translation timing.

## Executed results (V8)
```json
{
  "status": "PARTIAL_AUTHENTICATED_EXPORT_ROLE_INDEX_NOT_KERNEL_RECHECK",
  "indexMs": 25,
  "owners": 53,
  "referencedIds": 3268,
  "boundary": 3240,
  "ambiguousTaggedRepresentations": 0,
  "roleCounts": {
    "type": 3077,
    "value": 10233,
    "structural": 2
  },
  "metadata": 52,
  "checks": 193,
  "boundaryTests": 100,
  "benchmarks": {
    "overlap": {
      "seeds": [
        61,
        1,
        80,
        4101,
        4074,
        4098,
        5660,
        22503,
        273,
        4078,
        2055,
        3995,
        7484,
        2083,
        25327
      ],
      "affected": 66,
      "affectedOwners": 51,
      "modes": {
        "full_scan": {
          "firstMs": 4,
          "warmTotalMs": 221,
          "repeats": 50,
          "warmMs": 4.42,
          "edgeVisits": 53248
        },
        "separate_indexed": {
          "firstMs": 1,
          "warmTotalMs": 321,
          "repeats": 1000,
          "warmMs": 0.321,
          "edgeVisits": 1232
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 89,
          "repeats": 1000,
          "warmMs": 0.089,
          "edgeVisits": 920
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 105,
          "repeats": 1000,
          "warmMs": 0.105,
          "edgeVisits": 920
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 89,
          "repeats": 1000,
          "warmMs": 0.089,
          "edgeVisits": 920
        }
      }
    },
    "sparse": {
      "seeds": [
        14026527,
        14031558,
        14032426,
        14033732,
        14033783,
        14033919,
        14033939,
        14034091,
        14034113,
        14034122,
        14065049,
        14065050,
        14065051,
        14065052,
        14065053
      ],
      "affected": 17,
      "affectedOwners": 6,
      "modes": {
        "full_scan": {
          "firstMs": 2,
          "warmTotalMs": 99,
          "repeats": 50,
          "warmMs": 1.98,
          "edgeVisits": 26624
        },
        "separate_indexed": {
          "firstMs": 0,
          "warmTotalMs": 17,
          "repeats": 1000,
          "warmMs": 0.017,
          "edgeVisits": 25
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 4,
          "repeats": 1000,
          "warmMs": 0.004,
          "edgeVisits": 15
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 11,
          "repeats": 1000,
          "warmMs": 0.011,
          "edgeVisits": 15
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 12,
          "repeats": 1000,
          "warmMs": 0.012,
          "edgeVisits": 15
        }
      }
    },
    "anchors": {
      "seeds": [
        14065054,
        14065053,
        14065052,
        14065051,
        13125901,
        341189
      ],
      "affected": 6,
      "affectedOwners": 6,
      "modes": {
        "full_scan": {
          "firstMs": 1,
          "warmTotalMs": 45,
          "repeats": 50,
          "warmMs": 0.9,
          "edgeVisits": 13312
        },
        "separate_indexed": {
          "firstMs": 1,
          "warmTotalMs": 7,
          "repeats": 1000,
          "warmMs": 0.007,
          "edgeVisits": 12
        },
        "shared": {
          "firstMs": 0,
          "warmTotalMs": 1,
          "repeats": 1000,
          "warmMs": 0.001,
          "edgeVisits": 5
        },
        "golden": {
          "firstMs": 0,
          "warmTotalMs": 8,
          "repeats": 1000,
          "warmMs": 0.008,
          "edgeVisits": 5
        },
        "periodic": {
          "firstMs": 0,
          "warmTotalMs": 8,
          "repeats": 1000,
          "warmMs": 0.008,
          "edgeVisits": 5
        }
      }
    }
  }
}
```
All comparisons use full affected-ID set equality; all role-labelled edge multisets match. Synthetic edit requests on authentic projected edges, not observed edits. Golden/periodic alter only seed order. No universal scheduler advantage inferred. Missing dependencies outside projection unknown; no discrepancy on tested supplied graph.

RESUME HERE: obtain next source-linked authenticated typed projection for current peer requests, then merge by archive-scoped owner ID and exact role evidence; reject conflicting repeated owner rows rather than overwriting. Compare incremental reverse-index update against rebuild on actual delta and record true Node RSS. HANDOFF TO dependencies, kernel, integration, audit, editor and all specialists. Project OPEN.


---

[specialists/positivity_geometry/RUN13_BOUNDARY_ARC_CUSP_DECAY.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN13_BOUNDARY_ARC_CUSP_DECAY.md) — blob e7753843b7120a55971a9f0e85612286b133b595

# Geometry RUN13 — boundary arc, component separation and cusp decay
2026-11-24. DONE for bounded source-level argument, SOURCE-MATCHED; finite algebra regression executed. Imported analytic/geometric suppliers OPEN. Full RH project OPEN.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, own RUN12, recent 40 peer commit titles and 14 peer file lists and available RESUME notes. Some peer scripts had no RESUME lines in returned diffs. No competing boundary-arc task located. General CI checkpoint 390, 19:40 UTC, run 45468931672 PASS (not independent RH validation). External blueprint referenced but not reopened. No physics work or changes to baseline queue.
P = 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head H = 9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge #1313 2026-11-24 18:24:32 UTC, unchanged since RUN12). GitHub-returned blob identifiers, not independently recomputed raw hashes:
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean — 0c0ad5b8910bc85997bb107de3caab75c487ed0c; tendsto_arc_readsZ L22–128.
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean — 73af5a84e8e43d8a3d0e4b4066937e39941a83fe.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EigenframeSpecializationUniformBoundStatement.lean — ac4042c7c70d159a0c86868cedd5958fa7869045.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EigenframeSpecializationUniformBound.lean — 16845337c7602c2d065c0ec0d0f7d766035134bf.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/NormFactorInvLePowHolomorphicOrbitPeriodBoundStatement.lean — 287a529034fcffb7b38626c36ea5efc788f87769.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/NormFactorInvLePowHolomorphicOrbitPeriodBound.lean — d727daeb769c962a6b21d0feb577c7c753428c41, nfac_bound2 L112–139, nfac_inv_le_pow_of_isOrbit_of_perBound L146–end.

At H old VuOntoB path returns 404; theorem now at src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean L1201–1307, blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e. Both theorem blocks have 106 trimmed nonblank lines, differing at eight supplier calls; same displayed arguments and rest of body. P wrapper GlobalTheory.T names and H direct calls:
exists_holomorphicFrameOrbit_lift_of_arc → GlobalTheory.ShFam.ArcLift.exists_orbit_lift;
exists_holomorphicFrameOrbit_unipotent_order_two → GlobalTheory.ShFam.OrbitUnip.exists_isOrbit_unipotent;
trivial_monodromy_orbit_converges_symmetric_domain → GlobalTheory.ShFam.OrbitLimit.orbit_limit;
boundary_arc_lift_not_converges_symmetric_domain → GlobalTheory.ShFam.BdArc.Leave.lift_not_converges;
holomorphicFrameOrbit_isotropic_vector_short → GlobalTheory.orbit_unipotent_short;
exists_arcLift_periods_tendsto_span → GlobalTheory.ShFam.PerLim.exists_periods_tendsto_span;
eigenframe_specialization_uniform_bound → GlobalTheory.ShFam.PerPoly.periods_le_pow;
normFactor_inv_le_pow_holomorphicOrbit_periodBound → GlobalTheory.nfac_inv_le_pow_of_isOrbit_of_perBound.
The last two P wrapper bodies directly delegate to these H names (first/exact/apply). No claim of elaborated equivalence for all eight.

## 1. Quantified conclusion
PositivityTheory.UnitarySelfGeneration.VuOnto.tendsto_arc_readsZ:
Fix E a Field, NumberField and IsCMField; H:Host E, D:Datum H, l:Level H, Xo:Moduli D l, c:Coeff l, r:natural, σ:c.F→+*C. Given V:Unf Xo c σ r, GoodEmb c σ, IsUnf V, T:TorFlag Xo c, ee:Ix D→Z with ee none=0, k:V.Comp, weight la:Wt (V.X k).Ψ r, P:Frame (V.X k).Ψ r→C with P∈(V.X k).SS la; chart-indexed h with Reads V T ee k P h and OffZero V T k h; i:T.X.F.J; affine open W of T.X.YY with domain Γ(T.X.YY,W) and W≤T.X.F.U i; arc s:C→CxPts(flagStr T.X,σ), radius ρ>0, assume
(a) s(u) lies in ptsIn W for every |u|<ρ;
(b) for EVERY f∈Γ(T.X.YY,W), u↦ev(W,f,s(u)) is complex differentiable on ball(0,ρ);
(c) s(0) is outside flagOpen;
(d) all u in ball with u≠0 lie in flagOpen.
Then h(i,s(u))→0 along the punctured-neighborhood filter at 0. No claim on arbitrary curves lacking (b) or (d), or on ordinary convergence without identifying the value at 0. No smoothness assumption in this theorem (needed by subsequent holoOn_bdZ). No nonnegative weight restriction or good-level assumption added.

## 2. Construct the actual algebraic boundary arc
A=Γ(W); q:Spec A→T.X.YY is the affine chart map tau hW; φ:c.F→A is induced by q followed by flagStr. hφ identifies q≫flagStr=Spec φ. The inclusion W≤U_i gives hz. The base compatibility hxc identifies (q≫T.X.π)≫T.Y.s with Spec φ≫Spec id; the generic-fiber pullback yields x:Spec A→gen T.Y with q≫T.X.π=x≫genι and x≫genStr=Spec φ. Apply exists_eigFrame_tau to obtain fr with hfr. ψ(u):A→C is evaluation at s(u) on the ball, and at s(0) outside (total extension; no differentiability outside used). On ball, Spec ψ(u)≫q=s(u), and ψ(u)∘φ=σ, via Spec.map_injective.
The key pointwise equivalence, for every p∈Spec C and u in the ball:
s(u)(p)∈flagOpen iff (Spec ψ(u)≫x)(p)∉genBd T.Y.
It follows from the two factorization identities, the range description of genBd and injectivity of the open embedding genι. Hypotheses (a,b) give IsArc, (c) gives the boundary at zero using subsingleton Spec C, and (d) gives the punctured interior. Thus hb:IsBdArc. For each punctured u obtain a matching frame by exists_matches. To choose a total family y(u), first exhibit a frame at the explicit nonzero point ρ/2 (positive radius). Then choice gives hm for all punctured u. This is not a claim of a canonical global frame.

## 3. Lift and two branches
Use the orbit-lift supplier to obtain component k', threshold T₀, positive-period orbit data M₀,γ₀, frame function xx(w), hT, hO₀, hL. Write u=eTwoPi(w)=exp(2π i w), nonzero. For Im(w)>T₀, hT guarantees u in the ball, hL and matching imply xx(w) lies in dom(k'), and exists_frBor_of_matches supplies chart frame Q and units t with ChartFr, FrBor(t,Q,V.un k' xx(w)) and t(some a)=1 for every a. The same chart exists by W≤U_i. All these conditions hold eventually in imTop, the pullback of atTop along Im.
The source applies tendsto_punctured to reduce to convergence along eTwoPi. The elementary filter reason is |exp(2πiw)|=exp(-2π Im w); conversely each nonzero u has a logarithmic lift w with Im w=-(log|u|)/(2π). Hence all sufficiently small nonzero u have preimages at arbitrarily prescribed large imaginary threshold. A limit on just a fixed ray or a single sequence would NOT suffice.

Branch k'≠k: if some x'∈dom(k) represented s(u), then the incidence equality and hQ.exists_frBor produce t' comparing Q to V.un k x'. Combine t,t' using Borel groupoid composition/inversion g1,g2. IsUnf applied to the two frames gives an equality of sigma pairs; their first coordinates force k'=k (contradiction). By OffZero h(i,s(u))=0 eventually. Thus limit zero with no cusp estimate in this branch.

Branch k'=k: substitute k'. Use unipotent-orbit supplier to replace M₀,γ₀ by M,γ retaining IsOrbit hO and unipotency hγ. If γ=1, trivial-monodromy orbit convergence supplies x₀,hx₀,x',a1,a2; boundary_arc_lift_not_converges_symmetric_domain contradicts these using hb (full boundary data), hm and hL. So γ≠1. Nontrivial unipotency plus hO supplies ξ,c',hξ,hc',ht by holomorphicFrameOrbit_isotropic_vector_short. The exact formulas inside these premises and the proof of the monodromy assertions are imported; no claim that unipotency alone is sufficient or that every nontrivial matrix has the required vector.
Next obtain m,v,Lp,Lm with hlim (componentwise period limits spanning both positive and negative blocks), then hper (uniform polynomial bounds on each strip), then C',B,hn (positive norm factor with inverse at most C' Im(w)^B eventually on ALL imTop). tendsto_cusp uses P∈SS, the orbit domain clause hO.2.2.2.1, hξ,hc',ht,hn to give P(xx(w))→0. This is an application, not a proof of the imported cusp theorem.
Finally Reads gives P(xx(w))=chr(ee,t) h(i,s(eTwoPi(w))). The source rewrites chr_of_some ht1, hee, zpow_zero, one_mul: all some-coordinates of t are units equal to one, and the remaining none-coordinate exponent is zero. Thus the factor is exactly 1, regardless of t(none). Both hypotheses are essential to this cancellation. Equality eventually transfers the cusp limit to h and tendsto_punctured finishes. There is no inequality cancellation with an unproved bounded character.

## 4. Actual period and norm bounds feeding the cusp estimate
The P statement eigenframe_specialization_uniform_bound has arbitrary CM field E, Xo,c, coefficient ring O with CommRing, β:O→c.F, model Z, σ, N, U:Unf, A CommRing, φ:c.F→A, x:Spec A→gen Z, eigframe fr, ψ:C→(A→+*C), radius r, y:C→FrPt, k, threshold T, M:natural, γ:GL(Fin N,E), xx frame function. Under GoodEmb, IsUnf, IsArc, matching on punctured ball, IsOrbit, IsLift, for EVERY vector v∈E^N and EVERY real strip radius R there EXIST real C and natural B such that eventually in imTop:
  |Re w|≤R ⇒ ∀ embedding τ:E→C, ∀ i∈N, |perFr(U.X k,xx(w),v,τ,i)|≤C (Im w)^B.
PerPoly.periods_le_pow first clears denominators with n>0 so n v∈Λ; perFr(nv)=n perFr(v), divides by n using positivity. The lattice-vector supplier gives C₁,B for supported period coordinates; definite p0=0 invokes a separate outside-CM-type bound C₃ (otherwise the implication is vacuous). Eventually Im w≥1. Use C=max(C₁/n,0)+max(C₃,0). In the CM type, index i<N-p0 uses the lattice bound and other indices give zero by definition. Outside it, if conjugate embedding is in CM type and p0=0 use C₃; if p0>0 use i<p0 or replace i≥p0 by p0-1 using the actual saturating index arithmetic. If neither embedding in the type, period is zero. No omitted out-of-range branch. Lattice existence and the two imported analytic period suppliers still require translation.

The norm supplier assumes E CM, N, X:Data E N, T,M,γ, x:C→Frame, la:Wt, n, v_j∈E^N, Lp_jτ∈C^(N-p0), Lm_jτ∈C^p0. Assume IsOrbit, limits of perFr for every j,τ and index in each block to Lp,Lm, both spans equal top for each τ, and the preceding period bound for every u∈E^N and R∈R. It concludes ∃ C real, B natural, eventually on imTop:
  0<nfac(la,x(w)) and nfac(la,x(w))^(-1)≤ C (Im w)^B.
In the actual proof choose Kpτ,Kmτ nonnegative by span_bound; majorant constants Dτj,D'τd nonnegative by maj_strip, where d runs over coordinate vectors. Let C=Στ(Kpτ+Kmτ)Σj Dτj; Bp=Σd Bq_d, Cp=Σd max(Cq_d,0), DQ=Στd D'τd, K=Στdc |τ((X.Gm)^(-1)_dc)|, S=Στi |laτi|. Set A=C+N² K Cp DQ. Work eventually with y=Im w≥max(R_threshold,T+1,1), |Re w|≤M. The source obtains b=bOf(X,x(w)) in Bor, with orthogonal rmul(x,b); diag_bounds, quot_bound, fil_bound give both d_{τi}=|bτii|>0 and
  d_{τi} ≤ A y^(Bp+2), 1/d_{τi} ≤ A y^(Bp+2).
For i≥p0, quot_bound controls the inverse and diag_bounds the direct term; for i<p0, the roles reverse using fil_bound. Constants cover the two bounds since y≥1, y²≤y^(Bp+2), C and N² K Cp DQ nonnegative. The actual nfac_bound2 lemma (orthogonal frame and right-Borel norm-factor law) says nfac=|bchar(la,b)|=∏τi d_{τi}^{laτi}. For any common bound R on both d and inverse, each inverse factor is ≤ R^|laτi|: la≥0 uses inverse bound, la<0 uses direct bound. Multiply nonnegative factors, nfac>0 and inverse≤R^S. Hence on strip inverse≤(A y^(Bp+2))^S. This holds also for S=0; do not divide by A or assume it strictly positive in the empty-index case.
To globalize, M>0 follows from IsOrbit. Translate w by integer multiple -floor(Re w/M) M. Imaginary part unchanged; reduced real part in [0,M), so strip bound applies. nfac_shift identifies original and translated norm factors. Thus the exact witnesses used by the source are C_out=A^S, B_out=(Bp+2)S. A strip-only estimate is not a global imTop estimate without the shift identity.
The source imports the proofs of span_bound, maj_strip, diag_bounds, quot_bound, fil_bound, nfac_shift, right-Borel law and nfac_ortho; only the scalar aggregation and signed exponent argument are expanded here. This is the native polynomial inequality supporting the boundary decay, not an arithmetic intersection bound in isolation.

## 5. Executed regression
Executed below in V8, exact rational BigInt and integer arithmetic: {"character":405,"nfac":42875,"strip":28020,"exponent":1260,"negative":6}. Counts are synthetic regression of character cancellation, signed product inequality, real strip reduction and exponent rearrangement; not native frame data, no proof of geometric existence, no kernel validation, no acceleration metric. Negative controls: drop ee none=0, drop t(some)=1, drop one of the two diagonal bounds (two controls), replace abs exponent by signed exponent, and falsely globalize a strip estimate. No additional hypotheses introduced in the translated theorem.
Reproduce by copying fenced JS into run13.mjs and running node run13.mjs:
~~~js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const q=(a,b=1)=>[BigInt(a),BigInt(b)];
 const mul=([a,b],[c,d])=>[a*c,b*d],inv=([a,b])=>{if(!a)throw Error("zero");return a<0n?[-b,-a]:[b,a]};
 const eq=([a,b],[c,d])=>a*d===b*c,le=([a,b],[c,d])=>a*d<=b*c;
 const pow=(x,n)=>{if(n<0){x=inv(x);n=-n}let z=q(1);while(n--)z=mul(z,x);return z};
 const vals=[q(1,3),q(1,2),q(1),q(2),q(3)],counts={character:0,nfac:0,strip:0,exponent:0,negative:0};
 for(const t of vals)for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++){
  ck(eq(mul(pow(t,0),mul(pow(q(1),a),pow(q(1),b))),q(1)),"character");counts.character++;
 }
 for(const x of vals)for(const y of vals)for(const z of vals)for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++){
  const S=Math.abs(a)+Math.abs(b)+Math.abs(c),p=mul(mul(pow(x,a),pow(y,b)),pow(z,c));
  ck(p[0]>0n&&le(inv(p),pow(q(3),S)),"nfac signed product");counts.nfac++;
 }
 // Rational real coordinate j/7 and integral period M, including negative j.
 for(let M=1;M<=20;M++)for(let j=-700;j<=700;j++){
  const n=BigInt(j),d=BigInt(7*M),k=n>=0n?n/d:-((-n+d-1n)/d);
  const reduced=n-k*d;
  ck(reduced>=0n&&reduced<d,"strip");counts.strip++;
 }
 for(let A=0;A<=5;A++)for(let y=1;y<=5;y++)for(let B=0;B<=5;B++)for(let S=0;S<=6;S++){
  ck(eq(pow(mul(q(A),pow(q(y),B+2)),S),mul(pow(q(A),S),pow(q(y),(B+2)*S))),"exponent");counts.exponent++;
 }
 ck(!eq(pow(q(2),1),q(1)),"none exponent needed");counts.negative++;
 ck(!eq(pow(q(2),-1),q(1)),"some unit needed");counts.negative++;
 ck(!le(inv(pow(q(1,3),2)),pow(q(1),2)),"upper-only norm insufficient");counts.negative++;
 ck(!le(inv(pow(q(3),-2)),pow(q(1),2)),"inverse-only norm insufficient");counts.negative++;
 ck(!le(inv(pow(q(1,3),2)),pow(q(3),-2)),"signed exponent not natAbs");counts.negative++;
 ck(!le(q(100),q(1)),"bounded real strip estimate cannot be global without invariance: f(w)=|Re w|, R=1");counts.negative++;
 return counts;
}
console.log(JSON.stringify(certificate()));
~~~
For each original blob compare git rev-parse P:<path> using the full P above. Source links use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. No authenticated root reachability established in this run.

RESUME HERE: reconstruct holoOn_bdZ (P VuOntoB immediately after tendsto_arc_readsZ) and its differentiableAt_of_lines, frequently_ne_zero suppliers, with the actual affine domain, dense flagOpen, nonzero basic-open function and line-test hypotheses. Keep analytic lift, unipotency, period-limit and tendsto_cusp bodies as explicit independent obligations; then GAGA. Request role-labelled root evidence for tendsto_arc_readsZ, holoOn_bdZ, PerPoly.periods_le_pow, OrbitNfacTwo.nfac_bound2, nfac_inv_le_pow_of_isOrbit_of_perBound and the eight H direct calls. HANDOFF TO geometry, integration, editor, audit, dependency, kernel, literature and theta. Project OPEN.


---

[specialists/prime_window/RUN13_STAR_TO_UNIFORM_COUNTING.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN13_STAR_TO_UNIFORM_COUNTING.md) — blob 4ab15aaa3127ac744475ce99b7c623874c2954d2

# RUN13 — Native StarAll to uniform counting and family closure

2026-11-24. STATUS: SOURCE-MATCHED conditional human derivation, exact finite arithmetic regression executed in V8. This is not a kernel replay or a proof of RH. Pinned upstream leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005 (P). Latest observed upstream 9282d3a102c4aff0e6026746db2a8990f5d9cddd (H), merge PR #1313. Source URLs use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by the path below.

## Continuity and boundary
Read AGENTS, research state/log/protocol and continuity excerpts, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN12, and current 14 other lane commit summaries/handoffs (including audit, dependency, kernel, integration and speed). Physics CI checkpoint #388 at 19:00:14 is not RH validation. External blueprint not reread this run. No duplicate of this specific StarAll aggregation found in those recent notes; no claim exhaustive repository-wide search. RUN12 left RemainingCountingStatement as a premise. This run finds its actual native producer and all four branch obligations, not just a conditional allowance comparison. Retain the explicit admission and size premises. Residue-characteristic primality supplier from RUN12 remains open, not silently resolved here.

## 1. Pinned source ledger
All following files are under src/Formalism/SharpRestriction/GrowthBounds/.
- LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, L99–134: InWin, GainBoundAtPairUniform, GainBoundAllUniform, GainBoundAt, GainBoundAll, RequiresAll, StarAt, StarAll. L156–159 AdmFam.
- IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b: L89 gam; L166–169 reps and topsOn; L230–258 al, capU, Excl, dl, g0, gU; L279–294 Cand, goodReps, Sig, VV; L341–364 tauP, gainP, TTP; L378–393 lo and fl.
- LogarithmicSums/TsumTruncatedShiftLe.lean blob 50b57259d62479c45f43be44634b355db323c9ed, L9–62 summable_geo/tsum_odd, L64–101 positive part identities and tsum_pos_le, L103–164 tsum_truncated_shift_le.
- LogarithmicSums/NotSingularOfCentral.lean blob c57da93c44237c19538bd07949a705adb0e8171f: L13–27 GainBoundConstants/basics; L81–208 capU_bounds, a_bounds, two_le_a, logb_facts, dl_nonneg, gam_facts, gU_le, g_zero_le_gamma_sum, Pr_nonneg; L209–315 sum_reps, VV_subset_reps, orbit cardinality and dl sum; L317–350 fl_nonneg, sum_dl_add_ep_le; L358–431 lo_ge_cp, lo_nonneg, g_zero_ge_ask_sum; L433–467 card_lifts, noop; L469–519 orbit_max_le, gain_bounds; L521–599 top_small, excl_small_of_ge, not_excl_of_sg, not_singular_of_central, hypothesis₂; L601–617 sum_TTP_served, hP_ne_zero_of_cand; L619–728 gain_bound_at_of_star; L730–737 gain_bound_all_of_star. All names in namespace Formalism.MainNotions.AuxBlock8.Pf.
- LogarithmicSums.lean blob ca9322c11898c23018dfb6076d58d08219259eab L18–34 RestStar, bo_nonneg, eventually_adm_of_admFam; L36–64 rest0 and remainingCountingStatement_of_restStar; L66–102 rest2, restW, rest3, restT, restStar, stmtEF, stmtF.
- LogarithmicSums/RemainingCountingStatement.lean blob b9435d525f79b2af1a971259b99c155f7b90ce63 L10–40 six family predicates; L47–80 stmtEF_of and stmtF_of_stmtEF.
- LogarithmicSums/StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a L11–36 star_fam; imports StarNum and StarNumB (blobs 47c8e4430e4150f61202b8afa77ca2b6369c8043 and 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47), which supply numerical facts. PartnerCountOfCentral.lean blob f677b9041604e334f1115ae16b96cd61b1c7ee55 L597–689 starAt_D, L696–841 starAt_E, L842–end starAll_of. Their internal bounds remain to expand.

## 2. Exact scope and elementary estimates

Fix native D,L, parameter choice P, instance X, K.Nonneg, Ce>=0, constants C,bo, and a,b:HH(D)->Z satisfying InWin: for every top s, a_scale<=a_s<=a_scale+a_scale/(k x^(A/2)), b_s>=b'. Here A=26. For the pointwise theorem the constant guard is C>=3, C>=2 K.dl1+Ce, C>=4 K.dl2, bo>=0 and the independent hypothesis h9 says for EVERY prime p<=X'' that ep(p)<=Ce*f*k² log_p(a_scale). The outer uniform theorem instead uses adm9 at Ce and GainBoundConstants with Ce+1. Do not omit the +1.

Fix p prime with (inertClass or signal), p<=X''. J=lifts, m=|J|>=2; T=tops; R=reps, T_r=topsOn, a disjoint partition of T. V=VV equals goodReps when Cand and Sig<=x^-eps, empty otherwise; V subset R. Cand includes p<X', inertClass, x^(eps/4)<=ord(hP), and (p0<=p implies not InBand). Thus V nonempty forces not signal, p<X' and hP nonzero. TTP is T if signal or p>=X', otherwise tops with representative in V. Note that V empty does NOT by itself imply TTP empty.

Let l=log_p(a_scale), L2=log_p(2a_scale). Since a_scale>=2,p>=2: 0<=l<=L2<=2l. al_s=a_s-2cG is nonnegative and <=6a_scale/5 (basics, a_bounds); capU>=0 and capU<=fill+cG. The odd-power series is sum_{e odd>=1} p^-e=p/(p²-1)=gam. Geometric domination makes the selected nonnegative series summable. For p>=2, gam<=4/(3p), equivalent to p²>=4. The definitions of gU and g0 subtract nonnegative corrections (min terms, dl), and the penalty Pr>=0. Therefore each maximum in gainP is between 0 and gam*sum_{s in T_r} al_s. The partition R gives
  0 <= gainP_j <= (4/(3p))*(6/5)*|T|*a_scale = 8|T|a_scale/(5p) <= 4|T|a_scale/p.
The intermediate 8/5 constant is already present in the native calculation L515–518; not a new URT improvement. The exceptional zero-gain branch is also covered.

dl_r=K.dl1*nP*Nm²*L2+K.dl2*Nv_r*L2². The representative fiber contains all distinct translates by stepP up to its additive order (bs_nsmul, bs_bs, and order injectivity). Hence |R|ord(stepP)<=n. For signal nP=2ord(stepP), otherwise nP=ord(stepP), and f=2n. Thus |R|nP<=f; sum Nv_r=|T|<=f. It follows
  sum_R dl <= 2 K.dl1*f*Nm²*l+4 K.dl2*f*l².
Since k<=Nm and ep>=0, h9 yields sum_R dl+ep<=C*f*(Nm²*l+l²)=fl. Each dl>=0, so the same holds for sum_V dl. Also lo>=3cG L2>=0 because its common term C(cG+eta)L2 dominates and every branch addition is nonnegative under the guard, including bo.

## 3. Local shift and inactive orbits
For the actual native truncated shift lemma take p>=2, c>=0, 2c<=y<=A0, A0>=1, w_e>=1, 0<=w'_e<=w_e+c, Q(e) implies odd e. Define F_e=(y/p^e-w_e)_+ and G_e=((y-2c)/p^e-w'_e)_+ on Q, zero elsewhere. If F_e>0 then p^e<y<=A0 and e>=1. The positive-part difference satisfies F_e-G_e<=2c/p^e+c<=3c. All positive F indices lie in [1,floor(log_p A0)]. Both series are dominated by summable geometric series, so
  sum F - 3c log_p A0 <= sum G.
This derives the native bound without replacing the strict cutoff by an unrestricted sum. Here c=cG, y=a_s, A0=2a_scale, w=fill, w'=capU. If all Excl indices have y/p^e<=fill, their terms are zero, hence the excluded-index restriction in g0 does not change askP. It follows for each orbit
  sum_{s in T_r}(askP_js-lo) <= max(g0_jr,0)+dl_r.
Using the partition and sum_R dl<=fl proves noop after summing over m lifts. Its Excl premise is essential.

For p>=X', e>=1: a_s/p^e <= (a_scale+a_scale/Q)/X'=b'+b'/Q <= b'+b'/x, Q=kx^(A/2)>=x. Native top fill >=b'+b'/x. Excl entails partner=(false,s') for another top s' and odd e, so it gives a vanishing term. For a signal prime, partner's first component at odd e precludes Excl altogether. For inert hP=0 and p>=X', the odd partner is (false,s) itself; all askP terms vanish. These are exactly the native helpers top_small, excl_small_of_ge, not_excl_of_sg, hypothesis₂.

## 4. Four branches of gain_bound_at_of_star

Desired inequality is sum_{j,TTP}(askP-lo)-m fl <= sum_j gainP_j - tauP, alongside the individual gain bounds already derived. Assume StarAt for every candidate p, good representative r and lift j, with a,b fixed.
(i) V empty, TTP empty: tau=0, LHS=-m fl<=0<=sum gain.
(ii) V empty, full TTP, inert and hP=0: not signal implies p>=X'; hypothesis₂ makes askP=0, lo>=0, fl>=0, so LHS<=0=gain-tau.
(iii) V empty, full TTP, not inert-zero: gainP=sum_R max(g0,0) because p<=X''; tau=0. Signal or p>=X' ensures the Excl vanishing premise, so noop is exactly the result.
(iv) V nonempty: put u_jr=gU_jr-Pr_jr and q_r=ceil_N(tv_r)+Dp+1. StarAt gives
  sum_{s in T_r}(askP_js-lo) <= u_jr+dl_r-q_r  (r in V).
The served tops partition into these fibers by sum_TTP_served; no double counting. For each j, sum_V u_jr<=gainP_j by the max and nonnegative omitted-rep terms. Therefore sum_{j,TTP}(askP-lo)<=sum_j gainP_j +m sum_V dl_r -m sum_V q_r. Since ep+sum_V dl<=fl and m>=1, ep+m sum_V dl<=m fl. Subtracting m fl yields <=sum_j gainP_j-ep-m sum_V q_r = sum_j gainP_j-tauP. No assumption of positivity of u_jr or signed ask-minus-lo is needed.

## 5. Uniform family producer, not just its statement

gain_bound_all_of_star L730–737: basics gives w''>=500, hence X''=a_scale/w''<=a_scale. Use adm9.1 at all p<=X'' and weaken its Ce coefficient to Ce+1 (nonnegative f,k²,log_p a). The constant guard is at Ce+1. Universal a,b in InWin and StarAll give the exact local hypothesis. This yields GainBoundAllUniform (askP). RUN12 supplies the separate +1 shift to GainBoundAll (askG).

The actual theorem remainingCountingStatement_of_restStar (LogarithmicSums L43–64) fixes Fm,K,hK,C31>0,Ce>=0,Cm>=0. From RestStar choose C0>=0 BEFORE any X,Y; take
  C1=max(C0,3,2K.dl1+Ce+1,4K.dl2),  C=C1+1.
For arbitrary X,Y satisfying AdmFam, choose x1 from RestStar at C1 and x2 from AdmFam at delta=1, enlarged to exceed Fm.x1. At every x>=max(x1,x2) and every i, admission supplies a9 and aSz; native b_o=b^(x^(-eps/2))>=0. Apply the uniform theorem at C1, then As.asksAll_of from aSz.2.2 and Nm<=Sc<=cG from basics and St.base, then As.gainBoundAll_add_one_of_gainBoundAllRequired (RUN12). This is GainBoundAll at C1+1. C depends on the fixed family/constants but NOT on X,Y,x,i,a,b,p. Only the threshold may depend on X,Y. Cm>=0 is retained even though this particular proof does not use it.

Crucial closure: the source actually proves RestStar by St.star_fam (LogarithmicSums L94–96), not an axiom. StarFam L11–36 chooses max(CStar,0), then at delta=eps/48 combines the admission threshold with eventual numStar_ev and B.facts_ev, and Fm.x1+1; calls starAll_of. eps>0 follows from Fm.Ix_zero and native eps_pos. It uses A1 and A5 and all native parameters and sizes. Deep numerical and orbit-case lemmas remain open to human reconstruction. This is a source-level chain, not independent kernel verification or established Main root reachability. At L98–102 stmtEF and stmtF are constructed from rest0, remainingCountingStatement_of_restStar(restStar), rest2, restW, rest3, restT; those other obligations are distinct.

## 6. Executed check
Run the following JS under Node (or other BigInt ECMAScript runtime). Exact integer fixtures for aggregate inequalities, not native D7 geometric instances. The odd-power shift uses A0=p^M so log_p A0=M exactly; denominators are cleared. The floor and constant tests use nonnegative integer fixtures including zero. Finite checks do not prove the universally quantified source claims.

~~~js
function certificate(){
 const counts={candidate:0,empty:0,full:0,zero:0,shift:0,gain:0,floor:0,constant:0,negative:0};
 const check=(x,k)=>{if(!x)throw Error(k);counts[k]++};
 const max=(a,b)=>a>b?a:b;
 for(let m=1n;m<=6n;m++)for(let r=1;r<=5;r++)for(let mask=0;mask<(1<<r);mask++)for(let seed=0n;seed<20n;seed++){
  const V=Array.from({length:r},(_,i)=>i).filter(i=>(mask>>i)&1);
  const d=Array.from({length:r},(_,i)=>(seed+BigInt(i)*3n)%9n), q=d.map((v,i)=>1n+(seed+BigInt(i))%7n);
  const ep=seed%7n,F=d.reduce((a,b)=>a+b,ep)+(seed%3n);
  let ask=0n,g=0n,om=0n;
  for(let j=0n;j<m;j++)for(let i=0;i<r;i++){
   const v=BigInt(i),g0=(seed+2n*v+j)%13n-6n,u=(3n*seed+v+2n*j)%17n-8n;
   if(V.includes(i)){ask+=u+d[i]-q[i]-(seed+j)%4n;g+=max(u,max(g0,0n))}
   else g+=max(g0,0n);
   om+=max(g0,0n)+d[i]-(seed+j)%4n;
  }
  if(V.length){const tau=ep+m*V.reduce((s,i)=>s+q[i],0n);check(ask-m*F<=g-tau,"candidate")}
  else {
    check(-m*F<=g,"empty");
    check(om-m*F<=g,"full");
    check(-m*F<=0n,"zero");
  }
 }
 // Exact odd-power shifts; A = p^M and log_p A=M exactly.
 for(let p=2n;p<=13n;p++)for(let M=1n;M<=5n;M++)for(let y=1n;y<=45n;y++)for(let c=0n;c<=5n;c++){
   if(y>p**M||2n*c>y)continue;
   const den=p**(M+2n);let a=0n,b=0n;
   for(let e=1n;e<=M+2n;e+=2n){
    if((y+e)%4n===0n)continue;
    const w=1n+(y+e)%5n,wp=w+c-(e%2n&&c>0n?1n:0n),pe=p**e;
    a+=max(0n,y*(den/pe)-w*den); b+=max(0n,(y-2n*c)*(den/pe)-wp*den);
   }
   check(a-3n*c*M*den<=b,"shift");
 }
 for(let p=2n;p<=97n;p++)for(let a=5n;a<=100n;a+=5n)for(let t=0n;t<=8n;t++){
   // gamma * (6/5)*a*t <= (8/5)*a*t/p <= 4*a*t/p.
   check(6n*p*p*a*t<=8n*(p*p-1n)*a*t&&8n*a*t<=20n*a*t,"gain");
 }
 for(let f=1n;f<=8n;f++)for(let n=5n;n<=14n;n++)for(let l=1n;l<=5n;l++)for(let dl1=0n;dl1<=4n;dl1++)for(let dl2=0n;dl2<=4n;dl2++)for(let ce=0n;ce<=3n;ce++){
   const C=max(3n,max(2n*dl1+ce,4n*dl2)), ep=ce*f*(n-1n)**2n*l;
   const d=2n*dl1*f*n*n*l+4n*dl2*f*l*l;
   check(d+ep<=C*f*(n*n*l+l*l),"floor");
 }
 for(let c0=0n;c0<=10n;c0++)for(let a=0n;a<=9n;a++)for(let b=0n;b<=9n;b++)for(let ce=0n;ce<=5n;ce++){
   const C1=max(c0,max(3n,max(2n*a+ce+1n,4n*b)));
   check(C1>=c0&&C1>=3n&&C1>=2n*a+ce+1n&&C1>=4n*b&&C1+1n>=0n,"constant");
 }
 // Removing hypotheses: floor domination, nonnegative omitted dl, odd-support exclusion, m>=1.
 check(2n*1n>1n,"negative"); // d+ep>F
 check(4n+(-3n)<4n,"negative"); // negative omitted dl invalidates subset inequality
 check(3n>0n,"negative"); // y/p^e - w positive at omitted exponent y=8,p=2,e=1,w=1
 check(0n*7n<7n,"negative"); // m=0 cannot absorb ep=7
 return counts;
}
console.log(JSON.stringify(certificate()));
~~~

Actual V8 output: {"candidate":6840,"empty":600,"full":600,"zero":600,"shift":10668,"gain":17280,"floor":40000,"constant":6600,"negative":4}. Positive assertions 83188; four negative witness assertions. Not a Lean run.

## 7. Upstream and audit
At H, NotSingularOfCentral blob b69b961ff9d364f0dfee1ded1c13450b1a7a7eae: the L730–737 block matches after whitespace and whole-line comments are stripped; L619–728 does not match under that comparison. LogarithmicSums blob 567c67a62257c7a671d673fe52bd7f0d50b0315f, its L43–64,94–96,98–102 blocks do not match under same normalization; StarFam blob 7878557c8ff202e27b0351868ce2c98dee2c71e0 L11–36 does not match. IsResidueClassZero at H blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 combined blocks not exact text matches. No inference of logical difference or equivalence from mismatches; keep P authoritative and compare declarations individually later.

Independent audit requested: verify h9 weakening, cardinality of representative fibers, four-way TTP split, ep single vs m-scaled absorption, strict thresholds, all family quantifiers, and role-labelled root paths for Formalism.MainNotions.AuxBlock8.Pf.gain_bound_at_of_star, gain_bound_all_of_star, remainingCountingStatement_of_restStar, restStar, stmtEF, stmtF, St.star_fam and St.starAll_of. No original hypotheses removed. No URT benchmark claimed.

## RESUME HERE
Reconstruct St.starAll_of and the exact two branch inequalities starAt_D and starAt_E in PartnerCountOfCentral.lean (L597–841), starting with caseD_arith L497–544 and caseE_arith L545–561, then trace NumStar, numStar_ev and B.facts_ev. Resolve native residue-characteristic primality supplier separately. Request authenticated role-labelled edges for the names above. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.


---

[specialists/theta_lifts/RUN13_FOURIER_CONGRUENCE_AND_HAAR_TRANSFER.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/712130df1ee577f240234fb9bb090f68623ace0d/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN13_FOURIER_CONGRUENCE_AND_HAAR_TRANSFER.md) — blob 598193d3938a46c5e68cefe30ac0dffbe8f4ac39

# Theta lifts RUN13 — singular Fourier congruence and Haar transfer

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both branches of PositivityTheory.SiegelWeilFormula.Afc.fcConj_of, including the shared actual proof fc_levi and its normalization argument cNA_pres. Project OPEN; no Lean replay, novel theorem or URT speedup claimed.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts, CI checkpoint 389 (general Cathedral checks only), full theta RUN12 and 14 recent peer commit file lists/handoff excerpts. No duplicate of this task found. Peer editor manuscript not reread in full; external blueprint identified from handoff, not reopened this run. Prior RUN12 is commit 72b9ed732ee45bda1e7711816378a14c896bddbb. No physical gate or baseline Queue changes.

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (PR #1313, 2026-11-24 18:24:32 UTC), unchanged since RUN12. At H CongUnip.lean has blob 81206fd632f95d3df4d081cb3b888f84688869dd (86 lines including final empty line), IncMFromBlocks.lean cf88816c109ef25ce5ff4e207e4a0e0705d6e672 (398 lines), LowerRankDatum.lean 50a6dbbb774c444de5da6b5e7900d599c6e7c4bb (133 lines); at P counts 180,354,199. The original anchors fcConj_of, fc_deg, fc_U and FcConj are absent in the same H paths; fc_levi remains. No claim of deletion from the corpus, migration equivalence or validation of H. Everything below uses P.

## 1. Exact theorem and quantifier order
Afc.fcConj_of (CongUnip:174–175) has type AuxiliaryPrimeFunction → FcConj. Its first argument is literally ignored by the proof term (fun _ ...). Keep it in the source theorem/interface; the two proofs do not require its evidence. Despite its name, AuxiliaryPrimeFunction is a package of a covolume datum, a rational Weyl witness and topological group/local compactness/Hausdorff/second-countability conditions (AuxiliaryPrimeFunction:206–207), not a new prime-number restriction. Do not infer a hidden arithmetic condition from the name.

FcConj (LowerRankDatum:168–173) universally quantifies over number fields F,E, their Field/NumberField and Algebra F E instances, sigma:E→ₐ[F]E, upper datum d:SD sigma, L:LD d, nb, lam, Gcal and hc:CoefData. Write K=nA sigma d.Y d.b, Lambda=nF sigma d.Y d.b, G=d.G, Gamma=rat2 sigma d.Y, iota=inclR and C=cA sigma. Let T be a rational Fourier label (in Lambda); write its underlying matrix simply T. CoefData consists of the specified upper triangular frame for nb, additive Haar measure lam, additive fundamental domain Gcal for Lambda, and lam(Gcal)=1 (DefsPlus:24–32). Define
  F_T[f](x)=integral_(beta in Gcal) f(nb(beta)x) psi(-Tr_(AE/AF)(tr(T beta))) dlam(beta).
Here tr is matrix trace, Tr is algebra trace, psi the specified additive character of AF. These are the native definitions, not arbitrary Fourier integrals.

(i) For EVERY T with NOT IsND(T) (det(T)=0 in AE), there EXIST gamma in Gamma and T0,T' (upper and lower rational labels), with L.IsSub T0 T', such that for EVERY continuous f:G→C invariant under all left Gamma translations, and EVERY x,
  F_T[f](x)=F_T0[f](gamma x).
The witnesses are chosen before f and x. IsSub means zero entire distinguished row AND column, and T' is the retained submatrix.

(ii) For EVERY uM,nu,Ucal with L.UData, EVERY T,T' satisfying IsSub, EVERY continuous left-Gamma-invariant f, EVERY u in L.ratV and x,
  F_T[f](uM(u)x)=F_T[f](x).
UData contains the specified diagonal block frame, additive Haar property, ratV fundamental domain and nu(Ucal)=1 (LowerRankDatum:117–119). The native fc_U proof uses the frame part only; preserve the other conditions in the packaged statement. Neither branch assumes m<n, a vacuum state or positive definiteness of the Fourier label. Continuity of f is present in FcConj, although the helper fc_levi does not require it.

## 2. The shared covariance theorem fc_levi
IncMFromBlocks:273–349. Hypotheses: sigma involutive, IsFrame2, psi trivial on the rational base field F, CoefData, g in Gamma with frame diag(A,D), rational Fourier labels T,T1, the equality C(A)^transpose T A=T1, f left-Gamma-invariant, arbitrary x. Its exact orientation is
  F_T[f](g x)=F_T1[f](x).
Let Ac=C(A)^transpose and Dc=C(D)^transpose. The form preserved by a group element in this frame is Q=[[0,I],[eps I,0]], eps an integer unit. From blk_rel and transpose obtain Dc A=A Dc=I and Ac D=D Ac=I. Thus A,D have genuine inverses even in the adelic coefficient ring; no field cancellation assumed there. The inverse frame is diag(Dc,Ac). The map
  tau(beta)=Dc beta D,    tau^-1(beta)=A beta Ac
is the native additive homeomorphism cNA: conjugation by g and g^-1 preserves K, and matrix multiplication is continuous. In particular nb(beta)g=g nb(tau(beta)) (309–312). Because g and its inverse are rational, rat_blocks supplies rational lifts A0,D0 and mem_nF_iff implies tau(Lambda)=Lambda, in both directions. This is stronger than preservation of K alone.

The change of Fourier label is forced by the trace identity:
  tr(T1 tau(beta))
   =tr(Ac T A Dc beta D)
   =tr(Ac T beta D)
   =tr(D Ac T beta)=tr(T beta).
This uses cyclicity of matrix trace over the commutative ring and the inverse equations, not a claim that trace is unchanged under arbitrary left and right multiplication. Consequently the original integrand equals H(tau(beta)), where H(beta)=f(nb(beta)x) psi(-Tr(tr(T1 beta))). The f factor follows by left Gamma invariance.

### Why there is no measure multiplier (cNA_pres, 232–271)
The pushed Haar measure tau_*lam is a scalar multiple of lam by Haar uniqueness. The inverse homeomorphism likewise pushes Haar to Haar, hence is quasi-measure-preserving. Because tau induces a bijection of the rational lattice and is additive, tau(Gcal) is again an additive fundamental domain for Lambda. The equal-measure theorem for fundamental domains gives lam(tau(Gcal))=lam(Gcal)=1. Meanwhile (tau_*lam)(tau(Gcal))=lam(Gcal)=1. Comparing the two expressions forces the Haar scalar factor to equal 1. This uses the specified fundamental domain normalization, not an arbitrary Jacobian cancellation. The source supplies local compactness, second countability and Borel structure from nA_top, and uses both lattice inclusions to construct the actual equivalence eF.

### Why the domain can be changed back (337–349)
For gamma0 in Lambda, nb(gamma0+beta)=nb(gamma0)nb(beta), with nb(gamma0) rational. Thus the f factor in H is periodic. Both T1 and gamma0 have rational lifts; the matrix trace of their product lies in E and its algebra trace lies in F after inclusion (psi_rat_trace:227–230, using Dense.trace_tmul). The rational-character factor therefore equals 1. So H is Lambda-periodic. The source uses hpres.setIntegral_image_emb and hfd.setIntegral_eq hc.2.2.1 hH to move the integration domain first to tau(Gcal), then to Gcal. This is the actual complete covariance argument at the level of the stated Lean integral identities. For continuous inputs the separate FcCont.fcAll establishes integrability; no unrestricted classical integrability assertion for arbitrary f is made here. The final two integral lemmas and Haar uniqueness are imported results, not newly proved here.

## 3. Singular label to zero-row/column form (fc_deg, CongUnip:113–172)
Lift T to M in Mat_n(E) using mem_nF_iff. The determinant homomorphism and injective iota show det M=0 over the number field E. Choose nonzero v with Mv=0. The source exists_gl_col (ExistsGlCol:71–83) constructs P in GL_n(E) with column i0 equal to v: take j with v_j nonzero, replace column j of identity by v (determinant v_j), then swap j and i0. The determinant remains nonzero. This does not require a basis choice depending on f or x.

For the rational form label M, nCond_rat gives M^transpose=-eps sigma(M), since the original frame has sign eps. Set M0=sigma(P)^transpose M P. Then column i0 of M0 is sigma(P)^transpose Mv=0. The row also vanishes: sigma(v)^transpose M=-eps sigma(Mv)^transpose=0. Both statements follow over E, and their images under iota give the required adelic equalities. The second identity explicitly uses the conjugate symmetry, not merely singularity. Congruence and retained-submatrix closure of nCond (ExistsGlCol:53–69) give the upper and lower form conditions. The signs agree by eps_eq (37–47), which derives eps from the underlying form sign (MemRatVIff:45–53); mixed Hermitian/skew-Hermitian cases would force the common nonzero-dimensional form A.J to be zero, contradicting its signature witness (ExistsGlCol:19–35). Rationality of the new labels follows directly from M0 and its rational retained block. Thus T0=iota(M0), T'=retained block satisfy IsSub.

The rational Levi supplier levi_ex (IncMFromBlocks:145–178) explicitly constructs diag(B,sigma(B^-1)^transpose) in the frame from any B in GL_n(E), with explicit rational inverse, preservation of Q, and rat_of. Apply it to B=P^-1 to obtain gamma. Then C(A)^transpose T0 A=T because A=iota(P^-1); indeed sigma(P^-1)^transpose sigma(P)^transpose M P P^-1=M. Applying fc_levi with input label T0 gives F_T0[f](gamma x)=F_T[f](x); reverse the equality. Using B=P instead of P^-1 in this step would in general reverse the intended label transfer. No division by a Fourier coefficient occurs.

## 4. Rational shear invariance (fc_U, CongUnip:47–98)
For u in ratV, MemRatVIff:17–32 proves u=iota(v) for v in E^(L.n): the image is closed under addition, zero and negation, so its additive subgroup closure is its image. This is algebraic closure, not topological closure. Put N=sum_j v_j E_(i0,em(j)). Since em(j) never equals i0, N²=0. Thus B=I+N is invertible over E with inverse I-N. UData supplies uM(u) with upper diagonal frame block iota(B) and an unspecified second block. The rational Levi construction supplies g with this same first block and second block C(iota(B)^-1)^transpose. By blk_rel and involutivity, the second block of any such group element is forced to be the same; injectivity of inFrame gives uM(u)=g in Gamma. This establishes rationality for the actual uM witness, not merely existence of some rational group element.

Write S=iota(N). The zero row/column condition on T gives T S=0 and C(S)^transpose T=0. Therefore
  C(I+S)^transpose T (I+S)
    =T+T S+C(S)^transpose T+C(S)^transpose T S=T.
CongUnip:26–45 (cong_unip) proves this for every adelic vector u, without rationality; the rationality of u is separately necessary in fc_U for left automorphy and the Fourier change of variables. Apply fc_levi with T1=T. This is branch (ii). Do not conclude invariance under all adelic shears from this lemma: the separate UEx density bridge plus archimedean invariance and continuity is needed.

## 5. Actual source consumers and frontier
JointT:7 packages OrbRes, UEx and AuxiliaryPrimeFunction → FcConj. Fin.siegelWeilStd_of (SiegelWeilStdOf:63–67) directly supplies (Afc.fcConj_of hA) as the 24th of 25 AStep.stepOf premises. AStep.stepJ (NdZero:70–72) applies branch (i) to the continuous left-invariant residual Bj, then uses deg on the normalized singular label. Branch (ii) is used in AStep.holCoef_pf (HolCoefPf:88–89) as the rational invariance input of UEx, alongside the separate local-place invariance; and in AStep.avgHol_pf (AvgHolPf:65–70) to replace arbitrary u by a rational translate lying in a compact set, enabling a uniform bound for the averaged holomorphic family. Those are source-body references, not authenticated kernel edges. They explain exactly why two branches are needed. Request role-labelled dependency witnesses for PositivityTheory.SiegelWeilFormula.Afc.fcConj_of, .fc_deg, .fc_U, .fc_levi, .cNA_pres, .levi_ex, .exists_gl_col, .cong_unip and .eps_eq. No claim of root reachability from names alone.

## 6. Executed source check and replay
14 pinned files retrieved, 13 independently supplied expected Git blob IDs matched, 1 additional blob ID recorded (SigmaSigmaOfGood), 117/117 exact literal line anchors matched in V8 connector JS, no locator failures. This checks source locations only, not the proof's validity. Representative replay below (not separately run in a local upstream checkout) rehashes the 14 raw Git blobs and tests selected anchors; the full 117 anchors were checked during this run. No artificial numerical test used.

```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicFormCongruences/CongUnip.lean","a0aba4e26b13b65da9a0f589309948d095a1ec6f",[(26,"theorem cong_unip"),(47,"theorem fc_U"),(57,"mem_ratV_iff"),(61,"N0 * N0 = 0"),(96,"refine fc_levi"),(113,"theorem fc_deg"),(130,"exists_mulVec_eq_zero_iff"),(132,"levi_ex hσ hb a'⁻¹"),(142,"have hcol"),(146,"have hrow"),(163,".symm"),(174,"theorem fcConj_of")]),
("AdelicFormCongruences/ExistsGlCol.lean","2ab2ba1deb3c076e11e342d2b53f842d7b9a914a",[(37,"theorem eps_eq"),(53,"theorem cong_nCond"),(63,"theorem sub_nCond"),(71,"theorem exists_gl_col"),(78,"Equiv.swap")]),
("AdelicFormCongruences/MemRatVIff.lean","e167d9eb6476b9fe2498e324a3d051ca6e16b684",[(17,"theorem mem_ratV_iff"),(45,"theorem eps_of_sign")]),
("AdelicFormCongruences/IncMFromBlocks.lean","c357c339293dcc98f56347365c4dcd6d3bf04fae",[(145,"theorem levi_ex"),(232,"theorem cNA_pres"),(258,"lam (τ '' 𝓖) = 1"),(267,"addHaarScalarFactor lam = 1"),(273,"theorem fc_levi"),(306,"let τ"),(309,"have key"),(314,"have hτF"),(318,"have hτF'"),(337,"have hH"),(344,"psi_rat_trace"),(348,"setIntegral_image_emb"),(349,"setIntegral_eq")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(117,"def UData"),(121,"def IsSub"),(168,"def FcConj"),(182,"UEx → FcConj → OrbRes")]),
("DefsPlus.lean","c785165cd72cbd00daa51ff67e0e400d77566980",[(27,"def CoefData"),(30,"def fc"),(34,"def IsND")]),
("AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(206,"def AuxiliaryPrimeFunction")]),
("FourierCompactness/SigmaSigmaOfGood.lean","99495bbe69e76dcf7a35f0adb7c97cd4ba80d404",[(125,"theorem mem_nA_iff"),(197,"theorem mem_nF_iff"),(365,"theorem sigma_sigma_of_good")]),
("AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")]),
("SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(65,"(Afc.fcConj_of hA)")]),
("AdelicDilations/NdZero.lean","05314df049d2034876de64be326e9e518ce7ff6b",[(70,"(H.fcConj"),(72,"exact deg")]),
("AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(88,"H.uEx"),(89,"H.fcConj")]),
("AdelicDilations/AvgHolPf.lean","4673a7f5fb7831b10990c909e09dc75764d6e4aa",[(70,"H.fcConj")]),
("AdelicFormCongruences/ProjectedBlockUpperSum.lean","3cd16cff53587fc3e38a8dffb4401783092e0550",[(397,"theorem uEx"),(432,"dense_vec")])]
n=0
for p,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",pin+":"+b+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,p
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(p,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## 7. Status and next step
Both original quantified branches preserved. Zero additional hypotheses. Classical matrix congruence, rational Levi embedding, additive Haar uniqueness and Fourier quotient change of variables are not asserted new mathematics; native theorem bodies and named imported lemmas are distinguished. No placeholder/axiom audit of the transitive chain, no kernel replay, no source migration equivalence, no speed benchmark. Deeper suppliers Dense.trace_tmul, Haar/fundamental-domain lemmas and topology/character constructions are open for dependency expansion. No full proof completion.

RESUME HERE: reconstruct Afc.uEx in AdelicFormCongruences/ProjectedBlockUpperSum.lean:397–434 and its actual suppliers exists_udata, uM_eq, exists_iota, dense_vec and dense_Sw (especially the tensor-coordinate extension of GlobalTheory.T.dense_rationals_plus_single_place_adeles). Prove the stabilizer is a closed additive subgroup and explain why one chosen archimedean place plus rational vectors suffices, retaining the separate local invariance hypothesis. Do not redo FcConj or OrbRes. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration and literature. Project OPEN.

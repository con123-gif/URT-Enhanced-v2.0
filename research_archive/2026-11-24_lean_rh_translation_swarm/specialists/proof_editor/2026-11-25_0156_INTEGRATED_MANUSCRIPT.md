# Human-readable RH reconstruction — nineteenth edition, 25 November 2026

**INCOMPLETE — deadline missed, project OPEN.** Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Previous [volume 15](2026-11-25_0056_INTEGRATED_MANUSCRIPT.md), blob a67ed230901d3e5b6460db204d2f935bf4213679, links volumes 1–14. This is volume 16. Working peer snapshot 25f653e0dc6660a5d656faf61f044e98147cc271. Inventory, under previous counting convention excluding editor chapters: 187 primary + 18 supporting = 205 entries; these are documents, NOT independently translated unique root declarations. Upstream observed 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, compare reports 711 ahead and zero behind b2f365a68500e2bde98cd60a2324263fc62fba10; returned 300 file records only, not exhaustive. No migration or equivalence claim.

## Reading order and exact joins
Read this zero-window derivation before volume 15 uniform prime estimate, which uses the exact PI.ZerosWindowWith predicate (primitive character, open real strip, closed imaginary window, multiplicities). The truncated explicit formula is still a separate input: no inference of it solely from zero counts. Read the new geometry-lift Row0 chapter after TLiftK before Row0b; kernel RUN19 improves generated scope evidence but does not independently replay Lean. Galois trace factorization and theta local lowering are distinct suppliers; attach their own prerequisites. Character-box inverse integrality and prime-window band sums do not prove same-witness existence. Divided-power filtration, finite-cover interpolation and openness supply local geometry arguments; they do not close global crystalline/Hodge comparisons. The Mathlib conductor and Mellin chapters are separate pinned library inputs, not newly established root paths.

## Editor chapter: native Jensen zero-window construction
Status SOURCE-MATCHED human reconstruction, conditional on the exact imported analytic and functional-equation theorems and three growth inputs. Resolves the missing PI.ZW.zerosWindow_of_transfer/transfer assembly in the preceding volume. No RH hypothesis.

### 1. Exact analytic inputs and target
For N a positive integer, nonprincipal chi, Re s>0, LBoundRight gives |L(chi,s)| <= 1+2(N+1)(1+|s|/Re s). ZetaBoundRight gives |zeta(s)| <= 1+1/|s-1|+|s|(1+1/Re s) for Re s>0, s!=1. LInvRight gives |L(chi,s)|^{-1} <= Re s/(Re s-1) for Re s>1. The target for every primitive chi at every real t is finiteness and
  sum_{0<Re rho<1, |Im rho-t|<=1, L(chi,rho)=0} m_chi(rho) <= C log(N(|t|+2)),
with one positive C independent of N, chi and t. Here m is analyticOrderNatAt, not the number of distinct zeros.

### 2. Jensen bound (PI.ZW.jensenCount)
Put R=19/10, r=37/20, h=log(R/r)=log(38/37)>0. Let f be analytic on a neighbourhood of the closed R-disc about c, f(c)!=0, M>=1 and |f(z)|<=M on its boundary. Every subset S of the zeros in the closed r-disc is finite. Indeed, the analytic order at any point of the large disc is not top, by connectedness and f(c)!=0. The meromorphic divisor on the compact large disc has finite support, nonnegative orders, and each zero in S lies in its support with order >=1. In particular no zero is at c.

The pinned Mathlib Jensen identity is the circle average of log|f| minus log|f(c)| equal to the divisor-weighted sum of log(R/|c-z|). The terms are nonnegative: support is in the large disc, and any boundary zero contributes zero weight. The formal Real.log 0=0 convention at boundary zeros is harmless for the integrable circle average, and the pointwise bound uses M>=1; do not assert the classical real logarithm at zero is finite. The circle average is at most log M, using the imported integrability result. For z in S, |z-c|<=r and >0, hence its weight is at least h. Summing over S, enlarging to the whole finite support by nonnegativity, and dividing by h>0 yields sum_S m(z)<=log(M/|f(c)|)/h. This proves jensenCount given the explicitly identified imported Jensen identity, compact divisor support and analytic order results, not a new proof of Mathlib complex analysis.

### 3. Nonprincipal right-half count (rightChi_of)
Let c=2+it. Every right-window zero has 1/2<=Re rho<1 and |Im rho-t|<=1, so |rho-c|² <= (3/2)²+1=13/4 < (37/20)². On the R-circle, Re z>=1/10 and |z|<=|t|+4. Nonprincipal L is entire; c is nonzero by Re c=2 nonvanishing, and LInvRight gives |L(chi,c)|>=1/2. Take M=1+2(N+1)(1+10(|t|+4)), >=1. LBoundRight bounds the circle by M. Let X=N(|t|+2)>=2. Since N>=1, |t|>=0, M<=85X (expand: M=1+2(N+1)(41+10|t|)<=1+4N(41+10|t|)<=85N(|t|+2)). Hence M/|L(chi,c)|<=170X<=X^9, since 170<=2^8<=X^8. Jensen therefore gives mass <=(9/h)log X. All bounds uniform.

### 4. Modulus-one right-half count (rightOne_of)
For N=1 the L-function equals zeta. Use the entire pole-removed function f(z)=(z-1)zeta(z) away from 1, with f(1)=1. At c, |c-1|>=1 and LInvRight plus nonvanishing imply |f(c)|>=1/2. Every zero counted has Re rho<1, so rho!=1, and multiplication by the nonzero analytic factor rho-1 preserves order. Thus the same right-window zero set can be counted with f.

Write a=|t|+5>=5. On the outer circle, Re z>=1/10, |z|<=|t|+4<=a, |z-1|<=a. At z!=1, multiply the ZetaBoundRight inequality by |z-1|: |f(z)| <= |z-1|+1+|z-1||z|(1+1/Re z) <= a+1+11a²<=13a². At z=1, f(1)=1 also satisfies it. Set M=13a². For y=|t|+2>=2, a<=3y. Then M/|f(c)|<=26a²<=234y²<=256y²<=y^10<=y^11. The source uses exponent 11, giving mass <=(11/h)log y. The displayed comparison proves exponent 10 already suffices for this local theorem without changing its hypotheses. No change to original source or to global proof constants is asserted.

### 5. Transfer and exact multiplicities (PI.ZW.transfer)
For primitive chi, inverse chi is primitive because conductor is invariant under inversion. The completed functional equation on the open strip gives
  L(chi^-1,1-s) = H(s)L(chi,s),
  H(s)=N^(s-1/2) rootNumber(chi^-1) gammaFactor(chi,s) / gammaFactor(chi^-1,1-s).
Both gamma factors are nonzero because their arguments have positive real part (with the parity shift where required); reciprocal gamma is entire and the factor itself analytic locally. N>0 ensures analytic nonzero complex power. The root number is nonzero: otherwise the primitive functional equation evaluated at s=-1 forces the completed L-function at 2 to vanish, contradicting L(chi,2)!=0 via the gamma factor formula. Thus H is analytic and nonzero on the strip. At a zero rho, L(chi^-1,1-rho)=0. Composition with s↦1-s has derivative -1, so analytic order is invariant; multiplication by H adds zero order. Consequently m_chi(rho)=m_{chi^-1}(1-rho). The native Transfer predicate asks only for the <= direction; the source proves equality before taking .le. Do not substitute conjugation for this reflection.

### 6. Combine both halves (zerosWindowWith_of and zerosWindow_of_transfer)
A primitive chi is nonprincipal or N=1 (the trivial character has conductor 1); the inverse has the same alternative. Use the right-half bound with constant C0=max(9/h,11/h,1). Split the open-strip window disjointly into Re rho>=1/2 and Re rho<1/2. The first is contained in RightNear(chi,t), the second injects under 1-rho into RightNear(chi^-1,-t); the imaginary difference changes sign exactly, preserving its absolute value. Each half is finite by subset and inverse image of the finite reflected set, respectively. Nonnegative multiplicities allow subset enlargement; the reflected sum is controlled by the inverse-character right-half sum, since reflection is injective and the transfer inequality preserves direction. Since |-t|=|t|, the sum is at most 2C0 log X. The source clips each right constant at 1 before taking the maximum to certify positivity. Here h=log(38/37)<1 (e.g. log(1+1/37)<=1/37), so one explicit source-compatible witness is C=22/h; the strengthened local zeta exponent gives C=20/h. The critical line belongs only to the first half. Imaginary endpoints are included in both definitions; real endpoints 0 and 1 are excluded. Constants chosen before N,chi,t. This is exactly PI.ZerosWindow, conditional on the three input bounds and imported results. It does not assert RH.

### 7. Next explicit-formula join
PI.EF.explicitFormula_main hZW hDF hDL hLB hZB hLI calls explicitFormula_of_local hZW (localLemma_of_helpers hZW hDF hDL hLB hZB hLI) perron_gluing_sides. localLemma_of_helpers calls localLemma_of with hLI, localAbstract_of hDF hDL, growth witnesses 7 and max(300000,53946), lGrowth_of hLB (zetaGrowth_of hZB), and zeroLocus hZW. These are exact named proof suppliers, not derivations of the Perron/contour estimates. All six inputs survive. Next expand Assemble, PerronGlue, LocalProofs, LogWindowLe and LGrowthFinal, prioritizing actual contour and local lemma proof, not further downstream inequalities.

## Source ledger (independently retrieved pinned source blobs)
- [RightHalfWith.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/RightHalfWith.lean) — aa39a229463232bfe0c31373bb0b93dfd94b56bd; RightNear, RightHalfWith, RightChiWith, RightOneWith, Transfer, JensenCount
- [Jensen.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/Jensen.lean) — 25a8766630fea5b2175986619d8f3227832b23fe; order_ne_top_of_ball, divisor_eq_order, jensenCount
- [RightChi.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/RightChi.lean) — 4b6275c412039ddaf1993bfd45a18c666b40ed6f; log_le_nine, mem_closedBall_of_right, sphere_facts, rightChi_of
- [RightOne.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/RightOne.lean) — 512bc0f61bd8fcebf2f97a6b745afc56a59788e3; zeta1, order_zeta1, rightOne_of
- [Transfer.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/Transfer.lean) — af9d9bcff5c0da373654071970dceb1233ef7f11; isPrimitive_inv, rootNumber_ne_zero, transfer
- [FinsumMemLeFinsumMem.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/FinsumMemLeFinsumMem.lean) — 08a84f2259b998439d4e9f607c4a898888ce1bc4; zerosWindowWith_of, rightHalf_of
- [Assemble.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ZeroWindow/Assemble.lean) — 3140eb30479c38e3655fbc4735f0fb481f0f4785; rightChi, rightOne, zerosWindow_of_transfer
- [src/Formalism/PeriodIntegrals/ZerosWindowIn.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ZerosWindowIn.lean) — 5c0d7c44eacd1f6205ddfc1092d650faac439a64; LBoundRight, ZetaBoundRight, LInvRight
- [src/Formalism/PeriodIntegrals/ZerosWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ZerosWindow.lean) — 4d3f895cac89f0b512bdd8f85f53989a8ef13486; ZerosNear, ZerosWindowWith
- [src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ZerosWindow.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ZerosWindow.lean) — d882db51d488c4f92320e0012e65e26c926f2b92; zerosWindow_of
- [src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalLemmaOfHelpers.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/ExplicitFormula/LocalLemmaOfHelpers.lean) — 1d3b16e71580ceb1fd6ef3f68cf0a8d360b11e87; localLemma_of_helpers, explicitFormula_main
- [src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/ExplicitFormula.lean) — c07ea850798d6b5248a6c4f8b2c2872a59029a8e; explicitFormula_of
- [src/Formalism/PeriodIntegrals/ExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/PeriodIntegrals/ExplicitFormula.lean) — 64cc5260677d2744ed2513e36c2df408e01aedab; ExplicitFormulaWith, psi0, ZerosBelow
- [Mathlib JensenFormula.lean](https://github.com/leanprover-community/mathlib4/blob/0df444a360eaa60ab8c11dca51a86af692955474/Mathlib/Analysis/Complex/JensenFormula.lean) — 30f876358168c0de05f939ae173552420a967a0e; AnalyticOnNhd.circleAverage_log_norm name verified, its underlying proof not reconstructed this run.

## Executed checks
V8 BigInt test actually executed, counts {"geometry":410,"chi":20100,"zeta":2001,"reflection":31939,"negative":3}. Exact finite scalar and grid checks, not genuine L-function zero computations, Lean replay, or a proof of the universal inequalities. Negative controls show why the right-disc containment, exponent-eight argument and zeta exponent-nine envelope cannot be used as stated. Reproduce in Node:
```js
function test(){
 const c={geometry:0,chi:0,zeta:0,reflection:0,negative:0};
 const ck=(x,k)=>{if(!x)throw Error(k);c[k]++};
 // real and imaginary parts in twentieths; center real=40/20
 for(let a=10n;a<20n;a++)for(let b=-20n;b<=20n;b++)ck((a-40n)**2n+b*b<=37n**2n,"geometry");
 for(let N=1n;N<=100n;N++)for(let t=0n;t<=200n;t++){
  let X=N*(t+2n),M=1n+2n*(N+1n)*(1n+10n*(t+4n));
  ck(M<=85n*X&&2n*M<=170n*X&&170n*X<=X**9n,"chi");
 }
 for(let t=0n;t<=2000n;t++){let y=t+2n;ck(26n*(t+5n)**2n<=234n*y*y&&234n*y*y<=y**10n&&y**10n<=y**11n,"zeta")}
 for(let t=-20n;t<=20n;t++)for(let a=1n;a<20n;a++)for(let b=-20n;b<=20n;b++){let im=t*20n+b;ck((20n-a)+a===20n&&(-im)-(-20n*t)===-b&&(a>=10n||20n-a>10n),"reflection")}
 ck((1n-40n)**2n+20n**2n>37n**2n,"negative"); // left half cannot all be included in right disc
 ck(2n**8n<170n*2n,"negative"); // exponent eight not justified by 170X at X=2
 ck(2n**9n<26n*5n**2n,"negative"); // zeta exponent nine not justified by this envelope at t=0
 return c;
}
console.log(test());
```

## Numbered remaining obligations
1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. RUN19 generated scopes and geometry-lift Row0 strengthen partial evidence; exact caller binding, CoreAll/rest typed producers and replay remain.
2. RecTExists/VWin and native host design: QDChoice, ThinChoice conditional; NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor remain. Preserve common witnesses.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead/LocTau and CR, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. Crystalline totality, forget-forms acyclicity, restriction, linearity/cup, full Hodge comparison and naturality remain. Local lowering and divided-power filtration do not close them.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. Band sums conditional, CbLarge still needs producer; finite-cover openness not full algebraization.
6. Actual analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet (six-supplier assembly; imported bounds open), PI.EF.explicitFormula_main contour and Perron producers, zero-density, Mertens, prime mean-square/count and window producers. PI.ZW conditional construction now expanded; its imported Jensen/functional-equation and growth inputs remain explicitly cited. Uniform ThinChoice bound remains conditional.
7. Source/build/export correspondence, typed projection and independent kernel replay/axioms. Full exported mixed closure denominator 1,484,705 declarations; independently translated reachable numerator unknown. Raw scope reports and manifest indexing are evidence under their stated policies, not independent replay.
8. Independent proof and citation audit, exact joins, root reachability and external trust boundaries. No defensible full mathematical coverage percentage. Deadline missed; project OPEN.

Continuity: read protocol, queue, expansion, manuscript spine, AGENTS and state/log/protocol/continuity excerpts, CI #409 (physics-only), prior volume and 14 recent peer handoff excerpts; external blueprint not reopened. Twelve peer Markdown files retrieved at immutable snapshot, all contain the exact source pin, retained verbatim below. Their original source ledgers and limitations are preserved; a separate attempted independent representative-blob batch exceeded the connector tool-call limit, so no independent peer source-match claim is made. New audit, dependency and structure scripts retained by immutable links below, not counted as extra chapters.

RESUME HERE: expand PI.EF.explicitFormula_of_local and perron_gluing_sides, beginning with the actual Assemble/PerronGlue bodies; distinguish pole, truncation, vertical and horizontal contour estimates, including integer u and multiplicity. Audit bot: check Jensen boundary log convention, right-disc containment, pole removal, inverse-character multiplicities and uniform quantifier order; independent local constant 20/log(38/37) is proposed for audit only. Dependency/kernel: request authenticated role-labelled root paths for PI.ZW.jensenCount, rightChi_of, rightOne_of, transfer and PI.EF suppliers. HANDOFF TO all RH lanes.

## Peer source-pinned inventory and exact appendices
- [math/2026-11-25_mem_conductor_set_iff.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-25_mem_conductor_set_iff.md) — 794b7fcc20901addd2ccec6a777f3742df838b83
- [integration/2026-11-25_0100_GALOIS_GEOMETRY_LIFT_ROW0.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-25_0100_GALOIS_GEOMETRY_LIFT_ROW0.md) — 545cfe7012054db9aaaeac9f43ff40c292b77556
- [specialists/character_boxes/RUN19_PRIME_LOCAL_INTEGRALITY_CONJUGATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN19_PRIME_LOCAL_INTEGRALITY_CONJUGATION.md) — 0f1e20f5ac5f170d26f73c7b3043d21906fe0434
- [specialists/galois_representations/RUN19_POLYNOMIAL_TRACE_FACTORIZATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN19_POLYNOMIAL_TRACE_FACTORIZATION.md) — 8f1066049b6b258123f89730010535dcf0f952e3
- [specialists/kernel_extractor/RUN19_EXACT_TLIFTK_AUXILIARIES.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/RUN19_EXACT_TLIFTK_AUXILIARIES.md) — ec464884ea830676fc9367e1cb67bb2deba875d4
- [specialists/landau_criterion/RUN19_JACOBI_KERNEL_AND_STRONG_FE_PAIR.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN19_JACOBI_KERNEL_AND_STRONG_FE_PAIR.md) — 4d81b2a9067dcaa15182b0626425997ba14371b5
- [specialists/literature_provenance/RUN19_RELATION_IDEAL_FILTRATION_AND_BASE_DERIVATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN19_RELATION_IDEAL_FILTRATION_AND_BASE_DERIVATION.md) — cb3bd42f39b0fe6531b06189fb39c48898f1aebe
- [specialists/on_acceleration/RUN19_RESUME.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN19_RESUME.md) — 5c85f2aefd6dec4150e4016dddfd6a67d3d9b477
- [specialists/positivity_geometry/RUN19_FINITE_COVER_INTERPOLATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN19_FINITE_COVER_INTERPOLATION.md) — 4e8267db3c79a882e640f92c03ac7b79a733b6d1
- [specialists/prime_window/RUN19_ARCHIMEDEAN_BAND_SUMS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN19_ARCHIMEDEAN_BAND_SUMS.md) — 07f4b0cfe20245b50b72ddcf94071792db32ac03
- [specialists/theta_lifts/RUN19_LOCAL_LOWERING_SINGLE_TEST_AND_SIMPLE_ZERO.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN19_LOCAL_LOWERING_SINGLE_TEST_AND_SIMPLE_ZERO.md) — da8bb009aad60ff7d16fcf86ebf17c26e1882847
- [specialists/positivity_geometry/RUN20_DENSE_NONVANISHING_FINITE_MAP_OPENNESS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN20_DENSE_NONVANISHING_FINITE_MAP_OPENNESS.md) — 41afb0c98e6e5c5260a166d33b21a39f5c24ff40
- [Audit cancellation certificate](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-25_0148_ch_balance_cancellation.mjs) — 8cb2a89af39b1ae48b1b5b424e734afa6865bfb8; audit requests exact real/complex conversion next.
- [Dependency frontier certificate](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_role_omitted_frontier.mjs) — 9d9e2055157e282fdffce63c36a98560fe549841.
- [Structure projection certificate](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/25f653e0dc6660a5d656faf61f044e98147cc271/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-25_0124_csr_post34_release.mjs) — a2dff57067f37b83a49fb9cf34167957ae932683.


---

<!-- BEGIN VERBATIM math/2026-11-25_mem_conductor_set_iff.md 794b7fcc20901addd2ccec6a777f3742df838b83 -->
# MATH lane — conductor-set membership is divisibility inside the level lattice

**Date:** 2026-11-25
**Result:** SOURCE-MATCHED reconstruction of Mathlib
`mem_conductorSet_iff_conductor_dvd`, including the kernel argument inside
`FactorsThrough.mono` and the theorem's two immediate conductor consumers.
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The pinned RH revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f` pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Declarations used |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | `FactorsThrough`, `factorsThrough_iff_ker_unitsMap`, `FactorsThrough.mono`, `conductor_dvd_of_mem_conductorSet`, `mem_conductorSet_iff_conductor_dvd`, `conductor_zpow_dvd`, `conductor_mul_dvd_lcm_conductor` |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | RH consumer `prim_mul`, indirectly through the inverse and product conductor bounds |

Fresh comparison on 2026-11-25 found RH upstream HEAD
`4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061`. Its manifest blob
`8a747b58a34565cc6cb5341b86544aa5d3a20a2d` still pins Mathlib
`31ce06eaadf4a200c0e1407c5f10953cf606b8f8`; comparison is recorded only as a
revision check. The theorem reconstructed below is from the required pinned snapshot. No
elaborated-term equivalence between revisions is claimed.

## 1. Exact theorem and quantifiers

Let `R` be any type with `[CommMonoidWithZero R]`. Let `n d : Nat`, let
`chi : DirichletCharacter R n`, assume `[NeZero n]`, and assume

    hd : d | n.

Then the pinned declaration is

    mem_conductorSet_iff_conductor_dvd (hd) :
      d in chi.conductorSet  <->  chi.conductor | d.

There is no `Nontrivial R`, ring, field, primality, coprimality, or positivity hypothesis on `d`.
Its nonzeroness follows when needed from `d|n` and membership, because a nonzero formal level cannot
factor through level zero.

The ambient restriction `hd : d|n` is part of the theorem, not bookkeeping. By definition,
`FactorsThrough chi d` already contains a proof of `d|n`. Without `hd`, the reverse implication is
false: the trivial character at level 5 has conductor 1, so `1|2`, but it cannot factor through
formal level 2 because `2` does not divide `5`.

## 2. Forward implication

Assume `d in chi.conductorSet`. By definition this is a witness that `chi` factors through a
Dirichlet character of level `d`. The earlier pinned theorem

    conductor_dvd_of_mem_conductorSet chi

proves directly that

    chi.conductor | d.                                      (1)

Its difficult content was reconstructed in the previous MATH checkpoint: factorization at `d` and
at the conductor is combined at `gcd(d,conductor chi)`; minimality forces that gcd to equal the
conductor. Merely knowing that the conductor is the least natural number in the set would yield an
inequality, not (1).

## 3. Reverse implication and the upward-closure mechanism

Now assume

    h : chi.conductor | d,

along with the original `hd : d|n`. The canonical fact

    chi.factorsThrough_conductor : FactorsThrough chi (chi.conductor)

is promoted from the conductor to `d` by

    chi.factorsThrough_conductor.mono chi h hd.

Unpacking `FactorsThrough.mono` explains the step rather than naming it. For any `e|n`, the pinned
kernel criterion is

    FactorsThrough chi e
      <-> ker(Units(ZMod n) -> Units(ZMod e)) <= ker(chi.toUnitHom).   (2)

Let `x` be a unit modulo `n` that maps to `1` modulo `d`. Since

    conductor(chi) | d | n,

the units maps compose as

    Units(ZMod n) -> Units(ZMod d) -> Units(ZMod conductor(chi)).

Therefore `x` also maps to `1` modulo the conductor: the second map sends `1` to `1`. Because `chi`
already factors through its conductor, (2) says `chi.toUnitHom(x)=1`. Hence the kernel for `n -> d`
lies in the kernel of `chi`, and a second application of (2) constructs the level-`d` factorization.

Equivalently, one can display the witness as the primitive character lifted first from the
conductor to `d`, then from `d` to `n`; `changeLevel_trans` makes this equal to its direct lift to
`n`, namely `chi`. The source implementation uses the kernel proof above.

Thus

    chi.conductor | d  ->  d in chi.conductorSet.           (3)

Together, (1) and (3) show that for a nonzero level `n`, the conductor set is exactly

    { d : d|n and conductor(chi)|d }.

It is an upward-closed interval in the divisor lattice of `n`, not an upward-closed subset of all
natural numbers.

## 4. Why `[NeZero n]` cannot be discarded

At formal level zero, the pinned theorem `conductor_eq_zero_iff_level_eq_zero` gives conductor zero
for every character. The trivial character of level zero nevertheless factors through level one:
the witness is the trivial level-one character and `changeLevel_one`. Hence, with `n=0,d=1`,

    1 in conductorSet(1 at level 0),

but `0` does not divide `1`. The equivalence is therefore false without `[NeZero n]`; this is not
merely a limitation of the kernel-surjectivity proof.

## 5. Exact downstream links

The pinned Basic file uses this equivalence twice.

1. In `conductor_zpow_dvd`, after separately discharging `n=0`, put
   `c=conductor(chi)`. Since `c|n`, the goal

       conductor(chi^m) | c

   is rewritten by this theorem into membership of `c` in the conductor set of `chi^m`. The witness
   is `chi.primitiveCharacter^m`; lifting commutes with integer powers.

2. In `conductor_mul_dvd_lcm_conductor`, after its own `n=0` branch, put
   `L=lcm(conductor(chi),conductor(psi))`. Both conductors divide `n`, hence `L|n`. The desired

       conductor(chi*psi) | L

   becomes conductor-set membership at `L`. The witness is the product, at level `L`, of the two
   primitive characters lifted to `L`.

The pinned RH lemma `prim_mul` consumes the resulting inverse- and product-conductor statements to
prove primitivity of a coprime product. This bridge therefore supplies the precise factorization
meaning behind those divisibility rewrites; it is not itself an RH theorem.

## 6. Correction to the existing interpretation

Earlier MATH reports quoted the equivalence correctly but left two points implicit:

- the reverse direction is valid only for `d|n`; conductor divisibility alone cannot create a
  factorization at an unrelated formal level;
- `[NeZero n]` is semantically necessary, with an explicit level-zero counterexample.

The reconstruction also identifies the exact difficult step in `FactorsThrough.mono`: kernel
triviality is pulled back through the composed unit maps. No scalar-to-geometry analogy, fitted
constant, omitted premise, or URT advantage is used.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mem_conductor_set_iff.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_mem_conductor_set_iff.py

Observed output:

    mem conductorSet iff conductor divides regression: OK; report_checks=7, characters=80, equivalence_checks=255, mono_checks=220, surjective_fibre_checks=255, negative_controls=3

The checker enumerates exact finite unit-group characters with values represented as exponents in
`C_60`, derives each conductor only from unit-map fibre constancy, checks the equivalence for every
divisor of levels 1 through 16, and independently checks the finite upward-closure and unit-map
surjectivity statements. It also executes the unrelated-level, level-zero, and least-number-versus-
divisibility negative controls.

This finite regression is independently checkable evidence for the translation. It is not the
universal Lean proof, a kernel replay, or an axiom/sorry audit.

## Failed attempts / limitations

- Replacing divisibility by the numerical inequality `conductor <= d` is insufficient; for example
  `3<=4` but `3` does not divide `4`.
- Dropping `hd:d|n` admits the level-5/conductor-1/target-2 counterexample above.
- Dropping `[NeZero n]` admits the trivial level-zero character factoring through level one.
- Describing `FactorsThrough.mono` merely as “obvious upward closure” hides the composed unit-map
  kernel argument and its surjectivity dependency.
- The finite checker covers positive levels at most 16 and `C_60`-valued characters. It does not
  establish the theorem for arbitrary `CommMonoidWithZero R`.
- No Lean, Lake, or Elan executable is installed locally. Status remains SOURCE-MATCHED, not
  ELABORATED; transitive axiom dependencies were not rechecked.

## RESUME HERE

Reconstruct pinned Mathlib `factorsThrough_iff_ker_unitsMap` itself, including the two uses of
surjectivity: factorization implies kernel triviality by evaluation, while kernel triviality creates
the lower-level homomorphism with `MonoidHom.liftOfSurjective`. Preserve the unit-hom/Dirichlet-
character equivalence and explain exactly where nonzero level is required.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.

<!-- END VERBATIM math/2026-11-25_mem_conductor_set_iff.md -->


---

<!-- BEGIN VERBATIM integration/2026-11-25_0100_GALOIS_GEOMETRY_LIFT_ROW0.md 545cfe7012054db9aaaeac9f43ff40c292b77556 -->
# Geometry-lift Galois local–global bridge — integration 01:00
2026-11-25. PARTIAL / SOURCE-MATCHED with cross-checked exported direct role evidence. One contribution: expand authenticated owner 13235288 and its Row0 constructor, not independent kernel replay or the entire proof.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10, not adopted. Development.lean changed blob from 4d4d9506494734f28fce7d39bac1a50650ecf148 to 25eb1c9c60978c4e9a8edc0899e84289d74a11a1; no semantic cross-revision claim. Current [volume 15](../specialists/proof_editor/2026-11-25_0056_INTEGRATED_MANUSCRIPT.md) blob a67ed230901d3e5b6460db204d2f935bf4213679 reports 177 primary +16 supporting entries (not unique declaration count). Attach this chapter after GeoOne/TLiftK before Row0b.
Read protocol first, AGENTS, state, actual runner log/protocol, continuity, handoff and expansion. Peer checkpoints editor 742bc96, geometry faef914, audit 1fedf6d, literature c27fa70, math a025323, boxes 36ac455, Galois 6e6bda2, theta 5e33efb, structure 9f8d550, Landau f7e9644, prime d8c5ce4, dependencies 84f2185, kernel d543273, acceleration 23b2b75. Galois reserves this bridge to integration. Prior integration e169d46 retained. CI #406 PASS 00:47:27 UTC, run 45517969326, general checks only. External blueprint not reread, no claims from it. Root log/protocol 404 corrected runner paths; default branch code search returned no match, followed MainConclusion→RowSrc→GaloisRepresentationsOfThetaLift→Development imports. First regression failed because oldest direct projection has no pin field; corrected to require absence in first exact blob and pin in other four; common archive digest and root checked. Second attempt exceeded connector call budget. No unsupported source-to-export equivalence.

## Human proof
Development L18–31: recT(h,rc)=IsRecT(h,rc), not full reciprocity IsRec. Given geo:GeoOne and up:TLiftK, prove Row0(recT). By WeightsConjAlt L85–89 this means: for every CM number field E, algebraic closure Ω with Field, Algebra E Ω and IsAlgClosure E Ω, prime ℓ with Fact ℓ.Prime, ring isomorphism ι:Qbar ℓ≃+*C, natural a≥1, cuspidal subspace π:CuspSub E a and χ:HChar(maximalRealSubfield E), assuming regular algebraicity and ContraPair.PolarizedPair π χ, construct one r:G E Ω→*GL(Fin a)(Qbar ℓ), integer wt, and HT assigning multiset of integers to each embedding τ:E→+*Qbar ℓ. Props requires continuous semisimple r, away compatibility, HT equality, conjugation, above-ℓ clauses. Both GeoOne and TLiftK retained.
1. s=seedFinOdd_of_geoOne(geo) via seedFinOdd_of with divAll_holds,cplMem_of,sameOr_of(cplMem_of),satConj_of(locIso_of),tyConj_of(locIso_of),lacConj_of(cplMem_of),gapLac_of,dGenMul_of,geo.
2. w=wtLacEx_holds from top_of(famEx_holds,famProj_holds,famWt_holds). c=congFinOdd_of_ex(w) through stepSt_of_ex(ellSt_holds,w), congUWG_of with finU_holds,DGen,dGen_ne_zero, then congUW4 at Odd. Not unrestricted rank.
3. L=limFinOdd_of(s,c), K=toCoreK(up)(congPhi_holds)(descOffT)(L):Core, via toCore(twoUpOK_of_k(up)); C=coreAll_of_core(K):CoreAll via coreAll_of_core_inp(inp_holds). Trace limit, descent, theta remain subobligations.
4. H1=galoisCompat_unlinkedSupport_of_spherical(C):R1 via inq_holds=(inp_holds,charLiftPrime_holds). H2=localGlobalCompatAtIwahoriFixed_of_unlinked(H1) via r2g(mixedOf,toTor_holds,drDesc,recTExists). Use same H1.
5. Row.galoisLocalGlobal_of_localGlobalCompatibility(C,H1,H2) invokes galoisLocalGlobal_of_placeClassCompatibility with Q=True via localGlobalAtPlaceClass_of_localGlobal. Chooses right disjunct IsQg(w)∧Apart(algNorm σ) from H2's PlainTor-or-pair premise; Q=True does NOT erase nonzero KOne fixed space, IsQg, Apart or mono0.

### Row0 constructor
InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean L157–171: pair regular algebraicity and polarization with trivial to give InScope .all ℓ π χ. C.1 produces r with Weak π ι r; extract continuity and semisimplicity. exists_weights L127–148 produces wt and HT independently of local choices. With c0=(a−1)/2 each infinitesimal character entry z=c0+n (n integer) gives c0−z=−n. Lift the entire multiset preserving multiplicities, choose HT for each τ. Polarized weight theorem, multiset map and injective integer cast yield HT(τ∘conj)=map(wt−·,HT(τ)); retain exists_isWeight, choice and Multiset.canLift.
Away ℓ: quantify height-one w with ℓ outside ideal, valuation subring A, h:IsPlaceOver A w, rc:IrrGL→WD(h) with IsRecT, local component σ. x=wdOf(h,hl,ι,r), y=rc(algNorm σ). L96–106 first dimension equality by lpDim_wdOf and L.dim. For Tor(y) and mono0(y), genericity and plainTor_of_tor feed H1 and give x=y. In separate tame case require IsQp(w),TmW(y),Sqf(y),mono0(y). guard_tame derives nonzero KOne-fixed space and Apart; H2 gives mono0(x) and equal inertia characteristic polynomials. Every degree-zero Weil element g is inertia since exists_eq_zpow_mul deg_frob g writes g=frob^0 times inertia. Thus equal characteristic polynomials for all degree-zero g, not equality of representations in general tame case.
Above ℓ: quantify P:LocPrime ℓ,AI:LocAinf ℓ P,Nonempty(LocTied ℓ P AI),w,A,h,O with CommRing O,Algebra Z_ℓ O,TopologicalSpace O,Bw:LocBridge,hj:Pst.Induces Bw. For spherical local σ, obtain B with HasSat(w,B); C.2 twice (.crys,.dR), and w1(τ) identifies induced embedding jumps with HT(τ). For nice clause require local σ, IsRecT, ((IsQp∧TmW∧Sqf)∨Tor), mono0. L108–125 splits Tor(y): if true H1 yields de Rham,potentially semistable,mono0,charpoly identities; eq_of_mono0_charPol supplies x=y. Otherwise three tame guards follow from disjunction and guard_tame then H2 supply de Rham,potentially semistable,inertia compatibility. Dimension equality via charpoly degree at inertia identity; Tor implication vacuous. mem_of_induces provides ℓ-in-place. Apply de Rham jumps to w1(τ), retaining every τ, finite extension LL',τ' and IsInduced hypothesis. Same r,wt,HT fill six Props fields.
Row0.row0b (WeightsConjBis L76–87) keeps r,wt,HT and restricts IsQp to IsQpBig via IsQpBig.isQp, including above-ℓ disjunction. Extra guard n=1 OR 16n²<g on local field identification. Despite wrapper name Strong this conversion restricts obligations, not extra local cases. Actual root uses Row0b.

## Tests and scope
Executed V8 checks {"checks":9519,"owners":176,"path":7,"type":18,"value":7,"weights":9300,"negative":5}; source files in graph were fetched and blob IDs matched in earlier attempt, not locally rehashed. Negative controls: digest, incoming witness, removed value record, changed type root, altered value witness. Integer-grid sign checks are not analytic proof. Exact incoming seven edges independently cross-checked against previous projection records, not just request path. All selected type/value witnesses retained. No axiom census or raw binder replay inferred from selected report. No independent reviewer sign-off yet. Shared traversal benchmark from acceleration lane does not show golden superiority. Source-only suppliers remain open.
## JSON dependency evidence and typed tree
```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "projectionBlobs": [
    "64b935e4ef309f6c555912a377012c7708eda510",
    "d49fbcc22a2382039986b09ff91dd11af2ef2e7b",
    "d04e0fb24160d3ee1be54cd50082f59526864d4e",
    "d823c364f446f5066dbbc61f7e9cf9c891fcbdb2",
    "deabbd86afc8f21d9897ba3bb74349178517fde3"
  ],
  "archiveDigest": "5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e",
  "root": 14065054,
  "selectedOwner": {
    "request": {
      "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
      "id": 13235288,
      "kind": "thm",
      "origin": "authenticated_root_path_frontier",
      "incoming": {
        "owner": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
        "ownerId": 13235289,
        "role": "value",
        "kind": "explicit_const",
        "witness": 1004086667
      },
      "path": [
        {
          "owner": 14065054,
          "target": 14065053,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212062,
          "expressionRoot": 1065212062,
          "ownerName": "riemannHypothesis",
          "targetName": "rhOfAll"
        },
        {
          "owner": 14065053,
          "target": 14065052,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212060,
          "expressionRoot": 1065212061,
          "ownerName": "rhOfAll",
          "targetName": "allChi"
        },
        {
          "owner": 14065052,
          "target": 14065051,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212058,
          "expressionRoot": 1065212058,
          "ownerName": "allChi",
          "targetName": "UpperTheory.FinalTheorems.everyCharacter"
        },
        {
          "owner": 14065051,
          "target": 14065050,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212056,
          "expressionRoot": 1065212057,
          "ownerName": "UpperTheory.FinalTheorems.everyCharacter",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"
        },
        {
          "owner": 14065050,
          "target": 14009158,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1065212052,
          "expressionRoot": 1065212054,
          "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
          "targetName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift"
        },
        {
          "owner": 14009158,
          "target": 13235289,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1062644800,
          "expressionRoot": 1062644804,
          "ownerName": "UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift"
        },
        {
          "owner": 13235289,
          "target": 13235288,
          "role": "value",
          "kind": "explicit_const",
          "witness": 1004086667,
          "expressionRoot": 1004086672,
          "ownerName": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift",
          "targetName": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift"
        }
      ]
    },
    "status": "EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK",
    "id": 13235288,
    "kind": "thm",
    "encodedRootsAndStructuralEdges": [
      1004086649,
      1004086662
    ],
    "type": {
      "expressionRoot": 1004086648,
      "expressionsRead": 88,
      "childEdges": 120,
      "referenceOccurrences": 18,
      "peakPending": 13,
      "references": [
        {
          "kind": "explicit_const",
          "target": 13125903,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "recT"
          ],
          "targetKind": "def",
          "witnessExpression": 1000095259,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385914,
          "nameParts": [
            "NumberField",
            "instCommRingRingOfIntegers"
          ],
          "targetKind": "def",
          "witnessExpression": 8609075,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385909,
          "nameParts": [
            "NumberField",
            "RingOfIntegers"
          ],
          "targetKind": "def",
          "witnessExpression": 8609071,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385674,
          "nameParts": [
            "IsDedekindDomain",
            "HeightOneSpectrum"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609070,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385664,
          "nameParts": [
            "ValuationSubring"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609067,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 385652,
          "nameParts": [
            "UpperTheory",
            "GalStar",
            "RecNotion",
            "_proof_1"
          ],
          "targetKind": "thm",
          "witnessExpression": 8609060,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4099,
          "nameParts": [
            "Field",
            "toCommRing"
          ],
          "targetKind": "def",
          "witnessExpression": 1244768,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 341243,
          "nameParts": [
            "IsAlgClosure"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609052,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4101,
          "nameParts": [
            "Field",
            "toSemifield"
          ],
          "targetKind": "def",
          "witnessExpression": 315578,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4098,
          "nameParts": [
            "Semifield",
            "toDivisionSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 315576,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4074,
          "nameParts": [
            "DivisionSemiring",
            "toSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 315574,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 4083,
          "nameParts": [
            "Semifield",
            "toCommSemiring"
          ],
          "targetKind": "def",
          "witnessExpression": 1246540,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 85935,
          "nameParts": [
            "Algebra"
          ],
          "targetKind": "inductive",
          "witnessExpression": 5945860,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 3820,
          "nameParts": [
            "Field"
          ],
          "targetKind": "inductive",
          "witnessExpression": 216818,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 341190,
          "nameParts": [
            "NumberField"
          ],
          "targetKind": "inductive",
          "witnessExpression": 8609044,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126182,
          "nameParts": [
            "UpperTheory",
            "GalStar",
            "Row0"
          ],
          "targetKind": "def",
          "witnessExpression": 997988582,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13125905,
          "nameParts": [
            "UpperTheory",
            "TP",
            "TLiftK"
          ],
          "targetKind": "def",
          "witnessExpression": 1000528341,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126169,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Geo",
            "GeoOne"
          ],
          "targetKind": "def",
          "witnessExpression": 1002626056,
          "distinctExpressionRecords": 1
        }
      ]
    },
    "value": {
      "expressionRoot": 1004086661,
      "expressionsRead": 17,
      "childEdges": 16,
      "referenceOccurrences": 7,
      "peakPending": 6,
      "references": [
        {
          "kind": "explicit_const",
          "target": 13235287,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Wt",
            "wtLacEx_holds"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086655,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13232503,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Cong",
            "congFinOdd_of_ex"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086654,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13220887,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Div",
            "seedFinOdd_of_geoOne"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086651,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13208115,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "coreAll_of"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086650,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13172410,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "rest"
          ],
          "targetKind": "thm",
          "witnessExpression": 1004086649,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13125905,
          "nameParts": [
            "UpperTheory",
            "TP",
            "TLiftK"
          ],
          "targetKind": "def",
          "witnessExpression": 1000528341,
          "distinctExpressionRecords": 1
        },
        {
          "kind": "explicit_const",
          "target": 13126169,
          "nameParts": [
            "UpperTheory",
            "Gal",
            "Int",
            "Geo",
            "GeoOne"
          ],
          "targetKind": "def",
          "witnessExpression": 1002626056,
          "distinctExpressionRecords": 1
        }
      ]
    },
    "structural": [],
    "mutualBlock": [
      {
        "id": 13235288,
        "nameParts": [
          "UpperTheory",
          "Gal",
          "Int",
          "galoisLocalGlobal_of_geometry_lift"
        ],
        "exported": true
      }
    ]
  },
  "source": [
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean",
      "blob": "4d4d9506494734f28fce7d39bac1a50650ecf148",
      "lines": "18–31"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjAlt.lean",
      "blob": "486af16ec21e4f8c5a482e1481769093b9448bd4",
      "lines": "16–40,51–79,85–89"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean",
      "blob": "0a1eab0eb68defc45b4e62d19fbfd01dad459344",
      "lines": "16–23,76–87"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/ZetaCharacterDivisibility/MainFin.lean",
      "blob": "b023ec56003f657cfae4d37daf01914aa4302922",
      "lines": "13–15"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CongruenceOddLevel/CongFinOddOfLvLac.lean",
      "blob": "9221b34460b1ebb347eb6019c3f63ac0cd714079",
      "lines": "10–16"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/WeightCharacters/LadicWeightEmbeddingOverPlace.lean",
      "blob": "27b0e6abc40fbf2fdefe4b7899b906a1fb4f4f01",
      "lines": "wtLacEx_holds"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TraceLimits/LimFinOddOf.lean",
      "blob": "3268147bfbbcac7babd43aa92da8ddf577e029db",
      "lines": "197"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineDescent/ToCoreK.lean",
      "blob": "e4235a62a4bce78539c94be995d8f5a0ff59fac3",
      "lines": "7–9"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean",
      "blob": "a4054e96f51401b00acb7a5443040abdc94fa549",
      "lines": "4–5"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean",
      "blob": "e01a86b5f2ec5fee9e16c3e0556d98bbea26bcbf",
      "lines": "8–10"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean",
      "blob": "90390f831b31ac30e7672dc7d1a499464910ef27",
      "lines": "14–18"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean",
      "blob": "f6b0fadd7bad69ef19b48cae73c42ea6441310df",
      "lines": "Apart, LocalGlobalCompatAtIwahoriFixedPlaces"
    },
    {
      "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean",
      "blob": "eebd76fca5538c7a0156cf330cedd4b663b0d70a",
      "lines": "24–46,53–79,84–171,192–193"
    }
  ],
  "obligationTree": {
    "name": "UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift",
    "status": "source-matched assembly; kernel replay open",
    "premises": [
      "GeoOne",
      "TLiftK"
    ],
    "children": [
      {
        "id": 13208115,
        "name": "coreAll_of",
        "children": [
          {
            "id": 13220887,
            "name": "seedFinOdd_of_geoOne"
          },
          {
            "id": 13232503,
            "name": "congFinOdd_of_ex",
            "children": [
              {
                "id": 13235287,
                "name": "wtLacEx_holds"
              }
            ]
          },
          {
            "name": "limFinOdd_of",
            "status": "source-only"
          },
          {
            "name": "toCoreK",
            "status": "source-only"
          },
          {
            "name": "coreAll_of_core",
            "status": "source-only"
          }
        ]
      },
      {
        "id": 13172410,
        "name": "rest",
        "children": [
          {
            "name": "galoisCompat_unlinkedSupport_of_spherical",
            "status": "source-only"
          },
          {
            "name": "localGlobalCompatAtIwahoriFixed_of_unlinked",
            "status": "source-only"
          },
          {
            "name": "galoisLocalGlobal_of_localGlobalCompatibility",
            "status": "source-only",
            "children": [
              {
                "name": "galoisLocalGlobal_of_placeClassCompatibility",
                "status": "source-matched conditional assembly"
              }
            ]
          }
        ]
      }
    ]
  },
  "tests": {
    "checks": 9519,
    "owners": 176,
    "path": 7,
    "type": 18,
    "value": 7,
    "weights": 9300,
    "negative": 5
  }
}
```
## Reproduce
Save JS block as verify.mjs, supply five raw report files in listed order. Native CLI hash check supplied, not executed here.
```js
import fs from "node:fs";import crypto from "node:crypto";
function check(ds){let n=0;const ck=(x)=>{if(!x)throw Error("assertion "+n);n++};let owners=new Map;for(const [i,d] of ds.entries()){ck(i===0?d.pin===undefined:d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005");ck(d.root===14065054&&d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e");for(const r of d.reports){ck(!owners.has(r.id));owners.set(r.id,r)}}let r=owners.get(13235288);ck(r.request.name==="UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift");ck(r.type.expressionRoot===1004086648&&r.value.expressionRoot===1004086661);ck(r.type.references.length===18&&r.value.references.length===7&&r.structural.length===0);let last=14065054;ck(r.request.path.length===7);for(const e of r.request.path){let o=owners.get(e.owner);ck(e.owner===last&&e.role==="value"&&e.kind==="explicit_const");ck(o.value.expressionRoot===e.expressionRoot);ck(o.value.references.some(x=>x.target===e.target&&x.kind===e.kind&&x.witnessExpression===e.witness&&x.nameParts.join(".")===e.targetName));last=e.target}ck(last===r.id);const expected=[[13235287,1004086655],[13232503,1004086654],[13220887,1004086651],[13208115,1004086650],[13172410,1004086649],[13125905,1000528341],[13126169,1002626056]];r.value.references.forEach((x,i)=>ck(x.target===expected[i][0]&&x.witnessExpression===expected[i][1]&&x.distinctExpressionRecords===1));let weights=0;for(let a=1;a<=12;a++)for(let w=-12;w<=12;w++)for(let j=-15;j<=15;j++){let c=a-1,z=c+2*j,zc=2*c-2*w-z;ck((c-z)%2===0&&(c-zc)/2===w-(c-z)/2);weights++}return {checks:n,owners:owners.size,path:7,type:18,value:7,weights}}
const hs=["64b935e4ef309f6c555912a377012c7708eda510","d49fbcc22a2382039986b09ff91dd11af2ef2e7b","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","deabbd86afc8f21d9897ba3bb74349178517fde3"];const p=process.argv.slice(2);if(p.length!==5)throw Error("need five reports");const d=p.map((x,i)=>{const b=fs.readFileSync(x);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==hs[i])throw Error("blob");return JSON.parse(b)});console.log(check(d));
```
RESUME HERE: obtain queued post34 projection compute/rh-post34-frontier-20261125/outputs/solution_post34_frontier.json; bind actual role references of coreAll_of (13208115) and rest (13172410) to source-only children; expand first unclaimed root-linked CoreAll supplier. HANDOFF TO Galois, dependencies, kernel, editor, audit, theta, literature. Full RH human proof OPEN.

<!-- END VERBATIM integration/2026-11-25_0100_GALOIS_GEOMETRY_LIFT_ROW0.md -->


---

<!-- BEGIN VERBATIM specialists/character_boxes/RUN19_PRIME_LOCAL_INTEGRALITY_CONJUGATION.md 0f1e20f5ac5f170d26f73c7b3043d21906fe0434 -->
# RUN19 — Prime-local inverse integrality, conjugation, and prime-fibre detection
2026-11-25. SOURCE-MATCHED / DONE for this bounded conditional human derivation. Root-level elaborated reachability and independent Lean replay remain OPEN.

Continuity: fetched AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, and summary.md on cathedral-research-state (CI #408, 01:25:36Z, not RH validation). Read RUN18 and RUN16 and inspected the 25 latest RH commit titles plus 14 other lanes' latest commit files/available RESUME HERE excerpts. No duplicate of the inverse-integrality and conjugation derivation identified. RUN16 already explains not_int_iff and tie_iff, so retain those as consumers, not new discoveries. Full peer documents and blueprint not reread; specialist directory fan-out hit connector call limit, recovered via commit patches. No physics queue changes.

## Pinned sources
Repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005.
H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, returned by default main branch commit endpoint (merge PR #1739); differs from RUN18's b2f365a68500e2bde98cd60a2324263fc62fba10. Do not infer ancestry or chronological advancement from the different hashes.
- C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean, P blob 4125fd7aed8d975a8179e2debf22c365e01f237e; H blob 357326bc75d8b98a7383d706ac7713e6a817233d. [Pinned source, lines 208–285](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L208-L285). [Consumer, lines 327–410](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L327-L410).
- L=src/Formalism/SatakeDualWeyl/AdelicIwasawaHecke/Levelaf.lean, P blob a82305067315c15f9bd280d1167ce411cf54a34a; H blob 68c3b18a9c6d4326d56571fc8b72286c71e8c85b. L:14–16 levelaf_valued_algebraMap. [Pinned supplier](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SatakeDualWeyl/AdelicIwasawaHecke/Levelaf.lean#L14-L16).
- W=src/Formalism/LocalToGlobal/BesselHermitianTheta/LemmasWeil.lean, P blob f12892eb4c68bddd7215cd814157f16120b13cef; H blob cea6b9a899aac26661d25555c4b16668921ec680. W:96–107 cA_cA. [Pinned supplier](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/BesselHermitianTheta/LemmasWeil.lean#L96-L107).

## Exact hypotheses and proof
Fix the source's D:D7, F=D.host.F, E=D.host.E, CM involution σ=star on E, A=AE D. Write O=𝓞 E, I=intAE D and J(z)=finPart D z. Q and P range over HeightOneSpectrum O (nonzero prime ideals in this Dedekind domain); write |·|_Q for the multiplicative valuation used in the source. Do not replace D by an arbitrary extension; the fixed-field property is used below.

1. **Inverse integrality** (C:278–285, GlobalTheory.IdemSupport.inv_mem_iff). For EVERY Q and EVERY x∈O with x≠0, the embedded inverse of x in E_Q belongs to its completion integer ring iff x∉Q. L:14–16 first proves the valuation of the embedded field element equals the original valuation, by algebraMap_adicCompletion and adicCompletion.valued_coe (imported obligations). Thus membership is |x⁻¹|_Q≤1 iff |x|_Q⁻¹≤1 iff 1≤|x|_Q, using positivity of |x|_Q from Valuation.zero_iff and x≠0. Finally valuation_lt_one_iff_mem identifies |x|_Q<1 with x∈Q, so the claim follows by negating this strict inequality. This explicitly uses multiplicative valuation convention; in additive valuation notation it is v_Q(x⁻¹)≥0 iff v_Q(x)=0 for nonzero integral x. Zero excluded: Lean totalized inverse of zero does not provide this equivalence.

2. **Conjugation on O and A** (C:215–258; W:96–107). cO is the ring equivalence induced by star, cP(P) its prime comap; x∈cP(P) iff cO(x)∈P, and cO²=id by star_star and ring-of-integers extensionality. C:230 eq_of_le uses maximality of height-one primes, not arbitrary prime ideals. C:233–243 isConjPl_iff proves the source's conjugate-place relation equivalent to P'=cP(P): the witness in the original relation for cO(x)∈P must be x by involution, hence cP(P)⊆P'; maximality gives equality. Conversely choose cO(c) for c∈P and use cO²=id. W proves cA²=id by TensorProduct.induction_on: zero, pure tensor a⊗b (σ²(b)=b), and sum. C:245–250 shows cA(incA x)=incA(star x), and cA fixes the base-adele embedding since σ(1)=1. C:252–258 shows BOTH infinite and finite parts commute with the corresponding tensor conjugation sigR, by the same zero/pure/sum induction. Not every tensor is pure; induction is retained.

3. **Integral subgroup invariance** (C:260–266 finPart_cA_mem). J(z)∈I implies J(cA z)∈I: I is the additive closure of generators a⊗x with a in the prescribed base integral adeles and x∈O. Conjugation of such a generator is a⊗cO(x), still an allowed generator, so closure_le and the additive map give the implication. Applying it to cA z and using cA²=id proves the reverse implication. Consequently J(z)∉I iff J(cA z)∉I. No principal-ideal or finite-support hypothesis is inserted.

4. **Comparison₂ transport** (C:268–276). The predicate Comparison₂(P,e) is the UNIVERSAL statement: for all x∈O, x≠0 implies [x∈P iff J(e incA(x⁻¹))∉I]. For ANY e∈A satisfying this predicate, prove Comparison₂(cP(P),cA(e)). Fix x≠0. Since cO is a ring equivalence, y=cO(x)≠0. The original Comparison₂ applies to y. The ring-hom/involution identities give
   cA(e incA(y⁻¹)) = cA(e) incA(x⁻¹).
   Chain x∈cP(P) iff y∈P iff J(e incA(y⁻¹))∉I iff J(cA(e) incA(x⁻¹))∉I, using step 3 for the last equivalence. Thus no idempotence or zero-infinite-part assumption is needed for this particular implication. Those are indispensable in the later delta identification, not silently imported here.

5. **Immediate consumer, existing RUN16 comparison** (C:327–363). Fix Φ with Comp D Φ (all five fields in RUN16/18) and an idempotent e²=e. Each local coordinate is 0 or 1 by field cancellation. For nonzero integral x, J(e incA(x⁻¹))∉I iff there EXISTS a height-one Q with Φ(e)_Q≠0 and x∈Q: zero coordinates are integral; nonzero coordinates reduce to step 1. If additionally infPart(e)=0, then Comparison₂(P,e) iff IsDelta(Φ,P,e). To show the forward direction, any nonzero coordinate Q must satisfy Q⊆P by the universal x test (x=0 included separately when proving ideal inclusion), hence Q=P. Since P is nonzero, select x∈P nonzero; comparison forces a nonempty support. Therefore that unique coordinate is 1. Converse by substitution of the singleton support. Delta idempotence follows from Comp.ext' and the 0/1 coordinates. Conjugation preserves idempotence by multiplicativity, preserves the zero infinite part by parts_cA, and preserves Comparison₂ by step 4. Apply tie_iff in reverse: IsDelta(Φ,P,e) implies IsDelta(Φ,cP(P),cA(e)). This is C:359–363 delta_conj; no unsupported pointwise formula for Φ∘cA is used.

6. **Why there are only two possible primes in a CM fibre** (C:379–410, under_cP and eq_or_eq_cP). First cP(P) contracts to the same base prime as P because star fixes the image of F, including its integers. Now suppose Q and P contract to the same base prime. For each x∈Q, xσ(x) is σ-fixed, hence the image of t∈F by D.sp.cm.fixed. Its integrality over Z follows from x,cO(x)∈O and isIntegral_algHom_iff along the injective F→E map. The element t therefore belongs to 𝓞 F and lies in Q's contraction because xσ(x)∈Q. The assumed equality of contractions implies xσ(x)∈P. Primality gives x∈P OR σ(x)∈P, equivalently x∈P OR x∈cP(P). Hence Q⊆P∪cP(P) as sets. An ideal contained in a union of two ideals is contained in one of them (if neither, pick a,b in Q outside the respective ideal; each must lie in the other, then a+b lies in neither). Maximality of the height-one primes gives Q=P or Q=cP(P). Retain fixed-field, integrality descent, contraction and maximality obligations. This does not say the two primes are distinct. C:482–507 uses the two cases cP(P)=P and cP(P)≠P to construct IsPrimeIdem; the first uses delta uniqueness, the second delta_conj plus pointwise orthogonality and the sum of the two deltas equalling the base-place cut. Full supported subgroup assembly C:511–530 is the next consumer; no claim of reconstructing its full downstream arithmetic here.

## Executed provenance and source dependency check
Connector V8: 62/62 assertions (3 exact blob hashes + 59 literal source-reference anchors across 14 slices). Reproduce by git rev-parse P:path and git show P:path; index lines inclusively and fail if any following anchors absent. The source-reference edges are lexical, not elaborated constants:
- C220–222: RingOfIntegers.ext, star_star.
- C233–243: eq_of_le, mem_cP, cO_cO.
- C252–258: TensorProduct.induction_on, | zero, | tmul, | add.
- C260–266: AddSubgroup.closure_le, AddSubgroup.subset_closure, cO D x.
- C268–276: cA_incA, star_inv₀, star_star, mem_cP, not_congr, finPart_cA_mem, cA_cA.
- C278–285: mem_adicCompletionIntegers, levelaf_valued_algebraMap, map_inv₀, valuation_lt_one_iff_mem, inv_le_one₀, Valuation.zero_iff, exact_mod_cast hx.
- C327–337: hΦ.int, hΦ.inc, by_cases h0, mul_left_cancel₀, inv_mem_iff.
- C339–357: eq_of_le, by_cases hx0, exists_mem_ne_zero_of_ne_bot, not_int_iff, one_ne_zero.
- C359–363: delta_idem, tie_iff, parts_cA, map_zero, .conj.
- C379–388: HeightOneSpectrum.ext, D.sp.cm.fixed.
- C390–410: D.sp.cm.fixed, isIntegral_algHom_iff, Ideal.mul_mem_right, P.isPrime.mem_or_mem, Ideal.subset_union, eq_of_le.
- C482–507: exists_delta, delta_conj, eq_or_eq_cP, under_cP.
- L14–16: algebraMap_adicCompletion, adicCompletion.valued_coe.
- W96–107: star_star, TensorProduct.induction_on, Algebra.TensorProduct.map_tmul, map_add.

H comparison by extracting each declaration through next blank line: 13 of 15 slices identical. C cO_cO, mem_cP, eq_of_le, isConjPl_iff, finPart_cA_mem, Comparison₂.conj, inv_mem_iff, not_int_iff, tie_iff, delta_conj, under_cP, eq_or_eq_cP and L levelaf_valued_algebraMap unchanged. C parts_cA and W cA_cA each change map_add to map_add (f := _). No semantic equivalence or successful build inferred.

## Reproducible exact regression (executed connector V8)
Gaussian integers model E=Q(i), F=Q. Six prime representatives over 2,3,5,13 (ramified, inert, split); conjugation permutes them up to associates. Integer division tests valuations exactly for nonzero Gaussian integers in [-20,20]². Norm powers use BigInt, no floating valuation. Finite mask support is a model of the 0/1 local coordinates, not an adelic or Lean construction. The norm-divisibility and inverse-valuation checks are algebraic regressions rather than independent general valuation theorems. The finite grid contains each chosen prime generator, so it distinguishes all masks in this model. Counts include separate assertions per case.

```js
function regress(){
const A=(b)=>{if(!b)throw Error("regression")};
const ps=[[1,1],[3,0],[2,1],[2,-1],[3,2],[3,-2]],bar=[0,1,3,2,5,4];
const v=(a,b,[c,d])=>{if(a===0&&b===0)throw Error("zero");let k=0,N=c*c+d*d;while((a*c+b*d)%N===0&&(b*c-a*d)%N===0){[a,b]=[(a*c+b*d)/N,(b*c-a*d)/N];k++}return k};
let inv=0,conj=0,supp=0,ties=0,perm=0,neg=0;const good=Array.from({length:64},()=>Array(6).fill(true));
for(let a=-20;a<=20;a++)for(let b=-20;b<=20;b++){if(!a&&!b)continue;
 const ns=ps.map(p=>v(a,b,p)),ms=ps.map(p=>v(a,-b,p));
 for(let i=0;i<6;i++){const [c,d]=ps[i],N=c*c+d*d;
 const divides=(a*c+b*d)%N===0&&(b*c-a*d)%N===0;
 A((BigInt(N)**BigInt(ns[i])<=1n)===!divides);inv++;
 A(ns[i]===ms[bar[i]]);conj++;
 }
 for(let m=0;m<64;m++){
  const lhs=ns.some((n,i)=>(m&(1<<i))!==0&&n>0);
  const localIntegral=ns.every((n,i)=>!(m&(1<<i))||BigInt(ps[i][0]**2+ps[i][1]**2)**BigInt(n)<=1n);
  A(lhs===!localIntegral);supp++;
  const mc=bar.reduce((s,j,i)=>s|(((m>>i)&1)<<j),0);
  A(lhs===ms.some((n,i)=>(mc&(1<<i))!==0&&n>0));perm++;
  for(let i=0;i<6;i++)good[m][i]&&=lhs===(ns[i]>0);
 }
}
for(let m=0;m<64;m++)for(let i=0;i<6;i++){A(good[m][i]===(m===(1<<i)));ties++}
try{v(0,0,ps[0]);throw Error("expected rejection")}catch(e){A(e.message==="zero");neg++}
A(v(2,1,ps[2])===1 && v(2,1,ps[2])-v(2,1,ps[2])===0);neg++; // e=pi non-idempotent cancels inverse
A([1,1].slice(1)[0]===[0,1].slice(1)[0]&&[1,1][0]!==[0,1][0]);neg++; // finite data misses infinite part
A(v(2,1,ps[2])>0&&v(2,1,ps[3])===0);neg++; // split pair distinct
return {inv,conj,supp,ties,perm,neg}
}
console.log(regress());
```

Actual output {"inv":10080,"conj":10080,"supp":107520,"ties":384,"perm":107520,"neg":4}. No original hypotheses removed. Three primary source files, 14 source-reference slices, 15 upstream comparison slices. Other five immediate import files inspected for supplier location only. No full Lean kernel replay, independent proof of imported valuation lemmas, authenticated Main root reachability, or URT acceleration demonstrated.

## RESUME HERE
Expand C:482–530 (exists_isPrimeIdem and supported_group_and_prime_idempotents), particularly both branches of of_isPrimeIdem at C:460–480, and the original IsIdemAt/IsPrimeIdem definitions from the actual imported source. Then trace its character-box consumer, not repeat the already-translated RUN16 comparison. Request authenticated role-labelled Main-root edges to IdemSupport.inv_mem_iff, Comparison₂.conj, delta_conj, eq_or_eq_cP and RUN15–18 suppliers from dependency/kernel lanes. Retain ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins obligations. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.

<!-- END VERBATIM specialists/character_boxes/RUN19_PRIME_LOCAL_INTEGRALITY_CONJUGATION.md -->


---

<!-- BEGIN VERBATIM specialists/galois_representations/RUN19_POLYNOMIAL_TRACE_FACTORIZATION.md 8f1066049b6b258123f89730010535dcf0f952e3 -->
# RUN19 — polynomial trace factorization and original block trace
2026-11-25. SOURCE-MATCHED / PARTIAL (pinned native proof reconstructed; current upstream relocation still unresolved). Project OPEN. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol/continuity excerpts, RUN17–18, 16 recent commit patches with peer handoffs, integration 0100 and acceleration RUN19. CI checkpoint #408 01:25:36 UTC passes physical checks only; no RH replay. Some full peer files and external blueprint not reopened. Integration owns CoreAll/Row0; this is the distinct RUN18 trace-factorization frontier.

## Provenance
Repo leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005 (retained). Latest observed H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (2026-11-25 01:15:19 UTC). Compare H against previously observed b2f365a68500e2bde98cd60a2324263fc62fba10: 711 ahead, 0 behind, 300 file records (not exhaustive).
All paths relative to src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/.
- P ScalarCommutation/SpecAlg.lean blob ad2649702d29a9a02b67d2312919100da95f81e6: L49–87 trace_list_prod_mul_eq_prod_mul_trace_of_pow_sub_mul_zero; L89–97 trace_wop_mul_eq_wop_mul_trace_of_pow_sub_mul_zero; L99–116 compressed operator relations; L118–152 word and power compression; L154–163 diagonal trace; L166–255 specAlg.
- P ScalarCommutation/TypeSlice.lean blob 1c176ad18a52ea0eaa699e930cfcd2381a09b283 L64–70 Rel, L121–126 SpecAlg; H same path blob dcac4541d897050320fb28100f751caf3d80fe0a L99–105 and L151–156 respectively. Both declaration slices exactly equal by connector + V8 (2/2).
- P ProjectiveAutomorphicHecke/MapWopWmap.lean blob 1fe2c40629839c6824f70c04f14a3ccb866af5b4 L16 wop, L26 wmul, L35–39 wop_wmul, L59–60 Cert. H same path blob 10a3698dfce45340ea6e08d45e3b84631e9a8e5d (same as RUN18 observed H).
- H old SpecAlg, PTracePow and PProjTrace paths return 404. Four exact-name code searches returned no results. Do not infer deleted declarations or changed theorem. Relocation not resolved. Keep all P proofs, not latest H proof-equivalence claims.

## 1. Native trace removal proof, not semisimplicity
Let M be a finite-dimensional complex vector space, J any type, T_j endomorphisms commuting pairwise, theta:J→C arbitrary, and P idempotent. Assume every T_j commutes with P and for EACH j there exists N_j≥0 with (T_j-theta_j I)^{N_j}P=0. For EVERY finite word w, and EVERY Z commuting with each T_j and with P, the theorem states
Tr(T_w Z P) = theta_w Tr(ZP).
Here T_w is the ordered product in the list, theta_w the ordered scalar product; empty word means I and 1. No diagonalizability, orthogonality, positivity, invertibility, nonzero P, or finite J. The proof is induction on w, with Z generalized.

For w=j::v, set Y=T_v Z, D=T_j-theta_j I. Pairwise commutation and the hypotheses on Z imply Y commutes with every T_i and P. In particular D commutes with Y and P (scalars central). The native proof uses (DP)^{N_j+1}=D^{N_j+1}P= D(D^{N_j}P)=0, valid even N_j=0. Since DP commutes with Y, DPY is nilpotent: (DPY)^{N_j+1}=0. Its trace is zero (finite-dimensional complex nilpotent operator has all eigenvalues zero). Because YP=PY,
DPY = T_j YP - theta_j YP.
Taking trace gives Tr(T_jYP)=theta_j Tr(YP). Apply the induction hypothesis for v with the same Z, multiply by theta_j, and obtain the formula. Base case empty word immediate. The generalization over Z in the native statement preserves the commutation obligations. This is exact nilpotent trace removal, not replacing a Jordan block by an eigenvalue as an operator.

For a finite-support word polynomial s=(s_w), wop(T,s)=sum_w s_w T_w, wop(theta,s)=sum_w s_w theta_w. By distributivity and trace linearity the word formula gives
Tr(wop(T,s) ZP)=wop(theta,s) Tr(ZP).
This is the entire L89–97 lift; no exchange of infinite sums. Coefficients may be arbitrary complex numbers. The result is an equality even if wop(theta,s)=0 or Tr(ZP)=0.

## 2. Consumer: original uncompressed block traces
For each q in a FINITE index type Q, let W_q be finite-dimensional over C. T_{q,j},e_q,u_q,u'_q are endomorphisms. Rel has six exact premises: e²=e; e(T_j e)=T_j e; e(ue)=ue; T_i(T_j e)=T_j(T_i e); u(T_j e)=T_j(ue); u'(ue)=e. No assumption original T_j commute on the whole W_q. Assume there exist q0 and x0≠0 in W_q0 with e x0=x0 and every T_j x0=theta_j x0.
Compress t_{q,j}=T_{q,j}e_q, v_q=u_q e_q; all six relations imply pairwise t commutation, t-v commutation, t-e commutation, v-e commutation, u'v=e and e²=e (native L99–116).
On W=product W_q (finite direct sum), use diagonal maps t_j,V,E,U'. By RUN18 pProjOne there is one finite word polynomial a with scalar value 1 and P=wop(t,a) idempotent and satisfying all generalized eigenvalue conditions. P commutes with t_j,V,E because every constituent does. The vector supported only at q0 is fixed by both P and E (word evaluation on common eigenvector); therefore Q0=PE is nonzero and idempotent. U'V=E implies V is injective on im(Q0): VQ0 x=0 implies Q0 x=E Q0 x=U' V Q0 x=0. TracePow with lower bound 1 produces n≥1 such that C=Tr(PE V^n)≠0. Both n and a are fixed BEFORE the universal quantifier on s.
The original native output is sum_q Tr(wop(T_q,wmul(a,s)) u_q^n e_q) ≠0 whenever wop(theta,s)≠0. Here wmul is concatenation convolution of finite word supports; wop(T,wmul(a,s))=wop(T,a)wop(T,s) even for noncommuting T. To derive the stronger exact equality:
1. u^n e=(ue)^n e and e(ue)^n e=(ue)^n e, by induction using e²=e and [ue,e]=0 (L143–152).
2. If eX=X then T_j X=T_j e X and e T_j e X=T_j e X. Induct from the right over a word, then take the finite linear sum: wop(T,s)X=wop(t,s)X and e wop(t,s)X=wop(t,s)X. Apply first to s then to a (L118–141). Thus the original summand equals Tr(wop(t_q,a) wop(t_q,s) v_q^n e_q).
3. Trace of the diagonal operator equals sum of block traces (finite product basis; L154–163). The original sum now equals Tr(P wop(t,s) V^n E). Cycle P to the right (trace cyclicity), set Z=V^n E, which commutes with every t_j and P. Section 1 gives scalar wop(theta,s) times Tr(V^n EP). Commute E with V and cycle to get C=Tr(PE V^n).
Therefore for ALL s, including those with scalar value zero,
sum_q Tr(wop(T_q,wmul(a,s)) u_q^n e_q) = wop(theta,s) C.
Since C≠0, nonvanishing follows over C. This translates L229–255. The equality is exhibited by the proof, though SpecAlg only states the implication. Crucially one common (n,a) suffices even for infinite J. This does not prove occurrence of the original global automorphic eigensystem without its arithmetic input.

## 3. Source-to-root handoff
RUN17 exact consumer specOfF→specData→specTopG→IsFnL/PlanEx; RUN15–16 Pack/GeoOne; integration 0100 Row0→Row0b. New peer evidence: acceleration RUN19_RESUME.md (blob 5c85f2aefd6dec4150e4016dddfd6a67d3d9b477) lists authenticated manifest names/IDs and raw-slicer requests: UpperTheory.Gal.Spc.specAlg 13962369 (zero-based type/value roots 1059634995/1059646507); specOfF 13965895 (1059827818/1059842589); specTopG 13966873 (1059933754/1059934839). These are peer manifest lookup records, not independently verified incoming root paths in this run. Request actual role-labelled outgoing references from specAlg and incoming root paths for these IDs; do not equate private helper source calls with raw-term reachability until matched. Integration owns coreAll_of/rest, so leave it untouched. RUN11 native frob_laws supplier and relocated H bodies remain open. Earlier 15 PlanEx All fields and separate witnesses retained.

## 4. Executed checks
Connector/V8 19 exact source-line anchors (SpecAlg P L49,52,53,77,78,79,84,87,89,96,97,190,226,236,240,249,253,254,255), 2/2 exact cross-revision Rel and SpecAlg predicate comparisons, four source snapshots checked. No local Git checkout or Lean kernel replay. Reproduce source checks using git show P:path and H:path and the listed line ranges; git rev-parse REF:path gives the stated blob hashes.

The following exact finite regression was executed locally in Python/SymPy, not Lean. It is a theorem illustration, not a substitute for the general proof or an actual automorphic instance. Negative controls: dropping T-Z commutation allows nilpotent J times Z to have nonzero trace; using n=1 need not work due to cancellation between blocks. Uncompressed T's deliberately do not commute. Output: word identities 186; polynomial identities 204; original block trace identities 102; negative controls 2 (noncommuting Z, n=1 cancellation); n=2 common trace=4.
```python
from itertools import product
from sympy import Matrix, eye, zeros, diag, Rational, I, expand

E = diag(1, 1, 1, 0)
N = zeros(4); N[0, 1] = 1
A = diag(2, 2, 3, 0) + N
B = diag(-1, -1, 5, 0) + 2*N
C = zeros(4); C[0, 3] = 7; C[3, 3] = 11
D = zeros(4); D[1, 3] = 3; D[3, 3] = -2
T = (A+C, B+D); t = tuple(x*E for x in T)
P = t[0]**2*(3*eye(4)-t[0])/4
assert P == diag(1, 1, 0, 0)
assert T[0]*T[1] != T[1]*T[0]
theta = (2, -1)
a = {(0,0): Rational(3,4), (0,0,0): Rational(-1,4)}

def word(X,w):
    m = eye(4)
    for j in w: m = m*X[j]
    return m

def val(w):
    n = 1
    for j in w: n *= theta[j]
    return n

def wop(X,s): return sum((c*word(X,w) for w,c in s.items()), zeros(4))
def wval(s): return sum(c*val(w) for w,c in s.items())
def wmul(a,s):
    out = {}
    for x,c in a.items():
        for y,d in s.items(): out[x+y] = out.get(x+y,0)+c*d
    return out

def trace(M): return expand(M.trace())

assert wval(a) == 1 and wop(t,a) == P and P*P == P
for j in range(2):
    assert (t[j]-theta[j]*eye(4))**2*P == zeros(4)
    assert t[j]*P == P*t[j]
assert t[0]*t[1] == t[1]*t[0]
blocks = []
for sign in (-1,1):
    v = diag(sign,sign,2,0)
    u = v+C
    up = diag(sign,sign,Rational(1,2),0)
    assert E*E==E and E*u*E==u*E and up*u*E==E
    for i in range(2):
        assert E*T[i]*E==T[i]*E
        assert u*T[i]*E==T[i]*u*E
        for j in range(2): assert T[i]*T[j]*E==T[j]*T[i]*E
    assert u*E==v
    blocks.append((u,v))
assert sum(trace(P*E*v) for u,v in blocks)==0
assert sum(trace(P*E*v**2) for u,v in blocks)==4
words = [w for k in range(5) for w in product(range(2),repeat=k)]
word_checks=0; poly_checks=0; original_checks=0
polys = [{w: 1, (): 2+I} for w in words if w] + [{(): 1}, {(0,):1, (): -2}, {(0,1):I,(1,0):-I}, {}]
for u,v in blocks:
    for n in (1,2,3):
        Z=v**n*E
        for w in words:
            assert trace(word(t,w)*Z*P)==val(w)*trace(Z*P)
            word_checks+=1
        for s in polys:
            assert expand(trace(wop(t,s)*Z*P)-wval(s)*trace(Z*P))==0
            poly_checks+=1
for n in (1,2,3):
    constant=sum(trace(P*E*v**n) for u,v in blocks)
    for s in polys:
        left=sum(trace(wop(T,wmul(a,s))*u**n*E) for u,v in blocks)
        assert expand(left-wval(s)*constant)==0
        if n==2 and wval(s)!=0: assert left!=0
        original_checks+=1
J=Matrix([[0,1],[0,0]]); Z=J.T
assert J**2==zeros(2) and trace(J*Z)==1 and trace(Z)==0
print(f'word identities {word_checks}; polynomial identities {poly_checks}; original block trace identities {original_checks}; negative controls 2 (noncommuting Z, n=1 cancellation); n=2 common trace=4')
```
RESULT: DONE at pinned source level for two private trace lemmas and exact original-block consumer; PARTIAL for upstream relocation and authenticated root/dependency edges. No RH proof completion, independent Lean kernel validation or URT improvement claimed.

RESUME HERE: retrieve the pinned P Source SpecOfF.lean (RUN17 blob 2a619e581a3f64fd8a548f6dc7ad614a8b591ebf) and reconstruct the next not-yet-expanded supplier of its finite definite-form-class operator construction, in particular compare the changed finite_doubleCoset supplier and prove the class transport/finite-dimensional prerequisites (avoid RUN17's assembly repetition). In parallel ask kernel/dependency lane for specAlg manifest ID 13962369 value-root 1059646507 direct references and authenticated H relocation via source index; retain PTracePow/PProjTrace and frob_laws gaps. HANDOFF TO Galois, dependencies, kernel, integration, editor, audit, literature. Project OPEN.

<!-- END VERBATIM specialists/galois_representations/RUN19_POLYNOMIAL_TRACE_FACTORIZATION.md -->


---

<!-- BEGIN VERBATIM specialists/kernel_extractor/RUN19_EXACT_TLIFTK_AUXILIARIES.md ec464884ea830676fc9367e1cb67bb2deba875d4 -->
# RUN19 — exact generated TLiftK obligations and raw role conservation
2026-11-25. PARTIAL / AUTHENTICATED EXPORTED EXPRESSIONS, independent V8 traversal executed; NOT kernel replay. Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10 unchanged since RUN18; not adopted. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/continuity excerpts, CI #406 and latest 14 peer handoffs (excerpts); blueprint not reopened. Integration 4f08b858 owns geometry-lift Row0; no duplicate. Post34 compute status unavailable (404). No unrelated physics edits.

## Actual archive result
RUN18 native compute job https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45516076429 completed exit 0, wall 2251.17 s, status blob 17c472d2312327601268339c9b1f6f3c81ac2534. It hashed all 61,570,595,788 bytes, stored 10,510,351,673 bytes compressed under 10 GiB cap, reached latest root before cap, no unresolved roots. Output compute/rh-bounded-raw-scope-20261125/outputs/selected_raw_scope.json, blob 63c3592e4b3997433e5e0af910eddf6137cdac69, SHA256 47db485f1c648d3d1a39de78ad69ff62583b433fc2d3793241b7d96532fd95b1. Native report has 969 assertions, all 14 roots, 256 unique expression nodes, 276 independent scoped states. This run independently checks the retrieved genuine output rather than rescanning the archive. Blob IDs verified via connector, raw bytes not rehashed in V8; CLI below verifies Git blob hashes.

## Human obligations recovered
Let E be a type with Field and NumberField instances, F = maximalRealSubfield E, O = RingOfIntegers F, A = Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes.AF F. All four generated declarations quantify exactly E, [Field E], [NumberField E] (no IsCMField binder in these auxiliary terms). They supply:
1. NumberField F, by NumberField.of_subfield E applied to the actual subfield. Type/value roots 9078396 / 9078404, bodies 9078393 / 9078401.
2. IsDedekindDomain O, by NumberField.RingOfIntegers.instIsDedekindDomain F fieldF (NumberField.of_subfield ...). Roots 9838915 / 9838921, bodies 9838912 / 9838918.
3. IsFractionRing O F, by NumberField.RingOfIntegers.instIsFractionRing with the same F and number-field instance. Roots 9838937 / 9838943, bodies 9838934 / 9838940.
4. SMulCommClass F A A, by Algebra.to_smulCommClass with algebra F→A and semiring instances. Roots 997980875 / 997980883, bodies 997980872 / 997980880. Its type explicitly uses all three preceding generated proofs (witnesses 997980830, 997980839, 997980846); its value constructs the corresponding instances via their suppliers rather than those generated theorem names. Exact AF reference 560935, expression 13430270; type-level A expression 997980834 uses proof1, while value-level A 997980876 uses NumberField.of_subfield. Type-level scalar action 997980864 derives from Algebra.toSMul; second action 997980871 from instSMulOfMul / Distrib.toMul / instDistribOfSemiring. Value arguments [9078386,997980876,9838930,9841530,9841535] retained; do not claim definitional equality checked.
Source src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean, pinned blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275, L18–19 contains two distinct ResEtaPow guards (chiX n and chiW d) using exactly Units.map (algebraMap F (AF F)).toMonoidHom. These typeclass obligations explain the ambient algebra; caller expression of TLiftK itself was NOT part of this slice, so exact assignment of each generated proof to each Units.map occurrence remains open. Neither guard may be discarded. This is not the theta-lift theorem or proof of any of its analytic premises.

Additional exact recoveries: EveryCharacter._proof_1 : Nat.AtLeastTwo (1+1), supplied by Nat.instAtLeastTwoHAddOfNat 1 (Nat.instNeZeroSucc 0); explicit typeclass args retained in raw record. OpenLiteratureStatements.mk takes ordered fields Row, RecTExists, Row, with distinct names caraianiLocalGlobalDual, localLanglandsExists, galoisRepOfPolarizedPairLit; recursor motive M: OpenLiteratureStatements→Sort u, method m : ∀ a b c, M(mk a b c), t:OpenLiteratureStatements; returns M(t), computation rhs m a b c, raw application 3107. No field collapsed.

## Executed independent certificate
{"checks":2059,"roles":14,"edges":862,"referenceOccurrences":148,"uniqueNodes":256,"generatedProofs":4,"negatives":5}. Rewalk raw children, compare exact per-role tagged reference groups, witness membership and multiplicities with report, verify selected ordered applications and all four binder spines. Mutation controls: dropped AF record, swapped application order, altered instance binder, removed reference group, changed constructor field. Initial control driver used body ID instead of type root for selecting the report; fixed to 997980875 and reran. Proof of scope-limited reference preservation: structural recursion enumerates all ordered child edges in a finite acyclic expression DAG, visits each expression record once per role; every explicit constant and Nat literal is counted by kind and target; equality of the resulting groups and multiplicities plus witness membership rejects missing groups/records relative to these inputs. This is not a universal equivalence proof of a human paraphrase, occurrence-path multiplicity, or fresh axiom census. No URT improvement claimed. No Lean executable invoked this run.

Reproduce: save following code as run19.mjs; node run19.mjs selected_raw_scope.json TLiftK.lean. Both inputs pinned by Git blob hashes.
```js
import fs from "node:fs";
import crypto from "node:crypto";
function verify(d,source){
 let checks=0;const ck=(x,m)=>{if(!x)throw Error(m+" at "+checks);checks++};const eq=(a,b,m)=>ck(JSON.stringify(a)===JSON.stringify(b),m);
 ck(d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&d.archiveDigest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&!d.partial&&d.unresolved.length===0,"identity");
 let a=new Map(d.records.ie.map(([i,s])=>[i,JSON.parse(s)])),names=new Map(d.scope.nameTable);
 ck(a.size===d.records.ie.length&&a.size===256&&d.selected.length===14,"records");
 function kids(e){if(e.app)return [e.app.fn,e.app.arg];if(e.forallE||e.lam){let z=e.forallE||e.lam;return [z.type,z.body]}if("bvar"in e||"sort"in e||e.const||"natVal"in e)return [];throw Error("unknown tag")}
 let roles=0,edges=0,occ=0;
 for(const r of d.selected){let seen=new Set,stack=[r.expressionRoot],refs=new Map,ed=0;
  while(stack.length){let i=stack.pop();if(seen.has(i))continue;seen.add(i);let e=a.get(i);ck(e&&e.ie===i,"node");let ch=kids(e);for(let j of ch){ck(j<i,"ordered child");stack.push(j)}ed+=ch.length;
   let ref=e.const?["explicit_const",e.const.name]:"natVal"in e?["literal_primitive",61]:null;
   if(ref){let k=JSON.stringify(ref);if(!refs.has(k))refs.set(k,[]);refs.get(k).push(i)}
  }
  eq(seen.size,r.expressionsRead,"node count");eq(ed,r.childEdges,"edge count");eq(refs.size,r.references.length,"reference groups");let count=0;
  for(let x of r.references){let k=JSON.stringify([x.kind,x.target]),ids=refs.get(k);ck(ids&&ids.includes(x.witnessExpression),"witness");eq(ids.length,x.distinctExpressionRecords,"multiplicity");eq(names.get(x.target),x.nameParts,"tagged name");count+=ids.length;refs.delete(k)}
  eq(count,r.referenceOccurrences,"occurrence count");ck(refs.size===0,"no omitted group");roles++;edges+=ed;occ+=count;
 }
 function spine(i){let args=[];while(a.get(i).app){let z=a.get(i).app;args.unshift(z.arg);i=z.fn}let e=a.get(i);return {head:e.const?e.const.name:"bvar"in e?"$"+e.bvar:i,args}}
 function shape(i,head,args){eq(spine(i),{head,args},"ordered application "+i)}
 const roots=[[9078396,9078404,9078393,9078401],[9838915,9838921,9838912,9838918],[9838937,9838943,9838934,9838940],[997980875,997980883,997980872,997980880]];
 for(let [t,v,tb,vb] of roots){for(let [id,kind,body] of [[t,"forallE",tb],[v,"lam",vb]]){for(let [type,info] of [[315,"default"],[2200840,"instImplicit"],[8711353,"instImplicit"]]){let z=a.get(id)[kind];ck(z&&z.type===type&&z.binderInfo===info,"binder");id=z.body}eq(id,body,"body")}}
 shape(9078393,341190,[9078386,9078392]);shape(9078401,435583,[13,2,1,9078391]);
 shape(9838912,348070,[9838908,9838911]);shape(9838918,417457,[9078386,9078392,9078401]);
 shape(9838934,360211,[9838908,9838924,9078386,9838930,9838933]);shape(9838940,417477,[9078386,9078392,9078401]);
 shape(997980872,110448,[9078386,997980834,997980834,997980864,997980871]);shape(997980834,560935,[9078386,9078392,997980833]);shape(997980833,13125906,[13,2,1]);shape(997980842,13125937,[13,2,1]);shape(997980849,13125938,[13,2,1]);shape(997980880,164561,[9078386,997980876,9838930,9841530,9841535]);shape(997980876,560935,[9078386,9078392,9078401]);
 shape(1025073,4685,[44372]);shape(44372,37,[316,316,316,3852,1064,1064]);shape(44333,4764,[1064,44332]);
 let t=12992048;for(let x of [12992043,12992044,12992043]){let z=a.get(t).forallE;eq(z.type,x,"constructor field");t=z.body}eq(t,12992045,"constructor result");
 shape(3107,"$3",[13,2,1]);
 ck(source.includes("def TLiftK : Prop :="),"source header");
 eq(source.split("\n").filter(x=>x.includes("ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range")).length,2,"two source occurrences");
 return {checks,roles,edges,referenceOccurrences:occ,uniqueNodes:a.size,generatedProofs:4};
}
function tests(d,s){const result=verify(d,s);let negatives=0;for(const change of [x=>x.records.ie=x.records.ie.filter(z=>z[0]!==997980834),x=>{let z=x.records.ie.find(z=>z[0]===997980872);let e=JSON.parse(z[1]);[e.app.arg,e.app.fn]=[e.app.fn,e.app.arg];z[1]=JSON.stringify(e)},x=>{let z=x.records.ie.find(z=>z[0]===997980874);let e=JSON.parse(z[1]);e.forallE.binderInfo="default";z[1]=JSON.stringify(e)},x=>{x.selected.find(z=>z.expressionRoot===997980875).references.pop()},x=>{let z=x.records.ie.find(z=>z[0]===12992047);let e=JSON.parse(z[1]);e.forallE.type=12992043;z[1]=JSON.stringify(e)}]){let q=JSON.parse(JSON.stringify(d));change(q);try{verify(q,s)}catch(e){negatives++;continue}throw Error("negative accepted")}return {...result,negatives}}
const [p,s]=process.argv.slice(2);
function read(p,h){const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==h)throw Error("blob "+p);return b.toString("utf8")}
console.log(tests(JSON.parse(read(p,"63c3592e4b3997433e5e0af910eddf6137cdac69")),read(s,"4b36fc43e988270944cef2fc1b5e9ee1493fc275")));
```
RESUME HERE: request the actual TLiftK definition type/value roots from authenticated manifest and extract its caller expression with both Units.map witnesses; bind the four auxiliary proofs to exact occurrence paths, rather than inferring from source lines. Reuse existing raw slice or peer offsets; do not repeat all 61.57 GB unnecessarily. HANDOFF TO integration, editor, theta, Galois, dependencies, acceleration, audit. Full RH reconstruction OPEN.

<!-- END VERBATIM specialists/kernel_extractor/RUN19_EXACT_TLIFTK_AUXILIARIES.md -->


---

<!-- BEGIN VERBATIM specialists/landau_criterion/RUN19_JACOBI_KERNEL_AND_STRONG_FE_PAIR.md 4d81b2a9067dcaa15182b0626425997ba14371b5 -->
# RUN19 — Jacobi theta kernel and weak-to-strong Mellin endpoint construction
2026-11-25. DONE for the following source-matched human derivation, not a Lean replay, not a full RH proof, not an URT performance claim.

## Provenance and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol and continuity excerpts, latest physics CI summary #407 at 01:06:19Z (not RH validation), RUN18, recent commit titles and peer handoffs for all fourteen other lanes. No duplicate in inspected handoffs. Linked external blueprint and all peer full files not reopened. No physics gates modified.
RH source P=40e56bab026552e089d7afcfeff08d2defb9c005; H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, upstream head retrieved at this run, commit timestamp 2026-11-25T01:15:19Z, merge PR #1739. Advanced from RUN18 b2f365a68500e2bde98cd60a2324263fc62fba10. lake-manifest.json blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f / 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474, N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 unchanged.
Four source files retrieved at both pins from leanprover-community/mathlib4 (GitHub blob identifiers, not locally rehashed):
- Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean a7edac6433ba93905d9c00a95aa40bb9d9f3971e / e7ed2963d808e77e1ceb6529914a1bb90bebd6f4
- Mathlib/NumberTheory/ModularForms/JacobiTheta/Bounds.lean da0999ad54bcd20af5504da9a02aa6ea6ece1d02 / 4d476be4787e480afbc812907afbb7c9291b8e6b
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f
- Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean ada6574d2ed7e3d0b1122376c3bb8581f6385a1d / 26754c1f2894ba79f8fa729dc18e1f0fc0189997
Exact text equality: TwoVariable M420–494 = N421–495; Bounds M75–82,132–148,239–247 identical; Hurwitz M132–153,163–215,223–229,254–276 = N+2; Abstract M217–232,247–315 = N+2. Five inspected blocks differ in tactic/name text only: Bounds 115–122 exp_nat_mul→exp_natCast_mul; 124–130 convert!→convert; 249–264 if_false→ite_false; Hurwitz 232–244 (N+2) if_false→ite_false; Abstract 150–169 (N+2) IsBigO expansion→isBigO_iff and convert!→convert. No changed statements in these blocks; no global equivalence or elaborated reachability claimed.

## 1. The actual theta functional equation
TwoVariable M465–490, jacobiTheta₂_functional_equation. Define theta(z,tau)=sum over integers n of exp(pi i n² tau+2 pi i n z). For Im(tau)>0, Gaussian decay dominates the linear term in n, giving absolute convergence. Native proof uses tsum_exp_neg_quadratic with Re(-i tau)>0, then completes the square and factors the common exponential. This is the Poisson Gaussian identity (import Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean, not yet expanded in this lane).
theta(z,tau)=(-i tau)^(-1/2) exp(-pi i z²/tau) theta(z/tau,-1/tau), with principal complex power. When Im(tau)<=0 the native theta is totalized to zero; Im(-1/tau)<=0 (also at tau=0 with Lean division), so both sides zero. This is not a convergent series assertion in the lower half-plane.
HurwitzZetaEven M132–153 evenKernel_functional_equation, M163–215 summation formulas: for real representative a and t>0,
 E_a(t)=sum_n exp(-pi (n+a)² t)=exp(-pi a²t)theta(ai t,it);
 C_a(t)=sum_n exp(2 pi i n a)exp(-pi n²t)=1+2 sum_{n>=1} cos(2 pi n a)exp(-pi n²t).
Both periodic in a modulo 1 (integer reindexing, or periodic phase). C is real by pairing n,-n; continuity on t>0 follows from locally uniform Gaussian domination or native continuousAt_jacobiTheta₂ (M116–130). Insert tau=it and z=ait: z/tau=a, -1/tau=i/t, -i tau=t>0, -pi i z²/tau=+pi a²t. The exponent cancels exactly with the prefactor of E, yielding E_a(t)=t^(-1/2) C_a(1/t); equivalently E_a(1/t)=sqrt(t) C_a(t). For t<=0 native kernels vanish, including t=0 via totalized inverse; analytic manipulations only for positive t.

## 2. Explicit exponential decay, including the discontinuity at a=0
Bounds M75–82,115–148,239–264; Hurwitz M183–215,223–244. Choose unique a in [0,1). For b>=0, n>=0, (n+b)²>=n+b², since n²>=n and 2nb>=0. With q=exp(-pi t) in (0,1),
 F(b,t)=sum_{n>=0}exp(-pi(n+b)²t)<=exp(-pi b²t)/(1-q).
 For b=0 remove n=0; F(0,t)-1=F(1,t)<=q/(1-q).
 Split integer sum via n>=0 and n=-m-1, m>=0: E_a=F(a,t)+F(1-a,t). Exactly one constant term occurs if a=0, never for 0<a<1. The cosine kernel always has constant 1. Thus c_a=1 if a=0 in R/Z, else 0. Native combines the two positive rates via min, and uses |cos|<=1 for C.
 Additional explicit bounds (human derivation from the native comparisons): set d(a)=1 if a=0, otherwise min(a,1-a)>0. For every t>0,
 exp(-pi d(a)² t) <= E_a(t)-c_a <= 2 exp(-pi d(a)²t)/(1-exp(-pi t)),
 |C_a(t)-1| <= 2 exp(-pi t)/(1-exp(-pi t)).
 Lower bound is a single nearest nonconstant summand (two at a=0 or a=1/2, but one sufficient). Therefore the maximal possible exponential rate for E_a-c_a at fixed a is exactly pi d(a)²: any larger p would imply exp((p-pi d²)t)<=constant for all large t, impossible. At a=0 the rate is pi; arbitrarily small positive a forces the rate to approach 0. No uniform positive rate over the full circle even allowing the big-O constant and threshold to depend on a. Stronger than mere existence of a rate, not a new RH result. Uniform estimates require staying a positive distance from nonzero representatives tending to 0 or 1; the exact a=0 case can be treated separately.
 For t>=1 the denominator is bounded below by 1-exp(-pi)>0. For every fixed real r and fixed p>0, e^(-pt)=O(t^r) since r log(t)+pt→+infinity. Constants and threshold may depend on a and r. This is the exact all-real-power quantifier in Hurwitz M254–276; not uniform in a or r. Continuity provides local integrability on (0,infinity), not integrability at zero. Weak FE pair fields k=1/2>0, eps=1!=0, f=E_a, g=C_a, f0=c_a, g0=1. No zero-free statement used.

## 3. Weak-to-strong construction and endpoint powers
AbstractFuncEq M80–95,107–129,150–169,247–315,217–232. Let E be a complex normed additive group with complex scalar action as native; completeness required for Mellin integrals in RUN18. Weak pair: k>0, eps!=0, f,g locally integrable on positive reals; both errors f-f0,g-g0 are O(x^r) at infinity for each real r; f(1/x)=eps*x^k g(x) for x>0. The symmetric equation g(1/x)=eps^(-1)*x^k f(x) follows by replacing x with 1/x and dividing by the nonzero eps*x^(-k).
Define F(x)=f(x)-f0 for x>1; f(x)-eps*x^(-k)g0 for 0<x<1; zero elsewhere including x=1. Define G(x) symmetrically with f,g and f0,g0 swapped and eps inverted. These are locally integrable: on any positive compact interval x^(-k) is continuous bounded; indicators of open intervals are measurable; subtraction, multiplication by indicator, addition preserve local integrability. No integrability near 0 assumed.
Modified equation F(1/x)=eps*x^k G(x):
- x>1: F(1/x)=f(1/x)-eps*x^k g0=eps*x^k(g(x)-g0).
- 0<x<1: F(1/x)=f(1/x)-f0=eps*x^k(g(x)-eps^(-1)x^(-k)f0).
- x=1: both modified values zero by construction. This value is needed for the exact pointwise identity; modifying on a singleton does not affect Mellin integrals.
At infinity, F=f-f0, G=g-g0 eventually, so all real-power decay inherited. At zero, F(x)=eps*x^(-k)(g(1/x)-g0). For arbitrary real r, apply g's infinity bound with r'=-(r+k); as x→0+,
 ||F(x)||<=|eps| C x^(-k) (1/x)^(-(r+k))=|eps| C x^r.
Similarly G via eps inverse and f bound. This establishes the native strong pair with both constant terms zero; no dependence on a fixed positive r and no arbitrary exchange of limits. For Hurwitz specifically, the sharper bounds also give F(x)=O(x^(-1/2) exp(-pi/x)), G(x)=O(x^(-1/2) exp(-pi d(a)²/x)) at 0, with the respective constants c_a and 1 subtracted. These estimates imply every power bound at 0 as well.
For any complex s, put sigma=Re(s). Choose real r_inf<-sigma and r_0>-sigma. Then the norm of x^(s-1)F(x) is bounded by constants times x^(sigma-1+r_inf) at infinity (exponent<-1) and x^(sigma-1+r_0) at zero (exponent>-1). On compact positive intervals local integrability suffices. These inequalities hold uniformly in a small neighborhood of s by leaving strict margins; a factor |log x| from differentiation is absorbed by a smaller margin. Thus the Mellin transform of F is entire, as required in RUN18. The native Mellin differentiability supplier is still an imported theorem; above is the standard dominated-differentiation argument, not an independent Lean replay.
Dependency direction: Gaussian Poisson -> Jacobi reciprocity + independent Gaussian estimates -> weak FE pair -> strong FE pair -> entire regularized Mellin -> residues -> boundary prerequisites -> conditional Landau theorem. No use of zero-free conclusions in the upstream analytic leaves. Landau's separate 0<theta<1, delta>0, positive real-pole residue, and window hypotheses remain intact; no assertion of absence of exceptional real zeros in the critical strip.

## 4. Executed finite certificate
Run with Node by extracting the JS block. Exact integer exponent checks and finite double-precision actual theta series/analytic tail comparisons. Truncate E to -N..N and C to symmetric range, N chosen from t, omitted distances >=N and squared increments >=1 give each tail bound 2 exp(-pi N²t)/(1-exp(-pi t)). Floating tolerance is explicit and not a rigorous floating-point enclosure. The tests do not establish the Poisson theorem or infinite quantifiers; the derivation above explains the general inequalities.
```js
function certificate(){
 const check=(b,m)=>{if(!b)throw Error(m)};
 let algebra=0,fe=0,bounds=0,negative=0,maxResidual=0,maxTail=0;
 // Exact exponent comparison after clearing denominators: a=j/D, n>=0.
 for(let D=1;D<=24;D++)for(let j=0;j<=D;j++)for(let n=0;n<=32;n++){
  let u=BigInt(n*D+j),v=BigInt(n*D*D+j*j);
  check(u*u>=v,"geometric majorant");algebra++;
  check(BigInt(-((n+1)*D)+j)**2n===BigInt(n*D+D-j)**2n,"negative half-line");algebra++;
 }
 // Exact exponent bookkeeping at x=0: using r'=-(r+k) is necessary.
 for(let k=1;k<=16;k++)for(let r=-20;r<=20;r++){
  const rp=-(r+k);check(-k-rp===r,"endpoint exponent");algebra++;
 }
 function kernels(a,t){
  const N=Math.ceil(Math.sqrt(45/(Math.PI*t)))+3;
  let E=0,C=1;
  for(let n=-N;n<=N;n++)E+=Math.exp(-Math.PI*(n+a)**2*t);
  for(let n=1;n<=N;n++)C+=2*Math.cos(2*Math.PI*n*a)*Math.exp(-Math.PI*n*n*t);
  // Both omitted half-lines have distance >=N; subsequent square increments >=1.
  const tail=2*Math.exp(-Math.PI*N*N*t)/(-Math.expm1(-Math.PI*t));
  return {E,C,tail};
 }
 for(const a of [0,0.001,0.01,0.125,0.25,0.5,0.75,0.99,0.999])for(const t of [0.04,0.1,0.25,0.5,1,2,4,10,25]){
  const A=kernels(a,t),B=kernels(a,1/t);
  const residual=Math.abs(A.E-B.C/Math.sqrt(t));
  const err=A.tail+B.tail/Math.sqrt(t);
  check(residual<=err+2e-13*Math.max(1,A.E),"theta reciprocity");fe++;
  maxResidual=Math.max(maxResidual,residual);maxTail=Math.max(maxTail,err);
  const d=a===0?1:Math.min(a,1-a),c=a===0?1:0;
  const lo=Math.exp(-Math.PI*d*d*t),hi=2*lo/(-Math.expm1(-Math.PI*t));
  check(A.E-c+A.tail+2e-13>=lo&&A.E-c<=hi+2e-13,"even kernel bounds");bounds++;
  check(Math.abs(A.C-1)<=2*Math.exp(-Math.PI*t)/(-Math.expm1(-Math.PI*t))+A.tail+2e-13,"cos kernel bound");bounds++;
 }
 // Mutations: omit constant for a=0; subtract 1 for a=1/2; omit x^-1/2.
 check(kernels(0,10).E>0.99,"missing constant mutation");negative++;
 check(kernels(0.5,10).E-1< -0.99,"wrong constant mutation");negative++;
 check(Math.abs(kernels(0,4).E-kernels(0,0.25).C)>0.9,"missing modular weight");negative++;
 // No common positive exponential rate over all a !=0: a=1/n at t=n^2.
 for(const n of [10,100,1000]){check(kernels(1/n,n*n).E>=Math.exp(-Math.PI)-1e-13,"nonuniform family lower bound");negative++}
 return {exact_exponent_checks:algebra,theta_reciprocity_cases:fe,decay_bound_cases:bounds,negative_and_nonuniform_controls:negative,max_abs_reciprocity_residual:maxResidual,max_analytic_truncation_bound:maxTail};
}
console.log(JSON.stringify(certificate()));
```
Actual executed result: `{"exact_exponent_checks":22040,"theta_reciprocity_cases":81,"decay_bound_cases":162,"negative_and_nonuniform_controls":6,"max_abs_reciprocity_residual":1.7763568394002505e-15,"max_analytic_truncation_bound":6.523726292469893e-26}`.

## RESUME HERE
Expand the actual imported Gaussian Poisson identity tsum_exp_neg_quadratic in Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean at both Mathlib pins, including Re(parameter)>0 and the complex square-root branch; alternatively if peer proof exists, proceed to the actual Mellin differentiability supplier with exact endpoint inequalities. Request authenticated role-labelled root paths for zeroFree_of_rpow_window, Landau analytical suppliers, WeakFEPair and Hurwitz/Jacobi prerequisites: these are source-linked translations, not proof-root reachability. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, prime, math.

<!-- END VERBATIM specialists/landau_criterion/RUN19_JACOBI_KERNEL_AND_STRONG_FE_PAIR.md -->


---

<!-- BEGIN VERBATIM specialists/literature_provenance/RUN19_RELATION_IDEAL_FILTRATION_AND_BASE_DERIVATION.md cb3bd42f39b0fe6531b06189fb39c48898f1aebe -->
# RUN19 — Divided-power relation ideal, filtration and conditional base vanishing
2026-11-25. SOURCE-MATCHED human reconstruction; local scope only. Source: leanprover-community/riemann-hypothesis pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main observed 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (2026-11-25 01:15:19 UTC). Continuity: RUN18 c27fa70f3f46f7f28a3662de38f3be3b9965cf5f explicitly assigns rel_mul_mem and rel_filDR_properties. Read AGENTS, swarm protocol, expansion, handoff queue, research log head, research state tail, continuity, research protocol; inspected available recent math, geometry, integration, kernel and editor RESUME HERE notes and latest swarm commit messages. Other lane detailed notes not all recovered. Prior CI summary 45523200023 PASS at e14abc2, not a verdict on this run. No physical work or queue edits.

## Exact local theorem
Let R,B be commutative rings, B an R-algebra, J an ideal of B, δ divided powers on J. E=DR(R,B), the exterior algebra on relative Kähler one-forms, with sign automorphism sgn (degree parity). Let g(n,a)=ι(dδ_{n+1}(a)−δ_n(a) da), n≥0, a∈J. L=left ideal span of these generators (Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean L23–24). Define F_n B as ideal span of finite products ∏ δ_{k_i}(a_i) with all a_i∈J and Σ k_i≥n, including the empty product at n=0 (RatBasisLinearIndependentInt.lean L15–17). Let S_n=left ideal generated by scalar images of F_n B; H_n=S_n+L (Definitions... L165).

The seven conjuncts of rel_filDR_properties (Proofs/DivisorProofs/DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean L122–140) are:
1. ∀x∈L ∀y∈E, xy∈L.
2. ∀x∈L, sgn(x)∈L.
3. ∀n ∀x∈H_n ∀y∈E, xy∈H_n.
4. ∀n ∀x∈H_n, sgn(x)∈H_n.
5. H_0=E.
6. ∀m,n, m≤n ⇒ H_n⊆H_m.
7. ∀m,n ∀b∈F_m B ∀x∈H_n, bx∈H_{m+n}.
No commutativity assumption on E; right closure must be proved for the Lean left ideal span. No nilpotence, characteristic-zero, invertible factorial, flatness or geometric hypotheses are added. Conditional eighth output (separate from the universal seven) below.

## Reconstruction mapped to native proof
L18–32 (span_mul_mem, span_map_mem): for any ring A, to show right closure of a left ideal span, it suffices to show every generator times every y lies in the span. Induct on span membership: generator by premise, zero trivial, addition by distribution, left multiplication by associativity. For preservation by ring endomorphism f, use the analogous induction with f(rx)=f(r)f(x). L34–46: an element of a sum of ideals is a+b; distribute right multiplication or f over that sum.

L52–64 (fil_anti', fil_mul_mem'): higher weight generator is a lower weight generator. Products of two generators concatenate their lists; weights add, factors remain in J, and product equals the concatenated product. The product of two ideal spans is the span of pairwise products, so F_m F_n ⊆ F_{m+n}. This includes m or n=0 and empty lists.

L73–91 (relGen, rel_eq_span, rel_mul_mem, sgn_mem_rel): every generator g is a one-form and satisfies g y=sgn(y) g by exterior parity commutation (source rewrites ι_mul). Thus gy lies in the left span. Generator sign is −g (sgn_ι), so sign preserves the span. Apply the two span induction lemmas. This is the actual source reason right closure holds; ordinary left ideal membership alone is insufficient. No division by 2, including characteristic two.

L93–106: every generator of S_n is a central scalar, hence sy=ys. Sign fixes scalars. Apply the same span induction. L108–120: for b∈F_m, multiplication by b sends each generator c∈F_n to bc∈F_{m+n}. Extend by additive and scalar-multiplication induction, using centrality to move b past an arbitrary left multiplier. Now H_n=S_n+L inherits right closure and sign stability by sum lemmas; H_0 contains 1 (empty product and map_one); inclusion by antitonicity; scalar shift on S_n by the previous lemma and on L by left ideal property. This proves all seven outputs, in source order. Does not say the filtration is separated, nilpotent or strictly descending.

## Conditional vanishing is not unconditional
L143–150 rel_eq_bot_of_map: additionally take I⊂R with divided powers κ, assume h:IsDPMorphism κ δ (algebraMap R B) AND hJ:J≤I.map(algebraMap R B). Then L=0. The first hypothesis also gives I.map≤J. The theorem calls GlobalTheory.CrysConn.isDPDer_of_map h hJ (D R B), hence each generator g(n,a)=0; span of zero elements is bottom. The wrapper at L152–161 pairs this implication with the universal seven, not with a claim that all divided-power relation ideals vanish.

Native supplier (PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean L207–240): use arbitrary commutative base T and T-algebra R', with target PD ideal I', base PD ideal J', PD algebra map and I'≤image J'. Module M has left/right R' actions, central scalars, T module and scalar tower; D a T-derivation into M. Set P_0(a)=0 and P_n(a)=δ_{n−1}(a) for n>0. Prove D(δ_n(a))=P_n(a)D(a) on the entire image ideal by span induction. Generator a=algebraMap(t) with t∈J': PD compatibility makes δ_n(a) a base scalar too; D kills both. Zero: n=0 uses D1=0, n>0 uses δ_n(0)=0. Sum: differentiate divided-power convolution using Leibniz and the two predecessor convolution identities (L28–37); collect coefficients of D(a),D(b), both P_n(a+b). Scalar multiplication by arbitrary r∈R': for n>0 differentiate δ_n(ra)=r^n δ_n(a); the term n r^{n−1}δ_n(a)D(r) equals r^{n−1}aδ_{n−1}(a)D(r) by dpPred_mul_self (L39–44), and the other term equals r^nδ_{n−1}(a)D(a). Together these are δ_{n−1}(ra)D(ra). n=0 both sides zero. Source obtains the same equality via second component of the square-zero extension PD scaling law extDP.dpow_mul applied to derSec D r and derSec D a (L230–239); no need to divide by n. h gives membership in I' for all ideal elements throughout induction. Restrict to I' using reverse containment and take n+1. This is a genuine theorem body in a PublishedTheorems file, not an axiom inferred from the directory name. Its extDP construction is located, not yet fully reconstructed in this run.

Counterexample to unconditional vanishing: R=F_p, B=F_p[t]/(t^p), J=(t), p=2 or 3; δ_n(a)=a^n/n! for 0≤n<p, zero for n≥p. These are divided powers: for weight <p use factorial identities; for ≥p every required positive-weight product is zero, and for composition with total weight ≥p both sides zero. For inputs outside J extend by zero as in Lean. Ω_{B/R} is freely generated by dt because d(t^p)=0. g(p−1,t)=−t^{p−1}dt/(p−1)!≠0. The base ideal I=0 has PD map, but J⊆I.map fails. Thus conditional vanishing may not be silently promoted. In a generic noncommutative ring, right closure of a left ideal also fails (2×2 matrices with second column zero; E11 E12=E12). The latter is an analytic negative control, not included in executed count.

## External assumption ledger delta
- GlobalTheory.T.divPowerCompatRel_filtration_twoSided_rel_eq_bot_of_base: direct wrapper of GlobalTheory.PDForm.rel_two_sided_and_bot, pinned Statement L7–8; actual assembly L152–161. Seven unconditional-under-ring-structure predicates and one conditional implication kept distinct.
- PDForm.rel_filDR_properties, rel_mul_mem, sgn_mem_rel, filSpan_* and span/sup helpers: explicit local proof bodies. No new axiom declaration at these boundaries. Exact native premises above.
- PDA.fil, PDForm.rel, PDForm.filDR: definitions, not proof suppliers. fil_zero_eq_top and exterior ι_mul, sgn_ι are referenced suppliers; underlying declarations not independently traced this run. Mathlib Ideal.span_mul_span, span_induction, map and scalar identities are imported results/definitions, not independent published assumptions inferred from names.
- CrysConn.isDPDer_of_map: explicit proof L213–240, not literature postulate. Its genuine input is PD-morphism + reverse inclusion + derivation structure; extDP.dpow_mul is a field of an explicitly constructed DP structure L79–129. Full extDP field verification, nilpotence and functoriality next. CrysConn.dpPred and IsDPDer are definitions; predecessor convolution and scaling are theorem bodies L28–44. No claim of independently authenticated publication citation.
- Definitions file also contains dDR_mem_rel L43–54 (located, not included in seven outputs; separate proof obligation). Local source classification only; no verified role-labelled root path from Main to these leaves, no transitive axiom/sorry audit, no kernel execution. No additional mathematical premises introduced in reconstruction.

## Pinned source ledger and upstream comparison
All paths below relative to src/Development/AbelianVarietyTheory/. GitHub-returned blob identities checked, not independently rehashed. Replay with git show PIN:PATH | git hash-object --stdin.
- Proofs/DivisorProofs/DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean e104c21949356bc49bd0bacd7bb2cc8a4b2950ef; HEAD 188ed8d99cc5b77de5e655b09101352f3d0013e7; exact line LCS 157/163 including terminal blank. Changes include import/module exposure refactor and map_add now with explicit f argument.
- Proofs/DivisorProofs/DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBasStatement.lean 3211d9056706251ae770dad89d1fd23f093f81c9; HEAD old path 404; no claim of replacement without caller check.
- Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean 25fb1d4b42084f570129c678837d37f622ad253a; HEAD 0835aface08a16f3b13f2c4892b13cf8a9a71356; LCS selected old L1–50,150–180 against head 74/81.
- Definitions/Divisors/RatBasisLinearIndependentInt.lean 618acf903e44a0da9cab93d35660599eb41fee46; pinned definition L15–17 read; head not compared.
- PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean 6d297c66f38f4c8ec5e21ec7ffe2fc53a9960a49; HEAD b2fb2ea7c10836b0ac385e6f875938eb99fb469b; LCS old L30–45,70–250 against head 186/197.
Executed 40 named anchor substring assertions and five returned blob-hash matches using actual pinned connector files. LCS is lexical, not proof equivalence. No claim all changed upstream modules audited.

## Executed finite regression (V8, not Lean)
The two concrete examples above have E=B⊕B dt with dt²=0, L=span(t^{p−1}dt), H_n=t^nE+L. For p=2,3 enumerate the entire finite exterior algebra and check generator membership, sign, nonzero relation, right closure (n>0 plus L), antitonicity, and scalar filtration shifts. This tests two small models, not native theorem execution. The generator with a=t,n=p−1 generates L, so the explicit membership model is exact for these examples. Executed results:
p=2: size 16, gen 6, sign 24, right 128, anti 30, scalar 154, nonzeroRelation 1.
p=3: size 729, gen 36, sign 825, right 69984, anti 930, scalar 32880, nonzeroRelation 1.
Total 104997 positive counted checks, two nonzero-relation counterexamples, plus two unit-filter assertions. Reproducible JS:
```js
const assert=(b,m)=>{if(!b)throw Error(m)};
function run(p){
 const q=p, dim=2*q, size=p**dim, pow=Array.from({length:dim},(_,i)=>p**i);
 const vec=Array.from({length:size},(_,x)=>pow.map(w=>Math.floor(x/w)%p));
 const basis=(i)=>pow[i], add=(x,y)=>vec[x].reduce((s,a,i)=>s+((a+vec[y][i])%p)*pow[i],0);
 const neg=x=>vec[x].reduce((s,a,i)=>s+((p-a)%p)*pow[i],0);
 function mul(x,y){let z=Array(dim).fill(0);for(let i=0;i<dim;i++)if(vec[x][i])for(let j=0;j<dim;j++)if(vec[y][j]){
  const d=Math.floor(i/q)+Math.floor(j/q),k=i%q+j%q;if(d<2&&k<q)z[d*q+k]=(z[d*q+k]+vec[x][i]*vec[y][j])%p;
 }return z.reduce((s,a,i)=>s+a*pow[i],0)}
 const sgn=x=>vec[x].reduce((s,a,i)=>s+(i<q?a:(p-a)%p)*pow[i],0);
 const rel=x=>vec[x].every((a,i)=>a===0||i===dim-1);
 const fil=(x,n)=>vec[x].every((a,i)=>a===0||i%q>=n||i===dim-1);
 const bf=(x,n)=>x<p**q&&vec[x].every((a,i)=>!a||(i<q&&i>=n));
 const diff=x=>vec[x].slice(0,q).reduce((s,a,i)=>i?s+(i*a%p)*pow[q+i-1]:s,0);
 const gamma=(n,x)=>{if(!n)return 1;if(n>=q)return 0;let z=1;for(let k=1;k<=n;k++)z=mul(z,x);let f=n===2?2:1;return vec[z].reduce((s,a,i)=>s+(a*f%p)*pow[i],0)};
 let gen=0,sign=0,right=0,anti=0,scalar=0;
 for(let a=0;a<p**q;a++)if(bf(a,1))for(let n=0;n<=q;n++){
  let g=add(diff(gamma(n+1,a)),neg(mul(gamma(n,a),diff(a))));assert(rel(g),"PD relation generator");gen++;
 }
 assert(add(diff(gamma(q,basis(1))),neg(mul(gamma(q-1,basis(1)),diff(basis(1)))))!==0,"nonzero relative relation");
 for(let x=0;x<size;x++){
 if(rel(x)){assert(rel(sgn(x)),"relation sign");sign++;for(let y=0;y<size;y++){assert(rel(mul(x,y)),"relation right");right++}}
 for(let n=0;n<=q;n++)if(fil(x,n)){
 assert(fil(sgn(x),n),"fil sign");sign++;
 if(n>0){for(let y=0;y<size;y++){assert(fil(mul(x,y),n),"fil right");right++}}
 for(let m=0;m<=n;m++){assert(fil(x,m),"anti");anti++}
 for(let m=0;m<=q;m++)for(let b=0;b<p**q;b++)if(bf(b,m)){assert(fil(mul(b,x),m+n),"scalar shift");scalar++}
 }}
 assert(fil(1,0)&&!fil(1,1),"unit filtration");
 return {p,size,gen,sign,right,anti,scalar,nonzeroRelation:1};
}
console.log(JSON.stringify([run(2),run(3)]));
```

RESULT: DONE source-level local reconstruction of seven ideal/filtration predicates and conditional base vanishing, including derivation supplier argument; transitive provenance audit PARTIAL. RESUME HERE: expand CrysConn.extDP all eight fields at pinned PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean L79–129, then isDPNilpotent_extend L139–178 and isDPMorphism_extMap L187–199; derive weight-loss-one bound and prove predecessor composition combinatorics L58–69 without dividing by factorials. Trace ι_mul, sgn_ι, fil_zero_eq_top and dDR_mem_rel as separate remaining obligations. Ask dependency/kernel lanes for authenticated role-labelled root paths to rel_mul_mem, isDPDer_of_map and extDP, not name-only edges. HANDOFF TO literature, dependencies, kernel, integration, editor, geometry, audit. Full RH reconstruction OPEN; no kernel validation or URT advantage asserted.

<!-- END VERBATIM specialists/literature_provenance/RUN19_RELATION_IDEAL_FILTRATION_AND_BASE_DERIVATION.md -->


---

<!-- BEGIN VERBATIM specialists/on_acceleration/RUN19_RESUME.md 5c85f2aefd6dec4150e4016dddfd6a67d3d9b477 -->
# Run 19 — persistent full-manifest lookup and exact 34-producer witness join (2026-11-25)

RESULT: PASS for native lookup and selected projected value-path reconciliation; PARTIAL overall. Source pin [40e56bab026552e089d7afcfeff08d2defb9c005](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005); observed main b2f365a68500e2bde98cd60a2324263fc62fba10, not adopted. The source pin and solution export digest are distinct evidence identities. Root source [src/Main.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Main.lean), global riemannHypothesis ID 14065054. Static source/import references are not elaborated proof-term edges. No mathematical premises removed, no new translation closure, no independent kernel recheck.

## Native results
Artifact [45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ID 14931267327, ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97. Extract job/outputs/reachable_declarations.jsonl.zst; compressed SHA256 45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf, 38,823,812 bytes. Both digests independently verified. All 1,484,705 records indexed with unique tagged names and IDs. 3,035,045 encoded declaration hard-root entries and 1,460,414 metadata entries validated against census; negative structural targets checked for membership, positive expression root ranges checked (not inner expression traversal). Five earlier metadata-only absences not promoted to hard dependencies. Exact raw rows stored in SQLite, 1,067,364,352 bytes. Build committed successfully but initial process hit execution limit during integrity_check before publication; recovered committed temporary file, ran quick_check (1.453s), renamed, then full integrity_check with 256 MiB cache (4.320s, ok). Thus no valid complete build wall time or build peak RAM claim. The recovered database itself is local ephemeral, not uploaded; reproduce from artifact and code. Receipt identifies input, not cryptographic attestation of every cached output after arbitrary tampering.

Same 40 exact ID requests (6 anchors plus 34 producers), identical full-row bytes to conventional single shared scan of authenticated manifest; 40 exact tagged-name comparisons and 66 repeated ID batch comparisons passed. Native Python baseline 13.1850372s for validated shared scan including pre/post SHA checks. Prior Node baseline not same interpreter and not used in this comparison. Query-only timings after building index:

| Schedule | Reopened median ms | Warm median ms |
|---|---:|---:|
| conventional shared | 0.370911 | 0.199648 |
| golden-angle | 0.452646 | 0.218857 |
| periodic | 0.481911 | 0.236068 |

11 repetitions per schedule and connection state; reopened includes opening connection and receipt verification, OS cache not flushed. Reused-index benchmark process VmHWM 100248 KiB (includes baseline scan); isolated build/lookup peaks, storage-cold timings, physical I/O, and amortized build break-even not measured. No universal URT advantage: ordinary order fastest here. This is repeated membership lookup acceleration, not full proof reconstruction. Comparison includes saved prevalidation and parsing work, not equal fresh authentication costs. SQL B-tree operations and index construction are not strictly O(N); stream validation is O(expanded manifest bytes + refs + max ID/8), query O(Q log N + output bytes) plus optional Q log Q scheduling. Raw record size and SQLite caches bounded by configured resources, not full-source memory proof. Exact tagged components avoid flattening numeric and string names. Terminal _proof_1 has 71,506 candidates; never auto-promote a suffix. Negative controls actually run: same-size compressed byte corruption, appended report byte, wrong cache receipt, absent exact name, ambiguous terminal; all handled correctly.

## Exact incoming-path join
Run18 four immutable report blobs and artifact IDs retained, independently verified again. Joined 142 owners to manifest roots, 4,025 distinct manifest identities (owner or explicit value target), 1,263 observed value-reachable IDs, 34/34 integration-selected unexpanded producers, 231 path edge occurrences (shared edges repeated across paths). Each chosen path keeps incoming owner, target, role=value, kind=explicit_const, zero-based caller expressionRoot, witness, multiplicity and report blob. Every traversed explicit target's tagged name and kind matched manifest; every owner type root and available value root matched. Other roles retained in original reports/Run18 index, not discarded. This is a projection join, not fresh raw-term witness verification. Reproducible JSON SHA256 da2afdaf80384ed27f548aee54f1e0b033e45198670e9e957c4cebd8c1f66646. Integration's 23:00 concordance defines frontier; 00:00 integration and kernel Run19 request TLiftK caller body. Prior 34 remain the fixed historical frontier; newer projections can expand them.

## Priority raw-slicer requests (zero-based expression IDs, subtract 1 from manifest refs)
| Exact name | Declaration ID | Type | Value |
|---|---:|---:|---:|
| UpperTheory.TP.TLiftK (def) | 13125905 | 3 | 997984088 |
| UpperTheory.Gal.Int.galoisLocalGlobal_of_geometry_lift | 13235288 | 1004086648 | 1004086661 |
| UpperTheory.TP.TLiftK._proof_1 | 13125906 | 9078396 | 9078404 |
| UpperTheory.TP.TLiftK._proof_2 | 13125937 | 9838915 | 9838921 |
| UpperTheory.TP.TLiftK._proof_3 | 13125938 | 9838937 | 9838943 |
| UpperTheory.TP.TLiftK._proof_4 | 13125939 | 997980875 | 997980883 |
| UpperTheory.Gal.CertificateRingHomMap.pProjOne_holds | 13871527 | 1052651031 | 1052660505 |
| UpperTheory.Gal.CertificateRingHomMap.pTracePow_holds | 13962196 | 1059622222 | 1059628383 |
| UpperTheory.Gal.Spc.specAlg | 13962369 | 1059634995 | 1059646507 |
| UpperTheory.Gal.Spc.specOfF | 13965895 | 1059827818 | 1059842589 |
| UpperTheory.Gal.Spc.specTopG | 13966873 | 1059933754 | 1059934839 |
| PositivityTheory.Rg.Sw.HSt.holLeadB | 8996470 | 720757039 | 722118273 |
| PositivityTheory.Rg.Sw.HSt.asmH_of | 8991968 | 721758566 | 721770742 |
| PositivityTheory.Rg.Sw.HSt.locTau | 8996093 | 721752893 | 722068160 |
| PositivityTheory.Rg.Sw.HSt.crLem | 8996469 | 721752895 | 722118264 |
| HurwitzZeta.completedHurwitzZetaEven_residue_one | 866011 | 26972462 | 26972723 |

Galois/theta/Landau requests below the first six rows found by unique terminal lookup in this manifest; exact names provided, but source binding and projected incoming paths not checked for those additional rows here. GammaDeriv and Lambda_residue_k absent under exact terminal lookup; no claim of nonreachability under alternative names. Kernel lane can now target actual TLiftK definition, not just auxiliaries. Galois integration producer incoming last edge 13235289 -> 13235288, caller value root 1004086672, witness 1004086667, multiplicity 1, report d823c364f446f5066dbbc61f7e9cf9c891fcbdb2.

## Replay
Code commits edf5b4ceea4739826d915994dad431daf1506c18 and dba844154ced6d1f66cb2fa6ea1e12836e9feca3, repository blobs d942437d545b723cfed9c6f651c545cf9223dfdf and aea6be27c4e91bf2970d0a034b4afca5451b2f74 independently matched native executed files.
```sh
set -eu
python manifest_index_run19.py reachable_declarations.jsonl.zst index.sqlite
python frontier_join_run19.py index.sqlite solution_direct_roles.json solution_frontier_roles.json solution_next_root_roles.json solution_literature_theta_frontier.json > frontier_join.json
echo 'da2afdaf80384ed27f548aee54f1e0b033e45198670e9e957c4cebd8c1f66646  frontier_join.json' | sha256sum -c -
```
The four reports are from artifacts 14937732176,14952948474,14962058506,14966122558 respectively, members under job/outputs/ as named above. The first report job failed later source-anchor validation; its exact partial report remains independently hash-bound. Full integrity check on a fresh build may exceed a short execution limit; do not publish partially built database. Do not assume cached files persist across sessions. No source/physics modifications outside acceleration lane. Protocol, queue, expansion, own Run18, integration 23:00 and 00:00, nine specialist handoffs, original lanes' available notes, repository continuity and CI summary inspected; audit directory lacks markdown top-level notes, not fully reread; blueprint not reread or relied on. General CI #407 PASS at 01:06:19Z, not this new code or a kernel replay.

RESUME HERE: add append-order bulk construction and streaming full-cache roundtrip certificate to eliminate random-write/integrity bottleneck, then benchmark fresh build versus reused lookup and persist an authenticated compact name/ID/root index in an available artifact (no huge Git blob). Feed TLiftK definition roots 3/997984088 and Galois/theta requests to kernel/dependency lane; they own raw-term extraction, structure owns compression. Do not rescan raw archive for membership. HANDOFF TO kernel, dependencies, integration, Galois, theta, Landau, editor, structure, audit. Project OPEN.

<!-- END VERBATIM specialists/on_acceleration/RUN19_RESUME.md -->


---

<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN19_FINITE_COVER_INTERPOLATION.md 4e8267db3c79a882e640f92c03ac7b79a733b6d1 -->
# Geometry RUN19 — finite-cover interpolation and global denominator identity
2026-11-25. SOURCE-MATCHED human derivation with exact V8 BigInt regression. Local result DONE; RH OPEN. No kernel replay or authenticated root reachability claimed.

## Continuity / source provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, CI #406 (2026-11-25 00:47:27Z, physical tests only), full RUN18 and recent 35 commit titles and available peer handoffs from literature, math, Galois, theta, character boxes, Landau, prime, kernel, acceleration, integration and editor patches. Structure/audit/dependency latest files were scripts; not all peer files or linked external blueprint reopened. No duplicate identified. No physics changes.
Source leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005; H=b2f365a68500e2bde98cd60a2324263fc62fba10 (merge #1787, 2026-11-25 00:06:45Z), advanced from RUN18. Base src/Development/AbelianVarietyTheory/Proofs/.
- ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean: P blob 10e7d45c32891276ae1ac9121f289e757b4084e0; H blob 3a3500bf3126c4e8e4b2bcd05431feddb754cb88. P L11–58 coefficient/root bounds; L59–87 coefficient descent; L88–120 implicit function; L121–181 separability/root enumeration/product bound; L182 onward main theorem.
- DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean: P blob 820f7247645460d3966ab47e5e15f56fe03f11da; H blob 5979761f966261b7c3ca331f24865167674ac3c5. P L20–44 ring map; L45–99 analytic pullback; L100–112 integral-coordinate growth; L113 onward global identity.
Both revisions retrieved. Whitespace-normalized declaration comparison: 4/11 Toric declarations unchanged, 4/6 Divisor declarations unchanged. Main Toric body changed explicit map_add argument and eval_finset_sum→eval_finsetSum; main Divisor body explicit map_add argument. Root/coeff bound bodies now delegate to GlobalTheory.SimpleRoots suppliers (import NodupRootsOfDerivativeNeZero). Hashes are GitHub-returned blob IDs; not locally recomputed. No claim of elaborated equivalence.
Permalinks:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean#L182
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean#L20

## 1. Exact theorem inputs and outputs
GlobalTheory.FiniteCoverGrowth.integral_and_rational_of_polynomial_growth takes TWO universally quantified imported hypotheses: for every d and nonzero q in R=C[X_1,...,X_d], its nonvanishing locus U is connected AND dense; for every d,m,q,f,C (d,m natural, C real), if q≠0, f is complex differentiable on U and |f(x)|≤C(1+||x||)^m on U, there is g∈R agreeing there. The former is retained although the local proof explicitly ignores it (intro _ hpoly); the latter was reconstructed in RUN17. Given d,m natural, monic p∈R[T], q∈R nonzero with C(q)∈(p,p'), phi:C^d×C→C, C real, let Z={(x,y):x∈U,p_x(y)=0}. For EVERY z∈Z assume an ambient F analytic at z and agreeing with phi eventually in the within-Z neighborhood of z; assume |phi(x,y)|≤C(1+||x||)^m for ALL z∈Z. No global analytic phi assumption, no C>0 or n>0 assumption. Conclusion is conjunction: there exists monic s∈R[T] with s_x(phi(x,y))=0 on Z, AND there exists r∈R[T] with p'_x(y)phi(x,y)=r_x(y) on Z. The theorem does not assert identity at q=0.

## 2. Local root enumeration and analytic descent
Let n=deg p (monic, nonzero), T_x finite set of roots of p_x. Monicity preserves degree. Specialize Bezout then divide by q(x) to obtain coprimality of p_x and p'_x; hence p_x has n distinct roots over C. For x0∈U and a root a, polynomial F(x,y)=p_x(y) is C^1 by finite sums/products of polynomials. Its partial derivative in y is multiplication by p'_{x0}(a)≠0, an invertible complex linear map; the implicit function theorem supplies a differentiable-at-x0 local root y_i. Choose one for each of the n roots. Continuity makes the n roots distinct near x0 (finite intersection of neighborhoods), and degree bounds ensure no further roots. Since U is open, each graph x↦(x,y_i(x)) eventually lies in Z; continuity implies it tends to (x0,y_i(x0)) in the within-Z topology. Pull the assumed analytic extension F_i back along that graph, obtaining differentiable-at-x0 psi_i, with phi(x,y_i(x))=psi_i(x) eventually. No global root labels or global choice of analytic phi are needed; sums/products are independent of permutation. Preserve imported complex implicit-function theorem, derivative uniqueness, root cardinality, within-filter transfer and polynomial differentiation.

## 3. Exact growth estimates
For a coefficient c∈R, induct on polynomial construction: constants use K=|c|,M=0; addition adds K and exponents M; multiplication by X_i increases exponent by 1 (|x_i|≤1+||x||). Cauchy's bound for monic p_x gives |y|≤1+Σ_{i<n}|p_i(x)|≤K0(1+||x||)^M0, with K0=1+Σ K_i and M0=Σ M_i. Retain imported Cauchy-bound theorem. For each fixed t∈C put K=1+|t|+|C|+K0, M=m+M0, B(x)=K(1+||x||)^M≥1. All of |phi(x,y)|, |t-phi(x,y)|, |t-y|≤B(x). A product of ≤k such factors has absolute value ≤B^k. Bounds used by Lean exactly:
 |∏_{y∈T_x}(t-phi(x,y))|≤K^n(1+||x||)^(Mn).
 |Σ_{y∈T_x} phi(x,y)∏_{u∈T_x\{y}}(t-u)|≤n K^(n+1)(1+||x||)^(M(n+1)).
The second is deliberately loose (erase card≤n, then one extra factor). Do not replace it by a tighter exponent as if Lean used it.

## 4. Two fiber polynomials and coefficient globalization
S_x(T)=∏_{y∈T_x}(T-phi(x,y)); roots y are distinct but phi values may repeat. Product indexed by y preserves multiplicity. S_x monic degree n; S_x-T^n has degree<n. For every fixed t, its evaluation is a differentiable function of x on U by the local labels/psi_i and finite products. Polynomial-growth hypothesis gives g_t∈R for the product; subtract t^n. Lemma exists_map_eq_of_eval: for any U and family H_x of degree<N, if for EVERY t there exists g_t∈R representing H_x(t) for ALL x∈U, choose t_i=i (0≤i<N) and put H=Σ_i C(g_i)L_i(T), where L_i is the ordinary complex Lagrange basis at those distinct nodes, mapped to R. Degree<N; specialization gives exactly H_x by interpolation. N=0 gives empty sum and the only degree<0 polynomial is zero. Thus S=T^n+H yields the integral relation.
R_x(T)=Σ_{y∈T_x}phi(x,y)∏_{u∈T_x\{y}}(T-u). It has degree<n+1 (source uses this bound, not n-1); for each fixed t its evaluation differentiable on U by local root enumeration, finite sum and products over erased labels. The second bound invokes the same polynomial-growth hypothesis, then globalization with N=n+1 produces a single r∈R[T], with r_x=R_x for all x∈U. At a root a, terms y≠a vanish since a lies in T_x\{y}; sole term is phi(x,a)∏_{u≠a}(a-u)=p'_x(a)phi(x,a), since p_x is monic nodal polynomial. This is the denominator-free fiber interpolation identity. n=0: p=1, Z empty, both conclusions vacuous with s=1,r=0. No division at repeated roots or on q=0.

## 5. Character extension (GlobalTheory.SerreSections.exists_ringHom_of_denominator)
For commutative rings P,A, ring maps alpha:P→A and e:P→C, q∈P with e(q)≠0, ker alpha⊆ker e, a chosen function r:A→P with alpha(q)b=alpha(r(b)) for every b, define chi(b)=e(r(b))/e(q). If alpha(s)=alpha(s'), then e(s)=e(s') by subtraction and kernel inclusion. For b=alpha(s), alpha(r(b))=alpha(qs), so chi(alpha(s))=e(s); this gives 0,1. Additivity uses alpha(r(a+b))=alpha(r(a)+r(b)); multiplicativity uses alpha(qr(ab))=alpha(r(a)r(b)), hence e(q)e(r(ab))=e(r(a))e(r(b)); divide by e(q)^2. This also proves independence of representative and uniqueness of any extension (corollaries, not separate conclusions in Lean). No domain hypothesis on P or A in this helper.

## 6. Global affine identity, including exceptional locus
Exact exists_mul_eq_of_polynomial_growth hypotheses: scheme Y over Spec C via p, SmoothOfRelativeDimension D p; analytic reading R:AnRead p (id C) D; affine open V with IsDomain A=Gamma(Y,V); phi complex-valued on C-points, R.HoloOn on points in V; natural n,m, u:Fin n→A, C real, |phi(y)|≤C(1+Σ_l|ev_y(u_l)|)^m on those points. Output a,b∈A, b≠0, ev_y(b)phi(y)=ev_y(a) for ALL points in V.
Smoothness gives finite type algebra; RUN18 normalization supplies j:R0→A, primitive a0, monic P, q, Bezout, eval kernel divisibility, common denominator witnesses. Let alpha:P0=R0[T]→A evaluate at a0, e_z:P0→C evaluate at (x,y). On Z, kernel inclusion follows from P|f and P_x(y)=0. Section 5 gives chi_z extending evaluation and respecting complex scalars. Via ofHom obtain point s(z)∈V. If V has no C-points choose numerator 0, denominator 1; otherwise use any point as default outside Z (no property of that default needed). For b∈A evaluation at s(z) is e_z(r_b)/q(x), analytic near each z∈Z. The analytic pullback helper uses basic open localization: on a chart W containing s(z), restrict a chart function to D(h)⊂W∩V and represent it as a/h^k, h nonzero at s(z); continuity of the point map follows from affine coordinate evaluations; pull back analytic F_a/F_h^k. Combine finitely many chart coordinates and compose the holomorphic chart representation of phi; retain imported point topology, chart glue and SCV analytic-from-differentiable theorem.
Every u_l is integral over R0 by finite map j, so its monic equation evaluated under chi_z allows the root bound section 3. Sum bounds to obtain 1+Σ|chi_z(u_l)|≤K(1+||x||)^M, K=1+Σ K_l, M=Σ M_l. Therefore |phi(s(z))|≤|C|K^m(1+||x||)^(Mm). Apply sections 1–4 (with RUN17 supplier), retaining only rational numerator t∈R0[T]. Choose global numerator A0=j(q)alpha(t), denominator B0=j(q)alpha(P'). B0≠0 by RUN18 Bezout and domain. For any point v in V:
- if ev_v(j(q))=0, both ev_v(A0) and ev_v(B0) vanish, so desired identity holds directly, WITHOUT extrapolation from dense locus or division by zero;
- otherwise define x_i=ev_v(j(X_i)), y=ev_v(a0); evaluation factors through e_z, so z∈Z, and chi_z=ev_v by section 5 and nonzero q. Affine point extensionality gives s(z)=v. Multiply finite-cover identity by q(x), yielding ev_v(B0)phi(v)=ev_v(A0).
Do not claim phi is already a regular function from this identity alone; RUN16 pole obstruction and regularity descent are separate. No assertion that B0 never vanishes.

## 7. Executed exact regression
V8 BigInt output: {"fibers":792,"rootIdentity":2772,"integralIdentity":2772,"globalLagrange":5544,"growth":11088,"character":35280,"controls":4}. The finite-cover model is split monic p with distinct integer roots, varying x and shift, phi=y²+x*seed (possibly repeated values), including n=0; evaluate nodal derivatives, integrality, scaled Lagrange identities, and pointwise loose growth bounds. Character model uses P=Z[T], A=Z×Z, alpha evaluation at two distinct integers a,b, q=b-a and representative (b-T)u+(T-a)v. Tests integer-valued maps as a special case of maps into C. Controls repeated roots, repeated phi values, failure of kernel inclusion and exceptional multiplier. These are finite regression checks only, not general analytic proof replay, actual geometry or kernel validation. Save following block to JS and run node.
~~~js
function certificate(){
const ck=(x,m)=>{if(!x)throw Error(m)},abs=x=>x<0n?-x:x, prod=a=>a.reduce((s,t)=>s*t,1n), sum=a=>a.reduce((s,t)=>s+t,0n);
const mul=(a,b)=>{let c=Array(a.length+b.length-1).fill(0n);a.forEach((x,i)=>b.forEach((y,j)=>c[i+j]+=x*y));return c};
const nodal=a=>a.reduce((p,y)=>mul(p,[-y,1n]),[1n]), ev=(a,t)=>a.reduceRight((s,c)=>s*t+c,0n), der=a=>a.slice(1).map((c,i)=>BigInt(i+1)*c);
const add=(a,b)=>Array.from({length:Math.max(a.length,b.length)},(_,i)=>(a[i]||0n)+(b[i]||0n));
let C={fibers:0,rootIdentity:0,integralIdentity:0,globalLagrange:0,growth:0,character:0,controls:0};
for(let n=0;n<=7;n++)for(let x=-5n;x<=5n;x++)for(let seed=-4n;seed<=4n;seed++){
 let Y=Array.from({length:n},(_,i)=>x+BigInt(i)*2n+seed), V=Y.map(y=>y*y+x*seed), p=nodal(Y), s=nodal(V), r=Y.reduce((a,y,i)=>add(a,nodal(Y.filter((_,j)=>j!==i)).map(c=>c*V[i])),[0n]);
 ck(p[n]===1n&&s[n]===1n&&r.length<=Math.max(1,n),"degree");C.fibers++;
 for(let i=0;i<n;i++){ck(ev(p,Y[i])===0n&&ev(der(p),Y[i])!==0n&&ev(r,Y[i])===ev(der(p),Y[i])*V[i],"root");C.rootIdentity++;ck(ev(s,V[i])===0n,"integral");C.integralIdentity++}
 for(let t=-3n;t<=3n;t++){
  let B=1n+abs(t)+sum(Y.map(abs))+sum(V.map(abs));ck(abs(ev(s,t))<=B**BigInt(n)&&abs(ev(r,t))<=BigInt(n)*B**BigInt(n+1),"growth");C.growth+=2;
  let nodes=Array.from({length:n+1},(_,i)=>BigInt(i)),den=nodes.map(i=>prod(nodes.filter(j=>j!==i).map(j=>i-j))),D=prod(den);
  let interp=sum(nodes.map((i,k)=>ev(r,i)*prod(nodes.filter(j=>j!==i).map(j=>t-j))*(D/den[k])));
  ck(interp===D*ev(r,t),"interpolation");C.globalLagrange++;
 }
}
for(let a=-4n;a<=4n;a++)for(let b=-4n;b<=4n;b++)if(a!==b){
 const q=b-a, r=(u,v,t)=>(b-t)*u+(t-a)*v;
 for(let u=-3n;u<=3n;u++)for(let v=-3n;v<=3n;v++)for(let w=-2n;w<=2n;w++)for(const t of [a,b]){
  const chi=(u,v)=>{let z=r(u,v,t);ck(z%q===0n,"integer exact");return z/q};
  ck(chi(u,v)===(t===a?u:v)&&chi(1n,1n)===1n&&chi(0n,0n)===0n&&chi(u+w,v-w)===chi(u,v)+chi(w,-w)&&chi(u*w,-v*w)===chi(u,v)*chi(w,-w),"character");C.character++;
 }
}
ck(ev(der(nodal([0n,0n])),0n)===0n,"repeated root");C.controls++;
ck(nodal([2n,2n]).length===3&&new Set([2n,2n]).size===1,"value multiplicity");C.controls++;
ck(ev(nodal([0n,2n]),1n)!==0n,"kernel not contained");C.controls++;
ck(2n*7n!==2n&&0n*2n*7n===0n*2n,"exceptional multiplier");C.controls++;
return C;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: reconcile RUN15/RUN16 with the exact regularity consumer of exists_mul_eq_of_polynomial_growth; expand the first not-yet-translated native supplier of the continuous-rational-quotient regularity theorem (including affine prime/pole witness to complex points, not merely the already reconstructed normal-domain algebra). If already covered, trace projective section algebraization and the height comparison consumer. Request authenticated role-labelled root paths for GlobalTheory.FiniteCoverGrowth.integral_and_rational_of_polynomial_growth and GlobalTheory.SerreSections.exists_mul_eq_of_polynomial_growth from dependency/kernel lanes. HANDOFF TO geometry, editor, integration, audit, kernel, dependencies, literature. RH OPEN.

<!-- END VERBATIM specialists/positivity_geometry/RUN19_FINITE_COVER_INTERPOLATION.md -->


---

<!-- BEGIN VERBATIM specialists/prime_window/RUN19_ARCHIMEDEAN_BAND_SUMS.md 07f4b0cfe20245b50b72ddcf94071792db32ac03 -->
# RUN19 — ArchimedeanSignatureMatching: both band sums and exact remaining radius condition

2026-11-25. RESULT: SOURCE-MATCHED / independent human derivation of the entire predicate under explicit sufficient and necessary residual hypotheses; exact finite regression executed. Native admission constructor and authenticated root reachability remain PARTIAL. No Lean replay or URT-specific improvement.

P = 40e56bab026552e089d7afcfeff08d2defb9c005.
H = 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (upstream head observed; compare reports 711 commits ahead of RUN18's b2f365a68500e2bde98cd60a2324263fc62fba10, zero behind).

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN18 and research state/log/protocol/continuity excerpts, CI summary #407 (01:06:19 UTC, 45520766355, physical checks only), latest 40 working-branch commit subjects and peer handoffs in dependency/kernel/integration/editor/audit/Landau/structure/math/acceleration/geometry/literature/character/Galois/theta. No duplicate found in inspected records. Linked blueprint PDF and some full peer files not reopened. GitHub search for CbLarge, ArchimedeanSignatureMatching, InBand0, AdmFam returned zero hits; not a certificate of absence. Continue RUN18's explicit alternate target, rather than invent a native incoming constructor. No physics changes.

## Source anchors
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L107–113: AuxBlock8.ArchimedeanSignatureMatching; L241–244 admitted; L256–260 AdmF.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts/Nonneg; L37–43 hG, KG, rG, N1; L56–85 Nstar, La, rho, rhoB, CbLarge, rho_le_rhoB, InBand0, InBand. L401–410 ParametersFill (last equality La = L.LaG).
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b L9–17 Scale, L27–45 L,b,a,X',b',w'',X'',A,p0,delta1.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP and GK_nonneg; L62 fills; L79 rho_le (for GK specifically).
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 (nonvacuity, L_x, L_eps), L138–142 exists_pt.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043 L38–40 cGE,cNE; L94–134 first_count_le_log; L144–146 one_le_k.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec L247–248 orbitWindowCount.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L68 SizeLa.

## 1. Generic weighted prime-power band lemma (independent elementary proof)
Let X>1, log X>=1, P0>=2, 0<=r<=1/2. Define
  B(r)={p prime : P0<=p<X, exists d in positive integers, X(1-r)<=p^d<=X(1+r)}.
This is finite. The source Finset.range ceil(X) does not impose a stronger cutoff: for natural p, p<X iff p<ceil(X), including the case of integral X. Preserve the lower cutoff inclusive, upper prime cutoff strict, both power boundaries inclusive, and d>=1.

Write Lx=log X (not the source's Scale.L). If p has witness d, then 2^d<=p^d<=X(1+r); taking logs gives
  d log 2 <= Lx+log(1+r) <= Lx+r <= 2 Lx.
Here log(1+r)=integral_1^(1+r) dt/t<=r and log 2=integral_1^2 dt/t>=1/2. Thus d<=4 Lx. There are at most floor(4 Lx) positive integers d.

For a fixed d, define u=[X(1-r)]^(1/d)>0, v=[X(1+r)]^(1/d). The allowable primes lie in [u,v] and [P0,X). If none, their sum is zero. Otherwise let m be the least and M the greatest allowable prime for this d (integers). Then
  sum_{p allowable} 1/p <= sum_{n=m}^M 1/n
    <= 1/m + integral_m^M dt/t
    = 1/m+log(M/m)
    <= 1/P0 + log(v/u)
    = 1/P0 + (1/d) log((1+r)/(1-r))
    <= 1/P0 + 4r/d.
The integral inequality follows termwise from 1/n<=integral_(n-1)^n dt/t for n>m. For the last step use integral_(1-r)^(1+r) dt/t<=2r/(1-r)<=4r. These arguments also hold at r=0 and m=M.

Because every prime in the set is <X, its log is positive and <=Lx. Multiplying the preceding bound by Lx bounds the fixed-d weighted sum. Taking the union over d and upper bounding by the sum over d is valid because every weight log(p)/p is nonnegative, even if multiple witnesses exist. Therefore
  sum_{p in B(r)} log(p)/p <= 4 (log X)^2 (1/P0+4r).
This elementary overestimate counts all integers in each interval; no distribution theorem about primes is invoked.

## 2. Exact native scale specialization
Write x=s.x, e=s.eps, k=D.R.k, X=s.X'=exp(x^(e/3)), P0=s.p0 k=k^2 x^26. Assume the source scale hypotheses x>1, 0<e<1/52, and k>=1 (native one_le_k). For x>=400 we have P0>=x^26>=2, log X=x^(e/3)>=1.
For either radius r satisfying 0<=r<=x^(-2), r<=1/2, the generic bound becomes
  4 x^(2e/3)(x^(-26)+4 x^(-2))
  <=20 x^(-2+2e/3)
  <=x^(-1).
The final step follows from 1-2e/3>1/2 and x>=400, giving x^(1-2e/3)>=sqrt(x)>=20. The threshold is sufficient, not optimal, and independent of p, d, n, k, fibre index, and even e in its native range.
Apply r=rho and r=rhoB separately; these are exactly the two source band sums. Alternatively rho<=rhoB gives inclusion of InBand0 into InBand by positive X and nonnegative radii, and hence the first sum follows from the second by nonnegative weights. No classification by Frobenius order or primality beyond the original prime filter is added.

## 3. Radius inequalities and exact remaining hypothesis
For fixed K with K.Nonneg, x>1 gives log(a)>0 from a=x exp(x^e)>1. Thus La=K.La*N1^2*log(a)>=0; Nstar>=0, k>=1, and both rho and rhoB are nonnegative.
The exact difference (not a new assumption) is
  rhoB-rho = K.rho * La/k * (K.CN log x - N1).
Therefore rho<=rhoB iff (K.rho=0 OR K.La=0 OR CbLarge K s), since N1>=1 by orbitWindowCount, and log(a)>0. The zero factors are necessary cases: CbLarge is not equivalent to the ordering without their exclusion. The source theorem rho_le_rhoB uses CbLarge as sufficient, not necessary. For a fixed positive K.La and K.rho>0 the ordering is exactly CbLarge. Merely K.Nonneg does not force it; CN=0 and N1>=1 violate ordering if both factors positive.
If additionally rhoB<=x^(-2), then all four predicate components of ArchimedeanSignatureMatching are equivalent (for x>=400) to the single ordering rho<=rhoB: forward by projection, backward by the preceding lemma twice and rho<=rhoB<=x^(-2).

## 4. Family quantifier scope and relation to RUN18
Here specialize K=Fm.GK, not arbitrary K, because FamP.rho_le and GK_nonneg concern that fixed field. Let Eventual(R) mean exists T>1, forall x>=T, forall i:Fm.Ix x, R at the instance. Use x1+1 to ensure L_x, L_eps, and rho_le. The pointwise equivalence yields
  Eventual(ArchimedeanSignatureMatching) iff
  (GK.rho=0 OR GK.La=0 OR Eventual(CbLarge GK)).
To justify the disjunction under eventual quantifiers, GK.rho and GK.La are constants fixed before x and i; split their zero cases first. No swapping of existential thresholds with individual primes or fibres. For any threshold T on one side, max(T,400,x1+1) works on the other, with harmless adjustment to ensure T>1. If using RUN18's independent family admission reduction where GK.La>0 is required, the remaining condition is GK.rho=0 OR Eventual(CbLarge GK). This is an equivalent residual obligation, not unconditional admission.

A sufficient fixed condition is GK.CN>=St.cNE(e): first_count_le_log gives N1<=cNE(e) log x for x>=exp(1), and log x>0. Conversely if Eventual(CbLarge) holds, the native orbitWindowCount gives N1>=((5+8e)/log 2)log x+1, so a genuine instance above the threshold implies GK.CN>(5+8e)/log 2. Nonvacuity uses FamCore.exists_pt; no claim that all fibres are nonempty. The latter is a necessary condition, not shown sufficient. In particular do not select a new CN to force this on an already fixed GK. For general K not equal to GK one needs its own rhoB bound; no inference from FamP.rho_le for arbitrary K.

A promising separate native positivity route is FamP.fills -> ParametersFill last equality La=LaG -> SizeLa's positive lower bound, once a genuine place w is supplied at a genuine large family instance. This is a source-level candidate only; authenticate the nonempty place supplier and actual caller before closing that obligation.

## 5. Upstream comparison
At H, SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L102–108 identical to P L107–113 (exact string comparison). IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 H L96–123 identical to P L58–85 (exact comparison). H ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16 L78 rho_le has same displayed field. H DataParams₂ blob 3c27f632cf4de6f41fc4e4cf077510613afe8f9a L33–49 scale definitions displayed unchanged. H StarFam blob 8349438a297e547750c0465daaa269730773bbca L91–94,147–188 (migrated first_count_le_log) and 345–347,388–430 (additional version); no namespace conflation asserted. H admitted L233–236 still omits adm2/adm3 compared to P; Conclusion₂ L238–239 also differs. No claim of whole upstream equivalence or kernel reachability.

## 6. Executed independent finite regression (Node/V8)
The log interval uses atanh series log(a/b)=2 sum_{i>=0} ((a-b)/(a+b))^(2i+1)/(2i+1), after reducing the ratio to [1,2]. This follows by integrating 2/(1-t^2) from 0 to (a-b)/(a+b). At M=24 the remaining tail, scaled by Q=10^18, is at most 2Q*(1/3)^49/[49*(1-1/9)]<1. Each of the M floor terms loses <1, so upper bound is lower+M+1, then add exact integer multiples of the interval for log 2. All band membership and tested inequalities use BigInt; small primality loop uses exact small integer remainder and sqrt bound on n<=256. These are finite arithmetic regressions, not proofs of analytic quantifiers or real native D7 instances.

```js
const Q=10n**18n,M=24;
function unitLog(a,b){const u=a-b,v=a+b;let s=0n;for(let i=0;i<M;i++){const j=BigInt(2*i+1);s+=2n*Q*u**j/(j*v**j)}return [s,s+BigInt(M)+1n]}
const l2=unitLog(2n,1n);function logBounds(n){let a=BigInt(n),b=1n,k=0n;while(a>=2n*b){b*=2n;k++}let [lo,hi]=unitLog(a,b);return [lo+k*l2[0],hi+k*l2[1]]}
const prime=n=>n>=2&&Array.from({length:Math.floor(Math.sqrt(n))-1},(_,i)=>i+2).every(d=>n%d);
const counts={perExponent:0,union:0,nesting:0,sign:0,negative:0};const ck=(b,k)=>{if(!b)throw Error(k);counts[k]++};
const add=(a,b,p)=>[a*BigInt(p)+b,b*BigInt(p)];
const logs=new Map(Array.from({length:257},(_,i)=>[i,i>=1?logBounds(i):[0n,0n]]));
const inBand=(p,d,X,p0,rn,rd)=>d>=1n&&p>=p0&&p<X&&X*(rd-rn)<=p**d*rd&&p**d*rd<=X*(rd+rn);
for(const X of [4,5,8,9,16,25,27,32,49,64,81,100,125,128,169,243,256])for(const p0 of [2,3,4,5,7,11,17,31,63])for(const [rn,rd] of [[0n,1n],[1n,100n],[1n,20n],[1n,10n],[1n,4n],[1n,2n]]){
 const x=BigInt(X),pmin=BigInt(p0),L=logs.get(X)[1];let union=new Set,half=new Set,ds=0n;
 for(let d=1n;2n**d*rd<=x*(rd+rn);d++){
  ds++;let a=0n,b=1n,weight=0n;
  for(let p=p0;p<X;p++)if(prime(p)){
    if(inBand(BigInt(p),d,x,pmin,rn,rd)){[a,b]=add(a,b,p);weight+=(logs.get(p)[1]+BigInt(p)-1n)/BigInt(p);union.add(p)}
    if(inBand(BigInt(p),d,x,pmin,rn,2n*rd))half.add(p);
  }
  const bn=rd*d+4n*rn*pmin,bd=pmin*rd*d;
  ck(a*bd<=b*bn,"perExponent");
  ck(weight*bd<=L*bn,"perExponent");
 }
 let a=0n,b=1n;for(const p of union)[a,b]=add(a,b,p);
 ck(a*pmin*rd<=b*ds*(rd+4n*rn*pmin),"union");
 ck([...half].every(p=>union.has(p)),"nesting");
}
for(let n=1n;n<=8n;n++)for(let k=1n;k<=8n;k++)for(let c=0n;c<=4n;c++)for(let r=0n;r<=4n;r++)for(let B=0n;B<=8n;B++){
 const A=3n*n*c;
 const rho=A+r*n*c,rhoB=A+r*B*c;
 ck((rho<=rhoB)===(r===0n||c===0n||n<=B),"sign");
}
ck(3n*2n+2n>3n*2n,"negative");
ck(inBand(2n,3n,8n,2n,0n,1n)&&!inBand(2n,3n,8n,3n,0n,1n),"negative");
ck(!inBand(5n,1n,5n,2n,0n,1n),"negative");
ck(inBand(3n,2n,12n,2n,1n,4n)&&!inBand(3n,2n,12n,2n,24n,100n),"negative");
console.log(counts);
```
Actual execution: {"perExponent":9396,"union":918,"nesting":918,"sign":14400,"negative":4}. Total 25,632 positive regression assertions plus four guard/negative witnesses. Sign test cancels common positive denominator k, so repetitions over k are not distinct sign cases. Weighted check compares outward log upper sum against outward log X upper bound, and is not a strict interval certificate of comparison to true log X; the exact reciprocal checks and analytic inequality are separate. No CI or Lean replay claimed.

## RESUME HERE
Authenticate nonempty place w for a genuine large FamP instance and apply fills/ParametersFill/SizeLa to GK.La; then trace actual supplier of Eventual(CbLarge GK), or the first uncovered residual admission predicate if no native caller is authenticated. Request independent audit of integral comparisons, strict cutoff, zero factors, K=GK restriction, necessary CN lower bound and threshold quantifiers. Request authenticated role-labelled reachability of Pf.AdmFam/AdmF, ArchimedeanSignatureMatching and CbLarge; do not infer reachability from imports. Preserve all original obligations in integrated chapter.
HANDOFF TO audit, dependency, kernel, integration, editor, prime_window. Project OPEN.

<!-- END VERBATIM specialists/prime_window/RUN19_ARCHIMEDEAN_BAND_SUMS.md -->


---

<!-- BEGIN VERBATIM specialists/theta_lifts/RUN19_LOCAL_LOWERING_SINGLE_TEST_AND_SIMPLE_ZERO.md da8bb009aad60ff7d16fcf86ebf17c26e1882847 -->
# Theta RUN19 — local lowering operator represented by one singular test

2026-11-25. RESULT: SOURCE-MATCHED / conditional human reconstruction of the actual LocTau assembler, including its single-test witness and nonzero regularized scalar; source bodies of lt1, lt2, lt3, eRed and the main Crux0 contradiction inspected. Deeper suppliers remain OPEN. Not a Lean replay or authenticated root proof path.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI #408 (01:25:36 UTC, physics checks only), RUN18 and recent commit patches/handoffs for all other lanes (editor patch lacked handoff). No duplicate identified. Acceleration RUN19 now reports manifest ID 8996470 for PositivityTheory.Rg.Sw.HSt.holLeadB; membership is not an authenticated root path. Dependency worker is processing 151 targets; no duplicate raw extraction. Blueprint not reopened this run. No physical gate, queue, or workflow modifications.

Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Upstream H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (2026-11-25 01:15:19 UTC, merge PR #1739). H LocTau now contains the three lt bodies and assembler call; H Crux contains relocated vacuum_nonvanishing_of_facts (old standalone file 404). H DetSecondCayleyBlockNe contains asmLT. These are positive relocation checks, not cross-revision proof equivalence.

All short filenames below refer to src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/ at P, unless marked H.

## 1. Native chain and complete statement
LocTau:9 is literally locTau := asmLT lt1 lt2 lt3 crux. MultiplicityOneTestOperatorsAlt:45 defines AsmLT as LoweringDerivativeVacuum → MultiplicityOneTestOperators → SingularTestsKillVacuum → Crux → LocTau. DetSecondCayleyBlockNe:154–209 proves that implication, 215 exports it. HolLeadB uses locTau as reconstructed in RUN18.

For every natural n,m with m<n, every integer e, compact topological group Kg with measurable/Borel structure, Haar measure μ and continuous group homomorphism ι:Kg→M₂(n) whose image equals InK (both directions of membership), and every complex n×n Q, LocTau asks for natural N, continuous weights ρ_l:Kg→C, singular tests ψ_l on real n×n coordinate space, a_l,b_l∈InG and entire D,M_l with D(0)≠0, such that for every complex z and x∈InG
    D(z) rC(lowQ Q)(fz(m,e,z))(x)
       = Σ_{l<N} M_l(z) tOp(μ,ι,ρ_l,ψ_l,a_l,b_l,fz(m,e,z),x).
No normalized Haar probability is required here; no nonzero Q or m>0 required. tOp is the outer Haar integral of ρ_l(k) times the inner integral of fz(x ι(k) a_l nU(herm t) b_l) ψ_l(t). The original IsSingTest predicate is retained, not replaced by compact support alone. Its continuity and compact support projections are used at assembler L159. This is a statement on the whole complex plane, not only on a punctured neighborhood.

Write E_Q(z,x)=fz(m,e,z,x) tr(Om(x) Q), Om=ub2 (ub1)^{-1}. The compact weight ρ_Y(k)=conjugate[fz(m,e,0,ιk) tr(u2(ιk)^{-1} Y u1(ιk))]. The four inputs are precisely:
- LT1: for all n,m,e,z,Q,x∈InG, rC(lowQ Q)fz=z E_Q.
- LT2: for every n,m,e, same Kg,μ,ι,image hypotheses, continuous compactly supported ψ, a,b∈InG, there exists entire c with tOp(ρ_Y,ψ,a,b,fz)(x)=E_{c(z)Y†}(z,x) for all Y,z,x∈InG.
- LT3: under m<n and same group hypotheses, every continuous ρ, singular ψ, a,b,x∈InG gives tOp(ρ,ψ,a,b,fz at z=0)(x)=0.
- Crux: under m<n and same group hypotheses there exist P, singular ψ, a,b,x₀∈InG with derivative at zero of tOp(ρ_P,ψ,a,b,fz)(x₀) nonzero.
All four are native proof inputs with actual suppliers identified below; the proof does not assume nonzero c(0).

## 2. One test suffices: actual asmLT witness
Choose the Crux witnesses P,ψ,a,b,x₀, then LT2 supplies c for this fixed ψ,a,b, valid for every Y. LT3 at Y=I and x=I gives c(0) E_I(0,I)=0. Since fz(z,I)=1 and Om(I)=-I (L141–148), E_I(0,I)=-n. The strict inequality m<n implies n>0; hence c(0)=0.

At the Crux witness x₀, set β=det u1(x₀) det ub1(x₀), K₀=det(x₀)^e det(u1(x₀))^{-m} tr(Om(x₀)P†). LT2 gives T_P(z)=c(z) K₀ β^{-z}. If c'(0)=0 then the derivative of T_P at zero vanishes by product differentiation. The source also retains a β=0 branch: c(0)=0 and 0^(-z)=0 for z≠0 make the product identically zero using Lean complex-power convention. This contradicts Crux in either case. Alternatively LT1's independent slit-plane lemma proves β≠0 on InG, but the original branch is retained in the record.

Define the entire divided difference
    D(z) = (c(z)-c(0))/z for z≠0, D(0)=c'(0).
Holomorphicity at zero is the removable divided-difference lemma Complex.differentiableOn_dslope. Thus D(0)≠0 and z D(z)=c(z) for every z. This D is a scalar divided difference, not a matrix determinant; its nonzero value is proved through Crux. The actual finite witness has N=1, ρ_0=ρ_{Q†}, ψ_0=ψ, a_0=a, b_0=b, M_0(z)=1. LT2 and E-linearity yield
    tOp(ρ_{Q†},ψ,a,b,fz)(x)=E_{c(z)Q}(z,x)=c(z) E_Q(z,x)
       =D(z) rC(lowQ Q)fz(x).
This remains valid for z=0 and Q=0. No division by c(z), E_Q, K₀ or any possibly vanishing Fourier coefficient. The only quotient by z is extended analytically. Weight continuity uses detSecondCayleyBlockNe and continuous_rhoP (L83–135): if nonreal t and a row vector annihilates t C+D (lower blocks of x), group relations CD†=DC† and CB†−DA†=−I imply (t−conj t)||vC||²=0, hence vC=vD=0, then v=0. Both u1 and u2 are invertible. Compact weights are continuous from inverse, determinant, integer powers and trace.

## 3. Actual lt1, lt2, lt3 suppliers
LoweringDerivativeVacuum:68–114, 121: rC is the complex derivative on the indicated group direction (rC_eq). On x+s x Nq(Q), det x and first Cayley block u1 are unchanged, while ub1 becomes ub1−s Q ub2. Factor the latter using its invertible value at zero. The derivative at zero of det(I+s A) is tr A. Therefore the logarithmic derivative of det(u1)det(ub1) along this curve is −tr(Om Q). Raising to power −z gives +z tr(Om Q); multiplied by fz gives LT1. The complex power derivative is valid because det u1 det ub1=|det u1|²>0 (L20–42), so the base lies in the slit plane. This is not a formal differentiation across a branch cut.

LamTrace:24–37 shows that conjugation invariance of the conjugate-linear matrix functional abelian₂ forces it to be proportional to conjugate trace (inv_trace applied to its complex-linear conjugate); coefficient is abelian₂(z,I)/n. Lam_diff:39–106 proves entire dependence by continuity on the compact group times a closed spectral ball, Cauchy derivative bounds on a smaller ball, and dominated differentiation of the Haar integral. LT2:110–136 chooses c(z)=−abelian₂(z,I)/n. Iwasawa x=pk plus the compact block laws convert the conjugate trace to tr(u2(k)† u1(k) Y†); the sign is from Om on the compact group. LT2 in isolation has no m<n hypothesis; the theorem's division is Lean field division (zero-dimensional case not needed by assembler). Imported Lam_inv, inv_trace, tOp_formula, fz_up, Om_up, Iwasawa and differentiation suppliers remain traceable obligations, not proved solely by this summary.

SingularTestsKillVacuum:11–23 uses closure of InG under products and L3.vanish_all(hmn,e,...,ψ,hψ) for the inner integral at each compact k; the outer integral is identically zero. L3.vanish_all, reached through EventuallyUnit, is a separate next supplier; no claim that singular test alone annihilates arbitrary sections.

## 4. Crux nonvanishing: actual contradiction route and exact integer coefficient
Crux:11 = eRed (vacuum_nonvanishing_of_facts fdProps djFd kSplit sphU fzHol). FdProps:18–39,44–60 gives Crux0 at e=0 and the actual named five input types (smooth Fd and spectral integral derivative interchange; double determinant derivative DjFd; compact matrix-entry KSplit; two-direction compact averaging differentiation SphU; joint analyticity FzHol in open DomZ containing GSet). FdInv at L41–42 is a True-valued definition; it is NOT a premise of this proof and not evidence for a new theorem. No transitive placeholder-free claim.

VacuumNonvanishingOfFacts:19–275 assumes negation of Crux0, lets j=n−m≥1, and defines Φ_Y(x)=∫_K Fd(m,ι(k)x)ρ_Y(k)dμ, Fd=∂_z fz|₀. StepA (L44) converts absence of singular tests into determinant-differential vanishing via CrxMa.stepA_Z. StepB (L47) uses topComp and Fd_kpart to obtain vanishing of the two complementary-block determinant derivatives of Φ. DjFd expresses those derivatives using
    p(z)=Π_{i=0}^{j−1}(i−z) Π_{i=0}^{m−1}(i−m−z).
The first product contains precisely one zero factor at zero; all others are nonzero. In closed form
    p'(0)=(-1)^{m+1}(j−1)! m! ≠0.
This is exactly the source's deriv_prod_range_sub_mul_prod_ne_zero (L27–55), with factorial shorthand, including m=0 and j=1 empty products. Strict m<n is indispensable to this simple-zero argument (at m=n the first product is empty and p(0)≠0). This polynomial is NOT itself the scalar D from section 2; it enables the Crux proof that D(0)≠0.

StepC (L59) cancels p'(0) using Cx3.stepC to conclude the weighted hF integral vanishes for every Y and group g. StepD (L62) extends vanishing to all iterated derivatives through Cx3.stepD. StepE (L66–133) transfers one selected direction WD(0,E_ab) by rit_transpose to fV, whose derivative gives (m−n) fV times the corresponding entry of u1^{-1}u2. KSplit expresses the entry weight as a finite sum of right-translated ρ_I; right Haar invariance reduces each summand to StepD at translated group g. Symmetry of iterated derivatives allows the selected direction to occur at any position. StepF (L150) expands the two determinant derivatives as permutation sums of these vanishing integrals, using the pairwise zero-products of complementary directions and integrability from compactness. The selected direction exists since j≥1. transpose_detD then transfers both determinant derivatives to fV (with nonzero sign). The dual Cayley formula dpDual yields a nonzero product coefficient times the integral of |minor_A(wM)|² |minor_B(wM)|². All coefficient factors m−n+i for i<j and −n+i for i<n−j=m are nonzero. StepG (L240) thus forces this nonnegative integral to be zero, contrary to pos_int (L273), giving Crux0. The local topComp/stepA, stepC, stepD, integration-by-parts transpose, dpDual and pos_int proofs still need expansion; this is a source-matched proof skeleton of their actual consumer, not a proof of all those suppliers.

DetUnitOfInK:54–69 then extends e=0 to arbitrary integer e: det nU=1, compact det has modulus one, so the twisted weight cancels the compact determinant factor. T_e(z)=[det(x)^e det(a)^e det(b)^e] T_0(z); the constant is nonzero since all three group matrices are invertible. Its multiplication preserves nonzero derivative. No new signature, genericity, or m>0 restrictions.

## 5. Evidence and reproducibility
Executed in connector JS: 15/15 blob identifiers matched (12 P, 3 H), 70/70 literal source anchors located; 2080/2080 exact BigInt cases 1≤n≤64, 0≤m<n verified p(0)=0 and p'(0)=(-1)^(m+1)(n−m−1)!m! nonzero by independent coefficient propagation. This tests the exact native determinant polynomial, not the whole analytic proof. The following standalone Python reproduces the integer test and blob/representative-line checks against an upstream clone (not run in Python here); no network is needed once revisions exist.
```python
import subprocess, math
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061"
base="src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/"
rows=[
(P,"LocTau","bd198ef5120fc6f5b2381c5b18b9cf62c7bed54f",9,"asmLT lt1 lt2 lt3 crux"),
(P,"LocTauAlt","c68017f4832d14fb672e9e27fdd3a9eab3e7436a",39,"D 0 ≠ 0"),
(P,"MultiplicityOneTestOperatorsAlt","20397fb5abbb0c9c8cb7bae6bd5a7a5a8c4c72f7",45,"def AsmLT"),
(P,"DetSecondCayleyBlockNe","37ae5c4a02ff337f0f68e7a3ce172d5b374174bc",195,"dslope c 0"),
(P,"LoweringDerivativeVacuum","a4daefcdd496f743e5d3266434176b56b80f7f85",68,"theorem lt1"),
(P,"LamTrace","f671dd29a2dbef15376ee0a8cdd87f9f3dd80d7b",110,"theorem lt2"),
(P,"SingularTestsKillVacuum","b06d4dc436e74ee31390b189c3c965312fb51593",21,"L3.vanish_all hmn"),
(P,"Crux","1971ec2b5015abe0a1137f83eb23e5bdae2d0817",11,"eRed (vacuum_nonvanishing_of_facts"),
(P,"FdProps","1bbff855867c08b480b03ff6e62cfcaac88f0479",18,"def Crux0"),
(P,"VacuumNonvanishingOfFacts","59b9d0e0060f8ea3e9387803aef00f5bae6d5eef",273,"have hpos := pos_int"),
(P,"DerivProdRangeSubMulProdNeZero","3fab00059591d277cf201d5bf93e2cd2c325339b",27,"theorem deriv_prod_range_sub_mul_prod_ne_zero"),
(P,"DetUnitOfInK","bd939660b790ee69923375029f57562338b8642e",54,"theorem eRed"),
(H,"DetSecondCayleyBlockNe","1e8b57fa553466975850a43111de7273c6d33102",114,"theorem asmLT"),
(H,"LocTau","918a2e1a9b30cf9c2f00b7a2d3deb09e7f11e860",1172,"asmLT lt1 lt2 lt3 crux"),
(H,"Crux","7ee5755446d0b5dc5e24987162d591acdc8415f0",940,"theorem vacuum_nonvanishing_of_facts")]
for rev,name,sha,line,needle in rows:
    raw=subprocess.check_output(["git","show",rev+":"+base+name+".lean"])
    actual=subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()
    assert actual==sha,(name,actual,sha)
    assert needle in raw.decode().splitlines()[line-1],(name,line)
count=0
for n in range(1,65):
    for m in range(n):
        c,d=1,0
        for a in list(range(n-m))+list(range(-m,0)):
            c,d=c*a,d*a-c
        assert c==0 and d==(-1)**(m+1)*math.factorial(n-m-1)*math.factorial(m)!=0
        count+=1
print(len(rows),"blobs and representative anchors;",count,"exact polynomial cases")
```
Conventional ingredients: determinant differentiation, compact Haar invariance, multiplicity-one trace argument, analytic removable divided difference, positivity. No new published result attribution established for the local Crux nonvanishing. No additional assumptions imposed on the native assembly. No kernel validation, full RH proof translation or URT acceleration claim. Root linkage remains subject to role-labelled witness extraction.

## RESUME HERE
Expand L3.vanish_all through EventuallyUnit and its exact rank/Fourier support proof (LT3 supplies c(0)=0); then CrxMa.stepA_Z and pos_int in the Crux0 chain, retaining all five named inputs. Request authenticated role-labelled paths to PositivityTheory.Rg.Sw.HSt.locTau, asmLT, lt1, lt2, lt3, crux, vacuum_nonvanishing_of_facts and holLeadB (manifest ID 8996470). H relocation confirmed for Crux, LocTau, asmLT; do not repin the baseline. CR.crLem_of and KSing.lamSing_of remain in queue. HANDOFF TO theta, dependencies, kernel, integration, audit, editor, literature. Project OPEN.

<!-- END VERBATIM specialists/theta_lifts/RUN19_LOCAL_LOWERING_SINGLE_TEST_AND_SIMPLE_ZERO.md -->


---

<!-- BEGIN VERBATIM specialists/positivity_geometry/RUN20_DENSE_NONVANISHING_FINITE_MAP_OPENNESS.md 41afb0c98e6e5c5260a166d33b21a39f5c24ff40 -->
# Geometry RUN20 — Euclidean density of the nonvanishing locus, finite-map openness and the regularity consumer
2026-11-25. SOURCE-MATCHED local reconstruction; exact finite regression executed in V8. RH OPEN. This extends RUN15, RUN16 and RUN19 by proving the previously unexpanded density supplier, not repeating the normal-domain pole lemma.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI summary #409 (01:45:12 UTC; physical checks only), RUN19, RUN15 and RUN16. Inspected latest 25 commit titles and all 14 peer latest commit patch handoffs (some have only headings/no explicit RESUME lines). No duplicate identified. Linked external blueprint not reopened. No physical changes. Source repository leanprover-community/riemann-hypothesis; P=40e56bab026552e089d7afcfeff08d2defb9c005; H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (merge #1739, 2026-11-25 01:15:19 UTC), advanced since RUN19.
Base path src/Development/AbelianVarietyTheory/Proofs/. GitHub-returned blob IDs:
- HomogeneousIdeals/ExistsNeZeroIsStandardSmoothOfRelativeDimension.lean P 8272e270db53df9168851be7f7b8da698651807d; H 42e61eb3acd06bce7f3ff9609358a5a1344f148a. P L150–162 volume_coords_image_zeroSet; L180–192 isOpenMap_coords, dense_compl_of_volume_coords_image; L193–204 dense_nonvanishing and interior_zeroSet_eq_empty. H L424,437,441,450 respectively. Four declarations compared; three equal after whitespace normalization, isOpenMap_coords changes explicit homeomorphism arguments.
- HomogeneousIdeals/ExistsApplyEqZeroAndEqOne.lean P ac0ae26397e0083ee3c61fa6d1bd0cbac52acb56. H clumped into preceding H file (exists_comap_eq_of_isIntegral L145, finite_fiber_comap L175, norm_le_of_isRoot_monic L187, isProperMap_comap L197, exists_apply_eq_zero_and_eq_one L232, isOpenMap_comap L251).
- HomogeneousIdeals/PowCardLeNormProd.lean P 5c120060a80beb3a3eefcbea07ee2a1de7358194. H old path returns 404; declarations relocated in H clump L105 and L118.
- DivisorProofs/ExistsEqOfContinuousQuotientAlgHom.lean P d438130b7af70dec4f2acef547025e2f90103eb3; H b2a160e1cf97b019da4155de37bf2bc47746bfb1. Three declarations at P L15,36,53 and H L58,79,96 equal after whitespace normalization.
- ToricGeometry/EqZeroOfForallAlgHomComplex.lean P 292d8cb01972525a6c0040b1449efb5090dcca4f; H d3e22e310959656f123ce88d9765b77e8d5a592a. eq_zero_of_forall_algHom_complex P L11/H L59 unchanged after normalization.
8 principal declaration blocks compared (7 identical); not a semantic equivalence proof. Hashes are connector-reported, not independently recomputed. Permalink prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by base path and exact filename above.

## 1. Density theorem: exact scope and actual proof
GlobalTheory.AffinePoints.dense_nonvanishing: A commutative C-algebra domain of finite type, f in A nonzero. Then {p:A→_C C | p(f)≠0} is dense in the topology of complex algebra homomorphisms (pointwise evaluation), not merely the Zariski topology. No smoothness, normality of A, projectivity or étaleness needed. Domain is indispensable in this general statement: A=C×C, f=(1,0), second isolated component has identically zero evaluation.
Choose Noether normalization g:S=C[X_1,...,X_d]→A injective finite by exists_finite_inj_algHom_of_fg. Let pi(p)=(p(g(X_i))) in C^d. Finite implies algebraic. For nonzero f, source volume_coords_image_zeroSet uses the more general hypothesis that A is algebraic over S via g (not finite as a separate premise), and the algebraic-element lemma exists_nonzero_dvd to get r in S nonzero, c in A with g(r)=f c. Intuitively choose an algebraic relation for f with nonzero lowest coefficient, cancel the lowest power of f using domain, and isolate its constant term. In the finite integral case use a monic relation, and g injective guarantees a nonzero constant survives. If p(f)=0 then r(pi(p))=p(g(r))=p(f)p(c)=0. Thus pi(Z(f))⊆Z(r). The source calls ReciprocityTheory.MultiplicativeHeights.ae_eval_ne_zero_of_ne_zero_fin for the zero Lebesgue/Haar volume of Z(r); retain this supplier as a named obligation, not an axiom. It includes d=0: nonzero constant has empty zero set. Therefore volume(pi(Z(f)))=0. This argument does NOT claim pi^{-1}(pi(Z(f)))=Z(f); e.g. t↦t², f=t−1, t=−1 is in the preimage but not the zero set.
Volume has full support on C^d, so the complement of pi(Z(f)) is dense. Crucial extra premise: pi is an OPEN map, not just continuous, proper, or surjective. The preimage of a dense set by an open map is dense: every nonempty open U has a nonempty open pi(U) meeting that dense set. Its preimage is contained in the complement of Z(f). Hence the desired nonvanishing set is dense, and the zero set has empty interior. This explains why Zariski density alone is not enough to justify the continuity cancellation in RUN16.

## 2. Native supplier of finite-map openness (not assumed)
isOpenMap_comap: A,B commutative C-algebras, BOTH domains, A integrally closed, phi:A→_C B finite and injective. On complex homomorphism spaces pi(q)=q∘phi is open. For the application S polynomial ring is integrally closed; target A of normalization need not be normal. Preserve normality of the BASE. Finite fibers follow because a fiber injects into A-algebra maps B→C (with C given its A-structure by p), finite by module-finiteness. Fix open U and p∈U, base point x=pi(p). Let F=pi^{-1}(x) minus U, finite. For each q∈F distinct from p choose b_q with p(b_q)≠q(b_q) and e_q=(b_q−q(b_q))/(p(b_q)−q(b_q)); p(e_q)=1,q(e_q)=0. Put a=1−product_{q∈F} e_q. Then p(a)=0 and q(a)=1 on F. Empty F gives a=0. This is exists_apply_eq_zero_and_eq_one, valid for any base field K, finite S of homomorphisms with p outside S, without finite-type assumptions.
Properness supplier isProperMap_comap assumes only integrality of phi. Given an ultrafilter of points of B whose base images tend to x, for each b∈B choose monic equation h over A. The specialized complex polynomial has root q(b), and Cauchy's bound gives |q(b)|≤1+Σ_{i<deg h}|pi(q)(h_i)|. RHS is continuous in base point, eventually less than its value at x plus 1. Thus each coordinate ultrafilter converges in a compact closed disk. Choose simultaneous coordinate limits u_b; they define a C-algebra homomorphism since the image of the homomorphism space in the product C^B is closed (ring equations and scalar equations), and convergence is pointwise. This is exactly the ultrafilter properness criterion, retaining closed embedding and compact disk suppliers. Proper maps here are closed.
Let m(T)=minpoly_A(a), monic of degree n. Define closed K=pi(U^c∩{|q(a)|≤1/2}) by properness, and open W={r: |r(m_0)|<(1/2)^n}. The point x lies outside K by the separator, and in W since evaluating m(a)=0 at p, p(a)=0 implies x(m_0)=0. Strict threshold is crucial. For each r∈W, specialized monic m_r has a root t with |t|<1/2: if all roots had modulus at least 1/2, the product of root moduli, with multiplicity, would give |r(m_0)|≥(1/2)^n, contradicting W. This is the exact RootNormBound.pow_card_le_norm_prod and exists_root_norm_lt argument, including epsilon=0 and degree-zero cases where the strict hypothesis is impossible. No arbitrary continuous choice of a root required.
Now chi:A[T]→B sends T to a. B is integral over its image because B is integral over A. Evaluation at r,t is an algebra map A[T]→C; its kernel contains ker chi because integrally closed A and integrality of a imply that minpoly divides every relation vanishing at a (source minpoly.isIntegrallyClosed_dvd). The source exists_comap_eq_of_isIntegral lifts this point to q:B→C: choose maximal ideal in B over kernel of evaluation via integral lying-over, its residue field is integral over algebraically closed C hence equals C. This helper permits a noninjective original map, with kernel inclusion explicitly assumed. The resulting q has pi(q)=r, q(a)=t. If r also outside K, q cannot lie outside U because |t|<1/2. Therefore K^c∩W is an open neighborhood of x contained in pi(U). This proves openness and hence the density theorem. Retain finite-fiber finiteness, integral lying-over, integrally-closed minimal-polynomial divisibility, Cauchy bound and ultrafilter properness as imported suppliers. The original source uses no analytic inverse branch or unramified assumption, so branch points are covered.

## 3. Complex point detection and exact regularity assembly
eq_zero_of_forall_algHom_complex assumes reduced finite-type commutative C-algebra A (not necessarily domain). If every C-algebra homomorphism kills a, then a=0. A is Jacobson, zero ideal radical, intersection of all maximal ideals equals zero. Each residue field A/m is finite over C by finite type and Jacobson, hence C by algebraic closedness. The quotient followed by this inverse C-algebra isomorphism kills a, so a∈m for every m. Reducedness cannot be dropped: nonzero epsilon in C[epsilon]/(epsilon²) maps to zero in any field.
Combine with exact RUN16 theorem exists_eq_of_continuous_quotient_algHom (finite-type integrally closed domain A; continuous psi, b≠0, e(b)psi(e)=e(a) all e). For any relation b s=a r, evaluating gives e(b)(e(s)−psi(e)e(r))=0. Cancel on dense set e(b)≠0 by section 1, then continuous equality extends to all points. If b divides a choose c with a=bc, take r=1. Otherwise RUN16's prime witness b s=a r, r∈p,s∉p. Apply preceding detection to A/p, a reduced finite-type algebra, find evaluation nonzero on s and zero on r. Contradiction. Thus continuous rational quotient is regular. The affine scheme wrapper first proves normal stalks imply integrally closed section ring for an affine open with domain section ring, by identifying localization at each maximal ideal with stalk and using local-global normality. Smoothness over C provides normal stalks and finite type; the affine point map from homomorphisms to complex scheme points is continuous by coordinate evaluation and inverse on the point subset by extensionality. Hence psi is continuous and the ring theorem transports to the required pointwise equality. No global properness hypothesis on Y belongs to this local wrapper. RUN19's rational relation therefore has a regular representative even at zeros of its denominator; equality on overlaps and projective gluing were assembled in RUN15. No new claim of global RH closure.

## 4. Reproducible finite regression
Executed V8 BigInt output: {"rootProducts":15625,"smallRoot":21540,"separator":2304,"finiteMapDivisibility":3825,"zeroImage":153,"controls":4}. Save the following JS block and run node. The exact arithmetic checks exercise Gaussian-integer squared norms (epsilon squared is the integer e), strict product implication with multiplicities, rational separator after clearing denominators for all subsets of 8 possible other points, finite-map base-multiple identity t^n−a^n=(t−a)sum t^{n−1−k}a^k and zero-image containment. Controls demonstrate strict threshold, non-equality of image preimage, non-domain zero divisor and dual-number nilpotence. These are finite regression checks, not proof of analytic topology, kernel replay, or root authentication.
~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)}, mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]], n2=a=>a[0]*a[0]+a[1]*a[1],prod=a=>a.reduce((s,t)=>s*t,1n);
 const C={rootProducts:0,smallRoot:0,separator:0,finiteMapDivisibility:0,zeroImage:0,controls:0};
 let roots=[];for(let a=-2n;a<=2n;a++)for(let b=-2n;b<=2n;b++)roots.push([a,b]);
 for(const a of roots)for(const b of roots)for(const c of roots){
   let list=[a,b,c], ns=list.map(n2), P=n2(list.reduce(mul,[1n,0n]));
   ck(P===prod(ns),"norm multiplicativity");C.rootProducts++;
   for(let e=0n;e<=4n;e++){
      if(ns.every(n=>n>=e))ck(P>=e**3n,"product lower bound");
      if(P<e**3n){ck(ns.some(n=>n<e),"small root");C.smallRoot++}
   }
 }
 for(let p=-4n;p<=4n;p++){
  const other=Array.from({length:9},(_,i)=>BigInt(i)-4n).filter(q=>q!==p);
  for(let mask=0;mask<1<<other.length;mask++){
    let S=other.filter((_,i)=>mask&(1<<i)),D=prod(S.map(q=>p-q));
    const scaledA=t=>D-prod(S.map(q=>t-q));
    ck(D!==0n&&scaledA(p)===0n&&S.every(q=>scaledA(q)===D),"separator");C.separator++;
  }
 }
 for(let n=1n;n<=9n;n++)for(let a=-8n;a<=8n;a++)for(let t=-12n;t<=12n;t++){
    let f=t-a,r=t**n-a**n,c=0n;for(let k=0n;k<n;k++)c+=t**(n-1n-k)*a**k;
    ck(r===f*c,"base multiple");C.finiteMapDivisibility++;
    if(f===0n){ck(r===0n,"image containment");C.zeroImage++}
 }
 ck(1n<=1n&&!(1n<1n),"strict root bound");C.controls++;
 ck((-1n)**2n===1n&&-1n-1n!==0n,"strict containment");C.controls++;
 const x=[1n,0n],y=[0n,1n];ck(x[0]*y[0]===0n&&x[1]*y[1]===0n&&x[0]!==0n&&y[1]!==0n,"product ring control");C.controls++;
 const eps=[0n,1n],dual=(a,b)=>[a[0]*b[0],a[0]*b[1]+a[1]*b[0]];ck(eps[1]!==0n&&dual(eps,eps).every(x=>x===0n),"dual numbers nilpotent");C.controls++;
 return C;
}
console.log(JSON.stringify(certificate()));
~~~

RESULT: DONE local source-matched density and openness argument with regularity assembly, native analytic/algebraic suppliers preserved. Full RH OPEN. RESUME HERE: expand the exact source of ReciprocityTheory.MultiplicativeHeights.ae_eval_ne_zero_of_ne_zero_fin (the remaining measure-zero supplier for density), including the zero-dimensional case and Fubini/finite-root argument; then resume the arithmetic height consumer of GAGA instead of repeating RUN15–20. Request authenticated role-labelled Main-root paths for dense_nonvanishing, isOpenMap_comap, exists_eq_of_continuous_quotient_algHom and RUN19 declarations from dependency/kernel lanes. HANDOFF TO geometry, editor, integration, audit, dependencies, kernel, literature. No URT acceleration or Lean kernel validation asserted.

<!-- END VERBATIM specialists/positivity_geometry/RUN20_DENSE_NONVANISHING_FINITE_MAP_OPENNESS.md -->

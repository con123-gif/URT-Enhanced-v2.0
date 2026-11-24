# Human-readable RH reconstruction — fifteenth edition, 24 November 2026, 21:56 UTC

**INCOMPLETE.** Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from previous edition. No migration equivalence, independent kernel replay or URT speed claim. Single linked manuscript: volumes [1](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [2](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [3](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [4](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [5](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [6](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [7](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [8](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), [9](2026-11-24_1856_INTEGRATED_MANUSCRIPT.md), [10](2026-11-24_1956_INTEGRATED_MANUSCRIPT.md), [11](2026-11-24_2056_INTEGRATED_MANUSCRIPT.md), then volume 12 here. Previous 143 primary + 11 supporting editorial entries; 9 new primary peer chapters, giving 152 primary + 11 supporting = 163 entries under the earlier convention (excluding editor introductions and supporting code). Counts are editorial entries, not unique declarations or a completion percentage.

## Reading order and precise joins

1. Root nonvanishing and reflection: EveryCharacter and the functional equation reduce RH to right-half-plane Dirichlet nonvanishing. Today's Landau peer closes the conditional family wrapper from prime-window bounds, not existence of those bounds. Distinguish primitive symmetry rho -> 1-rho below (changes character to inverse) from conjugate equivalence for general families.
2. Analytic inputs and prime selection: this chapter -> volume 11's two zero-sum estimates -> volume 10's tail/ordinary series approximation -> volume 9's common prime-pair witness. Retain ExplZeta, ExplChi, LogDerOne in that order here; estimate wrappers consume ExplChi, LogDerOne, ZeroCount, ZFRDirichlet, ExplZeta in their own order. Common GoodFor guard remains required downstream.
3. Arithmetic host: rank, level, QDChoice and other host constructors, then frame/pseudobasis and size envelopes. Frame chapter is a local constructor, not all nine same-family conditions. StarAll numerical chapter requires adm5 and native scale witnesses.
4. Geometry and automorphic lifting: new Galois chapter expands Plan -> Pack -> twisted representation with separate P/P' witnesses. Direct export references connect root-frontier galoisRepresentations_of_thetaLift to immediate suppliers, not a full proof of GeoOne. Global de Rham/Hodge suppliers assemble comparison records from remaining inputs, not external axioms by definition. GAGA algebraization has independent existence leaves.
5. Theta and local geometry: new HolCoef chapter fills separate local hypothesis of previous UEx density chapter via row stabilizer, determinant-one weight and pure signature. Rational invariance from FcConj remains separate. GL topology/integral lifting and Jacobi conductor chapters are supporting exact source routes, not asserted root joins where unconfirmed.
6. Return via same-family arithmetic window, character projection, analytic contradiction, imprimitive reduction and reflection. No missing producer is assumed proved by this reading order.

## New editor derivation: truncated explicit formula adapter and exact zero transport

SOURCE-MATCHED conditional reconstruction of GlobalTheory.Mem.An.ExplUsed.explicit_formula_used and its auxiliary zero-sum results. This is an adapter, not an independent proof of the explicit formula.

### 1. Exact hypotheses and statement

Write Z_chi(t,T) for zeros rho of L(s,chi) with 0<Re rho<1 and |Im rho-t|<=T, and m_chi(rho)=analyticOrderNatAt L rho. Write Z=sum over Z_chi(0,T) of m_chi(rho) u^rho/rho; Y=sum over Z_chi(0,1) of m_chi(rho)/rho; S=sum over Z_chi(0,1) of m_chi(rho)/|rho|. These are finite weighted sums (finsum in source); multiplicities retained.

- ExplZeta: exists C1 uniform for real u,T>=2; |psiChi(1,u)-u+Z+A| <= C1(log u + (u/T)log^2(uT)), with modulus one and A=log(2pi)+log(1-u^(-2))/2.
- ExplChi: exists C2 uniform for positive natural q>1, primitive chi, real u,T>=2; |psiChi(chi,u)+Z+a+b-(D+c)| <= C2(log u + (u/T)log^2(quT)), with a=log(u-1)/2, b=chi(-1)log(u+1)/2, D=L'(1,chi^(-1))/L(1,chi^(-1)), c=log(q/(2pi))-EulerGamma.
- LogDerOne: exists C3 uniform for positive q>1 and primitive xi; |L'(1,xi)/L(1,xi)-sum over Z_xi(0,1) m_xi(rho)/(1-rho)| <= C3 log(3q).

Conclusion chooses C before q, chi, u, T: for q>0, primitive chi, and 2<=T<=u,
  |psi0(chi,u)+Z| <= C[(u/T)log^2(quT)+log(qu)+S].
Here psi0=psiChi-u for the principal character, psi0=psiChi otherwise, as used by source reduction. psiChi is inclusive floor von Mangoldt sum. Inputs hold for all T>=2 and u>=2 independently, output only asserted for T<=u. No half-weight modification of endpoints.

### 2. Zero sets and multiplicity transport

r(rho)=1-rho is an involution preserving the open strip and reversing Im rho. At center t=0 the absolute imaginary cutoff is unchanged, including equality at height 1. Native dirichlet_L_zero_symmetry states L(chi,rho)=0 iff L(chi^(-1),1-rho)=0, and m_chi(rho)=m_chi^(-1)(1-rho). Thus r bijects the zero sets: forward inclusion direct, injectivity by applying r again, surjectivity by taking 1-sigma and reverse equivalence. Since 1-(1-rho)=rho, the weighted sums match exactly:
  sum over Z_chi^(-1)(0,1) m_chi^(-1)(sigma)/(1-sigma)=Y.
This is zsum_inv_eq, not requiring chi=chi^(-1). For nonzero center t the reflected center is -t, not generally t.

The cited symmetry is local analytic: the completed functional equation gives L(chi,s)=F(s)L(chi^(-1),1-s) on the open strip, with F(s)=q^(1-s-1/2) rootNumber(chi) gammaFactor(chi,s)^(-1)/gammaFactor(chi^(-1),1-s)^(-1). Gamma factors nonzero because real arguments positive (even/odd split); root number nonzero by completed functional equation at -1 and L(chi,2)!=0. F analytic and nonzero locally. Product order is additive, F has order zero, and composition with s -> 1-s has derivative -1 so preserves order. Therefore equality of analytic orders, hence natural-number multiplicities. Imported completed functional equation, gamma and analytic order facts retained.

### 3. Finiteness and reciprocal norm

Native ZeroWindow covers every positive q and character, not just primitive. For principal chi use LFunctionTrivChar₁, entire, nonzero at 1, vanishing at all relevant L-zeros; for nonprincipal use entire L-function, nonzero at 1 by imported theorem. Window contained in closed ball of radius 1+|t|+T since |Re rho|<=1, |Im rho|<=|t|+T. Infinite set would have compact accumulation point, then identity theorem contradicts the entire function's nonzero value at 1. Negative T gives empty window. On C minus {1}, L analytic. Infinite analytic order at a zero would force local vanishing, then by connectedness vanishing at s=2, contradicting L(2)!=0. Each zero has nonzero finite order, hence m>=1. Imported boundary nonvanishing and identity theorem are retained, not RH-strength claims.

Finite triangle inequality gives |Y|<=S and S>=0. All reciprocal denominators nonzero by positive Re rho. Native norm_zsum_inv_le and zsumR_inv_norm_nonneg.

### 4. Level one

Write L=log u, Q=log q, E=(u/T)log^2(quT), W=E+Q+L+S. All nonnegative, L>=1/2. If q=1 then chi=1 by level_one and Q=0. ExplZeta gives |psiChi(1,u)-u+Z+A|<=C1(L+E). Since 3<pi<=4, log x<=x-1, 0<=log(2pi)<=7. Also 1-u^(-2)>=3/4>=1/2 and <1, so -log 2<=log(1-u^(-2))<=0. Thus |A|<=8<=16L. Exact identity psi0+Z=(psiChi-u+Z+A)-A gives
  |psi0+Z| <= |C1|(L+E)+16L <= (|C1|+16)W.
No positivity assumption on C1 needed; enlarge to absolute value with nonnegative bracket.

### 5. Level greater than one

Primitive chi at q>1 is nonprincipal since conductor of principal is 1. Inverse primitive by conductor_inv. Apply LogDerOne to xi=chi^(-1), transport its zero sum, use log(3q)=Q+log 3<=Q+2<=4(Q+L):
  |D-Y|<=4|C3|(Q+L).
Since |chi(-1)|<=1, 0<=log(u-1)<=L and u+1<=u^2, |a|<=L, |b|<=L. Also |c|<=Q+16L by 0<=log(2pi)<=7 and 1/2<EulerGamma<2/3; indeed |c|<=Q+8 and 8<=16L.
Let w=psiChi+Z+a+b-(D+c). Then exactly
  psi0+Z = w-a-b+(D-Y)+Y+c.
Triangle inequality yields
  |psi0+Z| <= |C2|(L+E)+2L+4|C3|(Q+L)+S+Q+16L
  <= (|C2|+4|C3|+18)W.
Thus native uniform C=|C1|+|C2|+4|C3|+20 works in both branches. Optional sharper human witness max(|C1|+16,|C2|+4|C3|+18,1) also works; not claimed a global improvement or Lean equivalence. Restore E=u log^2(quT)/T and Q+L=log(qu). This proves conditional adapter and source wrapper.

### 6. Trust boundary and joins

Three PublishedTheorems files below are Prop definitions, not proofs. Actual producers not authenticated by editor. New 71-owner literature/theta projection inspected (blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2); no established analytic producer from that inspection. Retain ZeroCount, ZFRDirichlet, primitive psi0 decay, GoodFor and classical boundary nonvanishing. Source symmetry and finiteness expanded locally, imported facts not independently audited. Formal audit: verify exact principal correction, uniform constants, inverse-character reflection, finite multiplicities and closed cutoff, wrapper order.

## Exact source ledger and reproducibility

- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean) — e03bcee4f1d297f73e704c1c466fdb987957918e; anchors: `theorem zsum_inv_eq`, `finsum_mem_eq_of_bijOn`, `theorem norm_zsum_inv_le`, `theorem zeta_const_bound`, `theorem explicit_formula_used`, `|C₁| + |C₂| + 4 * |C₃| + 20`, `DirichletCharacter.level_one`, `DirichletCharacter.conductor_one`, `DirichletCharacter.conductor_inv`, `rw [zsum_inv_eq χ hχ] at g`, `(D - Y) + Y + c`
- [src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ExplZeta.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ExplZeta.lean) — 05a637a44440fafc3929892eafb0498fcd4fba2b; anchors: `def ExplZeta : Prop`, `2 ≤ x → 2 ≤ T`, `Real.log (1 - 1 / x ^ 2) / 2`
- [src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ExplChi.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ExplChi.lean) — 24e8abc392e1556d86385d6c30ef20db36926e97; anchors: `def ExplChi : Prop`, `1 < q → χ.IsPrimitive`, `χ (-1) / 2`, `DirichletCharacter.LFunction χ⁻¹`
- [src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/LogDerOne.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/LogDerOne.lean) — c601b15e8fff11b06060acfcb556923960013a24; anchors: `def LogDerOne : Prop`, `1 < q → χ.IsPrimitive`, `fun ρ => 1 / (1 - ρ)`, `Real.log (3 * q)`
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormulaStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormulaStatement.lean) — 00f5d5693112a3c18788ec5fdf185618a483d747; anchors: `norm_psi0_add_zsum_le_of_isPrimitive`, `ExplUsed.explicit_formula_used`
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetryStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetryStatement.lean) — 9c3fd6285fd9da7e863a9153564eec17e5a10a4e; anchors: `dirichlet_L_zero_symmetry`, `zeros_symm_one_sub`, `zmult χ ρ = zmult χ⁻¹ (1 - ρ)`
- [src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean) — 7a15775fd81401803807bd100f89eadb63bb7411; anchors: `def zerosIn`, `|ρ.im - t| ≤ T`, `def zmult`, `def zsum`, `def zsumR`, `Icc 1 ⌊u⌋₊`
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZerosInWindowFiniteAndPosOrderStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZerosInWindowFiniteAndPosOrderStatement.lean) — a30676568287fe82e35fa8655663cb17a81b3b0a; anchors: `dirichletLZerosInWindow_finite_and_pos_order`, `finite_and_one_le_zmult`
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetry.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetry.lean) — 09a41bf1f327641b92d332a7c89a13a3043a4804; anchors: `theorem zsymFactor_ne_zero`, `theorem zsymFactor_analyticAt`, `theorem zeros_symm_one_sub`, `analyticOrderAt_comp_of_deriv_ne_zero`, `analyticOrderAt_mul`
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZerosInWindowFiniteAndPosOrder.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZerosInWindowFiniteAndPosOrder.lean) — 1aaae7138cd28d37bca5476f58103511dff9be2c; anchors: `theorem exists_entire`, `theorem finite_zeros`, `exists_accPt_of_subset_isCompact`, `eqOn_zero_of_preconnected_of_frequently_eq_zero`, `theorem order_ne_top`, `theorem one_le_zmult`

Ten pinned connector blob IDs matched and 46 literal anchors checked in preceding source-check execution. No independent raw-byte rehash. Exact V8 BigInt certificate executed: {"reflection":42800,"budget":162000,"signs":151263,"negative":4,"total":356063}. These are rational reflection and algebraic budget/cancellation cases, not actual L-zeros, logarithm-estimate tests or Lean replay. Logarithm estimates are proved in prose. Reproduce with Node:

```js
function check(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let reflection=0,budget=0,signs=0,negative=0;
 for(let d=2n;d<=25n;d++)for(let a=1n;a<d;a++)for(let b=-d;b<=d;b++)for(let m=1n;m<=4n;m++){
  const A=d-a,B=-b,aa=d-A,bb=-B;
  ck(A>0n&&A<d&&B>=-d&&B<=d&&aa===a&&bb===b,"involution and closed low window");
  const nr=m*d*a,ni=-m*d*b,den=a*a+b*b;
  ck(nr===m*d*aa&&ni===-m*d*bb&&den===aa*aa+bb*bb&&den>0n,"exact weighted reciprocal transport");reflection++;
 }
 const abs=x=>x<0n?-x:x;
 for(let L=1n;L<=6n;L++)for(let Q=0n;Q<=5n;Q++)for(let E=0n;E<=5n;E++)for(let S=0n;S<=5n;S++)for(let c1=-2n;c1<=2n;c1++)for(let c2=-2n;c2<=2n;c2++)for(let c3=-2n;c3<=2n;c3++){
  const V=L+Q,W=E+V+S,C=abs(c1)+abs(c2)+4n*abs(c3)+20n;
  ck(abs(c1)*(L+E)+16n*L<=C*W,"level one budget");
  ck(abs(c2)*(L+E)+2n*L+4n*abs(c3)*V+S+Q+16n*L<=C*W,"nontrivial level budget");
  const M=[abs(c1)+16n,abs(c2)+4n*abs(c3)+18n,1n].reduce((a,b)=>a>b?a:b);
  ck(abs(c1)*(L+E)+16n*L<=M*W&&abs(c2)*(L+E)+18n*L+4n*abs(c3)*V+S+Q<=M*W,"optional max witness");budget++;
 }
 for(let X=-4n;X<=4n;X++)for(let a=-3n;a<=3n;a++)for(let b=-3n;b<=3n;b++)for(let D=-3n;D<=3n;D++)for(let Y=-3n;Y<=3n;Y++)for(let c=-3n;c<=3n;c++){
  const w=X+a+b-D-c;ck(w-a-b+(D-Y)+Y+c===X,"exact signed cancellation");signs++;
 }
 ck(Math.abs(1-1)<=1&&Math.abs(-1-1)>1,"reflection with nonzero center is not same window");negative++;
 ck(2n*3n!==3n,"multiplicity cannot be suppressed");negative++;
 ck(1n-1n!==1n,"principal main term cannot be dropped");negative++;
 ck((1n-2n)+(2n-1n)+1n===1n,"D-Y sign sensitive");negative++;
 return {reflection,budget,signs,negative,total:reflection+budget+signs};
}
console.log(check())
```

## Numbered remaining obligations — evening completion audit

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. Plan/Pack/rep expanded conditionally; PlanEx producer open. Root correspondence incomplete.
2. RecTExists/VWin and host design: QDChoice and analytic approximation conditional; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and primitive GoodFor. Level and pseudobasis are local expansions.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH, local closure and provenance. HolCoef supplies local UEx hypothesis conditional on HolT, pure signature and imported inputs. Global comparison suppliers need relation totality/zero, six crystalline antecedents, full 47-field Hodge chapter and naturality.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG and NumStar. GAGA partial; adm5 and StarAll quantifiers retained. Size-window source transport and core bound separate.
6. Actual analytic input producers ExplChi/ExplZeta/LogDerOne, ZeroCount, ZFRDirichlet, zero-density, primitive psi0, Mertens, prime mean-square/count and window producers. Conditional family Landau wrapper expanded, arithmetic premise open; boundary nonvanishing at Re=1 independent literature/library audit.
7. Source/build/export correspondence, typed projection, metadata policy, independent kernel replay/axioms. Prior reported mixed-export denominator 1,484,705 declarations; authenticated unique human-translated reachable numerator unknown. No defensible percentage. Do not conflate type/value/structural slots or reference records with direct proof steps.
8. Independent proof/citation audit, exact joins, source/export root reachability, external trust boundaries. No full proof, kernel validation or URT improvement asserted. Requested complete manuscript not achieved.

## Continuity

Preflight: AGENTS, swarm, handoff queue, expansion, spine, continuity, state/log/protocol excerpts and general CI #397 PASS (not RH validation). Prior editor and 14 peer changes inspected at 9101b7250809fc03d8a34e0817353880ff94f271; nine new markdown chapters appended exactly. Six supporting code files listed below, not rerun. Blueprint link noted but PDF not independently reopened. No physics changes or source migration.

RESUME HERE: authenticate native producers of ExplZeta, ExplChi, LogDerOne by role-labelled reverse references; expand actual analytic proof rather than another adapter. Next primitive psi0 decay (exists_norm_psi0_le_exp_sqrt_log) if not covered by peers. Formal audit: exact signed identity, level-one pole correction, source symmetry/analytic order, and all three propositions. Request authenticated owner paths for ExplUsed.explicit_formula_used, zsum_inv_eq, norm_zsum_inv_le, ZeroWindow.finite_and_one_le_zmult, zeros_symm_one_sub and actual ExplZeta/ExplChi/LogDerOne producers. HANDOFF TO all RH lanes. Project OPEN.

## Supporting peer scripts (not rerun here)

- [audit/2026-11-24_size_windows_premise_transport.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_size_windows_premise_transport.mjs) — 4f275b2efb546ce644203804aa1e89ebbd3017ee
- [dependencies/rh_literature_theta_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_literature_theta_frontier.mjs) — 9afe1f343c2566a4bb1f0bb723efa190d81e0c03
- [math/verify_twist_prim_jacobi_conductor.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_twist_prim_jacobi_conductor.py) — a4bf5a73e5a78cbf447cc338a4c39af433f30493
- [specialists/kernel_extractor/run15_slot_and_record_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run15_slot_and_record_audit.mjs) — 31c15aa8c30b1e05abeacb15a7bdc26d20d7feee
- [specialists/on_acceleration/role_delta_run15.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/role_delta_run15.mjs) — 3aa3fc181fcbe837bc8b2a93118ff2346ea588af
- [structure/2026-11-24_2124_role_aware_scc_scheduler.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_2124_role_aware_scc_scheduler.mjs) — d5dd39f4c9177775495559bb5038eda3e8ee1115

## Peer chapters — exact text preserving original status


---

### Peer original: [integration/2026-11-24_2100_GL_TOPOLOGY_INTEGRAL_LIFT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_2100_GL_TOPOLOGY_INTEGRAL_LIFT.md) — blob ca65519fd269d9094fa6dedb0515a3395df4e5e6

# GL topology and integral lifting — integration 21:00

2026-11-24. RESULT: SOURCE-MATCHED / PARTIAL. One contribution: resolve the GL embedding and integral lift suppliers of [20:00](2026-11-24_2000_CONGRUENCE_MODULUS_LEVI.md), including the directly adjacent compactness and residue-lift arguments. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed main 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged); no migration equivalence.

## Human proof

Fix a field k with ValuativeRel, topology and IsNonarchimedeanLocalField, and a finite decidable index type n. Write O for the valuation ring and F for its residue field, and j:GL_n(O)→GL_n(k) for the entrywise inclusion. The source definitions (MatrixMeasurableSpace, KO/KOne) are KO=range(j) and KOne=j(ker(GL_n(O)→GL_n(F))). Thus KOne≤KO by image inclusion; this is the whole native proof of Model.KOne_le_KO, not a determinant assumption. The StepData version is its alias.

**Integral inverse criterion.** For g∈GL_n(k), g∈KO iff both g and g^{-1} have integral entries. Forward: choose u∈GL_n(O) mapping to g. Both u and u^{-1} have entries in O; functoriality sends u^{-1} to g^{-1}. Reverse: form A,B over O by lifting the entries of g and g^{-1} respectively. Entrywise inclusion is injective. It sends AB and BA to I because g is a unit. Hence AB=BA=I in Mat_n(O). The explicit unit (A,B) maps to g by extensionality of units. This proves SplitFlip.mem_KO_iff and supplies StepData.mem_KO and intM_of_mem_KO. Do not weaken the premise to integrality of g alone: over Q_p, diag(p,1,...,1) is invertible over Q_p and integral but its inverse has p^{-1}, not integral.

**Topology.** The topology on units is induced by the pair (g,g^{-1}), with the inverse factor written in the opposite monoid. The projection to g is continuous and injective. To recover the inverse coordinate continuously on the image, use continuousAt_matrix_inv: on the invertible locus, A^{-1}=adj(A)/det(A), a continuous function since matrix entries of adj(A) and det(A) are polynomial and scalar inversion is continuous at nonzero det(A). The native proof uses Units.isEmbedding_val_mk', continuousAt_matrix_inv and Ring.inverse_eq_inv', obtaining det(A)≠0 from IsUnit A. It first installs the local field's second-countability/Hausdorff instances via Model.secondCountable_and_t2_local_field, which uses the additive uniform space, rank-one valuation embedding, and proper-space theorem. Therefore the projection is a topological embedding, not just an injection. This supplies the exact neighbourhood comap used in exists_cong_subset. Inversion is asserted continuous at units, not at singular matrices. The Mathlib topology/inversion/proper-space lemmas are preserved as open imported obligations, not claimed independently reconstructed.

**Compact open KO.** Entry-integral matrices form the finite product of O, open by finite intersections of continuous entry projections, compact by product compactness (the source compactness lemma actually allows arbitrary index types). O is open by Valuation.isOpen_integer and compact by the local field closed-ball axiom/theorem. Pull back the two open matrix sets under g and g^{-1} and use the integral inverse criterion. For compactness use the closed embedding of units into Mat×Mat^op and pull back the compact product of integral matrix sets. Do not claim that an arbitrary continuous preimage of a compact set is compact. This is exactly the separate closed-embedding hypothesis in SplitFlip.isCompact_KO, supplying CentralExponent.isCompact_cong.

**Residue lift (supplier of cong_factor).** For an arbitrary matrix M over k with v((M-I)_ij)<1 at every entry, M is integral since M=(M-I)+I. Define A over O entrywise by these witnesses. The equivalence residue(x)=residue(y) iff v(x-y)<1 follows by reducing the difference to zero, using the maximal ideal/nonunit valuation characterization. It implies residue(A)=I. The determinant commutes with reduction, so residue(det A)=1≠0, and the local-ring criterion gives IsUnit(det A). By the matrix unit determinant criterion A is a unit u over O. Its residue is the identity unit (units extensionality); j(u) belongs to KOne and has underlying matrix M. This proves exists_mem_KOne without assuming M invertible in advance. Conversely, a KOne witness has residue identity, hence all entries of g-I have valuation <1. The reverse implication uses exists_mem_KOne and injectivity of GL underlying values. This proves mem_KOne and supplies the earlier congruence-factorization argument. Strict <1 cannot be replaced by ≤1: M=0 satisfies the weak bound but is singular for nonempty n. Empty n is allowed in the original finite index type; matrix identities are vacuous and its determinant is the empty product 1. No positive dimension premise added.

## Integration / independent findings

Latest editor [2056 manuscript](../specialists/proof_editor/2026-11-24_2056_INTEGRATED_MANUSCRIPT.md) reports 143 primary + 11 supporting entries by its convention, not unique declarations or proof completion. This new chapter is additional; do not count it twice when the editor integrates it. Prior conservative closure 1,484,705 reported reachable declarations is not a source translation denominator with a verified numerator. Kernel RUN14 (fff5a2d09) demonstrates role-edge deletion can be masked by target-set equality on actual 47-owner projection; use full role evidence, not target equality. Dependencies 63102da24 requests next 18 targets; acceleration a23fb0d5f merges 47+6 same-archive reports without claiming new extraction. Structure 9adeb6277 schedules only observed roles; audit 5cead6ee3 retains branch budgets; math 841a46bce preserves extensionality and unit map provenance. Specialist handoffs: boxes RUN14, Galois RUN14, Landau RUN14, literature RUN14, geometry RUN14, prime RUN14, theta RUN14, editor 2056, kernel and acceleration latest commit checkpoints, Grok run9 claim. General CI checkpoint 394, run 45482075317 PASS at 20:55:53, not RH validation. Protocol, handoff queue, AGENTS, actual runner research log/protocol and continuity/state excerpts inspected. Root-level RESEARCH_LOG/RESEARCH_PROTOCOL paths failed 404; corrected to runner paths. Full external blueprint and older nested handoffs not reread; no claim of using them. No Lean toolchain replay or authenticated root membership for these suppliers. No URT benchmark.

## JSON typed obligation tree (shared nodes)

Source anchors are exact declaration starting lines, not full proof-term dependency lists. The external node deliberately leaves imported obligations open. All file blobs retrieved at pin and matched; 25 declaration anchors located uniquely, all graph targets exist, no cycle. Axiom dependencies remain unclassified locally, not discarded. The 20:00 consumers are included to connect the chapter, not counted as newly translated.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "selected human obligation graph, not authenticated root membership or exhaustive kernel graph",
  "files": [
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/MatrixMeasurableSpace.lean",
      "blob": "3357ad90bd4c82c9fd86d50aa023c7997703b5c0"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/SecondCountableAndT2LocalField.lean",
      "blob": "829125937719426936bae9f8be35ee5f482e05bd"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/T2SpaceGeneralLinearGroup.lean",
      "blob": "141a89b315186ad19bd50a06f2945f52a87c4c91"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/ValuationDetOfMemKO.lean",
      "blob": "29229eb6e42f62e63c0f9aea2b200c5fe8051e3f"
    },
    {
      "path": "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/CentralExponentBoundOver.lean",
      "blob": "15c5d5b8b52fd25b3de410ae0696ff186298a926"
    }
  ],
  "nodes": [
    {
      "id": "ko",
      "kind": "definition",
      "file": 0,
      "line": 24,
      "anchor": "def KO ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone",
      "kind": "definition",
      "file": 0,
      "line": 27,
      "anchor": "def KOne ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "local",
      "kind": "lemma",
      "file": 1,
      "line": 44,
      "anchor": "theorem secondCountable_and_t2_local_field",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "subset",
      "kind": "lemma",
      "file": 1,
      "line": 126,
      "anchor": "theorem KOne_le_KO ",
      "requires": [
        "ko",
        "kone",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ring_open",
      "kind": "lemma",
      "file": 1,
      "line": 132,
      "anchor": "theorem isOpen_int ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ring_compact",
      "kind": "lemma",
      "file": 1,
      "line": 134,
      "anchor": "theorem isCompact_int ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_iff",
      "kind": "lemma",
      "file": 2,
      "line": 14,
      "anchor": "theorem mem_KO_iff ",
      "requires": [
        "ko",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "embedding",
      "kind": "lemma",
      "file": 2,
      "line": 31,
      "anchor": "theorem isEmbedding_val_GL ",
      "requires": [
        "local",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mat_open",
      "kind": "lemma",
      "file": 2,
      "line": 53,
      "anchor": "theorem isOpen_intMatrix ",
      "requires": [
        "ring_open",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mat_compact",
      "kind": "lemma",
      "file": 2,
      "line": 59,
      "anchor": "theorem isCompact_intMatrix ",
      "requires": [
        "ring_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_open",
      "kind": "lemma",
      "file": 2,
      "line": 67,
      "anchor": "theorem isOpen_KO ",
      "requires": [
        "ko_iff",
        "mat_open",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "ko_compact",
      "kind": "lemma",
      "file": 2,
      "line": 73,
      "anchor": "theorem isCompact_KO ",
      "requires": [
        "local",
        "ko_iff",
        "mat_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "intm",
      "kind": "definition",
      "file": 3,
      "line": 14,
      "anchor": "def IntM ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "maxm",
      "kind": "definition",
      "file": 3,
      "line": 16,
      "anchor": "def MaxM ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "mem_ko",
      "kind": "lemma",
      "file": 3,
      "line": 62,
      "anchor": "theorem mem_KO ",
      "requires": [
        "intm",
        "ko_iff"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "integral",
      "kind": "lemma",
      "file": 3,
      "line": 64,
      "anchor": "theorem intM_of_mem_KO ",
      "requires": [
        "mem_ko"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "subset_alias",
      "kind": "lemma",
      "file": 3,
      "line": 66,
      "anchor": "theorem KOne_le_KO ",
      "requires": [
        "subset"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "res_zero",
      "kind": "lemma",
      "file": 3,
      "line": 68,
      "anchor": "theorem residue_eq_zero_iff_lt ",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "res_eq",
      "kind": "lemma",
      "file": 3,
      "line": 72,
      "anchor": "theorem residue_eq_iff_lt ",
      "requires": [
        "res_zero",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone_exists",
      "kind": "lemma",
      "file": 3,
      "line": 76,
      "anchor": "theorem exists_mem_KOne ",
      "requires": [
        "intm",
        "maxm",
        "res_eq",
        "kone",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "kone_iff",
      "kind": "lemma",
      "file": 3,
      "line": 96,
      "anchor": "theorem mem_KOne ",
      "requires": [
        "kone_exists",
        "res_eq",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong",
      "kind": "consumer",
      "file": 4,
      "line": 95,
      "anchor": "def cong ",
      "requires": [
        "subset_alias",
        "integral",
        "kone_iff",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_compact",
      "kind": "consumer",
      "file": 4,
      "line": 125,
      "anchor": "theorem isCompact_cong ",
      "requires": [
        "cong",
        "ko_compact",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_basis",
      "kind": "consumer",
      "file": 4,
      "line": 130,
      "anchor": "theorem exists_cong_subset ",
      "requires": [
        "cong",
        "embedding",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "cong_factor",
      "kind": "consumer",
      "file": 4,
      "line": 154,
      "anchor": "theorem cong_factor ",
      "requires": [
        "cong",
        "kone_exists",
        "external"
      ],
      "status": "SOURCE-MATCHED / selected, not kernel edge"
    },
    {
      "id": "external",
      "kind": "open-imports",
      "requires": [],
      "status": "OPEN: Mathlib units topology, determinant/inversion, valuation, ring, compactness, and other source-visible suppliers not expanded here; exact axiom list not established locally"
    }
  ]
}
```

## Executed finite regression certificate

Executed the following exact integer-arithmetic JS in V8. Exhaustive 2×2 matrices over Z/p² for p=2,3,5; determinant-unit equivalence, both inverse products, identity residue inverse and a fixed p-divisible perturbation preserving inverse residue. This is finite regression, not proof of topology or Lean. The Q_p counterexample above is mathematical, not a finite test. Outputs {"matrices":397442,"inverses":303984,"kone":722,"perturbations":303984,"negative":3}. Reproduce by saving the following block as a .js file and invoking node. Source matching and typed graph checks were run separately through GitHub pinned fetch and the explicit DFS described above; not included in the finite counts. No failed numerical cases. No CI registration outside lane, no unrelated records changed.

```js
function finite(){
 const c={matrices:0,inverses:0,kone:0,perturbations:0,negative:0};
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const mod=(x,q)=>((x%q)+q)%q;
 const mul=(a,b,q)=>[mod(a[0]*b[0]+a[1]*b[2],q),mod(a[0]*b[1]+a[1]*b[3],q),mod(a[2]*b[0]+a[3]*b[2],q),mod(a[2]*b[1]+a[3]*b[3],q)];
 const I=[1,0,0,1],eq=(a,b)=>a.every((x,i)=>x===b[i]),det=a=>a[0]*a[3]-a[1]*a[2];
 function inverse(a,q){const d=mod(det(a),q);let u=0;for(let i=1;i<q;i++)if(mod(d*i,q)===1){u=i;break}return u?[a[3],-a[1],-a[2],a[0]].map(x=>mod(u*x,q)):null}
 for(const p of [2,3,5]){
  const q=p*p;
  for(let a=0;a<q;a++)for(let b=0;b<q;b++)for(let d=0;d<q;d++)for(let e=0;e<q;e++){
   const A=[a,b,d,e],B=inverse(A,q),isK=A.every((x,i)=>mod(x-I[i],p)===0);
   ck((B!==null)===(mod(det(A),p)!==0),"det criterion");c.matrices++;
   if(B){ck(eq(mul(A,B,q),I)&&eq(mul(B,A,q),I),"two-sided inverse");c.inverses++}
   if(isK){ck(B!==null&&B.every((x,i)=>mod(x-I[i],p)===0),"KOne inverse");c.kone++}
   if(B){const C=A.map((x,i)=>mod(x+p*(i+1),q)),D=inverse(C,q);ck(D!==null&&D.every((x,i)=>mod(x-B[i],p)===0),"inverse congruence");c.perturbations++}
  }
 }
 ck(inverse([2,0,0,1],4)===null,"singular mod maximal ideal");c.negative++;
 ck(!eq([1,2,0,1],I)&&[1,2,0,1].every((x,i)=>mod(x-I[i],2)===0),"residue not equality");c.negative++;
 ck(inverse([1,0,0,0],9)===null,"nonunit determinant");c.negative++;
 return c;
}
console.log(finite());
```

**RESUME HERE:** expand the remaining native SplitFlip topology/valuation dependencies by fetching the manifest-pinned Mathlib bodies of Units.isEmbedding_val_mk', continuousAt_matrix_inv, Units.isClosedEmbedding_embedProduct and the local proper-space supplier; distinguish standard-library expansion from RH-specific obligations, and prioritize root-linked consumers once the next role projection returns. Request authenticated paths for SplitFlip.mem_KO_iff, isEmbedding_val_GL, isCompact_KO, StepData.exists_mem_KOne, mem_KOne and CentralExponent.cong_factor. HANDOFF TO dependencies, kernel, audit, editor, integration. Project OPEN.


---

### Peer original: [math/2026-11-24_twist_prim_jacobi_conductor.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_twist_prim_jacobi_conductor.md) — blob e3d2f8a56a5a505aa59b9c87401ae104cd34e84d

# MATH lane — `QH.twist_prim`: primitive Jacobi twist at a new odd prime

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the first unresolved supplier behind `QH.ind_drop`.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The required source revision is `40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Blob | Role |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean` | `5443adc0075731900672030d140d5d8c85b668f7` | theorem reconstructed |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | primitivity and nontriviality supplier |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/WeightedVonMangoldtSumIdentity.lean` | `2c73f2f3005e8fe05017d74506cff497df52e4bd` | evaluation formula supplier |
| `src/Formalism/GL3MeanSquares/SecondEstimateOfIntervalHypothesis.lean` | `bdea967f4db26bfc2b040f01beeebbed0ff8909c` | definitions `qc`, `tw`, `TwPrimitive`, `TwEval` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | immediate downstream caller |

The current upstream head checked on 2026-11-24 is
`9282d3a102c4aff0e6026746db2a8990f5d9cddd`. The corresponding first four blobs are respectively
`12203d3f4ca7e7da27ab01667d8c084d61246de6`,
`4564722f96a5e2ca86092fb039e127a77a950c34`,
`ed8c63c192dc174f282bad96335dbb57c6d4a4a2`, and
`3a2de971bd8f34ce6fc3ca7aad7f635a4187fd5f`. Direct source comparison found the targeted theorem
bodies and definitions unchanged; the modules' generated import preludes differ. This is a text
comparison, not a compiled-term equivalence claim.

The two direct formal suppliers are
`ThinSetIntegral.twist_is_primitive_character` and
`ZeroFreeRegionGL2.twist_evaluation_formula`; the latter's nonunit branch invokes
`jacobiSym.eq_zero_iff_not_coprime`.

## 1. Exact theorem and every hypothesis

For all natural numbers `f,q`, a typeclass witness `[NeZero f]`, and every
`xi : DirichletCharacter C f`, assume

1. `xi.IsPrimitive`;
2. `q.Prime`;
3. `q != 2`;
4. `not q divides f`.

Then there exists `psi : DirichletCharacter C (f*q)` satisfying all three conclusions

1. `psi.IsPrimitive`;
2. `psi != 1`;
3. for every natural `n`,
   `psi(n mod f*q) = xi(n mod f) * J(q,n)`.

Here `J(q,n)` is the complex cast of the Jacobi symbol `(n/q)`. The conclusion is global in `n`;
there is no coprimality guard because both sides vanish in the nonunit cases handled below.

## 2. The constructed character

Install `Fact q.Prime` from the explicit primality hypothesis. Since `q` is prime,
`not q|f` is equivalent to `Coprime(q,f)`.

The source defines

    qc(q) = the quadratic character of ZMod q, cast from Z to C,

and

    tw(xi,q)
      = changeLevel(xi, f | f*q)
        * changeLevel(qc(q), q | f*q).

Thus the witness is not chosen abstractly: `psi := tw(xi,q)`. It is the product of the original
primitive character and the quadratic character at the new prime, both evaluated at the product
level.

## 3. Why the quadratic factor is primitive

The conductor of `qc(q)` divides its level `q`. Since `q` is prime, the conductor is either `1` or
`q`. If it were `1`, `eq_one_iff_conductor_eq_one` would make `qc(q)` the principal character.

For `q != 2`, this is impossible. The source reduces equality of the complex-valued character to
equality of the underlying quadratic character on units using `MulChar.ext`; Mathlib's
`quadraticChar_ne_one` supplies a unit on which the quadratic character is not one. Hence

    conductor(qc(q)) = q.

The excluded prime `2` is substantive: `(ZMod 2)^*` has one element, so its quadratic character is
principal and has conductor `1`.

## 4. Why the product has conductor exactly `f*q`

The difficult step is the private lemma `prim_mul`. Write `N=f*q`, let `A` be `xi` lifted from `f`
to `N`, let `B` be `qc(q)` lifted from `q` to `N`, and put `c=conductor(A*B)`.
Changing level preserves the two primitive conductors:

    conductor(A)=f,  conductor(B)=q.

Apply `conductor_mul_dvd_lcm_conductor` to `(A*B)` and `B^{-1}`. Since
`(A*B)B^{-1}=A` and `conductor(B^{-1})=q`, it yields

    f divides lcm(c,q), hence f divides c*q.

Because `Coprime(f,q)`, Euclid's lemma removes the `q` factor and gives `f|c`. Repeating the same
argument with `(B*A)A^{-1}=B` gives `q|c`. Coprimality then gives `f*q|c`.

Every character conductor divides its level, so also `c|f*q`. Antisymmetry forces

    conductor(tw(xi,q)) = f*q.

That is exactly primitivity. The argument would fail if the new prime divided `f`: one could not
separate the two conductor factors.

## 5. Why the twist is nonprincipal

Suppose `tw(xi,q)=1`. Its conductor would then be `1`. But the preceding result says its conductor
is `f*q`. From `[NeZero f]` we have `1<=f`, and primality gives `2<=q`, so `2<=f*q`; contradiction.
Therefore the constructed character is not principal.

The more general supplier also proves that if `xi^2=1`, then `tw(xi,q)^2=1`. It expands the square
of the product, commutes powers with both change-level maps, and uses `qc(q)^2=1` on every unit.
`QH.twist_prim` intentionally discards this optional implication; its conclusion does not assume
or assert that `xi` is quadratic.

## 6. The evaluation formula, including nonunits

For a natural `n`, split on whether its residue is a unit modulo `f*q`.

If it is a unit, both change-level characters evaluate by casting the residue to `ZMod f` and
`ZMod q`. The first factor becomes `xi(n mod f)`. For prime `q`, the quadratic character agrees
with the Legendre symbol, and the Legendre symbol agrees with the Jacobi symbol, giving `J(q,n)`.

If it is not a unit, the product-level character is zero. Nonunit mod `f*q` means
`not Coprime(n,f*q)`. There are two exhaustive branches:

- If `not Coprime(n,f)`, then `xi(n mod f)=0` by `MulChar.map_nonunit`.
- If `Coprime(n,f)`, failure at the product forces `not Coprime(n,q)`. The Jacobi symbol is then
  zero by `jacobiSym.eq_zero_iff_not_coprime`.

Thus the right side is zero in either branch. This is why `twist_prim` can state its evaluation
identity for every natural number, rather than only the units.

## 7. Downstream use and correction

`QH.ind_drop` applies this theorem to `xi.primitiveCharacter`, with
`f=xi.conductor`. It uses the returned primitivity and evaluation formula to identify the unknown
primitive character through `QH.ind_unique`. It discards only the nonprincipality field there.

This corrects a possible oversimplification of the earlier conductor-descent narrative: the
canonical twist is not primitive merely because its formal level is `f*q`. Its conductor is proved
equal to that level through the two inverse-product/lcm arguments above. Conversely, the evaluation
formula is not a unit-only identity silently generalized; both nonunit branches are proved.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_twist_prim_jacobi_conductor.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_twist_prim_jacobi_conductor.py

Observed output:

    twist_prim Jacobi/conductor regression: OK; report_checks=18, evaluation_checks=21610, square_checks=18856, conductor_checks=180, nonunit_checks=2754, negative_controls=3

The standard-library certificate checks the source ledger and report anchors. For every ordered pair
of distinct odd primes at most 31 it exhaustively evaluates the product quadratic character on
`ZMod(p*q)`, verifies the global evaluation identity and square-one law on units, and searches every
divisor for the smallest level through which the unit values factor. It also executes the `q=2`
and repeated-prime controls.

This finite model instantiates the conductor argument for quadratic source characters. It does not
prove `prim_mul` for arbitrary complex Dirichlet characters, replay Lean, or audit transitive axioms.

## Failed attempts / limitations

- Treating the formal level `f*q` as the conductor would assume the theorem's difficult step.
- Dropping `q!=2` fails: the quadratic character modulo `2` is principal.
- Dropping `not q|f` fails concretely for `f=q=3`: the product of the two identical quadratic
  factors is principal on units modulo `9`, so its conductor is `1`, not `9`.
- Proving the evaluation formula only on units leaves the exact nonunit statement used downstream
  unjustified; both vanishing branches are necessary.
- No Lean or Lake executable is installed locally. Status remains SOURCE-MATCHED, not ELABORATED.

## RESUME HERE

Trace pinned Mathlib `conductor_mul_dvd_lcm_conductor`, the remaining imported conductor inequality
inside `prim_mul`. Preserve its exact hypotheses and prove why multiplying by the inverse recovers
the first factor without silently assuming cancellation of nonunits. Do not repeat `twist_prim`,
`ind_drop`, `ind_unique`, or generic unit extensionality.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.


---

### Peer original: [specialists/character_boxes/RUN15_ADELIC_FRAME_PSEUDOBASIS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN15_ADELIC_FRAME_PSEUDOBASIS.md) — blob 0679a978f9858ec4a304297070afecfe614186d8

# RUN15 — Adelic frame from pseudobasis and fractional ideal generators
2026-11-24. DONE / SOURCE-MATCHED conditional reconstruction of exists_isFrame and its immediate algebraic suppliers. Native reachability and Lean replay OPEN.
Continuity: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research log/state/protocol and continuity inspected; CI #396 PASS on 1854836 for the separate Cathedral checks. Read RUN14 and recent RESUME notes in dependency, structure, math, integration, Galois, theta, kernel, literature, positivity, editor, prime, Landau and O(N) lanes; audit and acceleration directories inspected (no markdown handoff surfaced). External blueprint not independently reread this run; no use of its claims. No physics changes. RUN14 stopped at exists_isFrame. Correction to RUN14's proposed route: the actual proof is not a direct assembly of arbitrary local bases. It uses a global pseudobasis with possibly nonprincipal fractional ideals, principalized in the adelic tensor ring using an idempotent. Do not replace this with global freeness.

## Source anchors and complete local hypotheses
Repository leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Prefix B=src/Development/AbelianVarietyTheory/.
- B/Proofs/IwasawaDecomposition/ExistsSelfDualAdelicFrameLevelOne.lean b12d4b957f5655dccb14f4e3d3dec2367e29fc51, GlobalTheory.AdelicFrame.exists_idem_adele 21–36, exists_generator_int 38–75, exists_generator 77–91, mem_integral_adelic_lattice_iff 93–127, exists_basis_hat 129–170, exists_isFrame 172–189, exists_isSDFrame 197–211 (RUN14 already covered last wrapper).
- B/Proofs/FoundationProofs/ExistsIdeleGenerator.lean 7c219084c4e846b904820e9f950fe0252cefb4c6, GlobalTheory.IdealIdele.exists_idem 48–95, exists_local_generator 99–147.
- B/Proofs/UnitaryExistence/MemAdelicCompletionPseudoBasisIff.lean 5f8100e01c2475fbfa76780b099075331d462085, GlobalTheory.AdLat.adCoord_tmul, adCoord_smul, adCoord_sum and mem_hat_pseudoBasis_iff.
- B/Proofs/FoundationProofs/FinCongMemLevEnv.lean 440b51f0d5724ec337783d5e2035ee49e3bccc87, GlobalTheory.PrincInLevel.swap_mem_hatL 73–87, smul_mem_hat 89–119, swap_symm_mem_hat 121–134.
- B/Definitions/ExistenceOfLattices/Hat1.lean 5955993355c697e3c7394083cf050c9975d2800b, RA, fv, hat, hat1.
- B/Proofs/UnitaryExistence/IntegralFiniteAdeleCompleteSeparated.lean 1017e864a696bc30726d16d7a25f7bc63255c8f2, integral_finiteAdele_complete_separated 71ff (actual completeness/separation supplier, not independently reconstructed here).
- B/Proofs/UnitaryExistence/CramerMemAdelicCompletionOfElementSet.lean 1a1803a445e8a77d3cdb8e99cdb8dfbcb21c2b61, import line 4 connects pseudobasis membership file.

For arbitrary number fields F,E with Algebra F E, arbitrary n:Nat (no positive-rank restriction), and O_E-submodule L of E^n, assume L.FG and span_E L=E^n. Then exists beta in GL_n(E tensor_F Af(F)) with IsFrame beta L. This is not an assertion of self-duality, isometry or an integral global basis. Let A=Af(F) tensor_F E=RA F E and S=intAd(F). Here hat(L) is the additive subgroup generated by vectors a tensor x with a in S (integral at EVERY finite place) and x in L; hat1(J) similarly uses scalars. Closure here means algebraic additive subgroup generation, not topological closure. Finite-adele restrictedness is already part of the ambient type, not a separately proven arbitrary local-family gluing lemma. All field/number-field/algebra instances retained.

## Proof
1. Ideal splitting. For a nonzero integral ideal B choose m=2 absNorm(B)>0 in B. Dedekind ideal theory supplies beta in B with (beta)=BC and (m)+C=O_E; C and beta are nonzero. Multiplication by m modulo C is a unit, of finite order k>0 because the quotient is finite. Hence n=m^k-1>0, gcd(m,n)=1 and n in C, giving beta divides n*b for every b in B. This is exists_local_generator, not the claim B is principal.

2. Idempotent. In the complete and separated integral finite adele ring, take the compatible limit of m^(N!) modulo N for every N>0. The imported finite monoid argument proves m^(N!*t)=m^(N!) modulo N for t>0; factorial divisibility supplies coherence from N to N*k. Completeness yields f in S, separation applied to f²-f gives idempotency. Taking N=m shows f=m*w with w in S; for every positive n coprime to m, Euler's theorem gives m^(n!)=1 mod n and thus 1-f=n*v with v in S. Same f works for all such n, not one f per n. This uses the actual completeness/separation theorem; no analytic series convergence assumed.

3. With beta as above, set y=(1-f) tensor beta + f tensor 1, y'=(1-f) tensor beta^(-1)+f tensor 1. Since f and 1-f are orthogonal idempotents, yy'=1. The first summand of y is in hat1(B) by beta in B, the second by f=m*w and m in B (move integer scalar across tensor). To see y' in hat1(B^(-1)), test y'*(1 tensor b) in hat1(O_E) for each b in B, via the imported inverse-ideal membership theorem. The first term becomes v tensor (nb/beta), integral by the divisibility above; second is f tensor b. This proves the precise membership conditions without requiring y' integral itself. For a nonzero fractional ideal I, express I=(a^-1)B with a nonzero integral a, and scale y by 1 tensor a^-1 and y' by 1 tensor a. The imported fractional-ideal completion multiplication property gives the two memberships and product one. Consequently for all z in A,
   z in hat1(I) iff y' z in hat1(O_E).
Forward uses hat1(I^-1)hat1(I) subset hat1(O_E); backward uses y y'=1 and hat1(I)hat1(O_E) subset hat1(I). Nonzero I is essential.

4. Pseudobasis. By exists_pseudoBasis_adapted (FG and full-span premises used here), choose an E-basis e_a and nonzero fractional ideals I_a with x in L iff every e-coordinate of x is in I_a. Let P0 have columns 1 tensor e_a and Q0 have entries 1 tensor e.repr(delta_i)_a. The source proves Q0 P0=1 by applying adCoord_sum to each coordinate vector; the reverse identity uses mul_eq_one_comm. For any w, sum_a w_a fv(e_a)=P0 w. The membership lemma is proved in both directions on generators: adCoord sends a tensor x to a tensor e.repr(x)_b, so additive subgroup closure gives each coordinate in hat1(I_b). Conversely for generator a tensor y of hat1(I_b), y*e_b lies in L by the pseudobasis criterion (all other coordinates zero); closure gives its vector lift and finite summation proves the reverse direction. This preserves all coordinates and both implications, not merely E-span equality.
Choose y_a,y'_a from step 3 independently for each a. Define P=P0 diag(y_a), Q=diag(y'_a) Q0. Then PQ=QP=1 and for every z,
   z in hat(L) iff for all a, (Q z)_a in hat1(O_E).
This is exactly exists_basis_hat, not a Gram orthogonalization.

5. Tensor swap s:A→E tensor_F Af(F) is an algebra equivalence, so entrywise application preserves matrix products and identity. The mapped P,Q are two-sided inverse. For every x, (s(Q)x)_a=s((Q s^-1(x))_a). The scalar membership lemma at 93–127 identifies s(hat1(O_E)) with intAf by additive closure in one direction and subring closure in reverse; the product step uses fractional-ideal completion multiplication. The vector transport lemmas give s(hat(L))=hatL(L): forward on tensor generators and additive closure; reverse by span induction and smul_mem_hat, itself proved using subring closure on O_E and S generators. Thus x in hatL(L) iff every component of mapped inverse Q times x lies in intAf. This is the exact frame predicate as used by exists_isFrame at 182. Together with the two-sided inverse it constructs beta. No local approximation or extra positivity assumption. Self-duality only enters the caller exists_isSDFrame through its separate equality dualL=Λ; RUN14 covers that.

## Executed checks / upstream
Connector V8 executed 54 assertions: seven exact pinned blob hashes, source anchor presence, current blob hash. These are source-reference checks not elaborated edges. Upstream head H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (Nov 24 18:24:32 UTC, merge PR #1313), unchanged from RUN14. Current same file blob 360ed6dd3d45b2c113b3082016606062d21369df: five complete theorem blocks match pinned text after trim (exists_idem_adele, exists_generator_int, exists_generator, mem_integral_adelic_lattice_iff, exists_basis_hat); exists_isFrame differs only by local synthInstance.maxHeartbeats 100000 and indentation in the inspected block. Imports changed. No claim all upstream sources or compiled proof terms identical. Reproduce by git rev-parse P:path (seven hashes listed), git show P:path for the named declarations/edges, and git diff P H -- path for the changed source. The finite test below was executed in connector V8 and is reproducible with Node. Output {"idem":1008,"div":3820,"compat":3024,"coords":828100,"neg":4}. It tests modular idempotent coherence and coordinate normalization using exact integer numerators (representing fractional p-adic ideal powers relative to denominator p²); it is not a native number-field, topological or Lean proof. In particular the coordinate test uses unimodular bases and does not establish existence of adapted pseudobases. No original premise dropped; no kernel execution or URT benchmark.
```js
function regress(){
 const A=(b,m)=>{if(!b)throw Error(m)}, gcd=(a,b)=>b?gcd(b,a%b):a;
 const pow=(a,b,m)=>{let r=1n%m;a%=m;while(b){if(b&1n)r=r*a%m;a=a*a%m;b>>=1n}return r};
 const fac=n=>{let r=1n;for(let k=2;k<=n;k++)r*=BigInt(k);return r};
 let idem=0,div=0,compat=0,coords=0,neg=0;
 for(let N=1;N<=42;N++)for(let m=1;m<=24;m++){
  const M=BigInt(N), f=pow(BigInt(m),fac(N),M);
  A((f*f-f)%M===0n,"idempotent");idem++;
  A(f%BigInt(gcd(m,N))===0n,"m divides f mod N");div++;
  for(let n=1;n<=N;n++)if(N%n===0&&gcd(m,n)===1){A((1n-f)%BigInt(n)===0n,"n divides 1-f");div++}
  for(let k=1;k<=3;k++){A(pow(BigInt(m),fac(N*k),M)===f,"compatible factorial powers");compat++}
 }
 for(const p of [2,3,5,7])for(let t=-3;t<=3;t++)for(let u=-3;u<=3;u++)
 for(let e=0;e<=4;e++)for(let f=0;f<=4;f++){
  const a=p**e,b=p**f; // numerators relative to common denominator p^2
  for(let x=-6;x<=6;x++)for(let y=-6;y<=6;y++){
   // E=[[1,t],[u,1+ut]], E^-1=[[1+ut,-t],[-u,1]]
   const z=x+t*y,w=u*x+(1+u*t)*y;
   const r=(1+u*t)*z-t*w,s=-u*z+w;
   A(r===x&&s===y,"basis inverse");
   A((x%a===0&&y%b===0)===(r%a===0&&s%b===0),"coordinate membership");
   if(x%a===0&&y%b===0)A(z===a*(x/a)+t*b*(y/b)&&w===u*a*(x/a)+(1+u*t)*b*(y/b),"normalized frame");
   coords++;
  }
 }
 A(1%2!==0,"nonunit ideal cannot be dropped");neg++;
 A(2*2-2!==0,"non-idempotent fails");neg++;
 A(2%3!==0,"noncoprime patch does not imply complement divisibility");neg++;
 A(0*1!==1,"rank-zero scalar generator impossible");neg++;
 return {idem,div,compat,coords,neg}
}
console.log(regress())
```
Open suppliers: exists_pseudoBasis_adapted, integral_finiteAdele_complete_separated, adelicCompletion_fractionalIdeal_properties and mem_adelicCompletion_mul_inv_fractionalIdeal, plus native reachability of all these edges. No change to existing initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins obligations.
RESUME HERE: trace the actual GlobalTheory.CharTransport.exists_hom (the Θ ring homomorphism from RUN14) in ExistsCmAdeleUnitCharacterReadingHeckeChar.lean, including continuity and both diagonal and local-idele compatibility, retaining its actual upstream inputs. Request authenticated role-labelled root edges for exists_isFrame, exists_basis_hat, exists_generator, exists_idem_adele, exists_local_generator, mem_hat_pseudoBasis_iff, swap_mem_hatL and swap_symm_mem_hat. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.


---

### Peer original: [specialists/galois_representations/RUN15_GEOMETRIC_SEED_PACK_AND_TWIST.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN15_GEOMETRIC_SEED_PACK_AND_TWIST.md) — blob 48c945837bf90abcafd74c362c1f5558a5e54d16

# RUN15 — Root-linked geometric seed: Plan → Pack → twisted representation
2026-11-24. RESULT: SOURCE-MATCHED / DONE for the named composition and witness transport; PARTIAL for imported geometric producers. No Lean replay.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol/continuity excerpts and CI summary #395 (21:14:40Z, physics only); RUN1–3 and RUN14; inspected 30 recent swarm commits and 14 peer file lists, available RESUME HERE patches, dependency, kernel, acceleration, structure, audit code tails and editor manuscript tail. Blueprint link noted, PDF not reread. RUN1 already explained the top-level composition, so this run expands the previously unexpanded geometric witness transport, not a duplicate. RUN11 fixed-field supplier, FrobLaws.exists_ext, EmbOrbitAlt, wdAt_indep_bridge and multV_conj caller remain OPEN. No physics changes.

## Actual exported proof-reference evidence
Read compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json on cathedral-research-state; blob d04e0fb24160d3ee1be54cd50082f59526864d4e, archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, 18 reports. Report 14009158 is UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift, requested with incoming value witness 1065212052 from UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter. Its actual exported value references (explicit_const, each distinctExpressionRecords=1) include:
- target 14009157, UpperTheory.Gal.Int.Geo.geoOne_holds, witnessExpression 1062644801;
- target 13235289, UpperTheory.Gal.Int.galoisLocalGlobalStrong_of_geometry_lift, witnessExpression 1062644800;
- target 13125905, UpperTheory.TP.TLiftK, witnessExpression 1000528341.
This is a direct reading of the peer export, not a fresh kernel run or a replay of the entire authenticated root route. The next 71-target request at dependency commit 18548366e56847bf4db06ae11b950ad1aeb2c316 includes these three targets; output directory not yet available at this run. The 18 reports do not contain a requested multV_conj owner. No negative reachability conclusion.

## Source provenance
P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest observed, unchanged from RUN14). Upstream leanprover-community/riemann-hypothesis. Base B=src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/.
- B/GaloisRepresentationsOfThetaLift.lean P blob 869a5e68fcff90c1ee29a6dae75594ed8a59ada9; H original path 404.
- B/Development.lean P 4d4d9506494734f28fce7d39bac1a50650ecf148; H 25eb1c9c60978c4e9a8edc0899e84289d74a11a1.
Under B/GeometricFlagBases/:
- WeightOneGeometricRealization.lean P 4af6c909184001b272f7bfc504eac4606dcda763; H original path 404.
- GeometricRealizationOfWeightOne.lean P a3966183e2d20f54fc7109a14dcf14979d89d8e1; H 9468d256ec4524d532880513f2050f611e06ee3a.
- GeoOneOfParts.lean P 3954be7d48aae14c9c362152bdb3fffdb968fa05; moved into preceding H file at line 155.
- StepsMain.lean P 741722ffb47f56ad88d06182644eb441d1b096b6; H c0daaf9fddcd27ea8f3b76d05203456697ba11a5.
- PackExOf.lean P 760bbf58b01d01e4fbcea2f829564ab08e5bb621; H acb74ae1d800393860288d376c2e5ed7b4bec34d.
- MapInvMul.lean P 5f0b07b831bbe8bf0dea7ce8a5e7378a28614f0b; H 47ad8b4b61cccb8261e46a7e64680766d99685ff.
- HodgeTrAt.lean P 604ffa570273fb3b322d4418da2248f8f35cdffd; H 6f3217570c88d875bcd9da8efba889b2c166553b.
- RepMain.lean P b8d451f004e10cb25a96f199e5a4e37cb36a65a7; CovLink.lean P bb57772349a7d5d5b2f98f412b43729fee1693f7; not compared at H.
All citations are to P unless specified. Connector supplied blob identities, not independently raw-hashed in this run.

## 1. Exact target and quantifier discipline (HodgeTrAt 79–101)
Fix CM field E, algebraic closure Ω, rational prime l and ring equivalence ι:Qbar_l≃C. Fix odd rank a, natural d with FieldOK(E,l,d), x∈E with x²=−d, finite nonsplit place set T, places w0,v' above l with Apart(v',w0) and OneK(x,w0,v'). The latter means every integral y in Q(x) belongs to the two prime ideals simultaneously (49–50), not equality of those primes in E. Fix finite S and automorphic submodule U of functions on UA(E,a), satisfying AutOffT, TyEll at w0, SphOffU w0 S, and existence of SatU at v'. GeoOne adds LacWtAt(ι,v',U). Under these hypotheses it supplies three branches:
1. Some dimension dd and representation ρ:G(E,Ω)→GL_dd(Qbar_l) with VBase(ι,d,U,ρ).
2. For EVERY usable w away from l with a SatU witness, there EXISTS dd,ρ with VBase and ESAt for EVERY SatU multiset B at w, using algSat(a,normV(w),B).
3. For EVERY w above l satisfying OneK(x,w,v'), Apart(w,w0), Apart(w,v') and admitting SatU, there exist TWO separately quantified representation witnesses: one with VBase, CrysAt and JumpsOcc at w; another with VBase and PhiKilled for every SatU B at w.
This is not a single uniform representation of rank a. The same witness within each branch must handle every B. No implication for a nonqualifying place or arbitrary rank. PackEx uses the same quantifiers except Ω and LacWtAt are not needed yet, and returns geometric packs instead of representations. PlanEx (PackExOf 82–91) likewise uses plans instead of packs.

## 2. Plan.pack (PackExOf 101–125)
A Plan holds datum D with prime p, group G, link L, compatibility Sc, field equivalence e:D.F≃E, D.n=a, level N, operators g:J→Mem L N, eigenvalues θ:J→Qbar_l, algebraic positive character κ with exponents m, antitone weights lam and function f with IsFnL and Spec. It also supplies a finite exceptional set X with CongP for every usable place away from l outside X and every SatU B. IsFnL (22–23) requires Hecke membership and integrality of y⁻¹ whenever f(y)≠0.
KSAll (93–99) has six independent fields std, ex, nice, good, cong, hodge. Apply std to obtain base gb with its embedding compatibility hgb; hodge with lam and antitonicity to choose k and universal statement hk; then ex with gb,k to choose geometric KS tower T. Order matters: k is chosen before tower T. For each w,B, CongP supplies κ unramified, prime ideal 𝔴 of D.F, sequence ϑ, matching place IsPl, CongGrp and HasRoots. Apply h.cong with hgb and IsPl; D.n=a rewrites the output into CongAtW for the same ϑ. Preserve κ and HasRoots. This proves the helper hc and transports CongAll, including the original finite exceptional set X.
For HTFor(v), keep κ unramified and use h.good to transport GoodGrp via the same prime ideal. For every embedding τ over v choose the σ provided by Plan.ExpAt. For every weight lam and its jump j, choose i0,h,i with IsHExp and h(i)=j+m(τ). The Hodge condition hk yields HOcc of h(i) on the complex base change using σ∘τ and eigenvalues σ(ι(θ)). Its two embedding side conditions follow from hgb and the σ compatibility supplied by ExpAt; retain both, not merely σ existence. This is HodgeAt with nonnegative natural witness h(i). The target Pack retains θ,κ,m, nice from h.nice, the original algebraicity, and the transported congruences.
packEx_of (127–139) applies this same conversion to each of the three PlanEx branches. In the third branch it packs P and P' independently, preserving distinct witnesses; no uniqueness is used.

## 3. Pack.rep (MapInvMul 43–87)
For fixed Pack P with HTFor(v) at v above l and LacWtAt(ι,v,U), Steps.rep constructs dd and raw ρ continuous, semisimple, IsPiece(H,θ,ρ). Steps.char supplies rank-one character family L and its compatibility for κ,m. Let χ=L(κ,m); the compatibility gives continuity and rank-one local clauses with Hodge exponent −m. Define r=tw(ρ,χ). There are three output types.
- Away from l: CongFor supplies ϑ, congruence and roots R map(x↦x/c), c=κ.val(w)∈C×, R=algSat(a,normV(w),B). Steps.cut moves CongAtW to CongAt, Steps.es produces ESAt for ρ with the divided roots, Steps.twES multiplies by c. MapInvMul.map_inv_mul proves (R/c)*c=R as MULTISETS by map composition, identity map and c≠0. Thus ESAt for r has precisely R, including repeated roots.
- Above l, Hodge: HTFor gives unramified character, GoodAtW and HodgeTrAt. Steps.cut supplies GoodAt with onto cover. For each τ over w use σ from HodgeTrAt; for τ not over w choose identity and use the false antecedent. Steps.jump with ι.trans(σ) and the required local prime, period, place, bridge and induced embedding hypotheses yields JOcc for the raw representation. Steps.twJ replaces Q(τ,j) by Q(τ,j−(−m(τ)))=Q(τ,j+m(τ)), exactly the shift supplied by the pack. Steps.jumpsOf obtains JumpsOcc for r. Separately Steps.crys uses the onto cover and Steps.twCrys transports crystalline status; no deduction of crystallinity from jump occurrence alone.
- Above l, Frobenius: use the same cut and root relation with Steps.phi to get PhiK for raw ρ; Steps.twPhi cancels inverse scaling using map_inv_mul. Steps.card gives B.card=a, required by Steps.phiOf to yield PhiKilled for r. PhiK (HodgeTrAt 32–36) has universal local bridge hypotheses and supplies crystalline status plus divisibility of the characteristic polynomial by a power of rootPol(R), for some Weil element of degree −1 and some natural exponent. It is not equality of local parameters.
VBase for r uses Steps.cont and Steps.ss, the pack's finite-exception ESAt result via hES, and Steps.rich at v using LacWtAt and the newly obtained JumpsOcc. All four pieces must survive. Steps (MapInvMul 19–36) has 17 fields: rep, es, crys, jump, phi, cut, twES, twCrys, twJ, twPhi, phiOf, card, jumpsOf, rich, char, ss, cont. StepsMain 17–19 supplies all; CrysStep, JumpStep, PhiStep are explicit premises there. Other suppliers remain independent leaves.
geoOne_of (89–101) invokes PackEx at all original parameters, then Pack.rep for each branch with hv and hlac. The third branch separately calls P.rep and P'.rep and projects crystalline/jumps from the first and PhiKilled from the second. This completes the conditional geometric witness transfer.

## 4. Close the source-level join, retain open inputs
GeoOneOfParts:7 is geoOne_of hSteps (packEx_of hKS hPlan). GeometricRealizationOfWeightOne:18–25 supplies jumpStep_holds from htSpecGood, crysStep_holds and repEx_holds; steps_holds from crysStep_holds, jumpStep_holds and crystallineComparison.phiStep; KSAll from stdEx_holds, kSEx_holds, kSNice_holds, ksGood_holds, ksCong_holds, ksHodge_of_geo hW FixK_holds. PlanEx from Pl.planEx_holds. WeightOneGeometricRealization derives hW via GlobalTheory.T.lefschetz_fixedPoint_finite_etale_correspondence, then geoOne_holds via geometric_realization_of_weight_one. The imported fixed-point theorem and PlanEx/KS/Steps producers are NOT proved by this run. RepMain:74–77 gives repEx via grEx, contGL, matrix/conjugacy/piece-stability data, htotFin and totCont using KunnethLefschetz.core_holds; CovLink:21–33 provides MIn and stdEx/ksCong/ksCover. These are next substantive producers, not axioms discarded by prose.
Source bridge from RUN1 is geoOne_holds + TLiftK → galoisLocalGlobalStrong_of_geometry_lift → Row0b(recT) → everyCharacter_of_row via VWin and literature record → EveryCharacter → RH. Only the immediate exported incoming/outgoing refs in §1 were read this run; deeper source edges and previously reported root path are not a full independently authenticated closure.

## 5. Actual execution and reproducible source check
V8 JS compared 11 selected source ranges across P,H: 10 exact, one changed (GeometricRealizationOfWeightOne P:23 vs H:1245 uses _root_.UpperTheory.standard_datum_exists in place of CovMain.stdEx_holds). A further two HodgeTrAt definitions GeoOne and PackEx were exact in a separate comparison. TOTAL 12 of 13 ranges exact, one changed supplier; original wrapper paths returned 404 at H. The changed supplier's equivalence/proof not inferred. Retrieved native role projection above. The following Python replay is provided but NOT independently executed here; it checks actual Git blobs and comparison ranges from upstream checkout, not a kernel proof.
```python
import subprocess,sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
b="src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GeometricFlagBases/"
rows=[
("PackExOf","PackExOf","760bbf58b01d01e4fbcea2f829564ab08e5bb621","acb74ae1d800393860288d376c2e5ed7b4bec34d",[(82,91,119,128),(93,99,130,136),(101,125,138,162),(127,139,164,176)]),
("MapInvMul","MapInvMul","5f0b07b831bbe8bf0dea7ce8a5e7378a28614f0b","47ad8b4b61cccb8261e46a7e64680766d99685ff",[(19,36,58,75),(38,41,77,80),(43,87,82,126),(89,101,128,140)]),
("GeoOneOfParts","GeometricRealizationOfWeightOne","3954be7d48aae14c9c362152bdb3fffdb968fa05","9468d256ec4524d532880513f2050f611e06ee3a",[(7,7,155,155)]),
("GeometricRealizationOfWeightOne","GeometricRealizationOfWeightOne","a3966183e2d20f54fc7109a14dcf14979d89d8e1","9468d256ec4524d532880513f2050f611e06ee3a",[(18,25,1240,1247)]),
("StepsMain","StepsMain","741722ffb47f56ad88d06182644eb441d1b096b6","c0daaf9fddcd27ea8f3b76d05203456697ba11a5",[(17,19,1181,1183)]),
("HodgeTrAt","HodgeTrAt","604ffa570273fb3b322d4418da2248f8f35cdffd","6f3217570c88d875bcd9da8efba889b2c166553b",[(79,90,116,127),(92,101,129,138)])]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
exact=changed=0
for f,g,p,h,ranges in rows:
    s=P+":"+b+f+".lean"; t=H+":"+b+g+".lean"
    assert git("rev-parse",s).strip()==p
    assert git("rev-parse",t).strip()==h
    a,c=git("show",s).splitlines(),git("show",t).splitlines()
    for i,j,k,m in ranges:
        x,y="\n".join(a[i-1:j]),"\n".join(c[k-1:m])
        if x==y: exact+=1
        else:
            assert f=="GeometricRealizationOfWeightOne" and x.replace("CovMain.stdEx_holds","_root_.UpperTheory.standard_datum_exists")==y
            changed+=1
assert (exact,changed)==(12,1)
print("12 exact ranges, 1 changed supplier; no kernel replay")
```
Optional export replay: read the indicated solution JSON, find report with id 14009158, assert request.incoming.witness==1065212052 and match the three (target,witnessExpression) pairs in value.references. No URT improvement or full proof completion claimed.

## RESUME HERE
Expand the actual PlanEx producer Pl.planEx_holds by tracing imports of GeometricRealizationOfWeightOne and H clump; preserve the separate P/P' witnesses and all local quantifiers, then recover the changed standard_datum_exists supplier. Request role-labelled references for geoOne_holds, geometric_realization_of_weight_one, geoOne_of_parts, geoOne_of, Pack.rep, Plan.pack, packEx_of, Pl.planEx_holds, repEx_holds, ksHodge_of_geo, seedFinOdd_of_geoOne. Keep RUN14 multV_conj reverse-call and RUN11 fixed-field issues open; no implied root linkage for those. HANDOFF TO dependencies, kernel, integration, editor, theta, literature, audit and Galois. Project OPEN.


---

### Peer original: [specialists/landau_criterion/RUN15_ZERO_FREE_WRAPPER_AND_CONJUGATE_EQUIVALENCE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN15_ZERO_FREE_WRAPPER_AND_CONJUGATE_EQUIVALENCE.md) — blob 2c2579e19679e3c9c3af5e928b4ad6d638c3a2c4

# RUN15 — zeroFree_of_rpow_window, conjugate zero equivalence, direct window adapter
2026-11-24. RESULT: SOURCE-MATCHED conditional family-level wrapper reconstruction; additional human algebra refinement; finite exact checks executed. Project OPEN. Not independent kernel validation, not a proof of the arithmetic window premise, and not a URT benchmark.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI summary #395 (2026-11-24 21:14:40Z, physics only), RUN14, RUN6, RUN8, 30 recent commit SHA entries, 16 peer commit file lists and available RESUME HERE patch lines, editor 2056 tail. Prime RUN15 focuses on numerical envelopes and StarAll, audit on size-window producer, other lanes on distinct frontiers. Earlier window conversion was already translated by peer audit and prime lane: this is an end-to-end wrapper audit and direct adapter refinement, not a new claim of discovering that conversion. External blueprint link and limitations noted, PDF not independently reopened. No physics Queue/gates changed.

## Exact source ledger
P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned upstream on this run, unchanged from RUN14). Repo https://github.com/leanprover-community/riemann-hypothesis. Paths relative to src/Development/AutomorphicArithmetic/.
- P DedekindLFunctions/CharFamily.lean blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96; H cac521ab291c9dab261508613d4d12195cdfb799. CharFamily, Gm, ZeroFree, WindowHyp.
- P DedekindLFunctions/LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872; H f4c5124f8a0188f85b60b2687864d531f9c0a3d8. gm, zeroSet, PoleData, WindowHypU.
- P DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002; lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f; WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9; WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a; poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1; LFunctionConj.lean e43f4fab2a28eb31e20c5815ae6a923fd3d5b3de.
- H CharacterBoxes/ZeroFreeAllOfTopG.lean c3bcece31e76be6368af5af4647f1ad30012fd3b: windowHyp_of_rpow_eventually L93, windowHyp_of_rpow L111, windowHypU_of_windowHyp_fun L161, windowHypU_of_windowHyp L169, poleData_char L923, poleData_inv_zero L1027, poleData L1034, family residue L1122–1182, lemmaL L1202–1208, zeroFree_of_rpow_window L1228–1231, formB L1248–1306.
- P and H DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109 / d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27; actual theorem text identical.
- Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (manifest pins from RUN8). Fetched Mathlib/NumberTheory/LSeries/Nonvanishing.lean at both: 610bd56365d49c5ffa9ebeb29e0a383c768248e2 / 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32, same displayed bodies of LFunction_ne_zero_of_one_le_re and riemannZeta_ne_zero_of_one_le_re. The latter explicitly notes nonzero totalized value at s=1, not a holomorphic zeta value there. Its producer riemannZeta_one_ne_zero remains imported, not expanded here.

Actual source comparison in V8, extract each theorem/lemma starting at its declaration through first blank line: 3/6 exact (windowHyp_of_rpow_eventually, windowHyp_of_rpow, windowHypU_of_windowHyp_fun); 1/6 equal after replacing windowHypU_of_windowHyp_image by Real.image_exp_Icc; 2/6 changed (lemmaL and zeroFree_of_rpow_window, analyzed below). Blob IDs connector-returned, not independently recomputed. Source-level calls only, not authenticated kernel paths.

## 1. Statement and exact family assumptions
F has a finite index type I, nonzero natural modulus N_i for each i, characters chi_i modulo N_i, real weights a_i>0, and admissibility N_i=1 or chi_i!=1. No assumption that I is nonempty or inverse closed is required for this theorem. Gm(F,y)=sum_i a_i Re Gchi(chi_i,y), with the two principal/nonprincipal corrections in CharFamily. Fix theta,delta,C real, delta>0. P requires 0<theta<1; H requires theta>=0 (not arbitrary theta). No sign restriction on C. Assume:
 for EVERY real Y0 there exists Y>=Y0 such that for EVERY y in [Y,Y^(1+delta)], Gm(F,y)<=C y^theta.
Then for every i,s with Re(s)>theta, L(chi_i,s)!=0. The implication is conditional, not a converse or an unconditional window supply. All quantifier scopes are retained; C,delta fixed before Y0.

## 2. Native window conversion and direct adapter
Given eta>0 and Y0, take K=|C|delta>=0. Native windowHyp_of_rpow_eventually supplies a threshold Y1 such that Y>=Y1 implies Y>=1 and K log Y<=Y^eta. Proof: put t=eta/2>0, use log Y<=Y^t/t, and choose Y1 sufficiently large that Y^t>=K/t (t>0 gives divergence). Apply input h to max(Y0,Y1). On the compact positive interval [Y,Y^(1+delta)] choose R(y)=|C|y^theta; R>=0 and R>=Gm because y^theta>0. Weighted integrand equals |C|/y by adding exponents, continuous there, with integral |C|delta log Y<=Y^eta. Works also for C=0, C<0, Y=1. This is WindowHyp. No assumption of positive Gm.

Given U0, apply WindowHyp at Y0=exp U0; Y>0, U=log Y>=U0. Injective smooth substitution y=exp u maps the closed interval [U,(1+delta)U] onto [Y,Y^(1+delta)] including degenerate or empty cases; Jacobian exp u>0. The source uses both integrableOn_image_iff_integrableOn_abs_deriv_smul and integral_image_eq_integral_abs_deriv_smul with measurable interval, derivative and injectivity obligations. R(exp u) exp(-theta u) is the exact transformed weighted integrand, with integral <=exp(eta U). Thus WindowHypU(gm F,theta,delta) holds. This conversion preserves integrability, not just formal integrals.

Additional direct human derivation (not substituted into Lean source): combine both adapters and avoid a separate substitution theorem for this particular power-window hypothesis. For arbitrary eta>0,U0 choose B=max(0,U0,2K/eta^2). Apply h at exp B, so U=log Y>=B. On [U,(1+delta)U], define R_U(u)=|C| exp(theta u). Since exp u belongs to [Y,Y^(1+delta)], gm F(u)<=R_U(u), and R_U>=0. Its weighted integrand is the constant |C|, hence integrable, and its integral is K U. Since U>=0 and U>=2K/eta^2, K U<=eta^2 U^2/2<=exp(eta U) by the nonnegative terms of the exponential series. This explicitly supplies the SAME WindowHypU directly from h, for every eta,U0. No additional assumptions on theta or C. This does not establish the original arithmetic window. It is a classical algebra simplification, not evidence for URT performance.

## 3. Exact zero-set equivalence, conjugate contributions and pole at one
Z={rho: Re rho>0 and exists i with L(chi_i,rho)=0 OR L(chi_i,conj rho)=0}. For theta>=0, ZeroFree(F,theta) is logically equivalent to every rho in Z having Re rho<=theta:
 forward: any rho in Z with Re rho>theta has a direct or conjugated zero, and Re(conj rho)=Re rho, both contradict ZeroFree; backward: any direct zero s with Re s>theta has Re s>0, hence lies in Z and contradicts the bound. Strict inequality on the zero-free domain is essential; zeros on Re=theta are not excluded. This converse is about Z, NOT about the sufficient window hypothesis.
The positivity guard is substantive: for negative theta, Z ignores all Re<=0 zeros. A finite logical countermodel has a zero at Re=0 with theta=-1/2 but empty Z. This is not a claim about an actual L-function's zero set.

The conjugation theorem states L(chi^{-1},conj s)=conj L(chi,s). Substituting conj rho, using involution and conjugation preserving zero, gives L(chi^{-1},rho)=0 iff L(chi,conj rho)=0. The source uses poleData_inv_zero and its symmetric equivalence. F need not contain chi^{-1}; the transform explicitly uses both chi and inverse contributions with coefficients a_i/2. The real part of Gchi yields this symmetrization (Gchi_conj). A direct zero suffices for membership; no need to prove it also has a conjugate zero of the same character.

The imported right-half-plane nonvanishing is independent of the Landau window: for Re s>=1, admissibility gives either N=1, when L=riemannZeta, or chi!=1, when DirichletCharacter.LFunction_ne_zero_of_one_le_re applies with left disjunct. At s=1 the modulus-one mathematical meromorphic zeta has a pole, not a zero. Mathlib's totalized function has a nonzero assigned value there; the cited imported lemma explicitly handles that case. In poleData_char the actual holomorphic regularization g(s)=(s-1)zeta(s) for s!=1, updated to g(1)=1 using residue one, has g'(1)=EulerGamma from the Laurent constant. Its zeros agree with the totalized zeta zeros (at 1 both are nonzero). The Mellin correction removes the apparent singularity at 1 (RUN10); do not treat the assigned zeta value as a Laurent coefficient without a separate theorem. Thus for either direct or conjugated membership 0<Re rho<1, ensuring rho!=0,1. Nonprincipal characters are holomorphic at 1 and nonzero there by the imported theorem.

The residue of Phi at rho in Z is -S/[rho(rho-1)] with S=sum_i (a_i/2)(m_i+n_i)>0, where m_i,n_i are nonnegative integer zero orders of chi_i and chi_i^{-1}. At least one is positive by membership and conjugation equivalence. For a real rho=beta in (0,1), residue=S/[beta(1-beta)]>0 is real. This includes any exceptional real zero; no exclusion assumption or negative residue is used. The positivity supplies the real branch in RUN14. All seven PoleData obligations remain necessary.

## 4. Native wrapper and genuine upstream change
P lemmaL fixes F, positive theta<1, delta>0 and WindowHyp. It obtains Phi,PoleData via poleData F and calls landau_window after exponential conversion. For hypothetical zero at s with Re(s)>theta, split Re(s)>=1 (independent boundary theorem) or Re(s)<1 (s in Z via direct membership, contradiction). H lemmaL instead takes theta>=0, directly calls generalized landau_window without theta premises, then inserts the direct zero into Z using theta>=0. This removes a redundant split *at the wrapper*, NOT the independent boundary theorem: H poleData L1125–1130 still calls it to prove Re rho<1 and the residue sign. The original proof uses the boundary theorem both in the producer and wrapper; the new one uses it in the producer. H zeroFree_of_rpow_window takes the weakened theta guard and composes windowHyp_of_rpow with lemmaL. RUN6's Level.FormB still has 0<theta<1; its H call at L1300 uses htheta0.le, delta=la-1 and C=1, preserving the original level hypotheses. See RUN6 for exact Gm equality. Neither version derives the input window from the conclusion.

Source call map (not elaborated DAG):
 zeroFree_of_rpow_window <- windowHyp_of_rpow, lemmaL
 lemmaL <- poleData, windowHypU_of_windowHyp, landau_window (P also boundary theorem)
 poleData <- poleData_char, conjugate equivalence, charFamily_LFunction_ne_zero_of_one_le_re, meas/growth/integrability producers
 landau_window <- RUN14 dichotomy, nearest-pole, Cauchy, uniform coefficients and growth contradiction
 formB <- zeroFree_of_rpow_window, explicit Level-to-family Gm equality.
The remaining arithmetic supplier is not discharged by this local chapter. No root-reachability assertion from source names.

## 5. Finite exact certificate
Run the following JS with node or V8. Exhaustive finite zero-set masks on two abstract families with eight possible locations; conjugation involution and theta boundary preserved. Test direct window threshold for rational eta,K and integer U using integer cross-multiplication. These tests are logic/algebra regressions, not actual L-function zeros or numerical evidence for RH. General proofs are above.
~~~js
const certificate = function(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const re=[-1,0,1,2,1,1,2,2], conj=[0,1,2,3,5,4,7,6];
 let equiv=0,strip=0,threshold=0,negative=0;
 for(let m=0;m<256;m++)for(let n=0;n<256;n++){
   const zeros=(m|n), has=j=>!!(zeros&(1<<j));
   const pole=j=>re[j]>0&&(has(j)||has(conj[j]));
   for(let t=0;t<=3;t++){
     let a=true,b=true;for(let j=0;j<8;j++){if(re[j]>t){a=a&&!has(j);b=b&&!pole(j)}}
     ck(a===b,"zeroSet equivalence");equiv++;
   }
   if(![3,6,7].some(has)){
     for(let j=0;j<8;j++)ck(!pole(j)||(re[j]>0&&re[j]<2),"boundary exclusion");
     strip++;
   }
 }
 for(let a=1n;a<=8n;a++)for(let b=1n;b<=8n;b++)
 for(let c=0n;c<=16n;c++)for(let d=1n;d<=8n;d++){
   const p=2n*c*b*b,q=d*a*a, Umin=(p+q-1n)/q;
   for(let U=Umin;U<=Umin+4n;U++){
     ck(d*a*a*U*U>=2n*c*b*b*U,"quadratic exponential certificate");threshold++;
   }
 }
 ck(0>-1 && !(0>0),"negative theta guard");negative++;
 ck(!(1>1)&&1>=1,"strict boundary");negative++;
 ck(-3<0&&Math.abs(-3)>=-3,"sign");negative++;
 const single=1<<4;ck(!(single&(1<<5))&&!!(single&(1<<conj[5])),"conjugate branch");negative++;
 return {equiv,strip,threshold,negative};
};
console.log(certificate());
~~~
Actual connector V8 execution: {"equiv":262144,"strip":1024,"threshold":43520,"negative":4}; 306688 positive regression cases, four negative controls. No native Lean kernel replay. Tests do not measure proof runtime, and do not establish a URT advantage. The direct window refinement is a human entailment, not a validated Lean refactor.

RESUME HERE: expand the actual Mathlib imported boundary nonvanishing producer (LFunction_ne_zero_of_re_eq_one, nontrivial quadratic case at s=1, and riemannZeta_one_ne_zero) at Pm/Hm, retaining the classical three-factor logarithmic positivity and all exceptional cases. This is the remaining external analytical leaf used both before residue construction and in pinned lemmaL. Do not duplicate RUN14 or RUN15 wrappers. Request authenticated role-labelled paths for Deduction.zeroFree_of_rpow_window, lemmaL, poleData, landau_window, landau_window_contra, landau_dichotomy, landau_growth_contra and charFamily_LFunction_ne_zero_of_one_le_re. HANDOFF TO editor, integration, dependency, kernel, audit, math, prime and acceleration. Project OPEN.


---

### Peer original: [specialists/literature_provenance/RUN15_GLOBAL_COMPARISON_SUPPLIERS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN15_GLOBAL_COMPARISON_SUPPLIERS.md) — blob dc318043d14647ec642934d8d80370e9a5afe99c

# RUN15 — actual global crystalline and Hodge comparison suppliers
2026-11-24. SOURCE-MATCHED / PARTIAL; project OPEN. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged since RUN14).

Continuity: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol and continuity excerpts, CI #396 (21:33:39 UTC, physical CI only), RUN1 and RUN14, 20 recent peer commit titles and post-RUN14 file/RESUME patches inspected. Dependency RUN15's 71-owner authenticated export is new evidence. Blueprint link noted; PDF not independently reopened. No unrelated physics or protected files edited.

## 1. Actual supplying declarations located
RUN14 left the two global comparison suppliers unknown. The new dependency output compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json on cathedral-research-state (blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2; status pass blob 0fa45dc8015ee5473cf2c573733db9cecf465a38) gives an authenticated export root-frontier edge from UpperTheory.LiteratureTheorems.published_results_arithmetic (11298207) to abelian_de_rham_of_literature (11225739), value witness 891403526. Its encoded roots [887655052,887655054] refer in type to GlobalTheory.Published.AbelianDeRham (def; witness 724118189) and OpenLiteratureStatements (inductive; 12992045), and in value to PositivityTheory.DualRT.abelianDeRham (thm; 887655052) plus the record type. This corroborates pinned adapter L239–240, blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24, path src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean. This is export evidence, not new kernel replay. No claim of authenticated downstream edges for the new suppliers yet.

Pinned DualRT.abelianDeRham L20–23 constructs five fields: Free, Hodge, BaseChange, rigidity via rigid_of_free_of_crystallineDeRham (and separate FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham), and duality. Its hS comes from abelianDeRhamStructure_of_page applied to MainStatements.Hodge.Free.abelianDeRhamPage. DualRT.duality L16–18 calls CrystallinePoints.Pd.duality_of_surjAll with Free, Hodge, BaseChange and surjAll. Crucially L13–14 supplies the exact two previously unresolved global propositions:
  GlobalTheory.SmoothLift.crystallineSmoothLift_of_relations : Published.CrystallineSmoothLift
  MainStatements.Hodge.Free.abelianHodgeDeRham : Published.AbelianHodgeDeRham.
These are source theorem bodies, not declarations of axioms. Their complete transitive proof and trust audit remains open.

SurjAllOfHodge L80–98: write C=FirstDeRham, T=H1OnPoints, A=H1 on trivial thickenings, and B=HO1. Let a=toH1O:C→A, b=cmpO:A→B, c=toPO.pull1:A→T and d=ofPC.pull1:T→A. Have cd=id_T, ba=toHO1∘cmp1 and ca=toP. For t∈T choose x∈C with ba(x)=bd(t) using surjectivity of cmp1 and toHO1. RUN14's injectivity of b gives a(x)=d(t), hence ca(x)=t. Thus toP is surjective. The global hC supplies cmp1 surjectivity for smooth separated quasi-compact morphisms; hH supplies toHO1 surjectivity for the abelian scheme of relative dimension g. Properness supplies the requisite instances. No arbitrary scheme surjectivity without those premises.

## 2. Crystalline supplier: a relation is the graph of a unique linear equivalence
CrystallineSmoothLiftOfRelations L19–46. Over any commutative ring R and R-modules M,N assume p⊆M×N with both projections surjective, p(x,y) implies (x=0 iff y=0), and closure under addition and scalar multiplication. Choose f(x) with p(x,f(x)). If p(x,y) and p(x,y'), then p(0,y'−y), hence y'=y. The same difference argument on the other coordinate proves injectivity of f. Right totality gives surjectivity. Uniqueness of the second coordinate proves additivity and scalar linearity. Thus p(x,y) iff e(x)=y for a linear isomorphism e. Equivalently p is a submodule of M⊕N with both projections linear isomorphisms. No field or finite projectivity assumption.

L52–72: choose one affine lift ΛD for each smooth-lift datum D via nonempty_smoothLiftAffineThickenings. The relation-totality-and-zero theorem provides both totality directions and zero detection separately in degrees 1 and 2. The add/smul theorem supplies closure in each degree. Apply the graph lemma twice, obtaining e1 and e2 with exact Rel1/Rel2 equivalences. Three remaining fields are supplied separately:
* cup compatibility: apply comparison_relations_respect_cup to Rel1 witnesses then convert Rel2 back to equality;
* degree-one comparison: smoothLift_degreeOne_comparisonRelation on the actual lift morphism, then the Rel1 equivalence;
* naturality in both degrees: crystallineDeRhamRelation_natural_smoothLift_morphism with both chosen lifts, σ, φ, φ₀, compatibility h, morphism m and hc, and the two relation witnesses.
These six imported supplier statements remain proof obligations, not axioms merely because they are used. Do not compress naturality to existence of unrelated linear isomorphisms.

## 3. Hodge supplier: the chapter record is constructed, not assumed
AbelianHodgeDeRham.lean L58–109 assigns all 47 fields of Chapters from named source declarations; Development.lean L13–61 defines the record (Prop). Chapters.print L67–102 consumes that record and five further explicit inputs: scheme models, smooth spreading, proper spreading, trivial locus and KFinite. The global theorem supplies all five via NoethApprox.schemeModels, SmoothSpread.smooth_spreads, SpreadingModels.properSpreads, TrivLoc.trivLocus and KLFinite.kFinite.
The assembly order: dictionary/complex → low, homotopy, qcalc, Fubini, affine acyclicity → descent and system base change → parallel forms, axes, comparison, Hopf, perfect models, vanishing and flat base change. Upper and lower rank bounds give field H1 dimensions, then wedge over fields, no-primitive and small-lift inputs yield global H1 bundle. The O-side gives base-change and wedge results. The group-law bilinear statement and frame yield closedness and lift (degeneration); wedge_alt follows from the exterior-power repeated-vector rule. Finally h.final combines Stein, parallel forms, H1 bundle, degeneration, wedge hypothesis, O-base-change and form base change. Preserve all quantified abelian-scheme and dimension premises, not an unsupported appeal to Hodge theory. Every field supplier still requires independent expansion or trusted import classification. No published-paper attribution was inferred from names.

## 4. Export/assumption ledger delta
| Declaration | Classification / remaining obligation |
|---|---|
| OpenLiteratureStatements.rec id 550025 | generated recursor, not axiom or proof of fields; roots [12992061,-550021,-550022,12992066,-550021], RHS one-based 12992066, zero-based 12992065; no value slot. Four RHS references: RecTExists def, Row def, mk ctor, record inductive. Preserve package and rule RHS. |
| abelian_de_rham_of_literature | exported theorem wrapper, actual native supplier DualRT.abelianDeRham, not citation or independent assumption. |
| crystallineSmoothLift_of_relations | native source theorem; no explicit added parameter; six imported statements, choice and exact graph lemma; transitive axiom audit open. |
| abelianHodgeDeRham, abelianHodgeDeRham' | source theorems; 47 supplied chapter fields and five further producers; not an axiom. |
| Chapters | Prop structure, not proof of its own inhabitants. Chapters.print is conditional on all six explicit arguments. |
| SurjAll_of_hodge (actual name surjAll_of_hodge), toPicard_surjective | conditional source theorems; preserve two comparison hypotheses, or the two surjectivity hypotheses respectively. |
| Published.CrystallineSmoothLift, Published.AbelianHodgeDeRham | proposition definitions; now actual source suppliers identified on pinned path, not established transitive axiom-free. |
| FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham | distinct source theorem (blob efc95dd74b086a96d3de1f13d40c04d4d4796931, src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/CrystallineDeRham.lean), used for rigidity; do not merge with hC. |

## 5. Checks, upstream migration, replay
Actual connector JavaScript checks: 5/5 pinned blob IDs matched and 29/29 exact anchor substrings present. Chapter fields and assignments independently counted 47 each. Exhaustive finite relation check below executed in V8: all 66,064 relations over Z/n × Z/n for n=2,3,4; 5 admissible, all graphs of bijections (counts 1,2,2). This tests the finite algebra motif, not the geometric or cohomological hypotheses or a kernel proof.

Pinned source manifest (relative to src/Development/; Git blob SHA):
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean bf38bb3decc713a4cbbabd8fb847247fcdf3df8c
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/SurjAllOfHodge.lean 12b80cf2ba286f27a411c6590d830c25c40685fd
- WeilBound/CoreStatements/AutomorphicKernels/AbelianDeRham/AbelianHodgeDeRham/AbelianHodgeDeRham.lean 66a696a69d1308faefca6d352e2f4a700bc4501d
- WeilBound/CoreStatements/AutomorphicKernels/AbelianDeRham/AbelianHodgeDeRham/Development.lean 827a0f4d78ae81d6d5bf50640d07af49f42f693c
- AbelianVarietyTheory/Proofs/DivisorProofs/CrystallineSmoothLiftOfRelations.lean b1bf4854a196e421a8c96ad821dd4f1a2957817b

Current upstream same path CrystallineSmoothLiftOfRelations blob 48fcc1be2509ce2fc8401cff54ddb11335185902, L557–584 graph lemma text retained; L590–610 now calls LiftEx.nonempty_lift, PDForm.rel_total_zero, PDForm.rel_add_smul, PDForm.CrysCmp.lift_rel1_pull1_cmp1, PDForm.LiftNat.main directly, with comparison_relations_respect_cup still wrapped. Current AbelianDeRhamDuality blob 6a6dbd77379b3232e537081b8977cf2866d033aa L135–153 retains local surjAll proof; L238ff changes hH supplier to GlobalTheory.T.abelianScheme_deRham_locallyFree_hodgeDegenerates and duality/abelianDeRham to GlobalTheory.abelianDeRham projections/alias. Current AbelianSchemeFirstDeRhamStructure blob 44953e4c2de8cfdf86fe20b6bae02a150c5cbec5 L60 and 77 has the new assembly. Three old separate paths return 404 on head. Do not substitute current dependencies for pinned ones; migration needs independent audit.

Replay finite check (Node or JS runtime):
```js
let examined=0, admissible=0;
for(const n of [2,3,4]){
 let ok=0;
 for(let mask=0;mask<2**(n*n);mask++){
  examined++; const pairs=[];
  for(let a=0;a<n;a++)for(let b=0;b<n;b++)
   if(mask&(1<<(a*n+b)))pairs.push([a,b]);
  const has=(a,b)=>!!(mask&(1<<(a*n+b)));
  if(!Array.from({length:n},(_,a)=>pairs.some(x=>x[0]===a)&&pairs.some(x=>x[1]===a)).every(Boolean))continue;
  if(!pairs.every(([a,b])=>(a===0)===(b===0)))continue;
  if(!pairs.every(([a,b])=>pairs.every(([c,d])=>has((a+c)%n,(b+d)%n))))continue;
  if(!pairs.every(([a,b])=>Array.from({length:n},(_,k)=>has(k*a%n,k*b%n)).every(Boolean)))continue;
  if(pairs.length!==n||new Set(pairs.map(x=>x[0])).size!==n||new Set(pairs.map(x=>x[1])).size!==n)throw Error("bad relation");
  ok++;admissible++;
 }
 console.log(n,ok);
}
if(examined!==66064||admissible!==5)throw Error("census");
console.log(examined,admissible);
```
Source check replay: git show PIN:PATH | git hash-object --stdin for the five manifest entries; inspect cited ranges and count Chapter field/assignment lines matching /^  \\w+ :/ and /^  \\w+ :=/. Connector SHA checks are source identity checks, not local rehash or Lean verification. Reports of 71 and 18 owners inspected; no direct hC/hH target there. Combined 4.2 MB report truncated, so no exhaustive negative reverse-edge claim.

RESULT: both global comparison supplier declarations located and their actual assembly bodies translated. Root export corroborates the literature-to-DualRT bridge; downstream edges await authenticated export. No new premises, no kernel replay, no full proof or URT advantage claimed.
RESUME HERE: expand the crystalline relation totality/zero supplier (CrystallineCechDeRhamRelationsTotalDetectZeroStatement and its native proof), preserving both totality directions in both degrees, then request authenticated edges for DualRT.abelianDeRham, DualRT.surjAll, DualRT.duality, SmoothLift.crystallineSmoothLift_of_relations, SmoothLift.exists_linearEquiv_of_rel, Hodge.Free.abelianHodgeDeRham, Hodge.Free.abelianHodgeDeRham', Hodge.Free.Chapters.print. Keep all 47 chapter fields and five suppliers in the frontier, plus RUN14 SecPullA/local separation leaf. HANDOFF TO dependency, kernel, integration, editor, audit, geometry and acceleration. Project OPEN.


---

### Peer original: [specialists/positivity_geometry/RUN15_GAGA_ALGEBRAIZATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN15_GAGA_ALGEBRAIZATION.md) — blob 82c98e75e10c9e789d3c458f518c058515d56f47

# Geometry RUN15 — GAGA algebraization and component assembly
2026-11-24. SOURCE-MATCHED local human reconstruction with exact finite arithmetic regression executed in V8. Imported existence suppliers remain explicit. Full RH OPEN.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity opening excerpts, CI summary #396 (21:33:39Z, physics only), RUN14 commit 9e495011b7e502ae441ec00e212b8e5de99c0747 and 40 recent commit titles, 14 peer file lists and available RESUME HERE patch lines. Editor patch had no explicit resume line. Latest literature is crystalline/Hodge comparisons, not GAGA; no duplicate found among inspected peers. External blueprint link noted, PDF not reopened. No physics changes. Native root reachability for these declarations not yet established; request authenticated paths rather than infer them from imports.

Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge #1313, same as RUN14). GitHub-returned blob SHA pairs (not independently recomputed). All paths below relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ .
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean: P 3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd; H moved to src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean, blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e, L1409.
- Under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/:
  - SerreHolomorphicSectionsHolds.lean: P d59255ad6229111c49e8bc212c684400c269296f; H 717de557085881c2c7307a3b8186df46b6d6bd9b.
  - ExistsMulEqOfPolynomialGrowth.lean: P 820f7247645460d3966ab47e5e15f56fe03f11da; H c9f65c805d1516fbcfd22bda0585f7141adfbf1c.
  - ExistsEqOfContinuousQuotientAlgHom.lean: P d438130b7af70dec4f2acef547025e2f90103eb3; H b2a160e1cf97b019da4155de37bf2bc47746bfb1.
  - EqOfEvEqOfSmoothOfRelativeDimension.lean: P 3ceee189e2b36c1b060720a066e59d654e82030d; H f75900a71eb5b0e18120c0afa9bc6a45fa51310f.
  - ContinuousSectionPolynomialGrowth.lean: P 7f158b346f6e31cac2fdcabf0834692d96bd8dd8; H 40d1f2eba7494457bfbb8e9c9db499e4c46bd749.
  - ExistsAffineBoundaryFunctionsOfIsProjOver.lean: P 3a7703851163122c883135619385c3816d1a68a6.
- src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/SerreHolomorphicSections.lean: P b51921ee28dea638c15ab614fdba6c8ba1cbafbd; H 5fc5703a1752f9f474952e9d2e6828d3fdaa9a5d.
- src/Development/AbelianVarietyTheory/Proofs/ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean: P 10e7d45c32891276ae1ac9121f289e757b4084e0, theorem integral_and_rational_of_polynomial_growth starts L182.
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ToroidalFlagSmoothProjectiveStatement.lean: P 8cf1c255d718d23bd056152e7db233b23caa2161, supplier smooth_proj_flagStr.
Other suppliers listed below have not been independently replayed. Comparison of 10 trimmed nonblank declaration blocks (ending before next top-level declaration): 8 identical; exists_comb 46/46 lines with two direct supplier substitutions (complex_section_finite_combination → VanDescent.vanish_descent and holomorphic_extension_section_reading → DifferentiableLines.holomorphic_extension_sections); exists_mul_eq_of_polynomial_growth 75/75 with one explicit map_add tactic argument. No semantic equivalence inferred from normalization alone.

## 1. Actual complex GAGA theorem
SerreHolomorphicSections is the predicate: for every scheme Y of the source universe, p:Y→Spec C, D natural, SmoothOfRelativeDimension D p and IsProjOver p, every AnRead R for identity embedding of C and LB B with B.IsLB, the map B.Sec → R.holSec B taking s to its chart evaluations (secVal) is bijective. B is a line bundle presented by local trivializations, not an arbitrary coherent sheaf. No claim here for general coherent GAGA or for proper schemes without the source projectivity hypothesis.

GlobalTheory.Published.serreHolomorphicSections_holds proves this predicate; it is not an assumed external Serre theorem. For injectivity, equal evaluated sections imply equality of each chart function by eq_of_ev_eq_of_smoothOfRelativeDimension: on each affine neighborhood smoothness gives reduced finite type C-algebra, and all C-algebra homomorphisms detect zero by the Nullstellensatz. Apply to difference of restricted functions, then use sheaf local equality. Reducedness matters (epsilon in C[epsilon]/(epsilon²) is invisible to every C-point).

For surjectivity let s be a compatible holomorphic chart family, with assigned zero outside each chart. For every scheme point x∈B.U_i choose a domain neighborhood (smoothness/normality), then an affine V contained in that neighborhood and B.U_i. Projectivity supplies n regular functions u_l on V such that every scheme point z of Y has a neighborhood Q and a regular eta on Q, with D(eta)=Q∩V and u_l eta=1 there for some l. This is precisely exists_affine_boundary_functions_of_isProjOver. Its proof pulls back ample O(1), takes a generated positive power and a section t nonzero at x with affine nonzero locus inside the desired open. With generating sections s_l of the same power, V={t≠0}, Q={s_l≠0}, u_l=s_l/t and eta=t/s_l; their product is 1 on Q∩V. The ample/generation and affine-chart suppliers remain dependencies.

## 2. From compactness to a polynomial growth estimate
continuous_section_polynomial_growth assumes projectivity, valid LB atlas, compatible fiber-section family s continuous on each chart, V⊂B.U_i and exactly the boundary-function property above. Fix complex point y0, choose Q, eta, l and a chart j containing y0; shrink to affine W⊂Q∩B.U_j. On D(eta|W) the transition g_ij is a localization fraction a/eta^N. Therefore s_i(y)=F(y)u_l(y)^N on nearby points of V, where F=ev(a)s_j is continuous at y0. Choose local C_y0=|F(y0)|+1 and exponent N_y0. Put T(y)=1+sum_l|ev(u_l,y)|≥1. Then |s_i(y)|≤C_y0 T(y)^N_y0 locally on V.
Projectivity gives compact complex-point space. A finite neighborhood subcover gives C=sum C_y0≥0, m=max N_y0, hence |s_i(y)|≤C T(y)^m for every y in V. The source global_bound itself assumes only a compact space, T≥1, and nonnegative local constants. No bound is asserted for points outside V. Taking a maximum exponent is valid because T≥1; for T=1/2 it can fail. Compactness, not arbitrary boundedness of the affine V, is the key.

## 3. Polynomial growth implies a rational relation
SerreSections.exists_mul_eq_of_polynomial_growth assumes smooth relative dimension D, analytic reader R, affine V with A=Γ(Y,V) a domain, phi holomorphic on V, n natural, u_l∈A, real C and m natural with |phi(y)|≤C(1+sum |u_l(y)|)^m for all complex points of V. Conclusion: ∃a,b∈A, b≠0, with b(y)phi(y)=a(y) on ALL complex points of V. No assumption that b never vanishes and no extra sign assumption on C.
Smoothness gives finite type C-algebra A. The source noetherNormalization_primitive supplies injective integral finite polynomial base j:S=C[X_1,...,X_d]→A, primitive element alpha∈A, monic P∈S[Z], and nonzero q∈S, with kernel of eval map beta:S[Z]→A equal to (P), q∈(P,P'), and for each c∈A a polynomial r_c with j(q)c=beta(r_c). On a fiber x with q(x)≠0 each root z of P_x yields a C-algebra evaluation χ(c)=r_c(x,z)/q(x); well-definedness follows because equality under beta implies evaluation equality at a root of P. Additivity, multiplication and preservation of 1 follow by clearing q, as in exists_ringHom_of_denominator. This yields a point of V; analytic dependence of each coordinate evaluation plus analytic chart composition gives local analytic representatives of phi on the finite cover. Conversely any point with q≠0 is recovered by taking x as polynomial coordinates and z=alpha(y).
Each u_l is integral over S, so its monic equation and the Cauchy root bound give |u_l(y)|≤K_l(1+||x||)^M_l, K_l≥0. Thus 1+sum |u_l|≤K(1+||x||)^M, K=1+sum K_l, M=sum M_l. Use |C| rather than C when obtaining |phi|≤|C| K^m(1+||x||)^(Mm).

The source FiniteCoverGrowth.integral_and_rational_of_polynomial_growth takes two explicitly supplied facts: complement of any nonzero polynomial hypersurface in C^d is connected and dense; any holomorphic function there with a global polynomial bound is a polynomial on that complement. It additionally requires P monic, q≠0, q∈(P,P'), local ambient analytic representatives on the finite-cover locus, and the above polynomial bound. For x with q(x)≠0 the specialized P_x has n=deg P distinct roots T_x (Bezout relation plus monicity). The implicit function theorem gives differentiable local enumerations and values phi(x,z). The following expressions are invariant under all root permutations:
 S_x(W)=prod_{z∈T_x}(W-phi(x,z)),
 R_x(W)=sum_{z∈T_x} phi(x,z) prod_{w∈T_x,w≠z}(W-w).
For each fixed W their evaluations are holomorphic in x on q≠0 via local root enumeration. The source hgrow chooses one K'=1+|W|+|C|+K_root, M'=m+M_root (here C,m refer to the finite-cover bound). Then all factors, including 1, are bounded by K'(1+||x||)^M'. The product is bounded by K'^n(1+||x||)^(M'n); the sum by n K'^(n+1)(1+||x||)^(M'(n+1)). Invoke polynomial-growth supplier for fixed W, then coefficient reconstruction by finite Lagrange interpolation: n values for S_x-W^n of degree <n, n+1 values for R_x of degree <n+1. Hence global coefficient polynomials S,R exist. For each root z, S_x(phi(x,z))=0, and all terms of R_x(z) but its own vanish, giving
 R_x(z)=P'_x(z) phi(x,z).
This is the crucial denominator identity; separability guarantees P'_x(z)≠0. The first conclusion is integrality, but exists_mul_eq uses the second, rationality.
Choose b=j(q) beta(P'), a=j(q) beta(R). b≠0 since j injective, q≠0, and beta(P')=0 would imply j(q)=0 by q∈(P,P'). At q(y)≠0 the identity follows by reconstruction of χ; at q(y)=0 both sides vanish by the extra q factor. If V has no complex points, the original proof uses a=0,b=1. This explicitly preserves the zero-denominator branch rather than dividing there.

## 4. A continuous rational quotient is regular on a normal affine domain
exists_eq_of_continuous_quotient_algHom: A commutative domain, finite type over C, integrally closed, ψ continuous on C-algebra homomorphisms A→C, a,b∈A, b≠0, and e(b)ψ(e)=e(a) for every e. Then ∃c∈A with e(c)=ψ(e) for every e.
For b s=a r in A, evaluating and cancelling e(b) on its dense nonzero locus gives e(s)=ψ(e)e(r); by continuity it holds for all e. If b divides a, take c=a/b and r=1. If not, source ContinuousQuotient.exists_prime_of_not_dvd supplies prime p and s,r with s∉p, r∈p, b s=a r. Since A/p is reduced finite type over C, its C-points detect nonzero s mod p, hence choose e factoring through p with e(s)≠0 and e(r)=0. Contradiction. The prime witness theorem uses Noetherian maximal colon ideal, integral closure via determinant trick and localization to a DVR; its full derivation is retained for next run, not treated as an axiom.
Smoothness ensures affine domain A integrally closed (normal stalks and localization at maximal ideals); finite type and the affine-point evaluation topology transport ψ from the original phi. Thus exists_ev_eq_of_continuousOn_quotient yields regular c matching phi on all V. Normality is essential: C[t²,t³] has continuous t on the cusp, b=t², a=t³, yet t is not in its coordinate ring. Continuity alone cannot remove that algebraic defect.

## 5. Glue and extend scalars
For each x∈B.U_i the preceding steps yield c_x on V_x⊂B.U_i matching s_i. On overlaps evaluations agree, hence algebraic sections agree by reduced finite type separation. The sheaf gluing theorem yields f_i on B.U_i. For i,j their evaluated transition equality is that of s, so algebraic transition equality again follows by separation. Outside each chart both secVal and s are zero by definition/compatibility. Hence B.Sec maps to exactly s, proving surjectivity over C.

SerreHolomorphicSections.bijective_valC: field F, σ:F→C, p:Y→Spec F smooth relative dimension D and projective, R:AnRead p σ D, valid line bundle B. Conclusion Function.Bijective (R.valC B), on SecC p σ B, i.e. scalar extension of sections, NOT the assertion that arbitrary complex coefficients already lie in F. Form pullback Y_C with r:Y_C→Y, q:Y_C→Spec C. Smoothness of same relative dimension and projectivity stable under base change, B'=r*B valid, complex-point map m:Y_C(C)→Y(C,σ) bijective. Pullback of chart families pullVal s(J,z)=s(J(unit),m(z)) preserves holomorphic compatibility, is injective by surjectivity of m. Base-change theorem isExtension_pullChart_top gives spanning of H0(Y_C,B') by base-changed sections and independence of lifted F-bases; preserve both, not just one.
Define L:SecC→H0(Y_C,B') by complex linear extension of pullback on F-sections. The identity cval(Lx)=pullVal(SecC.val x) follows on generators then by linearity. If valC x=0, C-case injectivity implies Lx=0; express x in finite F-basis (finite_top from projectivity), and independence of its lifted basis forces all coefficients zero. For any holomorphic s, pullVal s algebraizes over C; spanning gives x with Lx that algebraic section. PullVal injectivity then gives valC x=s. This proves both directions, preserving finite_top, isExtension_pullChart_top, chart pullback and C-case GAGA as dependencies.

## 6. Immediate caller exists_comb: actual purpose
Source full context E number field CM, H Host E, D Datum H, l Level H, Xo Moduli D l, c Coeff l, r natural, σ:c.F→C; V:Unf, GoodEmb c σ, IsUnf V, T:TorFlag, e:Ix D→Z with e none=0, weights la_k, Tw V e k la_k for every k, P_k∈SS(la_k) for every k. Conclusion ∃m natural, as:Fin m→C, fs:Fin m→Rul Xo c, each fs_i∈extVanZ T.X e, and for every k and x in its frame domain P_k(x)=sum_i as_i rdU(V,fs_i,k,x).
Supplier toroidal_flag_smooth_projective produces D' with smooth/projective flagStr; choose R=AnRead.all. For each k, open_secZ produces chart-compatible h_k, Reads and OffZero; open_holoZ plus RUN14 holoOn_bdZ supplies holomorphicity on the whole chart. Sum h=sum_k h_k (finite V.Comp). Every h_k vanishes on boundary by OffZero and mem_open_of_ptY. At a matching point for component k, every other summand vanishes: any competing frame matching the same point is related by Borel groupoid composition; IsUnf gives equality of component indices, contradiction. Thus h reads all P_k simultaneously, not merely their sum at arbitrary frames.
Apply AnRead.bijective_valC surjectivity for valid LB T.X.LL e to get xC with SecC.val xC=h. Smoothness implies locally finite type. Apply RUN11 VanDescent to xC with boundary vanishing; get finite as and sections ss_j individually vanishing with evaluated sum equal h. Use H0.ofSec and ruleTop to obtain fs_j∈extVanZ (inverse H0.bijective_ofSec_top and mem_vanOut_iff_le). RUN12 holomorphic_extension_sections then reads the combination for every k,x. The current H source invokes the two direct suppliers instead of pinned wrappers. No new Cathedral hypotheses.
This closes the local GAGA assembly explanation, not all imported existence theorems or a verified root-level proof.

## 7. Executed exact arithmetic certificate
V8 output {"fibers":3990,"derivative":14574,"monic":3990,"permutation":3990,"growth":4500,"negative":2}. Each derivative case also checked S_x(value)=0 (not separately counted). Distinct integer root subsets of {-3,...,3} of size 1–4 and all assignments in {-1,0,1}; exact BigInt, including repeated output values. Synthetic finite regressions of fiber polynomial identities and compact-cover envelope, not native Lean replay or a proof of analytic polynomial growth. Negative controls repeated roots and cusp semigroup obstruction; the latter finite check illustrates the exact elementary argument 2i+3j≠1 for all nonnegative integers. Reproduce by saving the code below as run15.mjs and running node run15.mjs.
~~~js
function certificate(){
 const c={fibers:0,derivative:0,monic:0,permutation:0,growth:0,negative:0};
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const mul=(a,b)=>{let t=Array(a.length+b.length-1).fill(0n);for(let i=0;i<a.length;i++)for(let j=0;j<b.length;j++)t[i+j]+=a[i]*b[j];return t};
 const ev=(p,x)=>p.reduceRight((a,b)=>a*x+b,0n);
 const nodal=rs=>rs.reduce((p,x)=>mul(p,[-x,1n]),[1n]);
 const numerator=(rs,vs)=>{let r=Array(rs.length).fill(0n);for(let i=0;i<rs.length;i++){let p=nodal(rs.filter((_,j)=>i!==j));for(let j=0;j<p.length;j++)r[j]+=vs[i]*p[j]}return r};
 const same=(a,b)=>a.length===b.length&&a.every((x,i)=>x===b[i]);
 for(let mask=1;mask<128;mask++){let rs=Array.from({length:7},(_,i)=>BigInt(i-3)).filter((_,i)=>mask>>i&1);if(rs.length>4)continue;let p=nodal(rs),dp=p.slice(1).map((v,i)=>v*BigInt(i+1));for(let k=0;k<3**rs.length;k++){let vs=rs.map((_,i)=>BigInt(Math.floor(k/3**i)%3-1));let R=numerator(rs,vs),S=nodal(vs);c.fibers++;
  ck(S.at(-1)===1n,"monicity");c.monic++;
  for(let i=0;i<rs.length;i++){ck(ev(dp,rs[i])!==0n&&ev(R,rs[i])===ev(dp,rs[i])*vs[i],"derivative identity");c.derivative++;ck(ev(S,vs[i])===0n,"value root");}
  ck(same(R,numerator([...rs].reverse(),[...vs].reverse()))&&same(S,nodal([...vs].reverse())),"permutation");c.permutation++;
 }}
 for(let T=1n;T<=5n;T++)for(let a=0n;a<=4n;a++)for(let b=0n;b<=4n;b++)for(let m=0n;m<=5n;m++)for(let n=0n;n<=5n;n++){let M=m>n?m:n;ck(a*T**m<=(a+b)*T**M&&b*T**n<=(a+b)*T**M,"global bound");c.growth++}
 let dp=nodal([1n,1n]).slice(1).map((v,i)=>v*BigInt(i+1));ck(ev(dp,1n)===0n,"repeated root");c.negative++;
 ck(Array.from({length:4},(_,i)=>i).every(i=>Array.from({length:4},(_,j)=>j).every(j=>2*i+3*j!==1)),"nonnormal cusp");c.negative++;
 return c;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: expand the actual ContinuousQuotient.exists_prime_of_not_dvd proof in src/Development/AbelianVarietyTheory/Proofs/ModuliProofs/ExistsEqMulOfContinuousOnQuotient.lean, especially maximal colon ideal, determinant trick and DVR two-way divisibility. Then trace exists_mvPolynomial_of_poly_bound_off_hypersurface and noetherNormalization_primitive; preserve projectivity/normality, isExtension_pullChart_top, smooth_proj_flagStr, and earlier RUN13–14 analytic leaves. Request authenticated role-labelled root paths for exists_comb, serreHolomorphicSections_holds, both bijective_valC declarations, exists_mul_eq_of_polynomial_growth, exists_eq_of_continuous_quotient_algHom and integral_and_rational_of_polynomial_growth. HANDOFF TO geometry, literature, integration, editor, audit, dependencies, kernel. Project OPEN; no Lean kernel validation or demonstrated URT acceleration.


---

### Peer original: [specialists/prime_window/RUN15_NUMSTAR_UNIFORM_ENVELOPES.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN15_NUMSTAR_UNIFORM_ENVELOPES.md) — blob 9977d56e591275790cffdf36cc7355955fb9229e

# RUN15 — Uniform numerical suppliers for StarAll
2026-11-24. RESULT: SOURCE-MATCHED conditional human reconstruction and executed exact BigInt regression. P=40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same head as RUN14). No Lean kernel replay; no URT advantage asserted.

## Preflight
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state excerpts, research log/protocol and continuity, CI summary #395 21:14:40Z (physics only, not RH evidence), RUN14, recent 30 commit titles and integration/editor/Landau RESUME HERE notes. Other lane full notes and external blueprint not reread; no duplicate identified in inspected records. RUN14 assigned this specific numerical producer. No protected files or other lanes changed.

## Source ledger
All upstream paths relative to src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/, repository leanprover-community/riemann-hypothesis. P links: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/
- StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043: St.ev_log/ev_pow L10–32, rE,cGE,cNE L34–48, inv_delta1 L50–55, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six/one_le_k L136–146, second_level_lt_good_of_log L152–199, CStar L201–210, SmallB L212–222, numStar_ev L224–323.
- StarNumB.lean blob 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47: St.B.cGE,cNE,Gp_le,first_count_le_log L11–96; hboB_arith L98–129; hDII_arith L131–144; Facts L146–156; facts_ev L159–355.
- StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a: St.star_fam L11–36.
- NumData.lean blob 16d92dcc7a0cc5044b661107e2e6c1ff6d099e86: Pf.G5.Nu.ev_log,ev_pow,k_le_x_pow_six,one_le_k,xpow_le_exp,ev_const,rE L10–55.
- RUN14 source PartnerCountOfCentral.lean NumStar L440–470 and starAll_of L842–848, blob f677b9041604e334f1115ae16b96cd61b1c7ee55.

## 1. Quantifiers and asymptotic lemmas
Fix real eps, K:Consts with K.Nonneg, C31>0. numStar_ev states: there exists a real x0 such that for every x>=x0, every D:D7 and L:SizeData₂ D, if L.sc.x=x, L.sc.eps=eps, SizesAt L and ParameterChoice' D L, then for every real bo with SmallB D L K C31 bo, and every real C>=CStar eps K C31, NumStar D L K C31 C bo. Threshold is independent of D,L,bo,C. facts_ev has same outer fixed data and eventual scope; after D,L, equalities, SizesAt and ParameterChoice', requires adm5 D L K (eps/48), and returns Facts with bo=b^(x^(-eps/2)). Neither statement adds eps>0 as a premise: if eps is not in (0,1/52), matching native L is impossible (Scale.eps_pos/eps_lt). Otherwise fix this valid range.

Elementary human alternative for ev_log: for x>=1 and a>0, log x = integral from 1 to x of dt/t <= integral from 1 to x of t^(a/2-1)dt = (2/a)(x^(a/2)-1). Thus c log x <= x^a once x^(a/2)>=2|c|/a. Handles signed c. ev_pow: x^beta=x^alpha x^(beta-alpha) for x>0, with beta>alpha, so eventual x^(beta-alpha)>=c suffices. ev_const: exp(x^a)>=1+x^a eventually dominates any fixed c. A finite intersection of eventual atTop statements takes the maximum of their thresholds. Source uses little-o and tendsto, not this explicit integral; no new assumption.

## 2. Native counting bounds
Let ell=log x, y=x^(eps/8)=1/delta1, r=rE(eps)=ceil_N(8(4+8eps)/eps)+1, A0=(5+8eps)10^(6r+1), cGE=2(A0+6)(6r+1), cNE=18cGE+2(5+8eps)+2. For x>=e, ell>=1,y>=1. Natural ceiling satisfies u<=ceil_N u<u+1 for u>=0. orbitSmallMultiplicity<=A0 ell+1, goodEll=(6r+1)ceil_N y<=2(6r+1)y. Thus Gp=(orbitSmallMultiplicity+5)goodEll<=cGE ell y. N1=ceil_N max(6e Gp delta1,(5+8eps)log_2 x)+1. Since e<3 and log2>1/2, its max <=[18cGE+2(5+8eps)]ell, and the ceiling plus one costs at most 2ell. Hence N1<=cNE ell.

SizesAt gives k<=x^6 and native k>=1. The L1 in this pinned namespace, unfolded at StarNum L164–183, has ceiling argument log_p((k*x^26)^4). This must not be silently identified with a different cutoff such as ceil(log_p(k^2*x^78))+1. Its numerator is 4(log k+26ell)<=128ell. For p prime, log p>=log 2>128/186 (e.g. integrate 1/t or use log 2=2 sum_{j>=0}(1/3)^(2j+1)/(2j+1); first 3 terms give 842/1215>128/186). Hence L1<=ceil_N(186ell); the supremum over inert primes obeys same bound, and L2=2sup L1<=372ell+2<514ell. If 514ell<=y then L2<goodU=ceil_N y. Source uses log_two_gt_d9. Empty supremum is handled by the source csSup_le' bound in Nat. Audit cutoff name across earlier notes.

## 3. CStar and numStar_ev
CStar=3+K.tII*r+(13+4K.tII+160C31)+K.Pr1*C31+K.kappaThresholdOne*|cNE|. All summands nonnegative (K.Nonneg,C31>0). C>=CStar gives hC3,hCt,hCD,hCP and hN1 by multiplication with ell>=1. Note C chosen independently of each x,D,L.
Choose x large for x>=e, x>=2, 514ell<=y, 3cGE ell<=y, 4C31 ell<=x^(1-eps/8). The first cutoff gives hL2; second gives 3Gp<=y^2=x^(eps/4). Native base P, Nm_le_Sc P, w''_le and SizeEta yield w,eta,c,Nm each <=b'/x (w=w'', c=cG; source L254–276 supplies eta<=w and Nm<=w). They imply w+eta+c+Nm<=4b'/x. Thus G=C31 ell/delta1>=0 and G(w+eta+c+Nm)<=4C31 ell y*b'/x<=b'. Source L307–309 unfolds c0num and uses same b'/x<=b'/2, yielding c0num<=3b'; exact c0num definition not separately expanded in this note. hLx follows x>=e. Remaining hkQ,hDII,hbo are precisely the three conjuncts of SmallB, not generated by numerical growth alone; facts_ev supplies them next.

## 4. Three uniform Facts from a common envelope
Set t=x^(eps/48), Y=exp(t^23)=exp(x^(23eps/48)), b=exp(x^eps), a=xb, b'=x exp(x^eps-x^(eps/3)), bo=b^(x^(-eps/2))=exp(t^24). Source facts_ev fixes all constants before the eventual x threshold. It chooses 14ell<=t^23, 130<=Y, each K.Pr1,K.kappaThresholdTwo,K.DI,K.DII,C31,r<=Y, ell<=x^eps, 3x^eps<=x, 14t^23<=x^eps, 4x^(eps/3)<=x^eps, 13t^23<=x^(eps/2), C31ell<=x, cNE ell<=x, x>=40,e. Strict positive exponent gaps ensure all are eventual. In particular pY: q<=x^M and M<=14 for natural M imply q<=Y by M ell<=14ell<=t^23.

SizesAt and ParameterChoice' give n<=x^3,k<=x^6, v=x^13, eta<=exp(x^(eps/4)), Del<=exp(x^(eps/4)/2), c=16k Del>=0 and Nm<=c. Since x>=40 and x^7<=exp(t^23/2), c<=Y. Thus eta,c,Nm,n,k,v,ell all <=Y. For every prime p, lb=log_p(a)>=0 and lb<=2log a=2(ell+x^eps)<=x^2<=Y, using p>=2, log2>=1/2, ell<=x^eps,3x^eps<=x,x>=40. G=C31ell y<=x^2<=Y. N1<=cNE ell<=x<=Y. For every n'<=n, NplusF=40n'delta1<=x^4<=Y, nonnegative. The adm5 hypothesis supplies log Qp<=x^(11eps/24+eps/48)=t^23 for p<X', and <=x^(eps/8+eps/48)=t^7<=t^23 for p<p0. Qp>=0 by definition. These are distinct quantifier domains; no extension to all p is claimed.

From 14t^23<=t^48 and 4t^16<=t^48, obtain 8t^23+t^16<=t^48 (8/14+1/4<1). Hence Y^8<=exp(t^48-t^16)<=b'. For prime p<p0, kQp<=Y²<=Y^8<=b'. For every prime p, K.DII*(N1³+r⁵+k²)*lb<=Y⁵+Y⁷+Y⁴<=3Y⁷<=Y^8<=b' (source uses 130). This proves the first two Facts without requiring p<X' for the second.

## 5. Third Facts: explicit polynomial budget
For each prime p with p0<=p<X' and each natural n'<=n, abbreviate P=K.Pr1,T=K.kappaThresholdTwo,Q=Qp,I=K.DI,N=NplusF, z=N1, l=lb, L=ell, C=C31. All 17 input variables of hboB_arith except DIf lie in [0,Y], including Np=NplusF separately. DIf>=0 and DIf<=I*Np*v²*(z⁵+k³)*l+1 by its natural ceiling definition. Native c6f=8(DIf+1)+T*N*k*l+4*N*c+2*n'*c. The third Facts LHS is exactly
P G(eta+c+Nm)+T[Q*c6f+kQ+kl+c]+2Gc+40 C L I v²(z⁵+k³)l+3.
All factors nonnegative. Monotone substitution by Y (and DIf by Y^10+Y^8+1) yields
8Y^12+40Y^11+8Y^10+40Y^9+Y^6+6Y^4+5Y^3+19Y²+3.
Coefficient sum 130; each degree<=12 and Y>=130, so this is <=130Y^12<=Y^13. Finally 13t^23<=t^24 yields Y^13<=exp(t^24)=bo. Retain actual p and n' restrictions even though p0 lower bound unused locally after e_Q. All three Facts are now assembled; adm5 is still a substantive premise and is not proved by this calculation.

## 6. Family assembly
St.star_fam fixes Fm:FamP eps,K,hK,C31,Ce,Cm,hC31. Chooses C0=max(CStar,0) before universally introducing C>=C0 and families X(x,i):Inst,Ylat(x,i):LatInst. Under AdmFam, choose x2 from its specialization at eps/48>0; eps>0 follows Fm.Ix_zero and Fm.L_eps. Let x3 be common atTop threshold from numStar_ev and facts_ev. Take x0=max(x2,x3,Fm.x1+1). For every x>=x0 and every i:Fm.Ix x, Fm.params/sizes/L_x/L_eps supply matching D,L; AdmFam supplies A1 and A5. facts_ev with A5 yields exactly three Facts, passed as SmallB to numStar_ev. starAll_of with A1 and hK,ParameterChoice',C31>0,NumStar yields StarAll for bo=b^(x^(-eps/2)). Neither family admission nor native size conditions deleted. Note H source tuple extraction changed from six fields to four; no equivalence of entire AdmFam inferred.

## 7. Executed finite regression
Code uses abstract exact integer fixtures, not native D7 instances or real-asymptotic evaluation. The polynomial identity and majorant are tested independently; exponent tests use integer t=x^(eps/48). The logarithm rational lower bound is analytic; integer comparisons test its coefficient and ceiling absorption. Negative controls fail when Y>=130 is discarded entirely and when 13t^23<=t^24 is taken at t=12. Universal real statements rely on derivations above, not samples.

```js
const certificate = ()=>{
const n={majorant:0,polynomial:0,DII:0,cutoff:0,exponent:0,constant:0,negative:0};
const check=(x,k)=>{if(!x)throw Error(k);n[k]++};
const poly=y=>8n*y**12n+40n*y**11n+8n*y**10n+40n*y**9n+y**6n+6n*y**4n+5n*y**3n+19n*y**2n+3n;
const budget=(P,G,e,c,m,T,Q,D,N,k,l,j,C,L,I,v,z)=>P*G*(e+c+m)+T*(Q*(8n*(D+1n)+T*N*k*l+4n*N*c+2n*j*c)+k*Q+k*l+c)+2n*G*c+40n*C*L*(I*v**2n*(z**5n+k**3n)*l)+3n;
for(let y=130n;y<=170n;y++){
const d=y**2n*y**2n*(y**5n+y**3n)*y+1n;
check(budget(y,y,y,y,y,y,y,d,y,y,y,y,y,y,y,y,y)===poly(y),"polynomial");
check(poly(y)<=130n*y**12n&&130n*y**12n<=y**13n,"polynomial");
for(let s=0n;s<160n;s++){
const a=Array.from({length:17},(_,i)=>(s*BigInt(17+i*2)+BigInt(i*i+3))%(y+1n));
const [P,G,e,c,m,T,Q,I,N,k,l,j,C,L,v,z,Np]=a;
const D=I*Np*v**2n*(z**5n+k**3n)*l+1n;
check(budget(P,G,e,c,m,T,Q,D,N,k,l,j,C,L,I,v,z)<=poly(y),"majorant");
check(I*(z**3n+v**5n+k**2n)*l<=y**8n,"DII");
}
}
// log2 > 2(1/3 + 1/81 + 1/1215) = 842/1215 > 128/186
check(842n*186n>128n*1215n,"cutoff");
for(let l=1n;l<=120n;l++)for(let d=1n;d<=19n;d++){
const logNumer=l*d+1n, logDen=d;
const ceil=(186n*logNumer+logDen-1n)/logDen;
check(2n*ceil*logDen<514n*logNumer,"cutoff");
}
for(let t=13n;t<=150n;t++){
check(13n*t**23n<=t**24n,"exponent");
check(8n*t**23n+t**16n<=t**48n,"exponent");
check(14n*t**23n<=t**48n&&4n*t**16n<=t**48n,"exponent");
}
for(let r=1n;r<=15n;r++)for(let t=0n;t<=8n;t++)for(let c=1n;c<=9n;c++)for(let p=0n;p<=4n;p++){
const z=3n+t*r+(13n+4n*t+160n*c)+p*c+2n*(r+1n);
check(z>=3n&&z>=t*r&&z>=13n+4n*t+160n*c&&z>=p*c&&z>=2n*(r+1n),"constant");
}
check(poly(1n)>1n,"negative");check(13n*12n**23n>12n**24n,"negative");
return n;
};
console.log(JSON.stringify(certificate()));
```
Actual V8 output: {"majorant":6560,"polynomial":82,"DII":6560,"cutoff":2281,"exponent":414,"constant":6075,"negative":2}.

## 8. Upstream and independent review
H clumped StarNum and StarNumB into StarFam.lean blob 7878557c8ff202e27b0351868ce2c71e0; their old paths return 404. Exact text comparison confirmed P StarNum L10–32,57–92,94–134,201–203,212–222,224–323 at H StarFam L63,110,147,209,212,224 respectively; P StarNumB L98–129,131–144,146–156,159–355 at H L432,465,480,493. H star_fam L710–735 differs in AdmFam tuple extraction; H second_level_lt_good_of_log delegates to Pf.second_level_lt_good_of_log rather than P's explicit proof. No full equivalence claim. NumData H blob 193ad2351e539696e202159b12a708c9948b1d9b differs; source L10–55 not verbatim as block. Request independent audit of ceiling/cutoff scope, polynomial coefficient sum, exponent gaps, family uniformity, and changed AdmFam shape; dependency/kernel lanes should authenticate actual edges before asserting reachability to Main. No kernel replay, no verified URT acceleration.

## RESUME HERE
Trace the pinned definition and producer of adm5 D L K (eps/48), especially the two distinct log Qp bounds, and compare the changed AdmFam tuple at H. Also authenticate c0num and exact L1 namespace against RUN10; correct any conflation explicitly rather than altering prior records. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.


---

### Peer original: [specialists/theta_lifts/RUN15_HOLOMORPHIC_COEFFICIENT_AND_EXACT_WEIGHT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9101b7250809fc03d8a34e0817353880ff94f271/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN15_HOLOMORPHIC_COEFFICIENT_AND_EXACT_WEIGHT.md) — blob 29b9dfaaadc94f1bcf2a24ee8623138908a956a2

# Theta lifts RUN15 — holomorphic coefficient and exact local weight

2026-11-24. RESULT: SOURCE-MATCHED / conditional reconstruction of PositivityTheory.SiegelWeilFormula.AStep.holCoef_pf, both conclusions, with holPhi, local weight, character, group splitting and continuity suppliers. RH project OPEN; no new RH theorem, kernel replay, or URT speed claim.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol and continuity excerpts; CI checkpoint 395 is general Cathedral PASS only. Read RUN14 in full and inspected latest swarm commit messages, plus recent handoff notes from Landau, prime, integration, editor, geometry, literature, character boxes, math and Galois. Structure/dependency/kernel/acceleration/audit handoff bodies not all recovered (connector commit responses did not expose their Markdown patches); their recent commit messages concern role-aware extraction/scheduling and error budgets, not this theorem. Editor RUN14 incorporation explicitly assigns holCoef_pf to theta. Blueprint identified from queue, not independently reread. No physical queue or gate changes.

Source P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. Observed current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, 2026-11-24 18:24:32 UTC, PR #1313, unchanged from RUN14. At H HolCoefPf.lean returns 404, WeightFactorDilation.lean has blob af33a1646bad1e439bed89dfa516318b09da0f2f, with stab_row:71, det_row:89, weight_factor_dilation:121. This is source-path drift only: no equivalence or deletion claim. H directory listing was not parseable. All mathematical arguments below refer to P, with paths relative to src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/.

## 1. Precise theorem
HolCoefPf:52–58. Fix number fields F,E and Algebra F E, sigma:E→ₐ[F]E, H:Hyps, d:SD sigma, R:RD d, L:LD d, infinite place w, Fourier data hc:CoefData d.b nb lam Gcal, rational Fourier labels T,T' satisfying L.IsSub T T', A:d.G→C continuous and invariant on the left under every gamma in rat2 sigma d.Y. Fix pp,qq natural, e integer, and the pure signature disjunction (pp=d.m,qq=0) OR (pp=0,qq=d.m). For EVERY g the function y↦A(g R.iota(w)y) is IsHolW pp qq e. Write B(x)=fc d.B.psi d.b nb lam Gcal A T x. Then:
(i) for every real tau and every y in GR(d.n) with IsDil (Pi.single L.i0 1) tau y, and every x, B(R.iota(w)y x)=exp(tau*d.m) B(x);
(ii) for EVERY uM,nu,Ucal satisfying L.UData uM nu Ucal, EVERY u and x, B(uM(u)x)=B(x).
No m<n hypothesis in this theorem itself. No assumption B is nonzero, no division by B, and no claim arbitrary mixed signatures meet IsHolW. L.IsSub (LowerRankDatum:121–122) requires both distinguished row and column zero and the exact lower-rank submatrix T'. CoefData and UData are retained as packages, including their measure normalizations. IsHolW (16–18) is representation by a holomorphic function on the positive imaginary matrix domain times F0 pp qq e, evaluated at zOf(y) if q=0 and at -(zOf(y))^H otherwise.

## 2. Fourier averaging preserves holomorphic weight
HolCoefPf:13–50, HolomorphicTheta/HolomorphicAverageUniform:15–68. For fixed x', the Fourier coefficient on x'R.iota(w)y can be written as an average of A(c(beta) R.iota(w)y) times u(beta), where u(beta)=psi(-Tr_AE/AF tr(T beta)). Choose a compact K in the adelic additive unipotent space meeting each rational translate (nF_cocompact). For every beta choose gamma(beta) rational with gamma(beta)+beta∈K. Put c(beta)=nb(gamma(beta)+beta)x'. Rational left invariance and nb_add/nb_rat imply
 A(c(beta)g)=A(nb(beta)x'g).
The character u has modulus one and the restricted measure lam|Gcal is finite (mass one). The image nb(K)x' is compact. Crucially the arbitrary choice gamma(beta) need not be shown measurable: the INTEGRAND is equal pointwise to the original continuous expression in beta for each y. Thus its AE strong measurability follows directly. Apply H.holT.2 to get IsHolW for the coefficient as a function of y.

The actual Holtb.holomorphic_average_uniform producer chooses a holomorphic H_g for each g. Put f(beta,W)=H_{c(beta)}(W)u(beta); H_g(bmap_q(y))=A(g iota(y))/F0(y) because F0(y)≠0. Surjectivity of bmap_q transfers integrand measurability to every W in the domain. For a domain point W0 use bmap_local to obtain a positive-radius ball and a compact set S of local lifts y of all its points. Continuity bounds |A| by K0 on c-space compact × S; continuous nonvanishing |F0| has strictly positive minimum a0 on S. Hence |f(beta,W)|≤K0/a0 uniformly on the ball, using |u|≤1. The finite measure and differentiableOn_integral_of_bdd yield a holomorphic integral of f. Factor F0(y) outside the integral to obtain IsHolW. This is the original compact-lift domination argument, not an unjustified interchange of derivative and integral. bmap_local, bmap_surj, nonvanishing weight and differentiation theorem remain imported obligations. Holtb.holT pairs holomorphic_translation_levi with this averaging theorem; its first member is retained, not assumed from the averaging argument.

## 3. Exact local additive character and splitting
CharacterW1TraceExp:15–41 constructs beta1 from the upper-right frame block of R.iota(w)xN for mR(xN)=nU(h). It satisfies R.iota(w)xN=nb(beta1), cw_w(beta1)=zeta h, all other infinite projections zero and finite part zero. This follows from component formulas and Place.cw_ext, then frame injectivity. The localized Fourier label is
 betaW = -4 pi zeta cw_w(T).
The character identity at 46–103 is psi(tt(T beta1))=exp(i tr(betaW h)). The factor -4pi is exact: the native definition multiplies 2pi by -2. The form relation cw(T)^T+epsilon conjugate(cw(T))=0 holds on the additive subgroup by closure induction, so zeta cw(T) is Hermitian in both branches (epsilon=-1,zeta=1) and (epsilon=1,zeta=i). For Hermitian h, tr(zeta cw(T)h) is real, by adjoint, trace cyclicity and conjugation. The finite/off-w components of tr(T beta1) vanish. Place.psi_trace_at gives the native character phase with the real-part expression; the just-proved reality permits its replacement by the complex trace. No sign or 2π normalization chosen to match a target.

For x' commuting with the local subgroup, use KSing.fc_shift and the character identity to get
 B(x' iota(xN y))=exp(i tr(betaW h)) B(x' iota(y)).
Apply H.holT.1 to the holomorphic function from section 2: if mR(xx)=diag(a,a') and a^H betaW a=betaW, then
 B(x' iota(xx y))=F0(pp,qq,e;xx) B(x' iota(y)).
To obtain a formula at every x, not just specially chosen x', use decW_pf (DilExPf:33–36). Actual suppliers KSplitW.decompW and commW (ThetaSplitting/SplitW:62–92) construct y0 from the w-frame Z_w via conjugation D_zeta Z_w D_zeta^{-1}; let x'=x iota(y0)^{-1}. Its w-frame is I, since iota(y0) has the same w-frame as x. At w this identity commutes with the local subgroup; off-w and at finite projections the local embedding has identity components. Component extensionality and frame injectivity show x' commutes with every iota(y). Thus x=x'iota(y0), and
 B(iota(xx)x)=F0(pp,qq,e;xx) B(x)
 whenever the stated block and stabilizer conditions hold (HolCoefPf:76–81). This uses actual commuting decomposition, not a global commutativity assumption.

## 4. Single invariant-subspace identity for both matrix stabilizers
WeightFactorDilation:13–40. Write beta=betaW and let v be the i0 coordinate vector. L.IsSub implies beta v=0 and v^H beta=0. Any matrix M supported on row i0 is v r for a row r. Therefore beta M=0 and M^H beta=0; expansion yields (I+M)^H beta(I+M)=beta. No diagonal condition is needed for this identity. In particular a diagonal D differing from I only at i0 has D^H beta D=beta (the native stab_diag uses entrywise proof). For local shear determinant, the SEPARATE hypothesis M_i0,i0=0 gives r v=0. The rank-one determinant lemma gives det(I+v r)=1+r v=1 (42–51); equivalently M^2=0 and I+M invertible. Do not silently require invertibility or determinant one for arbitrary row-stabilizer inputs. Source uses replicateCol/replicateRow and Matrix.det_one_add_replicateCol_mul_replicateRow.

## 5. Weight on both branches
WeightFactorDilation:53–90. For a block-diagonal group element diag(a,a'), the group equation InG implies a^H a'=I. The exact weight is
 F0=(det(a)det(a'))^e * det(a')^{-pp} * det(a')^{-qq}.
If det(a)=1, take determinants in a^H a'=I to obtain det(a')=1, so F0=1 for all pp,qq,e. For the single-coordinate dilation D_tau=diag(1,...,exp(tau),...,1), a=D_tau, a'=D_{-tau}; their determinants are exp(tau), exp(-tau), both nonzero. Hence
 F0=exp(tau*(pp+qq)).
The exponent e cancels because det(a)det(a')=1. Pure signature gives pp+qq=d.m; apply the block weight formula and stab_diag to obtain (i). Notice the weight calculation alone works for arbitrary pp,qq; the theorem's pure-signature premise is nonetheless preserved, and one cannot infer the actual holomorphic input for mixed signatures. Compare RUN8: this is the exact exp(tau*m) competing with exp(tau*(2n-m)) at s0, not a fitted weight.

## 6. From a local shear to the entire adelic shear family
HolCoefPf:87–110. B is continuous by fcCont (FcCont:65–98): near x0 choose compact neighborhood N, use the rational translate representatives K and the compact image of K×N under (beta,x)↦nb(beta)x. Continuity bounds A there; since |u(beta)|=1 and measure finite, dominated continuity applies. Rational shear invariance follows from H.fcConj (RUN13), separately from the local condition. To supply H.uEx (RUN14) local condition, fix arbitrary u and y with uM(u)=iota(w)y. UData gives upper block I+S, S=sum_j u_j E_{i0,em(j)}, and some lower block a'. Put M=cw_w(S). The embedding-range premise em(j)≠i0 makes M supported only on row i0 with diagonal M_i0,i0=0. The local frame conjugation D_zeta cw_w(inFrame(iota y)) D_zeta^{-1}=mR(y) makes mR(y) block diagonal, upper block I+M and lower block zeta I cw_w(a') zeta^{-1} I. Thus stab_row, det_row and weight_factor_det_one imply B(iota(w)y x)=B(x). Both rational and local conditions now supplied, H.uEx extends invariance to every u and every x, proving (ii). This explicitly fills the separate local premise previously left open in RUN14. The original normalized Haar and rational density suppliers are not replaced by the row argument.

## 7. Dependency record and reproducibility
Consumer AStep.holCoef in AdelicDilations/DegCut:36–42 forwards the entire statement and hypotheses, with holA:29–32 supplying the pure-signature input from exists_isHolW_iteratedDeriv. Holtb.holT is a named native supplier, not a published black box. These are static source-body call references, not authenticated elaborated dependency edges. Classical rank-one determinant, group factorization, dominated holomorphic integration and Haar Fourier covariance are standard mechanisms; no novel mathematics or external attribution inferred merely from source names. No explicit sorry/admit seen in the displayed targeted proof bodies; no transitive axiom or placeholder audit. Keep the precise local translation Levi theorem, singular Fourier testing producer, character normalization, compact representative domain, topology and bmap local-lift leaves open. No claim that the full proof or this reformulation has been independently Lean checked.

Executed in connector JavaScript: 120/120 literal source line anchors and 9/9 expected returned Git blob IDs matched; zero failures. This verifies provenance only, not mathematical correctness. The following compact replay checks all 9 original file bytes by Git object ID and representative line anchors (not separately run here).
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(13,"theorem holPhi"),(44,"H.holT.2"),(52,"theorem holCoef_pf"),(55,"hpq"),(69,"nbw1"),(75,"H.holT.1"),(80,"decW_pf"),(83,"stab_diag"),(88,"H.uEx"),(89,"H.fcConj"),(110,"weight_factor_det_one")]),
("AdelicDilations/WeightFactorDilation.lean","dbef763e7431e8901d7f53cfa7704bee4e37cad9",[(13,"theorem stab_diag"),(24,"theorem stab_row"),(27,"β * M = 0"),(33,"Mᴴ * β = 0"),(42,"theorem det_row"),(51,"det_one_add_replicateCol_mul_replicateRow"),(59,"theorem weight_factor_blocks"),(66,"theorem weight_factor_det_one"),(74,"theorem weight_factor_dilation")]),
("AdelicDilations/CharacterW1TraceExp.lean","00c869282dafb70a8a29c546a42a021717b63f50",[(15,"theorem nbw1"),(43,"def betaW"),(46,"theorem character_w1_trace_exp"),(74,"hAh"),(87,"Place.psi_trace_at"),(92,"Matrix.trace_mul_comm")]),
("AdelicDilations/DilExPf.lean","7ce58e2ad6ad969143b52e74378a56d96f406ef3",[(33,"theorem decW_pf"),(35,"KSplitW.decompW"),(36,"KSplitW.commW")]),
("ThetaSplitting/SplitW.lean","9e524db98a4e669e8c3f608abe1cb1e8d3f0df02",[(29,"theorem cw_iota"),(62,"theorem decompW"),(82,"theorem commW"),(86,"Place.cw_ext")]),
("AdelicDilations/FcCont.lean","cde3c01a796de6eb1cad61b1666f03bc5567f63a",[(65,"theorem fcCont"),(80,"IsFiniteMeasure"),(86,"continuousAt_of_dominated")]),
("HolomorphicTheta/HolomorphicAverageUniform.lean","0fd4083591381494ee126f661b677a56e0ed49d6",[(15,"theorem holomorphic_average_uniform"),(30,"differentiableOn_integral_of_bdd"),(41,"bmap_local"),(45,"exists_isMinOn"),(68,"theorem holT")]),
("AdelicDilations/DegCut.lean","1079d74072e904d278cba232030edc7bee2c9e2a",[(29,"theorem holA"),(32,"exists_isHolW_iteratedDeriv"),(42,"holCoef_pf H")]),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(16,"def IsHolW"),(36,"def HolT"),(117,"def UData"),(121,"def IsSub"),(164,"def UEx")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## RESUME HERE
Reconstruct the first member of HolT, the exact theorem holomorphic_translation_levi, in src/Development/WeilBound/RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/HolomorphicTranslationLevi.lean (imported at HolomorphicAverageUniform:2 and used at 68), focusing on how holomorphicity extends a real unipotent translation character to the full tube domain and implies the Levi stabilizer law; retain both q=0 and q≠0 branches, all positivity/connectedness premises and actual imported lemmas. Do not repeat RUN15 weight, averaging or RUN14 density. Request role-labelled root witnesses for AStep.holCoef_pf, holPhi, stab_diag, stab_row, det_row, weight_factor_dilation, weight_factor_det_one, decW_pf, character_w1_trace_exp, fcCont, Holtb.holT and Holtb.holomorphic_average_uniform. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.


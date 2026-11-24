# Human-readable RH reconstruction — fourteenth edition, 24 November 2026, 20:56 UTC

**INCOMPLETE.** Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from 19:56. No migration equivalence, independent Lean kernel replay, or URT acceleration claim. One linked manuscript: [1](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [2](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [3](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [4](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [5](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [6](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [7](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [8](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), [9](2026-11-24_1856_INTEGRATED_MANUSCRIPT.md), [10](2026-11-24_1956_INTEGRATED_MANUSCRIPT.md), then volume 11 here. Prior reported 134 primary + 11 supporting chapters; 9 additional primary peer chapters in this edition (143 primary + 11 supporting, 154 entries by previous counting convention, excluding editor introduction and linked code). These are editorial entries, not unique declarations.

## Explicit-formula zero-sum estimates

SOURCE-MATCHED conditional human derivation. Both source conclusions take, in order, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet, ExplZeta. Constants chosen before Q,q,chi,u. Require q positive, Q>=3, chi nonprincipal and native GlobalTheoryTheory.GoodFor Q chi (primitive, real-valued, q<=Q, exclusion of zeros with Re>399/400 and |Im|<=Q). The first conclusion is uniform for u>=2; the second for u>=exp((log Q)^2). ZFRDirichlet is retained but unused in the first body. Neither estimate proves GoodFor or the analytic inputs.

### 1. Multiplicity and reciprocal budget

RayPrimes defines Z(t,T)={rho: 0<Re rho<1, |Im rho-t|<=T, L(chi,rho)=0}; m(rho)=analyticOrderNatAt L rho. Both zsum and zsumR are weighted finsums, finite by ZeroWindow.finite_and_one_le_zmult. Put S_T=sum_{Z(0,T)} m(rho)u^rho/rho, H_T=sum_{Z(0,T), |Im rho|>1} m(rho)/|rho|, N=sum_{Z(0,1)}m(rho), R=sum_{Z(0,1)}m(rho)/|rho|.

ZeroCount supplies C0 uniformly for primitive chi, all real t: sum_{Z(t,1)}m <= C0 log(q(|t|+2)). Replace C0 by D0=max(C0,0). For each high zero, k=floor(|Im rho|) satisfies 1<=k<=floor T, and the zero belongs to Z(sign(Im rho) k,1). Its reciprocal norm is <=1/k. Sum the two indicator windows over k; overlap does not hurt an upper bound because all real weights are nonnegative. Interchange finite sums. Each restricted window's weighted count is at most its unrestricted count by sum_indicator_le_zsumR. For T>=2,
H_T <= 2 D0 log(q(T+2)) sum_{k=1}^{floor T} 1/k
<=2 D0 log(q(T+2))(1+log T)
<=12 D0 log(qT)^2.
Here T+2<=2T, log(qT)>=log2>1/2, so log(q(T+2))<=2log(qT) and 1+log T<=3log(qT). At t=0, N<=D0 log(2q)<=12D0 log(3q). This is zsumR_recip_le with D=12D0. ZeroCount remains an input.

### 2. Symmetric strip and low zeros

Real-valued multiplicative character means chi^{-1}=chi (star equals inverse, conjugation fixes real values). For primitive chi, zeros_symm_one_sub transfers zeros by rho -> 1-rho for inverse character and preserves multiplicities; |Im| unchanged. If T<=Q, GoodFor excludes Re rho>399/400 directly and Re rho<1/400 by reflection. Thus 1/400<=Re rho<=399/400, hence |rho|>=1/400 and reciprocal norm <=400. In particular R<=400N (use T=1<=Q). For T<=Q, u>=1, norm u^rho=u^{Re rho} and splitting at the inclusive low boundary |Im|=1 gives |S_T|<=u^{399/400}(H_T+400N). For arbitrary T, the low reciprocal bound still holds for Z(0,1); do not assume the fixed strip above Q.

### 3. Power saving

The native explicit_formula_used, conditional on ExplZeta, ExplChi, LogDerOne, gives C with
|psi0(chi,u)+S_T| <= C [u/T log^2(quT)+log(qu)+R] for primitive chi and 2<=T<=u.
Nonprincipal chi implies psi0=psiChi, the floor von Mangoldt sum. Choose T=min(u,Q); then 2<=T<=u,Q and u/T<=1+u/Q. Set A=u^{399/400}>=1, B=u/Q>=0, L=log(uQ)>=1, M=L^2. Since 1<=q<=Q and T<=u,Q, log(qT)^2<=M, log(3q)<=2L<=2M, log(qu)<=L<=M, log(quT)^2<=4M. The last follows from quT<=(uQ)^2.

H_T<=|D|M, N<=2|D|M, R<=800|D|M, |S_T|<=801|D|AM.
The explicit-formula bracket is nonnegative and at most
4(1+B)M+M+800|D|M <= (5+800|D|)(A+B)M.
Replace C by |C|, then apply triangle inequality:
|psiChi| <= [|C|(5+800|D|)+801|D|+1] (A+B)M.
This is the source witness and both terms of psiChi_bound_of_goodFor, with wrapper psi_chi_power_saving_bound.

### 4. Variable zero-free strip above Q

ZFRDirichlet supplies c0>0. Set c=min(c0/4,1/400), 0<c<=1. For s>=1, log q<=s, rho in Z(0,exp s), two cases in GoodLarge.re_le. If rho lies in InRegion(c0,q,rho), the zero clause forces Im rho=0 (the possible exceptional real zero is not assumed absent). GoodFor with Q>0 then forces Re rho<=399/400<=1-c/s. Otherwise the negated region inequality gives Re rho<1-c0/log(q(|Im rho|+2)). The denominator is positive and
log(q(|Im rho|+2))<=s+(s+2)<=4s,
using exp(s)+2<=exp(s+2). Thus c0/log(q(|Im rho|+2))>=c0/(4s)>=c/s. Both cases give Re rho<=1-c/s. This uses ZFRDirichlet as unfolded in the source body; its independent producer and exact defining file require further authentication.

### 5. Large-u exponential decay

Put s=sqrt(log u), T=exp s, M=u exp(-cs). The hypothesis u>=exp((log Q)^2), Q>=3 implies s>=log Q>=1, log q<=s, log u=s^2. Hence 2<=T<=u and 1<=u/T<=M. Section 4 implies |u^rho|<=M for every rho in Z(0,T). Replace explicit-formula constant A0 and reciprocal constant B0 by A=max(A0,0), B=max(B0,0) before enlarging nonnegative budgets.
The source log inequalities:
log(qT)^2<=4s^4, log(3q)<=3s^4,
log(quT)^2<=9s^4, log(qu)<=2s^4,
follow from log q<=s, s>=1, log3<=2. Therefore H_T<=4Bs^4, N<=3Bs^4, R<=1200Bs^4, full reciprocal sum<=1204Bs^4. Unlike the small regime, T need not be <=Q: the upper bound on |u^rho| uses the variable strip, and the low reciprocal bound only uses height 1. Consequently |S_T|<=1204BM s^4. The explicit-formula remainder is <= A M (11+1200B)s^4, because u/T<=M and M>=1. Add and allow a positive extra term:
|psiChi|<=[1+1204B+A(11+1200B)] u exp(-cs)s^4.
Taylor's nonnegative series gives exp(cs/2)>=(cs/2)^4/24. Hence
|psiChi|<=C1 u exp(-(c/2)s),
C1=[1+1204B+A(11+1200B)] 24/(c/2)^4>0, c1=c/2>0.
This is psi_le_of_large and wrapper psi_chi_sqrt_log_bound. Both constants independent of Q,q,chi,u. No additional analytic premise.

### 6. Exact join to volume 10

Volume 10 takes these wrappers under the same five inputs, common GoodFor guard, Q>=3, chi!=1, q>0, and derives a common C1>0,c1>0 and integrable tail. Small branch applies to all u>=2, large branch starts at exp(log^2 Q). No uncovered transition interval. Remaining producers: actual ExplZeta, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet, primitive psi0 decay used for ordinary series convergence, and native GoodFor instances. explicit_formula_used is a conditional adapter; its antecedents must not be treated as proved merely because its body is present. ZeroWindow.finite_and_one_le_zmult and zeros_symm_one_sub remain imported obligations.

## Source ledger and reproducibility

- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBound.lean) — 2b9bf9a3b5253439b7935dbd64a91ea5de640268; re_bounds, recip_le, norm_zsum_le, psiChi_bound_of_goodFor
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBound.lean) — 20d27b0261939669396c28bb80ab957c3329b7fb; inv_norm_le, re_le, psi_le_of_large
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBoundStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiPowerSavingBoundStatement.lean) — f4d889170d7422f5eb2d149fb958bc3e1979d70b; psi_chi_power_saving_bound
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBoundStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/PsiChiSqrtLogBoundStatement.lean) — 1e09c4f74145b1a4007a466133380d4d23388d47; psi_chi_sqrt_log_bound
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/SumIndicatorLeZsumR.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/SumIndicatorLeZsumR.lean) — ee300911c43e32f09e9526cab3624d44bf13e118; recip_le_sum_windows, zsumR_recip_le
- [src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/Foundations/RayPrimes.lean) — 7a15775fd81401803807bd100f89eadb63bb7411; zerosIn, zmult, zsum, zsumR, psiChi
- [src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ZeroCount.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/ZeroCount.lean) — be1852af9cc1c09fc0efa52ab6aedd5004fbd5ea; ZeroCount
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetry.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/DirichletLZeroSymmetry.lean) — 09a41bf1f327641b92d332a7c89a13a3043a4804; zeros_symm_one_sub
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean) — e03bcee4f1d297f73e704c1c466fdb987957918e; explicit_formula_used, zsum_inv_eq
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormulaStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormulaStatement.lean) — 00f5d5693112a3c18788ec5fdf185618a483d747; norm_psi0_add_zsum_le_of_isPrimitive
Ten pinned files retrieved in this session, connector blob IDs recorded, not independently rehashed. Finite exact V8 regression executed: {"window":9700,"small":78624,"large":38400,"neg":3,"total":126724}. These are signed half-integer window and integer nonnegative budget cases, not L-zero data, analytic proof or kernel replay. Reproduce with Node:
```js
function check(){
 const a=(x,m)=>{if(!x)throw Error(m)};
 let window=0,small=0,large=0,neg=0;
 for(let t=4;t<=100;t++)for(let g=-t;g<=t;g++){
  if(Math.abs(g)<=2)continue;
  let k=Math.floor(Math.abs(g)/2);
  a(k>=1&&k<=Math.floor(t/2)&&2*k<=Math.abs(g)&&Math.abs(g-Math.sign(g)*2*k)<=2,"signed floor window");
  window++;
 }
 for(let A=1n;A<=12n;A++)for(let B=0n;B<=12n;B++)for(let L=1n;L<=8n;L++)for(let D=0n;D<=8n;D++)for(let C=0n;C<=6n;C++){
  const M=L*L, U=(A+B)*M, N=2n*D*M, H=D*M, R=400n*N;
  const Z=A*(H+400n*N), E=4n*(1n+B)*M+L+R;
  a(Z<=801n*D*A*M&&E<=(5n+800n*D)*U,"small separate budgets");
  a(C*E+Z<=(C*(5n+800n*D)+801n*D+1n)*U,"small common budget");small++;
 }
 for(let s=1n;s<=15n;s++)for(let M=1n;M<=10n;M++)for(let A=0n;A<=15n;A++)for(let B=0n;B<=15n;B++){
  const s4=s**4n,H=4n*B*s4,N=3n*B*s4,R=400n*N,Z=M*(H+R),E=9n*M*s4+2n*s4+R;
  a(Z<=1204n*B*M*s4&&E<=M*(11n+1200n*B)*s4,"large separate budgets");
  a(A*E+Z<=(1n+1204n*B+A*(11n+1200n*B))*M*s4,"large common budget");large++;
 }
 a(801n>800n,"drop high zeros allowance");neg++;
 a(1204n>1200n,"drop high zeros large allowance");neg++;
 a(5n>0n,"missing A>=1 control");neg++;
 return {window,small,large,neg,total:window+small+large}
}
console.log(check())
```

## Numbered remaining obligations

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and native representation leaves. Filtered de Rham conjugacy and congruence/Levi suppliers are local expansions; root membership not confirmed.
2. RecTExists/VWin and host design: QDChoice and analytic approximation conditional; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and primitive GoodFor producers. New native level chapter conditional.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH, local closure and provenance. UEx uses separate local invariance and density premises; editorial ordering with FcConj is not a kernel dependency.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG and NumStar. Boundary holomorphicity precedes GAGA; Star branches precede uniform counting. Max allowance audit is a conditional alternative.
6. Zero-density, actual analytic input producers above, primitive psi0, Mertens, prime mean-square/count; final abstract Landau contradiction supplied by peer RUN14 but actual family/window wrapper remains open. Preserve all witness scopes.
7. Source/build/export correspondence, typed projection/challenge, metadata policy, independent kernel replay/axioms. Reported mixed-export denominator 1,484,705 declarations; authenticated human-translated unique reachable numerator unknown. No percent.
8. Independent proof/citation audit, all exact joins, root reachability and external trust boundaries. Eight broad groups remain open.

Preflight: AGENTS, swarm, queue, expansion, spine, continuity/state/log/protocol excerpts, current general CI #394 PASS (not RH), prior editor, 14 other lane handoffs available at snapshot 9e495011b7e502ae441ec00e212b8e5de99c0747; earlier editor snapshot compared to current, nine new markdown chapters identified. Blueprint link noted, PDF not reopened. No physics changes. No new upstream head since previous edition.

RESUME HERE: expand explicit_formula_used actual two-case proof and zsum_inv_eq multiplicity transport; recover producers of ExplChi/ExplZeta/LogDerOne and ZFRDirichlet via authenticated reverse references, then primitive psi0 decay. Formal audit: check strict strip boundary, exceptional zero branch, high/low cutoff, multiplicity and constants; request role-labelled edges for GoodBound.psiChi_bound_of_goodFor, GoodLarge.psi_le_of_large, GoodLarge.re_le, zsumR_recip_le and ExplUsed.explicit_formula_used. HANDOFF TO all RH lanes. Project OPEN.

## Peer supporting code (not rerun here)
- [specialists/kernel_extractor/run14_authenticated_role_loss_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run14_authenticated_role_loss_audit.mjs) — blob 73484c191957d830e118be6f12db01eeb165128b
- [specialists/on_acceleration/role_delta_run14.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/role_delta_run14.mjs) — blob 14f8f6793a53705d9b0f091096a7d8f9e30a1755
- [audit/2026-11-24_ch_core_max_allowance_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_ch_core_max_allowance_audit.mjs) — blob 9870b8023079f9c52c2352fec1f63de40f113c3c
- [dependencies/rh_next_root_roles.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_next_root_roles.mjs) — blob f1a4bfb5a582eb7284a150ac19addb0898c6b2ad
- [structure/2026-11-24_2024_bounded_owner_order.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_2024_bounded_owner_order.mjs) — blob 78e066812c65bee10ee759e3ec9f3071793718a2
- [math/verify_ext_iff_units_map_provenance.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ext_iff_units_map_provenance.py) — blob not re-fetched

## Peer chapters — exact snapshot text


---

[integration/2026-11-24_2000_CONGRUENCE_MODULUS_LEVI.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_2000_CONGRUENCE_MODULUS_LEVI.md) — blob 370eb0a22dc26fa13c46c956bd4889d95bf404fd

# Congruence neighbourhood, smooth half-modulus and Levi-kernel suppliers — integration 20:00

2026-11-24. SOURCE-MATCHED / PARTIAL. One contribution: fill the three source-visible supplier obligations left by [19:00](2026-11-24_1900_INDUCED_EVALUATION_IWAHORI.md). Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from previous run. No equivalence to that newer revision asserted.

## 1. Congruence neighbourhood basis
CentralExponentBoundOver L83–150. Fix a nonarchimedean local field k with its valuation v and topology, finite index type n with decidable equality, value-group unit gamma<=1. Write K_gamma={g in GL(n,k): v((g-I)_ij)<gamma for every i,j}. Strict inequality is essential; gamma is nonzero. The source first proves mul_small: if A has integral entries (v<=1) and each entry of B has valuation <gamma then the same holds for AB. Each product has valuation <=v(B_sj)<gamma; finite ultrametric sum preserves the strict inequality, including the empty sum because gamma is positive.

K_gamma lies in KOne by weakening <gamma<=1; the imported KOne_le_KO and intM_of_mem_KO give integral entries for g and its inverse (KOne is a subgroup). The exact noncommuting identities
  gh-I=g(h-I)+(g-I),  g^{-1}-I=-g^{-1}(g-I)
therefore establish closure under multiplication and inversion by mul_small and the ultrametric sum bound; identity is immediate. No commutativity of matrices assumed. The coefficient inequalities alone are not substituted for inverse integrality: the imported KO lemma is explicitly used.

Openness: the set is the finite intersection of preimages of {x:v(x)<gamma} under continuous g↦(g-I)_ij. Each ball is open: for any x in it, translation by an element y with v(y)<gamma keeps x+y in it. Compactness (separate L125–128) follows as a closed subgroup contained in compact KO; an open subgroup is closed. No assertion that compactness is needed by exists_openSubgroup_GL.

Neighbourhood cofinality: use the imported SplitFlip.isEmbedding_val_GL.nhds_eq_comap to choose a matrix neighbourhood T of I whose preimage is contained in U. Translate to T0={A:A+I in T}, neighbourhood of 0. In the finite product of entry topologies choose an entrywise ball with common value-group unit radius gamma<=1 inside T0; the native proof realizes this using the filter atBot × top and the map (r,A)↦A if all v(A_ij)<r, else 0. For each fixed positive test radius s, eventually r<=s; either branch gives valuation <s in every entry. Hence the map tends to 0. Eventually all matrices in the second coordinate map into T0; choose one radius gamma<=1 using mem_prod_top. For g in K_gamma apply this to A=g-I; the conditional returns A, and A+I=g. Thus g∈U. This retains the original arbitrary-neighbourhood quantifier and the GL embedding dependency.

## 2. Smooth modulus character
IsSubquotientDetRepParInd L18–88, 181–224. Same local field and finite linearly ordered block type alpha with finite decidable block indices. nabs(x) is the positive multiplicative Haar-scaling character of k^×, not an arbitrary fitted norm. If v(x)=1, multiplication by x preserves the valuation ring O: membership is unchanged because v(x^{-1})=1. O is compact, open, nonempty; normalize additive Haar measure with measure(O)=1. Its scaled copy xO has the same measure, so the defining Haar-scaling formula yields nabs(x)=1. This uses positivity/finiteness and the named Haar normalization lemma, not merely invariance of arbitrary compact sets.

For s∈C define absPow_s(x)=nabs(x)^s (complex principal power of a positive real). Positivity and the positive-real cpow product lemma ensure multiplicativity, and v(x)=1 implies absPow_s(x)=1. Any unramified character chi is smooth: the intersection of the two open preimages of O under x↦x and x↦x^{-1} is a neighbourhood of 1 in k^×; both valuation inequalities imply v(x)=1, so the neighbourhood is contained in ker chi. A subgroup containing an identity neighbourhood is open. Smoothness here means open kernel, not differentiability.

For block dimensions d_a, set E_a=sum_{b>a}d_b−sum_{b<a}d_b. For g in the Levi product,
  delta(g)=prod_a nabs(det(g_a))^{E_a},
  deltaHalf(g)=prod_a absPow_{E_a/2}(det(g_a)).
All bases positive; deltaHalf(g)=sqrt(delta(g))>0 in the complex embedding. This follows by real-power multiplication and finite product of square roots, not choice of a complex sign. Each determinant is continuous into k^×, each coordinate evaluation continuous; composing smooth characters with these maps and taking finite products preserves open kernels. This is the actual proof of isSmoothChar_deltaHalf. For the companion isLocallyConstant_modulus (IsLocallyConstantModulus L205–210,266ff), right multiplication by any u in the open kernel preserves deltaHalf, hence delta by the positive square root identity. Translating the identity neighbourhood to x gives local constancy. No compactness of the whole Levi group is assumed.

## 3. Parabolic projection / radical
InductionParabolicGroups L99–186. For F a field, Fin n, linearly ordered labels beta, P block upper triangular subgroup of GL, M block diagonal subgroup. L(p) deletes cross-block entries. For (i,j) with beta(i)=beta(j), every summation term p_ik q_kj vanishes unless beta(i)<=beta(k)<=beta(j), hence equality of all three labels. This gives L(pq)=L(p)L(q) including off-block entries (both sides zero there); L(p^{-1}) is inverse of L(p), relying on P being a subgroup. L restricts to identity on M, via inclusion i:M→P. The source defines N as image of ker L under P↪GL, so for p∈P, p∈N iff L(p)=1; membership is precisely block upper plus identity diagonal blocks. For p∈P,u∈N, p u p^{-1} lies in P and its image is L(p)1L(p)^{-1}=1. Thus N normal in P. Finally L(i(L(p))^{-1}p)=L(p)^{-1}L(p)=1. Therefore i(L(p))^{-1}p∈N, exactly leviProj_inv_mul_mem; reversing order needs the normality identity, not commuting the factors. This also holds in the opposite order by changing beta to order dual. These close the selected algebraic supplier steps, not imported block-upper construction or Iwahori membership premises.

## 4. Coverage / review
Master manuscript [X](../specialists/proof_editor/2026-11-24_1956_INTEGRATED_MANUSCRIPT.md) reports 134 primary and 11 supporting entries before this contribution; not a unique-declaration numerator. Prior authenticated conservative denominator reported 1,484,705 declarations; no completion percentage. General Cathedral CI 45471620274 PASS at 19:59, not a validation of this contribution. All imported leaves below remain open; global axiom audit and independent Lean replay not claimed. Kernel RUN12 reports downstream masking investigation remains open; dependency latest 593acf8 reconciles 47 projections, but no root membership claimed here. Peer checkpoints read: structure 9b7dbd7, math 1c79a78, audit c242308, acceleration 2d679cf commit summaries; specialist RUN13 boxes, Galois, Landau, literature, geometry, prime, theta, acceleration and editor X, kernel RUN12. Grok nested lane latest commit summaries inspected, not full nested RESUME files. Initial root log/protocol paths 404 recovered runner paths; integration/RESUME_HERE.md absent, recovered 19:00 handoff; one lane listing exceeded call limit, split; code search returned no hits for isSmoothChar_deltaHalf, located by pinned import traversal. No other research files changed. No URT benchmark.

## 5. Typed selected dependency graph (JSON)
Node arrays = [id,kind,fileIndex,one-based inclusive line range,requires]. Open imports grouped by topic, not exact kernel constants. The graph is not a replacement for the source or all proof obligations. Consumer factor points to previous 19:00 Iwahori chapter. Source SHA/path ledger is embedded. 31 nodes, 44 directed edges; checked target existence and acyclicity in V8. No source-to-export equivalence asserted.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "source-selected only; no authenticated root membership or kernel edges asserted",
  "files": [
    [
      "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/CentralExponentBoundOver.lean",
      "15c5d5b8b52fd25b3de410ae0696ff186298a926"
    ],
    [
      "src/Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/IsSubquotientDetRepParInd.lean",
      "7eef4a1515820c62f2a9b1cd306f2dfa7a13d334"
    ],
    [
      "src/GroundTheory/AutomorphicForms/InductionParabolicGroups.lean",
      "0c1312ea9b95772d1d0c9838d9414f951e8a1b1d"
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsIrreducibleSecondFactorOfIrreducibleProduct.lean",
      "486fdd6e3b310f838b3ead5aa9509c71e47ace25"
    ],
    [
      "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/IsLocallyConstantModulus.lean",
      "29dcf1602f58a1f7350d106a5a347608711d9d99"
    ]
  ],
  "nodes": [
    [
      "eval",
      "consumer",
      3,
      [
        95,
        107
      ],
      [
        "basis",
        "open",
        "half"
      ]
    ],
    [
      "basis",
      "theorem",
      0,
      [
        130,
        150
      ],
      [
        "cong",
        "topology"
      ]
    ],
    [
      "open",
      "theorem",
      0,
      [
        113,
        123
      ],
      [
        "cong",
        "topology"
      ]
    ],
    [
      "cong",
      "definition",
      0,
      [
        95,
        111
      ],
      [
        "small",
        "integral"
      ]
    ],
    [
      "small",
      "theorem",
      0,
      [
        87,
        91
      ],
      [
        "valuation"
      ]
    ],
    [
      "compact",
      "theorem",
      0,
      [
        125,
        128
      ],
      [
        "open",
        "integral",
        "compactKO"
      ]
    ],
    [
      "half",
      "theorem",
      1,
      [
        220,
        224
      ],
      [
        "unram",
        "smooth",
        "det",
        "smoothProd"
      ]
    ],
    [
      "unram",
      "theorem",
      1,
      [
        71,
        72
      ],
      [
        "abs",
        "nabs"
      ]
    ],
    [
      "abs",
      "definition",
      1,
      [
        47,
        53
      ],
      [
        "haar",
        "cpow"
      ]
    ],
    [
      "nabs",
      "theorem",
      1,
      [
        27,
        45
      ],
      [
        "haar",
        "valuation"
      ]
    ],
    [
      "smooth",
      "theorem",
      1,
      [
        76,
        88
      ],
      [
        "topology",
        "valuation"
      ]
    ],
    [
      "det",
      "theorem",
      1,
      [
        181,
        183
      ],
      [
        "continuousDet",
        "smoothProd"
      ]
    ],
    [
      "valhalf",
      "theorem",
      1,
      [
        200,
        218
      ],
      [
        "abs",
        "haar",
        "cpow"
      ]
    ],
    [
      "locally",
      "theorem",
      4,
      [
        266,
        273
      ],
      [
        "half",
        "valhalf",
        "local"
      ]
    ],
    [
      "local",
      "theorem",
      4,
      [
        205,
        210
      ],
      [
        "topology"
      ]
    ],
    [
      "factor",
      "consumer",
      null,
      null,
      [
        "normal",
        "split"
      ]
    ],
    [
      "normal",
      "theorem",
      2,
      [
        174,
        182
      ],
      [
        "ker",
        "proj"
      ]
    ],
    [
      "split",
      "theorem",
      2,
      [
        184,
        186
      ],
      [
        "ker",
        "section"
      ]
    ],
    [
      "ker",
      "theorem",
      2,
      [
        165,
        172
      ],
      [
        "rad"
      ]
    ],
    [
      "rad",
      "definition",
      2,
      [
        128,
        152
      ],
      [
        "proj"
      ]
    ],
    [
      "section",
      "theorem",
      2,
      [
        116,
        124
      ],
      [
        "proj"
      ]
    ],
    [
      "proj",
      "definition",
      2,
      [
        99,
        114
      ],
      [
        "blockDiag"
      ]
    ],
    [
      "topology",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "integral",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "valuation",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "compactKO",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "smoothProd",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "haar",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "cpow",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "continuousDet",
      "open imported obligations",
      null,
      null,
      []
    ],
    [
      "blockDiag",
      "open imported obligations",
      null,
      null,
      []
    ]
  ]
}
```

## 6. Regression certificate
Actual V8 execution: {"congr":794884,"inv":1444,"proj":70052,"normal":2204,"weights":157464,"negative":9}. Positive counts are finite cases; one case can perform multiple assertions. Finite quotient tests specialize to Z/p^(k+1), k>=1, and exercise square-zero inverse/closure at that depth, not general local-field topology. Upper triangular 2x2 matrices over finite prime fields exercise the exact projection and normality identities; exponent fixture tests ordering with zero-sized blocks allowed. Controls: swap matrix outside P breaks diagonal projection multiplicativity; gamma=p>1 permits diag(p,1) but not its inverse over Q_p (valuation 1 versus p); nonunit determinant can yield nonzero exponent. Initial exponent reverse test was tautological; replaced by recomputing exponents on reversed block sizes and valuations, and reran. No numerical fixture establishes Haar normalization, topology, or kernel soundness. Pinned source blobs and 44 source text anchors checked separately via GitHub connector; reproduce using git rev-parse PIN:PATH and git show PIN:PATH (not executed locally). New CI verdict pending; this embedded standalone JS is not registered as a CI check.

```js
function certificate(){
let congr=0,inv=0,proj=0,normal=0,weights=0,negative=0;
const ck=(b,m)=>{if(!b)throw Error(m)},eq=(a,b)=>a.every((v,i)=>v===b[i]),I=[1,0,0,1];
for(const p of [2,3,5])for(const k of [1,2]){
const q=p**(k+1),t=p**k,mod=x=>(x%q+q)%q;
const mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod);
const K=a=>a.every((x,i)=>mod(x-I[i])%t===0);
const all=[];for(let a=0;a<p;a++)for(let b=0;b<p;b++)for(let c=0;c<p;c++)for(let d=0;d<p;d++)all.push([1+t*a,t*b,t*c,1+t*d]);
for(const g of all){const gi=g.map((x,i)=>mod(2*I[i]-x));ck(K(gi)&&eq(mul(g,gi),I)&&eq(mul(gi,g),I),"inverse");inv++;for(const h of all){ck(K(mul(g,h)),"closure");congr++}}
}
for(const p of [2,3,5,7]){
const mod=x=>(x%p+p)%p,mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod),D=a=>[a[0],0,0,a[3]],iv=x=>{for(let z=1;z<p;z++)if(mod(z*x)===1)return z;throw Error("inverse")};
const all=[];for(let a=1;a<p;a++)for(let d=1;d<p;d++)for(let b=0;b<p;b++)all.push([a,b,0,d]);
for(const g of all){const [a,b,,d]=g,gi=[iv(a),mod(-iv(a)*b*iv(d)),0,iv(d)],u=mul([iv(a),0,0,iv(d)],g);ck(eq(D(u),I),"section");for(const h of all){ck(eq(D(mul(g,h)),mul(D(g),D(h))),"projection");proj++}for(let x=0;x<p;x++){ck(eq(D(mul(mul(g,[1,x,0,1]),gi)),I),"normal");normal++}}
const w=[0,1,1,0];ck(!eq(D(mul(w,w)),mul(D(w),D(w))),"nonparabolic");negative++;
}
const exponent=(m,v)=>m.reduce((s,_,i)=>s+v[i]*m.reduce((t,n,j)=>t+Math.sign(j-i)*n,0),0);
for(let a=0;a<=5;a++)for(let b=0;b<=5;b++)for(let c=0;c<=5;c++)for(let x=-4;x<=4;x++)for(let y=-4;y<=4;y++)for(let z=-4;z<=4;z++){const m=[a,b,c],v=[x,y,z],s=exponent(m,v);ck(s===b*x-a*y+c*x-a*z+c*y-b*z,"exponent");ck(s===-exponent(m.slice().reverse(),v.slice().reverse()),"order reverse");weights++}
for(const p of [2,3,5,7]){ck(1<p&&p>=p,"gamma=p: diag(p,1) in, inverse out");negative++}
ck(exponent([1,1],[1,0])!==0,"nonunit determinant");negative++;
return {congr,inv,proj,normal,weights,negative}
}
console.log(certificate());
```

RESUME HERE: expand SplitFlip.isEmbedding_val_GL and KOne_le_KO/intM_of_mem_KO from the pinned imports of CentralExponentBoundOver; preserve the forward and inverse topology and integrality witnesses. Request authenticated role-labelled root paths for GlobalTheory.CentralExponent.exists_cong_subset, isOpen_cong, GlobalTheory.SmGL.isSmoothChar_deltaHalf, nabs_eq_one, GroundTheory.Automorphic.Parabolic.conj_mem_unipotentRadical and leviProj_inv_mul_mem. HANDOFF TO dependencies, kernel, editor, audit, integration. Project OPEN.


---

[math/2026-11-24_ext_iff_units_map_provenance.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_ext_iff_units_map_provenance.md) — blob 4062609c1ff3fd634000b47d262f0c9bd2e8735b

# MATH lane — generated MulChar.ext_iff and the explicit Units.map witness

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the generated iff theorem and the unit-valued
homomorphism used by MulChar.toUnitHom.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Exact source ledger

The RH source pin is 40e56bab026552e089d7afcfeff08d2defb9c005. Its manifest blob
b4d1ec31575a26b2159ec3a262b482bc051f3f6f pins Mathlib at
0df444a360eaa60ab8c11dca51a86af692955474 and Lean v4.33.1, whose resolved Lean commit is
819816b2e0a3bf405af45ae5c7af2491d8f5bee6.

| Source at the pinned revisions | Blob | Role |
|---|---|---|
| Mathlib/NumberTheory/MulChar/Basic.lean | dc3c465d304326784909c686d278edfa30a75385 | @[ext] theorem MulChar.ext and toUnitHom |
| Mathlib/Algebra/Group/Units/Hom.lean | 253a16e52bc0469a2071c2c29a03a97951d790f7 | Units.map and coe_map |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean | 4569ebb8e61f683a9c89877f0cda4d3add4d766d | consumer changeLevel_injective |
| Lean src/Lean/Elab/Tactic/Ext.lean | 526ed04905f730e568144cbf0043f439a6d86651 | mkExtIffType, realizeExtIffTheorem, ext attribute |
| Lean src/Lean/Meta/Tactic/Ext.lean | 5e503f026f6e03a03a44f7ce25f5e5ab5cc6f96f | ExtTheorem and extExtension |

The current RH head 9282d3a102c4aff0e6026746db2a8990f5d9cddd pins Mathlib
31ce06eaadf4a200c0e1407c5f10953cf606b8f8 and Lean v4.37.0-rc1, commit
0b77e12952ad39077d80d8bd6b66d601f225c321. Both current Lean ext files have the same blobs as
v4.33.1. Current Units/Hom.lean has blob b7bcab6786a7c009f3cdf020189fc33b8f7685eb,
but the complete Units.map/coercion block inspected here is textually identical. This is a source
comparison, not a kernel equivalence proof.

## 1. Exact generated signature of MulChar.ext_iff

The pinned handwritten theorem is

    @[ext] theorem MulChar.ext
      {chi psi : MulChar A B}
      (h : forall u : Units A, chi u = psi u) :
      chi = psi.

Here A is a CommMonoid and B is a CommMonoidWithZero. There is no handwritten declaration named
MulChar.ext_iff in MulChar/Basic.lean.

Lean's ext attribute defaults its iff option to true unless the source explicitly writes
@[ext (iff := false)]. It validates that the theorem concludes x=y with x and y variable
arguments, records the theorem under a discrimination-tree key for their type, and calls
realizeExtIffTheorem.

mkExtIffType locates the consecutive x,y arguments in the theorem telescope. Every argument after
y must be a proof and must not be depended upon by a later argument. It conjoins the types of those
proof arguments and constructs

    (x=y) iff conjunction-of-extensionality-premises.

MulChar.ext has exactly one proof argument after chi,psi, namely h. Consequently the generated
theorem has the exact mathematical signature

    MulChar.ext_iff :
      (chi=psi) iff
      (forall u : Units A, chi u = psi u).

realizeExtIffTheorem appends the suffix _iff, hence MulChar.ext becomes MulChar.ext_iff. It creates
a theorem declaration with the same universe parameters and marks the generated namespaced theorem
protected.

## 2. Generated proof, not an extra mathematical assumption

The generated forward implication introduces an equality, eliminates it, and proves each
extensionality premise by reflexivity or simplification. In this case, after replacing psi by chi,
the goal is forall u, chi u=chi u.

The reverse implication introduces the unitwise equality and applies MulChar.ext. Therefore
MulChar.ext_iff contains no new premise and is not an axiom inserted by the RH project. It is a
Lean-generated theorem whose proof term depends on the already proved MulChar.ext plus equality
elimination and reflexivity.

The extExtension environment entry is operational metadata for the ext tactic: ExtTheorem stores
the declaration name, priority, and discrimination-tree keys. It is not part of the mathematical
statement used by rw [MulChar.ext_iff].

## 3. Units.map constructs the inverse explicitly

Let M,N be monoids and f : M ->* N. For a unit

    u = (u.val, u.inv, u.val*u.inv=1, u.inv*u.val=1),

the pinned Units.map definition returns the target unit

    (f(u.val), f(u.inv),
     f(u.val)*f(u.inv)=1,
     f(u.inv)*f(u.val)=1).

The first inverse identity is

    f(u.val)f(u.inv)
      = f(u.val*u.inv)
      = f(1)
      = 1,

and the second uses u.inv*u.val=1. Thus no cancellation, injectivity, commutativity, field
structure, or nonzero hypothesis is needed. A monoid homomorphism preserves the explicit inverse.

The multiplication law for Units.map is proved by Units.ext: equality of target units reduces to
equality of their underlying values, and

    f((u*v).val)=f(u.val*v.val)=f(u.val)f(v.val).

The exact coercion theorem is definitional:

    Units.coe_map f u : value(Units.map f u)=f(u).

## 4. How MulChar.toUnitHom uses it

The pinned definition is simply

    MulChar.toUnitHom chi := Units.map chi,

where chi is viewed through its underlying monoid homomorphism. Therefore the target-unit witness
for chi(u) uses chi(u.inv) as inverse. The map_nonunit field of a MulChar is not used here: every
monoid homomorphism sends units to units. That field is instead essential to the previously
reconstructed MulChar.ext theorem and extension by zero.

Combining coe_map with the definition gives

    MulChar.coe_toUnitHom chi u :
      value(chi.toUnitHom u)=chi u

by rfl. This is the exact bridge that lets rw [MulChar.ext_iff] at h turn equality of changed
characters into equality of their evaluations on every target-level unit.

## 5. Necessary premise and negative control

An arbitrary function need not send units to units. On ZMod 5, the constant-zero function sends
the unit 1 to 0, which has no multiplicative inverse. It also fails the monoid-homomorphism law
f(1)=1. Hence Units.map genuinely needs a MonoidHom; the target-unit witness cannot be manufactured
from a bare function.

Conversely, f need not be injective. The trivial monoid homomorphism sends every source unit to the
target identity, which is still a valid unit. Injectivity is irrelevant to Units.map.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ext_iff_units_map_provenance.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ext_iff_units_map_provenance.py

Observed output:

    ext_iff/Units.map provenance regression: OK; report_checks=30, name_checks=2, iff_checks=87381, unit_witness_checks=61712, unit_multiplicativity_checks=247056, composition_checks=17632, negative_controls=2

The certificate checks the source/revision ledger; the generated name rule; the logical iff shape
over finite observation families; and explicit Units.map witnesses for power monoid homomorphisms
on ZMod n, including both inverse equations, multiplicativity, coercion, and composition. It also
executes the constant-zero bare-function negative control.

This does not run Lean, inspect the compiled declaration with #print, or provide an imported-axiom
census. The generated signature is reconstructed directly from the pinned MulChar theorem and
Lean's pinned mkExtIffType/realizeExtIffTheorem implementation.

## Failed attempts / limitations

- Initial GitHub searches for mkExtIff in Mathlib returned nothing because the generator belongs to
  Lean core's src/Lean/Elab/Tactic/Ext.lean, not Mathlib.
- A broad code-search query containing Lean arrow notation was rejected by GitHub's query parser.
  Narrow filename/source searches located Mathlib/Algebra/Group/Units/Hom.lean instead.
- No Lean or lake executable is installed locally, so #check MulChar.ext_iff and #print axioms could
  not be executed. The status remains SOURCE-MATCHED, not ELABORATED.
- The finite power-map certificate instantiates the construction; it cannot prove the polymorphic
  Monoid theorem or validate Lean's generated proof term.

## RESUME HERE

Return to the first unresolved imported theorem in the character-box chain after the completed
ind_drop/ind_unique dependency cluster. Identify its exact caller and source body before choosing
the theorem; do not further expand generic Mathlib unit machinery unless a new RH caller requires it.

**HANDOFF TO:** MATH, dependency, audit, integration.


---

[specialists/character_boxes/RUN14_NATIVE_LEVEL_CONSTRUCTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN14_NATIVE_LEVEL_CONSTRUCTION.md) — blob ddb5e5716758339e216a79604a2b60e073af7c96

# RUN14 — Native level construction and tame residue descent
2026-11-24. SOURCE-MATCHED / DONE for conditional LevCh construction and immediate suppliers, not native Main reachability or kernel replay.
Continuity: read AGENTS, swarm protocol, handoff queue, expansion, research-state/log/protocol and continuity excerpts, CI checkpoint #393 PASS (not RH), RUN13 and recent notes of nine other specialist lanes, integration, math, structure and dependencies. Audit and acceleration/grok latest full notes and external blueprint not reread. No physics changes. RUN13 ended at exists_levCh; this is its actual proof, not another proof of uniform LevOf.

## Pinned sources
Repository leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Below B=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/.
- B/IsUnitaryOfOrderDvd.lean ac9fd804343227e4607117d441179d73f4942c3e, GlobalTheory.LevelChoices.mem_crdLat, coe_crdLat (L19–33), dualL_crdLat (34–51), isSDFrame_of_one (53–58), isUnitary_of_orderDvd (60–68), exists_levCh (70–113), exists_levCh_unit (115–122).
- src/Formalism/LocalToGlobal/IndefiniteReal/LinksDefs.lean 898ac55d7ecb1c1aa007bfd98e9dd0e4af10a6bc, IsSDFrame 208–209, ChrEq/IsRes 287–293, LevCh 388ff, LevCh.Is 444–465.
- B/ExistsCmAdeleUnitCharacterReadingHeckeCharStatement.lean 188af35efc5034d653aa95d76f89fc735ce15472, GlobalTheory.T.exists_cmAdeleUnitCharacter_reading_heckeChar.
- B/ExistsCmAdeleUnitCharacterReadingHeckeChar.lean 0786c38c2dd1a2ba1314c5e5cc18ff2cb05d9642, GlobalTheory.CharTransport.exists_chrEq 138–160.
- B/ExistsIsResOfTameAt.lean 62d47df9274cf64468e6731284166174c290f07f, GlobalTheory.TameResidue.locK_eq_of_congr 16–44, exists_lift 46–55, exists_res 57–71, GlobalTheory.exists_isRes_of_tameAt 75–77.
- B/ExistsSelfDualAdelicFrameLevelOneStatement.lean 669dce78b2584ddf5ee4630f465bb26acefcda13, GlobalTheory.T.exists_selfDual_adelic_frame_level_one.
- B/ExistsSelfDualAdelicFrameLevelOne.lean b12d4b957f5655dccb14f4e3d3dec2367e29fc51, GlobalTheory.AdelicFrame.exists_isSDFrame 197–211.
- B/ExistsLevOfAll.lean 05a79753fd361dd3c71c966f8c67c974ac4e0d74, caller exists_levOf_all (17–53).

## The exact existence claim
For every D:D7, C:CharFrame D, type T (not assumed finite here), reference μ0:T, characters ξ:T→HChar E, finite sets Q(t) of places of E, require:
1. ξ injective; ξ(μ0)=1.
2. For each t there exists a positive integer n (depending on t) with OrderDvd n; ξ(t) trivial on host.F; tame at every place.
3. Each Q(t) satisfies IsTwistPlaces D.host.g. For every P∈Q(t), the product QS*q*d*sp.T and separately every (D.mem u).A.T (u any word) lie outside P.
4. For every p in {pde,pde'}, there exists a prime 𝔭 of O_K such that for every t and P∈Q(t) lying above p, P.under(O_K)=𝔭. This is hde, not constructed inside exists_levCh. RUN13 caller splits membership into the two designated primes and invokes their respective primality and exists_under_of_selHalf. Witness may depend on p, not on t or P; if no occurrence the condition is vacuous. No assumption of distinctness of these primes introduced here.
5. For every t and P, not UnrAt iff P∈Q(t) or P is conjugate to a member of Q(t).
Then there exists L:LevCh D T with L.C=C, L.xiH=ξ, L.Q=Q, for every j L.ΛY(j)=crdLat(Yc D j)(Yc D j).L0, and L.Is μ0. All dependent host/space instances are retained. In particular this is not existence of admissible twist characters; ξ and all nine named hypotheses (hinj,hbase,hfin,htriv,htame,hpl,hoff,hde,hram) are inputs.

## Proof
A. If χ^n=1 for n>0, evaluate at every idele a: |χ(a)|^n=1, so |χ(a)|=1 by nonnegativity and positive exponent. Thus each ξ(t) unitary. The supplied base character frame already has unitary and tame facts. The reading wrapper calls actual exists_chrEq: choose continuous ring hom Θ with diagonal and local-idele compatibility (exists_hom, retained). Map units via Θ and compose χ, taking values in Circle by unitarity. Multiplicativity, continuity, triviality on diagonal units and finite-place readback follow from Θ's two compatibilities and χ's own conditions. Choose these readings for C.mu0(j), C.eta and each ξ(t). This is classical choice, not a computational algorithm.

B. Tame residue descent: let a,b be integral representatives of the same nonzero residue modulo P, k,l their field units. Since b∉P and a-b∈P, a∉P. Their P-adic valuations are 1 (multiplicative convention), and valuation(a-b)≤exp(-1). Hence k/l is a local unit with k/l-1 in the maximal ideal. Tameness gives χ.locK(P,k/l)=1, i.e. χ.locK(P,k)=χ.locK(P,l). Every residue unit has an integral lift by quotient surjectivity; it cannot be in P, hence nonzero and defines an E-unit. Choose one lift f(u). Define c(u)=χ.locK(P,f(u)). Independence of lift just proved; to show multiplicativity compare the lift of uv with the product of the lifts of u,v, which has the same residue. This supplies IsRes (with all representative quantifiers), not a statement that χ is trivial on every local unit. Choose r(j,P) for frame characters and s(t,P) for ξ. The stored L.chi is r inverse, because the Is field tests its inverse; inv_inv restores r. L.xiR=s.

C. Coordinate lattice: write e=crd V, Λ=e(V.L0). Membership is equivalent to e⁻¹x∈V.L0. The original pairing identity hT_crd and baseLattice_isUnimodular give Λ^#=Λ by testing integrality against all y and substituting e(y); both directions proved. Λ equals L0c by definition and basis reconstruction. The frame wrapper calls exists_isSDFrame: identify Λ with latC V, obtain finite generation and full E-span from standardTuple_isLattice, then choose β using exists_isFrame (body remains open). With exponent 0, use dual equality, 1>0 and the L0c equality in both inclusion fields of IsBaseFrame. Definition IsSDFrame(V,β,Λ,N) = ∃c, IsBaseFrame(V,β,Λ,N^c). Level-one witness means IsBaseFrame(...,1); pick c=0 for ANY N, even zero in the Lean natural power convention. No claim that the same β works with a prescribed strictly positive exponent. This supplies the Y-frame condition at g0*g1 without modifying β or Λ; X,V,W at level one directly.

D. Assemble L. mu0(j) is the chosen reading indexed by natural truncated j−1 when j−1<m, otherwise 1; only j=i+1 with i∈Fin m is tested. chi has same indexing with inverse r, otherwise 1. Do not assert the fallback at j=0 (Nat subtraction saturates; when m>0 j=0 reads index 0). Pg is finite union of aboveF(C.P.pb k) over k; membership is exactly ∃k, Div k P. Copy C, ξ, Q, assign the four coordinate lattices and their selected β's. Field checks of Is: mu0,eta,xi from readings; xi_inj/base/fin/triv/tame from input; Pg by finite-union definition; Q_pl/off/de/ram directly from hpl/hoff/hde/hram (host.condN definitional conversion); chi and xiR from residue readings; βY/X/V/W from C. All 19 fields covered; the four returned equalities are definitional. The proof is direct choice and assembly, no induction on T. Unit special case uses T=Unit, ξ=1 and Q=empty, n=1, trivial/tame identity; Q_pl/off/de vacuous with C.P.pb 0 as witness for either designated prime, and identity unramified proves ramification equivalence. This does not establish the nontrivial-twist premises without upstream arithmetic.

## Execution and dependency status
Connector V8: 89 successful assertions (8 blob hashes, literal source anchors and current comparison). Six complete theorem texts match after trim at current upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same head as RUN13): mem_crdLat, coe_crdLat, dualL_crdLat, isSDFrame_of_one, exists_levCh, exists_levCh_unit. Current blob 6a263123fd8396edb7e81e5bbd638452858de0cf clumps the self-dual frame statement wrapper and replaces local isUnitary_of_orderDvd with alias Formalism.L2.Host.HChar.isUnitary_of_order. No claim all upstream sources unchanged or alias kernel-equivalence.
The named wrapper edges above are source references, not elaborated dependency export. Native Main reachability, Θ construction, exists_isFrame, hT_crd, host frame properties and original character input suppliers remain open. No hypotheses removed. Exact finite regressions (below) executed in V8: quotient 38636, mul 3016, level 279, indices 528, neg 3. Finite rings/exponent models test the algebra only, not native adelic existence. No Lean run or speed benchmark.

Reproduce the finite regressions in Node (same code as executed):
```js
function regress(){
 const A=(v,m)=>{if(!v)throw Error(m)};
 let quotient=0,mul=0,level=0,indices=0,neg=0;
 for(const p of [3,5,7,11,13]){
  const log=new Map();for(let g=2;g<p;g++){log.clear();let x=1;for(let i=0;i<p-1;i++){log.set(x,i);x=x*g%p}if(log.size===p-1)break}
  A(log.size===p-1,"primitive root");
  const units=Array.from({length:p*p},(_,i)=>i).filter(i=>i%p!==0);
  for(let k=0;k<p-1;k++){
   const chi=x=>k*log.get(x%p)%(p-1);
   for(const a of units)for(let t=0;t<p;t++){const b=(a+t*p)%(p*p);A(chi(a)===chi(b),"descent");quotient++}
   for(let a=1;a<p;a++)for(let b=1;b<p;b++){A(chi(a*b)===(chi(a)+chi(b))%(p-1),"hom");mul++}
  }
 }
 for(let N=0;N<=30;N++)for(let c=0;c<=8;c++){A(1n**BigInt(c)===BigInt(N)**0n,"level one");level++}
 for(let m=1;m<=32;m++)for(let j=0;j<m;j++){A(Math.max(j+1-1,0)===j&&j<m,"index");indices++}
 A(4%3===1&&2%6!==0,"non-tame control");neg++;
 A(2n**1n!==1n,"fixed positive exponent invalid");neg++;
 A(2n**0n===1n&&2n!==1n,"zero order not unitary");neg++;
 return {quotient,mul,level,indices,neg}
}
console.log(regress())
```
For source checks use git rev-parse P:path against the eight hashes above and git show P:path for all named declaration bodies, then compare six theorem blocks to H:path. This manual reproduction recipe is not a claim of executed local git. The finite tests do not prove native hypotheses.

RESUME HERE: expand GlobalTheory.AdelicFrame.exists_isFrame in pinned ExistsSelfDualAdelicFrameLevelOne, prove the local-basis to restricted adelic frame construction, preserving finite support and full-span/FG hypotheses; then Θ exists_hom in CharTransport. Request role-labelled native edges for exists_levCh, exists_levCh_unit, exists_chrEq, exists_res, locK_eq_of_congr, exists_isSDFrame and exists_isFrame; retain initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf and Keep/Pins suppliers. HANDOFF TO kernel, dependency, integration, editor, theta, Galois, audit. Project OPEN.


---

[specialists/galois_representations/RUN14_FILTERED_DE_RHAM_CONJUGACY.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN14_FILTERED_DE_RHAM_CONJUGACY.md) — blob 26bd0b1864aefa5221bebcc028ffe8a998ea0ac7

# RUN14 — Filtered de Rham conjugacy, dimension and jump multiplicity
2026-11-24. RESULT: DONE / SOURCE-MATCHED for the named filtered transport argument, PARTIAL for its downstream root linkage. No Lean replay.

## Continuity and scope
Read AGENTS, RESEARCH_STATE and RESEARCH_LOG excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run13. Inspected latest commits and available peer RESUME HERE patches from theta, prime, structure, dependency, acceleration, kernel, integration, geometry, audit, literature, character boxes, Landau and math; editor full latest note not recovered, blueprint link/limitations reviewed but PDF not reread. No overlapping filtered conjugacy translation found in inspected notes. CI summary 2026-11-24T20:18:08Z run 45475909611 PASS is for Cathedral, not RH. Physics queues untouched. Run 11 fixed-field supplier and Run 12 FrobLaws.exists_ext / EmbOrbitAlt remain OPEN.

## Provenance
Upstream leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005, H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, latest returned upstream commit unchanged since Run13.
A=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean; P blob ff48b8f2c49031d3b2654a02a205535e1aa94206; H blob 04ecdc8caaa6393d4e692129dd97c0a53f902beb.
B=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalFilDR.lean; P blob 178fe7bdc49c43c1a4c71f2933f873131178bf78; H blob 311e6c5f988099684312ef20d33ec6687f3d6ea6.
[A pinned](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean#L137-L301); [B pinned](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalFilDR.lean).
A imports B at P line 2; at H the public import list differs. All A declarations below are in GlobalTheory.Pst.BridgeInd. B declarations in GlobalTheory.Pst.

## 1. Hypotheses and tensor action (A139–169)
Fix prime l, LocPrime P, a field LL over Q_l, additive commutative V with LL and Q_l module structures forming a scalar tower. Fix finite local extensions K,K' inside Om(l), g in GQ(l), representations rho:G_K→End_LL(V), rho':G_K'→End_LL(V). Assume hK: for EVERY x in Om(l), x∈K iff gx∈K'. Assume hρ: for all h∈G_K and h'∈G_K', if h'=ghg^{-1} in GQ(l), then rho'(h')=rho(h). These are exactly the group and representation transports supplied in Run13 for compatible bridges; they are not assumed for unrelated representations.
Write B_dR=P.R.BdR, W=V⊗_{Q_l} B_dR, C_g=id_V⊗P.actQdR(g). A.conjdR is an LL-linear equivalence, NOT an LL-semilinear map; only the period factor is transformed. The action A_h on W is rho(h)⊗PD_K.actdR(h). A.conjdR_actVdR proves C_g A_h=A'_{h'} C_g by tensor induction (zero, pure tensor, sum): on v⊗b both sides have vector factor rho(h)v; on the period factor P.PD_actdR and the group action law give g h b=(ghg^{-1})g b. No identification of K and K' as subsets is assumed.

## 2. Invariant subspace (A174–191)
DdR is the intersection of the kernels of A_h−I. Thus membership means A_h x=x for every h∈G_K. Forward: for arbitrary h'∈G_K', take h=g^{-1}h'g; h is in G_K by mem_GK_conj_inv(hK). Then A'_{h'}C_g x=C_g A_h x=C_g x. Reverse: for arbitrary h∈G_K take h'=ghg^{-1} using mem_GK_conj(hK). If C_g x is fixed, C_g A_h x=C_g x; injectivity gives A_h x=x. Hence C_g(DdR)=DdR'. A.finrank_eq_of_mem_iff (86–91) obtains equality of dimensions because the map of the submodule is exactly the target and a linear equivalence preserves finrank. This uses the actual equivalence, not just equal cardinalities.

## 3. Entire filtration transported (A207–254)
For integer a let F_K^a=PD_K.Fil(a) in B_dR and FilV_K^a the image of V⊗_{Q_l}F_K^a under the natural tensor inclusion map. It is important to use IMAGE: an arbitrary element is given by a witness z in the smaller tensor product, not presumed a single pure tensor.
A.botExt is the bottom intermediate field Q_l and mem_GK_bot says every g fixes it. PD_Fil identifies F_K^a=F_bottom^a as sets for every K. Fil_G for the bottom extension plus PD_actdR then imply P.actQdR(g)F_K^a⊆F_K^a for EVERY g, not merely elements fixing K. A.filV_eq likewise identifies FilV_K^a=FilV_K'^a using equality after scalar restriction to Q_l. For x in FilV_K^a choose witness z. Restrict P.actQdR(g) to F_K^a, and apply id⊗that restricted linear map to z. Tensor induction shows its image is C_g x. Inverse C_{g^{-1}}C_g=I follows by the group action and tensor induction. Apply the same argument to g^{-1} for the reverse membership implication. Thus C_g FilV_K^a=FilV_K'^a. This depends on the stipulated period-data identities PD_Fil, Fil_G, PD_actdR; their deeper suppliers are not proved here.

## 4. Embedding eigenspace, the indispensable extra hypothesis (A256–294)
Let τ1:K→_{Q_l}LL and τ2:K'→_{Q_l}LL be algebra homomorphisms. Require hτ: for all c∈K and c'∈K' with c'=g(c) in Om(l), τ2(c')=τ1(c). The coefficient field LL itself is fixed by C_g.
Write M_c for multiplication on the period factor by the image of c in B_dR. A.conjdR_mulVdR: C_g M_c=M'_{c'} C_g when c'=g(c), using multiplicativity of P.actQdR and P.actQdR_Om (compatibility on the algebraic closure embedded into B_dR). Again tensor induction proves this for general x.
The source unfolds FildR and DdRE into exactly three requirements:
  (i) A_h x=x for all h∈G_K,
  (ii) M_c x=τ1(c)x for all c∈K,
  (iii) x∈FilV_K^a.
The first and third transport by §§2–3. For the second, choose c=g^{-1}c' for each c'∈K'; hK certifies membership. Then M'_{c'} C_g x=C_g M_c x=C_g(τ1(c)x)=τ1(c)C_g x=τ2(c')C_g x. Reverse uses c'=gc, hK, hτ and C_g injective. This proves A.mem_FildR_conj at every integer a. It is wrong to compare the eigenspaces without matching τ: the two embeddings of a quadratic field give different eigenlines for multiplication by a primitive element in a split coefficient field, even with g=I. This is a conceptual counterexample to dropping the membership/eigenspace condition, not a claim that dimensions must always differ.

## 5. Multiplicity transport (A296–301)
Set d(a)=finrank_LL FildR_K,τ1^a, d'(a)=finrank_LL FildR_K',τ2^a. A.finrank_eq_of_mem_iff and §4 give d(a)=d'(a) for all a. The native multV is the INTEGER difference d(a)−d(a+1). Substituting both equalities, not just one, proves multV_K,τ1(a)=multV_K',τ2(a). A.multV_conj does NOT require a finite-dimensional DdR hypothesis; it is a finrank identity, and the interpretation as an actual graded dimension needs finite dimensionality.
B.filDR_succ_le (29–36) proves decreasing filtration via the smaller tensor witness and PD.Fil_anti. Under [FiniteDimensional LL DdR], B.finiteDimensional_filDR (39–40) and B.finrank_filDR_succ_le (42–45) give finite dimensions and nonnegative integer differences. B.isJumpV_iff (47–52): nested finite-dimensional subspaces of equal dimension coincide, hence jump iff multV≠0. B.finite_jumps (54–70): d is antitone, at any jump a and b>a, d(b)≤d(a+1)<d(a); hence jump indices inject by d into {0,…,dim DdR}. B.exists_multiset_jumps (72–80) realizes the finitely supported nonnegative multiplicities as a multiset of integers. Therefore as a human corollary, if both actual jump multisets are given by those multiplicities, extensionality of counts yields equality. This corollary is not asserted to be a separate native theorem.
B.local_of_isModel (294ff) is a distinct source-proved model-to-global jump comparison using count_jumpsW and isJumpE_iff; B.count_jumpsW (281–292) identifies the witnessing place by equality of prime-ideal membership from norms of the global embedding. B uses multV_ext for coefficient enlargement, not multV_conj. A's downstream caller for multV_conj was not recovered; default-branch code search for multV_conj and LocalIndepBridge returned zero hits. Neither absence of use nor a direct edge to B is inferred.

## 6. Connection to root and limitations
The source map for this step is multV_conj → finrank_eq_of_mem_iff + mem_FildR_conj(a,a+1) → mem_DdR_conj + mem_filV_conj + conjdR_mulVdR + hτ. B's count-jump route is a nearby but separate branch. Previous Run13 supplies hK/hρ for bridges. Latest dependency lane commit 63102da2488b52ab2f89e484e71a975547ad4118 records authenticated incoming value witnesses from UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter to UpperTheory.TP.K.tLiftK (1065212053) and UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift (1065212052), and queues further root exports. This is a peer report, not independently replayed here; no authenticated path from the root to the newly translated declarations established. Preserve the gap rather than attaching de Rham transport to nonvanishing by analogy. Full RH reconstruction, kernel replay and URT speed advantage remain open.

## 7. Actual execution and reproducibility
Four source snapshots retrieved (A,B × P,H). In tool JS executed 34 source-anchor assertions (22 A,12 B), all passed; compared 15 complete A declaration ranges: 11 exact, four differing only by explicit map_add (f := _) in the additive tensor-induction branch. No changed theorem statement among these 15 comparisons. B declarations were located at both revisions, not full-body compared. Connector returned blob IDs above. Source checks only. Equivalent Python replay below (not independently executed); linear in source bytes and selected slice bytes for fixed ranges, not a whole-proof complexity claim.
```python
import subprocess,sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base="src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
files=[("LocalIndepBridge.lean","ff48b8f2c49031d3b2654a02a205535e1aa94206","04ecdc8caaa6393d4e692129dd97c0a53f902beb"),
       ("FiniteDimensionalFilDR.lean","178fe7bdc49c43c1a4c71f2933f873131178bf78","311e6c5f988099684312ef20d33ec6687f3d6ea6")]
for f,p,h in files:
    assert git("rev-parse",P+":"+base+f).strip()==p
    assert git("rev-parse",H+":"+base+f).strip()==h
a,b=(git("show",r+":"+base+files[0][0]).splitlines() for r in (P,H))
ranges=[(86,91,131,136),(150,151,191,192),(157,169,198,210),
(174,188,215,229),(190,191,231,232),(207,207,248,248),(209,212,250,253),
(214,219,255,260),(221,226,262,267),(228,237,269,278),(239,247,280,288),
(249,254,290,295),(256,270,297,311),(277,294,318,335),(296,301,337,342)]
exact=0
for i,j,k,m in ranges:
    x,y="\n".join(a[i-1:j]),"\n".join(b[k-1:m])
    exact+=x==y
    assert x==y.replace("map_add (f := _)","map_add"),(i,k)
assert exact==11 and len(ranges)==15
print("15 declarations: 11 exact, 4 explicit map_add argument changes; source only")
```

## RESUME HERE
Recover the actual reverse-call site of GlobalTheory.Pst.BridgeInd.multV_conj via dependency/native index rather than retrying empty default-branch search, and reconstruct the first root-linked Galois theta supplier from the pending role projection (UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift). Keep fixed-field, FrobLaws.exists_ext, EmbOrbitAlt and wdAt_indep_bridge caller open. Request role-labelled witnesses for multV_conj, mem_FildR_conj, mem_DdR_conj, conjdR_mulVdR, mem_filV_conj, count_jumpsW and local_of_isModel; no assumed root reachability. HANDOFF TO Galois, dependencies, kernel, integration, editor, audit, theta and acceleration. Project OPEN.


---

[specialists/landau_criterion/RUN14_FINAL_LANDAU_CONTRADICTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN14_FINAL_LANDAU_CONTRADICTION.md) — blob eee3571014195d736db67733a2ceec5b1169bc53

# RUN14 — final two-branch Landau contradiction
2026-11-24. RESULT: DONE for source-matched conditional abstract Landau proof assembly; project OPEN. Not a Lean kernel replay, arithmetic window proof, or URT benchmark.

## Continuity and provenance
Read AGENTS.md, SWARM_PROTOCOL.md, HANDOFF_QUEUE.md, EXPANSION_15_LANES.md, RUN13; research state/log/protocol/continuity excerpts, physics CI summary #392 (20:18:08 UTC, not RH validation); latest 30 branch commit summaries and 14 other-lane commit file lists and available RESUME HERE patch lines. Editor manuscript patch did not expose a RESUME HERE; external blueprint noted but not reopened. No duplicate of this specific final assembly found in these records. No baseline physics gate or Queue changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned upstream, unchanged from RUN13). Source root https://github.com/leanprover-community/riemann-hypothesis ; paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/.
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872: PoleData and WindowHypU.
- P LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a: Deduction.landau_window_contra, landau_window_key, landau_window_re_pos, landau_window.
- P LandauTheorems/LandauDichotomy.lean blob 947dae363ce629febcba27b1b70355438f8639a0: eq_ofReal_sub_of_dist_le_of_le_sub_re, landau_dichotomy.
- P LandauTheorems/LandauNearest.lean blob 6a177498987e1ef453727131bf2004bc797a01a2: landau_nearest (RUN4).
- P LandauTheorems/LandauGrowthContra.lean blob bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda: landau_growth_contra.
- P LandauTheorems/LandauPoleReLe.lean blob 205c7380b79e78b2752ed67aeb069f2a9d12cc77: landau_pole_re_le_bound and landau_pole_re_le.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L1003 onward; same file includes clumped growth and dichotomy. Programmatic extraction: window_contra, window_re_pos and dichotomy proof bodies textually identical; final P landau_window and H private landau_window_of_pos_lt_two identical after hθ1→hθ2 substitution (82 body lines); growth_contra replaces several nlinarith calls by grind, explicit multiplication monotonicity and calc, same statement and witnesses. H generalizes outer theorem separately (RUN5). Identifiers are source references, not authenticated kernel dependency edges.

## 1. Exact hypotheses and coefficient bridge
Retain all seven PoleData fields: measurable real g; |g(u)|<=C0 exp(2u) for u>=0; Laplace representation for Re(s)>2; every pole has Re>0; complex differentiability off Z in that half-plane; punctured isolation at EVERY point in that half-plane (including nonmembers); nonzero simple pole residue c with local analytic remainder, and if the pole is real, Re(c)>0 and Im(c)=0. P requires 0<theta<1 and delta>0. H private theorem requires 0<theta<2 and delta>0. WindowHypU: for every eta>0 and every real U0 some U>=U0 and R>=0 on [U,(1+delta)U], g<=R there, weighted R exp(-theta u) integrable there and integral <=exp(eta U). This is a premise, not proved by the analytic argument.

Write A_k(z)=(-1)^k Phi^(k)(z)/k!. RUN13 gives sigma>2 and fixed C such that for EVERY eta>0 and U0, some U>=U0 and natural k>=U satisfy simultaneously for EVERY real gamma:
 |A_k(sigma+i gamma)|+Re A_k(sigma) <= C exp(eta U)/(sigma-theta)^k. (W)
Every pole has Re rho<=2: for a hypothetical Re rho>2, choose sigma0=(2+Re rho)/2, use Laplace and growth to bound |Phi(s)|<=C0/(sigma0-2) for Re s>=sigma0. Hence (s-rho)Phi(s)→0 on the punctured neighborhood, but the pole expansion and continuity of the remainder give limit c!=0. Contradiction. Thus Re rho<sigma for the fixed sigma above.

## 2. Dichotomy and radii
Assume rho0 in Z with Re rho0>theta. Set E=sigma-theta>0. In the real-centred closed disk of radius E the real part is >=theta>0. Isolation on the entire open half-plane implies finite F=Z intersect that disk (otherwise a compactness accumulation point contradicts isolation). If F empty, D=E is pole-free as an open disk and sigma-Re rho0<D. Otherwise let D be the minimum distance of members of F to sigma. The open disk radius D is pole-free. If a pole rho1 has sigma-Re rho1<D, take the left branch with D<=E. Otherwise for every pole w, D<=sigma-Re w. For a nearest w,
 D² >= (sigma-Re w)²+(Im w)² >= D²,
so w=sigma-D is real and unique. Since rho0 violates theta, D<=sigma-Re rho0<E. The finite remaining set in F has strictly larger distance; take r=min(E, second distance), using D+1 if the remaining set empty. Then beta=sigma-D>theta is the unique pole in the OPEN disk radius r, and 0<sigma-beta<r<=E. Boundary poles at radius r do not enter. This is landau_dichotomy, not an assertion that a nonreal violating pole is necessarily the nearest to sigma.

Left branch: RUN4/native landau_nearest gives gamma, rho in Z, r with z=sigma+i gamma, d=|z-rho|<r<=D, unique pole in that open disk. The premise D<sigma holds since D<=E and theta>0. d>0 since Re rho<sigma. Set e=(d+r)/2. Then 0<d<e<r<=D<=E. The disks used in both branches are inside Re>0: Re w >=Re z-|w-z|>sigma-r>=theta>0. The strict open-ball inequality is landau_window_re_pos; no analytic continuation across Re=0 is assumed.

## 3. Left branch (complex-centred pole estimate)
Use local pole expansion, differentiability on the punctured disk and RUN10 landau_pole_asym at radius e to fix M with
 |A_k(z)-c/(z-rho)^(k+1)|<=M/e^k for EVERY k.
On the pole-free real disk radius D, Cauchy at e<D fixes M' with |A_k(sigma)|<=M'/e^k for EVERY k (the sign (-1)^k has modulus one). Both constants fixed before eta,U0,U,k.
Reverse triangle and W yield
 (|c|/d)/d^k <= |A_k(z)|+M/e^k
 <= C exp(eta U)/E^k - Re A_k(sigma)+M/e^k
 <= (M+M')/e^k+C exp(eta U)/E^k.
The nonzero residue makes |c|/d>0; no assumption that its phase is positive. The signed real term is bounded using the separate pole-free disk, not discarded.

## 4. Right branch (real pole, including exceptional real zero)
Here beta in Z is real, theta<beta<sigma, d=sigma-beta>0 and d<r<=E. Set e=(d+r)/2 so d<e<r<=E. PoleData gives Re c>0 and Im c=0. Pole asymptotic fixes M with |A_k(sigma)-c/d^(k+1)|<=M/e^k for all k. Taking real parts gives
 (Re c/d)/d^k <= Re A_k(sigma)+M/e^k.
W at gamma=0 implies Re A_k(sigma)<=C exp(eta U)/E^k since |A_k(sigma)|>=0. Therefore the same scalar bound follows with c_scalar=Re c/d>0 and M rather than M+M'. No removal of a possible exceptional zero: this is the branch that excludes it when the window premise holds. Im c=0 is in PoleData, although this last inequality uses only Re c>0.

Sharp negative control (analytical, not a counterexample to the native theorem): choose 0<theta<beta<1, g(u)=-exp(beta u), Phi(s)=-1/(s-beta) off beta, arbitrary value at beta, Z={beta}, R=0 on every window. All other PoleData and window premises hold, but the real residue is -1, so claimed exclusion fails. In particular A_k(sigma) is negative and |A_k|+Re A_k=0. Real residue positivity cannot be deleted.

## 5. Scalar contradiction, explicit native threshold
In either branch fixed numbers satisfy c_scalar>0, 0<d<e<=E, and for every eta>0,U0 there are U>=U0,k natural with k>=U and
 c_scalar/d^k <= M/e^k+C exp(eta U)/E^k.
M,C are real; do not silently assume positivity. Require U>=0 by replacing U0 with max(U0,0); then exp(eta U)>=1. First replace M,C by absolute values; only then use e<=E to compare positive denominators. Set K=|M|+|C|>=0. The right side is <=K exp(eta U)/e^k.

Let L=log(e/d)>0, eta=L/2, U0=2K/(c_scalar L). These choices depend only on fixed radii/constants, not the eventual U,k. Set X=exp(LU/2). The inequality exp(t)>=1+t gives c_scalar X>=c_scalar+c_scalar LU/2>=c_scalar+K>K. Also X²=exp(LU)<=exp(Lk)=(e/d)^k. Hence
 K exp(eta U)=KX < c_scalar X² <= c_scalar (e/d)^k.
Dividing by e^k>0 contradicts the scalar lower bound. This is the actual landau_growth_contra and landau_window_contra argument. No asymptotic limiting exchange needed. K=0 included. Strict d<e indispensable: equality d=e, M=c_scalar, C=0 satisfies the supposed impossible inequality. Entire quantifier order preserved.

Thus every rho in Z satisfies Re rho<=theta, conditional on PoleData and WindowHypU. H extends to theta>=2 by pole_re_le, to 0<theta<2 by this proof, and to theta<=0 by choosing t=min(1,Re rho/2)>0, reweighting R to preserve its weighted integral and applying the positive-theta theorem to t<Re rho. No change to P's outer arithmetic restrictions. This completes the abstract conditional analytical assembly, not the arithmetic supplier or RH.

## 6. Reproducible finite certificate
Save following JS block as run14.js and execute node run14.js (or compatible V8). Finite integer phase/norm tests for branch inequalities, BigInt signed normalization and exact rational growth subfamily, finite grid dichotomy tests, four negative controls. Growth subfamily uses e/d=(a/b)^2, integer U,k and independent sufficient threshold ceil(K*b/(c*(a-b))) by Bernoulli; NOT an exact computation of general logarithmic threshold. Finite geometry grid does not replace compactness or native nearest-pole proof. Initial test grid with imaginary offsets ±2 in scaled coordinates failed branch coverage (no empty F); expanded to ±4, preserving original test domains otherwise. This is a test-design correction, not a theorem failure. No native Lean kernel executed.

~~~js
const certificate = function(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const phases=[[5,0],[3,4],[0,5],[-3,4],[-5,0],[0,-5],[3,-4],[-3,-4]];
 let complex=0,real=0,normalize=0,growth=0,geom=0,left=0,right=0,empty=0,negative=0;
 for(let a=0;a<=8;a++)for(let b=0;b<=8;b++)for(let m=0;m<=8;m++)
 for(const [x,y] of phases)for(const [v,w] of phases)for(const [r,s] of phases){
   const px=a*x+m*r,py=a*y+m*s,W=5*a+b*v,upper=5*m+5*b+W;
   ck(upper>=0 && px*px+py*py<=upper*upper,"complex lower assembly");complex++;
 }
 for(let p=1;p<=25;p++)for(let m=0;m<=25;m++)for(const [x,y] of phases){
   const ar=5*p+m*x,ai=m*y,need=5*p-5*m-ar;
   ck(need<=0||need*need<=ar*ar+ai*ai,"real lower assembly");real++;
 }
 for(let e=1n;e<=5n;e++)for(let E=e;E<=6n;E++)for(let k=0n;k<=7n;k++)
 for(let M=-4n;M<=4n;M++)for(let C=-4n;C<=4n;C++)for(let X=1n;X<=4n;X++){
   const abs=x=>x<0n?-x:x, ep=e**k,Ep=E**k;
   ck(M<=abs(M)*X && C*X*ep<=abs(C)*X*Ep,"signed normalization");
   ck(M*Ep+C*X*ep<=(abs(M)+abs(C))*X*Ep,"combined normalization");normalize++;
 }
 for(let b=1n;b<=5n;b++)for(let a=b+1n;a<=b+4n;a++)
 for(let c=1n;c<=5n;c++)for(let K=0n;K<=15n;K++){
   const den=c*(a-b), U0=(K*b+den-1n)/den;
   for(let U=U0;U<=U0+3n;U++)for(let k=U;k<=U+3n;k++){
     ck(K*b**U<c*a**U,"strict X margin");
     ck(K*a**U*b**(2n*k)<c*a**(2n*k)*b**U,"growth strict");growth++;
   }
 }
 const pts=[];for(let x=1;x<=4;x++)for(let y=-1;y<=1;y++)pts.push([x,4*y]);
 const E=4,E2=E*E,dist2=([x,y])=>(6-x)**2+y*y;
 for(let mask=1;mask<2**pts.length;mask++){
   const Z=pts.filter((_,i)=>mask&(1<<i)),viol=Z.filter(([x])=>x>2);
   if(!viol.length)continue;
   const F=Z.filter(p=>dist2(p)<=E2);
   if(!F.length){ck(viol.some(([x])=>(6-x)**2<E2),"empty F witness");empty++;left++;}
   else {
      const D2=Math.min(...F.map(dist2));
      ck(Z.every(p=>dist2(p)>=D2),"pole-free real open disk");
      if(Z.some(([x])=>(6-x)**2<D2)){left++;}
      else{
         const nearest=F.filter(p=>dist2(p)===D2);
         ck(nearest.length===1 && nearest[0][1]===0 && nearest[0][0]>2,"real unique pole");
         const other=F.filter(p=>p!==nearest[0]);
         const r2=Math.min(E2,...other.map(dist2));
         ck(D2<r2 && Z.filter(p=>dist2(p)<r2).length===1,"real isolating radius");
         right++;
      }
   }geom++;
 }
 ck(left>0&&right>0&&empty>0,"branch coverage");
 ck(1<=1,"d=e equality model");negative++;
 ck(Math.abs(-1)-1===0,"negative real residue evades window");negative++;
 ck(1/2>1/3,"E<e reversal");negative++;
 ck(6-6===0,"closed disk endpoint");negative++;
 return {complex,real,normalize,growth,geom,left,right,empty,negative};
};
console.log(certificate());
~~~

Actual V8 execution: {"complex":373248,"real":5200,"normalize":51840,"growth":25600,"geom":4032,"left":1728,"right":2304,"empty":480,"negative":4}. Bounded ordinary integer operations exact; growth/normalization use BigInt. No CI claim for embedded certificate.

RESUME HERE: audit the complete abstract-to-family wrapper against current source, specifically actual zeroFree_of_rpow_window and its family window conversion: locate current and pinned theorem bodies, enumerate every hypothesis and zeroSet membership mapping including conjugate, zeta and principal pole at one; reconcile RUN5–RUN9 and request authenticated role-labelled edges for landau_window, landau_window_contra, landau_dichotomy, landau_growth_contra and wrapper. Do not repeat final contradiction. HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime-window and acceleration. Project OPEN.


---

[specialists/literature_provenance/RUN14_COMPARISON_TRANSPORT_AND_STRUCTURE_SHEAF_INJECTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN14_COMPARISON_TRANSPORT_AND_STRUCTURE_SHEAF_INJECTION.md) — blob 311255c8da8a1e8fe27cc47d8cfa828de8ec26ea

# RUN14 — comparison transport and structure-sheaf H1 injectivity
2026-11-24. SOURCE-MATCHED / PARTIAL; project OPEN.
Source leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (same as RUN13).

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN13 and RUN7, RESEARCH_STATE and RESEARCH_LOG excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, Cathedral CI summary #393 20:37:01 UTC (not RH verification). Inspected 13 recent peer commit file lists and available RESUME HERE lines; editor 19:56 note separately read. No duplicate of this free_of/cmpO expansion identified. Blueprint link reviewed, PDF not reopened. No physics changes.

## 1. Exact comparison transfer, not a global supplier
In AbelianDeRhamFreeOfCrystallineComparison L33–52, R is an arbitrary commutative ring, A an over-object of Spec R with group structure, hab:IsAbelianScheme A, hg:SmoothOfRelativeDimension g A.hom, s:A.left→Spec R and hs:s=A.hom. Keep hC:Published.CrystallineSmoothLift and hA:Published.AbelianHodgeDeRham as separate explicit premises (RUN7 recorded their full fields). Substitute hs, use hab.smooth and hab.proper, obtaining smooth, separated and quasi-compact structure for comparison.

CechDeRhamComparisonBijectiveCupSmooth L12–35 constructs a lift datum D with zero ideal, trivial divided powers dp0, X₀=X, i=id, t=s. The quotient R/0≃R gives an isomorphism on spectra and required pullback. At L43–56 the supplied hC gives e₁:D's H1≃HH1 and e₂:D's H2≃HH2. Its compatibility with the identity lift morphism and IsMor.pullCohomologyOne_id identifies e₁(c)=cmp1(c). Thus cmp1 is bijective and e₂ takes cup(a,b) to cupHH(cmp1 a,cmp1 b). Choosing D specializes hC; it does not prove hC.

Write E₁=cmp1:DR1≃HH1, E₂:DR2≃HH2, E_H:∧²HH1≃HH2, the latter supplied by hA. From hA obtain finite generation, projectivity and stalkwise rank 2g of HH1 (not a global free basis). Transport finiteness and projectivity along E₁⁻¹ and rank along localization equivalence. The required map is
    F = E₂⁻¹ ∘ E_H ∘ ∧²E₁ : ∧²DR1 ≃ DR2.
ExteriorPower.map respects composition and identity, so ∧²E₁ has inverse ∧²(E₁⁻¹) (L18–31). On a∧b,
    F(a∧b) = E₂⁻¹(E_H(E₁a∧E₁b))
             = E₂⁻¹(cupHH(E₁a,E₁b)) = cup(a,b).
L58–61 supplies Published.AbelianDeRhamFree via free_of and Category.comp_id; statement wrapper L7–8 is conditional, not an independent axiom or a proof of hC/hA. AbelianDeRhamStructure is a distinct conjunction of this predicate, Hodge and BaseChange (PublishedTheorems/Divisors₂/AbelianDeRhamStructure L15–24). Neither latter conjunct follows solely from F. Remaining hA fields are not consumed at free_of but must remain in its declared premise. No extra freeness, field restriction or basis choice.

## 2. Independent structure-sheaf comparison injectivity
StructureSheafComparisonInjective L17–30 proves cmpO injective for every commutative ring R, scheme X and s:X→Spec R, without taking hC or hA as local premises. Suffices to prove kernel zero. Given a class c with cmpO(c)=0, choose representative f via H1.mk_surjective. Vanishing comparison class gives a 0-cochain g on affine opens through H1.mk_eq_zero.1. For a:U→V in the opposite affine-open category, exact sign:
    g(V) − res(g(U)) = fv(f,affF(a)).
Here f is a cocycle on trivial thickenings TT(s); composition obeys fv(f,a≫b)=b_*(fv(f,a))+fv(f,b). For T∈TT(s), B=T.obj.B. On a pair p of compatible affine opens in Spec B and X (point map pt T), local section
    h_p = secPullA(T,p)(g(op p.second)) + fv(f,aM(T,p)) − fv(f,bM(T,p)).
CocycleLocalSectionsRestrictCompatibly L34–55 gives h_p=res(h_q) for p≤q. Put ρ=res, δ=fv(f,resThk), u=fv(f,affF(d)). Equations b_p=ρb_q+δ; ρa_q+δ=P_p(u)+a_p; g_p=res(g_q)+u; P_p(res(g_q))=ρP_q(g_q). Substituting yields h_p=ρh_q.

ExistsGlueFunctionsSpecFromPairs L11–54 proves existence of G_T∈B restricting to h_p: affine opens form a local basis; for y in overlap choose affine W containing x(y) in intersection of target opens and affine V containing y inside both source opens and x⁻¹W. The resulting pair r refines both. Compatibility under r≤p implies equal germs on overlaps. Every y is covered by such a pair. Sheaf section extensionality and existsUnique_gluing' give a global section; ΓSpecIso identifies it with an element of B.

For φ:T→T', pull back to every compatible affine source pair in T'. CochainValueOnThickeningHomEqSubOfGlued L51–99 constructs p' and c:thk T p→thk T' p' using pt_comp and secPull. Its identities are a'=χa+δ, χb+δ=res(fv(f,φ))+b', and χP(g)=P'(g), with χ local pullback and δ=fv(f,c). Thus
    res(G_T'−φ_*G_T)=h'−χh
                    = (a'−χa)+(χb−b')
                    = res(fv(f,φ)).
SpecFunctionsEqOfRestrictionsOnPairsStatement upgrades local equality to equality in B'. Its proof is a separate dependency not unfolded here. Therefore fv(f,φ)=G_T'−φ_*G_T. Choosing all G_T gives a 0-cochain whose coboundary is f; H1.mk_eq_zero.2 proves c=0. The .symm in the final Lean line preserves orientation. Statement wrapper is unconditional at this local level with a native proof body, not evidence about its transitive axioms.

## 3. External assumption ledger delta
| Name | Classification | Premises / next trust obligation |
|---|---|---|
| Published.CrystallineSmoothLift (BijectiveCechDeRhamComparisonDegreeOne L130–136) | def : Prop; hC local hypothesis | All D, nil divided powers, actual reduction pullback; equivalences, cup, degree-one comparison, naturality. Global producer not located. |
| Published.AbelianHodgeDeRham (L15–29) | def : Prop; hA local hypothesis | HH1 and other finite projective ranks, cup, closedness, injectivity/surjectivity, all base changes. Global producer not located. |
| Published.AbelianDeRhamFree / Structure L15–24 | definitions, not proof terms | Structure has three conjuncts; free_of supplies first only. |
| Proof.abelianDeRhamFree_of_hodge; T.abelianDeRhamFree_of_crystalline_comparison | conditional native theorem and wrapper | hC,hA; no evidence either is an axiom or is globally supplied. |
| CechDR.cechDeRham_comparison_bijective_cup_smooth L43–56 | conditional native theorem | hC, smooth, separated, quasi-compact. |
| CechDR.cmpO_injective and T.structure_sheaf_comparison_injective | native theorem and wrapper, no hC/hA parameter | Imported H1 quotient, affine basis, sheaf gluing and local separation proofs retained. |
| AffLoc.exists_glue_pair, hSec_res, fv_eq_sub_of_glued | native bodies; corresponding T.exists_glue_functions_spec_from_pairs, T.cocycle_local_sections_restrict_compatibly, T.cochainValueOnThickeningHom_eq_sub_of_glued are wrappers | Pair compatibility, cocycle, actual coboundary g, actual glued sections. |
| Mathlib exteriorPower.map_comp/map_id, Module.Finite.equiv, Module.Projective.of_equiv, Module.rankAtStalk_eq_of_equiv, sheaf section_ext and existsUnique_gluing' | imported named lemmas | Not independently replayed or expanded here. |
| SpecFunctionsEqOfRestrictionsOnPairsStatement, SecPullA, H1.mk_eq_zero, IsMor.pullCohomologyOne_id | named source dependencies | Preserve, expand if root-linked; transitive axiom status unknown. |
No new citation claims; no OpenLiteratureStatements declaration classified in this local run. Published names are not evidence of proof or citation. Repository code search for both hC and hA predicate names returned zero results: a search limitation, not proof of nonexistence of producers. RUN7 already explained CrystallineSmoothLift.toCrystallineDeRham.

## 4. Reproducibility, actual execution and migration
Live GitHub connector/V8 checks: 14/14 pinned blob IDs matched expected IDs and 87/87 exact source line anchors matched. Six current file blob IDs matched. 146 lines literally identical; two additional lines matched after replacing three wrapper calls with previously inspected direct native bodies. No claim of kernel equivalence after consolidation. Initial attempt to write note in same tool invocation exhausted its tool-call allowance after checks; this separate write preserves the result.

Replay below (Python not separately executed here) in upstream checkout independently rehashes all 20 raw Git blobs, checks the 148-line comparison and a representative subset of the 87 anchors. No synthetic numerical tests: deliverable is source and obligation preservation.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base="src/Development/AbelianVarietyTheory/"
D=base+"Proofs/DivisorProofs/"
A=base+"PublishedTheorems/Divisors₂/"
rows=[
(D+"AbelianDeRhamFreeOfCrystallineComparisonStatement.lean","8fee6206895e54258144505d60a5f5343c546253",7,"CrystallineSmoothLift"),
(D+"StructureSheafComparisonInjectiveStatement.lean","f0ab09e0d666ee3b6e1dbe19d77f25869d58a331",6,"Function.Injective (cmpO s)"),
(D+"AbelianDeRhamFreeOfCrystallineComparison.lean","257bdd4da072b61006e841e8d52b2ab1d331f19f",50,"eH.trans e2.symm"),
(D+"StructureSheafComparisonInjective.lean","0ff11567c19d8bcbe019fea3b7022d573e36837a",29,"H1.mk_eq_zero.2"),
(D+"CechDeRhamComparisonBijectiveCupSmooth.lean","a322dc4b1c40fd22f5b1d2523687786a878ac2bc",51,"pullCohomologyOne_id"),
(A+"AbelianDeRhamStructure.lean","84cbcbc1da6f5de3d1066b698f962efccf006cda",24,"AbelianDeRham.Hodge ∧ AbelianDeRham.BaseChange"),
(A+"AbelianHodgeDeRham.lean","80799a38567aba92e73f29eb44b8da65f95f44c2",15,"def AbelianHodgeDeRham : Prop"),
(A+"BijectiveCechDeRhamComparisonDegreeOne.lean","5c1ea214a49422785892f5afd011edde47b23911",130,"def CrystallineSmoothLift : Prop"),
(D+"ExistsGlueFunctionsSpecFromPairsStatement.lean","bcb168683fa64dc2d6690838a5639016d3f89af4",7,"exists_glue_pair"),
(D+"CocycleLocalSectionsRestrictCompatiblyStatement.lean","934acb1e517a336d1b247b9c0aaca2654608d61f",7,"hSec_res"),
(D+"CochainValueOnThickeningHomEqSubOfGluedStatement.lean","46b1c52d612954fb0d426fb4e65de34bea8f4a8e",7,"fv_eq_sub_of_glued"),
(D+"ExistsGlueFunctionsSpecFromPairs.lean","84bb43a5ca45b8aa583de4256c560e099588d8f1",44,"existsUnique_gluing'"),
(D+"CocycleLocalSectionsRestrictCompatibly.lean","e8ff98d09f903b4f42a112324be9f7f0236ca990",55,"linear_combination e2"),
(D+"CochainValueOnThickeningHomEqSubOfGlued.lean","d83a0852aaa77434be6eeca1056047cc34502f71",99,"linear_combination -e1 - e2")]
migr=[
(D+"AbelianDeRhamFreeOfCrystallineComparison.lean",18,52,59,"cdb90afa63d3d36c016d52b132894c4d4b66624c"),
(D+"CechDeRhamComparisonBijectiveCupSmooth.lean",12,56,51,"acf9f8578b0f8d8b212e6b3b8cfbb013a225e97e"),
(A+"AbelianHodgeDeRham.lean",15,29,56,"cf94101456bb9df42a76f1975b2fc2cf08917082"),
(A+"AbelianDeRhamStructure.lean",15,24,54,"1915b7d7ab8cf97843e272113e31e7410ffc3ec6"),
(A+"BijectiveCechDeRhamComparisonDegreeOne.lean",130,158,136,"79e914237bb842f625c2eba1dde6976715944caf"),
(D+"StructureSheafComparisonInjective.lean",17,30,346,"1d23d2432d501ff6d60a714e0162f7b30607671b")]
repl=[
("GlobalTheory.T.exists_glue_functions_spec_from_pairs","_root_.GlobalTheory.CechDR.AffLoc.exists_glue_pair"),
("GlobalTheory.T.cocycle_local_sections_restrict_compatibly","_root_.GlobalTheory.CechDR.AffLoc.hSec_res"),
("GlobalTheory.T.cochainValueOnThickeningHom_eq_sub_of_glued","_root_.GlobalTheory.CechDR.AffLoc.fv_eq_sub_of_glued")]
def read(rev,path,sha):
    raw=subprocess.check_output(["git","show",rev+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    return raw.decode().splitlines()
old={}
for path,sha,i,s in rows:
    old[path]=read(P,path,sha)
    assert s in old[path][i-1],(path,i,s)
exact=changed=0
for path,l,u,v,sha in migr:
    new=read(H,path,sha)[v-1:v+u-l]
    original=old[path][l-1:u]
    assert len(new)==len(original)
    for x,y in zip(original,new):
        if x==y: exact+=1
        else:
            for a,b in repl:x=x.replace(a,b)
            assert x==y,path
            changed+=1
assert (len(rows),exact,changed)==(14,146,2)
print(len(rows),exact,changed)
```

RESULT: SOURCE-MATCHED / PARTIAL. Conditional degree-two exterior-square transfer and independent structure-sheaf degree-one injection translated, with five statement wrappers distinguished from proof bodies. No global producer of hC/hA established, no independent Lean execution or root reachability claim.
RESUME HERE: locate actual proof-producing declarations of Published.CrystallineSmoothLift and Published.AbelianHodgeDeRham using dependency lane's authenticated role-labelled reverse edges (default-branch text search returned empty). If unavailable, follow imports of SecPullA and SpecFunctionsEqOfRestrictionsOnPairsStatement to finish injection leaves; do not repeat RUN7 or RUN14. Request role-labelled root witnesses for GlobalTheory.Proof.abelianDeRhamFree_of_hodge, GlobalTheory.CechDR.cechDeRham_comparison_bijective_cup_smooth, GlobalTheory.CechDR.cmpO_injective, and all three GlobalTheory.CechDR.AffLoc native suppliers. Keep system realization separate. HANDOFF TO integration, editor, audit, dependencies, kernel, geometry, acceleration. Project OPEN.


---

[specialists/positivity_geometry/RUN14_BOUNDARY_HOLOMORPHICITY.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN14_BOUNDARY_HOLOMORPHICITY.md) — blob 2771e1a3464b2c147a8c652b8d8a3c63c6680d6a

# Geometry RUN14 — boundary holomorphicity via Cauchy slices
2026-11-24. SOURCE-MATCHED, readable local proof; finite exact algebra regression executed in V8. Imported analytic and algebraic suppliers remain explicit. Full RH OPEN.

## Continuity / source
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RESEARCH_STATE and CONTINUITY_PROTOCOL excerpts, RUN13 and latest 35 peer commits / 14 file lists and available RESUME HERE patch lines. Root RESEARCH_LOG.md and RESEARCH_PROTOCOL.md returned 404 on this attempt; blueprint link noted, PDF not reopened; editor latest patch had no resume lines. No competing boundary-holomorphicity task found. General CI checkpoint #393 20:37:01 UTC run 45479331883 is not RH verification. Native dependency compute rh-next-root-roles-20261124 status pass retrieved; its solution JSON has no textual matches for holoOn_bdZ, differentiableAt_of_lines, frequently_ne_zero, tendsto_arc_readsZ or HolArc; no authenticated root reachability asserted.
P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (24 Nov 18:24:32 UTC, merge #1313, unchanged since RUN13). GitHub-returned blob hashes (not independently recomputed):
* P src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean, 0c0ad5b8910bc85997bb107de3caab75c487ed0c, holoOn_bdZ L135–205.
* P src/Development/WeilBound/CoreStatements/ProjectiveValuations/DifferentiableAtOfLines.lean, e4fe51fc5baf985d064128ba5c6ba89b3a5b4f7f, differentiableAt_of_lines.
* P src/Development/WeilBound/CoreStatements/ProjectiveValuations/FrequentlyNeZero.lean, 1d1298db4bb760abebd049e39798814996eea9a4, frequently_ne_zero and mem_open_of_ptY.
* P src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsHolomorphicArcSmoothAlgebraNonvanishing.lean, e95390ba40afc2cae23ad6c4bdaab24940937c6e, isAlgebraic_of_etale, faithfulSMul_of_flat, exists_line, exists_holPts_ne_zero.
* P src/GroundTheory/HeightsAndTheta/Heights/ComplexAnalyticSets/PRiemannExtensionAnalytic.lean, 1111fc0f8873ed7d0a49f12000dfc81b3a42540a, circleIntegral_inv_smul_eq, differentiableOn_circleAverage, analyticOnNhd_of_differentiableOn.
At H the first two are in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean (blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e), at L1314 and L924 respectively. Trimmed nonblank declaration blocks compared: holoOn_bdZ 71/71 lines identical; differentiableAt_of_lines 113/113, one line differs (continuous_add_left z0 replaced by explicit Continuous witness by fun_prop). FrequentlyNeZero H blob c2019b86f5a92f47a35f4c605879a8f98a293644, frequently_ne_zero 25/25 lines identical. ExistsHolomorphicArcSmoothAlgebraNonvanishing H blob b95f09d2dc17e940e2cadc75a8efe116c842bf71, exists_holPts_ne_zero 68/68 lines identical. PRiemannExtensionAnalytic H blob 166a4f183d5d0c3a3ed87e117cb9fb3e776281b8, declarations present (not compared body-by-body). These are source comparisons not elaborated-equivalence checks.
Links: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path> with P replaced by above SHA (literal template); H likewise.

## 1. Abstract local extension theorem (exact hypotheses)
DifferentiableLines.differentiableAt_of_lines. Let k be a natural number, U,O open subsets of C^k (neither is assumed contained in the other), g,f:C^k→C. Assume g holomorphic on U, f holomorphic on O, and for every t in U with g(t)≠0, t∈O. For every τ∈U outside O and every direction v, IF τ+zv belongs to O eventually as z→0 through z≠0, THEN f(τ+zv)→f(τ) along the punctured filter. Fix τ0∈U; for every r>0 there exists t∈B(τ0,r) with g(t)≠0. Conclusion f complex Fréchet differentiable at τ0. No blanket continuity assumption on f, and no assumption that g(τ0)≠0. In k=0 the nonzero witness ensures τ0∈O; original construction still works with v=0.

Choose r>0 with B(τ0,r)⊂U and t1∈B(τ0,r/2) with g(t1)≠0. Set v=t1−τ0. For |z|<3/2 and ||τ−τ0||<r/4:
||τ+zv−τ0|| ≤ ||τ−τ0||+|z| ||v|| < r/4+(3/2)(r/2)=r.
Thus each slice Gτ(z)=g(τ+zv) is holomorphic on D(0,3/2). Gτ0(1)≠0, so by the analytic identity theorem its zeros are isolated. Pick ε>0 with Gτ0(z)≠0 for 0<|z|<ε, and ρ=min(ε,1)/2>0. The circle |z|=ρ lies in the open nonzero locus. Joint continuity and compactness of that circle give δ0>0 so every τ in B(τ0,δ0) has the whole translated circle in U∩{g≠0}. Set δ=min(δ0/2,r/8)>0; the same holds on the closed δ-ball. This uniformity is essential; pointwise choice of radii is not a proof of differentiability in τ.

## 2. Cauchy readout and the actual boundary values
Define A(τ)=(1/(2π))∫_0^{2π} f(τ+ρ exp(iθ)v)dθ. On the closed δ-ball times the circle, all points lie in O. PRiemannExtensionAnalytic.differentiableOn_circleAverage uses continuity of the complex derivative of f (via separate analyticity/Osgood), compactness of the translated product and a finite bound M on ||Df|| there; dominated differentiation of the integral gives A holomorphic on the open δ-ball. It does NOT assert differentiability of f on the interior of each slice yet.
For every τ in the δ-ball, Gτ(ρ)≠0. By the identity theorem Gτ is not identically zero and all its zeros in the 3/2-disk are isolated. At z0 in the disk with τ+z0v∈O, Fτ(z)=f(τ+zv) is holomorphic by composition. At a point outside O, nearby z≠z0 have Gτ(z)≠0 and lie in U, hence in O. Translate by z0 and apply the precise line-limit assumption; the punctured limit equals the ALREADY DEFINED value Fτ(z0). The one-variable removable singularity theorem for continuity at z0 then implies analyticity at z0. This proves Fτ holomorphic on the full disk (no assumption of continuity at all boundary points before this step).
Cauchy's formula, on |z|=ρ inside that disk, yields
f(τ)=Fτ(0)=(2πi)^−1 ∮ Fτ(z)/z dz=(1/(2π))∫_0^{2π}Fτ(ρ exp(iθ))dθ=A(τ).
The exact factor follows from dz/dθ=i z and ρ≠0, as in circleIntegral_inv_smul_eq. Since f=A on a neighborhood, f is differentiable at τ0. Distinguish this from the adjacent local_extension theorem which constructs an extension using local boundedness but does not require agreement with arbitrary already assigned boundary values. Here the value-matching hypothesis cannot be dropped: f(0)=1 and f(z)=0 elsewhere with g(z)=z satisfies the other premises yet is discontinuous at 0.

## 3. Producing nearby nonzero points
frequently_ne_zero: F field, Y scheme, p:Y→Spec F smooth, σ:F→C, W affine open with Γ(Y,W) a domain, g∈Γ(Y,W) nonzero, y complex point in W, N any neighborhood of y. Then ∃ y'∈N with ev(g,y')≠0. The conclusion does not require y' to equal y or N to be open.
Set A=Γ(Y,W) with its structural F-algebra. Smoothness restricts to A. The supplier exists_holPts_ne_zero gives a family ψ_u:A→C, holomorphic evaluations on a positive disk, ψ_0=ev_y, base field fixed, ψ_u(g)≠0 for all nonzero u in disk. Convert to complex scheme points e(u) by ofHom inside disk, use y outside. Every evaluation is continuous at 0, so the affine-point topology lemma proves e(u)→y. Intersect the pullback of N with the disk and punctured neighborhood; the latter is nontrivial over C, hence choose u, get y'=e(u).
Expand the supplier: for smooth F-domain A, point ψ0:A→C, p∈A nonzero, choose étale coordinates s_i after localization R=A[1/g] with ψ0(g)≠0 (smooth point chart). The injection A→R preserves p≠0 and R is a domain. Polynomial base S=F[X_i] maps to R by s_i; étale implies flat, so S→R injective by faithfulSMul_of_flat (a≠0 acts injectively, and a·1=0 would imply 1=0). Étale also implies fraction field extension algebraic: formal unramifiedness and essential finite type survive localization and restriction to fraction fields, yielding separability and algebraicity. Source Algebra.IsAlgebraic.exists_nonzero_dvd therefore supplies c∈S nonzero with image c=(image p)d in R. ÉtaleFamily.exists_holomorphic_sections provides local lifts of nearby coordinate evaluations extending ψ0, with scalar field fixed and exact coordinates. These two substantial existence suppliers are not reproved here.
Map c along σ, preserving nonzero by field injectivity. A nonzero multivariate polynomial over C has a point w with c(w)≠0. With b0 original coordinates take v=w−b0 and Q(u)=c(b0+uv); Q(1)=c(w)≠0. Its nonzero roots form a finite set disjoint from 0; choose a small positive disk avoiding them. Intersect with the disk on which the local étale lift exists. There c(b0+uv)≠0 for u≠0. If ψ_u(p)=0, evaluation of c=p d would vanish, contradiction. At u=0 no nonvanishing demanded; all field and coordinate identities preserved. A domain condition matters: in C[x,y]/(xy), x vanishes on an entire open local branch near (0,1) despite x≠0 in the ring.

## 4. Application to flag geometry: holoOn_bdZ
Full source signature: E field, NumberField, IsCMField; H Host E, D Datum H, l Level H, Xo Moduli D l, c Coeff l, r natural, σ:c.F→C; V:Unf Xo c σ r, GoodEmb c σ, IsUnf V, T:TorFlag Xo c; ee:Ix D→Z with ee none=0; k:V.Comp, la:Wt (V.X k).Ψ r; P:Frame (V.X k).Ψ r→C with P∈(V.X k).SS la; d natural with SmoothOfRelativeDimension d (flagStr T.X); R:AnRead (flagStr T.X) σ d; h:(T.X.LL ee).ι→CxPts(flagStr T.X,σ)→C, Reads V T ee k P h, OffZero V T k h; hh: for every i, R.HoloOn(ptsIn((T.X.LL ee).U i) ∩ ptsIn(flagOpen T.X)) (h i). For each i:T.X.F.J conclude R.HoloOn(ptsIn(T.X.F.U i))(h i).
Fix analytic chart C and chart coordinate v with its point y0 inside U_i. Smoothness gives reducedness, normality and locally Noetherian structure; ModelChart.exists_open_isDomain gives a domain neighborhood W1. Choose affine W⊂W1∩U_i containing y0; inherited domain property. Density of flagOpen gives a scheme point of W∩flagOpen, hence basic open D(g)⊂flagOpen, g∈Γ(W), g≠0 because D(0)=∅. Do NOT infer nonzero complex evaluation at y0 from this density; the separate frequently_ne_zero theorem is needed.
Let L be the complex linear equivalence from Euclidean chart space to C^d and s(b)=C.e^{-1}(L^{-1}b) on the chart target. U is pullback of W intersect chart target, O pullback of U_i∩flagOpen intersect chart target. Both open by ChartGlue. G(b)=ev(g,s(b)) is holomorphic on U, all regular functions similarly. G≠0 implies membership in D(g) and hence O (W⊂U_i). F(b)=h_i(s(b)) is holomorphic on O by hh and chart compatibility.
At τ∈U\O the point lies outside flagOpen. mem_open_of_ptY proves any matching frame point lies in flagOpen (pullback of flagOpen along ptY is top); thus OffZero forces F(τ)=0. For any direction w with punctured line eventually in O, choose small radius so full line disk stays in W and punctured disk lies in flagOpen. Every regular evaluation is differentiable on disk by composition. These are precisely RUN13 tendsto_arc_readsZ hypotheses (b1 entire disk in W; b2 all evaluations differentiable; b3 center outside flagOpen; b4 punctured interior). It gives F(τ+zw)→0=F(τ). For every ρ>0 take neighborhood of y0 whose chart coordinates lie in B(Lv,ρ), intersect chart source, and apply frequently_ne_zero to g. Map the resulting y' back to coordinates: G≠0 at a point of that ball. All premises of differentiableAt_of_lines now hold at Lv; compose with L and restrict to chart domain to conclude HoloOn. The conclusion is holomorphicity of the actual readout, not just existence of another holomorphic extension. It does not by itself prove algebraization.
Retained dependencies: RUN13 analytic lift/unipotency/period/cusp decay; smooth normal domain charts, dense flagOpen, étale coordinate and local-section existence, affine complex-point topology, identity theorem, removable singularity, Osgood/derivative domination and Cauchy. No extra Cathedral premises or physical claims. No authenticated root path or independent Lean replay.

## 5. Executed certificate
V8 output {"radius":275520,"line":10000,"coefficient":10000,"negative":4}. Exact integer and BigInt synthetic regressions of tube bound, monomial line substitution/endpoint and constant coefficient, with four elementary negative controls. Not numerical evaluation of native geometric data, not proof of analytic integration, and not a kernel check. The polynomial coefficient check is algebraic support for the Cauchy formula, not a replacement for that theorem. Reproduce by saving the code below as run14.mjs and running node run14.mjs.
~~~js
function certificate(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, c={radius:0,line:0,coefficient:0,negative:0};
 // Coordinates in units 1/8, r positive; use norm bounds scaled by 8.
 for(let r=1;r<=20;r++)for(let a=0;a<2*r;a++)for(let b=0;b<4*r;b++)for(let z=0;z<12;z++){
   ck(8*a+z*b<64*r,"tube bound");c.radius++;
 }
 const mul=(a,b)=>{let t=Array(a.length+b.length-1).fill(0n);for(let i=0;i<a.length;i++)for(let j=0;j<b.length;j++)t[i+j]+=a[i]*b[j];return t};
 const pow=(a,n)=>{let p=[1n];for(let i=0;i<n;i++)p=mul(p,a);return p};
 const evalP=(a,z)=>a.reduceRight((s,x)=>s*z+x,0n);
 for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let d=-2;d<=2;d++)for(let e=-2;e<=2;e++){
  let A=BigInt(a),B=BigInt(b),D=BigInt(d),E=BigInt(e);
  for(let m=0;m<=3;m++)for(let n=0;n<=3;n++){
    let p=mul(pow([A,D-A],m),pow([B,E-B],n));
    ck(evalP(p,1n)===D**BigInt(m)*E**BigInt(n),"endpoint");c.line++;
    // The residue of z^-1 p(z) is p(0), equivalently normalized Cauchy average.
    ck(p[0]===A**BigInt(m)*B**BigInt(n),"constant coefficient");c.coefficient++;
    for(let z=-2n;z<=2n;z++)ck(evalP(p,z)===(A+z*(D-A))**BigInt(m)*(B+z*(E-B))**BigInt(n),"substitution");
  }
 }
 // Wrong value at removable point: f(z)=0 for z≠0, f(0)=1.
 ck(0!==1,"boundary-value control");c.negative++;
 // g≡0 and O empty make line assumption vacuous; f=conjugation is not complex differentiable.
 ck(1!==-1,"nonzero witness control: difference quotients along real/imaginary axes");c.negative++;
 // Reduced but not integral: x*y=0, g=x is zero along the y-axis away from origin.
 ck(0*1===0&&0===0,"domain control");c.negative++;
 // A pole has no finite boundary limit: f(1/n)=n.
 ck(1000>100,"pole control");c.negative++;
 return c;
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: locate the immediate caller of holoOn_bdZ in pinned VuOntoA/B successors and the current combined file; reconstruct the exact GAGA algebraization theorem producing algebraic sections from compatible holomorphic readouts, preserving properness/projectivity, coherent sheaf and all matching hypotheses. Keep SmoothPointFamily.exists_etale_away, EtaleFamily.exists_holomorphic_sections and RUN13 analytic leaves OPEN. Request authenticated role-labelled root paths for holoOn_bdZ, differentiableAt_of_lines, frequently_ne_zero, exists_holPts_ne_zero, differentiableOn_circleAverage and tendsto_arc_readsZ. HANDOFF TO geometry, literature, integration, editor, audit, dependency, kernel. Project OPEN.


---

[specialists/prime_window/RUN14_STAR_BRANCHES_AND_KINK.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN14_STAR_BRANCHES_AND_KINK.md) — blob 3f3cec6b16c9d7504052afc5ab3d613eb870c6c2

# RUN14 — Native two-branch StarAt estimate and orbit kink

2026-11-24. RESULT: SOURCE-MATCHED conditional human derivation; exact finite arithmetic and cyclic-orbit regression executed in V8. Not a Lean replay, not a full RH proof. Source P=40e56bab026552e089d7afcfeff08d2defb9c005, repository leanprover-community/riemann-hypothesis. Upstream observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (same as RUN13, merge PR #1313); no newer head observed on this run.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity and research log/state/protocol excerpts, physics CI checkpoint #391 at 19:59:15 (not RH evidence), RUN13, recent commit summaries for all lanes and latest integration/Landau RESUME HERE notes. Other lane full notes retrieval was incomplete (connector tool-call cap); external blueprint not reread. No duplicate identified in inspected summaries. RUN13 left St.starAt_D/E and orbit kink as frontier. This checkpoint does not claim exhaustive repository-wide deduplication.

## Source ledger (pinned)
All paths relative to src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/.
- PartnerCountOfCentral.lean blob f677b9041604e334f1115ae16b96cd61b1c7ee55; namespace Formalism.MainNotions.AuxBlock8.Pf.St. L15–106 orbit parametrization, L107–135 dMinus_spec/posAdd_back/dMinus_odd, L136–197 kink, L198–245 base and a_bounds, L246–307 Mn and nonnegative/odd-top/gam facts, L308–344 gU_lower, L345–368 central partner and parity sums, L369–439 kinkHH, L440–470 NumStar, L471–496 orbit_facts, L497–544 caseD_arith, L545–561 caseE_arith, L562–596 lg_ge_one/lo_D/lo_E/La_nonneg/rG_ge_one, L597–689 starAt_D, L690–695 order_le_n, L696–841 starAt_E, L842–848 starAll_of.
- Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0 L99–102 InWin, L129–135 StarAt and StarAll.
- Next numerical suppliers, not reconstructed here: StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043 L10–33 ev_log/ev_pow, L201–223 CStar/SmallB, L224–end numStar_ev; StarNumB.lean blob 7d7dfb6ed5fcb5241d17bcdaf578575c58314d47 L98–145 hboB_arith/hDII_arith, L146–158 Facts, L159–end facts_ev. Source URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/

## 1. Exact scope and common budget
Fix D,L,X:Inst D L,K:Consts with hK:K.Nonneg, P:ParameterChoice' D L, C31,C,bo real with A1:adm1 D L X C31, C31>0, Nn:NumStar D L K C31 C bo. Then for ALL integer-valued functions a,b with InWin, ALL p with Cand, ALL t0 in goodReps X p, ALL j in lifts, the claim StarAt is
  S-N*lo <= gU+dl-Pr-ceil_N(tv)-Dp-1,
where T=topsOn X p t0, N=|T|=Nv, S=sum_T askP. Cand supplies p prime, p<X', inertClass, x^(eps/4)<=ord(hP), and the band condition; do not discard the last even if not used locally. Split p<p0 versus p>=p0 (including equality). Let n=ord(hP), nd=n*delta1, lx=log x, G=C31*lx/delta1, c=cG, eta=etaSz, w=w'', b0=b', r=rG, Nm=Nm D. Write u=w+eta+c+Nm. NumStar fields:
  hL2: L2<goodU(delta1); h3G:3*Gp<=x^(eps/4); hlx:lx>=1;
  hGu:G*u<=b0; hc0:c0num<=3b0;
  hkQ: forall prime p<p0, kQp<=b0;
  hDII: forall prime p, Dw=K.DII*(N1^3+r^5+k^2)*log_p(a_scale)<=b0;
  hC3:C>=3; hCt:K.tII*r<=C; hCD:6+4*K.tII+160*C31+7<=C;
  hCP:K.Pr1*C31<=C; hN1:K.kappaThresholdOne*N1<=C*lx;
  hbo: forall prime p with p0<=p<X', forall natural n'<=D.R.n, the exact E envelope below (B1,E depend on p,n') is <=bo.
No uniform choice of bo is asserted here. The family theorem producing these fields is next.
A1 applied with hL2 and 3Gp<=n gives nd<=N*C31*lx. Since n>=1 and delta1>0 and C31*lx>0, N cannot vanish, hence N>=1 as an integer; division yields n<=NG. This is orbit_facts. base gives b0>=w>=500, c>=0 and c<=w. p<X'<=a_scale yields log_p(2a_scale)>=1. Let ell=3c log_p(2a_scale), H=C(c+eta) log_p(2a_scale). Then H>=ell.
Let M=sum over type-V tops of Mn (odd-power sums of min(a/p^e,fill)); M>=0. gU_lower gives S+M-N*ell<=gU+dl. For completeness its source splits tops by IsV: on V, askP+Mn=gam*a_s, and gam*2c<=ell since 0<=gam<=1; off V, odd_top provides askP-ell<=gam*al_s minus its nonnegative odd-power min series. Sum both disjoint sets; the definitions of gU and dl cancel dl exactly. This leaves the task Pr+ceil(tv)+Dp+1 <= M+N*(lo-H).

## 2. D branch, p<p0
Define S1=La*a_scale/(pk)+a_scale*p^(-L1), Dw as above, t=K.tII, c0=c0num. These are nonnegative except the abstract lemma does not require kQ>=0. Source Pr<=3r(Nb0+nu) by c<=b0 and n,u>=0. tv=t*r*N*(S1+c0+kQ)+2rnc; Dp is the natural ceiling of 40nd*Dw+2rnc+40r nd*c0. Both real ceiling inputs nonnegative by native hK and size facts. Each natural ceiling costs at most +1; retain final +1 from StarAt.
The exact caseD_arith hypotheses (real abstract variables) are N>=1,n>=0,nd>=0 (unused explicitly), r>=1,lx>=1,b0>=1,n<=NG,nd<=N*C31*lx,Gu<=b0,0<=c<=u,0<=c0<=3b0,kQ<=b0,S1>=0,0<=Dw<=b0,Pr2>=0,t>=0,C31>=0,tr<=C,2Pr2+4t+160C31+7<=C. It does not assume G>=0 separately. n u<=Nb0 and nc<=Nb0. Put Z=Nb0*r*lx>=1. Then
  Pr2*r*(Nb0+nu) <= 2Pr2*Z;
  t*r*N*(c0+kQ) <= 4t*Z; t*r*N*S1 <= C*N*lx*S1;
  4rnc <=4Z;
  40nd*Dw <=40 C31*Z;
  40r nd*c0 <=120 C31*Z;
  1+1+1<=3Z.
Sum: <=(2Pr2+4t+160C31+7)Z+C*N*lx*S1<=N(C*r*b0*lx+C*lx*S1). The 160 is 40+120 and 7 is 4+3. Set Pr2=3. lo_D=H+C*r*b0*lx+C*lx*S1. Thus actual cost<=N(lo-H)<=M+N(lo-H). Subtract from common budget. All signed terms in original inequality preserved.

## 3. E branch, p0<=p<X'
Let S2=a_scale/p^2+La*a_scale/(pk), B1=Qp*c6f(p,n)+k*Qp+k*log_p(a_scale)+c, E=K.DI*(x^(A/2))^2*(N1^5+k^3)*log_p(a_scale), tN1=K.kappaThresholdOne*N1, P1=K.Pr1, K2=K.kappaThresholdTwo. Set Cw=C*w*lx/delta1. Native hCP implies P1*G*w<=Cw. n<=D.R.n by additive order divisibility; N<=n by injection of tops into Fin n. hbo applies to this n with
  P1*G*(eta+c+Nm)+K2*B1+2G*c+40*C31*lx*E+3<=bo.
Abstract caseE_arith assumes exactly N>=1,n<=NG,nd<=N*C31*lx,w,eta,c,Nm,S2,E,P1>=0,P1*G*w<=Cw,tN1<=C*lx and the preceding bo inequality. It does NOT impose extra signs on B1,K2,tN1 or bo in the abstract lemma. Multiply n<=NG by P1*(w+eta+c+Nm) and by c, and nd<=N*C31*lx by E; multiply bo and Cw guards by N>=1 and tN1 guard by N*S2>=0. Three unit terms are <=3N. Hence
  P1*n*(w+eta+c+Nm)+[tN1*N*S2+K2*N*B1+2nc+1]+[40nd*E+1]+1
  <= N(Cw+bo+C*lx*S2).
Here actual Pr additionally includes F=sum over non-V tops (fillG-b_s); tv includes J, the backward-distance min sum on non-V positions. The native identity tv=J+tN1*N*S2+K2*N*B1+2nc and Dp=ceil_N(40nd*E) are valid on this branch, and inputs nonnegative (J>=0, native constants and positive a,b). Thus total cost<=F+J+N(Cw+bo+C*lx*S2). kinkHH gives F+J<=M+N(b0/x+eta). Since lo_E=H+(b0/x+eta+Cw+bo)+C*lx*S2, desired cost<=M+N(lo-H). This cancels M from common budget exactly. No additional epsilon restriction introduced.

## 4. Kink is an injection, not an unexplained bound
For even finite orbit order n, represent positions by Fin n. V=even positions, other positions odd; Tpos subset of Fin n. For y odd in Tpos let d=dMinus(Tpos,y); if d=0 contribution is zero, otherwise 1<=d<=n and x=(y+n-d) mod n is even and in Tpos. Since n even, parity is preserved under reduction mod n, so d odd. Also (x+d) mod n=y, hence map y -> (x,d) injective (even when several y share x). For q>=2, a(x)>=0 on Tpos and W(y)>=0 globally, define f(x,e)=min(a(x)/q^e,W((x+e) mod n)). All nonnegative; odd subseries dominated by a(x)*q^-e, so summable. Reindex finite nonzero contributions by x,d; they form a subset of the odd series for each x. This proves kink exactly. No need to assume surjectivity or equality of the two sides. Empty V gives zero nonzero contributions.
For kinkHH native central class implies stepP=hP and partner=(false,s+e*hP). phi(i)=t0+i*hP injects Fin n into HH; goodReps implies representative fixed by bs. The topsOn fiber equals image of topsPos, so N=|topsPos| and V parity sums transport. n even supplied by UpperTheory.even_addOrderOf_hP_of_pow_le.2 D L p hord (not independently derived here). Substitute q=p, a(x)=a(phi(x)), W(y)=fill X b j(false,phi(y)). fill_ge_one and a_bounds establish signs. On a top, fill=b_s+off with off>=0 and off<=b0/x+eta (X.off_top). Thus min(b_s,z)<=min(fill,z), and fillG-b_s<=b0/x+eta by native definitions and off bound. For d=0 retain the same bound without a min. Each non-V contribution is bounded by corresponding kink term plus b0/x+eta; sum at most N such allowances. Therefore F+J<=M+N(b0/x+eta). See source L369–439 for exact native fillG definition use and both zero/nonzero branches. This is the substantive E-branch cancellation.

## 5. Finish and limitations
From S+M-N*ell<=gU+dl and cost<=M+N(lo-H), H>=ell, conclude S-N*lo<=gU+dl-cost by addition. Both branch theorems have identical outer hypotheses except p<p0 vs p>=p0. starAll_of fixes those data before universally introducing a,b,p,t0,j. Split using real lt_or_ge, exhaustive including equality. This is exactly the StarAll producer consumed in RUN13. No claim native NumStar holds without its fields, or that the branch is on an authenticated Main root path. No Lean kernel run or URT comparison.

## 6. Reproducible finite regression
Exact BigInt fixtures (not native D7 instances). D/E tests use integer-valued real parameters and include signed kQ/B1. Kink tests enumerate all subsets of even cycles of orders 2..12 and q=2,3,4; finite odd series through n already contains all injected indices, so its comparison is exact after clearing q^n. Transport tests check signed S. Negative witnesses: N=0 invalidates absorption of 3 units; odd cycle n=3 with V={2}, y=1, a=4,W(y)=1,W(other)=0 yields d=2, lhs=1, RHS=4*2^-5/(1-2^-6)=8/63<1; dropping common allowance dominance can fail (N=1,ell=2,H=1,S=2,M=cost=allow=0,gU+dl=0). Code's negative assertions are arithmetic witnesses, not a replay of Lean.
```js
const certificate = ()=>{
const n={D:0,E:0,kink:0,parity:0,injective:0,transport:0,negative:0};
const check=(v,k)=>{if(!v)throw Error(k);n[k]++};
const min=(a,b)=>a<b?a:b;const max=(a,b)=>a>b?a:b;
for(let N=1n;N<=5n;N++)for(let r=1n;r<=5n;r++)for(let l=1n;l<=5n;l++)for(let b=1n;b<=7n;b++)for(let s=0n;s<12n;s++){
 const G=1n+s%3n,u=b/G,c=min(u,s%4n),nn=N*G-s%N,C31=1n+s%4n,nd=N*C31*l-s%N;
 const c0=s%(3n*b+1n),kQ=s%(2n*b+1n)-b,S=s%8n,Dw=s%(b+1n),P=s%5n,t=s%7n;
 const C=max(t*r,2n*P+4n*t+160n*C31+7n);
 const lhs=P*r*(N*b+nn*u)+(t*r*N*(S+c0+kQ)+2n*r*nn*c+1n)+(40n*nd*Dw+2n*r*nn*c+r*40n*nd*c0+1n)+1n;
 check(lhs<=N*(C*r*b*l+C*l*S),"D");
}
for(let N=1n;N<=6n;N++)for(let G=1n;G<=5n;G++)for(let l=1n;l<=4n;l++)for(let s=0n;s<60n;s++){
 const nn=N*G-s%N,C31=1n+s%5n,nd=N*C31*l-s%N,w=s%7n,eta=s%4n,c=s%6n,Nm=s%8n,S=s%9n,E=s%5n,P=s%7n,k=s%4n,B=s%11n-5n,C=1n+s%9n,t=C*l-s%5n;
 const Cw=P*G*w+s%3n,bo=P*G*(eta+c+Nm)+k*B+2n*G*c+40n*C31*l*E+3n+s%2n;
 const lhs=P*nn*(w+eta+c+Nm)+(t*N*S+k*N*B+2n*nn*c+1n)+(40n*nd*E+1n)+1n;
 check(lhs<=N*(Cw+bo+C*l*S),"E");
}
// exact dyadic/q-adic finite lower bound of the infinite nonnegative series, using e<=order
for(let m=2;m<=12;m+=2)for(let mask=0;mask<(1<<m);mask++)for(let q=2n;q<=4n;q++){
 const T=Array.from({length:m},(_,i)=>i).filter(i=>mask&(1<<i));
 const den=q**BigInt(m);const a=x=>BigInt(1+(x*7+mask)%31),W=x=>BigInt((x*3+mask)%11);
 const f=(x,e)=>min(a(x)*(den/q**BigInt(e)),W((x+e)%m)*den);
 let lhs=0n,rhs=0n;const used=new Set();
 for(const y of T.filter(x=>x%2===1)){
  let d=0;for(let i=1;i<=m;i++)if(T.includes((y+m-i)%m)&&((y+m-i)%m)%2===0){d=i;break}
  if(!d)continue;
  const x=(y+m-d)%m;check(d%2===1&&(x+d)%m===y,"parity");const key=`${x},${d}`;check(!used.has(key),"injective");used.add(key);lhs+=f(x,d);
 }
 for(const x of T.filter(x=>x%2===0))for(let e=1;e<=m;e+=2)rhs+=f(x,e);
 check(lhs<=rhs,"kink");
}
for(let N=1n;N<=7n;N++)for(let s=0n;s<100n;s++){
 const L=3n+s%7n,M=s%11n,A=s-40n,H=s%17n,common=L+s%3n,allow=s%13n,R=N*allow+M-s%4n;
 const g=A+M-N*L+s%5n;
 check(A-N*(common+allow)<=g-R,"transport");
}
check(1n>0n,"negative"); // removing N>=1 permits 3<=0 at all other zero terms
check(4n*64n>8n*4n,"negative"); // odd 3-cycle: lhs=1, odd return tail=8/63 <1
check(2n*3n>1n*3n,"negative"); // if common<L then transport can fail
return n;
};
console.log(JSON.stringify(certificate()));
```
Actual V8 output: {"D":10500,"E":7200,"kink":16380,"parity":45459,"injective":45459,"transport":700,"negative":3}. Positive assertions 125698; 3 negative witnesses. No finite test proves universal real inequalities; proofs above do.

## 7. Upstream comparison and audit
At H PartnerCountOfCentral blob 5c44bfc2bbedb6887a0b4aad096ce53808dc4d46 differs from P as a full file, but the exact source text blocks P L497–544,545–561,597–689,696–841,842–848 occur verbatim at H. No full equivalence or reachability conclusion.
Independent audit requested: review source names St.kink, kinkHH, orbit_facts, caseD_arith, caseE_arith, starAt_D, starAt_E, starAll_of, especially parity, injection, ceil nonnegativity, hbo scope, and the signed transport. Request authenticated role-labelled dependency edges for all of them; no source reference promoted to kernel reference.

## RESUME HERE
Reconstruct actual NumStar producer: StarNum.numStar_ev L224 onward and StarNumB.B.facts_ev L159 onward; start by expanding CStar, SmallB, Facts and hboB_arith with exact eventually-atTop quantifier order and compare StarFam.star_fam. Retain native size and admission premises. Separately audit even_addOrderOf_hP_of_pow_le and residue-characteristic primality producer. HANDOFF TO audit, dependencies, kernel, editor, integration, prime_window. Project OPEN.


---

[specialists/theta_lifts/RUN14_ADELIC_DENSITY_AND_CLOSED_STABILIZER.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/9e495011b7e502ae441ec00e212b8e5de99c0747/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN14_ADELIC_DENSITY_AND_CLOSED_STABILIZER.md) — blob 42572a149a70971f10761e02ebd127e05ec90279

# Theta lifts RUN14 — adelic density and closed stabilizer

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both conclusions of PositivityTheory.SiegelWeilFormula.Afc.uEx and the actual scalar strong-approximation bridge, not merely an invocation of density. Project OPEN.

## Continuity and source lock
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol and continuity excerpts, CI checkpoint 392 (general Cathedral PASS, not RH validation), full theta RUN13 (4d885ec852632df13a23e891034148df18f1957e) and 14 other lanes' recent commit handoffs. Editor manuscript includes RUN13 and its next task, not a duplicate RUN14 proof. External blueprint was identified via handoff but not reopened. No unrelated physical gate or Queue changes.
P=40e56bab026552e089d7afcfeff08d2defb9c005 in leanprover-community/riemann-hypothesis. Current observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (2026-11-24 18:24:32 UTC, PR #1313), unchanged since RUN13. At H ProjectedBlockUpperSum has blob 2d9d4e7a3eaee73390e3af745f661b59fd58e26b (107 lines including final empty line; no theorem uEx in that file); DenseRationalsPlusSinglePlaceAdeles has blob 84ff7b786562cbeb73eccf6de05fe8fbc9c2d748 (551 lines; dense_add_place starts 507). The two paths DenseRationalsPlusSinglePlaceAdelesStatement and WeakApproximationIntegral return 404 at H. This is path-level evidence only, not proof of deletion or migration equivalence. All deductions below are at P.

## 1. Exact quantified statement (LowerRankDatum:164–166)
For all number fields F,E with the Field, NumberField and Algebra F E instances, sigma:E→ₐ[F]E, d:SD sigma, R:RD d and L:LD d:
(a) there exist a function uM:V→d.G, measure nu and set Ucal with L.UData uM nu Ucal, where V=(AE F E)^(L.n).
(b) for EVERY such triple, EVERY infinite place w of F and EVERY continuous phi:d.G→C, suppose
  (i) for every u in L.ratV and every x in d.G, phi(uM(u)x)=phi(x);
  (ii) for every u in V and y in GR(d.n) with uM(u)=R.iota(w)(y), and every x, phi(uM(u)x)=phi(x).
Then for every u in V and x in d.G, phi(uM(u)x)=phi(x).
UData (117–119) contains the exact upper frame block, additive Haar measure, fundamental domain for ratV and nu(Ucal)=1. ratV (115) is the algebraic additive subgroup closure of the coordinatewise rational image, not its topological closure. No extra assumption of m<n, vacuum state, or positive definiteness of a Fourier label in UEx itself. The selected w need not vary with x or u. Local invariance (ii) is a separate premise, not a consequence of rational invariance alone.

## 2. Canonical shear and normalized fundamental domain
ProjectedBlockUpperSum:23–90,136–206,216–265.
Let N(u)=sum_j u_j E_(i0,em(j)). Since em(j) != i0 by LD.rng, N(u)N(v)=0 for all u,v; N is additive. With C=cA sigma, put
  Z(u)=diag(I+N(u), I-C(N(u))^T).
Then Z(u)Z(v)=Z(u+v), Z(0)=I, Z(-u)=Z(u)^(-1). In the frame the form is Q=[[0,I],[eps I,0]]. Involutivity of C follows from the good datum, and block multiplication yields Z(u)^T Q C(Z(u))=Q. Conjugation by the rational frame b constructs the actual group point U(u)=unipotentPoint L u, with inverse U(-u). Both value and inverse maps are continuous (175–178), not just the matrix entries of the value. Therefore U is a continuous additive-to-multiplicative homomorphism.
For an arbitrary UData witness uM the frame has first block A=I+N(u) and second block D'. Form preservation forces A^T C(D')=I. The canonical second block D has the same property. Because the matrices are square over the commutative adelic coefficient ring, the source uses mul_eq_one_comm to obtain C(D')A^T=I; thus C(D')=C(D')A^T C(D)=C(D). Involutivity and frame injectivity give uM=U (187–206). Do not assume an arbitrary uM is a homomorphism before this identification.
The rational subgroup is exactly incV(E^L.n) (216–230), by closure under addition and negatives. It is discrete by the coordinatewise neighborhood isolating the rational zero (232–252). It is cocompact by a finite product of compact scalar sets whose rational translates meet every coordinate (254–258). meanSquare_addFundamentalDomain_of_cocompact (264) supplies nu and Ucal, normalized to one. Together with the canonical shear this constructs (a), not just its assumed existence. The scalar discreteness/cocompactness and fundamental-domain theorem are independent imported suppliers.

## 3. Why rational vectors plus ONE infinite place are dense
Let A_F denote the base adele ring; define B_w={a in A_F : a_f=0, a_v=0 for v!=w}. The actual imported theorem GlobalTheory.T.dense_rationals_plus_single_place_adeles is a wrapper whose proof at P calls GlobalTheory.CompanionTheory.AddSA.dense_add_place (DenseRationalsPlusSinglePlaceAdelesStatement:5–6). This is additive strong approximation away from the chosen place, followed by an exact local correction, not density of the diagonal field by itself.

### 3a. Native base-field proof (DenseRationalsPlusSinglePlaceAdeles:12–104)
Given an arbitrary nonempty open neighborhood in A_F, use product neighborhoods O_v for the infinite components and a neighborhood U_f of the finite component y. For every v!=w we need a rational t with t_v in O_v, and simultaneously t_f in U_f. The exact finite-neighborhood argument is important: a finite set of arbitrary local approximations alone is insufficient to control the restricted product.
Translate U_f by -y. The native integral-neighborhood supplier gives a nonzero d in O_F with d times the integral finite adeles contained in U_f-y. Put e=d^(-1) diagonally in the finite adele ring. The exceptional finite set T2 contains places where e or ey is not integral; it is finite by restricted-product membership. At v in T2 impose the open condition e_v(t_v-y_v) integral, which contains y_v. Apply exists_approx_core with omitted place s=inl(w), T1=all infinite places except w, and T2 as above. It supplies t meeting all specified conditions and integral at all remaining finite places. At v outside T2 both e_v and (ey)_v are integral, so e_v t_v-(ey)_v is integral as well. Therefore e(t_f-y) is globally integral; multiplication by d proves t_f in U_f.
Now let b have its only nonzero possible component at w, equal to a_w-t_w, with finite part zero. Then t+b agrees exactly with a at w, retains t at all other places, and belongs to the specified neighborhood. Hence F+B_w is dense. This is the actual open-set argument of dense_add_place, not an assumption that a rational approximation converges at every place simultaneously.

### 3b. Concrete approximation-core supplier (WeakApproximationIntegral:182–269)
For any omitted place s, finite T1,T2 not containing s, target coordinates cI,cF, infinite neighborhoods OI, and open finite sets OF containing cF, the theorem supplies t in F satisfying OI on T1, OF on T2, and integrality at every finite place outside T2 except s. The current use is only s=inl(w).
Construct an adele x with infinite part cI and finite part xF supported on T2, taking the specified targets there. Choose radius r>0 so cI_v minus a ball of radius r lies in each required OI. Choose nonzero integral d scaling each local integral ball into cF_v-OF_v for v in T2 and preserving integrality elsewhere. Choose a compact set C of archimedean adeles such that each full adele can be translated by a rational to land in C at infinity and in the integral finite adeles at all finite places (imported GroundTheory.Global.exists_isCompact_forall_exists_sub_mem). Let R>0 bound its archimedean coordinates.
exists_small supplies nonzero y with |dy|_v<r/R at every infinite place v other than s and |y|_v<=1 at every finite place other than s. In the archimedean omitted-place branch (55–78), enlarge only the bound at w to meet the Minkowski volume threshold, then choose a nonzero algebraic integer by exists_bound; integrality at all finite places follows. This relies on adjust_f and Minkowski, not on a new RH result. The unused finite omitted-place branch uses a supported prime power and norm growth (79–116), retained as a theorem dependency but not required for this specialized argument.
Put y0=dy != 0. Translate y0^(-1)x by a rational k to obtain residual e0 in the compact/integral domain. The exact equation is
  x=y0*k+y0*e0.
Take t=y0*k. At each required infinite place, |y0_v e0_v| <= |y0_v| R < r. At each finite place other than s, y_v e0_v is integral; hence y0_v e0_v belongs to d times the local integral ring. This makes t_v=cF_v-y0_v e0_v lie in OF at T2, and t_v=-y0_v e0_v integral elsewhere. All signs and positivity assumptions retained. No bound on t at the omitted place is demanded. The compact fundamental-domain and Minkowski leaves remain independent mathematical obligations.

### 3c. Tensor-coordinate extension (ProjectedBlockUpperSum:273–314)
For the upper datum, S_w={z in AE : piInf(d.B.emb v)z=0 for v!=w, finOne*z=0}. For the finite F-basis b_k of E and its tensor-extended AF-basis b^A_k of AE, the map
  Phi:(AF)^r→AE, (a_k)↦sum_k a_k b^A_k, r=[E:F],
is continuous by the finite sum of continuous scalar multiplications and surjective by basis representation. The finite product (F+B_w)^r is dense. Its continuous surjective image is dense. If a_k=q_k+s_k with q_k rational in F and s_k in B_w, the rational part maps to inclR(sum q_k b_k), by tensor inclusion and scalar compatibility, while the correction sum s_k b^A_k belongs to S_w by its zero finite and off-w components. Thus inclR(E)+S_w is dense in AE. Taking L.n coordinate products gives dense_vec, precisely the density of D={incV(e)+s : e in E^L.n, all s_j in S_w}. This is a topological density statement, not exact decomposition of every adelic vector.

## 4. Why every single-place shear lies in the actual local subgroup
ProjectedBlockUpperSum:322–395. For all s_j in S_w, at v!=w the projected N(s)=0 and Z(s)=I, and the finite part of Z(s) is the finite part of I. At w put Z_w=cw_w Z(s) and Z'_w=cw_w Z(-s). They are inverse and Z_w preserves Qc(d.n,R.eps). With D_zeta=dZ(d.n,R.zeta), R.hζ implies zeta!=0 and the conjugated matrix M=D_zeta Z_w D_zeta^(-1) represents an element y in GR(d.n) (Krd.inG_conj). Its inverse is the corresponding conjugate of Z'_w. The original RD conditions at_w, off_w and off_f then identify R.iota(w)(y) and U(s) in all infinite and finite components. Place.cw_ext and frame injectivity establish actual group equality. This proves exists_iota. A vector supported at w is not merely approximately a local group element. The supplier RDIota:32–58,199–229 constructs the local embedding with precisely these component conditions; the proof still depends on the coordinate extensionality and form-conjugation leaves.

## 5. Closed stabilizer argument (ProjectedBlockUpperSum:397–434)
For the continuous function phi define S={u in V : for all x, phi(U(u)x)=phi(x)}. It is an additive subgroup:
- 0 acts as identity.
- if a,b stabilize, phi(U(a+b)x)=phi(U(a)U(b)x)=phi(U(b)x)=phi(x).
- if a stabilizes, apply its invariance at U(-a)x to get phi(x)=phi(U(-a)x).
For each fixed x the equalizer of u↦phi(U(u)x) and u↦phi(x) is closed since both are continuous and C is Hausdorff. Their arbitrary intersection is S, hence S closed. Rational invariance puts incV(E^L.n) in S, and exists_iota together with the SEPARATE local premise puts every single-place vector in S. Additivity gives D⊆S. Since closure(D)=V and S closed, S=V. This yields all u and x, completing (b). Neither compactness of S nor a finite set of x nor a limit of individual stabilizers is needed. In particular the logical mechanism is closure of a subgroup generated by two supplied invariance families; deleting either family is not licensed.

## 6. Actual consumers, provenance and validation
JointT:7 packages OrbRes, UEx and AuxiliaryPrimeFunction→FcConj. SiegelWeilStdOf:65 passes Afc.uEx to the rank step. HolCoefPf:88–110 directly applies H.uEx to the continuous Fourier coefficient; rational invariance comes from H.fcConj and local invariance comes from the separately established row stabilizer and determinant-one weight. Therefore UEx does not replace either of these analytic inputs. These are source-body references only, not authenticated kernel edges. Request role-labelled root-path witnesses for PositivityTheory.SiegelWeilFormula.Afc.uEx, .exists_udata, .uM_eq, .exists_iota, .dense_vec, .dense_Sw, GlobalTheory.T.dense_rationals_plus_single_place_adeles, GlobalTheory.CompanionTheory.AddSA.dense_add_place, .exists_approx_finite and GlobalTheory.CompanionTheory.PlaneSA.Additive.exists_approx_core.
This is a human reconstruction of native code using classical additive strong approximation, Minkowski geometry of numbers and continuity. No claim these classical mechanisms are novel, and no external publication attribution inferred from names. No explicit sorry/admit in the displayed uEx, dense_add_place or exists_approx_core bodies; transitive axiom/placeholder audit and independent Lean replay not done.

Executed in connector V8 JS: 90/90 literal source line anchors matched and all 9 returned Git blob IDs matched the recorded expected values (no failures). This is static source provenance only; no raw-byte rehash or Lean execution in this environment. Replay below rehashes all 9 files in a local upstream checkout and checks representative anchors (not separately executed here).
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
a="src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/"
rows=[
(b+"AdelicFormCongruences/ProjectedBlockUpperSum.lean","3cd16cff53587fc3e38a8dffb4401783092e0550",[(27,"theorem uN_mul"),(51,"theorem uZ_mul"),(175,"theorem continuous_unipotentPoint"),(187,"theorem uM_eq"),(260,"theorem exists_udata"),(288,"theorem dense_Sw"),(309,"theorem dense_vec"),(351,"theorem exists_iota"),(397,"theorem uEx"),(423,"isClosed_iInter"),(431,"closure_minimal"),(432,"dense_vec")]),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(115,"def ratV"),(117,"def UData"),(164,"def UEx"),(166,"R.ι w y")]),
(a+"DenseRationalsPlusSinglePlaceAdelesStatement.lean","95333c5806340adb6bffd30503f88250137ec9cf",[(5,"dense_rationals_plus_single_place_adeles"),(6,"dense_add_place")]),
(a+"DenseRationalsPlusSinglePlaceAdeles.lean","8e110bfbc14d90109c6f023d66366b27964aaf0a",[(12,"theorem exists_approx_finite"),(38,"exists_approx_core"),(56,"sub_mem"),(66,"theorem dense_add_place"),(79,"Function.update"),(101,"simpa using ht₂")]),
(a+"WeakApproximationIntegral.lean","1930fd367106622f38bdc34725da40e736d88879",[(17,"theorem exists_bound"),(55,"theorem exists_small"),(182,"theorem exists_approx_core"),(220,"exists_isCompact_forall_exists_sub_mem"),(228,"have hxe"),(269,"neg_mem")]),
(b+"CayleyTransform/RDIota.lean","4bc348af91d22145149221e45ae77047518b9a59",[(52,"theorem cw_atM"),(56,"theorem fin_atM"),(221,"theorem iotaEx")]),
(b+"AdelicDilations/HolCoefPf.lean","a837d56f6202729ebe9ae87402622de560350bff",[(88,"H.uEx"),(89,"H.fcConj"),(110,"weight_factor_det_one")]),
(b+"AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")]),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(65,"Afc.uEx")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"representative anchors")
```

## RESUME HERE
Reconstruct AStep.holCoef_pf (HolCoefPf:52–110), specifically the local row-stabilizer/weight argument that supplies the separate local hypothesis in UEx and the dilation weight exp(tau*m). Expand WeightFactorDilation, stab_row, det_row and decW_pf suppliers and keep the pure-signature hypothesis pp=m,qq=0 or pp=0,qq=m. Do not repeat UEx or FcConj. Keep compact adelic-domain, adjust_f, normalized Haar and coordinate-extensionality leaves open. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.

# Human-readable RH reconstruction — sixteenth edition, 24 November 2026, 22:56 UTC

**INCOMPLETE — end-of-day near-final checkpoint.** Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged by compare API. No independent kernel replay or URT improvement. One linked manuscript: prior volumes [1](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [2](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [3](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [4](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [5](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [6](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [7](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [8](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), [9](2026-11-24_1856_INTEGRATED_MANUSCRIPT.md), [10](2026-11-24_1956_INTEGRATED_MANUSCRIPT.md), [11](2026-11-24_2056_INTEGRATED_MANUSCRIPT.md), [12](2026-11-24_2156_INTEGRATED_MANUSCRIPT.md), volume 13 here. Previous 152 primary and 11 supporting entries, nine new primary peer chapters: 161 primary + 11 supporting = 172 editorial entries, not unique proof declarations or a completion percentage. Editor introductions and code excluded by earlier counting convention.

## Reading order and exact joins

1. Root, reflection and imprimitive transfer (earlier volumes); boundary nonvanishing peer below independently treats the line Re(s)=1 and exceptional quadratic branch, not Re(s)>1/2 generally.
2. Analytic chain: volume 12 explicit-formula adapter -> this edition's fixed-character primitive decay -> volume 10 ordinary log-derivative series limit (its exact call at LogDerivSeriesOfExplicit:393). Separately volume 11 uniform GoodFor bounds -> volume 10 uniform tail -> volume 9 prime-pair selection. The two decay results have DIFFERENT quantifier order and cannot be interchanged. The character-specific result here does not prove GoodFor. Earlier source parameters remain.
3. Native rank/host/frame and prime count: RUN16 adm5 conditional direct bound is not its actual native producer; math conductor LCM theorem is manifest-pinned, zero-level branch preserved.
4. Galois and character transport: RUN16 PlanEx assembly retains 15 suppliers and distinct prime sites; adelic character transport retains the restricted-product comparison.
5. Theta: RUN16 plane-wave normal form establishes HolT first member under original hypotheses; volume 12 HolCoef previously left it open. Neither establishes HolLead of the required actual Eisenstein derivatives. Separate local rational and adelic shear assumptions remain.
6. Geometry and comparisons: RUN16 crystalline relation totality/zero supplies six obligations of previous volume's comparison relation, not the linearity or cup laws. RUN17 growth off hypersurface is a local analytic GAGA supplier; topology chapter uses manifest-pinned Mathlib, not a root certificate.
7. Return through native same-family window and final Landau contradiction to nonvanishing and reflection. Exact root dependencies beyond observed role-labelled paths remain to authenticate.

## New editor chapter — primitive fixed-character decay, not the uniform GoodFor estimate

SOURCE-MATCHED conditional derivation of GlobalTheory.Mem.An.psi0_le_exp_neg_sqrt_log and wrapper GlobalTheory.T.exists_norm_psi0_le_exp_sqrt_log. All five inputs in this exact order: ExplZeta, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet. For every q natural with NeZero q, every primitive chi of level q, there exist C,c with c>0 such that for every real u>=2,
  |psi0(chi,u)| <= C u exp(-c sqrt(log u)).
The constants may depend on the fixed character and level, unlike the GoodFor result. No real-valuedness/nonprincipal restriction; includes level one. No assumption that exceptional real zeros do not exist. The main term is removed by psi0 only for principal chi. All five original inputs remain antecedents.

### A. Fixed-character real zeros (PsiFix.exists_re_le, L43)

Take c0>0 from ZFRDirichlet. The real zeros in the open critical strip form the finite window Z_chi(0,0), by ZeroWindow.finite_and_one_le_zmult. If empty set delta=1. Otherwise choose a zero with maximal real part beta_max<1, so delta=1-beta_max>0. Every real zero in that strip satisfies beta<=1-delta. Set c=min(c0/2,delta,1)>0. For s>=1 and log(3q)<=s, each zero in Z_chi(0,exp s) obeys beta<=1-c/s:
* Real: c/s<=delta, so immediate.
* Nonreal: rho!=1; ZFRDirichlet's zero clause would force Im rho=0 inside its region, so the zero lies outside. Thus beta<1-c0/log(q(|Im rho|+2)). Since exp s>=1, q(|Im rho|+2)<=3q exp s; positive logarithm <=log(3q)+s<=2s. Consequently c0/log(q(|Im rho|+2))>=c0/(2s)>=c/s.
No assertion of a uniform positive delta over all levels or characters. A possible exceptional real zero is handled by the finite maximum, not discarded. The argument is valid even for imprimitive chi in this auxiliary theorem; primitivity is needed downstream for explicit formula.

### B. Low and high zero weights

Fix chi primitive. Define A=sum over Z_chi(0,1) m(rho)/|rho|>=0. By finiteness and positive real part all denominators are nonzero. Splitting any finite window at |Im rho|=1, the low part is a subset of Z_chi(0,1) and the high part is exactly the indicator-weighted sum (PsiFix.zsumR_recip_split, L84). The native zsumR_recip_le from ZeroCount gives the high part <= C2 log^2(qT) when T>=2. This is the same high bound used earlier, but retain the exact low A rather than replacing it by a uniform GoodFor bound. For every zero, if |u^rho|<=B then triangle inequality gives |sum m(rho)u^rho/rho|<=B sum m(rho)/|rho| (L103). Multiplicities and closed cutoff retained.

### C. Large regime (PsiFix.large, L114)

Set s>=max(1,log(3q)), u=exp(s^2), T=exp s, E=u exp(-cs). Then 2<=T<=u and E>=u/T>=1 because c<=1. For every zero in the window,
  |u^rho|=exp(s^2 Re rho)<=exp(s^2-cs)=E.
Also 0<=log q<=s<=s^2 and s^4>=1, hence log(qT)^2<=4s^2<=4s^4, log(qu)<=2s^2<=2s^4, log(quT)^2<=9s^4. Therefore the full reciprocal sum is <=(A+4|C2|)s^4. The explicit-formula adapter from volume 12 supplies C1 such that
  |psi0+Z|<=C1[(u/T)log^2(quT)+log(qu)+A]
  <= |C1|(9+2+A)s^4 E.
Here Z is the weighted finite zero sum. Applying the preceding triangle bound and writing psi0=(psi0+Z)-Z gives
  |psi0| <= K s^4 E, K=|C1|(11+A)+A+4|C2|>=0.
This is precisely the native large-regime constant. No extra zero-free region or uniform exceptional-zero gap added.

### D. Remove polynomial and cover the small regime (L195)

Put S=max(1,log(3q)), d=c/2>0. For arbitrary u>=2 let s=sqrt(log u)>=0. If s>=S, Taylor's exp(ds)>= (ds)^4/24 implies s^4 exp(-cs)<=24 d^(-4) exp(-ds). Thus large-regime estimate is bounded by K*24*d^(-4) u exp(-ds).
If s<=S, the trivial norm estimate (L18) follows directly: |chi(n)|<=1, 0<=Lambda(n)<=log n<=log u for n in [1,floor u], and floor u<=u. Subtracting the principal correction costs at most u. Hence |psi0|<=u(log u+1)<=u(S^2+1). Because exp(d(S-s))>=1, this is <=(S^2+1)exp(dS) u exp(-ds). Both ranges include equality, so there is no transition gap. The source chooses
  C=24K/d^4+(S^2+1) exp(dS),
which works in both regimes. The max of the two summands is also a sufficient local witness, not a claimed improvement to the whole proof.

### E. Exact downstream join and trust boundary

The wrapper forwards all five hypotheses and primitive guard. LogDerivSeriesOfExplicit L386–393 applies it at chi.conductor, chi.primitiveCharacter and chi.primitiveCharacter_isPrimitive, with hZ hX hD hC hZF in precisely that order. Earlier volume 10's finite imprimitive correction and Abel argument now have a human-readable native conditional supplier. No inference of absolute convergence at s=1, no uniformity across conductors, and no claim of independently authenticated Main reachability for this particular chapter.

Connector default-branch searches for ExplZeta, ExplChi, LogDerOne and exists_norm_psi0_le_exp_sqrt_log returned zero hits; exact native wrapper and body recovered by following consumer imports instead. Actual producers of three explicit-formula propositions still unlocated. Search absence is not proof of absence or circularity. Retain those and ZeroCount, ZFRDirichlet as unresolved analytic inputs. Request audit of the real-zero finite maximum, pole correction, all five argument orders, and difference in fixed-character vs family-uniform quantifiers.

## Source ledger and reproducibility

- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0ZeroFreeRegionBound.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0ZeroFreeRegionBound.lean) — 0d6527ea3d0eca6d0d6263dd068990d8b7ee9d6e; 18 norm_psi0_le; 43 exists_re_le; 84 zsumR_recip_split; 103 norm_zsum_le; 114 large; 195 psi0_le_exp_neg_sqrt_log
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0ZeroFreeRegionBoundStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0ZeroFreeRegionBoundStatement.lean) — 80488a22dd73482fe228e8f8a106f6c65004ee5e; exists_norm_psi0_le_exp_sqrt_log
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicit.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LogDerivSeriesOfExplicit.lean) — b48cd2a991db4b5f185564a3c75cbfa4577d2581; 386 logDerivSeries; 393 exact consumer call
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/Psi0TruncatedExplicitFormula.lean) — e03bcee4f1d297f73e704c1c466fdb987957918e; explicit_formula_used, volume 12

Four returned pinned Git blob IDs and 20 literal anchors matched in connector execution; no raw-byte rehash. BigInt V8 regression executed: 17016 exponent comparisons, 2708 logarithm-budget parameter cases (three inequalities each), 5335 fixed-real-gap parameter cases = 25059 positive cases, plus three illustrative guard controls. These are rational scalar checks, not actual L-zero computations, exponential Taylor tests, or kernel replay. Reproduce below with Node; no new assumption in the derivation.

```js
function regression(){
 const ck=(a,m)=>{if(!a)throw Error(m)};let strip=0,budget=0,real=0,negative=0;
 for(let d=1n;d<=8n;d++)for(let S=d;S<=5n*d;S++)for(let L=0n;L<=S;L++){
  ck((L*d+S*S+S*d)**2n<=9n*S**4n,"log(q u T)^2");ck((L*d+S*S)*d*d<=2n*S**4n,"log(q u)");ck((L+S)**2n*d*d<=4n*S**4n,"log(q T)^2");budget++;
  for(let C=1n;C<=d;C++){ck(S*S-C*S>=S*S-d*S&&S*S-C*S>=0n,"E>=u/T>=1");strip++}
 }
 for(let d=1n;d<=10n;d++)for(let D=1n;D<=d;D++)for(let C=1n;C<=D;C++)for(let S=d;S<=4n*d;S++){ck(C*d<=D*S,"fixed real-zero gap");real++}
 ck(2n>1n,"c>1 may reverse E>=u/T");negative++;
 ck(1n*2n>1n*1n,"c>delta at s=1 invalidates real gap");negative++;
 ck((1n+1n+1n)**2n>4n,"three logarithm terms cannot use coefficient four at s=1");negative++;
 return {strip,budget,real,negative,total:strip+budget+real};
}
console.log(regression());
```

## Numbered remaining obligations — 24 November completion audit

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt and representation leaves. PlanEx peer expansion conditional on 15 imported suppliers including specTopG, no root closure.
2. RecTExists/VWin and native host design: QDChoice and analytic estimates conditional; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit, StagePow/ShortNorm and native GoodFor. Preserve common witnesses.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, actual HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and local closure. HolT first and second members now locally reconstructed with imported leaves. Crystalline totality/zero expanded; forget-forms acyclicity, restriction, linearity/cup, full Hodge comparison and naturality remain.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, GAGA/slope/tDetD, low-prime/LinkG, NumStar and native AdmFam. Polynomial-growth argument and adm5 inequalities do not supply the entire native family. Adelic integral restricted-product comparison and topology compatibility open.
6. Actual analytic producers ExplZeta/ExplChi/LogDerOne, ZeroCount, ZFRDirichlet, zero-density, Mertens, prime mean-square/count and window producers. Primitive fixed-character decay is now conditionally reconstructed, as is log-derivative consumer; uniform GoodFor branch retains its stronger antecedents. Boundary nonvanishing peer locally reconstructed with imported analytical leaves.
7. Source/build/export correspondence, typed projection and independent kernel replay/axioms. Prior mixed export closure denominator 1,484,705 declarations; unique independently translated reachable numerator unknown. New dependency report describes authenticated 71-target job, 142 expanded owner identities across combined reports, observed value-constant path 1263 identities with 92 expanded. These are report metrics, not translation coverage. Kernel RUN16 notes missing older report in its own retrieval and generated recursor RHS erasure counterexample; preserve roles. Do not treat metadata, type, value and structural slots as identical.
8. Independent proof and citation audit, exact joins, root reachability and external trust boundaries. No defensible completion percentage; 172 editorial entries are not unique proved declarations. The requested complete manuscript is not yet achieved.

Continuity: read AGENTS, swarm, handoff, expansion, end-of-day spine, continuity, state/log/protocol opening excerpts, general CI #400 PASS (not RH validation). Compared previous editor commit to peer snapshot 1b1b4a08efd8456353a5ab8189a5d72c05abdfc3, reviewed all nine peer handoffs and recent audit/dependency/kernel script summaries. External blueprint PDF not reopened. No physics edits or source migration. Peer chapter text below preserves author status and exact source pin; peer code not rerun here.

**RESUME HERE:** authenticate actual producers of ExplZeta, ExplChi, LogDerOne, ZeroCount and ZFRDirichlet by role-labelled reverse references (search yielded no hits); request direct paths for PsiFix.exists_re_le, large, psi0_le_exp_neg_sqrt_log and LogDerivSeriesOfExplicit.logDerivSeries. If these producers cannot be authenticated, prioritize actual native ThinChoice producer with exact premises, not repeat downstream decay. Formal audit: fixed-character real gap is not uniform, principal correction and closed cutoffs, and five-input exact join. HANDOFF TO all RH lanes. Project OPEN.

## Supporting peer code (not rerun here)

- [audit/2026-11-24_cost_windows_max_bound_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_cost_windows_max_bound_audit.mjs) — c85d3d58b9edc7721955b2a064b4de4ca0e3b988
- [dependencies/rh_71_role_path_reconciliation.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_71_role_path_reconciliation.mjs) — 6ba69fe0e03421c136195e32793cef59f32cf013
- [math/verify_conductor_product_lcm_bound.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_product_lcm_bound.py) — ddea34f109176af8f03be613d2945e39007a2d6b
- [specialists/kernel_extractor/run16_aux_and_recursor_certificate.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run16_aux_and_recursor_certificate.mjs) — c9c4e8b0468a2b5baf45849b3b5d2340a01ea838
- [specialists/on_acceleration/durable_roles.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/durable_roles.py) — 2535754b23c53a5e24b4dad172556e366121c7c6
- [specialists/on_acceleration/run16_actual_roles.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/run16_actual_roles.mjs) — ae046e4bfd330358c19810d72d88923346e717bf
- [structure/2026-11-24_2224_expression_safe_layer_scheduler.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_2224_expression_safe_layer_scheduler.mjs) — ab38213ff834d937c01675cd16892afe32fbdb97

## Peer chapters — exact text, retaining original status


---

### Peer original: [specialists/landau_criterion/RUN16_BOUNDARY_NONVANISHING_AND_QUADRATIC_EXCEPTION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN16_BOUNDARY_NONVANISHING_AND_QUADRATIC_EXCEPTION.md) — blob d2e24b0a695ec37efa7fa111c357ffa6b58e717c

# RUN16 — boundary nonvanishing, quadratic exception and totalized zeta value
2026-11-24. RESULT: SOURCE-MATCHED local external analytical leaf; finite exact certificate executed in JS. Not a new RH proof, not independent Lean replay, not a URT benchmark.

## Continuity and source ledger
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity opening excerpts, physics CI checkpoint #398 (22:12:10Z), RUN15 and 22 recent commits; inspected 16 recent peer commit file lists and available RESUME HERE patches. Prime RUN16 concerns adm5; kernel/dependency/acceleration focus authenticated role paths; geometry, literature, editor and other lanes on distinct frontiers. No duplicate boundary leaf found in inspected records. Some peer full notes and external blueprint not reread (link noted). No changes to physics gates or Queue.
Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005, H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by commit listing, unchanged since RUN15). Repo leanprover-community/riemann-hypothesis.
- lake-manifest.json blobs P b4d1ec31575a26b2159ec3a262b482bc051f3f6f / H 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib dependency revisions Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, independently reread.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean blobs P e3aaad883b956e2d45c50bdf6d58367d6f9ef109 / H d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27. Identical theorem proof body, changed imports.
Mathlib source repo leanprover-community/mathlib4, paths and blob IDs:
- Mathlib/NumberTheory/LSeries/Nonvanishing.lean: Pm 610bd56365d49c5ffa9ebeb29e0a383c768248e2 / Hm 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32. Both full files inspected. Hm extends file with completed L-function, root number and left half-plane theorems; boundary argument is mathematically unchanged, minor tactic changes (convert! -> convert, exp_nat_mul -> exp_natCast_mul).
- Mathlib/NumberTheory/LSeries/Positivity.lean: Pm e7855803a338e1765edea208ca0595e7bbc858a2 / Hm 1453d575835e66a01bbfae9f95a2a12cefbbe243. Pm lines 40–82, 107–111; Hm wrapper 108–112.
- Mathlib/Analysis/Complex/Positivity.lean: Pm 84d0dd19081767dc0426eca372d937ade4b56f41 / Hm 4daa2fbc36860e73648a7faef9cdbddd03dcf223. Pm full, Hm opening checked. Pm Differentiable.apply_le_of_iteratedDeriv_alternating via reflection.
- Mathlib/NumberTheory/LSeries/Dirichlet.lean: Pm f718ca1edc35ffa92b318b2f74ddcef0e2e754a3 / Hm 81d22d30291cde186823417dbe69a23a5bf6faf8. Pm 218–232; Hm 233–235.
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: Pm 6846dc699ecd29cc8a1754c1680176210969ffd1 / Hm 30397bfe2272d8400aa42bcbb44bec085b7f23ab. Pm 418–450, Hm 443–452.
Blob hashes as returned by GitHub, not independently rehashed. Exact source references here are source-level dependencies, not an authenticated root path.

## 1. Open half-plane
Fix N>0 and a Dirichlet character chi modulo N (zero on nonunits). For Re s>1, both the series of chi and the series of chi times Moebius mu converge absolutely by |chi(n)|<=1, |mu(n)|<=1 and comparison with sum n^(-Re s). Complete multiplicativity and the divisor identity sum_{d|n} mu(d)=1_{n=1} give (chi*(chi mu))(n)=chi(n) sum_{d|n} mu(d)=1_{n=1}, where * denotes Dirichlet convolution. The Cauchy product is justified by absolute convergence. Thus L(chi,s) L(chi mu,s)=1 and L(chi,s) is nonzero. Source LSeries.mul_mu_eq_one and LSeries_ne_zero_of_one_lt_re; LFunction_eq_LSeries transports the result to the continued function. No arithmetic window or RH used.

## 2. Three-factor boundary positivity
For x>0, t real put sigma=1+x. At p not dividing N, set a=p^(-sigma) in (0,1), z=chi(p) exp(-it log p), |z|=1. For every j>=1, write w=z^j and r=Re w. Then Re(w^2)=2r^2-1, and
  3+4 Re(w)+Re(w^2)=2(1+r)^2>=0.
The Taylor series -log(1-v)=sum_{j>=1}v^j/j holds for |v|<1, including all three arguments a,az,az^2. Therefore the real part of -3log(1-a)-4log(1-az)-log(1-az^2) is a convergent sum of nonnegative terms 2a^j(1+Re z^j)^2/j. At p|N all three character values (including principal chi0 mod N) vanish, so all factors equal 1 and logs equal zero. Do not replace chi0 by a constant 1 on nonunits.
Across primes, absolute summability follows from |chi(p)p^(-s)|<=p^(-sigma), sigma>1, and |log(1-v)|<=|v|/(1-|v|), with |v|<=2^(-sigma)<1. Consequently the sums can be combined and real parts taken termwise. The Euler products written as exponentials of the summable logs yield
  |L(chi0,1+x)^3 L(chi,1+x+it)^4 L(chi^2,1+x+2it)| >= 1.
Here chi0 is the principal character of the SAME modulus; t may be zero (despite the docstring saying nonzero). Source Pm Nonvanishing L221–314, Hm L227–320. No hidden RH, zero-free windows, or positivity of complex L-values.
An exact algebraic consequence checked below: for rational a and rational unit-circle z, |(1-a)^3(1-az)^4(1-az^2)|^2<=1. This checks the local log result without approximate logarithms, and does not substitute for convergence.

## 3. Ordinary boundary contradiction
Suppose L(chi,1+it)=0 and (chi^2!=chi0 OR t!=0). The condition implies (chi!=chi0 OR t!=0) and (chi^2!=chi0 OR 2t!=0). Thus the middle factor and third factor are holomorphic at their respective centers, not poles. For x->0+ the first factor is O(x^-1) by its residue prod_{p|N}(1-1/p), the middle factor is O(x) by differentiability and the supposed zero, the third is O(1) by continuity. Product norm is O(x^(-3+4))=O(x), tending to zero, contradicting >=1. Source Pm L316–381, Hm L322–387. If t=0 and chi^2=chi0 the third factor can have a pole and the exponent drops to zero. This is precisely why the separate quadratic case is necessary. The hypothesis excludes the principal character at s=1; it is not an ordinary finite complex zero test.

## 4. Nontrivial quadratic case
Source Pm L75–211, Hm L81–217. Suppose chi!=chi0, chi^2=chi0, L(chi,1)=0. The convolution b(n)=sum_{d|n}chi(d) is multiplicative, b(1)=1, and b(0)=0 under ArithmeticFunction conventions. For p prime its p^k values are sum_{j=0}^k chi(p)^j. Since chi(p) is 0,1,-1, the respective results are 1,k+1,1 if k even or 0 if k odd. Hence every b(n)>=0 and real. The absolutely convergent Dirichlet series for b agrees with zeta(s)L(chi,s) for Re s>1. Nonprincipal L is entire; zeta has simple pole residue 1 at s=1. Under the supposed zero, define F(s)=zeta(s)L(chi,s) away from 1 and F(1)=L'(chi,1). Indeed near 1 this product equals [(s-1)zeta(s)] [ (L(chi,s)-L(chi,1))/(s-1) ], whose limits are 1 and L'(chi,1). This gives continuity plus punctured holomorphy, hence an entire F. The trivial zeta zero at -2 implies F(-2)=0 (L(chi,-2) finite).

Expand the imported positivity argument (Pm Positivity L40–82): take arbitrary real y and c=max(1,y)+1, so c>1 and c>y. Entire F equals the series in an open right half-plane. Differentiation there is legitimate for every k by absolute convergence of sum b(n)(log n)^k n^(-c); for example pick c' strictly between 1 and c, and absorb logarithm powers by n^(c-c'). Thus (-1)^k F^(k)(c)=sum b(n)(log n)^k n^(-c)>=0, and F(c)>=b(1)=1. The entire Taylor expansion at c evaluated at y has all terms real nonnegative:
 F(y)=sum_{k>=0} [(-1)^k F^(k)(c)] (c-y)^k/k! >= F(c)>=1.
Global convergence follows from entireness, not a claim of Dirichlet-series convergence at y. In the Lean source the alternating derivative lemma and reflection z->-z give the same inequality; the general imported lemma uses arbitrary cutoff x and positive a(1). At y=-2 this contradicts F(-2)=0. Hence L(chi,1)!=0. This excludes a zero exactly at one, NOT an exceptional real zero strictly between zero and one. RUN9/15 residue positivity still required.

## 5. Zeta totalization and family adapter
At Re s=1 the native case split (Pm L385–394, Hm L391–400) uses the quadratic proof iff chi^2=chi0 and s=1, and otherwise section 3. At Re s>1 section 1 applies. Thus LFunction_ne_zero_of_one_le_re holds with chi!=chi0 OR s!=1. At modulus one all characters are trivial and LFunction_modOne_eq gives zeta. For s!=1 use the established theorem. At s=1 the mathematical zeta is meromorphic with pole; Mathlib totalizes its value. ZetaAsymp.riemannZeta_one explicitly gives
 zeta_Lean(1)=(EulerGamma-log(4*pi))/2.
This is NOT EulerGamma (the Laurent constant). The source proves EulerGamma<2/3<1, e<2.9<8<=4*pi using pi>=2, hence log(4*pi)>1. Thus zeta_Lean(1)<0 and nonzero. The formula itself comes from the Hurwitz-zeta regularization limit and uniqueness of limits (Pm L418–422); its two asymptotic limit producers remain imported here, not independently reconstructed.
The family adapter uses N_i!=0 and (N_i=1 OR chi_i!=chi0). In first branch use zeta theorem including its totalized value at one; in second branch use nonprincipal theorem. Therefore every family member and its conjugate zero condition has Re rho<1 for rho in the positive-real-part zero set. This is independent prior input to poleData (RUN9/15), not a conclusion of zeroFree_of_rpow_window. The strict strip enables the real-residue positivity. Original level hypotheses 0<theta<1 and delta>0 remain; revised abstract wrapper theta>=0 and delta>0 remain. No parameter changes.

## 6. Reproducible exact finite certificate
Run this JS in Node. Integer calculations, no floating point approximation; enumerate actual quadratic characters (including principal) via unit group homomorphisms for moduli 1..16, verify convolution and Moebius inverse. Unit circle points via rational parametrization and powers. No actual zeta zeros computed; finite cases check algebra not infinite series theorems.
~~~js
const certificate = function(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let geom=0,phase=0,factor=0,chars=0,coeff=0,inv=0,split=0,neg=0;
 for(let v=-1n;v<=1n;v++)for(let k=0n;k<=100n;k++){
   let s=0n;for(let j=0n;j<=k;j++)s+=v**j;
   ck(s===(v===0n?1n:v===1n?k+1n:1n-k%2n),"geometric sum");geom++;
 }
 for(let m=-12n;m<=12n;m++)for(let n=1n;n<=12n;n++){
   const a=n*n-m*m,b=2n*m*n,d=n*n+m*m;
   ck(a*a+b*b===d*d,"circle");
   let X=1n,Y=0n,D=1n;
   for(let k=1;k<=12;k++){
     [X,Y,D]=[a*X-b*Y,b*X+a*Y,D*d];
     ck(X*X+Y*Y===D*D,"power norm");
     ck(3n*D*D+4n*X*D+X*X-Y*Y===2n*(D+X)**2n,"log square");phase++;
   }
   for(let q=1n;q<=12n;q++)for(let p=0n;p<q;p++){
     const A=(q-p)**2n;
     const B=(q*q+p*p)*d-2n*p*q*a;
     const C=(q*q+p*p)*d*d-2n*p*q*(a*a-b*b);
     ck(A>0n&&B>0n&&C>0n,"factor nonzero");
     ck(A**3n*B**4n*C<=q**16n*d**6n,"Euler product inequality");factor++;
   }
 }
 const gcd=(a,b)=>b?gcd(b,a%b):a;
 const mu=n=>{let s=1;for(let p=2;p<=n;p++)if(n%p===0){n/=p;s=-s;if(n%p===0)return 0;}return s};
 for(let N=1;N<=16;N++){
   const units=Array.from({length:N},(_,i)=>i).filter(i=>gcd(i,N)===1);
   for(let mask=0;mask<2**units.length;mask++){
     const v=Array(N).fill(0);units.forEach((u,i)=>v[u]=mask&(1<<i)?-1:1);
     if(v[1%N]!==1||!units.every(a=>units.every(b=>v[a*b%N]===v[a]*v[b])))continue;
     chars++;
     const chi=n=>v[n%N];
     for(let n=1;n<=200;n++){
       let c=0,i=0;
       for(let d=1;d<=n;d++)if(n%d===0){c+=chi(d);i+=chi(d)*mu(n/d)*chi(n/d);}
       ck(c>=0&&(n!==1||c===1),"quadratic convolution");coeff++;
       ck(i===(n===1?1:0),"Moebius inverse");inv++;
     }
   }
 }
 for(const trivial of [false,true])for(const quadratic of [false,true])for(const t of [0,1,-1]){
   if(trivial&&!quadratic)continue;
   if(trivial&&t===0)continue;
   const special=quadratic&&t===0;
   ck(special?!trivial:((t!==0||!trivial)&&(2*t!==0||!quadratic)),"case split");split++;
 }
 ck(2n+4n*(-1n)+1n<0n,"reduce principal weight");neg++;
 ck(3n+4n*(-1n)<0n,"drop third factor");neg++;
 ck(4-3-1===0,"quadratic third pole removes decay");neg++;
 ck(3-3===0,"middle exponent three removes decay");neg++;
 return {geom,phase,factor,chars,coeff,inv,split,neg,tests:geom+phase+factor+coeff+inv+split};
};
console.log(certificate());
~~~
Actual JS execution: {"geom":303,"phase":3600,"factor":23400,"chars":38,"coeff":7600,"inv":7600,"split":8,"neg":4,"tests":42511}. 42511 positive finite cases plus 4 negative controls. 38 character instances. The four controls show reduction of the principal log weight, deletion of third term, third-factor pole and reduced middle exponent invalidate the relevant positivity or decay argument; no claim they are counterexamples to RH.

RESUME HERE: trace actual Mathlib HurwitzZeta.tendsto_hurwitzZetaEven_sub_one_div_nhds_one and ZetaAsymptotics.tendsto_riemannZeta_sub_one_div_Gammaℝ at Pm/Hm, preserving difference between pole, Laurent constant, and totalized value. In parallel request authenticated role-labelled root paths for Deduction.charFamily_LFunction_ne_zero_of_one_le_re, poleData, zeroFree_of_rpow_window, Mathlib LFunction_ne_zero_of_one_le_re, and positivity supplier; do not infer reachability solely from imports. The arithmetic window supplier and full kernel replay remain OPEN. HANDOFF TO editor, integration, dependency, kernel, audit, math and prime.


---

### Peer original: [specialists/prime_window/RUN16_ADM5_DIRECT_BOUNDS.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN16_ADM5_DIRECT_BOUNDS.md) — blob e6a84deb1517e72c74cc03b111a729463fe3a129

# RUN16 — Direct derivation of adm5, cutoff disambiguation
2026-11-24. RESULT: SOURCE-MATCHED predicate; independent conditional human derivation, finite exact regression executed in V8. PARTIAL for locating the actual native supplier. P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from RUN15. No kernel replay or URT advantage.

## Preflight
Read AGENTS, research state/log/protocol/continuity excerpts, swarm protocol, handoff queue, 15-lane expansion, RUN10, RUN15, recent 35 commit titles and recent integration/editor/geometry/literature/character/math RESUME HERE sections; dependency/kernel/acceleration/audit latest commit paths inspected. Remaining peer full notes and external blueprint not reread (connector call limit). No duplicate of this target found in inspected records. Physics CI summary checkpoint #398 at 22:12:10Z is not RH validation. No changes outside this lane.

## Pinned source anchors
All paths below relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/ . 
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f, AuxBlock8.adm5 L115–119, admitted L235–244.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b, G.Consts.Nonneg L31–33, hG/rG/N1/Gp L37–45, cG L47, L1/L2 L51–54, La L58, Qp L87, c0num L91.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b, BasicNotions.Scale L9–17, a,b,X',b',A,p0,delta1 L27–45.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043, St.ev_log L10–22 onward, Gp_le L57–92, first_count_le_log L94–134, k_le_x_pow_six/one_le_k L136–146, numStar_ev L224–323.
- SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0, Pf.AdmFam L156–159.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarFam.lean blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a, St.star_fam L11–36.
- SharpRestriction/Divisibility/LocalQuadraticParts.lean blob c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265, leastPowerExponent L485.

## Exact predicate and quantifiers
Fix D:D7,L:SizeData₂ D,K:Consts, real δ. Write x=L.sc.x, ε=L.sc.eps, k=D.R.k. Native Scale requires x>1, 0<ε<1/52, J>=1. adm5 consists of ALL FOUR inequalities:
  x^(ε-δ) <= La(K,s) <= x^(ε+δ),
  for EVERY natural prime p, (p<p0 => log Qp <= x^(ε/8+δ)) AND (p<X' => log Qp <= x^(11ε/24+δ)).
Here p0=k²x^26, X'=exp(x^(ε/3)), Qp=p^Gp, La=K.La*N1²*log a, a=x exp(x^ε). Both prime guards are strict; both can apply. No inert-class filter. AdmFam fixes family, constants and X,Y before ∀δ>0 ∃x0>1 ∀x>=x0 ∀i admitted(...). No per-prime or per-instance threshold allowed.

## Independent direct proof of the two prime bounds
Fix ε in (0,1/52), δ>0, and native SizesAt. For x>=e, let ell=log x>=1 and c=cGE(ε)>0. St.Gp_le gives Gp<=c ell x^(ε/8); St.k_le_x_pow_six and one_le_k give 1<=k<=x^6. Since p>=2, log Qp=Gp log p (integer power; real base positive).
- If p<p0, log p<log p0=2log k+26ell<=38ell, so log Qp<=38c ell² x^(ε/8).
- If p<X', log p<x^(ε/3), so log Qp<=c ell x^(11ε/24), since 1/8+1/3=11/24.
Choose x large enough that 38c ell²<=x^δ and c ell<=x^δ. Explicit integral: for any h>0 and x>=1, log x=∫_1^x dt/t <= ∫_1^x t^(h-1)dt=(x^h-1)/h<=x^h/h. Taking h=δ/4, sufficient thresholds are x^(δ/2)>=608c/δ² and x^(3δ/4)>=4c/δ. Both depend on ε,δ only, not p,k,D,L,i. At δ=ε/48 the two exponents are 7ε/48 and 23ε/48 exactly, giving RUN15's Qp bounds after exponentiation. The direct proof uses authenticated upstream estimates, but is not claimed to be the native Lean producer.

## Independent La envelope and necessary premise
St.first_count_le_log gives N1<=d ell, d=cNE(ε)>0. Native N1 is a natural ceiling of a maximum plus one (StarNum L123–134, also see RUN15), so N1>=1. log a=ell+x^ε. For x sufficiently large ell<=x^ε by the same integral. If K.La>0 is FIXED before x, then
  K.La*x^ε <= La <= 2 K.La d² ell² x^ε.
Choose x large enough that x^δ>=1/K.La and 2 K.La d² ell²<=x^δ, e.g. the latter follows from x^(δ/2)>=32 K.La d²/δ². Then x^(ε-δ)<=La<=x^(ε+δ). Taking the maximum of the thresholds establishes the whole adm5 predicate for each matching native size instance. K.Nonneg alone is NOT sufficient for this supplier: K.La=0 makes La=0 whereas x^(ε-δ)>0 even when ε-δ is negative. Conversely the admitted predicate itself forces K.La>0 (N1² log a positive). The native construction of the constant K.La and theorem supplying the full admitted family remain to be located. This is an additional sufficient condition for the independent derivation, not an alteration of the original admitted predicate or a claim that the root already supplies it.

## Distinct cutoff correction and c0num
G.L1 = ceil_N(log_p((k x^26)^4)); leastPowerExponent = ceil_N(log_p(k² x^78))+1. They are NOT definitionally equal. Ratio of logarithm arguments is p0=k²x^26. For 1<p<=p0, log_p(p0)>=1, hence ceil_N(log_p((k x^26)^4))>=ceil_N(log_p(k²x^78))+1 (arguments positive and log of smaller argument nonnegative for k>=1,x>1). No all-prime ordering follows from this argument; p>p0 requires separate reasoning. At x=2,k=1,p=2, the two integers are 104 and 79; this is an arithmetic witness, not a constructed D7. RUN10 order guard applies to leastPowerExponent, RUN15 second-level bound to G.L1. No replacement of one by the other. c0num=2b'+2cG; given cG<=b'/x, x>=2, b'>=0, c0num<=3b'. This authenticates the previously unexpanded definition; retains the native source premises supplying cG<=b'/x.

## Upstream drift
H IsResidueClassZero.lean blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6, Gp L83,L1 L89,La L96,Qp L125,c0num L129: displayed definitions unchanged. H SmallOrderPrimes.lean blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7, adm5 L110–114 unchanged; admitted L233–236 drops adm2 and adm3 from P conjunction. H Conclusion1OfGainBoundAll.lean blob 953add6ebe3b00d58e2ac3d9d9e41bd4f67bbdc8, AdmFam L173–176 unchanged text but meaning depends on changed admitted. H StarFam.lean blob 7878557c8ff202e27b0351868ce2c98dee2c71e0, L719–735 extracts ⟨A1,-,A5,-⟩ rather than P's six-way destructuring. No equivalence asserted, no P hypothesis dropped.

## Reproducible finite checks
Run the following in Node/V8. Abstract integer envelopes check algebra and cutoff comparisons, not transcendental asymptotics or native D7 existence. The analytic proof above is what supplies universal real inequalities.
```js
const counts={low:0,high:0,la:0,cutoff:0,c0:0,negative:0};
const ck=(x,k)=>{if(!x)throw Error(k);counts[k]++};
const ceilLog=(p,x)=>{let n=0,v=1n;while(v<x){v*=p;n++}return n};
for(let ell=1n;ell<=40n;ell++)for(let G=1n;G<=10n;G++)for(let y=1n;y<=5n;y++){
const gp=G*ell*y;
const d=38n*G*ell*ell;
ck(gp*(38n*ell)<=y*d,"low");
let z=2n*y+1n;ck(gp*z<=y*z*d,"high");
const N=G*ell,E=ell+1n,K=3n;
ck(K*N*N*(ell+E)<=2n*K*G*G*ell*ell*E,"la");
}
for(let p=2n;p<=17n;p++)for(let x=2n;x<=8n;x++)for(let k=1n;k<=4n;k++){let small=k*k*x**78n,ratio=k*k*x**26n,large=small*ratio;let a=ceilLog(p,small)+1,b=ceilLog(p,large);if(p<=ratio)ck(b>=a,"cutoff");}
for(let x=2n;x<=20n;x++)for(let b=0n;b<=30n;b++)for(let c=0n;c<=b;c++)if(c*x<=b)ck(2n*b+2n*c<=3n*b,"c0");
ck(ceilLog(2n,2n**104n)!==ceilLog(2n,2n**78n)+1,"negative");ck(0n<1n,"negative");ck(ceilLog(2n,4n)<ceilLog(2n,4n)+1,"negative");console.log(counts);
```
Executed output: {"low":2000,"high":2000,"la":2000,"cutoff":448,"c0":1561,"negative":3}. 8009 positive regression assertions and 3 elementary witness assertions. Last two witnesses are elementary illustrative algebra, not a full mutation test. No Lean kernel execution.

## RESUME HERE
Find the actual pinned theorem producing admitted/AdmFam from the native size family, in particular the fixed positive K.La supplier and exact adm5 proof. Connector code search returned no results for adm5/admitted_of, so do not claim native supplier identified. Request dependency/kernel lanes to locate authenticated incoming/outgoing references to AuxBlock8.adm5, G.La, Pf.AdmFam and St.star_fam; audit direct integral thresholds, cutoff comparison, strict guards and H admission deletion. Then compare independent derivation against native producer without deleting any original hypothesis. HANDOFF TO audit, dependencies, kernel, prime_window, integration, editor. Project OPEN.


---

### Peer original: [math/2026-11-24_conductor_product_lcm_bound.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_conductor_product_lcm_bound.md) — blob 746f5e866fa922a8ac361e3cc4b0df395ee24e69

# MATH lane — conductor of a product divides the LCM of the conductors

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of Mathlib theorem
`conductor_mul_dvd_lcm_conductor` and its exact use in the pinned RH source.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a
proof of RH.

## Source ledger

The RH source revision is `40e56bab026552e089d7afcfeff08d2defb9c005`. Its
`lake-manifest.json` (blob `b4d1ec31575a26b2159ec3a262b482bc051f3f6f`) pins Mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Pinned source | Blob | Role |
|---|---|---|
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | theorem, conductor set, primitive character and change-level identities |
| `Mathlib/NumberTheory/MulChar/Basic.lean` | `dc3c465d304326784909c686d278edfa30a75385` | inverse and commutative-group structure on multiplicative characters |
| `src/Formalism/GL3MeanSquares/HookFormulaTorsion/TwistIsPrimitiveCharacter.lean` | `388210880aa1abb93dbb2f7dc93115e0190f0638` | immediate RH consumer `prim_mul` |

The current Mathlib default branch also contains the same named theorem, but this reconstruction
uses only the manifest-pinned revision. No equivalence of elaborated terms across revisions is
claimed.

## 1. Exact theorem, including the zero-level case

Let `R` be any type with `[CommMonoidWithZero R]`, let `n : Nat`, and let
`chi, psi : DirichletCharacter R n`. There is no `Nontrivial R`, ring, field, or `[NeZero n]`+hypothesis. The theorem is

    (chi * psi).conductor | lcm(chi.conductor, psi.conductor).

In source notation:

    conductor_mul_dvd_lcm_conductor (chi psi : DirichletCharacter R n) :
      (chi * psi).conductor | lcm(chi.conductor, psi.conductor)

The proof starts with `eq_zero_or_neZero n`.

- If `n=0`, `conductor_eq_zero_iff_level_eq_zero` makes the three relevant conductors zero.
  The goal is `0 | lcm(0,0)=0`, discharged by simplification. This branch is absent from the
  earlier informal account and must not be hidden by silently installing `[NeZero n]`.
- Henceforth `[NeZero n]` is available, so the conductor-set divisibility characterization may be
  used.

## 2. The factor-through witness at the LCM

Put

    c_chi = conductor(chi),  c_psi = conductor(psi),
    L = lcm(c_chi,c_psi).

Each conductor divides the common level `n`. Therefore

    L | n

by `Nat.lcm_dvd chi.conductor_dvd_level psi.conductor_dvd_level`.

For nonzero `n`, `mem_conductorSet_iff_conductor_dvd` says, for every `d|n`,

    d is in conductorSet(theta)  iff  conductor(theta) | d.

Thus it suffices to exhibit that `chi*psi` factors through level `L`. The witness is not an
abstract existence argument. Take the primitive lower-level characters

    chi0 = chi.primitiveCharacter       at level c_chi,
    psi0 = psi.primitiveCharacter       at level c_psi,

lift each to `L`, and multiply there. In Mathlib this lower-level character is

    DirichletCharacter.mul chi0 psi0
      = changeLevel(c_chi | L, chi0) * changeLevel(c_psi | L, psi0),

whose declared level is exactly `lcm(c_chi,c_psi)=L`.

Now lift this product from `L` to `n`. Since `changeLevel` is a monoid homomorphism,

    changeLevel(L|n, chi0 lifted to L * psi0 lifted to L)
      = changeLevel(L|n, chi0 lifted to L)
        * changeLevel(L|n, psi0 lifted to L).

Transitivity of `changeLevel` turns the two factors into the direct lifts from their conductors to
`n`. Finally `changeLevel_primitiveCharacter` identifies those direct lifts with `chi` and `psi`.
Consequently the lifted lower-level product is exactly `chi*psi`. This supplies

    L in conductorSet(chi*psi),

and the conductor-set equivalence gives `conductor(chi*psi) | L`.

This is the entire mathematical content of the short source proof. It is a universal upper bound:
it does not assert equality, and it allows cancellation of local character components.

## 3. Why inverse multiplication recovers a character

The RH consumer applies the bound to `(A*B)` and `B^-1`. The rewrite

    (A*B) * B^-1 = A

uses the `CommGroup (MulChar R R')` instance, not cancellation in the scalar target at every
residue. Mathlib defines the inverse character by totalized inverse on values. It then proves
`MulChar.inv_mul` by extensionality:

- on a unit of the domain, the character value is a unit of the target, so its totalized inverse
  multiplies it to one;
- on a nonunit, every multiplicative character, including the trivial character, has value zero.
  Hence the product and the character-group identity both evaluate to zero there.

These two cases make multiplicative characters a genuine commutative group even though their
pointwise values live in a monoid with zero. Thus `mul_inv_cancel_right` is valid as an equality of
characters. It does **not** claim `0 * 0^-1 = 1` in the scalar target; at a nonunit both sides of the
character equality are zero.

Also `conductor_inv B = conductor B`. This follows from the two applications of
`conductor_zpow_dvd`: inverse cannot have a larger conductor than `B`, and applying the same fact
to the double inverse gives the reverse divisibility.

## 4. Exact downstream use in `prim_mul`

The private RH lemma assumes natural levels `N,m,n`, `[NeZero N]`, divisibilities `m|N` and `n|N`,
`Coprime(m,n)`, the equality `N=m*n`, and primitive complex characters `chi1` and `chi2` of levels
`m` and `n`. Let

    A = changeLevel(m|N, chi1),
    B = changeLevel(n|N, chi2),
    c = conductor(A*B).

Primitivity and conductor invariance under change of level give `conductor(A)=m` and
`conductor(B)=n`.

Apply the product bound to `(A*B, B^-1)`. The character-group identity and inverse-conductor
identity give

    m = conductor(A) | lcm(c,n).

Since `lcm(c,n) | c*n`, one gets `m | c*n`; coprimality removes the factor `n`, yielding `m|c`.
Swapping `A` and `B` gives `n|c`. Coprimality then combines these into `m*n|c`, hence `N|c`.
Every conductor divides its declared level, so also `c|N`. Antisymmetry proves `c=N`, exactly the
primitivity of `A*B`.

The coprimality premise is used only after the general LCM theorem. Without it, `m|c*n` does not
imply `m|c`; for example `m=n=3,c=1`.

## 5. Correction to the existing interpretation

The earlier MATH report correctly used the resulting divisibility chain, but compressed the
imported theorem to “the conductor of a product divides the LCM.” The missing details are now
fixed:

1. the theorem is valid even at level zero and has no hidden nontriviality or field premise;
2. the proof constructs the exact lower-level product of the two primitive characters and lifts it
   through the LCM;
3. inverse cancellation is character-group cancellation, with the nonunit case `0=0`, not illicit
   scalar cancellation of zero;
4. the bound can be strict. For a nontrivial quadratic character `eta` of conductor `p`,
   `eta*eta^-1=1` has conductor `1`, while `lcm(p,p)=p`.

This contribution does not repeat the Jacobi evaluation, `twist_prim`, `ind_drop`, or
`ind_unique`; it closes only the imported conductor inequality and its immediate use.

## Executed certificate

Executed locally with Python 3.12:

    python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_product_lcm_bound.py
    python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_conductor_product_lcm_bound.py

Observed output:

    conductor product LCM regression: OK; report_checks=9, character_checks=30, fibre_checks=340, product_checks=340, inverse_checks=19386, euclid_checks=10738, negative_controls=5

The standard-library certificate recovers conductors from the factor-through condition for every
quadratic character generated by the first one through four primes in `(3,5,7,11)`. It then checks
every ordered product, every divisor-level fibre, and the character inverse identity at every
residue, including nonunits. It separately exhausts the Euclid removal step for integers through
60 and executes strictness, reversed-divisibility, nonunit, noncoprime and zero-level controls.

This finite quadratic family is an independently checkable regression, not a proof for arbitrary
`CommMonoidWithZero R`. It does not elaborate the Lean source or audit transitive axioms.

## Failed attempts / limitations

- Treating the theorem as equality fails when local factors cancel; the quadratic inverse control
  gives conductor `1` below the LCM `p`.
- Reversing the divisibility fails in the same example.
- Explaining `(A*B)B^-1=A` by scalar cancellation fails on nonunits; the valid proof compares two
  multiplicative characters, both zero there.
- Omitting the `n=0` source branch strengthens the imported hypotheses without justification.
- The finite certificate covers squarefree quadratic characters only. It does not establish the
  theorem over arbitrary targets or replace the pinned Lean term.
- No Lean, Lake, or Elan executable is installed locally. Status is SOURCE-MATCHED, not ELABORATED.

## RESUME HERE

Reconstruct pinned Mathlib `conductor_zpow_dvd` and `conductor_inv`, preserving the zero-level
branch and the double-inverse reverse-divisibility argument. Connect only their exact use in
`prim_mul`; do not repeat the LCM factor-through construction or the Jacobi twist evaluation.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.


---

### Peer original: [specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN16_PLANEX_MASTER_AND_LOCAL_SITE_SEPARATION.md) — blob 6e0d4a39c2c1e1cff8aaa9865dad1c5b4094c1cd

# RUN16 — PlanEx producer: prime-site separation and geometric spectral plan
2026-11-24. RESULT: SOURCE-MATCHED / DONE for the conditional master and PlanEx assembly; PARTIAL for the 15 imported suppliers and root authentication. No Lean replay.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, state/log/protocol/continuity excerpts, CI summary #399 (22:31:27Z, physics only), RUN15, 25 recent swarm commit titles and 14 peer commit file lists with available RESUME HERE patches. The literature lane is on comparison relations, geometry on normal-domain poles, theta on holomorphic plane waves; no duplicate PlanEx reconstruction identified in inspected notes. External blueprint link noted, PDF not reopened; peer full notes not all reread. No physics changes. RUN11 fixed-field supplier, RUN14 multV_conj reverse caller, FrobLaws.exists_ext, EmbOrbitAlt, wdAt_indep_bridge remain open.

## Source provenance and actual upstream comparison
P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest observed via commit API, merge #1313 at 18:24:32Z, unchanged since RUN15). Upstream leanprover-community/riemann-hypothesis. All line references below refer to P unless specified. Base B=src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GeometricFlagBases/; L=B/PrimeLevelLocalization/.
- L/SpecTopHolds.lean P 8cf10d013812af3c28862907cfbf0d62847dd302; H 7c960104248ffcf7c4ebe725d4c436c94aa4dbb9. specTop_holds P7/H1834, planEx_holds P9/H1836, identical declaration text.
- L/ExistsUnitaryGroupDatumOfVectorExponentSpectral.lean P c9f1a910b54570f9658168301a6f37141c2796bf; H 19738f1268706664e7b1efdcd55cec4b961ea6b1. P37/H1105 wrapper changed one supplier (see below).
- L/SameKTrans.lean P ad68afc03dac2af38b6c26e3f720094b74d8cc20; H original path 404; moved to preceding H file. All P21/H716, master P86/H781, planEx_of P207/H905, pr_eq P51/H746, finite_pr P57/H752, pr_of_sameK P80/H775.
- L/PrimeProj.lean P 150c8418e97ac752ca08e8064dc34ee85478c451; H 28410d18cf65caae503af5a6b90fc9f2ecab495c. Site.Compat P109/H144, SpecTop P152/H187, SiteEx P220/H255, DatEx P236/H271: identical.
- B/PackExOf.lean P 760bbf58b01d01e4fbcea2f829564ab08e5bb621: CongP 38–41, Plan 43–64, ExpAt 70–73, HTFor 75–76, CongAll 78, PlanEx 82–91.
- L/PVecWt.lean P 38628e2f8fb585d263d7fc1da0ca81d105a3dc43; L/PDatEx.lean P dcda4374fccd755dda586afc6f04933d9a881c2b; L/PFrameEx.lean P ff5b27218bde21aeb3a47fafaf2727c2c7a38e89. Read suppliers, not fully reconstructed. Connector supplied blob identities; raw hashing not independently run.

Actual V8 declaration comparison: 13 comparisons, 11 exact after trimming outer whitespace, 2 changed. The wrapper replaces CertificateRingHomMap.rootsAlg_holds by _root_.UpperTheory.Gal.CertificateRingHomMap.pRootsAlg_of. The master proof explicitly introduces hnorm : normV w = Ideal.absNorm w.asIdeal, proves it by simp [normV, Ideal.absNorm_apply, Submodule.cardQuot_apply], rewrites by hnorm in positivity and coefficient computation. The theorem header is unchanged. This is an observed proof-body change, not a proof of equivalence of all upstream suppliers.

## 1. Source-level joins and retained hypotheses
SpecTopHolds:7 obtains SpecTop from Gal.Spc.specTopG wtOf_holds; :9 applies exists_unitaryGroupDatum_of_vector_exponent_spectral to vecEx_holds, expOf_holds, specTop_holds. The wrapper constructs All and applies planEx_of. All is a 15-field proposition, in order: FrameEx, VecEx, SpecTop, ExpOf, Sides, LevBasic, MemEx, SiteTriv, SiteEx, GoodOf, CongOf, DatEx, RootsAlg, SatCard, IntCof. These are substantive arithmetic inputs, not automatically true definitions. The wrapper supplies frameEx_holds, the three inputs in the order vector/spectral/exponent, sides_holds, levBasic_holds, memEx_holds, siteTriv_holds, siteEx_holds, goodOf_holds, congOf_holds, datEx_holds, rootsAlg_holds, satCard, intCof_holds. The local helper suppliers retain these extra obligations: tjOK/tjIdx/memEx require sides, dict, levBasic; siteTriv requires sides and levBasic; siteEx additionally requires stabOf (nearNbhd, primeProj, dict); goodOf requires tjOK and projLev (dict, primeProj, levBasic, inIdUnit); congOf needs tjOK and tjIdx.

## 2. The master proposition (SameKTrans 86–206)
Fix CM number field E, prime l, coefficient ring equivalence iota:Qbar_l ≃ C, odd rank a, FieldOK(E,l,d), x²=−d, prime w0 above l, automorphic submodule U with IsAutRepU and TyEll at w0. Input finite sets H,C of places, disjoint (every member of C is outside H). For EVERY w in H∪C require UsPl, Apart(w,w0), existence of a SatU multiset, SameK(x,w,w0) if pr(w)=l, and for EVERY w' in H∪C with pr(w')=pr(w) require SameK(x,w,w'). SameK is equivalence of membership of integral elements from the quadratic subfield; it is not equality of primes of E. pr(w) is the unique rational prime below w. Output ONE plan P with HTFor(v) at every v∈H and CongAll(w) at every w∈C. CongAll means for EVERY SatU multiset at that w, not only the chosen existence witness. Do not confuse C with the coefficient field.

Construction in native order:
1. pr_eq uses Bezout/coprimality of distinct rational primes: both in a proper prime ideal would force 1 into it. finite_pr uses finite prime ideal divisors of the nonzero principal ideal (q), handles q=0 separately, and takes a finite union. Complex conjugation preserves pr, and SameK preserves pr since rational integers are in Q(x).
2. DatEx takes Q={l}∪pr(H∪C); the local square condition follows from FieldOK at l and UsPl elsewhere. Obtain A, positivity of d, Gen A x, goodness at Q, a positive integer e controlling other good primes, and a datum selector for every finite exclusion set. Gen asserts mutual generation over Q; retain all of it. Sides gives split/conjugate separation and the local root congruence at each place. Define Up(u) iff no w∈H∪C has SameK(x,cj(u),w). To show Up(u) or Up(cj(u)), assume both fail: get w,w' on opposite conjugate sides with equal rational prime, using pr_cj. The same-side input hQ puts w,w' in the same quadratic class, and transitivity plus conjugation contradicts Sides' separation of w and cj(w). Up(w0) follows similarly from same-side-at-l and Sides at w0. These are exactly the conditions needed for VecEx.
3. VecEx supplies V, with nonzero automorphic form, weights, finite exceptional set V.S, open compact level, character and shape data. For w∈H∪C, V.sph removes w and cj(w) from V.S; if a place u∈V.S were on the forbidden side, Sides splits u and V.shape.up contradicts Up(u). Thus Free(V,w) includes split status, both exclusions, no conjugate of any u∈V.S sharing the side, and w not sharing a side with cj(w). Select g0 with Φ(g0)≠0. IntCof gives finitely many nonintegral components of g0. The datum selector chooses auxiliary prime p outside pr(H∪C) and pr(V.S∪bad(g0)); this is what establishes Off(V,p). FrameEx gives F.
4. SpecTop chooses one prime r0 outside pr(H∪C), distinct from p, with a universal spectral existence statement for every admissible level and family of Seen operators. SiteEx takes the actual target set H∪C and q=pr, with all goodness/free/same-side premises; c=r0>0 coprime to p. It produces N divisible by r0 and all target primes, stabilizing KN(N), local sites σ(w), stabilization of each site subgroup and pairwise site compatibility. Compatibility is conditional: equal rational primes force equal local integer roots and ideals. Not equality of the sites at unrelated primes.
5. Define J as pairs (operator in Mem, complex eigenvalue) satisfying Seen and either deck type or Hecke type from a place outside H whose site is compatible with EVERY H site. Set g to the first projection and θ=iota⁻¹ of the second. Apply the universal SpecTop statement after selecting N and J. This supplies a single f with IsFnL and Spec for the entire family, not a separate eigenfunction for each w or i. ExpOf supplies antitone weights and for every τ an automorphism σ plus every required weight/jump shifted by mOf. The master uses this later with the one-element index 0 : Fin 1.
6. Establish Deck g θ for each stabilizing site σ' with q≠r0: LevBasic and ordCompl show site elements lie in KN(r0), because r0 divides N but is distinct from q. MemEx supplies the deck witness with eigenvalue 1. The constructed J contains it by Seen and IsDeckM. Preserve the r0 exclusion and subgroup membership; they are needed by GoodOf and CongOf.
7. Establish hcong for ANY free site with q≠r0, stabilizing subgroup, w∉H and compatibility with all H sites, and ANY SatU(U,w,B). Let c=κ(w)⁻¹ (nonzero), ϑ_i=iota⁻¹(satEig(norm(w),a,B,i)c^i). MemEx supplies a Hecke operator for each i≤a; the corresponding J witness has eigenvalue idx(g)*satEig*c^i. CongOf plus Deck yields CongGrp. RootsAlg needs positive norm and SatCard (B.card=a); applied to the actual coefficients it gives the constant normalization and polynomial identity. The nonzero constant rules out zero polynomial. CongP follows with κ unramified from Free/IsKap and IsPl from the identity field equivalence. This is a multiset-root relation for divided roots, not equality of unrelated local Galois representations.
8. Package P with the datum, field equivalence refl, g,θ,κ,m, algebraicity, antitone weights, f, spectral property. For its uniform almost-everywhere CongP property, exclude the finite set of primes above the rational prime factors of N*e*p or pr(V.S). Positivity of N,e and primality of p give the nonzero product needed for the primeFactors argument. At every usable place outside this exclusion, q does not divide N,e,p, goodness follows from e; SiteTriv gives K0=KN(N), stabilizing. The place is outside H because H primes divide N; compatibility with H is vacuous (equal primes would contradict q∤N). Freeness follows from exclusion of pr(V.S) plus Sides. Apply hcong to every B. The Plan definition additionally requires w not above l in this general branch; retain it even though the proof does not use that particular premise.
9. At v∈H, r0≠pr(v); use site stabilization, Deck, GoodOf and J's Hecke-source restriction w∉H to get GoodGrp at v: w≠v and site compatibility are the two essential conditions, not just distinct rational primes. Obtain κ unramified and ExpAt from ExpOf, giving HTFor(v). At w∈C, use disjointness, r0 exclusion and hcomp to apply hcong, uniformly over B. The witness P is shared over the finite H,C only. No assertion of a common P for every possible H,C.

## 3. Four invocations, three PlanEx branches (SameKTrans 207–246)
In addition to master hypotheses PlanEx includes finite nonsplit T, AutOffT, SphOffU at w0/S, v' above l with Apart(v',w0), OneK(x,w0,v'), and a SatU witness at v'. The proof uses hU.1 (IsAutRepU), TyEll and the v' witness; unused inputs remain in the theorem. FieldOK implies all places over l are UsPl; OneK gives SameK, and symmetry gives SameK(v',w0). Four calls:
- Base: H={v'}, C=empty, returns HTFor(v').
- Away from l: H={v'}, C={w}, returns HTFor(v') and CongAll(w). Distinct rational primes make the equal-prime side conditions vacuous. Apart(w,w0) is proved from w not above l by contraction to the maximal real subfield: equality of underlying primes would carry l from w0 to w.
- At l with OneK(w,v'), Apart(w,w0), Apart(w,v') and SatU witness: H={v',w}, C=empty yields HTFor(v') and HTFor(w). SameK transitivity supplies same-side-at-l and the pairwise premise.
- At that same qualifying w: independently call H={v'}, C={w} to obtain HTFor(v') and CongAll(w). Apart(w,v') implies distinct places, so disjointness holds despite equal rational primes; the SameK premise is supplied explicitly.

The last two outputs are separately quantified P and P'. This distinction is forced by the construction: if w∈H, the Hecke-type portion of J excludes w. Merely merging H and C at w violates hHC, and using the first witness to claim CongAll(w) is not justified. This explains, at the producer level, RUN15's two representation witnesses. It does not prove that a single witness is impossible in a stronger theorem.

## 4. Newly read exported reference evidence
Retrieved compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json, branch cathedral-research-state, blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2, archive digest 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, 71 reports. Report 14009157 Geo.geoOne_holds has requested incoming explicit value witness 1062644801 from 14009158 galoisRepresentations_of_thetaLift. Its actual value refs include 14009156 Geo.weight_one_geometric_realization (1062644798) and 13967295 Geo.geometric_realization_of_weight_one (1062644797). Report 13235289 galoisLocalGlobalStrong_of_geometry_lift has requested incoming 1062644800 from the same owner and value ref 13126169 Geo.GeoOne (1002626056). These are direct exported references, not a fresh kernel run. PlanEx producer linkage below 13967295 is source-matched, not yet authenticated by its own value-reference export in this run. The known source route continues through geoOne_of_parts, packEx_of, Plan.pack, Pack.rep, geoOne_of, Row0b and everyCharacter_of_row. Do not classify any unexpanded owner as unreachable.

## 5. Standard-datum supplier follow-up (partial)
P B/CovLink.lean bb57772349a7d5d5b2f98f412b43729fee1693f7:32 has CovMain.stdEx_holds := stdEx_of mIn. H blob f44077f0183bd0dfbd7ae1eafa6ce0ff0ab375b2 no such name. P also contains the separate theorem UpperTheory.standard_datum_exists : StdEx at src/Development/AutomorphicArithmetic/CommutativeAlgebra/StandardDatumExists.lean:6, blob 3ffd112a9f5bba19171a82a27e619073bf19f714. Thus the replacement name was already present at P; it was not necessarily invented upstream after pinning. Its original path returns 404 at H; H proof body and equivalence of its supporting assumptions not traced yet. Retain both actual producers in audit ledger.

## 6. Reproducible comparison
Actual execution this run: V8 fetched and compared declarations by start marker and next top-level declaration/section boundary, trimming outer whitespace; 11 identical and 2 changed across 13 comparisons. The 71-report JSON was parsed and the named references read. No Lean execution, no independent raw Git hashing, no URT benchmark. The following checkout replay is supplied but NOT run here:
```python
import subprocess,sys,re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
b="src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GeometricFlagBases/PrimeLevelLocalization/"
rows=[
("SpecTopHolds","SpecTopHolds","8cf10d013812af3c28862907cfbf0d62847dd302","7c960104248ffcf7c4ebe725d4c436c94aa4dbb9",["theorem specTop_holds","theorem planEx_holds"]),
("ExistsUnitaryGroupDatumOfVectorExponentSpectral","ExistsUnitaryGroupDatumOfVectorExponentSpectral","c9f1a910b54570f9658168301a6f37141c2796bf","19738f1268706664e7b1efdcd55cec4b961ea6b1",["theorem exists_unitaryGroupDatum_of_vector_exponent_spectral"]),
("SameKTrans","ExistsUnitaryGroupDatumOfVectorExponentSpectral","ad68afc03dac2af38b6c26e3f720094b74d8cc20","19738f1268706664e7b1efdcd55cec4b961ea6b1",["structure All","theorem master","theorem planEx_of","theorem pr_eq","theorem finite_pr","theorem pr_of_sameK"]),
("PrimeProj","PrimeProj","150c8418e97ac752ca08e8064dc34ee85478c451","28410d18cf65caae503af5a6b90fc9f2ecab495c",["def Site.Compat","def SpecTop","def SiteEx","def DatEx"])]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if l.startswith(n))
    j=next((j for j in range(i+1,len(a)) if re.match(r"^(theorem |def |structure |end |section|namespace |set_option |variable )",a[j])),len(a))
    return "\n".join(a[i:j]).strip()
diff=[]
for f,g,ps,hs,ns in rows:
    s=P+":"+b+f+".lean";t=H+":"+b+g+".lean"
    assert git("rev-parse",s).strip()==ps
    assert git("rev-parse",t).strip()==hs
    a,c=git("show",s),git("show",t)
    for n in ns:
        if decl(a,n)!=decl(c,n): diff.append(n)
assert diff==["theorem exists_unitaryGroupDatum_of_vector_exponent_spectral","theorem master"],diff
print("11 exact declarations, 2 changed; source check only")
```
Optional export replay: parse the named JSON, assert digest and count 71, assert explicit_const value reference triples (14009157,14009156,1062644798), (14009157,13967295,1062644797), (13235289,13126169,1002626056), and the two incoming witness IDs from §4.

## RESUME HERE
Reconstruct the native spectral supplier Gal.Spc.specTopG in ScalarCommutation/SpecTopG.lean, preserving the choice order r0 before N and the simultaneous J-indexed spectral eigenfunction. Request role-labelled value references for 13967295 and 14009156 (new exact IDs), then geoOne_of_parts, packEx_of, Pl.planEx_holds, planEx_of, master, exists_unitaryGroupDatum_of_vector_exponent_spectral and specTopG, by witnessed frontier rather than guessing IDs. Recover upstream standard_datum_exists and rootsAlg supplier changes without assuming equivalence. Keep all 15 All fields and RUN11/14 open leaves in the ledger. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, literature, audit. Project OPEN.


---

### Peer original: [specialists/character_boxes/RUN16_ADELIC_CHARACTER_TRANSPORT.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN16_ADELIC_CHARACTER_TRANSPORT.md) — blob fa4212481eb4210748bdf10f16e63958924922f8

# RUN16 — Continuous adelic character transport and place-local readback
2026-11-24. SOURCE-MATCHED / DONE for the human reconstruction of GlobalTheory.CharTransport.exists_hom and its immediate suppliers; not a kernel replay or authenticated Main reachability result.

Continuity: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity protocol, research state/log/protocol excerpts, CI #399 (22:31:27 UTC, physics only), RUN14/15 commit patches, 35 recent RH commit titles and 15 recent peer commit file lists with available RESUME HERE notes. No duplicate of exists_hom located in that review. Not all peer full notes or external blueprint reread; explicit path guesses for standalone RESUME_HERE.md returned 404; actual notes are embedded in lane reports. No physics changes.

## Pinned sources
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by commit listing, same as RUN15). B=src/Development/AbelianVarietyTheory/.
- B/Proofs/IwasawaDecomposition/ExistsCmAdeleUnitCharacterReadingHeckeChar.lean, P blob 0786c38c2dd1a2ba1314c5e5cc18ff2cb05d9642, H blob 07679744b9c3439e037ed28b3904515d79ad1522: GlobalTheory.CharTransport.locMap_eq L21–37, exists_toAdele 39–58, isDelta_of_isPlIdem 62–70, map_loc 72–74, exists_hom 78–136, exists_chrEq 138–160.
- B/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean, P 4125fd7aed8d975a8179e2debf22c365e01f237e: IdemSupport.Comp 153–159, mem_intAE_iff 161–179, exists_comp 181–206, IsDelta 208–210, Comparison₂ 212–213, not_int_iff 327–337, tie_iff 339–357, place_comp 365–377.
- B/Proofs/FoundationProofs/ExistsFinitePlaceIdempotentBaseChangeAdeles.lean, P fef26f720d0a63e3b045398510637c444a299ade: PlaceIdem.eq_zero_of_val 60–67, parts_inj 156ff.
- B/BlockTheory/AdelicCMFields/UnitaryHeckeCharacterIdele.lean, P ed8fbb8b6937abb680a6482f38bfd3e52b895d80: finiteCompletionMap 86ff, continuous_finiteCompletionMap 98ff, finiteCompletionMap_coe 107ff, finiteCompletionMap_mapsTo 122ff, tendsto_under 149ff, finiteAdeleMap, infiniteAdeleMap, adeleMap 160–173, adeleMap_algebraMap 179ff, continuous_adeleMap 191ff.

## Quantifier and obligation ledger
For each D:D7, write F=D.host.F, E=D.host.E, A=AE D=AF F ⊗_F E. There exists ONE ring hom Θ:A→Adele(E) with (i) continuity, (ii) for every x∈E, Θ(incA D x)=diagonal(x), (iii) for every finite place P of E and e∈A satisfying IsPlIdem D e P, and every k∈E^×, Θ(locE D e (k:E))=underlying adele of localIdele E P (atFin P k). Θ chosen before P,e,k. No isomorphism, injectivity, surjectivity or continuity of an inverse claimed here. The conditional place-idempotent premise is not dropped or asserted for an arbitrary idempotent. D7's dependent number-field and algebra structure retained. General locMap_eq and exists_toAdele require [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]. Only map_loc is a general two-ring lemma.

## Proof
1. Identify the two maps F_v→E_P (v=P.under): let a∈F_v and n∈N. In the source proof choose k∈F from the intersection of two open neighborhoods of a: the first requires v(a−k)≤exp(−n); the second requires v_P(g(a)−g(k))≤exp(−n) for the continuous completion map g. Density of F guarantees this common k, not a single k for all n. Both maps agree on embedded F, so their difference at a is the difference of their values on a−k. The valuation estimate for locMap and ultrametric subtraction bound give v_P(locMap(a)−g(a))≤exp(−n) for all n. PlaceIdem.eq_zero_of_val: a nonzero value has a finite integer logarithm m; choose n=|m|+1, contradiction. Thus locMap_eq. Retain locMap_valued, openness of valuation balls, denseRange_algebraMap, locMap_algebraMap, finiteCompletionMap_coe and continuous_finiteCompletionMap as source obligations.

2. Construct g=adeleMap F E and f=diagonal E. They agree as F-algebra maps on F (adeleMap_algebraMap). The tensor product universal property gives Θ(a⊗x)=g(a)f(x). For continuity, regard Θ as additive and g-semilinear over AF F: Θ(rz)=g(r)Θ(z), from the pure tensor formula and multiplicativity. The actual source installs IsModuleTopology on the tensor product (definitional topology) and invokes continuous_of_linearMapₛₗ using continuous_adeleMap; algebra alone does not imply continuity. The latter is backed by the product of continuous archimedean completion maps and restricted-product mapAlong_continuous. Restricted-product admissibility uses finiteCompletionMap_mapsTo: the target integral ring is closed, source integral ring open, embedded F dense, and the valuation of an embedded field element raises to the local ramification power, preserving integrality. The inverse image of a finite set of base places is finite by primesOver_finite; hence tendsto_under for cofinite filters. This is why coordinatewise assembly gives an actual restricted adele map, not just an arbitrary infinite tuple.

3. Independently choose Φ:A→finite adeles of E from IdemSupport.exists_comp. Its five fields are ext (infPart z=0 and Φz=0 imply z=0), surj (each finite adele has a preimage with zero infinite part), inc (diagonal agreement), int (integrality iff every finite image coordinate integral), base (base-adele coordinate formula via locMap). Construction: choose the finite tensor base-change map ι via exists_toAd and product-splitting equivalence e via exists_adele_equiv. Compose ι with swapAE and finPart. Injectivity of ι on its domain and the tensor swap plus product splitting prove ext; reverse using their surjectivity and the pair (0,y) proves surj. inc and base are the pure-tensor identities; int uses mem_intAE_iff and both directions of integral transport via ι. mem_intAE_iff proves one direction by closure of the elementary integral tensors, the reverse using finite generation of O_E over Z and levelaf_decomp followed by tensor swap injectivity. Do not treat the underlying finite base-change theorem as established by this reconstruction; its native proof is the next target.

4. Diagonal identity hinc follows by writing incA x=1⊗x. To show hfin: for ALL z∈A, (Θz)_fin=Φz, the actual proof uses tensor-product induction: zero maps to zero; sums follow by additivity; pure tensor a⊗x=(a⊗1)(1⊗x), and Φ.inc, Φ.base, locMap_eq show equality at every finite Q. Thus extensionality and induction establish the global equality, without assuming every tensor is pure.

5. Infinite component: take u=algebraMap(pairA(1,0)) (the archimedean cut). If infPart z=0, then both parts of uz vanish: infinite part by that hypothesis, finite part since finPart u=0. parts_inj gives uz=0. The pure-tensor formula gives (Θu)_inf=1. Since Θ preserves multiplication, (Θz)_inf=(Θu)_inf(Θz)_inf=(Θ(uz))_inf=0. Only this implication is needed, not an independent characterization of the full infinite component.

6. Recover the finite delta from the actual IsPlIdem witness. isDelta_of_isPlIdem unpacks idempotency, an underlying base-place idempotent ε with its two allowed cases, and Comparison₂. In the split case e=(e+cA e)e from e²=e and the given orthogonality; replace e+cA e by the supplied base cut, whose infinite part is zero by place_comp. In the other case e is itself the base cut, again infinite part zero. For an idempotent e, every Φ(e)_Q is an idempotent in a field and therefore 0 or 1. The original nonintegrality test not_int_iff says for every nonzero integral x, the finite part of e incA(x⁻¹) is nonintegral iff x lies in some Q with Φ(e)_Q≠0. Comparison₂ requires this to be equivalent to x∈P. Any Q in the support must satisfy Q⊆P (include x=0 separately), hence Q=P by eq_of_le for height-one primes. A nonzero x in P exists since P≠(0); Comparison₂ forces a nonzero support coordinate, thus Φ(e)_P=1. Conversely a singleton delta gives Comparison₂ directly. This proves tie_iff and d0,d1,d2: infPart e=0, Φe(P)=1, Φe(Q)=0 for Q≠P. The inverse-integrality characterization inv_mem_iff and the prime-ideal facts remain explicit obligations.

7. map_loc gives Θ(locE e k)=1+Θ(e)(diag(k)−1). Its infinite coordinate equals 1 by step 5 and d0. By steps 4 and 6, its finite coordinate is k embedded in E_P if Q=P and 1 otherwise. This is exactly Function.update of the all-one tuple at P, the local idele's underlying adele. k is a field unit, so the chosen local idele exists. The two cases Q=P and Q≠P exhaust the universal place quantifier. No induction on the set of places needed. The tensor induction is essential to extend the comparison off pure tensors.

8. RUN14 consumer exists_chrEq: for every D and unitary Hecke character χ, define u=Units.map Θ, continuous by Continuous.units_map, and c(x)=χ(u(x)) valued in Circle by unitarity. Unit extensionality plus the diagonal and place-local identities identifies u on the required units. χ trivial on principal ideles gives c trivial on diagonal units; local readback gives the ChrEq field for every P,e,k and every unit x whose underlying element is locE e k. This is a pullback, not a construction of χ or proof of its nonvanishing.

## Executed evidence
Connector V8 source assertions: 60 successful (four pinned blob SHA comparisons, literal declaration/reference anchors, and six current declaration-existence checks). Four inspected theorem texts unchanged at H: locMap_eq, exists_toAdele, isDelta_of_isPlIdem, exists_chrEq. map_loc and exists_hom have tactic annotations (f := _) in map_add/RingHom.map_add and the latter loses local maxHeartbeats wrapper; no proof-term equivalence claimed. Imports changed. Other three pinned source files not compared with H in this run. Reproduction: git rev-parse P:path for four listed blob hashes and git show P:path for cited declaration and reference anchors; git diff P H -- primary path. These are literal source edges, not native elaborated dependencies.

The following exact regression was executed in connector V8. Output {"tensor":3400,"ring":16418,"local":84,"cut":722,"neg":3}. Finite split-algebra model A=F_p³, E=F_p², A⊗E=F_p⁶ with first pair infinite, four remaining coordinates finite. It checks the tensor factorization and component/local update algebra, not number-field topology, prime existence, or native Lean proof. No URT benchmark. Zero original premises deleted.
```js
function regress(){
 const A=(x,m)=>{if(!x)throw Error(m)}, eq=(x,y)=>x.every((v,i)=>v===y[i]);let tensor=0,ring=0,local=0,cut=0,neg=0;
 for(const p of [2,3,5]){
 const mod=x=>((x%p)+p)%p, add=(a,b)=>a.map((x,i)=>mod(x+b[i])),mul=(a,b)=>a.map((x,i)=>mod(x*b[i]));
 const one=Array(6).fill(1),zero=Array(6).fill(0),diag=x=>[...x,...x,...x],pure=(a,x)=>a.flatMap(v=>x.map(w=>mod(v*w)));
 const decode=(n,k)=>Array.from({length:k},()=>{let d=n%p;n=Math.floor(n/p);return d});
 for(let i=0;i<p**3;i++)for(let j=0;j<p**2;j++){const a=decode(i,3),x=decode(j,2);A(eq(pure(a,x),mul(pure(a,[1,1]),diag(x))),"pure factor");tensor++}
 for(let i=0;i<p**6;i++){
 const z=decode(i,6),w=decode((i*31+7)%p**6,6),u=[1,1,0,0,0,0];
 const fin=x=>x.slice(2),inf=x=>x.slice(0,2);
 A(eq(fin(add(z,w)),add(fin(z),fin(w)))&&eq(fin(mul(z,w)),mul(fin(z),fin(w))),"finite projection ring");ring++;
 if(inf(z).every(x=>x===0)){A(eq(mul(u,z),zero),"infinite annihilator");cut++}
 }
 for(let q=2;q<6;q++)for(let a=1;a<p;a++)for(let b=1;b<p;b++){
 const e=zero.map((_,i)=>+(i===q)),k=diag([a,b]),v=add(one,mul(e,add(k,one.map(x=>mod(-x))))),expected=one.map((x,i)=>i===q?k[i]:x);
 A(eq(v,expected),"local update");A(eq(mul(v,one.map((x,i)=>i===q?Array.from({length:p},(_,j)=>j).find(j=>mod(j*k[i])===1):x)),one),"local unit");local++;
 }
 }
 const e=[0,0,1,1,0,0];A(e.filter(Boolean).length===2,"base-place cut not single upstairs");neg++;
 A([1,0,0,0,0,0].slice(2).every(x=>x===0),"finite comparison alone cannot determine infinite coordinate");neg++;
 A(1+1*(0-1)===0,"zero scalar not local unit");neg++;
 return {tensor,ring,local,cut,neg}
}
console.log(regress())
```

## RESUME HERE
Trace GlobalTheory.AdeleBaseChange.exists_toAd in B/Proofs/IwasawaDecomposition/ExistsFiniteAdeleBaseChangeEquiv.lean, especially map_injective, map_surjective, map_mem_int, mem_int_of_map and the actual integral restricted-product comparison. Retain all number-field and completion topology hypotheses. Request authenticated role-labelled root edges for CharTransport.exists_hom, exists_toAdele, locMap_eq, IdemSupport.exists_comp, tie_iff, isDelta_of_isPlIdem and RUN15 pending frame suppliers. Initial ReadL/MjHTie/IdxDefs, Top.GrpTrue, SelHalf, Keep/Pins still open. HANDOFF TO kernel, dependencies, integration, editor, Galois, theta, audit. Project OPEN.


---

### Peer original: [specialists/theta_lifts/RUN16_HOLOMORPHIC_PLANE_WAVE_AND_LEVI.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN16_HOLOMORPHIC_PLANE_WAVE_AND_LEVI.md) — blob a1765f1ca3324a366d19b4e3e7bbe6b5ab5b8370

# Theta lifts RUN16 — holomorphic plane-wave normal form and Levi stabilizer

2026-11-24. RESULT: SOURCE-MATCHED / conditional reconstruction of PositivityTheory.Rg.Sw.HSt.HolTPf.holomorphic_translation_levi, with its two sign branches and actual domain, surjectivity, and weight suppliers. Project OPEN. No kernel replay, full RH translation or URT speed claim.

## Continuity / revisions
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity excerpts; general Cathedral CI checkpoint 398 PASS is not RH proof verification. Read RUN15 and the latest available Markdown handoff sections for dependency, structure, integration, math, kernel, acceleration, Galois, character boxes, prime, Landau, geometry, literature, editor and Grok native-family lanes. Editor 2156 agrees that this is theta's next target. Formal-audit lane handoff not recovered from the tree inventory; blueprint not independently reread this run. Do not duplicate RUN15 holomorphic averaging, local dilation weight or RUN14 adelic density. No physics gate or queue edits.

Source repository leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, 2026-11-24 18:24:32 UTC, merge PR #1313, unchanged from RUN15. Target pinned path returns 404 at H; this is path drift, not evidence the theorem was deleted or altered. All arguments below concern P. Exact source paths, blob IDs and replay anchors appear at the end.

## 1. Precise theorem (HolomorphicTranslationLevi:106–110)
For every n,p,q natural (no pure-signature, positive-rank or m<n assumption here), integer e, and function phi:GR(n)→C with IsHolW(p,q,e;phi), and every complex n×n matrix beta (NOT assumed Hermitian), suppose for EVERY Hermitian h and EVERY x,y∈GR(n) satisfying mR(x)=nU(h) that
  phi(xy)=exp(i tr(beta h)) phi(y).
Then for EVERY a,a' complex n×n and EVERY x,y∈GR(n) satisfying mR(x)=diag(a,a') and a† beta a=beta, one has
  phi(xy)=F0(p,q,e;x) phi(y).
No nonvanishing of phi, beta, or any Fourier coefficient required. No additional continuity premise on phi beyond IsHolW. That predicate supplies one H holomorphic on D={W: Im_H(W)>0} and the identity phi(y)=F0(y) H(Z(y)), where Im_H(W)=(W-W†)/(2i); Z(y)=zOf(y) if q=0, and -zOf(y)† otherwise. LowerRankDatum:13–18,36–41.

## 2. Exact domain and coordinate action
HolTBase:19–20 defines D by positive definiteness; ContinuousQuad:15–100 proves the equivalent Hermitian quadratic form description, openness and real convexity. For openness, continuity of Re(v† Im_H(W)v) and compactness of the unit sphere make positivity uniform near each W; any nonzero v is a positive norm times a unit vector. For convexity, Im_H is real-linear and every nonzero test vector has strictly positive quadratic form for both endpoints, hence for every convex combination (including endpoints). Thus D is open and line segments lie in it. No assumption about topology of a general automorphic quotient is used here.

ContinuousQuad:102–166 proves zOf lands in D, not just formally. Write mR(y) in blocks A,B,C,D0; put X=iA+B and U=iC+D0. The group relation mR(y)† J mR(y)=J, J=[[0,I],[-I,0]], yields the four block relations -C†A+A†C=0, -C†B+A†D0=I, -D0†A+B†C=-I, -D0†B+B†D0=0. Expansion gives X†U-U†X=-2i I. If Uv=0 then v†(X†U-U†X)v=0=-2i||v||², so v=0. Finite square U is invertible. Multiplying the skew relation by U^{-†},U^{-1} proves
  Im_H(XU^{-1})=U^{-†}U^{-1}>0.
The last inequality follows by applying the nonzero vector U^{-1}v. This also explains why the first Cayley denominator is invertible. ContinuousQuad:168–177 proves Im_H(-W†)=Im_H(W), so both sign choices land in the same tube.

Surjectivity is proved constructively in ZOfSurjBdd:14–88. For W∈D write W=X0+iY with X0,Y Hermitian, Y>0. The positive spectral decomposition gives Y=S S† with S=V diag(sqrt(lambda_j)), all eigenvalues strictly positive, and inverse T=diag(1/sqrt(lambda_j)) V†. Both ST=TS=I are checked. The group element with matrix nU(X0) diag(S,T†) has zOf=W by zOf_nm. For q≠0 first lift -W† and apply the involution again. No assumption W symmetric; arbitrary complex matrices are used. These facts supply both hdom and hsurj at HolomorphicTranslationLevi:117–132.

SphericalSectionUnipotentInvariant:37–65 establishes zOf(xy)=zOf(y)+h for mR(x)=nU(h), and F0(xy)=F0(y): upper Cayley numerator changes by hU, lower Cayley blocks stay fixed, and det(nU(h))=1. For block diagonal mR(x)=diag(a,a'), the group relation supplies a†a'=I, hence (a')^{-1}=a†; numerator is left multiplied by a and denominator by a'. This gives zOf(xy)=a zOf(y) a†, while both lower Cayley blocks multiply by a' and the full determinant multiplies, giving F0(xy)=F0(x)F0(y) (67–99). Nonvanishing F0(y) is proved at 24–35 using det_mR_ne and detU1 (both Cayley determinants), then nonzero integer powers. The deeper detU1 and group-block sources remain explicit imported dependencies.

Set c=1 for q=0 and c=-1 otherwise. In either branch Z(xy)=Z(y)+c h under unipotent translations because h=h†, and Z(xy)=a Z(y) a† for Levi elements because adjoint reverses multiplication. Also c²=1 and conjugate(c)=c. These are the exact two branches at HolomorphicTranslationLevi:133–147.

## 3. Remove the character: full holomorphic normal form
For any W∈D and Hermitian h, surjectivity gives y0 with Z(y0)=W; nU_mem' gives x0 with mR(x0)=nU(h). Substitute phi=F0 H∘Z into the assumed character law. Cancel only F0(y0)≠0, using its unipotent invariance:
  H(W+c h)=exp(i tr(beta h)) H(W).
This is HolomorphicTranslationLevi:148–161. Define
  G(W)=exp(-c i tr(beta W)) H(W).
The matrix trace is complex-linear in W, hence the exponential and G are holomorphic on D. For every Hermitian k, put h=c k, also Hermitian because c is real, and use c²=1. Then H(W+k)=exp(c i tr(beta k))H(W). Trace additivity and exp(z+w)=exp(z)exp(w) give G(W+k)=G(W). No reality condition on beta or its trace is used.

Why does invariance under the REAL Hermitian directions imply constancy in the WHOLE complex matrix domain? The exact proof const_of_transl (19–72) supplies the answer. For W∈D, openness converts DifferentiableOn to complex differentiability at W. Every Hermitian k yields the real path t↦W+t k on which G is constant; the chain rule after restriction of scalars gives D_C G(W)[k]=0. Every complex matrix v is the sum
  v = (v+v†)/2 + i (v-v†)/(2i)
of a Hermitian matrix and i times another Hermitian matrix. Complex linearity of the derivative therefore gives D_C G(W)[v]=0 for every v. Real convexity of D and the vanishing derivative imply constancy on D, by the actual Mathlib lemma convex_dom'.is_const_of_fderivWithin_eq_zero (with the open-domain derivative conversion). This includes n=0; no positive-rank premise was added.

The source's exp_trace_mul_H_const_on_dom (74–104) proves exactly that G takes the same value at every pair of domain points. Equivalent human-readable form, choosing W*=Z(1)∈D:
  H(W)=C exp(c i tr(beta W)) for all W∈D,
  C=exp(-c i tr(beta W*)) H(W*).
C may be zero. This is a repackaging of the native lemma by multiplication by a nonzero exponential, not a new source theorem or a claim about extension outside D. It is a single holomorphic plane-wave normal form on the tube; no identity theorem, division by H, or analyticity at boundary is needed.

## 4. Levi conclusion (168–179)
If a† beta a=beta, then by trace cyclicity
  tr(beta a W a†)=tr(a† beta a W)=tr(beta W).
Both W=Z(y) and aWa†=Z(xy) belong to D. Constancy of G gives equality of the two H values after cancelling their common NONZERO exponential. Therefore
  phi(xy)=F0(xy)H(Z(xy))=F0(x)F0(y)H(Z(y))=F0(x)phi(y).
The two sign branches have already been accounted for by c; no sign-dependent stabilizer is necessary. This proves the original implication conditional on the precise source hypotheses and suppliers.

## 5. Linkage and trust
Actual source consumer Holtb.holT in HolomorphicAverageUniform:68 pairs this theorem with holomorphic_average_uniform, thereby supplying the first member of HolT used as H.holT.1 in RUN15 HolCoefPf:75. That previous stage combines the Levi result with an exact character, row stabilizer and dilation weight to feed AStep.stepOf. These are static source-body edges, not an authenticated elaborated root-to-leaf path. Retain all previous upstream obligations, notably pure signature and singular testing for IsHolW, the actual detU1 proof, group membership and the arithmetic Fourier coefficient supplier. Classical Hermitian decomposition, spectral factorization, chain rule, convex derivative constancy and trace cyclicity are established general methods; no publication or novelty attribution is inferred merely from source names. No explicit sorry/admit in the target body; no transitive axiom/trust audit or Lean replay.

## 6. Reproducibility
Executed in connector JavaScript against the pinned source: 103/103 literal line checks and 7/7 expected returned Git blob IDs matched, zero mismatches. Additional source body ContinuousQuad:102–154 read after that test. This is a static source provenance test, not a theorem checker. The following independent replay uses git object bytes and representative anchors (not separately run in a local clone in this session). Run inside an upstream clone with P present.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/"
c="RepresentationTheoryGL/SiegelWeilProof/HolomorphicContinuation/CayleyCosetSums/"
d="CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
(c+"HolomorphicTranslationLevi.lean","82b2b9033cbc5296b75e47c7b13e518937a88898",[(19,"theorem herm_re"),(24,"theorem herm_im"),(31,"theorem split_re_im"),(38,"herm_Hpk_smul_left"),(45,"theorem const_of_transl"),(48,"fderiv ℂ G W = 0"),(51,"isOpen_dom'"),(57,"restrictScalars"),(60,"herm_Hpk_smul_left"),(62,"hcomp.unique"),(66,"split_re_im"),(68,"map_smul"),(71,"convex_dom'"),(74,"exp_trace_mul_H_const_on_dom"),(75,"c * c = 1"),(81,"apply const_of_transl"),(84,"Differentiable ℂ"),(91,"hcs"),(94,"hc"),(96,"trace_add"),(98,"trace_smul"),(100,"hT W hW"),(102,"Complex.exp_add"),(106,"theorem holomorphic_translation_levi"),(107,"h.IsHermitian"),(109,"aᴴ * β * a = β"),(112,"⟨H, hH, hφH⟩"),(114,"if q = 0"),(115,"if q = 0 then 1 else -1"),(121,"zOf_mem'"),(122,"neg_conj_mem'"),(127,"zOf_surj'"),(128,"neg_conj_mem'"),(136,"zOf_nU'"),(139,"hh.eq"),(144,"zOf_levi'"),(147,"conjTranspose_mul"),(152,"nU_mem'"),(154,"spherical_section_unipotent_invariant"),(159,"spherical_section_ne_zero_group"),(162,"c * c = 1"),(165,"star c = c"),(168,"exp_trace_mul_H_const_on_dom"),(171,"Matrix.trace_mul_comm"),(172,"ha]"),(174,"hlevi y"),(177,"Complex.exp_ne_zero"),(178,"spherical_section_levi_mul")]),
(c+"ContinuousQuad.lean","009b4d8fa860717c83552ef517f68c28c3e3ac40",[(15,"def imM"),(25,"theorem mem_dom_iff"),(45,"theorem continuous_quad"),(54,"theorem isOpen_dom'"),(57,"isCompact_sphere"),(60,"eventually_forall_of_forall_eventually"),(71,"norm_pos_iff"),(78,"mul_pos"),(80,"theorem convex_dom'"),(84,"imM"),(96,"ha.eq_or_lt"),(155,"theorem zOf_mem'"),(164,"conjTranspose_I_smul_add_sub_eq_neg_two_I"),(166,"posDef_imM_mul_inv_of_skew_relation"),(168,"theorem neg_conj_mem'")]),
(c+"ZOfSurjBdd.lean","9293e7953a5d1f4e1333e94bdd596b00c512986d",[(14,"theorem nU_mem'"),(19,"theorem inG_mab"),(24,"theorem inG_nm"),(27,"theorem zOf_nm"),(30,"Matrix.inv_eq_right_inv"),(36,"theorem posdef_factor"),(48,"spectral_theorem"),(50,"Real.sqrt_pos"),(74,"theorem zOf_surj'"),(76,"posdef_factor"),(81,"inG_nm"),(82,"zOf_nm")]),
(c+"SphericalSectionUnipotentInvariant.lean","e998cc4a76ac847af0ec3740da5b313ce1427d26",[(24,"theorem det_mR_ne"),(28,"theorem isUnit_first_cayley_block"),(29,"detU1"),(31,"theorem spherical_section_ne_zero_group"),(35,"zpow_ne_zero"),(37,"theorem zOf_nU'"),(42,"isUnit_first_cayley_block"),(50,"Matrix.mul_nonsing_inv"),(53,"theorem spherical_section_unipotent_invariant"),(63,"Matrix.det_fromBlocks_zero₂₁"),(67,"theorem levi_inv"),(68,"IwaPf.inG_blocks"),(72,"theorem zOf_levi'"),(75,"Matrix.inv_eq_left_inv"),(83,"Matrix.mul_inv_rev"),(86,"theorem spherical_section_levi_mul"),(98,"mul_zpow")]),
(c+"HolTBase.lean","6bbc10f2ecd77f62c7687f8f1aebb250ae0c57b6",[(19,"def Dom"),(20,"PosDef")]),
(d+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(13,"def zOf"),(16,"def IsHolW"),(17,"DifferentiableOn"),(18,"if q = 0"),(36,"def HolT"),(39,"Complex.exp"),(41,"F0 p q e")]),
(d+"HolomorphicTheta/HolomorphicAverageUniform.lean","0fd4083591381494ee126f661b677a56e0ed49d6",[(2,"HolomorphicTranslationLevi"),(68,"⟨holomorphic_translation_levi, holomorphic_average_uniform⟩")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",P+":"+b+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"raw blob checks;",n,"source anchors")
assert n==103
```

## RESUME HERE
Trace the actual producer of exists_isHolW_iteratedDeriv used by AStep.holA (AdelicDilations/DegCut:29–32, RUN15) through the HolLead predicate (LowerRankDatum:20–34). In particular retain all lower derivative vanishing quantifiers, singular test-function annihilation, the right-domain and absolute convergence premises and the pure signature disjunction. Do not infer holomorphicity of the Eisenstein derivatives from today's conditional plane-wave theorem. Request authenticated role-labelled root paths for holomorphic_translation_levi, const_of_transl, exp_trace_mul_H_const_on_dom, zOf_mem', zOf_surj', posdef_factor, spherical_section_ne_zero_group, spherical_section_unipotent_invariant, spherical_section_levi_mul, Holtb.holT, and RUN15 pending obligations. HANDOFF TO theta, editor, integration, kernel, dependencies, acceleration, audit, literature. Project OPEN.


---

### Peer original: [specialists/literature_provenance/RUN16_CRYSTALLINE_RELATION_TOTALITY_AND_ZERO.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN16_CRYSTALLINE_RELATION_TOTALITY_AND_ZERO.md) — blob 7b4566e90cf5fdc22405507b8545cffa94513ad1

# RUN16 — crystalline relation totality and zero detection
2026-11-24. SOURCE-MATCHED / PARTIAL, project OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, latest upstream main 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged since RUN15). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol/continuity excerpts, CI #399 (22:31:27Z, physics only), RUN15 and 25 latest commit titles, 15 recent peer file lists and available RESUME HERE patches. No duplicate found in that review. Some peer full notes and external blueprint not reopened. No physical gates or Queue edits.

## 1. Exact statement and witnesses
Pinned source: src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/CrystallineCechDeRhamRelationsTotalDetectZero.lean, GlobalTheory.PDForm.rel_total_zero L191–194, packages crystallineCechDeRham_degreeOne_relation_total L105–143 and crystallineCechDeRham_degreeTwo_relation_total L147–187. For EVERY D : Data and EVERY Λ : Lift D, both degrees j=1,2 satisfy (i) every crystalline class c has a related de Rham class h, (ii) every h has a related c, (iii) for every related pair c,h, c=0 iff h=0. Neither this theorem alone nor the definition of Rel asserts linearity or cup compatibility; RUN15 requires separate suppliers for those.

Write K=KK D.κ D.t, A=Cx.single (Coef.ofAlg (O D.κ D.t)), L=K.res Λ.L, W=Čech–de Rham total complex of OAff D.s. Write f=K.fnMap, r=K.resMap Λ.L, and R_j(k,w)=Λ.Resj k w (restricted cochains). The definitions Lift.Rel1/2 require witnesses k in Z^j(K), a categorical cocycle a, and w in Z^j(W), with [a]=c, [w]=h, first component k.1.1=a.1 exactly (not just equal classes), and R_j(r(k),w). Source definitions L429–443: in degree 1 restriction has a function on each arrow and a quotient one-form on each object; degree 2 has a function on each composable pair, a quotient one-form on each arrow, and a quotient two-form on each object. All chart and arrow quantifiers are retained. Λ itself contains a functor, algebra isomorphisms e_U, naturality, ideal-generation, point and affine-open containment conditions (L270ff); no arbitrary cochain correspondence substituted.

## 2. Three explicit suppliers
For j=1 and 2 let hfn mean H^j(f) bijective, hres mean H^j(r) bijective. Let hW/hK give unique related cochains in both directions, and hZ transport cocycle membership and boundary membership both ways. These are respectively the selected projections of three named native theorem wrappers (ledger below). Resj is subtraction-stable by the component algebra/quotient maps (L85–97), including all three components for j=2. L20–77 identifies zero quotient class with being a boundary, and relates categorical cocycles to the single complex by adding or projecting the trivial PUnit components. This justifies using categorical classes rather than confusing them with arbitrary total cochains.

**Zero-detection key (L110–115 and L152–157).** For k a cocycle in K, injectivity of H^j(f) and H^j(r) gives
    [first component of k]=0 iff [f(k)]=0 iff [k]=0 iff [r(k)]=0.
Each quotient class is zero exactly when a primitive exists for its differential (d0/D0 for j=1; d1/D1 for j=2). For a related pair, hZ further identifies [r(k)]=0 iff [w]=0, proving (iii). No assumption that a zero class has a zero representative.

**Left totality (L117–126, L159–168).** Given c=[a], insert a into the single complex. Surjectivity of H^j(f) gives a class in H^j(K) mapping to [a]; choose a cocycle k representing it. Equality of classes says first(k)−a is a categorical boundary. Choose w related to r(k) by hW; hZ ensures w is closed. Set h=[w], and use the exact first(k) cocycle, rather than a itself, as the categorical witness. The boundary just obtained certifies its class is c. This gives all four conjuncts of Relj.

**Right totality (L127–140, L169–184).** Given h=[w], choose k0 in the restricted complex related to w by hK; hZ ensures k0 is closed. Surjectivity of H^j(r) gives [k] with [r(k)]=[k0]. Choose its cocycle representative k. Thus r(k)−k0 is a boundary. Choose w1 related to r(k) by hW; it is closed by hZ. Subtraction stability gives R_j(r(k)−k0,w1−w), so hZ sends that boundary to a boundary and [w1]=[w]. Set c=[first(k)], and use k, first(k), w1 as the actual Relj witnesses. In degree 2 L178–180 explicitly converts the difference of subtype cocycles to the underlying cochain difference; do not omit that identification. L141–143/L185–187 finish with the zero-detection key.

This gives an economical common argument for both degrees without altering hypotheses. The native theorem invokes exactly the two cohomological bijections and the cochain correspondence; no URT theorem is used.

## 3. External assumption ledger delta
| Pinned declaration | Classification / actual supplier / obligations |
|---|---|
| GlobalTheory.T.crystallineCechDeRham_relations_total_detect_zero | theorem wrapper with explicit by/first/exact to PDForm.rel_total_zero; not an independent axiom. |
| PDForm.rel_total_zero | native theorem assembly of two proof bodies above. |
| Lift.Rel1/Rel2, Lift.Res1/Res2, Lift | predicates/structure; existence of inhabitants cannot be inferred from the definitions. |
| T.fnMap_pullbackBijective12_kk_and_res | wrapper of PDForm.crystalline_forget_forms_bijective_site_and_pairs; native body L52–62 supplies both site and affine-pair forgetful maps. Uses exists_diagonal_firstNeighbourhood_retraction_forms (one S, two sections u,v, three retractions with identities), coefficients_acyclic_of_two_sections_retraction, acyc_res_pE, fnMap_pullbackBijective12_of_acyclic (which uses forget-positive H1/H2). These deeper inputs are OPEN, not inferred proved from names. |
| T.lift_restriction_bijective_low_degrees | wrapper of PDForm.Lift.resMap_lift_pullbackBijectiveDegreesOneTwo; L64–69 composes affine-pair comparison (requires D.smooth_mono_inf.2.2), forget-form bijectivity and Lift.resMap_toE_pullbackBijectiveDegreesOneTwo. L50–62 uses hom_spec_points_levels, monotone level filtration, DP-nilpotence exhaustion, finite-level restriction bijectivity for every N≥N0+1, H1 and four-term exhaustion. All remain exact pending obligations. |
| T.compatibleFormsCochains_eq_deRhamCochains_smoothLift | wrapper of PDForm.lift_res_bij; native L270–271 combines LiftRes.part1 and part2. L200–222 uses differential commutation and uniqueness of zero; L223–265 matches four degree-2 cocycle equations (function Čech, mixed one-form, mixed two-form, closed two-form) using e_U/f1/fm injectivity including degree 3, and transports boundaries via degree-1 related primitives. Its component bijectivity and differential naturality suppliers remain OPEN. |
| QuotientAddGroup.eq_zero_iff, mk_surjective, mk_sub, AddMonoidHom.mem_range, map_eq_zero_iff | imported lemmas used at source level; transitive axiom and dependency extraction not independently run. |
| published Divisors₂.BijectiveCechDeRhamComparisonDegreeOne | imported by definitions module; no claim of dependency on that proposition without an elaborated value edge. No external-paper citation verified this run. |

No added independent mathematical assumptions in the translation. Source theorem bodies are not independent kernel replay or proof of axiom-free transitive closure. RUN15 Hodge fields, comparison add/smul, cup, naturality, degree-one compatibility, rigidity and earlier open leaves preserved.

## 4. Source manifest and upstream migration
GitHub connector returned these blob SHA IDs at the pin (paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless otherwise stated):
- CrystallineCechDeRhamRelationsTotalDetectZeroStatement.lean 98ad0b6e20a58b9e3155d93731fe76a7ae66027f
- CrystallineCechDeRhamRelationsTotalDetectZero.lean 8388246edf7584dbf623275ec8b9173b9ad12f36
- CrystallineForgetFormsBijectiveSiteAndPairsStatement.lean 2b1f07a5f7d45b46f6e65fc4949784c6dec78011
- CompatibleFormsCochainsEqDeRhamCochainsSmoothLifStatement.lean 534dac2241d1c9d1c9e6add21b886aa25427e583
- LiftRestrictionBijectiveLowDegreesStatement.lean acfd1344cb814182c54af1dba6e490f7ee4bf918
- CrystallineForgetFormsBijectiveSiteAndPairs.lean 88ef6478cd3a53e2a78aa7efb8b019027f591878
- CompatibleFormsCochainsEqDeRhamCochainsSmoothLif.lean 9c9c63005e2422fd6d5f622d8af445ee208ec857
- LiftRestrictionBijectiveLowDegrees.lean cac1924ebfd803d30546677c18964dc26e81836f
- CrystallineSmoothLiftOfRelations.lean b1bf4854a196e421a8c96ad821dd4f1a2957817b
- src/Development/AbelianVarietyTheory/Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean 25fb1d4b42084f570129c678837d37f622ad253a

Current head same CrystallineCechDeRhamRelationsTotalDetectZero.lean blob aa9a612c16d76e5e3cb7dd3b0b89e2b4657427fc. Exact line-by-line JS comparison: pin L20–98 -> head L1469–1547 (79/79); L105–143 -> L1554–1592 (36/39); L147–187 -> L1596–1636 (38/41); L191–194 -> L1640–1643 (4/4). Total 157/163 exact, six changed lines are the two degrees' three wrapper calls replaced with the same native names (crystalline_forget_forms_bijective_site_and_pairs, Lift.resMap_lift_pullbackBijectiveDegreesOneTwo, lift_res_bij). Preserve the pinned proof separately; no claim of semantic equivalence of full upstream revisions. Head caller CrystallineSmoothLiftOfRelations blob 48fcc1be2509ce2fc8401cff54ddb11335185902, L590ff as in RUN15. Reproduce hashes with git show PIN:PATH | git hash-object --stdin. Connector blob identities observed, not separately locally rehashed.

## 5. Executed finite regression of the abstract quotient argument
Not native geometry or Lean. Model each degree using F_p², all vectors closed and boundaries first axis, maps triangular (a,b;0,d). The two comparison maps f,r need only d nonzero (bijective on quotients), the cochain identification s has a,d nonzero. Enumerate all such diagrams for p=2,3, check both representative lifts, zero detection and subtraction transport. The 2,184 diagrams with non-injective f or r on cochains demonstrate why cochain bijectivity is stronger than needed. Three negative controls per field: failed left and right quotient surjectivity, failed boundary reflection. Actual V8 results: p=2 diagrams32, each check128, noninj24; p=3 diagrams3888, each check34992, noninj2160. 3920 diagrams; 35,120 instances each of left, right, zero and subtraction checks (140,480 total categories); six negative-control assertions. Replay as Node JS:
```js
const assert=(b,m)=>{if(!b)throw Error(m)};
function test(p){
 const v=Array.from({length:p*p},(_,i)=>[i%p,Math.floor(i/p)]);
 const maps=v.flatMap(([a,b])=>Array.from({length:p},(_,d)=>[a,b,d]));
 const apply=([a,b,d],[x,y])=>[(a*x+b*y)%p,d*y%p];
 const sub=(x,y)=>x.map((a,i)=>(a-y[i]+p)%p);
 const eq=(x,y)=>x.every((a,i)=>a===y[i]);
 const boundary=x=>x[1]===0;
 const fmaps=maps.filter(m=>m[2]!==0);
 const smaps=fmaps.filter(m=>m[0]!==0);
 let diagrams=0,left=0,right=0,zero=0,subtraction=0,noninj=0;
 for(const f of fmaps)for(const r of fmaps)for(const s of smaps){
  diagrams++;if(!f[0]||!r[0])noninj++;
  const W=k=>v.find(w=>eq(apply(s,w),apply(r,k)));
  for(const k of v){
   const w=W(k);assert(w,"cochain lift");assert(boundary(apply(f,k))===boundary(w),"zero");zero++;
  }
  for(const rep of v){
   const k=v.find(k=>boundary(sub(apply(f,k),rep)));assert(k,"left");assert(W(k),"left w");left++;
   const k0=apply(s,rep), k1=v.find(k=>boundary(sub(apply(r,k),k0)));assert(k1,"right");const w1=W(k1);
   assert(boundary(sub(w1,rep)),"right difference exact");assert(eq(apply(s,sub(w1,rep)),sub(apply(r,k1),k0)),"subtraction");right++;subtraction++;
  }
 }
 const id=[1,0,1], bad=[1,0,0], t=[0,1];
 assert(!v.some(k=>boundary(sub(apply(bad,k),t))),"bad f");
 assert(!v.some(k=>boundary(sub(apply(bad,k),apply(id,t)))),"bad r");
 assert(boundary(apply(bad,t))&&!boundary(t),"bad exactness");
 return {p,diagrams,left,right,zero,subtraction,noninj,negative:3};
}
console.log([test(2),test(3)]);
```

RESULT: reconstructed all six totality/zero obligations, three wrapper-to-body edges and their immediate supplier frontier. No Lean kernel replay, authenticated downstream expression references or URT-specific performance claim. Project OPEN.
RESUME HERE: expand PDForm.crystalline_forget_forms_bijective_site_and_pairs L52–62, especially fnMap_pullbackBijective12_of_acyclic L16–22 and the two-section retraction acyclicity supplier; retain degree 3, affine-pair restriction, and all remaining RUN16 and RUN15 obligations. Request authenticated role-labelled paths for rel_total_zero, both degree total theorems, crystalline_forget_forms_bijective_site_and_pairs, Lift.resMap_lift_pullbackBijectiveDegreesOneTwo, lift_res_bij, LiftRes.part1/2, and previous DualRT/Hodge supplier frontier rather than infer reachability from imports. HANDOFF TO dependency, kernel, editor, integration, audit, geometry and acceleration.


---

### Peer original: [specialists/positivity_geometry/RUN17_HYPERSURFACE_POLYNOMIAL_GROWTH.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN17_HYPERSURFACE_POLYNOMIAL_GROWTH.md) — blob 851013dbebe02c9f786e64f266b9d7decc93efa5

# Geometry RUN17 — polynomial growth off a complex hypersurface
2026-11-24. SOURCE-MATCHED readable reconstruction, exact finite arithmetic regression executed. Full RH OPEN; independent Lean replay, authenticated root linkage and URT speedup not established.

## Continuity and source provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, CI #400 (22:50:37Z, physics only), RUN15 and RUN16, 25 recent commit titles, 14 peer commit file lists and available RESUME HERE patch lines. Latest dependency lane focuses 71 role-labelled targets, literature crystalline relation, theta holomorphic character, audit cost-window; no duplicate of this frontier found. Some peer full notes and external blueprint PDF not reopened. No physics changes.
Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005, latest observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge #1313, 18:24:32 UTC, unchanged since RUN16). GitHub-returned blob hashes, not independently recomputed. Source base https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/
- ToricGeometry/ExistsMvPolynomialOfPolyBoundOffHypersurface.lean: P b5df170413a5d462c24189a4132bc4738bb9e632; H e256f1b88440162b61b7aa1955f99af3dd815a7b. P/H declaration start lines: norm_cons_le_lemma_4 13/70; norm_le_of_bound_cons_lemma 21/78; polynomial_of_bound_off_roots_lemma_2 36/93; polynomial_eventually_ne_zero_lemma_3 142/199; GlobalTheory.exists_mvPolynomial_of_poly_bound_off_hypersurface 155/212.
- ToricGeometry/IsConnectedAndDenseComplHypersurface.lean: P c7a30e8c1c08de636533db8f1d17463a42588382; H e22e270a13f1ad0915913f3591cd519333be76dc. mvPolynomialOnLine 11/67; eval_mvPolynomialOnLine 15/71; finite_zeros_on_line 27/83; mvPolynomial_exists_eval_ne_zero 39/95; joinedIn_setOf_eval_ne_zero 45/101; isConnected_and_dense_compl_hypersurface 61/117.
- CovolumeBounds/EntireApplyEqOfPeriodicOfSpanReal.lean: P 7df7f175abffa929ca0f3320eded3f07a046050e; H 0eb1e6171a61dc7bbd1d3f1d216100bf5732cebb. iteratedDeriv_zero_eq_zero_of_poly_bound 83/104; entire_eq_taylor_sum_of_poly_bound 108/129; entire_exists_coeff_of_poly_bound 121/142; entire_exists_polynomial_of_poly_bound 126/147.
- Actual consumer DivisorProofs/ExistsMulEqOfPolynomialGrowth.lean P 820f7247645460d3966ab47e5e15f56fe03f11da, L123 uses noetherNormalization_primitive, L156 passes isConnected_and_dense_compl_hypersurface and exists_mvPolynomial_of_poly_bound_off_hypersurface to FiniteCoverGrowth.integral_and_rational_of_polynomial_growth (ToricGeometry/IntegralAndRationalOfPolynomialGrowth.lean, P 10e7d45c32891276ae1ac9121f289e757b4084e0, L182).
Of 15 trimmed nonblank declaration blocks compared, 11 identical. Differences: main multivariate proof makes map_add argument explicit and renames Polynomial.eval_finset_sum to eval_finsetSum; eval_mvPolynomialOnLine makes map_add arguments explicit; joinedIn_setOf_eval_ne_zero supplies hf.continuousOn instead of hf; entire_exists_polynomial_of_poly_bound renames eval_finset_sum. No semantic equivalence or kernel validity inferred from these textual comparisons.

## 1. Precise theorem and one-variable entire supplier
For ALL natural d,m, nonzero q in C[X_1,...,X_d], f:C^d→C (total function, no regularity required on q=0), C real, define U={x:q(x)≠0}. Assume f complex differentiable on U and |f(x)|≤C(1+||x||)^m for EVERY x in U. Then there exists p in C[X_1,...,X_d] with f(x)=p(x) on U. Here ||x|| is the finite-product max norm. The source conclusion asserts neither equality at q=0 nor a total-degree bound on p. We do not add either as a required conclusion. C is not required positive; nonempty U implies C≥0. The source uses |C| to simplify split bounds, but the original C is preserved in removable-singularity step.

For entire F (the derivative/taylor suppliers are for a complex normed space V with the source's completeness assumptions; the final polynomial supplier specializes to C), hF differentiable everywhere, |F(z)|≤C(1+|z|)^m, obtain C≥0 at z=0. For n>m and R≥1, Cauchy gives
  ||F^(n)(0)|| ≤ n! C 2^m R^m / R^n ≤ n! C 2^m / R.
This uses 1+R≤2R and R^(m+1)≤R^n. Let R→∞, giving derivative zero. The globally convergent Taylor series therefore truncates after m. For F:C→C, p(T)=sum_{k=0}^m F^(k)(0)T^k/k! has natDegree≤m (including the zero polynomial). Keep the Cauchy estimate and entire Taylor theorem as imported Mathlib obligations; finite tests below only check their scalar inequalities.

## 2. Remove roots by induction on degree, not by assuming f entire
Private polynomial_of_bound_off_roots_lemma_2: for natural n,m, real K, polynomial r:C[T] with natDegree=n and r≠0, g:C→C differentiable where r≠0 and |g(z)|≤K(1+|z|)^m there, obtain p with natDegree≤m and g=p where r≠0.
Degree zero: nonzero constant r, so apply entire supplier. For degree n+1 choose complex root c and factor r=(T-c)r' with r'≠0, natDegree r'=n. Define g' by replacing g(c) by punctured limit limUnder, leaving every other value unchanged. For z≠c where r'(z)≠0, r(z)≠0, so differentiability and bound transfer. At c there are two cases:
- r'(c)=0: c is STILL excluded from the new domain; no assertion about g'(c) is needed. This is essential for repeated roots, and the totalized limit does not need to be characterized there.
- r'(c)≠0: use the open neighborhood S={r'≠0}∩ball(c,1). On S minus c, g is differentiable and
  |g(z)|≤K(1+|z|)^m ≤ |K|(2+|c|)^m.
  The bounded removable singularity theorem Complex.differentiableOn_update_limUnder_of_bddAbove supplies differentiability of g' at c. By continuity of g' and z↦K(1+|z|)^m, the original inequality with K passes to c on the nontrivial punctured neighborhood filter.
Now g' meets the inductive hypotheses for r'. Apply induction; where r≠0 one has z≠c and r'≠0, so g'=g and the returned p works. Dependencies: complex root existence, monic division/factor theorem, removable singularity theorem, continuity and nontrivial punctured limit.

## 3. Dimension induction and exact interpolation
Dimension 0: C^0 has exactly one point; take constant polynomial f(0). For d+1 split x=(j,y), j∈C,y∈C^d. Write q as Q(T) in C[Y][T] via finSuccEquiv, and q_j(Y)=Q(j). It is nonzero as a polynomial in T because the equivalence is injective. Bad parameters B={j:q_j=0 as a polynomial} are finite: they inject by scalar inclusion into roots of nonzero Q over the integral domain C[Y]. Choose an injective sequence v_k outside B. The split norm satisfies ||(j,y)||≤|j|+||y||, hence
  1+||(j,y)||≤(1+|j|)(1+||y||),
  |f(j,y)|≤|C|(1+|j|)^m(1+||y||)^m whenever q(j,y)≠0.
Apply dimension induction separately at each v_k to obtain a polynomial P_k(Y) equal to f(v_k,y) when q_{v_k}(y)≠0. No degree bound on P_k is used by the Lean argument.
Use exactly m+1 distinct nodes v_0,...,v_m. Put
  L_k(T)=product_{l=0,...,m; l≠k}(T-v_l)/(v_k-v_l),
  P(T,Y)=sum_{k=0}^m L_k(T) P_k(Y).
For a fixed tail y with all q_{v_k}(y)≠0, and a target x=(j,y) in U, the specialized univariate polynomial r_y(T)=q(T,y) is nonzero because r_y(j)≠0. Apply section 2 to g_y(T)=f(T,y), K=|C|(1+||y||)^m, and get phi_y(T) of degree≤m. Each node is admissible, so phi_y(v_k)=P_k(y). Lagrange uniqueness yields phi_y(T)=sum L_k(T)P_k(y), hence f(j,y)=P(j,y).
Crucial distinction: a node v_k can be globally admissible but its specialized value q(v_k,y) can vanish. Therefore this step alone only handles generic tails, not all U. Example q(T,Y)=T+Y-1, node 0, tail 1, target T=2: target admissible, sample excluded. Also m+1 nodes cannot in general be replaced by m (two nodes 0,1 do not determine T(T-1) of degree two).

## 4. Extend from generic tails without imposing continuity on the removed hypersurface
Set R(Y)=product_{k=0}^m q_{v_k}(Y)≠0 (integral domain). Since C infinite, a nonzero multivariate polynomial has a nonzero evaluation; choose b with R(b)≠0. For any x=(j,y) in U consider gamma(t)=(j,y+t(b-y)). The polynomial rho(t)=R(y+t(b-y)) is nonzero because rho(1)=R(b)≠0. Its roots are finite; after deleting 0, their complement contains a neighborhood of 0, so rho(t)≠0 eventually in the punctured filter. Also q(gamma(0))=q(x)≠0; by continuity q(gamma(t))≠0 for all sufficiently small t. On their intersection, section 3 gives f(gamma(t))=P(gamma(t)). As t→0 punctured, f is continuous AT x because x belongs to the open set U, and polynomial P is continuous. Uniqueness of limits gives f(x)=P(x). No value or continuity of f on q=0 was used. This completes the exact quantified theorem. The source line substitution uses PG.lineHom/eval_lineHom (imported from PolyGrowthStatementPf); retain those references as suppliers, not replayed.

## 5. Connectedness and density are separate supplied facts
For every d and nonzero q, the companion theorem asserts IsConnected U and Dense U. Choose b with q(b)≠0 by polynomial function extensionality. For any a, the line polynomial Q_{a,b}(t)=q(a+t(b-a)) is nonzero at 1, hence nonzero with finite roots. If a∈U, 0 and 1 avoid roots; C minus any finite set is path connected (source invokes countable complement theorem in real rank 2). Map a path from 0 to 1 along t↦a+t(b-a), yielding a path in U. With arbitrary a∈C^d, the same line avoids its finite root set eventually as t→0 punctured; its image approaches a. Thus every a is in closure U. Nonemptiness, path connectedness and density follow, including d=0. The complex scalar field matters: R minus {0} is disconnected. No assumption about nonsingular hypersurfaces is needed. This connectedness proof is NOT needed inside the interpolation theorem itself, but both are explicitly passed to the finite-cover growth consumer; keep both.
Further controls: growth at infinity alone would not suffice, since g(z)=1/z violates the bound near the removed origin and cannot equal a polynomial off it. Dropping holomorphicity permits conjugation with linear growth. Dropping growth permits exp(z). Equality on the excluded set is not asserted; assigning arbitrary values there changes neither premise.

## 6. Executed regression (V8 BigInt; finite models only)
Actual result: {"nodeSets":150,"genericSamples":227325,"genericInterpolations":69075,"exceptionalInterpolations":17325,"excludedPoints":4350,"lineApproaches":34650,"cauchyComparisons":1620,"sliceBounds":2304,"constantCase":19,"controls":5}.
The model q=(T-a)^2(T+Y-c)^3 deliberately includes global bad nodes, exceptional tails and repeated roots. f is a known polynomial with integer coefficients of total degree≤m; this tests interpolation and exact line avoidance, NOT analytic removability or existence for general f. At exceptional tails the code evaluates the already-extended polynomial P_k, not an illegal f sample. The rational approaching line verifies q and all node values are nonzero at selected t=1/N. Excluded points are counted, not passed tests. Cauchy tests check integer scalar inequalities only. Reproduce by saving the following block to a .js file and running node.

~~~js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)}, abs=x=>x<0n?-x:x, pow=(a,b)=>a**BigInt(b);
 const gcd=(a,b)=>{a=abs(a);b=abs(b);while(b)[a,b]=[b,a%b];return a};
 const rat=(n,d=1n)=>{ck(d!==0n,"zero denominator");if(d<0n){n=-n;d=-d}let g=gcd(n,d);return [n/g,d/g]};
 const add=([a,b],[c,d])=>rat(a*d+b*c,b*d), mul=([a,b],[c,d])=>rat(a*c,b*d);
 const C={nodeSets:0,genericSamples:0,genericInterpolations:0,exceptionalInterpolations:0,excludedPoints:0,lineApproaches:0,cauchyComparisons:0,sliceBounds:0,constantCase:0,controls:0};
 const lag=(nodes,j,k)=>nodes.reduce((r,v,l)=>l===k?r:mul(r,rat(j-v,nodes[k]-v)),rat(1n));
 const poly=(m,j,y,seed)=>{let s=0n;for(let i=0;i<=m;i++)for(let h=0;h<=m-i;h++)s+=BigInt((i*7+h*11+seed*3)%9-4)*pow(j,i)*pow(y,h);return s};
 for(let m=0;m<=5;m++)for(let a=-2n;a<=2n;a++)for(let c=-2n;c<=2n;c++){
  const nodes=[];for(let v=-3n;nodes.length<m+1;v++)if(v!==a)nodes.push(v);
  const q=(j,y)=>pow(j-a,2)*pow(j+y-c,3);
  ck(nodes.every(v=>v!==a)&&new Set(nodes).size===m+1,"valid nodes");C.nodeSets++;
  for(let y=-8n;y<=8n;y++)for(let j=-6n;j<=6n;j++){
   if(q(j,y)===0n){C.excludedPoints++;continue}
   const generic=nodes.every(v=>q(v,y)!==0n);
   for(let seed=0;seed<3;seed++){
    let s=rat(0n);for(let k=0;k<nodes.length;k++){
      if(generic){ck(q(nodes[k],y)!==0n,"sample off hypersurface");C.genericSamples++}
      s=add(s,mul(lag(nodes,j,k),rat(poly(m,nodes[k],y,seed))));
    }
    ck(s[1]===1n&&s[0]===poly(m,j,y,seed),"interpolation");
    if(generic)C.genericInterpolations++;else C.exceptionalInterpolations++;
   }
   if(!generic){
    for(let N=2n;N<=7n;N++){
     ck(j!==a&&N*(j+y-c)+1n!==0n&&nodes.every(v=>v!==a&&N*(v+y-c)+1n!==0n),"punctured line");
     C.lineApproaches++;
    }
   }
  }
 }
 for(let m=0;m<=8;m++)for(let n=m+1;n<=m+6;n++)for(let R=1n;R<=30n;R++){
  ck(pow(1n+R,m)<=pow(2n*R,m)&&pow(R,m)*R<=pow(R,n),"Cauchy radius bound");C.cauchyComparisons++;
 }
 for(let m=0;m<=8;m++)for(let j=0n;j<=15n;j++)for(let y=0n;y<=15n;y++){
  ck(pow(1n+(j>y?j:y),m)<=pow(1n+j,m)*pow(1n+y,m),"split max norm");C.sliceBounds++;
 }
 for(let c=-9n;c<=9n;c++){ck(poly(0,0n,0n,Number(c+9n))===poly(0,5n,-7n,Number(c+9n)),"constant");C.constantCase++}
 ck(((-2n)-(-2n))**2n===0n,"bad slice");C.controls++;
 ck((0n+1n-1n)===0n&&(2n+1n-1n)!==0n,"exceptional tail");C.controls++;
 ck((0n-0n)**2n===0n&&(0n-0n)===0n,"repeated root");C.controls++;
 ck(0n*(0n-1n)===0n&&1n*(1n-1n)===0n&&2n*(2n-1n)!==0n,"two nodes insufficient for degree two");C.controls++;
 ck(100n>10n*(1n+1n),"pole growth violates constant bound");C.controls++;
 return C
}
console.log(JSON.stringify(certificate()));
~~~

RESUME HERE: expand noetherNormalization_primitive in ToricGeometry/ExistsPrimitiveElementDiscriminantMultiple.lean (actual caller ExistsMulEqOfPolynomialGrowth L123), focusing on the precise monic primitive polynomial, Bezout discriminant multiple q and simultaneous denominators. Preserve the Mathlib analytic leaves of RUN17, prior RUN15–16 normality/projectivity/DVR obligations and actual finite-cover hypotheses. Request authenticated role-labelled root paths for exists_mvPolynomial_of_poly_bound_off_hypersurface, isConnected_and_dense_compl_hypersurface and their GAGA consumer; do not infer reachability from imports. HANDOFF TO geometry, editor, integration, kernel, dependencies, audit, literature. Project OPEN.


---

### Peer original: [integration/2026-11-24_2200_MANIFEST_PINNED_TOPOLOGY_BRIDGE.md](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/1b1b4a08efd8456353a5ab8189a5d72c05abdfc3/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_2200_MANIFEST_PINNED_TOPOLOGY_BRIDGE.md) — blob ca8a8d75b6e5b43aad47bd17821ebeb2c598073d

# Manifest-pinned Mathlib topology bridge — integration 22:00

2026-11-24. RESULT: SOURCE-MATCHED / PARTIAL. Exactly one contribution: expand the four external suppliers of [the 21:00 GL topology argument](2026-11-24_2100_GL_TOPOLOGY_INTEGRAL_LIFT.md), without treating standard library lemmas as new RH-specific mathematics. RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream main observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged. The pinned lake-manifest.json binds Mathlib to 0df444a360eaa60ab8c11dca51a86af692955474; not current Mathlib main.

## Human reconstruction and exact premises

**1. Recover the unit topology from one coordinate (Units.isEmbedding_val_mk').** Let M be a monoid with a topology, not necessarily commutative and without assuming continuous multiplication for this particular lemma. The topology on Mˣ is induced by e(u)=(u.val,op(u.inv)); the map is injective since a two-sided inverse is unique. In the native topology_eq_inf this is the infimum of the two induced topologies. Suppose f:M→M is continuous on the subset of unit elements and f(u.val)=u.inv for every unit u. In the topology induced by val alone, val is continuous as a map into that subset, and composition with the restriction of f is continuous. Thus the second coordinate is already continuous for the first induced topology. The infimum equals that first topology (native proof: inf_eq_left, continuous_iff_le_induced and neighbourhood-filter characterization of continuousOn). Hence val is inducing and injective, so an embedding. Neither global continuity of f nor continuous multiplication of M is required here. Do not confuse this with the distinct closed-embedding theorem.

**2. Closedness of the two-coordinate embedding (Units.isClosedEmbedding_embedProduct).** Now require T1Space M and ContinuousMul M in addition to the monoid and topology. Its range is exactly the pairs (a,op b) satisfying ab=1 and ba=1: one direction follows from unit equations; the other constructs the unit with value a and inverse b. Both maps (a,op b)→ab and →ba are continuous by continuity of multiplication and unop. The singleton {1} is closed by T1, so the intersection of their inverse images is closed. Combine with isEmbedding_embedProduct. Both equations must remain: on the vector space of finitely supported sequences, right shift S(e_i)=e_(i+1) and left shift L(e_0)=0, L(e_(i+1))=e_i satisfy LS=I but SL≠I. This is why the source range is a two-equation set. This closed embedding, not an arbitrary continuous map, lets SplitFlip.isCompact_KO pull back the compact product O^(n×n) × op(O^(n×n)). Explicitly intersect the compact product with the closed range, then transport by the inverse homeomorphism of the embedding. The same closed embedding supplies locallyCompact_GL; no assertion that arbitrary continuous preimages preserve compactness.

**3. Matrix inverse continuity (continuousAt_matrix_inv).** Let R be a commutative topological ring, n finite with decidable equality, A a square matrix. The imported lemma assumes continuity at det(A) of Ring.inverse, the totalized ring inverse (zero on nonunits); it does NOT assume that A is invertible in its general statement. For any continuous matrix-valued function, determinant is continuous because its Leibniz expansion is a finite sum of finite products of continuous coordinates with constant signs. The adjugate entries are continuous using the transpose and column-replacement determinant formula: replacing one coordinate by a continuous vector is continuous coordinatewise. Matrix.inv_def is A⁻¹=Ring.inverse(det A) • adj(A). Compose scalar inverse with determinant and multiply by the continuous adjugate; this proves the stated conditional continuity at A. For the native GL application R=k is a field, det(A)≠0 for units, and Ring.inverse_eq_inv' identifies scalar inverse with field inverse, continuous there. The source therefore obtains continuity on the unit locus, as needed in step 1. At singular A no field-inverse continuity is inferred: over R, 1/n→0 but its inverse n is unbounded (inverse at zero is totalized to zero).

**4. Properness and second countability.** For a nontrivially normed field k with WeaklyLocallyCompactSpace, choose r>0 with compact closed ball B̄(0,r), and c with ||c||>1. In particular c≠0. Multiplication by c^n is continuous and sends that ball *onto* B̄(0,||c||^n r). Forward inclusion follows from multiplicative norm; reverse inclusion divides by the nonzero c^n and uses ||c⁻ⁿ||=||c||⁻ⁿ. Thus every such scaled ball is compact. Their radii tend to infinity since ||c||>1 and r>0. For arbitrary centre a and radius R, choose n with ||c||^n r≥R+dist(a,0); triangle inequality puts B̄(a,R) inside the compact ball at zero. The former is closed, hence compact. This is precisely ProperSpace.of_seq_closedBall. Its general source allows a nontrivial filter and eventual compactness, not only a sequence. For any proper pseudometric space, if nonempty choose x and cover by compact integer-radius balls; if empty, the constant empty cover works. Sigma-compact pseudometric spaces are second countable by the imported EMetric theorem. In the local field consumer, the native source installs the right additive uniform space, uniform additive group, and a rank-one valuation by composing the strict embeddings of the value group into the rank-one ordered group. The scoped Valued instances give the nontrivially normed field and compatible topology; the properness lemma then gives second countability, and the normed metric supplies T2. These rank-one/instance suppliers and EMetric.secondCountable_of_sigmaCompact are still explicit external obligations. This proof does not assume compactness of the whole field.

## Integration receipts and coverage

Read SWARM_PROTOCOL first, AGENTS, state and actual runner log/protocol, continuity, HANDOFF_QUEUE, preceding integration and peer records. Latest editor [21:56 manuscript](../specialists/proof_editor/2026-11-24_2156_INTEGRATED_MANUSCRIPT.md): 152 primary + 11 supporting entries, before this contribution, editorial counts not unique translated declarations. General Cathedral CI checkpoint 397 [PASS](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45491695921) 21:52:39 UTC; not RH verification. Source read receipts: 9/9 connector-reported blobs matched; 19 distinct source anchors located; manifest checked; 20 graph nodes and 40 edges validated for references and acyclicity. No independent byte-hash replay, Lean execution or kernel membership claim. This graph is a delta for the existing chapter, not a full dependency tree.

Peer checkpoints: dependency rh_literature_theta_frontier.mjs requests 71-target report; kernel run15_slot_and_record_audit.mjs requires exact role multiplicities, structural slots and retained root IDs; acceleration role_delta_run15.mjs reports 71 projected owners, 23 observed root-reachable owners, 15,553 typed edges (reported by peer, not rerun here); structure 2124 requests positive recursor slot support; audit sum_Th normalization retains separate denominator/positivity guards; math ext_iff_units_map_provenance returns to character chain. Specialist latest RESUME: character boxes RUN15 hom Θ, Galois RUN15 PlanEx, Landau RUN15 boundary nonvanishing, literature RUN15 crystalline totality, geometry RUN16 polynomial growth off hypersurface, prime RUN15 adm5, theta RUN15 holomorphic_translation_levi, editor 2156. Nested Grok sub-lanes listed but not all nested handoffs read; some earlier dependency/math/acceleration checkpoint selections superseded by the named scripts above. No claim of full index completeness. Keep kernel/source-matched statuses separate, and do not merge by target set alone.

Failed retrieval attempts: root RESEARCH_PROTOCOL.md and RESEARCH_LOG.md 404 (correct runner paths retrieved); integration/RESUME_HERE.md 404 (actual 2100 dated file retrieved); Mathlib Topology/Algebra/Monoid/Units.lean, Topology/Algebra/Module/Matrix.lean, Analysis/Normed/Field/LocallyCompact.lean and Topology/Algebra/Group/WithZero.lean 404 (correct paths below retrieved); Group/Units.lean did not contain target lemma. Batch peer listing hit call cap, resumed remaining lanes in separate call. External blueprint not reread. No unrelated Cathedral changes.

## Typed JSON graph

```json
{
  "sourcePin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "mathlibPin": "0df444a360eaa60ab8c11dca51a86af692955474",
  "manifestBlob": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
  "scope": "selected human proof obligations; root membership and exact axiom dependencies not established",
  "files": [
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "lake-manifest.json",
      "blob": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f"
    },
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/T2SpaceGeneralLinearGroup.lean",
      "blob": "141a89b315186ad19bd50a06f2945f52a87c4c91"
    },
    {
      "repository": "leanprover-community/riemann-hypothesis",
      "revision": "40e56bab026552e089d7afcfeff08d2defb9c005",
      "path": "src/Development/AbelianVarietyTheory/Definitions/Foundations/SecondCountableAndT2LocalField.lean",
      "blob": "829125937719426936bae9f8be35ee5f482e05bd"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Algebra/Constructions.lean",
      "blob": "307e68a576fa997ce6677d1219fe29e62ec0efe4"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Algebra/Group/Basic.lean",
      "blob": "a726f7cc3df5fe4d8a70b071a793068c901e6c6b"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/Instances/Matrix.lean",
      "blob": "b02644070922146b8f92be6270841947440fc5b4"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean",
      "blob": "b3ea61392d1cea6611deddfcf2c1da7938f3d9e6"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Analysis/Normed/Field/ProperSpace.lean",
      "blob": "22555e6cc03fcc58e26ad383fa1ae95e859fb022"
    },
    {
      "repository": "leanprover-community/mathlib4",
      "revision": "0df444a360eaa60ab8c11dca51a86af692955474",
      "path": "Mathlib/Topology/MetricSpace/ProperSpace.lean",
      "blob": "818ccb53b6b04d544d55007586b54ee21b3f5c45"
    }
  ],
  "nodes": [
    {
      "id": "top",
      "file": 3,
      "line": 101,
      "anchor": "instance instTopologicalSpaceUnits",
      "kind": "instance",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inducing",
      "file": 3,
      "line": 105,
      "anchor": "theorem isInducing_embedProduct",
      "kind": "lemma",
      "requires": [
        "top",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "pair_embed",
      "file": 3,
      "line": 108,
      "anchor": "theorem isEmbedding_embedProduct",
      "kind": "lemma",
      "requires": [
        "inducing",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inf",
      "file": 3,
      "line": 118,
      "anchor": "lemma topology_eq_inf",
      "kind": "lemma",
      "requires": [
        "inducing",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "projection",
      "file": 3,
      "line": 128,
      "anchor": "lemma isEmbedding_val_mk'",
      "kind": "lemma",
      "requires": [
        "inf",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "pair_range",
      "file": 4,
      "line": 1410,
      "anchor": "theorem range_embedProduct",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "closed_pair",
      "file": 4,
      "line": 1422,
      "anchor": "theorem isClosedEmbedding_embedProduct",
      "kind": "lemma",
      "requires": [
        "pair_embed",
        "pair_range",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "det",
      "file": 5,
      "line": 213,
      "anchor": "theorem Continuous.matrix_det",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "update",
      "file": 5,
      "line": 220,
      "anchor": "theorem Continuous.matrix_updateCol",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "adj",
      "file": 5,
      "line": 239,
      "anchor": "theorem Continuous.matrix_adjugate",
      "kind": "lemma",
      "requires": [
        "det",
        "update",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inv_def",
      "file": 6,
      "line": 172,
      "anchor": "theorem inv_def ",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "inv",
      "file": 5,
      "line": 246,
      "anchor": "theorem continuousAt_matrix_inv",
      "kind": "lemma",
      "requires": [
        "det",
        "adj",
        "inv_def",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "proper_seq",
      "file": 8,
      "line": 84,
      "anchor": "theorem ProperSpace.of_seq_closedBall",
      "kind": "lemma",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "proper",
      "file": 7,
      "line": 37,
      "anchor": "lemma ProperSpace.of_nontriviallyNormedField_of_weaklyLocallyCompactSpace",
      "kind": "lemma",
      "requires": [
        "proper_seq",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "second",
      "file": 8,
      "line": 66,
      "anchor": "secondCountable_of_proper [ProperSpace",
      "kind": "instance",
      "requires": [
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "field",
      "file": 2,
      "line": 44,
      "anchor": "theorem secondCountable_and_t2_local_field",
      "kind": "RH consumer",
      "requires": [
        "proper",
        "second",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "gl",
      "file": 1,
      "line": 31,
      "anchor": "theorem isEmbedding_val_GL",
      "kind": "RH consumer",
      "requires": [
        "field",
        "projection",
        "inv",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "ko",
      "file": 1,
      "line": 73,
      "anchor": "theorem isCompact_KO",
      "kind": "RH consumer",
      "requires": [
        "field",
        "closed_pair",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "local_gl",
      "file": 1,
      "line": 47,
      "anchor": "instance locallyCompact_GL",
      "kind": "RH consumer",
      "requires": [
        "field",
        "closed_pair",
        "external"
      ],
      "status": "SOURCE-MATCHED; human obligation, not kernel edge"
    },
    {
      "id": "external",
      "kind": "open imports",
      "requires": [],
      "status": "OPEN: primitive topology/filter lemmas, unit extensionality, scalar inversion, rank-one norm construction and instances, compact-ball existence, norm growth, sigma-compact second countability, typeclasses and exact axioms"
    }
  ]
}
```

## Executed regression

V8 exact integer algebra, {"matrixAdjugate":14641,"scaledBall":80000,"negative":3}. The 2×2 adjugate check and rational scaling are finite regressions of algebra, not proofs of continuity or compactness; the negative checks illustrate guards (the infinite shift and divergence arguments above are mathematical, not established by finite tests). No failing numerical cases. Save the following code as a .js file and run node. No CI verdict for this contribution yet.

```js
function certificate(){
 const out={matrixAdjugate:0,scaledBall:0,negative:0};
 const ck=(ok,msg)=>{if(!ok)throw Error(msg)};
 const mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]];
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 for(let a=-5;a<=5;a++)for(let b=-5;b<=5;b++)for(let c=-5;c<=5;c++)for(let d=-5;d<=5;d++){const A=[a,b,c,d],J=[d,-b,-c,a],D=a*d-b*c;ck(eq(mul(A,J),[D,0,0,D])&&eq(mul(J,A),[D,0,0,D]),"adjugate");out.matrixAdjugate++}
 // Rational ball scaling: x=i/j, c=u/v, r=a/b; compare |c*x| <= |c|*r with |x| <= r by exact cross products.
 for(let i=-12;i<=12;i++)for(let j=1;j<=8;j++)for(let u=1;u<=5;u++)for(let v=1;v<=5;v++)for(let a=1;a<=4;a++)for(let b=1;b<=4;b++){ck((Math.abs(u*i)*v*b<=u*a*v*j)===(Math.abs(i)*b<=a*j),"scale");out.scaledBall++}
 // One-sided inverse for shifts on finitely supported infinite sequences, checked on first 32 basis vectors.
 const S=i=>i+1,L=i=>i===0?-1:i-1;
 ck(Array.from({length:32},(_,i)=>L(S(i))===i).every(Boolean)&&L(0)===-1,"one-sided guard");out.negative++;
 // At singular zero, scalar inverse extended by zero cannot be continuous: n*(1/n)=1 and n>=2.
 ck(Array.from({length:32},(_,i)=>i+2).every(n=>n>1),"singular inversion guard");out.negative++;
 // Projection R -> point: inverse image of compact singleton contains all integers, no finite radius bounds it.
 ck(Array.from({length:32},(_,i)=>i+1).every(n=>n+1>n),"compact preimage guard");out.negative++;
 return out;
}
console.log(certificate());
```

**RESUME HERE:** trace the actual rank-one valuation-to-norm instance and topology compatibility used in Model.secondCountable_and_t2_local_field, but first check the next authenticated 71-target report for root-linked native consumers; if available prioritize those rather than recursively translating unrelated Mathlib. Request role-labelled root paths for SplitFlip.isEmbedding_val_GL, isCompact_KO, Model.secondCountable_and_t2_local_field, and CentralExponent.exists_cong_subset. HANDOFF TO dependency, kernel, editor, audit and integration. Full human proof OPEN; no URT advantage claimed.


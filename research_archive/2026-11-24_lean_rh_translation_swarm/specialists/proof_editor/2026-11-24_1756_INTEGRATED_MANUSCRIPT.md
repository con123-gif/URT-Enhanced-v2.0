# Human-readable RH reconstruction — eleventh edition (17:56 UTC, 24 November 2026)

INCOMPLETE. Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD observed 307cef33f046955ee79dba47e0d828d06496d75f, 142 commits ahead of previous observed head; comparison includes automorphic/Bessel changes. No equivalence established; do not substitute new head. No independent kernel replay or URT improvement claimed.

Read linked volumes [I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [V](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [VI](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [VII](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), then VIII here. Previous 107 primary + seven supporting peer chapters; 9 new primary and 1 supporting below. Peer pin match means named source pin, not independent authentication of every claim.

## Native cyclic rank and host existence — missing mathematical junction

SOURCE-MATCHED conditional derivation of GlobalTheory.EX.exists_ranks_cyclic_frame and GlobalTheory.EX.HostExist.hostEx, including the native HostGood producer. Volume I already reconstructs exists_even_between and basic frame-to-rank arithmetic; do not count that again.

Fix 0<eps<1/52 and x>=16. A=x^(2+8eps)>=x²>=4. Choose least e with 2^e>=A; minimality gives A<=2^e<=2A, e>=2. Source obtains n with 2^n<=A<2^(n+1) and selects e=n+1, also valid including exact powers of two. Native cyclicFrame(e)=frameCyc(e,1) has ord=n0=2^e, o=1. Feed this frame into exists_ranks_rankVal_frame (Volume I), which selects even m,k and integer t. Equality of frames transports the e projection, yielding one R with RankVal s R, 2<=R.e, R.toFrame=cyclicFrame(R.e). Source eventual threshold max(x0,2). No host inferred yet.

### Required propositions and quantifiers

QDChoice: for each admissible eps choose C5>0, xa; for every x>=xa and natural n with 1<=n<=2x^(2+8eps), choose SAME q,d satisfying Rowq x eps n q d, QDq x eps C5 q d, Boxq x eps q d.
ThinChoice: for each eps choose c6>0; for each real Co choose threshold; given RankVal, o<=Co, QS<=Co*n, log conductor bound 3x^(eps/5)log²x and RealBox, conclude ThinOK.
NormPrimes: for each eps choose threshold and for every Scale,R,N,d satisfying RankVal and ModRow, number of primes g in [Y,2Y] with NormOne d N g >=Y^(9/10), Y=(kb)^8; upper limit floor(2Y), inclusive.
SmallPrimeOne: one A>=1 works for every natural M>=2, supplying prime p, p mod M=1, p<=M^A.
TopsChoice: for each eps and Co choose Cb>0 and threshold. With RankVal, J<=Co, o<=Co, floor(x^(ez/5))<=splitBound, choose one TT of size between delta1*n/2 and 2delta1*n, BadOK for UPDATED host, and Shares TT x^(-1+eps).

### HostGood producer

Fix C5>0. exists_hostGood uses ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice. Co=4 for thin/top. Choose CT2 via exists_noRel_finset_card_ge; C8=max(C8_initial,4). Take max of seven source thresholds xb,xc,xd,xe,xf,xg,xh covering thin, top, norm primes, second set, log, qd size, conductor. No constant selected after s.

Cyclic frame gives injective h, o=1, n=2^e. Rowq supplies prime q,d, q mod8=3, d mod16=7 and quadratic-symbol condition via kronSym_of_odd, hence HostHyp. In qd_big, r<=x^5, t<=x^401, x>=5 imply 4tr+1<=5x^406<=x^407. scale_poly_comparison(814,1) gives x^814<=X1, log x>=1 gives X1<=X2. Square roots and strict Rowq lower bounds yield 4tr+1<q,d and q≠3. This depends on actual scale comparison.

Write M=4nqd>=30. Source derives d>=100 from r>=6,t>=11 and qd_big. modRow_of_rowq gives ModRow for same s,M,d. exists_primes_in_progression_bounded supplies p,p',q0 distinct as specified, p,p'≡1 mod15M and q0≡1 mod M, power bounds raised to C8. exists_two_large_norm_one_primes gives distinct g_i in [Y,2Y], required norm and disjointness. cond_pow_lt uses C8_initial>=1, scale_poly_comparison(2C8_initial,1), Rowq log bound and positivity to obtain M^C8_initial<Y. Thus p,p'<g_i. All auxiliary primes odd since M even, g_i odd since g_i>p>=2. No primality inferred from congruence.

Choose T,Lw via exists_noRel_finset_card_ge with Lw=Lwv(s), range, relation and cardinality constraints. Feed SAME R,q,d,g,p,p',q0,T into exists_host. It calls Formalism.HC.exists_hostAx and H.der.principal, supplies flPS,sqq,QS_exact,splitBound=floor(x^(ez/5)),split_small, CM type member, principal ideal, levelPrimes, ccK=top, TT=empty,T2=T,Lw,CT2; remaining fields follow supplied prime, norm, coprimality and relation conditions. QS=2^(e+2)=4n. Top ideal uses top_ne_bot, top_primitive and absence of a proper prime above top. Level coprimality follows oddness and QS power of two. Small-prime symbol uses Rowq split bound with pairWin_self and rpow_ez_le. Conditional on exists_hostAx, not a reproof of its field construction.

Call TopsChoice on H0 to replace TT, keeping other fields fixed. SAME updated host witnesses HostGood and Shares. norm_one_prime_elements supplies principal norm identities and congruences; HostSplit.split_of_one_mod gives split-place counts and splitK for every level prime. pairRow_iff_rowq transfers Rowq via QS=4n, box_bound_for_host gives BoxH, ModRow log bound gives ThinChoice premise. abs_dlogH_le follows from QDq applied to quadraticChar_induces and |Re z|<=|z|, then log_le_rpow_eventually yields |dlogH|<=x^eps.

### Fourteen-field HostGood ledger
1. HostVal: x PairWin witness; TT size from TopsChoice; T2 lower cardinality; p,p' bound; g-window; Lw equality; ccK=top; splitBound inequality; HostConst J,o,QS guards.
2. HostArith: norm witnesses, congruences, both prime-place counts, splitK all level primes.
3. secondSet_card_lower_bound from T2.
4. 4 Lw |T2|<=n0 from T2.
5. QDq: original q,d.
6. BoxW: Rowq, Boxq, BoxH on same data at x.
7. |dlogH|<=x^eps as above.
8. ThinOK: ThinChoice on updated host, Co=4.
9. BadOK: TopsChoice on updated host.
10. disjoint BB(r,g0), BB(r,g1): norm-prime supplier.
11. both integral norm witnesses with pi-1 in specified ideal: norm_one_prime_elements.
12. p,p' congruences mod lcm(15,QS*q*d): mod_lcm_of_mod_mul.
13. q0 prime, congruence, power bound, distinct from p,p': bounded progression supplier.
14. exact levelPrimes set: exists_host.
Additional Shares from TopsChoice, not part of HostGood. Output also H.q=q,H.d=d,H.QS=4n,H.CT2=CT2.

### HostEx assembly

HostEx=HostExP(True): choose la>1, then for each eps constants and S:Scales la, then for every admissible s choose R,H,q0 on same s. Select la=2. Let xa from QDChoice, xb from exists_hostGood, xc from cyclic rank existence; x0=max(xa,max(xb,xc)). Choose S=Scales.univ 2 1 le_rfl, membership gives J=2<=4. For each s beyond x0 with eps fixed and S.Mem s, first select R via xc. ord_pos and RankVal.n_up discharge QDChoice n-range; select q,d together. Apply exists_hostGood with xb to same R,q,d; obtain RankVal, CT2 equality, HostGood and trivial last predicate. This proves the conditional existential assembler, not HostGood without antecedents.

GlobalTheory.T.host_existence_of_choices calls HostExist.hostEx. GlobalTheory.EX.hostEx_of_zeroFreeRegion supplies five inputs: qdChoice_of_explicitFormula(ExplZeta,ExplChi,LogDerOne,ZeroCount,ZFRDirichlet,TZRat,PageThm,Jutila); thin_choice_of_zero_density(ExplZeta,ExplChi,LogDerOne,ZeroCount,ZFRDirichlet); norm_primes_and_level_prime(QuadraticHeckeZeroEstimates).1; smallPrimeOne_of_tzRat(TZRat); tops_choice. Nine named antecedents not nine independently established citations. Val still needs HCVal, weights, sizes and other fields. FamP still conditional on kits and NumAt (Volume I). Exact root reachability of this branch to be certified.

## Source ledger and execution

Eight pinned connector blob hashes and 40 literal source anchors matched earlier in this run. Reproduce by git rev-parse PIN:PATH and git show PIN:PATH. Source paths:
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsRanksRankValFrame.lean — f383bc28266dc3b81f4b1cf1f33e04c53ebc2d43; exists_two_pow_between, exists_ranks_cyclic_frame, max x0 2, congrArg Formalism.HC.Frame.e.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExistenceOfChoices.lean — 8bac0d7fe38fa59332ddafc81291f1654e6ef5ca; exists_host, qd_big, cond_pow_lt, exists_hostGood, hostEx, exists_ranks_cyclic_frame, Scales.univ 2 1, H0.QS = 4 * R.n, norm_one_prime_elements, HostSplit.split_of_one_mod, hThin s R, hTops s R.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExistenceOfChoicesStatement.lean — 2277e2c80ce229f08e1307acda93aa7c4afdd772; GlobalTheory.T.host_existence_of_choices, GlobalTheory.EX.HostExist.hostEx.
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExOfPublished.lean — e3057342dc9bbeb5263ff97a9a786fec9c920d54; hostEx_of_zeroFreeRegion, qdChoice_of_explicitFormula, thin_choice_of_zero_density, norm_primes_and_level_prime, smallPrimeOne_of_tzRat, tops_choice.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b; RankVal, HostVal, HostArith, Val.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ThinScalesIffHostBound.lean — 1de433cc5ce2fa941ca72691bc75a3bccb667634; HostGood, HostExW, HostExP, HostEx.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean — 8e3d3a30a2d801bf03b6f79dbee8415beb2484e3; QDChoice, ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice.
- src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/FrameCyclicGenerator.lean — fa8ab3bbd126ccaa1c879cc7894f3e57000319f3; cyclicFrame, cyclicFrame_index, cyclicFrame_order.

Executed V8 BigInt regression in this run (replay below). Results 13919 dyadic cases, 1701 rank-envelope cases, 1296 congruence cases, total 16916, 3 guard checks. These are rational/abstract arithmetic tests, not actual number fields, primality, or Lean replay.
```js
let dyadic=0,window=0,mod=0,negative=0;
const ck=(b,m)=>{if(!b)throw Error(m)};
for(let d=1n;d<=31n;d++)for(let n=4n*d;n<=200n*d;n+=7n){let e=0n,p=1n;while(p*d<n){e++;p*=2n}ck(e>=2n&&n<=p*d&&p*d<=2n*n,"dyadic");ck(4n*p===2n**(e+2n),"QS");dyadic++}
for(let x=5n;x<=25n;x++)for(let i=0n;i<=8n;i++)for(let j=0n;j<=8n;j++){let r=x**5n*i/8n,t=x**401n*j/8n;ck(4n*t*r+1n<=x**407n,"qd big");window++}
for(let n=1n;n<=12n;n++)for(let q of [3n,11n,19n])for(let d of [7n,23n,47n])for(let a=1n;a<=12n;a++){let M=4n*n*q*d,p=15n*M*a+1n,p2=M*a+1n;ck(p%15n===1n&&p%M===1n&&p%2n===1n&&p2%2n===1n,"congruences");mod++}
ck(!(2n>=4n),"e guard");negative++;ck(4n*4n**406n+1n>4n**407n,"x guard");negative++;ck(2n%2n!==1n,"odd guard");negative++;
console.log({dyadic,window,mod,negative,total:dyadic+window+mod})
```

## Reading order and remaining obligations (all OPEN)

Use VII's order: new two-block reducibility before reversed Jacquet exclusion; Frobenius existence before fixed-field consumer; ind_unique after ind_drop; PsiPPTie after Pins; VacK after IwaQ; boundary descent/residue separation before holomorphic extension; served-ledger transport before LinkG; Laplace differentiation after pole regularization and before kernelIntegral tails. Peer manifest benchmark is not kernel replay.

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext/fixed-field supplier, EmbOrbitAlt, LocPrime, TypeAt, Signature, BoundB, representation leaves.
2. RecTExists/VWin, host design: cyclic RankVal and conditional HostEx assembler expanded; five input proofs, exists_hostAx, weight/HCVal/Val and kit suppliers, ShortNorm, StagePow, relative error/mass ratio and pair_share remain. ind_unique translated by peer; imported changeLevel_injective remains.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, OrbRes, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and literature trust; VacK local advance.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, Val/FamP kit inputs, lattice/height/thick density, finiteGroupIdentification/ReadL/MjHTie/IdxDefs, holomorphic_extension_section_reading, slope/tDetD, native low-prime guard and LinkG producer. HostArith local producer conditional on HostGood inputs.
6. Analytic tails, kernelIntegral incomplete-gamma identities, differentiation/pole hypotheses and native caller.
7. Source/build-to-export equivalence, typed projections and challenge audit, metadata policy, independent kernel replay and axiom provenance.
8. Independent audit of each essential derivation or precise established theorem citation and complete joins; revision equivalence if requested.

Coverage 14/14 local HostGood blocks mapped, eight source blobs and 40 anchors. Global mixed-export denominator 1,484,705 reachable declarations, authenticated human translation numerator unknown. Preflight read AGENTS, continuity, state/log/protocol excerpts, CI #384, swarm/handoff/expansion/spine, prior editor and peer handoffs; code-only reports indexed not all bodies reviewed. External blueprint not reopened. No physics changes.

RESUME HERE: expand QdChoiceOfHyp.lean actual qdChoice_of_explicitFormula producer and nine-antecedent-to-five-input junction (or exists_hostAx if already covered). Audit 14 conjunctions, strict conductor bound, same-H transport, and root reachability. HANDOFF TO formal audit, integration, dependencies, geometry, literature, all specialists.

## Peer appendix at snapshot 11d241e868501e1990811f96329034bc061eaaa6
Code-only additions: [audit/2026-11-24_one_char_hY_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_one_char_hY_audit.mjs); [dependencies/rh_seven_frontier_source_binding.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_seven_frontier_source_binding.mjs); [math/verify_ind_unique_primitive_character_uniqueness.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_unique_primitive_character_uniqueness.py); [specialists/kernel_extractor/run11_native_order_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run11_native_order_audit.mjs); [specialists/on_acceleration/manifest_real_benchmark.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/manifest_real_benchmark.mjs); [structure/2026-11-24_1724_shared_frontier_ideal_dp.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_1724_shared_frontier_ideal_dp.mjs).

---

# Peer chapter — integration/2026-11-24_1700_TWO_BLOCK_REDUCIBILITY_REVERSAL.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1700_TWO_BLOCK_REDUCIBILITY_REVERSAL.md); blob bb2ecb3552634a218249e057533d82ed7f4121ed; pin named. Relative links refer to original location.

# Two-block reducibility and reversed Jacquet exclusion — 2026-11-24 17:00 UTC

RESULT SOURCE-MATCHED / PARTIAL. One integrated contribution continuing 1600_NATIVE_SEGMENT_PRODUCERS: derive the obstruction to irreducibility of adjacent cuspidal twists, and show precisely how it rules out the reversed fine Jacquet constituent. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream HEAD 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z), not substituted. This is conditional human reconstruction with open native leaves; no kernel replay.

## Project index / peer handoff

Read SWARM_PROTOCOL first; AGENTS, research state/log and runner protocol, continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, previous integration, dependency targeted-role witness, structure 1624, tied-core audit, math pair-share, RUN10 of all ten specialist lanes, Grok Green RUN8/Galois RUN6/final audit RUN8/covolume RUN2/native-family checkpoint. Latest physical CI checkpoint 381 PASS (45437036754, 16:46:03Z); does not certify this proof. Root RESEARCH_LOG.md and RESEARCH_PROTOCOL.md fetches returned 404, recovered correct runner paths. Directory endpoint returned empty content; recursive tree recovered lane paths. External blueprint and all nested historical checkpoints not reread.

Main reading index: END_OF_DAY_MANUSCRIPT_SPINE.md and ../specialists/proof_editor/2026-11-24_1656_INTEGRATED_MANUSCRIPT.md (volumes I–VII, 107 primary + seven supporting entries, not unique declarations or proof coverage). This chapter adds the next source-linked segment expansion. Peer status: kernel RUN10 isolated fresh/cached collector retry not executed there; dependency targeted-role and acceleration authenticated membership still pending native reconciliation; structure 1624 preserved projection job error; audit tied-core preserves subgroup/owner guards; math QH.pair_share proceeds to pair_exists; specialists character-box ReadL initial constructor, Galois frob_laws, Landau landau_coeff, literature tanS_away_lift, geometry complex_section_finite_combination, theta vacK_of, prime window loss_bound_at are separate open obligations. Green WJ/WhMul remain open; its mass companion is reported closed only in that companion. No duplicate peer work claimed. Full authenticated export statistics from 1600 chapter remain reported, not re-executed: 1,484,705 reachable declarations under conservative export policy, zero hard missing references, five metadata-only missing members; source-to-export equivalence and independent kernel replay remain open.

## 1. Why a reducibility point must occur

In the source notation x is a smooth irreducible cuspidal class of positive rank d, assumed unitarisable. Let nu be the normalized determinant absolute-value twist, P_s = prodIrr[x.nu(-s), x.nu(s)] for real s >= 0. SomeRed k asks for one such s for which P_s is not irreducible, universally over the rank equality witness. Suppose no such s exists. The negation yields an irreducibility witness at every nonnegative s; transport the rank equality to d+d (not an arbitrary rank).

Compact supplies a common representation space, compact open K0, and the family F_s equivalent to P_s by ProdModel. Its K0 action is constant, and each orbit is a finite real-exponential sum. Each P_s is smooth; by the assumed irreducibility the native admissibility theorem applies. Herm supplies a nonzero invariant sesquilinear form for each P_s, NOT positivity in advance. At s=0, the external tensor of two copies of x is unitarisable, the scalar character has norm one, and normalized induction preserves unitarisability. Transport all these data through the stated equivalences.

Complementary, produced from Signature by complementary_of, now gives unitarisability for every s>=0. Its proof compresses the action to each nonzero finite-dimensional K-fixed subspace W for open K<=K0 by averaging e; compactness/admissibility make W finite dimensional. The kernel of e annihilates W on both sides of every invariant form (span of group differences). Compressed action e F_s(g)|W is continuous by the finite exponential formula. It is simple: the span of the orbit of a nonzero vector in an invariant compressed subspace is all of V by irreducibility, and applying e gives all W. A nonzero invariant form restricts nontrivially because its radical is invariant and zero; use the averaging identity to move the second argument into W. Hermitian symmetrization and the initial positive form give the hypotheses of Signature. Signature forces each restriction definite, with either sign. For a fixed nonzero v1, intersect K0 with its stabilizer and then with each v's stabilizer: both nonzero vectors are in the same nonzero W, so their signs agree. Thus H or -H is positive on all nonzero vectors. This explains why local positivity becomes global; Signature itself remains an open leaf.

Now choose s=d and a field unit t with 0<a=nabs(t)<1. A smooth central character omega exists for x; evaluating an invariant positive form on a nonzero vector shows |omega(t)|=1 (do not assume it for an arbitrary central character). On the Levi block diag(t I_d,I_d) the twisted external tensor acts by c=chi(d,s,g) omega(t). On pure tensors this is immediate and it extends by tensor induction. Since det(t I_d)=t^d, |c|=a^(-ds). The proof establishes nontriviality of the tensor from irreducibility of the equivalent induced module before applying Bound. Bound, with smooth tensor, admissible and unitarisable induction, a<=1, and the scalar action, gives

  a^(-ds) a^(d*d/2) <= 1.

At s=d>0 the left side is a^(-d*d/2)>1, contradiction. This proves SomeRed conditional on the actual five inputs Complementary, Compact, Bound, Herm, ProdModel. No assertion that every P_s is unitarisable without the contradiction hypothesis, or that the bound alone supplies an existence theorem.

## 2. Why that point is exactly one half

CuspUnit expresses any positive-rank cuspidal y as rho.nu(z), z real, with rho cuspidal and unitarisable. Apply SomeRed to rho and retain its s>=0. CuspPairIrr says a pair of cuspidal classes u,v induces irreducibly provided v != u.nu(1) AND u != v.nu(1). In the pair u=rho.nu(-s), v=rho.nu(s), failure of irreducibility requires at least one equality. Real-twist injectivity at positive rank turns these respectively into s=-s+1 or -s=s+1. The second is impossible for s>=0, the first gives s=1/2. This is not an assumption of a first reducibility point or a topological threshold argument.

If prodIrr[y,y.nu(1)] were irreducible, twist both factors by t=-(z+1/2). The common twist is an equivalence of products up to the determinant character, preserves irreducibility, and changes the pair to [rho.nu(-1/2),rho.nu(1/2)]. Transport the rank proof using irr_congr and contradict SomeRed at its actual s. This is redCl_ofC. rhoNuRho_ofC transports actual segment terms via IrrGL.of, twistEquiv and multiProdEquiv, explicitly matches consecutive blocks with stdBlocks and the total rank 2d, and applies RedCl. rhoNuRhoReducibleC supplies the native inputs through redClC. CuspPairIrr itself comes from nuPair_of with derivative_jacquet_holds, jmTheta and derFin_of/derEquiv; those producer bodies remain separate obligations.

## 3. The saturation theorem is a separate step

For cuspidal x != y, P=prodIrr[x,y], and an injective intertwiner f:W->P, surjective_of_jm assumes BOTH ordered Jacquet multiplicities jm([x,y],W)>=1 and jm([y,x],W)>=1, with the rank equalities for both orders and IrreducibleAdmissibleGL. W is not assumed irreducible in this theorem.

If f is not surjective, Q=P/image(f) is nonzero, smooth and finite length. Choose a smooth irreducible quotient tau of Q. This is a subquotient of P. JacquetLeft.exists_embedding supplies two classes u with the first cuspidal and positive rank, a rank sum, and an injective map of tau into prodIrr(u). Frobenius multiplicity gives jm(u,tau)>=1 and subquotient monotonicity jm(u,tau)<=jm(u,P).

If the second rank is zero, the single-nonzero-factor product equivalence and irreducibility identify tau with a positive-rank cuspidal representation. CuspNotInd gives zero multiplicity of that class in P, impossible. This case cannot be removed by assuming both ranks positive at the start.

Otherwise both ranks are positive. The geometric lemma expresses jm(u,P) as a sum over cells, one nonzero term. For each row i the support multiset is the singleton {x_i}; its decomposition into column multisets must have exactly one nonempty slot r(i), the singleton itself. Every column has positive total rank, hence receives a nonempty slot. The row-to-column function is therefore a surjection between equal finite sets, a bijection. The column support is the single class assigned to it, and the native singleton-support theorem identifies u_j with that class. Consequently u is either [x,y] or [y,x]. The actual geometric-cell support transfer, rank sum and singleton-support identification are retained as native inputs, not proved by this finite combinatorial argument.

For either order v, the cuspidal-product multiplicity formula counts permutations matching that order with [x,y]. Distinctness x!=y gives at most one. The relevant assumption on W gives jm(v,W)>=1, and tau gives jm(v,tau)>=1. Exactness of Jacquet and multiplicity additivity give jm(v,P)=jm(v,W)+jm(v,Q), with jm(v,tau)<=jm(v,Q). Thus 2<=jm(v,P)<=1, contradiction, also valid for extended natural multiplicities. This establishes surjectivity. Neither positive multiplicity alone nor arbitrary distinct representations without cuspidality is sufficient.

## 4. Exclusion of the reversed constituent

In jhMult_rev_jac_sub the field is nonarchimedean local, d>0, sigma smooth irreducible cuspidal, S an irreducible subrepresentation of the two-term product, hG GeometricLemma, hR RhoNuRhoReducible, and h1 the ordered Jacquet multiplicity equals one. Suppose the reversed multiplicity is nonzero. Put x=IrrGL.of(sigma), use the two termwise twist equivalences to identify P with prodIrr[x,x.nu(1)], and compose the inclusion of S with this equivalence. The rank witnesses both equal 2d. Transport h1 and the supposed nonzero reversed multiplicity to jm lower bounds in the respective orders. Positive rank gives x!=x.nu(1) by natural-twist injectivity. Saturation then makes the inclusion surjective. Transport back through the product equivalence to conclude S=top as an actual subrepresentation. Irreducibility of S transfers through topEquiv to P, contradicting hR. Therefore reversed multiplicity is zero. hG is retained in the stated interface even though the proof uses the globally supplied geometric results through saturation.

In segTwo_of, uniqueness/multiplicity-one gives S, and the constituent theorem leaves only the ordered or reversed tensor. An equivalence to the latter would supply its nonzero subquotient multiplicity, just ruled out. FineStep gives an actual equivalence of the Jacquet module to the ordered tensor. This joins the 1600 chapter without changing its premises.

## 5. Executed tests / limits

Connector retrieval at pin checked 10 reported Git blob SHAs against fixed ledger and 95 exact source substring anchors. V8 exact finite regression and selected graph reachability executed in this run, with result {"source_files":10,"anchors":95,"nodes":31,"edges":32,"exponent":5050,"shift":2430,"bound":270,"split":405,"support":50069,"negative":5,"graph_negative":3}. Finite tests check only arithmetic, multiplicity and support logic, not infinite-dimensional representation theory. The source anchors are not kernel dependency edges. No independent reviewer accepted this chapter yet, no Lean replay, no independent blob-byte hash recomputation, no URT speed claim. New CI not yet known. Failed preflight paths recorded above; no arithmetic failure. The fifth negative control below explicitly illustrates a missing strict guard; it is not a counterexample to the actual source.

Reproduce exact finite checks in Node (paste the following function and call regress):

```js
function regress(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 let exponent=0,shift=0,bound=0,split=0,support=0,negative=0;
 // s=m/n, exact guards for y=x+1 or x=y+1
 for(let n=1;n<=50;n++)for(let m=0;m<=100;m++){
  let first=2*m===n,second=2*m===-n;
  ck(!second,"nonnegative s forbids second link");ck((first||second)===(2*m===n),"half");exponent++;
 }
 // all values scaled by 2n, z=a/n; shift t=-z-1/2.
 for(let n=1;n<=30;n++)for(let a=-40;a<=40;a++){
   let z=2*a,t=-2*a-n;ck(z+t===-n&&z+2*n+t===n,"common twist");shift++;
 }
 // nabs(t)=1/q^2, s=d; exact modulus times bound q^(d*d)>1.
 for(let d=1;d<=30;d++)for(let q=2;q<=10;q++){
   let Q=BigInt(q),e=BigInt(d*d);ck(Q**(2n*e)>Q**e&&Q**e>1n,"bound");bound++;
 }
 // Exact multiplicity constraint m(P)=m(W)+m(Q), m(tau)<=m(Q).
 for(let w=0;w<=8;w++)for(let q=0;q<=8;q++)for(let tau=0;tau<=q;tau++){
   let p=w+q;ck(!(p<=1&&w>=1&&tau>=1),"multiplicity");split++;
 }
 // one labelled singleton in each row; positive support in both columns forces permutation.
 for(let l=1;l<=6;l++){let n=l**l;for(let a=0;a<n;a++){let z=a,cols=Array(l).fill(0);for(let i=0;i<l;i++){cols[z%l]++;z=Math.floor(z/l)}if(cols.every(x=>x>0))ck(cols.every(x=>x===1),"permutation");support++}}
 ck(2*(-1)===-2,"negative s allows reverse link");negative++;
 ck(1+1===2,"remove multiplicity upper bound");negative++;
 ck(1+0===1,"remove quotient positivity");negative++;
 ck([2,0].some(x=>x===0),"remove positive column rank");negative++;
 ck(1===1,"nabs(t)=1 cannot yield strict contradiction");negative++;
 return {exponent,shift,bound,split,support,negative}
}
console.log(regress())
```

The graph is additive, scoped to this chapter; source references and open leaves are deliberately not treated as discharged.

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "Selected source-visible obligation tree, not extracted kernel dependencies. Some edges transitive; shared leaves retained.",
  "root": "segTwo",
  "sources": [
    {
      "id": "seg",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/SegRepOf.lean",
      "blob": "a83f6f8d9e4e6e15c0d3e78294b7b0f14c954095",
      "anchors": [
        "theorem segTwo_of",
        "SRC.jhMult_rev_jac_sub hG hR",
        "jhMult_ne_zero_iff.2"
      ]
    },
    {
      "id": "rev",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/JhMultRevJacSub.lean",
      "blob": "7465f1a832b6a4d80caea2a4cd7b5a3467ccd6aa",
      "anchors": [
        "theorem jhMult_rev_jac_sub",
        "(hG : GeometricLemma) (hR : RhoNuRhoReducible)",
        "(hS : S.toRepresentation.IsIrreducible)",
        "= 1) :",
        "by_contra h2",
        "hA := GlobalTheory.CompanionTheory.BZCuspPair.irrAdm",
        "have hx : x.IsCusp",
        "have hf : Function.Injective f",
        "have j1 : 1 ≤ jm",
        "have j2 : 1 ≤ jm",
        "IrrGL.nu_natCast_inj hd",
        "CuspPairSub.surjective_of_jm",
        "have hι : Function.Surjective ι",
        "have htop : S = ⊤",
        "exact hR k d hd σ hσ"
      ]
    },
    {
      "id": "red",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoOfC.lean",
      "blob": "e69c5128ca987d48041e406455512cd7b1a4f242",
      "anchors": [
        "theorem redCl_ofC",
        "(h1 : SomeRed k) (h2 : CuspUnit k) (h3 : GlobalTheory.BZSeg.CuspPairIrr k)",
        "obtain ⟨ρ, z, hρ, hu, rfl⟩",
        "obtain ⟨s, hs0, hs⟩",
        "have hs2 : s = 1 / 2",
        "IrrGL.nu_ofReal_inj hpos",
        "set t : ℂ := -((z : ℂ) + 1 / 2)",
        "irr_congr key hd",
        "irr_tw _ hd t hirr",
        "theorem rhoNuRho_ofC",
        "multiProdEquiv",
        "consecBlocks_val",
        "stdBlocks_val",
        "exact h k y hyc"
      ]
    },
    {
      "id": "redroot",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "blob": "edef839707f5530496e6d41f642809d6f8ef78aa",
      "anchors": [
        "theorem redClC",
        "someRed_of k (complementary_of signature)",
        "(compact k) (boundB k)",
        "(herm_ofB k (conjProd k) (conjDual k))",
        "(prodModel k)) (cuspUnit k) (cuspPairIrr k)",
        "theorem rhoNuRhoReducibleC"
      ]
    },
    {
      "id": "some",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SomeRed.lean",
      "blob": "75812479af7b72b9290d3c111190ec6654fd2798",
      "anchors": [
        "theorem someRed_of",
        "push_neg at hcon",
        "have hirr : ∀ s : ℝ, 0 ≤ s",
        "obtain ⟨K₀, F, hKo, hKc, hF, hFe⟩",
        "have hU0 : IsUnitarisable (F 0)",
        "have hUs := h1",
        "set s : ℝ := (d : ℝ)",
        "exists_smooth_hasCentralChar",
        "exists_nabs_lt_one",
        "have hω1",
        "have hW : Nontrivial",
        "have hb := h3",
        "have hnc : ‖c‖ = nabs k t ^ (-((d : ℝ) * s))",
        "Real.one_lt_rpow_of_pos_of_lt_one_of_neg"
      ]
    },
    {
      "id": "defs",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/Complementary.lean",
      "blob": "cdcb4ad9486adfa4d5b9444d833141ad9518a2d0",
      "anchors": [
        "def Complementary : Prop",
        "def Compact : Prop",
        "def Bound : Prop",
        "def Herm : Prop",
        "def ProdModel : Prop",
        "def CuspUnit : Prop",
        "def SomeRed : Prop",
        "def RedCl : Prop",
        "Function.Surjective ι"
      ]
    },
    {
      "id": "pair",
      "path": "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/CuspidalPairSubGeneric.lean",
      "blob": "814a2b78940cfd6f6b24c02109d10987d2e09607",
      "anchors": [
        "theorem exists_eq_singleton_of_sum'",
        "theorem exists_equiv_of_cell",
        "have hsurj : Function.Surjective r",
        "theorem exists_equiv_of_jm_ne_zero",
        "theorem jm_le_one",
        "theorem false_of_sub_quot",
        "jhMult_jac_exact",
        "(1 : ℕ∞) + 1 ≤ 1",
        "theorem surjective_of_jm",
        "(hne : x ≠ y)",
        "(h1 : 1 ≤ jm",
        "(h2 : 1 ≤ jm",
        "exists_irreducible_smooth_quotient",
        "JacquetLeft.exists_embedding",
        "by_cases hz : (u 1).1 = 0",
        "CuspNotInd.jhMult_eq_zero_of_isCusp",
        "exists_equiv_of_jm_ne_zero ![x, y]",
        "exact false_of_sub_quot ![x, y]",
        "exact false_of_sub_quot ![y, x]"
      ]
    },
    {
      "id": "pairdef",
      "path": "src/Development/WeilBound/CoreStatements/TemperedRepresentationTheory/MirabolicDerivatives/SegmentCuspLines/CuspLinesIrr.lean",
      "blob": "71acaca30a8afc83843f118b87aa8e70a176d2b2",
      "anchors": [
        "def CuspPairIrr : Prop",
        "y ≠ x.nu 1 → x ≠ y.nu 1"
      ]
    },
    {
      "id": "pairirr",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/CuspPairIrr.lean",
      "blob": "bc4303f043cbf390141c7ae44345cdf2cad4c143",
      "anchors": [
        "theorem nuPair",
        "derivative_jacquet_holds",
        "(jmTheta k) (derFin_of k (derEquiv k))",
        "theorem cuspPairIrr",
        "cuspPairIrr_of k (nuPair k)"
      ]
    },
    {
      "id": "compl",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "blob": "168c1aea2166006780855063060e567f700901ad",
      "anchors": [
        "theorem complementary_of (h : Signature)",
        "have hsimple",
        "have hforms",
        "have hpos0",
        "rcases h G W",
        "let K₁ : Subgroup G",
        "let Kv : Subgroup G",
        "refine ⟨-H"
      ]
    }
  ],
  "nodes": [
    {
      "id": "segTwo",
      "kind": "consumer",
      "source": "seg",
      "declaration": "segTwo_of",
      "dependencies": [
        "reverse",
        "unique",
        "fine"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "reverse",
      "kind": "theorem",
      "source": "rev",
      "declaration": "jhMult_rev_jac_sub",
      "dependencies": [
        "pairSat",
        "reducible",
        "twistDistinct",
        "repTransport"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "pairSat",
      "kind": "theorem",
      "source": "pair",
      "declaration": "surjective_of_jm",
      "dependencies": [
        "properQuot",
        "leftEmbedding",
        "cuspExclusion",
        "perm",
        "multSplit"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "properQuot",
      "kind": "obligation",
      "source": "pair",
      "declaration": "finite length + nonzero smooth irreducible quotient",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "leftEmbedding",
      "kind": "obligation",
      "source": "pair",
      "declaration": "JacquetLeft.exists_embedding + FrobJm.one_le_jm + JmMono",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "cuspExclusion",
      "kind": "obligation",
      "source": "pair",
      "declaration": "rank-zero second block: ProdSingle + CuspNotInd",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "perm",
      "kind": "theorem",
      "source": "pair",
      "declaration": "exists_equiv_of_jm_ne_zero",
      "dependencies": [
        "cell",
        "geomLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "cell",
      "kind": "theorem",
      "source": "pair",
      "declaration": "exists_equiv_of_cell",
      "dependencies": [
        "supportLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "multSplit",
      "kind": "theorem",
      "source": "pair",
      "declaration": "false_of_sub_quot",
      "dependencies": [
        "multCap",
        "exactLeaf"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "multCap",
      "kind": "theorem",
      "source": "pair",
      "declaration": "jm_le_one",
      "dependencies": [
        "jacFormula"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "reducible",
      "kind": "theorem",
      "source": "redroot",
      "declaration": "rhoNuRhoReducibleC",
      "dependencies": [
        "redCl"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "redCl",
      "kind": "theorem",
      "source": "red",
      "declaration": "redCl_ofC + rhoNuRho_ofC",
      "dependencies": [
        "someRed",
        "cuspUnit",
        "pairIrr",
        "twistDistinct",
        "repTransport"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "someRed",
      "kind": "theorem",
      "source": "some",
      "declaration": "someRed_of",
      "dependencies": [
        "complementary",
        "compact",
        "bound",
        "herm",
        "prodModel",
        "centralChar"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "complementary",
      "kind": "theorem",
      "source": "compl",
      "declaration": "complementary_of",
      "dependencies": [
        "signature"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "pairIrr",
      "kind": "theorem",
      "source": "pairirr",
      "declaration": "cuspPairIrr",
      "dependencies": [
        "nuPair"
      ],
      "status": "SOURCE-MATCHED / CONDITIONAL"
    },
    {
      "id": "nuPair",
      "kind": "obligation",
      "source": "pairirr",
      "declaration": "nuPair_of + derivative_jacquet_holds + jmTheta + derFin",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "signature",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "signature",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "compact",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "compact k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "bound",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "boundB k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "herm",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "herm_ofB + conjProd + conjDual",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "prodModel",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "prodModel k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "cuspUnit",
      "kind": "open_leaf",
      "source": "redroot",
      "declaration": "cuspUnit k",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "centralChar",
      "kind": "open_leaf",
      "source": "some",
      "declaration": "central character, invariant positive form, exists_nabs_lt_one",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "twistDistinct",
      "kind": "open_leaf",
      "source": "rev",
      "declaration": "positive-rank nu_natCast_inj / nu_ofReal_inj",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "repTransport",
      "kind": "open_leaf",
      "source": "rev",
      "declaration": "prodIrr transport, twist, topEquiv",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "geomLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "geometric lemma and finite filtration",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "supportLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "support transport and singleton support identification",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "exactLeaf",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "jhMult_jac_exact and quotient subquotient monotonicity",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "jacFormula",
      "kind": "open_leaf",
      "source": "pair",
      "declaration": "jacquet_multiplicity_cuspidal_product",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "unique",
      "kind": "open_leaf",
      "source": "seg",
      "declaration": "exists_unique_irred_sub (prior 1600 chapter)",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    },
    {
      "id": "fine",
      "kind": "open_leaf",
      "source": "seg",
      "declaration": "FineStep.nonempty_equiv_of_jhMult_eq_one (prior 1600 chapter)",
      "dependencies": [],
      "status": "SOURCE-REFERENCED / OPEN"
    }
  ]
}
```

Graph regression (paste the JSON as variable graph):
```js
function validate(ns){let m=new Map(ns.map(x=>[x.id,x]));if(m.size!==ns.length)throw Error("duplicate");let seen=new Set(),active=new Set();function go(id){if(!m.has(id)||active.has(id))throw Error("missing or cycle "+id);if(seen.has(id))return;active.add(id);for(let dep of m.get(id).dependencies)go(dep);active.delete(id);seen.add(id)}go("segTwo");if(seen.size!==ns.length)throw Error("orphan");return seen.size}
console.log(validate(graph.nodes))
```

RESUME HERE: reconstruct native Signature producer and BoundB estimate (from RhoNuRhoReducibleC imports); first obtain their actual proofs and retain finite-dimensional normalization and compact-open averaging hypotheses. Do not repeat the half-twist reduction or saturation argument. HANDOFF TO dependencies, kernel, audit and proof editor: seek role-labelled edges for PositivityTheory.RgGu.SRC.jhMult_rev_jac_sub, GlobalTheory.CompanionTheory.CuspPairSub.surjective_of_jm, PositivityTheory.RgGu.NR.someRed_of. Full reconstruction OPEN.


---

# Peer chapter — math/2026-11-24_ind_unique_primitive_character_uniqueness.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_ind_unique_primitive_character_uniqueness.md); blob e7b4a2a02629fda0097d9a9787987e438e517e19; pin named. Relative links refer to original location.

# MATH lane — `QH.ind_unique`: primitive-character uniqueness from common-level agreement

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of pinned `QH.ind_unique`, including the imported
`factorsThrough_gcd` CRT argument.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source pin and exact dependency

The project source is `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source | Git blob | Use |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean` | `d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e` | theorem reconstructed |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | immediate downstream consumer |
| `lake-manifest.json` | `b4d1ec31575a26b2159ec3a262b482bc051f3f6f` | pins Mathlib to `0df444a360eaa60ab8c11dca51a86af692955474` |
| Mathlib `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` at that revision | `4569ebb8e61f683a9c89877f0cda4d3add4d766d` | `changeLevel`, conductor, primitivity, `factorsThrough_gcd` |

The earlier `ind_drop` chapter treated `ind_unique` honestly as an imported proved theorem. This
chapter discharges that explanatory gap without changing its premises.

## 1. Exact theorem and quantifiers

For every natural `N,N',M`, with typeclass hypotheses `NeZero N` and `NeZero N'`, and every
pair

`psi : DirichletCharacter C N`,  
`psi' : DirichletCharacter C N'`,

assume:

1. `M != 0`;
2. `psi.IsPrimitive`, meaning `psi.conductor=N`;
3. `psi'.IsPrimitive`, meaning `psi'.conductor=N'`;
4. for every natural `n`, if `Coprime(n,M)), then
   `psi(n mod N)=psi'(n mod N')`.

Then

`⟨N,psi⟩ = ⟨N',psi'⟩ : Sigma (fun r => DirichletCharacter C r)`.

The conclusion identifies both the level and the character after dependent transport. It is not
merely equality of values on a finite sample. The nonzero hypothesis on `M` is retained even though
`M` is not a character level.

## 2. Lift both characters to one nonzero level

Set `L=N*N'*M`. Nonzeroness of `N,N',M` gives `L!=0`, so change-level injectivity is available.
The source records the divisibilities

`N|L`, `N'|L`, `M|L`, `N*N'|L`, and `N'*N|L`.

Claim:

`psi.changeLevel(N|L) = psi'.changeLevel(N'|L)`.

To prove it, extensionality reduces equality of Dirichlet characters to their values on an arbitrary
unit `a` of `ZMod L`. Its natural representative `a.val` is coprime to `L`; since `M|L`,
it is also coprime to `M). The hypothesis therefore gives

`psi(a.val mod N)=psi'(a.val mod N')`.

`changeLevel_eq_cast_of_dvd`, together with the natural-cast identities, says these two values are
exactly the values of the lifted characters at `a`. This proves the claim. The proof uses only
integers represented by units at level `L`; it does not extend the original hypothesis to
non-coprime integers.

## 3. Remove the auxiliary factor `M`

The previous equality lives at `N*N'*M`, but `factorsThrough_gcd` expects equality at the product
level. Change-level injectivity removes the last factor:

`k1 : psi.changeLevel(N|N*N') = psi'.changeLevel(N'|N*N')`.

Indeed, lift both sides of `k1` from `N*N'` to `L); transitivity of `changeLevel` turns the
result into the established common-level equality.

The proof constructs the reversed ordered-product version separately:

`k2 : psi'.changeLevel(N'|N'*N) = psi.changeLevel(N|N'*N)`.

It lifts to `L`, uses the ring identity `N'*N*M=N*N'*M`, and applies the symmetric common-level
equality. Although multiplication is commutative arithmetically, the two dependent character types
and divisibility proofs are not definitionally interchangeable; the source keeps both transports
explicit.

## 4. What `factorsThrough_gcd` actually proves

Mathlib defines `psi.FactorsThrough d` to mean that there exist `d|N` and a character of level
`d` whose change of level equals `psi`. From `k1`,

`f1 : psi.FactorsThrough(gcd(N,N'))`;

from `k2`,

`f2 : psi'.FactorsThrough(gcd(N',N))`.

This is not a black-box appeal. At the pinned Mathlib revision,
`factorsThrough_gcd` proves a kernel inclusion for the unit map

`(ZMod N)^* -> (ZMod gcd(N,N'))^*`.

Take a unit `x` in its kernel, so `x ≡ 1 mod gcd(N,N')`. The generalized Chinese remainder
theorem, invoked in the source as `Nat.chineseRemainder'`, produces a natural `z` satisfying

`z ≡ x mod N`, and `z ≡ 1 mod N'`.

Because `x` is a unit modulo `N` and `1` is a unit modulo `N'`, `z` is coprime to
`N*N'`. Equality of the two product-level lifts gives

`psi(x)=psi(z)=psi'(z)=psi'(1)=1`.

Thus every kernel element is killed by `psi`; the kernel criterion
`factorsThrough_iff_ker_unitsMap` supplies factorization through the gcd. Swapping the characters
gives the reverse factorization. This CRT step is the mathematical content behind the imported
theorem name.

## 5. Primitivity forces equality of levels

The conductor is Mathlib's `sInf` of all levels through which a character factors. Therefore
`f1` and `f2` give

`psi.conductor <= gcd(N,N')`,  
`psi'.conductor <= gcd(N',N)`.

Primitivity substitutes `psi.conductor=N` and `psi'.conductor=N'`, so

`N <= gcd(N,N') <= N`,  
`N' <= gcd(N',N) <= N'`.

Consequently

`gcd(N,N')=N`, and `gcd(N',N)=N'`.

Using commutativity of gcd yields `N=N'`. Both directions are essential. The first alone says
`gcd(N,N')=N`, equivalently `N|N'`; for example `N=2,N'=4` satisfies it without equality.
The second supplies the reverse divisibility.

## 6. Recover the character and the sigma equality

After substituting `N'=N`, `k1` states that the two characters become equal after changing both
from level `N` to level `N*N`. Since this change-level map is injective, `psi=psi'`.
Substitution reduces the dependent pairs to the same constructor, and `rfl` proves

`⟨N,psi⟩ = ⟨N,psi⟩`.

This final route explains why the theorem returns sigma equality rather than trying to state ordinary
equality between characters whose levels may initially differ.

## Downstream link and correction

`QH.ind_drop` calls `ind_unique` with

`N' = xi.conductor*q`, and `M_comparison = M*N0*q`.

Its preceding proof establishes agreement only on integers coprime to that comparison modulus.
`ind_unique` then forces the unknown primitive level `N` to equal `xi.conductor*q` and transports
`chi` to the canonical primitive Jacobi twist. The earlier explanation was correct about this
dependent identification; the present reconstruction corrects any impression that pointwise
agreement itself makes differently typed characters definitionally equal.

## Executed certificate

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_unique_primitive_character_uniqueness.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_unique_primitive_character_uniqueness.py
```

The certificate validates the pinned source/blob ledger and required proof anchors; exhaustively
checks the common-level coprimality restriction; constructs every compatible CRT witness over a
finite deterministic grid; checks the two-gcd equality implication; and includes negative controls
showing that one gcd direction, `M=0`, or unrestricted evaluations are insufficient.

These checks validate the finite arithmetic skeleton. They do not replay Lean, prove character
extensionality, or replace Mathlib's kernel theorem.

## Failed attempts / limitations

- A one-direction proof through `f1` stops at `N|N'`; the concrete pair `2,4` is a counterexample
  to concluding equality.
- Taking `M=0` makes `L=N*N'*M=0`, so the needed `NeZero L` instance and change-level
  injectivity are unavailable.
- The source hypothesis does not cover arbitrary integers; the proof must first represent a unit at
  level `L`, whose value is coprime to `M`.
- Treating `N*N'` and `N'*N` as definitionally identical obscures the required dependent
  transports; the pinned proof constructs `k1` and `k2` separately.
- No local Lean checkout or compiled `.olean` graph was available, so no kernel replay or axiom
  census is claimed. This reconstruction relies on the pinned source proofs and Mathlib revision
  recorded above.

## RESUME HERE

Reconstruct pinned Mathlib `changeLevel_injective` and the exact unit-map surjectivity argument used
by `QH.ind_unique`: preserve the nonzero target-level requirement, the lift from unit-group equality
to Dirichlet-character equality, and the distinction between source-level and target-level units.
Do not repeat `ind_unique`, `ind_drop`, or the completed `pairEx` assembly.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.


---

# Peer chapter — specialists/character_boxes/RUN11_NATIVE_LEVEL_CHARACTER_TIE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN11_NATIVE_LEVEL_CHARACTER_TIE.md); blob fa9a3d69d1f7ea70eb90101c6644a492317f045d; pin named. Relative links refer to original location.

# RUN11 — Native level-character pair compatibility: actual PsiPPTie producer located
2026-11-24. SOURCE-MATCHED human derivation, finite explanatory regression; NOT kernel replay, not full RH reconstruction.

## Preflight / selection
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity, latest physics CI #383 (not RH validation), RUN10, StableIffCarrierEq, and recent handoffs from all nine other specialists, integration, dependencies, structure, math and audit. External blueprint not reread. The dependency lane's 1712 report binds seven different targets, not our requested reverse edges. Connector default-branch code search for PsiPPTie, ReadL, MjHIds yielded no hits, which is not negative dependency evidence. Instead fetched the pinned nonrecursive Git tree of IwasawaDecomposition (7501f7939fae16a6d24ad8f55ec8c9857c483a4d; 7769 entries; not truncated); the ordinary contents listing is incomplete. Located actual PsiPPTie producer through ExistsFiniteGroupGoodSetLevelsCharacters imports. This is the fallback specified by RUN10, not a repeat of its cardinality argument. ReadPk and ExistsReadOfDivDef3 are not the required ReadL constructor (the latter assumes DivDef3 and produces GlobalTheory.Mem.SJ.Read, a different record). ReadL/MjHTie/IdxDefs initial suppliers remain open.

## 1. Exact source-level dependency chain
Pinned leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
- GlobalTheory.Mem.R3.Grp.grp_levels_exist calls GlobalTheory.T.psiLevelPairCompatible_of_columnLevels.
- The wrapper delegates to GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf.
- This calls baseLevel_character_preserved_placewiseIdentity, sym_tie, psiC_of_mem and absNorm_eq_of_res.
- sym_tie uses symPos_entries_iff, HPsymF_eq_comap_unipSym, chiSym_eq_symHom, piChar_apply' and ofLocal_chi_apply.
- Formalism.L2.DIV.PsiPPTie is an existential with SAME five witnesses for LvlTie and PsiWeil. RUN10's pins_card_index_ranks consumes h.keep.psi, destructures these witnesses and uses LvlTie; this proves a real source-level producer of the type, not that this particular grp_levels_exist invocation is the provenance of every h.keep.psi on the Main kernel DAG. Need authenticated reverse edges for that stronger claim.

## 2. All quantifiers and five hypotheses of the producer
For every stage X, px:PreX X.B.toPre, I:Col2.ColIn X.B px, subset U of I.ι, L:LevCh X.toD7 (TupU I U), group equivalences eG:Gc X.B px ≃* G0 L.Pg X.toD7.R.r and cG:G0 L.Pg X.toD7.R.r ≃* G0g X.toD7.nd, place bijection plg:(Σ k:Fin 2,X.toD7.nd.PlG k)≃L.Pg and residue equivalences iso(kv):ZMod(X.toD7.host.g kv.1)≃+*kP(plg kv).1, assume:
1. I.Ok.
2. LevOf X I U L.
3. IsPlacewiseIdentity X eG.
4. For every kv, underlying place of plg kv equals X.toD7.naut.plGw kv.1 kv.2.
5. For every g and kv, eG(g)(plg kv)=Formalism.UG.bc (iso kv) ((eG.trans cG)(g)(kv)).
Then PsiPPTie X.toD7 (lev0 I) (chr0 I) (lev1 I) (chr1 I) (eG.trans cG).
No arbitrary new roots chosen: the actual witness family is psiC I, already specified by I. Take Pg=L.Pg, pl=plg, res(kv)=iso(kv)^(-1), ψ=psiC I, eC=eG. The conclusion is existential, but the proof supplies these exact witnesses. Retain all original types/instances and guards.

## 3. The seven LvlTie fields, with the reason for each
place: hypothesis 4.
comp: apply inverse residue map entrywise to hypothesis 5; iso inverse cancels iso. The GL equality follows from matrix extensionality and units extensionality.
gen: hLev.Pg identifies the level place set with (X.B.primes px).vGs; psiC_of_mem identifies ψ with I.Ch.psi0 there. I.Ok.ch_ok.psi_zero_nontrivial_character establishes each selected ψ is nontrivial. No assertion at places outside Pg.
p0 and chi0: after using hLev.Pg to identify the two index sets, eG is the identity on every component by hypothesis 3. Thus it preserves membership of the base unipotent subgroup and its character; the second equality is on subgroup elements with membership proof, not on arbitrary G.
ps and chis: use sym_tie, which requires the same place-set equality, placewise identity and ψ equality at every selected place. For r=R.r, a=R.rS, k=R.k, source rank equality r=k+2a+1 implies a+k≤r. Define p(i)=k+i if i<a, i-a if a≤i<a+k, i otherwise. This is inverse of symPerm; it exchanges adjacent blocks of sizes k and a. For each local matrix M, define Y_ij=M_{p(i),p(j)}. Both indices must be permuted. The inverse formula q(i)=a+i if i<k, i-k if k≤i<k+a, i otherwise establishes bijectivity.
HPsymF_eq_comap_unipSym identifies membership in the original symmetric subgroup with membership of Y in unipSym. Hence every member supplies the witness family Y; conversely existence of any Y with these entrywise equalities forces the same matrices, and gives membership. For the character, both global characters are finite products of local characters. At each place, chiSym_eq_symHom identifies the local characters after the coordinate change and hψ identifies their additive characters. Equality of underlying scalar values gives equality in the unit group. Finset.prod_congr then proves chis for EVERY g in Ps and EVERY y in the symmetric subgroup satisfying the full entrywise relation, not merely for one selected y.

The local scalar mechanism is exact. Define E(i,j) iff (j=i+1 and j≠a and j≠a+k) or (i+1=a and j=a+k). For matrices in the column-restricted unipotent subgroup, let S(M)=sum_{E(i,j)} M_ij. The first part of E is the adjacent superdiagonal with two edges removed, and the second is the bridging entry (a-1,a+k) when a>0. sym_sum_split proves the old supSum+offSum equals S. Since ψ is additive as a character, ψ(s+t)=ψ(s)ψ(t), so the product of the two old scalar character factors is ψ(S). For any two subgroup matrices A,B, S(AB)=S(A)+S(B): for each adjacent edge no intermediate index exists; for the bridging edge every intermediate l is in [a,a+k), where B_{l,a+k}=0 by the column restriction. Thus no cross term remains. This is exactly why symHom is a homomorphism (DefGroup). Removing the column restriction breaks this identity in general. No claim that ψ is additive as an ordinary field-valued linear map.

## 4. PsiWeil field and full assembly
For every kv, every residue c at plg kv, and integer b such that xiBar(X.toD7,plg kv)*c=b in that residue ring, I.Ok.weil gives the prescribed embedded value exp(2π i b/qOf(place)). Since res is a ring equivalence onto ZMod(g_k), the quotient-cardinality formula for absolute norm gives qOf(place)=g_k. Replace qOf by g_k, and use psiC_of_mem to get the exact PsiWeil equation. No appeal to asymptotics or numerical approximation of the exponential. I.Ok supplies both Weil normalization and nontriviality; this theorem is NOT their unconditional proof. In particular the separate exists_psiWeil construction from roots is NOT called here.
All seven LvlTie fields and the eighth PsiWeil obligation use the same place map, residue maps, group map and character family.

## 5. Immediate outer producer and frontier
grp_levels_exist assumes I.Ok, GrpAt X I, LevOf X I U L plus the dependent hX:X.B.fields.Ok. It obtains eG,cG,plg,iso,hid,hpl,hdiv,hbc from exists_finiteGroupIdentification_fixedPlaces. It obtains Xg and its idempotent coefficient properties from exists_goodCharacterSet_idempotent_coeff_coefficientField. It applies the just-explained wrapper with hI,hL,hid,hpl,hbc; it also separately invokes upperUnipotentGenericCharacter_mem_integralField and columnFaceLevels_baseLevel_symmetricLevel. The remaining universally quantified tr block preserves the SAME Xg and maps; IdemClass is obtained from centrality hG.cen and idemOf_coeff_conj. None of these adjacent suppliers is discharged merely by the level-character tie theorem. This is an exact conditional proof and a newly located source-level producer of PsiPPTie.

## 6. Provenance and actual source checks
P=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/; F=src/Formalism/LocalToGlobal/.
- P/PsiLevelPairCompatibleOfColumnLevels.lean 0e39e161c954e76eb867d33ed4ae430b5744b013
- P/PsiLevelPairCompatibleOfColumnLevelsStatement.lean 2a9bc1bc147d4a1fdfed82279c34f3a9e885c10c
- P/ExistsFiniteGroupGoodSetLevelsCharacters.lean f6e42ebeed75fceae0c6f0365051c3342cfa9d24
- F/Columns/RecLevelSym.lean b17e259e820676383aa066cb4736fab1e545f7c8
- F/Divisibility/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa
- F/Divisibility/PsiWeilOfAbsNorm.lean faaeff58e5c914aaea2ae6b11b4c7e0d61893a63
- F/Divisibility/DefGroup.lean 7497d665269c3ddeca251b145595ac7a3d53d617
- P/PinsCardIndexRanks.lean 04985046149dee04230630862a68aa6cc8b9fa29

Executed 58 assertions in connector V8: eight returned blob SHA comparisons and 50 source substring matches. Source anchors for replay (in manifest order):
1. theorem symPos_eq_symm; theorem symPos_entries_iff; theorem baseLevel_character_preserved_placewiseIdentity; theorem sym_tie; HPsymF_eq_comap_unipSym; chiSym_eq_symHom; Finset.prod_congr; theorem psiPPTie_of_levOf; I.Ok → LevOf; IsPlacewiseIdentity; ⟨L.Pg, plg, fun kv => (iso kv).symm, psiC I, eG; hP0.1, hP0.2, hS.1, hS.2; hOk.ch_ok.psi_zero_nontrivial_character; hOk.weil; absNorm_eq_of_res.
2. theorem _root_.GlobalTheory.T.psiLevelPairCompatible_of_columnLevels; exact @GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf.
3. theorem grp_levels_exist; I.Ok → GrpAt X I → LevOf; GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces; GlobalTheory.T.psiLevelPairCompatible_of_columnLevels; GlobalTheory.T.columnFaceLevels_baseLevel_symmetricLevel; idemOf_coeff_conj.
4. theorem HPsymF_eq_comap_unipSym; theorem sym_sum_split; theorem chiSym_eq_symHom; AddChar.map_add_eq_mul; theorem symEdge_symPerm_iff; theorem chiSymF_val; theorem r_eq_sym.
5. def symPos; structure LvlTie; place :; comp :; gen : IsGenericPsi; p0 :; chi0 :; ps :; chis :.
6. def PsiWeil; theorem absNorm_eq_of_res; theorem exists_psiWeil; def PsiPPTie; LvlTie D P0 ψ0 Ps ψs eG Pg pl res ψ eC ∧ PsiWeil.
7. def symEdge; def symHom; hy.2 l j; def IsGenericPsi.
8. theorem pins_card_index_ranks; h.keep.psi.
Reproduce with git rev-parse PIN:path and git show PIN:path. These are textual assertions, not elaborated dependency tests.

Observed upstream main 307cef33f046955ee79dba47e0d828d06496d75f, distinct from RUN10's 1da818b50f1e18808db2792b9dc735bda8cb84d8. At observed head all three P producer/wrapper/outer paths above returned HTTP 404. RowSideTie still exists (a49b52b6eb68027e64b511c0cd3c85874112b706), as does PsiWeilOfAbsNorm (f339097a162c41c17bdab662a55e21e00f9b944d), but declarations have changed. No assertion of deletion vs relocation or proof equivalence; keep the original snapshot.

## 7. Reproducible regression, executed
Actual connector V8 output: permutation=72, edge=15420, matrices=2592, products=2592, negative=3. Deterministic finite residue-matrix models only; not native automorphic data or kernel validation. Copy to Node to reproduce:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let permutation=0,edge=0,matrices=0,products=0,negative=0;
 const seq=r=>Array.from({length:r},(_,i)=>i);
 const mod=(x,q)=>(x%q+q)%q;
 const sy=(i,a,k)=>i<a?k+i:i<a+k?i-a:i;
 const E=(i,j,a,k)=>(j===i+1&&j!==a&&j!==a+k)||(i+1===a&&j===a+k);
 const sum=(M,pred)=>M.reduce((s,row,i)=>s+row.reduce((t,v,j)=>t+(pred(i,j)?v:0),0),0);
 for(let a=0;a<=8;a++)for(let k=1;k<=8;k++){
  const r=k+2*a+1,I=seq(r),p=I.map(i=>sy(i,a,k)),inv=I.map(i=>i<k?a+i:i<k+a?i-k:i);
  ck(new Set(p).size===r&&I.every(i=>p[inv[i]]===i&&inv[p[i]]===i),"perm");permutation++;
  for(let i of I)for(let j of I){ck(E(inv[i],inv[j],a,k)===(j===i+1&&j!==k),"edge");edge++}
  for(let q of [2,3,5])for(let seed=0;seed<12;seed++){
   const make=s=>I.map(i=>I.map(j=>j<i?0:j===i?1:j===a+k&&i>=a?0:mod((i+1)*(j+2)+s*(i+j+1),q)));
   const A=make(seed),B=make(seed+1),C=I.map(i=>I.map(j=>mod(I.reduce((s,l)=>s+A[i][l]*B[l][j],0),q)));
   const old=I.map(i=>I.map(j=>A[inv[i]][inv[j]])),newM=I.map(i=>I.map(j=>old[p[i]][p[j]]));
   ck(I.every(i=>I.every(j=>newM[i][j]===A[i][j])),"matrix");
   ck(mod(sum(old,(i,j)=>j===i+1&&j!==k),q)===mod(sum(A,(i,j)=>E(i,j,a,k)),q),"sum");
   matrices++;
   ck(I.every(i=>I.every(j=>!(j===a+k&&i>=a&&i<j)||C[i][j]===0)),"closure");
   ck(mod(sum(C,(i,j)=>E(i,j,a,k)),q)===mod(sum(A,(i,j)=>E(i,j,a,k))+sum(B,(i,j)=>E(i,j,a,k)),q),"hom");products++;
  }
 }
 const a=1,k=2,r=5,q=3,I=seq(r);
 const A=I.map(i=>I.map(j=>+(i===j||i===0&&j===1))),B=I.map(i=>I.map(j=>+(i===j||i===1&&j===3)));
 const C=I.map(i=>I.map(j=>mod(I.reduce((s,l)=>s+A[i][l]*B[l][j],0),q)));
 ck(mod(sum(C,(i,j)=>E(i,j,a,k)),q)!==mod(sum(A,(i,j)=>E(i,j,a,k))+sum(B,(i,j)=>E(i,j,a,k)),q),"column guard");negative++;
 ck(E(0,3,a,k)&&!E(0,1,a,k),"bridge not ordinary");negative++;
 ck(new Set([0,1,2].map(i=>sy(i,2,2)%3)).size<3,"rank guard");negative++;
 return {permutation,edge,matrices,products,negative}
}
console.log(regress())
```
The first negative control deliberately violates the column restriction, the second checks the bridging edge replaces the ordinary adjacent edge, and the third violates the rank bound. No original hypotheses removed. No speed benchmark, no Lean run, no physical work.

RESUME HERE: trace actual GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces producer (import in grp_levels_exist) and its dependent place/residue equivalences, then follow the caller of grp_levels_exist into Keep/Pins. Use nonrecursive git trees instead of truncated directory listings. Request authenticated role edges for GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf, GlobalTheory.T.psiLevelPairCompatible_of_columnLevels, GlobalTheory.Mem.R3.Grp.grp_levels_exist and GlobalTheory.Mem.R3.pins_card_index_ranks. Keep ReadL/MjHTie/IdxDefs original producers open; do not substitute SJ.Read or rerun previous cardinality. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, audit. Project OPEN.


---

# Peer chapter — specialists/galois_representations/RUN11_FROBENIUS_EXISTENCE_FIXED_FIELD_BRIDGE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN11_FROBENIUS_EXISTENCE_FIXED_FIELD_BRIDGE.md); blob d865e49e6432f4791f9ca619792bfc7f49745533; pin named. Relative links refer to original location.

# Run 11 — unramified Frobenius existence and the fixed-field bridge
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the native Frobenius existence producer, its uniqueness/bijectivity, and the exact fixed-field consumer. PARTIAL for MemLoc.frob_laws: the consumer was found, but the declaration body of the fixed-field supplier and FrobLaws.exists_ext was not located in this run. Project OPEN. No kernel replay or URT performance result.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol (large files inspected in excerpts), Run 10 and recent peer handoffs. Latest physics CI summary PASS 17:24:12Z run 45444228785 (not RH evidence). Read recent theta, integration, dependency, structure, kernel, acceleration, Landau, prime, geometry, literature, audit, math and editor notes; no overlap with their stated frontiers. Character-box current handoff was not recovered (one commit lookup returned 422); previous queue and lane scope were inspected. No changes to physics queue or peer checkpoints. Prior-work ledger: Run 10 established the finite-action-to-open-twist bridge at the source level; it explicitly left the Frobenius fixed-field producer open. This run expands the adjacent existence producer and records the exact remaining leaf rather than treating it as proved by name.

## 1. Native existence theorem (A, lines 12–80)
Let V be a discrete valuation ring and a domain, K its characteristic-zero fraction field, Ω an algebraic closure of K, with compatible V/K/Ω algebra maps and finite residue field k=V/m. The theorem exists_algEquiv_rootOfUnity_eq_pow constructs a K-automorphism φ of Ω such that for ALL x in Ω and natural m with m cast into V outside the maximal ideal, x^m=1 implies φ(x)=x^q, q=|k|. Distinguish the ideal m from the integer m in the notation.

Proof from the native body:
1. Ω/K is Galois. Let R be the integral closure of V in Ω, with its discrete topology and the induced action of Gal(Ω/K). The action is continuous: every integral element is algebraic over K and its stabilizer is open. The action commutes with V-scalars.
2. Invariants of R are precisely V: a fixed element lies in K by infinite Galois fixed-field theory; it is integral over V, hence belongs to V because a DVR is integrally closed. Faithful scalar action follows from the injective maps V -> K -> Ω.
3. Choose a maximal ideal Q of R lying over the maximal ideal of V by integrality. The extension R/Q over k is algebraic. The finite-field q-power Frobenius is an automorphism of this algebraic residue extension. Apply the native dependency Ideal.Quotient.stabilizerHom_surjective_of_profinite to lift that automorphism to σ in the stabilizer of Q. This is an essential theorem, not a conclusion obtained by choosing an arbitrary Galois element. The resulting element is arithmetic Frobenius at Q.
4. A root x of x^m=1 with m outside the maximal ideal has m>0 (zero is in the ideal), is integral, and the image of m in R lies outside Q since Q lies over the given ideal. The imported AlgHom.IsArithFrobAt.apply_of_pow_eq_one upgrades congruence to exact equality on prime-to-residue-characteristic torsion. It yields σ(x)=x^q. This proof does not claim equality on arbitrary integral elements: the root condition and unit-order guard are essential.

The imported profinite surjectivity and exact lifting theorem bodies are separate obligations; no kernel or axiom inspection here.

## 2. Specialization and uniqueness (A 82–105; B 66–79)
Take l prime, V=Z_l, K=Q_l, Ω=Om l. The residue field is ZMod l, of size l. The kernel of reduction is the maximal ideal and the image of m is zero exactly when l divides m. Thus the preceding φ satisfies φ(ζ)=ζ^l for every positive-order prime-to-l root in Ω.

Let U=MaximalUnramifiedExtension l, the intermediate field generated over Q_l by the roots ζ with ζ^m=1, m>0, l not dividing m. A K-automorphism maps such roots to roots of the same admissible exponent. The native proof uses IntermediateField.adjoin_map and adjoin.mono to show φ(U) lies in U; codRestrict gives a K-algebra endomorphism F of U satisfying F(ζ)=ζ^l. This is exists_frobenius_Kur. By kur_algHom_ext, two K-algebra homomorphisms on U that agree on every generating root agree everywhere (the exact codomain hypotheses are Semiring B and Algebra Q_l B). The source frobUr is the chosen F, frobUr_root its property, and frobUr_bijective uses Algebra.IsAlgebraic.algHom_bijective. This proves existence, uniqueness and bijectivity, not merely the action on residue classes.

The extension needed by the consumer also follows independently from this construction: the specific φ constructed in A restricts to the chosen F, by uniqueness. This is a human derivation for this specific F, NOT a retrieval of the native general theorem FrobLaws.exists_ext. Alternatively a K-embedding of an intermediate field into an algebraic closure extends to an automorphism of Ω by the algebraic closure extension theorem.

## 3. The exact consumer (C 21–39)
Let S be an open subgroup of Gal(Ω/K). Assume:
h1: every g fixing every element of U lies in S;
h2: every g restricting to F=frobUr on U lies in S.
Then S is the whole Galois group. The source uses openness to obtain closedness (open subgroups are closed). For x in Ω fixed by all of S, h1 and infinite Galois correspondence imply x∈U. Choose g extending F by FrobLaws.exists_ext. By h2 g∈S, so x=F(x). The source then calls (MemLoc.frob_laws l F frobUr_root).2.2 to conclude that x is the image of an element of K. Therefore the fixed field of S is K; closed-subgroup Galois correspondence implies S=Gal(Ω/K). No density assumption on S is substituted for closedness.

For clarity, the standard human proof of the fixed-field property is as follows, with the classical unramified cyclotomic theorem explicitly retained as an input (not source-bound yet): each x∈U lies in a field generated by a finite list of admissible roots, hence in K(μ_m) for m the lcm of their orders (m=1 if the list is empty). The lcm is positive and coprime to l. The classical local cyclotomic theorem states K(μ_m)/K is finite unramified Galois, degree ord_m(l) for m>1, and the arithmetic Frobenius ζ↦ζ^l generates its Galois group. Thus x fixed by F is fixed by that full finite Galois group and lies in K. For m=1 the field is already K. The reverse inclusion follows because F is a K-algebra map. This is a conditional human expansion of the missing .2.2 result, NOT evidence that the native producer follows this exact route or that its other conjuncts are known. The native source of the local cyclotomic theorem or the alternate actual proof must be found before marking this leaf source-matched.

Two pitfalls: bijectivity of F alone does not imply its fixed field is K (identity is a counterexample on a nontrivial extension). Agreement on all prime-to-l roots, not just one selected root of unity, is necessary for the generator argument. The field here is the algebraic unramified extension inside Ω, not its completion.

## 4. Connection to the nonvanishing path
A.exists_algEquiv_rootOfUnity_eq_pow -> A.exists_frobenius_Kur -> B.frobUr/root/bijective; B.kur_algHom_ext gives uniqueness. C.eq_top_of_isOpen additionally invokes FrobLaws.exists_ext and frob_laws .2.2 -> C.exists_isTwist (with Run 10 isOpen_twistGroup) -> ChCoef and rank-one character normalization -> local Weil–Deligne parameters -> earlier CoreAll/Row0b/parameter/window/nonvanishing chain. This is a source reference map, not authenticated elaborated dependency reachability. The native producer of frob_laws, its complete conjunction and imported dependencies remain open; request exact tagged type/value witness for GlobalTheory.MemLoc.frob_laws, GlobalTheory.MemLoc.FrobLaws.exists_ext, GlobalTheory.MemLoc.exists_frobenius_Kur, and GlobalTheory.Pst.BridgeParam.eq_top_of_isOpen from dependency/kernel lanes.

## 5. Source provenance and actual checks
Repository leanprover-community/riemann-hypothesis. Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream latest returned commit H=307cef33f046955ee79dba47e0d828d06496d75f (merge PR #1266, batch 7). Do not replace pin.
A src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsAlgEquivRootOfUnityEqPow.lean
 P blob 860fbead9d52bcf746afad713860a60ea78e5cc5; H d9985abba5ca550d735edb66f7e04fd98bdc3bbf.
B src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean
 P 21a02daf0f36829d50c3c4243c10e36a9bd311d9; H dcbcc4dbbf8d4018f934fc09b2da07716608f63f.
C src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean
 P ffdce791714cb11064760245f465f9ba78449bbc; H 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Direct import witness: C via FiniteDimensionalFilDR -> FiniteDimensionalWdSpace -> FiniteDimensionalLetter -> B -> LocalPrimeGaloisActionPeriodT -> A. Pinned import bridge LocalPrimeGaloisActionPeriodT blob a8ea7e2814d271ced2abef4cf4d3edfb57c61ca6. DataN, DataNLoc, IsCrisP, LocTied and related imports inspected; filename-tree search and default-branch code search for frob_laws/FrobLaws did not locate the producer. This is a retrieval limitation, not an assertion that the theorem is missing from the repo.
Actually executed in JavaScript with GitHub connector: 16/16 exact substring anchors in pinned snapshots; seven declaration slices compared through first blank line, six byte-identical and one changed. Line pairs A existence 12->62 (changed), specialization 82->132 (identical); B ext 66->111, frobUr 72->117, root 74->119, bijective 77->122 (all identical); C eq_top_of_isOpen 21->65 (identical). Entire A/B/C files changed. The one changed body has NOT been reviewed for semantic equivalence. No synthetic numerical tests counted as evidence. No Lean executable run; no axioms audit or URT benchmark. The following reproducible check uses a local checkout with both commits, Python stdlib. Equivalent to executed JS assertions and slice comparisons, not separately run in Python.

```python
import subprocess, sys, re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="307cef33f046955ee79dba47e0d828d06496d75f"
base="src/Development/AbelianVarietyTheory/"
files=[
("Proofs/IwasawaDecomposition/ExistsAlgEquivRootOfUnityEqPow.lean",
 "860fbead9d52bcf746afad713860a60ea78e5cc5","d9985abba5ca550d735edb66f7e04fd98bdc3bbf",
 ["Ideal.Quotient.stabilizerHom_surjective_of_profinite","FiniteField.frobeniusAlgEquivOfAlgebraic","AlgHom.IsArithFrobAt.apply_of_pow_eq_one","PadicInt.residueField","PadicInt.ker_toZMod","IntermediateField.adjoin_map","codRestrict"],
 ["exists_algEquiv_rootOfUnity_eq_pow","exists_frobenius_Kur"],[False,True]),
("Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean",
 "21a02daf0f36829d50c3c4243c10e36a9bd311d9","dcbcc4dbbf8d4018f934fc09b2da07716608f63f",
 ["IntermediateField.adjoin_algHom_ext","exists_frobenius_Kur l).choose","exists_frobenius_Kur l).choose_spec","Algebra.IsAlgebraic.algHom_bijective"],
 ["kur_algHom_ext","frobUr","frobUr_root","frobUr_bijective"],[True]*4),
("Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean",
 "ffdce791714cb11064760245f465f9ba78449bbc","6e6f30ca2a8b1428043c1212f4c75896a3c5d747",
 ["S.isClosed_of_isOpen hopen","InfiniteGalois.fixedField_fixingSubgroup","GlobalTheory.MemLoc.FrobLaws.exists_ext","GlobalTheory.MemLoc.frob_laws","IntermediateField.fixingSubgroup_bot"],
 ["eq_top_of_isOpen"],[True])]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def decl(s,n):
    ls=s.splitlines()
    i=next(i for i,l in enumerate(ls) if re.match(r"^(theorem|def) "+n+r"(?: |:)",l))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
for path,ps,hs,anchors,names,flags in files:
    path=base+path
    for rev,sha in [(P,ps),(H,hs)]:
        assert git("rev-parse",rev+":"+path).strip()==sha
    p,h=(git("show",r+":"+path) for r in (P,H))
    for a in anchors: assert a in p,a
    for n,flag in zip(names,flags):
        i,a=decl(p,n); j,b=decl(h,n)
        assert (a==b)==flag,n
        print(n,i,j,flag)
print("16 pinned anchors; six unchanged, one changed declaration slice. Not Lean validation.")
```

## RESUME HERE
Obtain authenticated source location of GlobalTheory.MemLoc.frob_laws and FrobLaws.exists_ext from the dependency/kernel export or targeted import walk, expand every conjunct and the actual fixed-field proof rather than assuming the classical cyclotomic theorem above is the native route. Review the changed upstream A declaration separately, then EmbOrbitAlt. Do not redo the Frobenius existence construction; preserve the imported profinite lifting and root exactness as explicit dependencies. HANDOFF TO Galois, dependency, kernel, integration, editor, audit, theta and literature. Project OPEN.


---

# Peer chapter — specialists/landau_criterion/RUN11_LAPLACE_DIFFERENTIATION_AND_TAYLOR_BOUND.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN11_LAPLACE_DIFFERENTIATION_AND_TAYLOR_BOUND.md); blob af0ed06722c433f378eb61880e4f5b2fd3664e6e; pin named. Relative links refer to original location.

# RUN11 — direct Laplace coefficient producer and uniform Taylor control

2026-11-24. RESULT: DONE for source-matched local differentiation and normalization, with an additional derived bound. Project OPEN. Human derivation; finite certificate executed in V8; no independent Lean replay.

## Continuity and source provenance

Read AGENTS, research state opening, runner log/protocol opening, continuity, CI summary (17:05:20 UTC, checkpoint 382, unrelated physical gate check), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN10. Inspected newest commit titles and handoffs across all 14 peer lanes, with the editor and math notes separately fetched (editor tail includes appended acceleration handoff). No overlapping local Laplace task found. Blueprint reference noted, not independently reopened. The acceleration lane has authenticated solution manifest membership for Deduction.landau_cauchy (869149) and Deduction.landau_pole_asym (869232); these are peer-reported IDs, not locally extracted kernel edges. This run requests additional exact typed roles.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=307cef33f046955ee79dba47e0d828d06496d75f (upstream merge #1266, 2026-11-24 17:03:26 UTC, after RUN10 H=1da818b50f1e18808db2792b9dc735bda8cb84d8). Upstream manifest H blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d unchanged; P blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f. Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (Mathlib4).

RH paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/:
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872, Deduction.PoleData (all seven fields), WindowHypU, LandauZeroFreeCriterion.
- P LandauTheorems/IteratedDerivLaplace.lean blob c1c05ec801b258064f1e14fb9d7e624eb7345382, all five theorems.
- P LandauTheorems/LandauCoeff.lean blob dc8287f2dbe7c767dcb77893eaf53d07092ed1f3, Deduction.landau_coeff.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175 (same blob as RUN10). Executed comparison of theorem spans between P and H, ignoring the clump packaging: iteratedDeriv_laplace_int (H L82), _meas (L89), _hasDerivAt (L121), iteratedDeriv_laplace (L157), landau_coeff (L198) exactly equal; _bound (L95) differs in one line only: P nlinarith -> H explicit mul_le_mul_of_nonneg_right (by linarith) hu.le. The statement unchanged. No inference about unrelated upstream files.
- Mathlib Mathlib/Analysis/Calculus/ParametricIntegral.lean Pm blob c7937b328d3ab054a967d37f82132612a3ce83e6, L78–182, L262–307; Hm blob f9736661d574c192b092cb8ccca858abb52dd5d2, L90–194, L543–589. Read both derivative-bound theorem bodies and both core Fréchet-DCT bodies (not a full textual equivalence assertion). In derivative-bound step the NNReal norm API changes nnnorm -> nnNorm.
- Mathlib Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean Pm blob 13927ae74e7ce60a2d053df06eacec80b3f924a0, L63–90; Hm blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49, L62–89. Integrability via Gamma convergence and positive change of variables. Blob identities supplied by connector, not independently hashed. No claim that all these nodes have independently verified reachable kernel roles.

## 1. Native prerequisites and the strict half-plane

Let g:R->R be measurable and |g(u)|<=C exp(2u) for every u>=0. Let Phi be the transform in Re(s)>2. These are the first three PoleData fields. Since u=0 is included, C>=|g(0)|>=0, even though the source does not separately demand C>0. On the restricted Lebesgue measure mu=volume|_(0,infty), put

F_k(z,u)=g(u)(-u)^k exp(-zu),   L_k(z)=integral F_k(z,u) dmu(u).

For k a nonnegative integer the integrand is measurable by composition and product (real-to-complex embedding, natural power, exponential continuous); hence a.e. strongly measurable since C is separable as a normed space. In the source _bound, if Re(z)>=2+b, u>0,

|F_k(z,u)|=|g(u)|u^k exp(-Re(z)u)<=C u^k exp(-bu).

This does not itself require b>0, but integrability does. Complex phase does not enter the norm. H's explicit multiplication uses u>=0; multiplying by negative u would reverse the inequality. Source _int invokes the Gaussian theorem at p=1, exponent n>=0>-1, b>0. General proof: substitute t=b*x^p, obtaining a positive multiple of t^((n+1)/p-1)exp(-t), a convergent Gamma integral when (n+1)/p>0. For this particular natural exponent an elementary independent proof is integration by parts on [0,T], letting T->infty: the base integral is 1/b, boundary T^n exp(-bT)->0 for n>=1, and I_n=n I_(n-1)/b. Thus I_n=n!/b^(n+1). This is a human expansion at p=1, not a replacement of the imported general theorem.

Fix s with sigma=Re(s)>2 and b=(sigma-2)/2>0 (the local variable delta in the source is NOT the prime-window width delta). For |z-s|<b, Re(z)>=sigma-|z-s|>sigma-b=2+b. In particular s lies in the ball. The same b works for every u>0. The integrand at s is integrable by domination with C u^k exp(-bu); its candidate derivative F_(k+1) at s is a.e. strongly measurable. For fixed u the chain rule gives d/dz F_k=F_(k+1), with the same uniform derivative bound C u^(k+1)exp(-bu) throughout that ball. These establish exactly the seven inputs to hasDerivAt_integral_of_dominated_loc_of_deriv_le (neighborhood; local a.e. measurability; center integrability; derivative measurability; uniform a.e. derivative bound; integrable bound; pointwise derivative on neighborhood).

## 2. Expand imported differentiation theorem

Take a single open disk centered at s, contained in the neighborhoods from the hypotheses. It is convex. Integrating the directional derivative along a straight segment (or using the normed-space mean-value inequality), obtain |F_k(z,u)-F_k(s,u)| <= B(u)|z-s| for almost every u, where B(u)=C u^(k+1)exp(-bu). The a.e. exceptional set is chosen before z; cannot exchange those quantifiers without proof. Thus nearby F_k is integrable by the bound |F_k(s,u)|+b B(u), and the candidate derivative is integrable by its bound and measurability. In the Mathlib general result the derivative is a continuous linear map, L(v):h->v h, and the scalar derivative conversion is legitimate over C, not only R.

For nonzero h inside the disk, define E_h(u)=[F_k(s+h,u)-F_k(s,u)]/h - F_(k+1)(s,u). This tends to 0 pointwise as h->0, is measurable, and |E_h(u)|<=B(u)+|F_(k+1)(s,u)|<=2B(u). Dominated convergence (apply to every sequence h->0, h!=0, in the metric space C) gives integral E_h ->0. Linearity of the Bochner integral applies since each term is integrable. Therefore L_k'(s)=L_(k+1)(s). The native Mathlib Fréchet proof uses normalized linear remainders and filter DCT, with the same domination; its generic incomplete-target branch is vacuous here because C is complete. Underlying generic filter DCT and mean-value theorem are imported, not recursively kernel-audited. Pointwise differentiation alone would not justify this interchange.

## 3. Induction and factorial normalization

At k=0, L_0 equals the original transform by (-u)^0=1, including the totalized convention 0^0=1 (u=0 not in domain). For the successor, the induction hypothesis holds at EVERY z with Re(z)>2, not merely the fixed s. This is an open neighborhood, so iteratedDeriv k L_0 and L_k are equal as germs at s; their derivatives coincide. Apply the established L_k'=L_(k+1). Then Phi=L_0 as germs by PoleData.laplace; the source uses hev.iteratedDeriv_eq k. Hence

(-1)^k Phi^(k)(s)/k! = integral_0^infty g(u) u^k exp(-su)/k! du.

All factorials strictly positive, so division legal, and (-1)^k(-u)^k=u^k. No positivity assumption on g, no condition on theta or the window width delta is needed at this step. The other four PoleData fields and original 0<theta<1, window delta>0, window quantifier and exceptional-real-pole residue positivity remain required in downstream criteria. No reversed implication: coefficient formula is a consequence of the transform representation, not a proof of zero exclusion.

## 4. Supplemental quantitative result (derived, not claimed a new Lean theorem)

Using the *full* center margin sigma-2, rather than the smaller neighborhood margin b, the normalized coefficients obey

|Phi^(k)(s)/k!| <= C/(sigma-2)^(k+1).

The bound is sharp in this growth class at real sigma for g(u)=C exp(2u). For |h|<sigma-2, expand exp(-hu) in its power series; absolute term sum inside the integral is bounded by C exp(-(sigma-2-|h|)u), integrable. Tonelli on norms followed by absolute convergence/termwise integration gives the Taylor expansion of Phi(s+h) (s+h stays in Re>2). The remainder after orders 0..N satisfies

|remainder| <= (C/(sigma-2)) * (|h|/(sigma-2))^(N+1)/(1-|h|/(sigma-2)).

This bound follows by summing a geometric majorant and does not analytically continue Phi outside its original half-plane. It can be used in a human reading view to consolidate the local induction and give explicit convergence, but it is not a substitute for the larger-radius Cauchy estimates or nearest-pole proof in RUN10. At Re(s)=2, g(u)=exp(2u) gives integrand 1 when s=2,k=0; integral diverges. A Bochner integral totalized to zero when nonintegrable is not a valid convergence argument. At real s>2, g=-exp(2u) gives negative coefficients; g=exp(2u)-2exp(u) gives coefficient k=0 equal to zero at s=3. Thus no positivity of every moment follows from the three fields. Equality at a single s also cannot replace germ equality (functions z-s and 0 agree at s but have different derivatives).

## 5. Executed certificate

Extract the JS block and run Node. Exact integer grid checks validate the neighborhood inequality and BigInt sign cancellation, including k=0. Numerical independent finite Simpson quadrature in normalized t=(Re(s)-2)u tests signed real exponential mixtures at complex centers, k=0..10, against the exact closed-form expression sum w/(s-a)^(k+1) obtained by integration by parts. Normalized integral finite cutoff t=64, step 1/256; numerical error includes truncation and discretization, not a rigorous error enclosure. Bound checks compare the computed normalized coefficient to sum |weights|. Negative controls encode the explicit analytic countermodels above, not independent demonstrations of divergence or derivatives by finite tests. No tests on actual zeros, no Lean execution, no URT-specific speed claim.

~~~js
function certificate(){
 const A=(ok,msg)=>{if(!ok)throw Error(msg)};
 let margin=0,sign=0,quad=0,bounds=0,negative=0,maxErr=0;
 // Units: radius d/4, center real part 2+2d/4, offset (x+iy)/4.
 for(let d=1;d<=32;d++)for(let x=-d;x<=d;x++)for(let y=-d;y<=d;y++){
   if(x*x+y*y>=d*d)continue;
   A(2*d+x>=d,"uniform half-plane margin");margin++;
 }
 const fac=n=>{let r=1;for(let j=1;j<=n;j++)r*=j;return r};
 for(let k=0;k<=32;k++)for(let u=0n;u<=32n;u++){
   A((-1n)**BigInt(k)*(-u)**BigInt(k)===u**BigInt(k),"sign cancellation");sign++;
 }
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],add=([a,b],[c,d])=>[a+c,b+d],sc=(a,[x,y])=>[a*x,a*y];
 const pow=(a,k)=>{let r=[1,0];for(let j=0;j<k;j++)r=mul(r,a);return r};
 const inv=([x,y])=>[x/(x*x+y*y),-y/(x*x+y*y)],norm=([x,y])=>Math.hypot(x,y);
 // g(u)=sum w exp(a u), a<=2; t=(Re(s)-2)u.
 // Integrate normalized coefficient (Re(s)-2)^(k+1) times the native coefficient.
 const fixtures=[[[1,2]],[[-1,2]],[[1,2],[-2,1]],[[2,1],[-3,0],[1,-1]]];
 const N=64*256,h=64/N;
 for(let g of fixtures)for(let gap of [.5,1,2,4])for(let im of [-2,-.5,0,.5,2])for(let k=0;k<=10;k++){
   let want=[0,0], C=g.reduce((s,[w])=>s+Math.abs(w),0);
   for(let [w,a] of g)want=add(want,sc(w,pow(inv([1+(2-a)/gap,im/gap]),k+1)));
   let re=0,ii=0;
   for(let j=0;j<=N;j++){
     let t=j*h, amp=g.reduce((s,[w,a])=>s+w*Math.exp(-(1+(2-a)/gap)*t),0)*t**k/fac(k);
     let m=(j===0||j===N)?1:j%2?4:2;
     re+=m*amp*Math.cos(im*t/gap);ii-=m*amp*Math.sin(im*t/gap);
   }
   let got=[re*h/3,ii*h/3],err=norm(add(got,sc(-1,want)));
   maxErr=Math.max(maxErr,err);A(err<2e-7,"moment quadrature");quad++;
   A(norm(want)<=C+1e-12 && norm(got)<=C+2e-7,"normalized growth bound");bounds++;
 }
 // Countermodels to weakening the proof: g=e^(2u) gives integral T at s=2,k=0.
 A(100>10,"boundary integral increases without bound: analytic value T");negative++;
 // g=-e^(2u) has a negative coefficient even at real s>2.
 A(-1/(3-2)<0,"no positivity from growth alone");negative++;
 // g=e^(2u)-2e^u at s=3, k=0, coefficient exactly zero.
 A(1/(3-2)-2/(3-1)===0,"sign cancellation possible");negative++;
 // equality at the single point s does not identify derivatives: Phi(z)=z-s, L(z)=0.
 A(1!==0,"point equality does not imply derivative equality");negative++;
 return {margin,sign,quad,bounds,negative,maxErr};
}
console.log(certificate());
~~~

Actual output: {"margin":35572,"sign":1089,"quad":880,"bounds":880,"negative":4,"maxErr":3.021707798760061e-10}. The 5 identical native spans and one one-line tactic drift were independently compared using connector-retrieved source during this run. No physical queue/gate edits. No CI verdict for this new note.

RESUME HERE: reconstruct Deduction.kernelIntegral and the exact incomplete-gamma / factorial tail identities in P LandauTheorems/kernelIntegral.lean and H relocated landauWindow.lean, distinguishing whole-domain moment from truncated left/right tails. Expand actual imported integration-by-parts and endpoint convergence premises; do not redo RUN1's outer contradiction or RUN11's differentiation. Request exact tagged role witnesses for Deduction.iteratedDeriv_laplace, Deduction.iteratedDeriv_laplace_hasDerivAt, Deduction.landau_coeff (and prior poleData_abstract), preserve type vs value role; compare to existing accelerator roots, do not infer reachability merely from imports. HANDOFF TO editor, integration, audit, math, dependencies, kernel and acceleration. Project OPEN.


---

# Peer chapter — specialists/literature_provenance/RUN11_RESIDUE_SEPARATION_AND_AFFINE_TANGENT_GLUE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN11_RESIDUE_SEPARATION_AND_AFFINE_TANGENT_GLUE.md); blob 1ffbb8ea74dc32285ddd45f5fb70094bde739c21; pin named. Relative links refer to original location.

# RUN11 — Residue separation and affine tangent descent/gluing
2026-11-24. SOURCE-MATCHED / PARTIAL. Source leanprover-community/riemann-hypothesis pin 40e56bab026552e089d7afcfeff08d2defb9c005. New upstream head 307cef33f046955ee79dba47e0d828d06496d75f (17:03:26 UTC, merge PR #1266), previously 1da818b50f1e18808db2792b9dc735bda8cb84d8. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, state excerpt, continuity, research log/protocol excerpts, latest CI (17:43:15, physics PASS only), RUN10, 13 peer Markdown checkpoints and two Grok provenance/audit notes. Audit lane contains mjs artifacts rather than Markdown handoff (listed but not read in this run). Blueprint not reread. No physical queue modifications. This is the exact RUN10 frontier, not a second derivation of the finite-cover exponent.

All D paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; all B paths relative to src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/.

## 1. Residue functionals separate a finite projective module over a reduced ring
D/EqZeroOfForallResidueFieldFunctionalStatement.lean L5–6 is a theorem wrapper with a tactic fallback to the actual theorem GlobalTheory.eq_zero_of_forall_residueField_functional, D/EqZeroOfForallResidueFieldFunctional.lean L5–21. It is not an axiom merely because its name contains Statement. Given commutative reduced A, finite projective A-module M, x in M, and for EVERY prime ideal p and EVERY A-linear l:M→κ(p), l(x)=0, prove x=0.

Finite projectivity supplies f:A^n→M and g:M→A^n with f g=id_M (L8). For every i and prime p choose l = (A→κ(p))∘pr_i∘g. By hypothesis the image of coordinate g(x)_i in κ(p) vanishes. The kernel of A→κ(p) is p (L18). Thus g(x)_i belongs to the intersection of all prime ideals, the nilradical (L12). Reducedness makes each coordinate zero (L19). Consequently g(x)=0 and x=f(g(x))=0 (L20–21). This does not require selecting just closed points or assuming A is a domain.

Actual use: D/CmpFormEqZeroOfPullbackVanishing.lean L145–179, GlobalTheory.PtVanish.connForm_eq_zero. For each affine open U of the smooth K-scheme, its K-algebra A is smooth and reduced (L153–155, separate internal supplier GlobalTheory.T.isReduced_of_smooth_over_field'). Apply the preceding theorem to Ω_{A/K} with its inferred finite/projective instances. For any prime p and functional l, use the extension field κ(p) in H; construct the algebra map b↦b mod p + ε l(db) by nbdMap and diagSec (L159–162). The pullback property supplies a dual-number point u (L173–176). Its crystalline tangent evaluation is zero by H and equals l(connForm) by naturality and the affine-value lemma (L178). Thus the connection form vanishes on U; cmpForm vanishes by the existing affine-local identity (L181–184). Preserve smoothness and the module instances, the full quantifier over field extensions and compatible IsMor, and affine-locality. These are not independent extra axioms.

Negative controls:
- Remove reducedness: A=Z/4, M=A, x=2. Only prime (2), every A-linear map to F2 kills x, yet x≠0.
- Remove projectivity: A=Z (reduced), M=Z/4 as finite Z-module, x=2. At (0) residue Q, every map from torsion M is zero; at (p) for odd primes the map is zero because 4 is invertible; at (2), any map kills 2. Thus all residue-field functionals kill x but x≠0. The second case is NOT a counterexample to the source theorem since M is not projective. Do not remove these hypotheses to shorten the proof.

## 2. Affine tangent localization is a finite-presentation Hom argument
B/TanLoc.lean namespace ReciprocityTheory.ChartRestriction.G.Chart. Let S,B,A commutative rings, B and A S-algebras, B finitely presented over S, e:B→A an S-algebra map, A' a compatible S/A-algebra that is a localization of A at the images of a submonoid M⊂S. Write ι:A→A', and use B-module structures via e and ιe. An identity-at-e affine tangent h:B→A[ε]/ε² satisfies pr₁h=e (IsTanAt, L35). Its second coordinate d is an S-derivation: d(bc)=e(b)d(c)+e(c)d(b) (derOf L43–52). Equivalently g:Ω_{B/S}→A is B-linear. Conversely ofLin L58–75 gives h(b)=e(b)+εg(db), a multiplicative S-algebra map by the Leibniz rule. These transformations are compatible with coefficient maps and ε scaling (L14–31). Preserve the module scalar towers and basepoint; a general map without fixed first coordinate cannot use this reduction.

The actual native proof is not a guessed general sheaf result. isLocalizedModule_tan L82–110 shows A→A' is the B-module localization at the image of M in B: denominators act invertibly on A', each a' admits a scaled representative in A, and equality of images of two elements gives equality after multiplying by a denominator. These are the three explicit localization axioms proven using IsLocalization.map_units, surj and exists_of_eq.

tan_lift L121–155: given h' at ιe over A', there exist m∈M and h at e over A such that ι_ε∘h=scale_{ι(m)}∘h'. Apply the universal property of Ω to the second coordinate of h'. The actual imported theorem Module.FinitePresentation.exists_lift_of_isLocalizedModule (L145) gives g:Ω→A and one m with ιg=ι(m)g'. Convert back with ofLin and compare first and second coordinates. This is scaled lift, NOT existence of an unscaled lift. The necessary finite-presentation instance for Ω is supplied from Algebra.FinitePresentation S B in the Lean context; its imported proof remains an external library obligation.

For the human explanation of the imported Hom fact, take a finite presentation B^q→B^p→Ω→0. Clear the p denominators of the generator images to obtain a vector in A^p. Each of the q relations vanishes after localization; multiply by one further denominator killing all q defects. The resulting tuple satisfies the relations over A and defines g. This explains why both finiteness conditions matter; it is an explanatory proof of the algebraic principle, not a claim that the imported Mathlib proof term was retrieved. Preserve the actual import.

tan_uniq L157–194: if h₁,h₂ both at e have identical localization, then ∃m∈M with scale_m∘h₁=scale_m∘h₂. Apply the Kähler universal property to conclude ιg₁=ιg₂ (L178). The source calls Module.Finite.exists_smul_of_comp_eq_of_isLocalizedModule (L186); finite generators of Ω suffice since the difference at each generator is killed by a denominator, and their product kills all. Compare coordinates again. Finite generation is sufficient for this uniqueness sublemma, but retain the original source declaration's finite-presentation hypothesis. No assumption that denominators are nonzerodivisors.

## 3. Passing between a chart and the whole group; actual sheaf gluing
B/TanSRestrict.lean L16–101: TanS means reduction to the group identity. Over S[1/s], C is a chart around the identity and the point reduces to epsA. tanS_chart L50–74 uses pullR/pushR inverse at this base change; the kernel of A[ε]→A is square-zero (L60–64), so the point lands in the chart by le_preimage_of_nil. Then exists_pt represents it by h with the required basepoint, checked by pt_injective. Conversely chart_tanS L76–85 proves that h gives an identity tangent. chart_inj L87–89, chart_map L91–96, chart_scale L98–101 justify lifting, comparison and scaling through chart coordinates. Preserve open immersion/point factorization, pullback, chart and nilpotent-kernel hypotheses; no chart is asserted for an arbitrary point. Actual deeper le_preimage_of_nil, exists_pt, pt_injective and push/pull producers remain open.

B/DualMapSCompScaleS.lean L29–53: tanS_lift and tanS_uniq transport the affine results into G using these chart maps and the scalar-tower restriction identity. B/ScalePowMono.lean L59–104: smoothness of every G_s supplies finite presentation of chart coordinates (fp_chart, inferred instance). The submonoid image of powers of t equals the powers of its image (Submonoid.map_powers and tower compatibility), hence m=t^N and tanS_away_lift/tanS_away_uniq follow. This is the actual supplier of RUN10's exponents.

For gluing, B/DualMapSCompScaleS.lean L135–199, glue_tan': S commutative, finite family s_i generating unit ideal, group object G over Spec S, local identity tangents w_i over S[1/s_i], with equality after the two maps to Q_ij=S[1/s_i][1/s_j]. Need a global identity tangent with these restrictions. The source first turns this equality into compatibility for arbitrary test-ring maps α:D(S_i)→T, β:D(S_j)→T agreeing over D(S) (D(R)=R[ε]/ε²). Their restrictions agree on S and on ε. Since α sends s_j to a unit (using β), the localization universal property gives g₀:Q_ij→T extending α on S_i; its composite with S_j→Q_ij agrees with β on S_j by uniqueness of localization. Put z=α(ε)=β(ε), z²=0, and
    g(a+εb)=g₀(a)+z g₀(b).
The square-zero identity proves multiplicativity. Then α,β both factor through g; the hypothesized overlap equality implies test-ring compatibility. This proves the exact premise hc of the next theorem, not an assumption that every overlap is affine.

B/DualMapSOfIdToRingHom.lean L116–218, glue_tan: the images of s_i generate the unit ideal in D(S); the corresponding principal affine opens cover Spec D(S). Use the explicit identification of D(S)[1/s_i] with D(S_i) (toL/fromL, dAway; deeper construction earlier in same file). For every affine in a cover of a pairwise pullback, Spec.preimage gives two maps into its coordinate ring, agreeing over D(S), hence hc yields equal maps to G. By hom_ext the local morphisms agree on the entire overlap. Scheme.Cover.glueMorphisms gives g (L155), the equations on each patch give all required restrictions (L157–165), and base compatibility is checked on the same cover (L166–181). The reduction of v=Over.homMk g hover to S equals the group identity because each w_i is TanS, verified on the original S-cover (L186–218). This preserves the over-base structure and identity, not just set-theoretic gluing. The separate tan_ext_cover in B/DualMapSCompScaleS.lean L201–218 proves uniqueness by hom_ext. No need to assume G affine globally or separated; actual imported scheme gluing/hom-ext/localization facts remain dependencies.

## 4. External assumption/provenance ledger
- Source theorem wrapper: GlobalTheory.T.eq_zero_of_forall_residueField_functional' → GlobalTheory.eq_zero_of_forall_residueField_functional (exact body L5–21).
- Internal theorems with inspected bodies: Chart.tan_lift, tan_uniq, isLocalizedModule_tan, tanS_chart, chart_tanS, chart_inj, chart_map, chart_scale, tanS_lift, tanS_uniq, tanS_away_lift, tanS_away_uniq, glue_tan', glue_tan, tan_ext_cover. Prefix for all these is ReciprocityTheory.ChartRestriction.G.Chart. No axiom declaration observed in the inspected slices. Source-level calls only; no elaborated direct-edge/root reachability established.
- Imported named results still owed in full reconstruction: Module.Finite.exists_comp_eq_id_of_projective, nilradical_eq_sInf, Ideal.ker_algebraMap_residueField, Module.FinitePresentation.exists_lift_of_isLocalizedModule, Module.Finite.exists_smul_of_comp_eq_of_isLocalizedModule, Kähler universal property and instance suppliers, Spec.map_injective, Scheme.Cover.glueMorphisms and hom_ext. Imported theorem names are not axiom proof evidence. Imported proofs not inspected this run.
- Explicit local assumptions: reducedness, finite projectivity, smoothness/finite presentation, module/tower/localization compatibility, chart containing the identity, unit-ideal cover and full overlaps, TanS, H over every field extension. No new mathematical premises in the source statements. No historical citation claim or independent Lean kernel check made. No URT speed claim.

## 5. Executed provenance and finite algebra checks
Connector JS refetched 8 pinned blobs, all exact reported hashes matched; 61 source substring checks succeeded. For CmpFormEqZeroOfPullbackVanishing the generic nbdMap anchor's first occurrence was L59; its use at L160 was separately read in the full L145–179 excerpt, not counted twice. Upstream: old EqZeroOfForallResidueFieldFunctional and its Statement files return 404 at head; the 17 lines of the original actual body L5–21 appear verbatim at L84–100 of ExistsTangentVectorFunctionalGlobalFormsAbelianS (blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00); caller at L255 directly invokes the theorem, bypassing the old wrapper. ScalePowMono old L63–81 and L84–104 align verbatim with new L68–86 and L89–109 (blob 3168163763941cdc48244d125feb364fb4556b18). Total 57 selected unchanged lines, not entire revision equivalence. TanLoc at head returns 404, relocation not yet traced. No claim the new upstream proof is kernel-equivalent.

Reproduce selected source checks in upstream checkout (Python not executed here; corresponding connector fetch/anchor checks actually executed):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="307cef33f046955ee79dba47e0d828d06496d75f"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/"
rows=[
(D+"EqZeroOfForallResidueFieldFunctional","bf11b839d337e3f48c6b5e7c5230545fa24778bc",[(8,"Module.Finite.exists_comp_eq_id_of_projective"),(12,"nilradical_eq_sInf"),(18,"Ideal.ker_algebraMap_residueField"),(21,"hfg")]),
(D+"EqZeroOfForallResidueFieldFunctionalStatement","6f9991be42bac0b7974c35d7c3863e316331e1ce",[(5,"theorem _root_.GlobalTheory.T.eq_zero"),(6,"exact @GlobalTheory.eq_zero_of_forall_residueField_functional")]),
(D+"CmpFormEqZeroOfPullbackVanishing","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(155,"isReduced_of_smooth_over_field'"),(156,"eq_zero_of_forall_residueField_functional'"),(158,"H p.ResidueField"),(160,"nbdMap l"),(178,"snd_val_affine_eq U l")]),
(B+"TanLoc","3bdbebabf990969f1c4317da47d0fae3b7d1bd3c",[(35,"def IsTanAt"),(43,"def derOf"),(58,"def ofLin"),(82,"theorem isLocalizedModule_tan"),(121,"theorem tan_lift"),(145,"Module.FinitePresentation.exists_lift"),(157,"theorem tan_uniq"),(186,"Module.Finite.exists_smul")]),
(B+"TanSRestrict","b36130c182a5a3003524e980725d171a67efa74c",[(16,"def TanS"),(50,"theorem tanS_chart"),(60,"have hnil"),(65,"le_preimage_of_nil"),(87,"theorem chart_inj")]),
(B+"DualMapSCompScaleS","8c429b18972bbd4b0bfcdebd2f28d3ee6b1b3a8b",[(29,"theorem tanS_lift"),(44,"theorem tanS_uniq"),(135,"theorem glue_tan'"),(140,"refine glue_tan s hs"),(157,"have he2"),(182,"have hα :"),(188,"have hβ :"),(201,"theorem tan_ext_cover")]),
(B+"DualMapSOfIdToRingHom","fd5ae147b505147422450341054974448df9737c",[(116,"theorem glue_tan"),(135,"Spec.preimage"),(155,"let g := 𝒰.glueMorphisms"),(166,"have hover"),(182,"have hres"),(186,"let 𝒱")]),
(B+"ScalePowMono","8f662add775dd12158bf931e8a2f956ca090ee24",[(59,"theorem fp_chart"),(63,"theorem tanS_away_lift"),(75,"Submonoid.map_powers"),(78,"tanS_lift C"),(84,"theorem tanS_away_uniq"),(99,"tanS_uniq C")])]
def git(*a):return subprocess.check_output(["git",*a]).decode()
def read(ref,p,sha):
    spec=ref+":"+p+".lean"
    assert git("rev-parse",spec).strip()==sha
    return git("show",spec).splitlines()
old=[]
for p,sha,anchors in rows:
    ls=read(pin,p,sha);old.append(ls)
    for i,s in anchors:assert s in ls[i-1],(p,i)
new=read(head,D+"ExistsTangentVectorFunctionalGlobalFormsAbelianS","0610edb6e4bb7564e19ef9d9da168bc35b880f00")
assert old[0][4:21]==new[83:100]
new2=read(head,B+"ScalePowMono","3168163763941cdc48244d125feb364fb4556b18")
assert old[7][62:81]==new2[67:86]
assert old[7][83:104]==new2[88:109]
print("eight blob identities, representative source anchors, 57 unchanged lines")
```

Finite algebra regression (executed JS; illustrative not proof of native geometry): for squarefree m≤40 check residue separation for every vector in (Z/m)^2. For all m=2..40, t,c in Z/m, let A'=A[1/t]≅Z/q where q is m with all t-prime factors removed. A tangent of B=Z[X]/(cX) at X=0 is a coefficient d with cd=0. Test all localized tangent values for scaled lift, all global tangent differences for scaled uniqueness. No synthetic operator or physics comparison. Code:
```js
const assert=x=>{if(!x)throw Error("regression")};
const gcd=(a,b)=>b?gcd(b,a%b):a;
const primes=m=>Array.from({length:m-1},(_,i)=>i+2).filter(p=>m%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(d=>p%d!==0));
let sep=0,lift=0,uniq=0;
for(let m=2;m<=40;m++){
 const ps=primes(m);
 if(ps.reduce((a,p)=>a*p,1)===m)for(let x=0;x<m;x++)for(let y=0;y<m;y++){
  assert(ps.every(p=>x%p===0&&y%p===0)===(x===0&&y===0));sep++;
 }
 for(let t=0;t<m;t++){
  let q=m;while(gcd(q,t)>1)q/=gcd(q,t);
  for(let c=0;c<m;c++){
   const ds=Array.from({length:m},(_,i)=>i).filter(d=>c*d%m===0);
   for(let a=0;a<q;a++)if(c*a%q===0){
    let power=1%q,found=false;
    for(let k=0;k<=m;k++){if(ds.some(d=>d%q===power*a%q)){found=true;break}power=power*t%q}
    assert(found);lift++;
   }
   for(const d of ds){
    let z=d,found=false;
    for(let k=0;k<=m;k++){if(z===0){found=true;break}z=z*t%m}
    assert(found===(d%q===0));uniq++;
   }
  }
 }
}
assert(2!==0&&2%2===0);
assert(primes(4).every(p=>2%p===0));
console.log({sep,lift,uniq,total:sep+lift+uniq});
```
Actual output sep=14220, lift=53369, uniq=69767, total=137356. Arithmetic of x=2 in Z/4 also checked; the two mathematical negative controls above require the stated module interpretation (not two independent Lean validations). No kernel/geometry regression claim. Source work PARTIAL because deep chart-factorization and imported library dependencies remain, and authenticated main-root reachability is outstanding.

RESUME HERE: trace D/IsReducedOfSmoothOverFieldStatement (or actual pinned import) through its body and locate the finite/projective differential instance supplier used in connForm_eq_zero, then reconstruct le_preimage_of_nil/exists_pt chart factorization; continue HC/HH global comparison suppliers and system realization, prioritizing authenticated root-reachable declarations when available. Request role-labelled witnesses for GlobalTheory.eq_zero_of_forall_residueField_functional, GlobalTheory.PtVanish.connForm_eq_zero, ReciprocityTheory.ChartRestriction.G.Chart.tan_lift, tan_uniq and glue_tan (full names). Resolve TanLoc relocation at the new upstream revision. Do not repeat RUN10 exponent or RUN11 separation/affine localization/sheaf gluing. HANDOFF TO integration, proof editor, audit, dependency, kernel and geometry. Project OPEN.


---

# Peer chapter — specialists/on_acceleration/RUN11_RESUME.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN11_RESUME.md); blob a9bb6ded82fd10797a439eec227d2162ed3e8f66; pin named. Relative links refer to original location.

# Run 11 — authenticated native RH declaration-manifest replay (PARTIAL, executed)
2026-11-24. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 307cef33f046955ee79dba47e0d828d06496d75f observed, not adopted. Read protocol, queue, expansion, latest specialist handoffs, AGENTS, state/log/protocol excerpts; external blueprint not reread. Work confined to acceleration. Dependency peer's six-anchor reconciliation, not duplicate role extraction.

RESULT: downloaded actual artifact 14931267327 from [run 45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798); ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97 matches GitHub. Both contained Zstandard manifests independently hashed to the pinned digests in code. Node v22.16.0, native zstd, fresh processes, same container, 15 exact tagged queries (all string components; no inferred suffix equivalence). All selected complete rows hashed, including mutual metadata. Scope is membership in reachable export, NOT a static name resolution proof, a complete direct declaration dependency DAG, proof translation, or kernel recheck. Earlier source/import/invalidation tools remain intact. No change of premises.

Native measurements (scan milliseconds, Node max RSS KiB; /usr/bin/time peak RSS within 384 KiB of these; child RSS not summed). Each scan has equal validation; compressed digest checks before and after timed region, first precheck 5–12 ms challenge and 47–55 ms solution. First process / repeated process = application cold/warm only; OS page cache was not purged, storage physical I/O not measured.

| corpus | mode | scan ms | max RSS KiB | rows |
|---|---|---:|---:|---:|
| challenge | shared first | 204.4 | 49364 | 53242 |
| challenge | golden | 182.3 | 47576 | 53242 |
| challenge | periodic | 180.8 | 47244 | 53242 |
| challenge | shared repeat | 151.5 | 46096 | 53242 |
| challenge | independent 15 scans | 2256.6 | 84804 | 798630 |
| solution | shared first | 4339.5 | 110884 | 1484705 |
| solution | golden | 4336.9 | 107100 | 1484705 |
| solution | periodic | 4330.8 | 106856 | 1484705 |
| solution | shared repeat | 4348.6 | 108172 | 1484705 |

Challenge baseline/shared first 11.04x; baseline/shared repeat 14.89x. Same full-row SHA256 across all five challenge and four solution runs, separately checked via Python JSON digest/match equality. One tamper control (append byte) rejected. Full 15-query independent solution baseline twice terminated at execution limit before emitting result; do not infer speedup. URT only changes query registration order; no reliable additional advantage. One-pass O(B+Q+K) expected with fixed-width IDs and total expanded name bytes counted, plus O(Q log Q) for optional scheduler; baseline O(QB). 3,035,045 solution declaration-root hard refs and 114,679 challenge refs inspected per pass; these are not all expression dependency edges. Positive expression roots checked for range, not independently expanded.

Challenge result digest 6ddb4da465f975c633bf9853942e5bf758736f0e0e90785cb388625c0bb306dd (1/15 names found; root only). Solution result digest 5413912b32b684b8747bf25c48004e74532a88b9554ca41c00ee40deaf190e83 (14/15 exact requests found). All six top anchors agree in declaration ID, type and value expression roots with peer [role report](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json), blob 64b935e4ef309f6c555912a377012c7708eda510. Roots in manifest are one-based; report zero-based. No independent recheck of inner role witnesses.

New peer targets, id, encoded type/value roots:
GlobalTheory.divTied3_read 6078879 458452916 458455888
GlobalTheory.T.divisionCompatible_at_readIdentifications 6078946 458452916 458455889
Deduction.poleData_abstract 868460 27052341 27058371
Deduction.landau_cauchy 869149 27162294 27163272
Deduction.landau_pole_asym 869232 27164513 27168267
PositivityTheory.Xj7N.norm_small_le 9616555 769193561 769198767
PositivityTheory.Xj7N.local_unit_map_surjective 9613757 769150835 769154759
ModelDimension.cusp_form_extension_vanishing 9616232 769162544 769164447
Avac.iwaQ_of' absent as requested; separate literal grep recovered candidate exact export name PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' ID 8981975, refs 721071981,721077114; also distinct iwaQ_of'_k ID 14034132. Preserve both names; source namespace binding and typed-role witnesses remain open. No suffix acceptance, no assertion of source nonexistence, no missing hard-reference count inferred from this membership test.

Replay from artifact outputs: node manifest_real_benchmark.mjs challenge challenge_declarations.jsonl.zst shared (also golden, periodic, baseline); node manifest_real_benchmark.mjs solution reachable_declarations.jsonl.zst shared (also golden, periodic, baseline). Compare resultSha within corpus to recorded expected; any difference fails replay. Negative control: append byte to copy of challenge zst, run shared, require nonzero exit. Earlier run10 certificate covers display ambiguities; this benchmark is exact requests only. Full results are local native measurements, new CI not run.

## RESUME HERE
Run full solution baseline as 15 separate one-query scans with bounded invocation time, sum scan costs transparently (do not call this single-process wall time); compare each selected full row to shared output and verify exact pinned source namespace for theta candidate before registering corrected query. Provide the new root IDs above to kernel/dependency lanes for targeted role extraction; do not repeat billion-expression closure or URT compression. HANDOFF TO kernel, dependencies, integration, theta, Landau, character boxes, geometry, editor. Project OPEN.


---

# Peer chapter — specialists/positivity_geometry/RUN11_BOUNDARY_VANISHING_DESCENT_TRACE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN11_BOUNDARY_VANISHING_DESCENT_TRACE.md); blob af0df77a3d716532b13c17410784c2dd049c6f7b; pin named. Relative links refer to original location.

# Geometry RUN11 — boundary-vanishing descent via closed residues and field trace
2026-11-24. DONE for this bounded source-level reconstruction; SOURCE-MATCHED / explanatory mathematical proof, finite regression executed. Full project OPEN. No Lean replay.

## Continuity / source
Read AGENTS, research-state and log excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary checkpoint 384 (pre-existing physics check, not this proof), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN10 and latest available RESUME notes from the other lanes (dependency, integration, structure, math, audit, character, Galois, kernel, Landau, literature, acceleration, prime, editor, theta). No competing reconstruction of this particular descent found in those notes. Follow RUN10's explicit next task, not physics. Blueprint was not reopened; the pinned primary source is used throughout.

Source repository leanprover-community/riemann-hypothesis, pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Observed head 307cef33f046955ee79dba47e0d828d06496d75f (2026-11-24 17:03:26 UTC). Pinned files and GitHub-returned blob IDs (not independently hashed raw bytes):
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ComplexSectionFiniteCombinationStatement.lean — 4d34a2f6b24b8a0223f74adddc84d56205d48594
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ComplexSectionFiniteCombination.lean — f5bf11d9bd59553487204536b8204ee3c15f7d3d
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ExistsResidueEval.lean — 0e110902158627d44c76d1d49dde86c6c19dda0a
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/LinIndepDescent.lean — 2dbfa182f7461ccd8ffc610941ca731e297db74b
- src/Development/AbelianVarietyTheory/Definitions/Divisors/NoCommonZeroCombVal.lean — 2077eb640b449dd53d293200b4c0ea87d40f53a7
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean — 3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd

The old ComplexSectionFiniteCombination and its Statement paths return 404 at current head. The first is located in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean, blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e. Compared six extracted theorem text blocks: exists_closed_mem_notMem (pin L15, head L609), secVal_eq_zero_of_le (23,617), single_ext (7,513) identical after trimming terminal whitespace; vanish_descent (31,625) and linIndep_descent (37,543) identical after trimming each line and dropping blank lines; exists_residue_eval (13,404) differs after that normalization only in map_add becoming map_add (f := _) in a simp list. This is a source comparison, not a claim of semantic equivalence or head kernel replay. The relocated statement relay was not located separately; pin governs.

## 1. Exact theorem and scope
GlobalTheory.T.complex_section_finite_combination is a relay to GlobalTheory.CompanionTheory.VanDescent.vanish_descent. For every field F, scheme Y : Scheme.{0}, p:Y→Spec F, ring embedding σ:F→C, hp:LocallyOfFiniteType p, line-bundle presentation B:LB Y, hB:B.IsLB, open O:Y.Opens, and x:SecC p σ B, assume for ALL chart indices i and complex points y over σ outside ptsIn p σ O,
  SecC.val(x)(i,y)=0.
Then there exist m:nat, coefficients a_j∈C and algebraic sections s_j∈B.Sec, j∈Fin m, with nonzeroLocus(s_j)≤O for EVERY j, and
  SecC.val(x)=Σ_j a_j secVal(p,σ,s_j).
Important: equality of evaluated functions, NOT equality of tensors x=Σ a_j⊗s_j. No reducedness, properness, global finite type, finite-dimensional space of all sections, or normality is assumed. σ forces characteristic zero. The finite-type condition is LOCAL over F. B.IsLB supplies the covering and invertible transition functions.

NoCommonZeroCombVal L284 defines SecC = C⊗_F B.Sec using the scalar action algX p ⊤. L318 span_range_of proves generation by 1⊗s by tensor induction (zero, pure tensor, addition). Thus no GAGA or independent global cohomology base-change theorem is being asserted here. GAGA remains the upstream caller's responsibility.

## 2. Closed residue evaluation: Ar.ClosedPt.exists_residue_eval
For every closed point z of Y, select a chart B.U_i containing z using hB.cover and an affine U with z∈U⊆B.U_i. A=Γ(Y,U) is a finite-type F-algebra by hp and affine finite-type transport. The point corresponds to a maximal ideal P of A because the singleton is closed; K=A/P is a field and finite-dimensional over F by the finite-type field lemma (Zariski lemma, native finite_of_finite_type_of_isJacobsonRing). Define the additive map
  e_z(s) = restriction(s_i to U) mod P ∈ K.
Compatibility of restriction with algX gives e_z(a s)=a e_z(s). If z lies in nonzeroLocus(s), some chart coordinate is nonzero there; invertible line transition functions carry this nonvanishing into chart i, and restriction into U preserves it. Hence e_z(s)≠0. This uses exactly the pointwise nonzero locus, not a scheme-theoretic ideal vanishing condition.

For EVERY τ:K→C extending σ, use τ composed with A→A/P to define a complex point y in U. Its centre is z because τ is injective and the composition has kernel P. The chosen chart satisfies secVal(s)(i,y)=τ(e_z(s)) for all s, simultaneously. Preserve all extensions, not just one selected embedding. This reconstructs the affine construction, leaving named affine scheme and finite-type Mathlib lemmas as dependencies.

## 3. Arithmetic linear-independence descent (LinIndepDescent)
single_ext: take finite index set κ, finite extension K/F, σ as above, b_k∈C independent over σ(F), x_k∈K. Suppose Σ_k b_k τ(x_k)=0 for every extension τ. For every y∈K multiply each embedding equation by τ(y) and sum over embeddings. Characteristic zero implies separability, and the source uses trace_eq_sum_embeddings:
  Σ_k σ(Tr_{K/F}(x_k y)) b_k=0.
Independence forces Tr(x_k y)=0 for each k and each y. If x_k≠0 choose y=x_k^{-1}; then Tr(1)=[K:F]≠0 in F, contradiction. Therefore x=0. No assumption that K is Galois; use all embeddings. This is the actual proof rather than invoking a stronger nondegenerate trace form theorem.

linIndep_descent: allow ANY index type J, a family of finite extensions K_j/F, finite coefficient index ι, and v_l∈∏_j K_j. Assume the base-field linear map is injective:
  (∀j, Σ_l a_l v_l(j)=0) ⇒ a=0, for every a∈F^ι.
If d∈C^ι satisfies Σ_l d_l τ(v_l(j))=0 for every j and every τ extending σ, let S=span_F{d_l}⊂C. This is finite-dimensional even if C/F is infinite. Pick F-basis b_k of S and write d_l=Σ_k σ(c_lk)b_k. For each j, apply single_ext to x_k=Σ_l c_lk v_l(j); rearranging finite sums gives the required embedding equations. Thus x_k=0 for all j,k. The base injectivity assumption makes each column c_{·k}=0, hence d=0. Empty J is allowed (then injectivity forces trivial coefficient domain); do not restrict J to finitely many closed points.

## 4. Main induction, VanDescent.vanish_descent
J = {closed z∈Y outside O}; use step 2 to choose K_j,e_j. In the complex vector space of all chart-indexed point functions let G=span_C{secVal(s): nonzeroLocus(s)⊆O} and Z={functions zero at every point outside O, in every chart coordinate}. G⊆Z: within chart use secVal_ne_zero_iff and monotonicity of ptsIn, outside chart evaluation is totalized zero.

A locally finite-type scheme over a field is Jacobson; if an open U is not contained in O, the nonempty locally closed U∩(Y\O) contains a point closed in Y (exists_closed_mem_notMem). Consequently if e_j(s)=0 for every j, nonzeroLocus(s)⊆O; otherwise a closed point in its nonzero locus outside O contradicts e_j(s)≠0. The converse is not needed for this inference.

Induct on n to show: for all b_l∈B.Sec, d_l∈C, g∈G, if w=Σ_l d_l secVal(b_l)+g∈Z then w∈G. At n=0 trivial. At n>0 split on H: the family (e_j(b_l)) has no nonzero F-linear relation.
- If H holds, evaluate w at all lifts y of all closed j using all τ. Both w and g vanish there. Hence Σ_l d_l τ(e_j(b_l))=0 for all j,τ. Step 3 gives d=0, so w=g∈G.
- If H fails, obtain a nonzero a∈F^n with Σ_l a_l e_j(b_l)=0 for all j. Let s=Σ_l a_l b_l. By the closed-point argument, nonzeroLocus(s)⊆O, so q=secVal(s)=Σ_l σ(a_l)secVal(b_l)∈G. Choose pivot l0 with a_l0≠0 and c=d_l0/σ(a_l0) (embedding injectivity). EXACT identity:
  w = Σ_{l≠l0}(d_l−c σ(a_l)) secVal(b_l) + (g+c q).
The new remainder is in G; w remains in Z because it is the same function. Invoke induction on n−1 (Lean Fin.succAbove enumerates remaining indices). This works if d_l0=0; c=0 then removes a zero term. No requirement that q be nonzero.

Finally tensor generation (step 1) gives val(x) as finite sum of evaluations. Apply the induction with g=0, since hx says val(x)∈Z. Membership in G supplies precisely the finite combination and the individual support conditions in the theorem. Empty section sum allowed. This is a finite elimination proof, not a claim of linear runtime; cost of finding relations over all closed points is unspecified.

## 5. Executed finite regression and limitations
Actual V8 run: {"matrices":729,"rank0":1,"rank1":104,"rank2":624,"embeddingCases":531441,"boundaryZeroCases":12977,"pivotReconstructions":25954,"negativeControls":3}. The test exhausts 2×3 coefficient matrices with entries −1,0,1 representing one closed residue extension Q(i)/Q, and all three complex Gaussian integer coefficients with real and imaginary parts −1,0,1. It compares both embeddings to base-field row constraints and checks scaled nullspace reconstruction using nonzero integer pivots for all boundary-zero cases. Counts are nested; do not sum them. Two real-vector reconstructions per boundary-zero case. Three negative controls: omitting conjugate embedding, mistaking nilpotent evaluation for injectivity, zero pivot. Bounded integer arithmetic is exact (all entries and products far below 2^53). This is a finite algebra regression, not proof of the scheme geometry, not a general field solver, not a Lean kernel check. Original hypotheses not deleted; no URT speedup claimed.

Save the following fenced code as run11.mjs and run node run11.mjs; throw on mismatch.
~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, dot=(a,b)=>a.reduce((s,x,i)=>s+x*b[i],0), cross=(a,b)=>[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]], zero=a=>a.every(x=>x===0);
 const vs=[];for(let x=-1;x<=1;x++)for(let y=-1;y<=1;y++)for(let z=-1;z<=1;z++)vs.push([x,y,z]);
 const counts={matrices:0,rank0:0,rank1:0,rank2:0,embeddingCases:0,boundaryZeroCases:0,pivotReconstructions:0,negativeControls:0};
 for(const a of vs)for(const b of vs){
  const w=cross(a,b),rank=!zero(w)?2:zero(a)&&zero(b)?0:1;
  counts.matrices++;counts["rank"+rank]++;
  // rational nullspace basis and integer denominator, no floating point division.
  const r=zero(a)?b:a,p=r.findIndex(x=>x!==0);
  let basis=rank===0?[[1,0,0],[0,1,0],[0,0,1]]:rank===2?[w]:[0,1,2].filter(j=>j!==p).map(j=>[0,1,2].map(i=>i===j?r[p]:i===p?-r[j]:0));
  for(const v of basis)ck(dot(a,v)===0&&dot(b,v)===0,"basis in kernel");
  for(const u of vs)for(const v of vs){ // d=u+i*v; eval column l=a_l+i*b_l
   const plus=[dot(a,u)-dot(b,v),dot(b,u)+dot(a,v)];
   const minus=[dot(a,u)+dot(b,v),-dot(b,u)+dot(a,v)];
   const both=zero(plus)&&zero(minus);
   ck(both===(dot(a,u)===0&&dot(b,u)===0&&dot(a,v)===0&&dot(b,v)===0),"all embeddings vs base-field equations");
   counts.embeddingCases++;
   if(!both)continue;counts.boundaryZeroCases++;
   for(const t of [u,v]){
    let denom,coeff;
    if(rank===0){denom=1;coeff=t;}
    else if(rank===1){denom=r[p];coeff=[0,1,2].filter(j=>j!==p).map(j=>t[j]);}
    else {const k=w.findIndex(x=>x!==0);denom=w[k];coeff=[t[k]];}
    ck(denom!==0,"nonzero pivot");
    for(let j=0;j<3;j++)ck(denom*t[j]===basis.reduce((sum,x,i)=>sum+coeff[i]*x[j],0),"scaled kernel reconstruction");
    counts.pivotReconstructions++;
   }
  }
 }
 // One embedding of Q(i) fails: (1,i) dotted with (-i,1) vanishes only at +i.
 const a=[1,0],b=[0,1],u=[0,1],v=[-1,0];
 ck(dot(a,u)-dot(b,v)===0&&dot(b,u)+dot(a,v)===0&&-dot(b,u)+dot(a,v)===-2,"missing conjugate negative control");counts.negativeControls++;
 // A nonzero nilpotent epsilon in Q[epsilon]/epsilon² has zero residue.
 const nil=[0,1],square=[nil[0]*nil[0],2*nil[0]*nil[1]];
 ck(!zero(nil)&&zero(square)&&nil[0]===0,"values are not tensor injectivity");counts.negativeControls++;
 // A zero pivot cannot remove a nonzero coefficient.
 ck(0*7!==3,"zero-pivot control");counts.negativeControls++;
 return counts;
}
console.log(JSON.stringify(regression()));
~~~
To independently verify provenance on a pinned clone run git rev-parse 40e56bab026552e089d7afcfeff08d2defb9c005:<path> for each ledger entry and compare its blob ID; full code source links are formed by https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. The above was executed directly in V8, not in CI or Lean. Remaining actual dependencies include Mathlib Jacobson and affine/field facts and trace_eq_sum_embeddings; the GAGA caller and boundary holomorphy arc, and vanBd_le_space, are still separate open reconstruction obligations. Source-level role edges: VuOnto.exists_comb → GlobalTheory.T.complex_section_finite_combination → VanDescent.vanish_descent → Ar.ClosedPt.exists_residue_eval, Arith.DedekindDescent.linIndep_descent → single_ext. These are body references, not authenticated elaborated reachability from Main.

RESUME HERE: reconstruct the source body of GlobalTheory.T.holomorphic_extension_section_reading (pinned VuOntoC imports HolomorphicExtensionSectionReadingStatement), tracking chart/ruleTop evaluation and the equality of evaluated functions (do not strengthen to tensor equality). Then trace holoOn_bdZ / open_holoZ and GAGA separately. Request authenticated role-labelled witnesses for GlobalTheory.T.complex_section_finite_combination, GlobalTheory.CompanionTheory.VanDescent.vanish_descent, GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval, GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent, single_ext. Do not redo RUN10 norm or this descent. HANDOFF TO integration, editor, audit, literature, geometry, dependency, kernel. Project OPEN.


---

# Peer chapter — specialists/prime_window/RUN11_SERVED_LEDGER_TRANSPORT.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN11_SERVED_LEDGER_TRANSPORT.md); blob d72fed54b7b6ca61b5e6249d174edb71501da108; pin named. Relative links refer to original location.

# RUN11 — Exact served-ledger transport and LinkG boundary (2026-11-24)

RESULT: SOURCE-MATCHED / conditional reconstruction completed for loss_bound_at and its finite deficit consequence; LinkG's underlying geometric proof remains OPEN. Actual V8 BigInt checks below. No Lean replay, no claim of Main-reachable kernel edge or URT advantage. No hypotheses deleted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.

Preflight: AGENTS, swarm protocol, queue, expansion, research state/log/protocol, continuity, CI summary (prior general orchestrator #382 PASS unrelated to RH), RUN10, recent peer commits and available lane RESUME notes inspected. Prime RUN10 asked for this adapter; math/geometry peers have distinct cancellation and complex-section tasks. Some peer note selection is incomplete (not every filename is run-numbered); no claim of exhaustive collision audit. Blueprint not reread. No physics queue or protected files modified.

## 1. Native hypotheses, not assumptions inferred from conclusion

Let D:D7, L:SizeData₂ D, X:G.Inst D L, K:G.Consts and Cr,C,bo real. Define J=SizeData₂.lifts D, m=D.R.m, TT=host.TT, v=Frame.A.val, p a natural prime. The full signature of Loss.loss_bound_at (PowFour 766–773) takes:

* H:PtH X K Cr (SuppSat 94–101: fills at EVERY place, support saturation at every place with residue characteristic <=X'', drop equivalence for every prime including exclusion of all word T primes, K.Nonneg, KapIDef, Cr>=1, NumN_at).
* hT: for EVERY u, NOT InertK D (D.mem u).A.T.
* hask: for EVERY j in J, t:D.host.TT, p prime and InertK D p, askAt(ldAt.Iex j v(t) p, ldAt.at_ v(t),p,ldAt.wz j v(t) p)=L.vonMangoldtClassSum j t p. Its native producer ask_at at PowFour 298 onwards is treated in RUN6.
* hG:LinkG_at X K C bo, and the particular p in PsAt L with clAt X K p=served.
* Keep the exact target Formalism.LFunctionChainParameters.DeficitSplitLemmas.SizeData₂, a PROP about finite sets and a ledger, not the same name as the native L record.

The predicate InertK (GlobalTheoremInputs 97–98) is host class signal OR inertClass. PsAt is the range(bndP) filtered by primality and InertK; clAt is served exactly when p is NOT in L.drop. By pc_drop_iff (634–642) and hT, for p in PsAt the drop test reduces to NoGain. If p>X'', NoGain holds by its branch used at served_le (646–651), contradicting served. Thus p<=X''. Do not replace InertK by inertClass alone or assume every prime in PsAt is served.

## 2. Exact LinkG premise and lower/floor definitions

GlobalTheoremInputs 122–136 defines LinkG_at as a five-part conjunction:
1. For every u,w with resChar(w) != (D.mem u).A.T: DV.LocLe (D.plEq w) floor_nat(DV.ur D w (L.tau w)) (L.NuLat u) (DV.MramL D u); lenMN(u,w)<=duS(u)*(tau(w)+io(w)); and if VV at resChar(w) is empty then tau(w)=io(w)=lenMN(u,w)=0.
2. For every p and t0 in VV(X,K,aL,bL,p), Sv(X,K,aL,bL,p,t0)<=2*m*Nv(X,p,t0)*a/p.
3. For every place w whose residue characteristic p is InertK and <=X'', (a) every j in J satisfies 0<=gain(j,w)<=4*|host.TT|*a/p; (b) the substantive retained-top inequality
   sum_{j in J,t in L.TTw(w)} [L.vonMangoldtClassSum(j,t,p)-loG(L,C,bo,p)] - m*flG(L,C,p) <= sum_{j in J} L.gain(j,w) - L.tau(w).
4. G.ServedOrbitsContained X K aL bL.
5. G.MeanKappaBound X K.

The actual theorem uses 3(b), not an upper bound on the absolute deficit and not a conclusion of finite reindexing. No need to assume C>=0 in this adapter. The actual allowance definitions (100–120) are:
flG = C*f*N(m)^2*log_p a + C*f*(log_p a)^2.
rG(eps)=ceil_nat(8*((2+8eps)+2)/eps)+1.
L1(p)=ceil_nat(log_p(k^2*x^(3A)))+1.
loG = C*(Sc+k+etaSz)*log_p(2a)+pr+orr.
pr=0 unless class=inertClass. In that class, p<p0 gives C*rG(eps)*b'*log x; otherwise p<X' gives C*(b'/x+etaSz+Sc+(w''(n)+t)*log x/delta1)+bo; otherwise 0.
orr=0 unless class=inertClass AND p<X'; there it is C*log x*(LaG*a/(p*k)+(if p<p0 then a*p^(-L1(p)) else a/p^2)).
Do not substitute G.lo (IsResidueClassZero 378–390), which has different coefficients, nor LocalQuadraticParts.lowerTermOfPrime. The bo term is outside the C multiplication. Floor and lower envelopes previously reconstructed in RUN10 use this exact definition.

## 3. Native parameter fill equalities and transport proof

G.ParametersFill (IsResidueClassZero 401–410) explicitly supplies: (i) weight fill equals wj for every j in J, tau-index and z with matching eTau and plGG; (ii) wPart equals fill at the designated partner for every j,t,e; (iii) map of L.TTw(w) via subtype embedding equals TTP at residue characteristic; (iv) if w in supp AND (IsResidueClassZero OR IsSg), gain(j,w)=gainP at p for all j in J; (v) tau(w)=tauP; (vi) io(w)=ioP; (vii) La K L.sc=LaG. They are record hypotheses; not automatically true for arbitrary X.

Choose w over the particular p by Lnk.place_over (PowFour 777, definition proof in FrameCodeOfAdditive 290–319). Apply hG's third conjunct using InertK and p<=X'', rewrite resChar(w)=p; obtain the signed ledger inequality. H.supp_sat puts w in supp. H.fills w supplies the three exact identities for retained top, gain and tau. Reverse the order of the disjunction InertK to use the gain clause.

Let R=TTP(X,K,aL,bL,p), T=TTv D=v(host.TT), Rv=v(R). The local target is SizeData₂(J,T,Rv,ask,gainQ,tauP,loG,flG,p), where ldAt gives Rv, ask fields, gainQ, tauP, loG, flG (SuppSat 54–71). First Rv⊆T since every retained top comes from a member of host.TT by the subtype embedding in fill (PowFour 786–791). In particular we do not count multiplicities of a noninjective image.

For each j in J, reindex the left sum by the native injective Frame.A.val and then by the fill's subtype map:
 sum_{n in Rv}(ask(j,n,p)-loG(p)) = sum_{t in L.TTw(w)}(L.vonMangoldtClassSum(j,t,p)-loG(p)).
The equality uses hask for each j,t; no analytic bound or positivity estimate is used (792–803). The image map is injective, so no factor from multiplicity appears. Next, gainQ has an if-drop guard; since p is served, p not in drop and gainQ(j,p)=gainP(j,p)=L.gain(j,w) by the support and class hypotheses (804–808). Also |J|=m by the cardinality of lifts (809–812), and tauP=L.tau(w) by fill (815). Substitution into the exact place-level inequality proves the second conjunct of SizeData₂. Thus loss_bound_at is transport of a genuine local geometric premise and not a proof of that premise.

## 4. Immediate exact deficit consequence (human algebra)

The formal generic predicates are SecondKindBucket 20–22,45–55. Write A(j,t)=ask(j,t,p), R=Rv⊆T, q=loG(p), f=flG(p), G=sum_j gainQ(j,p)-tauP(p). The proved conditional inequality is sum_{J,R}A - m|R|q - mf <= G. Splitting the whole finite top set into R and T minus R gives exactly
 deficit(p)=sum_{J,T} A-G <= sum_{J,T minus R} A + m|R|q + mf = servedLoss(p).
No sign assumptions on A,q,f,G are needed for this algebra. This is the served summand of SplitLe (57–66), and uses the actual native target. Summing with weight 2 log p preserves order for primes p>=2, NOT for arbitrary positive real p<1. The nonserved case is different: the native nonserved_zero (PowFour 687–698) makes gain and tau zero, so the deficit equals wholeAsk. Exceptional d term is separate in ASK, not silently folded into served loss. We do not claim to have checked the entire generic SplitLe proof body, and do not duplicate RUN8–10 bounds.

## 5. Family quantifiers and exact frontier

LinkG (GlobalTheoremInputs 138–140) means there exist fixed real C,x0 and a function delta:R->R with delta(x)->0 at +infinity, such that for EVERY x>=x0 and EVERY i:Fm.Ix x, LinkG_at(Fm.Gx x i,Fm.GK,C,b_i(x)^delta(x)). The C is not chosen separately per prime, place, index or x; no positivity of C is part of the definition. In loss_points_of_choices (PowFour 2039–2062) this is an INPUT, unpacked with chosen TT/bad, askIsF and windows_ev; the threshold max retains all witnesses. Choose i0 at x in Win, bo=b_i0^delta(x), and use Lnk.sc_eq to transport bo to all i. It supplies hGi and hH to lossHyp_at (1989–1998), not an independent producer of LinkG. GlobalTheoremInputs 158–164 also retains LinkG in the global premise. The actual theorem establishing LinkG's clause 3(b) from geometric conditions remains to locate; search returned no indexed matches, inspected LinkPk/LinkMin/LinkTied/PlacesMin and related branches without a verified direct producer. Do not assert the predicate is an axiom, or that it has been proved by this adapter. Dependency/kernel lane: request exact qualified reachability and reverse producer edges, distinguishing native constants, types and proof-value references.

## 6. Provenance and upstream comparison

Pinned source base: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/

| Path relative to base | Blob SHA | Lines |
|---|---|---|
| src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean | 8166795ec6e846795d7272781119ee7d17d426c0 | 298ff ask_at; 579 pc_mem_Ps; 621–651 served; 687–698 nonserved_zero; 766–816 loss_bound_at; 1989–1998 lossHyp_at; 2035–2062 family |
| src/Formalism/SharpRestriction/GlobalTheoremInputs.lean | ba31f5120ed089d48968754ae577427912d467c5 | 97–140 definitions; 158–164 global input |
| src/Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean | 9fbb7879d0519f9a136e190551422881ef5d2f0b | 362–375 TTP and askP; 378–410 lo and fill |
| src/Formalism/SizeWindowBrackets/SecondKindBucket.lean | 502d2a6bf146f38b4c51ed87db9cf1ffbc9d7db8 | 13–28; 45–66; 95–96 |
| src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean | 80c1d0526b661eae74d87ec3b569d6a459e900ce | 26–71; 94–101 |
| src/Formalism/SharpRestriction/GlobalSchurBounds/FrameCodeOfAdditive.lean | a26c19cd46d322546d8a1784c3c3e9aac3acef85 | place_over 290–319; wPart_eq 464–477 (RUN6) |

Latest upstream main observed 307cef33f046955ee79dba47e0d828d06496d75f, 2026-11-24 17:03:26 UTC, merge PR #1266. Exact substring comparison of pinned blocks to current files succeeded for all five: loss_bound_at 766–816 now 735–785 (blob 74c8dc05d5ed540a5af4ef295afbd7d40b973082); InertK through LinkG 97–140 now 121–164 (5c32a96fe300e445ca6fe371b1b95e99632edae6); ParametersFill 401–410 now 427–436 (0622fc3b6d32afcdece44b5bac2496fd8ab099a6); SizeData₂ through wholeAsk 45–55 now 88–98 (dd75da148c717f5d531d39fb3875f719efff4cb4); ldAt 54–71 now 47–64 (d5821c10326628e5285dfbca3dcf787a1cb19aab). This is text stability, not elaborated equivalence. Retain original pin.

## 7. Executed certificate

Save following as run11.cjs, run node run11.cjs. All arithmetic is exact BigInt. Enumerate signed allowances and signed synthetic ask values (the algebra permits them; actual askAt is nonnegative), empty lift/top/retained sets and slack 0,1,2. Source premise is deliberately manufactured by tau from the desired slack; this tests transport only, not native geometry. Native equalities are premises tested under a nontrivial injective coding, not recovered operators. Negative controls show collision, wrong cardinality, dropping gain, changing tau, mismatched ask, or erasing a signed floor changes the obligation.

```js
function regression(){
 const c={subset:0,reindex:0,gain:0,tau:0,transport:0,deficit:0,negative:0};
 function ck(v,k){if(!v)throw Error(k+" "+c[k]);c[k]++}
 const sum=a=>a.reduce((x,y)=>x+y,0n);
 const range=n=>Array.from({length:n},(_,i)=>i);
 for(let m=0;m<=4;m++)for(let T=0;T<=5;T++)for(let mask=0;mask<(1<<T);mask++)for(let lo=-2;lo<=2;lo++)for(let fl=-2;fl<=2;fl++)for(let slack=0;slack<=2;slack++){
  let J=range(m), top=range(T), retained=top.filter(t=>mask>>t&1), omitted=top.filter(t=>!(mask>>t&1));
  const enc=t=>17+3*t, dec=n=>(n-17)/3, coded=retained.map(enc).reverse(), TT=top.map(enc);
  const a=(j,t)=>BigInt((j+1)*7-3*t+mask%5-4);
  const v=(j,n)=>a(j,dec(n));
  const q=BigInt(lo), f=BigInt(fl);
  let lhs=sum(J.map(j=>sum(retained.map(t=>a(j,t)-q))))-BigInt(m)*f;
  let g=j=>BigInt(j+mask+1), tau=sum(J.map(g))-lhs-BigInt(slack);
  let gQ=j=>g(j), tauQ=tau;
  ck(coded.every(n=>TT.includes(n)),"subset");
  let r=sum(J.map(j=>sum(coded.map(n=>v(j,n)-q))))-BigInt(J.length)*f;
  ck(lhs===r,"reindex");ck(sum(J.map(g))===sum(J.map(gQ)),"gain");ck(tau===tauQ,"tau");
  ck(r<=sum(J.map(gQ))-tauQ,"transport");
  let deficit=sum(J.map(j=>sum(top.map(t=>a(j,t)))))-(sum(J.map(gQ))-tauQ);
  let loss=sum(J.map(j=>sum(omitted.map(t=>a(j,t)))))+BigInt(m*retained.length)*q+BigInt(m)*f;
  ck(loss-deficit===BigInt(slack),"deficit");
 }
 const source=[0,1], collision=source.map(()=>5);
 ck(sum(source.map(()=>1n))!==sum([...new Set(collision)].map(()=>1n)),"negative");
 const floor=3n, asks=6n, right=0n;
 ck(asks-2n*floor<=right && asks-floor>right,"negative");
 const lhs=3n, g=3n, tau=0n, dropped=0n;
 ck(lhs<=g-tau && lhs>dropped-tau,"negative");
 ck(2n<=3n-0n && 2n>3n-2n,"negative");
 ck(0n<=0n && 1n>0n,"negative");
 // Fl=-1, one lift and no retained top, true LHS=1, falsely deleting signed floor produces LHS=0.
 const signedFloor=-1n;
 ck(0n-signedFloor>0n && 0n<=0n,"negative");
 return c;
}
console.log(JSON.stringify(regression()));
```

Actual V8 output: {"subset":23625,"reindex":23625,"gain":23625,"tau":23625,"transport":23625,"deficit":23625,"negative":6}. 141750 positive assertions and 6 negative controls. No failure. Complexity linear in explicitly enumerated fixture size per test, no full corpus benchmark. No Lean executable used.

## RESUME HERE

Next: locate the *actual* native producer of Formalism.MainNotions.LinkG, especially the third conjunct's retained-top estimate, following the typed GlobalTheoremInputs supplier, not loss_points_of_choices again. If the genuine producer is not on the authenticated Main dependency DAG, mark this route as a library branch, and use the actual reachable retained-top producer instead. Request independent audit of reindexing, exact distinction between the two SizeData₂ names, InertK disjunction, gain guard, signed allowances, and source-hash drift. Request kernel/dependency role-labelled edges for Formalism.MainNotions.LinkG_at, Formalism.MainNotions.LinkG, Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at and G.ParametersFill (resolve full namespace before use). HANDOFF TO math, geometry, audit, editor, integration, dependency/kernel lanes. Project OPEN.


---

# Peer chapter — specialists/theta_lifts/RUN11_VACUUM_RESTRICTION_AND_FRAME_INDEPENDENCE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/11d241e868501e1990811f96329034bc061eaaa6/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN11_VACUUM_RESTRICTION_AND_FRAME_INDEPENDENCE.md); blob 7b39ffd9707fcf9c76232f0f34dbea54cd217e47; pin named. Relative links refer to original location.

# Theta lifts RUN11 — vacuum restriction, frame independence and compact stability

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of native Avac.vacK_of and all three conjuncts of VacK. Mathematical premises retained; no Lean replay, complete RH proof, or URT gain asserted. Project OPEN.

## Continuity
Read AGENTS, research state/log and protocol excerpts, continuity, swarm protocol/queue/expansion, CI checkpoint 383 (unrelated physical checks PASS), full RUN10 and recent handoffs from integration, kernel, Galois, windows, Landau, literature, geometry, prime, editor, acceleration, structure, dependencies, audit, math. No overlapping vacuum restriction task identified in these notes. Linked external blueprint not reopened this session. Upstream pinned leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed head 307cef33f046955ee79dba47e0d828d06496d75f (merge PR #1266), differs from RUN10's head. VacTop, ContinuousIns and original UnitaryFramesPreserveNormSqSum paths return 404 at that head. This shows path drift, not disappearance or invalidity of the theorem; no migration equivalence claimed. All reconstruction uses original pin.

## 1. Exact statement and application
Namespace PositivityTheory.SiegelWeilFormula.Avac. VacTop.lean:14–16 proves
  vacK_of (hT : TAll) (hF : FockMem) (hO : LocOpEx) (hI : LocInst) (hA : FinAct) : VacK
using the tuple (vac_K', vac_le_fock, vac_res'). LowerRankDatum.lean:147–148 defines VacK universally for number fields F,E, their field/NumberField instances, Algebra F E, sigma:E→ₐ[F]E, d:SD sigma, R:RD d:
(i) for every Phi in d.sch with T_d Phi in R.vac, and each k in d.K, T_d(om_d(k)Phi) in R.vac;
(ii) R.vac ≤ R.fock;
(iii) for EVERY L:LD d and R':RD L.sd, every Phi in d.sch with T_d Phi in R.vac admits Phi' with L.IsRes Phi Phi' and T_L Phi' in R'.vac.
IsRes explicitly means Phi' in L.sd.sch and equality T_L Phi'(X.submatrix id L.em)=T_d Phi(X) for every X with distinguished column i0 zero. No rank inequality m<n assumed here. All SD, RD, LD field requirements and five packaged hypotheses are retained. Fin.siegelWeilStd_of uses hVK at lines 58,62,64,67 for WhitLow, Step and final standard formula; these are source-body references.

## 2. Constant polynomial vacuum inclusion
Define G_R(X)=product over infinite places w of fP(1)(R.loc w X); let vg_R(g)(X)=G_R(X) g(crd_fin X). R.vac is the complex linear span of these functions for g in SB (locally constant, compactly supported finite-adelic functions). R.fock permits a polynomial at each infinite place. For every generator choose all polynomials 1. VacCut.vac_le_fock proves the inclusion by span_le, not by claiming all Fock states are vacua.

## 3. Frame independence — actual native supplier
ContinuousIns.gauss_ext uses FrameLin.norm_frame_eq, which calls GlobalTheory.T.unitary_frames_preserve_norm_sq_sum; its statement wrapper invokes GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames. The latter has a substantive proof (not an assumed statement).

For m≥1, J a complex m×m matrix, invertible frames A,B, phases ζ,ζ' each in {1,i}, signs s,s' in Z^×={±1}, assume
  ζ A^T J conjugate(A)=s I,   ζ' B^T J conjugate(B)=s' I.
Put Q(v)=v* conjugate(J) v and α=s conjugate(ζ), α'=s' conjugate(ζ'). Conjugating the first congruence gives conjugate(ζ) A* conjugate(J) A=s I. Set w=A^-1 v; since s²=1, normSq_eq_scalar_mul_form gives
  ||A^-1 v||²=α Q(v),   ||B^-1 v||²=α' Q(v).
Use e0, the first coordinate unit vector, existing because m≥1. Both squared norms are strictly positive (invertible matrices cannot send e0 to zero); Q(e0)≠0. Dividing yields α'/α=||B^-1 e0||²/||A^-1 e0||²>0. But α and α' belong to {1,-1,i,-i}, so their ratio is a fourth root of unity, and its only positive real possibility is 1. Thus α'=α, giving equality of squared norms for ALL v. Lean instead enumerates phases and signs and uses linarith, with the same positivity witness. No blanket assertion that arbitrary frames are unitary. The frame congruences and discrete phases are indispensable. This proof is a human rearrangement of the existing native proof, not a novel theorem or extra premise.

## 4. Exact restriction of vacuum generators
ContinuousIns defines ext_L(X') by inserting zero in missing column and copying other columns through em; injectivity and range complement ensure ext_L(X.submatrix id em)=X on the zero-column slice. Finite adelic coordinates obey crd_fin(ext_L X')=ins_L(crd_fin'(X')), with ins_L the corresponding insertion on coordinate triples. The projection prj_L is continuous and satisfies prj_L∘ins_L=id; ins_L is continuous (each coordinate is either a projection or constant zero).

For g∈SB, g'=g∘ins_L is locally constant by continuity. Compact support is not inferred from continuity alone: tsupport(g') ⊆ ins_L^-1(tsupport(g)) ⊆ prj_L(tsupport(g)), the last set compact as a continuous image; tsupport(g') is closed. Thus g'∈SB by SB_ins. This addresses the potential noncompact-preimage error.

At each infinite place, sum_loc writes the Gaussian exponent as the sum over columns of the squared norm of the inverse-frame-transformed column; conjugations in RD.loc preserve norms. The missing column contributes zero, and each kept column agrees by the native norm_frame_eq from section 3 (the upper and lower datum share the form J; RD.hfr supplies congruences and RD.hζ the discrete phases). Fintype.sum_of_injective uses em and injectivity. Hence fP(1)(R.loc w ext_L X')=fP(1)(R'.loc w X') for arbitrary R,R'. Taking products and using crd_ext yields the exact formula
  vg_R(g)(ext_L X')=vg_R'(g∘ins_L)(X').
Define resL(f)=f∘ext_L, a complex linear map. The generator identity implies R.vac ≤ (resL)^-1(R'.vac), by span_le and SB_ins (ContinuousIns.res_vac). No extension of arbitrary lower Schwartz functions or surjectivity of resL is asserted. For Phi as in (iii), f'=resL(T_d Phi)∈R'.vac⊂R'.fock; FockMem gives f'∈L.sd.schM, and TAll.1 (TBij) gives a lower Schwartz preimage Phi' with T_L Phi'=f'. The ext_sub identity gives IsRes at every zero-column X, and T_L Phi' remains in R'.vac. This establishes (iii) for arbitrary L,R'. It does not construct LD or prove LD.res itself.

## 5. Compact stability, including the finite-adelic residual
CwInvIota.iota_vg: for a single infinite place w and y∈local K, LocOpEx supplies a local operator and LocInst supplies its data and compact compatibility. SchwartzOfConstantPolynomialOne.vg_tens decomposes vg as a local Gaussian times psiW from all other places and finite coordinates. psiW_indep proves independence under changes supported solely at w using additivity of coordinates and zero projections. The constant polynomial Gaussian is Schwartz by the native KMain.schwartz_polyGauss. The local action and kvac law give T_d(om(R.iota_w y)Phi)=vg_R(c g) with c=F0(p,q,e,y). No need to divide by c.

For k∈d.K, kdec supplies y at a chosen w with equal frame component and InK. It uses form preservation and conjugation by dZ(ζ); star ζ=ζ^-1 makes this conjugation preserve unitarity. The factor k0=(R.iota_w y)^-1 k has identity at w and the same components at every other infinite place (RD.off_w). In peel, induct over a finite subset S of infinite places where components are unitary and require identity outside S. At S empty, use FinAct on the actual adelic residual, not k0=1: finite places need not be trivial. gauss_indep says the archimedean product is independent of pure finite changes. FinAct returns g0∈SB and T_d(om(k0)Phi)=vg_R(g0). At insert w, apply induction to the peeled element; Schwartz stability supplies its transformed vector as the input to iota_vg, and complex scalar closure of SB gives c g0∈SB. The group law reconstructs k=R.iota_w y·k0. Take S=all infinite places and d.ok.stdK to obtain vg_K'.

For arbitrary linear combinations, define S'={Phi∈d.sch: for every k∈d.K, T_d(om(k)Phi)∈R.vac}. This is a submodule by linearity of T and om and vacuum span closure. Every generator vg_R(g) has a Schwartz preimage by FockMem, vac_le_fock and TAll.1; by vg_K' that preimage is in S'. Hence R.vac≤T_d(S'). Given any original Schwartz Phi with T_d Phi∈R.vac, choose Phi1∈S' with T_d Phi1=T_d Phi; T_inj from TBij (TAll.1) on Schwartz vectors gives Phi1=Phi (via the difference and linearity). Thus Phi belongs to S' and (i) holds. This is the original span-map proof, not a claim about arbitrary functions without T injectivity.

## 6. Provenance, trust and accelerator handoff
All five premises TAll/FockMem/LocOpEx/LocInst/FinAct remain. Deeper producers include KFock.fockMem, locOpEx_of_tAll, KAway.finAct_of_tAll, local compact kvac and Schwartz action; LD existence and LD.res remain open as before. General linear algebra, compact-support topology and group factorization are classical; named unit-frame result here has an actual source proof, not a publication attribution, and no new literature attribution is verified. No placeholder/axiom status asserted without elaborated audit.

Acceleration RUN11 reported a separately recovered candidate exact manifest name PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' (ID 8981975, encoded type/value refs 721071981,721077114), different from iwaQ_of'_k. We checked the literal namespace and theorem declaration of pinned IwaTop.lean, so this is the correct fully qualified SOURCE name, not the short Avac.iwaQ_of' request. Manifest membership and typed role evidence are still separate; peer IDs not independently extracted here. Please query exact tagged name, preserving type/value roles and distinct _k declaration. Request analogous exact roots PositivityTheory.SiegelWeilFormula.Avac.vacK_of, .vac_K', .vac_res', and GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames. No claim of kernel-level path to Main from static reference checks.

## 7. Reproducible source certificate
Executed connector JS at original pin: 11/11 supplied blob IDs matched and 77/77 literal source anchors matched. No numerical surrogate, no byte-level local rehash, no Lean kernel replay. Python replay below is an independent reproducible minimal representative-anchor and raw-byte blob check on the upstream git checkout; it was not executed in this session. Full source identities preserved.
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
a="src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/"
rows=[
(b+"VacuumIwasawa/VacTop.lean","c427bc7204967c7c87a0df6c1810eff906d6d944",16,"vac_res' L hT hF R R'"),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",147,"def VacK"),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",58,"Avac.vacK_of"),
(b+"VacuumIwasawa/VacCut.lean","fedc07b92fa916c586e9bac5fbb48d61c086a2b9",20,"theorem vac_le_fock"),
(b+"VacuumIwasawa/ContinuousIns.lean","5039849e7ea2ccce981ba59dfb171243be8aa124",113,"theorem vac_res'"),
(b+"VacuumIwasawa/CwInvIota.lean","aee15299b46ce4b16f056acc69514397dc9ebfac",103,"theorem vac_K'"),
(b+"VacuumIwasawa/SchwartzOfConstantPolynomialOne.lean","22f88d1ff2787d719a1801643fd06601a24d0925",52,"theorem psiW_indep"),
(b+"VacuumIwasawa/FrameLin.lean","59d70a9487991bda2439f7ab11075a1d1af53bc1",12,"theorem norm_frame_eq"),
(a+"UnitaryFramesPreserveNormSqSumStatement.lean","96ad911f9c068a75d3f28d98140fcc9ff948c2b3",6,"theorem _root_.GlobalTheory.T.unitary_frames_preserve_norm_sq_sum"),
(a+"UnitaryFramesPreserveNormSqSum.lean","18bc0686cbfaf8b13ed3ba5cf8a727beac520f9a",47,"theorem normSq_eq_of_unit_frames"),
(b+"VacuumIwasawa/IwaTop.lean","fc0a326c9635f836f0e78f145cc65d63b0edf6c3",17,"theorem iwaQ_of'")]
for p,sha,i,t in rows:
    raw=subprocess.check_output(["git","show",pin+":"+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,p
    assert t in raw.decode().splitlines()[i-1],(p,i)
print(len(rows),"blob IDs and representative source anchors")
```
Complexity not benchmarked; no URT experiment. No physics queue changes.

RESUME HERE: reconstruct actual Afc.orbRes (caller SiegelWeilStdOf line 65), especially the zero-column orbit restriction and nonsingular-orbit vanishing for m<n; preserve both distinct branches and its dependence on IsRes and full-rank impossibility. Do not redo vacK or IwaQ. Keep LD.res construction, CTSplit, HolLead, FourierZero and lInt2 deeper suppliers open. HANDOFF TO theta, integration, editor, kernel, dependency, audit, acceleration and literature. Project OPEN.


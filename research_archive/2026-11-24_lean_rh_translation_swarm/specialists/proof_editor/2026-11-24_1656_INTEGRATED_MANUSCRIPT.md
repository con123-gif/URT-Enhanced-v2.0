# Human-readable RH reconstruction — tenth edition (16:56 UTC, 24 November 2026)

INCOMPLETE. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed current upstream main 1da818b50f1e18808db2792b9dc735bda8cb84d8, unchanged from the ninth edition, not substituted. Original Main route remains the subject. One integrated manuscript in linked volumes; no independent Lean kernel replay or URT improvement claimed.

Read [I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [V](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [VI](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), then this VII. Previous 98 primary and five supporting chapters; nine new primary and two supporting peer chapters appended verbatim (107 primary, seven supporting). The source-linked peer content is preserved without treating its claims as independently replayed. Original relative links are interpreted relative to each original file (canonical snapshot links in the appendix).

## 1. The native rank-bound producer (all 17 conclusion fields), then block 15 (all ten inequalities)

SOURCE-MATCHED conditional human derivation. Start with the actual RankVal s R (not a synthetic substitute): x=s.x>1, 0<eps=s.eps<1/52, L=x^eps, delta1=x^(-eps/8), n between x^(2+8eps) and 2x^(2+8eps), m between sqrt(x delta1) and twice it, k between x^(9/2+10eps) and twice it, and r+t=8fr+4+TOv*nWv. The latter uses TOv=ceil_nat(x^377) and nWv=8 ceil_nat(10r(f+f²(k-1)^3 L²/m)/8). The native rank definitions supply f=2n, k<=r<=2k, m>=2, k>=m+3 and N(m)=k+m(t+1) as used by the source unfolding; in particular r+mt<=N(m). These are natural numbers, and the source casts them to reals. We use the same RankVal witness, not a free choice of each variable. Source's x0=1000^1000, so x^(1/1000)>=1000. For any C<=1000, x^a C<=x^b if b-a>=1/1000; nonnegative base. Thus absorb coefficients without hidden big-O constants.

The rank lemma uses n<=2x^(2+8eps+eps/100) (the +eps/100 follows by monotonicity), and the exact square root m-scale x^(1/2-eps/16). From eps<1/52 the following uniform envelopes follow:
- f<=x^2.156, since 2+8eps+eps/100+0.001<=2.156 and 4<=1000.
- r,k<=x^4.694, since 4.5+10eps+0.001<=4.694 and 4<=1000.
- L<=x^0.020, L>=1; m<=x^0.501 and 1/m<=x^(-0.498). The inverse inequality follows from m>=x^(1/2-eps/16)>0 and 1/2-eps/16>=0.498. Keep exact two-sided m bound.
- f r L>=x^(2+4.5)=x^6.5 by the original lower n,k bounds and L>=1. Upper f r L<=x^(2.156+4.694+0.020)=x^6.87.
- f choose(r,2)<=f r²<=x^11.544<=x^12. kf/m<=x^6.352<=x^7.
- In nWv, r f<=x^6.85 and r f²(k-1)^3 L²/m<=x^(2*2.156+4*4.694+2*0.020-0.498)=x^22.630<=x^22.7. The ceil argument is positive because r,f>0 and the second summand nonnegative. Hence nWv>=1 and nWv<=10(rf+r f²(k-1)^3 L²/m)+8<=28x^22.7<=x^22.9. No ceiling term omitted.
- x^377<=TOv<=2x^377<=x^378. Since r<=8fr (f>=1) and nWv>=1, t>=TOv. Also t<=8fr+4+TOv*nWv<=13x^400.9<=x^401.
- N(m)=k+m+mt<=3x^401.6<=x^402 (mt<=x^401.501).
Together the coarse f<=x³, m<=x, r<=x⁵, k<=r, r<=2k, L<=x, L>=1, the lower and upper product bounds, choose bound, quotient bound, nWv bound, lower and upper t bounds, N bound and exact two-sided m bounds are precisely the 17 fields of rank_basic_bounds, including their order as in the wrapper. This is an expansion of the native inequality producer, not the producer of RankVal itself.

Now fix Std C, cD>=0 and choose ch>=max(1300+cD,406|C.P.CCount|) as source, x>=max(x0,200,C.P.Ch0r,C.P.Ch0k), and one D,L record satisfying Val C cD ch L and matching eps. To avoid collision with the SizeData₂ record, below write ell=L.sc.L, S=L.Sc, Y=x^cD>=1, H=h0 L, N=D.R.N D.R.m, M=Mrt D, b=L.sc.b>0. Then Del=ceil_nat(Y)<=2Y, S=4kDel<=8x⁵Y<=x⁶Y, S>=0, H=2 ceil_nat(x^ch)>=x^ch. These are exact Val equalities and native Sc_eq; H uses m>0. Native qSig D=m; M=r+mt<=N. n<=f<=x³, m>=1, and all other rank quantities and ell,S nonnegative. Also N,f,ell>=1 for the power bound.

Let A=n t²(N+t)ell², B=k n²(S+t+ell), P=x^1209 Y. Since t<=x^401<=x^402, A<=2x^(3+802+402+2)=2x^1209<=2P. As S,t,ell<=x^401Y, B<=3x^(5+6+401)Y=3x^412Y<=3P. The exact definition lStar=m b/(A+B) gives b/lStar=(A+B)/m (including the totalized zero convention; the native positive ranks also exclude A+B=0). Since m>=1, the first target is <=12(2+3)P+2P+8P=70P. All further polynomial targets are bounded as follows:
  (2) kt ell<=x^407<=P.
  (3) C.P.Ch0r r^19 f^5 ell<=x^112<=P (using C.P.Ch0r<=x and nonnegative multiplier; no positivity of coefficient needed).
  (4) (N f ell)^C.P.CCount <= (N f ell)^|C.P.CCount| <= x^(406|C.P.CCount|) <= H, since 1<=N f ell<=x^406.
  (5) 4N³+2t+6<=12P.
  (6) C.P.Ch0k k m^(9/2)<=x^11<=P, using m>=1, m<=x.
  (7) 2M³+t+3<=6P.
  (8) 120r qSig^(3/2)<=120x^7<=120P.
  (9) Nm^10<=x^412<=P.
  (10) 16 qSig N<=16x^403<=16P.
All except (4) are <=200P<=x^1210 Y<=x^ch<=H; (4) used the separate count exponent guard. This recovers the full ten-field h0_ge record via sizes_node_bounds_le_h0 and explicitConstants_parameterConditions_large on the same D,L. Source uses x^1299Y rather than P; sharper sufficient local witness ch>=max(1210+cD,406|C.P.CCount|) is valid under unchanged x threshold. It is not proposed as a change to any other parameter block, nor a claim that global ch decreases. Quantifiers: for every eps and Std C choose c1=0, for each cD>=0 choose the displayed c2, for each ch>=c2 choose x0 above, for every D,L with scale and Val premises conclude ten inequalities. No new Val, HostArith or FamP existence inferred.

## 2. Source ledger and executed regression

- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowNodeGap.lean — 778e810919ff4e9dd03494cef1a2b7430ced9268; anchors: theorem nodeGap_poly; theorem szRow_nodeGap; max (1300 + cD) (406 * |C.P.CCount|); 2 * x ^ 1209; 3 * (x ^ 412 * Y); hV.eta_eq; hV.Del_eq; unfold lStar; Real.rpow_mul; unfold Mrt Ranks.N Ranks.r
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SzRowNodeGapStatement.lean — 8a2c3af3eabe3445b5a7eb791da169358d4f4e10; anchors: sizes_node_bounds_le_h0; GlobalTheory.EX.szRow_nodeGap
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitConstantsParameterConditionsLarge.lean — 8bb3bd4a9a5343eaeaef138a1dccf57016010f0a; anchors: SzRow.and GlobalTheory.T.sizes_node_bounds_le_h0; h0_ge := h_h0_ge
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitRanksBasicBoundsLargeScale.lean — 12f00bc43910359ad90686646fb70f239deed09e; anchors: theorem rank_basic_bounds; (1000 : ℝ) ^ (1000 : ℝ); 2156; 4694; 227 / 10; 229 / 10; 4009 / 10; 4016 / 10; unfold Ranks.N; Nat.choose_le_pow; RankVal.n_le
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitRanksBasicBoundsLargeScaleStatement.lean — 06f43bd62169da68ca742524f7b57dcb6ca87454; anchors: explicitRanks_basic_bounds_large_scale; GlobalTheory.EX.rank_basic_bounds
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean — 688162690ac7cbfe620037fcee8e451e7116f45b; anchors: def RankVal; def nWv; def h0v; def Delv; theorem n_le; structure Val; eta_eq :; def SzRow
- src/Formalism/LocalRingCardinality/DataParams.lean — 6dc2612028528e242333116820c35775ba802c37; anchors: def lStar; def h0; def qSig; def Mrt; h0_ge :

All seven pinned connector blob hashes and 40 textual anchors matched. Reproduce with git rev-parse PIN:PATH and git show PIN:PATH. Exact rank exponents and synthetic integer-budget checks executed in V8, including count with negative exponents and squared half-power comparisons. The source identity for N is based on the rank proof's unfolding (not a separate extraction of the Ranks structure); arithmetic tests do not realize native Ranks or Val. Local source-matched result, not kernel recheck. Code:
~~~js
function regression(){
 let rank=0,node=0,count=0,negative=0;
 const ck=(v,m)=>{if(!v)throw Error(m)};
 // All rank exponent comparisons in units 1/5,200,000 (includes eps/100).
 const Q=5200000n, E=n=>BigInt(n)*5200n;
 for(let i=1n;i<1000n;i++){
   const eps=i*100n; // eps=i/52000
   const lowerM=Q/2n-eps/16n; // floor error avoided in comparisons below by multiplying 16
   const cs=[2n*Q+8n*eps+eps/100n+E(1)<=E(2156),
   9n*Q/2n+10n*eps+E(1)<=E(4694),
   eps<=E(20),
   16n*(Q/2n+E(1)) - eps<=16n*E(501),
   16n*(Q/2n-E(498))>=eps,
   2n*E(2156)+4n*E(4694)+2n*E(20)-E(498)<=E(22700),
   E(22700)+E(1)<=E(22900),
   E(377000)+E(1)<=E(378000),
   E(378000)+E(22900)<=E(400900),
   E(400900)+E(1)<=E(401000),
   E(501)+E(401000)<=E(401600),
   E(401600)+E(1)<=E(402000),
   E(2156)+E(4694)+E(20)<=E(6870),
   E(2156)+2n*E(4694)<=E(12000),
   E(4694)+E(2156)-E(498)<=E(7000)];
   for(const c of cs){ck(c,"rank exponent");rank++}
 }
 for(const x of [200n,201n,300n])for(const Y of [1n,x,x*x])for(const mode of [0n,1n,2n]){
   const hi=e=>x**BigInt(e),v=e=>mode===0n?0n:mode===1n?hi(e)-1n:hi(e);
   const n=v(3),f=v(3),m=mode===0n?1n:v(1),k=v(5),r=v(5),t=v(401),N=v(402),M=v(402),L=v(1),S=mode===0n?0n:hi(6)*Y,c1=x,c2=x,H=hi(1210)*Y,P=hi(1209)*Y;
   const A=n*t*t*(N+t)*L*L,B=k*n*n*(S+t+L);
   const checks=[A<=2n*P,B<=3n*P,12n*(A+B)+(2n*t+8n)*m<=H*m,k*t*L<=H,c1*r**19n*f**5n*L<=H,4n*N**3n+2n*t+6n<=H,c2*c2*k*k*m**9n<=H*H,2n*M**3n+t+3n<=H,120n**2n*r*r*m**3n<=H*H,N*m**10n<=H,16n*m*N<=H];
   for(const c of checks){ck(c,"node bound");node++}
   // positive B0 for the count inequality, independently constructed.
   const B0=mode===0n?1n:hi(406)-(mode===1n?1n:0n);
   for(const C of [-4n,-1n,0n,1n,3n,4n]){
    const abs=C<0n?-C:C,Hc=hi(1210)>hi(406n*abs)?hi(1210)*Y:hi(406n*abs)*Y;
    ck(C<0n?1n<=Hc*B0**abs:B0**C<=Hc,"count");count++;
   }
 }
 const x=200n;ck(x**(406n*4n)>x**1210n,"count threshold cannot be dropped");negative++;
 ck(12n*10n>12n*10n/2n,"denominator less than one can enlarge a term (reciprocal two)");negative++;
 ck(200n*199n**1209n>199n**1210n,"200 absorption fails below 200");negative++;
 return {rank,node,count,negative,positive:rank+node+count};
}
console.log(regression());
~~~
Actual output: {"rank":14985,"node":297,"count":162,"negative":3,"positive":15444}. The negative denominator control is illustrative, not a full native counterexample.

## 3. Integrated reading order and exact joins

1. Native segment producers (integration 1600): now expands native segment representation and Langlands segment existence; preserve same-S transport and nonzero coatom guard. The next missing jhMult_rev_jac_sub / rhoNuRho_ofC are not silently assumed established. Galois RUN10 proves finite period-space action, then constructs an open twist subgroup; it does not establish MemLoc.frob_laws or the local realization. These join the earlier Row0b chain only with the actual representation inputs.
2. Character supplies: math ind_drop identifies conductor under its native primitive witness and modulus change; retain dependent sigma equality and M nonzero in the separate ind_unique proof. Character-box RUN10 proves exact level index and five Pins consequences, not a producer of initial ReadL/MjHTie/IdxDefs. Keep divisionCompatible_at_readIdentifications role pending.
3. Theta: RUN10 Avac.iwaQ_of' constructs Iwasawa restriction using TAll and SD/LD; this plugs into the prior cOneVal_pf only with native VacK, OrbRes, HolLead, FourierZero still supplied. Do not replace invariant restriction with a free group representation.
4. Geometry: RUN10 field tangent injectivity and denominator-clearing gluing retain finite projective and smooth/reduced hypotheses as applicable; local unit and norm chapter retains complex_section_finite_combination and boundary holomorphy suppliers. Block 15 above follows prior blocks on same Val, with 17-field rank producer expanded. Neither finite scalar tests nor these inequalities prove native geometric existence.
5. Analytic character estimate: prime-window RUN10 native cutoff/loss envelopes still rely on served-ledger inequality loss_bound_at and LinkG_at. Audit sum_th normalization is a separate cited audit (not reproduced as prose); do not silently alter averaging measure. Landau RUN10 removable singularities/Cauchy extraction retain circle/ball and analytic assumptions and do not produce arithmetic windows. Next landau_coeff with differentiation domination.
6. Dependency: ninth edition mixed closure denominator 1,484,705 declarations remains measured but not source-to-build authenticated; 11/11 local root references qualified. Kernel RUN10 reports cached axiom discrepancy and failed exposed collector; retry registered, not successful. Acceleration RUN10 manifest membership CLI not run on native manifest. No human proof completion ratio or performance claim.
7. Independent audit requested: check exponent 22.630 and inverse m sign, native N/Mrt identification, totalized division in lStar, same witness between h0_ge and Val, and whether the optional 1210 threshold is strictly local. Also check same-S/coatom guard and native representation dependencies requested by integration.

## 4. Numbered outstanding obligation groups (all OPEN)

1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, MemLoc.frob_laws, EmbOrbitAlt, LocPrime, TypeAt and local correspondence; native jhMult_rev_jac_sub and rhoNuRho_ofC plus underlying representation lemmas.
2. RecTExists/VWin, native host existence, ind_unique, ShortNorm, StagePow, relative-error/mass ratio and pair_share producer inputs.
3. Seven theta/literature inputs, 15 covolume premises, VacK/OrbRes, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH and literature trust; IwaQ local advance.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type and Green leaves.
5. Nine same-witness closures, Val/HostArith/FamP, native lattice/height/thick density, ReadL/MjHTie/IdxDefs, complex_section_finite_combination and archimedean boundary suppliers, slope/tDetD, native low-prime guard and served-ledger loss_bound_at. Blocks 10–15 and 21 expanded, not all blocks independently verified. RankVal existence remains.
6. Independent analytic tail, derivative, regularized-pole, landau_coeff differentiation and local-order audit and actual native caller.
7. Source/build-to-export equivalence, typed projections/challenge failure, metadata/package policy, independent kernel replay and axiom provenance; cached collector discrepancy open.
8. Independent audit of every essential derivation or precise established theorem citation, full joins, and revision equivalence if requested.

Coverage: 17/17 local rank-bound fields, 10/10 local block-15 fields, 40 source anchors, 11/11 peer pin/blob matches. Global mixed export denominator is 1,484,705 reachable declarations, independent translation numerator unknown; chapter counts are editorial progress only. Preflight: AGENTS, continuity, state/log/protocol excerpts, swarm/handoff/expansion/spine, prior editor and all eleven new peer RESUME notes inspected; other lane code-only changes indexed below, not all bodies reread. Latest physical CI checkpoint 381 unrelated to RH. Linked blueprint not reopened; source primary. No physics changes.

RESUME HERE: locate the exact native RankVal and Val/FamP existence constructors, using their dependent record fields rather than current default-branch search; trace from the pinned vwin_of_row consumer. If reverse roles are not available, finish block 16 szRow_gap_fun_fN with its direct producer, but do not count as native geometry closure. HANDOFF TO integration, audit, dependencies, kernel, and all specialists.

## 5. Peer appendix and source snapshot

Snapshot 036fa79b86ffb241441b9d2c1e07d308e7e233a9. Nine new primary chapters and two supporting reports follow in full. Code-only additions (not counted as mathematical chapters):
- [audit/2026-11-24_sum_th_normalization_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_sum_th_normalization_audit.mjs)
- [dependencies/rh_six_anchor_namespace_reconcile.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_six_anchor_namespace_reconcile.mjs)
- [math/verify_ind_drop_conductor_descent.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_drop_conductor_descent.py)
- [specialists/kernel_extractor/audit_rc1_visibility.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/audit_rc1_visibility.mjs)
- [specialists/kernel_extractor/run_native_cycle_rc1_isolated.sh](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run_native_cycle_rc1_isolated.sh)
- [specialists/on_acceleration/manifest_membership.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/manifest_membership.mjs)
- [structure/2026-11-24_1624_authenticated_role_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_1624_authenticated_role_frontier.mjs)


---

# Integrated chapter 104 — 2026-11-24_1600_NATIVE_SEGMENT_PRODUCERS.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1600_NATIVE_SEGMENT_PRODUCERS.md); blob 843285487fd35acc0d7c350248388c381b24052c. Peer text preserved; not independently replayed.

# Native segment representation and Langlands segment existence — 2026-11-24 16:00 UTC

RESULT SOURCE-MATCHED / PARTIAL. One integration contribution: reconstruct the two native segment producers left by 1500_ORDERED_EXISTENCE_EXHAUSTION, retaining their geometric and representation-theoretic frontier. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream HEAD 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC), different Main route per editor; not substituted.

## Project index and corrected coverage

Preflight: SWARM_PROTOCOL first; AGENTS, research state/log, runner protocol (root protocol path 404, recovered), continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, 1500 integration, dependency targeted roles, structure 1524, latest audit tied core, math pair-share and all ten specialist latest checkpoints, Grok covolume RUN2, final audit RUN8, Galois RUN6, Green RUN8, validation README, native family claim. Guessed RESUME_HERE.md paths returned 404; directory listing recovered actual checkpoints. Not all nested Grok files or the external blueprint reread. Physical checkpoint 378 PASS, 45425549365, unrelated to RH validation.

**Important correction to 1500 handoff:** the real authenticated export closure now succeeded, according to independently retrieved cathedral-research-state:compute/rh-mutual-metadata-closure-20261124/status.json (run 45412286798). Archive solution.ndjson.zst SHA256 5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e, 61,570,595,788 bytes; 1,484,705 reachable declarations / 1,484,733 indexed; 1,065,212,063 reachable expressions, 2,133,543,711 edges under the conservative explicit-export/inductive-package policy. Zero hard missing references; five absent mutual metadata-only members retained separately. Name 6019714 was such a member, not a missing hard reference. Reported axioms Classical.choice, Quot.sound, propext only under that policy. This is not independent kernel replay or demonstrated source-to-export equivalence. No human-proof completion percentage can be inferred from these counts.

Current manuscript index: specialists/proof_editor/2026-11-24_1556_INTEGRATED_MANUSCRIPT.md, volume VI linked to volumes I–V, 98 primary + 5 supporting entries. END_OF_DAY_MANUSCRIPT_SPINE.md remains the root chapter navigation. The new chapter below follows the 1500 integration chapter; typed source graph is additive and uses local IDs scoped to this chapter. Peer source-matched text and review are not elevated to kernel validation. Green RUN8 reports mass side closed in its companion, remaining WJ/WhMul, not independently rerun here. Formal audit latest tied-core preserves its subgroup membership guard. Specialist kernel RUN9 reports fixture collector discrepancies; no RH unsoundness conclusion. Dependency targeted role witnesses and source-to-export joins still pending. See each lane's checkpoint for the next work; no other lane modified.

## 1. The actual statement and the geometric input

For a nonarchimedean local field k, positive integers d and l, and smooth irreducible cuspidal σ of GL_d(k), SegmentRepresentation asks for an irreducible subrepresentation S of the ordered normalized product P of l successive determinant twists of σ. It asks for uniqueness as an actual subrepresentation of P, not merely a unique isomorphism class, and for an equivalence of the fine Jacquet module of S with the ordered external tensor. No characteristic-zero premise is added to this predicate. The native root constructs GeometricLemma from BernsteinZelevinskyFiniteness and GeometricLemmaFiltration: the two components are the given filtration and cell semisimplification. It then applies segRep_of stageP hG (segTwo_of hG rhoNuRhoReducibleC). Reducibility is supplied by the native complementary-series chain redClC, using signature, compactness, boundB, Hermitian pairing, product model, cusp unitarization and cusp pair irreducibility. Those bodies are not proved in this chapter.

## 2. From cell structure to ordered constituent

Each cell size matrix b in the relevant fine Jacquet calculation has row and column sums d; cuspidality and the cited entries_zero_or_d lemma imply each entry is 0 or d. Because d>0, each column has exactly one d entry and each row likewise. Let w(j) be the row containing the d in column j. It is injective (two distinct columns in one row would have sum at least 2d>d) and hence a permutation of the finite set. Row and column representation equivalences, and irreducibility of the target external tensor, identify the arbitrary irreducible subquotient with the tensor whose factors are permuted by w. The matrix argument does not prove the geometric lemma or the representation equivalences. In length two the only permutations are identity and reversal.

The multiplicity-one argument first obtains a unique irreducible S using jhMult(identity tensor, Jacquet(P))=1, existence of a simple submodule by finite length and nontriviality, and the fact that each simple submodule contributes at least one copy by adjunction. Injectivity of the Jacquet map bounds its multiplicity above by one; the atom bound gives the other inequality. In length two, segTwo_of excludes the reversed tensor by the native vanishing theorem jhMult_rev_jac_sub, which uses the reducibility hypothesis hR. The FineStep lemma then identifies the whole finite-length Jacquet module with the identity tensor, using multiplicity one and the fact that every irreducible subquotient is equivalent to it.

## 3. Why all local adjacent constraints apply to the SAME S

For each i with i+1<l, write l=i+2+q. Twist σ by i to form σ', still cuspidal, and use SegTwo on σ' to obtain an irreducible z embedded into the adjacent pair product and its prescribed Jacquet equivalence. Twist composition identifies its two classes with terms i and i+1 of the original segment. classMain inserts z in place of that pair between the unchanged prefix and suffix; rank remains unchanged, and exactness of parabolic induction gives an injection into the original product. Its nonzero range T_i is a subrepresentation of P.

For an irreducible constituent of Jacquet(T_i) identified with a permutation w of the original terms, multiplicity monotonicity gives jm>=1 in the compressed product. comb uses cell data and a row witness to give a strictly increasing embedding f:Fin 2→Fin l, matching the two selected classes. Injectivity of natural twists at positive cuspidal rank implies w(f(j))=i+j. Thus f(0)=w⁻¹(i), f(1)=w⁻¹(i+1), so w⁻¹(i)<w⁻¹(i+1).

Crucially, stageP gives a potentially different nonzero T_i for each i; one cannot simply intersect them. In segRep_of, every T_i contains an irreducible subrepresentation S'_i (exists_irred_le). Uniqueness already proved forces S'_i=S, so S≤T_i for EACH i. Jacquet subquotient transport allows the same constituent of Jacquet(S) to be tested by every hTw. Hence w⁻¹(0)<...<w⁻¹(l−1). An increasing bijection of Fin l is identity (the l strictly increasing distinct integers in [0,l−1] are exactly 0,...,l−1). For l=1 the empty constraint is sufficient. Thus w=1 and every irreducible constituent has the same class as the ordered tensor. The finite-length, multiplicity-one FineStep result yields the actual Jacquet equivalence, not merely a character identity. This closes the selected combinatorial/assembly argument conditional on all cited native leaves.

## 4. The independent decreasing-product socle and increasing-product cosocle

For any segment Δ, dec Δ reverses its injective term sequence. Consequently the set of permutations e fixing the entire dec sequence contains at most one element: dec(a)=dec(e(a)) implies e(a)=a. The native cuspidal-product Jacquet multiplicity formula gives multiplicity ≤1; the socle theorem gives an irreducible socle of prodIrr(dec Δ). This route is not a claim that every product has a socle of that special form without its cuspidality/rank hypotheses.

For the increasing product P=prodIrr(Δ.term) of rank Δ.deg, the pinned contragredient equivalence identifies smooth contra(P) with the decreasing product of segDual Δ. It supplies its own rank equality hd'. Apply the decreasing-product socle theorem to segDual Δ and transport the socle back by the INVERSE equivalence. Smoothness of P and finite length (parabolic induction from the irreducible external tensor) permit the cosocle theorem.

The cosocle argument is not a finite-dimensional double-dual assertion. For any coatom L of the subrepresentation lattice of P, P/L is smooth irreducible, hence admissible by hA; its smooth contragredient is irreducible by the cited compact-open/admissibility theorem. Pullback through the quotient gives an injective intertwiner into contra(P), whose range is an atom. By uniqueness of the given socle all these ranges equal the same nonzero simple subrepresentation. If L and M are distinct coatoms then L+M=P. A common nonzero smooth functional in the two pullback ranges annihilates L and M and therefore all of P, contradiction. Thus L=M. Finite length gives existence of a coatom (P nonzero because its dual has a nonzero socle) and places every proper subrepresentation under some coatom, hence under the unique L. The quotient P/L is the asserted cosocle by ProjLine.isCosocle_quot. The theorem constructs τ from that quotient; it does not assume smooth dual exactness for arbitrary modules. exists_isLSeg packages τ, the original rank equality hd, and its cosocle proof, then ProbeL.lSegExists supplies native irreducibleAdmissibleGL. No extra CharZero hypothesis inserted.

## 5. Executed certificate and trust boundary

{"anchors":112,"nodes":20,"edges":23,"perms":46233,"cells":36,"coatoms":1245,"negative":7}. All source blobs retrieved at the exact pin, connector SHA compared to fixed source ledger; source substring checks, selected graph reachability, exact permutation enumeration and cell incidence enumeration, and finite F2 annihilator model executed in V8 during this run. The finite model is explicitly not the native smooth representation; it checks the linear implication, not the representation-theoretic premises. No independent Lean kernel replay or reviewer acceptance. Source checks are not kernel edges. Negative controls for missing node, omitted guard, removed uniqueness transport and coatom premise, reversed order, zero-rank cell degeneracy, distinct witnesses. Failed attempts: guessed checkpoint paths and root protocol as above; summary.json path for closure was 404, status.json held actual evidence. No arithmetic regression failures after recovery. No URT benchmark claim.

## Typed proof obligation graph

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "scope": "Selected source-visible proof obligations; edges may be transitive. Not complete kernel graph.",
  "sources": {
    "root": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/SegmentRepresentation.lean",
      "34a619a412f132b48d60cf875fe0e86c57ca3ef3",
      [
        "theorem segmentRepresentation",
        "geometricLemma_of_filtration",
        "bernsteinZelevinskyFiniteness",
        "geometricLemmaFiltration",
        "SRC.segRep_of SRC.stageP hG (SRC.segTwo_of hG NR.rhoNuRhoReducibleC)"
      ]
    ],
    "pred": [
      "src/Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/SegmentRepresentation.lean",
      "c30050f5db4685cee71ddb9e57ba7d492b8cd6ac",
      [
        "def SegmentRepresentation",
        "0 < d → 0 < l",
        "IsCuspidal σ.ρ",
        "S'.toRepresentation.IsIrreducible → S' = S",
        "Nonempty ((jac"
      ]
    ],
    "geom": [
      "src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/GeometricLemmaOfFiltration.lean",
      "37893fffd0427aefe8f66a13dd531f1aacbec615",
      [
        "theorem geometricLemma_of_filtration",
        "BernsteinZelevinskyFiniteness →",
        "GeometricLemmaFiltration →",
        "⟨hF k, GlobalTheory.T.geometricLemma_cell_semisimplification_GL hB k⟩"
      ]
    ],
    "reduc": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "edef839707f5530496e6d41f642809d6f8ef78aa",
      [
        "theorem redClC",
        "someRed_of k",
        "complementary_of signature",
        "compact k",
        "boundB k",
        "herm_ofB k (conjProd k) (conjDual k)",
        "prodModel k",
        "cuspUnit k",
        "cuspPairIrr k",
        "theorem rhoNuRhoReducibleC",
        "rhoNuRho_ofC"
      ]
    ],
    "seg": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/SegRepOf.lean",
      "a83f6f8d9e4e6e15c0d3e78294b7b0f14c954095",
      [
        "def StageP",
        "GeometricLemma → PositivityTheory.Pf1.SegRepC.SegTwo",
        "0 < d → 0 < l",
        "i + 1 < l",
        "T.toSubmodule ≠ ⊥",
        "w.symm ⟨i, by omega⟩ < w.symm ⟨i + 1, hi⟩",
        "theorem segTwo_of",
        "Uniq.exists_unique_irred_sub",
        "SRC.jhMult_rev_jac_sub hG hR",
        "theorem segRep_of",
        "SRC.exists_perm_of_isSubquotient_jac",
        "Lift.perm_eq_one_of_lt_succ",
        "SRC.exists_irred_le",
        "huniq S' hS'",
        "PiLocalization₂.isSubquotient_jac_of_le",
        "nonempty_equiv_of_jhMult_eq_one"
      ]
    ],
    "stage": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/StageC.lean",
      "1af0b0b1236b338986c3284d9857387bdac3bbe7",
      [
        "theorem stageP : StageP",
        "l = i + 2 + q",
        "IrrGL.nu_nu",
        "exists_unit_one_add_generator h2 hd",
        "classMain",
        "(he.trans (Emb.of' (consec_equiv",
        "one_le_jm",
        "jm_le_of_isSubquotient",
        "obtain ⟨f, hf⟩ := comb",
        "IrrGL.nu_natCast_inj hx.1",
        "exact f.strictMono",
        "theorem classMain",
        "theorem comb",
        "Shuffle2.exists_cell_data",
        "Shuffle2.exists_row"
      ]
    ],
    "perm": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/SrPerm.lean",
      "78c875370b773a288168e0df487210d56b8ab7e9",
      [
        "theorem exists_perm_of_cell",
        "b.1 i j = 0 ∨ b.1 i j = d",
        "∑ j, b.1 i j = d",
        "∑ i, b.1 i j = d",
        "choose q hq",
        "have qinj",
        "Equiv.ofBijective q",
        "theorem exists_perm_of_isSubquotient_jac",
        "entries_zero_or_d",
        "theorem constituents_jac_sub"
      ]
    ],
    "uniq": [
      "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/ExistsUniqueIrredSub.lean",
      "ef251479f0ee8fed460dcbd11f4b15f489f79737",
      [
        "theorem exists_unique_irred_sub",
        "= 1)",
        "one_le_jhMult_jac_atom",
        "exists_isSocle_of_forall_isAtom",
        "JacInj.jacMap_injective",
        "jhMult_le_of_injective"
      ]
    ],
    "probe": [
      "src/Development/WeilBound/CoreStatements/AutomorphicKernels/LanglandsExhaustion/ProbeL.lean",
      "67db9b23ea247d3ff68932b27f78ce473c54d06b",
      [
        "theorem PositivityTheory.Exh.lSegExists",
        "Zc.LSegExists k",
        "SegExists.exists_isLSeg PositivityTheory.Exh.irreducibleAdmissibleGL"
      ]
    ],
    "lseg": [
      "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/ExistsSegmentRepresentation.lean",
      "5449e88892b34cb649048d13225cf3fac0b40eff",
      [
        "theorem hasFiniteLength_prodIrr",
        "inductionFiniteLength",
        "theorem exists_isLSeg",
        "Δ.sum_term_fst",
        "contragredient_segment_product_equiv hA Δ hd",
        "exists_socle_segment_product hA (segDual Δ) hd'",
        "isCosocle_of_isSocle_contra",
        "hτ'.of_equiv (.refl _) φ.symm",
        "exact ⟨τ, hd, hτ⟩"
      ]
    ],
    "sprod": [
      "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/ExistsSocleSegmentProduct.lean",
      "b841bc1b3394cc79a7ba66beae3cf051fe64c30b",
      [
        "theorem dec_injective",
        "segment_term_injective hA Δ",
        "Fin.rev_injective",
        "theorem ncard_perm_dec_le_one",
        "Set.ncard_le_one_iff_subsingleton",
        "theorem exists_isSocle_prodIrr_dec",
        "exists_isSocle_of_jm_le_one",
        "jacquet_multiplicity_cuspidal_product hA (dec Δ) (dec Δ) hd hd hc hc"
      ]
    ],
    "swrap": [
      "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/ExistsSocleSegmentProductStatement.lean",
      "eddf06e646d8838be6907ab2bd22e51f75298b70",
      [
        "GlobalTheory.T.exists_socle_segment_product",
        "SegSocle.exists_isSocle_prodIrr_dec"
      ]
    ],
    "contra": [
      "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/ContragredientSegmentProductEquivStatement.lean",
      "a6849897ae5d30a31e047d5cc71830d005d97da2",
      [
        "GlobalTheory.T.contragredient_segment_product_equiv",
        "contra (prodIrr Δ.term hd)",
        "prodIrr (dec (segDual Δ)) hd'",
        "SegIncDual.contra_prodIrr_term"
      ]
    ],
    "cos": [
      "src/Development/AutomorphicSpectrum/Proofs/BlockDecomposition/CosocleOfContragredientSocle.lean",
      "95f6b22655b9cd4d703a46893094a8e00d6fd60a",
      [
        "theorem isIrreducible_quot_of_isCoatom",
        "def pullContra",
        "theorem pullContra_injective",
        "theorem pullContra_apply_eq_zero",
        "theorem eq_of_isCoatom_of_mem_range",
        "hS.sup_eq_top_of_ne hS' hne",
        "theorem isCosocle_of_isSocle_contra",
        "IsSmooth π → HasFiniteLength π",
        "contra_isIrreducible",
        "WellFoundedGT",
        "eq_top_or_exists_le_coatom",
        "have huniq",
        "have hall",
        "ProjLine.isCosocle_quot"
      ]
    ]
  },
  "roots": [
    "segment",
    "lsegRoot"
  ],
  "nodes": [
    {
      "id": "segment",
      "file": "root",
      "decl": "PositivityTheory.RgGu.segmentRepresentation",
      "deps": [
        "predicate",
        "geometric",
        "stageP",
        "two",
        "allLen"
      ],
      "guard": "local field, d,l>0, smooth irreducible cuspidal input; native suppliers retained",
      "frontier": [],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "predicate",
      "file": "pred",
      "decl": "GlobalTheory.Published.SegmentRepresentation",
      "deps": [],
      "guard": "d,l>0; IsCuspidal; existence + uniqueness as subrepresentation + Jacquet equivalence",
      "frontier": [],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "geometric",
      "file": "geom",
      "decl": "GlobalTheory.geometricLemma_of_filtration",
      "deps": [],
      "guard": "BernsteinZelevinskyFiniteness and GeometricLemmaFiltration",
      "frontier": [
        "geometricLemma_cell_semisimplification_GL",
        "native BernsteinZelevinskyFiniteness",
        "native geometricLemmaFiltration"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "reduc",
      "file": "reduc",
      "decl": "PositivityTheory.RgGu.NR.rhoNuRhoReducibleC",
      "deps": [],
      "guard": "native local-field complementary-series construction",
      "frontier": [
        "rhoNuRho_ofC",
        "redCl_ofC",
        "someRed_of",
        "signature",
        "compact",
        "boundB",
        "herm_ofB",
        "conjProd",
        "conjDual",
        "prodModel",
        "cuspUnit",
        "cuspPairIrr"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "two",
      "file": "seg",
      "decl": "PositivityTheory.RgGu.SRC.segTwo_of",
      "deps": [
        "geometric",
        "reduc",
        "unique",
        "perm"
      ],
      "guard": "GeometricLemma and RhoNuRhoReducible; d>0 and cuspidality",
      "frontier": [
        "jhMult_rev_jac_sub",
        "jhMult_jac_multiProd",
        "FineStep.nonempty_equiv_of_jhMult_eq_one",
        "hasFiniteLength_jac_sub"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "unique",
      "file": "uniq",
      "decl": "PositivityTheory.Pf1.SegRepC.Uniq.exists_unique_irred_sub",
      "deps": [],
      "guard": "d,l>0; cuspidality; identity tensor multiplicity exactly one",
      "frontier": [
        "one_le_jhMult_jac_atom",
        "exists_isSocle_of_forall_isAtom",
        "JacInj.jacMap_injective",
        "inductionFiniteLength"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "perm",
      "file": "perm",
      "decl": "PositivityTheory.RgGu.SRC.exists_perm_of_isSubquotient_jac",
      "deps": [
        "cell"
      ],
      "guard": "GeometricLemma; d,l>0; cuspidality; irreducible constituent is subquotient",
      "frontier": [
        "exists_cell_of_isSubquotient",
        "Perm.entries_zero_or_d"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cell",
      "file": "perm",
      "decl": "PositivityTheory.RgGu.SRC.SrPerm.exists_perm_of_cell",
      "deps": [],
      "guard": "d>0; row/column sums d; cells 0 or d; row and constituent subquotient premises",
      "frontier": [
        "row_class",
        "col_class",
        "piTensor_isIrreducible_of_schur"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "stageP",
      "file": "stage",
      "decl": "PositivityTheory.RgGu.SRC.stageP",
      "deps": [
        "pairEmbed",
        "shuffle"
      ],
      "guard": "GeometricLemma; SegTwo; d,l>0; cuspidality; i+1<l; arbitrary irreducible subquotient and matching permutation",
      "frontier": [
        "jm_le_of_isSubquotient",
        "IrrGL.nu_natCast_inj",
        "exists_unit_one_add_generator",
        "Emb.range"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "pairEmbed",
      "file": "stage",
      "decl": "PositivityTheory.RgGu.SRC.StageC.classMain",
      "deps": [],
      "guard": "consecutive pair; rank sum equality; injective intertwiner",
      "frontier": [
        "emb_left",
        "emb_right",
        "product_irreducible_append_equiv"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "shuffle",
      "file": "stage",
      "decl": "PositivityTheory.RgGu.SRC.StageC.comb",
      "deps": [],
      "guard": "cuspidal equal-rank pair; prescribed Jacquet equivalence; jm>=1",
      "frontier": [
        "Shuffle2.exists_cell_data",
        "Shuffle2.exists_row"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "allLen",
      "file": "seg",
      "decl": "PositivityTheory.RgGu.SRC.segRep_of",
      "deps": [
        "stageP",
        "two",
        "unique",
        "perm"
      ],
      "guard": "StageP, GeometricLemma, SegTwo; d,l>0, cuspidality",
      "frontier": [
        "Lift.perm_eq_one_of_lt_succ",
        "exists_irred_le",
        "PiLocalization₂.isSubquotient_jac_of_le",
        "FineStep.nonempty_equiv_of_jhMult_eq_one",
        "jacquetFiniteLength"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "lsegRoot",
      "file": "probe",
      "decl": "PositivityTheory.Exh.lSegExists",
      "deps": [
        "lseg"
      ],
      "guard": "local field; IrreducibleAdmissibleGL native supplier",
      "frontier": [
        "irreducibleAdmissibleGL"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "lseg",
      "file": "lseg",
      "decl": "GlobalTheory.CompanionTheory.SegExists.exists_isLSeg",
      "deps": [
        "socWrap",
        "contra",
        "cos",
        "finite"
      ],
      "guard": "local field; hA:IrreducibleAdmissibleGL; segment Δ; rank identity",
      "frontier": [],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "finite",
      "file": "lseg",
      "decl": "GlobalTheory.CompanionTheory.SegExists.hasFiniteLength_prodIrr",
      "deps": [],
      "guard": "hA; rank sum; smooth irreducible factors",
      "frontier": [
        "BZInd.inductionFiniteLength",
        "SocleJm.isIrreducible_piTensor"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "socWrap",
      "file": "swrap",
      "decl": "GlobalTheory.T.exists_socle_segment_product",
      "deps": [
        "socProd"
      ],
      "guard": "hA; decreasing sequence rank sum",
      "frontier": [],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "socProd",
      "file": "sprod",
      "decl": "GlobalTheory.CompanionTheory.SegSocle.exists_isSocle_prodIrr_dec",
      "deps": [],
      "guard": "hA; segment Δ; all dec terms cuspidal; rank sum",
      "frontier": [
        "segment_term_injective",
        "jacquet_multiplicity_cuspidal_product",
        "exists_isSocle_of_jm_le_one"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "contra",
      "file": "contra",
      "decl": "GlobalTheory.T.contragredient_segment_product_equiv",
      "deps": [],
      "guard": "hA; rank sum; inverse direction of equivalence preserved",
      "frontier": [
        "SegIncDual.contra_prodIrr_term"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "cos",
      "file": "cos",
      "decl": "GlobalTheory.CompanionTheory.CosocleContra.isCosocle_of_isSocle_contra",
      "deps": [
        "coatom"
      ],
      "guard": "hA; smooth π; finite length π; irreducible τ' with IsSocle in smooth contra π",
      "frontier": [
        "contra_isIrreducible",
        "compactOpen_basis",
        "ProjLine.isCosocle_quot"
      ],
      "status": "SOURCE-MATCHED"
    },
    {
      "id": "coatom",
      "file": "cos",
      "decl": "GlobalTheory.CompanionTheory.CosocleContra.eq_of_isCoatom_of_mem_range",
      "deps": [],
      "guard": "S,S' coatoms; common NONZERO smooth functional in both pullContra ranges",
      "frontier": [
        "pullContra_injective",
        "pullContra_apply_eq_zero"
      ],
      "status": "SOURCE-MATCHED"
    }
  ]
}
```

## Standalone replay

Extract graph.json and test.mjs from this note and run node test.mjs /path/to/pinned/rh checkout. This also independently hashes raw source blobs, stricter than connector metadata matching in this run.

```js
import fs from 'node:fs';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const g=JSON.parse(fs.readFileSync(new URL('./graph.json',import.meta.url),'utf8'));
const repo=process.argv[2];if(!repo)throw Error('provide RH checkout');
const src={};for(const [k,[p,sha]] of Object.entries(g.sources)){const b=execFileSync('git',['-C',repo,'show',g.pin+':'+p],{maxBuffer:32*1024*1024});if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+p);src[k]=b.toString('utf8')}
function test(g,src){
 const ck=(x,m)=>{if(!x)throw Error(m)};let anchors=0,edges=0,perms=0,cells=0,coatoms=0,negative=0;
 function verify(g,src){let a=0,e=0;for(const [k,[,sha,ss]] of Object.entries(g.sources)){ck(sha.length===40&&typeof src[k]==="string","source "+k);for(const s of ss){ck(src[k].includes(s),k+":"+s);a++}}const m=new Map(g.nodes.map(n=>[n.id,n]));ck(m.size===g.nodes.length,"duplicate");let seen=new Set(),vis=new Set();function walk(id){ck(!vis.has(id),"cycle");if(seen.has(id))return;const n=m.get(id);ck(n&&g.sources[n.file]&&n.guard&&Array.isArray(n.frontier),"missing node/guard "+id);ck(src[n.file].includes(n.decl.split(".").at(-1)),"missing declaration "+id);vis.add(id);for(const d of n.deps){e++;walk(d)}vis.delete(id);seen.add(id)}for(const r of g.roots)walk(r);ck(seen.size===m.size,"orphan");return [a,e]}
 [anchors,edges]=verify(g,src);
 function eachPerm(n,f,p=[],used=0){if(p.length===n){f(p);return}for(let i=0;i<n;i++)if(!(used&(1<<i)))eachPerm(n,f,[...p,i],used|(1<<i))}
 function inv(p){const q=[];p.forEach((x,i)=>q[x]=i);return q}
 function adj(p){const q=inv(p);return q.slice(1).every((x,i)=>q[i]<x)}
 for(let n=1;n<=8;n++)eachPerm(n,p=>{ck(adj(p)===p.every((x,i)=>x===i),"adjacent inverse order");for(let i=0;i+1<n;i++){const f=[p.indexOf(i),p.indexOf(i+1)];ck((f[0]<f[1])===(inv(p)[i]<inv(p)[i+1]),"position witness")}perms++});
 for(let n=1;n<=3;n++)for(let d=1;d<=4;d++)for(let bits=0;bits<(1<<(n*n));bits++){let rows=Array(n).fill(0),cols=Array(n).fill(0),q=Array(n).fill(-1);for(let i=0;i<n;i++)for(let j=0;j<n;j++)if(bits&(1<<(i*n+j))){rows[i]+=d;cols[j]+=d;q[j]=i}if(rows.every(x=>x===d)&&cols.every(x=>x===d)){ck(new Set(q).size===n&&q.every(x=>x>=0),"cell permutation");cells++}}
 // Exact finite vector-space model of the annihilator step, over F2 (not a native smooth representation).
 function dot(a,b){let z=a&b,p=0;while(z){p^=z&1;z>>=1}return p}
 for(let n=1;n<=5;n++)for(let a=1;a<(1<<n);a++)for(let b=1;b<(1<<n);b++){const h=x=>dot(a,x)===0,j=x=>dot(b,x)===0;let equal=true;for(let x=0;x<(1<<n);x++)if(h(x)!==j(x))equal=false;let common=[];for(let l=1;l<(1<<n);l++){let ok=true;for(let x=0;x<(1<<n);x++)if((h(x)||j(x))&&dot(l,x)!==0)ok=false;if(ok)common.push(l)}ck(equal===(a===b)&& (common.length>0)===equal,"coatom common annihilator");coatoms++}
 function reject(f){let bad=false;try{f()}catch(e){bad=true}ck(bad,"negative accepted");negative++}
 reject(()=>verify({...g,nodes:g.nodes.filter(n=>n.id!=="unique")},src));
 reject(()=>verify({...g,nodes:g.nodes.map(n=>n.id==="cos"?{...n,guard:""}:n)},src));
 reject(()=>verify(g,{...src,seg:src.seg.replace("huniq S' hS'","REMOVED")}));
 reject(()=>verify(g,{...src,cos:src.cos.replace("hS.sup_eq_top_of_ne hS' hne","REMOVED")}));
 reject(()=>ck(adj([1,0]),"reversed permutation"));
 reject(()=>ck(new Set([0,0]).size===2,"zero rank arbitrary cells"));
 reject(()=>ck([0,1].every(x=>x===0)||[0,1].every(x=>x===1),"nonunique witnesses not interchangeable"));
 return {anchors,nodes:g.nodes.length,edges,perms,cells,coatoms,negative}
}
console.log(JSON.stringify(test(g,src),null,2));
```

RESUME HERE: expand native jhMult_rev_jac_sub and rhoNuRho_ofC, beginning with JhMultRevJacSub.lean and RhoNuRhoOfC.lean; keep reducibility and length-two reversal exclusion separate. HANDOFF TO editor (append this chapter and correct the solved export metadata obstruction), audit (check same-S transport and coatom nonzero guard), dependencies (source-bound direct role evidence). Project OPEN; no physics changes.


---

# Integrated chapter 105 — 2026-11-24_ind_drop_conductor_descent.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_ind_drop_conductor_descent.md); blob d78e3caaed781c4038156acc6303a4a11c367e68. Peer text preserved; not independently replayed.

# MATH lane — `QH.ind_drop`: conductor identification behind the Jacobi-twist modulus change

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the exact theorem `QH.ind_drop`, with a finite arithmetic regression attached.  
**Status:** PARTIAL for the full RH reconstruction. This is neither a Lean kernel replay nor a proof of the analytic inputs or RH.

## Source pin and scope

Upstream repository: `leanprover-community/riemann-hypothesis` at the required revision
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | theorem reconstructed |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean` | `5443adc0075731900672030d140d5d8c85b668f7` | canonical primitive Jacobi twist |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean` | `d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e` | uniqueness in the sigma type of modulus-character pairs |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | exact definition of `Ind` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | sole downstream call in `pairEx_box` |

The upstream default branch no longer contains `IndDrop.lean` at this path (direct retrieval returned
404), so every statement below is tied to the pinned revision rather than silently read from current
HEAD.

## 1. Exact statement and definitions

For a Dirichlet character `psi` of level `N`,

`Ind psi f M := psi.IsPrimitive ∧ ∀ n, Coprime(n,M) → psi(n mod N)=f(n)`.

Thus the final argument is a **testing modulus for admissible integers**. It is not necessarily the
level of `psi` and does not assert a divisibility relation between two levels.

The theorem quantifies over naturals `N0,q,M,N`, a character `xi` modulo `N0`, and a character `chi`
modulo `N` (with `[NeZero N]`). Its hypotheses are

1. `0 < N0`;
2. `q.Prime`;
3. `q != 2`;
4. `not q divides N0`;
5. `M != 0`;
6. `Ind chi (fun n => xi(n) * J(q,n)) M`.

Its conclusion is

`Ind chi (fun n => xi(n) * J(q,n)) (N0*q)`.

No premise says `M | N0*q`, `N0*q | M`, or `q` is coprime to `M`. The proof therefore cannot be a
restriction or extension of coprimality by divisibility alone.

## 2. Construct the canonical primitive twist

Split the input induction as

- `chi.IsPrimitive`; and
- for every `n` coprime to `M`,
  `chi(n mod N)=xi(n mod N0) J(q,n)`.

The conductor `f=xi.conductor` is nonzero and divides `N0`. Hence `q∤N0` implies `q∤f`: if `q|f`,
transitivity with `f|N0` contradicts the hypothesis.

Apply pinned `QH.twist_prim` to `xi.primitiveCharacter` at the prime `q`. The hypotheses used here are
exactly primitive-character primitivity, `q.Prime`, `q!=2`, and `q∤f`. It returns a character

`psi : DirichletCharacter C (f*q)`

such that

1. `psi.IsPrimitive`;
2. `psi != 1`; and
3. for every natural `n`,
   `psi(n mod f*q)=xi.primitiveCharacter(n mod f) * J(q,n)`.

`ind_drop` deliberately discards item 2: nonprincipality is not needed for this conductor argument.
It does not discard primitivity or the evaluation formula.

## 3. The change-level equality is local, not global

Because `f|N0`, `xi` is the change of level of its primitive character. The equality of evaluations
used by the proof is only

`Coprime(n,N0) → xi(n mod N0)=xi.primitiveCharacter(n mod f)`.

It comes from `DirichletCharacter.changeLevel_eq_cast_of_dvd'` and
`changeLevel_primitiveCharacter`. The coprimality guard is essential: away from units modulo `N0`,
the change-level character can vanish even when the primitive character at conductor `f` does not.
The proof never claims equality for every integer.

## 4. Identify `chi` and `psi` by primitive uniqueness

Invoke `QH.ind_unique` with the two levels `N` and `f*q` and comparison modulus

`L = M*N0*q`.

The required `L!=0` follows separately from `M!=0`, `N0>0`, and the nonzero prime `q`. Now let
`n` be coprime to `L`. Since `M|L` and `N0|L`, coprimality descends to both factors:

1. `Coprime(n,M)`, so the input induction gives
   `chi(n mod N)=xi(n mod N0) J(q,n)`;
2. `Coprime(n,N0)`, so the guarded change-level equality changes the right-hand side to
   `xi.primitiveCharacter(n mod f) J(q,n)`;
3. the twist formula identifies that product with `psi(n mod f*q)`.

Thus the two primitive characters agree on every integer coprime to the nonzero comparison modulus.
Pinned `ind_unique` concludes equality in the dependent sigma type

`⟨N,chi⟩ = ⟨f*q,psi⟩ : Sigma (fun n => DirichletCharacter C n)`.

This is stronger than a loose pointwise statement: `Sigma.mk.inj_iff` first forces
`N=f*q` and then gives heterogeneous equality of the characters. After substituting the level
equality, `eq_of_heq` yields ordinary equality `chi=psi`. This dependent-type transport is the
difficult step hidden by the phrase “uniqueness of primitive inducing characters.”

`ind_unique` itself is an imported proved theorem, not an axiom silently removed here. Its pinned
proof lifts both characters to a common level, uses equality on units, and combines
`factorsThrough_gcd` with primitivity to force equality of the conductors and then the characters.

## 5. Re-establish induction at `N0*q`

Keep the original proof that `chi` is primitive. After the identification `chi=psi`, let
`n` satisfy `Coprime(n,N0*q)`. Because `N0 | N0*q`, it follows that `Coprime(n,N0)`. Therefore

`chi(n) = psi(n)`

`= xi.primitiveCharacter(n) J(q,n)` by the twist formula

`= xi(n) J(q,n)` by the guarded change-level equality.

This is precisely the second conjunct of `Ind chi (...) (N0*q)`. Notice that `M` has disappeared
from the target only after the primitive character has been identified; no direct set inclusion
between `Coprime(-,M)` and `Coprime(-,N0*q)` was asserted.

## 6. Downstream call and correction to the earlier interpretation

Pinned `pairEx_box` uses this theorem only in the branch `(i,j)=(1,0)`. It passes

- theorem `N0 := 8*M0`;
- theorem `M := 2*M0*q*d`;
- target testing modulus `(8*M0)*q`.

The earlier MATH chapter correctly reported the conductor construction and uniqueness step, but
called the target modulus “smaller” and described `ind_drop` as dropping an excess `d`-factor. That
language is unsafe. In the concrete witness `M0=1,q=11,d=263`, the source testing modulus is `5786`
and the target is `88`; neither divides the other. What changes is the coprimality domain after the
primitive inducing character has been identified, not a modulus by arithmetic cancellation.

The application also preserves the needed hypotheses: `q` is prime, `q!=2`, `q∤8*M0`, and
`2*M0*q*d!=0`. The conclusion supplies exactly the `Ind ... (8*M0*q)` premise expected by `GoodQ`.

## Independently executed checks

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_drop_conductor_descent.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_ind_drop_conductor_descent.py
```

The checker validates all five pinned source/blob entries and required report anchors. It exhaustively
checks the two coprimality restrictions used above over deterministic finite ranges, checks that a
prime excluded from `N0` is excluded from every divisor representing a possible conductor, and
evaluates a concrete change-level/Jacobi-twist fixture. That fixture confirms equality on the guarded
unit domain while exhibiting `n=2` as a counterexample to the forbidden global change-level equality.
It also verifies the actual `pairEx_box` source and target moduli need not divide one another.

These are regression checks for the arithmetic routing, not a replacement for Lean elaboration or
for the theorem `ind_unique`.

## Failed attempts / limitations

- Direct retrieval of `IndDrop.lean` from upstream current HEAD returned 404; the pinned commit was
  required.
- Treating the result as divisibility monotonicity fails on the concrete downstream moduli
  `5786` and `88`.
- Removing the coprimality guard from the change-level equality fails at the attached fixture's
  `n=2`.
- Allowing `q|N0` does not justify `twist_prim`; for example `N0=15,q=3,f=3` violates its
  `q∤f` premise.
- Allowing `M=0` makes the comparison modulus zero and violates the explicit `ind_unique` premise.
- No local checkout of the full Lean dependency graph is present, so this run does not claim a
  kernel replay. The current upstream deletion also prevents interpreting the pinned theorem as an
  unchanged current API.

## RESUME HERE

Trace pinned `QH.ind_unique` one layer deeper: reconstruct the common-level lifts, the exact
`factorsThrough_gcd` implications in both directions, and how primitivity converts them into the two
conductor divisibilities that force equality of levels. Preserve its `M!=0` premise and dependent
sigma equality; do not repeat `ind_drop`, `pairEx`, or the completed witness extraction.

**HANDOFF TO:** MATH, character-box, dependency, audit, integration.


---

# Integrated chapter 106 — RUN10_PIN_CARDINALITY_LEVEL_INDEX.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN10_PIN_CARDINALITY_LEVEL_INDEX.md); blob 52381f4903112ed0d78e4ee6c80ff68c70bd77b1. Peer text preserved; not independently replayed.

# RUN10 — Exact level index and five Pins consequences
2026-11-24. SOURCE-MATCHED human derivation with finite explanatory regression; not Lean replay. Main reachability still requires authenticated elaborated evidence.

## Selection and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity/research state/log/protocol, physical CI checkpoint #380 (not RH), RUN9 and relevant RUN1/2/6/8, recent handoffs in kernel, acceleration, theta, Galois, prime, Landau, literature, geometry, editor, dependency, structure, math and integration. Audit directory has scripts but no recent markdown handoff. Blueprint not reread this run. No duplication of previous lattice identities or row-to-window argument. Local git DNS failed and Lean executable absent. GitHub code search gave zero results for divisionCompatible_at_readIdentifications, divTied3_read, MjHIds (not proof of no callers). The authenticated targeted-role job status reports exit 1 after source-anchor mismatch (LFunction_modOne_eq) and projection child failure; only six different anchors projected, not our roots. The earlier stream-closure job likewise reports exit 1 (byte/hash mismatch). RC1 isolated job passes on synthetic cycle fixture, not RH. Do not repeat those jobs. ReadL definition located, not its initial producer. Choose a distinct bounded direct dependency of divTied3_read that has not been translated in RUN1–9: pins_card_index_ranks. This supplies the group-index input of the DivDef3 branch, not the outstanding MjHTie or IdxDefs existence claims.

## 1. Exact theorem and quantifiers
Pinned source leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.Mem.R3.pins_card_index_ranks: for every D:D7, finite group G, types Pl0,I0,T, A3:FamIn3 D.what₂.LL G Pl0 I0 (List ℕ) T D.R.m, number field Ks with Algebra Ks D.what₂.LL, R:RealDat3 D A3 Ks, F:Face3 D A3, cG:G0 R.Pg D.R.r ≃* G0g D.nd, assume Pins R F cG. Then ALL five equations hold:
1. Fintype.card G = D.what₂.restRowsFiniteGroupCard.
2. Nat.card F.P0 = Nat.card F.P1 * (D.host.g 0 * D.host.g 1)^(D.R.k * D.R.f).
3. A3.A.r = D.R.r.
4. A3.A.t = D.R.t.
5. A3.A.v0 = InfinitePlace.mk D.what₂.embLL.
The theorem does not require Holds, ReadL, MjHTie or IdxDefs. It uses two fields of Pins: h.char.base.fam.tie (gramR,c0R,c0L,hT) and h.keep.psi (Pg,pl,res,ψ,eC,hL,another field). Retain the complete Pins premise, including phs and trSem, and all Keep/WeakCharacterisation fields. Do not infer Pins itself from these five consequences.

## 2. Count the level subgroups without enumeration
GlobalTheory.Mem.GrpCount.card_unitri: for a commutative ring κ, rank r, relation Fr on Fin r × Fin r with Fr(i,j) implying i<j, and an EXISTING subgroup H of GL_r(κ), assume exact membership characterization: all entries below the diagonal zero, every diagonal entry 1, every upper entry outside Fr zero. Let S={(i,j):Fr(i,j)}. Define f:S→κ ↦ M_f with diagonal 1, free entries f, all others 0. Since upper triangular and unit diagonal, det M_f=1, so it is invertible even over a commutative ring. Membership follows by the reverse implication of hH. Reading free entries in an H-element is the inverse map, by the forward implication of hH and entrywise equality. Thus Nat.card H = (Nat.card κ)^(Nat.card S), via Nat.card_congr and Nat.card_fun. Lean states Nat.card without a Fintype κ premise; for the actual finite residue fields this is ordinary finite cardinality. No claim that arbitrary Fr defines a subgroup: hH is required, e.g. allowing only entries (0,1),(1,2) but not (0,2) is not closed under multiplication.

card_unip uses all i<j, hence N=r(r−1)/2 free entries. card_unipCol(a,c) excludes the entries (i,c) with a≤i<c. card_pairs_split assumes a≤c<r: excluded entries are bijective with Fin(c−a), via i↦i−a, inverse j↦(a+j,c). Partition upper positions into excluded and retained, so N=N_retained+(c−a), including a=c. For any finite residue field with q elements, ordinary upper unipotent group has q^N elements, the prescribed column subgroup has q^(N−(c−a)) elements. This is cardinality, not a claimed group isomorphism to an additive group or normal quotient. card_pi gives the cardinality of a finite product of subgroups via the subtype equivalence.

## 3. Apply the exact level tie
GlobalTheory.Mem.GrpCount.index_of_lvlTie: universally quantified D, group G, subgroups Q0,Qs and characters ψ0,ψs, eG:G≃*G0g D.nd, Pg finite place set, pl:(Σ k:Fin 2,D.nd.PlG k)≃Pg, residue-ring equivalences res(kv):kP(pl kv)≃+*ZMod(D.host.g kv.1), ψ local additive-character family, eC:G≃*G0 Pg D.R.r. Assume h:LvlTie D Q0 ψ0 Qs ψs eG Pg pl res ψ eC. Then Nat.card Q0 = Nat.card Qs * (g0*g1)^(k*f), where k=D.R.k, f=D.R.f, g_i=D.host.g i.

Set r=D.R.r, a=D.R.rS, c=a+k. Original Ranks.rS, Ranks.r, D.R.two_le_m imply c<r. symPos_injective for a+k≤r supplies injectivity of the native index map; finite self-injection is a bijection σ. It is used to reindex both rows and columns of each local matrix, not just one index. h.p0 identifies Q0 through eC with the native P0 product of unip subgroups. h.ps identifies Qs through eC followed by σ reindexing with PsharpSym product of unipCol subgroups. Both directions of h.ps are needed; the existential y is forced by entrywise equality. These are equivalences of subtypes for cardinality.

For each place PP∈Pg write q_PP=Nat.card(kP PP). The two cardinalities are products of q_PP^N and q_PP^(N−k), respectively. By card_pairs_split and pow_add:
  |Q0| = |Qs| * product_PP q_PP^k.
The bijection pl reindexes the last product. The ring equivalences res give q_PP=g_i by Nat.card_zmod, and D.nd.card_PlG gives f places for EACH i=0,1. Thus product_PP q_PP^k = (g0*g1)^(k*f). No division by a potentially zero cardinality, no inequality or limiting step, no assumption about ordinary integer primality beyond the original arithmetic data. The two families of places, exact reindexing and same k are essential.

## 4. Remaining four Pins equations and downstream guard
For total group cardinality use the composite equivalence R.eG.trans cG; rewrite with D.nd.restN_card_levelGroup_eq, Nat.card_pi, Fintype.prod_sigma and D.nd.card_PlG. In the target, the repeated GL(Fin r,ZMod(g_i)) cardinality is taken f times for each of two i. No independent GL-order formula is needed by this proof. The rank equations and distinguished infinite-place equality are projections hT.ranks.2.1, hT.ranks.2.2, hT.v0. The underlying proofs of hT and hL are not supplied by this lemma.

GlobalTheory.divTied3_read obtains ⟨hcard,hidx,hr,ht,hv0⟩ from this theorem; the first two arguments discharge the exact guard hGrp : card equality → level-index equality → GrpTie. The original hGrp is an additional hypothesis, not a result of counting. hr,ht fill ranks with rfl; hv0 fills the appropriate tup field with Y.tup0,Y.muAt and injectivity from Y.tupT_tup. This completes the group/cardinality/rank/infinite-place *adapter*, not full DivDef3: sharp,base,mt,th,cols are still the original inputs/producers. DivRows3 remains a separate implication requiring MjHTie, IdxDefs, D.BuRational and CxData.BtVanish.

ReadL definition (StableIffCarrierEq lines 200–217) is a dependent data record with two linear equivalences eRR/eRR0; jEE/jEE0 for all coordinates; met/met0 for every infinite place other than A3.A.v0 and all coordinate pairs; rr/rr0; jW for every i:Fin m; jW_read for all i,y; etaJ for all i,w with a twisted-place membership branch. This is NOT an existence theorem. Its initial producer is still unlocated.

## 5. Source manifest / actual static checks
Paths under src/; P=Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/, D=Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/.
- P/PinsCardIndexRanks.lean blob 04985046149dee04230630862a68aa6cc8b9fa29, lines 14–225, declarations card_unitri, card_unip, card_unipCol, card_pairs_split, card_pi, symPos_injective, index_of_lvlTie, pins_card_index_ranks.
- P/DivisionCompatibleAtReadIdentifications.lean blob b6594122a28670a9dca1e61b23f5be9594f7f877, GlobalTheory.divTied3_read, hGrp hcard hidx.
- P/DivisionCompatibleAtReadIdentificationsStatement.lean blob 177af5c6db7dba139da090fad705db744787566c, GlobalTheory.T.divisionCompatible_at_readIdentifications delegates to GlobalTheory.divTied3_read.
- D/StableIffCarrierEq.lean blob fb830f947211844fc7ac84cf567912d29cf09601, lines 63–91 Keep/Pins/Holds, 200–217 ReadL.

Executed 50 connector V8 source assertions (4 returned SHA equalities, 46 substring anchors). Reproduce via git rev-parse PIN:src/PATH and git show PIN:src/PATH, check declaration/anchors above. Anchor inventory for exact replay by source order:
1. theorem card_unitri; hFr : ∀ i j, Fr i j → i < j; hH : ∀ g : GL; Matrix.det_of_upperTriangular; Matrix.nonsingInvUnit; Nat.card_congr e, Nat.card_fun; theorem card_unip; theorem card_unipCol; theorem card_pairs_split; (hac : a ≤ c) (hc : c < r); p.1.1.val - a; theorem card_pi; theorem symPos_injective; theorem index_of_lvlTie; D.R.two_le_m; h.p0 g; h.ps g; card_pairs_split; Nat.card_zmod; D.nd.card_PlG; pow_add; theorem pins_card_index_ranks; h.char.base.fam.tie; h.keep.psi; hT.ranks.2.1; hT.ranks.2.2; hT.v0.
2. theorem GlobalTheory.divTied3_read; pins_card_index_ranks; grp := hGrp hcard hidx; ranks := ⟨rfl, hr, ht⟩; Y.muAt, hv0; MjHTie; IdxDefs; intro hMj hIdx hBu hBt.
3. theorem _root_.GlobalTheory.T.divisionCompatible_at_readIdentifications; exact @GlobalTheory.divTied3_read.
4. structure Keep; psi : PsiPPTie; structure Pins; char : R.WeakCharacterisation F; keep : Keep; structure Holds; structure ReadL; jW_read; etaJ.

Observed /branches/main and /commits/main both 1da818b50f1e18808db2792b9dc735bda8cb84d8, merge #1198 at 2026-11-24 15:42:48 UTC. Different from RUN9's previously observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780; no claim about ordering/ancestry without compare. At observed head: PinsCardIndexRanks blob 3a1cd7ccbb58b0239eba43247323eafe4af2da05 (27/27 anchors), StableIffCarrierEq eb4f88177f5c4e9ad7258036b507f423453d26b5 (9/9). Old DivisionCompatibleAtReadIdentifications path 404, wrapper file e34a9fe4644fa2038729074eea6d86bc557fc70a contains relocated theorem GlobalTheory.divTied3_read at line 176, pins_card_index_ranks at 178 and grp := hGrp hcard hidx at 184; exact wrapper name not located at this file. No equivalence assertion for new revision.

## 6. Reproducible finite regression
Actually executed in connector V8: matrices=16594, columnCases=165173, partitionCases=60, productCases=5400, neg=3. Models are finite integer arrays over Z/qZ with q=2,3,5, not native automorphic data. Tests illustrate the counting identity and preserve the bounds; source proof above is the general reason. No runtime benchmark or kernel proof. Copy to Node and run:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)}; let matrices=0,columnCases=0,partitionCases=0,productCases=0,neg=0;
 for(let r=0;r<=4;r++)for(const q of [2,3,5]){
  const pairs=[];for(let i=0;i<r;i++)for(let j=i+1;j<r;j++)pairs.push([i,j]);
  const cuts=[];for(let c=0;c<r;c++)for(let a=0;a<=c;a++){let blocked=pairs.map(([i,j])=>a<=i&&i<c&&j===c);ck(blocked.filter(Boolean).length===c-a,"partition");partitionCases++;cuts.push({a,c,blocked,count:0})}
  for(let n=0;n<q**pairs.length;n++){
   let x=n,M=Array.from({length:r},(_,i)=>Array.from({length:r},(_,j)=>+(i===j)));
   for(const [i,j] of pairs){M[i][j]=x%q;x=Math.floor(x/q)}
   let back=0;for(let s=pairs.length-1;s>=0;s--){let [i,j]=pairs[s];back=back*q+M[i][j]}
   ck(back===n&&M.every((row,i)=>row.every((v,j)=>j<i?v===0:j===i?v===1:true)),"unitri bijection");matrices++;
   for(const cut of cuts){let ok=pairs.every(([i,j],s)=>!cut.blocked[s]||M[i][j]===0);if(ok)cut.count++;columnCases++}
  }
  for(const cut of cuts)ck(cut.count===q**(pairs.length-(cut.c-cut.a)),"column count");
 }
 for(let r=1;r<=8;r++)for(let c=0;c<r;c++)for(let a=0;a<=c;a++)for(let f=0;f<=4;f++)for(const q0 of [2n,3n,5n])for(const q1 of [2n,3n,5n]){
  let N=BigInt(r*(r-1)/2),k=BigInt(c-a),F=BigInt(f);
  ck(q0**(N*F)*q1**(N*F)===q0**((N-k)*F)*q1**((N-k)*F)*(q0*q1)**(k*F),"product");productCases++
 }
 const A=[[1,1,0],[0,1,0],[0,0,1]],B=[[1,0,0],[0,1,1],[0,0,1]];
 ck(A[0].reduce((s,x,k)=>s+x*B[k][2],0)===1,"nonclosed support");neg++;
 ck([0,1,2].filter(i=>i<3&&[0,1,2].includes(3)).length!==3,"out of range cut");neg++;
 ck((!(true&&false)||false)&&!false,"guard not unconditional");neg++;
 return {matrices,columnCases,partitionCases,productCases,neg}
}
console.log(regress())
```
The third negative control is a Boolean guard illustration only. No original premise removed.

RESUME HERE: request authenticated reverse edges for GlobalTheory.divTied3_read and GlobalTheory.T.divisionCompatible_at_readIdentifications from dependency/kernel lane (current six-anchor projection failed; not available for our targets). Locate actual initial ReadL constructor using its full dependent record in StableIffCarrierEq and imports, then MjHIds/MjHTie/IdxDefs producer, not idxDefs_up. If no reverse index, trace h.keep.psi's PsiPPTie/LvlTie producer rather than repeating cardinality. HANDOFF TO integration, editor, audit, Galois, theta, dependency and kernel. Project OPEN. No physics queue edits.


---

# Integrated chapter 107 — RUN10_FINITE_PERIOD_ACTION.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN10_FINITE_PERIOD_ACTION.md); blob f662cb669ad03e07663742057e1f1f51110b71e7. Peer text preserved; not independently replayed.

# Run 10 — finite period-space action and the open twist subgroup
2026-11-24. RESULT: SOURCE-MATCHED human proof of GlobalTheory.Pst.exists_actD_eq_one and its use in BridgeParam.isOpen_twistGroup. Project OPEN. Not a kernel replay or URT performance result.

## Continuity and scope
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, continuity and research protocol/log (large records inspected in excerpts), previous Run 9 and current handoffs from theta, kernel, character boxes, editor, Landau, prime, literature, geometry, acceleration, integration, dependency, structure, math and audit. Their current tasks do not duplicate the finite-action lemma. Latest Cathedral summary: PASS 2026-11-24 16:27Z run 45433344141, checkpoint ba18e99; unrelated to RH proof validity. No physics queue changes. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream HEAD 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z).

## 1. Exact theorem and scope
Let l be prime, k=Q_l, Omega its algebraic closure, U=MaximalUnramifiedExtension l, K a finite subextension, G_K its fixing subgroup. Let P : LocPrime l be the original period-ring data, LL a coefficient field over k, V an LL-module with compatible k-action and scalar tower, rho a representation of G_K on V. Set D=Dpst(P,rho), an LL-submodule of V tensor_k Bst(P). On pure tensors the G_K action stRep is rho(g)v tensor actSt(P,g)b. The action A(g)=actD restricts stRep to D. The U-scalar operator M(c)=mulD restricts the period-ring multiplication. D_U=DpstUr is the same additive group with U-action given by M; toUr is the additive identity equivalence.

Native theorem, with the original section's finite-dimensional k-module V assumption expressly omitted:
Assume D_U is finite-dimensional over U. There exists a finite extension K' inside Omega such that for every g in G_K, if g also fixes K' and
    A(g) M(c) = M(c) A(g) for EVERY c in U,
then A(g)=identity on D.

No continuity, potential semistability rank equality, or finite-dimensional k-space V is used by this lemma. They may be required elsewhere. K' is not asserted normal, need not contain K, and the conclusion is not that all elements fixing K' act trivially. The commutation guard is part of the theorem.

## 2. Human derivation from the original five-line proof
By the native equivalence mem_Dpst, for each x in D there exists a finite extension F_x such that every g in G_K intersect G_Fx fixes x under stRep. Although the original definition of Dpst uses extensions containing K, the converse in mem_Dpst takes the compositum of K and F_x, so the simplified statement does not require F_x to contain K.

Choose a finite U-basis b_i of D_U, indexed by i=0,...,d-1; let x_i=toUr^{-1}(b_i). Apply mem_Dpst to every x_i and choose a finite field F_i with the corresponding fixing property. Form the finite compositum K'=join_i F_i. It is finite over k because there are finitely many finite extensions. If d=0 the empty join is k and D_U=0; no nonempty-basis hypothesis is necessary.

For g as in the theorem, G_K' is contained in G_Fi for each i (fixing subgroup inclusion reverses field inclusion). Thus A(g)x_i=x_i, because A is the restriction of stRep. The commutation guard makes A(g) U-linear after transport to D_U: for any c and x,
    A(g)(c x)=A(g)M(c)x=M(c)A(g)x=c A(g)x.
This is exactly urEnd, not an unproved conversion of LL-linearity to U-linearity. Since a U-linear map fixing a U-basis is the identity, it fixes every sum sum_i c_i b_i. Transport back along toUr. This is the whole native argument; the mathematical content is finite basis + finite compositum + scalar compatibility.

The result does NOT follow merely from all basis vectors being fixed by a semilinear map. For example the Frobenius x -> x² on F4 fixes the basis {1} over F4 but moves a root t of t²+t+1; this is an abstract counterexample to the basis-only inference, not a p-adic counterexample. Nor does elementwise finite stabilization imply a uniform open stabilizer in infinite dimension: the profinite product of copies of C2 acts on the rational direct sum of coordinate lines by independent signs. Every vector has finite support and hence open stabilizer, but any open subgroup contains a flip outside its finitely constrained coordinates. It cannot act trivially on the whole sum. These explain the two explicit hypotheses; no claim that they are logically necessary in every special p-adic instance.

## 3. Exact consumer: constructing an open subgroup of twists
The Run 9 twist-group proof uses the finite K' above, not an assumed finite action of G_K. Let N be the finite normal closure of the compositum K K'. H=G_N is open and normal in GQ(l), and is contained in G_K and G_K'. For g in H and h in G_K, define
    c = g^{-1} h^{-1} g h.
By normality, h^{-1} g h belongs to H; hence c is in H and fixes K'. Furthermore GQ(l) restricts to an abelian action on U: comm_on_Kur proves this by evaluating on prime-to-l roots of unity, expressing the two automorphism images as powers of the same primitive root, commuting the integer exponents, and extending by kur_algHom_ext. Consequently c fixes U pointwise. The native actD_mulD identity gives
    A(c) M(u) = M(c(u)) A(c) = M(u) A(c).
Both guards of exists_actD_eq_one now hold, so A(c)=I. Since g h=h g c, A(g) and A(h) commute. This explains exactly why the normal closure is used and why it is not sufficient to check g alone fixes a finite extension. The element c is in G_K because g,h are there.

Set T=A(g), a unit because A is a group representation; its inverse is A(g^{-1}). The scalar covariance A(g)M(u)=M(g(u))A(g) follows from actD_mulD. The native phiD_actD and monD_actD prove that T commutes with Frobenius and monodromy (monodromy factor 1). Together with the commutator calculation these are precisely the four IsTwist conditions. Thus H lies in twistGroup; a subgroup containing an open subgroup is open. No assumption of discreteness of the full period-space action was made.

The subsequent exists_isTwist uses the identity for automorphisms fixing U and phiU for automorphisms acting as frobUr, with monodromy factor l^{-1} (nonzero by characteristic zero). The open subgroup is closed. eq_top_of_isOpen uses infinite Galois correspondence and the fixed-field statement MemLoc.frob_laws to conclude that its fixed field is k; that underlying Frobenius fixed-field producer remains a separate proof obligation. The consumer theorem is source-matched, but that leaf has not been expanded here.

## 4. Exact dependency linkage
EqOfPowEqOneOfNormSubLt: stRep -> mem_Dpst and coe_actD; mulD -> DpstUr -> toUr -> urEnd -> exists_actD_eq_one.
WeilDeligneParamAboveLIndependentLocalEmbedding: exists_actD_eq_one + normalClosure + comm_on_Kur + actD_mulD + phiD_actD + monD_actD -> isOpen_twistGroup -> exists_isTwist.
Run 9 ChCoef.eig_conj/exists_semi uses exists_isTwist, then ChCoef.chCoef -> ContinuousRankOneRep.df_coef -> df_unit -> df_one -> LocWD. The broader consumer in the same BridgeParam module exists_map_conj uses a twist for g^{-1} to remove the scalar change under conjugation of local embeddings; wdPst_conj and wdAt_eq give embedding-independent parameters. This broader branch is not fully reconstructed in this run.
Prior lane chain: LocWD -> Crys.alg/CoreAll -> Row0b -> galoisLocalGlobalStrong_recParameter -> window/character nonvanishing -> rhOfAll. This is a previously source-traced chain, not authenticated kernel reachability. Request role-labelled kernel edges for GlobalTheory.Pst.exists_actD_eq_one, GlobalTheory.Pst.BridgeParam.isOpen_twistGroup and GlobalTheory.Pst.BridgeParam.exists_isTwist.

## 5. Source hashes and executed check
Two primary native source modules, four snapshots fetched. Git blob IDs returned by connector:
A = src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean
  pin 21a02daf0f36829d50c3c4243c10e36a9bd311d9; head dcbcc4dbbf8d4018f934fc09b2da07716608f63f.
B = src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean
  pin ffdce791714cb11064760245f465f9ba78449bbc; head 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Producer found through the import chain B -> FiniteDimensionalFilDR -> FiniteDimensionalWdSpace -> FiniteDimensionalLetter -> A (other imports inspected while locating declaration). In A pin stRep 211, mem_Dpst 265, actD 314, mulD 319, actD_mulD 351, DpstUr 358, toUr 364, urEnd 368, exists_actD_eq_one 445. In B pin isOpen_twistGroup 107 and exists_isTwist 132.

Actually executed via connector + JavaScript: 14 exact source substring assertions passed, 9 declaration bodies compared from declaration start through first blank line, all 9 byte-identical in the two text snapshots. Lines pin -> head:
A exists_actD_eq_one 445->486; mem_Dpst 265->310; actD_mulD 351->394.
B eq_top_of_isOpen 21->65; comm_on_Kur 41->85; isOpen_twistGroup 107->151; exists_isTwist 132->176; wdAt_eq 405->453; wdAt_indep_bridge 425->473.
Files as a whole changed. These comparisons do not establish semantic equivalence of all imports or kernel correctness. No synthetic numeric tests counted as evidence for native arithmetic. Reproduction (Python stdlib, local upstream checkout containing both revisions; equivalent to the executed JS checks, not separately executed in Python this run):

```python
import subprocess, sys
repo=sys.argv[1]
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="1da818b50f1e18808db2792b9dc735bda8cb84d8"
A="src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean"
B="src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean"
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
expected={(A,pin):"21a02daf0f36829d50c3c4243c10e36a9bd311d9",
(A,head):"dcbcc4dbbf8d4018f934fc09b2da07716608f63f",
(B,pin):"ffdce791714cb11064760245f465f9ba78449bbc",
(B,head):"6e6f30ca2a8b1428043c1212f4c75896a3c5d747"}
data={}
for (path,rev),sha in expected.items():
    assert git("rev-parse",rev+":"+path).strip()==sha
    data[path,rev]=git("show",rev+":"+path)
anchors={
 A:["omit [FiniteDimensional ℚ_[l] V] in\n\ntheorem exists_actD_eq_one",
 "let b := finBasis ↥(MaximalUnramifiedExtension l) (DpstUr P ρ)",
 "choose F hF using fun i => (mem_Dpst P ρ).mp",
 "⟨⨆ i, (F i).1, inferInstance⟩",
 "urEnd P ρ (actD P ρ g) hc = 1 := b.ext",
 "GK_le (K := F i) (le_iSup",
 "LinearMap.congr_fun h1 (toUr P ρ x)",
 "map_smul' c x := LinearMap.congr_fun (hT c) x"],
 B:["have hk : actD P ρ (g'⁻¹ * (h⁻¹ * g' * h)) = 1",
 "hnorm.conj_mem g hg","rw [comm_on_Kur g h c",
 "GlobalTheory.MemLoc.frob_laws","(l : LL)⁻¹, inv_ne_zero hl",
 "exact wdAt_eq P ι Bw Bw' h hj hj' r hr hr'"]}
for path,ss in anchors.items():
    for s in ss: assert s in data[path,pin],s
def declaration(text,name):
    ls=text.splitlines()
    i=next(i for i,l in enumerate(ls) if l.startswith("theorem "+name+" "))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
for path,names in [(A,["exists_actD_eq_one","mem_Dpst","actD_mulD"]),
(B,["eq_top_of_isOpen","comm_on_Kur","isOpen_twistGroup","exists_isTwist","wdAt_eq","wdAt_indep_bridge"])]:
    for n in names:
        i,a=declaration(data[path,pin],n)
        j,b=declaration(data[path,head],n)
        assert a==b,n
        print(n,i,j)
print("14 source anchors, 9 identical declaration slices; not Lean validation")
```

## RESUME HERE
Locate the exact producer of GlobalTheory.MemLoc.frob_laws via LocalPrimeGaloisActionPeriodT imports and DataN/Loc definitions; reconstruct the fixed field of frobUr including the unramified field-generation and extension-of-automorphism hypotheses. Then trace EmbOrbitAlt separately. Ask kernel/dependency lanes for role-labelled source-bound edges at the three finite-action roots above. Do not redo Runs 1–10, do not claim full proof, and do not change physics queue. HANDOFF TO integration, editor, audit, kernel, dependencies, theta and Galois. Project OPEN.


---

# Integrated chapter 108 — RUN10_REMOVABLE_AND_CAUCHY_COEFFICIENTS.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN10_REMOVABLE_AND_CAUCHY_COEFFICIENTS.md); blob 775a8fd97ec854a5163411a64706da2b4899668f. Peer text preserved; not independently replayed.

# RUN10 — removable singularities and Cauchy coefficient extraction

2026-11-24. DONE for the local producer reconstruction; project OPEN. Source-matched human derivation, finite checks executed in V8, not independent Lean replay.

## Continuity and source ledger

Read AGENTS, research state opening, continuity and runner protocol/log opening, baseline CI summary (16:07 UTC, checkpoint 379, unrelated to this RH proof), swarm protocol, handoff queue, expansion, RUN9 and the newest prime, kernel, editor, math, integration and structure handoffs. Recent commits of all lanes inspected by title; full remaining peer handoff texts were not all retrieved (connector call limit); no claim of exhaustive peer reading. The editor and kernel explicitly request this analytical producer and typed role witnesses. Prime is on served-ledger bounds; integration on segment producers. Blueprint reference in queue noted, not independently reopened this run.

Pinned RH P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed main H=1da818b50f1e18808db2792b9dc735bda8cb84d8 (merge #1198, 2026-11-24 15:42:48 UTC); compare API reports H 164 commits ahead of RUN9's 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780, zero behind. H manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d still pins Mathlib Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8. Pm=0df444a360eaa60ab8c11dca51a86af692955474.

RH source paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/:
- P poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1, poleData_abstract and poleData_char; H relocated CharacterBoxes/ZeroFreeAllOfTopG.lean c3bcece31e76be6368af5af4647f1ad30012fd3b, L808ff, same blob as RUN9.
- P/H LandauCauchy.lean f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b / e4aa7a9a470043a1fcf7d63c3e32a92ae2934bdc. Executed exact string equality of theorem span after trimming: true.
- P LandauPoleAsym.lean e5ec846b37b8879944576a38c83013814a6f1fe7; H landauWindow.lean 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L520ff, L529ff.
- P landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a; P lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f; P ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.
- Mathlib Pm/Hm Mathlib/Analysis/Complex/RemovableSingularity.lean 8e7041227bba49af1abb884b670498be9f004c63 / 58f06c94275dda5ac9278e44da24b787beb77f2f: P L47–65, H declaration L60.
- Mathlib Pm/Hm Mathlib/Analysis/Complex/CauchyIntegral.lean 7ab35a8eefd071d78383042b0806e30664a62cca / e177e62af2e2ced7ff9f853a19eefac727d397b3: P L589–629, H closed-ball declaration L716.
- Mathlib Pm/Hm Mathlib/MeasureTheory/Integral/CircleIntegral.lean 03eddc0ee2aa1aec79060846bda5eeff20383e65 / d14ca39cbb46d8bfa26e6c6ea1a2fe10dae0382e: P L623–661, L718–724; H L640–678, L735–741.
- Pm Mathlib/Analysis/Analytic/IsolatedZeros.lean 9bad403947a1959b68846a3a407f28fdd19d320e L78–89 (power-series shift); H relocation in RUN9. Hashes are Git blobs returned by connector, not independently recomputed. Mathlib factorial_smul is used by native source; its separate producer and full divergence-theorem proof not recursively expanded in this run.

## 1. Removable singular at 1 (exact source conditions)

Let g entire, g(1) nonzero, c=g'(1)/g(1), K complex, N(s)=g'(s)/g(s)-sc+K(1-s). U={s:g(s) nonzero} is open and contains 1, and N is holomorphic on U. N(1)=0. For s unequal to 1 let D(s)=(N(s)-N(1))/(s-1), D(1)=N'(1). The pinned differentiableOn_dslope equivalence requires U to be a neighborhood of 1. On U minus {1}, the usual quotient is differentiable; at 1, the derivative definition gives continuity of D. The imported differentiableOn_compl_singleton_and_continuousAt_iff proves analyticity there by choosing a closed disk in the neighborhood, using continuity everywhere on that disk and differentiability in its interior except the singleton, then applying hasFPowerSeriesOnBall_of_differentiable_off_countable. Away from 1 the local quotient applies. Conversely N(s)=N(1)+(s-1)D(s) gives differentiability if D is differentiable. This is a general local theorem, not an assumption that N has no zeros. The shift of the convergent series gives D(1+x)=sum a_(j+1)x^j, consistent with the same base value; no division by zero at 1.

Phi(s)=-D(s)/s is therefore holomorphic at every nonzero s in U, including 1. Supplemental explicit center value, obtained by quotient differentiation:
Phi(1)=-g''(1)/g(1)+(g'(1)/g(1))^2+c+K.
No extension at s=0 is asserted. For the principal family g is the regularized (s-1)zeta(s), g(1)=1; for other admissible characters g is L(s,chi). Continuity at the principal point comes from the residue-one theorem; it is not the arbitrary totalized value of zeta(1). The same removable theorem then supplies entire g. No exceptional real zero in (0,1) is removed by this regularization.

## 2. Exact circle coefficient and Cauchy bound

Source h0: 0<R<r (R=r' in Lean), hd: holomorphic on open disk B(z,r). Thus closed disk of radius R is contained in B(z,r); boundary continuity and circle integrability follow. Mathlib closed-ball result reduces to DiffContOnCl, then countable exceptional-set theorem with empty exceptional set. Its hasSum uses the Cauchy integral representation and the geometric series 1/(w-z-x)=sum x^j/(w-z)^(j+1), uniformly absolutely convergent on |w-z|=R for fixed |x|<R, since |x|/R<1. Integration termwise gives coefficient a_k=(1/(2pi i)) integral_{|w-z|=R} Phi(w)/(w-z)^(k+1) dw. The imported norm theorem follows by taking norm inside the parametrized interval integral. Set w=z+R exp(it), dw=iR exp(it)dt, so
a_k R^k=(1/(2pi)) integral_0^{2pi} Phi(z+R exp(it)) exp(-ikt)dt.
Then |a_k|<=M/R^k for the finite, nonnegative circle mean M=(1/(2pi)) integral |Phi|. The factorial_smul call evaluates the multilinear coefficient on k copies of 1: its value is Phi^(k)(z)/k!, since the kth derivative of x^k at zero is k!, lower terms vanish and higher terms have zero kth derivative there (analytic differentiation); k! never zero. The coefficient's evaluation is bounded by its operator norm, all input norms 1. This establishes the uniform-in-k bound, not a sample estimate. Mathlib's Cauchy theorem itself uses a divergence theorem; full measure-theoretic expansion remains an imported obligation.

Strict R<r is sufficient, not universally necessary for every particular function. R=r does not follow from hd alone: Phi(s)=1/(s-(z+r)) is holomorphic in the open disk but has a boundary pole. Also R=0 cannot be used to extract all coefficients. These guards are preserved.

## 3. Pole subtraction, no illicit boundary evaluation

Source landau_pole_asym requires rho in B(z,r), rho unequal z, holomorphy on B(z,r) minus {rho}, and punctured local equality Phi(s)=c/(s-rho)+h(s), with h analytic at rho. Define G(rho)=h(rho), G(s)=Phi(s)-c/(s-rho) elsewhere. The punctured equality plus the chosen point value yields equality of germs G=h at rho; G is analytic there. Elsewhere the quotient is holomorphic and subtraction is valid. Thus G holomorphic across the full disk. Cauchy bound applies to G even if the chosen circle passes through rho; it does NOT apply to raw Phi there. Near z the decomposition is valid and repeated differentiation gives
(-1)^k Phi^(k)(z)/k! = c/(z-rho)^(k+1) + (-1)^k G^(k)(z)/k!.
This implies exact source asymptotic error M/R^k. In the outer argument R=(d+r)/2 with d=|z-rho|>0, so d<R<r, and R<=sigma-theta. Pole dominance is exponential. The window coefficient upper bound and real/complex dichotomy remain mandatory. The original 0<theta<1, delta>0 and one-sided window hypothesis are not changed.

## 4. Guard against a tempting shortcut from RUN9

Positive real part of every family residue does NOT imply positive real parts of all normalized derivatives at a real center. Example of geometry allowed by the strip: rho=1/2+(5/2)i and its conjugate, z=3, equal S>0. Residue -S/[rho(rho-1)] = 2S/13 >0 for both. But z-rho=(5/2)(1-i). For k=1 the two squared inverse denominators are pure imaginary conjugates; their sum is zero. More generally k=1 mod 4 gives cancellation. This is a model pole configuration, not asserted actual L-function zeros or full PoleData satisfying the window. It disproves the shortcut of bounding every coefficient below by a positive sum based only on Re(c)>0. Keep original nearest-pole/real-pole dichotomy (or derive a genuinely new subsequence argument with compatible window quantifiers). The real exceptional branch still has c positive real and d>0.

## 5. Reproducible checks

Extract this JS block and run with Node. Executed in V8 tool runtime. Polynomial fixture g(1+x) has integer coefficients; check P(x)=g(1)N(1+x)g(1+x) by exact cross multiplication, P(0)=0 and coefficient P1, excluding singular denominators. F_97 discrete orthogonality is exact but only an algebraic model; complex circle sampling uses finite trigonometric approximations for degree <=8, not an integral proof. Negative controls demonstrate aliasing, strict radius, phase cancellation.
    
~~~js
function certificate(){
 const A=(b,m)=>{if(!b)throw Error(m)},ev=(p,x)=>p.reduceRight((s,a)=>s*x+a,0n);
 let regular=0,center=0,excluded=0,coeff=0,bound=0,negative=0,maxErr=0;
 for(let a0=-3n;a0<=3n;a0++)if(a0!==0n)
 for(let a1=-3n;a1<=3n;a1++)for(let a2=-2n;a2<=2n;a2++)
 for(let a3=-2n;a3<=2n;a3++)for(let K=-2n;K<=2n;K++){
  const g=[a0,a1,a2,a3],gp=[a1,2n*a2,3n*a3];
  const P=Array(5).fill(0n);
  for(let j=0;j<g.length;j++){P[j]-=a1*g[j];P[j+1]-=(a1+K*a0)*g[j]}
  for(let j=0;j<gp.length;j++)P[j]+=a0*gp[j];
  A(P[0]===0n&&P[1]===2n*a0*a2-a1*a0-a1*a1-K*a0*a0,"center formula");center++;
  for(let x=-4n;x<=4n;x++){if(x===0n||x===-1n||ev(g,x)===0n){excluded++;continue}
   A(ev(P,x)===x*ev(P.slice(1),x),"factor x");
   A(ev(P,x)===a0*ev(gp,x)-(a1*(1n+x)+K*a0*x)*ev(g,x),"original numerator");regular++;
  }
 }
 // Exact discrete Fourier orthogonality in F_97; not a complex analysis proof.
 const mod=x=>((x%97)+97)%97,pow=(x,k)=>{let y=1;while(k--)y=mod(y*x);return y};
 const w=pow(5,6);A(pow(w,16)===1&&pow(w,8)!==1,"root order");
 for(let j=0;j<16;j++)for(let k=0;k<16;k++){
  let s=0;for(let l=0;l<16;l++)s=mod(s+pow(w,mod(j-k+16)%16*l));
  A(s===(j===k?16:0),"orthogonality");coeff++;
 }
 // Actual circle samples for complex polynomials; degree<sample count.
 for(let m=0;m<=8;m++)for(let b=-3;b<=3;b++)for(let R of [.5,1,2]){
  const p=Array.from({length:m+1},(_,j)=>[b+j-2,((j*j+b)%5)-2]);
  let M=0, f=[];const N=32;
  for(let l=0;l<N;l++){let t=2*Math.PI*l/N,u=0,v=0;
   for(let j=0;j<p.length;j++){let [a,c]=p[j],q=R**j,x=Math.cos(j*t),y=Math.sin(j*t);u+=q*(a*x-c*y);v+=q*(a*y+c*x)}
   f.push([u,v]);M+=Math.hypot(u,v)/N;
  }
  for(let k=0;k<=m+2;k++){let u=0,v=0;
   for(let l=0;l<N;l++){let t=2*Math.PI*l/N,x=Math.cos(k*t),y=Math.sin(k*t);u+=(f[l][0]*x+f[l][1]*y)/N;v+=(f[l][1]*x-f[l][0]*y)/N}
   let [a,c]=p[k]??[0,0],err=Math.hypot(u-a*R**k,v-c*R**k);
   maxErr=Math.max(maxErr,err);A(err<1e-8,"Fourier sample coefficient");A(Math.hypot(u,v)<=M+1e-8,"sample triangle");bound++;
  }
 }
 // Aliasing when degree equals sample count.
 A(pow(w,16)===1,"alias at degree 16");negative++;
 // A pole on the contour is not permitted by the source closed-ball guard.
 A(!(2<2),"strict inner radius");negative++;
 // Conjugate pole pair, rho=1/2 +/- (5/2)i, center=3; residue positive real.
 // Scaled displacement 2(z-rho)=5 +/- 5i: squared inverse real part zero.
 A(5*5-5*5===0,"positive residues do not prevent phase cancellation");negative++;
 return {center,regular,excluded,coeff,bound,maxErr,negative};
}
console.log(certificate());
~~~

Actual output: {"center":5250,"regular":35930,"excluded":11320,"coeff":256,"bound":1323,"maxErr":1.4386691999581415e-12,"negative":3}. No independent kernel replay, infinite theorem inferred from tests, or URT speed advantage. The analytic implication remains conditional on arithmetic windows. No physical gates changed.

RESUME HERE: reconstruct the direct coefficient producer landau_coeff and its differentiation-under-integral domination (native LandauCoeff.lean at P, relocated landauWindow at H), checking neighborhood margins, k=0 and all factorials. Do not redo RUN1 outer estimates; expand imported parametric-integral theorem assumptions and differentiate each finite induction step. Request kernel/dependency typed role witnesses for Deduction.poleData_abstract, Deduction.landau_cauchy and Deduction.landau_pole_asym; kernel lane already requests prior roots. HANDOFF TO editor, integration, audit, math, kernel and dependencies. Project OPEN.


---

# Integrated chapter 109 — RUN10_FIELD_TANGENT_INJECTIVITY_AND_DENOMINATOR_GLUE.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN10_FIELD_TANGENT_INJECTIVITY_AND_DENOMINATOR_GLUE.md); blob 18b616063ecc1ae65007f2415860efeeb724527c. Peer text preserved; not independently replayed.

# RUN10 — Field tangent injectivity and denominator-clearing gluing
2026-11-24. SOURCE-MATCHED / PARTIAL. Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; latest returned upstream commit 1da818b50f1e18808db2792b9dc735bda8cb84d8 (unchanged from RUN9). Read AGENTS, state/continuity, research log/protocol, CI summary (16:27 UTC, unrelated physics PASS), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN9 and all fourteen peer lane latest handoffs (including kernel RUN10 cache discrepancy; no claim of independent kernel check). Peer lanes' tasks do not duplicate this field tangent and chart gluing argument. Blueprint not reread this run; source bodies are the evidence. No physics changes.

## 1. Field-level tangent injectivity, not an assumed perfect pairing
All D paths below relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/. Source D/CmpFormEqZeroOfTangent.lean L84–134, GlobalTheory.LieInjField.eq_of_tanVal_eq. Hypotheses: CrystallineSmoothLift HC, AbelianHodgeDeRham HH, field K, B over Spec K with group object, abelian scheme and smooth relative dimension g, two dual-number points v,w reducing to the identity, equality of their evaluations on EVERY crystalline form f. Conclusion v=w.

Write L=Lie(B), F=Form(B), C=ClosedForm(B), c:F→C the comparison, P:L→F* evaluation. L has a basis of cardinal g (the explicit internal LieField.exists_isLieBasis_field; further producer KeyPow.exists_isLieBasis). HH implies all global forms closed, and global forms finite projective with stalk rank g; at the closed point of the field this gives dim C=g. Thus dim L*=dim C=g. c is surjective by L26–45: lift the de Rham class of a closed form through the crystalline comparison; injectivity of the structure-sheaf comparison places its lift in F1; exact filtration range expresses this lift as a crystalline form; injectivity of the closed-form class map identifies its comparison with the prescribed form. This repeats the algebra of RUN9, not a new independent result.

The evaluation P is linear by tangent addition and epsilon scaling (L75–79). Since ker c is contained in ker P.flip (the already recorded vanishing of evaluation on forms with zero comparison), the quotient universal property defines
    T:C→L*,   T(c(f))(u)=P(u)(f).
c is surjective, so this defines all T, not merely its restriction to a subspace. If T(ω)=0, choose f with c(f)=ω. Then evaluation of f on every identity tangent is zero. The geometric theorem cmpForm_eq_zero_of_tangent (L47–73; detailed below) gives c(f)=0. Thus T injective. Equal finite dimensions over K imply surjectivity. In particular every functional on L occurs as T(c(f)). The hypothesis on v,w says every such functional annihilates v−w; duals separate vectors in a finite-dimensional vector space, hence v=w. This proves the field-level injectivity used at D/ExistsTangentVectorFunctionalGlobalFormsAbelianS.lean L205, without invoking the global arbitrary-ring tangent realization from RUN9. No circularity inferred at this source level; kernel direct-edge evidence still needed. Do not replace the equal-dimension step with an arbitrary-ring argument.

## 2. Actual geometric ingredient: identity tangents detect comparison via all field extensions
D/CmpFormEqZeroOfTangent L47–73: let f evaluate to zero on every identity tangent. Choose a Lie basis y over K. For EVERY field extension ring hom σ:K→L, take the group pullback B_L with its abelian-scheme and smooth-relative-dimension properties and compatible divided-power IsMor m. For any dual-number point u over L (not necessarily an identity tangent), set a=epsScale(0)∘u, and b=a⁻¹u. Reduction of b is identity, since a reduces to the same point as u. Then u=ab; evaluation of a is zero by epsScale linearity, evaluation of b zero by base-changed Lie basis, and evaluation of u zero by the all-point additivity lemma. Thus the comparison is zero by the field-extension vanishing criterion. The quantification over ALL L and ALL dual-number points is essential to this proof route; do not silently substitute K-rational points.

Four exact wrapper→body chains, none an axiom declaration:
- ExistsLieBasisSmoothCommGroupSchemeFieldStatement L17–18 → LieField.exists_isLieBasis_field (same name without Statement L22–24) → KeyPow.exists_isLieBasis. Last body still open.
- CrystallineFormTangentValueMulAbelianSchemeStatement L17–18 → TanAdd.tanVal_mul_all (same name without Statement L20–65). This is the stronger all-point additivity, not merely tangent multiplication. Smooth relative dimension doubles on A×A. HC/HH yield AllPrim through AbelianPrim.abelianDeRham_free and T.abelianDeRhamFree_of_crystalline_comparison. For multiplication μ and projections π_i, the class of μ*f−π₁*f−π₂*f vanishes by primitivity. The closed-form class map on A×A is injective by HH, so its comparison vanishes; evaluation of the difference on the paired dual-number point (a,b) vanishes by the internal form-value theorem (which allows arbitrary points). Naturality with μ and π_i gives additivity. Preserve product abelian-scheme and smoothness proof, compatible IsMor maps, comparison and class-map identities, and vanishing theorem. This is not additivity of every differential on an arbitrary group.
- PullbackFormVanishesTangentsOfLieBasisStatement L17–18 → LieDual.tanVal_pullForm_eq_zero_of_lieBasis (same name without Statement L86–96). Base-changed basis y'_i exists via exists_isLieBasis_baseChange, with matching point maps. Natural evaluation (L30–70) follows from compatible dual-number thickenings and Form.ev_sq; its second coordinate is σ of the original value. All y'_i evaluate to zero. Every identity tangent is the product of scaled basis elements by IsLieBasis; epsScale multiplies evaluations by coefficients, and tangent multiplication adds them. Empty product evaluates to zero (L72–84). Preserve smoothness, commutative group structure, pullback and IsMor, even though the final formula looks like linear algebra.
- CmpFormEqZeroOfPullbackVanishingStatement L17–18 → PtVanish.cmpForm_eq_zero_of_tanVal (same name without Statement L181–184). Its actual affine supplier connForm_eq_zero L145–179 works on each affine open U with coordinate K-algebra A smooth, hence reduced, and Ω=A-relative-to-K differentials. For every prime p of A and A-linear functional l:Ω→κ(p), construct the ring map A→κ(p)[ε]/ε² given by x↦x mod p + ε l(dx) using nbdMap∘diagSec (L31–46, L159–162). The pullback universal property lifts the corresponding point to X_{κ(p)}. The assumed all-point vanishing plus tanVal_pull_eq and snd_val_affine_eq gives l(connForm)=0. The internal residual-functional separation theorem now gives connForm=0; cmpForm is zero by equality on all affine opens. Preserve smoothness/reducedness, projectivity/finite generation required by the residual-functional separation supplier (not yet expanded), field-extension quantifiers, affine locality and compatibility of crystalline evaluation. No claim that an arbitrary module over a nonreduced ring has residue-field separation.

## 3. Denominator clearing is a finite-cover gluing theorem, not unscaled lifting
D/IsTangentIffTanS L145–158 GlobalTheory.LieAway.tan_away_lift: R commutative, group scheme G over Spec R, every G_s smooth, chosen r with a chart of G_r, dual-number point y over R[1/r] mapping to G and reducing to identity (TanS). There exist N∈ℕ and global identity tangent w such that res_r(w)=r^N y (scalar multiplication here is epsilon scaling, not arbitrary group exponentiation). The proof first obtains finite chart cover s, prepends r (Fin.cons), proves the new ideal span is still the unit ideal, takes the r-chart at index zero and other original charts at successor indices, then calls Chart.tan_extend.

Actual supplier: src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/PairCompat.lean L57–100, namespace ReciprocityTheory.ChartRestriction.G.Chart. Import route from IsTangentIffTanS: PushRProdPtsResP → IsGrpPullbackFactor → ExistsAwayNotMem → PairCompat. Write t=s_{k0}, R_i=R[1/s_i], and R_ij=R_i[1/s_j], with the canonical maps qL,qR. Finite index set, span(s_i)=R, chart on each G_i, smoothness of all G_s, given identity tangent y0 over R_{k0}.
1. By local chart tanS_away_lift for every i find N_i and tangent z_i on R_i agreeing with t^{N_i}y0 on R_{i,k0}. Let N1=max_i N_i. Replace each z_i by t^{N1−N_i}z_i. Compatibility with y0 now uses the same exponent N1.
2. For each pair (i,j) both rescaled tangents agree after localizing R_ij further at t (pair_compat L28–54). This uses the universal maps between iterated localizations; equality of the two maps from R[1/t] is by away_ext, not an identification of potentially unequal rings. Local chart tanS_away_uniq then gives M_ij so their difference is killed by t^{M_ij}. On the distinguished chart separately find M0 comparing z'_{k0} with t^{N1} y0; qL=qR there by localization universal property.
3. Take M2=max(M0,max_{i,j}M_ij). Scale every z'_i by t^{M2}. All pair overlaps now agree (scale_pow_mono); identities are preserved by scaling. Apply glue_tan' for the unit-ideal cover to obtain a global tangent v. Its restriction at k0 is t^{M2+N1}y0. This establishes the stated exponent and does NOT require t a nonzerodivisor. The local affine chart lift/uniqueness and global gluing theorem are explicitly pending child proofs. Pair handling uses n² ordered overlaps in the original proof; no claim of linear-time improvement.

Application D/ExistsTangentVectorFunctionalGlobalFormsAbelianS L223–261: choose r outside ker σ for σ:R→K field, using local smooth chart/Lie basis. Then σ(r)^N≠0, even if r is a zerodivisor in R. The lift of σ to R[1/r] transports the equality of points, and scalar naturality transports t^N. The resulting scaled residue basis spans because these factors are invertible IN K, not in R. Thus RUN9's residue realization is justified at this additional layer. Do not confuse existence of a scaled lift over R with existence of the original unscaled lift.

## 4. Audit ledger and executable checks
Source-level classification: four explicit theorem wrappers above; native internal bodies (field injectivity, field-vanishing, all-point additivity, basis transport, chart gluing); proposition-valued inputs HC/HH (not global axiom claims); standard imported linear algebra / localization / sheaf facts remain dependencies. No new premises added to the Lean statements. No historical attribution check claimed, no kernel execution, no URT performance benchmark. Request authenticated direct-role edges for GlobalTheory.LieInjField.eq_of_tanVal_eq, GlobalTheory.PtVanish.cmpForm_eq_zero_of_tanVal, GlobalTheory.LieAway.tan_away_lift and ReciprocityTheory.ChartRestriction.G.Chart.tan_extend. Source-level reachability only; root reachability unknown for these nodes.

Executed connector JS: all 12 pinned blob SHAs matched; 71 initial exact line checks matched, eight wrapper anchors initially off by one (expected 18/19 rather than actual 17/18), all eight corrected and rerun successfully. Total 79 correct anchors; the initial indexing failure is recorded rather than represented as a proof failure. Upstream comparison: original field injectivity L84–134 moved into ExistsTangentVectorFunctionalGlobalFormsAbelianS L446–496 (51/51 exact lines, old file 404). Original caller L188–206 matches new L639–657 (19/19); IsTangentIffTanS L145–158 matches new L190–203 (14/14); PairCompat L57–100 matches new L96–139 (44/44). Total 128/128 selected lines. Not full revision equivalence.

Reproduce hash and representative anchor checks from upstream git checkout:
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="1da818b50f1e18808db2792b9dc735bda8cb84d8"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/"
rows=[
(D+"CmpFormEqZeroOfTangent","b2e4688e18af43d34a23874d245ee7c66b0e8230",[(47,"cmpForm_eq_zero_of_tangent"),(84,"eq_of_tanVal_eq"),(109,"liftQ"),(120,"cmpForm_eq_zero_of_tangent"),(133,"forall_dual_apply_eq_zero_iff")]),
(D+"IsTangentIffTanS","9781cf9a02bf3a96e72ecba8ca1728d8002d55f0",[(145,"tan_away_lift"),(151,"Fin.cons"),(158,"Chart.tan_extend")]),
(B+"PairCompat","7577e2f7d56194cfe043c0fa3a6d4c06752b129d",[(28,"pair_compat"),(57,"tan_extend"),(68,"Finset.univ.sup N"),(79,"pair_compat"),(88,"max M₀"),(98,"glue_tan'"),(99,"M₂ + N₁")]),
(D+"ExistsTangentVectorFunctionalGlobalFormsAbelianS","8b520290720c379350a27efc6171eb0cab0a658f",[(205,"LieInjField.eq_of_tanVal_eq"),(243,"LieAway.tan_away_lift"),(245,"pow_ne_zero")]),
(D+"CmpFormEqZeroOfPullbackVanishing","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(31,"nbdMap"),(145,"connForm_eq_zero"),(156,"eq_zero_of_forall_residueField_functional"),(181,"cmpForm_eq_zero_of_tanVal")]),
(D+"PullbackFormVanishesTangentsOfLieBasis","59738e2303f645025adbe294350c236324b01a53",[(86,"tanVal_pullForm_eq_zero_of_lieBasis"),(88,"exists_isLieBasis_baseChange")]),
(D+"CrystallineFormTangentValueMulAbelianScheme","b19f2def6b4da7117ca25f1f790616b02b3b537e",[(20,"tanVal_mul_all"),(30,"AllPrim"),(55,"formValueOnTangentVector")]),
(D+"ExistsLieBasisSmoothCommGroupSchemeField","31c736e3bf4e98027cf5048e4e7cd66aec735f06",[(24,"KeyPow.exists_isLieBasis")]),
(D+"ExistsLieBasisSmoothCommGroupSchemeFieldStatement","f849f5d05779d0f2404172d9a26a51c0e193dbe5",[(17,"GlobalTheory.T.exists_lieBasis"),(18,"LieField.exists_isLieBasis_field")]),
(D+"CrystallineFormTangentValueMulAbelianSchemeStatement","5abdb28f96fc0adf9731f4641d56176f3bcb1d1e",[(17,"GlobalTheory.T.crystallineForm"),(18,"TanAdd.tanVal_mul_all")]),
(D+"PullbackFormVanishesTangentsOfLieBasisStatement","64305bf2a9120b540eb5a59ec75b3b604d7d7336",[(17,"GlobalTheory.T.pullbackForm"),(18,"LieDual.tanVal_pullForm_eq_zero_of_lieBasis")]),
(D+"CmpFormEqZeroOfPullbackVanishingStatement","512eee18536b2bf42d3f22350e38dcde75a2fd7a",[(17,"GlobalTheory.T.cmpForm"),(18,"PtVanish.cmpForm_eq_zero_of_tanVal")])]
def git(*a):return subprocess.check_output(["git",*a]).decode()
def read(ref,p,h):
 spec=ref+":"+p+".lean"
 assert git("rev-parse",spec).strip()==h
 return git("show",spec).splitlines()
old=[]
for p,h,anchors in rows:
 ls=read(pin,p,h);old.append(ls)
 for i,s in anchors:assert s in ls[i-1],(p,i)
new=read(head,rows[3][0],"0610edb6e4bb7564e19ef9d9da168bc35b880f00")
assert old[0][83:134]==new[445:496]
assert old[3][187:206]==new[638:657]
assert old[1][144:158]==read(head,rows[1][0],"4c2da535ddbb7afcbb7fe2035d57bf2a5678ff03")[189:203]
assert old[2][56:100]==read(head,rows[2][0],"cacd2db1ace6c7ea1614561eba692b4761f071ac")[95:139]
print("source hash/anchor subset and 128 aligned lines checked")
```
Python replay not run here; equivalent anchor/hash and alignment checks executed in connector JS. Finite algebra regression JS actually executed: 722 square bilinear-form matrices over F2,F3,F5, 12456 point-separation assertions, 42924 localization annihilation assertions over Z/m (2≤m≤50), total 56102. Two illustrative negative controls checked (t-torsion and rectangular pairing; not geometric counterexamples). Reproducible:
```js
const assert=(x)=>{if(!x)throw Error("regression")};let mat=0,sep=0,loc=0,neg=0;
const gcd=(a,b)=>b?gcd(b,a%b):a, mod=(x,n)=>((x%n)+n)%n;
for(const p of [2,3,5]){const v=Array.from({length:p*p},(_,i)=>[i%p,Math.floor(i/p)]);const ev=(a,b,c,d,x,y)=>mod(y[0]*(a*x[0]+b*x[1])+y[1]*(c*x[0]+d*x[1]),p);for(const [a,b] of v)for(const [c,d] of v){const l=v.filter(x=>v.every(y=>ev(a,b,c,d,x,y)===0));const rr=v.filter(y=>v.every(x=>ev(a,b,c,d,x,y)===0));const det=mod(a*d-b*c,p);assert((l.length===1)===(det!==0)&&(rr.length===1)===(det!==0));mat++;if(det)for(const x of v){assert(v.some(y=>ev(a,b,c,d,x,y)!==0)===(x[0]!==0||x[1]!==0));sep++}}}
for(let m=2;m<=50;m++)for(let t=0;t<m;t++){let q=m;while(gcd(q,t)>1)q/=gcd(q,t);for(let x=0;x<m;x++){let z=x;let found=false;for(let k=0;k<=m;k++){if(z===0){found=true;break}z=mod(z*t,m)}assert(found===(x%q===0));loc++}}
assert(2%4!==0&&mod(2*2,4)===0);neg++;
assert([[0,0],[0,1]].every(x=>x[0]===0));neg++;
console.log({mat,sep,loc,neg,total:mat+sep+loc});
```
Interpretation: localizing Z/4 at 2 makes 2 vanish without 2=0 beforehand. For rectangular pairing K×K²→K, (x,y)↦xy₁, the induced map K→(K²)* is injective but not surjective; the second coordinate is invisible. Equal dimension is not decorative. The tests illustrate algebra only, not the geometric source claims or proof of RH.

RESUME HERE: follow PairCompat import ScalePowMono to locate and reconstruct actual tanS_away_lift, tanS_away_uniq and glue_tan' producers; in the field branch reconstruct EqZeroOfForallResidueFieldFunctionalStatement and its actual body, preserving smoothness/reducedness/finite projectivity; then HC/HH global suppliers and system realization. Do not repeat field duality or finite-cover exponent argument. HANDOFF TO integration, editor, audit, kernel, dependencies, geometry. Project OPEN.


---

# Integrated chapter 110 — RUN10_ARCHIMEDEAN_LOCAL_UNIT_AND_NORM.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN10_ARCHIMEDEAN_LOCAL_UNIT_AND_NORM.md); blob 5e7a739674c09b6affd8c8b98d88a8357e7a607b. Peer text preserved; not independently replayed.

# Geometry RUN10 — local unit / holomorphic descent and archimedean generic norm
2026-11-24. SOURCE-MATCHED / local mathematical reconstruction, exact finite regression executed. Project OPEN.

## Continuity and provenance
Read AGENTS, RESEARCH_STATE and RESEARCH_LOG heads, RESEARCH_PROTOCOL and CONTINUITY_PROTOCOL, CI summary checkpoint 381, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN5 and RUN9, located RESUME notes for dependencies, integration, math, structure, audit (tied-window quantifier), character boxes, Galois, kernel, Landau, literature, acceleration, prime-window, editor, theta. No overlap found with the selected local norm chain. Blueprint not reopened; source primary. No physics changes. Source repo leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream head 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC). The old LocalUnitMapSurjective and NormGenValLe paths now 404; the head WeilHeightArchimedeanContribution blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e explicitly lists them and VuOntoA/B/C in its clump header. This locates migration, not proof-body equivalence. Continue pin until checked. Source anchor ledger below records GitHub-returned blob IDs, not independently recomputed raw-byte hashes.

## 1. Statement and exact scope
The actual caller WeilHeightArchimedeanContribution declares NV, PublishedHodgeBundleTheorems, D:D7, T:Core D, j:nat, Y:Deep T j, e:nat, o:real, Y.Good e o, 2 < Module.finrank Q D.host.E / 2 (retain Lean's expression), Z:Comp Y.d.Xo₂ Y.d.c₂, u:AllWt.Weight(T.Q.Dw j), t:real, GoodOn with Y.U, xiR D, D.sp.W j, Y.dict, Z, G=wtOf ... u 0, BirOn same U,Z,G, NoBase same U,Z,G, 0<Y.dg u Z, N,m:nat, basis b of cuspOn Y.U Z G over c.F, generator matrix g of size N by m over c.F, A for every coefficient embedding (N by N complex), IsFrame of the stated normOn and latOn, sigma:c.F→C, rho:Om Z→C extending sigma (composition with algebraMap), tau:nat positive, and every f in smallL at G,tau,t. The result is
  |rho(genVal_Z f)| <= exp(tau*t) S^tau,
  S=archSize(A(sigma),(rho(genVal_Z b_i))_i).
The general norm_small_le below includes tau=0 and does not impose t>=0. GoodOn, NoBase, positive degree, field degree, and PublishedHodgeBundleTheorems are NOT deleted from the declared caller even if a specific local body ignores some. This is the bound used in RUN5 to construct small model sections.

## 2. What local_unit_map_surjective actually says
It is not a bare surjectivity theorem for a unit group. It asserts that for every good coefficient embedding sigma and P in the holomorphic submodule holSub of the unfolded charts with model weight G, there exist m:nat, complex a_i, rules f_i in extVanZ(TF.X, exOf ... u 0) such that for every w in framesOn(U sigma,Z), P(w)=sum_i a_i rdU(U sigma,f_i)(w). It takes NV, PublishedHodgeBundleTheorems, D,T,j,Y,e,o,hY, field-degree bound, Z, toroidal flag TF, u, GoodOn and BirOn as declared above. The source uses hY.unf sigma hSigma and keySec to get kappa. Rank p+q>=1 follows from hY.unf rank equality and D.R.two_le_m via definition Ranks.r. It obtains decreasing weight from BirOn: if adjacent indices m,m+1 within mult(embedding) violate G(m+1)<=G(m), NonDomVanish.eq_zero_of_lt forces every cusp form to zero; the linear map is zero by extensionality, contradicting hB.1. Induction on the index interval gives all inequalities G(j')<=G(i) for i<=j'<mult. The source does not assume all weights are natural or all components have positive multiplicity.

NV is a separate input: for every CM field, host, datum, level, moduli, coefficients and complex embedding, rank>=1, every natural weight a and integer parameter n:nat satisfying Dom a n, and every complex framed point y, there exist a',n' with Dom a' n', g in sec(a',n'), f in sec(a+a',n+n'), with both evaluations at y nonzero. Keep this precise quantifier and both nonzero evaluations; it is not automatic from the local algebra.

## 3. Twisting negative integer weights (VuOntoA.tw_of_dec)
For fixed y, set M=sum over embeddings and valid indices of |G_i|. Each -G_i<=M. The source obtains h of even positive weight n1=2(m+1) with h(y) !=0. The key section kappa.rho is a unit, so evaluation is nonzero by multiplicativity and preservation of 1 at tested complex frames. Set g=h^(M+1) kappa.rho^(M+1). Its natural weight is constant M+1 with second weight 2(M+1)m, and g(y) !=0. Define a_i=G_i+M+1 (converted exactly to Nat because positive) for valid indices and zero outside. Since G is decreasing inside each block, a is decreasing within the block, and the zero tail preserves dominance; second weight is even. Therefore Dom a (2(M+1)m). Use the original NV premise at that weight, and use the exact exZ equality and modelWt_add, with G.2=0 and the even second weight of the twist, to provide Tw V (exZ D G) k (modelWt V G k). The twisted natural exponent is not an additional free parameter; M is determined by G, m by the nonzero-section supplier. No division by a possibly vanishing value. The key-section existence and even-section existence remain explicit imported geometric inputs.

## 4. Global holomorphic-to-algebraic passage (VuOntoC.exists_comb)
With GoodEmb, IsUnf, TorFlag, exponent e:none-index=0, Tw on every chart, and P_k in SS(weight_k), obtain the finite chart type and Borel groupoid laws. Use toroidal_flag_smooth_projective to obtain smooth relative dimension d and projective flag scheme. For each chart k, open_secZ supplies a section h_k, reading identity and OffZero support. The imported holoOn_bdZ and open_holoZ show h_k belongs to R.holSec of the line bundle; sum h=sum_k h_k. It vanishes off flagOpen because each h_k vanishes there. To read h on chart k, all terms k'!=k vanish: a shared point would supply chart frames with a common Borel orbit, and IsUnf.2.2.2.1 forces the chart indices equal. Thus h reads P_k. Projectivity is used in AnRead.bijective_valC to turn h into complex algebraic section xC. Smoothness supplies local finite type. complex_section_finite_combination expresses xC as a finite complex combination of base algebraic sections s_i vanishing on the boundary; ruleTop and H0.ofSec identify the corresponding rules as members of extVanZ. holomorphic_extension_section_reading gives the chart equality. The wrapper local_unit_map_surjective restricts it to w in framesOn using the domain part hw.1 and CuspSecFin.mem_SS_of_mem_holSub. This reconstructs the assembly, not a proof of GAGA, the boundary-holomorphy arc estimates, or base-field descent independently. Those precise native suppliers are retained.

## 5. The cusp-form matching is uniform in the embedding
The statement and relay (ExtVanSectionHasCuspFormMatchStatement, blob c1245d83b62fbe32113faa33509ee3f0acab885a; ExtVanSectionHasCuspFormMatch, blob e94857f4888a24479faf513b39cf24a6c5fea045) reduce to ModelDimension.cusp_form_extension_vanishing. For any f in extVanZ, extVanZ_le_secZ gives section membership, exists_vanBd_of_mem_extVanZ gives s in boundary-vanishing space with matching component section, and vanBd_le_space supplies g in cuspOn with the same section. The source chooses g BEFORE the universal good embedding sigma and frames w. To turn equality sec₀_X,Z(f)=sec₀_X,Z(g) into equality at a point on Z, split on Tested y. Untested evaluations both use the same totalized zero branch. Tested evaluation of idem Z is 1 on Z; multiply f-g by idem Z, use sec₀_mul and linearity to get zero component section, then eq_zero_of_sec₀ and support to conclude idem Z*(f-g)=0. Evaluation gives f(y)=g(y); rdU definition on domain gives desired equality. This is not global equality of rules away from Z. In the caller choose g_i for the f_i from step 2, so Q=sum_i a_i rdU(g_i) belongs to the stated complex span and P=Q on framesOn. No new surjectivity or basis-size assumption.

## 6. The analytic norm inequality: one positive factor cancels
The general norm_small_le takes CM/host/datum/level/moduli/coeff/unfolding context, all good embeddings unfolded (hU), every dict sigma g in the appropriate unfolded domain (hd), Z,G with Even G.2, the pointwise span hypothesis from step 5, basis b/g/A and IsFrame, arbitrary sigma and rho extending it, tau:nat, t:real, f:cuspOn U Z (tau*G), hf in smallL. First norm_genVal_le: expand f=sum_j b.repr(f)_j b_j and evaluate using linearity and sigma=rho∘algebraMap. The scalar value is a complex bilinear pairing; norm_pairing_le with hF.herm and hF.norm gives
  |rho(genVal f)| <= petOn_sigma(f)*S.
This is not Euclidean Cauchy-Schwarz on arbitrary coordinates unless the frame metric is transported. hF is essential.

The source passes from sigma to goodOf c sigma only for chart evaluation. goodHom is rho when sigma is good, otherwise complex conjugation composed with rho; norm_goodHom preserves absolute value. Do not replace sigma in A(sigma) or petOn_sigma. GenFrEx and InfFr.nonempty produce a frame F from genFr and a Borel correction t^-1, preserving LiesOn Z. Its point belongs to framesOn(U(goodOf sigma),Z). For any section f' at exponent G', F.nrm_eq gives
  homN(G',f',F.pt) = F.fac(x,G') |rho(genVal f')|.
Here C=F.fac(x,G)>0 is the product of lieFacZ, positive chart nfac on the domain, and norm of a product of units. The source proves multiplicativity under even second weights; F.fac(x,0)=1 follows from C0>0 and C0=C0^2. By induction F.fac(x,tau G)=C^tau for every natural tau, including zero.

For every cusp f' at base weight, the pairing bound yields homN^2 <= (CS)^2 petOn_sigma(f')^2. bergCusp_le_iff then bounds the cusp Bergman quantity by ofReal((CS)^2) (extended nonnegative reals). bergCusp_eq_bergOn uses hd and the pointwise span hspan to pass to the full holomorphic Bergman quantity B at F.pt. SmallL's archimedean condition, specifically hf.2 at goodOf sigma, gives
  ofReal((C^tau |rho(genVal f)|)^2) <= ofReal(exp(2 tau t)) B^tau
  <= ofReal(exp(2 tau t)) ofReal((CS)^2)^tau.
All real quantities inside ofReal are nonnegative, and upper bound finite, so the stated ofReal multiplication/power and order lemmas reduce to ordinary real inequality. Since exp(2 tau t)=(exp(tau t))^2,
  (C^tau |rho(genVal f)|)^2 <= (C^tau exp(tau t) S^tau)^2.
Both sides before squaring nonnegative; taking nonnegative square roots and cancelling C^tau>0 proves the target. S=0 is allowed, no division by S; tau=0 uses power zero, including 0^0=1. No t>=0 needed. In the actual caller hY.dictU supplies hd, rank >=2 gives dimFlag>=1 and hP.p1 supplies toroidal flag, AllWt.even_wtOf supplies parity. Retain the caller's positivity and other assumptions. This is the exact bridge from analytic smallness to arithmetic small-section norm in RUN5.

## 7. Tests and limitations
Actual V8 BigInt run result {"twist":330,"nonDom":2471,"zeroTail":330,"negativeShift":260,"conjugation":25,"pairing":390625,"scaling":72900,"zeroS":18225,"zeroTau":14580,"negative":3}. Finite exact tests of signed weight twisting (single block, length 0–4, entries -3..3), Gaussian integer bilinear pairing in dimension two (ordinary identity metric, not arbitrary native IsFrame), conjugation, scalar cancellation for positive rational C and exp(t) and nonnegative rational S including S=0 and tau=0; three explicit negative controls. In the scalar test d cancels after denominator clearing, hence its loop does not represent independent mathematical cases. zeroTail/negativeShift, zeroS/zeroTau are subsets, not additional test counts. These are regression illustrations, not independent proofs of imported geometric or analytic results. No Lean kernel run or URT performance claim. No assumptions discarded. Source matches: 8 re-fetched blobs, 61 text anchors. The two relay blobs above were inspected earlier in this session, not counted in re-fetch ledger.

Save the following code to run10.mjs and run node run10.mjs:
~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let twist=0,nonDom=0,zeroTail=0,negativeShift=0,conjugation=0,pairing=0,scaling=0,zeroS=0,zeroTau=0,negative=0;
 const weights=(n,a=[])=>n===0?[a]:Array.from({length:7},(_,i)=>weights(n-1,[...a,i-3])).flat();
 for(let n=0;n<=4;n++)for(const w of weights(n)){
  let decreasing=w.every((x,i)=>i===0||x<=w[i-1]);
  let M=w.reduce((s,x)=>s+Math.abs(x),0),a=w.map(x=>x+M+1).concat([0,0]);
  let dom=a.every((x,i)=>i===0||x<=a[i-1]);
  ck(dom===decreasing,"dominance equivalence");if(!decreasing){nonDom++;continue}
  ck(a.slice(0,n).every((x,i)=>x>=1&&x-(M+1)===w[i]),"exact twist");
  ck(a.slice(n).every(x=>x===0),"out-of-range zero");
  zeroTail++;twist++;
  if(w.some(x=>x<0))negativeShift++;
 }
 const sq=([a,b])=>a*a+b*b;
 const cm=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 let ga=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)ga.push([BigInt(a),BigInt(b)]);
 for(const z of ga){ck(sq(z)===sq([z[0],-z[1]]),"conjugate");conjugation++}
 for(const a of ga)for(const b of ga)for(const c of ga)for(const d of ga){
  let x=cm(a,c),y=cm(b,d),lhs=sq([x[0]+y[0],x[1]+y[1]]),rhs=(sq(a)+sq(b))*(sq(c)+sq(d));
  ck(lhs<=rhs,"complex bilinear Cauchy Schwarz");pairing++;
 }
 // exp(t) represented by positive rational u/v, C = c/d, S = s/r, |rho f| = f/g.
 // Check the exact cross-multiplied squared premise iff the unsquared conclusion.
 for(let c=1n;c<=3n;c++)for(let d=1n;d<=3n;d++)for(let s=0n;s<=3n;s++)for(let r=1n;r<=3n;r++)
 for(let u=1n;u<=3n;u++)for(let v=1n;v<=3n;v++)for(let k=0n;k<=4n;k++)
 for(let f=0n;f<=4n;f++)for(let g=1n;g<=3n;g++){
  let L=f*(v*r)**k,R=g*(u*s)**k;
  let pl=(c**k*L)**2n,pr=(c**k*R)**2n; // d^k cancels identically after clearing denominators
  ck((pl<=pr)===(L<=R),"positive square and frame cancellation");scaling++;
  if(s===0n)zeroS++;if(k===0n)zeroTau++;
 }
 // Necessity of positive frame factor for cancellation when k>0.
 ck((0n*2n)**2n<=(0n*1n)**2n&&!(2n<=1n),"zero frame counterexample");negative++;
 // F(0)>0 + F(0)^2=F(0) forces F(0)=1; zero cannot substitute.
 ck(0n*0n===0n&&0n!==1n,"zero idempotent");negative++;
 // Nonnegative comparison required when taking square roots.
 ck((-2n)**2n<=(-3n)**2n&&!(-2n<=-3n),"negative square control");negative++;
 return {twist,nonDom,zeroTail,negativeShift,conjugation,pairing,scaling,zeroS,zeroTau,negative};
}
console.log(JSON.stringify(regression()));
~~~

Source ledger for reproduction on pinned checkout (git rev-parse PIN:path and line text):
~~~json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean",
    "sha": "8594fde18897fec5e51d38efa44601913999814f",
    "anchors": [
      [
        29,
        "hY.dictU"
      ],
      [
        38,
        "Nat.choose_pos h3"
      ],
      [
        39,
        "nonempty_toroidal_flag_bundle"
      ],
      [
        43,
        "local_unit_map_surjective"
      ],
      [
        44,
        "extVan_section_has_cusp_form_match"
      ],
      [
        50,
        "exact norm_small_le"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/LocalUnitMapSurjective.lean",
    "sha": "c44f6011501e9d2938f71d934d931cf9b6d66a06",
    "anchors": [
      [
        9,
        "intro hNV _"
      ],
      [
        11,
        "VanishingBound.keySec"
      ],
      [
        24,
        "hB.1 (LinearMap.ext"
      ],
      [
        26,
        "NonDomVanish.eq_zero_of_lt"
      ],
      [
        29,
        "Nat.le_induction"
      ],
      [
        32,
        "VuOnto.exists_comb"
      ],
      [
        33,
        "VuOnto.tw_of_dec"
      ],
      [
        34,
        "mem_SS_of_mem_holSub"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean",
    "sha": "73af5a84e8e43d8a3d0e4b4066937e39941a83fe",
    "anchors": [
      [
        178,
        "theorem tw_of_dec"
      ],
      [
        183,
        "set M : ℕ"
      ],
      [
        193,
        "exists_even_sec_evR_ne_zero"
      ],
      [
        195,
        "set g : Rul"
      ],
      [
        207,
        "set a :"
      ],
      [
        211,
        "have hDa : Dom"
      ],
      [
        227,
        "Units.mul_inv"
      ],
      [
        235,
        "modelWt_add"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean",
    "sha": "3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd",
    "anchors": [
      [
        20,
        "theorem exists_comb"
      ],
      [
        28,
        "toroidal_flag_smooth_projective"
      ],
      [
        30,
        "open_secZ"
      ],
      [
        32,
        "holoOn_bdZ"
      ],
      [
        41,
        "Finset.sum_eq_single"
      ],
      [
        51,
        "bijective_valC"
      ],
      [
        57,
        "complex_section_finite_combination"
      ],
      [
        60,
        "holomorphic_extension_section_reading"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/CommonZeroEvaluation/CuspFormExtensionVanishing.lean",
    "sha": "8746de51258f8859cff21efd3cde070a015d19f8",
    "anchors": [
      [
        16,
        "evR_eq_of_sec₀_eq"
      ],
      [
        21,
        "by_cases ht : Tested y"
      ],
      [
        29,
        "idem_mul_mem"
      ],
      [
        37,
        "theorem cusp_form_extension_vanishing"
      ],
      [
        40,
        "exists_vanBd_of_mem_extVanZ"
      ],
      [
        41,
        "vanBd_le_space"
      ],
      [
        45,
        "hsf.symm.trans hg.symm"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/NormGenValLe.lean",
    "sha": "6cd851860053c9317dea330616a5794758b57dae",
    "anchors": [
      [
        27,
        "theorem fac_nsmul"
      ],
      [
        39,
        "mul_left_cancel₀ hp.ne'"
      ],
      [
        46,
        "theorem norm_genVal_le"
      ],
      [
        53,
        "b.sum_repr"
      ],
      [
        56,
        "norm_pairing_le"
      ],
      [
        69,
        "theorem norm_small_le"
      ],
      [
        86,
        "InfFr.nonempty"
      ],
      [
        103,
        "bergCusp_le_iff"
      ],
      [
        106,
        "bergCusp_eq_bergOn"
      ],
      [
        108,
        "hf.2 _ hgood"
      ],
      [
        117,
        "ENNReal.ofReal_le_ofReal_iff"
      ],
      [
        126,
        "pow_pos hc τ"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/WedgeNrmLeOfWedgeNormLe.lean",
    "sha": "f63b71f9b43b5a411b3b82d27c8a15d8f0e91e7e",
    "anchors": [
      [
        398,
        "def goodHom"
      ],
      [
        401,
        "(starRingEnd ℂ).comp τ"
      ],
      [
        403,
        "theorem norm_goodHom"
      ],
      [
        421,
        "theorem InfFr.nonempty"
      ],
      [
        425,
        "t⁻¹"
      ],
      [
        433,
        "theorem mem_framesOn"
      ],
      [
        178,
        "theorem fac_pos"
      ],
      [
        180,
        "theorem fac_add"
      ],
      [
        185,
        "theorem nrm_eq"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/NV.lean",
    "sha": "d8e8822ea9cdcaf4e35a936057bdef69a7a596a3",
    "anchors": [
      [
        8,
        "def NV : Prop"
      ],
      [
        8,
        "Dom a' n'"
      ],
      [
        8,
        "evR Xo c g y ≠ 0"
      ]
    ]
  }
]
~~~

RESUME HERE: reconstruct the native complex_section_finite_combination producer (pinned VuOntoC imports ComplexSectionFiniteCombinationStatement; upstream clump lists ComplexSectionFiniteCombination) including descent of boundary-vanishing sections and field-to-complex base change, with actual theorem hypotheses. The GAGA/boundary holomorphy arc and vanBd_le_space producers remain explicit separate obligations. Request role-labelled authenticated reachability for PositivityTheory.Xj7N.norm_small_le and PositivityTheory.Xj7N.local_unit_map_surjective, and ModelDimension.cusp_form_extension_vanishing from dependency/kernel lane. Do not redo RUN9 or this scalar chain. HANDOFF TO integration, editor, audit, literature, geometry, dependency, kernel. Project OPEN.


---

# Integrated chapter 111 — RUN10_NATIVE_CUTOFF_AND_LOSS_ENVELOPES.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN10_NATIVE_CUTOFF_AND_LOSS_ENVELOPES.md); blob 6daa1df89492e194d13a3e56e7393cf2402cf017. Peer text preserved; not independently replayed.

# RUN10 — Native cutoff and loss-envelope producers (2026-11-24)

Status: SOURCE-MATCHED / conditional human reconstruction; exact finite regression executed in V8. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No Lean replay, no claim of full RH reconstruction, kernel reachability or URT acceleration. No premises removed. This follows RUN9 (four served-prime counting bounds), not a repeat.

Preflight: read AGENTS, research state/log/protocol/continuity excerpts, swarm protocol, handoff queue, expansion, RUN7 and RUN9, all 14 peer latest RESUME HERE notes (kernel, dependencies, integration, acceleration, editor, geometry, audit, literature, character boxes, math, Galois, theta, structure, Landau). None claims this particular adapter. General CI summary 16:07:34Z PASS is not RH validation. The external blueprint was referenced by the queue but not reread this run. No physics changes.

## 1. What is actually proved

Work with the native D : D7, L : SizeData₂ D, X : G.Inst D L, K : G.Consts, real Cr,C,bo, and abstract P : Par. The same records occur throughout. Let x=L.sc.x, a=L.sc.a, b'=L.sc.b', w''=L.sc.w'' D.R.n, k=D.R.k, H0=L.sc.p0 D.R.k, X'=L.sc.X', M=max(C,0). The native set PsAt is the range of bndP (finite cutoff) filtered by primality AND InertK (SuppSat 26–31); no assumption that all primes belong. ldAt maps L₁(p) to the real cast of leastPowerExponent L p, fl to flG L C, lo to loG L C bo (54–71). ParTie (73–92) identifies x,epsilon,e₂,nA,k,N,t,p₀=natural ceil(H0), La,rG,Sc,η,ρ,th,K₀=k² x^(3 Scale.A),d,C=M,Y,bo, with their native values. The functions pd_a, pd_f, pd_Xp, pd_lx, pd_Sk and first/second_loss_param_eq give the other derived parameter ties (PowFour 908–961). Retain the entire ParTie record, not merely the displayed fields.

Under ParTie, theorem pd_fl (1058–1076) proves for EVERY p in PsAt the floor-envelope inequality, and loss_constant_le_prime_pow (1078–1096) proves for EVERY p in PsAt with p<P.p₀ the order guard. Under ParTie PLUS bo>=0, L.LaG>=0 and H0<=X', pd_lo (1114–1197) proves for EVERY p in PsAt the lower-envelope inequality. These bounds are stronger in quantifier domain than the served-only fl/lo requirements of SecondKindLoss. They do not assert a geometric gain estimate, nor a native host's existence.

## 2. Order guard is a ceiling identity, not a new arithmetic assumption

Native leastPowerExponent (LocalQuadraticParts 485):
  L₁(p) = ceil_N(log_p(Y)) + 1, where Y=k² x^(3 Scale.A).
Here ceil_N is natural ceiling, so this is valid even if Y<1; do not silently use a signed integer ceiling for negative logarithms. For p in PsAt, pd_prime (996–999) gives p prime, hence p>1. Scale.one_lt_alt gives x>1, and D.R.m_add_three_le_k gives k>0, so Y>0 even for a real exponent. Let e=ceil_N(log_p(Y)). Since log_p(Y)<=e and base p>1, monotonicity of real exponentiation yields Y=p^(log_p(Y))<=p^e. Cast the natural e+1 into R before subtracting 1: L₁(p)-1=e exactly. By tie.K₀, this proves K₀<=p^(L₁(p)-1). The proof introduces p<P.p₀ and does NOT use it (1080); it actually gives the bound on all PsAt, while the stated source theorem retains the low-prime condition. The source uses Real.rpow_logb and Nat.le_ceil; no numerical log evaluation is needed. As in RUN9, multiply by p>0 then reciprocate to get p^(-L₁)<=1/(K₀ p). Removing +1 is invalid: p=2,Y=3,ceil(log₂3)=2; without +1 the right side is 2, not >=3. No assumption about additive order of Frobenius is used to prove this particular cutoff guard. Do not confuse L₁ with a minimal actual orbit order.

## 3. Floor envelope

Set z=log_p(a)>=0 using p>1 and pd_one_le_a (963–967). Native expression unfolded by pd_fl:
  fl = C f N² z + C f z².
Abstract flF equals M f N² z + M f z² after pd_f, tie.N and pd_a. Because f is a natural cast and N²,z,z²>=0, C<=M can be multiplied by each nonnegative factor; sum. No restriction C>=0 is assumed here. This reproduces the exact source estimate; the later counting argument requires P.C=M>=0, not C>=0.

## 4. Lower envelope and all cutoff branches

Let
  A1=rG b' log x,
  A2=b'/x+η+Sc+(w''+t)log x/δ₁,
  B=La a/(p k) + (if p<H0 then a p^(-L₁(p)) else a/p²),
  Z=(Sc+k+η) log_p(2a).
The native lower term unfolded by pd_lo 1181–1192 is
  lo = C Z + (if I then (if L then C A1 else if W then C A2+bo else 0) else 0)
       + (if I and W then C log x B else 0),
where I means D.host.cls p = PrimeClass.inertClass (not the broader InertK filter), L means (p:R)<H0, W means (p:R)<X'. These are distinct predicates. The abstract loF, after parameter ties, equals
  M Z + (if W then (if L then M A1 else M A2+bo)+M log x B else 0).
This uses p<P.p₀ iff (p:R)<H0 via tie.p₀ and Nat.lt_ceil (1133–1134). Equality with a cutoff belongs to the upper branch; do not use <= in place of <. H0<=X' guarantees L implies W. pd_lo explicitly uses sc_pos (x,b,a,X',b' positive), log x>=0, delta1>0, pd_wpp_pos, Sc_pos, etaSz_pos, natural k,t,rG nonnegative, p>1, a>=1, and the separate hypotheses La>=0, bo>=0. These prove A1,A2,B,Z>=0. Then C Z<=M Z, C A1<=M A1, C A2<=M A2, C log x B<=M log x B.

pd_key (1098–1112) is the exact conditional expression inequality behind this. For arbitrary decidable predicates I,L,W and real c1,c2,cB,m1,m2,mB,bo, assume L=>W; c1<=m1,c2<=m2,cB<=mB; m1,m2,mB,bo>=0. Then
 (if I then (if L then c1 else if W then c2+bo else 0) else 0)
 + (if I and W then cB else 0)
 <= (if W then (if L then m1 else m2+bo)+mB else 0).
Proof by cases: if not W, not L, and both sides zero. If W and I, use c1<=m1 or c2<=m2 with the same bo, and cB<=mB. If W and not I, left zero and right nonnegative. No case requires c1,c2,cB>=0. In pd_lo, c1=C A1, c2=C A2, cB=C log x B, m1=M A1,m2=M A2,mB=M log x B. Add C Z<=M Z. The logic would fail without L=>W or bo>=0 in the non-inert high branch; executable controls below show this.

## 5. Exact transfer to the joint loss hypotheses

side_at (1199–1209) universally takes the native X,K,Cr,C,bo, H:PtH X K Cr, P,tie, and hbo,hLa,hp0. Its ten conjuncts, in order: native top-weight range, odd exponent and positive lower weights, exceptional exponent>=1 and nonnegative weights, pd_fl, pd_lo, the order guard, Xpp equality, a equality, Xp equality, theta equality. PtH itself is the seven-field record at SuppSat 94–101 (fills, supp_sat, drop_iff, Knn, kapI, Cr1, numN). lossHyp_at (1989–1998) additionally assumes LinkG_at; constructs ParametersHyp using unitRule_at, side_at, served_le, high_gt, loss_bound_at, nonserved_zero. It restricts the universal fl and lo bounds to served p and passes the order guard unchanged. LossRequirementsOfSmallShares.loss_setting_family (41–80, especially 71) consumes this in the joint loss theorem. This closes the exact producers of hL,hfl,hlo requested in RUN9, while the *different*, substantive served-ledger inequality in loss_bound_at still depends on LinkG_at. Do not infer it from ceiling algebra. Other class and scale hypotheses unchanged.

## 6. Source anchors, hashes and drift

All links are relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ :
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean | 8166795ec6e846795d7272781119ee7d17d426c0 | pd_a 911–912, pd_Xp 914–915, pd_f 927–928, pd_lx 942–943, pd_Sk 951–952, first_loss_param_eq 954–956, second_loss_param_eq 958–961, pd_one_le_a 963–967, pd_wpp_pos 969–973, pd_prime 996–999, pd_fl 1058–1076, loss_constant_le_prime_pow 1078–1096, pd_key 1098–1112, pd_lo 1114–1197, side_at 1199–1209, unitRule_at 1982–1987, lossHyp_at 1989–1998.
- src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean | 80c1d0526b661eae74d87ec3b569d6a459e900ce | bndP 26–27, PsAt 31, clAt 43–47, ldAt 54–71, ParTie 73–92, PtH 94–101.
- src/Formalism/SharpRestriction/Divisibility/LocalQuadraticParts.lean | c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265 | leastPowerExponent 485, floorTermOfPrime 489–491, lowerTermOfPrime 495–507 (the latter is related, but uses groupRank instead of rG; do not identify it definitionally with loG).
- src/Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean | 287dcaae544bf078e47910aa5c9986ec501bdbd2 | loss_setting_family 41–80, call at 71.
- src/Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean | 3f609406f5456e034f5dfb94e9688fca6c9f95a9 | PrimeClassLossHypotheses 86–94.

Latest upstream observed 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48 UTC, merge PR #1198). Compared full fetched text for three files: PowFour changed blob to 74c8dc05d5ed540a5af4ef295afbd7d40b973082 but all blocks pd_fl through side_at old 1058–1209/new 1025–1176 match line-for-line (common prefix 287 lines); lossHyp_at old 1989–1998/new 1638–1647 matches (19-line prefix). SuppSat changed to d5821c10326628e5285dfbca3dcf787a1cb19aab; ldAt and ParTie blocks still match (81 and 62-line prefixes). LocalQuadraticParts changed to cd0fa6ba21f8fc89064651e72fc02eb4a9439baa; exact starting declaration leastPowerExponent no longer found in that file. It may have moved; not asserting deletion or migration equivalence. No upstream pin change.

## 7. Reproducible executed regression

Save the following as run10.cjs and run node run10.cjs. Exact integer/rational tests; no native Lean objects, real transcendental evaluation, or proof-term extraction. For positive rational Y, the natural ceiling is modeled by the least e>=0 with p^e>=Y, equivalent by monotonicity. Floor terms and branch expressions use exact small-integer/rational surrogates of nonnegative multipliers. Negative controls explicitly drop +1, L=>W, bo>=0 or multiplier nonnegativity. No inference from finite sampling to universal theorem.

```js
function regression(){
 const c={ceil_guard:0,reciprocal:0,floor_clamp:0,cutoff:0,branch_transport:0,negative:0};
 const ck=(v,k)=>{if(!v)throw Error(k+" #"+c[k]);c[k]++};
 function exponent(p,u,v){let pow=1n,e=0;while(pow*v<u){pow*=p;e++}return [pow,e]}
 for(let p=2n;p<=19n;p++)for(let u=1n;u<=100n;u++)for(let v=1n;v<=16n;v++){
  let [pow,e]=exponent(p,u,v);
  ck(pow*v>=u&&(e===0||pow*v<p*u),"ceil_guard");
  let L=e+1;ck(p**BigInt(L)*v>=u*p,"reciprocal");
 }
 for(let C=-6;C<=6;C++)for(let f=0;f<=5;f++)for(let N=-3;N<=3;N++)for(let n=0;n<=5;n++)for(let d=1;d<=5;d++){
  let B=f*(N*N*n*d+n*n);ck(C*B<=Math.max(C,0)*B,"floor_clamp");
 }
 for(let p=0;p<=20;p++)for(let n=0;n<=90;n++)for(let d=1;d<=9;d++)
  ck((p<Math.floor((n+d-1)/d))===(p*d<n),"cutoff");
 function branch(C,a,b,z,bo,inert,low,within){
  let M=Math.max(C,0);
  return [(inert?(low?C*a:within?C*b+bo:0):0)+(inert&&within?C*z:0),
    within?((low?M*a:M*b+bo)+M*z):0]
 }
 for(let C=-4;C<=4;C++)for(let a=0;a<=5;a++)for(let b=0;b<=5;b++)for(let z=0;z<=5;z++)for(let bo=0;bo<=4;bo++)for(let inert of [false,true])for(let [low,within] of [[true,true],[false,true],[false,false]]){
  let [l,r]=branch(C,a,b,z,bo,inert,low,within);ck(l<=r,"branch_transport");
 }
 let [_,e]=exponent(2n,3n,1n);
 ck(2n**BigInt(e-1)<3n,"negative"); // removing +1 from L1 fails
 for(let args of [[1,1,0,0,0,true,true,false],[0,0,0,0,-1,false,false,true],[-1,-1,0,0,0,true,true,true],[-1,0,0,-1,0,true,false,true]]){
  let [l,r]=branch(...args);ck(l>r,"negative");
 }
 return c;
}
console.log(JSON.stringify(regression()));
```

Actual V8 output: {"ceil_guard":28800,"reciprocal":28800,"floor_clamp":16380,"cutoff":17199,"branch_transport":58320,"negative":5}. All assertions succeeded. Positive tests 149499, five negative controls. Complexity O(number of enumerated samples times max exponent for the exact loop); no comparison to a URT method.

## RESUME HERE

Next source-linked task: reconstruct the actual served-ledger inequality loss_bound_at (PowFour, around 768 onwards) and its exact LinkG_at inputs. Trace the proof of the retained-top sum and its native gain/tau equality; locate actual loG/flG declarations rather than assuming the related LocalQuadraticParts groupRank formula equals rG. Begin by inspecting that pinned theorem and its direct call to hG, then trace the upstream producer of LinkG_at. Independent audit requested: check the natural ceiling, strict cutoffs, distinction inertClass vs InertK, signed C, nonnegative bo and B, and that this adapter does not independently prove the served-ledger inequality. Request dependency lane exact qualified names and typed role reachability for loss_constant_le_prime_pow, pd_fl, pd_lo, lossHyp_at. HANDOFF TO math, geometry, audit, editor, integration and dependency lanes. Project OPEN.


---

# Integrated chapter 112 — RUN10_IWASAWA_RESTRICTION_KERNEL.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN10_IWASAWA_RESTRICTION_KERNEL.md); blob 3da9e9247273cca664aaa12014cadbbdefecbade. Peer text preserved; not independently replayed.

# Theta lifts RUN10 — Iwasawa factorization and the invariant restriction kernel

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the actual Avac.iwaQ_of' producer, conditional on native TAll and the existing SD/LD data. No Lean replay or URT speed claim. RH project OPEN.

## Continuity and upstream

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log head, continuity, research protocol, CI summary checkpoint 380 (physical PASS unrelated to this proof), RUN9 and recent specialist handoffs (Galois, character boxes, Landau, literature, geometry, prime, editor, kernel, acceleration, integration); other lane directory listings inspected but not all latest bodies reread; linked external blueprint not reopened. Geometry RUN9 concerns integral moduli tangent frames, not this adelic theta restriction. No duplication with its proof. Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Main head observed 1da818b50f1e18808db2792b9dc735bda8cb84d8; IwaTop path 404 at head, ParabolicThetaScalar head blob a23779d94797d121d725fb22c982427066172a1d, SiegelWeilStdOf head blob ba9124032c534e1ddb55f57c44896c58c699a144. No migration equivalence inferred; maintain original pin.

## 1. Exact statement and caller

SiegelWeilStandard/SiegelWeilStdOf.lean:63–65 supplies (Avac.iwaQ_of' hT) to AStep.stepOf. IwaTop.lean:17–46 proves iwaQ_of' (hT : TAll) : IwaQ. LowerRankDatum.lean:150–153 defines IwaQ: for every number-field pair F,E with Algebra F E and sigma:E→ₐ[F]E, every d:SD sigma, L:LD d and x:d.G, there exist q,k:d.G, g:L.sd.G, r:real, c:complex with k∈d.K, x=q j(g) k, r>0 and simultaneously

  a_d(j(h)x)=r a_L(hg) for every h∈L.sd.G,
  T_d(om_d(j(h)q)Phi)(X)=c T_d(om_d(j(h))Phi)(X)

for every Schwartz Phi, every h and every matrix X whose i0 column is identically zero. All SD/LD fields and their typeclass assumptions are inherited. The witnesses are fixed before Phi,h,X; no point-dependent scalar. The statement does not require c≠0. The higher-rank inequality m<n is not a hypothesis here. LD.res is an explicit input field, not proved by this theorem.

## 2. Obtain the factorization in the original adelic group

Write S={inl i0,inr i0}, J_eps=[[0,I],[eps I,0]], eps an integer unit, and M=inFrame_d(p). IsQ(i0,M,lambda) means M restricted to S-complement rows/columns is identity, column inl i0 is lambda times the corresponding coordinate vector, and row inr i0 is zero except at inr i0. Lambda is an adelic unit; do not replace the adelic ring by a field.

IwaLine.line_fix' first uses d.ok.hgt.iwa to write x=p0 k1. The upper-left block A of p0 is invertible by par_frame (block triangular determinant is a unit). LineFix.good d supplies GL Iwasawa with singleton {i0}, A=a1 κ, κ in kGL. Both a1 and its inverse have zeros off the distinguished column's diagonal. Their product gives (a1)_{i0,i0}(a1^-1)_{i0,i0}=1, producing the unit lambda. The lifted compact element mL(κ) is built with blocks κ and (conjugate κ^-1)^T; frame-form and inverse checks, finite integrality for the element and inverse, and archimedean unitarity establish mL_mem_K. Put p=p0 mL(κ)^-1, k=mL(κ) k1. Then x=pk and p has the claimed column. This is not the same GL over a DVR used by the geometry lane.

IwaEps.eps_eq chooses the same eps for both d and L. They share A,r,s; mixed Hermitian/skew cases are impossible because d.ok.hm gives m≥1, and the simultaneous conditions would imply A.J=0 in characteristic zero, contradicting a nonzero signature entry at an infinite place. Equal cases use KWhit.rel_sign. Both frames then preserve J_eps after scalar extension.

SubMulRight.q_split' uses the form identity M^T J_eps conjugate(M)=J_eps. Evaluating against the distinguished column forces the corresponding opposite row to vanish off its distinguished entry: the multiplier eps conjugate(lambda) is a unit. Restrict the form identity to S-complement: the removed summand is zero by the row condition. The restricted matrix preserves the lower form, and mkG constructs the actual g:L.sd.G (invertibility from determinant of a product equal to one, then conjugation out of its frame). Because j(g^-1) acts as identity on the distinguished rows/columns, multiplying M on the right by its frame inverse kills the complement block to identity and preserves the column/row conditions. Thus q=p j(g)^-1 satisfies IsQ and x=q j(g) k. This uses exact LD.j_in, j_out, em injection and range complement, not arbitrary compression of a group element.

## 3. Height: the ratio is the absolute value of the distinguished unit

IdentityOnLastEmbedding.q_conj' proves IsQ is invariant under j(h)-conjugation, with unchanged lambda. Indeed H=inFrame(j(h)) and H^-1 both fix distinguished rows/columns, and H M H^-1=I+H(M-I)H^-1; its complement block is I and its distinguished column/row are preserved.

EmEqInr.q_ht' uses isQ_21 (lower-left zero), isPar_of_frame, and isQ_11: every row of the upper-left block except i0 equals the identity row, with diagonal entry lambda at i0. The determinant is lambda by det_row. Lower-rank height equality a_d(j(h))=a_L(h) is proved by a_j using the lower model Iwasawa, j_K (embedding preserves compactness, including finite integrality of inverse), determinant of embedded parabolic block diag(A',1), and both original height normalizations. Therefore
  a_d(q j(h))=|lambda|_E a_L(h).
Set r=|lambda|_E. IwaCut.absE_pos follows from |lambda|_E |lambda^-1|_E=1 in nonnegative reals. Now j(h)x=(j(h)qj(h)^-1) j(hg)k; right K-invariance, conjugacy and q_ht' give the required a_d(j(h)x)=r a_L(hg). No assumption about raw height as a group homomorphism.

## 4. Scalar on the restricted Schwartz values

ParabolicThetaScalar.parabolic_theta_scalar:108–167 has premise TAll, an index i0, q:d.G, lambda an adelic unit and IsQ. Write inFrame(q)=[[A,B],[0,D]]. par_frame constructs n0,m0 IN d.G with q=n0 m0, frames [[I,BD^-1],[0,I]] and diag(A,D). Both diagonal blocks are invertible: triangular determinant is unit; form preservation implies block-diagonal form preservation. Native Weil action hT.2.1 supplies the unipotent phase and Levi action. In detail:
- IsQ implies columns of D away from i0 are identity columns, as are those of D^-1 by inv_col. Hence X D^T=X and X(D^-1)^T=X if X's i0 column is zero.
- For beta=BD^-1, entries beta_ij vanish when both i,j differ from i0; this follows by splitting the product sum at i0.
- Gram G_X=d.gram X X has zero row and column i0. In trace(beta G_X)=sum_ij beta_ij G_X,ji every summand is zero: either i or j equals i0 (Gram factor zero) or neither does (beta factor zero). Thus d.tt(beta G_X)=0 and the additive character evaluates to 1. No unproved cancellation of nonzero oscillatory integrals.
- Apply the unipotent action to om(m0)Phi, which is Schwartz by stability, followed by the Levi action. The source chooses the fixed scalar
  c=chi(det A) |det A|_E^(m/2)
with the source's real-power/complex coercions. Consequently T_d(om(q)Phi)(X)=c T_d(Phi)(X) for every Schwartz Phi and every zero-column X. No nonzero assumption or division by c in iwaQ_of'. The determinant of A is lambda by the same isQ_11/det_row identity; no change to the source choice is necessary.

## 5. Key simplification: invariant kernel, not an unjustified commutation of q and j(h)

Define the linear restriction R0(Phi): X↦T_d(Phi)(X) on zero-column matrices, with Schwartz domain. Let N=ker R0. The LD.res field with lower vector 0 implies om(j(h))N⊂N for ALL h: a zero restriction is a valid match with the lower zero Schwartz vector; om'(h)0=0 and T'(0)=0. This step uses no surjectivity of R0 and no extension of Phi from a lower vector. It is exactly IwaTop lines 36–37.

For each Schwartz Phi put Psi=om(q)Phi-c Phi. Schwartz stability and submodule closure give Psi Schwartz. The scalar result gives R0(Psi)=0. By kernel invariance R0(om(j(h))Psi)=0. Linear action and the group-homomorphism law now give
  R0(om(j(h)q)Phi)=c R0(om(j(h))Phi).
This is the desired uniform scalar transport. Equivalently the residual om(q)-c Id has image in N and N is stable under the embedded group. This is a human-readable restatement of the exact residual proof, not a new premise or novel URT result. In particular q and j(h) need not commute; scalar equality before applying j(h) would not suffice without LD.res. This explains why RUN9 could transport the same c at every lower group point, including h=1.

## 6. Dependency and trust boundary

Actual source-body edge: Fin.siegelWeilStd_of → Avac.iwaQ_of' → line_fix', eps_eq, q_split', parabolic_theta_scalar, absE_pos, KWhit.a_mul_K, q_ht', q_conj', KWhit.om_mem_sch, Tl linearity, LD.res, T_zero. Expanded local producers above; deeper obligations still include TAll (particularly the two Weil action laws and Schwartz stability), CM Good/Iwasawa, SD height and frame package, LD construction and its equivariant restriction, and imported form/height lemmas. General matrix/determinant, Iwasawa and Weil-action ideas are classical; no publication attribution is inferred solely from names and no new independent published theorem is claimed. No assertion that any remaining field is an axiom, sorry, placeholder or independently verified without kernel evidence. Static reference matches are not elaborated edges. This advances RUN9's IwaQ input only.

## 7. Executed source check and reproduction

Connector JS fetched the ten files at the original pin, compared supplied blob IDs to independently recorded IDs, and asserted 88 literal line anchors; all 88 matched. These are actual source checks, not numerical model tests, raw-byte hash replay or kernel validation. Reproduce on the upstream checkout by saving the following compact certificate as Python and executing from its root. It checks the same ten blob IDs and a representative anchor per file (88-anchor expanded list not needed to reproduce the source identities).
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
base="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
rows=[
("SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",65,"Avac.iwaQ_of'"),
("LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",150,"def IwaQ"),
("VacuumIwasawa/IwaTop.lean","fc0a326c9635f836f0e78f145cc65d63b0edf6c3",36,"L.res Ψ hΨs 0"),
("VacuumIwasawa/IwaCut.lean","49a7dc8c42a6c69adeaeb266e8ed4b153d5a42ff",26,"theorem absE_pos"),
("VacuumIwasawa/IwaLine.lean","ab197cdaeb23edc0926fcfafc2b35e9492013b2c",181,"theorem line_fix'"),
("VacuumIwasawa/IwaEps.lean","9059bb27db8d8d41f34c5844618ed5f324266360",33,"theorem eps_eq"),
("VacuumIwasawa/SubMulRight.lean","5104f800f1594f01f51f74e7556ab6d3a7b94c72",155,"theorem q_split'"),
("VacuumIwasawa/ParabolicThetaScalar.lean","1f8b19544f40d1685d5ff724ce30274debd4d348",108,"theorem parabolic_theta_scalar"),
("VacuumIwasawa/IdentityOnLastEmbedding.lean","cd1cfd6fb2fda59773b8180626f670e1507c01fe",102,"theorem q_conj'"),
("VacuumIwasawa/EmEqInr.lean","ead3a45ff2876c86d6d5b18efc70f63f0d1f8d53",180,"theorem q_ht'")]
for p,sha,i,a in rows:
    b=subprocess.check_output(["git","show",pin+":"+base+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=b).decode().strip()==sha,p
    assert a in b.decode().splitlines()[i-1],(p,i)
print(len(rows),"blob IDs and representative anchors")
```
Python replay above not run here; connector static check was executed. No physical gate/queue changes.

RESUME HERE: reconstruct the actual Avac.vacK_of producer (VacuumIwasawa/VacTop.lean, caller SiegelWeilStdOf line 58), especially lower-rank restriction of vacuum generators and the Fock inclusion; CwInvIota.vac_K' and its finite-place peeling are separate native inputs. Keep LD.res construction, OrbRes, HolLead, FourierZero and lInt2 deeper suppliers open. Request role-labelled authenticated kernel edges for Avac.iwaQ_of' and parabolic_theta_scalar. HANDOFF TO integration, editor, theta, dependency, kernel, audit and literature. Project OPEN.


---

# Supporting report — kernel_extractor/RUN10_RESUME.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/RUN10_RESUME.md); blob a9a83c3f518c52e7e66fbec2ae22e1de2552a541.

# RUN10 — RC1 native cached axiom discrepancy reproduced; isolated collector retry (2026-11-24 16:08 UTC)

RESULT: REVIEW / PARTIAL. Actual native fixture results obtained on the newer compiler, independent 22-assertion V8 log/source audit executed; fresh collector failed to elaborate because internal declarations are not exposed. New retry preserves exact upstream collector body and tests fresh and shared-state query orders. No RH kernel recheck or URT speed improvement.

Preflight: AGENTS, research state/log/protocol, continuity, swarm queue/protocol/expansion, kernel RUN9, acceleration RUN10, recent geometry, literature, boxes, math, Galois, theta, Landau, prime, integration handoffs and dependency/audit/structure/editor commit identities checked; editor full manuscript and audit/structure full code not read in full. Physics CI #379 PASS at 16:07:34Z, unrelated to RH. Dependency lane 2ce70c4f251e6ba2fce13f1ff8d77d32cf80b3fb already registered targeted six-root typed witness extraction; do not duplicate. Acceleration ba18e997ef94ab85dd013318436cdd34779bf6e6 registered manifest membership approach.

Original RH pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc, root riemannHypothesis := rhOfAll, Lean v4.33.1 (819816b2e0a3bf405af45ae5c7af2491d8f5bee6). Latest upstream observed 1da818b50f1e18808db2792b9dc735bda8cb84d8 (batch 6 of 68 small PRs); Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f remains unchanged from RUN9, root Claim.zeta LFunction_ne_zero_of_half_lt_re, toolchain blob 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05 v4.37.0-rc1. No full upstream diff/equivalence checked. Never join revisions.

## Actual native results
Run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45422470785 at 980b933389d019d3c1b1f07177c928899fed2b66 finished with returncode 1, wall 12.61 s. Release checksum passed, Lean version 4.37.0-rc1 commit 0b77e12952ad39077d80d8bd6b66d601f225c321. Both local and imported fixture commands succeeded before fresh collector failure. Results (names normalized to CathedralAxiomCycle.*):

| Root | Local #print axioms | Imported #print axioms |
|---|---|---|
| Witness | guardProp | guardProp |
| Witness.plain | guardProp | empty |
| Witness.guarded | guardProp | guardProp |

This independently reproduces the v4.33.1 local/imported *report* difference on the currently observed RH toolchain. It does not show that plain needs guardProp logically, does not establish a kernel soundness bug, and is not an RH audit. Imported results differ from constructor-inclusive closure; expression-only policy differs from collector policy (RUN9). Keep edge roles.

FreshCycle.lean failed: unknown identifier Lean.CollectAxioms.runM, followed by unresolved map on fresh. No fresh results produced. RUN9's claim that absence of explicit private meant externally public is corrected: upstream source uses module, no public section around these declarations, and explicitly public def collectAxioms only at the outer API. This is a source-supported diagnosis plus observed compiler error, not an independently tested import-all claim.

Evidence branch cathedral-research-state, compute/rh-native-cycle-rc1-20261124/: status.json blob e2bde786559eafebaab0dd64bbb0ef04eff5021c; outputs/cycle_local.log blob 347437e1d611ee083544014154156b546862bef4 SHA256 5a61a3a86cf257defcdcfd5b7c03e2351993817b3bc1ba579d40875b4c42de37; cycle_imported.log cce9a963c1005df7e35dda0bb59ac4db1731037f SHA256 6d58833bc9d191921baf9743170d3c2f5365279ed9653ad9c8787f45abb2d357; fresh.log 5bc79bed8e55c2eaa42e410bde97b3a3f57645c1 SHA256 0f4426a0370d89930fb3de03f86485e58c0e995bdb6af7662afef01f83e4a3f9. Source https://github.com/leanprover/lean4/blob/0b77e12952ad39077d80d8bd6b66d601f225c321/src/Lean/Util/CollectAxioms.lean blob e789f33849debe5cc1f1d9bc60aa3e54a56df0d9.

Actual local V8 executed 22 assertions: checked status, pin, toolchain, three log byte counts, all six local/imported rows, exact native primary error, source module/visibility markers, unchanged collector body under reversible namespace rename, and 3 deliberate source mutation controls (marker, kernel lookup, sentinel). Body 70 lines, 3028 UTF-8 bytes. All 22 passed. V8 used authenticated GitHub blob identities, not independent SHA256 computations. Reproducible Node wrapper audit_rc1_visibility.mjs adds independent SHA1 Git blob and SHA256 file checks; wrapper not executed here. Run node audit_rc1_visibility.mjs COMPUTE_DIR PINNED_CollectAxioms.lean after retrieving named inputs. Native lean absent locally, git network unavailable; no fresh execution claim.

## Retry
run_native_cycle_rc1_isolated.sh fetches exact pinned source with Git blob digest check, extracts only the original collector namespace with copyright header, copies all collector function bodies verbatim under Lean.CathedralFreshCollectAxioms in same source module as the test, and invokes the fresh original algorithm with extension lookup disabled. No modifications to Lean, upstream proof, or protected workflow. Test each fresh root in isolation, compare the public cached API and run three shared-state root orders. Report shared order results rather than stipulate a particular omission. Assert fresh constructor-inclusive reachability [guardProp] and preserve all source/logs. This copy is an independent experiment with native primitives, not a call to the hidden compiler symbol and not an exact general substitute for Lean kernel recheck. Retry registered; not executed here.

## RESUME HERE
Inspect compute/rh-native-cycle-rc1-isolated-20261124/status.json and outputs/rc1_result.json/fresh.log; if native failure, preserve exact error and fix without modifying upstream. Compare fresh and shared-state orders to prior explicit reference policy. Then coordinate with dependency lane targeted-role witness output (rh-targeted-role-witness-20261124), request exact qualified roots divisionCompatible_at_readIdentifications, divTied3_read, Deduction.logDeriv_local, poleData_abstract, poleData after names resolved by pinned source. Do not redo full export or confuse metadata with proof references. HANDOFF TO dependencies, audit, editor, acceleration, integration, Landau, character boxes. Project OPEN.


---

# Supporting report — on_acceleration/RUN10_RESUME.md

Original: [source at snapshot](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/036fa79b86ffb241441b9d2c1e07d308e7e233a9/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN10_RESUME.md); blob 42801401caea06312f6b93207c2ff7c2d57cead3.

# Run 10 — one-pass multi-lane manifest membership lookup (PARTIAL, executed V8)
Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD observed 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC), not adopted. Protocol, queue, expansion, continuity, state, lane inventories and relevant latest dependency/kernel/structure/integration/own handoffs read; not all other notes retrieved (connector call cap); blueprint not reread. Physical CI #378 PASS, unrelated to RH. No other lane modified.

The successful dependency run [45412286798](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798) retained a 38,823,812-byte Zstandard declaration manifest (1,484,705 rows) and challenge 1,356,147-byte manifest (53,242 rows); status and summary retrieved from cathedral-research-state/compute/rh-mutual-metadata-closure-20261124/. Exact SHA256, dimensions and root IDs pinned in code. Binary artifacts unavailable to this connector, local DNS blocked, no native challenge replay or full solution scan performed. Do not duplicate peer targeted-role projection. The new consumer scans a named manifest once for any set of exact tagged-name or display-only requests, retaining full selected rows including all hard refs and optional mutual metadata. Display matches are never identified as exact source names, including single candidates; exact string-vs-number and dotted-component ambiguity preserved. NOT_FOUND is manifest absence only, not source nonexistence. Duplicate IDs, duplicate selected tagged names, invalid references, missing root/count fail; unselected duplicate names and resolution of all hard references are not re-audited here. Original export remains authoritative. No source/export equivalence, kernel replay, proof-term dependency reconstruction, or proof translation implied. Original source anchor src/Main.lean theorem riemannHypothesis := rhOfAll verified at pinned revision.

Real fixture: https://raw.githubusercontent.com/leanprover/lean4export/15f6055e299ad5b89345e533cc2192f4cc00f659/examples/Nat.add_succ.ndjson, expected Git blob d3cd35f1313b4e78b5fded9886e450112aa75def. Fetched entire text, actual 32 declaration identities tested with fixture-specific structural-row adapter (not full decoder); local V8 certificate executed on retrieved contents, Node CLI Git blob check not run. Synthetic 15 queries and 100,000 rows: same exact output, no omitted candidate within these fixtures. Baseline scans once per request; shared scans once for all, golden and periodic schedule query registration only (not traversal order). O(B + Q + K) expected with fixed-width IDs and string key bytes counted, K matching output links, O(names/8 + Q + selected rows + K) memory excluding parser single line, runtime and input. Golden/periodic sorting O(Q log Q). Synthetic input is preallocated; cold first and later process scans not OS cold/warm, no measured peak RSS here; CLI records native max RSS. No claim of URT-specific advantage or arbitrary proof-search complexity. Source/import/cache pipeline from prior runs remains intact.

Executed results (V8):
```json
{
  "checks": 56,
  "negative": 6,
  "fixture": {
    "declarations": 32,
    "expressions": 434,
    "queries": 34
  },
  "n": 100000,
  "lanes": 15,
  "timings": {
    "baseline": {
      "firstMs": 3669,
      "subsequentMs": [
        3657,
        3681
      ],
      "medianMs": 3669,
      "rows": 1500000,
      "refs": 3000000,
      "metaRefs": 0,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "shared": {
      "firstMs": 263,
      "subsequentMs": [
        241,
        253
      ],
      "medianMs": 253,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "golden": {
      "firstMs": 244,
      "subsequentMs": [
        247,
        262
      ],
      "medianMs": 247,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    },
    "periodic": {
      "firstMs": 257,
      "subsequentMs": [
        258,
        241
      ],
      "medianMs": 257,
      "rows": 100000,
      "refs": 200000,
      "metaRefs": 0,
      "matchedRows": 15,
      "candidateLinks": 15,
      "bitmapBytes": 12500
    }
  },
  "limits": "Synthetic rows preallocated; V8 elapsed wall time, no measured RSS here; repeated application scans, no OS cache claim."
}
```

Replay native: node manifest_membership.mjs test /path/to/Nat.add_succ.ndjson; node manifest_membership.mjs query challenge /path/to/challenge_declarations.jsonl.zst requests.json result.json (requests.json = {"pin":"40e56bab026552e089d7afcfeff08d2defb9c005","queries":[{"id":"root","kind":"exact","name":["riemannHypothesis"]}]}). Native query authenticates compressed bytes before and after decode, then writes new output only on success; no adversarial concurrent writer guarantee. Use solution with reachable_declarations.jsonl.zst; obtain artifact through existing compute host. CLI not executed locally; new CI not yet run.

## RESUME HERE
On existing networked host retrieve the authenticated challenge manifest and run the query CLI for the six peer anchors, then repeat on solution artifact with all lanes' exact tagged-name requests; compare to independent per-request scans and typed-role witnesses, measure native peak RSS/cold/warm I/O. Keep missing and ambiguous source references unresolved, retain proof premises; no new billion-expression extraction. HANDOFF TO integration, dependency, kernel extractor and editor. Project OPEN.

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

# RUN24 — Actual Main-to-Landau third-place route, not FockModels plugAll
2026-11-25. RESULT: SOURCE-MATCHED, exact missing source wiring recovered; kernel role-path authentication outstanding. No physics changes.

Preflight: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol excerpts; recent 35 commits and peer handoffs f6b396aa (dependency), bf2888a7 (acceleration), 1dc94581 (kernel), 8700f28d (theta), 07017df6 (editor), 88a2c851 (prime). General CI #423 PASS run 45556824120 at 06:14:38Z, predates this note, not RH validation. External blueprint not reopened; full archive not read. Prior RUN23 db8c71c8. No duplicate archive scan.

## 1. Critical correction and exact source-body call direction
P=40e56bab026552e089d7afcfeff08d2defb9c005. Main.riemannHypothesis calls rhOfAll, which applies Formalism.VW.rh_of_every to allChi. allChi is UpperTheory.FinalTheorems.everyCharacter, which calls everyCharacter_of_row with galoisLocalGlobalStrong_recParameter. That calls every_character_of_literature_of_vWin with the tuple of row/local RecT/row witnesses and vwin_of_row h. The literature wrapper supplies seven arguments: published_results_eigen O, published_results_first O, the two projections of theta_integrals_agree_and_local_matching_of_literature O, CovolumeBoundOfX from topCovolSlim2_use_alt_alt (all 15 original arguments retained at L812), local_langlands_gl_recT_exists_of_literature O, and hV.

The missing declaration is in ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean L69–73, not FockModels/EveryCharacterE.lean. The actual source-body caller-to-supplier chain is:
riemannHypothesis -> rhOfAll -> allChi -> UpperTheory.FinalTheorems.everyCharacter -> UpperTheory.FinalTheorems.everyCharacter_of_row -> UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin -> UpperTheory.Lit.every_character_of_theta_integrals_local_matching -> UpperTheory.Top.every_character_of_green_v_win -> UpperTheory.Top.zero_free_all_of_green_v_win -> UpperTheory.Top.zeroFreeAll_of_topG -> UpperTheory.Comparison₂.formB -> Deduction.zeroFree_of_rpow_window -> lemmaL.
These are named calls within actual proof bodies, not merely imports, and not independently extracted kernel edges. The branch of zeroFreeAll_of_topG calling level_gm_le_on_family_scales is RUN23's arithmetic side. Mathematical implication runs from suppliers to conclusions, opposite to the call arrows.

FockModels/EveryCharacterE.lean indeed contains everyE₂ calling plugAll, but this is a different proof body with S0.HypothesesUE, Hypotheses₂, CovolX, LocalLanglandsGL and Hyps/DRS rather than the actual third-place types. Its import does not show that its alternative proof is used by Main, nor that it is globally unreachable. Do not replace actual source types with those alternatives.

## 2. Human assembly, preserving the actual hypotheses
Let P₀=UnitaryGroupThirdPlaceHypotheses, F₀=ThetaLocalInputs, A=ThetaIntegralsAgree, M=LocalMatching, X=CovolumeBoundOfX, L=RecTExists, V=VWin. These seven premises are retained. N(C) means Closed C (fun Fm _ => LinkN Fm), D=DefiniteSideCondition. S0.NL is used as N by source typing (no independent definitional-equality replay). Green follows from P₀.greenRegularCharacters via green_of_regular. For each real cDep, boundAtTwoThree_linked_of_recT P₀.nLink (parametersOfDependence L cDep) supplies linked slot norm condition on closed BoundAtTwoThreeFamilyFonAlt. At23OfAll L19–26 uses at23_family_alt with nonnegative two/three constants and three_ne_q, then LinkedAt.of_row (Row.of_sel using closed_of_all). Do not exchange universal cDep quantification with family existence.

The actual nonempty_hyps_definite_side_of_closed_bound construction (L44–68) supplies Nonempty(HypsAlt S0.NL D):
1. C=P₀.litN. FunctionalsSeparate from F₀, howeUnram_holds and P₀.siegelWeilUnitaryConvergent. RowRat via test_vector_assembly_holds with F₀.siegelSetUnitary, F₀.howeDualityReal, P₀.greenCuspidal, F₀, C.join, C.fe, A, M, hS. ConstantFunctionFits via fourier_coefficient_fit_of_join_alt and second projection of ontoX_and_lamLow_of_unitaryGroupHypotheses'.
2. evaluation_grid_of_join supplies CF1 with eventual EvLgG, using the same join, A/M, twisted Weil convergence, local-factor matching, square-theta integral equality and hS. rowFun_at_gridA_alt supplies CF0 with eventual functional condition using discreteSeriesCover, harishChandraModules, cuspRapidDecay, casselmanWallach, rayClassFieldSt and fit. Choose c=max(CF0,CF1). It dominates both, even for negative thresholds. Apply hCF1 with le_max_right and hCF0 with le_max_left at the SAME c. This synchronizes the witnesses without identifying the two thresholds.
3. Obtain OpenParameterStatements at parametersOfDependence L c. Use open_and_linked_of_stronger_extension_alt with extensionWithList, extensionWithAtProperty of extensionWithOrigin and GridA c, SExt.none, geoCl anyGeometry and the stated projection witness. Its second projection transports openness; then hCF0 supplies linked FunctionalCondition, and linked_bundles_l3_of_open_alt supplies linked CovolumeBoundThirdPlaceSeries from X and open extension, with same extension. Preserve distinct projections x.1.1, x.1, x.1.1.1 respectively.
4. Apply hypotheses_nonempty_of_unramified_exponents_alt with P₀, RowRat, L,c,GridA c,EvLgG,hN(c),hFun,hL3. Its source L41–61 constructs large_unramified_exponent_bundles_exist_alt, third-layer series/prime data, onto/low, open0, GalC.final_alt_alt row, extends openness and linked row via hmono.1, obtains allRows_of_open0_alt, then nonempty_hyps_of_allRows_alt with literature thinness, Wu decay, row finite dimension, positive row types, Siegel-Weil row bounds, mass/volume and genus mass, KPx, membership and existence. These named suppliers remain independent proof obligations.

Unpack Nonempty once inside a Prop-valued elimination. shape_closed_link_n_of_green gives TopShapeAlt True True N TopG. forall_goal_of_shape_of_hyps applies goal_of_shape_of_hyps to this shape, two proofs of True and the HypsAlt witness. ShapeOf L24–32 transports family, raw selections, spectral/base/height/column/bundle selections, row hypotheses, division row equivalence, definite row package (w1,covol,onto,lamLow,seeIso,miStar,fun0,pass,kap) with paired d, served equivalence, point/twist and period conditions, h.nRest, positivity, rank and mass hypotheses. Do not replace HypsAlt by bare family existence or discard definite row condition.

TopShape L33–55 establishes TopG by constructing closed GL/bridge kernel, single-map, twist/admissible, Wu-decay and division links, restricting design-existence to the family A∩G.cls(la) with hsub, then calling topDesWin with 2,3,2,0 and all links. Closed LinkN premise nRest enters at L53; Green enters closed_linkIRR_of_join_count at L54. Neither follows from zero exclusion.

For each primitive ψ, V ψ supplies supplyChi ψ (V ψ) for HostExW(3/2,GChi ψ.req). Since 3/2>1, zeroFreeAll_of_topG applies to TopG and entire family of hosts. RUN23 retains positive weights and exceptional real zeros, θ in (0,1), δ=1/2>0 and C=1, no global pointwise estimate assumed. imprimitive then yields EveryCharacter with guard χ≠1 or s≠1. RH follows via rh_of_every at P. This closes source wiring only, not imported premises or RH.

## 3. Upstream changes
H=a18a350c3e5aad997766cff2670b292313e46574 (latest observed 25 Nov; compare against RUN23 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 reported 269 ahead, file list capped at 300). Main now calls Claim.zeta LFunction_ne_zero_of_half_lt_re, which calls everyCharacter; old Supplements/Kernels/MainTheorems.lean returns 404 at H. MainConclusion now supplies row and RecT separately; literature wrapper no longer takes OpenLiteratureStatements O. Same theta/Green/TopG/Landau named call chain remains visible in H clumps. H TopPlug uses goal_of_shape_of_hyps directly, not forall wrapper; extension call signatures omit geoCl anyGeometry. H analytic θ≥0, still δ>0. P Mathlib 0df444a360eaa60ab8c11dca51a86af692955474 (lake-manifest blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f); H Mathlib 31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d). H Landau clump unchanged from RUN23 H by blob. Selective comparison only, not global equivalence or kernel recheck.

## 4. Actual execution and reproducible certificate
Executed via GitHub fetches and V8 assertions: 20 exact Git blob SHA checks, 55 line anchor assertions, three route-discrimination checks (P theta body calls green route not plugAll/everyE₂; FockModels really calls plugAll; H TopPlug direct adapter not forall), 10,201 integer common-threshold cases (CF0,CF1=-50..50). All completed successfully, before a tool-call budget interrupted the first attempted write. Finite threshold checks supplement the general max argument, not mathematical evidence of RH. No native Lean executed.

Below is a compact Python replay of the same assertions; run in upstream checkout containing both revisions. P/H are the exact pins above. This replay script was not executed in Python; equivalent assertions executed in V8.

```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
C="src/Development/AutomorphicArithmetic/CharacterBoxes/"
F="src/Development/AutomorphicArithmetic/PrimitiveCosets/"
rows=[
(P,"src/Main.lean","dbd5db70bc11b35f18fa5751216ab335321e7bfc",[(4,":= rhOfAll")]),
(P,"src/Supplements/Kernels/MainTheorems.lean","6a542d7ce969a791fd12ce575f587e6bc29044bf",[(7,":= UpperTheory.FinalTheorems.everyCharacter"),(9,"rh_of_every allChi")]),
(P,C+"MainConclusion.lean","ee340012ab19713a8acfecf8adc6a331cbc2f1a4",[(8,"every_character_of_literature_of_vWin"),(11,"everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter")]),
(P,B+"EveryCharacterOfLiteratureOfVWin.lean","a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",[(810,"theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin"),(811,"every_character_of_theta_integrals_local_matching"),(813,"local_langlands_gl_recT_exists_of_literature O) hV")]),
(P,B+"SiegelEisensteinSecondTermHypotheses.lean","42abe20ee235820aaa924dbabce5e1d2c2540380",[(44,"nonempty_hyps_definite_side_of_closed_bound"),(57,"max CF0 CF1"),(63,"le_max_left"),(68,"hypotheses_nonempty_of_unramified_exponents_alt"),(69,"every_character_of_theta_integrals_local_matching"),(72,"every_character_of_green_v_win"),(73,"boundAtTwoThree_linked_of_recT")]),
(P,B+"TopPlug.lean","c51cb6b5bd4bf2944ace89e00a2990da16bd519a",[(14,"zeroFreeAll_of_topG (la := 3 / 2)"),(15,"forall_goal_of_shape_of_hyps"),(18,"imprimitive (_root_.UpperTheory.Top.zero_free_all_of_green_v_win")]),
(P,B+"ShapeOf.lean","236d0eadd60b292bd0a832114f8c4a6253131250",[(24,"goal_of_shape_of_hyps"),(29,"a.w1, a.covol, a.onto, a.lamLow"),(30,"h.nRest"),(32,"goal_of_shape_of_hyps V NR N G")]),
(P,B+"TopShape.lean","3f791ca182db235c4a8ff582d3f038019320d5cd",[(33,"TopShapeAlt True True"),(50,"designExists_of_tuSize_aux4n_litThin"),(52,"topDesWin"),(54,"closed_linkIRR_of_join_count hGreen")]),
(P,B+"At23OfAll.lean","e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d",[(23,"LinkedAt.of_row"),(26,"at23_family_alt hP Fm")]),
(P,B+"HypothesesNonemptyOfUnramifiedExponents.lean","c0ce994aa86f737b707b5617fb10bcfb35c0117e",[(43,"large_unramified_exponent_bundles_exist_alt"),(47,"final_alt_alt"),(53,"hNrow"),(54,"allRows_of_open0_alt"),(57,"nonempty_hyps_of_allRows_alt")]),
(P,C+"ZeroFreeAllOfTopG.lean","54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",[(26,"(h : TopG)"),(29,"UpperTheory.Comparison₂.formB")]),
(P,F+"Imports.lean","2dc9b4e690951c66ffe443e279fcada259bcce13",[(13,"zeroFree_of_rpow_window F (δ := la - 1) (C := 1)")]),
(P,"src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean","2ed00ad3aa862f3e522686557fb8f559b17fc002",[(11,"(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)"),(14,"lemmaL F hθ hθ1 hδ")]),
(P,"src/Development/AutomorphicArithmetic/ThetaCorrespondence/FockModels/EveryCharacterE.lean","01e60174b728fc6b473a308c5bf5dbffbe017afe",[]),
(H,"src/Main.lean","eb95ca808793dd61984cc853ab5630f54a74490c",[(10,"UpperTheory.FinalTheorems.everyCharacter"),(13,"Claim.zeta LFunction_ne_zero_of_half_lt_re")]),
(H,C+"MainConclusion.lean","06c2154a1813ba89d1e48f940fb0a9a93dc9f681",[(959,"every_character_of_literature_of_vWin"),(964,"everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter")]),
(H,B+"EveryCharacterOfLiteratureOfVWin.lean","852713a42c96f09d7cec0365759d03ed852a36ad",[(1452,"hLiteratureRow"),(1454,"every_character_of_theta_integrals_local_matching"),(1458,"hLiteratureRecT hV")]),
(H,B+"SiegelEisensteinSecondTermHypotheses.lean","f03041ec7671e421087cc1ede2b573a9c7b694cf",[(1946,"max CF0 CF1"),(1957,"hypotheses_nonempty_of_unramified_exponents_alt"),(1961,"every_character_of_green_v_win"),(1962,"nonempty_hyps_definite_side_of_closed_bound")]),
(H,B+"TopPlug.lean","b4bdd73c31e85e428c602cef693ffc1240547186",[(1317,"zeroFreeAll_of_topG (la := 3 / 2)"),(1318,"goal_of_shape_of_hyps"),(1321,"imprimitive (_root_.UpperTheory.Top.zero_free_all_of_green_v_win")]),
(H,C+"ZeroFreeAllOfTopG.lean","c3bcece31e76be6368af5af4647f1ad30012fd3b",[(1228,"(hθ : 0 ≤ θ)"),(1300,"Deduction.zeroFree_of_rpow_window"),(1339,"UpperTheory.Comparison₂.formB")])]
def git(*args): return subprocess.check_output(["git",*args]).decode("utf-8")
n=0
for rev,path,sha,anchors in rows:
    assert git("rev-parse",rev+":"+path).strip()==sha
    lines=git("show",rev+":"+path).split("\n")
    for i,s in anchors:
        assert s in lines[i-1], (path,i,s)
        n+=1
def body(rev,suffix,a,b):
    path=next(row[1] for row in rows if row[0]==rev and row[1].endswith(suffix))
    return "\n".join(git("show",rev+":"+path).split("\n")[a-1:b])
p=body(P,"SiegelEisensteinSecondTermHypotheses.lean",69,73)
assert "every_character_of_green_v_win" in p and "plugAll" not in p and "everyE₂" not in p
assert "plugAll (GlobalTheory.GreenBridge.green_of_regular P.greenRegularCharacters)" in body(P,"FockModels/EveryCharacterE.lean",1,1000)
h=body(H,"TopPlug.lean",1315,1321)
assert "goal_of_shape_of_hyps" in h and "forall_goal_of_shape_of_hyps" not in h
count=0
for a in range(-50,51):
    for b in range(-50,51):
        assert max(a,b)>=a and max(a,b)>=b
        count+=1
print(len(rows),n,3,count)
```

## RESUME HERE
Dependency/acceleration/kernel: use one shared authenticated manifest lookup and targeted value-role extraction of UpperTheory.Lit.every_character_of_theta_integrals_local_matching, UpperTheory.Top.every_character_of_green_v_win, UpperTheory.Top.zero_free_all_of_green_v_win, UpperTheory.Top.zeroFreeAll_of_topG, UpperTheory.Comparison₂.formB, Deduction.zeroFree_of_rpow_window, UpperTheory.Top.shape_closed_link_n_of_green, GlobalTheory.Fc.goal_of_shape_of_hyps. Do not target plugAll as assumed Main edge; no duplicate full archive scan. Next reconstruct topDesWin's closed-family link transport from shape_closed_link_n_of_green, coordinating with prime/audit and shape specialists; use role paths when returned. HANDOFF TO dependencies, kernel, acceleration, theta, prime, audit, integration, editor. Full RH OPEN, no kernel validation, no URT improvement claimed.

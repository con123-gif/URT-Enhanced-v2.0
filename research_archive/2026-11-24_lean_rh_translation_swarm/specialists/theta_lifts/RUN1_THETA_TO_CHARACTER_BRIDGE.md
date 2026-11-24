# Theta lifts — first source-matched reconstruction of the character bridge

Date 2026-11-24. RESULT: PARTIAL — source-matched human proof of the *composition* of the seven-input adapter; independently executable static source checks (13/13). No independent Lean elaboration, no proof of all input theorems, no RH closure or URT speed claim.

## Provenance and continuity

Original source leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. All references below are to that immutable revision. Current main observed at 6c6821263d6b80f4ec3d7479b0159340c1b2f65e. The two principal files changed blob IDs; the seven-input adapter declaration+body is unchanged in the text comparison; the top literature adapter is changed. Keep revisions separate; do not assume semantic equivalence. Read the swarm protocol, handoff queue, expansion, AGENTS, continuity and research log/state/protocol, peer integration, mathematical, dependency, kernel, acceleration, prime-window and Landau checkpoints. No prior theta-lifts lane artifact in the preflight tree. The most recent physical CI verdict at preflight was PASS for 0f7a23b (run 45345201880); not a check of this RH proof.

Paths A–J are relative to src/Development/; T = AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/.

| ID | path | Git blob SHA |
|---|---|---|
| A | T/EveryCharacterOfLiteratureOfVWin.lean | a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 |
| B | T/SiegelEisensteinSecondTermHypotheses.lean | 42abe20ee235820aaa924dbabce5e1d2c2540380 |
| C | T/TopPlug.lean | c51cb6b5bd4bf2944ace89e00a2990da16bd519a |
| D | WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean | 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 |
| E | AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean | 4d0d94fd3fd9368e5428c05402979d6dd5123b4d |
| F | T/At23OfAll.lean | e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d |
| G | WeilBound/ThetaLifts/SphericalLattices/SphericalClosure/CloseSph.lean | 9a15ec479fb007975f15b6df7fe5fe46615e4f8f |
| H | T/HypothesesNonemptyOfUnramifiedExponents.lean | c0ce994aa86f737b707b5617fb10bcfb35c0117e |
| I | T/TopCovolSlim2Use.lean | 0e1bad41f4b165c0d9b1693f419530309e1da5ba |
| J | T/Prm1.lean | e7e454678d47eaa76c342abbafb4c4bcdf9f372d |

MainConclusion.lean (ee340012ab19713a8acfecf8adc6a331cbc2f1a4) invokes A. Earlier FockModels/EveryCharacterE.lean (01e60174b728fc6b473a308c5bf5dbffbe017afe) provides a similarly named older everyE₂ with different types; it is NOT the explicitly invoked adapter. Use B, not that older theorem. This prevents a real translation error.

## 1. The exact seven-input bridge (A:810–814; B:69–73)

Given O : UpperTheory.LiteratureTheorems.OpenLiteratureStatements and hV : UpperTheory.Top.VWin, obtain:

1. P = published_results_eigen O : GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses.
2. F = published_results_first O : GlobalTheory.FunPr.ThetaLocalInputs.
3. hA : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree.
4. hM : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching.
5. hX : GlobalTheory.CovTop.CovolumeBoundOfX, supplied by the exact 15-argument topCovolSlim2_use_alt_alt (I), not the earlier CovolX variant.
6. hL : UpperTheory.Zero.LLC.RecTExists, supplied by local_langlands_gl_recT_exists_of_literature O.
7. hV : UpperTheory.Top.VWin, retained separately from the above.

Both hA and hM are projections of **the same conjunction**, theta_integrals_agree_and_local_matching_of_literature O. Bind it once in the human reading view; retain both edges. No additional axiom or premise removed. A:215 defines O with three fields: caraianiLocalGlobalDual : One.M.Row, localLanglandsExists : Zero.LLC.RecTExists, galoisRepOfPolarizedPairLit : One.M.Row. MainConclusion constructs it as ⟨h, recTExists, h⟩, and supplies vwin_of_row h independently; do not call O empty or externally established. Source inspection alone does not establish kernel-level trust status.

The exact B proof, in human mathematical terms: for each real cDep, F:boundAtTwoThree_linked_of_recT applied to P.nLink and parametersOfDependence hL cDep supplies a linked family bound. With P,F,hA,hM,hX,hL and this universally quantified family of linked bounds, B:nonempty_hyps_definite_side_of_closed_bound constructs an inhabitant of HypsAlt S0.NL DefiniteSideCondition (under Nonempty). Green regular characters in P supply Green via GreenBridge.green_of_regular. Then C:every_character_of_green_v_win applies the independently supplied hV and the inhabitance to obtain EveryCharacter.

## 2. What the theta claims actually mean (E:388–394, 433–447, 458–471, 491–513, 559–595)

Fix arbitrary types F,E with Field and NumberField instances and an Algebra F E, an F-algebra endomorphism σ of E, a base B, natural ranks a,a', a geometric triple G, characters X, and Weil models om,om'. Restrict to IsTriple: B.IsGood σ, G.IsGood B, X.IsGood B a a', and two IsWeil properties using opposite characters X.β with X.β/X.α and X.α with X.α/X.β. In particular G.IsGood has a'<a, even a+a', each archimedean weight difference greater than a+a', 2(p+q)+1 < (a-a')/2 and < a', the specified Hermitian/skew forms and two good models (E:360–371). Natural subtraction/division here is Lean Nat arithmetic. Other IsGood and model conditions remain as defined in E; this is not an assertion for arbitrary representations.

LocalMatching: for *every* such triple there exist real maps R and finite maps Rf with IsMatched. IsMatched retains IsTriple plus IsRealMaps and IsFinMaps. Real maps give common quotient, intertwining equality under Lie derivative and compact-group actions, nontriviality and irreducibility. Finite maps are onto on Schwartz-Bruhat spaces, kill augmentation subspaces, preserve matching under finite local actions, have nontrivial irreducible targets, equal nonzero spherical-vacuum images outside X.T, and zeta conditions at specified places. Neither existence nor irreducibility follows solely from calling these objects theta lifts.

ThetaIntegralsAgree contains THREE conjuncts, not only a proportionality:

(i) For each triple, Decay holds and for each matched pair (R,Rf), OneConst and Coinv hold. Decay requires convergence for all Schwartz inputs in the first model; for each special input Φ' in the second model and every N∈ℕ, some real C and natural k bound |theta(om',Φ',g,h)| qht(g)^N ≤ C ht(h)^k for all g,h, together with convergence and moderate growth of the integrated function. OneConst asserts existence of a special Φ' with nonzero integral function, exactly one scalar c satisfying IsConst, and every such scalar is nonzero. IsConst means I_A(Φ)(h)=c I_B(Φ')(h) for every matched pair of vectors and every h. Coinv gives exact kernels on Schwartz-Bruhat inputs at good places, special-input surjectivity, linear functional descent through Rf.p', and invariance of the special global input space under om'. In particular this is not just equality of traces or norms.

(ii) There exist integer units e₁,e₂,s such that for *all* F,E,σ with the stated instances, StepBeta holds. Given the specified rank reduction a' = b+2 → b, unchanged V,p and q decreasing by one, the two adapted planes and real maps, there exists C≠0 independent of subsequent matched choices. For all choices of X, both sets of Weil models/maps, and constants c,c₁ satisfying IsConst in their respective models, there is u with u·(C·stepFac)=1 and c·charL(X.ν,X.S₀, k+1)=u·c₁, k = Nat.div (a-(b+2)) 2 (coerced as in E). stepFac uses unit ideal values, character values and local epsilons at integer exponent -k. The exact nonzero and adapted-plane conditions remain necessary.

(iii) A separately existential triple of integer units e₁,e₂,s works universally for StepAlpha. Here a=b+2→b, V' fixed, q=0 on both, p decreases by one, with the different adapted-plane conditions in E. There exists C≠0; for all matched pairs and constants, c=C·stepFac·charL(X.ν,X.S₀,k)·c₁, k=Nat.div (b+2-a') 2, stepFac exponent 1-k.

Elementary consequence of (i)+(ii)+(iii), **conditional on all the stated data**: for Beta, u≠0 since u·(C·stepFac)=1, and c₁≠0 by OneConst, hence the RHS is nonzero, so charL at k+1 is nonzero. For Alpha, c≠0 forces each factor in its product nonzero, hence charL at k is nonzero. This is not a half-plane zero-free theorem for arbitrary Dirichlet characters: the source's admissible character construction, adaptation, and arithmetic projection remain necessary. No claim that charL is directly the final Dirichlet L-function without source justification.

## 3. Producer of the paired theta properties

A:561–566 calls PositivityTheory.ThKR.theoremK_head2 with two precise named propositions, GlobalTheory.ThK.Dbl.EisBL (from PositivityTheory.RgEis.Hd.eisBL) and GlobalTheory.ThK.Dbl.SiegelWeilStd (from PositivityTheory.SiegelWeilFormula.Fin.siegelWeilStd). The bodies of those two producer theorems remain to be traced. A wrapper ending in a named theorem is not evidence that the mathematical result is a published theorem or that its proof is sound.

D:theoremK_head2 specializes theoremK_head2_of_mod at PositivityTheory.Sph.modSt2. The latter passes 14 inputs to Tr.closeSph (G): kCoinv, soCoinv, ramifiedMultiplicityOne, finRam, finSplit, sphTri_of applied to sphSplit_geo and vacInert howeInert, finInert_of with sphFun_of_modSt hM and locRepEx, lieSecond2 localLift_holds RL.derEx, archLie' localLift_holds, kReal' localLift_holds, siegel_of_core siegelCore_holds, h11, h12, weilEx. These are explicit source applications, not elaborated expression edges. G includes substantive derived obligations e.g. tower constructions, constant term vanishing, Weil convergence, spherical and archimedean matching, and anisotropic Siegel-Weil plus Eisenstein continuation. Its full remaining body is next frontier, not compressed away. The named external literature analogues are classical themes; do not classify a particular source proposition as established literature until exact statement/hypotheses and provenance have been audited.

## 4. Actual adapter construction in B:44–68

The proof of Nonempty HypsAlt is not an invocation of theta correspondence alone. Keep the following ordered, source-matched intermediate facts.

- Set C=P.litN (literal nonexistence/literature package, use its join and fe fields). Separate functionals via functionalsSeparate_of_howeUnram_of_siegelWeil(F, howeUnram_holds, P.siegelWeilUnitaryConvergent).
- Obtain RowRat using rowRatW_of_rowTest(test_vector_assembly_holds(F.siegelSetUnitary,F.howeDualityReal,P.greenCuspidal,F,C.join,C.fe,hA,hM,hS)).
- Obtain ConstantFunctionFits using fourier_coefficient_fit_of_join_alt(F,C.join,C.fe,hA,hM,hS, second component of ontoX_and_lamLow_of_unitaryGroupHypotheses' P).
- From evaluation_grid_of_join obtain CF1 and hCF1. Inputs include both theta properties, functionals separation, F and its real Howe duality, C.join and C.fe, twisted_weil_representation_convergence, twisted_local_factors_match, twisted_square_theta_integrals_eq. This witnesses evaluation condition EvLgG(GridA(c)) at every c≥CF1.
- From rowFun_at_gridA_alt with P.discreteSeriesCover, P.harishChandraModules, P.cuspRapidDecay, P.casselmanWallach, P.rayClassFieldSt and hFit obtain CF0,hCF0, furnishing functional linked condition above CF0 once the open condition is supplied.
- Choose d=max(CF0,CF1). Both bounds hold at d; this is the actual synchronization step, not an assumed intersection of arbitrary infinite sets. Obtain hEv from hCF1(d), hOpen1 from open0_of_unitary_group_hypotheses P hL d.
- Use open_and_linked_of_stronger_extension_alt on hL, extensionWithList hL d, extensionWithAtProperty hL (extensionWithOrigin hL d) (GridA d), SExt.none and geoCl anyGeometry with the explicit inclusion witness x↦⟨x.1.1⟩. Take its second component to transfer hOpen1 to hOpenA. hCF0(d) now yields hFun using extensionWithOrigin, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1⟩ and hOpenA.
- linked_bundles_l3_of_open_alt, with the same five P fields used for CF0, hX, hL, extensionWithAtProperty on GridA d, SExt.none, geoCl anyGeometry, inclusion x↦⟨x.1.1.1⟩ and hOpenA, yields hL3.
- H:hypotheses_nonempty_of_unramified_exponents_alt consumes P,hRat,hL,d,GridA d,hEv,hN(d),hFun,hL3, producing the promised Nonempty HypsAlt S0.NL DefiniteSideCondition. H obtains actual large unramified exponent bundles, Galois local bounds and all-row conditions; its full dependencies are not eliminated. The universally quantified hN in B is essential to choose d *after* both thresholds are obtained. F supplies hN via local bounds at two and three, closed_of_all, then Row.of_sel and LinkedAt.of_row; J specifies parametersOfDependence from extensionWithList, SExt.none, geoCl anyGeometry.

Explicit output path C:zero_free_all_of_green_v_win eliminates Nonempty only into the proposition ZeroFreeAll, uses zeroFreeAll_of_topG at la=3/2>1, forall_goal_of_shape_of_hyps with shape_closed_link_n_of_green and the inhabitant, and supplies each ψ by supplyChi ψ (hV ψ). C:every_character_of_green_v_win then invokes imprimitive. Hence the theta bridge and prime-window character lane meet at exactly C, not an unsupported jump from scalar nonvanishing to RH. Preserve the exceptional trivial-character pole and all primitive/nonprimitive quantifiers in the downstream chapter.

## 5. Reproducible static checks

Actually executed 13 assertions in the tool V8 JavaScript runtime against six retrieved pinned files A–F. All succeeded: blob identities, two projections, exact adapter rather than everyE₂, seven formal premise names, universal cDep and linked-bound producer, both max inequalities, five theta bridge call sites, Eisenstein/Siegel-Weil pair producer, all five named conjunct components in ThetaIntegralsAgree, unique nonzero scalar, la=3/2 and imprimitive, closeSph and modSt2 call, linked-family closed_of_all construction.

Replay on local pinned checkout (Python 3, no Lean required):
```python
from pathlib import Path
import hashlib
root=Path("src/Development")
T="AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
paths=[T+"EveryCharacterOfLiteratureOfVWin.lean",T+"SiegelEisensteinSecondTermHypotheses.lean",T+"TopPlug.lean","WeilBound/ThetaLifts/Reductions/FiniteClosure/TheoremKOfMod.lean","AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean",T+"At23OfAll.lean"]
shas="a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 42abe20ee235820aaa924dbabce5e1d2c2540380 c51cb6b5bd4bf2944ace89e00a2990da16bd519a 61ff0c7c5ee7e5df0681112d6727ab143c3b6996 4d0d94fd3fd9368e5428c05402979d6dd5123b4d e69e7ae49fb91ccf7bbbaa952de14b94dbfb393d".split()
bs=[(root/p).read_bytes() for p in paths]
assert [hashlib.sha1(b"blob "+str(len(b)).encode()+b"\\0"+b).hexdigest() for b in bs]==shas
a,b,c,d,e,f=map(lambda x:x.decode(),bs)
target=a.split("theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",1)[1]
adapter=b.split("theorem every_character_of_theta_integrals_local_matching",1)[1]
bridge=b.split("theorem nonempty_hyps_definite_side_of_closed_bound",1)[1].split("theorem every_character_of_theta_integrals_local_matching",1)[0]
pair=a.split("theorem UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature",1)[1].split("theorem ",1)[0]
one=e.split("def OneConst",1)[1].split("def Coinv",1)[0]
agree=e.split("def ThetaIntegralsAgree",1)[1].split("example",1)[0]
assert all("theta_integrals_agree_and_local_matching_of_literature O)"+s in target for s in [".1",".2"])
assert "every_character_of_theta_integrals_local_matching" in target and "everyE₂" not in target
assert all("("+n+" :" in adapter for n in ["P","F","hA","hM","hX","hL","hV"])
assert "∀ cDep : ℝ" in bridge and "fun cDep =>" in adapter and "boundAtTwoThree_linked_of_recT" in adapter
assert all(s in bridge for s in ["le_max_left","le_max_right","hN (max CF0 CF1)"])
assert all(s in bridge for s in ["test_vector_assembly_holds","fourier_coefficient_fit_of_join_alt","evaluation_grid_of_join","twisted_local_factors_match","twisted_square_theta_integrals_eq"])
assert all(s in pair for s in ["theoremK_head2","eis_bl_of_literature","siegel_weil_std_of_literature"])
assert all(s in agree for s in ["StepBeta","StepAlpha","Decay","OneConst","Coinv"])
assert "∃! c" in one and "c ≠ 0" in one
assert "la := 3 / 2" in c and "UpperTheory.Top.imprimitive" in c
assert "Tr.closeSph" in d and "PositivityTheory.Sph.modSt2" in d
assert "closed_of_all" in f and "at23_family_alt hP Fm" in f
print("13 static source assertions passed")
```
The Python replay is supplied, not executed in this run; V8 checks used connector-returned blob IDs rather than independently recalculating Git SHA1. A source text check does not prove theorem truth. No changed premises introduced; implicit typeclass and kernel edges await kernel export. Current-head blobs A=f4f6eb32f04c91b5cde32f11631828eb4016fa7f and B=24cacd4b9f4ae5ef83703e26ee2d26b51ffafdf8. No current-head mathematical validity claim.

RESUME HERE: retrieve full G:closeSph and its final AgreeOfLeaves call; map the actual terminal inputs into Decay, OneConst, Coinv, StepBeta, StepAlpha and LocalMatching, especially the nonzero theta scalar producer and exact character X.ν → Dirichlet character map. Fetch the definitions and producers of EisBL and SiegelWeilStd, marking external provenance separately. Do not rerun the already mapped seven-input composition. Handoff to integration, formal audit, character-box, literature-provenance and human editor lanes: A→B→C is ready as a source-matched conditional chapter. No Cathedral physics files changed.

import Statements
import Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion
import Formalism.GammaFactorNonvanishing.CritLine

/-!
# Proof-carrying reconstruction V2: shared theta/window and StageU
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Original root companion blob 10e79ef99539ea6a4ccdecf52906867c2c1ca56a.
New source-matched theorem bodies:
- HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e
- SiegelEisensteinSecondTermHypotheses.lean 42abe20ee235820aaa924dbabce5e1d2c2540380
- TopPlug.lean c51cb6b5bd4bf2944ace89e00a2990da16bd519a
Five native theorem bodies are inlined as named replacement lemmas.
The only algebraic factoring is Cstar = max CF0 CF1, shared across the
grid, functional, covolume, local norm and stronger-extension hypotheses.
All five source bodies passed exact reversible text comparison in V8.
There is no independent Lean execution in this session.

Readable mathematical argument:
For the seven original inputs P,F,hA,hM,hX,hL,hV, first establish the
row-test and constant-function-fit hypotheses and choose two thresholds
CF0 (functional) and CF1 (grid). Use their maximum BEFORE choosing any
dependent extension witnesses. At this same scale obtain the grid,
open parameter statements, their stronger-extension transport, linked
functional condition, linked covolume and prime-two-three norm condition.
The stronger extension projects to the weaker witness; universal row
statements transport in the opposite direction. No reverse existence
assertion. The StageU construction chooses member bundles and the
geometric Galois third layer, then obtains all row conditions together
and constructs one Nonempty HypsAlt. Finally use the Green regular
character bridge, VWin supply and shape theorem with window exponent
3/2 to get primitive zero-freeness. Finite Euler factors transfer to
every character. The modulus-one character and functional equation
give RH. See 0856 editor manuscript, sections A-D, for the underlying
row quantifier arguments. This file preserves all native premises,
including the fifteen covolume ports from V1.

Remaining imported obligations include the actual native row and host
existence, StageU geometric producers, Green classification, analytic
tail arguments and all underlying substantive mathematical results.
These are not proved merely by using their original Lean theorems.
No circular invocation of the original final RH or seven-input adapter.

Validation route (separate from prose equivalence):
Frozen cache repository:
homeowmorphism/riemann-hypothesis-original @ 4e8bb36faa8c9e3f1bda144ccf5a637f8b96066e.
Original and frozen toolchain blob a8afa7d1b02d96f0671eba854a8dc4b416beb473
and lake-manifest blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f match.
Original src tree b41b516b1f7baee4d83ced235ecc71fd43c97695 differs from
frozen 24df20b62d9976ccd20da819bc20b16f808f0fdd; original-to-frozen-base
comparison ab0b7522 shows only src/Challenge.lean added under src.
The runner still compares the ENTIRE src tree excluding that one file
before importing cached modules, and checks all named axiom reports.
Cache is published compilation, not an independent recheck of originals.
Official cache instructions need approximately 105 GB free; local
workspace 30 GB, Lean/Lake/elan absent; existing ubuntu-latest queue
does not establish sufficient disk. Do not claim this companion ran.
-/

set_option synthInstance.maxHeartbeats 200000

section
open Formalism.BasicNotions Formalism.MainNotions GlobalTheory.EX GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top GlobalTheory.Mem.Top.Bl GlobalTheory.Fc GlobalTheory.Mem.LiteralAutomorphy
namespace GlobalTheory.Fc.S0.StageU
theorem cathedral_stageU : _root_.GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses → S0.RowRat → ∀ (hL : _root_.UpperTheory.Zero.LLC.RecTExists) (cDep : ℝ) (A : GroupRetwisting.AtP), EvLgG A → _root_.GlobalTheory.Fc.RL.LinkedAt (_root_.GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep) (fun Q L => _root_.GlobalTheory.Fc.R1.SlotNormCondition Q L fun 𝒞 => Formalism.MainNotions.Closed 𝒞 fun Fm _ => _root_.GlobalTheory.NLink.BoundAtTwoThreeFamilyFonAlt Fm) → _root_.GlobalTheory.Fc.RL.LinkedAt (_root_.GlobalTheory.Mem.Top.Bl.parametersOfExtension (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry)) _root_.GlobalTheory.Fc.S0.FunctionalCondition → _root_.GlobalTheory.Fc.RL.LinkedAt (_root_.GlobalTheory.Mem.Top.Bl.parametersOfExtension (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry)) _root_.GlobalTheory.Fc.S0.CovolumeBoundThirdPlaceSeries → Nonempty (_root_.GlobalTheory.Fc.HypsAlt S0.NL _root_.GlobalTheory.Fc.DefiniteSideCondition) := by
  intro P hR hL cDep A hA hN hF hL3
  obtain ⟨hP, hMem, hEx⟩ := _root_.GlobalTheory.T.large_unramified_exponent_bundles_exist_alt P hR hL cDep A hA
  obtain ⟨_, prN, serN, _⟩ := _root_.GlobalTheory.T.hyps_e_third_layer_ser_n_of_geometric_galois P.litN P.toHypothesesX
  have hOL := _root_.GlobalTheory.Fc.S0.ontoX_and_lamLow_of_unitaryGroupHypotheses' P
  have hO := _root_.GlobalTheory.T.open0_of_unitary_group_hypotheses P hL cDep
  have hNrow := _root_.UpperTheory.GalC.final_alt_alt P.nLink prN P.toHypothesesX serN P.depthZeroSupport'
    P.localFiniteness P.localTateDuality P.localEulerChar hL cDep hN
  have hmono := _root_.GlobalTheory.Glob.open_and_linked_of_stronger_extension_alt hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithList hL cDep) (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry)
    (fun _ _ _ _ _ _ _ _ _ _ _ _ _ x => ⟨x.1.1⟩)
  have hO' := hmono.2 hO
  have hN' : _root_.GlobalTheory.Fc.RL.LinkedAt (_root_.GlobalTheory.Mem.Top.Bl.parametersOfExtension (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL cDep) A) SExt.none (geoCl anyGeometry)) (fun Q L => _root_.GlobalTheory.Fc.R1.SlotNormCondition Q L S0.NL) :=
    hmono.1 (fun 𝒜 _ => S0.NL (Cp.D3 3 𝒜)) hNrow
  have hAll := _root_.GlobalTheory.Fc.AllAtMemberStage0.allRows_of_open0_alt P.globalArtinReciprocity P.siegelWeilUnitaryConvergent2 P.discreteSeriesCover
    P.harishChandraModules P.cuspRapidDecay P.casselmanWallach P.discreteSeriesClassification hOL.1 hOL.2
    hL _ _ _ S0.NL hO' hL3 hF hN'
  exact _root_.GlobalTheory.Fc.nonempty_hyps_of_allRows_alt hP GlobalTheory.ThinScaleLiterature.litThin GlobalTheory.wuDecayOfGap GlobalTheory.rowsFinDim_link
    GlobalTheory.rowsPos_typeP (GlobalTheory.rowNGP_of_siegelWeil P.siegelWeilUnitaryConvergent2)
    (GlobalTheory.rowMainEqP_of_siegelWeil P.siegelWeilUnitaryConvergent2)
    (GlobalTheory.VolRatioFromSiegelWeil.volumeRatio P.siegelWeilUnitaryConvergent2) GlobalTheory.genusMassAt_two
    KPx _ _ _ S0.NL _root_.GlobalTheory.Fc.DefiniteSideCondition (fun _ => hMem) hEx hAll
end GlobalTheory.Fc.S0.StageU
end

section
open Formalism.BasicNotions Formalism.MainNotions GlobalTheory.Fc
theorem UpperTheory.Top.cathedral_zeroFree (hG : GlobalTheory.GLq.Green) (hV : UpperTheory.Top.VWin)
    (h : Nonempty (_root_.GlobalTheory.Fc.HypsAlt (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) _root_.GlobalTheory.Fc.DefiniteSideCondition)) : Formalism.HC.ZeroFreeAll :=
  h.elim fun h => UpperTheory.Top.zeroFreeAll_of_topG (la := 3 / 2) (by norm_num)
    (_root_.GlobalTheory.Fc.forall_goal_of_shape_of_hyps _ _ _ _ (_root_.UpperTheory.Top.shape_closed_link_n_of_green hG) trivial trivial h) fun ψ => UpperTheory.Top.supplyChi ψ (hV ψ)

theorem UpperTheory.Top.cathedral_everyCharacter (hG : GlobalTheory.GLq.Green) (hV : UpperTheory.Top.VWin)
    (h : Nonempty (_root_.GlobalTheory.Fc.HypsAlt (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) _root_.GlobalTheory.Fc.DefiniteSideCondition)) : UpperTheory.EveryCharacter :=
  UpperTheory.Top.imprimitive (_root_.UpperTheory.Top.cathedral_zeroFree hG hV h)
end

section
open Formalism.BasicNotions Formalism.MainNotions GlobalTheory.EX GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top GlobalTheory.Mem.Top.Bl GlobalTheory.Fc GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.Lit
open UpperTheory.Top
theorem cathedral_closedBound : _root_.GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses → _root_.GlobalTheory.FunPr.ThetaLocalInputs → GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree → GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching → _root_.GlobalTheory.CovTop.CovolumeBoundOfX → ∀ (hL : _root_.UpperTheory.Zero.LLC.RecTExists), (∀ cDep : ℝ, _root_.GlobalTheory.Fc.RL.LinkedAt (_root_.GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep) (fun Q L => _root_.GlobalTheory.Fc.R1.SlotNormCondition Q L fun 𝒞 => Formalism.MainNotions.Closed 𝒞 fun Fm _ => _root_.GlobalTheory.NLink.BoundAtTwoThreeFamilyFonAlt Fm)) → Nonempty (_root_.GlobalTheory.Fc.HypsAlt S0.NL _root_.GlobalTheory.Fc.DefiniteSideCondition) := by
  intro P F hA hM hX hL hN
  have C := P.litN
  have hS : GlobalTheory.IndefiniteRowSideFullHecke.LevelPlusSubgroup.FunctionalsSeparate :=
    _root_.UpperTheory.Lit.functionalsSeparate_of_howeUnram_of_siegelWeil F GlobalTheory.Hk3.howeUnram_holds P.siegelWeilUnitaryConvergent
  have hRat : S0.RowRat := GlobalTheory.Mem.LiteralAutomorphy.rowRatW_of_rowTest (_root_.GlobalTheory.T.test_vector_assembly_holds F.siegelSetUnitary F.howeDualityReal
    P.greenCuspidal F C.join C.fe hA hM hS)
  have hFit : _root_.GlobalTheory.BigTop.Fun.ConstantFunctionFits @GlobalTheory.BigTop.Fun.Fld := _root_.GlobalTheory.BigTop.Fun.Close.fourier_coefficient_fit_of_join_alt F C.join C.fe hA hM hS (_root_.GlobalTheory.Fc.S0.ontoX_and_lamLow_of_unitaryGroupHypotheses' P).2
  obtain ⟨CF1, hCF1⟩ := _root_.GlobalTheory.Mem.LiteralAutomorphy.evaluation_grid_of_join F.howeDualityReal hM F C.join C.fe hA
    (_root_.GlobalTheory.WeilConv.twisted_weil_representation_convergence F.siegelSetUnitary F) (_root_.GlobalTheory.T.twisted_local_factors_match F.howeDualityReal F hA hM)
    (_root_.GlobalTheory.T.twisted_square_theta_integrals_eq F hA hM) hS
  obtain ⟨CF0, hCF0⟩ := _root_.GlobalTheory.Fc.StageOne.rowFun_at_gridA_alt P.discreteSeriesCover P.harishChandraModules P.cuspRapidDecay P.casselmanWallach
    P.rayClassFieldSt hFit
  let Cstar := max CF0 CF1
  have hEv : EvLgG (GridA Cstar) := hCF1 _ (le_max_right _ _)
  have hOpen1 : _root_.GlobalTheory.Fc.S0.OpenParameterStatements (_root_.GlobalTheory.Mem.Top.Bl.parametersOfDependence hL Cstar) := _root_.GlobalTheory.T.open0_of_unitary_group_hypotheses P hL Cstar
  have hMono := _root_.GlobalTheory.Glob.open_and_linked_of_stronger_extension_alt hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithList hL Cstar)
    (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL Cstar) (GridA Cstar)) SExt.none (geoCl anyGeometry)
    (fun _ _ _ _ _ _ _ _ _ _ _ _ _ x => ⟨x.1.1⟩)
  have hOpenA := hMono.2 hOpen1
  have hFun := hCF0 Cstar (le_max_left _ _) hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL Cstar) SExt.none (geoCl anyGeometry)
    (fun _ _ _ _ _ _ _ _ _ _ _ _ _ x => ⟨x.1⟩) hOpenA
  have hL3 := _root_.GlobalTheory.Glob.CovolRow.linked_bundles_l3_of_open_alt P.discreteSeriesCover P.harishChandraModules P.cuspRapidDecay
    P.casselmanWallach P.rayClassFieldSt hX hL (_root_.GlobalTheory.Mem.LiteralAutomorphy.extensionWithAtProperty hL (_root_.GlobalTheory.HeightCounting.Up.extensionWithOrigin hL Cstar) (GridA Cstar))
    SExt.none (geoCl anyGeometry) (fun _ _ _ _ _ _ _ _ _ _ _ _ _ x => ⟨x.1.1.1⟩) hOpenA
  exact _root_.GlobalTheory.Fc.S0.StageU.cathedral_stageU P hRat hL Cstar (GridA Cstar) hEv (hN Cstar) hFun hL3

theorem cathedral_thetaWindow (P : _root_.GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses) (F : _root_.GlobalTheory.FunPr.ThetaLocalInputs) (hA : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.ThetaIntegralsAgree)
    (hM : GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.LocalMatching) (hX : _root_.GlobalTheory.CovTop.CovolumeBoundOfX) (hL : _root_.UpperTheory.Zero.LLC.RecTExists) (hV : VWin) :
    UpperTheory.EveryCharacter :=
  _root_.UpperTheory.Top.cathedral_everyCharacter (GlobalTheory.GreenBridge.green_of_regular P.greenRegularCharacters) hV
    (_root_.UpperTheory.Lit.cathedral_closedBound P F hA hM hX hL fun cDep => _root_.UpperTheory.N.boundAtTwoThree_linked_of_recT P.nLink (_root_.GlobalTheory.Mem.Top.Bl.parametersOfDependence hL cDep))
end UpperTheory.Lit
end

#print axioms GlobalTheory.Fc.S0.StageU.cathedral_stageU
#print axioms UpperTheory.Lit.cathedral_closedBound
#print axioms UpperTheory.Top.cathedral_zeroFree
#print axioms UpperTheory.Top.cathedral_everyCharacter
#print axioms UpperTheory.Lit.cathedral_thetaWindow

namespace CathedralRHReadableV2

open Complex DirichletCharacter

theorem sevenInput
    (O : _root_.UpperTheory.LiteratureTheorems.OpenLiteratureStatements)
    (hV : UpperTheory.Top.VWin) : UpperTheory.EveryCharacter := by
  let P := (_root_.UpperTheory.LiteratureTheorems.published_results_eigen O)
  let F := (_root_.UpperTheory.LiteratureTheorems.published_results_first O)
  let thetaPair := _root_.UpperTheory.LiteratureTheorems.theta_integrals_agree_and_local_matching_of_literature O
  let a1 := (_root_.UpperTheory.LiteratureTheorems.resolution_char_zero_of_literature O)
  let a2 := (_root_.UpperTheory.LiteratureTheorems.principalisation_char_zero_of_literature O)
  let a3 := (_root_.UpperTheory.LiteratureTheorems.poincare_lelong_inv_of_literature O)
  let a4 := PositivityTheory.Pf1.HilbertSamuelMoriwaki.hsUse_outright
  let a5 := PositivityTheory.Pf1.HilbertSamuelMoriwaki.moriwakiBig_outright
  let a6 := (_root_.UpperTheory.LiteratureTheorems.fargues_exact_of_literature O)
  let a7 := (_root_.UpperTheory.LiteratureTheorems.zarhin_statement O)
  let a8 := (_root_.UpperTheory.LiteratureTheorems.nef_rr_of_literature O)
  let a9 := (_root_.UpperTheory.LiteratureTheorems.siegel_toroidal_integral_of_literature O)
  let a10 := (_root_.UpperTheory.LiteratureTheorems.toroidal_for_fan_ks_of_literature O)
  let a11 := (_root_.UpperTheory.LiteratureTheorems.semi_abelian_lie_seminegative_of_literature O)
  let a12 := (_root_.UpperTheory.LiteratureTheorems.point_separation_pair_of_literature O)
  let a13 := (_root_.UpperTheory.LiteratureTheorems.ar_degree_of_literature O)
  let a14 := (_root_.UpperTheory.LiteratureTheorems.published_results_arithmetic O)
  let a15 := (_root_.UpperTheory.LiteratureTheorems.grothendieck_deformation_of_literature O)
  let hX := _root_.SelfIntersectionVolumeEstimates.topCovolSlim2_use_alt_alt a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15
  let hL := (_root_.UpperTheory.LiteratureTheorems.local_langlands_gl_recT_exists_of_literature O)
  exact _root_.UpperTheory.Lit.cathedral_thetaWindow P F thetaPair.1 thetaPair.2 hX hL hV

theorem allCharactersFromRow
    (h : UpperTheory.GalStar.Row0b fun h rc => UpperTheory.Zero.LLC.IsRecT h rc) :
    DirichletLNonvanishingRightOfHalf := by
  let O : _root_.UpperTheory.LiteratureTheorems.OpenLiteratureStatements :=
    ⟨h, UpperTheory.Zero.LLC.recTExists, h⟩
  let hV := UpperTheory.One.vwin_of_row h
  exact sevenInput O hV

theorem zetaRight (h : DirichletLNonvanishingRightOfHalf) :
    ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s ≠ 0 := by
  intro s hs hs1
  have hχ := h 1 (1 : DirichletCharacter ℂ 1) s hs (Or.inr hs1)
  rwa [LFunction_modOne_eq] at hχ

theorem reconstructedRH : RiemannHypothesis :=
  Formalism.VW.rh_of_right
    (zetaRight (allCharactersFromRow UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter))

#print axioms CathedralRHReadableV2.sevenInput
#print axioms CathedralRHReadableV2.allCharactersFromRow
#print axioms CathedralRHReadableV2.zetaRight
#print axioms CathedralRHReadableV2.reconstructedRH

end CathedralRHReadableV2

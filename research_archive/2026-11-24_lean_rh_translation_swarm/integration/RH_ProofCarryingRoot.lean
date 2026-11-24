import Statements
import Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion
import Formalism.GammaFactorNonvanishing.CritLine

/-!
# Proof-carrying reconstruction: RH root-to-seven-input junction
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Generated against the actual source graph
1823f58b56baf53d1db6a5ce7b781cd24707a1f5. This is an independently structured composition of the
original mathematical lemmas, NOT a new proof of those imported lemmas.

Two-tier workflow:
1. Give a readable proof using exactly stated named results, with each
   difficult producer explained once in a linked chapter. Retain every
   occurrence and its type in the machine layer. Do not flatten shared
   subproofs or treat distinct projections as the same obligation.
2. Validate the companion theorem with the original Lean kernel in one
   pinned precompiled environment; #print axioms audits the trust boundary.
   Reuse compiled upstream lemmas instead of re-proving Mathlib. Prose
   equivalence is a separate review; kernel acceptance is not evidence that
   a prose chapter is complete.

Exact source anchors: 16/16 root node snippets matched after whitespace normalization.
All selected root node snippets matched.
All 7 input ports (including local hV) and 15 covolume argument ports retained.
Source files and blob IDs:
src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc
src/Supplements/Kernels/MainTheorems.lean 6a542d7ce969a791fd12ce575f587e6bc29044bf
src/Formalism/GammaFactorNonvanishing/CritLine.lean 95fa4da5c50119db164aa93944d106f22fdb576d
src/Formalism/GammaFactorNonvanishing/RhOfRight.lean 3604637147a33e72248faddd775ea750e7846ead
src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean f769999ac5e49241993e5efbf81e4d2cded18acd
src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean 268786576f96cb5a2cea5fab2da4cf4f291c1116
src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4
src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24
src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean 0e1bad41f4b165c0d9b1693f419530309e1da5ba
src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/SiegelEisensteinSecondTermHypotheses.lean 42abe20ee235820aaa924dbabce5e1d2c2540380
src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopPlug.lean c51cb6b5bd4bf2944ace89e00a2990da16bd519a

Human argument: take the compatible arithmetic row h; construct the
literature record O from the SAME h twice and the local recursive
parameter existence theorem. Obtain VWin from that same h. The eigen
and first theta inputs come from O. Obtain a single pair of theta
integral agreement and local matching, retaining both projections.
The covolume theorem takes 15 separate premises. With recursive local
parameters and VWin, the seven-input adapter gives nonvanishing of all
Dirichlet L-functions on Re(s)>1/2 except the principal-character
point s=1. Specialize to modulus one; its L-function equals zeta.
Then the functional equation and exclusion of trivial zeros give RH.

Proof chapter dependencies (not silently discharged):
math/2026-11-24_guarded_cusp_map_algebra.md
math/2026-11-24_depth_zero_frobenius_parameter_proof.md
math/2026-11-24_finite_character_induced_parameter_proof.md
math/2026-11-24_analytic_zero_exclusion_chapter.md
integration/2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json
specialists/proof_editor/2026-11-24_0856_INTEGRATED_MANUSCRIPT.md

Validation here: actual GitHub source anchors and port occurrence checks.
Lean companion below NOT yet compiled. No claim of full proof coverage,
new proof, or proven URT-specific speedup. The companion intentionally
does not invoke the final RH theorem, allChi, everyCharacter, or
every_character_of_literature_of_vWin.
-/

namespace CathedralRHReadable

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
  exact _root_.UpperTheory.Lit.every_character_of_theta_integrals_local_matching P F thetaPair.1 thetaPair.2 hX hL hV

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

#print axioms CathedralRHReadable.sevenInput
#print axioms CathedralRHReadable.allCharactersFromRow
#print axioms CathedralRHReadable.zetaRight
#print axioms CathedralRHReadable.reconstructedRH

end CathedralRHReadable

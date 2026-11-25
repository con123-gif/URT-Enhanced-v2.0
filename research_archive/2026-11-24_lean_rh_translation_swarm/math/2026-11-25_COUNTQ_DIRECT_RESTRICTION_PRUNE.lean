import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LevelAdmissibleRestrictionHolds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
MATH lane correction / mandatory unified reduction, 25 Nov 2026.

Pinned upstream source:
  leanprover-community/riemann-hypothesis
  40e56bab026552e089d7afcfeff08d2defb9c005

The actual `countQ_alt` caller does not transport `AdmRNAlt` across its
quadratic sign character.  It first proves irreducibility after restriction
using `resTwo`, then applies `AdmResNAlt` to the original representation `r`.
Consequently the sign character, its conductor, `KillsMu`, and the exceptional
case `q = l` are absent from this exact bridge.

This file is PREPARED / NOT COMPILED locally.  It does not prove `AdmResNAlt`,
`CountQAlt`, a weighted-prime bound, or RH.
-/

noncomputable section

open NumberField ReciprocityTheory.Gal UpperTheory.V UpperTheory.V.Af
open UpperTheory.GalN.V

namespace RHMathCountQDirectRestriction

theorem direct_admissible_restriction
    (hA : AdmResNAlt)
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2)
    (n : ℕ) (hn : 2 ≤ n)
    (m : Fin n → ℤ) (wt : ℤ) (hm : StrictAnti m)
    (M : ℕ) (hM : 1 ≤ M)
    (l : ℕ) [Fact l.Prime] (hl2 : l ≠ 2)
    (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω]
    [IsScalarTower ℚ K Ω] [IsAlgClosure ℚ Ω] [IsAlgClosure K Ω]
    (ι : Qbar l ≃+∗ ℂ)
    (r : G ℚ Ω →* GL (Fin n) (Qbar l))
    (hr : AdmRNAlt ι M m wt r)
    (hirr : IsIrr (r.comp (res ℚ Ω K))) :
    AdmPNAlt ι M m (r.comp (res ℚ Ω K)) := by
  exact hA K hK n hn m wt hm M hM l hl2 Ω ι r hr hirr

theorem direct_admissible_restriction_replay
    (hA : AdmResNAlt)
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2)
    (n : ℕ) (hn : 2 ≤ n)
    (m : Fin n → ℤ) (wt : ℤ) (hm : StrictAnti m)
    (M : ℕ) (hM : 1 ≤ M)
    (l : ℕ) [Fact l.Prime] (hl2 : l ≠ 2)
    (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω]
    [IsScalarTower ℚ K Ω] [IsAlgClosure ℚ Ω] [IsAlgClosure K Ω]
    (ι : Qbar l ≃+∗ ℂ)
    (r : G ℚ Ω →* GL (Fin n) (Qbar l))
    (hr : AdmRNAlt ι M m wt r)
    (hirr : IsIrr (r.comp (res ℚ Ω K))) :
    AdmPNAlt ι M m (r.comp (res ℚ Ω K)) := by
  first
  | (rh_reduce 2 using
      [direct_admissible_restriction hA K hK n hn m wt hm M hM l hl2 Ω ι r hr hirr]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact direct_admissible_restriction hA K hK n hn m wt hm M hM l hl2 Ω ι r hr hirr

end RHMathCountQDirectRestriction

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results limit 2000
rh_scan RHMathCountQDirectRestriction.direct_admissible_restriction limit 2000
rh_prune RHMathCountQDirectRestriction.direct_admissible_restriction as RHMathCountQDirectRestrictionPruned
#print axioms RHMathCountQDirectRestriction.direct_admissible_restriction
#print axioms RHMathCountQDirectRestriction.direct_admissible_restriction_replay


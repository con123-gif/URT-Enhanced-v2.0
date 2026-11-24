/-
  RH_ExceptionalPairCompanion.lean. NOT EXECUTED: not typechecked; it needs Mathlib and the pinned
  upstream project (leanprover-community/riemann-hypothesis @ 40e56ba). Intended checks only.
-/
import Mathlib
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExceptionalDirichletZeroUniqueZeroFreeRegionStatement
import Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion

open Complex DirichletCharacter GlobalTheory.Lin

-- T-1: the statement as reconstructed in the chapter, closed by the upstream theorem.
example : ∃ c₀ : ℝ, 0 < c₀ ∧ ∀ c₁ : ℝ, 0 < c₁ → c₁ ≤ c₀ → ∃ c : ℝ, 0 < c ∧ ∀ (M : ℕ) [NeZero M], 3 ≤ M → (∀ (χ χ' : DirichletCharacter ℂ M) (β β' : ℝ), IsExc c₁ χ β → IsExc c₁ χ' β' → χ = χ' ∧ β = β') ∧ (∀ (χ : DirichletCharacter ℂ M) (β : ℝ), IsExc c₁ χ β → χ ≠ 1 ∧ 7 / 8 ≤ β ∧ LFunction χ β = 0 ∧ ord χ β = 1 ∧ c / ((M : ℝ) ^ 2 * Real.log M) ≤ 1 - β) ∧ ∀ (χ : DirichletCharacter ℂ M) (ρ : ℂ), ρ.re < 1 → LFunction χ ρ = 0 → (ρ.im = 0 ∧ IsExc c₁ χ ρ.re) ∨ ρ.re ≤ 1 - c / Real.log (M * (|ρ.im| + 2)) :=
  GlobalTheory.ExceptionalPair.main

#check @GlobalTheory.RealZeroNearOne.main
#check @GlobalTheory.ZeroFreePrincipal.zero_free
#check @GlobalTheory.ZeroFreeComplex.zero_free_region
#check @GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one
#check @GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros
#print axioms GlobalTheory.ExceptionalPair.main

-- T-8: O on the main path is the closed triple below.
example : UpperTheory.LiteratureTheorems.OpenLiteratureStatements :=
  ⟨UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter, UpperTheory.Zero.LLC.recTExists,
   UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter⟩
#check @UpperTheory.LiteratureTheorems.published_results_eigen

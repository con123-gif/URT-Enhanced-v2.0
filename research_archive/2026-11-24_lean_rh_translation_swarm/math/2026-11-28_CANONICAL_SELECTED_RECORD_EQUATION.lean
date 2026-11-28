import EditorSelectedRecord
import MathCanonicalCount
import Lean

/-!
# Math lane — canonical selected-record count equation

28 November 2026. SOURCE-MATCHED / PREPARED, not native compiled.
This removes the auxiliary prime subset from the editor's genuinely weaker
selected-record endpoint. It does not prove the count equation or RH.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHMathCanonicalSelected

def SelectedGood (ε : ℝ) (d : Primes) : Prop :=
  ∃ P : Parameters, P.d = d ∧ P.N₀ = 18480 ∧
    ∃ (eps : ℝ) (K : ℕ) (C : ℝ),
      (0 < eps / 6 ∧ eps < 1 / 100) ∧ 0 ≤ C ∧
      ((K : ℝ) + 1) * eps ≤ ε / 2 ∧
      RHEditorSelected.SelectedBudgetOn P eps K C RHPrimeWindow94.QuarticScales

def selectedGoodSet (ε : ℝ) : Set ℕ :=
  {n | ∀ hp : n.Prime, SelectedGood ε ⟨n,hp⟩}

/-- The decisive equation: the prime-filtered canonical selected count is
not `O(X^(1-2*ε/9))` at every analytic tolerance. -/
def CanonicalSelectedCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    RHDepCountEscape82.CountEscape (selectedGoodSet ε) (4*ε/9)

/-- The existential auxiliary set in the editor criterion is equivalent to
using every prime with a selected-record witness. -/
theorem selected_count_iff_canonical :
    RHEditorSelected.SelectedCountBudget ↔ CanonicalSelectedCount := by
  constructor
  · intro h ε he
    obtain ⟨S,hcount,hS⟩ := h ε he
    apply RHMathCanonicalCount.countEscape_mono_prime (hS := hcount)
    intro n hn hnS
    show ∀ hp : n.Prime, SelectedGood ε ⟨n,hp⟩
    intro hp
    exact hS ⟨n,hp⟩ hnS
  · intro h ε he
    refine ⟨selectedGoodSet ε,h ε he,?_⟩
    intro d hd
    exact hd d.2

theorem zeta_line_from_canonical_selected (h : CanonicalSelectedCount) :
    RiemannZetaZerosOnLine :=
  RHEditorSelected.zeta_line_from_selected_count
    (selected_count_iff_canonical.mpr h)

end RHMathCanonicalSelected

#print axioms RHMathCanonicalSelected.selected_count_iff_canonical
#print axioms RHMathCanonicalSelected.zeta_line_from_canonical_selected

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHMathCanonicalSelected.selected_count_iff_canonical,
        #[``RHMathCanonicalCount.countEscape_mono_prime]),
      (``RHMathCanonicalSelected.zeta_line_from_canonical_selected,
        #[``RHMathCanonicalSelected.selected_count_iff_canonical,
          ``RHEditorSelected.zeta_line_from_selected_count])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "CANONICAL_SELECTED unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      throwError "CANONICAL_SELECTED missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "CANONICAL_SELECTED missing direct supplier {n}"
  logInfo "CANONICAL_SELECTED_RECORD_GUARDS_OK"


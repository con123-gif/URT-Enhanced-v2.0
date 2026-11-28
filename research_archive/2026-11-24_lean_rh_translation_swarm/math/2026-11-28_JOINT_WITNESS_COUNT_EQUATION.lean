import IntegrationCanonicalFiberCount
import Lean

/-!
# Math lane — joint-witness count equation

28 November 2026. SOURCE-MATCHED / PREPARED, not native compiled.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

This weakens the a.e. arithmetic premise on one fixed data fiber to the
one joint polar/arithmetic witness actually consumed by the endpoint.
It does not prove the witness-count equation or RH.  See the paired
markdown file for exact quantifiers, source trace and strictness controls.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat
open MeasureTheory

namespace RHMathJointWitnessCount

/-- One secondary scale on one fixed data fiber satisfies both the strict
polar inequality and the guarded arithmetic bound. -/
def JointBudgetAt {P : Parameters} (D : Data P) (K : ℕ) (C : ℝ) : Prop :=
  ∃ u ∈ Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2),
    primeError P.d P.N₀ u.exp - towerDeg D.s / #D.thick * primeError P.d 1 u.exp <
      exp (-(1e6 * D.logX)) ∧
    ∀ hs : 1e12 * P.c ≤ log D.logB ∧ 100 * log D.logB ≤ D.logX ∧
      1e6 * D.logX ≤ u ∧ 1e6 * u ≤ D.logB ∧ 6 * log u ≤ log D.logB,
    let E := {D with logX₁ := u, scale := hs}
    E.m * E.run90Remainder ≤ C * (E.f : ℝ) * (E.a : ℝ) * E.logB^K

/-- Constants precede `x`; `D` precedes the common secondary scale `u`. -/
def JointBudgetOn (P : Parameters) (eps : ℝ) (K : ℕ) (C : ℝ)
    (A : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ A → ∃ D : Data P,
    D.x = x ∧ log D.x₁ = x^(eps/6) ∧ (1e6 * log x)^2 ≤ log D.x₁ ∧
    log (log D.b) = eps * log x ∧ towerDeg D.s / log D.b ≤ #D.thick ∧
    JointBudgetAt D K C

/-- The editor's a.e. fiber premise supplies the one joint witness, using
the same fixed `D` before the weighted polar selection. -/
theorem joint_of_fiber (P : Parameters) {eps : ℝ} (K : ℕ) (C : ℝ)
    (A : Set ℝ) (h : RHEditorAE.FiberBudgetOn P eps K C A) :
    JointBudgetOn P eps K C A := by
  unfold RHEditorAE.FiberBudgetOn at h
  unfold JointBudgetOn
  filter_upwards [tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).editor_window_with_ae (isPolar_primeError
    PrimeSevenModEight.mod_eight P.d.coprime_one_left)), h] with x W hs
  intro hxA
  obtain ⟨D,hDx,h1,h2,h3,h4,hfiber⟩ := hs hxA
  subst x
  simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le h4, D.scale
  obtain ⟨u,hu,hg,hpolar⟩ := W (towerDeg D.s / #D.thick)
    ⟨by bound, D.le_of_hasLogBound⟩ _ hfiber
  exact ⟨D,rfl,h1,h2,h3,h4,u,hu,hpolar,hg hpolar⟩

/-- The endpoint proof after exact cancellation needs only the joint witness;
there is no measure-theory premise in this direction. -/
theorem eventually_primeError_on_set (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (A : Set ℝ) (hjoint : JointBudgetOn P eps K C A) :
    ∀ᶠ x in atTop, x ∈ A → primeError P.d P.N₀ x ≤ x ^ (8 * eta + 2⁻¹ - 1) := by
  unfold JointBudgetOn at hjoint
  have hthreshold : ∀ᶠ x : ℝ in atTop,
      log (C * (P.N₀.totient : ℝ) + 1)/(7*eta) ≤ log x :=
    tendsto_log_atTop (mem_atTop _)
  filter_upwards [hjoint, hthreshold, (mem_atTop (1 : ℝ))] with x hs hab hx
  intro hxA
  obtain ⟨D,hDx,_,l,e,H',u,⟨a,b⟩,w,hg⟩ := hs hxA
  subst x
  simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have starD' := hg D'.scale
  have hm : (0 : ℝ) < D'.m := HasLogBound.pos D'
  have ha : (0 : ℝ) < D'.a := HasLogBound.pos D'
  have hH : (0 : ℝ) < #D'.thick := HasLogBound.pos D'
  have hB : 0 < D'.logB := HasLogBound.pos D'
  have hX : 0 ≤ D.logX := exp_le_exp.mp (by simpa only [exp_zero] using hx)
  have hf : (D'.f : ℝ) = (towerDeg D'.s : ℝ)*(P.N₀.totient : ℝ) := by
    rw [Data.f.eq_1, P.card_infinitePlace_E]
    push_cast <;> ring
  have hAbsorb : log (C*(P.N₀.totient : ℝ)+1) ≤ 7*eta*D.logX := by
    have h := (div_le_iff₀ (by positivity : 0 < 7*eta)).mp hab
    simpa [mul_comm] using h
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a /
      #D'.thick + (primeError P.d P.N₀ D'.x₁ - towerDeg D.s / #D.thick *
      primeError P.d 1 D'.x₁) := by
        simp [run90Remainder_eq, tops, card_placeClass_eq, field,
          HasLogBound.pos D', ne_of_gt]
    _ ≤ exp (D.logX*(8*eta+2⁻¹-1)) :=
      RHIntegration97.finite_power_scalar _ _ _ _ _ _ _ _ _ C eta eps D.logX K
        hm ha hH hB (by positivity) hC heta hX hf H' D'.m_mem.1 e hslack
        starD' w.le hAbsorb
    _ = D.x ^ (8*eta+2⁻¹-1) := by
      rw [Real.rpow_def_of_pos (exp_pos _), log_exp]

theorem endpoint_from_joint (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (h : JointBudgetOn P eps K C RHPrimeWindow94.QuarticScales) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ eta := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1
    (eventually_primeError_on_set P heta he K C hC hslack
      RHPrimeWindow94.QuarticScales h)
  obtain ⟨J,hJ⟩ := exists_nat_gt (max X 1)
  refine ⟨J, ?_⟩
  intro k hk
  have hKk : (J : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hk1 : (1 : ℝ) ≤ (k : ℝ) :=
    (le_max_right X 1).trans (hJ.le.trans hKk)
  have hk4 : (k : ℝ) ≤ (k : ℝ)^4 := by
    have hk0 : (0 : ℝ) ≤ (k : ℝ) := by positivity
    have h2 : (k : ℝ) ≤ (k : ℝ)^2 := by
      nlinarith [mul_nonneg hk0 (sub_nonneg.mpr hk1)]
    have h2one : (1 : ℝ) ≤ (k : ℝ)^2 := hk1.trans h2
    have h4 : (k : ℝ)^2 ≤ (k : ℝ)^4 := by
      nlinarith [mul_nonneg (sq_nonneg (k : ℝ)) (sub_nonneg.mpr h2one)]
    exact h2.trans h4
  exact hX _ ((le_max_left X 1).trans (hJ.le.trans (hKk.trans hk4))) ⟨k,rfl⟩

def JointGood (ε : ℝ) (d : Primes) : Prop :=
  ∃ P : Parameters, P.d = d ∧ P.N₀ = 18480 ∧
    ∃ (eps : ℝ) (K : ℕ) (C : ℝ),
      (0 < eps / 6 ∧ eps < 1 / 100) ∧ 0 ≤ C ∧
      ((K : ℝ) + 1) * eps ≤ ε / 2 ∧
      JointBudgetOn P eps K C RHPrimeWindow94.QuarticScales

def jointGoodSet (ε : ℝ) : Set ℕ :=
  {n | ∀ hp : n.Prime, JointGood ε ⟨n,hp⟩}

/-- The single prime-count equation: the count is not
`O(X^(1-2*ε/9))` at every analytic tolerance. -/
def CanonicalJointCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    RHDepCountEscape82.CountEscape (jointGoodSet ε) (4*ε/9)

theorem joint_good_of_fiber_good {ε : ℝ} {d : Primes}
    (h : RHIntegrationFiberCount.FiberGood ε d) : JointGood ε d := by
  obtain ⟨P,hd,hM,eps,K,C,he,hC,hslack,hb⟩ := h
  exact ⟨P,hd,hM,eps,K,C,he,hC,hslack,
    joint_of_fiber P K C RHPrimeWindow94.QuarticScales hb⟩

theorem canonical_joint_of_fiber
    (h : RHIntegrationFiberCount.CanonicalFiberCount) : CanonicalJointCount := by
  intro ε he
  apply RHMathCanonicalCount.countEscape_mono_prime (hS := h ε he)
  intro n hn hgood
  show ∀ hp : n.Prime, JointGood ε ⟨n,hp⟩
  intro hp
  exact joint_good_of_fiber_good (hgood hp)

theorem count_escape_grid_from_joint (h : CanonicalJointCount) :
    RHDepCountEscape82.CountEscapeGrid := by
  intro ε he
  refine ⟨jointGoodSet ε, h ε he, ?_⟩
  intro d hd
  obtain ⟨P,hPd,hPM,eps,K,C,heps,hC,hslack,hbudget⟩ := hd d.2
  have heta : 0 < ε/2 := by linarith [he.1]
  have hgrid : RHPrimeWindow88.EndpointGrid P.d P.N₀ (ε/2) :=
    endpoint_from_joint P heta heps K C hC hslack hbudget
  have hguards : P.d.1 % 8 = 7 ∧ P.N₀.Coprime P.d :=
    ⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩
  simpa only [hPd,hPM] using And.intro hguards hgrid

theorem zeta_line_from_canonical_joint (h : CanonicalJointCount) :
    RiemannZetaZerosOnLine :=
  RHDepCountEscape82.zeta_line_from_count_escape_grid
    (count_escape_grid_from_joint h)

end RHMathJointWitnessCount

#print axioms RHMathJointWitnessCount.joint_of_fiber
#print axioms RHMathJointWitnessCount.eventually_primeError_on_set
#print axioms RHMathJointWitnessCount.endpoint_from_joint
#print axioms RHMathJointWitnessCount.canonical_joint_of_fiber
#print axioms RHMathJointWitnessCount.count_escape_grid_from_joint
#print axioms RHMathJointWitnessCount.zeta_line_from_canonical_joint

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHMathJointWitnessCount.joint_of_fiber,
        #[``IsPolar.editor_window_with_ae]),
      (``RHMathJointWitnessCount.eventually_primeError_on_set,
        #[``Data.run90Remainder_eq, ``RHIntegration97.finite_power_scalar]),
      (``RHMathJointWitnessCount.endpoint_from_joint,
        #[``RHMathJointWitnessCount.eventually_primeError_on_set]),
      (``RHMathJointWitnessCount.canonical_joint_of_fiber,
        #[``RHMathJointWitnessCount.joint_good_of_fiber_good,
          ``RHMathCanonicalCount.countEscape_mono_prime]),
      (``RHMathJointWitnessCount.count_escape_grid_from_joint,
        #[``RHMathJointWitnessCount.endpoint_from_joint]),
      (``RHMathJointWitnessCount.zeta_line_from_canonical_joint,
        #[``RHMathJointWitnessCount.count_escape_grid_from_joint,
          ``RHDepCountEscape82.zeta_line_from_count_escape_grid])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "JOINT_WITNESS_COUNT unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      throwError "JOINT_WITNESS_COUNT missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "JOINT_WITNESS_COUNT missing direct supplier {n}"
  logInfo "JOINT_WITNESS_COUNT_GUARDS_OK"


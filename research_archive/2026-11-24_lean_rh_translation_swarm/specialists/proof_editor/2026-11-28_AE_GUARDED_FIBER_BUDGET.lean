import EditorPolarMean
import IntegrationGuardedFinitePower
import Lean

/-!
# Editor — almost-everywhere guarded finite-power budget on one actual data fiber
28 November 2026. Human implication / PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and latest integration/acceleration
f45746a0, audit 9ccb174e, math 5c8c0ef5, previous RUN93 fiber 0f24af4e
and exact finite-power adapter ff20a7853578c8e3672914710cadf25d98766140.
Mean supplier EditorPolarMean blob d6c08ec8cd4c003f4f3c4da6ae9d807e146a7dad.
Both imported candidates await native verification.

## New reduction: no integral or measurable choice of arithmetic witnesses
Let J=[t,t²], μ=volume.restrict J, w=u^ceil(t²/9) exp(-3u),
Q=E-X E', e=exp(-t). The strict native-shaped mean supplies
integrable w,wQ and integral(wQ)<e integral(w).
For any predicate G (not assumed measurable) holding μ-a.e.,
there exists u in J with G(u) AND Q(u)<e. Otherwise on the
intersection of the two full-measure events G and membership in J,
Q>=e; w>=0, so integral(wQ)>=e integral(w), contradiction.
No division by the integral, no positive-measure continuity premise,
no extra integrability for the arithmetic cost. Strict inequality
is essential: Q=e everywhere is a counterexample to strict selection
from a non-strict mean. Merely a nonempty set of arithmetic-good
scales does not suffice: e=0, Q=-1 on the first half of J and Q=1/2
on the second; uniform weight gives negative mean but the latter
half has no good polar point. These are illustrative measure-theory
controls, not arithmetic data or polar examples.

At the actual native caller choose ONE D with all five exists_data
facts before selecting u. Define G(u) as an implication: if Q(u)<e,
then the same updated record with any valid scale proof satisfies
m*run90Remainder <= C*f*a*(log b)^K. Require G only μ-a.e.
Arbitrary failures where Q>=e and null exceptional sets inside
Q<e are allowed. No measurable selection of D_u, y, rank, index
or twist required. It is enough to prove a conditional local bound
on the strict polar-good part of a single fixed fiber, not a
weighted arithmetic mean bound. This differs from RUN97's signed
integral envelope: neither premise implies the other in general.
Old universal guarded finite-power budget implies this fiber premise
using native exists_data and the original five guards; no converse
asserted. Keep eps,K,C fixed before x grows and retain
(K+1)eps<=eta, C>=0. Reuse finite_power_scalar verbatim.
No new estimate of mR or prime counts. This can feed the per-prime
EndpointGrid required by the canonical count route; do not claim
count escape or arbitrary uniform choice of primes.

Exact native AdmissibleData 04208a5044bb7cf6464ef142a14d939148bed834
(scale field and all other data unchanged), DataExist
634c6a1f88791a3bb770326785b70411e8289b41 (five conjuncts),
OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3.
Mathlib integral_mono_ae signature inspected in Bochner/Basic.lean
19442aedbfc1558f989ec33ee6df119e0f1f5508; ae_restrict_mem and
ae_restrict_of_forall_mem inspected in Measure/Restrict.lean
a94352f677cc690b17f9e30c6bdd4097cefcf715.

Executed connector preflight: 10 exact unique source substitutions, 20
removed/duplicated source-anchor controls rejected. Existing RUN95
receipt b58fac802d12d1f3313fe5dc65ab06520577b841 retrieved, all_requested_checks_ok
true, arithmetic_premise_proved=false, original_definition_native_bridge_checked=false,
full_RH_replay=false. The actual editor mean receipt AND status paths
returned 404 in this run; no job outcome inferred. New module not
included in any receipt. No native engine, graph or axiom execution.
Preserve all original/reduced graphs, and previous A/B/C obligations.

RESUME HERE: after EditorPolarMean and IntegrationGuardedFinitePower
actually pass native replay, compile this file as EditorAEFiberBudget
in that same authenticated workspace, requiring the guards and strict
constructor-inclusive old/new endpoint graph comparison. If the mean
fails, repair its first actual diagnostic, not the scalar argument.
HANDOFF TO integration / prime / audit / kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module
open MeasureTheory

lemma IsPolar.editor_window_with_ae {E r E' r'} (h : IsPolar E r)
    (h' : IsPolar E' r') : ∀ᶠ t in atTop, ∀ X ∈ Set.Icc 0 t.exp,
    ∀ G : ℝ → Prop, (∀ᵐ v ∂volume.restrict (Set.Icc t (t^2)), G v) →
    ∃ u ∈ Set.Icc t (t^2), G u ∧ E u - X * E' u < (-t).exp := by
  filter_upwards [h.editor_eventually_window_mean h', mem_atTop (9 : ℝ)] with t ht ht9
  intro X hX G hG
  obtain ⟨iW, iQ, hmean⟩ := ht X hX
  let k := ⌈t^2 / 9⌉₊
  let W (v : ℝ) := v^k * (-3*v).exp
  let μ := volume.restrict (Set.Icc t (t^2))
  change Integrable W μ at iW
  change Integrable (fun v => W v * (E v - E' v * X)) μ at iQ
  change (∫ v, W v * (E v - E' v * X) ∂μ) < (-t).exp * (∫ v, W v ∂μ) at hmean
  by_contra hn
  have hmem : ∀ᵐ v ∂μ, v ∈ Set.Icc t (t^2) :=
    ae_restrict_mem measurableSet_Icc
  have hle : ∀ᵐ v ∂μ, (-t).exp * W v ≤ W v * (E v - E' v * X) := by
    filter_upwards [hG, hmem] with v hg hv
    have hq : (-t).exp ≤ E v - X * E' v :=
      le_of_not_gt (fun hlt => hn ⟨v,hv,hg,hlt⟩)
    have hv0 : 0 ≤ v := le_trans (by linarith) hv.1
    have hw0 : 0 ≤ W v := by dsimp [W]; positivity
    simpa only [mul_comm ((-t).exp) (W v), mul_comm X (E' v)] using
      mul_le_mul_of_nonneg_left hq hw0
  have hm := integral_mono_ae (iW.const_mul (-t).exp) iQ hle
  rw [integral_const_mul] at hm
  exact (not_le_of_gt hmean) hm

namespace RHEditorAE

def FiberBudgetAt {P : Parameters} (D : Data P) (K : ℕ) (C : ℝ) : Prop :=
  ∀ᵐ u ∂volume.restrict (Set.Icc (1e6 * D.logX) ((1e6 * D.logX)^2)),
    primeError P.d P.N₀ u.exp - towerDeg D.s / #D.thick * primeError P.d 1 u.exp <
      exp (-(1e6 * D.logX)) →
    ∀ hs : 1e12 * P.c ≤ log D.logB ∧ 100 * log D.logB ≤ D.logX ∧
      1e6 * D.logX ≤ u ∧ 1e6 * u ≤ D.logB ∧ 6 * log u ≤ log D.logB,
    let E := {D with logX₁ := u, scale := hs}
    E.m * E.run90Remainder ≤ C * (E.f : ℝ) * (E.a : ℝ) * E.logB^K

def FiberBudgetOn (P : Parameters) (eps : ℝ) (K : ℕ) (C : ℝ) (A : Set ℝ) : Prop :=
  ∀ᶠ x in atTop, x ∈ A → ∃ D : Data P,
    D.x = x ∧ log D.x₁ = x^(eps/6) ∧ (1e6 * log x)^2 ≤ log D.x₁ ∧
    log (log D.b) = eps * log x ∧ towerDeg D.s / log D.b ≤ #D.thick ∧
    FiberBudgetAt D K C

theorem eventually_primeError_on_set (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (A : Set ℝ) (hstar : FiberBudgetOn P eps K C A) :
    ∀ᶠ x in atTop, x ∈ A → primeError P.d P.N₀ x ≤ x ^ (8 * eta + 2⁻¹ - 1) := by
  unfold FiberBudgetOn at hstar
  have hthreshold : ∀ᶠ x : ℝ in atTop,
      log (C * (P.N₀.totient : ℝ) + 1)/(7*eta) ≤ log x :=
    tendsto_log_atTop (mem_atTop _)
  filter_upwards [tendsto_log_atTop.const_mul_atTop (r := 1e6) (by bound)
    ((isPolar_primeError PrimeSevenModEight.mod_eight (P.coprime_N₁_d
    0).coprime_mul_right).editor_window_with_ae (isPolar_primeError PrimeSevenModEight.mod_eight
    P.d.coprime_one_left)), hstar, hthreshold, (mem_atTop (1 : ℝ))] with x W hs hab hx
  intro hxS
  obtain ⟨D, hDx, _, l, e, H', hfiber⟩ := hs hxS
  subst x; simp only [log_exp, Set.mem_preimage, ← exp_mul] at *
  obtain := D.hasLogLower_of_le H', D.scale
  unfold FiberBudgetAt at hfiber
  obtain ⟨u, ⟨a, b⟩, hg, w⟩ := W (towerDeg D.s / #D.thick)
    ⟨by bound, D.le_of_hasLogBound⟩ _ hfiber
  let D' := {D with logX₁ := u, scale := by grw [b, l] <;> grind}
  have := D'.hasLogLower_of_le H'
  have starD' := hg w D'.scale
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
  calc primeError P.d P.N₀ D.x = D'.m * D'.run90Remainder / D'.m / D'.a / #D'.thick + (primeError P.d P.N₀
      D'.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D'.x₁) := by simp [run90Remainder_eq, tops,
      card_placeClass_eq, field, HasLogBound.pos D', ne_of_gt]
    _ ≤ exp (D.logX*(8*eta+2⁻¹-1)) :=
      RHIntegration97.finite_power_scalar _ _ _ _ _ _ _ _ _ C eta eps D.logX K
        hm ha hH hB (by positivity) hC heta hX hf H' D'.m_mem.1 e hslack starD' w.le hAbsorb
    _ = D.x ^ (8*eta+2⁻¹-1) := by rw [Real.rpow_def_of_pos (exp_pos _), log_exp]

theorem endpoint_from_budget (P : Parameters) {eta eps : ℝ}
    (heta : 0 < eta) (he : 0 < eps / 6 ∧ eps < 1 / 100)
    (K : ℕ) (C : ℝ) (hC : 0 ≤ C) (hslack : ((K : ℝ)+1)*eps ≤ eta)
    (hs : FiberBudgetOn P eps K C RHPrimeWindow94.QuarticScales) :
    RHPrimeWindow88.EndpointGrid P.d P.N₀ eta := by
  obtain ⟨X,hX⟩ := Filter.eventually_atTop.1
    (eventually_primeError_on_set P heta he K C hC hslack RHPrimeWindow94.QuarticScales hs)
  obtain ⟨J,hJ⟩ := exists_nat_gt (max X 1)
  refine ⟨J, ?_⟩
  intro k hk
  have hKk : (J : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hk1 : (1 : ℝ) ≤ (k : ℝ) := (le_max_right X 1).trans (hJ.le.trans hKk)
  have hk4 : (k : ℝ) ≤ (k : ℝ)^4 := by
    have hk0 : (0 : ℝ) ≤ (k : ℝ) := by positivity
    have h2 : (k : ℝ) ≤ (k : ℝ)^2 := by
      nlinarith [mul_nonneg hk0 (sub_nonneg.mpr hk1)]
    have h2one : (1 : ℝ) ≤ (k : ℝ)^2 := hk1.trans h2
    have h4 : (k : ℝ)^2 ≤ (k : ℝ)^4 := by
      nlinarith [mul_nonneg (sq_nonneg (k : ℝ)) (sub_nonneg.mpr h2one)]
    exact h2.trans h4
  exact hX _ ((le_max_left X 1).trans (hJ.le.trans (hKk.trans hk4))) ⟨k,rfl⟩


end RHEditorAE

#print axioms IsPolar.editor_window_with_ae
#print axioms RHEditorAE.eventually_primeError_on_set
#print axioms RHEditorAE.endpoint_from_budget

open Lean in
run_cmd do
  for (n, req) in #[
    (``IsPolar.editor_window_with_ae,
      #[``IsPolar.editor_eventually_window_mean, ``integral_mono_ae]),
    (``RHEditorAE.eventually_primeError_on_set,
      #[``IsPolar.editor_window_with_ae, ``Data.run90Remainder_eq,
        ``RHIntegration97.finite_power_scalar]),
    (``RHEditorAE.endpoint_from_budget,
      #[``RHEditorAE.eventually_primeError_on_set])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "EDITOR_AE unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "EDITOR_AE missing value"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "EDITOR_AE missing direct supplier {n}"
  logInfo "EDITOR_AE_FIBER_BUDGET_GUARDS_OK"

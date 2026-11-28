import New.Endgame.OneSidedCriterion
import Lean

/-!
# Editor: native-shaped signed polar mean (strict window inequality)
28 November 2026 — PREPARED, not compiled. Human argument in
2026-11-28_POLAR_WEIGHTED_MEAN_STAR.lean (3197ff9b). This is its
next executable Lean candidate, not another proposed arithmetic premise.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
New/Endgame/OneSidedCriterion.lean blob 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679,
Mathlib/MeasureTheory/Integral/Bochner/Set.lean blob b73074a2184a11cc434ed87802f9ca7b38c1f4ed.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION; latest editor 3197ff9b,
integration 8aa381a7, prime guarded RUN96 7654aa1f.
RUN96 is an alternative pointwise guarded domain; this does not
duplicate its caller. Its accepted RUN95 receipt b58fac802d12d1f3313fe5dc65ab06520577b841
(run 46102281476) has four module roots, five graph roots,
124661 nodes / 4046494 edges / zero missing / all 15 guards,
standard axioms, arithmetic_premise_proved=false,
original_definition_native_bridge_checked=false, full_RH_replay=false.
No claim that this new theorem is included in that receipt.

## Exact reduction at IsPolar.exists_window_sub_mul_le
Keep native radius selection, t thresholds, ceil moment k, Laplace
integrals, numerical contradiction and outside-window majorization.
Let W=v^k exp(-3v), Q=W(E-XE'), S=Q-exp(-t)W, and
F=S+v^k[exp(-Rv) exp(7t)+exp(-v) exp(2t-t²)].
On Ioi 0 the native quantitative argument proves integral F<0.
On Ioi 0 minus J=[t,t²] the native pointwise domination gives F>=0.
On J the two tail terms are nonnegative, so S<=F.
All terms integrable by the native moment integrability and Laplace
integrals. Thus
  integral_J S <= integral_J F
               = integral_Ioi F - integral_(Ioi minus J) F < 0.
This is stronger than the original existence assertion and requires
no pointwise assumption inside J. It retains the same uniformity
in X, t and polar hypotheses. The strict signed inequality is
converted into the requested weighted mean without division.
Multiplication order E' * X follows native source.

Executed via connector JS: six unique exact source anchors and twelve
removed/duplicated anchor controls, all as expected; native numerical
and complement proof text extracted, not reconstructed from memory.
Read the actual RUN95 receipt independently; this new file has no
native receipt. Local command -v lean/lake/elan returned no path.
No native rh_scan/prune/reduce/auto/frontier execution here, no graph
retirement or arithmetic closure. This is an alternative to the
accepted pointwise endpoint; preserve its graph and earlier mean
aggregation certificate. The averaged star is still unproved.

RESUME HERE: compile THIS module as EditorPolarMean in the retained
RUN95 endpoint workspace, using the existing New.Endgame.OneSidedCriterion
object; execute the direct guards and standard axiom check and compare
constructor-inclusive roots to the native polar window before use.
If it fails, preserve first actual error and repair the new
integrability/set-restriction steps, not the reused native estimates.
HANDOFF TO Landau/prime/integration/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Complex Filter Nat Real Set MeasureTheory Topology

lemma IsPolar.editor_eventually_window_mean {E r E' r'} (h : IsPolar E r)
    (h' : IsPolar E' r') : ∀ᶠ t in atTop, ∀ X ∈ Icc 0 t.exp,
    let k := ⌈t ^ 2 / 9⌉₊
    let W v := v ^ k * (-3 * v).exp
    IntegrableOn W (Icc t (t ^ 2)) ∧
    IntegrableOn (fun v => W v * (E v - E' v * X)) (Icc t (t ^ 2)) ∧
    (∫ v in Icc t (t ^ 2), W v * (E v - E' v * X)) <
      (-t).exp * (∫ v in Icc t (t ^ 2), W v) := (h.eventually_moment_le.and
  (h'.eventually_moment_le.and (Ioo_mem_nhdsGT (lt_add_one _)))).exists.elim fun R ⟨c, d, p, q⟩ ↦ by
  simp_rw [IntegrableOn, abs_le, forall_and] at *
  filter_upwards [c, d, mem_atTop (99 / (R.log - .log 3)), mem_atTop 9]
    with t ⟨c, ia, a⟩ ⟨d, ib, b⟩ u _ X ⟨_, _⟩
  let k := ⌈t ^ 2 / 9⌉₊
  obtain ⟨w, I, K : t + t * X + 1 ≤ t.exp * t.exp⟩ := three_pos.trans p,
    mod_cast fun R : ℝ ↦ (@laplace_pow R · k), by nlinarith [t.add_one_le_exp]
  have J R o := Integrable.of_integral_ne_zero ((I R o).trans_ne (by simp; grind))

  let W (v : ℝ) := v ^ k * (-3 * v).exp
  let Q (v : ℝ) := W v * (E v - E' v * X)
  let S (v : ℝ) := W v * (E v - E' v * X - (-t).exp)
  let F (v : ℝ) := v ^ k * ((-R * v).exp * (7 * t).exp +
    (-1 * v).exp * (2 * t - t ^ 2).exp +
    (-3 * v).exp * (E v - E' v * X - (-t).exp))
  have subJ : Icc t (t ^ 2) ⊆ Ioi (0 : ℝ) := by
    intro v hv
    exact lt_of_lt_of_le (by linarith) hv.1
  have iW : IntegrableOn W (Ioi 0) := by
    simpa only [W, IntegrableOn, mul_comm, mul_left_comm, mul_assoc] using
      J 3 (by norm_num)
  have iE : IntegrableOn (fun v => W v * E v) (Ioi 0) := by
    simpa only [W, IntegrableOn] using ia k
  have iE' : IntegrableOn (fun v => W v * E' v) (Ioi 0) := by
    simpa only [W, IntegrableOn] using ib k
  have hQeq : Q = fun v => W v * E v - (W v * E' v) * X := by
    funext v
    dsimp [Q]
    ring
  have iQ : IntegrableOn Q (Ioi 0) := by
    rw [hQeq]
    exact Integrable.sub iE (Integrable.mul_const iE' X)
  have hSeq : S = fun v => Q v - (-t).exp * W v := by
    funext v
    dsimp [S, Q]
    ring
  have iS : IntegrableOn S (Ioi 0) := by
    rw [hSeq]
    exact Integrable.sub iQ (Integrable.const_mul iW _)
  have iR : IntegrableOn (fun v : ℝ => v ^ k * (-R * v).exp) (Ioi 0) := by
    simpa only [IntegrableOn, mul_comm, mul_left_comm, mul_assoc] using J R (by bound)
  have i1 : IntegrableOn (fun v : ℝ => v ^ k * (-1 * v).exp) (Ioi 0) := by
    simpa only [IntegrableOn, mul_comm, mul_left_comm, mul_assoc] using J 1 (by norm_num)
  have hFeq : F = fun v => (v ^ k * (-R * v).exp) * (7 * t).exp +
      (v ^ k * (-1 * v).exp) * (2 * t - t ^ 2).exp + S v := by
    funext v
    dsimp [F, S, W]
    ring
  have iF : IntegrableOn F (Ioi 0) := by
    rw [hFeq]
    exact Integrable.add (Integrable.add (Integrable.mul_const iR _)
      (Integrable.mul_const i1 _)) iS
  -- Native full-line quantitative contradiction, now isolated from pointwise N.
  have fullNeg : (∫ v in Ioi 0, F v) < 0 := by
    by_contra! this
    change 0 ≤ ∫ v in Ioi 0, v ^ k * ((-R * v).exp * (7 * t).exp +
      (-1 * v).exp * (2 * t - t ^ 2).exp +
      (-3 * v).exp * (E v - E' v * X - (-t).exp)) at this
    simp (disch := first | fun_prop (disch := simp [w]) | simp [*]) [mul_add, mul_sub, ← mul_assoc,
      integral_add, integral_sub, I, -neg_mul] at this
    grw [a.2, ← b.1, (by ring : _ - _ * X = k ! * (t + t * X) / R ^ k), lt_add_one (t + _), K,
      add_sub, sub_pos] at this
    apply this.not_ge ((add_le_add_three ..).trans_eq (add_thirds _)) <;>
    simp (disch := positivity) [← log_le_log_iff] <;> nlinarith [log_three_lt_d9,
      abs_le.1 (abs_sub_ceil_le (by bound : 0 ≤ t ^ 2 / 9)), (div_le_iff₀ (by bound)).1 u]
  -- Native outside-window domination, no hypothesis on E-XE' inside J.
  have outsideNonneg : ∀ v ∈ Ioi (0 : ℝ) \ Icc t (t ^ 2), 0 ≤ F v := by
    intro v hv
    have l : 0 < v := hv.1
    have x : ¬ (t ≤ v ∧ v ≤ t ^ 2) := hv.2
    change 0 ≤ v ^ k * ((-R * v).exp * (7 * t).exp +
      (-1 * v).exp * (2 * t - t ^ 2).exp +
      (-3 * v).exp * (E v - E' v * X - (-t).exp))
    apply mul_nonneg (by bound)
    grw [← neg_le_iff_add_nonneg, ← c.1, d.2, (by grind : -t ≤ v), (by ring : -_ = (-3 * v).exp *
      v.exp * (t + t * X + 1)), K, ← max_le_add_of_nonneg] <;> simp [← Real.exp_add, exp_nonneg, l.le]
    contrapose! x; use ?_ <;> nlinarith
  have outInt : 0 ≤ ∫ v in Ioi (0 : ℝ) \ Icc t (t ^ 2), F v :=
    setIntegral_nonneg (measurableSet_Ioi.diff measurableSet_Icc) outsideNonneg
  have split := setIntegral_sdiff measurableSet_Icc iF subJ
  have winF : (∫ v in Icc t (t ^ 2), F v) < 0 := by
    linarith only [fullNeg, outInt, split]
  have winCompare : (∫ v in Icc t (t ^ 2), S v) ≤ ∫ v in Icc t (t ^ 2), F v := by
    apply setIntegral_mono_on (iS.mono_set subJ) (iF.mono_set subJ) measurableSet_Icc
    intro v hv
    rw [hFeq]
    have hv0 : 0 ≤ v := (subJ hv).le
    have h1 : 0 ≤ (v ^ k * (-R * v).exp) * (7 * t).exp := by positivity
    have h2 : 0 ≤ (v ^ k * (-1 * v).exp) * (2 * t - t ^ 2).exp := by positivity
    linarith only [h1, h2]
  have winS := winCompare.trans_lt winF
  have iQwin := iQ.mono_set subJ
  have iWwin := iW.mono_set subJ
  have meanEq : (∫ v in Icc t (t ^ 2), S v) =
      (∫ v in Icc t (t ^ 2), Q v) - (-t).exp * (∫ v in Icc t (t ^ 2), W v) := by
    rw [hSeq, integral_sub iQwin (Integrable.const_mul iWwin _), integral_const_mul]
  change IntegrableOn W (Icc t (t ^ 2)) ∧ IntegrableOn Q (Icc t (t ^ 2)) ∧
    (∫ v in Icc t (t ^ 2), Q v) < (-t).exp * (∫ v in Icc t (t ^ 2), W v)
  exact ⟨iWwin, iQwin, by linarith only [winS, meanEq]⟩

#print axioms IsPolar.editor_eventually_window_mean

open Lean in
run_cmd do
  let n := ``IsPolar.editor_eventually_window_mean
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let axs ← collectAxioms n
  unless axs.all (fun a => allowed.contains a) do
    throwError "EDITOR_POLAR_MEAN nonstandard axiom"
  let info ← getConstInfo n
  let some v := info.value? (allowOpaque := true) |
    throwError "EDITOR_POLAR_MEAN missing value"
  for supplier in #[``IsPolar.eventually_moment_le, ``setIntegral_sdiff,
      ``setIntegral_mono_on, ``setIntegral_nonneg] do
    unless v.getUsedConstants.contains supplier do
      throwError "EDITOR_POLAR_MEAN missing supplier {supplier}"
  Lean.logInfo "EDITOR_POLAR_MEAN_DIRECT_GUARDS_OK"

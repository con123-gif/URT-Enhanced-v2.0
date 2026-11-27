import New.Filling.GlobalSieve

/-!
# B3: pivot-specific accumulated Poisson error, actual one_sided_poisson consumer
27 November 2026. PREPARED / NOT NATIVE CHECKED. Source lsernau/grh-lean
@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src/New/Filling/GlobalSieve.lean
blob 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372, lines 84–166; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
509fdba8772c61988cbe780d414d726579db7f54, b094c82e0c910f74a6f7b31dbcc0351f9053deab.
Read prior integration 5bb32ae1, editor bd7dce3c (direct global caller
conditional on global energy, do not duplicate), peer 52af975d (C2).
Search commits for Poisson/pivot/relaxed link found no prior pivot-budget variant.

RESULT: separate the two independent estimates at each actual pivot.
Let c_a be the positive native Haar factor, C_i=prod_{a<i} c_a.
Let R_i(V) be the native real sum divided by C_{i+1}.
For every pivot a use its own bound eps_a for ALL c,X satisfying
the original hP premises at a, and Gamma_a for the original head
square bound at a. No choices of field, frame, rational points,
measure, kernel or characters are changed.

In the original proof the Fourier contribution is
c_i eps_i (sum_p Lambda_i(hd_i p 1))^2, bounded by
C_{i+1} Gamma_i eps_i. The diagonal of the remaining integral
is exactly the lower step (at i=0 the norm_bot_le bound En).
For i>0 the off-diagonal integral contribution is bounded by a
SECOND C_{i+1} Gamma_i eps_i: for each fixed t the distinct v
give distinct nonzero y=g^-1(t^-1-v^-1) in ratIntegralOff T,
so the original hP bound at i applies to their sum (not a
new factor card A). This is precisely the final hP application
and linear_combination in GlobalSieve. Retain the original
positive-system, norm, integral, continuity and product hypotheses.
After division by the same positive C_{i+1}, for any V subset A:
 R_0(V) <= En + Gamma_0 eps_0;
 R_i(V) <= R_{i-1}(A) + 2 Gamma_i eps_i (i>0).
Thus the cumulative budget is
 B_i=Gamma_0 eps_0 + 2 sum_{a=1}^i Gamma_a eps_a,
 and R_i(V)<=En+B_i by induction. In the constant case this
 is exactly the native (2i+1) Gamma eps; no loss.
 The point is that the maxima of head and frequency error need
 not be at the same pivot. Example Gamma=(1,100), eps=(100,1):
 exact budget 300, product-of-maxima budget 30000. This is
 a scalar illustration, NOT a claim that native arithmetic
 achieves such a saving. Using product of minima gives 3 and is invalid.

 Actual caller: GlobalSieve.sieve instantiates the original
 theorem at n=rho. To exploit the new interface, bound the
 actual products Gamma_a eps_a at each a using the named
 frequencyGain/sum_frequencies_le and headWeight estimates
 (or the joint aggregate). Its final error is then B_rho
 instead of the uniform product. Moments.energy_fixingSet_le
 uses the normalized sieve with the finite system bottom bound
 and the packet constant. All those bounds remain open in this
 alternative route, as do the original B1–B4 and A/C/D/E obligations.
 No source-level claim that this eliminates the original frequency
 theorem, no RH theorem imported. Editor's global route remains separate.

 Executed connector JS: 9 unique source edits, complete inverse
 round trip against pinned theorem; 625 exact small integer
 budget comparisons with 560 strict cases and the above
 negative control. These test the arithmetic only. Native Lean/lake
 not present in this run. No native rh_scan/prune/reduce/auto/frontier
 or CI output on this candidate; the original proof and every
 old dependency and axiom record remain unchanged.
 Original path: Moments.energy_fixingSet_le -> sieve -> one_sided_poisson
 -> sum_frequencies_le at caller + native positive-system primitive.
 Proposed path: same caller with pivot_budget and actual aggregate
 supplier (OPEN); graph replacement not claimed.

 RESUME HERE: compile the source-matched one_sided_poisson_pivot_budget
 below on the shared authenticated compact GlobalSieve workspace,
 repair the successor linear_combination if elaboration requires
 explicit pivot index, and compare original/new dependency and axiom
 reports before attempting the actual pivotwise arithmetic estimate.
 No cold build, no protected workflow change. RH OPEN.
-/

namespace Filling

open NumberField ENNReal Finset Fintype MeasureTheory Measure Real AddSubgroup Matrix ComplexOrder
  SemilocalField Complex
variable {E} [Field E] [CMType E] {𝔰} (S : Filling E 𝔰) (T : Finset (FinPlace E))

/-- The character x ↦ ψ_f(−x/ϖ) of the finite adeles, restricted to ∏_{w∈T} E_w by extending
elements by zero off T. -/
attribute [local simp] frameScaleSq ratPoint unitOrOne intVectors funext_iff wave IsUnit.map
  prod_eq_zero_iff entrywise pi_pos Prod.isUnit_iff Pi.isUnit_iff toAdele Units.val_inj padTuple
  selfDualChar stdAddChar mul_mem mul_sum

variable [S.IsAdmissible] {A : Finset Eˣ} (hA : ∀ t ∈ A, ↑t ∈ ratIntegralOff T ∧
  ↑t⁻¹ ∈ ratIntegralOff T) (hg : (↑S.g)⁻¹ ∈ ratIntegralOff T)
include hA hg

lemma one_sided_poisson_pivot_budget {n J En Λ β} (K :
  SieveSystem (.map (unitOrOne ∘ ·) unitOrOne) (.map ((·⁻¹.1) ∘ ·) (ratToPlaces T
  S.g⁻¹ * ·⁻¹.1)) n J (fun x ↦ (∏ v, wave (x.1 v)) * S.charOnPlaces T x.2) En Λ β) {Γ ε budget : ℕ → ℝ} (hP : ∀ a
  (c : _ → ℂ), (∀ v, ‖c v‖⁻¹ ≤ |S.kappa v| / S.g) → ∀ X, (∀ y ∈ X, y ≠ 0 ∧ y ∈ ratIntegralOff T) →
  ∑ y ∈ X, β (ratPoint T (fun v ↦ c v / S.frameScaleSq v a) y) ≤ ε a) (hε : ∀ a, 0 ≤ ε a) (hΛ : ∀ i p, 0 ≤
  Λ i p) (hBudget0 : budget 0 = Γ 0 * ε 0)
  (hBudgetStep : ∀ i, budget (i + 1) = budget i + 2 * Γ (i + 1) * ε (i + 1)) : let hd i (p : Fin i → A) t a := .map (unitOrOne ∘ ·) unitOrOne (ratPoint T
    (S.frameScaleSq · a) (padTuple (p · |>.1) t a).1)
  let c a := volÔ E / ∏ v, S.frameScaleSq v a ^ 2
  (∀ i ≤ n, (∑ p, Λ i (hd i p 1)) ^ 2 ≤ Γ i * ∏ a ∈ range i, c a) → ∀ i ≤ n, ∀ V ⊆ A,
  (∑ t ∈ V, ∑ p, ∑ q, J (i + 1) (hd i p t) (hd i q t)).re ≤
    (∏ a ∈ range (i + 1), c a) * (En + budget i) := by
  intro hd c hΓ
  refine Nat.strongRec fun i ih hi V hV ↦ ?_
  have hεi := hε i
  have := K.step_sum hi (hd i · 1)
  extract_lets F at *
  obtain ⟨⟨N, L⟩, o, ⟨hF, e, hM⟩, c0, d⟩ := show 0 ≤ F ∧ _ from K.nonneg_and_lowerSemicontinuous hi
    _ fun _ _ ↦ dite_eq_left rfl, (isOpen_univ.prod (isOpen_integralOff T) : @IsOpen (𝔸 E) _
        _), this,
    (by positivity : 0 ≤ c i), LinearMap.det_pi (S.frameScaleSq · i • (1 : ℂ →ₗ[ℝ] ℂ))
  set U := _ ×ˢ _; let m (z : 𝔸 E) := (fun v ↦ S.frameScaleSq v i * z.1 v, evalPlaces T z.2)
  have P : MeasurePreserving m (volume.restrict U) (ENNReal.ofReal (c i) •
    volume) := by simpa [d, U, volume_eq_prod, ← prod_restrict, prod_smul_left, prod_smul_right,
    abs_prod, div_eq_mul_inv, c, mul_smul, -frameScaleSq] using!
    MeasurePreserving.prod ⟨by fun_prop, map_linearMap_addHaar_eq_smul_addHaar _
    (d.trans_ne (by simp))⟩ ⟨by fun_prop, map_evalPlaces_restrict_volume T⟩
  have I := U.indicator_nonneg fun x _ ↦ (N (m x)).1
  refine (le_of_eq_of_le ?_ (IsDualFamily.sum_le_of_fourier ((integrable_indicator_iff
    o.measurableSet).2 (P.integrable_comp_of_integrable hF.re.smul_measure_nnreal)) I
    (V.map ⟨(⟨_, ·.1, rfl⟩), fun _ ↦ by simp⟩) (forall_mem_map.2 fun t h ↦ .of_frequently fun y k ↦
    (ite_eq_left ⟨trivial, (hA t (hV h)).1⟩).trans_le ((ofReal_le_ofReal_iff
    (k.exists.elim (I · |>.trans))).1 (((L _ fun _ ↦ continuousAt_const.update _
    (.prodMap (.piMap fun v ↦ continuousAt_unitOrOne (.mk0 _ (by simp [m])))
    (continuousAt_unitOrOne (t.map (ratToPlaces T).1)))).comp (g := m) (by fun_prop)).frequently _
    (k.mp (.mono (o.eventually_mem ⟨trivial, (hA t (hV h)).1⟩) (by simp +contextual [F,
    ofReal_le_ofReal])))))) ((reindex_equiv (Equiv.divRight₀ _ S.varpi_ne_zero).finsetCongr).1.2
    fun Y ↦ ?_))).trans (?_ : c i * (‖∫ x, F x‖ + ε i * (∑ p, Λ i (hd i p 1)) ^ 2) ≤ _)
  simp +contextual [m, U, F, ← Subring.mem_comap, hA _ (hV _)]
  congr! <;> simp +contextual [hd, ↓Function.eq_update_iff]
  · erw [sum_map]
    grw [Y.insert_erase_subset 0, sum_insert (by simp),
      ← sum_filter_of_ne (p := (· ∈ ratIntegralOff T)), ← hP i (2 * π * .I / Φ · S.ϖ)
      (by simp [abs_kappa_eq, field, abs_of_pos]), mul_add, sum_mul, mul_sum]
    · gcongr with y h; any_goals simp at h; grw [← hM _ (by simp [h])]
      all_goals grw [← norm_smul_of_nonneg c0, ← toReal_ofReal c0, ← integral_smul_measure,
        ← P.hasLaw.integral_comp (by cases hF; simp [charOnPlaces, c]; fun_prop),
        ← integral_indicator o.measurableSet]; simp [m, U, ← eq_re_of_ofReal_le (N _),
        Set.indicator, apply_ite, ↓sub_conj, ← Complex.exp_sum, sum_mul, fourierChar_apply,
        div_eq_mul_inv, -neg_sub, -frameScaleSq]
      congr! 8; field; erw [S.charOnPlaces_evalPlaces T (mul_mem h.2 ‹_›)]; simp; ac_rfl
    simp +contextual
    refine fun y _ n ↦ (sub_adeleOfLocal_mem_iff T).1 ((S.forall_selfDualChar_mul_eq_one_iff _).1
      fun ⟨r, hr⟩ ↦ (mul_eq_right₀ (norm_ne_zero_iff.1 n)).1
      (.trans ?_ (integral_add_left_eq_self _ (0, r - adeleOfLocal T (evalPlaces T r)))))
    rw [← integral_const_mul]; congr with; simp [Set.indicator, U, m, add_mem_cancel_left, sub_mem,
      (mem_Ô_iff T).1 hr, mul_add, AddChar.map_add_eq_mul, div_eq_mul_inv, -frameScaleSq]
    simp_rw [adeleOfLocal_evalPlaces]; ring_nf!
  grw [← re_eq_norm.2 (integral_nonneg N), e, hΓ, prod_range_succ_comm, mul_assoc]
  gcongr; cases i <;> simp [hBudget0, hBudgetStep]
  grw [re_le_norm, K.norm_bot_le, mul_comm]
  linear_combination (norm := ring_nf) ih _ .refl (by omega) A le_rfl + ε _ * hΓ _ hi
  simp [↓sum_mul, reindex_equiv (Fin.snocEquiv _), sum_prod_type, Fin.snocEquiv, sq, ←
    sum_add_distrib, ← A.sum_attach, show ∀ i p t, hd _ (Fin.snoc p t) 1 = hd i p t by
    grind [padTuple, Fin.snoc, Fin.castLT]]
  gcongr with t
  grw [sum_eq_add_sum_sdiff_singleton_of_mem ‹_›, ← A.attach.sdiff_subset]; gcongr with v
  let y := (S.g : E)⁻¹ * (t.1⁻¹ - v.1⁻¹)
  have : y ≠ 0 := by simp [y]; grind
  grw [re_le_norm, add_comm, K.off_diagonal, ← hP ‹_› S.g (by grw [← one_le_abs_kappa]; simp)
    {y} (by grind [mul_mem, sub_mem])]
  any_goals rw [show _ - _ = ratPoint T (S.g / S.frameScaleSq · ‹_›) y by
    simp [hd, y, field, ↓map_sub, ↓map_mul, ↓map_units_inv]]
  any_goals simp [*]
  all_goals grind [Finset.sum_nonneg, mul_nonneg]

#print axioms one_sided_poisson_pivot_budget
end Filling

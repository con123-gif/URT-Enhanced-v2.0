import New.Filling.GlobalSieve

/-!
# B3 integration audit: adjacent-pivot error correction
27 November 2026. SOURCE-MATCHED HUMAN CORRECTION; replacement candidate UNCOMPILED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read live mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
GlobalSieve.lean blob 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372;
EichlerFlag.lean blob 3da2606a049a092719b779802cb8ead3af7141ce;
Setup.lean blob 622e7eebe5c04b7ae87652e460762da7fb2e40727.
Prior pivotwise certificate blob 440902417b3c245a349fa91a3489fbf4b0a47517 (commit 9dfa0dc9);
frequency decay commit 78180020. Preserve both as evidence, but supersede
their proposed accumulated error formulas below. The frequency supplier
itself (saturated exponent) is unaffected. Latest peer editor 9d9bdb91
attaches two link suppliers; Landau 796fd65b prepares six-root chart replay;
character boxes 091f88f0 attaches C to star. No duplication of those routes.

RESULT: the prior same-pivot budget uses the wrong index for the
off-diagonal contribution. In EichlerFlag.SieveSystem:
  step i: Fourier bound on J_(i+1) uses beta(xi) Lambda_i(p)Lambda_i(q).
  off_diagonal j: bound on J_(j+1) uses
     xi=iota(p j)-iota(q j), Lambda_(j+1)(p)Lambda_(j+1)(q).
In GlobalSieve.one_sided_poisson at step i>0 the integral of
J_(i+1) is J_i; its off-diagonal estimate necessarily uses j=i-1.
The snoc reindexing in the source makes t and v the final entries
at that predecessor index; the displayed ratPoint with frameScaleSq
at that index is NOT the Fourier pivot i. The head square remains
at i in both contributions. The source uniform epsilon conceals
this distinction. The original constant-epsilon proof is unaffected.

Keep the same S, T, A, hA, hg, K and all original hP and hGamma
quantifiers, positivity, integrability and measures. Let
C_i=prod_(a<i) c_a, with c_a the original positive Haar scales,
R_i(V)=the original sum divided by C_(i+1).
The native argument supplies the following corrected recurrence:
  R_0(V) <= En + Gamma_0 eps_0;
  R_i(V) <= R_(i-1)(A) + Gamma_i (eps_i + eps_(i-1)), i>0.
The first epsilon is from K.step_sum at i; the second is from
K.off_diagonal at i-1. The original singleton hP applications,
weighted sum inequalities and head-square estimates are retained;
no unproved aggregate cancellation of head weights is used.
Hence by induction the sufficient accumulated budget is
  B_rho = Gamma_0 eps_0 + sum_(i=1)^rho Gamma_i(eps_i+eps_(i-1)).
For a uniform Gamma and the prior actual frequency supplier
eps_i=eps_0 Q^min(i,rho), 0<Q<=1, this gives
  B_rho <= Gamma eps_0 * [1 + sum_(i=1)^rho (Q^i+Q^(i-1))]
        = Gamma eps_0 * [2-(1+Q)Q^rho]/(1-Q)  (Q<1).
This uses nonnegative Gamma and eps_0. The bracket is at most
2/(1-Q), not (1+Q)/(1-Q), and at most 2rho+1.
For Q=1 it equals 2rho+1, for rho=0 it equals 1.
The previous bracket 1+2 sum Q^i underestimates the corrected
one by exactly 1-Q^rho. Example rho=1, Q=1/2: 2 instead of 5/2.
This is a scalar negative control showing why the previous
recurrence cannot be used; it is NOT a counterexample to native RH
or a claim about an actual CM field. No actual saving is quantified
without a source-bound estimate on Q and complete replay.

Executed locally Python 3 fractions.Fraction: for den=1..12,
num=0..den, rho=0..20, q=Fraction(num,den), compute both brackets;
assert corrected-old==1-q**rho, old<=corrected<=2*rho+1,
and for q<1 exact closed form and upper bound, otherwise uniform equality.
Output: 1890 exact checks; negative control rho=1 q=1/2 old=2 corrected=5/2.
No local lean/lake executable. Shared C1 run 46055305146 actually
in_progress at lookup; no B3 receipt. No new rh_scan/prune/reduce/auto/
frontier, axiom audit or kernel verification. Candidate below copies
the earlier native proof body but explicitly binds the predecessor
in the successor branch. It may require elaboration repairs.
Original dependency graph and all old premises retained.
Proposed alternative path sieve -> adjacent budget -> actual frequency
supplier; unverified at caller. Do not use the earlier optimistic bound.

RESUME HERE: compile the adjacent-budget replacement below (NOT the
superseded same-pivot theorem) with the actual-pivot frequency supplier
on the shared authenticated compact GlobalSieve workspace; inspect
the successor linear_combination and native axiom/dependency evidence.
No independent cold build, no workflow edits; RH remains OPEN.
HANDOFF TO integration / B3 / native runner.
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

lemma one_sided_poisson_adjacent_budget {n J En Λ β} (K :
  SieveSystem (.map (unitOrOne ∘ ·) unitOrOne) (.map ((·⁻¹.1) ∘ ·) (ratToPlaces T
  S.g⁻¹ * ·⁻¹.1)) n J (fun x ↦ (∏ v, wave (x.1 v)) * S.charOnPlaces T x.2) En Λ β) {Γ ε budget : ℕ → ℝ} (hP : ∀ a
  (c : _ → ℂ), (∀ v, ‖c v‖⁻¹ ≤ |S.kappa v| / S.g) → ∀ X, (∀ y ∈ X, y ≠ 0 ∧ y ∈ ratIntegralOff T) →
  ∑ y ∈ X, β (ratPoint T (fun v ↦ c v / S.frameScaleSq v a) y) ≤ ε a) (hε : ∀ a, 0 ≤ ε a) (hΛ : ∀ i p, 0 ≤
  Λ i p) (hBudget0 : budget 0 = Γ 0 * ε 0)
  (hBudgetStep : ∀ i, budget (i + 1) = budget i + Γ (i + 1) * (ε i + ε (i + 1))) : let hd i (p : Fin i → A) t a := .map (unitOrOne ∘ ·) unitOrOne (ratPoint T
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
  gcongr; cases i with
  | zero =>
    simp [hBudget0]
    grw [re_le_norm, K.norm_bot_le, mul_comm]
  | succ j =>
    simp [hBudgetStep]
    have hεprev := hε j
    linear_combination (norm := ring_nf) ih _ .refl (by omega) A le_rfl + ε j * hΓ _ hi
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

#print axioms one_sided_poisson_adjacent_budget
end Filling

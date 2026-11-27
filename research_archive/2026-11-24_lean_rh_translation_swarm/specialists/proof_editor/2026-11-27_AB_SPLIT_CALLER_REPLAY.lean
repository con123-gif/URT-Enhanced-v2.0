import New.Endgame.LongForms

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option pp.fullNames true
set_option maxHeartbeats 4000000

/-!
27 November 2026 — lane 15, two-sided rank/norm split at actual A/B callers.
PREPARED, source-matched; no new Lean execution. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; spine 30924a758e7dc18f58e424b5e54c7d21f4b060e2;
ledger 7a20a39bd945378ed2daab0953e9b65571d0a196.
Exact source ChainValuation 19e853dfa8c645bfcdf3b3e21183f9b432620ef7, ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a,
LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05, New/Main 198ed5bf26aa294898931e0649bc2b88f1389f65.
Previous candidate blobs b4a1117b3c29e1b67ad37d8f5deee3da3144ab5e, 184b3db4035f0f1874efe845c33f70d875beb3fa retained unchanged.

Actual source-visible residual path: editor_star -> editor_family -> original
short_forms (line 147) -> span_short_ramifiedColumns -> combined rank/short
lemma (second conjunct). Thus the previous B-only patch cannot remove the
combined theorem even at the displayed A/B branch. Split the two independent
inductions. Norm-only: for s empty E=1. For w inserted, E_(w∪s)=(1-z_w)E_s
(up to the original product ordering); the original sub_translate lemma
makes a B-short vector 4B-short and retains the central membership guard.
Induct, obtaining exactly 4^|s| B, independently of the rank/nullity bound.
The span proof uses ONLY this result and the original short-column lattice
span at B/4^f. Replace span caller in short_forms, then replace A and B
together at family; no changes to q, selected S, translates, index, Gram,
C, scale or positivity suppliers. Rank-only keeps the original central
nullity bound. The two branches now have separate explicit premises.
Norm-only does not imply a rank bound (E=0); rank-only does not imply
shortness (an arbitrarily large scalar times the identity). No new
short-column existence theorem, no global edge retirement: C and other
paths have not been transitively audited, and original graphs remain.
Source extraction and unique string substitutions executed in JS, not Lean.

The prior B4 guards used info.value? with default false opaque access.
Peer integration/2026-11-27_LEAN_435_PROOF_INSPECTION.md (blob
2573dcff84cbf47198a0c8c08078c697d4421ecc) demonstrates this rejects theorem
values in 4.35. This file corrects all guards to allowOpaque := true and
forces pp.fullNames. Latest actual B2 receipt: integration/2026-11-27_b2_caller_receipt/
README.md, blob ee376f198260e850bcb1c00fdb0c2fe71673802d: seven declarations,
four original-type comparisons, all direct guards, standard axioms, exit 0;
not a B4 receipt. No local lean/lake; native reducers unavailable. No new
PASS, no changed root obligation count. No import of New.Main.

RESUME HERE: integration shared compact runner, compile this single
module (supersedes earlier two-module candidate for replay; do not rebuild
B2 separately), using existing authenticated cache when available:
  lake build +New.Endgame.LongForms:olean
  lake env lean --tstack=400000 -Dpp.fullNames=true EditorSplitAB.lean
Require exit 0, nine complete axiom reports (only propext, Classical.choice,
Quot.sound), nine EDITOR_SPLIT_OK markers, six exact original type comparisons.
A separate audit workspace compares the star type against New.Main only
after candidate validation, not as a proof input. Check first compiler
error, if any, before asserting success. Then constructor-inclusive
original/reduced reachability including C and all type/value edges;
keep every unresolved premise. HANDOFF TO integration/kernel/audit.
-/

section RankAndSpan
open Module Finset Fintype Matrix MvPolynomial NumberField Representation Space Submodule Valued
open Filling

namespace Data

variable {P} (D : Data P)

/-- Rank part only of the original ramification supplier. -/
lemma editor_ramifyingOp_rank_only s p :
    finrank ℂ (Submodule.comap (D.ramifyingOp s) p) ≤
      finrank ℂ p + #s * (D.N - 1 : ℝ)⁻¹ * finrank ℂ D.Column := by
  induction' s using cons_induction with w s _ a generalizing p
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]
    simp
  · erw [card_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one,
      asAlgebraHom_of, p.comap_comp (D.ramifyingOp s)]
    grw [a _, (by simpa [↓← finrank_eq_rank, ← Nat.cast_add] using
      (1 - D.centralRep (D.centralGen w)).lift_rank_comap_le :), Nat.cast_add,
      finrank_ker_one_sub_centralGen_le]
    grind

/-- Original B4 statement, replacing the combined rank/shortness supplier
at the actual source caller, not invoking the original B4 theorem. -/
lemma editor_ramifiedColumns_fill_rows (c : ℂˣ) :
    IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
      (c.1 • D.ramifyingOp .univ)) (D.b ^ 2)⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  have h := Fits.exists_translate_finrank_comap_le (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel))
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) (((D.editor_ramifyingOp_rank_only .univ _).trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling]; gcongr; use D.le_of_hasLogBound
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

/-- Reuse the replacement for the nonzero row-dimension caller. -/
lemma editor_finrank_rows_ne_zero : finrank ℂ D.rows ≠ 0 := fun e ↦
  (D.editor_ramifiedColumns_fill_rows 1 ⊤).rec fun _ ↦ by
    erw [finrank_top, e]
    norm_num [finrank_pos_iff.2 D.columnCoords.nontrivial, ← lt_tsub_iff_left]
    use D.lt_of_hasLogBound

/-- Norm-only half, with no rank premise or nullity estimate. -/
lemma editor_ramifyingOp_short_only s : ∀ B φ, IsShort B φ.1 →
    IsShort (4 ^ #s * B) (D.ramifyingOp s φ).1 := by
  induction' s using cons_induction with w s _ a
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]
    simp
  · erw [card_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one, asAlgebraHom_of]
    simpa [pow_succ', mul_assoc] using!
      (a · · · |>.sub_translate (scalarFin_centralGen_mem ..).1)

lemma editor_span_short_ramifiedColumns : span ℂ {φ : D.ramifiedColumns | IsShort D.budget.exp φ.1.1} =
  ⊤ := comap_injective_of_surjective (D.ramifyingOp _).surjective_rangeRestrict (eq_top_mono
  (span_le.2 fun φ h ↦ subset_span (by simpa [card_piPlaces, mul_div_cancel₀] using!
  (D.editor_ramifyingOp_short_only univ) _ φ h))
  (span_isShort_eq_top D.classAut_columnLevel_eq_bot P.cycloConductor_mem_different (by grw [boxes,
  sum_height_mul_kappa_le]) (B := _ / 4 ^ D.f)
  (by simpa [le_div_iff₀', ↓card_X, n] using Real.le_exp_of_log_le D.le_of_hasLogBound)))

end Data
end RankAndSpan

section ShortForms
open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm
variable {P} (D : Data P)

lemma Data.editor_short_forms : ∃ q > (0 : ℚ), ∃ B, B = (q : ℂ) • D.projectedPoincare ∧ (∃ S ⊆
  D.integralRamified, span ℂ S = ⊤ ∧ ∀ φ ∈ S, ∀ s σ, (D.Θ 1 (B s φ)).normSqAt σ ≤ exp (D.mainHeight
  - D.m * D.remainder + D.logB * D.budget)) ∧ ∀ (t : Finset D.G) n (y : Fin n → _), (∀ i, y i ∈
  Set.image2 (B ·) t D.integralRamified) → D.IndexLe y (#t * finrank ℂ D.Column * D.budget) := by
  -- `q` divides out the gains, less the allowed losses
  obtain ⟨q, q0, e, v⟩ := exists_rat_log_eq_and_padic_norm_eq (D.nonsplitPrimes ∪ {D.N})
    (fun l ↦ ⌊D.allowedLoss l - ite (l ∈ D.nonsplitPrimes)
    (D.gain l) 0⌋) (by grind [N_prime]) (by grind [allowedLoss, Int.floor_zero])
  choose Ψ G S using D.seesaw.choose_spec
  refine ⟨q, q0, _, rfl, ⟨_, fun φ k l _ _ ↦ ⟨φ.1.2, k.1 l⟩, D.editor_span_short_ramifiedColumns,
    fun φ k s σ ↦ (map_smul (D.projectedPoincare s) .. ▸ normSqAt_goodProjTranslate_le
    (S .. ▸ weylNormSq_Bmu_le (B := 2 * log q + D.budget)
    (G 1) (by simpa [two_mul, exp_add, exp_log, q0, sq] using k.2 σ ·) ·)).trans (by
    grw [e, heightPerRow_le, Int.floor_le]
    simp [sub_mul, -mem_filter, -union_singleton]
    grw [sum_allowedLoss_mul_log_le]; ring; simpa using D.le_of_hasLogBound)⟩, fun t n y h ↦
    ⟨fun l ↦ #t * finrank ℂ D.Column * (_ * log l),
    fun U ↦ by grw [← mul_sum, sum_allowedLoss_mul_log_le], fun l _ ι ϑ c ↦
    (exists_indexDvd_Bmu_divisible (Int.ceil_lt_add_one _)).elim fun n a ↦ a.2.elim fun _ b ↦
    (IndexDvd.sup (N' := (integralForms ι).comap ((D.Θ ϑ).restrictScalars embValRing)) (f :=
    ((q : ℂ) • D.projectedPoincare · |>.restrictScalars embValRing)) (fun s ↦ b.1.comap
    (D.ramifiedColumns.subtype.restrictScalars _) le_rfl fun φ _ h ↦ congr($((D.Θ ϑ).map_smul ..) ∈
    integralForms ι).mpr (goodProjTranslate_mem_integralForms ι (fun g ↦ by
    erw [weylGauge_smul, congr($(S ..).1 g)]
    simpa [v, weylGauge_smul, ← Int.floor_neg] using (b.2 _ _ (G ϑ) c _ h φ.2).2 g) s)) t _ y
    fun k ↦ subset_span (.inl (Set.image2_subset_left (by exact fun _ ↦ (· l)) (h k)))).imp
    fun u ⟨k, h⟩ ↦ ⟨?_, h⟩⟩⟩
  · apply (Valuation.valuationSubring.integers _).le_of_dvd at k
    simp [norm_p_eq_inv, ← NNReal.coe_le_coe] at k
    grw [← k, ← le_log_iff_exp_le] <;> simp [NeZero.pos]
    linarith [mul_le_mul_of_nonneg_right a.1 (mul_nonneg (#t).cast_nonneg (log_natCast_nonneg l))]
end ShortForms

section Downstream
open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm

variable {P} (D : Data P)

lemma Data.editor_enough_forms : 0 < finrank ℂ D.Column ∧ 0 < D.rowDim ∧
  ∃ t, #t * finrank ℂ D.Column ≤ 5 * D.rowDim * log (1 + D.b ^ 2) ∧ (1 - 4 / D.b ^ 2) * D.rowDim ≤
  finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) := have := D.columnCoords.nontrivial
  ⟨finrank_pos, D.editor_finrank_rows_ne_zero.pos, (exists_few_translates (W :=
    D.rows) (HasLogBound.pos D) (D.editor_ramifiedColumns_fill_rows _)).imp fun _ ↦ .imp (by simp)
    (·.trans (mod_cast finrank_mono (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))⟩

open LinearMap

lemma Data.editor_exists_family_covolumeSq_le (D : Data P) : ∃ n, ∃ y : Fin n → _, LinearIndependent ℂ y ∧
    (1 - 4 / D.b ^ 2) * D.rowDim ≤ n ∧
  (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧ ∀ σ,
  covolumeSq (D.Θ 1 ∘ y) σ ≤ exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.editor_short_forms, D.editor_enough_forms
  -- the family: a basis among the translates
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  -- index and length
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

open Data

lemma editor_star_inequality {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.editor_exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.editor_finrank_rows_ne_zero.pos
  -- `d` is the dimension, `L = f a log⁴ b` the unit of error, `exp h` the bound per form
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - 3 * L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ := (integral_forms_long i big I short).trans_eq (by ring)
                    -- the missing dimensions are a share `4 / b²`, and the index is small
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  -- divide by `d`; `h_main` cancels
  calc D.m * D.remainder ≤ 4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget := by
        linarith [le_of_mul_le_mul_left both d0]
    _ ≤ _ := D.le_of_hasLogBound
end Downstream

#print axioms Data.editor_ramifyingOp_rank_only
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_ramifyingOp_rank_only
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_ramifyingOp_rank_only: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.finrank_ker_one_sub_centralGen_le do Lean.throwError "Data.editor_ramifyingOp_rank_only: missing Data.finrank_ker_one_sub_centralGen_le"
  if deps.contains ``Data.ramifyingOp_finrank_comap_and_short then Lean.throwError "Data.editor_ramifyingOp_rank_only: forbidden Data.ramifyingOp_finrank_comap_and_short"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_ramifyingOp_rank_only"

#print axioms Data.editor_ramifyingOp_short_only
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_ramifyingOp_short_only
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_ramifyingOp_short_only: missing proof"
  let deps := value.getUsedConstants
  if deps.contains ``Data.ramifyingOp_finrank_comap_and_short then Lean.throwError "Data.editor_ramifyingOp_short_only: forbidden Data.ramifyingOp_finrank_comap_and_short"
  if deps.contains ``Data.finrank_ker_one_sub_centralGen_le then Lean.throwError "Data.editor_ramifyingOp_short_only: forbidden Data.finrank_ker_one_sub_centralGen_le"
  if deps.contains ``Data.editor_ramifyingOp_rank_only then Lean.throwError "Data.editor_ramifyingOp_short_only: forbidden Data.editor_ramifyingOp_rank_only"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_ramifyingOp_short_only"

#print axioms Data.editor_span_short_ramifiedColumns
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_span_short_ramifiedColumns
  let orig ← Lean.getConstInfo ``Data.span_short_ramifiedColumns
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_span_short_ramifiedColumns: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_span_short_ramifiedColumns: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_ramifyingOp_short_only do Lean.throwError "Data.editor_span_short_ramifiedColumns: missing Data.editor_ramifyingOp_short_only"
  if deps.contains ``Data.ramifyingOp_finrank_comap_and_short then Lean.throwError "Data.editor_span_short_ramifiedColumns: forbidden Data.ramifyingOp_finrank_comap_and_short"
  if deps.contains ``Data.span_short_ramifiedColumns then Lean.throwError "Data.editor_span_short_ramifiedColumns: forbidden Data.span_short_ramifiedColumns"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_span_short_ramifiedColumns"

#print axioms Data.editor_ramifiedColumns_fill_rows
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_ramifiedColumns_fill_rows
  let orig ← Lean.getConstInfo ``Data.ramifiedColumns_fill_rows
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_ramifiedColumns_fill_rows: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_ramifiedColumns_fill_rows: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_ramifyingOp_rank_only do Lean.throwError "Data.editor_ramifiedColumns_fill_rows: missing Data.editor_ramifyingOp_rank_only"
  if deps.contains ``Data.ramifyingOp_finrank_comap_and_short then Lean.throwError "Data.editor_ramifiedColumns_fill_rows: forbidden Data.ramifyingOp_finrank_comap_and_short"
  if deps.contains ``Data.ramifiedColumns_fill_rows then Lean.throwError "Data.editor_ramifiedColumns_fill_rows: forbidden Data.ramifiedColumns_fill_rows"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_ramifiedColumns_fill_rows"

#print axioms Data.editor_finrank_rows_ne_zero
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_finrank_rows_ne_zero
  let orig ← Lean.getConstInfo ``Data.finrank_rows_ne_zero
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_finrank_rows_ne_zero: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_finrank_rows_ne_zero: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_ramifiedColumns_fill_rows do Lean.throwError "Data.editor_finrank_rows_ne_zero: missing Data.editor_ramifiedColumns_fill_rows"
  if deps.contains ``Data.finrank_rows_ne_zero then Lean.throwError "Data.editor_finrank_rows_ne_zero: forbidden Data.finrank_rows_ne_zero"
  if deps.contains ``Data.ramifiedColumns_fill_rows then Lean.throwError "Data.editor_finrank_rows_ne_zero: forbidden Data.ramifiedColumns_fill_rows"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_finrank_rows_ne_zero"

#print axioms Data.editor_short_forms
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_short_forms
  let orig ← Lean.getConstInfo ``Data.short_forms
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_short_forms: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_short_forms: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_span_short_ramifiedColumns do Lean.throwError "Data.editor_short_forms: missing Data.editor_span_short_ramifiedColumns"
  if deps.contains ``Data.short_forms then Lean.throwError "Data.editor_short_forms: forbidden Data.short_forms"
  if deps.contains ``Data.span_short_ramifiedColumns then Lean.throwError "Data.editor_short_forms: forbidden Data.span_short_ramifiedColumns"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_short_forms"

#print axioms Data.editor_enough_forms
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_enough_forms
  let orig ← Lean.getConstInfo ``Data.enough_forms
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_enough_forms: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_enough_forms: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_ramifiedColumns_fill_rows do Lean.throwError "Data.editor_enough_forms: missing Data.editor_ramifiedColumns_fill_rows"
  unless deps.contains ``Data.editor_finrank_rows_ne_zero do Lean.throwError "Data.editor_enough_forms: missing Data.editor_finrank_rows_ne_zero"
  if deps.contains ``Data.enough_forms then Lean.throwError "Data.editor_enough_forms: forbidden Data.enough_forms"
  if deps.contains ``Data.ramifiedColumns_fill_rows then Lean.throwError "Data.editor_enough_forms: forbidden Data.ramifiedColumns_fill_rows"
  if deps.contains ``Data.finrank_rows_ne_zero then Lean.throwError "Data.editor_enough_forms: forbidden Data.finrank_rows_ne_zero"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_enough_forms"

#print axioms Data.editor_exists_family_covolumeSq_le
run_cmd do
  let info ← Lean.getConstInfo ``Data.editor_exists_family_covolumeSq_le
  let orig ← Lean.getConstInfo ``Data.exists_family_covolumeSq_le
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq orig.type info.type
  unless same do Lean.throwError "Data.editor_exists_family_covolumeSq_le: original type mismatch"
  let some value := info.value? (allowOpaque := true) | Lean.throwError "Data.editor_exists_family_covolumeSq_le: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_enough_forms do Lean.throwError "Data.editor_exists_family_covolumeSq_le: missing Data.editor_enough_forms"
  unless deps.contains ``Data.editor_short_forms do Lean.throwError "Data.editor_exists_family_covolumeSq_le: missing Data.editor_short_forms"
  if deps.contains ``Data.enough_forms then Lean.throwError "Data.editor_exists_family_covolumeSq_le: forbidden Data.enough_forms"
  if deps.contains ``Data.short_forms then Lean.throwError "Data.editor_exists_family_covolumeSq_le: forbidden Data.short_forms"
  if deps.contains ``Data.exists_family_covolumeSq_le then Lean.throwError "Data.editor_exists_family_covolumeSq_le: forbidden Data.exists_family_covolumeSq_le"
  Lean.logInfo "EDITOR_SPLIT_OK Data.editor_exists_family_covolumeSq_le"

#print axioms editor_star_inequality
run_cmd do
  let info ← Lean.getConstInfo ``editor_star_inequality
  let some value := info.value? (allowOpaque := true) | Lean.throwError "editor_star_inequality: missing proof"
  let deps := value.getUsedConstants
  unless deps.contains ``Data.editor_exists_family_covolumeSq_le do Lean.throwError "editor_star_inequality: missing Data.editor_exists_family_covolumeSq_le"
  unless deps.contains ``Data.editor_finrank_rows_ne_zero do Lean.throwError "editor_star_inequality: missing Data.editor_finrank_rows_ne_zero"
  unless deps.contains ``Data.integral_forms_long do Lean.throwError "editor_star_inequality: missing Data.integral_forms_long"
  if deps.contains ``Data.exists_family_covolumeSq_le then Lean.throwError "editor_star_inequality: forbidden Data.exists_family_covolumeSq_le"
  if deps.contains ``Data.finrank_rows_ne_zero then Lean.throwError "editor_star_inequality: forbidden Data.finrank_rows_ne_zero"
  Lean.logInfo "EDITOR_SPLIT_OK editor_star_inequality"

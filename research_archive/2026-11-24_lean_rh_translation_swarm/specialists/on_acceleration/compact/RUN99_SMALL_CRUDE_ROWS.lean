import C2ExactReciprocalBudget
import New.Exchange.CrudeRows
import Lean

/-!
RUN99 acceleration — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION and recent peer changes read. Do not
duplicate selected-record transport, the sign proof or the C2 cache repair.
Distinct next step: sharpen the ACTUAL crude_rows producer, not just the
same completion scalar inequality.

Source CrudeRows e84f4b0e67ed7dbfd727f8ec2dbf05a8d1e5440c, GridMove c1cb8b1e2cf780d03ae869204320c3f25573cc02,
Hook ab7abf3a41078f15118fab5fc04a07523a0c1c2f,
Magnitudes 306fe7e22378322422d11b1f8415fcdac75ffd6e,
AdmissibleData 04208a5044bb7cf6464ef142a14d939148bed834.
Existing exact completion 3246d8ef051ac8d138be5fc3649af1cb8132ea1a, reciprocal daa6714e88afb7277734fda3dc09f4f037286e2a,
weak spread star 9ccc4b1b62363a952d2ea19dfd6de1c1a8d51593 (a20fc159). Earlier relaxed-filling and
sector notes read; they retain x1^2*b^2 in C completion.

Native crude_rows proof ends with a HasLogBound weakening to x1^2*b^2.
The explicit preceding bounds do not require that large exponent:
endPeriod_le has exponent x^200*b^2, N has log <= x^99*b^2,
the input short basis has squared norm <= exp(x^99*b^2), and
hookNumber_le bounds the hook by L0^(3*L0) with L0=b1*r^4
(boxes_endWeightData_le). Its log <=3 L0 log L0 <= x^99*b^2:
log L0 <= log b+20 log x+14 by native Magnitudes;
log b >= 10^12 log x, x>1, so the b factor absorbs log L0
and the x^99 slack absorbs constants. The existing proof already
cancels sqrt(weylNormSq w); the resulting squared norm cap has
log <= 2*x^200*b^2+5*x^99*b^2 <= x^210*b^2 (even x>=2).
This keeps the same common twist scalar, integral witnesses, span,
and all conjugates. Candidate proof reuses the original final
HasLogBound tactic against x^210*b^2; this smaller comparison must
actually compile. Do not infer this from the original larger bound.

Consequently replace only the crude-row part of the exact completion:
  Unew = x^210*b^2 + x^99 + 4*m^2*t*x^999.
Same C witnesses give d(H-L-E)<=n(H-S+L)+2delta+(d-n)Unew.
Using the already prepared integration caller with q=b*x^200
instead of b*sqrt(b), require eta=1/(4q).
L=f*a*(log b)^4 >= b*x^12*(log b)^4.
qL >= b^2*x^212*(log b)^4, absorbs L+Unew+b^2*x^99:
the E term is <=60*x^1005 (m<=2sqrt(x), t<=15x^5),
and log b>=10^12 log x. L's upper exponent is
log b+12log x+(21/5)log(log b)+P.c+1, also strictly dominated.
2<=q, 4q<=b^2; the same A/B index and all-conjugate bounds apply.
n>=(1-1/q)d. The actual star conclusion is unchanged.
Relative to a20fc159 the allowed spread error increases by
sqrt(b)/x^200; relative to native b^-2 it increases by b/(4*x^200).
No claim that the weaker moment/spread itself is proved or that
any earlier dependency is globally removed. Do not replace the
native C theorem by this candidate before its full replay.

Executed: 12 unique source transformations, all reverse
round trips exactly restored the pre-transform text. Source-only,
not kernel verification. Latest shared compute run 46128377765
in_progress; no new proof receipt inferred. No fresh Lean engine,
rh_scan/prune/reduce/auto/frontier, or graph PASS claimed.
Existing original/reduced graphs, axioms and obligations retained.
Do not start a duplicate cold build or alter protected workflows.

RESUME HERE: compile THIS file as Run99SmallCrudeRows in the retained
authenticated C2ExactReciprocalBudget workspace; inspect the first
actual diagnostic at the smaller final crude_rows HasLogBound bound,
then audit the six new constructor-inclusive roots and exact supplier
guards before handing the new spread target to B3/B4. Preserve native
fallback and every missing primitive. HANDOFF integration / character
boxes / audit / kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

section
open Fintype Function Matrix MeasureTheory Real Space Submodule
variable {P : Parameters} (D : Data P)

lemma Data.run99_crude_rows_small : ∃ c : _ → ℂˣ, D.CostsSquares (2 * D.m * D.m) (c ·) ∧ span ℂ {y |
    (∀ ϑ l [Fact l.Prime] ι, l.Coprime ϑ.levelNorm →
  (c ϑ / c 1 : ℂ) • D.iotaAtLevel ϑ y ∈ LevelPlaces.LevelForm.integralForms (l := l) ι) ∧
  ∀ (σ : ℂ ≃+* ℂ) g, weylNormSq (σ ∘ (D.ι .one y).1 g) ≤ exp (D.x ^ 210 * D.b ^ 2)} = ⊤ := by
  choose Λ q g α r R J using D.exists_isTidy_integral_eq_gridPeriod; choose N n C B using
    D.exists_mul_endPeriod_mem_embValRing
  choose c hc H using D.gridPeriod_climb le_rfl; choose Φ hΦ H using H _ Λ q
  choose A L l m o using
    exists_dual_pairing_of_isHCParam D.isHCParam_Y ((D.endWeightData _).2.2.2 0 bot_le)
  choose β H using H _ (D.gridPeriod_eq_endPeriod Φ) g; use c, hc, eq_top_mono ?_ R
  simp_rw [H] at J; set β := α * β
  choose t f using show Associated β (β / β) by by_cases β = 0 <;> simp [*]
  choose a b _ using boxes_endWeightData_le
  let e := (D.gridSpace 0 ..).algFormEquiv ((D.endWeightData true).2.2.2 0 bot_le)
    (principalLevel _ D.gridLevelGen)
  let ξ ϑ x v : levelSpace (algFormRep (D.endWeightData false).1 (endDetExp false 0))
    (levelY ϑ D.m) := deltaForm _ _ 1 x v
  let Ξ ϑ x v := (D.endToAlgForm false).symm (ξ ϑ x v).1
  have h' ϑ x v : D.endToAlgForm _ (Ξ ϑ x v) = _ := (endToAlgForm ..).4 _
  erw [r.range_eq_map, ← e.range, e.range_eq_map, ← span_isShort_eq_top (B :=
    (D.x ^ 99 * D.b ^ 2).exp) (classAut_eq_bot_of_le_chosenLevel (principalLevel_le_chosenLevel
    piGBar_dvd_gridLevelGen) (a _ zero_le)) P.cycloConductor_mem_different (by grw [b, a] <;> simp)
    (by grw [shortBasisConst, a _ zero_le]; exact le_exp_of_log_le D.le_of_hasLogBound), map_span,
    e.image_eq_preimage_symm, map_span_le]
  have E ϑ x v (φ : D.gridLevelForms _) : FixedByEndLevels ϑ (·.rec (Ξ ϑ x v) φ.1) := Bool.rec
    (h' .. ▸ levelSpace_anti (Subgroup.map_mono fun k b ↦ funext fun i ↦ by simpa using! (congrArg
    (·.1.map (modulusResidue _ (places_levelModulus.ge ⟨i, rfl⟩))) b)) (ξ ..).2)
    (levelSpace_anti (endLevel_le_principalLevel ..) (e.symm φ).2)
  have δ (η : ℤ) ϑ x v φ : v ⬝ᵥ A.map (↑) *ᵥ (((c ϑ).1 / c 1) • D.ι ϑ ((t.1 * c 1 * η * N / card
    (WeylIndex (D.Y D.m) D.columnsY)) • r φ)).1 x =
    η * (β / β * (N * endPeriod (Φ ϑ) (·.rec (Ξ ϑ x v) φ.1))) := by
    obtain ⟨p, q⟩ := J ϑ (Ξ ϑ x v) φ, ((D.iotaAtLevel ϑ (r φ)).algFormRep_eq_self_of_mem (k := ·))
    erw [← ofAlgForm_toAlgForm D.isHCParam_Y (liftChainY _ _ _),
      integral_mul_eq_classIntegral D.isHCParam_Y (D.levelY ϑ _) (isAutomorphic_algFormCoeff _) _
      (l _ _), classIntegral_eq_classSum, classSum_deltaForm fun _ ↦ .mk' (· ⬝ᵥ _) (by simp)] at p
    simpa [← f, n, field, -card_pi, mul_comm (c ϑ).1, mul_assoc] using! congr(η * N * $p)
    intros; rw [levelSpace_smoothFormRep_apply (χ := 1) (by simpa)]; simpa using! L ..
    intro _ h g; simpa using! congr($((ξ ..).2 ⟨_, h⟩).1 g ⬝ᵥ _ *ᵥ $(q _ h).1 g)
  refine fun φ k ↦ (smul_mem_iff _ ?_).1 (subset_span ⟨fun ϑ p _ _ q ↦
    weylGauge_le_one_of_integralAbove _ fun x _ i ↦ congr($(mul_left_cancel₀ (by simp)
    (congr($(m.choose_spec _) i).symm.trans (δ ..))) ∈ embValRing).mpr (mul_mem
    (by simp [div_self_le_one]) (B (hΦ ϑ) (E ϑ x _ φ) q (Bool.rec (fun y ↦ h'
    .. ▸ (weylGauge_deltaForm_le (by simp)).trans <| by simp [IsUltrametricDist.norm_intCast_le_one,
    weylGauge_le_one_iff, *]) (by simpa using! k.1 p ·)))), fun σ x ↦ (o _).elim fun w ⟨u, v⟩ ↦
    u ▸ ?_⟩)
  simp [n, -card_pi]
  have s := D.endPeriod_le (hΦ 1) (E 1 x (σ.symm ∘ w) φ) σ (B := (ite · (D.x ^ 99 * D.b ^ 2).exp
    (weylNormSq w))) (Bool.rec (fun _ ↦ h' .. ▸ (weylNormSq_deltaForm_le (by simp) ..).trans
    (by simp [D.classAut_eq_bot_of_le_chosenLevel (levelY_le_chosenLevel ..) (a false zero_le),
    comp_def])) (k.2 σ))
  have e := congr(‖$((PolyRep.coe_weylNormSq w).trans ((v w).symm.trans (.trans
    (by simp [dotProduct, mulVec]; rfl) congr(σ $(δ _ 1 _ (σ.symm ∘ w) _)))))‖).le
  simp [abs_of_nonneg, ← mul_assoc, le_of_lt] at e s
  nth_grw 1 [hookNumber_le (by exact b false zero_le), div_self_le_one, s, C, ← mul_assoc,
    ← mul_assoc, mul_right_comm] at e
  exact (sqrt_le_iff.1 (div_sqrt ▸ div_le_of_le_mul₀ (by simp) (by positivity) e)).2.trans
    (le_exp_of_log_le (by simpa [log_mul, ← exp_half, NeZero.ne] using D.le_of_hasLogBound))
end

section
open Finset LinearMap Real Submodule LevelPlaces.LevelForm
variable {P} {D : Data P} {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y) (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i I hV

lemma Data.run99_heightLe_volume_rows_small {θ} (o : D.IsFitFamily θ) :
    HeightLe (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x ^ 210 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999))
      fun ι ↦ D.𝔷 (θ ι) / D.𝔷 (1 : D.MFoldTwist) := by
  obtain ⟨⟨e, he, I⟩, γ, hγ, s⟩ := I, D.run99_crude_rows_small
  -- the basis: `z a` is the good part of the auxiliary form `ψ a`
  choose k z ψ J c using exists_extend_basis_of_span_eq_top i ((s ▸ span_image
    (D.goodProjTranslate 1)).trans (by simp [range_smul, NeZero.ne, Module.End.one_eq_id]; rfl))
  choose ψ hψ ez using ψ
  -- size and completion; the matrices of the index, extended by the scalar of the auxiliary forms
  refine (one_determinant D.Θ (by simp) J (by simpa) (fun _ ↦ norm_map_det_gram_le fun σ ↦
    Sum.comp_elim .. ▸ covolumeSq_elim_le (ez · ▸ normSqAt_goodProjTranslate_le ((hψ _).2 σ))
    (hV σ)) (by simp) (hγ θ o) he (fun _ j ↦ (integralForms ⟨j⟩).carrier) k (fun ι j _ a _ b ↦ ?_)
    fun ι j ↦ (I _ ⟨j⟩ _ (o.1 ι)).imp' ((algebraMap ..).mapMatrix · |>.fromBlocks 0 0 ((γ (θ ι) /
    γ 1 : ℂ) • 1)) fun _ ↦ .imp (by grw [·]; simp [← RingHom.map_det, -RingHom.mapMatrix_apply])
    (by simpa [Matrix.one_apply] using! And.intro · fun a ↦ ez a ▸
    goodProjTranslate_mem_integralForms ⟨j⟩ ((hψ a).1 _ _ ⟨j⟩ (o.1 ι)) 1)).mono (by
    have hc : (D.rowDim : ℝ) = (n : ℝ) + (k : ℝ) := by exact_mod_cast c
    have hk : (k : ℝ) = (D.rowDim : ℝ) - (n : ℝ) := by linarith only [hc]
    apply le_of_eq
    push_cast
    rw [hk]
    ring) fun _ ↦ le_rfl
  simpa using (norm_inner_le_one _ _ ⟨j⟩
    (fun g ↦ by erw [D.classAut_eq_bot_of_le_chosenLevel (Subgroup.map_mono fun _ h ↦
    funext fun _ ↦ (h (.inl _) ⟨⟩).2) (by bound [D.card_Y_le .refl])]) a b :)

include i I hV in
lemma Data.run99_integral_forms_long_small :
    D.rowDim * (D.mainHeight - D.logB * D.budget -
      (D.m : ℝ)^2 * D.t * D.x^999) ≤
      V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x ^ 210 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999) := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x ^ 210 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999)) +
      2 * D.rowDim * (D.logB * D.budget - D.mainHeight +
        (D.m : ℝ)^2 * D.t * D.x^999) :=
    c2_heightLe_nonneg_arch ((((Data.run99_heightLe_volume_rows_small i I hV o).pow 2).mul
      (Data.run96_heightLe_volume_ratio_sq_exact o)).mono le_rfl
      (by simp [field]; simp [(Z _).1]))
  linarith only [formula]
end

section
open Finset LinearMap Real Submodule LevelPlaces.LevelForm Module Filling
namespace RHAcceleration99

variable {P} (D : Data P)

noncomputable def slackScale : ℝ := D.b * D.x ^ 200

noncomputable def weakEta : ℝ := (4 * slackScale D)⁻¹

theorem enough_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    0 < finrank ℂ D.Column ∧ 0 < D.rowDim ∧
      ∃ t, #t * finrank ℂ D.Column ≤ 5 * D.rowDim * log (1 + D.b ^ 2) ∧
        (1 - 1 / slackScale D) * D.rowDim ≤
        finrank ℂ ↥(⨆ s ∈ t, (D.projectedPoincare s).range) := by
  have := D.columnCoords.nontrivial
  have hq : (2 : ℝ) ≤ slackScale D := by
    unfold slackScale
    exact D.le_of_hasLogBound
  have hqpos : 0 < slackScale D := by linarith
  have he : 0 < weakEta D := by
    unfold weakEta
    positivity
  have hehalf : weakEta D < 1/2 := by
    unfold weakEta slackScale
    exact D.lt_of_hasLogBound
  have hqb : 4 * slackScale D ≤ D.b ^ 2 := by
    unfold slackScale
    exact D.le_of_hasLogBound
  have heq : 4 * weakEta D = 1 / slackScale D := by
    unfold weakEta
    field_simp [ne_of_gt hqpos] <;> ring
  have hlog : log (1 + (weakEta D)⁻¹) ≤ log (1 + D.b ^ 2) := by
    unfold weakEta
    rw [inv_inv]
    exact Real.log_le_log (by positivity) (by linarith)
  have hr : finrank ℂ D.rows ≠ 0 := by
    intro hz
    obtain ⟨s, h⟩ := hs 1 ⊤
    have hv : (0 : ℝ) < finrank ℂ D.Column := by
      exact_mod_cast (finrank_pos : 0 < finrank ℂ D.Column)
    simp [finrank_top, hz] at h
    nlinarith only [h, mul_pos (show 0 < 1/2 - weakEta D by linarith) hv]
  refine ⟨finrank_pos, hr.pos, (exists_few_translates (W := D.rows) he (hs _)).imp fun t h ↦ ?_⟩
  refine ⟨h.1.trans (mul_le_mul_of_nonneg_left hlog (by positivity)), ?_⟩
  rw [heq] at h
  exact h.2.trans (mod_cast finrank_mono (iSup₂_mono fun _ _ _ ⟨φ, e⟩ ↦ ⟨⟨_, φ, rfl⟩, e⟩)))

theorem family_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    ∃ n, ∃ y : Fin n → D.rows, LinearIndependent ℂ y ∧
      (1 - 1 / slackScale D) * D.rowDim ≤ n ∧
      (∃ δ ≤ 5 * D.rowDim * log (1 + D.b ^ 2) * D.budget, D.IndexLe y δ) ∧
      ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤
        exp (n * (D.mainHeight - D.m * D.remainder + D.logB * D.budget)) := by
  obtain ⟨⟨q, q0, B, hB, ⟨S, hS, sp, size⟩, index⟩, -, -, t, ht, big⟩ :=
    D.short_forms, enough_of_weak_spread D hs
  let Y := Set.image2 (B ·) t S
  obtain ⟨y, hy, -, i⟩ := exists_fun_fin_finrank_span_eq ℂ Y
  rw [(by simp [Y, ← Set.iUnion_image_left, span_iUnion₂, sp]
          simp [hB, range_smul, q0.ne'] : iSup _ = span ℂ Y)] at big
  exact ⟨_, y, i, big, ⟨_, mul_le_mul_of_nonneg_right ht (HasLogBound.pos D).le, index t _ y
    (Set.image2_subset_left hS <| hy ·)⟩, fun σ ↦ covolumeSq_le
    (have ⟨s, _, φ, h, e⟩ := hy ·; by simpa [e] using size φ h s σ)⟩

theorem star_of_weak_spread
    (hs : ∀ c : ℂˣ, IsSpread
      (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (weakEta D)) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget := by
  obtain ⟨n,y,i,big,⟨δ,index,I⟩,short⟩ := family_of_weak_spread D hs
  let d : ℝ := D.rowDim
  let q := slackScale D
  let H := D.mainHeight
  let L := D.logB * D.budget
  let E := (D.m : ℝ)^2 * D.t * D.x^999
  let U := D.x^210 * D.b^2 + D.x^99 + 4*E
  let S := (D.m : ℝ)*D.remainder
  let J := 10*log (1+D.b^2)*D.budget
  have hd : 0 < d := by exact_mod_cast (enough_of_weak_spread D hs).2.1
  have hq : 2 ≤ q := by
    dsimp [q, slackScale]
    exact D.le_of_hasLogBound
  have hqp : 0 < q := by linarith
  have hL : 0 < L := HasLogBound.pos D
  have hJ : 0 ≤ J := by
    dsimp [J]
    exact mul_nonneg (mul_nonneg (by norm_num) (log_nonneg (by nlinarith))) (HasLogBound.pos D).le
  have hE : E ≤ L := by
    dsimp [E,L]
    exact D.le_of_hasLogBound
  have hH : -H ≤ D.b^2*D.x^99 := by
    have h := D.abs_mainHeight_add_remainder_le
    have hm : (0 : ℝ) ≤ D.m := by positivity
    dsimp [H]
    linarith only [h, neg_le_abs D.mainHeight, mul_nonneg hm (abs_nonneg D.remainder)]
  have hW : L+U+D.b^2*D.x^99 ≤ q*L := by
    dsimp [q,slackScale,L,U,E]
    exact D.le_of_hasLogBound
  have hg0 : 0 ≤ d - (n : ℝ) := sub_nonneg.2 (mod_cast Fintype.card_fin n ▸
    i.fintype_card_le_finrank : (n : ℝ) ≤ D.rowDim)
  have hg : d - (n : ℝ) ≤ d/q := by
    change (1-1/q)*d ≤ (n : ℝ) at big
    nlinarith only [big]
  have hh : d/q ≤ d/2 := (div_le_iff₀ hqp).2 (by
    have h := mul_le_mul_of_nonneg_left hq (show 0 ≤ d/2 by positivity)
    nlinarith only [h])
  have hn : 0 < (n : ℝ) := by linarith [hg.trans hh]
  have hprod : (d-(n : ℝ))*(L+U-H) ≤ d*L := calc
    _ ≤ (d-(n : ℝ))*(q*L) := mul_le_mul_of_nonneg_left (by linarith only [hH,hW]) hg0
    _ ≤ (d/q)*(q*L) := mul_le_mul_of_nonneg_right hg (by positivity)
    _ = _ := by field_simp [ne_of_gt hqp] <;> ring
  have hidx : 2*δ ≤ d*J := by
    change δ ≤ 5*d*log (1+D.b^2)*D.budget at index
    dsimp [J]
    nlinarith only [index]
  have hC := Data.run99_integral_forms_long_small i I short
  change d*(H-L-E) ≤ (n : ℝ)*(H-S+L)+2*δ+(d-(n : ℝ))*U at hC
  have hcost : (n : ℝ)*(S-2*L) ≤ d*(2*L+J) := by
    nlinarith only [hC,hprod,hidx,mul_le_mul_of_nonneg_left hE hd.le]
  have hdn : d ≤ 2*(n : ℝ) := by linarith [hg.trans hh]
  have hcost' := hcost.trans (mul_le_mul_of_nonneg_right hdn (show 0 ≤ 2*L+J by positivity))
  have hS : S ≤ 6*L+2*J := le_of_mul_le_mul_left (by nlinarith only [hcost']) hn
  exact hS.trans (by dsimp [L,J]; exact D.le_of_hasLogBound)

end RHAcceleration99

#print axioms RHAcceleration99.enough_of_weak_spread
#print axioms RHAcceleration99.family_of_weak_spread
#print axioms RHAcceleration99.star_of_weak_spread
end

#print axioms Data.run99_crude_rows_small
#print axioms Data.run99_heightLe_volume_rows_small
#print axioms Data.run99_integral_forms_long_small

open Lean in
run_cmd do
  for (root, required, forbidden) in #[
    (``Data.run99_crude_rows_small,
      #[``Data.endPeriod_le,``Data.exists_mul_endPeriod_mem_embValRing,``hookNumber_le],
      #[``Data.crude_rows]),
    (``Data.run99_heightLe_volume_rows_small,
      #[``Data.run99_crude_rows_small,``one_determinant],
      #[``Data.audit_heightLe_volume_rows_exact,``Data.heightLe_volume_rows]),
    (``Data.run99_integral_forms_long_small,
      #[``Data.run99_heightLe_volume_rows_small,``Data.run96_heightLe_volume_ratio_sq_exact],
      #[``Data.run96_integral_forms_long_exact_reciprocal,``Data.integral_forms_long]),
    (``RHAcceleration99.enough_of_weak_spread, #[``exists_few_translates],
      #[``Data.enough_forms]),
    (``RHAcceleration99.family_of_weak_spread,
      #[``Data.short_forms,``RHAcceleration99.enough_of_weak_spread],
      #[``Data.exists_family_covolumeSq_le]),
    (``RHAcceleration99.star_of_weak_spread,
      #[``Data.run99_integral_forms_long_small,``RHAcceleration99.family_of_weak_spread],
      #[``Data.integral_forms_long,``Data.run96_integral_forms_long_exact_reciprocal])] do
    let info ← getConstInfo root
    let some v := info.value? (allowOpaque := true) | throwError "RUN99 missing proof {root}"
    let deps := v.getUsedConstants
    unless required.all (fun x => deps.contains x) && forbidden.all (fun x => !deps.contains x) do
      throwError "RUN99 unexpected direct supplier graph {root}"
    let axs ← collectAxioms root
    unless axs.all (fun x => #[``propext,``Classical.choice,``Quot.sound].contains x) do
      throwError "RUN99 unexpected axiom {root}: {axs}"
  logInfo "RUN99_SMALL_CRUDE_ROWS_GUARDS_OK"

import New.Rows.Carrier
import C2Caller

/-!
# RUN79 — propagate the actual equal-rank replacement to both Carrier consumers
27 November 2026. C2 / character boxes. SOURCE-MATCHED / PREPARED,
not native checked. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
30924a758e7dc18f58e424b5e54c7d21f4b060e2, live obligations
7a20a39bd945378ed2daab0953e9b65571d0a196. AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol, continuity,
current registry, latest orchestrator and peer commits through cd700332 read.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin
40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Original source (relative to grh-compact/src):
 New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d
 New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a
 New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40
 New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88
 New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1
 New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a

Reuse RUN78 (70b2bd10, blob 6bb8f53e746aa4d5c876c7eff3433e6daf126795)
and integration/replay_c2_built_workspace.py (blob a50abb1af4fa8f0f67a7030f8111e75fe065fd08).
The shared runner already adapts info.value? (allowOpaque := true) and full
axiom names (peer 06486f1e); do not edit the original pinned candidate.
Current C2 manifest 8f6ffb7b5ff829258d15d9fc8ff99ad1870d6fbc is preflight
only. Actual current B2 run 46006832164 in_progress; the verified seven
B2 declarations are not C2 receipts. No parallel heavy build scheduled.

## New result: propagate, rather than rederive
The complete four original-statement declarations below are the actual
source bodies with only the declaration names and explicit supplier names
changed. Each of the 9 replacements was unique; reverse substitutions
restored all four exact source blocks byte-for-byte (apart from trailing
newline). No original hypotheses, quantifier, finite modulus guard,
character lift, measure normalization, or arbitrary-partner consumer is
removed. No new scalar simulation. This is a caller propagation candidate,
not a new proof of the common theta suppliers.

Original local graph:
 stdClassSum_carrierXi_eq_carrierForm -> stdClassSum_det_modKernel_eq,
 explicit_matching; determinant caller -> explicit_matching;
 explicit_matching -> exchange_theorem -> exists_equalRankThetaRatio_value
 and exchange_of_partners; equal-rank itself -> exchange_of_partners twice.
Reduced local graph:
 run79 carrier -> run79 determinant and run79 explicit -> run79 exchange
 -> run78_equalRankThetaRatio_value -> RHCharacterBoxes77.exchange_of_standard_pairs.
 The general exchange_of_partners edge at run79_exchange_theorem is
 deliberately retained. The original fallback remains in RUN78. Original
 source graph and all unresolved axioms retained, no global pruning claim.
The caller guards below require the new edges and reject direct use of the
superseded old declarations (including own original target). They do not
establish transitive absence of the general exchange, which remains used.
All four statements are checked for definitional equality when replayed.

Separate RUN76 no-flip standard_prefix and peer integration RUN79 fab4aba0
determinant-only route are alternatives, not multiplied reductions.
That narrower direct route's rank-zero vacuum and finite cutoff are already
audited in RUN76; reuse, do not reopen. Here we propagate RUN78 through the
GENERAL Carrier interface, preserving all arbitrary partners at the outer
caller. This also carries to the carrierXi consumer, not merely rank two.

C2 downstream frontier (source inspection, not new proof):
 ComparisonForms.exists_comparison_forms uses a common nonzero gamma,
 surjective A and u*gl=gamma A. LiftVolumeHeight requires testedness,
 integral forms away from twist, the archimedean bound, both compressed
 Gram determinant inequalities and the inverse Hecke-value height. RowVolume
 requires the triangle and common Hecke/Rallis supplier. The two signed
 height budgets are not supplied by this file. No new root retirement.
Context cache key: compact pin + exact theorem type + caller + all finite
modulus/tame premises + same rapid and normalization data. No URT claimed.

Verification executed in this run: authenticated the three upstream/peer
blobs above and performed exact reversible source substitutions, checked
all source anchors and absence of proof placeholders in the four copied
bodies. Local lean/lake absent. Native rh_scan/rh_prune/rh_reduce/rh_auto/
rh_auto_frontier not executed. Kernel/type/axiom/dependency status remains
PREPARED, not PASS. Preserve old-pin and compact receipts separately.

RESUME HERE: use the existing shared C2 workspace after B2. First run the
existing C2 replay with --build only if needed. On a successful original
RUN78 candidate receipt, emit its ADAPTED C2Caller.lean as C2Caller.olean
using lake env lean with the same project options, full names, -R <out>
and -o <out>/C2Caller.olean. With LEAN_PATH extended by <out>, build
+New.Rows.Carrier:olean if missing and check this file. Require exit 0,
four exact-type/edge guards and the four standard axiom reports, then
scan the new and original root frontiers with compact-compatible tools.
Do not report this candidate integrated until actual logs confirm it.
HANDOFF TO: integration, native runner, editor and formal audit.
-/

set_option pp.fullNames true

section
open RingHom Fintype Modulus IsLinearMap
variable {E} [Field E] [CMType E] [WeilData E] {n a b} [Fintype n] [Fintype a] [Fintype b] {s t t'}
  (W : Space E n s) (V : Space E a t) (V' : Space E b t')

lemma run79_exchange_theorem σ (hs : negCount s = negCount t + negCount t') {e} (he : card a =
  card b + 2 * e) (hn : 2 * negCount s + 2 ≤ card n) {μ : _ → ℤ} (hμ : ∀ v,
  card n ≤ 2 * μ v + 2 * negCount s) {v} (hv : IsRapidDatum v) : ∃ C x, IsRapidDatum x ∧ ∀ 𝔪 ν χ,
  IsTameFor 𝔪 ν μ χ → let γ := rankTwist ν⁻¹ n; ∃ c ≠ 0, ‖c‖ ^ 2 = C * lValueProd 𝔪.places ν e
    ∧ ∀ Φ Ψ, IsPartner ⊤ σ χ Φ Ψ → ∀ g, thetaIntegral W V γ 1 (modDatum W V 𝔪 Φ x) g =
    c * ∫ h, pairTheta V' W γ γ (modDatum _ W 𝔪 Ψ v) (h, g) ∂V'.quotMeasure := by
  have ⟨_, r₀, C₀, _⟩ := run78_equalRankThetaRatio_value W μ (card n / 2 - negCount s) ?_ ?_
  have ⟨C, x, r, H⟩ := exchange_of_partners V' μ (removePlanes _ W) V σ r₀ hv ?_ ?_
  use C₀ / C, x, r, fun 𝔪 ν χ ⟨h, ψ, a₁, a₂, a₃⟩ ↦ ?_
  have o := 𝔪.places.toFinite.coe_toFinset
  let 𝔠 := SplitTameChar.mk ν ψ a₁ _ (by simpa using! h) (by simpa using! 𝔪.not_le_star) (o ▸ a₂) ?_
  obtain ⟨⟨c, hc, H⟩, l, _, m, _, ρ, _, k, k'⟩ := H 𝔠, lValueProdInt_pos 𝔠 e, o ▸ 𝔠.readsAt
  simp +arith [*, ← card_congr σ, Int.add_mul_ediv_left] at hc
  simp [lValueProdInt, lValueProd.eq_1 _ _ 0] at *
  use c, by grind [norm_zero], by grind, fun Φ Ψ P ↦ ?_
  let π := ((evalPlaces 𝔠.S).restrict _ _ evalPlaces_mem_O).liftOfRightInverse
    (⟨_, by simpa [← k', *] using m <| ρ ·⟩) (Subtype.ext <| k ·) ⟨𝔪.reduction, fun x hx ↦
    (𝔪.reduction_congr (y := 0) (congr($hx.1 ⟨·, o.ge ·⟩))).trans (map_zero _)⟩
  have e i u : modulusResidue _ (o.le i.2) (π u) = residueAt i u :=
    (modulusResidue_reduction ..).trans congr(⟦⟨$(k u) i, _⟩⟧)
  have d {n n' : Type} [Fintype n] [Fintype n'] Φ : 𝔪.liftFn (Φ ∘ @vecToMat n n' _) =
    (liftIntegralFn π Φ <| vecToMat <| evalPlaces
    _ ∘ ·) := by ext; erw [liftFn_apply, mk'_apply]; congr! <;> simp [vecToMat, m, ← k']; rfl
  simpa [modDatum, 𝔠, *] using! H _ _ (by simpa [Function.comp_def, *] using (d Ψ ▸
    isSchwartzBruhat_liftFn .. :).locally_constant.comp_continuous (f := (ρ ∘ matToVec ·)) (by
    fun_prop [matToVec])) (P.lift_of_reduction π ⟨fun u h ↦ isUnit_iff_residueAt_ne_zero.2
    (e · u ▸ (h.map _).ne_zero)⟩ (𝔪.reduction_surjective.forall.2 fun _ ↦
    ⟨_, liftOfRightInverse_comp_apply ..⟩) (by
    simp_intro .. [← finprod_comp_equiv (Set.equivOfEq o),
    a₃, charOfTamePart, ← e, 𝔠.localChar_apply_of_isUnit, finprod_eq_prod_of_fintype]; rfl))
  repeat grind [card_sum, card_congr σ, card_unit]

end

section
seal Finset.univ Finset.sum Finset.prod
open Subgroup Fintype IsLevel MatMul Matrix MeasureTheory Space WeilData Ideal.Quotient

variable {E n b : Type} [Field E] [CMType E] [WeilData E] [Fintype n] [Fintype b] {𝔪}

lemma run79_explicit_matching {E} [Field E] [CMType E] [WeilData E] {n m a b p l} [Fintype n] [Fintype m]
  [Fintype a] [Fintype b] [Fintype p] [Fintype l] {s} (W : Space E n s) (f : p ⊕ l ≃ b) (V' : Space
  E _ (blockSigns f)) σ e (j : m ⊕ l ≃ n) (hj : s = blockSigns j) {d} (hd : card a = card b + 2 * d)
  (hn : 2 * card l + 2 ≤ card n) ι [∀ τ, Fintype (ι τ)] : ∃ C, ∀ {𝔪 α γ χ}, IsTameFor 𝔪 α γ χ →
  (∀ τ, γ τ = card l - card (ι τ)) → ∃ c, ‖c‖ ^ 2 = C / lValueProd 𝔪.places
  (α⁻¹ * upsilonU1 ^ (card b + d)) d ∧ ∀ η {Φ Ψ}, IsPartner ⊤ σ χ⁻¹ Φ Ψ → ∀ β g, c * stdClassSum
  (Kf E a) (modKernelI W α β 𝔪 Φ (renameRowsCols id (j ∘ .inl) (stackedDetProd e η)) g ·) = ∫ x,
  modKernel V' W (α / β) α 𝔪 Ψ (matchedPoly (ι := ι) f j η) x g ∂V'.quotMeasure := by
  subst_vars
  choose Q₀ κ hκ using real_matching f j e (ι := ι) rfl; have := card_congr σ ▸ card_sum
  apply (run79_exchange_theorem W _ V' σ _ hd _ _ (weightedNorm_polyVector_ne_top · Q₀)).elim
  rintro C ⟨x, -, H⟩; constructor
  intro 𝔪 α _ χ hα@⟨o, _, _, _⟩ hγ; cases funext hγ
  choose c _ q hc using H 𝔪 _ _ (hα.inv.mul (hasWeight_upsilonU1_pow _))
  use κ x / c, by rw [norm_div, div_pow, q, div_div], fun η Φ Ψ hP β g ↦ ?_
  obtain ⟨⟨L, hL⟩, hv⟩ := (pairThetaKer W (stdSpace E a) α 1).swap.exists_clm_lift
    (isAutomorphic_const _ 1).mem_rapidFunctions, realPairWeil_stackedDetProd j e rfl η 1
  simp [rankTwist, Space.lift, ↓mul_inv,
    (by omega : card n / 2 = card b + d), -Prod.forall] at hc hL hv
  change ∀ f g, thetaIntegral .. = _ at hL; specialize hκ x
    ((L · ∘L .flip (integrated _) _) ∘ (g * ⟨·, 1⟩)) (c • ⟨⟨(∫ x, modKernelBilin V' W α α 𝔪 x g
    Ψ · ∂V'.quotMeasure), by simp [integral_add, map_add, (isRapid_modKernel V' W α α
    o (hP.2 · · |>.elim (by grind [invFirstRows_mul_firstCols σ ·])) _ g).integrable
    (by fun_prop [modKernel])]⟩, by simp⟩) (by simp [← hL, ← pairWeil_integrated _ _ α 1,
    thetaIntegral_pairWeil, mul_assoc]) (fun x Q h ↦ (hL .. ▸ hc _ _ hP _).trans
    (by simp [modKernel, modDatum, ← h, ← pairWeil_integrated_right α α, ← pairTheta_mul])) η
  erw [← hL, thetaIntegral, integral_quotMeasure_eq_classSum (f :=
    modKernelI W α 1 𝔪 Φ _ g) (pairThetaKer ..).swap.theta_rat_mul
    (fun _ ↦ integral_eq_const (.of_forall fun x ↦ ?_)) (Kf ..) ?_] at hκ
  rw [division_def α, ← one_mul β, ← mul_one α]
  simpa [↓modKernel_twist, ← mul_classSum, field] using hκ
  intro k m _; rw [modKernelI, modKernel_mul_Kf_right (k := ⟨k, m⟩), hα.apply_det]; congr with
  simpa [χ.inv_apply, Ring.inverse_inverse] using hP.left_mul (inv_mem (by simp [mem_intGL]))
  rw [modKernelI, modKernel, modDatum, ← hv x, ← pairWeil_integrated_right α, ← pairTheta_mul]
  repeat simp [negCount] <;> lia

attribute [local simp] carrierForm Modulus.disjoint_places_star Modulus.liftFn_one Space.lift
  name_boxIndicator carrierXi modDatum letterMinor stackedDetProd pairedDetProd matchedPoly
  pairTheta pairWeil

variable (E) {m : ℕ} [NeZero m]

lemma run79_stdClassSum_det_modKernel_eq (he : Even m) (c : _ → ℕ) : ∃ C, ∀ {𝔪 α χ},
  IsTameFor 𝔪 α (-c ·) χ → ∃ γ, ‖γ‖ ^ 2 = C / lValueProd
  𝔪.places (α⁻¹ * upsilonU1 ^ (m / 2)) (m / 2) ∧ ∀ g, γ * stdClassSum (Kf E (Fin m))
  (modKernelI (stdSpace ..) α α 𝔪 (χ ·.det) (∏ τ, letterMinor τ id id ^ c τ) g) = 1 := by
  choose C H using run79_explicit_matching (stdSpace E (Fin m)) (.sumEmpty Empty Empty) (stdSpace ..)
    (.emptySum ..) (.emptySum ..)
    (.sumEmpty ..) rfl (d := m / 2) (by simp; grind) (by simp; grind [NeZero]) (Fin <| c ·)
  refine' ⟨_, (H · (by simp) |>.imp' (· / ∫ _, 1 ∂quotMeasure (stdSpace E Empty)) fun γ ↦ .imp (by
    simpa [div_pow, ·] using div_right_comm ..) fun H g ↦ _)⟩
  field [measureReal_univ_ne_zero]
  convert! H 0 (partner_block _ _ 1) .. <;> simp [modKernel, vacElem_apply_eq_prod_lineTheta,
    @Subsingleton.eq_one (G ..), stackedDet,
    ← det_reindex_self (.emptySum ..), det_apply, ← Pi.one_def, funext_iff, prod_empty]

lemma run79_stdClassSum_carrierXi_eq_carrierForm (he : Even m) : ∃ C, ∀ {𝔪 c χ}, IsTameFor 𝔪 c 0 χ →
  ∃ γ, ‖γ‖ ^ 2 = C / (lValueProd 𝔪.places (c⁻¹ * upsilonU1 ^ m) m * lValueProd 𝔪.places
  (c * upsilonU1 ^ (m / 2)) (m / 2)) ∧ ∀ x, γ * stdClassSum (Kf ..) (fun h ↦ carrierXi m c h *
  modKernelI (signedSpace ..) (upsilonU1 ^ m) c 𝔪 (χ ·.det) 1 x h) = carrierForm E m x := by
  let J := stdSpace E (Fin m)
  obtain ⟨⟨n, _⟩, ⟨C₁, H₁⟩, C₂, H₂⟩ := exists_modKernel_neg_left J J,
    run79_stdClassSum_det_modKernel_eq E he 0, run79_explicit_matching (J.sum (signedSpace
    E (1 ⊕ᵥ -1))) (.emptySum Empty _) J.neg 1 (.trans (.emptySum ..) (.sumComm ..)) (.sumAssoc _
    (Fin (2 * m)) _) (by aesop) (d := m) (by simp +arith) (by simp; grind [NeZero]) fun _ ↦ Empty
  use C₁ * C₂; introv h
  obtain ⟨_, ⟨γ₁, _, H₁⟩, γ₂, _, H₂⟩ :=
    (χ.isOfFinOrder 𝔪.normNegOne.isUnit.isOfFinOrder).norm_eq_one,
    H₁ h.inv, H₂ (h.mul (hasWeight_upsilonU1_pow m)) (by simp)
  use γ₂ * star γ₁ * n / χ 𝔪.normNegOne ^ m, by simp_all [pow_add, ↓mul_inv, field], fun x ↦ ?_
  have := explicit_matching_of_sum _ _ ((h.mul (hasWeight_upsilonU1_pow m)).mul .one) (P := ∏ τ,
    letterMinor τ Sum.inr id ^ (2 * m)) (by
    have := star_inj.2 <| H₁ <| G.neg.symm ·
    simp [J, map_classSum, *, Units.smul_def, ← χ.star_apply'] at this
    simpa [← smul_eq_mul, ← Pi.smul_def, ← modKernelBilin_apply, ← smul_assoc]) (unitModulus _)
    le_top 1 (by intros; simpa [det_apply, two_mul, ← tsub_tsub] using! H₂ 0 ‹_› 1 (.sum (_, x)))
  simpa [by simpa using (modKernel_sum_left J (stdSpace ..) c 1 _ · · 1 (χ ·.det) 1 1 · x),
    modKernel, mul_left_comm _ _⁻¹, mul_assoc, ← mul_classSum, field]

end

#print axioms run79_exchange_theorem
#print axioms run79_explicit_matching
#print axioms run79_stdClassSum_det_modKernel_eq
#print axioms run79_stdClassSum_carrierXi_eq_carrierForm

run_cmd do
  let entries : List (Lean.Name × Lean.Name × List Lean.Name × List Lean.Name) :=
    [(``run79_exchange_theorem, ``exchange_theorem,
       [``run78_equalRankThetaRatio_value, ``exchange_of_partners],
       [``exists_equalRankThetaRatio_value]),
     (``run79_explicit_matching, ``explicit_matching,
       [``run79_exchange_theorem], [``exchange_theorem]),
     (``run79_stdClassSum_det_modKernel_eq, ``stdClassSum_det_modKernel_eq,
       [``run79_explicit_matching], [``explicit_matching]),
     (``run79_stdClassSum_carrierXi_eq_carrierForm,
       ``stdClassSum_carrierXi_eq_carrierForm,
       [``run79_stdClassSum_det_modKernel_eq, ``run79_explicit_matching],
       [``stdClassSum_det_modKernel_eq, ``explicit_matching])]
  for (candidate, original, required, forbidden) in entries do
    let info ← Lean.getConstInfo candidate
    let old ← Lean.getConstInfo original
    let same ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq old.type info.type
    unless same do
      Lean.throwError "C2 propagation type mismatch: {candidate}"
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "C2 propagation lacks proof value: {candidate}"
    let deps := value.getUsedConstants
    for name in required do
      unless deps.contains name do
        Lean.throwError "C2 propagation missing dependency {name} in {candidate}"
    for name in original :: forbidden do
      if deps.contains name then
        Lean.throwError "C2 propagation retained forbidden dependency {name} in {candidate}"
    Lean.logInfo m!"C2_PROPAGATED_CALLER: {candidate}: exact type and direct edges"

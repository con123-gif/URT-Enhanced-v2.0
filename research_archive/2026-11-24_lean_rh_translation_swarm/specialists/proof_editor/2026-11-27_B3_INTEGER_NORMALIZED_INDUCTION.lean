import New.Filling.FillingTheorem

/-!
# Lane 15: integer-normalized positive-type induction at the actual rank caller

27 November 2026. Source-matched conditional human proof; native candidate UNRUN.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Reviewed latest editor bd7dce3c and previous 02798532, peer dbcfaee8,
73e689b8, 5bb32ae1 (blob b5d4460ab8fa004cfd09def20a69b1a066d22ab0), and current B2/C2 audit ledger.
C1 run 46055305146 was in progress when checked; no new native receipt
for these B3/B4 declarations. Preserve separate C2 peer work ece1c4fa
and 85a22530; no competing build.

## Actual mismatch resolved at the induction interface
Source grh-compact/src/New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
sum_le_of_positive_type (lines 226-258), Fits.exists_translate_finrank_comap_le
(301 onward); New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6,
card_mul_sum_det_le; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
Filling.le_levelPrime, levelPrime_le, ϱ_le_k, succ_le_b;
FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76,
Data.ramifiedColumns_fill_rows.

The peer coarse three-case lemma uses a REAL J*=b^(23k/4), whereas
the existing native induction uses NATURAL exponent 6k. Instead of
introducing real powers or a new extremal-max construction into the
native proof, use the integer j=floor(23k/4), J=b^j. Then J<=J*.
Keep the original downward induction and its escape allowance delta=b^-4.

At the SAME missing place w with residue field q=q0 and minor size l
(1<=l<=rho+1), put r=k+2rho+1. The native determinant estimate is
 q * mass(singular minor) <= 2U + q^l sqrt(q^r) * Y,
where U=sum Theta and Y is the vector-fixer mass cap. The induction
contradiction uses the SAME positive-type tensor Gram witness, same
nonzero frame vectors and same hB support domination. With target
 C E J^(-|A|), C=1+eta, E=mainEnergy, eta=b^-2, the new child
bound is C E J^(-|A|-1) < U/J. No normalization or absolute values
are altered. The coefficient C cancels exactly against hK.

Here is the only new determinant arithmetic:
  11*(2l+r) <= 11k+44(rho+1) <= (11+22/1000)k
               <= 2 floor(23k/4).
The last inequality uses k>=1000*(2rho+2)>=2000, so
2 floor(23k/4) >= 11.5k-2. Thus q^(2l+r)<=b^(2j), and
q^l sqrt(q^r)<=J by nonnegative square comparison, since q<=b^11.
Consequently each singular-minor mass <=3U/q <=3b^-10 U.
At this ONE missing place there are at most rho+1<=b minors; hence
the off-fixingSet mass <=3b^-9 U<=delta U. No union over all places
is needed. In the terminal all-places case the off-set mass is zero.

For the native induction the sole new local premise is
 energy(fullAmplitude, fixingSet(A,D))
       <= (1-delta)*(1+eta)*E / J^|A|.                (LOCAL_INT)
Peer dbcfaee8 (and editor 02798532 at eta=b^-2) gives a sufficient
three-case interface: A=empty bound (1+eta/2)E, A nonempty bound
E/(J*)^|A|. Since eta<=1/1000, eta^2+eta^3<=eta/2; hence
1+eta/2 <= (1-eta^2)(1+eta) and 1 <= that same factor.
Nonnegativity of E, J<=J*, and A cardinality >=0 give LOCAL_INT.
Thus the three-case estimates, IF proved, feed the original induction
without the real-rpow bookkeeping and without a new finite maximization.
The determinant and Gram premises are exactly those used at the pinned
caller. Escape cancellation is unchanged:
 (1-delta)U <= energy(fixingSet) <= (1-delta) C E / J^|A|,
so U<=C E/J^|A|. At A=empty, the integer factor is exactly 1.
The two native first moments and dyad estimate are unchanged and give
the previous relaxed rank error 5b^-4+b^-2/2. Retain ramification and
the explicit margin eta/2+6eta^2+eta^4<=eta.

This is NOT a proof of LOCAL_INT. The small nonempty coarse coherent
estimate and the empty near-sharp regular-cell bound remain open,
and the large-set bound uses the retained B2 caller. The original
sharp native theorem is a fallback. No shortcut via the Bessel-only
operator. No new claim on A/C or primitive B1-B3 suppliers.

## Verification status
Connector JS fetched the actual pinned source and exact peer candidate,
extracted its two complete declarations, matched the original declaration
anchors, executed 8 targeted substitutions and reversed all of them
byte-for-byte. No new numerical surrogate. Local PATH lacks lean/lake.
The two scalar lemmas and two actual caller declarations below are
prepared, not compiled; the final gcongr/omega guard may need repair
after elaboration of the actual card BesselIndex expression.
No native rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier run.
No new native or CI PASS, no root obligation retired. Original/reduced
source-visible path:
 Data.ramifiedColumns_fill_rows -> Fits.exists_translate_finrank_comap_le
 -> sum_le_of_positive_type -> energy_fixingSet_le;
 new candidate Fits.editor_exists_translate_finrank_comap_le_integer
 -> editor_sum_le_of_positive_type_integer -> LOCAL_INT + exact native
 determinant/Gram/support/escape suppliers. Keep all old graph/axiom
 evidence, first moments, ramification, row dimension and A/C obligations.
 No transitive deletion claim. No import of Main or claimed RH.

RESUME HERE: replay the integer-normalized induction and Fits candidate
in the existing shared compact runner, checking the actual card/rank
exponent guard and both axiom/dependency reports, then use the existing
Data caller adapter (same rank output) with LOCAL_INT. Do not rederive
the rejected Bessel shortcut or start a duplicate cold build.
HANDOFF TO B3/B4 integration / kernel / audit. RH remains OPEN.
-/

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling
lemma editor_integer_det_exponent (k r l : ℕ)
    (hk : 1000 * (2 * r + 2) ≤ k) (hl : l ≤ r + 1) :
    11 * (2 * l + (k + 2 * r + 1)) ≤ 2 * (23 * k / 4) := by omega

lemma editor_local_multiplier (eta : ℝ) (h0 : 0 ≤ eta) (h1 : eta ≤ 1/1000) :
    1 + eta / 2 ≤ (1 - eta^2) * (1 + eta) := by
  have h2 : eta^2 ≤ eta/1000 := by
    nlinarith [mul_nonneg h0 (sub_nonneg.mpr h1)]
  have h3 : eta^3 ≤ eta^2 := by
    nlinarith [mul_nonneg (sq_nonneg eta) (show 0 ≤ 1-eta by linarith)]
  nlinarith


variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma editor_sum_le_of_positive_type_integer [WeilData E] (hLocal : ∀ A D, energy (S.amplitudeSum .univ) (fixingSet A D) ≤
    (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A)) {Θ : _ → ℝ} (h0 : ∀ s, 0 ≤ Θ s) (u : _ → V) (hu :
  ∀ a b, ⟪u a, u b⟫_ℂ = Θ (a⁻¹ * b)) A (D : ∀ _, _) (hB : ∀ Ω, ∑ s with s ∈ Ω, Θ s ≤ energy
  (S.amplitudeSum .univ) Ω) (hA : ∀ s, Θ s ≠ 0 → ∀ w ∈ A, s ∈ S.vectorFixer (i := 0) w (D w)) :
  ∑ s, Θ s ≤ (1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A := by
  induction' A using WellFoundedGT.induction with A ih generalizing V Θ D
  obtain ⟨hq, q, _⟩ := S.levelPrime_le 0, S.le_levelPrime 0, S.thousand_le_b, univ.sum_nonneg' h0,
    S.ϱ_le_k; by_contra! hK
  apply hK.not_ge
    (le_of_mul_le_mul_left (.trans _ (hLocal A D)) (by bound [@one_lt_pow₀ ℝ]))
  grw [← hB, one_sub_mul, sub_le_comm, ← sum_sdiff_eq_sub (by simp), ← sum_filter_ne_zero]
  obtain hw | ⟨w, hw⟩ := em' (Exists (· ∉ A))
  · rw [Finset.sum_eq_zero (by simp; grind [fixingSet])]; bound
  choose! L hL using fun s (e : s ∉ S.fixingSet A D) h ↦ by simpa using (e ⟨hA s h, .inr ⟨w, ·⟩⟩)
  grw [← Finset.sum_fiberwise _ L, sum_le_card_nsmul _ _ (3 * univ.sum Θ / S.b ^ 10)
    fun l _ ↦ let F b := frameImage (cond b (S.latMiddle (ResField w.1)).splitGram 1) *
      inclMatrix (ResField w.1) (Fin.castLE l.is_le)
    (le_div_iff₀' (by bound)).2 (.trans ?_ ((card_mul_sum_det_le (.mk' (· 0 w) (by simp)) F h0 hu
    (univ.sum Θ / S.b ^ (23 * 𝔰.k / 4)) (by bound) fun b v hv ↦ by
    grw [sum_filter, ih _ (ssubset_insert hw) _ (fun a ↦
      basisFun _ ℂ (cond b invTransposeGL 1 (a 0 w) • F b *ᵥ v) ⊗ₜ[ℂ] u a) _
      (Function.update D w ⟨b, _, (map_ne_zero_iff _ (inclMatrix_mulVecLin_injective (Fin.castLEEmb
      l.is_le) _)).2 hv⟩) (.trans (by gcongr; bound) <| hB ·), ← hK] <;> simp
      [*, apply_ite ofReal, ite_nonneg, pow_succ, field, inner, smul_smul, ← eq_inv_smul_iff]
    · exact fun s h _ ↦ ⟨by cases b <;> simp [vectorFixer] <;> (repeat erw [mul_smul]) <;>
        simpa [F, ← mul_inclMatrix, ← mulVec_mulVec, inv_smul_eq_iff] using! h.symm, by grind⟩
    tauto).trans ?_))]
  · simp [field]; grw [← le_self_pow₀, ← k_le_b, ← S.ϱ_le_k] <;> push_cast <;> nlinarith
  · gcongr <;> simp [*, sum_nonneg', subset_iff, F, transpose_splitGram, mul_inclMatrix,
      ← inclMatrix.eq_1, card_eq_nat_card, ↓card_resField_eq_levelPrime]; bound
  grw [mul_div_left_comm, div_le_one_of_le₀]; linarith
  grw [← sq_le_sq₀, mul_pow, sq_sqrt, card_eq_nat_card, card_resField_eq_levelPrime, hq, hq]
  simp [← pow_mul, ← pow_add, Shape.r]
  have hsmall : l.val ≤ 𝔰.ϱ + 1 := by omega
  have hj := editor_integer_det_exponent 𝔰.k 𝔰.ϱ l.val S.ϱ_le_k hsmall
  gcongr <;> first | omega | bound

lemma Fits.editor_exists_translate_finrank_comap_le_integer [WeilData E] (hLocal : ∀ A D, energy (S.amplitudeSum .univ) (fixingSet A D) ≤
    (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A)) {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + (S.b ^ 2)⁻¹ / 2) := by
  set R := ρ.asAlgebraHom (piTensorElem g); intro F φ; apply S.of_size_bounds; intros
  obtain ⟨⟨t, ht⟩, G, B, o⟩ := (isSquare_iff.2 (mul_pos hc S.unipCovolume_pos).le).inv,
    IsCentralProj.piTensorElem hg, S.amplitudeSum_split .univ (S.ratMiddle E).besselSᶜ,
    (hg · |>.one_sub); let P := t • Q
  have hu a b x y : ⟪ρ b (P (.single y 1)), ρ a (P (.single x 1))⟫_ℂ =
      S.amplitudeSum .univ x.1 (a⁻¹ * b) y.1 (x.2, y.2) / S.unipCovolume := hρ a⁻¹ .. ▸ by
    simp [← End.mul_apply, ← map_mul, P, ← mul_assoc, ← ofReal_mul, ← ht, hQ, field, hc.ne']
  have pr {z} (hz : IsCentralProj z) y : ⟪_, _⟫_ℂ = _ :=
    (hz.self_adjoint ρ 1 (innerₛₗ ℂ) hρ y _).trans congr(⟪y, $(hz.1.map ρ.asAlgebraHom) y⟫_ℂ)
  have hb' i := add_le_add (S.re_trace_besselS_le (o i) (hb i)) ((sum_norm_amplitudeSum_le i
    (o i)).trans' (sum_le_sum fun a _ ↦ (PiLp.norm_apply_le _ a).trans' (re_le_norm _)))
  refine (exists_le_of_sum_le univ_nonempty (g := fun _ ↦ S.columnDim / 2 * (1 + (S.b ^ 2)⁻¹ +
    φ)) ((sum_le_sum fun s _ ↦ finrank_sub_le_re_inner_dyadSum (stdOrthonormalBasis ..) (ρ s ∘ₗ P)
    (ρ.asAlgebraHom (1 - piTensorElem g)) (F.comap (R.rangeRestrict ∘ₗ ρ s ∘ₗ Q)) (F.map
    R.range.subtype) (Eq.trans_le ?_ (S.sum_norm_amplitudeSum_le 0 (.one_sub ⟨.zero, by simp⟩)))
    fun _ ↦ (⟨_, F.smul_mem t ·, by simp [P, R]⟩)).trans ?_)).imp fun s h ↦ ?_
  · congr! 2; ext; rw [← basisFun_inner]
    simp [inner_sub_right, LinearMap.adjoint_inner_right, inner_single_left, hu,
      amplitudeSum_besselS_one, ite_div, add_div, B, apply_ite, S.unipCovolume_pos.ne',
      Finsupp.single_apply, MonoidAlgebra.one_def]; grind
  · grw [← re_sum, ← sum_inner, re_le_norm, norm_inner_le_norm, ← sq_le_sq₀, mul_pow,
      @norm_sq_eq_re_inner ℂ, inner_sum_sum_eq_card_mul (energy (S.amplitudeSum .univ) {·}) ?H]
    simp [@norm_sq_eq_re_inner ℂ, ↓inner_dyadSum, apply_ite, ← Submodule.coe_inner, mul_pow,
      ← show φ *
      _ = _ from div_mul_cancel_of_imp (mod_cast by bound [F.finrank_le]), orthonormal_iff_ite.1]
    grw [editor_sum_le_of_positive_type_integer hLocal (fun _ ↦ by unfold energy; positivity) _ ?H ∅ (fun _ ↦
      ⟨⊤, 1, by simp⟩) _ nofun, hD, ← four_mul_le_sq_add]
    simp [mainEnergy]; field_simp [mass_pos, besselDegree_pos, ne_of_gt]; any_goals positivity
    repeat norm_num [energy, sum_filter, norm_sq_eq, sum_prod_type, sum_div, hu, div_pow,
      @sum_comm S.Classes _ S.BesselCoord, @sum_comm S.GRes]
  have k := univ.sum_nonneg' fun y ↦ pr (.piTensorElem o) (P (.single y 1)) ▸ inner_self_nonneg
  simp [add_div, show piTensorElem (1 - g ·) = ∑ i,
    piTensorElem (Pi.mulSingle i (1 - g i)) - (1 - piTensorElem g) by
    ext; simp [← map_one piTensorElem, -map_one]; ring, ↓@norm_sq_eq_re_inner ℂ, ↓hρ, columnDim,
    ↓pr G.one_sub, mul_add, mul_sum, @sum_comm (_ × _), asAlgebraHom_piTensorElem_mulSingle, B, (by
    simpa using congr(ρ.asAlgebraHom $(G.2.commute (.single s 1)) ·).symm),
    asAlgebraHom_eq_sum (ρ.comp _), by simpa using (hu · 1)] at *
  linarith

#print axioms editor_integer_det_exponent
#print axioms editor_local_multiplier
#print axioms editor_sum_le_of_positive_type_integer
#print axioms Fits.editor_exists_translate_finrank_comap_le_integer

end Filling

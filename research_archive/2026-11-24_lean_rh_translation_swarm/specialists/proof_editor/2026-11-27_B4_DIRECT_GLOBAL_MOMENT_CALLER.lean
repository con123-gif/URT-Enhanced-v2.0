import New.Filling.FillingTheorem

/-!
# Editor lane 15 — consume the GLOBAL moment directly

27 November 2026. PREPARED / not native checked. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Read live mission/spine/ledger, previous editor 0279853292510b1962819fddc0a7837b22374016,
integration 73e689b8, dbcfaee8 and 2026-11-27_B3_B4_RELAXED_ACTUAL_CALLERS.lean.
Latest ledger retains checked B2/C2 subgraphs, not full RH. Do not duplicate
peer's local-energy induction. Source: New/Filling/Moments.lean
ec2cb964ede0d5eeae41a077dc6dbfface9c0444, Fits.exists_translate_finrank_comap_le;
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76;
New/Filling/SchurTest.lean, exact definition energy (sum c, c', s with s in Ω).

## Actual downstream bridge after the extremal argument

The previous local-energy-to-Fits replacement still demands hLocal for
ALL A,D, with native b^(6k) suppression. The coarse extremal route does
NOT give that premise: it gives one global estimate with J=b^(23k/4).
Do not silently substitute these unequal local normalizations.

The only use of hLocal at the actual rank caller is via the conclusion
of sum_le_of_positive_type at A=empty. Its positive-type Gram premise
is also independently used in inner_sum_sum_eq_card_mul and is RETAINED.
The direct interface needed from the extremal proof is precisely

  energy(fullAmplitude, Set.univ) <= (1+b^-2)*mainEnergy.

By exchanging finite sums, sum_s energy(fullAmplitude,{s}) equals
energy(fullAmplitude,Set.univ) exactly; each term carries one factor
nu^-2, not nu^-4. This identity does not require any norm bound,
positive type, positivity or moment hypothesis. Thus the original
dyad argument can use the extremal result directly, without requiring
the uniformly sharp local family. The two first-moment suppliers,
central projection, dimension cap and ramification are unchanged.
The same actual normalized P, rho, D, good projector and energy are
required. The rank error is the same as the prior relaxed caller,
5*b^-4 + b^-2/2 before ramification. The original final tactic
may need the explicit scalar margin from 73e689b8.

This closes a source-visible interface mismatch only, conditional on
the extremal supplier; it does not prove the global energy estimate.
Use previous 02798532 empty-group construction, and dbcfaee8's
nonempty coarse/large cases at eta=b^-2, as the upstream route.
No claim that these are already integrated or verified.

Actual verification this run: connector JS extracted two exact peer
declarations, checked corresponding original Moments anchor, seven
unique forward substitutions and both complete inverse round trips.
An initial reverse check rejected an ambiguous hGlobal' anchor;
repaired by matching the full grw prefix. No new synthetic numerical
tests. Lean not executed, no new CI PASS;
native rh_scan/prune/reduce/auto/frontier not executed. The original
and reduced source-visible paths are:
  Data.ramifiedColumns_fill_rows -> Fits.exists_translate_finrank_comap_le
    -> sum_le_of_positive_type -> energy_fixingSet_le;
  editor_ramifiedColumns_fill_rows_global -> editor_exists_translate_finrank_comap_le_global
    -> hGlobal (open) + editor_sum_singleton_energy + retained rank suppliers.
No transitive dependency deletion is certified; keep all graph/axiom
records and all A/B/C obligations. No import of Main or RH theorem.

RESUME HERE: compile these three declarations in shared compact runner;
audit singleton-sum identity, original/new caller types, dependency
paths and the scalar ramification guard, and attach the existing
extremal global energy theorem when its three-case supplier is ready.
HANDOFF TO B3/B4 integration / kernel / audit. RH remains OPEN.
-/

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling
variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma editor_sum_singleton_energy
    (A : S.Classes → S.GRes → S.Classes → V) :
    (∑ s : S.GRes, energy A {s}) = energy A Set.univ := by
  simp [energy, sum_filter, @sum_comm S.GRes S.Classes]

lemma Fits.editor_exists_translate_finrank_comap_le_global [WeilData E] (hGlobal : energy (S.amplitudeSum .univ) Set.univ ≤
    (1 + (S.b ^ 2)⁻¹) * S.mainEnergy) {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + (S.b ^ 2)⁻¹ / 2) := by
  have hGlobal' : (∑ s : S.GRes, energy (S.amplitudeSum .univ) {s}) ≤
      (1 + (S.b ^ 2)⁻¹) * S.mainEnergy := by
    rw [editor_sum_singleton_energy]
    exact hGlobal
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
    grw [hGlobal', hD, ← four_mul_le_sq_add]
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

#print axioms editor_sum_singleton_energy
#print axioms Fits.editor_exists_translate_finrank_comap_le_global
end Filling

section
open Filling Module Submodule
variable {P} (D : Data P) (c : ℂˣ)

lemma Data.editor_ramifiedColumns_fill_rows_global
    (hGlobal : energy (D.filling.amplitudeSum .univ) Set.univ ≤
      (1 + (D.filling.b ^ 2)⁻¹) * D.filling.mainEnergy) :
  IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) (D.b ^ 2)⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound : D.b ^ 9 ≤ D.N - 1)
  have h := Fits.editor_exists_translate_finrank_comap_le_global hGlobal (ρ :=
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
    id) (((D.ramifyingOp_finrank_comap_and_short .univ _).1.trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling]; gcongr; use D.le_of_hasLogBound
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

#print axioms Data.editor_ramifiedColumns_fill_rows_global
end

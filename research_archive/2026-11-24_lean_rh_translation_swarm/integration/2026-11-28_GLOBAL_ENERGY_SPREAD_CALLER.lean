import New.Filling.FillingTheorem
import Lean

/-!
# Integration — actual B4 moment caller with adjustable global energy
28 November 2026. SOURCE-MATCHED / PREPARED, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, peer commits db910fac (RUN99),
8ca68829 (H sign), 803fc793 (C exact lift), 32cb51c0 (discounted shell).
Implements rather than repeats prior relaxed filling budget
b1126d208f00e9828c6c69c0f3fc97f164e7327a.

Source Moments ec2cb964ede0d5eeae41a077dc6dbfface9c0444; FillingTheorem 801448ae9b895babd0d69dc4f7967d86eb006e76;
ChainValuation 19e853dfa8c645bfcdf3b3e21183f9b432620ef7.
Write e=b^-4, v=columnDim. First moment error e v and the two
discarded central projection errors 2 e v each stay unchanged.
Replace only global second moment with the actual singleton-energy sum
  sum_s energy(amplitudeSum univ,{s}) <= (1+zeta) mainEnergy.
Same S.GRes, normalization, amplitude, dyadSum, representation,
projectors and mass. No second division by unipCovolume.
The native Hilbert-Schmidt AM-GM step yields the comap bound
  v*((1+phi)/2+5e+zeta/2).
RamifyingOp adds f/(N-1) exactly (univ cardinal f).
Thus the actual B4 sufficient scalar condition is
  5 b^-4 + zeta/2 + f/(N-1) <= eta.
For RUN99 eta=1/(4 b x^200), choose zeta=eta. Under f<=b,
N-1>=b^9, x^200<=b/4 and b>=1000:
eta>=b^-2 and 5 b^-4+b^-8<=eta/2.
Relative excess allowance versus 9b^-4 is b^3/(36 x^200),
conditional on RUN99 C. No claimed speedup. The new global
moment is a PREMISE, not proved here; other trace/complement
suppliers remain. A local direct-edge change is not global deletion.
The scalar normalization/scale tactic and hEnergy specialization
must actually compile; retain all native guards.

Executed in connector: 9 unique source transformations, exact
reverse round trips to both originals, 18 omitted/duplicate
anchor controls. First attempt failed reverse uniqueness on bare
hEnergy; repaired using the complete grw line. These are source
checks, not Lean. No new rh_scan/prune/reduce/auto/frontier execution
or native axiom/graph PASS for this file.

Fresh native receipt: run 46120566249, state branch
compute/rh-compact-b3-caller-layout-repair-20261128/outputs/
run93_caller_receipt.json blob a40e5ea34dec3ddf16ca751db3ef642a5d64703e:
five old/new caller pairs compiled (4.58s), 10 roots standard axioms,
73,916 declarations, 2,104,697 edges, zero missing, 25 true
reachability guards. Old floorWeight/selfNorm/positions/formConst/
shells masks absent from new roots. RUN94 follow-on failed build
timeout 124 (2700.05s), receipt 405ea599a2d965728d45276ea8380aecaface2cd.
Do NOT call aggregate run PASS despite Actions success. Accepted
local B3 frontier only, not root B3 or B4.
C2 run 46108846902 result 242c577da80d81603acfd82b541a9c5c9118f568:
13 objects authenticated, missing original LongForms, DataExist,
Statements; invalid fresh Lean path, no new Lean execution.
C1 run 46128377765 state status error first phase run93.
Reuse successful caller objects; no duplicate cold build.
Preserve all original/reduced graphs, unresolved obligations and axioms.

RESUME HERE: compile this as IntegrationGlobalEnergySpread with
the retained compact source cache; check hEnergy specialization
and exact hbudget normalization at both actual source callers,
then export old/new constructor-inclusive graphs. Connect the
accepted B3 objects through the existing system/moment replay,
not merely imports. No New.Main import. No RH closure.
HANDOFF integration / Landau / positivity / kernel / audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module
namespace Filling
variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok :
  S.IsAdmissible] {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma Fits.integration_spread_of_global_energy [WeilData E] {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) {ζ : ℝ} (hζ : 0 ≤ ζ)
  (hEnergy : ∑ s : S.GRes, energy (S.amplitudeSum .univ) ({s} : Set S.GRes) ≤
    (1 + ζ) * S.mainEnergy) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + ζ / 2) := by
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
  refine (exists_le_of_sum_le univ_nonempty (g := fun _ ↦ S.columnDim / 2 * (1 + ζ +
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
    grw [hEnergy, hD, ← four_mul_le_sq_add]
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

end Filling

open Filling Module Submodule
variable {P} (D : Data P) (c : ℂˣ)

lemma Data.integration_ramified_spread_of_global_energy {ζ η : ℝ} (hζ : 0 ≤ ζ)
    (hEnergy : ∑ s : D.filling.GRes,
      energy (D.filling.amplitudeSum .univ) ({s} : Set D.filling.GRes) ≤
        (1 + ζ) * D.filling.mainEnergy)
    (hbudget : 5 * (D.b ^ 4)⁻¹ + ζ / 2 +
      D.f * (D.N - 1 : ℝ)⁻¹ ≤ η) :
  IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ (c.1 • D.ramifyingOp .univ)) η := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound : D.b ^ 9 ≤ D.N - 1)
  have h := Fits.integration_spread_of_global_energy (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel)) hζ hEnergy
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) (((D.ramifyingOp_finrank_comap_and_short .univ _).1.trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling] at hbudget ⊢
  gcongr <;> linarith only [hbudget]
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

lemma Data.integration_run99_spread_of_global_energy
    (hEnergy : ∑ s : D.filling.GRes,
      energy (D.filling.amplitudeSum .univ) ({s} : Set D.filling.GRes) ≤
        (1 + (4 * (D.b * D.x ^ 200))⁻¹) * D.filling.mainEnergy) :
    IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
      (c.1 • D.ramifyingOp .univ)) (4 * (D.b * D.x ^ 200))⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  apply D.integration_ramified_spread_of_global_energy c
    (ζ := (4 * (D.b * D.x ^ 200))⁻¹) (by positivity) hEnergy
  have hb : 5 * (D.b ^ 4)⁻¹ + D.f * (D.N - 1 : ℝ)⁻¹ ≤
      (4 * (D.b * D.x ^ 200))⁻¹ / 2 := by
    exact D.le_of_hasLogBound
  linarith only [hb]

#print axioms Filling.Fits.integration_spread_of_global_energy
#print axioms Data.integration_ramified_spread_of_global_energy
#print axioms Data.integration_run99_spread_of_global_energy

open Lean in
run_cmd do
  for (root, required, forbidden) in #[
    (``Filling.Fits.integration_spread_of_global_energy,
      #[``Filling.re_trace_besselS_le,``Filling.sum_norm_amplitudeSum_le,``finrank_sub_le_re_inner_dyadSum],
      #[``Filling.Fits.exists_translate_finrank_comap_le,``Filling.sum_le_of_positive_type]),
    (``Data.integration_ramified_spread_of_global_energy,
      #[``Filling.Fits.integration_spread_of_global_energy,``Data.ramifyingOp_finrank_comap_and_short],
      #[``Data.ramifiedColumns_fill_rows]),
    (``Data.integration_run99_spread_of_global_energy,
      #[``Data.integration_ramified_spread_of_global_energy],
      #[``Data.ramifiedColumns_fill_rows])] do
    let info ← getConstInfo root
    let some v := info.value? (allowOpaque := true) | throwError "missing proof {root}"
    let deps := v.getUsedConstants
    unless required.all (fun a => deps.contains a) && forbidden.all (fun a => !deps.contains a) do
      throwError "INTEGRATION_GLOBAL_ENERGY unexpected direct suppliers {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "INTEGRATION_GLOBAL_ENERGY nonstandard axioms {root}: {axs}"
  logInfo "INTEGRATION_GLOBAL_ENERGY_SPREAD_GUARDS_OK"

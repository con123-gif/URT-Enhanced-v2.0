import New.Filling.Moments
import Lean

/-!
# Lane 15 — backtrack to the exact original energy interface
27 November 2026. SOURCE-MATCHED / PREPARED, NOT native checked.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 / Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Mission/spine/ledger
3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Pinned Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444; previous extracted link
8db8c60d035a15a82e6375dc06dfdfb56e503384. RUN63 joint A/B, RUN64 joined star and RUN88 original
control read. Retain the same Poincare choice and all A/C obligations.

The previous two-link route was justified to seek weaker primitive
estimates. Once the same SHARP coherent supplier is restored, carrying
a weaker integer-normalized induction and three-case estimates does
not remove any primitive dependence. Backtrack: retain the native
energy interface, with no new arithmetic condition, no change of
rank constant, no separate empty/small/large estimates, no integer
exponent normalization. Keep the earlier weaker route as evidence
if an independent weaker primitive supplier is eventually found.

Write delta=b^-4, Y=b^(-6k|A|), E=mainEnergy. The exact existing
coherent-link estimate is L_A <= (1+delta)YE nu^2 on R_A={Lambda |
A != univ}. The exact native crude bound supplies
  energy <= [(1+delta)^3+delta^3] YE
         <= (1-delta)(1+9delta) YE.
The difference is delta*(5-12delta-2delta^2)>=0 since 0<=delta<=1/4.
Retain the original omitted-link guard at A=univ and all normalization
and size bounds, not a new claim about a universal link set.
The source original energy prefix proves exactly those guards and
the scalar comparison. Split its final link proof out, then restore
the original exact energy statement. This makes the original
positive-type induction and Fits proof-term bodies reusable verbatim;
their theorem types and universes are unchanged. No re-elaboration
of the dyad estimate, determinant escape induction or adjusted rank
error budget required. The original rank error 19/(2b^4) remains.

Important replay-context finding: Moments line 184 removes mul_re,
univ_unique, Fintype.card_pi from simp AFTER its energy proof.
Importing Moments before re-elaborating the extracted tail changes
the original simp context. Restore those three local simp attributes
only around the extracted proof and energy wrapper. This was missing
from the earlier extraction. Whether the restoration is sufficient
requires actual native replay; no fabricated compiler diagnostic.

Executed connector JS: matched exact pinned source and previous link
tail; entire coherent proof tail is byte-identical; exact reconstruction
of original energy body by inverse substitution; 4/4 deleted-anchor
controls rejected. Native Lean/lake unavailable in local PATH.
No new rh_scan/prune/reduce/auto/frontier execution. Actual shared C1
status fe5d4503f1bc8eb7752f9b86a6fdf35f452c872c reports ERROR, run
46055305146; separate C2 fit-family receipt reported in peer RUN88
56ee1baaeaa50c60bba37b29991c26ad2b8a92b0 is not a B3 receipt.
B3 shared status path returned 404. No root obligations retired,
no new native PASS, no new URT performance result.

Original: Fits -> sum_le_of_positive_type -> energy_fixingSet_le.
Candidate: exact Fits -> exact sum -> exact energy -> extracted link
and retained original crude theorem. Source graph only until native
audit. Preserve both graphs and all primitive B1-B4 obligations.
No original RH theorem or Main import. No replacement of a data-bearing
definition. This is the shorter preferred *replay candidate* for the
sharp-source route, not an independent proof of the coherent primitive.

RESUME HERE: in the existing compact B3/B4 cache compile this ONE
module (after building only missing original Moments olean), require
both EXACT_B3_TRANSPORT markers and exact axiom/type checks, then
run existing constructor-inclusive graph audit on the three old/new
roots and inspect actual supplier reachability before integrating
with the common-map RUN63/RUN64 junction. On failure repair first
actual diagnostic. Do not compile the superseded relaxed induction
first or start another cold build.
HANDOFF TO integration / kernel / B3 / audit. RH remains OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option pp.fullNames true

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling
section
attribute [local simp] mul_re univ_unique Fintype.card_pi
variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok : S.IsAdmissible]

lemma editor_sharp_coherent_link [WeilData E] (Sg : Finset (S.chosenPlaces 0)) D :
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet Sg D)
      {_Λ | Sg ≠ univ} ≤
      ENNReal.ofReal (((1 + (S.b ^ 4)⁻¹) * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg * S.mainEnergy) *
        S.unipCovolume ^ 2) := S.of_size_bounds (by
  intros
  set y : ℝ := (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg
  obtain ⟨⟨x, u, e⟩, a, c⟩ := exists_nonneg_add_of_le S.thousand_le_b, S.ϱ_le_k,
    S.card_chosenPlaces 0 ▸ Sg.card_le_univ
  simp_rw [linkEnergy, Set.univ_inter, ← ENNReal.tsum_prod]
  refine (tsum_subtype_support _).ge.trans (ENNReal.summable.tsum_le_of_sum_le fun F ↦ ?_)
  choose t σ n ht L H H' using fun j : F ↦ S.exists_hasSum_cosetAmplitude (j.1.2 ∘ sq_eq_zero_iff.2
    ∘ enorm_eq_zero.2) fun _ ⟨k, r, f⟩ l e ↦ j.1.1.2.2.1.2.2.elim j.1.1.2.2.2.2 fun ⟨w, z⟩ ↦ z l (by
    erw [← r, leadingMinor, submatrix_submatrix, ← map_splitGram_latMiddle (reduceAt _),
      ← Matrix.map_mul, submatrix_map,
      ← RingHom.map_det, Subtype.ext (((Ô E).subtype.map_det _).trans _), map_zero]
    erw [RingHom.mapMatrix_apply, ← submatrix_map, Matrix.map_mul, map_splitGram_latMiddle,
      ← submatrix_submatrix, ← frameGram, congr(frameGram _ ($f).1.1), frameGram_termPosition,
      submatrix_map, ← RingHom.map_det]; simpa)
  simp (disch := bound) only [← ofReal_norm, ← ENNReal.ofReal_pow, ← F.sum_coe_sort,
    ← ENNReal.ofReal_sum_of_nonneg]; gcongr; cases' hk : 𝔰.k with k; omega
  let r := (∏ v, √𝔰.openCellConst * ∏ a : Fin 𝔰.n,
    S.frameScaleSq v a ^ (k + 2 * a.rev)) / Fintype.card S.BesselCoord
  have c0 := 𝔰.openCellConst_pos; choose τ hτ using (Real.range_exp.ge <| S.frameScaleSq_pos · ·)
  refine le_of_tendsto_of_frequently (tendsto_finsetSum _ fun j _ ↦ (H j).norm.pow 2)
    (Filter.frequently_atTop.2 fun A ↦ let T₀ := A.biUnion univ.image ∪ univ.image t
    ⟨univ.map (.arrowCongrRight (.subtype (· ∈ T₀))), fun p h ↦ mem_map.2 ⟨(⟨p ·, by grind⟩),
    by simp, rfl⟩, le_of_mul_le_mul_left (a := r ^ 2) ?_ (by simp [r, ← hτ]; positivity)⟩)
  apply le_of_tendsto_of_frequently ((tendsto_finsetSum _ fun j _ ↦ (tendsto_finsetSum _ fun p _ ↦
    H' j p).norm.pow 2).const_mul _) ((S.exists_places_integralOff T₀).mp (.mono _ _)); rotate_right
  rintro T (o : ∀ i j, _ ∧ _) ⟨_, h₀, g, hT⟩; obtain ⟨P, G, hG⟩ := S.exists_isFillingLevel T
  obtain ⟨Y, hm, K⟩ := hG.exists_finite_sieveSystem Sg D
  apply ((Filter.Eventually.all fun i ↦ hG.sum_blocks_le_topKernel hT (j := {j // t j = t i}) _ (ht
    · |>.1) (fun j ↦ (ht j).2.1.trans congr($(j.2))) (ht i).2.2.1 (fun j ↦ hm (n j) (by simp [ht]))
    (o i · |>.1) ⟨i, rfl⟩ («π» := .cut) _ _ (o i · |>.2)
    ).exists_mem_basis_of_smallSets Metric.nhds_basis_closedBall).elim
  rintro ε ⟨p, M⟩; let V := IsUltrametricDist.closedBall_openAddSubgroup (LocProd T) p
  apply ((mul_le_mul_of_nonneg_left (S.sieve T h₀ g.1 (K V (isCompact_closedBall ..))
    le_sup_right) _).trans _).trans'
  · rw [mul_sum, ← sum_fiberwise_of_maps_to fun i ↦ mem_image_of_mem t, re_sum, mul_sum]
    use sum_le_sum (forall_mem_image.2 fun i _ ↦ by
      simpa only [← sum_subtype_eq_sum_filter, ht, subtype_univ, Subtype.prop (p := (t · = _)),
        sum_map, Nat.not_succ_le_self] using! M i ⟨V.2, isCompact_closedBall .., zero_mem V⟩)
  · unfold packetConst siegelConst; positivity
  · obtain D := ‹0 ≤ S.mainEnergy›, S.besselDegree_pos, volÔ_ne_zero (E := E)
    simp [prod_range]
    grw [← besselDegree, prod_comm, IsAdmissible.packetConst_mul_mass_le, ← sq_sqrt c0.le,
      (?_ : (1 + _) ^ _ ≤ 1 + S.b⁻¹ ^ 9), ← c]
    simp only [y, frameScaleProd, hk, pow_add, prod_mul_distrib, prod_pow, fieldLe, ← e, inv_pow,
      ← hτ, card_univ, prod_const, Fin.val_rev, Nat.succ_sub_succ, pow_mul]
    clear * - u D; rw [← sub_nonneg]; ring_nf; positivity
    grw [add_comm, add_one_le_exp, ← Real.exp_nat_mul, S.f_le_b, Real.exp_bound' _ _ one_pos] <;>
      simp [field] <;> bound
  intro i j l e; ext <;> simp only [ht, by simpa [ht] using e]; swap
  · -- the correlation integrals of the product vector are the products of the local ones
    intro i j; ext
    rw [Finset.prod_congr rfl fun v _ ↦
      (S.besselSys v).band_limits.2 _ ((ht j).1.ratToInf_mem_unitriangularOn v) _ _ ?_ ?_]
    simp_rw [normCorrelation, gram_apply, inner_smul_left_eq_smul, inner_smul_right_eq_smul,
      real_smul]
    simp only [inner, besselFn, besselCorrelation, Pi.mul_apply, Pi.inv_apply, star_def,
      prod_univ_sum, ratToInf_weylElem_mul, prod_mul_distrib, ← map_prod, sum_prod_type,
      ← integral_fintype_prod_volume_eq_prod, ← ofReal_prod]; rfl'
    repeat simp [ht, frameScaleSq, padTuple, unitOrOne, j.2]
  · intro i p
    simp [frameScaleSq.eq_1 S _ 𝔰.ϱ, div_pow, div_mul_eq_mul_div, div_sub_one, -one_div, hk,
      mul_add, unitOrOne, ↓Fin.prod_univ_castSucc, mul_pow, abs_of_pos, pow_add, Fin.rev_castSucc,
      padTuple, prod_pow, prod_range, (S.frameScaleSq_pos ..).ne', Level.headDensity,
      P.md_evalPlaces_rpow_half (h₀ _ (p _).2), @prod_comm (Fin 𝔰.ϱ), prod_eq_zero_iff, field]
    simp [sqrt_eq_rpow, rpow_pow_comm, finsetProd_rpow, ((ht i).2.2.1 _).le, prod_nonneg]
  simp [↓Filter.eventually_all, eventually_isIntegralOff, -Filter.eventually_atTop])

lemma energy_fixingSet_le_editor_exact [WeilData E] {𝔰} {S : Filling E 𝔰} [S.IsAdmissible] Sg D :
  energy (S.amplitudeSum .univ) (fixingSet Sg D) ≤ (1 - (S.b ^ 4)⁻¹) *
  ((1 + 9 / S.b ^ 4) * S.mainEnergy * (S.b ^ (6 * 𝔰.k))⁻¹ ^ #Sg) := S.of_size_bounds (by
  intros; set y : ℝ := _ ^ #Sg
  obtain ⟨⟨x, u, e⟩, a, c⟩ := exists_nonneg_add_of_le S.thousand_le_b, S.ϱ_le_k,
    S.card_chosenPlaces 0 ▸ Sg.card_le_univ
  have hy : S.tailScale ^ 20 * S.besselEnergy ≤ y * S.mainEnergy := by
    grw [← IsAdmissible.besselEnergy_le]; simp [y, field]; grw [c, pow_mul _ 4 6,
      tailScale_pow_four]; ring_nf; rfl; bound
  grw [energy_le_of_linkEnergy_le _ (by tauto) (by tauto) (by simp) (fun s k ↦ ⟨Sg.image
    fun w ↦ (⟨0, w⟩, (D w).1), (prod_image (by simp)).ge, forall_mem_image.2 (⟨_, k.1 · ·⟩)⟩)
    (w := (1 + (S.b ^ 4)⁻¹) * y * S.mainEnergy) _ (by grw [← hy, ← ‹2 ≤ S.tailScale›]; bound)
    {_Λ | Sg ≠ univ} (by
    simp; intro; grw [← le_levelPrime, pow_mul _ 4 3, tailScale_pow_four]; simp [y, field,
      S.card_chosenPlaces, *]
    ring_nf; gcongr; lia), ← e, ← sub_nonneg]; field_simp; ring_nf; any_goals positivity
  simpa only [y] using (editor_sharp_coherent_link (S := S) Sg D))

end
end Filling

open Lean in
private def editorExactB3Transport (old fresh oldSupplier newSupplier : Name) :
    Elab.Command.CommandElabM Unit := do
  let .thmInfo original ← getConstInfo old | throwError "expected theorem"
  let a ← getConstInfo oldSupplier
  let b ← getConstInfo newSupplier
  let same ← Elab.Command.liftTermElabM do
    Meta.isDefEq a.type b.type
  unless a.levelParams == b.levelParams && same do
    throwError "EXACT_B3 supplier statement or universe mismatch"
  let oldEdges := original.value.getUsedConstants
  unless oldEdges.contains oldSupplier && !oldEdges.contains newSupplier do
    throwError "EXACT_B3 missing old direct supplier or already replaced"
  let v := original.value.replace fun e =>
    match e with
    | .const n us => if n == oldSupplier then some (.const newSupplier us) else none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := original.levelParams,
    type := original.type, value := v })
  let .thmInfo checked ← getConstInfo fresh | throwError "missing checked theorem"
  unless checked.type == original.type && checked.levelParams == original.levelParams do
    throwError "EXACT_B3 changed exact theorem statement"
  let expected := (oldEdges.filter (· != oldSupplier)).push newSupplier
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "EXACT_B3 direct value edge mismatch"
  unless !got.contains old && !got.contains oldSupplier && got.contains newSupplier do
    throwError "EXACT_B3 stale direct supplier"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "EXACT_B3 nonstandard axiom"
  logInfo m!"EXACT_B3_TRANSPORT|{fresh}"

open Lean in
run_cmd do
  editorExactB3Transport ``Filling.sum_le_of_positive_type
    `Filling.sum_le_of_positive_type_editor_exact
    ``Filling.energy_fixingSet_le ``Filling.energy_fixingSet_le_editor_exact
  editorExactB3Transport ``Filling.Fits.exists_translate_finrank_comap_le
    `Filling.Fits.exists_translate_finrank_comap_le_editor_exact
    ``Filling.sum_le_of_positive_type `Filling.sum_le_of_positive_type_editor_exact

#print axioms Filling.editor_sharp_coherent_link
#print axioms Filling.energy_fixingSet_le_editor_exact
#print axioms Filling.sum_le_of_positive_type_editor_exact
#print axioms Filling.Fits.exists_translate_finrank_comap_le_editor_exact

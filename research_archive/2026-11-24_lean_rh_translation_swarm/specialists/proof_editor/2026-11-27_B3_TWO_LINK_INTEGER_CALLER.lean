import New.Filling.Moments
import B3IntegerNormalizedInduction

/-!
# Lane 15 — two coherent-link suppliers at the actual integer induction caller

27 November 2026. Conditional human derivation; executable Lean candidate
UNRUN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Source New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18.
Stage prior editor certificate 2026-11-27_B3_INTEGER_NORMALIZED_INDUCTION.lean
(blob 6885d769d75ace73e7e337f18437d4c2d2268c68) as module B3IntegerNormalizedInduction, in the
existing authenticated compact workspace. That module is itself UNRUN.
Reviewed current peer B3 chart replay 796fd65b (prepared), pivot-frequency
78180020 (prepared), B2 accepted joint/graph, C2 single-witness receipt
and its actual star consumer 091f88f0 (prepared). Shared run 46055305146
was still in_progress when inspected, not a B3 PASS.

## New actual caller interface

Use exactly the same S, A, D, q0, k, f, E=mainEnergy, E1=besselEnergy,
tau=b^(kf/4), nu=unipCovolume, energy and linkEnergy as Moments.
Let a=|A|, j=floor(23k/4), J=b^j, eta=b^-2, delta=b^-4,
Y=b^(-6ka), Z=J^(-a). Since j<=6k, Y<=Z.

The previous three-case human argument dbcfaee8 used the looser
C=ZE at the native CrudeEnergy interface. Keep the ORIGINAL smaller
C=YE instead, for EVERY case. Then the original native two crude
guards work verbatim: tau^20 E1 <= YE since tau^44 E1<=E and a<=f;
E1<=YE since tau>=1. This avoids real exponents and avoids modifying
the expensive pair/level estimates.

For 3f<=4a, omit all links. Set X=q0^a using the original witness
A.image (fun w => ((0,w),(D w).1)); the image is injective, so its
norm product is exactly q0^a, not merely a count of all fixed vectors.
Since q0>=b^10,
    tau^12 b^(6ka) = b^(3kf+6ka) <= b^(10ka) <= X^k.
Thus the exact omitted-link guard tau^12 E/X^k<=YE holds even with
the ORIGINAL stronger crude C. The empty link sum is exactly zero.
For this case energy <= b^-12 YE. No local regular-cell estimate.

For 3f>4a retain all links, so the omitted-link premise is vacuous.
Only these two quantitative suppliers remain:
  EMPTY: linkEnergy <= (1+eta/4) E nu^2;
  SMALL NONEMPTY: linkEnergy <= (ZE/2) nu^2.
The actual energy lemma gives respectively
 [(1+delta)^2(1+eta/4)+delta^3] E,
 [(1+delta)^2/2+delta^3] ZE,
and in the large case <=delta^3 ZE. For eta<=1/1000 all three
multipliers are <=(1-delta)(1+eta), by elementary expansion and
eta^2<=eta/1000; no division by E, so E=0 is included.
Hence the EXACT LOCAL_INT premise of the preceding actual rank
caller follows from the two link bounds. No third analytical
supplier for large A, no sharp local energy theorem as a premise.
The last declaration copies the exact prior Fits signature and
changes only hLocal to these two link estimates.

This does not establish either link estimate. The source B2 crude
theorem is retained, with its existing native evidence and its
remaining human primitive frontier; the existing sharp energy
theorem is a fallback, not a new independent proof. First moments,
row dimension, ramification, A/C, both local chart and frequency
suppliers remain. Source-visible paths:
 old rank -> sum_le_of_positive_type -> energy_fixingSet_le;
 candidate rank -> integer rank -> LOCAL_INT adapter ->
   native energy_le_of_linkEnergy_le + two coherent suppliers
   (no coherent supplier used in large branch).
No global dependency deletion without full kernel graph; preserve
all original/reduced graphs and all unresolved axioms.

Actual static checks: fetched pinned Moments and prior source;
matched native crude caller and cardinality anchors; extracted
complete prior rank signature and verified the inverse signature
replacement byte-for-byte. Local PATH lacks lean/lake. No new
native execution, no rh_scan/prune/reduce/auto/frontier execution,
no new CI PASS, zero root obligations retired. Proof scripts below
are candidates; elaborate the exact coercions, size-bound tactics
and exponent guards in shared workspace. No synthetic matrix test.

RESUME HERE: in the existing compact cache stage the previous
integer induction module and this two-link caller, replay the
actual crude and omitted-link guards then the Fits caller and
compare axioms and constructor-inclusive reachable edges. Do not
start a duplicate cold build or reopen the rejected Bessel route.
HANDOFF TO B3/B4 integration / kernel / audit. RH remains OPEN.
-/

open Module Classical Complex EuclideanSpace Finset Fint Fintype InnerProductSpace Matrix
  MeasureTheory IntegralPlace Real Matrix.Module

namespace Filling

lemma editor_coarse_link_multipliers (e : ℝ) (h0 : 0 ≤ e) (h1 : e ≤ 1/1000) :
    (1+e^2)^2*(1+e/4)+e^6 ≤ (1-e^2)*(1+e) ∧
    (1+e^2)^2/2+e^6 ≤ (1-e^2)*(1+e) ∧
    e^6 ≤ (1-e^2)*(1+e) := by
  have h2 : e^2 ≤ e/1000 := by
    nlinarith [mul_nonneg h0 (sub_nonneg.mpr h1)]
  have hp (n : ℕ) : e^(n+1) ≤ e^n := by
    rw [pow_succ]
    exact mul_le_of_le_one_right (pow_nonneg h0 _) (by linarith)
  have h3 : e^3 ≤ e^2 := by simpa using hp 2
  have h4 : e^4 ≤ e^3 := by simpa using hp 3
  have h5 : e^5 ≤ e^4 := by simpa using hp 4
  have h6 : e^6 ≤ e^5 := by simpa using hp 5
  exact ⟨by nlinarith only [h0,h1,h2,h3,h4,h5,h6],
    by nlinarith only [h0,h1,h2,h3,h4,h5,h6],
    by nlinarith only [h0,h1,h2,h3,h4,h5,h6]⟩

lemma editor_large_omission_exponents (k f a : ℕ) (h : 3*f ≤ 4*a) :
    3*(k*f)+6*k*a ≤ 10*a*k := by
  calc
    3*(k*f)+6*k*a = k*(3*f+6*a) := by ring
    _ ≤ k*(10*a) := Nat.mul_le_mul_left _ (by omega)
    _ = 10*a*k := by ring

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} [ok : S.IsAdmissible]

lemma editor_crude_fixingSet_link [WeilData E] (A : Finset (S.chosenPlaces 0)) D
    {w : ℝ} (hw : 0 ≤ w) (R : Set _)
    (hOmit : (∃ Λ, Λ ∉ R) → S.tailScale ^ 12 / (↑(S.levelPrime 0 ^ #A : ℕ) : ℝ) ^ 𝔰.k * S.mainEnergy ≤
      (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A * S.mainEnergy)
    (hLink : linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet A D) R ≤
      ENNReal.ofReal (w * S.unipCovolume ^ 2)) :
    energy (S.amplitudeSum .univ) (fixingSet A D) ≤
      (1 + (S.b ^ 4)⁻¹)^2 * w + (S.b ^ 12)⁻¹ * ((S.b ^ (6 * 𝔰.k))⁻¹ ^ #A * S.mainEnergy) := S.of_size_bounds (by
  intros
  set y : ℝ := (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A
  have c := S.card_chosenPlaces 0 ▸ A.card_le_univ
  have hy : S.tailScale ^ 20 * S.besselEnergy ≤ y * S.mainEnergy := by
    grw [← IsAdmissible.besselEnergy_le]; simp [y, field]; grw [c, pow_mul _ 4 6,
      tailScale_pow_four]; ring_nf; rfl; bound
  exact energy_le_of_linkEnergy_le (S := S) (by positivity) (by tauto) (fun _ ↦ hy) (by simp)
    (fun s k ↦ ⟨A.image fun v ↦ (⟨0, v⟩, (D v).1), (prod_image (by simp)).ge,
      forall_mem_image.2 (⟨_, k.1 · ·⟩)⟩) hw
    (by grw [← hy, ← ‹2 ≤ S.tailScale›]; bound) R hOmit hLink)

lemma editor_omitted_link_large [WeilData E] (A : Finset (S.chosenPlaces 0))
    (hLarge : 3*numInfPlaces E ≤ 4*#A) :
    S.tailScale ^ 12 / (↑(S.levelPrime 0 ^ #A : ℕ) : ℝ) ^ 𝔰.k * S.mainEnergy ≤
      (S.b ^ (6 * 𝔰.k))⁻¹ ^ #A * S.mainEnergy := S.of_size_bounds (by
  intros
  have hj := editor_large_omission_exponents 𝔰.k (numInfPlaces E) #A hLarge
  have hb : 0 < S.b := by bound
  have hq : S.b ^ 10 ≤ (S.levelPrime 0 : ℝ) := S.le_levelPrime 0
  have ht : S.tailScale ^ 12 = S.b ^ (3*(𝔰.k*numInfPlaces E)) := by
    rw [show (12 : ℕ) = 4*3 by decide, pow_mul, tailScale_pow_four, ← pow_mul]
    congr 1 <;> ring
  have hP : S.b ^ (3*(𝔰.k*numInfPlaces E)) * S.b ^ (6*𝔰.k*#A) ≤
      ((S.levelPrime 0 : ℝ)^#A)^𝔰.k := by
    rw [← pow_add]
    calc
      _ ≤ S.b ^ (10*#A*𝔰.k) := pow_le_pow_right₀ S.one_le_b hj
      _ = ((S.b^10)^#A)^𝔰.k := by simp only [pow_mul]
      _ ≤ _ := by gcongr
  apply mul_le_mul_of_nonneg_right _ (by positivity)
  rw [ht, Nat.cast_pow, inv_pow, ← pow_mul]
  apply (div_le_iff₀ (by positivity)).2
  apply (le_div_iff₀ (by positivity : 0 < S.b^(6*𝔰.k*#A))).2
  simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using hP)

lemma editor_local_integer_of_two_links [WeilData E] (hEmpty : ∀ D, linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet (∅ : Finset (S.chosenPlaces 0)) D) Set.univ ≤
    ENNReal.ofReal ((1 + (S.b ^ 2)⁻¹ / 4) * S.mainEnergy * S.unipCovolume ^ 2))
  (hSmall : ∀ (A : Finset (S.chosenPlaces 0)) D, A ≠ ∅ → 4 * #A < 3 * numInfPlaces E →
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet A D) Set.univ ≤
    ENNReal.ofReal (((S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A * S.mainEnergy / 2) * S.unipCovolume ^ 2)) :
    ∀ A D, energy (S.amplitudeSum .univ) (fixingSet A D) ≤
    (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A) := by
  intro A D
  have hb : 0 < S.b := by bound [S.thousand_le_b]
  let e : ℝ := (S.b^2)⁻¹
  let Y : ℝ := (S.b^(6*𝔰.k))⁻¹ ^ #A * S.mainEnergy
  let Z : ℝ := (S.b^(23*𝔰.k/4))⁻¹ ^ #A * S.mainEnergy
  have hE : 0 ≤ S.mainEnergy := by unfold mainEnergy; positivity
  have hY : Y ≤ Z := by
    dsimp [Y,Z]
    apply mul_le_mul_of_nonneg_right _ hE
    gcongr <;> first | omega | bound [S.one_le_b]
  have hZ : 0 ≤ Z := by dsimp [Z]; positivity
  have he : e ≤ 1/1000 := by dsimp [e]; bound [S.thousand_le_b]
  have he0 : 0 ≤ e := by dsimp [e]; positivity
  have hd : (S.b^4)⁻¹ = e^2 := by simp only [e, ← inv_pow, ← pow_mul]; norm_num
  have hz : (S.b^12)⁻¹ = e^6 := by simp only [e, ← inv_pow, ← pow_mul]; norm_num
  obtain ⟨hG,hR,hL⟩ := editor_coarse_link_multipliers e he0 he
  have hTarget : (1 - (S.b ^ 4)⁻¹) * ((1 + (S.b ^ 2)⁻¹) * S.mainEnergy * (S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A) =
      ((1-e^2)*(1+e))*Z := by rw [hd]; dsimp [Z,e]; ring
  rw [hTarget]
  by_cases hLarge : 3*numInfPlaces E ≤ 4*#A
  · have H := editor_crude_fixingSet_link (S := S) A D (w := 0) le_rfl (∅ : Set _)
      (fun _ ↦ editor_omitted_link_large (S := S) A hLarge) (by simp [linkEnergy])
    change energy (S.amplitudeSum .univ) (fixingSet A D) ≤
      (1+(S.b^4)⁻¹)^2*0+(S.b^12)⁻¹*Y at H
    rw [hd,hz,mul_zero,zero_add] at H
    exact H.trans ((mul_le_mul_of_nonneg_left hY (by positivity)).trans
      (mul_le_mul_of_nonneg_right hL hZ))
  · by_cases hA : A = ∅
    · subst A
      have H := editor_crude_fixingSet_link (S := S) ∅ D
        (w := (1+e/4)*S.mainEnergy) (by positivity) Set.univ (by simp) (hEmpty D)
      simp only [Finset.card_empty,pow_zero,one_mul] at H
      rw [hd,hz] at H
      have hZE : Z = S.mainEnergy := by simp [Z]
      rw [hZE]
      exact H.trans (by calc
        _ = ((1+e^2)^2*(1+e/4)+e^6)*S.mainEnergy := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_right hG hE)
    · have H := editor_crude_fixingSet_link (S := S) A D
        (w := Z/2) (by positivity) Set.univ (by simp) (hSmall A D hA (by omega))
      change energy (S.amplitudeSum .univ) (fixingSet A D) ≤
        (1+(S.b^4)⁻¹)^2*(Z/2)+(S.b^12)⁻¹*Y at H
      rw [hd,hz] at H
      exact H.trans (calc
        _ ≤ (1+e^2)^2*(Z/2)+e^6*Z := by gcongr
        _ = ((1+e^2)^2/2+e^6)*Z := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_right hR hZ)

variable {V} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

lemma Fits.editor_exists_translate_finrank_comap_le_two_links [WeilData E] (hEmpty : ∀ D, linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet (∅ : Finset (S.chosenPlaces 0)) D) Set.univ ≤
    ENNReal.ofReal ((1 + (S.b ^ 2)⁻¹ / 4) * S.mainEnergy * S.unipCovolume ^ 2))
  (hSmall : ∀ (A : Finset (S.chosenPlaces 0)) D, A ≠ ∅ → 4 * #A < 3 * numInfPlaces E →
    linkEnergy (Set.univ ∩ {γ | S.termDisc γ ≠ 0}) (fixingSet A D) Set.univ ≤
    ENNReal.ofReal (((S.b ^ (23 * 𝔰.k / 4))⁻¹ ^ #A * S.mainEnergy / 2) * S.unipCovolume ^ 2)) {g c} [Module.Finite ℂ V] {ρ :
  Representation ℂ _ V} (hρ : ∀ s x y, ⟪ρ s x, ρ s y⟫_ℂ = ⟪x, y⟫_ℂ) {Q :
  EuclideanSpace ℂ (_ × _) →ₗ[ℂ] V} (hQ : ∀ s x y, ⟪ρ s (Q (.single y 1)), Q (.single x 1)⟫_ℂ =
  ofReal c * S.amplitudeSum .univ x.1 s y.1 (x.2, y.2)) (hg : ∀ i, IsCentralProj (g i)) (hb : ∀ i,
  ((1 - g i).coeff 1).re ≤ (S.b ^ 8)⁻¹ / 2) (hc : 0 < c) (hD : finrank ℂ (ρ.asAlgebraHom
  (piTensorElem g)).range ≤ Nat.card S.GRes * S.besselDegree * mass E 𝔰.r) : IsSpread
  ((ρ.asAlgebraHom (piTensorElem g)).rangeRestrict ∘ₗ ρ · ∘ₗ Q) (5 * (S.b ^ 4)⁻¹ + (S.b ^ 2)⁻¹ / 2) :=
  Fits.editor_exists_translate_finrank_comap_le_integer
    (editor_local_integer_of_two_links hEmpty hSmall) hρ hQ hg hb hc hD

#print axioms editor_coarse_link_multipliers
#print axioms editor_large_omission_exponents
#print axioms editor_crude_fixingSet_link
#print axioms editor_omitted_link_large
#print axioms editor_local_integer_of_two_links
#print axioms Fits.editor_exists_translate_finrank_comap_le_two_links

end Filling

/-
Green regular-character lane — Lean companion (Grok, 2026-11-24).
Upstream: leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005,
  src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProof.lean
  (theorem GlobalTheory.greenRegularCharacters_holds and helpers family/count/factor_lab/prod_factors).
Part 1 restates the upstream exhaustion argument with the cuspidality predicate ABSTRACTED
(the upstream proof never unfolds IsCusp), and with the four upstream dependencies taken as
explicit hypotheses with their exact upstream statements. Part 2 instantiates the predicate with a
verbatim restatement of upstream IsCusp and states GreenRegularCharacters exactly.
No sorry, no axiom. The proof bodies follow the upstream bodies line for line.
-/
import Mathlib

noncomputable section
open Polynomial
open scoped Classical

namespace GreenCompanion

abbrev Gn (g n : ℕ) : Type := GL (Fin n) (ZMod g)
abbrev Mt (g n : ℕ) : Type := Matrix (Fin n) (Fin n) (ZMod g)
abbrev Pc (g : ℕ) : Type := Σ d : ℕ, Gn g d → ℂ

def IsPrimeLab {g : ℕ} (d : ℕ) (P : (ZMod g)[X]) : Prop :=
  P.Monic ∧ Irreducible P ∧ P.coeff 0 ≠ 0 ∧ P.natDegree = d

def IsRegularChar (g d : ℕ) {K : Type} [Field K] (θ : Kˣ →* ℂˣ) : Prop :=
  ∀ i j, i < d → j < d → θ ^ g ^ i = θ ^ g ^ j → i = j

/-! ## Part 1: the shared mechanism, generic in the cuspidality predicate `Cusp`. -/
section Generic
variable (Cusp : ∀ {g : ℕ} [Fact g.Prime] {d : ℕ}, (Gn g d → ℂ) → Prop)

/-- Statement of upstream `GlobalTheory.T.exists_cuspidalCharacter_of_regularCharacter_GLn`, generic in `Cusp`. -/
def ExistsPart : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (d : ℕ), 0 < d → ∀ (K : Type) [Field K] [Algebra (ZMod g) K],
    Module.finrank (ZMod g) K = d → ∃ τ : (Kˣ →* ℂˣ) → Gn g d → ℂ,
      (∀ θ, IsRegularChar g d θ → Cusp (τ θ) ∧ τ θ 1 = ∏ i ∈ Finset.Ico 1 d, ((g : ℂ) ^ i - 1) ∧
        ∀ y : Gn g d, Irreducible (y : Mt g d).charpoly → ∀ z : Kˣ, aeval (z : K) (y : Mt g d).charpoly = 0 →
          τ θ y = (-1) ^ (d - 1) * ∑ i ∈ Finset.range d, ((θ (z ^ g ^ i) : ℂˣ) : ℂ)) ∧
      (∀ θ θ', IsRegularChar g d θ → IsRegularChar g d θ' → (τ θ = τ θ' ↔ ∃ i < d, θ' = θ ^ g ^ i))

/-- Statement of upstream `GlobalTheory.T.monicIrreducible_inject_regularCharacterOrbits`. -/
def InjectPart : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (d : ℕ), 0 < d → ∀ (K : Type) [Field K] [Algebra (ZMod g) K],
    Module.finrank (ZMod g) K = d → ∃ c : (ZMod g)[X] → (Kˣ →* ℂˣ),
      (∀ P, IsPrimeLab d P → IsRegularChar g d (c P)) ∧
      ∀ P P', IsPrimeLab d P → IsPrimeLab d P' → (∃ i < d, c P' = c P ^ g ^ i) → P = P'

/-- Statement of upstream `GlobalTheory.T.card_cuspidal_multisets_total_degree_le`, generic in `Cusp`. -/
def CardPart : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (n : ℕ), 0 < n → ∀ S : Finset (Multiset (Pc g)),
    (∀ M ∈ S, (M.map fun p => p.1).sum = n ∧ ∀ p ∈ M, Cusp p.2) → S.card ≤ g ^ n - g ^ (n - 1)

/-- Statement of upstream `GlobalTheory.T.ncard_monic_natDegree_coeff_zero_ne_zero`. -/
def PolyPart : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (n : ℕ), 0 < n →
    Set.ncard {f : (ZMod g)[X] | f.Monic ∧ f.natDegree = n ∧ f.coeff 0 ≠ 0} = g ^ n - g ^ (n - 1) ∧
    Set.Finite {f : (ZMod g)[X] | f.Monic ∧ f.natDegree = n ∧ f.coeff 0 ≠ 0}

/-- `GreenRegularCharacters`, generic in `Cusp`. -/
def GreenRegularCharactersFor : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (d : ℕ), 0 < d → ∀ (K : Type) [Field K] [Algebra (ZMod g) K],
    Module.finrank (ZMod g) K = d →
    ∃ τ : (Kˣ →* ℂˣ) → Gn g d → ℂ,
      (∀ θ, IsRegularChar g d θ → Cusp (τ θ) ∧ τ θ 1 = ∏ i ∈ Finset.Ico 1 d, ((g : ℂ) ^ i - 1) ∧
        ∀ y : Gn g d, Irreducible (y : Mt g d).charpoly → ∀ z : Kˣ, aeval (z : K) (y : Mt g d).charpoly = 0 →
          τ θ y = (-1) ^ (d - 1) * ∑ i ∈ Finset.range d, ((θ (z ^ g ^ i) : ℂˣ) : ℂ)) ∧
      (∀ θ θ', IsRegularChar g d θ → IsRegularChar g d θ' → (τ θ = τ θ' ↔ ∃ i < d, θ' = θ ^ g ^ i)) ∧
      ∀ χ : Gn g d → ℂ, Cusp χ → ∃ θ, IsRegularChar g d θ ∧ χ = τ θ

variable {g : ℕ} [Fact g.Prime]

theorem isPrimeLab_pos {e : ℕ} {P : (ZMod g)[X]} (h : IsPrimeLab e P) : 0 < e := by
  have := degree_pos_of_irreducible h.2.1
  rw [← h.2.2.2]
  exact natDegree_pos_iff_degree_pos.mpr this

theorem factor_lab {f : (ZMod g)[X]} (h0 : f.coeff 0 ≠ 0) :
    ∀ P ∈ UniqueFactorizationMonoid.normalizedFactors f, IsPrimeLab P.natDegree P := by
  intro P hP
  have hirr := UniqueFactorizationMonoid.irreducible_of_normalized_factor P hP
  have hmon : P.Monic := by
    rw [← UniqueFactorizationMonoid.normalize_normalized_factor P hP]
    exact monic_normalize hirr.ne_zero
  refine ⟨hmon, hirr, ?_, rfl⟩
  intro hc
  have : (X : (ZMod g)[X]) ∣ f :=
    (X_dvd_iff.mpr hc).trans (UniqueFactorizationMonoid.dvd_of_mem_normalizedFactors hP)
  exact h0 (X_dvd_iff.mp this)

theorem prod_factors {f : (ZMod g)[X]} (hf : f.Monic) (h0 : f.coeff 0 ≠ 0) :
    (UniqueFactorizationMonoid.normalizedFactors f).prod = f := by
  have hm : ((UniqueFactorizationMonoid.normalizedFactors f).prod).Monic := by
    have := monic_multiset_prod_of_monic (UniqueFactorizationMonoid.normalizedFactors f) id
      (fun P hP => (factor_lab h0 P hP).1)
    simpa using this
  exact eq_of_monic_of_associated hm hf (UniqueFactorizationMonoid.prod_normalizedFactors hf.ne_zero)

omit [Fact g.Prime] in
theorem sigma_mk_inj {d : ℕ} {a b : Gn g d → ℂ} (h : (⟨d, a⟩ : Pc g) = ⟨d, b⟩) : a = b :=
  sigma_mk_injective h

theorem family (hInj : InjectPart) (e : ℕ) (he : 0 < e) (K : Type) [Field K] [Algebra (ZMod g) K]
    (hK : Module.finrank (ZMod g) K = e) (τ : (Kˣ →* ℂˣ) → Gn g e → ℂ)
    (h1 : ∀ θ, IsRegularChar g e θ → Cusp (τ θ))
    (h2 : ∀ θ θ', IsRegularChar g e θ → IsRegularChar g e θ' → (τ θ = τ θ' ↔ ∃ i < e, θ' = θ ^ g ^ i)) :
    ∃ L : (ZMod g)[X] → Gn g e → ℂ,
      (∀ P, IsPrimeLab e P → Cusp (L P) ∧ ∃ θ, IsRegularChar g e θ ∧ L P = τ θ) ∧
      ∀ P P', IsPrimeLab e P → IsPrimeLab e P' → L P = L P' → P = P' := by
  obtain ⟨c, hc1, hc2⟩ := hInj g e he K hK
  refine ⟨fun P => τ (c P), fun P hP => ⟨h1 _ (hc1 P hP), c P, hc1 P hP, rfl⟩, ?_⟩
  intro P P' hP hP' h
  exact hc2 P P' hP hP' ((h2 _ _ (hc1 P hP) (hc1 P' hP')).mp h)

theorem count (hCard : CardPart Cusp) (hPoly : PolyPart)
    (d : ℕ) (hd : 0 < d) (Lf : ∀ e, (ZMod g)[X] → Gn g e → ℂ)
    (hc : ∀ e P, IsPrimeLab e P → Cusp (Lf e P))
    (hi : ∀ e P P', IsPrimeLab e P → IsPrimeLab e P' → Lf e P = Lf e P' → P = P')
    (χ : Gn g d → ℂ) (hχ : Cusp χ) (hne : ∀ P, IsPrimeLab d P → Lf d P ≠ χ) : False := by
  let s : Set (ZMod g)[X] := {P | IsPrimeLab P.natDegree P}
  let φ : (ZMod g)[X] → Pc g := fun P => ⟨P.natDegree, Lf P.natDegree P⟩
  have hinj : Set.InjOn φ s := by
    intro P hP P' hP' h
    have h1 : P.natDegree = P'.natDegree := congrArg Sigma.fst h
    have h2 : (⟨P'.natDegree, Lf P'.natDegree P'⟩ : Pc g) = ⟨P.natDegree, Lf P.natDegree P'⟩ := by rw [h1]
    have h3 : Lf P.natDegree P = Lf P.natDegree P' := sigma_mk_inj (h.trans h2)
    have hP'' : IsPrimeLab P.natDegree P' := by rw [h1]; exact hP'
    exact hi _ P P' hP hP'' h3
  let ψ : Pc g → (ZMod g)[X] := Function.invFunOn φ s
  have hleft : ∀ P ∈ s, ψ (φ P) = P := fun P hP => hinj.leftInvOn_invFunOn hP
  let T : Set (ZMod g)[X] := {f | f.Monic ∧ f.natDegree = d ∧ f.coeff 0 ≠ 0}
  obtain ⟨hcard, hfin⟩ := hPoly g d hd
  let F : (ZMod g)[X] → Multiset (Pc g) := fun f => (UniqueFactorizationMonoid.normalizedFactors f).map φ
  have hback : ∀ f ∈ T, (F f).map ψ = UniqueFactorizationMonoid.normalizedFactors f := by
    intro f hf
    simp only [F, Multiset.map_map]
    conv_rhs => rw [← Multiset.map_id (UniqueFactorizationMonoid.normalizedFactors f)]
    exact Multiset.map_congr rfl (fun P hP => hleft P (factor_lab hf.2.2 P hP))
  have hFinj : Set.InjOn F T := by
    intro f hf f' hf' h
    have := congrArg (fun M => (M.map ψ).prod) h
    simp only [hback f hf, hback f' hf'] at this
    rwa [prod_factors hf.1 hf.2.2, prod_factors hf'.1 hf'.2.2] at this
  have hnot : ({⟨d, χ⟩} : Multiset (Pc g)) ∉ hfin.toFinset.image F := by
    intro hmem
    obtain ⟨f, hf, hfe⟩ := Finset.mem_image.mp hmem
    rw [Set.Finite.mem_toFinset] at hf
    have hnf := hback f hf
    rw [hfe, Multiset.map_singleton] at hnf
    have hPmem : ψ ⟨d, χ⟩ ∈ UniqueFactorizationMonoid.normalizedFactors f := by
      rw [← hnf]; exact Multiset.mem_singleton_self _
    have hPl := factor_lab hf.2.2 _ hPmem
    have hφ : φ (ψ ⟨d, χ⟩) = ⟨d, χ⟩ := by
      have := hfe
      simp only [F] at this
      rw [← hnf, Multiset.map_singleton, Multiset.singleton_inj] at this
      exact this
    set P := ψ ⟨d, χ⟩ with hPdef
    have hdeg : P.natDegree = d := congrArg Sigma.fst hφ
    have h2 : (⟨d, Lf d P⟩ : Pc g) = ⟨P.natDegree, Lf P.natDegree P⟩ := by rw [hdeg]
    have h3 : Lf d P = χ := sigma_mk_inj (h2.trans hφ)
    have hPl' : IsPrimeLab d P := by rw [← hdeg]; exact hPl
    exact hne P hPl' h3
  let S : Finset (Multiset (Pc g)) := insert {⟨d, χ⟩} (hfin.toFinset.image F)
  have hS : ∀ M ∈ S, (M.map fun p => p.1).sum = d ∧ ∀ p ∈ M, Cusp p.2 := by
    intro M hM
    rcases Finset.mem_insert.mp hM with rfl | hM
    · refine ⟨by simp, ?_⟩
      intro p hp
      rw [Multiset.mem_singleton] at hp
      subst hp
      exact hχ
    · obtain ⟨f, hf, rfl⟩ := Finset.mem_image.mp hM
      rw [Set.Finite.mem_toFinset] at hf
      refine ⟨?_, ?_⟩
      · simp only [F, Multiset.map_map]
        have hdeg := natDegree_multiset_prod_of_monic (UniqueFactorizationMonoid.normalizedFactors f)
          (fun P hP => (factor_lab hf.2.2 P hP).1)
        rw [prod_factors hf.1 hf.2.2, hf.2.1] at hdeg
        rw [hdeg]
        rfl
      · intro p hp
        obtain ⟨P, hP, rfl⟩ := Multiset.mem_map.mp hp
        exact hc _ P (factor_lab hf.2.2 P hP)
  have hle := hCard g d hd S hS
  have hcardS : S.card = g ^ d - g ^ (d - 1) + 1 := by
    rw [Finset.card_insert_of_notMem hnot, Finset.card_image_of_injOn, ← hcard,
      Set.ncard_eq_toFinset_card T hfin]
    rw [Set.Finite.coe_toFinset]
    exact hFinj
  omega

/-- The shared mechanism: existence + label injection + the two counts give exhaustion. -/
theorem greenRegularCharacters_of_parts (hEx : ExistsPart Cusp) (hInj : InjectPart)
    (hCard : CardPart Cusp) (hPoly : PolyPart) : GreenRegularCharactersFor Cusp := by
  intro g _ d hd K _ _ hK
  obtain ⟨τ, hτ1, hτ2⟩ := hEx g d hd K hK
  refine ⟨τ, hτ1, hτ2, ?_⟩
  have hex : ∀ e, ∃ L : (ZMod g)[X] → Gn g e → ℂ,
      (∀ P, IsPrimeLab e P → Cusp (L P)) ∧
      (∀ P P', IsPrimeLab e P → IsPrimeLab e P' → L P = L P' → P = P') ∧
      (∀ _ : e = d, ∀ P, IsPrimeLab e P → ∃ θ, IsRegularChar g d θ ∧ (⟨e, L P⟩ : Pc g) = ⟨d, τ θ⟩) := by
    intro e
    by_cases hed : e = d
    · subst hed
      obtain ⟨L, hL1, hL2⟩ := family Cusp hInj e hd K hK τ (fun θ hθ => (hτ1 θ hθ).1) hτ2
      refine ⟨L, fun P hP => (hL1 P hP).1, hL2, fun _ P hP => ?_⟩
      obtain ⟨θ, hθ, he⟩ := (hL1 P hP).2
      exact ⟨θ, hθ, by rw [he]⟩
    · by_cases he0 : e = 0
      · refine ⟨fun _ _ => 0, fun P hP => absurd (isPrimeLab_pos hP) (by omega),
          fun P _ hP _ _ => absurd (isPrimeLab_pos hP) (by omega), fun h => absurd h hed⟩
      · have hpos : 0 < e := Nat.pos_of_ne_zero he0
        obtain ⟨τ', hτ'1, hτ'2⟩ := hEx g e hpos (GaloisField g e) (GaloisField.finrank g he0)
        obtain ⟨L, hL1, hL2⟩ := family Cusp hInj e hpos (GaloisField g e) (GaloisField.finrank g he0) τ'
          (fun θ hθ => (hτ'1 θ hθ).1) hτ'2
        exact ⟨L, fun P hP => (hL1 P hP).1, hL2, fun h => absurd h hed⟩
  choose Lf hc hi hdd using hex
  intro χ hχ
  by_contra hno
  push Not at hno
  refine count Cusp hCard hPoly d hd Lf hc hi χ hχ ?_
  intro P hP heq
  obtain ⟨θ, hθ, hs⟩ := hdd d rfl P hP
  have : Lf d P = τ θ := sigma_mk_inj hs
  exact hno θ hθ (heq ▸ this)

end Generic

/-! ## Part 2: verbatim upstream cuspidality predicate, and the exact upstream proposition. -/
section Faithful
variable {g : ℕ} [Fact g.Prime]

def entN {A : Type} [Zero A] {N : ℕ} (M : Matrix (Fin N) (Fin N) A) (a b : ℕ) : A :=
  if h : a < N ∧ b < N then M ⟨a, h.1⟩ ⟨b, h.2⟩ else 0
def IsIrr {G : Type} [Group G] (χ : G → ℂ) : Prop :=
  ∃ V : FDRep ℂ G, CategoryTheory.Simple V ∧ ∀ x, V.character x = χ x
def tl (a : ℕ) {n : ℕ} (M : Mt g n) : Mt g a := fun i j => entN M i j
def br (a b : ℕ) {n : ℕ} (M : Mt g n) : Mt g b := fun i j => entN M (a + i) (a + j)
def InPar (a : ℕ) {n : ℕ} (M : Mt g n) : Prop := ∀ i j : Fin n, (j : ℕ) < a → a ≤ (i : ℕ) → M i j = 0
def res (a b : ℕ) {n : ℕ} (χ : Gn g n → ℂ) : Gn g a → Gn g b → ℂ := fun h₁ h₂ =>
  ((g : ℂ) ^ (a * b))⁻¹ * ∑ x : Gn g n,
    if InPar a (x : Mt g n) ∧ tl a (x : Mt g n) = (h₁ : Mt g a) ∧ br a b (x : Mt g n) = (h₂ : Mt g b) then χ x else 0

/-- Verbatim restatement of upstream `GlobalTheory.GLq.IsCusp` (LabelDatum.lean). -/
def IsCusp {d : ℕ} (χ : Gn g d → ℂ) : Prop :=
  0 < d ∧ IsIrr χ ∧ ∀ a, 0 < a → a < d → res a (d - a) χ 1 1 = 0

/-- Upstream `GlobalTheory.Published.GreenRegularCharacters`, with the verbatim `IsCusp`. -/
abbrev GreenRegularCharacters : Prop := GreenRegularCharactersFor (fun χ => IsCusp χ)

/-- Exact upstream theorem `GlobalTheory.greenRegularCharacters_holds`, conditional on its four
upstream dependencies (stated with their exact upstream types, cuspidality = verbatim `IsCusp`). -/
theorem greenRegularCharacters_holds_of_deps
    (hEx : ExistsPart (fun χ => IsCusp χ)) (hInj : InjectPart)
    (hCard : CardPart (fun χ => IsCusp χ)) (hPoly : PolyPart) : GreenRegularCharacters :=
  greenRegularCharacters_of_parts _ hEx hInj hCard hPoly

end Faithful
end GreenCompanion

#print axioms GreenCompanion.greenRegularCharacters_of_parts
#print axioms GreenCompanion.greenRegularCharacters_holds_of_deps


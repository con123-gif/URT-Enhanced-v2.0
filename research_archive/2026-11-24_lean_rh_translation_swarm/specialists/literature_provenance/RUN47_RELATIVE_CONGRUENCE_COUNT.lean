import Development.AutomorphicArithmetic.AutomorphicVarieties.AutomorphicForms.TemperedLocalComponents.CohBoundFree
import Development.AutomorphicArithmetic.AutomorphicVarieties.BuildingsResidueChars.CardOhatQuotientNatCast
import RUN46_CLOZEL_FIXED_DEGREE_WEIGHTED_COUNT
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47 literature — 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED NOT COMPILED. RH OPEN.
Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine;
source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed
ef1760f555d5386fe8eea9c663110f7b8d08e467 (not migrated).
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
AGENTS, continuity, state, runner protocol, SWARM/HANDOFF/EXPANSION consulted; recent
commits through 6a2cb73b inspected; full peer patches 86b7bdd4, 17b56ded1,
58dbb472 checked for overlap. RUN46 weighted comparison remains explicitly open.

RESULT: relative congruence index at actual cohBoundFree consumer.
For any commutative ring R and finite R/(b), write K_a=ker(GL_n(R)->GL_n(R/(a))).
Reduction f modulo ab has kernel K_ab; [K_a:K_ab] is |f(K_a)|.
Choose a representative g=I+aZ for each element of f(K_a), with entries of Z
in R; no unique division by a or torsion-free assumption needed. Map each
image element to the chosen Z mod b. If two chosen matrices agree mod b,
then g-g'=a(Z-Z') is entrywise divisible by ab, so the original two image
elements agree. Thus injection, no reduction surjectivity, CRT, prime-to-3,
or invertibility of a needed. The index is finite and positive.
Apply R=Ohat(F), a=3,b=M and native CardOhat bound |R/M| <= M^[F:Q].
Transport through injective integral GL map as in native KLevIdx. Therefore
  0 < [KLev(F,n,3):KLev(F,n,3M)] <= M^(D*n*n), D=[F:Q].
Original cohBound_of fixes SAME base KLev(F,n,3), obtains c from gen,
then estimates relative index by full level 3M index, giving
c*3^(D*n*n)*M^(D*n*n)*d. Substitute direct relative estimate:
cohDim Gamma KLev(3M) xi <= c*M^(D*n*n)*d, SAME c supplied by gen,
uniform in M,d,xi; no new mathematical premise. Retain original KLevIdx
for initial finite-orbit construction at level 3. No exponent change or
uniformity of base c across fields proved. For imaginary quadratic rank 3
the removed multiplier is 3^18=387420489. Combined with RUN46 at same host
and level the conditional count is
2^(r2*(n-1))*|S| <= c*c1*M^(D*n*n)*(H+1)^A1.
Weighted comparison NOT discharged. No VWin or RH closure.

Native blobs: CohBoundFree 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0;
LevelSubgroupIndexBoundOfCardOhat c19e3a8ca4ed692bfaccfb995feb2d6acfb321b9;
CardOhatQuotientNatCast 1f076aaf0fcbfee49be91ef9a4e082e4ccaf7b83;
KLevTop ad9db68ebe592a52e2c24bfeb99c5ee8190c181d;
TCardK c6eb1d67f72c45007e3330ea65b0966f3f27cd96;
BrCardP a2e96d9c993a392281385cc7f723acf78e614b21;
RUN46 08c6d98ac8102e4ab694ceab40d670cfae204237.
Original graph: CountK/P -> CardK/P -> cohBoundFree -> cohBound_of ->
gen + KLevIdx (base 3 and full 3M) + CardOhat and arithmetic orbit suppliers.
Candidate: same CountK/P via RUN46, CardK/P -> cohBoundRelative47 ->
cohBound_of (copied) -> gen + KLevIdx (base only) + relative_level47 ->
CardOhat + relative_ring47. Other dependencies, unresolved nodes and prior
evidence retained. Context key pin/toolchain/F/n/Gamma/M/d/xi, same base
constant and RUN46 matched premise. Backtrack to original on failure.
21 guarded source checks executed. 144 exact finite-ring cases
in Z/(ab), a=1..6,b=1..12,n=1,2, 364728 candidate matrices enumerated;
44 cases attain bound. Regression only, not proof of arithmetic comparison.
Local Lean/lake/elan absent. Historical CI status.json for 45577239749 and
45576756833 retrieved and pass only for those versions. New candidate not
compiled or queued; no new axiom or kernel PASS. Stage RUN46 as its filename
module; preserve protected workflows and prior files.
RESUME HERE: compile relative_ring47 and relative_level47, check actual
cohBoundRelative47 and CountK/P substitutions; audit original/reduced
constructor-inclusive graph and axioms; retain weighted comparison open,
then return to full-window uniform quantitative supply.
HANDOFF TO integration, kernel, audit, Galois. RH OPEN.
-/

noncomputable section
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.AlgRepEndIrreducible UpperTheory.V.Af

namespace RHLitRelative47

theorem relative_ring47 (R : Type) [CommRing R] (n a b : ℕ)
    [Finite (R ⧸ Ideal.span {(b : R)})] :
    let f := Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.mk (Ideal.span {((a * b : ℕ) : R)}))
    let k := (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.mk (Ideal.span {(a : R)}))).ker
    f.ker.relIndex k ≠ 0 ∧ f.ker.relIndex k ≤ Nat.card (R ⧸ Ideal.span {(b : R)}) ^ (n * n) := by
  classical
  dsimp only
  let f := Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.mk (Ideal.span {((a * b : ℕ) : R)}))
  let k := (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.mk (Ideal.span {(a : R)}))).ker
  change f.ker.relIndex k ≠ 0 ∧ f.ker.relIndex k ≤ _
  rw [Subgroup.relIndex_ker]
  have ex : ∀ y : ↥(k.map f), ∃ x : GL (Fin n) R, x ∈ k ∧ f x = y.1 := fun y => y.2
  choose x hx he using ex
  have exz : ∀ (y : ↥(k.map f)) (i j : Fin n), ∃ z : R,
      x y i j - (1 : Matrix (Fin n) (Fin n) R) i j = (a : R) * z := by
    intro y i j
    have hred : Matrix.GeneralLinearGroup.map (n := Fin n)
        (Ideal.Quotient.mk (Ideal.span {(a : R)})) (x y) = 1 := hx y
    have h := congrArg (fun g : GL (Fin n) (R ⧸ Ideal.span {(a : R)}) => g i j) hred
    have h1 : Ideal.Quotient.mk (Ideal.span {(a : R)}) ((1 : Matrix (Fin n) (Fin n) R) i j) =
        (1 : Matrix (Fin n) (Fin n) (R ⧸ Ideal.span {(a : R)})) i j := by
      simp only [Matrix.one_apply]; split_ifs <;> simp
    change Ideal.Quotient.mk (Ideal.span {(a : R)}) (x y i j) = _ at h
    rw [← h1] at h
    exact Ideal.mem_span_singleton.1 (Ideal.Quotient.eq.1 h)
  choose z hz using exz
  let t : ↥(k.map f) → (Fin n → Fin n → R ⧸ Ideal.span {(b : R)}) :=
    fun y i j => Ideal.Quotient.mk _ (z y i j)
  have ht : Function.Injective t := by
    intro u v huv
    apply Subtype.ext
    rw [← he u, ← he v]
    apply Units.ext
    apply Matrix.ext
    intro i j
    have h := congrFun (congrFun huv i) j
    change Ideal.Quotient.mk (Ideal.span {(b : R)}) (z u i j) =
      Ideal.Quotient.mk (Ideal.span {(b : R)}) (z v i j) at h
    obtain ⟨w, hw⟩ := Ideal.mem_span_singleton.1 (Ideal.Quotient.eq.1 h)
    change Ideal.Quotient.mk (Ideal.span {((a * b : ℕ) : R)}) (x u i j) =
      Ideal.Quotient.mk (Ideal.span {((a * b : ℕ) : R)}) (x v i j)
    apply Ideal.Quotient.eq.2
    refine Ideal.mem_span_singleton.2 ⟨w, ?_⟩
    rw [Nat.cast_mul]
    linear_combination hz u i j - hz v i j + (a : R) * hw
  letI : Finite ↥(k.map f) := Finite.of_injective t ht
  refine ⟨Nat.card_pos.ne', ?_⟩
  have h := Nat.card_le_card_of_injective t ht
  rw [Nat.card_fun, Nat.card_fun, ← pow_mul] at h
  simpa using h

end RHLitRelative47

theorem relative_level47 (F : Type) [Field F] [NumberField F] (n M : ℕ) (hM : 1 ≤ M) :
    (KLev F n (3 * M)).relIndex (KLev F n 3) ≠ 0 ∧
    (KLev F n (3 * M)).relIndex (KLev F n 3) ≤ M ^ (Module.finrank ℚ F * (n * n)) := by
  obtain ⟨hfin, hcard⟩ := UpperTheory.card_ohat_quotient_natCast F M hM
  letI : Finite (↥(Ohat F) ⧸ Ideal.span {(M : ↥(Ohat F))}) := hfin
  have hj : Function.Injective (Matrix.GeneralLinearGroup.map (n := Fin n) (Ohat F).subtype) := fun x y h =>
    Units.ext (Matrix.ext fun a b => Subtype.ext
      (congrArg (fun z : GL (Fin n) (Af F) => z a b) h))
  unfold KLev
  rw [Subgroup.relIndex_map_map_of_injective _ _ hj]
  obtain ⟨h0, h1⟩ := RHLitRelative47.relative_ring47 ↥(Ohat F) n 3 M
  refine ⟨h0, h1.trans ?_⟩
  rw [pow_mul (M : ℕ)]
  exact Nat.pow_le_pow_left hcard _

open scoped Matrix
open NumberField IsDedekindDomain GlobalTheory.CuspRep CategoryTheory UpperTheory.V.Af UpperTheory.V.Af.CohB

@[reducible] private def act {G H : Type} [Group G] [Group H] (ι : H →* G) (Γ : Subgroup H) (U : Subgroup G) :
    MulAction ↥Γ (G ⧸ U) := MulAction.compHom _ (ι.comp Γ.subtype)

private theorem gen (hE : BddEquiv) (hA : AbsBound) (hF : FibCard) {G H : Type} [Group G] [Group H] (ι : H →* G)
    (Γ : Subgroup H) (U : Subgroup G) (hT : ∃ T : Finset G, ∀ g, ∃ γ ∈ Γ, ∃ t ∈ T, ∃ u ∈ U, g = ι γ * t * u)
    (S : G → Subgroup H) (hS : ∀ g γ, γ ∈ S g ↔ g⁻¹ * ι γ * g ∈ U) (hB : ∀ g, Bdd ↥(Γ ⊓ S g)) :
    ∃ c : ℕ, ∀ U' : Subgroup G, U' ≤ U → U'.relIndex U ≠ 0 → ∀ D : ℕ, U'.relIndex U ≤ D →
      ∀ (d : ℕ) (ξ : ↥Γ →* Matrix (Fin d) (Fin d) ℂ),
        totCoh (Rep.of (@funRep ↥Γ _ (G ⧸ U') (act ι Γ U') d ξ)) ≤ (c * D * d : ℕ) := by
  classical
  letI := act ι Γ U
  have hsm : ∀ (γ : ↥Γ) (g : G), γ • (g : G ⧸ U) = ((ι γ.1 * g : G) : G ⧸ U) := fun _ _ => rfl
  obtain ⟨T, hT'⟩ := hT
  obtain ⟨c, hc⟩ := hA ↥Γ (G ⧸ U)
    ⟨T.image (↑), fun y => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective y
      obtain ⟨γ, hγ, t, ht, u, hu, rfl⟩ := hT' g
      refine ⟨⟨γ⁻¹, Γ.inv_mem hγ⟩, Finset.mem_image.2 ⟨t, ht, ?_⟩⟩
      rw [hsm, QuotientGroup.eq]
      simpa [mul_assoc] using hu⟩
    (fun y => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective y
      have e : MulAction.stabilizer ↥Γ (g : G ⧸ U) = (Γ ⊓ S g).subgroupOf Γ := by
        ext γ
        rw [MulAction.mem_stabilizer_iff, hsm, eq_comm, QuotientGroup.eq, Subgroup.mem_subgroupOf, Subgroup.mem_inf, hS,
          mul_assoc]
        exact ⟨fun h => ⟨γ.2, h⟩, fun h => h.2⟩
      exact hE ↥(Γ ⊓ S g) _
        ⟨((MulEquiv.subgroupCongr e).trans (Subgroup.subgroupOfEquivOfLe inf_le_left)).symm⟩ (hB g))
  refine ⟨c, fun U' hle h0 D hD d ξ => ?_⟩
  letI := act ι Γ U'
  exact hc (G ⧸ U') (Subgroup.quotientMapOfLE hle)
    (fun γ x => by
      obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective x
      rfl) D
    (fun y => by rw [hF _ _ _ hle h0 y]; exact_mod_cast hD) d ξ

private theorem levelRep_eq {F : Type} [Field F] [NumberField F] {n : ℕ} (Γ : Subgroup (GL (Fin n) F))
    (U : Subgroup (GL (Fin n) (Af F))) {d : ℕ} (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ) :
    levelRep Γ U ξ = @funRep ↥Γ _ (GL (Fin n) (Af F) ⧸ U) (act (ratAf F n) Γ U) d (ξ.comp Γ.subtype) := by
  refine MonoidHom.ext fun γ => LinearMap.ext fun f => funext fun x => ?_
  change ξ γ *ᵥ f ((ratAf F n γ.1)⁻¹ • x) = ξ γ *ᵥ f ((ratAf F n (γ.1)⁻¹) • x)
  rw [map_inv]

private theorem cohBound_of (hE : BddEquiv) (hA : AbsBound) (hF : FibCard)
    (hO : FinOrbAbs) (hI : KLevIdx) (hD : FinDC) (h1 : ArithOne) (hC : ArithComm) :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c A : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ A * d : ℕ) := by
  intro F _ _ hF' n Γ hΓ
  obtain ⟨c, hc⟩ := gen hE hA hF (ratAf F n) Γ (KLev F n 3)
    (hO _ _ (ratAf F n) Γ (KLev F n 3) (KLev F n 1) hΓ (hI F n 3 (by norm_num)).1 (hD F n))
    (fun g => arith g (KLev F n 3)) (fun g γ => mem_arith) fun g => (bddArith F hF' n _
      (h1 F n ▸ hC F n Γ hΓ g _ (by apply isOpen_KLev; norm_num) (by apply isCompact_KLev; norm_num)))
  refine ⟨c, Module.finrank ℚ F * (n * n), fun M hM d ξ => ?_⟩
  have hle : KLev F n (3 * M) ≤ KLev F n 3 := KLev_le_of_dvd (dvd_mul_right 3 M)
  obtain ⟨hr0, hr⟩ := relative_level47 F n M hM
  have key := hc _ hle hr0 _ hr d (ξ.comp Γ.subtype)
  rw [← levelRep_eq] at key
  exact key

theorem UpperTheory.V.Af.cohBoundRelative47 :
    ∀ (F : Type) [Field F] [NumberField F], (IsTotallyComplex F ∨ IsTotallyReal F) → ∀ (n : ℕ) (Γ : Subgroup (GL (Fin n) F)),
      Γ.FiniteIndex → ∃ c A : ℕ, ∀ M : ℕ, 1 ≤ M → ∀ (d : ℕ) (ξ : GL (Fin n) F →* Matrix (Fin d) (Fin d) ℂ),
        cohDim Γ (KLev F n (3 * M)) ξ ≤ (c * M ^ A * d : ℕ) :=
  cohBound_of UpperTheory.cohomology_bounded_equiv
    (UpperTheory.absolute_bound_of_partial_bound_of_orbit_bound (UpperTheory.cohomology_part_bound_of_sum_bound UpperTheory.cohomology_sum_bound UpperTheory.cohomology_part_split) (UpperTheory.orbit_bound_of_shapiro_functorial (UpperTheory.shapiro_functorial_of_coinduction_bijective UpperTheory.cohomology_to_coinvariants_injective UpperTheory.cohomology_to_coinvariants_surjective)))
    UpperTheory.adelic_cohomology_fiber_card UpperTheory.adelic_cohomology_finite_orbit_bound (UpperTheory.level_subgroup_index_bound_of_card_ohat UpperTheory.card_ohat_quotient_natCast) UpperTheory.finite_adelic_double_cosets UpperTheory.arithmetic_subgroup_level_one UpperTheory.arithmetic_subgroups_commensurable

private theorem klev_three_lit47 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e


theorem UpperTheory.V.Af.card_k_lit47 :
    UpperTheory.V.Af.MatchedBorelWeighted46 → UpperTheory.V.Af.CardK := by
  intro hMatched K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit46 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundRelative47 K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hWgt := hMatched K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit47 K n M hu)⟩⟩
  have hB := UpperTheory.V.Af.forget_weight46 S.card (2 ^ (Fintype.card (K →+* ℂ) / 2 * (n - 1))) _
    (Nat.succ_le_of_lt (pow_pos (by decide : 0 < (2 : ℕ)) _)) hWgt
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Br.cardP_lit47 :
    UpperTheory.V.Af.MatchedBorelWeighted46 → UpperTheory.V.Br.CardP := by
  intro hMatched K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit46 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundRelative47 K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hWgt := hMatched K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit47 K n M hu)⟩⟩
  have hB := UpperTheory.V.Af.forget_weight46 S.card (2 ^ (Fintype.card (K →+* ℂ) / 2 * (n - 1))) _
    (Nat.succ_le_of_lt (pow_pos (by decide : 0 < (2 : ℕ)) _)) hWgt
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring


set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
namespace UpperTheory.GalN.V.Win.N
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep UpperTheory.V.Af in
theorem countK_alt_lit47 :
    _root_.UpperTheory.V.Af.MatchedBorelWeighted46 → _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.Win.N.CountKAlt := by
  intro hMatched hP hL K _ _ _ n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_lit47 hMatched K n hn
  refine ⟨c, A, fun m hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigK K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigK K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.V.Af.conjK_alt hP K n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := 1 - n)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intK_of_prints hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmKNAlt ι M m r}, ∃ π : ↥(SigK K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut.1
    obtain ⟨hπ, hF⟩ := hL K n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.odd (r.2.aut.2 r.2.level.cont) h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm
end
section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep UpperTheory.V.Af in
theorem countP_alt_lit47 :
    _root_.UpperTheory.V.Af.MatchedBorelWeighted46 → _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hMatched hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_lit47 hMatched K n hn
  refine ⟨c, A, fun m wt hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigP K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigP K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.GalN.V.conjP_alt hP K hK n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := wt)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intP'_alt hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmPNAlt ι M m r}, ∃ π : ↥(SigP K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut
    obtain ⟨hπ, hF⟩ := hL K hK n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.safe r.2.unl h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm
end

end UpperTheory.GalN.V.Win.N


theorem replay_relative47 (F : Type) [Field F] [NumberField F] (n M : ℕ) (hM : 1 ≤ M) :
    (KLev F n (3 * M)).relIndex (KLev F n 3) ≠ 0 ∧
    (KLev F n (3 * M)).relIndex (KLev F n 3) ≤ M ^ (Module.finrank ℚ F * (n * n)) := by
  first
  | (rh_reduce 2 using [relative_level47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact relative_level47 F n M hM
rh_scan UpperTheory.V.Af.cohBoundFree limit 2000
rh_scan UpperTheory.V.Af.cohBoundRelative47 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_alt_lit47 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt_lit47 limit 2000
rh_prune replay_relative47 as RHLitRelative47Pruned
#print axioms RHLitRelative47.relative_ring47
#print axioms relative_level47
#print axioms UpperTheory.V.Af.cohBoundRelative47
#print axioms UpperTheory.GalN.V.Win.N.countK_alt_lit47
#print axioms UpperTheory.GalN.V.Win.N.countP_alt_lit47

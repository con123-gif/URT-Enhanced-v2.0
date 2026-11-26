/-!
RUN42, 26 Nov 2026 — lane 5. SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 first including mandatory
pipeline; SWARM, HANDOFF, EXPANSION, AGENTS, state, protocol/log and continuity
consulted. Peer f304da1a (shared CountI/V NumberU), 57df69df (model binder
pruning), b0fd82e7 (single torsion cutoff), 72787a07 (local residual kernel)
read; no combining uncompiled candidates. Other current commit metadata surveyed.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
843cb9db91a39362b8d3b9f0de7a98bb651660e2 (batch Tau Ceti); no migration.

Result: actual LemmaM' supplier is M.mprime_holds, not an unlocated
literature assumption. Its length bound requires only (i) D_mu annihilates
the saturated square satSq x, (ii) D_mu(F_i)=0, (iii) D_mu restricted to
weight j separates mu. No lift to integral derivations of pure weight j
is required in the length argument itself, no global injectivity
assumption and no separate homogeneity hypothesis on F. The original
strong hypotheses imply these exact local premises; retain original
model construction until its weaker premises are directly checked.
Let C = cotLat x grade j / comap(cotSpan x F).
The map mu -> D_mu restricted and factored through C is injective into
Hom_O(C,O/(c)). For finite C length and residue size q, length is log_q
cardinality; Hom into O/(c) has length <= length C via the native
residue Hom bound and composition length. Thus length M <= cotLen.
No O-linearity of mu -> D_mu is assumed (native D is only additive);
finite residue remains essential for this cardinality argument.
Strictness of weakened local premise: O=Z_3, A=O[t] with degree(t)=1,
x(t)=0, c=3, F=0, M=O/(3), D_mu(f)=mu*(f(0)+coefficient_t(f)) mod 3.
Annihilates satSq=(t^2), separates on t, kills F. D_1(1)=1 so no lift to
a point derivation, which must kill 1. This does not assert actual native
model has nonliftable points.

Source: CommutativeAlgebra/GradedModulesLength/Mprime.lean 7a0d0423cebb2d4a5b3193d7e58515195ac54421
OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15
GradedModulesLength/MainCotSpan.lean 52e45205d53b2e339e7467f91fab3fb015b438da
UnitaryThreeGroups/ModelLower.lean 379b0931221b31a8931364fec40eb0bd9ad8962a
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
Explicit actual CountI and CountV consumers of Alg.M.mprime_holds located
in LinkedUnlE. MainCotSpan.main_holds is the upper supplier, retains
core_holds, Smith normalization, finite cover and weight conditions.

Original selected graph: CountI -> OneCharU -> vlen_le -> model_lower
-> LemmaM' -> mprime_holds -> satSq annihilation, weight vanishing,
quotient Hom injection, cardinal length; CountV also consumes same
mprime_holds. Candidate graph: mprime_holds42 -> restricted42 + native
lift-to-local bridge, restricted42 -> quotient Hom injection/cardinal
length. Direct model-specific proof of weaker local premises still open.
Original graphs and all remaining axioms, other consumers, type/value/
constructor roles preserved; no global pruning or new root closure.
Cache by exact source/toolchain/O,A,grade,x,F,c,M,D,host and consumer.
Backtrack to original on failed replay. No imported RH theorem.

Executed 16 guarded source/structure checks and 81 finite mod-3
additivity controls for example (not native model computations). Native
Lean/lake absent locally. CI jobs 45577239749, 45576756833, 45670987597
actually retrieved, pick/run/record success for each; baseline only.
New certificate not compiled, axiom outputs pending, no new kernel pass.

RESUME HERE: compile this file as RHMprimeRestricted42 with existing
engine oleans; compare original/reduced scans and axiom evidence; use
mprime_holds42 as exact LemmaM' supplier in both LinkedUnlE consumers
only after replay. Next derive local satSq annihilation and grade
separation at actual main_der without demanding an integral derivation
lift, or pursue native upper core_holds quantitative input if no
simpler derivation. Preserve same S,M, coefficient, prime, character.
HANDOFF TO kernel, audit, integration, arithmetic. RH OPEN.
-/

import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.Mprime
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

namespace UpperTheory.V.Alg
def LemmaMRestricted42 : Prop :=
  ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Finite (ResidueField O)]
    (A X : Type) [CommRing A] [Algebra O A] [AddCommGroup X] [DecidableEq X] (𝒜 : X → Submodule O A) [GradedAlgebra 𝒜]
    (x : A →ₐ[O] O) (j : X), (∀ f ∈ 𝒜 j, x f = 0) →
  ∀ (ι : Type) (F : ι → A), 
  ∀ (c : O), c ≠ 0 → ∀ (M : Type) [AddCommGroup M] [Module O M] (D : M →+ (A →ₗ[O] O ⧸ Ideal.span {c})),
    (∀ μ, satSq x ≤ LinearMap.ker (D μ)) → (∀ μ i, D μ (F i) = 0) →
    (∀ μ ν : M, (∀ f ∈ 𝒜 j, D μ f = D ν f) → μ = ν) →
    Module.length O M ≤ cotLen x 𝒜 j F
end UpperTheory.V.Alg

private theorem der_satSq42 {O A : Type} [CommRing O] [IsDomain O] [CommRing A] [Algebra O A] (x : A →ₐ[O] O)
    (D : A →ₗ[O] O) (hD : D ∈ PtDer x O) (f : A) (hf : f ∈ satSq x) : D f = 0 := by
  obtain ⟨c, hc, hcf⟩ := hf
  have hD' : ∀ f g, D (f * g) = x f • D g + x g • D f := hD
  have key : ∀ g ∈ RingHom.ker x ^ 2, D g = 0 := by
    intro g hg
    rw [sq] at hg
    refine Submodule.mul_induction_on hg ?_ ?_
    · intro a ha b hb
      have ha' : x a = 0 := ha
      have hb' : x b = 0 := hb
      rw [hD', ha', hb']; simp
    · intro a b ha hb
      rw [map_add, ha, hb, add_zero]
  have := key _ hcf
  rw [map_smul, smul_eq_mul] at this
  exact (mul_eq_zero.1 this).resolve_left hc

private theorem len_le_of_inj42 {O : Type} [CommRing O] [IsLocalRing O] [Finite (ResidueField O)]
    {M N : Type} [AddCommGroup M] [Module O M] [AddCommGroup N] [Module O N]
    (hN : Module.length O N ≠ ⊤) (ψ : M → N) (hψ : Function.Injective ψ) :
    Module.length O M ≤ Module.length O N := by
  obtain ⟨hfN, n, hn, hcn⟩ := Formalism.MainNotions.V.Pf.V2.card_of_isFiniteLength (Module.length_ne_top_iff.1 hN)
  have hfM : Finite M := Finite.of_injective ψ hψ
  have hM : IsFiniteLength O M := isFiniteLength_iff_isNoetherian_isArtinian.2 ⟨inferInstance, inferInstance⟩
  obtain ⟨_, m, hm, hcm⟩ := Formalism.MainNotions.V.Pf.V2.card_of_isFiniteLength hM
  have hle := Nat.card_le_card_of_injective ψ hψ
  rw [hcm, hcn] at hle
  have h1 : 1 < Nat.card (ResidueField O) := Finite.one_lt_card
  rw [hm, hn]
  exact_mod_cast (Nat.pow_le_pow_iff_right h1).1 hle

theorem UpperTheory.V.Alg.M.mprime_restricted42 :
    LemmaMRestricted42 := by
  intro O _ _ _ _ A X _ _ _ _ 𝒜 _ x j hx ι F c hc M _ _ D hsat hDF hsep
  by_cases htop : cotLen x 𝒜 j F = ⊤
  · rw [htop]; exact le_top
  have hspan : ∀ μ, (cotSpan x F).comap (cotLat x 𝒜 j).subtype ≤
      LinearMap.ker (((satSq x).liftQ (D μ) (hsat μ)) ∘ₗ (cotLat x 𝒜 j).subtype) := by
    intro μ
    rw [LinearMap.ker_comp]
    refine Submodule.comap_mono ?_
    rw [cotSpan, Submodule.span_le]
    rintro _ ⟨i, rfl⟩
    exact hDF μ i
  let ψ : M → ((cotLat x 𝒜 j ⧸ (cotSpan x F).comap (cotLat x 𝒜 j).subtype) →ₗ[O] O ⧸ Ideal.span {c}) :=
    fun μ => Submodule.liftQ _ _ (hspan μ)
  have hψ : Function.Injective ψ := by
    intro μ ν h
    have hj : ∀ f ∈ 𝒜 j, D μ f = D ν f := fun f hf =>
      LinearMap.congr_fun h (Submodule.Quotient.mk ⟨(satSq x).mkQ f, f, ⟨hf, hx f hf⟩, rfl⟩)
    exact hsep μ ν hj
  obtain ⟨p, hp⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨k, hk⟩ := IsDiscreteValuationRing.associated_pow_irreducible hc hp
  have hQ : Module.length O ((O ⧸ maximalIdeal O) →ₗ[O] (O ⧸ Ideal.span {c})) ≤ 1 := by
    rw [Ideal.span_singleton_eq_span_singleton.2 hk]
    exact Formalism.MainNotions.V.Pf.V2.length_hom_residue_le p hp.maximalIdeal_eq hp.ne_zero k
  have hle := Formalism.MainNotions.V.Pf.V2.length_hom_le hQ (Module.length_ne_top_iff.1 htop)
  exact (len_le_of_inj42 (ne_top_of_le_ne_top htop hle) ψ hψ).trans hle

theorem UpperTheory.V.Alg.M.mprime_holds42 : LemmaM' := by
  intro O _ _ _ _ A X _ _ _ _ 𝒜 _ x j hx ι F hF c hc M _ _ D hD hDF hlift
  have hsat : ∀ μ, satSq x ≤ LinearMap.ker (D μ) := by
    intro μ f hf
    obtain ⟨D', hD', -, h⟩ := hlift μ
    rw [LinearMap.mem_ker, h, der_satSq42 x D' hD' f hf, map_zero]
  refine mprime_restricted42 O A X 𝒜 x j hx ι F c hc M D hsat hDF ?_
  intro μ ν hj
  apply hD
  have hi : ∀ μ i, i ≠ j → ∀ f ∈ 𝒜 i, D μ f = 0 := by
    intro μ i hi f hf
    obtain ⟨D', -, hw, h⟩ := hlift μ
    rw [h, hw i hi f hf, map_zero]
  refine LinearMap.ext fun f => ?_
  induction f using DirectSum.Decomposition.inductionOn 𝒜 with
  | zero => rw [map_zero, map_zero]
  | @homogeneous i m =>
    by_cases hij : i = j
    · subst hij; exact hj _ m.2
    · rw [hi μ i hij _ m.2, hi ν i hij _ m.2]
  | add a b ha hb => rw [map_add, map_add, ha, hb]


rh_scan UpperTheory.V.Alg.M.mprime_holds limit 2000
rh_scan UpperTheory.V.Alg.M.mprime_holds42 limit 2000
rh_prune UpperTheory.V.Alg.M.mprime_restricted42 as RHMprimeRestrictedPruned42
#print axioms UpperTheory.V.Alg.M.mprime_holds
#print axioms UpperTheory.V.Alg.M.mprime_holds42
#print axioms UpperTheory.V.Alg.M.mprime_restricted42

example : LemmaM' := by
  first | (rh_reduce 2 using [UpperTheory.V.Alg.M.mprime_holds42]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact UpperTheory.V.Alg.M.mprime_holds42

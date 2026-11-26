/-!
RUN43 lane 5, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including mandatory pipeline;
AGENTS, SWARM, HANDOFF, EXPANSION and continuity heads consulted.
Peer 6615a312 (actual host Kummer), 86de3c73 (finite trace cover), edb25260
(qualitative length), ce4476bd (discriminant) read; no merging uncompiled candidates.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Result: at the actual model_lower consumer, arbitrary pointwise choices of
derivations suffice; no proof of additivity of the family and no global
derivation-equality argument are needed. A cocycle gamma has weight -1,
so it is zero at every matrix entry whose weight is not -1. For the others,
Model.ent supplies a homogeneous preimage f of that exact entry, and
D_mu(q f) = Psi(g)^wt1(j) * gamma_mu(g)_ij. If two families agree on grade
-1, subtract and cancel this unit in O/(a). All entries agree and the
original injectivity of gamma gives mu=nu. Thus the grade-restricted map
into Hom(C,O/(a)) is injective as a SET map, not necessarily a module map
or additive map. The native finite-residue length argument counts sets
and applies unchanged: q^length(MM) <= |Hom(C,O/(a))| <= q^length(C)
when length(C) is finite; infinite length(C) is trivial. No new mathematical
premises. This bypasses the selected use of der_uniq and additive assembly
in model_lower, and the global grade-decomposition proof in mprime_holds.
It does not bypass main_der, which still supplies the integral lift for
satSq annihilation, or any upstream use of universality.

Negative control to removing the lift: take O=Z_3,
A=O[t,u,v]/(3t-u*v), x(t)=x(u)=x(v)=0, deg(t)=-1, deg(u)=-2, deg(v)=1.
There is a point derivation into O/(3) sending t to 1 and u,v to 0:
the relation has derivative 3=0 in O/(3). But t belongs to satSq x
because 3t=uv in (ker x)^2. Hence this derivation does NOT annihilate
satSq x. Ordinary torsion-valued point derivation is insufficient.
This is a generic obstruction, not a claim about the native model.
Retain its lift or establish an actual alternative saturation lemma.

Source ledger under src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
UnitaryThreeGroups/ModelLower.lean 379b0931221b31a8931364fec40eb0bd9ad8962a
UnitaryThreeGroups/ConjStable.lean 21bf08ed788963953d2f8f6dc0d4a62e4d3b5bd3
CommutativeAlgebra/GradedModulesLength/Mprime.lean 7a0d0423cebb2d4a5b3193d7e58515195ac54421
UnitaryThreeGroups/VlenLe.lean 7366053a17524d379ac789425deea06678f2d3bf
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
Native CountI -> OneCharU -> vlen_le -> model_lower; CountV retains its
original separate LemmaM' consumer. Original selected graph model_lower
-> main_der, der_uniq, additive family, LemmaM' -> mprime_holds ->
saturation, all-grade separation, finite residue Hom count.
Candidate model_lower_family43 -> main_der, M.ent, shaCoc weight support,
unit cancellation, mprime_family43 -> saturation, restricted Hom count.
Original graphs/type/value/constructor roles and unresolved axiom ledger
retained; no global edge retirement. Cache by source/toolchain, exact
S,M,O,a,MM,gamma,host,character and consumer; backtrack original on failure.
No imported RH theorem.

Executed 18 fail-on-error exact source and transformation guards
(prior blob; lower blob; model blob; private theorem main_der; choose D hD hDe hl; have hadd; der_uniq S M.x₀; M.ent g i j; M.lift a ha D; hw g i j h; M.ker_q; ent : ∀ g a b, ∃ f ∈ 𝒜 (wt a b); ∀ g, γ g ∈ gw _ (-1); def Model.len; lift : ∀ a : O; family input removed additive structure; reduced model premise removed; bridge retains original LemmaM'). Native lean/lake absent (shell checked).
Existing CI runs 45577239749 and 45576756833 actually retrieved, pick/run/record
success; baseline only. New file not compiled, new axiom evidence pending.
RESUME HERE: compile this file with warmed pinned engine oleans; if
open private main_der fails, append candidate declarations to a copy of
ModelLower.lean with private reference resolved in original namespace.
Use bridge43 to replace actual model_lower call in VlenLe only after
native replay. Compare both dependency scans and axiom ledgers. Pursue
core_holds/quantitative common trace bound; don't re-prove already supplied
qualitative length or claim saturation from mod-a derivation alone.
HANDOFF TO kernel, integration, audit, arithmetic. RH OPEN.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ModelLower
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.Mprime
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 1000000
open Matrix IsLocalRing UpperTheory.V.U3 UpperTheory.V.HV
open private UpperTheory.V.U3.main_der from Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ModelLower

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M

namespace UpperTheory.V.Alg
def LemmaMFamily43 : Prop :=
  ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Finite (ResidueField O)]
    (A X : Type) [CommRing A] [Algebra O A] [AddCommGroup X] [DecidableEq X] (𝒜 : X → Submodule O A) [GradedAlgebra 𝒜]
    (x : A →ₐ[O] O) (j : X), (∀ f ∈ 𝒜 j, x f = 0) →
  ∀ (ι : Type) (F : ι → A), 
  ∀ (c : O), c ≠ 0 → ∀ (M : Type) [AddCommGroup M] [Module O M] (D : M → (A →ₗ[O] O ⧸ Ideal.span {c})),
    (∀ μ, satSq x ≤ LinearMap.ker (D μ)) → (∀ μ i, D μ (F i) = 0) →
    (∀ μ ν : M, (∀ f ∈ 𝒜 j, D μ f = D ν f) → μ = ν) →
    Module.length O M ≤ cotLen x 𝒜 j F
end UpperTheory.V.Alg

private theorem der_satSq43 {O A : Type} [CommRing O] [IsDomain O] [CommRing A] [Algebra O A] (x : A →ₐ[O] O)
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

private theorem len_le_of_inj43 {O : Type} [CommRing O] [IsLocalRing O] [Finite (ResidueField O)]
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

theorem UpperTheory.V.Alg.M.mprime_family43 :
    LemmaMFamily43 := by
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
  exact (len_le_of_inj43 (ne_top_of_le_ne_top htop hle) ψ hψ).trans hle

theorem UpperTheory.V.U3.model_lower_family43 :
    ∀ {O : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [Finite (ResidueField O)] {K : Type} [NormedField K] [Algebra O K] {Γ H : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
      {η : Γ →* ℤˣ} {Ψ : Γ →* (O)ˣ} {N : Set Γ} {ι : H →* Γ} {hι : Continuous ι}
      {U : Univ (GCond.noCondition O (η.comp ι) (Ψ.comp ι))} {I : Ideal U.R} {cc g₁ : Γ} (S : SRing N hι U I cc g₁) (M : Model S K), IsUnit (2 : O) → Marks η Ψ cc g₁ →
      LocGood U I → (∀ j : ℤ, AdicCont (maximalIdeal O) fun g => ((Ψ g ^ j : Oˣ) : O)) → (∀ g ∈ N, r0 η Ψ g = 1) →
      ∀ a : O, a ≠ 0 → ∀ (MM : Type) [AddCommGroup MM] [Module O MM]
        (γ : MM →+ (Γ → Matrix (Fin 3) (Fin 3) (O ⧸ Ideal.span {a}))), Function.Injective γ → (∀ x, γ x ∈ shaCoc η Ψ N ι cc g₁ a) →
        Module.length O MM ≤ M.len := by
  intro O _ _ _ _ _ K _ _ Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M _ hm hU hΨ hN a ha MM _ _ γ hinj hγ
  haveI : IsCO O (TrivSqZeroExt O (O ⧸ Ideal.span {a})) := co_sqz O O _ fun _ => rfl
  choose D hD hDe hl using fun μ => main_der S M hm.Ψc hU hΨ hN ha (γ μ) (hγ μ)
  let E : MM → (M.A →ₗ[O] O ⧸ Ideal.span {a}) := fun μ => (D μ).comp M.q.toLinearMap
  have hsat : ∀ μ, satSq M.x ≤ LinearMap.ker (E μ) := by
    intro μ f hf
    obtain ⟨D', hD', -, h⟩ := hl μ
    change D μ (M.q f) = 0
    rw [h, der_satSq43 M.x D' hD' f hf, map_zero]
  have hF : ∀ μ i, E μ (M.Q.F i) = 0 := by
    intro μ i
    have h1 : M.Q.F i ∈ RingHom.ker M.q := by
      rw [M.ker_q]
      exact Ideal.subset_span (by simp)
    change D μ (M.q (M.Q.F i)) = 0
    rw [h1, map_zero]
  have hsep : ∀ μ ν : MM, (∀ f ∈ M.𝒜 (-1), E μ f = E ν f) → μ = ν := by
    intro μ ν he
    apply hinj
    funext g
    refine Matrix.ext fun i j => ?_
    by_cases hij : wt i j = -1
    · obtain ⟨f, hf, hq⟩ := M.ent g i j
      have h := he f (hij ▸ hf)
      change D μ (M.q f) = D ν (M.q f) at h
      rw [hq, hDe, hDe] at h
      have hz : ((Ψ g ^ wt1 j : Oˣ) : O) • (γ μ g i j - γ ν g i j) = 0 := by
        rw [smul_sub, h, sub_self]
      exact sub_eq_zero.1 (((Ψ g ^ wt1 j).isUnit.smul_eq_zero).1 hz)
    · rw [(hγ μ).2.1 g i j hij, (hγ ν).2.1 g i j hij]
  exact mprime_family43 O M.A ℤ M.𝒜 M.x (-1) (M.wring.fixed _ (by decide)) _ M.Q.F a ha MM E hsat hF hsep

theorem UpperTheory.V.U3.model_lower_bridge43 :
    ∀ {O : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [Finite (ResidueField O)] {K : Type} [NormedField K] [Algebra O K] {Γ H : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
      {η : Γ →* ℤˣ} {Ψ : Γ →* (O)ˣ} {N : Set Γ} {ι : H →* Γ} {hι : Continuous ι}
      {U : Univ (GCond.noCondition O (η.comp ι) (Ψ.comp ι))} {I : Ideal U.R} {cc g₁ : Γ} (S : SRing N hι U I cc g₁) (M : Model S K), IsUnit (2 : O) → Marks η Ψ cc g₁ →
      LemmaM' → LocGood U I → (∀ j : ℤ, AdicCont (maximalIdeal O) fun g => ((Ψ g ^ j : Oˣ) : O)) → (∀ g ∈ N, r0 η Ψ g = 1) →
      ∀ a : O, a ≠ 0 → ∀ (MM : Type) [AddCommGroup MM] [Module O MM]
        (γ : MM →+ (Γ → Matrix (Fin 3) (Fin 3) (O ⧸ Ideal.span {a}))), Function.Injective γ → (∀ x, γ x ∈ shaCoc η Ψ N ι cc g₁ a) →
        Module.length O MM ≤ M.len := by
  intro O _ _ _ _ _ K _ _ Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M _ hm hM hU hΨ hN a ha MM _ _ γ hinj hγ
  exact model_lower_family43 S M (by assumption) hm hU hΨ hN a ha MM γ hinj hγ

rh_scan UpperTheory.V.U3.model_lower limit 2000
rh_scan UpperTheory.V.U3.model_lower_family43 limit 2000
rh_prune UpperTheory.V.U3.model_lower_bridge43 as RHModelLowerPruned43
#print axioms UpperTheory.V.U3.model_lower
#print axioms UpperTheory.V.U3.model_lower_family43
#print axioms UpperTheory.V.U3.model_lower_bridge43
example : LemmaMFamily43 := by
  first | (rh_reduce 2 using [UpperTheory.V.Alg.M.mprime_family43]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact UpperTheory.V.Alg.M.mprime_family43

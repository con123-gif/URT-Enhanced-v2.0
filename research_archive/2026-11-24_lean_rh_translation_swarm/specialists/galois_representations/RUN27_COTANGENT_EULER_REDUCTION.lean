import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.AlgMemCoef
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.MainCotSpan
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN27 — actual cotangent Euler cancellation, 25 November 2026. Lane 5.
Status SOURCE-MATCHED / PREPARED, NOT compiled. RH OPEN.

Preflight: current mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0
(including 4b677bc2 mandatory pipeline), AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION, continuity/state/log/protocol excerpts, RUN26 and recent peer commits
048163e3 (lower duality), 9402fbb4 (real character field), 3eba527a (native selected core),
359a3b34 (signed thin modes). Native prior CI status JSON independently fetched:
45577239749 pass 98.87s; 45576756833 pass 77.94s. These certify previous engines ONLY.
Local shell has no lean/lake. No new Lean or CI PASS, no synthetic arithmetic data.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream main observed a85077714ca7b298f69e48798497519ed5326a89
at 2026-11-25T09:29:19Z, not mixed; no claim of unchanged declarations.
All paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/GradedModulesLength/:
HerbrandFinLen.lean aa40d31af98fd039f3c33a5c8de7fc064100c82f
TwoSigned.lean c2460a5a728ec42562e60d678237aa4f8051ec53
AlgMemCoef.lean 9e04a261be7daddc895cbff009d6264a953fa8af
MainCotSpan.lean 52e45205d53b2e339e7467f91fab3fb015b438da

1. Native core_holds body recovered, in AlgMemCoef.lean (not a missing theorem).
MainCotSpan.main_holds -> core_holds -> low_holds, chain, up_holds.
low_holds (AdmissibleMonoIdeal.lean 80e31b9fb109fd0b2456e96d2ed5b2e370d40461)
uses the chart leading ideal and uniformizer powers. up_holds uses th_holds
and the localized length <= 2^(r+1+r') from squaring relations.
At a common sufficiently large multi-degree d, with C=sum_i c_i (Smith exponents),
P=2^(r+r'), and M_d=(mQ Q (J+secs(ts Q))).gr d, native inequalities give
    P*C <= chi(ts,Q/(J,a))(d) <= theta(a,M_d)
        = sum_{sigma in res0(T)} locLen_sigma(M_d) * v(sigma(a)).
Thus C <= sum_sigma [locLen_sigma(M_d)/P] v(sigma(a))
  <= 2 * sum_{sigma in res0(T)} v(sigma(a)).
All evaluations are nonzero and nonnegative in valuation, by native M2/M5.
Exact cancellation precedes the uniform multiplicity bound; no need to count
the same degree-zero evaluation map twice. The native up_holds already proves
the image bound before deliberately weakening it via hsum. Keeping that stronger
conclusion is a genuine local reduction, not yet a global CountI gain: model_upper
already chooses one representative per conjugacy orbit, and injectivity of res0
on that actual set must be inspected before claiming a strict gain.
Do not merge different degree-zero maps merely because they have equal trace
values; their multiplicities may differ. Keep M1–M5, chart, admissibility,
support, M_d finite, and all coefficient-prime/character quantifiers.

2. Short independent human derivation of the exact Euler determinant identity.
Native th_holds assumes a finite B-module M with B/ann(M) finite over complete
characteristic-zero DVR O, IsCO O B (residue field isomorphism, length_O=length_B).
Hence M is finite over O. Write T_O for its O-torsion, L=M/T_O finite free.
Let f be multiplication by a. On the generic fiber, the finite-dimensional
commutative algebra B_F/ann(M_F) decomposes into local Artin factors after
base change to algebraic closure K. Their residue characters are exactly the
supported sigma; dimension of each generalized eigenspace over K is the
native localized length at sigma (residue extension splits by separability
in characteristic zero). On each generalized eigenspace f is sigma(a)I+N,
N nilpotent, so det=factor sigma(a)^multiplicity without diagonalizability.
Nonzero sigma(a) on support implies f_L injective and finite cokernel.
Kernel/cokernel snake sequence on 0->T_O->M->L->0, and
length coker(f|T_O)=length ker(f|T_O), give exact cancellation:
    theta(a,M) = length_O coker(f_L)
               = v(det(f_L)) = sum_sigma locLen_sigma(M) v(sigma(a)).
The empty support case has rank zero, determinant 1, and theta=0.
No assumption of nonnegative v or common bound c is needed for this equality;
they enter only when converting to the uniform upper bound. The localized
length equals generic component dimension per embedding, not multiplied
again by the residue degree. This proof is standard DVR linear algebra
and Artin decomposition; not an independently compiled replacement.
The prepared native certificate below exposes the exact identity already
inside th_holds's local induction 'key', preserving its stronger verified
source proof rather than assuming the alternative argument is Lean-ready.
It also retains the actual up_holds image sum and calls the replacement
bridge instead of native th_holds. It does not import Main.

3. Original/reduced local graphs (source-call evidence, not elaborated graph):
MainCotSpan.main_holds -> core_holds -> {low_holds,chain,up_holds}
up_holds -> {th_holds, hsum, locLen_mQ_gr_le_locLen_aPiece,
 locLen_aPiece_ideal2_le_two_pow, locLen_quotientWeightPiece_le_one,
 eventually_mQ_gr_finite_annihilator, tsp_holds, ...}
candidate rh_up_image -> {rh_th_exact_original -> rh_th_exact,
 same support and multiplicity suppliers, no hsum in this local branch}.
Original graph/axioms and all pending nodes retained. Original root's
actual global edge removal is NOT established. Exact hsum weakening can be
restored by Finset.sum_image_le_of_nonneg, as in native TwoSigned.lean.
rh_th_exact_original is exact original th_holds statement with proof via
the new equality, so no added premises. Generic proof applies to actual
principal-host context; cache by (pin, declaration, O,K,v,B,M,a,S,
chart Q,d, support, caller), not theorem name alone. Bounded search
backtracks to exact source proof if a proposed automated replacement fails.
Native rh_prune/rh_scan commands appended; rh_reduce/rh_auto/frontier
probe on the actual finite-length premise appended. No actual output yet.
For safety avoid claimed RH theorem imports and reject sorryAx.

4. Executed: four exact blob checks, 10 unique source transformations,
and 3 core call/cancellation anchors in actual files using V8. These are static,
not a kernel test, not an actual arithmetic matrix or a proof of RH.
Reproduce by compiling this file against the already-built exact pinned
source with Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474;
compile existing RHProofTermPrune, RHRecursiveReductionFixed and
RHRecursiveReductionAutoV3 into temporary olean path, set LEAN_PATH,
then lake env lean -DwarningAsError=true this file. Capture original and
reduced scans and axiom audit; record failures without forcing a pass.
No job registered yet: pinned full source olean availability unconfirmed.
Previous CI only tested engine and conditional analytic root.
RESUME HERE: compile the actual source certificate; then inspect the
degree-zero support and local multiplicity for actual model_upper's chosen
T (test whether res0 is injective); attack the remaining uniform norm of
trace differences, not another synthetic determinant exercise.
HANDOFF TO Galois, dependency, kernel, audit, integration.
-/

open scoped Classical

open IsLocalRing Filter Formalism.MainNotions.V.Pf.V2.Calc UpperTheory.V.Alg UpperTheory.V.Alg.M
open UpperTheory.V.abelian₂ (invLen coinvLen snake_len)
open scoped Pointwise

private theorem ker_range {R : Type} [CommRing R] (g : R) (M : Type) [AddCommGroup M] [Module R M] :
    LinearMap.ker (LinearMap.lsmul R M g) = Submodule.torsionBy R M g ∧
      LinearMap.range (LinearMap.lsmul R M g) = g • (⊤ : Submodule R M) := by
  constructor
  · ext x; simp
  · ext x
    simp [Submodule.mem_smul_pointwise_iff_exists]

private theorem theta_eq {R : Type} [CommRing R] (g : R) (M : Type) [AddCommGroup M] [Module R M] :
    theta g M = ((coinvLen g M).toNat : ℤ) - ((invLen g M).toNat : ℤ) := by
  unfold theta
  rw [(ker_range g M).1, (ker_range g M).2]
  rfl

private theorem herbrand_finLen {R : Type} [CommRing R] (g : R) (M : Type) [AddCommGroup M] [Module R M]
    (h : Module.length R M ≠ ⊤) :
    invLen g M ≠ ⊤ ∧ coinvLen g M ≠ ⊤ ∧ coinvLen g M = invLen g M := by
  have h1 := KStar.Selmer.length_ker_eq_length_coker (LinearMap.lsmul R M g) h
  rw [(ker_range g M).1, (ker_range g M).2] at h1
  have h2 : invLen g M ≠ ⊤ :=
    ne_top_of_le_ne_top h (Module.length_le_of_injective _ (Submodule.injective_subtype _))
  have h3 : coinvLen g M = invLen g M := h1.symm
  exact ⟨h2, h3 ▸ h2, h3⟩

private theorem herbrand_equiv {R : Type} [CommRing R] (g : R) {M N : Type} [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] (e : M ≃ₗ[R] N) :
    invLen g M = invLen g N ∧ coinvLen g M = coinvLen g N := by
  have key : ∀ {M N : Type} [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] (e : M ≃ₗ[R] N),
      invLen g M ≤ invLen g N ∧ coinvLen g N ≤ coinvLen g M := by
    intro M N _ _ _ _ e
    refine ⟨?_, ?_⟩
    · exact (snake_len R g M N PUnit e.toLinearMap 0 e.injective (fun _ => ⟨0, rfl⟩)
        (fun y => ⟨fun _ => e.surjective y, fun _ => rfl⟩)).2.2.2.1
    · exact (snake_len R g PUnit M N 0 e.toLinearMap (fun _ _ _ => rfl) e.surjective
        (fun y => ⟨fun h => ⟨0, (e.map_eq_zero_iff.1 h).symm⟩, by
          rintro ⟨_, rfl⟩; simp⟩)).2.2.2.2.1
  exact ⟨le_antisymm (key e).1 (key e.symm).1, le_antisymm (key e.symm).2 (key e).2⟩

private theorem loc_self {S : Type} [CommRing S] (P Q : Ideal S) [hP : P.IsPrime] (h : Q = P) :
    Module.length (Localization.AtPrime P) (LocalizedModule P.primeCompl (S ⧸ Q)) = 1 := by
  subst h
  rw [Module.length_eq_one_iff, isSimpleModule_iff_toSpanSingleton_surjective]
  constructor
  · rw [← not_subsingleton_iff_nontrivial, LocalizedModule.subsingleton_iff]
    intro h
    obtain ⟨r, hr, hr'⟩ := h (Submodule.Quotient.mk 1)
    rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero] at hr'
    exact hr (by simpa using hr')
  · intro x hx y
    induction x using LocalizedModule.induction_on with | h m s => ?_
    induction y using LocalizedModule.induction_on with | h m' s' => ?_
    obtain ⟨r, rfl⟩ := Submodule.Quotient.mk_surjective Q m
    obtain ⟨r', rfl⟩ := Submodule.Quotient.mk_surjective Q m'
    have hr : r ∈ Q.primeCompl := fun hr => hx (by
      rw [(Submodule.Quotient.mk_eq_zero Q).2 hr, LocalizedModule.zero_mk])
    refine ⟨Localization.mk (r' * s) (⟨r, hr⟩ * s'), ?_⟩
    rw [LinearMap.toSpanSingleton_apply, LocalizedModule.mk_smul_mk, LocalizedModule.mk_eq]
    refine ⟨1, ?_⟩
    simp only [one_smul, Submonoid.smul_def, ← Submodule.Quotient.mk_smul, smul_eq_mul, Submonoid.coe_mul]
    congr 1
    ring

private theorem loc_not_le {S : Type} [CommRing S] (P Q : Ideal S) [hP : P.IsPrime] (h : ¬ Q ≤ P) :
    Module.length (Localization.AtPrime P) (LocalizedModule P.primeCompl (S ⧸ Q)) = 0 := by
  rw [Module.length_eq_zero_iff, LocalizedModule.subsingleton_iff]
  obtain ⟨s, hs, hs'⟩ := SetLike.not_le_iff_exists.mp h
  intro x
  obtain ⟨x, rfl⟩ := Submodule.Quotient.mk_surjective Q x
  refine ⟨s, hs', ?_⟩
  rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero]
  exact Q.mul_mem_right _ hs

private theorem len_eq (O : Type) [CommRing O] [IsLocalRing O] (B : Type) [CommRing B] [Algebra O B] [IsCO O B]
    (X : Type) [AddCommGroup X] [Module O X] [Module B X] [IsScalarTower O B X] :
    Module.length O X = Module.length B X := by
  rw [IsLocalRing.length_restrictScalars O B X]
  have : Module.length (ResidueField O) (ResidueField B) = 1 := by
    rw [Module.length_eq_of_surjective (S := ResidueField O) (R := ResidueField B) (resMap_bijective O B).2]
    exact Module.length_eq_one _ _
  rw [this, mul_one]

private theorem prime_case (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ) (hv : IsNVal O K v)
    (B : Type) [CommRing B] [Algebra O B] [IsCO O B] (P : Ideal B) [P.IsPrime] [Module.Finite O (B ⧸ P)]
    (a : B) (S : Finset (B →ₐ[O] K)) (hS : ∀ σ ∈ S, σ a ≠ 0) (hS' : ∀ σ : B →ₐ[O] K, σ ∉ S → locLen σ (B ⧸ P) = 0) :
    invLen a (B ⧸ P) ≠ ⊤ ∧ coinvLen a (B ⧸ P) ≠ ⊤ ∧
      ((coinvLen a (B ⧸ P)).toNat : ℝ) - ((invLen a (B ⧸ P)).toNat : ℝ) =
        ∑ σ ∈ S, ((locLen σ (B ⧸ P)).toNat : ℝ) * v (σ a) := by
  classical
  have h0 : ∀ σ : B →ₐ[O] K, ¬ P ≤ RingHom.ker σ → locLen σ (B ⧸ P) = 0 := fun σ h =>
    haveI : (RingHom.ker σ).IsPrime := RingHom.ker_isPrime σ
    loc_not_le _ P h
  by_cases hinj : P.comap (algebraMap O B) = ⊥
  · haveI : FaithfulSMul O (B ⧸ P) := by
      rw [faithfulSMul_iff_algebraMap_injective, injective_iff_map_eq_zero]
      intro c hc
      have : c ∈ P.comap (algebraMap O B) := by
        rw [Ideal.mem_comap, ← Ideal.Quotient.eq_zero_iff_mem]
        exact hc
      rwa [hinj] at this
    have hτ : ∀ τ : (B ⧸ P) →ₐ[O] K, Function.Injective τ := fun τ => by
      rw [RingHom.injective_iff_ker_eq_bot]
      refine Ideal.eq_bot_of_comap_eq_bot (R := O) ?_
      rw [eq_bot_iff]
      intro c hc
      have : τ (algebraMap O _ c) = 0 := hc
      rw [AlgHom.commutes] at this
      exact (FaithfulSMul.algebraMap_injective O K) (this.trans (map_zero _).symm)
    have h1 : ∀ τ : (B ⧸ P) →ₐ[O] K, locLen (τ.comp (Ideal.Quotient.mkₐ O P)) (B ⧸ P) = 1 := fun τ => by
      haveI : (RingHom.ker (τ.comp (Ideal.Quotient.mkₐ O P))).IsPrime := RingHom.ker_isPrime _
      refine loc_self _ P ?_
      ext x
      rw [RingHom.mem_ker, ← Ideal.Quotient.eq_zero_iff_mem, AlgHom.comp_apply, map_eq_zero_iff _ (hτ τ)]
      rfl
    have hmem : ∀ τ : (B ⧸ P) →ₐ[O] K, τ.comp (Ideal.Quotient.mkₐ O P) ∈ S := fun τ => by
      by_contra h
      exact one_ne_zero ((h1 τ).symm.trans (hS' _ h))
    have ha : Ideal.Quotient.mk P a ≠ 0 := fun h =>
      hS _ (hmem (IsAlgClosed.lift (R := O) (S := B ⧸ P) (M := K))) (by
        rw [AlgHom.comp_apply, Ideal.Quotient.mkₐ_eq_mk, h, map_zero])
    obtain ⟨hf, hne, heq⟩ := length_quotient_span_eq_finsum_valuation O K v hv (B ⧸ P) _ ha
    have hi : invLen a (B ⧸ P) = 0 := by
      have : Submodule.torsionBy B (B ⧸ P) a = ⊥ := by
        rw [eq_bot_iff]
        intro x hx
        have hx' : Ideal.Quotient.mk P a * x = 0 := (Submodule.mem_torsionBy_iff _ _).1 hx
        exact (mul_eq_zero.1 hx').resolve_left ha
      unfold invLen
      rw [this]
      exact Module.length_bot
    have hc : coinvLen a (B ⧸ P) = Module.length O ((B ⧸ P) ⧸ Ideal.span {Ideal.Quotient.mk P a}) := by
      rw [len_eq O B]
      have : a • (⊤ : Submodule B (B ⧸ P)) = (Ideal.span {Ideal.Quotient.mk P a}).restrictScalars B := by
        ext x
        rw [Submodule.mem_smul_pointwise_iff_exists, Submodule.restrictScalars_mem, Ideal.mem_span_singleton']
        constructor
        · rintro ⟨b, -, rfl⟩
          exact ⟨b, mul_comm _ _⟩
        · rintro ⟨b, rfl⟩
          exact ⟨b, trivial, mul_comm (Ideal.Quotient.mk P a) b⟩
      exact ((Submodule.quotEquivOfEq _ _ this).trans (Submodule.Quotient.restrictScalarsEquiv B _)).length_eq
    refine ⟨by simp [hi], hc ▸ hne, ?_⟩
    haveI := Fintype.ofFinite ((B ⧸ P) →ₐ[O] K)
    rw [hi, hc, heq, finsum_eq_sum_of_fintype]
    simp only [ENat.toNat_zero, Nat.cast_zero, sub_zero]
    refine Finset.sum_of_injOn (fun τ => τ.comp (Ideal.Quotient.mkₐ O P)) ?_ (fun τ _ => hmem τ) ?_ ?_
    · intro τ _ τ' _ h
      exact Ideal.Quotient.algHom_ext O h
    · intro σ _ hσ
      rw [h0 σ fun hle => hσ ⟨Ideal.Quotient.liftₐ P σ hle, by simp, by ext; rfl⟩]
      simp
    · intro τ _
      rw [h1]
      simp
  · have hmax : P.IsMaximal := by
      haveI : (P.comap (algebraMap O B)).IsMaximal :=
        Ring.DimensionLEOne.maximalOfPrime hinj (Ideal.comap_isPrime _ _)
      haveI : (Ideal.comap (algebraMap O (B ⧸ P)) ⊥).IsMaximal := by
        convert this using 1
        ext x
        rw [Ideal.mem_comap, Ideal.mem_comap, Ideal.mem_bot, ← Ideal.Quotient.eq_zero_iff_mem]
        rfl
      have := Ideal.isMaximal_of_isIntegral_of_isMaximal_comap (R := O) (⊥ : Ideal (B ⧸ P)) this
      exact Ideal.Quotient.maximal_of_isField _ (Ring.isField_iff_maximal_bot.2 this)
    haveI : IsSimpleModule B (B ⧸ P) := isSimpleModule_iff_quot_maximal.mpr ⟨P, hmax, ⟨LinearEquiv.refl _ _⟩⟩
    obtain ⟨h1, h2, h3⟩ := herbrand_finLen a (B ⧸ P) (by rw [Module.length_eq_one]; simp)
    refine ⟨h1, h2, ?_⟩
    rw [h3, sub_self]
    refine (Finset.sum_eq_zero fun σ _ => ?_).symm
    rw [h0 σ fun hle => hinj ?_]
    · simp
    · rw [eq_bot_iff]
      intro c hc
      have : σ (algebraMap O B c) = 0 := hle hc
      rw [AlgHom.commutes] at this
      exact (FaithfulSMul.algebraMap_injective O K) (this.trans (map_zero _).symm)


theorem UpperTheory.V.Alg.M.rh_th_exact :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ), IsNVal O K v →
    ∀ (B : Type) [CommRing B] [Algebra O B] [IsCO O B] (M : Type) [AddCommGroup M] [Module B M] [Module.Finite B M],
      Module.Finite O (B ⧸ Module.annihilator B M) → ∀ (a : B) (S : Finset (B →ₐ[O] K)),
      (∀ σ ∈ S, σ a ≠ 0 ∧ locLen σ M ≠ ⊤) → (∀ σ : B →ₐ[O] K, σ ∉ S → locLen σ M = 0) →
      (theta a M : ℝ) = ∑ σ ∈ S, ((locLen σ M).toNat : ℝ) * v (σ a) := by
  intro O _ _ _ _ _ K _ _ _ _ v hv B _ _ _ M _ _ hM hfin a S hS hS'
  have key : ∀ (I : Ideal B), Module.Finite O (B ⧸ I) → ∀ (N : Type) [AddCommGroup N] [Module B N]
      [hN : Module.Finite B N], I ≤ Module.annihilator B N → (∀ σ ∈ S, locLen σ N ≠ ⊤) →
      (∀ σ : B →ₐ[O] K, σ ∉ S → locLen σ N = 0) →
      invLen a N ≠ ⊤ ∧ coinvLen a N ≠ ⊤ ∧ ((coinvLen a N).toNat : ℝ) - ((invLen a N).toNat : ℝ) =
        ∑ σ ∈ S, ((locLen σ N).toNat : ℝ) * v (σ a) := by
    intro I hI N _ _ hN
    induction hN using IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime B with
    | subsingleton N =>
      intro _ _ _
      obtain ⟨h1, h2, h3⟩ := herbrand_finLen a N (by simp)
      refine ⟨h1, h2, ?_⟩
      rw [h3, sub_self]
      refine (Finset.sum_eq_zero fun σ _ => ?_).symm
      have : locLen σ N = 0 := by
        unfold locLen
        exact Module.length_eq_zero
      simp [this]
    | quotient N p e =>
      intro hle _ h0
      have hl : ∀ σ : B →ₐ[O] K, locLen σ N = locLen σ (B ⧸ p.1) := fun σ =>
        GlobalTheory.length_localizedModule_congr _ e
      have hle' : I ≤ p.1 := by
        rw [e.annihilator_eq, Ideal.annihilator_quotient] at hle
        exact hle
      haveI : Module.Finite O (B ⧸ p.1) :=
        Module.Finite.of_surjective (Ideal.Quotient.factorₐ O hle').toLinearMap (Ideal.Quotient.factor_surjective hle')
      rw [(herbrand_equiv a e).1, (herbrand_equiv a e).2]
      simp only [hl] at h0 ⊢
      exact prime_case O K v hv B p.1 a S (fun σ h => (hS σ h).1) h0
    | exact N₁ N₂ N₃ f g hf hg hfg ih₁ ih₃ =>
      intro hle ht h0
      have hl : ∀ σ : B →ₐ[O] K, locLen σ N₂ = locLen σ N₁ + locLen σ N₃ := fun σ =>
        GlobalTheory.length_localizedModule_eq_add_of_exact _ f g hf hg hfg
      have ht1 : ∀ σ ∈ S, locLen σ N₁ ≠ ⊤ := fun σ h h' => ht σ h (by rw [hl, h', top_add])
      have ht3 : ∀ σ ∈ S, locLen σ N₃ ≠ ⊤ := fun σ h h' => ht σ h (by rw [hl, h', add_top])
      obtain ⟨a1, b1, c1⟩ := ih₁ (hle.trans (f.annihilator_le_of_injective hf)) ht1
        fun σ h => (add_eq_zero.1 ((hl σ).symm.trans (h0 σ h))).1
      obtain ⟨a3, b3, c3⟩ := ih₃ (hle.trans (g.annihilator_le_of_surjective hg)) ht3
        fun σ h => (add_eq_zero.1 ((hl σ).symm.trans (h0 σ h))).2
      obtain ⟨s1, s2, s3, -⟩ := snake_len B a N₁ N₂ N₃ f g hf hg hfg
      have a2 : invLen a N₂ ≠ ⊤ := ne_top_of_le_ne_top (WithTop.add_ne_top.2 ⟨a1, a3⟩) s2
      have b2 : coinvLen a N₂ ≠ ⊤ := ne_top_of_le_ne_top (WithTop.add_ne_top.2 ⟨b1, b3⟩) s3
      refine ⟨a2, b2, ?_⟩
      have s := congrArg (fun x : ℕ∞ => (x.toNat : ℝ)) s1
      have t1 : invLen a N₁ + invLen a N₃ ≠ ⊤ := WithTop.add_ne_top.2 ⟨a1, a3⟩
      have t2 : invLen a N₂ + coinvLen a N₁ ≠ ⊤ := WithTop.add_ne_top.2 ⟨a2, b1⟩
      rw [ENat.toNat_add t1 b2, ENat.toNat_add a1 a3, ENat.toNat_add t2 b3, ENat.toNat_add a2 b1] at s
      push_cast at s
      have : ∑ σ ∈ S, ((locLen σ N₂).toNat : ℝ) * v (σ a) =
          ∑ σ ∈ S, ((locLen σ N₁).toNat : ℝ) * v (σ a) + ∑ σ ∈ S, ((locLen σ N₃).toNat : ℝ) * v (σ a) := by
        rw [← Finset.sum_add_distrib]
        refine Finset.sum_congr rfl fun σ h => ?_
        rw [hl, ENat.toNat_add (ht1 σ h) (ht3 σ h)]
        push_cast
        ring
      linarith
  obtain ⟨-, -, h⟩ := key _ hfin M le_rfl (fun σ h => (hS σ h).2) hS'
  rw [theta_eq]
  push_cast
  exact h

theorem UpperTheory.V.Alg.M.rh_th_exact_original :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ), IsNVal O K v →
    ∀ (B : Type) [CommRing B] [Algebra O B] [IsCO O B] (M : Type) [AddCommGroup M] [Module B M] [Module.Finite B M],
      Module.Finite O (B ⧸ Module.annihilator B M) → ∀ (a : B) (S : Finset (B →ₐ[O] K)) (c : ℕ),
      (∀ σ ∈ S, σ a ≠ 0 ∧ 0 ≤ v (σ a) ∧ locLen σ M ≤ c) → (∀ σ : B →ₐ[O] K, σ ∉ S → locLen σ M = 0) →
      (theta a M : ℝ) ≤ c * ∑ σ ∈ S, v (σ a) := by
  intro O _ _ _ _ _ K _ _ _ _ v hv B _ _ _ M _ _ hM hfin a S c hS hS'
  have hfinite : ∀ σ ∈ S, locLen σ M ≠ ⊤ := by
    intro σ hσ
    exact ne_top_of_le_ne_top (ENat.coe_ne_top c) (hS σ hσ).2.2
  have he := rh_th_exact O K v hv B M hfin a S
    (fun σ hσ => ⟨(hS σ hσ).1, hfinite σ hσ⟩) hS'
  rw [he, Finset.mul_sum]
  refine Finset.sum_le_sum fun σ hσ => mul_le_mul_of_nonneg_right ?_ (hS σ hσ).2.1
  exact_mod_cast ENat.toNat_le_of_le_coe (hS σ hσ).2.2

theorem UpperTheory.V.Alg.M.rh_up_image :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (K : Type) [Field K] [Algebra O K] [IsAlgClosed K] [FaithfulSMul O K] (v : K → ℝ), IsNVal O K v →
    ∀ (A : Type) [CommRing A] [Algebra O A] (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [IsCO O (𝒜 0)] (x : A →ₐ[O] O), IsWRing 𝒜 x →
    ∀ (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m),
    SpansCot x 𝒜 (-1) Q.F → SpansCot x 𝒜 (-2) Q.G → M2 𝒜 Q.ideal → M3 𝒜 K x Q.ideal → M4 𝒜 K Q.ideal →
    ∀ a : 𝒜 0, M5 𝒜 K x Q.ideal a → ∀ T : Finset (A →ₐ[O] K), Covers 𝒜 Q.ideal T →
    ∀ J : Ideal (mR Q), (GMod.self (mGr Q)).IsHomSub J → secs (ts Q) ≤ J → (∀ i, algebraMap (𝒜 0) (mR Q) ⟨Q.Z i, (Q.hZ i).1⟩ ∈ J) →
      ∀ᶠ d in atTop, (chi [(0, algebraMap (𝒜 0) (mR Q) a)] (mQ Q J) d : ℝ) ≤ 2 ^ (r + 1 + r') * ∑ σ ∈ T.image (res0 𝒜), v (σ a) := by
  intro O _ _ _ _ _ K _ _ _ _ v hv A _ _ 𝒜 _ _ x hW r s r' s' m Q hF hG h2 h3 h4 a h5 T hT J hJ hsec hZ
  classical
  have hfg := fg_holds O A 𝒜 x hW
  have hN : ∀ i, (mN 𝒜 (Q.F (Fin.last r)) i).FG := by
    intro i
    fin_cases i
    · exact hfg _
    · exact hfg _
    · exact (Submodule.fg_span_singleton _).sup (((hfg _).mul (hfg _)).mul (hfg _))
  let X : HidaSetting 3 := { B := 𝒜 0, R := mR Q, 𝒜 := mGr Q, std := std_holds (𝒜 0) A 3 _ hN }
  have hself : (GMod.self (mGr Q)).IsGr (mGr Q) :=
    ⟨fun {d e} {p} {q : mR Q} (hp : p ∈ mGr Q d) (hq : q ∈ mGr Q e) => (SetLike.mul_mem_graded hp hq : p * q ∈ mGr Q (d + e)),
      rees_internal _, Module.Finite.self (mR Q)⟩
  have hGr : (mQ Q J).IsGr (mGr Q) := ((ruleGr 3 X _ hself).1 J hJ).2
  have hfin : ∀ d, Module.Finite (𝒜 0) ((mQ Q J).gr d) := (ruleFin 3 X _ hGr).1
  obtain ⟨hI, -, -⟩ := hom_holds O A 𝒜 x hW r s r' s' m Q
  have hD : ∀ ξ : A →ₐ[O] K, TwoSigned 𝒜 ξ ↔ ¬ idD 𝒜 ≤ RingHom.ker (res0 𝒜 ξ) := by
    intro ξ
    obtain ⟨hn, hp⟩ := sign_holds O A 𝒜 x hW K ξ
    rw [TwoSigned, hn, hp]
    constructor
    · rintro ⟨⟨f, hf, hf0⟩, g, hg, hg0⟩ hle
      have hm : f * g ∈ 𝒜 0 := by
        have := SetLike.GradedMul.mul_mem hf hg
        simpa using this
      have h1 : (⟨f * g, hm⟩ : 𝒜 0) ∈ idD 𝒜 := Ideal.subset_span ⟨f, hf, g, hg, rfl⟩
      have h2 : ξ (f * g) = 0 := hle h1
      rw [map_mul] at h2
      exact mul_ne_zero hf0 hg0 h2
    · intro h
      by_contra hc
      refine h (Ideal.span_le.2 ?_)
      rintro b ⟨f, hf, g, hg, hb⟩
      show ξ (b : A) = 0
      rw [hb, map_mul]
      by_contra hne
      exact hc ⟨⟨f, hf, left_ne_zero_of_mul hne⟩, g, hg, right_ne_zero_of_mul hne⟩
  have hpos : ∀ ξ ∈ T, ξ a ≠ 0 ∧ 0 ≤ v (ξ a) := fun ξ hξ =>
    ⟨h5.2.2 ξ (hT.1 ξ hξ).1 (hT.1 ξ hξ).2,
      valuation_nonneg_apply_degreeZero_of_onS O K v hv A 𝒜 x Q.ideal h2 ξ (hT.1 ξ hξ).1 a a.2 (h5.2.2 ξ (hT.1 ξ hξ).1 (hT.1 ξ hξ).2)⟩
  filter_upwards [eventually_mQ_gr_finite_annihilator O K A 𝒜 x hW r s r' s' m Q hF hG h2 h3 J hJ hsec hZ, eventually_ge_atTop 1] with d hd hd1
  haveI := hfin d
  have key := rh_th_exact_original O K v hv (𝒜 0) ((mQ Q J).gr d) hd.1 a (T.image (res0 𝒜)) (2 ^ (r + 1 + r')) ?_ ?_
  · rw [chi_single0 _ hGr.internal]
    push_cast at key
    exact key
  · intro σ hσ
    obtain ⟨ξ, hξ, rfl⟩ := Finset.mem_image.1 hσ
    refine ⟨(hpos ξ hξ).1, (hpos ξ hξ).2, ?_⟩
    have hσ' := (hD ξ).1 (hT.1 ξ hξ).2
    refine (locLen_mQ_gr_le_locLen_aPiece O K A 𝒜 x hW r s r' s' m Q J hsec hZ _ hσ' d hd1).trans ?_
    push_cast
    exact locLen_aPiece_ideal2_le_two_pow O K A 𝒜 x hW r s r' s' m Q _ (locLen_quotientWeightPiece_le_one O K A 𝒜 x hW _ hI h2 h4 _ hσ') _
  · intro σ hσ
    refine hd.2 σ ?_
    by_contra hc
    rw [not_or] at hc
    obtain ⟨ξ, hξ, rfl⟩ := tsp_holds O K A 𝒜 x hW _ hI σ fun b hb => by
      by_contra hne
      exact hc.2 ⟨b, hb, hne⟩
    obtain ⟨ξ', hξ', t, rfl⟩ := hT.2 ξ hξ ((hD ξ).2 hc.1)
    refine hσ (Finset.mem_image.2 ⟨ξ', hξ', AlgHom.ext fun b => ?_⟩)
    show ξ' (b : A) = act 𝒜 (tz t) ξ' (b : A)
    rw [act_of_mem 𝒜 _ _ b.2]
    simp


-- Actual named supplier and replacement; bounded source-context audit.
rh_scan UpperTheory.V.Alg.M.core_holds limit 2000
rh_prune UpperTheory.V.Alg.M.core_holds as RHNativeCoreReduced
rh_scan UpperTheory.V.Alg.M.th_holds limit 2000
rh_prune UpperTheory.V.Alg.M.th_holds as RHNativeThetaReduced
rh_scan UpperTheory.V.Alg.M.rh_th_exact limit 2000
rh_scan UpperTheory.V.Alg.M.rh_up_image limit 2000
#print axioms UpperTheory.V.Alg.M.core_holds
#print axioms UpperTheory.V.Alg.M.th_holds
#print axioms UpperTheory.V.Alg.M.rh_th_exact
#print axioms UpperTheory.V.Alg.M.rh_th_exact_original
#print axioms UpperTheory.V.Alg.M.rh_up_image

-- Exact th_holds finite-length premise in the actual ENat context.
-- Rule-driven/automatic/frontier variants; no admissions if any fail.
theorem rh_countI_finite_rule (n : ℕ∞) (c : ℕ) (h : n ≤ c) : n ≠ ⊤ := by
  rh_reduce 3 using [ne_top_of_le_ne_top, ENat.coe_ne_top]

theorem rh_countI_finite_auto (n : ℕ∞) (c : ℕ) (h : n ≤ c) : n ≠ ⊤ := by
  rh_auto 3

theorem rh_countI_finite_frontier (n : ℕ∞) (c : ℕ) (h : n ≤ c) : n ≠ ⊤ := by
  rh_auto_frontier 3
  all_goals exact ne_top_of_le_ne_top (ENat.coe_ne_top c) h

#print axioms rh_countI_finite_rule
#print axioms rh_countI_finite_auto
#print axioms rh_countI_finite_frontier

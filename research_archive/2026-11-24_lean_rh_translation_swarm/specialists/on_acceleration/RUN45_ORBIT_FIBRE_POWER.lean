import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU

/-!
RUN45 — exact orbit-fibre power, lane 14. Status: human derivation + finite exact arithmetic checks;
Lean candidate PREPARED, not compiled. No RH or root-level obligation discharged.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory unified engine read).
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005, source src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/AdmissibleResidues/FrobeniusTraceCountBoundOfRatEigensystemCount.lean, blob fc375ef5c996180c985df22cc3f15655a9765126.
Actual caller FPropGKU.lean blob 4887bdf435a54a8ab856102e15d60da39d041970;
KeepNumU.lean blob a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7.
Peer results reviewed: c5fe320e, 94cfd3a4, ba04fa11, 8be39223, 4daf9080,
e897aeb5, 2b75bc4a, 054230d9, 3463c301, 2355b4d2. None silently promoted.

Original graph: CountI -> propGK_of_numberU3U_of_oneCharU -> NumberU3U_s ->
numberU3U_of_adm2A_imp_adm2B -> frobenius_trace_norm_nonzero_log_bound ->
integral Galois product / valuation bound / D1.sum D2 catalogue.
Candidate local graph: same caller and catalogue -> uniform orbit-fibre equivalence
-> smaller integral Galois product -> exact power -> original valuation/log consumers.
Original graph and unresolved catalogue, automorphy, geometry, analytic obligations retained.
The generic grouping lemma requires the equivalence and Galois closure as explicit premises.
No global replacement of arbitrary Orb in NumberU3U_s asserted.

Human proof at FPropGKU: if Orb is nonempty, a character with kernel H embeds the
finite quotient (Z/N)^×/H into C^×; hence it is cyclic, of order m=H.index.
q=normV w is a unit modulo N by the native premises. Let d be the order of qH.
All faithful characters are indexed by U(m); evaluation at qH (or its inverse)
ranges over primitive d-th roots. Reduction U(m)->U(d) is surjective:
lift a unit mod d, imposing residue 1 modulo each prime dividing m but not d
by CRT. Primes dividing d are already avoided. Fibres of a surjective finite
group homomorphism have equal cardinality r=phi(m)/phi(d).
Therefore there exists an equivalence Orb ≃ U(d) × Fin r respecting evaluations.
Primitive roots form a Galois-stable set. d=1 included (phi(1)=1);
if Orb is empty use the original empty product 1. No choice of new place,
character kernel, field, or Frobenius. Multiplicities of distinct trace labels
are NOT merged. The exact native factor is F(o,s)=q^e*(D.t s-eis3(q,e,z(o))).
Regrouping yields NN=M^r where M is the product over U(d) × D.S; M integral
by the same native Galois-invariance argument, and nonzero by the same factor bounds.
In particular v_l(NN)=r*v_l(M), not v_l(M); the original total budget is unchanged.
Factor-evaluation count falls from phi(m)*|D.S| to phi(d)*|D.S|,
not a measured kernel speedup. Uniform proof of actual equivalence still to formalize.

Executed independent exact modular-unit enumeration: m=1..128, all d|m;
645 divisor cases, 8256 individual unit-fibre equalities; 485 strict compression
cases; total original labels 22513, grouped labels 8256 (unweighted by trace catalogue).
These are finite arithmetic regression checks, not real CountI catalogue data.
Reproduction: for each m enumerate 0<=a<m with gcd(a,m)=1; histogram a mod d;
assert keys are precisely units mod d, each count phi(m)/phi(d).
No URT used, no actual Lean runtime or memory benchmark available.
CI baseline jobs 45577239749, 45576756833, 45670987597 checked completed/success;
none verifies this new module. New axiom audit pending, original ledger retained.

RESUME HERE: kernel-check grouped45 against pinned native sources; construct E,
zU, hzE, hzU, hσU at actual FPropGKU quotient (including empty case); prove exact
valuation power identity and compare against the original caller before replacing.
Use native rh_scan/rh_prune and rh_reduce/rh_auto/rh_auto_frontier on the actual
equivalence obligation via the existing engine harness; cache by source blob,
N,H,q and exact catalogue context; backtrack to original product on any failure.
Do not use the claimed RH theorem. No essential obligation retired.
-/

noncomputable section
open scoped BigOperators
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
namespace UpperTheory.GalN.V.Win
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp UpperTheory.V.Af

private theorem norm_natCast_qbar_eq_one_of_not_dvd45 (l q : ℕ) [Fact l.Prime] (h : ¬ l ∣ q) : ‖(q : Qbar l)‖ = 1 := by
  show ‖(q : PadicAlgCl l)‖ = 1
  rw [← map_natCast (algebraMap ℚ_[l] (PadicAlgCl l)), PadicAlgCl.norm_extends]
  have : ((q : ℚ_[l])) = ((q : ℚ) : ℚ_[l]) := by push_cast; rfl
  rw [this, Padic.eq_padicNorm]
  exact_mod_cast (padicNorm.nat_eq_one_iff q).2 h


theorem frobenius_trace_norm_nonzero_log_bound_grouped45 :
    ∀ (q e : ℕ), 7 ≤ q → 1 ≤ e → ∀ (D : TrData q e) (Orb : Type) [Fintype Orb] (z : Orb → ℂ), (∀ o, ∃ k : ℕ, 0 < k ∧ z o ^ k = 1) → (∀ σ : ℂ ≃+* ℂ, ∃ u : Orb ≃ Orb, ∀ o, z (u o) = σ (z o)) → ∀ (U : Type) [Fintype U] (r : ℕ) (E : Orb ≃ U × Fin r) (zU : U → ℂ), (∀ o, z o = zU (E o).1) → (∀ u, ∃ k : ℕ, 0 < k ∧ zU u ^ k = 1) → (∀ σ : ℂ ≃+* ℂ, ∃ v : U ≃ U, ∀ u, zU (v u) = σ (zU u)) → ∃ NN M : ℤ, NN = M ^ r ∧ NN ≠ 0 ∧ Real.log |(NN : ℝ)| ≤ Fintype.card Orb * Nat.card D.S * (2 * e * Real.log q + 1) ∧ ∀ (l : ℕ) [Fact l.Prime], ¬ l ∣ q → ∀ (ι : Qbar l ≃+* ℂ) (Γ : Type) [Group Γ] (g : Γ) (admitted : (Γ →* GL (Fin 3) (Qbar l)) → Prop), D.Classifies ι g admitted → ∀ X : Orb → Finset (Γ →* GL (Fin 3) (Qbar l)), (∀ o, ∀ ρ ∈ X o, admitted ρ) → (∀ o, ∀ ρ ∈ X o, ∀ ρ' ∈ X o, RepIso ρ ρ' → ρ = ρ') → (∀ o, ∀ ρ ∈ X o, (ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace ≠ ι.symm (eis3 q e (z o))) ∧ ‖((NN : ℤ) : Qbar l)‖ ≤ ∏ o, ∏ ρ ∈ X o, ‖(ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ι.symm (eis3 q e (z o))‖ := by
  intro q e hq he D Orb _ z hz hσ U _ r E zU hzE hzU hσU
  haveI := D.fin
  haveI : Fintype D.S := Fintype.ofFinite _
  have hq0 : (q : ℂ) ≠ 0 := by exact_mod_cast (show q ≠ 0 by omega)
  let F : Orb → D.S → ℂ := fun o s => (q : ℂ) ^ e * (D.t s - eis3 q e (z o))
  have hF : ∀ o s, D.t s ≠ eis3 q e (z o) ∧ IsIntegral ℤ (F o s) ∧
      Real.log ‖F o s‖ ≤ 2 * e * Real.log q + 1 := by
    intro o s
    obtain ⟨k, hk, hzk⟩ := hz o
    exact eisenstein_trace_difference_log_bound q e k hq he hk (z o) (D.t s) hzk (D.bd s) (D.int s)
  have Heisenberg₂ : ∀ (σ : ℂ ≃+* ℂ) (w : ℂ), σ (eis3 q e w) = eis3 q e (σ w) := by
    intro σ w
    simp only [eis3]
    simp [map_add, map_mul, map_inv₀, map_pow, map_natCast]
  let G : U → D.S → ℂ := fun u s => (q : ℂ) ^ e * (D.t s - eis3 q e (zU u))
  have hG : ∀ u s, IsIntegral ℤ (G u s) := by
    intro u s
    obtain ⟨k, hk, hzk⟩ := hzU u
    exact (eisenstein_trace_difference_log_bound q e k hq he hk (zU u) (D.t s) hzk (D.bd s) (D.int s)).2.1
  obtain ⟨M, hM⟩ := UpperTheory.exists_int_eq_prod_of_galois_permuted_integral (U × D.S) (fun x => G x.1 x.2) (fun x => hG x.1 x.2) (by
    intro σ
    obtain ⟨uO, huO⟩ := hσU σ
    obtain ⟨uD, huD⟩ := D.conj σ
    refine ⟨Equiv.prodCongr uO uD, fun x => ?_⟩
    simp only [Equiv.prodCongr_apply, Prod.map_fst, Prod.map_snd, G]
    rw [huO, huD, ← Heisenberg₂]
    simp [map_mul, map_sub, map_pow, map_natCast])
  let NN : ℤ := M ^ r
  have heq : (∏ o : Orb, ∏ s : D.S, F o s) = ∏ x : U × Fin r, ∏ s : D.S, G x.1 s := by
    apply Fintype.prod_equiv E
    intro o
    simp only [F, G, hzE o]
  have hprod : (NN : ℂ) = ∏ o, ∏ s, F o s := by
    calc
      (NN : ℂ) = (∏ u : U, ∏ s : D.S, G u s) ^ r := by
        dsimp [NN]
        push_cast
        rw [hM, Fintype.prod_prod_type]
      _ = ∏ x : U × Fin r, ∏ s : D.S, G x.1 s := by
        rw [Fintype.prod_prod_type, Finset.prod_pow]
        simp
      _ = _ := heq.symm
  have hne : ∀ o s, F o s ≠ 0 := fun o s =>
    mul_ne_zero (pow_ne_zero _ hq0) (sub_ne_zero.2 (hF o s).1)
  refine ⟨NN, M, rfl, ?_, ?_, ?_⟩
  · intro h0
    have h1 : (NN : ℂ) = 0 := by rw [h0]; simp
    rw [hprod] at h1
    obtain ⟨o, -, ho⟩ := Finset.prod_eq_zero_iff.1 h1
    obtain ⟨s, -, hs⟩ := Finset.prod_eq_zero_iff.1 ho
    exact hne o s hs
  · have habs : |(NN : ℝ)| = ∏ o, ∏ s, ‖F o s‖ := by
      rw [← Complex.norm_intCast, hprod, norm_prod]
      simp only [norm_prod]
    rw [habs, Real.log_prod (fun o _ => (Finset.prod_pos fun s _ => norm_pos_iff.2 (hne o s)).ne')]
    calc ∑ o, Real.log (∏ s, ‖F o s‖) = ∑ o, ∑ s, Real.log ‖F o s‖ := by
          apply Finset.sum_congr rfl
          intro o _
          exact Real.log_prod (fun s _ => (norm_pos_iff.2 (hne o s)).ne')
      _ ≤ ∑ o : Orb, ∑ s : D.S, (2 * (e : ℝ) * Real.log q + 1) :=
          Finset.sum_le_sum fun o _ => Finset.sum_le_sum fun s _ => (hF o s).2.2
      _ = _ := by
          simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Nat.card_eq_fintype_card]
          ring
  · intro l _ hlq ι Γ _ g admitted hcl X hAdm hX
    obtain ⟨cl, hcl1, hcl2⟩ := hcl
    have htr : ∀ o, ∀ ρ (hρ : ρ ∈ X o), (ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace =
        ι.symm (D.t (cl ⟨ρ, hAdm o ρ hρ⟩)) := fun o ρ hρ => hcl2 ⟨ρ, hAdm o ρ hρ⟩
    refine ⟨fun o ρ hρ => ?_, ?_⟩
    · rw [htr o ρ hρ]
      intro h
      exact (hF o _).1 (ι.symm.injective h)
    · let cl' : (o : Orb) → ↥(X o) → D.S := fun o r => cl ⟨r.1, hAdm o r.1 r.2⟩
      have hinj : ∀ o, Function.Injective (cl' o) := by
        intro o r r' h
        exact Subtype.ext (hX o r.1 r.2 r'.1 r'.2 (hcl1 _ _ h))
      have key := UpperTheory.adicNorm_prod_le_prod_of_injective_classes l ι Orb D.S (Γ →* GL (Fin 3) (Qbar l)) F (fun o s => (hF o s).2.1) X cl' hinj
      have hqn := norm_natCast_qbar_eq_one_of_not_dvd45 l q hlq
      have hL : ι.symm (∏ o, ∏ s, F o s) = ((NN : ℤ) : Qbar l) := by rw [← hprod, map_intCast]
      rw [hL] at key
      refine key.trans (le_of_eq ?_)
      apply Finset.prod_congr rfl
      intro o _
      refine Eq.trans ?_ (Finset.prod_coe_sort (X o)
        (fun ρ => ‖(ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ι.symm (eis3 q e (z o))‖))
      apply Finset.prod_congr rfl
      intro r _
      simp only [F, cl']
      rw [map_mul, map_pow, map_natCast, norm_mul, norm_pow, hqn, one_pow, one_mul, map_sub, htr o r.1 r.2]


#print axioms frobenius_trace_norm_nonzero_log_bound_grouped45
end UpperTheory.GalN.V.Win

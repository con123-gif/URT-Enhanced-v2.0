import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48 — literature provenance, 2026-11-26. SOURCE-MATCHED / PREPARED; NOT ELABORATED.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine).
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed latest 11437ebe3e9938e25d3122bd645d56eee1cd4b56, not migrated.
Native FrobeniusTraceCountBoundOfCmEigensystemCount.lean blob 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40;
KeepNumU.lean blob a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7. Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer 59e81b98 already proved human injective-family aggregation and prepared a generic
bridge with hsum and hmax. This fulfills that handoff: derive both from the actual
injection and finite maximum, replace actual countQ_alt body, and prepare actual
NumberU3U_s caller and original-interface bridges. Not a claim of new arithmetic.
Peer e70e93e7 and 3b2b21cf separately improve CardK/P and downstream maxima;
those changes remain independent, not silently merged. Read recent 0cfcd0a6,
4072e556, d843aa72, 7f45ab3c, 2becd062 and 65d0f958. RUN47 relative level bound retained.

For Y=M(H+1)>=1, u:Fin(n^2+1) -> Fin(n^2+2) injective, the bound is
  |D'.S| <= 2^(n+1) sum_i |D_i.S|
          <= 2^(n+1) (sum_j c_j) Y^(max_j A_j).
The selected sum is exactly the image sum; no n^2+1 multiplicity loss.
The finite maximum dominates each selected exponent. No new premise.
The original package hP and hL in countQ_alt is used only to supply CountPAlt.
New local interface CountPAlt -> AdmResNAlt -> CountQAlt.
CountPAlt and AdmResNAlt are propositions, not authenticated literature axioms.
Their actual proof suppliers, all classification and existence conditions, p/ell
restrictions, uniform witnesses c,A before m,wt,H,M,p,w, and same-host constraints
are preserved. No global removal of Hypotheses' or LevelPNAlt.

Source-level original graph:
NumberU3U_s <- numberU3U_of_prints <- numberU3U_of_adm2A_imp_adm2B
<- rational trace bound <- countQ_alt <- countP_alt, quadFam, exists_avoid,
exists_over, rootSum, twCard, resTwo, bit_of_fibre, Frobenius compatibility.
Reduced candidate graph: same NumberU3U_s caller with countQ_aggregate48 ->
countQ_of_countP_aggregate48 -> CountPAlt, AdmResNAlt and unchanged native
classification edges; selected_aggregate48 uses sum_image, subset nonnegative
sum, le_sup and monotonic powers. Original interface bridge still calls
countP_alt. Other caller and sibling edges unchanged. These are source-visible
edges only, not complete kernel graphs. Retain all original/type/constructor/
value/pending edges and earlier axiom evidence. No new axiom or sorry introduced;
transitive axiom status OPEN until compilation and scan.
Mathlib source anchors: Algebra/BigOperators/Group/Finset/Basic.lean sum_image
(additive of prod_image); Data/Finset/Lattice/Fold.lean le_sup;
Algebra/Order/BigOperators/Group/Finset.lean sum_le_sum_of_subset_of_nonneg.
Cache key includes source and toolchain pin, n, family K_j, c_j,A_j,m,wt,H,M,p,w,
injection u and selected D, ell, Omega,iota; no cross-context witness reuse.

Executed in JS: 11520 exact integer regression instances (all 720 ordered
injections 5->6, four c,A profiles, Y=1..4) and a noninjective negative
control (u=[0,0], c=[1,0], A=[0,0], Y=1 gives 2>1).
23 source SHA/range/reversible-splice/control checks. Arithmetic regression
is not evidence for CountPAlt, native Lean or RH. Lean/lake unavailable locally.
Historical CI status.json retrieved: 45577239749 and 45576756833 pass,
not a pass for this file. Current certificate uncompiled, unqueued.
No URT performance claim. RH OPEN, weighted prime-window inequality OPEN.

RESUME HERE: kernel/audit replay this certificate against pinned imports and
engine files; fix any elaboration issues; compare original/reduced scans and
constructor-inclusive axiom evidence. If any replacement fails, use original
countQ_alt and KeepNumU. Then integrate max-exponent and explicit relative-level
suppliers only after independent validation; pursue uniform CountPAlt bounds
and the remaining prime-window obstruction, not redundant aggregation.
HANDOFF TO integration and audit: use CountPAlt as the actual local interface,
not as a proved literature premise. No schedule changes.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
namespace UpperTheory.GalN.V.Win.N
section
open NumberField IsDedekindDomain Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Polynomial
  UpperTheory.V UpperTheory.V.Af UpperTheory.V.Af.Bc UpperTheory.V.Br

theorem selected_aggregate48 {I J : Type} [Fintype I] [Fintype J]
    (c A : J → ℕ) (u : I → J) (d : I → ℕ) (Y : ℕ)
    (hY : 1 ≤ Y) (hu : Function.Injective u)
    (hd : ∀ i, d i ≤ c (u i) * Y ^ A (u i)) :
    (∑ i, d i) ≤ (∑ j, c j) * Y ^ (Finset.univ.sup A) := by
  classical
  have hsum : (∑ i, c (u i)) ≤ ∑ j, c j := by
    calc
      (∑ i, c (u i)) = ∑ j ∈ Finset.univ.image u, c j := by
        rw [Finset.sum_image hu.injOn]
      _ ≤ ∑ j, c j := Finset.sum_le_sum_of_subset_of_nonneg
        (Finset.subset_univ _) (fun _ _ _ => Nat.zero_le _)
  calc
    (∑ i, d i) ≤ ∑ i, c (u i) * Y ^ A (u i) := Finset.sum_le_sum fun i _ => hd i
    _ ≤ ∑ i, c (u i) * Y ^ (Finset.univ.sup A) :=
      Finset.sum_le_sum fun i _ => Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY
        (Finset.le_sup (f := A) (Finset.mem_univ (u i))))
    _ = (∑ i, c (u i)) * Y ^ (Finset.univ.sup A) := by rw [Finset.sum_mul]
    _ ≤ _ := Nat.mul_le_mul_right _ hsum

private theorem bit_of_fibre {X U : Type} (R : X → X → Prop) (hs : ∀ x y, R x y → R y x)
    (ht : ∀ x y z, R x y → R y z → R x z) (Q : X → U → Prop) (hQ : ∀ x, ∃ u, Q x u)
    (h2 : ∀ u x₀ x x', Q x₀ u → Q x u → Q x' u → ¬ R x₀ x → ¬ R x₀ x' → R x x') :
    ∃ g : X → U × Bool, (∀ x x', g x = g x' → R x x') ∧ ∀ x, Q x (g x).1 := by
  classical
  choose u hu using hQ
  have hex : ∀ x : X, ∃ y, Q y (u x) := fun x => ⟨x, hu x⟩
  refine ⟨fun x => (u x, decide (R (Classical.epsilon (α := X) (h := ⟨x⟩) fun y => Q y (u x)) x)), fun x x' h => ?_, hu⟩
  obtain ⟨h1, h3⟩ := Prod.ext_iff.1 h
  simp only at h1 h3
  have h0 := Classical.epsilon_spec (hex x)
  rw [← h1, decide_eq_decide] at h3
  have hx' : Q x' (u x) := h1 ▸ hu x'
  by_cases hc : R (Classical.epsilon (α := X) (h := ⟨x⟩) fun y => Q y (u x)) x
  · exact ht _ _ _ (hs _ _ hc) (h3.1 hc)
  · exact h2 _ _ _ _ h0 (hu x) hx' hc fun h4 => hc (h3.2 h4)
private theorem iso_symm {Γ k : Type} [Group Γ] [Field k] {n : ℕ} {r r' : Γ →* GL (Fin n) k} (h : RepIso r r') :
    RepIso r' r := by
  obtain ⟨g, hg⟩ := h
  exact ⟨g⁻¹, fun s => by rw [hg s]; group⟩
private theorem iso_trans {Γ k : Type} [Group Γ] [Field k] {n : ℕ} {r r' r'' : Γ →* GL (Fin n) k} (h : RepIso r r')
    (h' : RepIso r' r'') : RepIso r r'' := by
  obtain ⟨g, hg⟩ := h
  obtain ⟨g', hg'⟩ := h'
  exact ⟨g' * g, fun s => by rw [hg' s, hg s]; group⟩
private theorem normV_rat {p : ℕ} (hp : p.Prime) (w : HeightOneSpectrum (𝓞 ℚ)) (hw : (p : 𝓞 ℚ) ∈ w.asIdeal) :
    normV w = p := by
  obtain ⟨h, h1, h2, h3⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank ℚ p w hp hw
  rw [Module.finrank_self] at h2
  rw [h3, le_antisymm h2 h1, pow_one]
private theorem exists_over (K : Type) [Field K] [NumberField K] (h2 : Module.finrank ℚ K = 2) {p : ℕ} (hp : p.Prime)
    (w : HeightOneSpectrum (𝓞 ℚ)) (hw : (p : 𝓞 ℚ) ∈ w.asIdeal) :
    ∃ (v : HeightOneSpectrum (𝓞 K)) (f : ℕ), v.under (𝓞 ℚ) = w ∧ (p : 𝓞 K) ∈ v.asIdeal ∧ 1 ≤ f ∧ f ≤ 2 ∧ normV v = p ^ f := by
  haveI := w.isMaximal
  obtain ⟨Q, hQ, hL⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral (S := 𝓞 K) w.asIdeal
  have hpQ : (p : 𝓞 K) ∈ Q := by
    have : (p : 𝓞 ℚ) ∈ Q.under (𝓞 ℚ) := hL.over ▸ hw
    simpa [Ideal.under, Ideal.mem_comap] using this
  have h0 : Q ≠ ⊥ := by
    rintro rfl
    exact hp.ne_zero (by simpa using hpQ)
  obtain ⟨f, f1, f2, f3⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank K p ⟨Q, hQ.isPrime, h0⟩ hp hpQ
  exact ⟨⟨Q, hQ.isPrime, h0⟩, f, HeightOneSpectrum.ext hL.over.symm, hpQ, f1, h2 ▸ f2, f3⟩
private theorem not_mem_of_coprime {F : Type} [Field F] [NumberField F] {p a : ℕ} (h : p.Coprime a)
    (w : HeightOneSpectrum (𝓞 F)) (hw : (p : 𝓞 F) ∈ w.asIdeal) : (a : 𝓞 F) ∉ w.asIdeal := fun ha => by
  obtain ⟨x, y, e⟩ : IsCoprime (p : 𝓞 F) (a : 𝓞 F) := Nat.Coprime.cast h
  exact w.isPrime.ne_top ((Ideal.eq_top_iff_one _).2 (e ▸ w.asIdeal.add_mem (w.asIdeal.mul_mem_left _ hw)
    (w.asIdeal.mul_mem_left _ ha)))
private theorem exists_avoid {N : ℕ} (d : Fin (N + 1) → ℤ) (hd : ∀ i j, i ≠ j → IsCoprime (d i) (d j)) {p : ℕ} (hp : p.Prime) :
    ∃ u : Fin N → Fin (N + 1), Function.Injective u ∧ ∀ i, ¬ (p : ℤ) ∣ d (u i) := by
  by_cases h : ∃ j, (p : ℤ) ∣ d j
  · obtain ⟨j, hj⟩ := h
    refine ⟨j.succAbove, Fin.succAbove_right_injective, fun i hi => ?_⟩
    have := (hd _ _ (Fin.succAbove_ne j i)).isUnit_of_dvd' hi hj
    exact (Nat.prime_iff_prime_int.1 hp).not_unit this
  · exact ⟨Fin.succ, Fin.succ_injective _, fun i hi => h ⟨_, hi⟩⟩
private theorem map_inv_inv (B : Multiset ℂ) : (B.map (·⁻¹)).map (·⁻¹) = B := by
  rw [Multiset.map_map]
  simp
theorem countQ_of_countP_aggregate48 (hCount : CountPAlt) (hA : _root_.UpperTheory.GalN.V.AdmResNAlt) : CountQAlt := by
  intro n hn
  classical
  obtain ⟨K₀, _, _, _, hK2, hKc⟩ := quadFam (n ^ 2 + 1 + 1)
  choose c A hcA using fun i => hCount (K₀ i) (hK2 i) n hn
  refine ⟨2 ^ (n + 1) * (∑ i, c i), Finset.univ.sup A, ?_⟩
  intro m wt hm hwt H hH M hM p w hp hpw hpM
  obtain ⟨u, hu, hup⟩ := exists_avoid (fun i => discr (K₀ i)) hKc hp
  choose v f hvw hpv hf1 hf2 hvf using fun i => exists_over (K₀ (u i)) (hK2 _) hp w hpw
  choose D hDc hD using fun i => hcA (u i) m wt hm hwt H hH M hM p (v i) hp (hpv i) hpM (hup i)
  obtain ⟨D', hD', e, he, heβ⟩ := rootSum n p hp.pos m wt (Fin (n ^ 2 + 1)) (fun i => normV (v i)) f
    (fun i => ⟨hf1 i, hf2 i, hvf i⟩) D
  refine ⟨D', hD'.trans ?_, ?_⟩
  · rw [mul_assoc]
    exact Nat.mul_le_mul_left _ (selected_aggregate48 c A u
      (fun i => Nat.card (D i).S) (M * (H + 1))
      (Nat.mul_pos hM (Nat.succ_pos _)) hu hDc)
  intro l _ hl2 hlp Ω _ _ _ ι
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed ℚ
  haveI : Algebra.IsAlgebraic ℚ Ω := IsAlgClosure.isAlgebraic
  let emb : ∀ i, K₀ (u i) →ₐ[ℚ] Ω := fun i => IsAlgClosed.lift
  letI alg : ∀ i, Algebra (K₀ (u i)) Ω := fun i => (emb i).toRingHom.toAlgebra
  haveI tow : ∀ i, IsScalarTower ℚ (K₀ (u i)) Ω := fun i =>
    IsScalarTower.of_algebraMap_eq fun x => ((emb i).commutes x).symm
  haveI clo : ∀ i, IsAlgClosure (K₀ (u i)) Ω := fun i => ⟨inferInstance, Algebra.IsAlgebraic.tower_top (K := ℚ) _⟩
  choose δ _ _ hδ _ using fun i => UpperTheory.exists_quadratic_sign_character ℚ (K₀ (u i)) Ω l (hK2 _)
  have hδi : Function.Injective δ := fun i j hij => by
    by_contra hne
    refine signNe (K₀ (u i)) (K₀ (u j)) Ω (hK2 _) (hKc _ _ fun h => hne (hu h)) (Subgroup.ext fun s => ?_)
    rw [← (hδ i).1, ← (hδ j).1, hij]
  choose cl hcl hclβ using fun i => hD i l hl2 hlp Ω ι
  have hlw : ((l : ℕ) : 𝓞 ℚ) ∉ w.asIdeal :=
    not_mem_of_coprime ((Nat.coprime_primes hp Fact.out).2 hlp.symm) w hpw
  have hMw : ((M : ℕ) : 𝓞 ℚ) ∉ w.asIdeal := not_mem_of_coprime ((Nat.Prime.coprime_iff_not_dvd hp).2 hpM) w hpw
  refine Exists.elim (bit_of_fibre (X := {r : G ℚ Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmRNAlt ι M m wt r})
    (U := Σ i, {x : (D i).S × Multiset ℂ // x.2.map (· ^ f i) = (D i).β x.1})
    (fun r r' => RepIso r.1 r'.1) (fun _ _ => iso_symm) (fun _ _ _ => iso_trans)
    (fun r t => (∃ h : _root_.UpperTheory.GalN.V.AdmPNAlt ι M m (r.1.comp (res ℚ Ω (K₀ (u t.1)))), cl t.1 ⟨_, h⟩ = t.2.1.1) ∧
      FrobEig ι r.1 w (t.2.1.2.map (·⁻¹))) ?ex ?two) ?main
  case main =>
    rintro g ⟨hg, hgQ⟩
    refine ⟨fun r => e ⟨(g r).1.1, (g r).1.2, (g r).2⟩, fun r r' h => hg r r' ?_, fun r => ?_⟩
    · have h1 := congrArg (fun x : (Σ i, {x : (D i).S × Multiset ℂ // x.2.map (· ^ f i) = (D i).β x.1} × Bool) =>
        ((⟨x.1, x.2.1⟩ : Σ i, {x : (D i).S × Multiset ℂ // x.2.map (· ^ f i) = (D i).β x.1}), x.2.2)) (he h)
      exact h1
    · rw [heβ]
      exact (hgQ r).2
  case ex =>
    rintro ⟨r, hr⟩
    obtain ⟨i, hi⟩ : ∃ i, ¬ RepIso r (tw r (δ i)) := by
      by_contra hall
      have h1 := twCard _ _ n r hr.irr (Finset.univ.image δ) fun d hd => by
        obtain ⟨i, -, rfl⟩ := Finset.mem_image.1 hd
        by_contra h
        exact hall ⟨i, h⟩
      rw [Finset.card_image_of_injective _ hδi, Finset.card_univ, Fintype.card_fin] at h1
      omega
    have hirr := (resTwo _ _ _ n (res ℚ Ω (K₀ (u i))) (δ i) (hδ i).1 (hδ i).2 r).1 hr.irr hi
    have hadm := hA (K₀ (u i)) (hK2 _) n hn m wt hm M hM l hl2 Ω ι r hr hirr
    obtain ⟨B, hB⟩ := (frobEx ℚ Ω l ι n r w).2 M hr.level.away hlw hMw
    have h1 := (UpperTheory.frobenius_power_compatibility ℚ (K₀ (u i)) Ω l ι (v i) (f i) (by rw [hvw, hvf, normV_rat hp w hpw])).1 n r B
      (by rw [hvw]; exact hB)
    have h2 := (frobEx (K₀ (u i)) Ω l ι n _ (v i)).1 _ _ h1 (hclβ i ⟨_, hadm⟩)
    refine ⟨⟨i, ⟨(cl i ⟨_, hadm⟩, B.map (·⁻¹)), ?_⟩⟩, ⟨hadm, rfl⟩, ?_⟩
    · show (B.map (·⁻¹)).map (· ^ f i) = (D i).β (cl i ⟨_, hadm⟩)
      rw [← map_inv_inv ((D i).β _), ← h2, Multiset.map_map, Multiset.map_map]
      exact Multiset.map_congr rfl fun b _ => inv_pow b (f i)
    · show FrobEig ι r w ((B.map (·⁻¹)).map (·⁻¹))
      rw [map_inv_inv]
      exact hB
  case two =>
    rintro ⟨i, t⟩ r₀ r r' ⟨⟨a₀, e₀⟩, -⟩ ⟨⟨a, e₁⟩, -⟩ ⟨⟨a', e₂⟩, -⟩ n1 n2
    have hR := (resTwo _ _ _ n (res ℚ Ω (K₀ (u i))) (δ i) (hδ i).1 (hδ i).2 r₀.1).2
    have k1 := (hR r.1 a₀.irr (hcl i _ _ (e₀.trans e₁.symm))).resolve_left n1
    have k2 := (hR r'.1 a₀.irr (hcl i _ _ (e₀.trans e₂.symm))).resolve_left n2
    exact iso_trans (iso_symm k1) k2

theorem countQ_replay48 (hCount : CountPAlt) (hA : _root_.UpperTheory.GalN.V.AdmResNAlt) : CountQAlt := by
  first
  | (rh_reduce 2 using [countQ_of_countP_aggregate48]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countQ_of_countP_aggregate48 hCount hA

theorem countQ_aggregate48 (hP : _root_.UpperTheory.V.Af.Hypotheses')
    (hL : _root_.UpperTheory.GalN.V.LevelPNAlt)
    (hA : _root_.UpperTheory.GalN.V.AdmResNAlt) : CountQAlt :=
  countQ_replay48 (countP_alt hP hL) hA
end
section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp UpperTheory.V.Af
theorem numberU3U_of_adm2A_imp_adm2B48 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hP hLK hLP hA hN h2 K _ _ _ hK
  obtain ⟨c₁, A₁, h₁⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_cm_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countK_alt hP hLK) K
  obtain ⟨c₂, A₂, h₂⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countQ_aggregate48 hP hLP hA) hN
  set d := (discr K).natAbs with hd
  have hd1 : 1 ≤ d := Int.natAbs_pos.2 (discr_ne_zero K)
  refine ⟨5 * (c₁ + c₂ * d ^ A₂), A₁ + A₂ + 1, ?_⟩
  intro e he N hN p w hp hw h7 hpN hpd Orb _ z hz hc
  obtain ⟨h, hh1, hh2, hq⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank K p w hp hw
  obtain ⟨D₁, hD₁, H₁⟩ := h₁ e he N hN p w hp hw hpN hpd
  have hpM : ¬ p ∣ N * d := fun H => (hp.dvd_mul.1 H).elim hpN fun H' => hpd (Int.natCast_dvd.2 H')
  have H₂' := h₂ K e he (N * d) (Nat.mul_pos hN hd1) p h w hp hw hpM
  rw [← hq] at H₂'
  obtain ⟨D₂, hD₂, H₂⟩ := H₂'
  have hq7 : 7 ≤ normV w := by
    rw [hq]; exact h7.trans (Nat.le_self_pow (by omega) p)
  obtain ⟨NN, h0, hb, H⟩ := frobenius_trace_norm_nonzero_log_bound (normV w) e hq7 he (D₁.sum D₂) Orb z hz hc
  refine ⟨NN, h0, hb.trans ?_, fun l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ X hX hX' => ?_⟩
  · set Y : ℕ := N * (e + 1) with hY
    have hY1 : 1 ≤ Y := Nat.mul_pos hN (Nat.succ_pos e)
    have hcard : Nat.card (D₁.sum D₂).S ≤ (c₁ + c₂ * d ^ A₂) * Y ^ (A₁ + A₂) := by
      rw [TrData.card_sum, add_mul]
      refine add_le_add (hD₁.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (by omega)))) (hD₂.trans ?_)
      rw [show N * d * (e + 1) = d * Y by rw [hY]; ring, mul_pow, ← mul_assoc]
      exact Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (by omega))
    have hp1 : (1 : ℝ) ≤ Real.log p := by
      rw [Real.le_log_iff_exp_le (by exact_mod_cast hp.pos)]
      have h7' : (7 : ℝ) ≤ p := by exact_mod_cast h7
      linarith [Real.exp_one_lt_d9]
    have hlq : Real.log (normV w) ≤ 2 * Real.log p := by
      rw [hq, Nat.cast_pow, Real.log_pow]
      have : (h : ℝ) ≤ 2 := by exact_mod_cast hK ▸ hh2
      nlinarith
    have heY : (e : ℝ) + 1 ≤ Y := by
      have : e + 1 ≤ Y := Nat.le_mul_of_pos_left _ hN
      exact_mod_cast this
    have he0 : (0 : ℝ) ≤ e := Nat.cast_nonneg e
    have hf : 2 * e * Real.log (normV w) + 1 ≤ 5 * Y * Real.log p := by nlinarith
    have hf0 : 0 ≤ 2 * e * Real.log (normV w) + 1 := by positivity
    have hcard' : (Nat.card (D₁.sum D₂).S : ℝ) ≤ ((c₁ + c₂ * d ^ A₂) * Y ^ (A₁ + A₂) : ℕ) := by exact_mod_cast hcard
    have hYc : (N : ℝ) * (e + 1) = Y := by rw [hY]; push_cast; ring
    rw [hYc]
    calc (Fintype.card Orb : ℝ) * Nat.card (D₁.sum D₂).S * (2 * e * Real.log (normV w) + 1)
        ≤ Fintype.card Orb * ((c₁ + c₂ * d ^ A₂) * Y ^ (A₁ + A₂) : ℕ) * (5 * Y * Real.log p) := by gcongr
      _ = _ := by push_cast; ring
  · have hlq : ¬ l ∣ normV w := fun H' => by
      rw [hq] at H'
      exact hlp ((Nat.prime_dvd_prime_iff_eq Fact.out hp).1 ((Fact.out : l.Prime).dvd_of_dvd_pow H'))
    exact H l hlq ι _ σ⁻¹ _ ((H₁ l hl2 hlp Ω ι B hB σ hσ).sum (H₂ l hl2 hlp Ω ι B hB σ hσ)) X
      (fun o ρ hρ => (hX o ρ hρ).imp (fun k => ⟨k.irr, _root_.UpperTheory.GalN.V.csdN'_alt hP (by norm_num) k.aut, k.level, _root_.UpperTheory.V.Keep.odd3' k.unl⟩) (h2 K Ω l hl2 ι e _ he ρ)) hX'
theorem numberU3U_of_prints48 : _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Z.J.NumberU3U_s := fun P =>
  _root_.UpperTheory.GalN.V.Win.N.numberU3U_of_adm2A_imp_adm2B48 P (_root_.UpperTheory.V.Keep.levelKA_alt P) (_root_.UpperTheory.V.Keep.levelPA_alt P) (_root_.UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results P) (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)
end
end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countQ_of_countP_aggregate48 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints48 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.countQ_of_countP_aggregate48
#print axioms UpperTheory.GalN.V.Win.N.selected_aggregate48
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms UpperTheory.GalN.V.Win.N.countQ_of_countP_aggregate48
#print axioms UpperTheory.GalN.V.Win.N.countQ_aggregate48
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_prints
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_prints48

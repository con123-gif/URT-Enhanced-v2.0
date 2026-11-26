import RHAudit43CountQWeightFamily
import RHAudit44CountQGapFixed
import RHMathCountQLevelFInput

/-!
Integration 26 Nov 2026. One joint rank-two CountQ caller replacement.
SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine; SWARM, HANDOFF,
AGENTS, research state, living proof and 14 changed peer handoffs consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Stage the exact peer files as:
  RHAudit43CountQWeightFamily.lean = audit/RUN43_COUNTQ_WEIGHT_FAMILY_CALLER.lean (016224b67792d47ed15f3e1c680ee118be6f398d)
  RHAudit44CountQGapFixed.lean = audit/RUN44_COUNTQ_GAP_FIXED_VECTORS.lean (bbf34704250ebaa81ea5542ae2532a02e7171bf7)
  RHMathCountQLevelFInput.lean = math/2026-11-26_COUNTQ_LEVELF_INPUT_WEAKENING.lean (e24da37da59a361b233312a0686763d2b3a3e8e9)
Compile dependencies and their native audits first; do not assume they pass.
Native source FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40;
AutQN d626de1e423ebf58d4b7357f69905fd98829ff51; KeepLevel f6bf6656c2fa3abdfd7a1f660710ddd53091e203;
LevelAdmissibleRestrictionHolds f22dc88980db7cea30d6ab4e4380d927a36b94e0.
Original selected graph: rank-two trace -> CountQAlt -> countQ_alt -> CountP_alt / AdmResNAlt;
CountP_alt -> LevelPNAlt -> levelCore_alt; direct restriction -> levelFRes + safeRes.
Reduced selected graph: rankTwo_trace_joint -> CountQFamily(2,RankTwoWeight) ->
countQ_gap_family -> countP_gap44 + rankTwo_admRes_joint.
countP_gap44 -> levelPN_gap44 -> levelCore_gap44; direct restriction -> LevelF core.
Proof of joint guard: e>=1, each m_i is +/-e. Differences are 0,+2e,-2e,
never 1; SAME m at each CountP and restriction caller. No choice of separate hosts.
The single fixed-rank c,A selection occurs before m,wt,H,M,p,l,Omega. All trace output
quantifiers and finite catalogue bound are identical to the original rank-two theorem.
Rank-four/other weights, LevelF's cont/above/away, finite characters on flags, hP,
NewAdmAlt, class count, polarization, compatibility, automorphy and all other
consumers remain. Do not infer global retirement of the old edges or any axiom.
Original graphs and evidence preserved in prior files. Cache key source/toolchain,
n,P,m,wt,K,Omega,l,M,r,iota,flag and role. No URT or numerical inference.
Only five uniquely reversible edits to the RUN43 countQ caller, keeping the
existing private helpers. Actual native conclusion text compared exactly to RUN43.
Executed 22 static source/transformation assertions; no native tests here.
Local lean/lake/elan absent. Actual CI job results checked: all 3 jobs success
in each of runs 45577239749,45576756833,45670987597, for OLD baselines only.
No new native result; no new axiom ledger accepted. Previous integration ce4476bd preserved.
RESUME HERE: stage and compile all three peer modules plus this module together on
pinned warmed runner; inspect #print axioms, rh_scan, rh_prune and actual caller
substitution in the upstream rank-two trace consumer. Keep original fallback on
any failure; confirm rank-three/four trace branches are untouched.
HANDOFF TO kernel/audit, math, integration. No schedule change.
-/
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain IsLocalRing Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.GalOfCusp UpperTheory.V.HV UpperTheory.V.U3 UpperTheory.V.Aut UpperTheory.V.Pr UpperTheory.V.Af.Bc
open UpperTheory.GalN.V
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N.RHIntegrationCountQ
open RHAudit43 (AdmResFamily CountQFamily RankTwoWeight rankTwo_trace_of_family)
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
theorem countQ_gap_family (n : ℕ) (hn : 2 ≤ n) (P : (Fin n → ℤ) → ℤ → Prop)
    (hgapP : ∀ m wt, P m wt → ∀ i j, m i ≠ m j + 1) :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Keep.LevelPNGap44 → AdmResFamily n P → CountQFamily n P := by
  intro hP hL hA
  classical
  obtain ⟨K₀, _, _, _, hK2, hKc⟩ := quadFam (n ^ 2 + 1 + 1)
  choose c A hcA using fun i => _root_.UpperTheory.GalN.V.Win.N.RHAudit44.countP_gap44 hP hL (K₀ i) (hK2 i) n hn
  refine ⟨2 ^ (n + 1) * ((n ^ 2 + 1) * ∑ i, c i), ∑ i, A i, ?_⟩
  intro m wt hfamily hm hwt H hH M hM p w hp hpw hpM
  have hgap := hgapP m wt hfamily
  obtain ⟨u, hu, hup⟩ := exists_avoid (fun i => discr (K₀ i)) hKc hp
  choose v f hvw hpv hf1 hf2 hvf using fun i => exists_over (K₀ (u i)) (hK2 _) hp w hpw
  choose D hDc hD using fun i => hcA (u i) m wt hm hgap hwt H hH M hM p (v i) hp (hpv i) hpM (hup i)
  obtain ⟨D', hD', e, he, heβ⟩ := rootSum n p hp.pos m wt (Fin (n ^ 2 + 1)) (fun i => normV (v i)) f
    (fun i => ⟨hf1 i, hf2 i, hvf i⟩) D
  refine ⟨D', hD'.trans ?_, ?_⟩
  · rw [mul_assoc, mul_assoc]
    refine Nat.mul_le_mul_left _ ?_
    have hb : ∀ i, Nat.card (D i).S ≤ (∑ i, c i) * (M * (H + 1)) ^ (∑ i, A i) := fun i =>
      (hDc i).trans (Nat.mul_le_mul (Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ _))
        (Nat.pow_le_pow_right (Nat.mul_pos hM (Nat.succ_pos _))
          (Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ _))))
    refine (Finset.sum_le_sum fun i _ => hb i).trans ?_
    simp
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
    have hadm := hA (K₀ (u i)) (hK2 _) m wt hfamily hm M hM l hl2 Ω ι r hr hirr
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

theorem rankTwo_gap_joint (m : Fin 2 → ℤ) (wt : ℤ) (h : RankTwoWeight m wt) :
    ∀ i j, m i ≠ m j + 1 := by
  obtain ⟨e, he, rfl, rfl⟩ := h
  intro i j
  fin_cases i <;> fin_cases j <;> simp <;> omega

theorem rankTwo_admRes_joint (hP : _root_.UpperTheory.V.Af.Hypotheses') :
    AdmResFamily 2 RankTwoWeight := by
  intro K _ _ _ hK m wt hfamily hm M hM l _ hl Ω _ _ _ _ _ _ ι r hr hirr
  obtain ⟨e, he, rfl, rfl⟩ := hfamily
  exact RHMathCountQLevelFInput.admissible_restriction_rankTwo_of_levelF_core
    hP K hK e he M l Ω ι r hr.aut (UpperTheory.V.Lev.LevelF.of_level hr.level) hr.dual hirr

theorem rankTwo_count_joint (hP : _root_.UpperTheory.V.Af.Hypotheses') :
    CountQFamily 2 RankTwoWeight := by
  exact countQ_gap_family 2 le_rfl RankTwoWeight rankTwo_gap_joint hP
    (UpperTheory.V.Keep.levelPN_gap44 hP) (rankTwo_admRes_joint hP)

theorem rankTwo_trace_joint :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt → ∃ c A : ℕ, ∀ (K : Type) [Field K] [NumberField K], ∀ e : ℕ, 1 ≤ e → ∀ M : ℕ, 1 ≤ M → ∀ (p h : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → ¬ p ∣ M → ∃ D : TrData (p ^ h) e, Nat.card D.S ≤ c * (M * (e + 1)) ^ A ∧ ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ) (B : ValuationSubring Ω), IsPlaceOver B w → ∀ σ : G K Ω, IsFrob B (p ^ h) σ → D.Classifies ι σ⁻¹ (_root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M) := by
  intro hP hN
  exact rankTwo_trace_of_family (rankTwo_count_joint hP) hN

example (hP : _root_.UpperTheory.V.Af.Hypotheses') :
    CountQFamily 2 RankTwoWeight := by
  first
  | (rh_reduce 2 using [rankTwo_count_joint]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rankTwo_count_joint hP
end UpperTheory.GalN.V.Win.N.RHIntegrationCountQ

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.countQ_gap_family limit 2000
rh_scan UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.rankTwo_trace_joint limit 2000
rh_prune UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.rankTwo_admRes_joint as RHIntegrationCountQPruned
#print axioms UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.rankTwo_gap_joint
#print axioms UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.rankTwo_count_joint
#print axioms UpperTheory.GalN.V.Win.N.RHIntegrationCountQ.rankTwo_trace_joint

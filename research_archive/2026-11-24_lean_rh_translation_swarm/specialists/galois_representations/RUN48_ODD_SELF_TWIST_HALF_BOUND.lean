import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.CrystallineBaseChange.TwCard

/-!
RUN48 — lane 5, 2026-11-26. Prepared certificate; not native-compiled.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4; upstream pin
40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream a7c4d6a94945f49da752e237a6b1e944ab62677e, not migrated.
Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer audit a35ccf3d retains n²+2 fields for p/l avoidance; 989910ad
counts the identity; lane14 7f45ab3c bypasses odd trace roots.
This is a different improvement, compatible in principle but not merged.
RUN47 Casimir defect has no demonstrated quantitative consumer improvement;
return to actual CountQAlt catalogue.

Sources: Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount blob 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40;
CrystallineBaseChange/TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638;
QuadFam.lean cb75bc09b3065d1f24e341f271a97c38a739114e;
SignNe.lean 7fa61cf04bc857a21f1be2bc15be3927d46e63b7;
ResTwo.lean cbdc8b31415f56ea47e29a317c598534848ce71c;
BuildingsResidueChars/ExistsQuadraticSignCharacter.lean
2f88a58801b17ae7fc3a5c392b624d5a16b960de.

Human proof: choose one embedding of Ω into C. Its image is the field of
complex algebraic numbers (algebraically closed and algebraic over Q),
hence stable under complex conjugation. Pull conjugation back to cc.
Every imaginary quadratic K in the actual fixed family has no real
embedding; cc therefore cannot fix its image pointwise. The native
sign-character range identity and ±1 dichotomy imply δ_i(cc)=-1
for ALL i simultaneously, regardless of the embeddings chosen.
This classical bridge is explicit as OddAtAux48 below; native formalization
is outstanding, not an added axiom or a claimed closed premise.

If S is a finite set of odd self twists, choose a∈S (empty trivial).
Intertwining matrices compose, so aS consists of self twists.
Multiplication by a is injective, and aS is even at cc, disjoint from S.
Apply native twCard to S∪aS: 2|S|≤n².
Choose floor(n²/2)+3 fields before l; discard at most one for p and
one for l by pairwise coprimality. More than n²/2 signs remain, so
some restriction is irreducible by native resTwo.1.
Rank 2: 5 fixed auxiliary fields (old 6), 4 p-good catalogues (old 5),
3 p/l-good candidates. p-only could use 4 fixed fields, but this
certificate retains both exclusions. Keep exact original rootSum,
classification and fibre transport. No stronger hA invoked; its local
consumer can later be restricted to l-coprime discriminants.
No improvement of uniform exponent or arithmetic size theorem claimed.
Original source graph: CountI→CorGK→PropGK→NumberU3U_s→KeepNumU→
frobenius_trace_count_bound_of_rat_eigensystem_count_alt→countQ_alt→
quadFam/exists_avoid/twCard/resTwo/rootSum/countP_alt.
Candidate graph substitutes countQ_alt48 with odd_self_twists48→twCard,
self_twist_mul48, OddAtAux48, and two exists_avoid uses; all other
dependencies, original graph and unresolved premises retained.
Context: source pin, n, Ω, l, p, actual auxiliary family, embeddings, r;
no sharing across differing context, backtrack to original if replay fails.
Exact executed JS regression: 6 source splice anchor checks,
3940 nonempty odd subsets of elementary 2-groups (dimensions 1–4),
17788 two-exclusion counts for n=2..12. These verify combinatorial
bookkeeping only, not the Galois or Lean bridges.
Historical CI status JSON 45577239749 and 45576756833 retrieved, returncode 0;
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717. No current native Lean environment;
no new kernel-closed obligation or axiom evidence. Existing baselines
do not validate this file.
RESUME HERE: formalize common complex conjugation OddAtAux48 using pinned
embeddings and IsCMField; replay in native CI, run rh_scan and rh_prune
on both callers, rh_reduce/rh_auto/rh_auto_frontier at actual parity
bridge, compare axioms, then substitute CountQAlt into rank-2 consumer.
Prioritize uniform catalogue and class-group/cohomology estimates after
local selection; no RH claim.
-/

attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Polynomial
open UpperTheory.V.Af.Bc
open private exists_avoid exists_over not_mem_of_coprime normV_rat map_inv_inv bit_of_fibre iso_symm iso_trans from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
namespace UpperTheory.GalN.V.Win.N

theorem self_twist_mul48 {Γ k : Type} [Group Γ] [Field k] (n : ℕ)
    (r : Γ →* GL (Fin n) k) (a b : Γ →* kˣ)
    (ha : RepIso r (tw r a)) (hb : RepIso r (tw r b)) :
    RepIso r (tw r (a*b)) := by
  obtain ⟨g,hg⟩ := ha
  obtain ⟨h,hh⟩ := hb
  have key (d : Γ →* kˣ) (u : GL (Fin n) k)
      (hu : ∀ s, tw r d s = u * r s * u⁻¹) (s : Γ) :
      (u : Matrix (Fin n) (Fin n) k) * (r s : Matrix (Fin n) (Fin n) k) =
      ((d s : kˣ) : k) • ((r s : Matrix (Fin n) (Fin n) k) * (u : Matrix (Fin n) (Fin n) k)) := by
    have h1 := congrArg (fun A : GL (Fin n) k => (A : Matrix (Fin n) (Fin n) k) * (u : Matrix (Fin n) (Fin n) k)) (hu s)
    simp only [tw_val, Units.val_mul, mul_assoc, Units.inv_mul, mul_one] at h1
    rw [← h1, smul_mul_assoc]
  refine ⟨g*h, fun s => ?_⟩
  have H : tw r (a*b) s * (g*h) = (g*h) * r s := by
    apply Units.ext
    simp only [tw_val, Units.val_mul, MonoidHom.mul_apply, Units.val_mul,
      smul_mul_assoc]
    symm
    calc
      ((g : Matrix (Fin n) (Fin n) k) * (h : Matrix (Fin n) (Fin n) k)) *
          (r s : Matrix (Fin n) (Fin n) k) =
        (g : Matrix (Fin n) (Fin n) k) * ((h : Matrix (Fin n) (Fin n) k) * (r s : Matrix (Fin n) (Fin n) k)) := mul_assoc _ _ _
      _ = ((b s : kˣ) : k) • ((g : Matrix (Fin n) (Fin n) k) * ((r s : Matrix (Fin n) (Fin n) k) * (h : Matrix (Fin n) (Fin n) k))) := by
        rw [key b h hh s, mul_smul_comm]
      _ = ((b s : kˣ) : k) • (((g : Matrix (Fin n) (Fin n) k) * (r s : Matrix (Fin n) (Fin n) k)) * (h : Matrix (Fin n) (Fin n) k)) := by rw [mul_assoc]
      _ = _ := by rw [key a g hg s, smul_mul_assoc, smul_smul, mul_comm ((b s : kˣ) : k), mul_assoc]
  exact (eq_mul_inv_iff_mul_eq).2 H

theorem odd_self_twists48 {Γ k : Type} [Group Γ] [Field k] [CharZero k]
    (n : ℕ) (r : Γ →* GL (Fin n) k) (hirr : IsIrr r)
    (cc : Γ) (S : Finset (Γ →* kˣ))
    (hodd : ∀ d ∈ S, d cc = -1)
    (hself : ∀ d ∈ S, RepIso r (tw r d)) : 2*S.card ≤ n^2 := by
  classical
  rcases S.eq_empty_or_nonempty with rfl | ⟨a,ha⟩
  · simp
  let T := S.image (fun b => a*b)
  have hinj : Function.Injective (fun b : Γ →* kˣ => a*b) := fun x y h => mul_left_cancel h
  have hcard : T.card = S.card := Finset.card_image_of_injective _ hinj
  have hdis : Disjoint S T := by
    rw [Finset.disjoint_left]
    intro d hd hdT
    obtain ⟨b,hb,rfl⟩ := Finset.mem_image.1 hdT
    have hval := congrArg Units.val (hodd _ hd)
    simp [MonoidHom.mul_apply, hodd a ha, hodd b hb] at hval
    norm_num at hval
  have hu := UpperTheory.V.Br.twCard Γ k n r hirr (S ∪ T) (by
    intro d hd
    rcases Finset.mem_union.1 hd with hd | hd
    · exact hself d hd
    · obtain ⟨b,hb,rfl⟩ := Finset.mem_image.1 hd
      exact self_twist_mul48 n r a b (hself a ha) (hself b hb))
  rw [Finset.card_union_of_disjoint hdis,hcard] at hu
  omega

def OddAtAux48 : Prop :=
  ∀ (Ω : Type) [Field Ω] [Algebra ℚ Ω] [IsAlgClosure ℚ Ω] (l : ℕ) [Fact l.Prime],
    ∃ cc : G ℚ Ω, ∀ (K : Type) [Field K] [NumberField K] [IsCMField K]
      [Algebra K Ω] [IsScalarTower ℚ K Ω], Module.finrank ℚ K = 2 →
      ∀ δ : G ℚ Ω →* (Qbar l)ˣ,
        (∀ s, δ s = 1 ↔ s ∈ (res ℚ Ω K).range) →
        (∀ s, δ s = 1 ∨ δ s = -1) → δ cc = -1

theorem countQ_alt48 (hOdd : OddAtAux48) :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.CountQAlt := by
  intro hP hL hA n hn
  classical
  obtain ⟨K₀, _, _, _, hK2, hKc⟩ := quadFam (n ^ 2 / 2 + 2 + 1)
  choose c A hcA using fun i => _root_.UpperTheory.GalN.V.Win.N.countP_alt hP hL (K₀ i) (hK2 i) n hn
  refine ⟨2 ^ (n + 1) * ((n ^ 2 / 2 + 2) * ∑ i, c i), ∑ i, A i, ?_⟩
  intro m wt hm hwt H hH M hM p w hp hpw hpM
  obtain ⟨u, hu, hup⟩ := exists_avoid (fun i => discr (K₀ i)) hKc hp
  choose v f hvw hpv hf1 hf2 hvf using fun i => exists_over (K₀ (u i)) (hK2 _) hp w hpw
  choose D hDc hD using fun i => hcA (u i) m wt hm hwt H hH M hM p (v i) hp (hpv i) hpM (hup i)
  obtain ⟨D', hD', e, he, heβ⟩ := rootSum n p hp.pos m wt (Fin (n ^ 2 / 2 + 2)) (fun i => normV (v i)) f
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
  obtain ⟨cc, hcc⟩ := hOdd Ω l
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
    obtain ⟨j, hj, hjl⟩ := exists_avoid (N := n ^ 2 / 2 + 1)
      (fun i => discr (K₀ (u i))) (fun i i' h => hKc _ _ (fun e => h (hu e)))
      (Fact.out : l.Prime)
    have hodd : ∀ i, δ i cc = -1 := fun i =>
      hcc (K₀ (u i)) (hK2 _) (δ i) (hδ i).1 (hδ i).2
    obtain ⟨i, hi⟩ : ∃ i : Fin (n ^ 2 / 2 + 1), ¬ RepIso r (tw r (δ (j i))) := by
      by_contra! hall
      have h1 := odd_self_twists48 n r hr.irr cc (Finset.univ.image (δ ∘ j))
        (by
          intro d hd
          obtain ⟨i, -, rfl⟩ := Finset.mem_image.1 hd
          exact hodd (j i))
        (by
          intro d hd
          obtain ⟨i, -, rfl⟩ := Finset.mem_image.1 hd
          exact hall i)
      rw [Finset.card_image_of_injective _ (hδi.comp hj), Finset.card_univ,
        Fintype.card_fin] at h1
      omega
    have hli := hjl i
    obtain ⟨i, hi, hli⟩ : ∃ i, (¬ RepIso r (tw r (δ i))) ∧
        ¬ (l : ℤ) ∣ discr (K₀ (u i)) := ⟨j i, hi, hli⟩
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
end UpperTheory.GalN.V.Win.N
end
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt48

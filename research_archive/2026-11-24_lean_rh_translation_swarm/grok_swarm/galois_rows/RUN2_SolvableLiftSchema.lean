/-
  Grok swarm, lane galois_rows, RUN 2. Schema-level Lean companion (core Lean 4.33.1, no Mathlib,
  no upstream import). Upstream objects are abstract parameters; each theorem holds for every
  instantiation. It checks the LOGICAL SHAPE of two steps in
  ToralDeRham/ExistsCuspidalCharLiftOfSolvableCmExtension.lean (pin 40e56bab…):
   (1) `hmove`: in a group G = H·N with H fixing x₀ and every element of N having nonzero trace,
       if every element moving x₀ had trace 0 then all of G fixes x₀;
   (2) the strong induction on [M:K] through prime-degree steps (`isWeaklyAttached_of_cmBaseChange_of_finrank`).
  It is NOT a kernel check of the upstream declarations.
-/
namespace GrokSolvableLift

/-- Shape of `hmove` (upstream lines 51–76). `act` is the Galois action on Ω, `inN` membership in the
    open subgroup N, `inH` membership in G_M (which fixes every element of K₁ ⊆ M), `tr` the trace of r. -/
theorem fixes_all_of_trace_vanishing {G X R : Type} (mul : G → G → G) (act : G → X → X)
    (act_mul : ∀ a b y, act (mul a b) y = act a (act b y))
    (inH inN : G → Prop) (x₀ : X) (hH : ∀ a, inH a → act a x₀ = x₀)
    (dec : ∀ g, ∃ a b, inH a ∧ inN b ∧ g = mul a b)
    (tr : G → R) (zero : R) (hN : ∀ b, inN b → tr b ≠ zero)
    (hc : ∀ g, act g x₀ ≠ x₀ → tr g = zero) : ∀ g, act g x₀ = x₀ := by
  intro g
  obtain ⟨a, b, ha, hb, rfl⟩ := dec g
  have hbfix : act b x₀ = x₀ := Classical.byContradiction fun hne => hN b hb (hc b hne)
  rw [act_mul, hbfix, hH a ha]

/-- Contrapositive used upstream: if x₀ is NOT fixed by all of G (x₀ ∉ K), some g moves x₀ and has
    nonzero trace. This is exactly the witness `hmove`. -/
theorem exists_moving_nonzero_trace {G X R : Type} (mul : G → G → G) (act : G → X → X)
    (act_mul : ∀ a b y, act (mul a b) y = act a (act b y))
    (inH inN : G → Prop) (x₀ : X) (hH : ∀ a, inH a → act a x₀ = x₀)
    (dec : ∀ g, ∃ a b, inH a ∧ inN b ∧ g = mul a b)
    (tr : G → R) (zero : R) (hN : ∀ b, inN b → tr b ≠ zero)
    (hnot : ¬ ∀ g, act g x₀ = x₀) : ∃ g, act g x₀ ≠ x₀ ∧ tr g ≠ zero :=
  Classical.byContradiction fun hno =>
    hnot (fixes_all_of_trace_vanishing mul act act_mul inH inN x₀ hH dec tr zero hN
      (fun g hg => Classical.byContradiction fun ht => hno ⟨g, hg, ht⟩))

/-- Shape of the solvable ascent (upstream `isWeaklyAttached_of_cmBaseChange_of_finrank`): `Ok K` =
    "the data over K (π, χ, r, N with nonzero traces, SolvDisj M N) is in scope", `Lift K` = "some P over M
    with CharLift from K's representation". Base: degree 1. Step: for degree ≠ 1 there is an intermediate K₁
    of prime degree, of strictly smaller co-degree, still Ok, and a lift through K₁ composes (charLift_trans). -/
theorem solvable_ascent {Fld : Type} (codeg : Fld → Nat) (Ok Lift : Fld → Prop)
    (base : ∀ K, codeg K = 1 → Ok K → Lift K)
    (step : ∀ K, codeg K ≠ 1 → Ok K → ∃ K₁, codeg K₁ < codeg K ∧ Ok K₁ ∧ (Lift K₁ → Lift K)) :
    ∀ K, Ok K → Lift K := by
  intro K
  induction h : codeg K using Nat.strongRecOn generalizing K with
  | ind d ih =>
    intro hK
    by_cases h1 : codeg K = 1
    · exact base K h1 hK
    · obtain ⟨K₁, hlt, hK₁, hcomp⟩ := step K h1 hK
      exact hcomp (ih (codeg K₁) (h ▸ hlt) K₁ rfl hK₁)

/-- Norm-transport of Frobenius eigenvalues (shape of the last rewrite in `hasSat_charPol_above`):
    if a(g₀) = N(a'(g')) (localArtin_normU) then ξ(a g₀) = (ξ ∘ N)(a' g'). -/
theorem norm_transport {W W' U U' C : Type} (a : W → U) (a' : W' → U') (N : U' → U) (ξ : U → C)
    (g₀ : W) (g' : W') (hart : a g₀ = N (a' g')) : ξ (a g₀) = (fun x => ξ (N x)) (a' g') := by
  rw [hart]

end GrokSolvableLift

#print axioms GrokSolvableLift.fixes_all_of_trace_vanishing
#print axioms GrokSolvableLift.exists_moving_nonzero_trace
#print axioms GrokSolvableLift.solvable_ascent
#print axioms GrokSolvableLift.norm_transport

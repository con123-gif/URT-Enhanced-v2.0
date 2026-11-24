/-
  Grok swarm, lane galois_rows, RUN 3. Schema-level Lean companion (core Lean 4.33.1, no Mathlib,
  no upstream import). Upstream objects are abstract parameters; each theorem holds for every
  instantiation. It checks the LOGICAL SHAPE of four steps at pin 40e56bab…:
   (1) `KLift.exists_cm_lift`, SolvDisj clause: a Chebotarev cover g = x·n with x in decomposition
       groups at places of T, plus "F₁ split at T", gives G_E = G_M · N;
   (2) `AbStep.exists_abelian_real_field`, decomposition clause: characters that separate the points
       of the finite abelian quotient Dec/V cut out exactly V;
   (3) `AboveL.exists_cm_solvDisj_dec_eq`, final `rw` chain: transport of V along the restriction
       isomorphism Dec_E(A) ≅ Dec_{E⁺}(A) (injectivity is what makes `mem_map_iff` an iff);
   (4) `SphUnr.equiv_prodIrr_chars`, `hlen`: an unlinked support forces every Langlands segment to
       have length one.
  It is NOT a kernel check of the upstream declarations.
-/
namespace GrokCmPrescribed

/-- (1) Shape of the SolvDisj clause of `KLift.exists_cm_lift` (upstream lines 151–163).
    (Upstream works in G_F and re-lifts g·n⁻¹ to G_E; that bookkeeping is abstracted away.)
    `inT x`: x lies in a decomposition group at some place of T; `fixM x`: x fixes M (equivalently F₁,
    by `hfix`); `split`: decomposition groups at T fix F₁. -/
theorem solvDisj_of_cover {G : Type} (mul : G → G → G)
    (inT inN fixM : G → Prop) (split : ∀ x, inT x → fixM x)
    (cover : ∀ g, ∃ x n, inT x ∧ inN n ∧ g = mul x n) :
    ∀ g, ∃ y n, fixM y ∧ inN n ∧ g = mul y n := by
  intro g
  obtain ⟨x, n, hx, hn, rfl⟩ := cover g
  exact ⟨x, n, split x hx, hn, rfl⟩

/-- (2) Shape of the `g ∈ L.fixingSubgroup ↔ g ∈ V` clause (upstream `hmem`, `hψ`, `hrD`).
    `q g` is the class of g in Dec/V, `one` the trivial class, `ψ i` the separating characters. -/
theorem fix_iff_mem_of_separating {D Q ι C : Type} (q : D → Q) (one : Q) (c1 : C)
    (inV : D → Prop) (hq : ∀ g, q g = one ↔ inV g) (ψ : ι → Q → C)
    (hone : ∀ i, ψ i one = c1) (hsep : ∀ x, x ≠ one → ∃ i, ψ i x ≠ c1) :
    ∀ g, (∀ i, ψ i (q g) = c1) ↔ inV g := by
  intro g
  constructor
  · intro H
    apply (hq g).1
    exact Classical.byContradiction fun hne => by
      obtain ⟨i, hi⟩ := hsep (q g) hne
      exact hi (H i)
  · intro hg i
    rw [(hq g).2 hg]
    exact hone i

/-- (3) Shape of the last `rw` chain of `exists_cm_solvDisj_dec_eq`: fixing M ↔ fixing F₁ (`hM`),
    fixing F₁ on Dec_{E⁺} ↔ lying in the image of V (`hdecF`), image ↔ V (`mem_map_iff`, which
    needs injectivity of `res`). -/
theorem dec_eq_transport {D D' : Type} (res : D → D') (hinj : ∀ a b, res a = res b → a = b)
    (inV fixM fixF₁ : D → Prop) (inImg : D' → Prop)
    (hImg : ∀ y, inImg y ↔ ∃ a, inV a ∧ res a = y)
    (hM : ∀ g, fixM g ↔ fixF₁ g) (hdecF : ∀ g, fixF₁ g ↔ inImg (res g)) :
    ∀ g, fixM g ↔ inV g := by
  intro g
  rw [hM, hdecF, hImg]
  constructor
  · rintro ⟨a, ha, he⟩
    rw [← hinj a g he]; exact ha
  · intro hg; exact ⟨g, hg, rfl⟩

/-- (4) Shape of `hlen` in `equiv_prodIrr_chars`: if the support S contains the segment
    first, ν first, …, ν^(len-1) first and S is unlinked (no y with both y and ν y in S),
    then len = 1 (len ≥ 1 is the segment axiom `len_pos`). -/
theorem seg_len_one {X : Type} (ν : X → X) (S : X → Prop)
    (unlinked : ∀ y, S y → S (ν y) → False)
    (first : X) (len : Nat) (hpos : 0 < len)
    (hmem : ∀ a, a < len → S (Nat.rec first (fun _ z => ν z) a)) : len = 1 := by
  apply Classical.byContradiction
  intro hne
  have h2 : 1 < len := by omega
  exact unlinked first (hmem 0 hpos) (hmem 1 h2)

end GrokCmPrescribed

#print axioms GrokCmPrescribed.solvDisj_of_cover
#print axioms GrokCmPrescribed.fix_iff_mem_of_separating
#print axioms GrokCmPrescribed.dec_eq_transport
#print axioms GrokCmPrescribed.seg_len_one

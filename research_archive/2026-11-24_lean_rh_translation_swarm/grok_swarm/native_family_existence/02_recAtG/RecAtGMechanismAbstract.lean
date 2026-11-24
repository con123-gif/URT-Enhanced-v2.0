/-
  RecAtGMechanismAbstract.lean  (core Lean 4 only, no Mathlib, no upstream imports)

  Abstract skeletons of the two shared mechanisms used by
    GroupRetwisting.recAtG_of_two_passes   (upstream pin 40e56ba)
  plus an executable recomputation of the Minkowski number used by
    minkowski_bound_rat / Formalism.SharpRestriction.MinkDiv.

  This file does NOT import or elaborate any upstream declaration.
  It checks only the logical shape of the mechanisms, over abstract types.
-/

namespace NFE2

/-! ## Lemma L : "large-field" conditions are closed under conjunction and monotone.
  Upstream: `large₂ K p := ∃ S₁ P₁ A S₂, ... ∀ B f T, Over → Has₂ (S₁,S₂) → P₁ ⊆ T.pl → T.Avoids A → p B f T`.
  Abstract model: a demand is a list `d`; an object `t` meets it when every element of `d`
  is accepted by `t` (`meets`).  `Large p` = some demand forces `p`.
  Union of demands = list append. -/

variable {Obj Dem : Type} (meets : Obj → Dem → Prop)

def Large (p : Obj → Prop) : Prop :=
  ∃ d : List Dem, ∀ t : Obj, (∀ x ∈ d, meets t x) → p t

theorem Large.inter {p q : Obj → Prop} (hp : Large meets p) (hq : Large meets q) :
    Large meets (fun t => p t ∧ q t) := by
  obtain ⟨d1, h1⟩ := hp
  obtain ⟨d2, h2⟩ := hq
  refine ⟨d1 ++ d2, fun t ht => ⟨h1 t fun x hx => ht x (List.mem_append_left _ hx),
                                h2 t fun x hx => ht x (List.mem_append_right _ hx)⟩⟩

theorem Large.imp {p q : Obj → Prop} (hp : Large meets p) (hpq : ∀ t, p t → q t) :
    Large meets q := by
  obtain ⟨d, h⟩ := hp
  exact ⟨d, fun t ht => hpq t (h t ht)⟩

/-! ## Two-pass composition (shape of recAtG_of_two_passes).
  Abstract data:
   * `Base`  : bases B (with frame folded in), `Dat` : twisting data T, `Core` : cores.
   * `untw : Base → Dat`        -- the untwisted datum (Q = ∅, k = 0, ψ = 1)
   * `first`  : FirstG  : untwisted datum ⇒ some core with Q
   * `exportF` : ExportF : core with Q at untwisted datum ⇒ ExportAt
   * `second` : SecondG : (core with Q, ExportAt) ⇒ enlarged base B', datum T' and core c' with Q'
   * `lay`    : from a core (with its volume tie converted by `h2v`) produce the final object.
  The theorem: these four inputs, for a single base B, give the final object.
  This is exactly the order of use in the upstream proof term (h1, h2, h3, hlay). -/

theorem two_pass {Base Dat Core Out : Type}
    (untw : Base → Dat) (Q Q' : Base → Dat → Core → Prop) (ExportAt : Base → Dat → Core → Prop)
    (VolTie VolEq : Core → Prop) (Good : Core → Out → Prop)
    (h2v : ∀ c, VolTie c → VolEq c)
    (first  : ∀ B, ∃ c, Q B (untw B) c)
    (exportF : ∀ B c, Q B (untw B) c → ExportAt B (untw B) c)
    (second : ∀ B c, Q B (untw B) c → ExportAt B (untw B) c →
                ∃ B' T' c', Q' B' T' c' ∧ VolTie c')
    (lay : ∀ c, VolEq c → ∃ y, Good c y) (B : Base) :
    ∃ B' T' c' y, Q' B' T' c' ∧ Good c' y := by
  obtain ⟨c, hc⟩ := first B
  obtain ⟨B', T', c', hQ', hv⟩ := second B c hc (exportF B c hc)
  obtain ⟨y, hy⟩ := lay c' (h2v c' hv)
  exact ⟨B', T', c', y, hQ', hy⟩

/-! ## Minkowski number (same body as both upstream definitions
   `PI.minkowskiM` and `Formalism.HermitianLatticeCounting.S6.minkowskiM`). -/

def minkowskiExp (N p : Nat) : Nat :=
  (List.range (N + 1)).foldl (fun acc i => acc + N / (p ^ i * (p - 1))) 0

def isPrimeB (p : Nat) : Bool :=
  p ≥ 2 && (List.range (p - 2)).all (fun k => p % (k + 2) != 0)

def minkowskiM (N : Nat) : Nat :=
  ((List.range (N + 2)).filter isPrimeB).foldl (fun acc p => acc * p ^ minkowskiExp N p) 1

#eval (List.range 9).map minkowskiM

end NFE2

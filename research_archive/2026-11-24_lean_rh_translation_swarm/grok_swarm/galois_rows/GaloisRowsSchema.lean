/-
  Grok swarm, lane galois_rows. Schema-level Lean companion (core Lean 4.33.1, no Mathlib).
  It does NOT import the upstream project. Every upstream predicate is an abstract parameter,
  so each theorem holds for EVERY instantiation, in particular for the upstream definitions in
  TypeConditions/WeightsConjAlt.lean (486af16e) and WeightsConjBis.lean (0a1eab0e) at pin
  40e56bab026552e089d7afcfeff08d2defb9c005. Only the single implication IsQpBig w n -> IsQp w
  (upstream theorem IsQpBig.isQp, a projection) is taken as a hypothesis `big`.
  This is a check of the logical shape of Row0.row0b and charPol_of_ine / dim_of_ine,
  not a kernel check of the upstream declarations.
-/
namespace GrokGaloisRows

section Weakening
variable {Pl WD : Type} (IsQp : Pl → Prop) (IsQpBig : Pl → Nat → Prop)
  (hbig : ∀ w n, IsQpBig w n → IsQp w)
  (TmW Sqf Tor mono0 : WD → Prop) (lpDim : WD → Nat) (deg0Eq : WD → WD → Prop)

/-- upstream `Away x y` at place `w` (WeightsConjAlt.lean, structure Away). -/
structure Away (w : Pl) (x y : WD) : Prop where
  dimEq : lpDim x = lpDim y
  tor : Tor y → mono0 y → x = y
  tame0 : IsQp w → TmW y → Sqf y → mono0 y → mono0 x ∧ deg0Eq x y

/-- upstream `AwayB x y` (WeightsConjBis.lean): tame clause only under `IsQpBig w y.lpDim`. -/
structure AwayB (w : Pl) (x y : WD) : Prop where
  dimEq : lpDim x = lpDim y
  tor : Tor y → mono0 y → x = y
  tame0 : IsQpBig w (lpDim y) → TmW y → Sqf y → mono0 y → mono0 x ∧ deg0Eq x y

include hbig in
/-- upstream `Away.big`. -/
theorem Away.big {w : Pl} {x y : WD}
    (k : Away IsQp TmW Sqf Tor mono0 lpDim deg0Eq w x y) :
    AwayB IsQpBig TmW Sqf Tor mono0 lpDim deg0Eq w x y :=
  ⟨k.dimEq, k.tor, fun q => k.tame0 (hbig w _ q)⟩

include hbig in
/-- The `nice` antecedent of `Above` versus `AboveB`: the AboveB antecedent implies the Above one,
    so the AboveB clause (same conclusion with Away weakened to AwayB) follows. -/
theorem nice_big {w : Pl} {a : Nat} {y : WD} {Concl : Prop} {x : WD}
    (n : (IsQp w ∧ TmW y ∧ Sqf y) ∨ Tor y → mono0 y →
      Concl ∧ Away IsQp TmW Sqf Tor mono0 lpDim deg0Eq w x y) :
    (IsQpBig w a ∧ TmW y ∧ Sqf y) ∨ Tor y → mono0 y →
      Concl ∧ AwayB IsQpBig TmW Sqf Tor mono0 lpDim deg0Eq w x y := fun g m =>
  have j := n (g.imp (fun q => ⟨hbig w a q.1, q.2⟩) id) m
  ⟨j.1, Away.big IsQp IsQpBig hbig TmW Sqf Tor mono0 lpDim deg0Eq j.2⟩

/-- Row0 → Row0b shape: a ∀∃ statement is monotone in its existential body. -/
theorem row_mono {Ix : Type} {Wit : Ix → Type} (P Q : (i : Ix) → Wit i → Prop)
    (k : ∀ i x, P i x → Q i x) (H : ∀ i, ∃ x, P i x) : ∀ i, ∃ x, Q i x :=
  fun i => (H i).elim fun x hx => ⟨x, k i x hx⟩
end Weakening

/-- Negative control: the schema implication Away → AwayB is strict. In the two-point model
    where IsQp holds but IsQpBig never holds, AwayB holds and Away fails. Shows Row0b is
    the WEAKER row notion at schema level (the "Strong" in galoisLocalGlobalStrong is not
    a strengthening). This says nothing about which actual places are IsQpBig. -/
theorem awayB_not_away :
    AwayB (Pl := Unit) (WD := Bool) (fun _ _ => False) (fun _ => True) (fun _ => True)
        (fun _ => False) (fun _ => True) (fun _ => 0) (fun _ _ => False) () true false ∧
    ¬ Away (Pl := Unit) (WD := Bool) (fun _ => True) (fun _ => True) (fun _ => True)
        (fun _ => False) (fun _ => True) (fun _ => 0) (fun _ _ => False) () true false :=
  ⟨⟨rfl, fun h _ => h.elim, fun h _ _ _ => h.elim⟩,
   fun k => (k.tame0 trivial trivial trivial trivial).2⟩

section CharPol
/-- upstream charPol_of_ine (GaloisLocalGlobalOfLocalGlobalCompatibility.lean:53):
    a degree-zero Weil element is an inertia element, using exists_eq_zpow_mul deg_frob and
    zpow_zero/one_mul. Here those two facts are the hypotheses `fac` and `one`. -/
theorem charPol_of_ine {W I C : Type} (mul : W → W → W) (fpow : Int → W) (incl : I → W) (deg : W → Int)
    (fac : ∀ g, ∃ t, g = mul (fpow (deg g)) (incl t)) (one : ∀ x, mul (fpow 0) x = x)
    (cx cy : W → C) (k : ∀ t, cx (incl t) = cy (incl t)) (g : W) (hg : deg g = 0) : cx g = cy g := by
  obtain ⟨t, e⟩ := fac g
  rw [hg, one] at e
  rw [e, k]

/-- upstream dim_of_ine: degree of the char. polynomial at any element is the dimension. -/
theorem dim_of_ine {W I C : Type} (incl : I → W) (one : I) (cx cy : W → C) (natDeg : C → Nat)
    (dx dy : Nat) (hx : ∀ g, natDeg (cx g) = dx) (hy : ∀ g, natDeg (cy g) = dy)
    (k : ∀ t, cx (incl t) = cy (incl t)) : dx = dy := by
  rw [← hx (incl one), k, hy]
end CharPol

end GrokGaloisRows

#print axioms GrokGaloisRows.Away.big
#print axioms GrokGaloisRows.nice_big
#print axioms GrokGaloisRows.row_mono
#print axioms GrokGaloisRows.awayB_not_away
#print axioms GrokGaloisRows.charPol_of_ine
#print axioms GrokGaloisRows.dim_of_ine

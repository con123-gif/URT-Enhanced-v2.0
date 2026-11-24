/-
  Grok swarm, lane galois_rows, RUN 4. Schema-level Lean companion (core Lean 4.33.1, no Mathlib,
  no upstream import). It checks the LOGICAL/ARITHMETIC SHAPE of three steps at pin 40e56bab…:
   (1) `CyclotomicKummerDescent.exists_aut`: an index ≤ [E:ℚ] divides [E:ℚ]! (so the [E:ℚ]!-th power of
       any unit mod M lies in the image of Gal(E(ζ_M)/E));
   (2) `CyclotomicKummerDescent.descent`, `hgeom`: (k+1)^m = (Σ_{i<m} (k+1)^i)·k + 1;
   (3) `ChevalleySUnits.core`, the Chebotarev cover: if each Galois element τ has an auxiliary place v τ
       at which "x ≡ 1" forces τ to fix the M-th root, and T is the image of v, then x ≡ 1 on T forces
       every τ to fix it.
  It is NOT a kernel check of the upstream declarations.
-/
namespace GrokChevalleyHchar

def fact : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * fact n

/-- (1) Shape of `Nat.dvd_factorial` as used in `exists_aut` (upstream line 58–59). -/
theorem dvd_fact : ∀ (n i : Nat), 0 < i → i ≤ n → i ∣ fact n
  | 0, i, hi, hin => absurd hin (by omega)
  | n + 1, i, hi, hin => by
    rcases Nat.lt_or_ge i (n + 1) with h | h
    · obtain ⟨c, hc⟩ := dvd_fact n i hi (by omega)
      exact ⟨(n + 1) * c, by simp only [fact, hc]; rw [Nat.mul_left_comm]⟩
    · have : i = n + 1 := by omega
      subst this
      exact ⟨fact n, rfl⟩

def gsum (t : Nat) : Nat → Nat
  | 0 => 0
  | m + 1 => gsum t m + t ^ m

/-- (2) Shape of `hgeom` in `descent` (upstream lines 109–113). -/
theorem geom_identity (k : Nat) : ∀ m, (k + 1) ^ m = gsum (k + 1) m * k + 1
  | 0 => by simp [gsum]
  | m + 1 => by
    have ih := geom_identity k m
    simp only [gsum, Nat.pow_succ]
    rw [ih]
    generalize gsum (k + 1) m = G
    simp only [Nat.add_mul, Nat.mul_add, Nat.mul_one, Nat.one_mul, Nat.mul_assoc]
    omega

/-- (3) Shape of the cover step in `ChevalleySUnits.core` (upstream lines 155–209 of ExistsKummerField). -/
theorem frob_cover {Gal Pl : Type} (v : Gal → Pl) (inT : Pl → Prop) (hT : ∀ τ, inT (v τ))
    (oneMod : Pl → Prop) (fixes : Gal → Prop) (hfrob : ∀ τ, oneMod (v τ) → fixes τ)
    (hx : ∀ t, inT t → oneMod t) : ∀ τ, fixes τ :=
  fun τ => hfrob τ (hx (v τ) (hT τ))

end GrokChevalleyHchar

#print axioms GrokChevalleyHchar.dvd_fact
#print axioms GrokChevalleyHchar.geom_identity
#print axioms GrokChevalleyHchar.frob_cover

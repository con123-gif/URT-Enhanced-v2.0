/-
  Grok swarm, lane galois_rows, RUN 5. Schema-level companion (core Lean, no Mathlib, no upstream
  import). It checks only the PROPOSITIONAL SHAPE of upstream `UpperTheory.GalS.away_nice` /
  `aw_of_away` (OfStar.lean:37–44, pin 40e56bab…): if every NcW datum is either "big" or "toral"
  (`star_guard`), then the weakened `AwayB` (tame clause only at big places, plus the toral clause)
  yields the consumer-facing conclusion at every NcW datum. NOT a kernel check of upstream terms.
-/
namespace GrokRow0bGuard

structure AwayB (Big Tm Sq Mono Tor Eq Concl : Prop) : Prop where
  tor : Tor → Mono → Eq
  tame0 : Big → Tm → Sq → Mono → Concl

theorem away_nice {Big Tm Sq Mono Tor Eq Concl NcW : Prop}
    (a : AwayB Big Tm Sq Mono Tor Eq Concl)
    (star_guard : NcW → (Big ∧ Tm ∧ Sq) ∨ Tor) (mono_of : NcW → Mono)
    (concl_of_eq : Eq → Mono → Concl) (k : NcW) : Concl := by
  rcases star_guard k with ⟨q, t, s⟩ | t
  · exact a.tame0 q t s (mono_of k)
  · exact concl_of_eq (a.tor t (mono_of k)) (mono_of k)

/-- Shape of `star_guard`: the case split on the decidable "totally split prime p > 16 n²" test. -/
theorem star_guard {Split Big Tm Sq Tor NcW : Prop} (big_of : Split → NcW → Big ∧ Tm ∧ Sq)
    (tor_of : ¬ Split → NcW → Tor) (k : NcW) : (Big ∧ Tm ∧ Sq) ∨ Tor :=
  Classical.byCases (fun h : Split => Or.inl (big_of h k)) (fun h => Or.inr (tor_of h k))

end GrokRow0bGuard

#print axioms GrokRow0bGuard.away_nice
#print axioms GrokRow0bGuard.star_guard

import New.Data.ChosenPlaceLevels
import Lib.Adelic.Transference.MassBasic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic
import RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL

/-!
# RUN82 — actual chosen-level local-component bridge, A2
27 November 2026. HUMAN SOURCE-MATCHED proof; executable Lean candidate
PREPARED, not compiled. No RH root import. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Historical pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
live spine, ledger d9a79b815446e5de21e207f6149432d9b478f7f7,
AGENTS, handoff, protocol, expansion, and RUN81 2e321001. Reviewed recent
peer A1 55afd422, kernel f8e95752, A2 acceleration cd306c11 and
integration e9d6043b (full B2 replay still pending). No duplicate cold
build, no changes to registry, protected workflows, schedules or live spine.
A1 fixed-J normalization and A2 spanning/frame work remain intact.

## Actual mathematical bridge (not another torsion lemma)
Let y be in classAut stdRatPoints D.chosenLevel g, with y^p=1,
p prime. Write h=g^-1 y g. Choose i in Fin 2 with p != D.g i
using D.g_injective. The native D.chosenEquiv gives an actual chosen
place w above D.g i, since the infinite-place type of a number field
is nonempty. Thus card(ResField w)=w.q=D.g i by D.q_eq_g. Its
characteristic is D.g i: a finite field has prime characteristic c
and cardinality c^a, a>=1; c divides the prime D.g i. In particular
the scalar p is nonzero in ResField w.

Use the same h throughout. By mem_levelOf, h is in Kf and its
reduction at w is 1. By mem_Kf_iff the matrix h_w is in Kw n w,
so there is T in GL_n(LocInt w) with T.map(subtype)=h_w.
The map on GL induced by the subring inclusion is injective:
entrywise inclusion is injective and units are determined by value.
Since h^p=1 (conjugation) and atPlace is a monoid hom, T^p=1.
Kf.reduceAt_eq_of_atPlace identifies T's reduction with the
component of reduceFamily, so T reduces to 1. Apply the already
recorded RUN81 geometric-sum lemma to its underlying matrix.
No norm, valuation or trace estimate is needed. Thus T=1, h_w=1,
and y_w=1 after cancelling the conjugation.

**Crucial exact rationality bridge**: y is not an arbitrary adele.
Its membership in stdRatPoints means y=stdEmbFin gamma for an
actual gamma in U_n(E). By stdSpace_embFin and Gf.atPlace,
the local matrix y_w equals the entrywise image of gamma under
the ring map E -> finite adeles -> LocField w. This composite is
injective since E is a field and the codomain is nontrivial.
Hence y_w=1 implies gamma=1 and y=1. Do not use Gf.ext with
only one place; e.g. an adelic element supported at another split
pair need not be 1. This proves the actual hkill premise in RUN81.
Finite stabilizer and subgroup monotonicity are already in RUN81.
The new candidate now connects every premise of that conditional
bridge to concrete pinned-source definitions; native replay still needed.

## Source and dependency ledger (relative to grh-compact/src)
* New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3:
  chosenEquiv, chosenLevel, classAut_eq_bot_of_le_chosenLevel.
* New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0:
  q_eq_g, chosen, chosen-place membership.
* Lib/Adelic/Unitary/CongruenceLevel.lean 07e6502ac533d1868d68f817a00bdd2ac95f4616:
  mem_levelOf, Kf.reduceFamily, Kf.reduceAt_eq_of_atPlace.
* Lib/Adelic/Adeles/LocalComponents.lean bae4e852f02d8f66cb3bbba5fe0e4eabab644555:
  mem_Kf_iff.
* Lib/Adelic/Unitary/SpaceDefs.lean d1a1e309a47cc3184b7a8697544f5ac4b38c50bd:
  Gf.atPlace, stdRatPoints, stdEmbFin, Space.Γf.
* Lib/Adelic/Adeles/RationalPoints.lean aebdd974ccdf94b1d9b9ea4ead153261ee1717cd:
  stdSpace_embFin (190–191).
* Lib/Adelic/Hecke/ClassMean.lean b9d642228711dcfb20687f0b2579fa8ff99838f3:
  HasFiniteType.finite_aut; retained exact finite-level premise.
* Lib/Shimura/IntegralModel/NeatLevel.lean 045eae758ea2326d3b665f2d687985cff4ad5ef8:
  original classAut_eq_bot using large-norm signed-frame theorem.
* Mathlib/FieldTheory/Finite/Basic.lean 3d73633f25099d2d4917e1086000bfb293eea4c8:
  FiniteField.card, plus CharP.cast_eq_zero_iff and
  Nat.Prime.dvd_of_dvd_pow.

Original and candidate graphs (source-static, not kernel graph):
  Data.short_forms -> span_short_ramifiedColumns / gaugeLe_chain
  -> classAut_eq_bot_of_le_chosenLevel -> classAut_eq_bot
  -> signed-frame norm/neatness (rank bound).
  Candidate same two callers -> smallerLevel_free -> chosenLevel_free
  -> finite group prime kill -> same rational y at chosen w
  -> local integral lift + reduction + geometric sum
  -> rational matrix injection.
  Other consumers of rank/norm bounds and original graph retained.
No new mathematical premise: finite stabilizer already supplied by
definite space and IsLevel; preserve all premises used there. No
claim that classAut_eq_bot can be removed globally. All A1–A3 and
B/C/D/E/V root obligations remain open. Context key includes D, n,
g, the same rational y, p and chosen w; no caching across arbitrary
adelic points. Failed shortcut: inferring global identity from a
single local identity for unrestricted adeles. No URT benefit asserted.

## Verification
Local shell command -v lean lake elan returned no binaries. Therefore
no native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier executed.
Prepared code below is NOT a kernel receipt; coercion and instance
elaboration at local GL, residue card and rational map are replay gates.
Actual prior A receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
still has module_1_build exit 124. B2 actual repair status blob
c2bedaa5acd2a8d68d42a49a461675d3f3ed417b and log
bbfb981a34c342107737e35786b6287556132142 inspected: source build and
pair bodies accepted, inspector failed; not overall PASS.
New full-chain graph status returned 404; no result claimed.
No scalar regression repeated for the already proved geometric sum.
Original RUN81 certificates remain uncompiled.

Replay in shared compact A2 workspace after the existing peer caller
job, using the same lake environment: copy RUN81 and RUN82 to a scratch
directory W; in W run the pinned project's lake env with LEAN_PATH
including W; lean -o W/RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.olean
W/RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean, then lean -Dpp.fullNames=true
W/RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean. Preserve compiler logs,
#print axioms output and both graphs, then replace only the two actual
caller uses. Do not register another cold build without coordination.

RESUME HERE: native replay of RUN81 + RUN82 in the shared compact A2
environment, repair actual elaboration failures and inspect exact
axiom/dependency receipts at Data.classAut_eq_bot_of_le_chosenLevel's
two consumers before marking local replacement accepted.
HANDOFF TO kernel, acceleration, integration, editor and audit.
-/

noncomputable section
open NumberField Matrix MonoidHom

namespace ThetaRun82

/-- The residue characteristic obstruction needs only prime field size. -/
theorem cast_prime_ne_zero_of_card_prime
    (k : Type*) [Field k] [Fintype k]
    {q p : ℕ} (hq : q.Prime) (hp : p.Prime)
    (hc : Fintype.card k = q) (hne : p ≠ q) :
    (p : k) ≠ 0 := by
  intro hz
  obtain ⟨a, hchar, hpow⟩ := FiniteField.card k (ringChar k)
  have hdiv : ringChar k ∣ q := by
    rw [← hc, hpow]
    exact dvd_pow_self _ a.ne_zero
  have heq : ringChar k = q := (Nat.prime_dvd_prime_iff_eq hchar hq).1 hdiv
  have hdp : ringChar k ∣ p := (CharP.cast_eq_zero_iff k (ringChar k) p).1 hz
  exact hne ((Nat.prime_dvd_prime_iff_eq hchar hp).1 hdp |>.symm.trans heq)

/-- Entrywise ring injection also injects matrix units. -/
theorem gl_map_injective {R S n : Type*} [CommRing R] [CommRing S]
    [Fintype n] [DecidableEq n] (f : R →+* S) (hf : Function.Injective f) :
    Function.Injective (Matrix.GeneralLinearGroup.map (n := n) f) := by
  intro a b h
  apply Units.ext
  apply Matrix.map_injective hf
  exact congrArg Units.val h

/-- The actual local reduction bridge, for a member of the chosen level. -/
theorem chosen_component_prime_kill {P} {D : Data P}
    {n : Type} [Fintype n] (h : Gf D.E n)
    (hh : h ∈ D.chosenLevel) (p : ℕ) (hp : h ^ p = 1)
    (j : Σ i, D.ChosenPlace i)
    (hpw : (p : ResField (D.chosen j)) ≠ 0) :
    h.atPlace (D.chosen j) = 1 := by
  classical
  let w := D.chosen j
  obtain ⟨hk, hr⟩ := mem_levelOf.1 hh
  have hred : Kf.reduceAt w ⟨h, hk⟩ = 1 := by
    have he : Kf.reduceFamily D.chosen ⟨h, hk⟩ = 1 :=
      Subgroup.mem_bot.mp hr
    exact congrArg (fun x => x j) he
  obtain ⟨T, hT⟩ := (mem_Kf_iff.1 hk) w
  have ht : h.atPlace w = T.map (LocInt w).subtype := hT.symm
  have hTp : T ^ p = 1 := by
    apply gl_map_injective (LocInt w).subtype Subtype.val_injective
    rw [map_pow, map_one, ← ht, ← map_pow, hp, map_one]
  have hTr : T.map (IsLocalRing.residue (LocInt w)) = 1 :=
    (Kf.reduceAt_eq_of_atPlace ht).symm.trans hred
  have hmat : T.1 = 1 := ThetaRun81.matrix_torsion_eq_one T.1 p
    (congrArg Units.val hTr) hpw (by simpa using congrArg Units.val hTp)
  have hunit : T = 1 := Units.ext hmat
  rw [ht, hunit, map_one]

/-- Rational points, not all adelic points, are detected at one place. -/
theorem rational_eq_one_of_component {E : Type} [Field E] [CMType E]
    {n : Type} [Fintype n] (y : Gf E n)
    (hy : y ∈ stdRatPoints) (w : FinPlace E)
    (hw : y.atPlace w = 1) : y = 1 := by
  classical
  rcases hy with ⟨γ, rfl⟩
  have hγ : γ = 1 := by
    apply Subtype.ext
    apply gl_map_injective ((evalAt w).comp (algebraMap E (𝔸f E)))
      (RingHom.injective _)
    rw [map_one]
    apply Units.ext
    have hm := congrArg Units.val hw
    simpa [Gf.atPlace, stdSpace_embFin, Matrix.map_map] using hm
  rw [hγ, map_one]

/-- Discharge the actual hkill premise from RUN81; no neatness hypothesis. -/
theorem chosenLevel_prime_kill {P} {D : Data P}
    {n : Type} [Fintype n] (g : Gf D.E n)
    (y : classAut stdRatPoints (D.chosenLevel (n := n)) g)
    (p : ℕ) (hp : p.Prime) (hy : y ^ p = 1) : y = 1 := by
  classical
  have hi : ∃ i : Fin 2, p ≠ D.g i := by
    by_cases h : p = D.g 0
    · exact ⟨1, fun e => (by decide : (0 : Fin 2) ≠ 1)
          (D.g_injective (h.symm.trans e))⟩
    · exact ⟨0, h⟩
  obtain ⟨i, hi⟩ := hi
  let v : D.ChosenPlace i := D.chosenEquiv i (Classical.ofNonempty : D.Φ)
  let j : Σ i, D.ChosenPlace i := ⟨i, v⟩
  let w := D.chosen j
  have hcard : Fintype.card (ResField w) = D.g i := by
    rw [← Nat.card_eq_fintype_card, card_ResField]
    exact D.q_eq_g v.2.2
  have hpw : (p : ResField w) ≠ 0 :=
    cast_prime_ne_zero_of_card_prime _ (D.g_prime i) hp hcard hi
  let h := g⁻¹ * y.1 * g
  have hh : h ∈ D.chosenLevel := y.2.2
  have hy' : (y.1 : Gf D.E n) ^ p = 1 := by
    simpa using congrArg Subtype.val hy
  have hpow : h ^ p = 1 := by
    have e : h ^ p = g⁻¹ * y.1 ^ p * g := by
      induction p with
      | zero => simp [h]
      | succ p ih => rw [pow_succ, ih, pow_succ]; dsimp [h]; group
    rw [e, hy']; simp
  have hw : h.atPlace w = 1 := chosen_component_prime_kill h hh p hpow j hpw
  have hyw : y.1.atPlace w = 1 := by
    change (Gf.atPlace w) (g⁻¹ * y.1 * g) = 1 at hw
    simp only [map_mul, map_inv] at hw
    calc
      y.1.atPlace w = g.atPlace w *
          ((g.atPlace w)⁻¹ * y.1.atPlace w * g.atPlace w) *
          (g.atPlace w)⁻¹ := by group
      _ = 1 := by rw [hw]; simp
  exact Subtype.ext (rational_eq_one_of_component y.1 y.2.1 w hyw)

/-- Candidate strengthened replacement: original numerical guard is unused. -/
theorem chosenLevel_free {P} {D : Data P}
    {n : Type} [Fintype n] {K : Subgroup (Gf D.E n)}
    (hK : K ≤ D.chosenLevel) :
    ∀ g, classAut stdRatPoints K g = ⊥ :=
  ThetaRun81.smallerLevel_free hK
    (ThetaRun81.chosenLevel_free_of_prime_kill chosenLevel_prime_kill)

/-- Original statement adapter for the two A2 callers. -/
theorem chosenLevel_free_original {P} {D : Data P}
    {n : Type} [Fintype n] {K : Subgroup (Gf D.E n)}
    (hK : K ≤ D.chosenLevel) (_hn : Fintype.card n ≤ 2 * D.n D.m) :
    ∀ g, classAut stdRatPoints K g = ⊥ := chosenLevel_free hK

#print axioms cast_prime_ne_zero_of_card_prime
#print axioms gl_map_injective
#print axioms chosen_component_prime_kill
#print axioms rational_eq_one_of_component
#print axioms chosenLevel_prime_kill
#print axioms chosenLevel_free
#print axioms chosenLevel_free_original
#check @Data.classAut_eq_bot_of_le_chosenLevel
#check @chosenLevel_free_original
end ThetaRun82

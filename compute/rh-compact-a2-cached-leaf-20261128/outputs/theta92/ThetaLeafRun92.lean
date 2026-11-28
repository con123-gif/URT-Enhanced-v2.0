import New.Data.ChosenPlaceLevels
import Lib.Adelic.Transference.MassBasic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Tactic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Algebra.CharP.CharAndCard
import Lean
noncomputable section
open NumberField Matrix MonoidHom
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true
namespace ThetaRun81

/-- A prime-to-residue-characteristic torsion matrix cannot lie in
the identity congruence kernel. No DVR hypothesis. -/
theorem matrix_torsion_eq_one
    {R n : Type*} [CommRing R] [IsLocalRing R]
    [Fintype n] [DecidableEq n] (A : Matrix n n R) (u : ℕ)
    (hA : A.map (IsLocalRing.residue R) = 1)
    (hu : (u : IsLocalRing.ResidueField R) ≠ 0)
    (hpow : A ^ u = 1) : A = 1 := by
  classical
  let f : Matrix n n R →+* Matrix n n (IsLocalRing.ResidueField R) :=
    (IsLocalRing.residue R).mapMatrix
  have hf : f A = 1 := hA
  let S : Matrix n n R := ∑ j ∈ Finset.range u, A ^ j
  have hS : f S = (u : IsLocalRing.ResidueField R) •
      (1 : Matrix n n (IsLocalRing.ResidueField R)) := by
    simp [S, map_sum, hf, Nat.cast_smul_eq_nsmul]
  have hd : IsLocalRing.residue R S.det ≠ 0 := by
    rw [RingHom.map_det]
    change (f S).det ≠ 0
    rw [hS, Matrix.det_smul, Matrix.det_one, mul_one]
    exact pow_ne_zero _ hu
  have hunit : IsUnit S :=
    (Matrix.isUnit_iff_isUnit_det S).2
      ((IsLocalRing.residue_ne_zero_iff_isUnit S.det).1 hd)
  have hz : S * (A - 1) = 0 := by
    have he := geom_sum_mul_add (A - 1) u
    have he' : S * (A - 1) + 1 = 0 + 1 := by
      simpa [S, sub_add_cancel, hpow] using he
    exact add_right_cancel he'
  obtain ⟨U, hU⟩ := hunit
  rw [← hU] at hz
  have hz' := congrArg (fun X : Matrix n n R =>
    (↑(U⁻¹) : Matrix n n R) * X) hz
  have hz'' : A - 1 = 0 := by
    simpa [← mul_assoc] using hz'
  exact sub_eq_zero.mp hz''

/-- It suffices to exclude prime-order torsion in the same finite group. -/
theorem finite_group_trivial {G : Type*} [Group G] [Finite G]
    (kill : ∀ y : G, ∀ p : ℕ, p.Prime → y ^ p = 1 → y = 1)
    (x : G) : x = 1 := by
  by_contra hn
  have hM : orderOf x ≠ 1 := fun h => hn (orderOf_eq_one_iff.mp h)
  obtain ⟨p, hp, hd⟩ := Nat.exists_prime_and_dvd hM
  let y := x ^ (orderOf x / p)
  have ho : orderOf y = p :=
    orderOf_pow_orderOf_div (orderOf_pos x).ne' hd
  have hy : y ^ p = 1 := orderOf_dvd_iff_pow_eq_one.mp (by rw [ho])
  have hy' := kill y p hp hy
  rw [hy', orderOf_one] at ho
  exact hp.ne_one ho.symm

/-- Exact caller adapter. The local-component hkill premise is NOT
discharged here; the preceding human derivation identifies how. -/
theorem chosenLevel_free_of_prime_kill {P} {D : Data P}
    {n : Type} [Fintype n]
    (hkill : ∀ g, ∀ y : classAut stdRatPoints (D.chosenLevel (n := n)) g,
      ∀ p : ℕ, p.Prime → y ^ p = 1 → y = 1) :
    ∀ g, classAut stdRatPoints (D.chosenLevel (n := n)) g = ⊥ := by
  intro g
  letI : Finite (classAut stdRatPoints (D.chosenLevel (n := n)) g) :=
    HasFiniteType.finite_aut g
  apply bot_unique
  intro x hx
  have h := finite_group_trivial (hkill g)
    (⟨x, hx⟩ : classAut stdRatPoints (D.chosenLevel (n := n)) g)
  exact Subgroup.mem_bot.mpr (congrArg Subtype.val h)

/-- No openness hypothesis on the smaller subgroup. -/
theorem smallerLevel_free {P} {D : Data P} {n : Type} [Fintype n]
    {K : Subgroup (Gf D.E n)} (hK : K ≤ D.chosenLevel)
    (hfree : ∀ g, classAut stdRatPoints (D.chosenLevel (n := n)) g = ⊥) :
    ∀ g, classAut stdRatPoints K g = ⊥ := by
  intro g
  apply bot_unique
  intro x hx
  have hm : x ∈ classAut stdRatPoints (D.chosenLevel (n := n)) g :=
    ⟨hx.1, hK hx.2⟩
  simpa [hfree g] using hm

#print axioms matrix_torsion_eq_one
#print axioms finite_group_trivial
#print axioms chosenLevel_free_of_prime_kill
#print axioms smallerLevel_free
end ThetaRun81

namespace ThetaRun82

/-- The residue characteristic obstruction needs only prime field size. -/
theorem cast_prime_ne_zero_of_card_prime
    (k : Type*) [Field k] [Fintype k]
    {q p : ℕ} (hq : q.Prime) (hp : p.Prime)
    (hc : Fintype.card k = q) (hne : p ≠ q) :
    (p : k) ≠ 0 := by
  letI : Fact q.Prime := ⟨hq⟩
  letI : CharP k q := charP_of_card_eq_prime hc
  intro hz
  exact hne ((Nat.prime_dvd_prime_iff_eq hq hp).1
    ((CharP.cast_eq_zero_iff k q p).1 hz)).symm

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
  let f : E →+* LocField w := (evalAt w).comp (algebraMap E (𝔸f E))
  have hmap : Matrix.GeneralLinearGroup.map f γ.1 = 1 := by
    change Matrix.GeneralLinearGroup.map (evalAt w) ((stdEmbFin γ).1) = 1 at hw
    rw [stdSpace_embFin] at hw
    change Matrix.GeneralLinearGroup.map ((evalAt w).comp (algebraMap E (𝔸f E))) γ.1 = 1
    rw [Matrix.GeneralLinearGroup.map_comp, MonoidHom.comp_apply]
    exact hw
  have hγ : γ = 1 := by
    apply Subtype.ext
    apply gl_map_injective f (RingHom.injective f)
    simpa only [map_one] using hmap
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

run_cmd do
  let old := ``Data.classAut_eq_bot_of_le_chosenLevel
  let fresh := ``ThetaRun82.chosenLevel_free_original
  let a ← Lean.getConstInfo old
  let b ← Lean.getConstInfo fresh
  unless a.levelParams == b.levelParams do
    Lean.throwError "THETA89 universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "THETA89 full statement mismatch"
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun n => allowed.contains n) &&
      na.all (fun n => allowed.contains n && oa.contains n) do
    Lean.throwError "THETA89 new/unexpected axiom"
  let some v := b.value? (allowOpaque := true) |
    Lean.throwError "THETA89 no adapter proof"
  unless v.getUsedConstants.contains ``ThetaRun82.chosenLevel_free &&
      !v.getUsedConstants.contains old do
    Lean.throwError "THETA89 adapter edge mismatch"
  for n in #[old, fresh] do
    let info ← Lean.getConstInfo n
    let some val := info.value? (allowOpaque := true) |
      Lean.throwError "THETA89 missing value"
    Lean.logInfo m!"THETA89_TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}"
    Lean.logInfo m!"THETA89_LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}"
    for dep in info.type.getUsedConstants do
      Lean.logInfo m!"THETA89_EDGE|{n}|type|{dep}"
    for dep in val.getUsedConstants do
      Lean.logInfo m!"THETA89_EDGE|{n}|value|{dep}"
    Lean.logInfo m!"THETA89_AXIOMS|{n}|{← Lean.collectAxioms n}"
  Lean.logInfo "THETA89_LEAF_CHECKED"

#print axioms Data.classAut_eq_bot_of_le_chosenLevel
#print axioms ThetaRun82.chosenLevel_free_original

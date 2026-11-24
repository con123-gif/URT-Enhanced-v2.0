/-
Green regular-character lane — Lean companion part 2: the label bridge (Grok, 2026-11-24).
Upstream: leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005
  src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/SumRangeEqRoots.lean (blob 43bfabf7)
    namespace GlobalTheory.GreenBridge, theorem green_of_regular
  helper lemmas copied from CuspidalCharExistsOfGreen.lean (GreenExists.pow_eq_self_iff, rootsBar_eq),
  FixedMemRange.lean (fixed_mem_range), MemRootsBarXSubC.lean (GLq.Model.thetaOf_gen_pow);
  definitions from LabelDatum.lean (LabelDatum, thetaOf, IsCuspOf, Green) and
  Formalism/CyclotomicNorms/StatementT.lean (Fbar, rootsBar).
Changes vs upstream: the cuspidality predicate is abstracted as `Cusp` (the bridge never unfolds it);
the FixedMemRange.main `first | ...` wrapper is replaced by a direct call to fixed_mem_range (same lemma).
-/
import GreenCompanion.Exhaustion

set_option autoImplicit false
noncomputable section
open Polynomial
open scoped Classical

namespace GreenCompanion

abbrev Fbar (g : ℕ) [Fact g.Prime] : Type := AlgebraicClosure (ZMod g)

def rootsBar {g : ℕ} [Fact g.Prime] (f : (ZMod g)[X]) : Multiset (Fbar g) :=
  (f.map (algebraMap (ZMod g) (Fbar g))).roots

structure LabelDatum (g : ℕ) [Fact g.Prime] where
  teich : Fbar g →* ℂ
  teich_inj : ∀ x y, x ≠ 0 → y ≠ 0 → teich x = teich y → x = y
  gen : ℕ → Fbar g
  gen_order : ∀ d, 0 < d → orderOf (gen d) = g ^ d - 1
  gen_norm : ∀ d e, 0 < d → 0 < e → gen (d * e) ^ ((g ^ (d * e) - 1) / (g ^ d - 1)) = gen d

def thetaOf {g : ℕ} [Fact g.Prime] (L : LabelDatum g) (d : ℕ) (x z : Fbar g) : ℂ :=
  if h : ∃ n : ℕ, z = L.gen d ^ n then L.teich x ^ h.choose else 0

section Bridge
variable (Cusp : ∀ {g : ℕ} [Fact g.Prime] {d : ℕ}, (Gn g d → ℂ) → Prop)

def IsCuspOf {g : ℕ} [Fact g.Prime] (L : LabelDatum g) (P : (ZMod g)[X]) {d : ℕ} (χ : Gn g d → ℂ) : Prop :=
  IsPrimeLab d P ∧ Cusp χ ∧ ∀ x ∈ rootsBar P, ∀ y : Gn g d, Irreducible (y : Mt g d).charpoly →
    ∀ z ∈ rootsBar (y : Mt g d).charpoly,
      χ y = (-1) ^ (d - 1) * ∑ i ∈ Finset.range d, thetaOf L d x (z ^ (g ^ i))

/-- Upstream `GlobalTheory.GLq.Green`, generic in the cuspidality predicate. -/
def GreenFor : Prop :=
  ∀ (g : ℕ) [Fact g.Prime] (L : LabelDatum g) (d : ℕ), 0 < d → ∃ τ : (ZMod g)[X] → Gn g d → ℂ,
    (∀ P, IsPrimeLab d P → IsCuspOf Cusp L P (τ P) ∧ τ P 1 = ∏ i ∈ Finset.Ico 1 d, ((g : ℂ) ^ i - 1)) ∧
    (∀ P P', IsPrimeLab d P → IsPrimeLab d P' → τ P = τ P' → P = P') ∧
    ∀ χ : Gn g d → ℂ, Cusp χ → ∃ P, IsPrimeLab d P ∧ χ = τ P

variable {g : ℕ} [hg : Fact g.Prime]

theorem N_pos' {d : ℕ} (hd : 0 < d) : 0 < g ^ d - 1 :=
  Nat.sub_pos_of_lt (Nat.one_lt_pow hd.ne' hg.out.one_lt)

theorem pow_eq_self_iff {f : (ZMod g)[X]} (hf : Irreducible f) {z : Fbar g} (hz : aeval z f = 0) (n : ℕ) :
    z ^ g ^ n = z ↔ f.natDegree ∣ n := by
  have hx : IsIntegral (ZMod g) z := Algebra.IsIntegral.isIntegral z
  have has : Associated (minpoly (ZMod g) z) f :=
    (minpoly.irreducible hx).associated_of_dvd hf (minpoly.dvd _ _ hz)
  rw [hf.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X, ← has.dvd_iff_dvd_left, minpoly.dvd_iff]
  simp [sub_eq_zero]

theorem rootsBar_eq {f : (ZMod g)[X]} (hf : Irreducible f) {z : Fbar g} (hz : aeval z f = 0) :
    rootsBar f = (Finset.range f.natDegree).val.map fun i => z ^ g ^ i := by
  have hroot : ∀ i, aeval (z ^ g ^ i) f = 0 := fun i => by
    have := aeval_algHom_apply ((FiniteField.frobeniusAlgHom (ZMod g) (Fbar g)) ^ i) z f
    rw [hz, map_zero] at this
    rw [← this]
    congr 1
    rw [AlgHom.coe_pow, FiniteField.coe_frobeniusAlgHom, pow_iterate, ZMod.card]
  have hinj : ∀ i j, i < j → j < f.natDegree → z ^ g ^ i ≠ z ^ g ^ j := fun i j hij hj h => by
    obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_lt hij
    have h2 : (z ^ g ^ i) ^ g ^ (m + 1) = z ^ g ^ i := by
      rw [← pow_mul, ← pow_add, ← add_assoc, ← h]
    have := Nat.le_of_dvd (Nat.succ_pos m) ((pow_eq_self_iff hf (hroot i) _).1 h2)
    omega
  have hnd : ((Finset.range f.natDegree).val.map fun i => z ^ g ^ i).Nodup := by
    refine Multiset.Nodup.map_on (fun i hi j hj h => ?_) (Finset.range _).nodup
    rw [← Finset.mem_def, Finset.mem_range] at hi hj
    rcases lt_trichotomy i j with h1 | h1 | h1
    · exact absurd h (hinj i j h1 hj)
    · exact h1
    · exact absurd h.symm (hinj j i h1 hi)
  symm
  refine Multiset.eq_of_le_of_card_le ((Multiset.le_iff_subset hnd).2 fun w hw => ?_) ?_
  · obtain ⟨i, -, rfl⟩ := Multiset.mem_map.1 hw
    simpa [rootsBar, hf.ne_zero, aeval_def, eval_map] using hroot i
  · have := card_roots' (f.map (algebraMap (ZMod g) (Fbar g)))
    simpa [rootsBar] using this


theorem fixed_mem_range {g : ℕ} [hg : Fact (Nat.Prime g)] {d : ℕ} (hd : 0 < d)
    {w : AlgebraicClosure (ZMod g)} (hw : w ^ g ^ d = w) :
    ∃ k : GaloisField g d,
      ((IsAlgClosed.lift : GaloisField g d →ₐ[ZMod g] AlgebraicClosure (ZMod g)) : GaloisField g d → AlgebraicClosure (ZMod g)) k = w := by
  classical
  set ι : GaloisField g d →ₐ[ZMod g] AlgebraicClosure (ZMod g) := IsAlgClosed.lift with hι
  letI : Fintype (GaloisField g d) := Fintype.ofFinite _
  have hcard : Fintype.card (GaloisField g d) = g ^ d := by rw [Fintype.card_eq_nat_card]; exact GaloisField.card g d hd.ne'
  have hq : 1 < g ^ d := Nat.one_lt_pow hd.ne' hg.out.one_lt
  set P : (AlgebraicClosure (ZMod g))[X] := X ^ (g ^ d) - X with hP
  have hP0 : P ≠ 0 := FiniteField.X_pow_card_sub_X_ne_zero _ hq
  have hPdeg : P.natDegree = g ^ d := FiniteField.X_pow_card_sub_X_natDegree_eq _ hq
  have hsub : Finset.univ.image ι ⊆ P.roots.toFinset := by
    intro x hx
    obtain ⟨k, -, rfl⟩ := Finset.mem_image.1 hx
    rw [Multiset.mem_toFinset, mem_roots hP0]
    have hk : k ^ g ^ d = k := by
      rw [← hcard]; exact FiniteField.pow_card k
    simp [hP, IsRoot, sub_eq_zero, ← map_pow, hk]
  have hle : P.roots.toFinset.card ≤ (Finset.univ.image ι).card := by
    have hinj : Function.Injective ι := fun a b h => (RingHom.injective ι.toRingHom) h
    rw [Finset.card_image_of_injective _ hinj, Finset.card_univ, hcard, ← hPdeg]
    exact (Multiset.toFinset_card_le _).trans (card_roots' P)
  have heq := Finset.eq_of_subset_of_card_le hsub hle
  have hwm : w ∈ P.roots.toFinset := by
    rw [Multiset.mem_toFinset, mem_roots hP0]
    simp [hP, IsRoot, sub_eq_zero, hw]
  rw [← heq] at hwm
  obtain ⟨k, -, hk⟩ := Finset.mem_image.1 hwm
  exact ⟨k, hk⟩


theorem thetaOf_gen_pow (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) (n : ℕ) :
    thetaOf L d x (L.gen d ^ n) = L.teich x ^ n := by
  have hex : ∃ m : ℕ, L.gen d ^ n = L.gen d ^ m := ⟨n, rfl⟩
  rw [thetaOf, dif_pos hex]
  have hm := hex.choose_spec
  have hN := N_pos' (g := g) hd
  have hP : IsPrimitiveRoot (L.gen d) (g ^ d - 1) :=
    L.gen_order d hd ▸ IsPrimitiveRoot.orderOf (L.gen d)

  have h1 : n % (g ^ d - 1) = hex.choose % (g ^ d - 1) := by
    apply hP.pow_inj (Nat.mod_lt _ hN) (Nat.mod_lt _ hN)
    rw [← L.gen_order d hd, pow_mod_orderOf, pow_mod_orderOf]
    exact hm
  have h2 : orderOf (L.teich x) ∣ g ^ d - 1 :=
    orderOf_dvd_of_pow_eq_one (by rw [← map_pow, hx, map_one])
  have h3 : n % orderOf (L.teich x) = hex.choose % orderOf (L.teich x) := Nat.ModEq.of_dvd h2 h1
  calc L.teich x ^ hex.choose = L.teich x ^ (hex.choose % orderOf (L.teich x)) :=
        (pow_mod_orderOf _ _).symm
    _ = L.teich x ^ (n % orderOf (L.teich x)) := by rw [h3]
    _ = L.teich x ^ n := pow_mod_orderOf _ _


abbrev KK (g d : ℕ) [Fact g.Prime] : Type := GaloisField g d

def emb (g d : ℕ) [Fact g.Prime] : KK g d →ₐ[ZMod g] Fbar g := IsAlgClosed.lift

instance (g d : ℕ) [Fact g.Prime] : Fintype (KK g d) := Fintype.ofFinite _

theorem emb_injective (d : ℕ) : Function.Injective (emb g d) := (emb g d).toRingHom.injective

theorem card_KK {d : ℕ} (hd : 0 < d) : Fintype.card (KK g d) = g ^ d := by
  rw [← Nat.card_eq_fintype_card, GaloisField.card g d hd.ne']


theorem exists_emb_eq {d : ℕ} (hd : 0 < d) {w : Fbar g} (hw : w ^ g ^ d = w) : ∃ k, emb g d k = w :=
  fixed_mem_range hd hw

theorem gen_prim (L : LabelDatum g) {d : ℕ} (hd : 0 < d) : IsPrimitiveRoot (L.gen d) (g ^ d - 1) :=
  L.gen_order d hd ▸ IsPrimitiveRoot.orderOf _

theorem pow_self_of {d : ℕ} {w : Fbar g} (hw : w ^ (g ^ d - 1) = 1) : w ^ g ^ d = w := by
  have e : g ^ d = g ^ d - 1 + 1 := (Nat.sub_add_cancel (Nat.one_le_pow _ _ hg.out.pos)).symm
  rw [e, pow_succ, hw, one_mul]

theorem ne_zero_of {d : ℕ} (hd : 0 < d) {w : Fbar g} (hw : w ^ (g ^ d - 1) = 1) : w ≠ 0 := by
  rintro rfl
  rw [zero_pow (N_pos' hd).ne'] at hw
  exact zero_ne_one hw

theorem exists_unit_gen (L : LabelDatum g) {d : ℕ} (hd : 0 < d) :
    ∃ u : (KK g d)ˣ, emb g d u = L.gen d ∧ ∀ k : (KK g d)ˣ, ∃ n : ℕ, k = u ^ n := by
  have hp := gen_prim L hd
  obtain ⟨k0, hk0⟩ := exists_emb_eq hd (pow_self_of (hp.pow_eq_one))
  have hk0' : k0 ≠ 0 := by
    rintro rfl
    rw [map_zero] at hk0
    exact ne_zero_of hd hp.pow_eq_one hk0.symm
  refine ⟨Units.mk0 k0 hk0', hk0, fun k => ?_⟩
  haveI : NeZero (g ^ d - 1) := ⟨(N_pos' hd).ne'⟩
  have h1 : (emb g d k) ^ (g ^ d - 1) = 1 := by
    rw [← map_pow, ← card_KK hd, FiniteField.pow_card_sub_one_eq_one _ k.ne_zero, map_one]
  obtain ⟨n, -, hn⟩ := hp.eq_pow_of_pow_eq_one h1
  refine ⟨n, Units.ext ((emb_injective d) ?_)⟩
  have e : ((Units.mk0 k0 hk0' ^ n : (KK g d)ˣ) : KK g d) = k0 ^ n := by simp
  rw [e, map_pow, hk0, hn]

def uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) : (KK g d)ˣ := (exists_unit_gen L hd).choose

theorem emb_uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) : emb g d (uu L hd) = L.gen d :=
  (exists_unit_gen L hd).choose_spec.1

theorem uu_pow (L : LabelDatum g) {d : ℕ} (hd : 0 < d) (k : (KK g d)ˣ) : ∃ n : ℕ, k = uu L hd ^ n :=
  (exists_unit_gen L hd).choose_spec.2 k

theorem mem_zpowers_uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) (k : (KK g d)ˣ) :
    k ∈ Subgroup.zpowers (uu L hd) := by
  obtain ⟨n, rfl⟩ := uu_pow L hd k
  exact Subgroup.npow_mem_zpowers _ n

theorem orderOf_uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) : orderOf (uu L hd) = g ^ d - 1 := by
  let f : (KK g d)ˣ →* Fbar g := (emb g d).toMonoidHom.comp (Units.coeHom _)
  have hf : Function.Injective f := fun a b h => Units.ext ((emb_injective d) h)
  rw [← orderOf_injective f hf, ← L.gen_order d hd]
  exact congrArg orderOf (emb_uu L hd)

theorem teich_ne (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    L.teich x ≠ 0 := by
  intro h
  have h2 : L.teich (x ^ (g ^ d - 1)) = 0 := by rw [map_pow, h, zero_pow (N_pos' hd).ne']
  rw [hx, map_one] at h2
  exact one_ne_zero h2

def tu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) : ℂˣ :=
  Units.mk0 (L.teich x) (teich_ne L hd hx)

theorem orderOf_tu_dvd (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    orderOf (tu L hd hx) ∣ orderOf (uu L hd) := by
  rw [orderOf_uu]
  refine orderOf_dvd_of_pow_eq_one (Units.ext ?_)
  rw [Units.val_pow_eq_pow_val, tu, Units.val_mk0, ← map_pow, hx, map_one, Units.val_one]

def theta (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    (KK g d)ˣ →* ℂˣ :=
  monoidHomOfForallMemZpowers (mem_zpowers_uu L hd) (orderOf_tu_dvd L hd hx)

theorem theta_uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    theta L hd hx (uu L hd) = tu L hd hx :=
  monoidHomOfForallMemZpowers_apply_gen _ _

theorem theta_apply (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1)
    (k : (KK g d)ˣ) : ((theta L hd hx k : ℂˣ) : ℂ) = thetaOf L d x (emb g d k) := by
  obtain ⟨n, rfl⟩ := uu_pow L hd k
  rw [map_pow, theta_uu, Units.val_pow_eq_pow_val, Units.val_pow_eq_pow_val, map_pow, emb_uu,
    thetaOf_gen_pow L hd hx n, tu, Units.val_mk0]

def th (L : LabelDatum g) {d : ℕ} (hd : 0 < d) (x : Fbar g) : (KK g d)ˣ →* ℂˣ :=
  if hx : x ^ (g ^ d - 1) = 1 then theta L hd hx else 1

theorem th_apply (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1)
    (k : (KK g d)ˣ) : ((th L hd x k : ℂˣ) : ℂ) = thetaOf L d x (emb g d k) := by
  rw [th, dif_pos hx, theta_apply]

theorem th_uu (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    ((th L hd x (uu L hd) : ℂˣ) : ℂ) = L.teich x := by
  rw [th, dif_pos hx, theta_uu, tu, Units.val_mk0]

theorem th_ext (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {θ θ' : (KK g d)ˣ →* ℂˣ}
    (h : ((θ (uu L hd) : ℂˣ) : ℂ) = θ' (uu L hd)) : θ = θ' :=
  (MonoidHom.eq_iff_eq_on_generator (mem_zpowers_uu L hd) θ θ').2 (Units.ext h)

theorem unit_pow {d : ℕ} {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) (m : ℕ) : (x ^ m) ^ (g ^ d - 1) = 1 := by
  rw [← pow_mul, mul_comm, pow_mul, hx, one_pow]

theorem th_pow (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) (m : ℕ) :
    th L hd (x ^ m) = th L hd x ^ m := by
  refine th_ext L hd ?_
  rw [th_uu L hd (unit_pow hx m), MonoidHom.pow_apply, Units.val_pow_eq_pow_val, th_uu L hd hx, map_pow]

theorem th_inj (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x y : Fbar g} (hx : x ^ (g ^ d - 1) = 1)
    (hy : y ^ (g ^ d - 1) = 1) (h : th L hd x = th L hd y) : x = y := by
  have h2 := congrArg (fun θ : (KK g d)ˣ →* ℂˣ => ((θ (uu L hd) : ℂˣ) : ℂ)) h
  simp only [th_uu L hd hx, th_uu L hd hy] at h2
  exact L.teich_inj x y (ne_zero_of hd hx) (ne_zero_of hd hy) h2

theorem th_surj (L : LabelDatum g) {d : ℕ} (hd : 0 < d) (θ : (KK g d)ˣ →* ℂˣ) :
    ∃ x : Fbar g, x ^ (g ^ d - 1) = 1 ∧ θ = th L hd x := by
  have hp := gen_prim L hd
  haveI : NeZero (g ^ d - 1) := ⟨(N_pos' hd).ne'⟩
  have hq : IsPrimitiveRoot (L.teich (L.gen d)) (g ^ d - 1) := by
    refine ⟨by rw [← map_pow, hp.pow_eq_one, map_one], fun l hl => hp.dvd_of_pow_eq_one l ?_⟩
    rw [← map_pow, ← map_one L.teich] at hl
    exact L.teich_inj _ _ (pow_ne_zero _ (ne_zero_of hd hp.pow_eq_one)) one_ne_zero hl
  have h1 : ((θ (uu L hd) : ℂˣ) : ℂ) ^ (g ^ d - 1) = 1 := by
    rw [← Units.val_pow_eq_pow_val, ← map_pow, ← orderOf_uu L hd, pow_orderOf_eq_one, map_one, Units.val_one]
  obtain ⟨m, -, hm⟩ := hq.eq_pow_of_pow_eq_one h1
  refine ⟨L.gen d ^ m, unit_pow hp.pow_eq_one m, th_ext L hd ?_⟩
  rw [th_uu L hd (unit_pow hp.pow_eq_one m), map_pow, hm]

theorem mem_rootsBar_iff {P : (ZMod g)[X]} (hP : P ≠ 0) {x : Fbar g} : x ∈ rootsBar P ↔ aeval x P = 0 := by
  rw [rootsBar, mem_roots (Polynomial.map_ne_zero hP), IsRoot, eval_map, aeval_def]

theorem root_pow {P : (ZMod g)[X]} {x : Fbar g} (hx : aeval x P = 0) (i : ℕ) : aeval (x ^ g ^ i) P = 0 := by
  have := aeval_algHom_apply ((FiniteField.frobeniusAlgHom (ZMod g) (Fbar g)) ^ i) x P
  rw [hx, map_zero] at this
  rw [← this]
  congr 1
  rw [AlgHom.coe_pow, FiniteField.coe_frobeniusAlgHom, pow_iterate, ZMod.card]

theorem pow_inj_lt {P : (ZMod g)[X]} (hP : Irreducible P) {x : Fbar g} (hx : aeval x P = 0) {i j : ℕ}
    (hij : i < j) (hj : j < P.natDegree) : x ^ g ^ i ≠ x ^ g ^ j := fun h => by
  obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_lt hij
  have h2 : (x ^ g ^ i) ^ g ^ (m + 1) = x ^ g ^ i := by
    rw [← pow_mul, ← pow_add, ← add_assoc, ← h]
  have := Nat.le_of_dvd (Nat.succ_pos m) ((pow_eq_self_iff hP (root_pow hx i) _).1 h2)
  omega

theorem pow_inj {P : (ZMod g)[X]} (hP : Irreducible P) {x : Fbar g} (hx : aeval x P = 0) {i j : ℕ}
    (hi : i < P.natDegree) (hj : j < P.natDegree) (h : x ^ g ^ i = x ^ g ^ j) : i = j := by
  rcases lt_trichotomy i j with h1 | h1 | h1
  · exact absurd h (pow_inj_lt hP hx h1 hj)
  · exact h1
  · exact absurd h.symm (pow_inj_lt hP hx h1 hi)

def rootOf (P : (ZMod g)[X]) : Fbar g := if h : ∃ x, x ∈ rootsBar P then h.choose else 1

theorem rootOf_spec {d : ℕ} {P : (ZMod g)[X]} (hP : IsPrimeLab d P) : aeval (rootOf P) P = 0 := by
  have hP0 := hP.2.1.ne_zero
  have hex : ∃ x, x ∈ rootsBar P := by
    obtain ⟨z, hz⟩ := IsAlgClosed.exists_aeval_eq_zero (Fbar g) P (degree_pos_of_irreducible hP.2.1).ne'
    exact ⟨z, (mem_rootsBar_iff hP0).2 hz⟩
  rw [rootOf, dif_pos hex]
  exact (mem_rootsBar_iff hP0).1 hex.choose_spec

theorem root_unit {d : ℕ} {P : (ZMod g)[X]} (hP : IsPrimeLab d P) {x : Fbar g} (hx : aeval x P = 0) :
    x ^ (g ^ d - 1) = 1 := by
  have h1 := (pow_eq_self_iff hP.2.1 hx d).2 (by rw [hP.2.2.2])
  have hx0 : x ≠ 0 := by
    rintro rfl
    exact hP.2.2.1 (by rwa [← coeff_zero_eq_aeval_zero', map_eq_zero] at hx)
  have e : g ^ d = g ^ d - 1 + 1 := (Nat.sub_add_cancel (Nat.one_le_pow _ _ hg.out.pos)).symm
  rw [e, pow_succ] at h1
  exact mul_right_cancel₀ hx0 (h1.trans (one_mul _).symm)

theorem regular_iff (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x : Fbar g} (hx : x ^ (g ^ d - 1) = 1) :
    IsRegularChar g d (th L hd x) ↔ ∀ i j, i < d → j < d → x ^ g ^ i = x ^ g ^ j → i = j := by
  refine forall₄_congr fun i j _ _ => ?_
  rw [← th_pow L hd hx, ← th_pow L hd hx]
  exact ⟨fun h e => h (congrArg (th L hd) e), fun h e => h (th_inj L hd (unit_pow hx _) (unit_pow hx _) e)⟩

theorem sum_range_eq_roots {f : (ZMod g)[X]} (hf : Irreducible f) {z : Fbar g} (hz : aeval z f = 0)
    (F : Fbar g → ℂ) : ∑ i ∈ Finset.range f.natDegree, F (z ^ g ^ i) = ((rootsBar f).map F).sum := by
  rw [rootsBar_eq hf hz, Multiset.map_map, Finset.sum_eq_multiset_sum]
  rfl

theorem thetaOf_pow (L : LabelDatum g) {d : ℕ} (hd : 0 < d) {x w : Fbar g} (hx : x ^ (g ^ d - 1) = 1)
    (hw : w ^ (g ^ d - 1) = 1) (m : ℕ) : thetaOf L d (x ^ m) w = thetaOf L d x (w ^ m) := by
  haveI : NeZero (g ^ d - 1) := ⟨(N_pos' hd).ne'⟩
  obtain ⟨n, -, rfl⟩ := (gen_prim L hd).eq_pow_of_pow_eq_one hw
  rw [thetaOf_gen_pow L hd (unit_pow hx m) n, ← pow_mul, thetaOf_gen_pow L hd hx (n * m), map_pow,
    ← pow_mul, mul_comm m n]

theorem green_of_regular (hG : GreenRegularCharactersFor Cusp) : GreenFor Cusp := by
  intro g hg L d hd
  obtain ⟨τG, h1, h2, h3⟩ := hG g d hd (KK g d) (GaloisField.finrank g hd.ne')
  have hreg : ∀ P, IsPrimeLab d P → IsRegularChar g d (th L hd (rootOf P)) := fun P hP => by
    have hx := rootOf_spec hP
    refine (regular_iff L hd (root_unit hP hx)).2 fun i j hi hj e => ?_
    exact pow_inj hP.2.1 hx (hP.2.2.2 ▸ hi) (hP.2.2.2 ▸ hj) e
  refine ⟨fun P => τG (th L hd (rootOf P)), fun P hP => ?_, fun P P' hP hP' e => ?_, fun χ hχ => ?_⟩
  · obtain ⟨hc, hdeg, hval⟩ := h1 _ (hreg P hP)
    refine ⟨⟨hP, hc, fun x hxP y hy z hz => ?_⟩, hdeg⟩
    set x0 := rootOf P with hx0def
    have hx0 := rootOf_spec hP
    have hx0u := root_unit hP hx0
    set f := (y : Mt g d).charpoly with hfdef
    have hnd : f.natDegree = d := by simp [hfdef]
    have hz' : aeval z f = 0 := (mem_rootsBar_iff hy.ne_zero).1 hz
    have hc0 : f.coeff 0 ≠ 0 := by
      intro h0
      have h1' := Matrix.det_eq_sign_charpoly_coeff (y : Mt g d)
      rw [← hfdef, h0, mul_zero] at h1'
      exact y.det_ne_zero h1'
    have hPf : IsPrimeLab d f := ⟨Matrix.charpoly_monic _, hy, hc0, hnd⟩
    have hzu := root_unit hPf hz'
    obtain ⟨k, hk⟩ := exists_emb_eq hd (pow_self_of hzu)
    have hk0 : k ≠ 0 := by
      rintro rfl
      rw [map_zero] at hk
      exact ne_zero_of hd hzu hk.symm
    have hka : aeval ((Units.mk0 k hk0 : (KK g d)ˣ) : KK g d) f = 0 := by
      refine emb_injective d ?_
      rw [map_zero, Units.val_mk0, ← aeval_algHom_apply, hk, hz']
    show τG (th L hd x0) y = _
    rw [hval y hy _ hka]
    congr 1
    have hxP' : x ∈ (Finset.range P.natDegree).val.map fun i => x0 ^ g ^ i := by
      rw [← rootsBar_eq hP.2.1 hx0]; exact hxP
    obtain ⟨j, -, rfl⟩ := Multiset.mem_map.1 hxP'
    have s1 := sum_range_eq_roots hy hz' (thetaOf L d x0)
    have s2 := sum_range_eq_roots hy (root_pow hz' j) (thetaOf L d x0)
    rw [hnd] at s1 s2
    calc ∑ i ∈ Finset.range d, (((th L hd x0) (Units.mk0 k hk0 ^ g ^ i) : ℂˣ) : ℂ)
        = ∑ i ∈ Finset.range d, thetaOf L d x0 (z ^ g ^ i) := by
          refine Finset.sum_congr rfl fun i _ => ?_
          rw [th_apply L hd hx0u, Units.val_pow_eq_pow_val, map_pow, Units.val_mk0, hk]
      _ = ∑ i ∈ Finset.range d, thetaOf L d x0 ((z ^ g ^ j) ^ g ^ i) := s1.trans s2.symm
      _ = ∑ i ∈ Finset.range d, thetaOf L d (x0 ^ g ^ j) (z ^ g ^ i) := by
          refine Finset.sum_congr rfl fun i _ => ?_
          rw [thetaOf_pow L hd hx0u (unit_pow hzu _), ← pow_mul, ← pow_mul, mul_comm]
  · have hx := rootOf_spec hP
    have hx' := rootOf_spec hP'
    obtain ⟨i, -, hi⟩ := (h2 _ _ (hreg P hP) (hreg P' hP')).1 e
    rw [← th_pow L hd (root_unit hP hx)] at hi
    have hxe := th_inj L hd (root_unit hP' hx') (unit_pow (root_unit hP hx) _) hi
    have hr : aeval (rootOf P') P = 0 := by rw [hxe]; exact root_pow hx i
    exact (minpoly.eq_of_irreducible_of_monic hP.2.1 hr hP.1).trans
      (minpoly.eq_of_irreducible_of_monic hP'.2.1 hx' hP'.1).symm
  · obtain ⟨θ, hθ, rfl⟩ := h3 χ hχ
    obtain ⟨x, hx, rfl⟩ := th_surj L hd θ
    have hreg' := (regular_iff L hd hx).1 hθ
    have hint : IsIntegral (ZMod g) x := Algebra.IsIntegral.isIntegral x
    set P := minpoly (ZMod g) x with hPdef
    have hPirr : Irreducible P := minpoly.irreducible hint
    have hPx : aeval x P = 0 := minpoly.aeval _ _
    have hkd : P.natDegree ∣ d := (pow_eq_self_iff hPirr hPx d).1 (pow_self_of hx)
    have hkpos : 0 < P.natDegree := minpoly.natDegree_pos hint
    have hself : x ^ g ^ P.natDegree = x := (pow_eq_self_iff hPirr hPx _).2 dvd_rfl
    have hk : P.natDegree = d := by
      refine le_antisymm (Nat.le_of_dvd hd hkd) (not_lt.1 fun hlt => ?_)
      have := hreg' _ 0 hlt hd (by rw [pow_zero, pow_one]; exact hself)
      omega
    have hPL : IsPrimeLab d P :=
      ⟨minpoly.monic hint, hPirr, minpoly.coeff_zero_ne_zero hint (ne_zero_of hd hx), hk⟩
    refine ⟨P, hPL, ?_⟩
    have hm : rootOf P ∈ (Finset.range P.natDegree).val.map fun i => x ^ g ^ i := by
      rw [← rootsBar_eq hPirr hPx]
      exact (mem_rootsBar_iff hPirr.ne_zero).2 (rootOf_spec hPL)
    obtain ⟨j, hj, hjx⟩ := Multiset.mem_map.1 hm
    have hj' : j < d := hk ▸ Finset.mem_range.1 (Finset.mem_def.2 hj)
    show τG (th L hd x) = τG (th L hd (rootOf P))
    exact (h2 _ _ hθ (hreg P hPL)).2 ⟨j, hj', by rw [← hjx, th_pow L hd hx]⟩


end Bridge

/-- Exact upstream composition used on the RH path: `green_of_regular greenRegularCharacters_holds`,
conditional on the four exhaustion dependencies, with verbatim `IsCusp`. -/
theorem green_of_deps (hEx : ExistsPart (fun χ => IsCusp χ)) (hInj : InjectPart)
    (hCard : CardPart (fun χ => IsCusp χ)) (hPoly : PolyPart) : GreenFor (fun χ => IsCusp χ) :=
  green_of_regular _ (greenRegularCharacters_holds_of_deps hEx hInj hCard hPoly)

end GreenCompanion

#print axioms GreenCompanion.green_of_regular
#print axioms GreenCompanion.green_of_deps

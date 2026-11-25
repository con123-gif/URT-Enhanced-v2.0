import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.ThmBabOf
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Klen
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Kexp
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Logs
import Formalism.GaloisCohomology.GaloisCohomologyProofs.LdataNonempty
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win

/-!
RUN35 structure, 25 November 2026. SOURCE-MATCHED / PREPARED, NOT compiled.
Mission blob cd0a176134d46b5b624896e56843a24915c14477, source pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Sources under src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/:
PartB.lean, ThmBabOf.lean, SecondBound.lean, Exc.lean, Kexp.lean, Klen.lean, Point2.lean. Source blob pins checked in connector.
Prior RUN34 842611bb (two-prime branch); peer dc06e2cf (generator correction),
bb971bc3 (linked rigidity), 904a3009 (fibre mass), 1d03f804 (Landau replay).
Read mission, protocol, AGENTS, handoff, state excerpts and prior checkpoint.

EDITOR BLOCK: For the odd-prime branch PartB, the native point2 invocation
uses the SAME fixed field L2 at BOTH layer arguments, with m=j0.
Thus R*(m-j0)_+ = 0 and max(m,j0)=j0 exactly. Choose L2 and D once,
before choosing cutoff Z. For each Z, it is sufficient to find Exc of
cardinality <=R such that for 1<=e<=Z:
  outside Exc: shaInv(L2,l,e) <= R*(j0+c+floor(log_l Z));
  inside Exc: shaInv(L2,l,e) <= VLen(D,e).
No transfer between different layers or different closures is needed
in this branch. The native ABound implies both via exc and specialization.
For x in the native window, log_l Z <= 2 Ct J log x and Good bounds
exceptional e <= x^(eps/(2 CK)); klen and kexp give the exceptional
bound 2 exp((2 n)^CK c0 x^(3 eps/4)). One common C =
R*(j0+c+2 Ct J)+1+(2 n)^CK c0 absorbs both cases in ptBound.
Keep abiso, layeriso, shaInv_congr and vvat, plus all same-host
and window guards. c, D, L2 are fixed before Z. PartA remains unchanged.
This is a strictly reduced interface in quantified data, not a proof
of strict logical separation among real fields or of OddFixedIn13.
Possible next supplier: PTShaAt (odd l) identifies shaLen with the
length of Sha2Zl submodule of H2; then same-field monotonicity gives
the exception bound. Not assumed proved here; inspect actual PT source.

Original source-visible graph thmBab_of -> partB -> point2 -> point ->
SecondBound + FirstBound + klen/kexp; partB -> exc,layerex,abiso,
layeriso,shaInv_congr,vvat. Reduced consumer thmBab_of_fixed13 ->
partB_fixed13 -> OddFixedBudget13 + klen/kexp/logs + same transport
and vvat. Original bridge retains exc,layerex,SecondBound; PartA and
other consumers untouched. All original graphs and pending elaborated
value/type/constructor/axiom evidence remain intact. Context key:
pin/toolchain, l,R,A,L0,L2,D,c,Z,Exc,CK,J,Ct,eps,x, target field
and algebra maps; never cache across fields. No global retirement.

Executed 38 source-pin, unique/reversible transformation and
caller checks; 90000 exact integer identities for the two
specializations (not number-field evidence). FirstBound.lean guessed
path 404; actual definition is SecondBound.lean. GitHub search for
PTShaAt returned no result, so no duality closure asserted. Local
lean/lake absent. Baseline status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 pass only prior engine
checks. Latest Landau repair status 43a439847e030afb4d5563e30df51399fcbc78d8
is ERROR, not PASS. New candidate not queued or checked; no new
kernel-closed root obligations. No URT advantage asserted.
RESUME HERE: batch this with RUN34; first check OddFixedBudget13
bridge and actual partB/thmBab caller, then derive fixed-layer
nonexceptional budget and local PTShaAt at same D. Preserve all
unresolved upstream arithmetic/geometric VWinAt(1,401).
HANDOFF TO kernel, Galois, audit, integration. RH OPEN.
-/

private theorem exists_isPrimitiveRoot_of_hasMu_of_isAbField13 (A : AbF) (l : ℕ) [Fact l.Prime] (hA : A.HasMu l) (L : Type) [Field L]
    [NumberField L] (hL : IsAbField A L) : ∃ ζ : L, IsPrimitiveRoot ζ l := by
  obtain ⟨N, hN, j, ζ, h1, h2, h3⟩ := hL
  obtain ⟨k, hk⟩ := hA.1.trans h1
  have hz : IsPrimitiveRoot (ζ ^ k) l := h2.pow (NeZero.pos N) (by rw [hk, mul_comm])
  have key : ζ ^ k ∈ IntermediateField.fixedField (IntermediateField.fixingSubgroup j.fieldRange) := by
    rintro ⟨τ, hτ⟩
    rw [IntermediateField.mem_fixingSubgroup_iff] at hτ
    obtain ⟨a, -, ha⟩ := h2.eq_pow_of_pow_eq_one
      (show (τ ζ) ^ N = 1 by rw [← map_pow, h2.pow_eq_one, map_one])
    have hker := (h3 τ a ha.symm).mp (fun x => hτ (j x) ⟨x, rfl⟩)
    have hmod := hA.2 a hker
    show τ (ζ ^ k) = ζ ^ k
    rw [map_pow, ← ha, ← pow_mul]
    have ha1 : 1 ≤ a := by
      rcases Nat.eq_zero_or_pos a with h | h
      · subst h
        have hl1 : l ∣ 1 := Nat.modEq_zero_iff_dvd.mp hmod.symm
        exact absurd (Nat.le_of_dvd one_pos hl1) (not_le.mpr (Fact.out : l.Prime).one_lt)
      · exact h
    obtain ⟨q, hq⟩ := (Nat.modEq_iff_dvd' ha1).mp hmod.symm
    have ha' : a = l * q + 1 := (Nat.sub_eq_iff_eq_add ha1).mp hq
    calc ζ ^ (a * k) = ζ ^ (k + N * q) := by
          congr 1
          rw [ha', hk]
          ring
      _ = ζ ^ k := by rw [pow_add, pow_mul, h2.pow_eq_one, one_pow, mul_one]
  haveI : IsGalois ℚ (CyclotomicField N ℚ) :=
    IsCyclotomicExtension.isGalois (S := {N}) (K := ℚ) (L := CyclotomicField N ℚ)
  rw [IsGalois.fixedField_fixingSubgroup] at key
  obtain ⟨y, hy⟩ := key
  refine ⟨y, ?_⟩
  rw [← hy] at hz
  exact (IsPrimitiveRoot.map_iff_of_injective j.toRingHom.injective).mp hz



namespace UpperTheory.V.Win

def OddFixedBudget13 (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] : Prop :=
  ∃ (L₂ : Type) (_ : Field L₂) (_ : NumberField L₂) (_ : Algebra L₀ L₂),
    IsLayer l (jZero l R) L₀ L₂ ∧ HasMuQ l L₂ ∧
    ∃ (D : LData L₂ (AlgebraicClosure L₂) l) (c : ℕ),
      ∀ Z : ℕ, ∃ Exc : Finset ℕ, Exc.card ≤ R ∧
        (∀ e : ℕ, 1 ≤ e → e ≤ Z → e ∉ Exc →
          shaInv L₂ l e ≤ ((R * (jZero l R + c + Nat.log l Z) : ℕ) : ℕ∞)) ∧
        (∀ e : ℕ, e ∈ Exc → 1 ≤ e → e ≤ Z → shaInv L₂ l e ≤ VLen D e)

def OddFixedIn13 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ A : AbF, A.HasMu l →
    ∀ (L₀ : Type) [Field L₀] [NumberField L₀], IsAbField A L₀ →
      ∃ R : ℕ, OddFixedBudget13 l R L₀

theorem ab_to_odd_fixed13 (l R : ℕ) [Fact l.Prime] (hl2 : l ≠ 2)
    (A : AbF) (hA : A.HasMu l) (L₀ : Type) [Field L₀] [NumberField L₀]
    (hL₀ : IsAbField A L₀) (hAB : ABound l R L₀) : OddFixedBudget13 l R L₀ := by
  have hmu0 : HasMuQ l L₀ := by
    obtain ⟨ζ, hζ⟩ := exists_isPrimitiveRoot_of_hasMu_of_isAbField13 A l hA L₀ hL₀
    exact ⟨ζ, by rw [if_neg hl2]; exact hζ⟩
  obtain ⟨L₂, _, _, _, hL₂⟩ := layerex l (jZero l R) Fact.out L₀ hmu0
  have hmu2 : HasMuQ l L₂ := by
    obtain ⟨ζ, hζ⟩ := hmu0
    exact ⟨algebraMap L₀ L₂ ζ, hζ.map_of_injective (algebraMap L₀ L₂).injective⟩
  obtain ⟨D⟩ := ldata_nonempty (F := L₂) (Ω := AlgebraicClosure L₂) l
  obtain ⟨c, -, hc⟩ := exc l R L₀ hAB
  refine ⟨L₂, inferInstance, inferInstance, inferInstance, hL₂, hmu2, D, c, ?_⟩
  intro Z
  obtain ⟨Exc, hF⟩ := hc Z
  refine ⟨Exc, hF.1, ?_, ?_⟩
  · intro e he heZ hn
    simpa only [max_self] using hF.2 e he heZ hn (jZero l R) L₂ hL₂
  · intro e _ he _
    simpa only [Nat.sub_self, Nat.mul_zero, Nat.cast_zero, add_zero] using
      hAB.2 e he (jZero l R) L₂ hL₂ L₂ hL₂ (AlgebraicClosure L₂) D

theorem fixedIn_to_odd_fixed13 (h : FixedIn) : OddFixedIn13 := by
  intro l _ hl2 A hA L₀ _ _ hL₀
  obtain ⟨R, hAB⟩ := h l hl2 A hA L₀ hL₀
  exact ⟨R, ab_to_odd_fixed13 l R hl2 A hA L₀ hL₀ hAB⟩

end UpperTheory.V.Win

theorem UpperTheory.V.Win.partB_fixed13 :
    ∀ CK : ℝ, 0 < CK → LemmaK CK → ∀ (l R : ℕ) [Fact l.Prime], l ≠ 2 → ∀ A : AbF, A.HasMu l →
      ∀ (L₀ : Type) [Field L₀] [NumberField L₀], IsAbField A L₀ → OddFixedBudget13 l R L₀ →
        ∀ J Ct eps A1 : ℝ, 0 < J → 0 ≤ Ct → 0 < eps → ∃ x0 : ℝ, ∀ e t : ℝ → ℕ, admitted A1 Ct e t → ∀ X : ℝ,
          ∃ Exc : Finset ℕ, Exc.card ≤ R ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            ∀ (L₀' : Type) [Field L₀'] [NumberField L₀'], IsAbField A L₀' →
              ∀ (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀' L₁], IsLayer l (jZero l R) L₀' L₁ →
                VVat l L₁ (t x) (Real.exp (x ^ (4 * eps / 5))) := by
  intro CK hCK hK l R _ hl2 A hA L₀ _ _ hL₀ hAB J Ct eps A1 hJ hCt heps
  obtain ⟨L₂, _, _, _, hL₂, hmu2, D, c, hc⟩ := hAB
  let n := Module.finrank ℚ L₂
  let c0 := Real.log (2 * ((NumberField.discr L₂).natAbs : ℝ))
  have hc0 : 0 ≤ c0 := by
    dsimp [c0]
    apply Real.log_nonneg
    have : (1 : ℝ) ≤ ((NumberField.discr L₂).natAbs : ℝ) :=
      Nat.one_le_cast.mpr (Int.natAbs_pos.mpr (NumberField.discr_ne_zero L₂))
    linarith
  let C : ℝ := (R : ℝ) * ((jZero l R : ℝ) + c + 2 * Ct * J) + 1 +
    (2 * (n : ℝ)) ^ CK * c0
  have hC : 0 ≤ C := by dsimp [C]; positivity
  obtain ⟨x1, hx1two, hx1⟩ := final Ct eps C heps
  refine ⟨x1, fun e t hAdm X => ?_⟩
  obtain ⟨Exc, hcard, hfar, hnear⟩ := hc ⌊X ^ Ct⌋₊
  refine ⟨Exc, hcard, fun x hx hXx hxX hgood L₀' _ _ hL₀' L₁ _ _ _ hL₁ => ?_⟩
  obtain ⟨f0⟩ := abiso A L₀ L₀' hL₀ hL₀'
  obtain ⟨f1⟩ := layeriso l (jZero l R) Fact.out L₀ L₀' L₂ L₁ ⟨f0⟩ hL₂ hL₁
  have hx1' : (1 : ℝ) ≤ x := by linarith
  have hadm := hAdm x (by linarith)
  have hQ : ∀ e' : ℕ, 1 ≤ e' → (e' : ℝ) ≤ x ^ Ct →
      shaInv L₂ l e' ≠ ⊤ ∧ ((shaInv L₂ l e').toNat : ℝ) + 1 ≤ ptBound C eps x := by
    intro e' he1 he2
    have hX : 1 ≤ X := hx1'.trans hxX
    have heZ : e' ≤ ⌊X ^ Ct⌋₊ :=
      Nat.le_floor (he2.trans (Real.rpow_le_rpow (by linarith) hxX hCt))
    have hL : 0 ≤ Real.log x := Real.log_nonneg hx1'
    have hlog := UpperTheory.V.Win.logs.1 l J Ct X x (Fact.out : l.Prime).two_le hJ hCt hX hXx
    have hpow : 0 ≤ x ^ (3 * eps / 4) := by positivity
    have hB : 0 ≤ (2 * (n : ℝ)) ^ CK * c0 := by positivity
    have hCJ : 0 ≤ 2 * Ct * J := by positivity
    have hR : 0 ≤ (R : ℝ) := by positivity
    have hj : 0 ≤ (jZero l R : ℝ) + c := by positivity
    have hC1 : 1 ≤ C := by
      dsimp [C]
      nlinarith [mul_nonneg hR (show 0 ≤ (jZero l R : ℝ) + c + 2 * Ct * J by linarith)]
    have hlin : 1 ≤ C * (1 + Real.log x) := by nlinarith
    by_cases hmem : e' ∈ Exc
    · have hg := hgood e' hmem he2
      obtain ⟨hv, hvb⟩ := klen CK hK l L₂ (AlgebraicClosure L₂) D hmu2 e' he1
      have hkb := kexp CK eps c0 x e' n n (discr L₂).natAbs hCK heps hc0 hx1' hg le_rfl
        (le_mul_of_one_le_right hc0 (Real.one_le_rpow hx1' (by positivity)))
      have hs := hnear e' hmem he1 heZ
      have hst : shaInv L₂ l e' ≠ ⊤ := ne_top_of_le_ne_top hv hs
      have hsN : (shaInv L₂ l e').toNat ≤ (VLen D e').toNat := by
        generalize shaInv L₂ l ↑e' = s at hs hst ⊢
        generalize VLen D ↑e' = v at hs hv ⊢
        lift s to ℕ using hst
        lift v to ℕ using hv
        simpa only [ENat.toNat_coe] using (show s ≤ v by exact_mod_cast hs)
      have hsR : ((shaInv L₂ l e').toNat : ℝ) ≤ ((VLen D e').toNat : ℝ) := by exact_mod_cast hsN
      have hE : Real.exp ((2 * (n : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) ≤
          Real.exp (C * x ^ (3 * eps / 4)) := by
        apply Real.exp_le_exp.mpr
        apply mul_le_mul_of_nonneg_right _ hpow
        dsimp [C]
        nlinarith [mul_nonneg hR (show 0 ≤ (jZero l R : ℝ) + c + 2 * Ct * J by linarith)]
      refine ⟨hst, ?_⟩
      unfold ptBound
      linarith
    · have hs := hfar e' he1 heZ hmem
      generalize shaInv L₂ l ↑e' = s at hs ⊢
      have hst : s ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) hs
      lift s to ℕ using hst
      have hsN : s ≤ R * (jZero l R + c + Nat.log l ⌊X ^ Ct⌋₊) := by exact_mod_cast hs
      have hsR : (s : ℝ) ≤ (R : ℝ) * (jZero l R + c + Nat.log l ⌊X ^ Ct⌋₊) := by exact_mod_cast hsN
      have hin : (jZero l R : ℝ) + c + Nat.log l ⌊X ^ Ct⌋₊ ≤
          ((jZero l R : ℝ) + c + 2 * Ct * J) * (1 + Real.log x) := by
        nlinarith [mul_nonneg hj hL]
      have hm := mul_le_mul_of_nonneg_left hin hR
      have hA : (R : ℝ) * ((jZero l R : ℝ) + c + 2 * Ct * J) + 1 ≤ C := by
        dsimp [C]; linarith
      have hM := mul_le_mul_of_nonneg_right hA (show 0 ≤ 1 + Real.log x by linarith)
      refine ⟨ENat.coe_ne_top s, ?_⟩
      rw [ENat.toNat_coe]
      unfold ptBound
      linarith [Real.exp_pos (C * x ^ (3 * eps / 4))]
  have hb : 0 ≤ ptBound C eps x := by
    have := (hQ 1 le_rfl (by simpa using Real.one_le_rpow hx1' hCt)).2
    have : (0 : ℝ) ≤ ((shaInv L₂ l 1).toNat : ℝ) := Nat.cast_nonneg _
    linarith
  refine vvat l (t x) L₁ (x ^ Ct) (ptBound C eps x) _ hb hadm.2.2.2 (hx1 x hx) ?_
  intro e' he1 he2
  rw [← shaInv_congr f1]
  have h := hQ e' he1 (le_trans (by exact_mod_cast he2.le) hadm.2.2.2)
  exact ⟨h.1, by linarith [h.2]⟩

theorem UpperTheory.V.Win.thmBab_of_fixed13 :
    (∃ CK : ℝ, LemmaK CK) → OddFixedIn13 → TwoIn → ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
  rintro ⟨CK0, hK0⟩ hF hT
  classical
  have hCK1 : (1 : ℝ) ≤ max CK0 1 := le_max_right _ _
  have hCKpos : (0 : ℝ) < max CK0 1 := lt_of_lt_of_le one_pos hCK1
  have hK : LemmaK (max CK0 1) := kmono CK0 _ (le_max_left _ _) hK0
  let P : ℕ → AbF → ℕ → Prop := fun l A R =>
    ∃ (_ : Fact l.Prime) (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), IsAbField A L₀ ∧ OddFixedBudget13 l R L₀
  let R0 : AbF → ℕ := fun M => Classical.choose (hT M)
  let Rl : ℕ → AbF → ℕ := fun l A => if h : ∃ R, P l A R then Classical.choose h else 0
  refine ⟨BConst.mk R0 Rl (max CK0 1) hCKpos, fun Ct hCt => ?_⟩
  unfold ThmBab BShape IsBWindow
  intro M B' L hAux eps A1 heps heps'
  unfold OddPrimesWithRootsOfUnity at hAux
  have hCt0 : 0 < Ct := lt_of_lt_of_le one_pos hCt
  set CK : ℝ := max CK0 1 with hCKdef
  set R : ℕ := R0 M + ∑ l ∈ B', Rl l (L l) with hRdef
  set J : ℝ := 2 ^ (R + 2) * (2 * CK * Ct / eps) ^ R with hJdef
  have hJpos : 0 < J := by
    have : 0 < 2 * CK * Ct / eps := by positivity
    positivity
  obtain ⟨x0A, hA⟩ := partA CK hCKpos hK M (R0 M) J Ct eps A1 hJpos hCt0.le heps
  have hB : ∀ l ∈ B', ∃ x0 : ℝ, ∀ e t, admitted A1 Ct e t → ∀ X : ℝ, ∃ Exc : Finset ℕ,
      Exc.card ≤ Rl l (L l) ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
        ∀ (_ : Fact l.Prime) (L₀' : Type) [Field L₀'] [NumberField L₀'], IsAbField (L l) L₀' →
          ∀ (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀' L₁],
            IsLayer l (Nat.log l (Rl l (L l)) + 3) L₀' L₁ → VVat l L₁ (t x) (Real.exp (x ^ (4 * eps / 5))) := by
    intro l hl
    obtain ⟨hp, hl2, hmu⟩ := hAux l hl
    haveI : Fact l.Prime := ⟨hp⟩
    by_cases hex : ∃ (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), IsAbField (L l) L₀
    · obtain ⟨L₀, _, _, hab⟩ := hex
      have hP : ∃ R, P l (L l) R := by
        obtain ⟨R', hR'⟩ := hF l hl2 (L l) hmu L₀ hab
        exact ⟨R', ⟨_, L₀, _, _, hab, hR'⟩⟩
      have hRl : Rl l (L l) = Classical.choose hP := by
        show (if h : ∃ R, P l (L l) R then Classical.choose h else 0) = _
        rw [dif_pos hP]
      obtain ⟨_, L₀₀, _, _, hab0, hR0⟩ := Classical.choose_spec hP
      obtain ⟨x0, hx0⟩ := partB_fixed13 CK hCKpos hK l (Classical.choose hP) hl2 (L l) hmu L₀₀ hab0 hR0
        J Ct eps A1 hJpos hCt0.le heps
      refine ⟨x0, fun e t hAdm X => ?_⟩
      obtain ⟨Exc, hcard, hx⟩ := hx0 e t hAdm X
      refine ⟨Exc, hRl ▸ hcard, fun x hxx hlo hhi hg _ L₀' _ _ hab' L₁ _ _ _ hlay => ?_⟩
      rw [hRl] at hlay
      exact hx x hxx hlo hhi hg L₀' hab' L₁ hlay
    · refine ⟨0, fun e t _ X => ⟨∅, by simp, ?_⟩⟩
      intro x _ _ _ _ _ L₀' _ _ hab' _ _ _ _ _
      exact absurd ⟨L₀', _, _, hab'⟩ hex
  choose! f hf using hB
  set x1 : ℝ := max 1 (max x0A (∑ l ∈ B', |f l|)) with hx1def
  have hfle : ∀ l ∈ B', f l ≤ x1 := fun l hl =>
    (le_abs_self _).trans ((Finset.single_le_sum (fun i _ => abs_nonneg (f i)) hl).trans
      ((le_max_right _ _).trans (le_max_right _ _)))
  have hx0A : x0A ≤ x1 := (le_max_left _ _).trans (le_max_right _ _)
  have hx1pos : 0 ≤ x1 := zero_le_one.trans (le_max_left _ _)
  refine ⟨max 2 (x1 ^ J), fun e t hAdm X hX q d hqd hlog => ?_⟩
  have hX2 : 2 ≤ X := (le_max_left _ _).trans hX
  have hXJ : x1 ^ J ≤ X := (le_max_right _ _).trans hX
  have hlow : x1 ≤ X ^ (1 / J) := by
    calc x1 = (x1 ^ J) ^ (1 / J) := by
          rw [← Real.rpow_mul hx1pos, mul_one_div_cancel hJpos.ne', Real.rpow_one]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hx1pos _) hXJ (by positivity)
  obtain ⟨L₀, _, _, hTB, hAB⟩ := Classical.choose_spec (hT M) q d hqd
  obtain ⟨ExcA, hcardA, hxA⟩ := hA e t hAdm X q d hqd hlog L₀ hTB hAB
  have hB2 := fun l hl => hf l hl e t hAdm X
  choose! g hg using hB2
  have hcard : (ExcA ∪ B'.biUnion g).card ≤ R :=
    (Finset.card_union_le _ _).trans (add_le_add hcardA
      (Finset.card_biUnion_le.trans (Finset.sum_le_sum fun l hl => (hg l hl).1)))
  have heta : 0 < eps / (2 * CK) := by positivity
  have hetaCt : eps / (2 * CK) ≤ Ct := by
    have h1 : eps / (2 * CK) ≤ 1 := by
      rw [div_le_one (by positivity)]
      linarith
    linarith
  obtain ⟨Y, hY, hgood⟩ := window R (eps / (2 * CK)) Ct X (ExcA ∪ B'.biUnion g) heta hetaCt
    (by linarith) hcard
  have hJeq : (2 : ℝ) ^ (R + 2) * (Ct / (eps / (2 * CK))) ^ R = J := by
    rw [hJdef, show Ct / (eps / (2 * CK)) = 2 * CK * Ct / eps by rw [div_div_eq_mul_div]; ring]
  rw [hJeq] at hY
  refine ⟨Y, hY, fun x hYx hxY => ?_⟩
  have hG := hgood x hYx hxY
  have hXlo : X ^ (1 / J) ≤ x := hY.1.trans hYx
  have hXhi : x ≤ X := hxY.trans hY.2
  have hGsub : ∀ S ⊆ ExcA ∪ B'.biUnion g, Good (eps / (2 * CK)) Ct S x :=
    fun S hS n hn => hG n (hS hn)
  refine ⟨hxA x (hx0A.trans (hlow.trans hXlo)) hXlo hXhi (hGsub _ Finset.subset_union_left), ?_⟩
  unfold BbAt
  intro l hl _ L₀' _ _ hab L₁ _ _ _ hlay
  exact (hg l hl).2 x ((hfle l hl).trans (hlow.trans hXlo)) hXlo hXhi
    (hGsub _ ((Finset.subset_biUnion_of_mem g hl).trans Finset.subset_union_right)) _ L₀' hab L₁ hlay


example (h : FixedIn) : OddFixedIn13 := by
  first | rh_reduce 3 using [fixedIn_to_odd_fixed13] | exact fixedIn_to_odd_fixed13 h
example (h : FixedIn) : OddFixedIn13 := by
  first | rh_auto 3 | exact fixedIn_to_odd_fixed13 h
example (h : FixedIn) : OddFixedIn13 := by
  rh_auto_frontier 2
  all_goals exact fixedIn_to_odd_fixed13 h

#print axioms UpperTheory.V.Win.partB
#print axioms UpperTheory.V.Win.ab_to_odd_fixed13
#print axioms UpperTheory.V.Win.fixedIn_to_odd_fixed13
#print axioms UpperTheory.V.Win.partB_fixed13
#print axioms UpperTheory.V.Win.thmBab_of_fixed13
rh_scan UpperTheory.V.Win.partB limit 2000
rh_scan UpperTheory.V.Win.partB_fixed13 limit 2000
rh_scan UpperTheory.V.Win.thmBab_of_fixed13 limit 2000
rh_prune UpperTheory.V.Win.partB_fixed13 as RH13PartBFixedPruned

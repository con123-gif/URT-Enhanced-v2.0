import Mathlib
import Formalism.GaloisCohomology.GaloisCohomologyProofs.LdataNonempty
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.SecondBound
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Klen
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Kexp
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Exc
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Layerex
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Layerdisc
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Rootdeg
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Point2
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Logs
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Vvat
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Final
import Development.AutomorphicArithmetic.AutomorphicVarieties.CMFieldExponentialBounds.ExistsNumberFieldIsAbFieldFinrankEqDeg
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Window
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Kmono
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.PartA
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.PartB
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win

/-!
# RUN34 structure: actual same-host PartA exception-only transfer
25 Nov 2026. SOURCE-MATCHED / PREPARED; NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission cd0a176134d46b5b624896e56843a24915c14477 read first; SWARM, AGENTS, HANDOFF, living proof 464e82f81f646d4af85e1f5f70d379026df46261 and state/log/protocol (long files partly) inspected. RUN33 8b54a1ab; latest peer 027167d4, 12705f08, 841814dc, 1a1774df examined. This is native VWinAt arithmetic, not new Landau criterion.
Source paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/:
SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
ImportsAlt.lean ef9122254fb295f15e9f01d9512d70a26e6f6884
Point2.lean 977e6ed246ef1343d9bf537ea845a5565528c0ae
PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a
ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff
Exc.lean d0d49933faebf73a8162c153b8115139e36efa82
Rootdeg.lean 2750da1a064db043df31e00fd7d0b3cbfde405c0

EDITOR BLOCK. Fix the SAME L0, prime l, R and cutoff Z. The native
FirstBound supplies Exc with |Exc|<=R and for 1<=e<=Z outside Exc,
shaInv(L1,l,e) <= R(max(m,j0)+c+floor(log_l Z)).
Inside Exc only, use SecondBound's transfer to the fixed layer L2,
shaInv(L1,l,e)<=VLen(D,e)+R(m-j0)_+.
The native Good condition makes e<=x^(eps/(2CK)) there, so klen and
kexp yield the existing exp bound. Thus the global SecondBound is
unnecessary for all nonexceptional e; no SecondBound claim is needed
outside the cutoff either. Only the conditional exceptional transfer
on 1<=e<=Z, e in Exc is used in point. This is exact case separation,
not uniform pointwise extrapolation. In PartA c may vary with cutoff Z
provided c<=16*M.deg (fixed independent of q,d,X); the original
ABound produces this via exc and rootdeg. A direct first-bound producer
need not supply its p-adic center representation. All actual L0,
TwoBase, auxiliary L1,L2, degree/discriminant and layer conditions,
L0->L2 root transport, LemmaK and exact window quantifiers retained.
The candidate TwoIn13 is weaker as an interface (old TwoIn implies it;
no assertion of strict logical separation for actual number fields).
It suffices at the actual thmBab_of caller, with the entire original
output unchanged and PartB untouched. This does not establish TwoIn13.

Original source-visible local graph: thmBab_of -> partA -> point2 -> point;
partA -> exc,rootdeg,layerdisc,layerex,vvat,final; point -> FirstBound,
SecondBound,klen,kexp. New graph: thmBab_of_split13 -> partA_split13 ->
point2_split13 -> point_split13; point_split13 -> FirstBound,
SecondBoundOn13,klen,kexp; partA_split13 -> SplitABound13, layerdisc,
layerex,vvat,final; bridge TwoIn -> TwoIn13 uses exc,rootdeg,SecondBound.
Old graph remains fallback; no claim exc/rootdeg or SecondBound
removed from original root or PartB. All pending kernel/type/constructor
and axiom edges remain pending. Context key pin, toolchain, M,q,d,L0,R,
Z,Exc,c,CK,J,Ct,eps,e,m,L1,L2,D; no cache across hosts/cutoffs.

Executed 45 exact source SHA, unique edit, reversible edit and
actual guard/caller checks in connector JS. Missing guessed Point.lean
and Kexp path attempts returned 404; point actually in ImportsAlt.
Local shell has no lean/lake. Baseline CI statuses 45577239749 and
45576756833 retrieved, status pass / returncode 0; only older engines
and conditional root checked there, no new candidate validation.
No URT advantage, no root obligation retired; native commands below
are for replay only. No test of new number-field assertions claimed.

RESUME HERE: add this exact overlay to native RUN34 batch (12705f08),
check all four actual caller replacements and original bridge axiom
ledgers. Then attack the finite FirstBound and restricted SecondBoundOn13
suppliers directly at the SAME host, retaining uniform R and c1.
HANDOFF TO kernel/integration/audit/Galois. No schedule/workflow changes.
-/

namespace UpperTheory.V.Win

def SecondBoundOn13 (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀]
    (Z : ℕ) (Exc : Finset ℕ) : Prop :=
  ∀ e : ℕ, e ∈ Exc → 1 ≤ e → e ≤ Z →
    ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
    ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ →
      ∀ (Ω : Type) [Field Ω] [Algebra L₂ Ω] [IsAlgClosure L₂ Ω] (D : LData L₂ Ω l),
        shaInv L₁ l e ≤ VLen D e + ((R * (m - jZero l R) : ℕ) : ℕ∞)

def SplitABound13 (l R c1 : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] : Prop :=
  ∀ Z : ℕ, ∃ c : ℕ, c ≤ c1 ∧ ∃ Exc : Finset ℕ,
    FirstBound l R c L₀ Z Exc ∧ SecondBoundOn13 l R L₀ Z Exc

def TwoIn13 : Prop :=
  ∀ M : AbF, ∃ R : ℕ, ∀ q d : ℕ, PrimePair M.m q d →
    ∃ (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀),
      TwoBase M q d L₀ ∧ SplitABound13 2 R (16 * M.deg) L₀

theorem secondBound_restrict13 {l R : ℕ} [Fact l.Prime] {L₀ : Type} [Field L₀]
    {Z : ℕ} {Exc : Finset ℕ} (h : SecondBound l R L₀) :
    SecondBoundOn13 l R L₀ Z Exc := by
  intro e _ he _ m L₁ _ _ _ h₁ L₂ _ _ _ h₂ Ω _ _ _ D
  exact h e he m L₁ h₁ L₂ h₂ Ω D

theorem twoIn_to_split13 (h : TwoIn) : TwoIn13 := by
  intro M
  obtain ⟨R, hR⟩ := h M
  refine ⟨R, ?_⟩
  intro q d hqd
  obtain ⟨L₀, _, _, hTB, hAB⟩ := hR q d hqd
  refine ⟨L₀, inferInstance, inferInstance, hTB, ?_⟩
  obtain ⟨c, hζ, hZ⟩ := exc 2 R L₀ hAB
  have hc : c ≤ 16 * M.deg := by
    have h1 := rootdeg L₀ 2 c Nat.prime_two hζ
    have h2 : c < 2 ^ c := Nat.lt_two_pow_self
    have hf := hTB.2.1
    omega
  intro Z
  obtain ⟨Exc, hExc⟩ := hZ Z
  exact ⟨c, hc, Exc, hExc, secondBound_restrict13 hAB.2⟩

end UpperTheory.V.Win

theorem UpperTheory.V.Win.point_split13 :
    ∀ CK : ℝ, 0 < CK → LemmaK CK → ∀ (l R c : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀], HasMuQ l L₀ →
      ∀ (Z : ℕ) (Exc : Finset ℕ), SecondBoundOn13 l R L₀ Z Exc → FirstBound l R c L₀ Z Exc →
        ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ →
          ∀ (eps Ct c0 x : ℝ) (n0 : ℕ), 0 < eps → 0 ≤ c0 → 1 ≤ x → Good (eps / (2 * CK)) Ct Exc x →
            Module.finrank ℚ L₂ ≤ n0 → Real.log (2 * ((discr L₂).natAbs : ℝ)) ≤ c0 * x ^ (eps / 4) →
            ∀ e : ℕ, 1 ≤ e → e ≤ Z → (e : ℝ) ≤ x ^ Ct →
              ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
                shaInv L₁ l e ≠ ⊤ ∧ ((shaInv L₁ l e).toNat : ℝ) ≤
                  (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) +
                    2 * Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) := by
  intro CK hCK hK l R c _ L₀ _ hmu Z Exc hSec hF L₂ _ _ _ hL₂ eps Ct c0 x n0 heps hc0 hx hgood hn hdisc e he1 heZ hex m L₁ _ _ _ hL₁
  have hexp : 0 ≤ 2 * Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) := by positivity
  by_cases he : e ∈ Exc
  · have hg : (e : ℝ) ≤ x ^ (eps / (2 * CK)) := hgood e he hex
    obtain ⟨D⟩ := ldata_nonempty (F := L₂) (Ω := AlgebraicClosure L₂) l
    have hmu2 : HasMuQ l L₂ := by
      obtain ⟨ζ, hζ⟩ := hmu
      exact ⟨algebraMap L₀ L₂ ζ, hζ.map_of_injective (algebraMap L₀ L₂).injective⟩
    obtain ⟨hvt, hvb⟩ := klen CK hK l L₂ (AlgebraicClosure L₂) D hmu2 e he1
    have hkb := kexp CK eps c0 x e (Module.finrank ℚ L₂) n0 (discr L₂).natAbs hCK heps hc0 hx hg hn hdisc
    have hs := hSec e he he1 heZ m L₁ hL₁ L₂ hL₂ (AlgebraicClosure L₂) D
    generalize VLen D ↑e = v at hvt hvb hs
    generalize shaInv L₁ l ↑e = s at hs ⊢
    lift v to ℕ using hvt
    have hst : s ≠ ⊤ := by
      refine ne_top_of_le_ne_top ?_ hs
      rw [← Nat.cast_add]
      exact ENat.coe_ne_top _
    lift s to ℕ using hst
    have hs' : s ≤ v + R * (m - jZero l R) := by exact_mod_cast hs
    refine ⟨ENat.coe_ne_top s, ?_⟩
    rw [ENat.toNat_coe]
    simp only [ENat.toNat_coe] at hvb
    have hN : s ≤ v + R * (m + jZero l R + c + Nat.log l Z) := by
      refine le_trans hs' (Nat.add_le_add_left (Nat.mul_le_mul_left _ ?_) _)
      omega
    have hR : (s : ℝ) ≤ (v : ℝ) + (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) := by
      exact_mod_cast hN
    linarith
  · have hb := hF.2 e he1 heZ he m L₁ hL₁
    generalize shaInv L₁ l ↑e = s at hb ⊢
    have hst : s ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) hb
    lift s to ℕ using hst
    have hs' : s ≤ R * (max m (jZero l R) + c + Nat.log l Z) := by exact_mod_cast hb
    refine ⟨ENat.coe_ne_top s, ?_⟩
    rw [ENat.toNat_coe]
    have hN : s ≤ R * (m + jZero l R + c + Nat.log l Z) := by
      refine le_trans hs' (Nat.mul_le_mul_left _ ?_)
      omega
    have hR : (s : ℝ) ≤ (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) := by
      exact_mod_cast hN
    linarith

theorem UpperTheory.V.Win.point2_split13 :
    ∀ CK : ℝ, 0 < CK → LemmaK CK → ∀ (l R c1 n0 : ℕ) [Fact l.Prime] (c0 J Ct eps a : ℝ), 0 ≤ c0 → 0 < J → 0 ≤ Ct → 0 < eps →
      0 ≤ a → ∃ C : ℝ, 0 ≤ C ∧ ∀ (L₀ : Type) [Field L₀], HasMuQ l L₀ →
        ∀ (c : ℕ) (X : ℝ) (Exc : Finset ℕ), c ≤ c1 → SecondBoundOn13 l R L₀ ⌊X ^ Ct⌋₊ Exc → FirstBound l R c L₀ ⌊X ^ Ct⌋₊ Exc →
        ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ → Module.finrank ℚ L₂ ≤ n0 →
          ∀ x : ℝ, 1 ≤ x → X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            Real.log (2 * ((discr L₂).natAbs : ℝ)) ≤ c0 * x ^ (eps / 4) →
            ∀ e : ℕ, 1 ≤ e → (e : ℝ) ≤ x ^ Ct →
              ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
                (m : ℝ) ≤ a * (1 + Real.log x) →
                  shaInv L₁ l e ≠ ⊤ ∧ ((shaInv L₁ l e).toNat : ℝ) + 1 ≤ ptBound C eps x := by
  intro CK hCK hK l R c1 n0 hl c0 J Ct eps a hc0 hJ hCt heps ha
  have hA : 0 ≤ (R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1 := by positivity
  have hB : 0 ≤ (2 * (n0 : ℝ)) ^ CK * c0 := by positivity
  refine ⟨((R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1) + (2 * (n0 : ℝ)) ^ CK * c0, by positivity, ?_⟩
  intro L₀ _ hmu c X Exc hc hS hF L₂ _ _ _ hL₂ hn x hx hXx hxX hG hD e he hex m L₁ _ _ _ hL₁ hm
  have hX : 1 ≤ X := hx.trans hxX
  have heZ : e ≤ ⌊X ^ Ct⌋₊ :=
    Nat.le_floor (hex.trans (Real.rpow_le_rpow (by linarith) hxX hCt))
  obtain ⟨h1, h2⟩ := UpperTheory.V.Win.point_split13 CK hCK hK l R c L₀ hmu _ Exc hS hF L₂ hL₂ eps Ct c0 x n0 heps hc0 hx hG hn hD
    e he heZ hex m L₁ hL₁
  refine ⟨h1, ?_⟩
  have hlog := UpperTheory.V.Win.logs.1 l J Ct X x hl.out.two_le hJ hCt hX hXx
  have hL : 0 ≤ Real.log x := Real.log_nonneg hx
  have hcr : (c : ℝ) ≤ c1 := by exact_mod_cast hc
  have hp : 0 ≤ x ^ (3 * eps / 4) := by positivity
  have hj : (0 : ℝ) ≤ jZero l R := Nat.cast_nonneg _
  have hc1 : (0 : ℝ) ≤ c1 := Nat.cast_nonneg _
  have hR : (0 : ℝ) ≤ R := Nat.cast_nonneg _
  have hCJ : 0 ≤ 2 * Ct * J := by positivity
  have hin : (m : ℝ) + jZero l R + c + Nat.log l ⌊X ^ Ct⌋₊ ≤
      (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) * (1 + Real.log x) := by
    nlinarith [mul_nonneg hj hL, mul_nonneg hc1 hL]
  have hR' := mul_le_mul_of_nonneg_left hin hR
  have hexp : Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) ≤
      Real.exp ((((R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1) + (2 * (n0 : ℝ)) ^ CK * c0) *
        x ^ (3 * eps / 4)) := by
    apply Real.exp_le_exp.mpr
    exact mul_le_mul_of_nonneg_right (by linarith) hp
  unfold ptBound
  have hBL : 0 ≤ (2 * (n0 : ℝ)) ^ CK * c0 * (1 + Real.log x) := by positivity
  nlinarith

private theorem ne_top_and_toNat_le_of_le_one_add (a b : ℕ∞) (hb : b ≠ ⊤) (h : a ≤ 1 + b) :
    a ≠ ⊤ ∧ a.toNat ≤ 1 + b.toNat := by
  obtain ⟨n, rfl⟩ := ENat.ne_top_iff_exists.mp hb
  have h' : a ≤ ((1 + n : ℕ) : ℕ∞) := by push_cast; exact h
  have ha : a ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h'
  obtain ⟨m, rfl⟩ := ENat.ne_top_iff_exists.mp ha
  refine ⟨ha, ?_⟩
  simp only [ENat.toNat_coe]
  exact_mod_cast h'

theorem UpperTheory.V.Win.partA_split13 :
    ∀ CK : ℝ, 0 < CK → LemmaK CK → ∀ (M : AbF) (R : ℕ) (J Ct eps A1 : ℝ), 0 < J → 0 ≤ Ct → 0 < eps →
      ∃ x0 : ℝ, ∀ e t : ℝ → ℕ, admitted A1 Ct e t → ∀ (X : ℝ) (q d : ℕ), PrimePair M.m q d →
        Real.log ((q : ℝ) * d) ≤ X ^ (eps / (4 * J)) →
        ∀ (L₀ : Type) [Field L₀] [NumberField L₀], TwoBase M q d L₀ → SplitABound13 2 R (16 * M.deg) L₀ →
          ∃ Exc : Finset ℕ, Exc.card ≤ R ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            BaAt M eps e t q d x := by
  intro CK hCK hK M R J Ct eps A1 hJ hCt heps
  obtain ⟨n0, c0, hc0, hLD⟩ := layerdisc 2 (jZero 2 R) (8 * M.deg) (4 * M.m) Nat.prime_two
    (by have := M.pos; omega)
  obtain ⟨C, hC0, hC⟩ := point2_split13 CK hCK hK 2 R (16 * M.deg) n0 c0 J Ct eps (2 * |A1| + 2)
    hc0 hJ hCt heps (by positivity)
  obtain ⟨x0, hx02, hx0⟩ := final Ct eps C heps
  refine ⟨x0, fun e t hAdm X q d hPP hlogqd L₀ _ _ hTB hAB => ?_⟩
  obtain ⟨hmu, hfin, hcyc, hE⟩ := hTB
  obtain ⟨c, hc, Exc, hExc, hSB⟩ := hAB ⌊X ^ Ct⌋₊
  obtain ⟨L₂, i1, i2, i3, hL₂⟩ := layerex 2 (jZero 2 R) Nat.prime_two L₀ hmu
  refine ⟨Exc, hExc.1, fun x hx hXx hxX hG E _ _ hEc => ?_⟩
  have hx1 : (1 : ℝ) ≤ x := by linarith
  have hX1 : (1 : ℝ) ≤ X := by linarith
  have hlog : 0 ≤ Real.log x := Real.log_nonneg hx1
  obtain ⟨he2, h2e, -, htx⟩ := hAdm x (by linarith)
  have hw : (1 : ℝ) ≤ x ^ (eps / 4) := Real.one_le_rpow hx1 (by positivity)
  have hP : 0 < q * d := Nat.mul_pos hPP.1.pos hPP.2.2.1.pos
  have hlogP : Real.log ((q * d : ℕ) : ℝ) ≤ x ^ (eps / 4) := by
    push_cast
    exact hlogqd.trans (logs.2.1 J eps X x hJ heps hX1 hXx)
  have hcyc' : Nonempty (L₀ →ₐ[ℚ] CyclotomicField (4 * M.m * (q * d)) ℚ) := by
    rw [← mul_assoc]; exact hcyc
  obtain ⟨hn0, hdisc⟩ := hLD (q * d) (x ^ (eps / 4)) hP hw hlogP L₀ L₂ hfin hcyc' hL₂
  obtain ⟨m, L₁, j1, j2, j3, hL₁, hme, hsha⟩ := hE (e x) he2 E hEc
  have hm : (m : ℝ) ≤ (2 * |A1| + 2) * (1 + Real.log x) := by
    have h3 := logs.2.2 (e x) A1 x hx1 h2e
    have h4 : (m : ℝ) ≤ (e x : ℝ) + 2 := by exact_mod_cast hme
    linarith
  have hpb : 0 ≤ ptBound C eps x := by
    show 0 ≤ C * (1 + Real.log x) + 2 * Real.exp (C * x ^ (3 * eps / 4))
    exact add_nonneg (mul_nonneg hC0 (by linarith)) (by positivity)
  show VVat 2 E (t x) (Real.exp (x ^ (4 * eps / 5)))
  refine vvat 2 (t x) E (x ^ Ct) (ptBound C eps x) _ hpb htx (hx0 x hx) ?_
  intro k hk1 hkt
  have hkx : (k : ℝ) ≤ x ^ Ct := le_trans (by exact_mod_cast hkt.le) htx
  have hk := hC L₀ hmu c X Exc hc hSB hExc L₂ hL₂ hn0 x hx1 hXx hxX hG hdisc k hk1 hkx
    m L₁ hL₁ hm
  obtain ⟨hne, hle⟩ := ne_top_and_toNat_le_of_le_one_add _ _ hk.1 (hsha k hk1)
  refine ⟨hne, ?_⟩
  have h5 : ((shaInv E 2 k).toNat : ℝ) ≤ 1 + ((shaInv L₁ 2 k).toNat : ℝ) := by
    exact_mod_cast hle
  linarith [hk.2]

theorem UpperTheory.V.Win.thmBab_of_split13 :
    (∃ CK : ℝ, LemmaK CK) → FixedIn → TwoIn13 → ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
  rintro ⟨CK0, hK0⟩ hF hT
  classical
  have hCK1 : (1 : ℝ) ≤ max CK0 1 := le_max_right _ _
  have hCKpos : (0 : ℝ) < max CK0 1 := lt_of_lt_of_le one_pos hCK1
  have hK : LemmaK (max CK0 1) := kmono CK0 _ (le_max_left _ _) hK0
  let P : ℕ → AbF → ℕ → Prop := fun l A R =>
    ∃ (_ : Fact l.Prime) (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), IsAbField A L₀ ∧ ABound l R L₀
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
  obtain ⟨x0A, hA⟩ := partA_split13 CK hCKpos hK M (R0 M) J Ct eps A1 hJpos hCt0.le heps
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
      obtain ⟨x0, hx0⟩ := partB CK hCKpos hK l (Classical.choose hP) hl2 (L l) hmu L₀₀ hab0 hR0
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


-- Check the original-to-weaker interface on an actual native type.
example (h : TwoIn) : TwoIn13 := by
  first | rh_reduce 3 using [twoIn_to_split13] | exact twoIn_to_split13 h
example (h : TwoIn) : TwoIn13 := by
  first | rh_auto 3 | exact twoIn_to_split13 h
example (h : TwoIn) : TwoIn13 := by
  rh_auto_frontier 2
  all_goals exact twoIn_to_split13 h

#print axioms UpperTheory.V.Win.point
#print axioms UpperTheory.V.Win.point_split13
#print axioms UpperTheory.V.Win.point2_split13
#print axioms UpperTheory.V.Win.partA_split13
#print axioms UpperTheory.V.Win.twoIn_to_split13
#print axioms UpperTheory.V.Win.thmBab_of_split13
rh_scan UpperTheory.V.Win.partA limit 2000
rh_scan UpperTheory.V.Win.partA_split13 limit 2000
rh_scan UpperTheory.V.Win.thmBab_of_split13 limit 2000
rh_prune UpperTheory.V.Win.secondBound_restrict13 as RH13SecondBoundRestrictPruned

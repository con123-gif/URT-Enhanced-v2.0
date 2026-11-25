import Mathlib
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.SecondBound
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
# RUN33 lane 13 — same-host arithmetic exception-window bound (actual ThmBab caller)
25 Nov 2026. SOURCE-MATCHED / PREPARED, not compiled. RH OPEN.
Mission latest cd0a176134d46b5b624896e56843a24915c14477 (60892061),
manuscript 464e82f81f646d4af85e1f5f70d379026df46261, SWARM 4b77b161,
HANDOFF bbc46df7, AGENTS 8db0201d, state 1ff2601b consulted.
Peers 0cf4b3fb (direct principal 3/2 window), 3044c307 (local weight),
d91e1e45 (adaptive layer), 46c378ee (Clozel) inspected. This is the
actual VWinAt upstream arithmetic window, not another Landau rewrite.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
LayeredIsomorphisms/Window1.lean 3d39aa0fc809fe8408a55186f7f4c4364d0a7f4c
LayeredIsomorphisms/Window.lean 386bec7e22094a4309c4a8e2846435357f703375
LayeredIsomorphisms/ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff
LayeredIsomorphisms/PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a
LayeredIsomorphisms/SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
PrimeSetBoundDataOfPrimitiveChar.lean 52224122dd8f9deefef473151d716984f3e1f1ff
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
CMFieldExponentialBounds/AdmissibleOfPageN.lean 5afd609c06ffbef90f5df59e9915343c913c6257

EDITOR BLOCK: Let B=Ct/eta>=1, U=log X>0, and T={log e/Ct:
e in Exc, e>0}; |T|<=R. For a desired power window lambda>1 choose
U_i=U/(lambda B)^i for i=0,...,R. The R+1 half-open bands
(U_i/(lambda B), U_i] are disjoint. At least one contains no element
of T. Set y=U_i/lambda. For all u in [y,lambda y], if a<=u then
a<=y/B (otherwise a would lie in the empty band), so B a<=y<=u.
Exponentiating gives Good(eta,Ct,Exc,x) throughout
[Y,Y^lambda], where Y=exp(y), and the single sufficient budget
    J_lambda = lambda*(lambda*Ct/eta)^R,
    X^(1/J_lambda) <= Y,   Y^lambda <= X.
Zero exceptions are harmless; negative logarithms do not obstruct.
No separate host or window is selected for any prime: Exc is the
actual same-host union ExcA union B'.biUnion g in thmBab_of.
The proof is finite pigeonhole, with no need to explore alternate
witnesses. The Lean replay uses the original induction with the
tighter constant lambda=2, for stability of native API. It is not
a claim that Lean uses the pigeonhole proof.

At lambda=2 this halves the original window constant
J_old=2^(R+2)*(Ct/eta)^R. At lambda=3/2 the generalized human
formula has ratio J_old/J_new=(8/3)*(4/3)^R. IMPORTANT: smaller J
changes the prime-pair log guard in PartA/PartB and other callers;
do NOT substitute the smaller J into BConst.J without jointly
replaying those suppliers. The actual caller below retains old J
and original entire ThmBab statement; it uses the stronger selection
only via a monotone bridge. The conditional direct400 peer could
use lambda=3/2 after all same-host lower guards and budgets are
replayed. This is a closed elementary human selection lemma, not
a closure of PartA, PartB, TwoIn, CountI or VWinAt.

Original local graph:
of_four_alt -> vwin_of_counts -> jointWin_of_counts -> jointWin_of;
thmBab_of_lemmaK -> thmBab_of -> window -> window1.
thmBab_of also uses PartA, PartB, FixedIn, TwoIn, LemmaK, and
the exact exception union. Reduced local graph replaces ONLY
thmBab_of -> window -> window1 by
thmBab_of_window13 -> window_bridge13 -> window_sharp13 -> window1_sharp13.
All other graph/type/value/axiom dependencies and upstream open
obligations retained. No claim that old window1 is globally absent.
Cache key pin, toolchain, declaration, M,B',L,eps,Ct,CK,J,
X,q,d, actual Exc union and R. Do not cache by declaration alone.
Fallback original theorem, no URT speedup asserted.

Executed local Python fractions: 22032 exact finite configurations,
60 boundary controls and one shared-endpoint negative control.
Reproduction:
  U=F(48)
  for B in map(F,[1,2,3,4]):
   for L in (F(3,2),F(2),F(3)):
    for R in range(5):
     caps=[U/(L*B)**i for i in range(R+1)]
     vals=sorted(set([F(-1),F(0),U+1]+caps+[u/(L*B) for u in caps]
                     +[(u+u/(L*B))/2 for u in caps]))
     for r in range(R+1):
      for T in combinations(vals,r):
       occ=[any(u/(L*B)<a<=u for a in T) for u in caps]
       y=caps[occ.index(False)]/L
       assert U/(L*(L*B)**R)<=y and L*y<=U
       assert all(not (y/B<a<=L*y) for a in T)
       assert sum(occ)<=len(T)
     y=U/L; assert B*(y/B)==y
  B=F(3); L=F(2); a=U/(L*B)
  assert not U/(L*B)<a<=U
  assert U/(L*B)**2<a<=U/(L*B)
These are scalar regression controls, not tests of native arithmetic
exceptions or proof of asymptotic prime/cohomology estimates.
Connector source transformation checks: 15 exact pin/anchor/reversal assertions.
Failed retrieval: LayeredIsomorphisms directly under AutomorphicArithmetic
404; corrected full path. Native lean/lake absent. Prior CI status
45577239749 (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc) and
45576756833 (7da354941e402b6f8b364ed03d8c5c82d27b7717) independently
read: both returncode 0, conditional half-strip axioms only, bounded
root scan pending 324. Neither verifies this candidate.
Replay with Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474,
three engine imports on LEAN_PATH. No new kernel/axiom result.
RESUME HERE: batch this actual ThmBab caller with existing VWinDirect400
and same-host arithmetic candidates in pinned native CI; verify original
statement and actual consumer. Then prove PartA at the chosen SAME host
and use the shorter 3/2 window only with a checked lower-guard bridge.
HANDOFF TO integration, kernel, audit, Galois. Root obligations closed
by new kernel evidence: zero. Elementary window selection strengthened.
-/

theorem UpperTheory.V.Win.window1_sharp13 :
    ∀ (R : ℕ) (B U : ℝ) (T : Finset ℝ), 1 ≤ B → 0 < U → T.card ≤ R →
      ∃ y : ℝ, U / (2 ^ (R + 1) * B ^ R) ≤ y ∧ 2 * y ≤ U ∧ ∀ a ∈ T, ∀ u : ℝ, y ≤ u → u ≤ 2 * y → a ≤ u → B * a ≤ u := by
  intro R
  induction R with
  | zero =>
    intro B U T hB hU hT
    have hT0 : T = ∅ := Finset.card_eq_zero.mp (by omega)
    subst hT0
    refine ⟨U / 2, ?_, by linarith, ?_⟩
    · norm_num
    · intro a ha
      simp at ha
  | succ n ih =>
    intro B U T hB hU hT
    have hB0 : 0 < B := by linarith
    by_cases h : ∃ a ∈ T, U / (2 * B) < a ∧ a ≤ U
    · obtain ⟨a0, ha0, h1, h2⟩ := h
      obtain ⟨y, hy1, hy2, hy3⟩ := ih B (U / (2 * B)) (T.erase a0) hB (by positivity)
        (by rw [Finset.card_erase_of_mem ha0]; omega)
      refine ⟨y, ?_, ?_, ?_⟩
      · calc U / (2 ^ (n + 1 + 1) * B ^ (n + 1))
            = U / (2 * B) / (2 ^ (n + 1) * B ^ n) := by
              rw [div_div]
              congr 1
              ring
          _ ≤ y := hy1
      · have : U / (2 * B) ≤ U := div_le_self hU.le (by linarith)
        linarith
      · intro a ha u hu1 hu2 hau
        by_cases hae : a = a0
        · subst hae
          exfalso
          have : U / (2 * B) < u := lt_of_lt_of_le h1 hau
          linarith
        · exact hy3 a (Finset.mem_erase.mpr ⟨hae, ha⟩) u hu1 hu2 hau
    · push_neg at h
      refine ⟨U / 2, ?_, by linarith, ?_⟩
      · apply div_le_div_of_nonneg_left hU.le (by norm_num)
        have h2 : (1 : ℝ) ≤ 2 ^ n := one_le_pow₀ (by norm_num)
        have h3 : (1 : ℝ) ≤ B ^ (n + 1) := one_le_pow₀ hB
        have h4 : (2 : ℝ) ^ (n + 1 + 1) = 4 * 2 ^ n := by ring
        rw [h4]
        nlinarith
      · intro a ha u hu1 hu2 hau
        by_contra hc
        push_neg at hc
        have ha1 : U / (2 * B) < a := by
          rw [div_lt_iff₀ (by positivity)]
          nlinarith
        have := h a ha ha1
        linarith

theorem UpperTheory.V.Win.window_sharp13 :
    ∀ (R : ℕ) (eta Ct X : ℝ) (Exc : Finset ℕ), 0 < eta → eta ≤ Ct → 1 < X → Exc.card ≤ R →
      ∃ Y : ℝ, InRange (2 ^ (R + 1) * (Ct / eta) ^ R) X Y ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ (2 : ℝ) → Good eta Ct Exc x := by
  intro R eta Ct X Exc heta hle hX hcard
  classical
  have hCt : 0 < Ct := lt_of_lt_of_le heta hle
  have hX0 : 0 < X := by linarith
  have hB : 1 ≤ Ct / eta := (one_le_div heta).mpr hle
  obtain ⟨y, hy1, hy2, hy3⟩ := UpperTheory.V.Win.window1_sharp13 R (Ct / eta) (Real.log X)
    (Exc.image fun e : ℕ => Real.log (e : ℝ) / Ct) hB (Real.log_pos hX)
    (le_trans Finset.card_image_le hcard)
  have hsq : Real.exp y ^ (2 : ℝ) = Real.exp (2 * y) := by
    rw [← Real.exp_mul, mul_comm]
  refine ⟨Real.exp y, ⟨?_, ?_⟩, ?_⟩
  · rw [Real.rpow_def_of_pos hX0, Real.exp_le_exp, mul_one_div]
    exact hy1
  · rw [hsq, ← Real.le_log_iff_exp_le hX0]
    exact hy2
  · intro x hx1 hx2 e he hex
    have hx0 : 0 < x := lt_of_lt_of_le (Real.exp_pos y) hx1
    rcases Nat.eq_zero_or_pos e with h0 | hpos
    · subst h0
      simpa using (Real.rpow_pos_of_pos hx0 eta).le
    have he0 : (0 : ℝ) < e := by exact_mod_cast hpos
    have hu1 : y ≤ Real.log x := (Real.le_log_iff_exp_le hx0).mpr hx1
    have hu2 : Real.log x ≤ 2 * y := by
      rw [Real.log_le_iff_le_exp hx0, ← hsq]
      exact hx2
    have hu3 : Real.log (e : ℝ) / Ct ≤ Real.log x := by
      rw [div_le_iff₀ hCt, mul_comm, ← Real.log_rpow hx0]
      exact Real.log_le_log he0 hex
    have h := hy3 _ (Finset.mem_image_of_mem _ he) (Real.log x) hu1 hu2 hu3
    have h' : Ct / eta * (Real.log (e : ℝ) / Ct) = Real.log (e : ℝ) / eta := by
      field_simp
    rw [h', div_le_iff₀ heta] at h
    rw [Real.rpow_def_of_pos hx0, ← Real.log_le_iff_le_exp he0]
    exact h

theorem UpperTheory.V.Win.window_bridge13 :
    ∀ (R : ℕ) (eta Ct X : ℝ) (Exc : Finset ℕ), 0 < eta → eta ≤ Ct → 1 < X → Exc.card ≤ R →
      ∃ Y : ℝ, InRange (2 ^ (R + 2) * (Ct / eta) ^ R) X Y ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ (2 : ℝ) → Good eta Ct Exc x := by
  intro R eta Ct X Exc heta hle hX hcard
  obtain ⟨Y, hY, hg⟩ := window_sharp13 R eta Ct X Exc heta hle hX hcard
  have hB : 0 < Ct / eta := div_pos (heta.trans_le hle) heta
  have hp : 0 < (2 : ℝ) ^ (R + 1) * (Ct / eta) ^ R := by positivity
  have hmul : (2 : ℝ) ^ (R + 2) * (Ct / eta) ^ R =
      2 * ((2 : ℝ) ^ (R + 1) * (Ct / eta) ^ R) := by
    rw [show R + 2 = (R + 1) + 1 by omega, pow_succ]
    ring
  have hd : (2 : ℝ) ^ (R + 1) * (Ct / eta) ^ R ≤
      (2 : ℝ) ^ (R + 2) * (Ct / eta) ^ R := by
    rw [hmul]
    first | rh_auto 2 | linarith
  refine ⟨Y, ⟨?_, hY.2⟩, hg⟩
  exact (Real.rpow_le_rpow_of_exponent_le hX.le
    (one_div_le_one_div_of_le hp hd)).trans hY.1

theorem UpperTheory.V.Win.thmBab_of_window13 :
    (∃ CK : ℝ, LemmaK CK) → FixedIn → TwoIn → ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
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
  obtain ⟨Y, hY, hgood⟩ := window_bridge13 R (eps / (2 * CK)) Ct X (ExcA ∪ B'.biUnion g) heta hetaCt
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
-- Native engine candidates; compile and inspect actual output.
rh_scan UpperTheory.V.Win.window1 limit 2000
rh_scan UpperTheory.V.Win.window1_sharp13 limit 2000
rh_scan UpperTheory.V.Win.thmBab_of limit 2000
rh_scan UpperTheory.V.Win.thmBab_of_window13 limit 2000
rh_prune UpperTheory.V.Win.window_bridge13 as RH13WindowBridgePruned
#print axioms UpperTheory.V.Win.thmBab_of
#print axioms UpperTheory.V.Win.thmBab_of_window13
#print axioms UpperTheory.V.Win.window_sharp13

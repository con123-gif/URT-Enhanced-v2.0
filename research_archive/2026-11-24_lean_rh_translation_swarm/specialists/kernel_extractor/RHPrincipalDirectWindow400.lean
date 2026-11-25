import RHWideHostWindowTransport
import RHPrincipalUnitPage400

/-!
Lane 11, 25 Nov 2026. SOURCE-MATCHED, PREPARED NOT COMPILED.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; current manuscript
464e82f81f646d4af85e1f5f70d379026df46261. AGENTS, SWARM, HANDOFF,
EXPANSION, continuity and recent commits read. Peers fdb0ad7a (CM places),
d91e1e45 (adaptive cyclotomic layer), 46c378ee (Clozel), a910af41
(singleton Landau), 3e1000ef (genus), 0e1b92ab (adelic transport),
1b03d6e3 (CountQ), 6ea6da30 (DH positivity). Distinct host-window reduction.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest observed
d91ae2678eea19a0c3045ffca37f1da757c2e719 (unchanged from previous run).
Source blobs CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7,
PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939,
WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b,
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc.
Prior candidate blobs RHJointHostWindow 49c7f05d939e71319fbe392be40fe71e95b21e76,
RHPrincipalUnitPage400 3d32c7efea215291658e4b22f531c5c596e2cfc1, RHWideHostWindowTransport 31efce9c74ce3e8802475810d82662ea927355b6.

RESULT: at c=1 the arithmetic window need not extend to W^2.
Choose one J>=1 for eps, then for arbitrarily distant W>=1 choose
Y,q,d with (W^(3/2))^(1/J)<=Y<=W and PairGood(1,eps,Y,W^(3/2),q,d).
At each x in [W,W^(3/2)] choose a page e with PageN and VAtWide at
cutoff floor(x^400). No separate X, square-window extension, universal
pair or selector, or rescaling parameter remains in this arithmetic
input interface. Y,q,d are COMMON over the whole chosen window;
all four PairGood fields, including all auxiliary character bounds
and boxes, and full finite-length/coefficient-prime quantifiers remain.
Proof: monotonicity in x gives x^(1/J)<=Y<=x. PairGood.mono restricts
only the upper endpoint, never Y. PageN already gives both rank
inequalities since c=1. VAtWide is exactly WinDatumWide.bound.
For the old sufficient interface choose X>=max(X0,max(M,Y1)^J)
and Y=X^(1/J); old W satisfies Y<=W, W^2<=X and M<=Y. Thus
W^(3/2)<=W^2<=X and the new lower guard on Y follows. PairGood.mono,
VVle.mono and x>=1 preserve the bounds when restricting the interval
and cutoff 401 to 400. The budget stays exp(x^eps)*(x^eps)^2.
No assertion of the new arithmetic hypothesis.

Original graph: VWinAt(401), PairEx -> winPairs -> supplyOfAdmOf ->
supplyChi -> native TopG -> Landau. Prior candidate graph: VWinAtJoint(401)
-> winPairsJoint -> supplyOfAdmOfJoint -> supplyChiJoint -> TopGRecord.
New candidate: VWinDirect400 -> winPairsDirect400 + fieldChi_unit400 ->
supplyOfAdmOfDirect400 -> supplyChiDirect400 -> TopGRecord -> principal
window -> rh_of_right. Green, HypsAlt, host/admission, rank, geometric
and analytic premises survive. Cache context pin, psi, eps,J,Y,W,q,d,x,e,E.
No kernel-edge deletion or new axiom status claimed.
Note static defect in prior RHJointHostWindow: literal 'change ^' omits
the base x' in a tactic line. This candidate does not import that file,
and leaves historical evidence intact. No local Lean/Lake on PATH.
Executed source generation: 5 guarded unique replacements of the
prior actual host body, exact source blob and declaration boundaries
checked; no Lean execution. Prior engine CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 independently retrieved;
both old statuses pass, not this file. No URT advantage asserted.

RESUME HERE: replay the imported unit/wide overlays in pinned Lean,
then lake env lean RHPrincipalDirectWindow400.lean with the three
shared engine modules on LEAN_PATH. Check native scans, pruning,
axioms, exact bridge and caller; correct any compile errors. Seek
VWinDirect400 at principal character rather than squared windows.
HANDOFF TO: integration, editor, audit, arithmetic. RH OPEN.
-/

noncomputable section
open NumberField Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.HC GlobalTheory.EX UpperTheory.Top HostParam.Seam

namespace UpperTheory.Top

def VWinDirect400 (ψ : PChar) : Prop :=
  ∀ eps : ℝ, 0 < eps → eps < 1 / 52 →
    ∃ J : ℝ, 1 ≤ J ∧ ∀ M ≥ (1 : ℝ),
      ∃ (W Y : ℝ) (q d : ℕ), M ≤ W ∧
        (W ^ ((3 : ℝ) / 2)) ^ (1 / J) ≤ Y ∧ Y ≤ W ∧
        PairGood ψ.N eps Y (W ^ ((3 : ℝ) / 2)) q d ∧
        ∀ x : ℝ, W ≤ x → x ≤ W ^ ((3 : ℝ) / 2) →
          ∃ e : ℕ, PageN eps x e ∧ VAtWide ψ eps 400 q d e x

theorem vwinDirect400_of_wide (ψ : PChar)
    (hV : VWinAtWide ψ 401) (hP : PairEx) : VWinDirect400 ψ := by
  intro eps he he52
  obtain ⟨e, hpage⟩ := exists_pageN eps he
  obtain ⟨J, hJ, X0, hX0⟩ := hV eps he he52 e hpage
  have hN : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  obtain ⟨Y1, hY1⟩ := hP ψ.N hN eps J he he52 hJ
  refine ⟨J, hJ, fun M hM => ?_⟩
  let A : ℝ := max M Y1
  have hMA : M ≤ A := le_max_left _ _
  have hYA : Y1 ≤ A := le_max_right _ _
  have hA1 : 1 ≤ A := hM.trans hMA
  have hA0 : 0 ≤ A := by linarith
  have hJ0 : J ≠ 0 := ne_of_gt (by linarith)
  have hJi : 0 ≤ 1 / J := one_div_nonneg.2 (by linarith)
  let X : ℝ := max X0 (A ^ J)
  have hXA : A ^ J ≤ X := le_max_right _ _
  have hXX0 : X0 ≤ X := le_max_left _ _
  have hX1 : 1 ≤ X := (Real.one_le_rpow hA1 (by linarith)).trans hXA
  have hXnn : 0 ≤ X := by linarith
  have hAX : A ≤ X ^ (1 / J) := by
    calc A = (A ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hA0 hJ0]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hA0 _) hXA hJi
  have hXJ : (X ^ (1 / J)) ^ J = X := by rw [one_div, Real.rpow_inv_rpow hXnn hJ0]
  obtain ⟨q, d, hpg⟩ := hY1 (X ^ (1 / J)) (hYA.trans hAX)
  rw [hXJ] at hpg
  obtain ⟨W, hW0, hW2, hWV⟩ := hX0 X hXX0 q d hpg.pair
  have hMW : M ≤ W := hMA.trans (hAX.trans hW0)
  have hW1 : 1 ≤ W := hM.trans hMW
  have hWnn : 0 ≤ W := by linarith
  have hshort : W ^ ((3 : ℝ) / 2) ≤ W ^ (2 : ℝ) :=
    Real.rpow_le_rpow_of_exponent_le hW1 (by norm_num)
  have hshortX := hshort.trans hW2
  refine ⟨W, X ^ (1 / J), q, d, hMW, ?_, hW0, hpg.mono hshortX, ?_⟩
  · exact Real.rpow_le_rpow (Real.rpow_nonneg hWnn _) hshortX hJi
  · intro x hx hx2
    have hx1 : 1 ≤ x := hW1.trans hx
    refine ⟨e x, hpage x hx1, ?_⟩
    intro E _ _ hE
    exact (hWV x hx (hx2.trans hshort) E hE).mono
      (Nat.floor_mono (Real.rpow_le_rpow_of_exponent_le hx1 (by norm_num))) le_rfl

theorem vwinDirect400_of_original (ψ : PChar)
    (hV : VWinAt ψ 401) (hP : PairEx) : VWinDirect400 ψ :=
  vwinDirect400_of_wide ψ (vwinAtWide_of_vwinAt ψ 401 hV) hP

theorem winPairsDirect400 :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → c = 1 → VWinDirect400 ψ →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatumWide ψ eps J c x Y q d e := by
  intro ψ eps c he he52 hc hV
  subst c
  obtain ⟨J, hJ, hWin⟩ := hV eps he he52
  refine ⟨J, hJ, fun y => ?_⟩
  obtain ⟨W, Y, q, d, hMW, hlo, hup, hpg, hWV⟩ :=
    hWin (max 1 y) (le_max_left _ _)
  have hW1 : 1 ≤ W := (le_max_left _ _).trans hMW
  have hJi : 0 ≤ 1 / J := one_div_nonneg.2 (by linarith)
  refine ⟨W, (le_max_right _ _).trans hMW, fun x hx hx2 => ?_⟩
  obtain ⟨e, hpage, hv⟩ := hWV x hx hx2
  have hx0 : 0 ≤ x := by linarith
  refine ⟨Y, q, d, e, ?_, hup.trans hx, hpg.mono hx2, ?_, ?_, hv⟩
  · exact (Real.rpow_le_rpow hx0 hx2 hJi).trans hlo
  · simpa only [one_mul] using hpage.1
  · simpa only [one_mul] using hpage.2

end UpperTheory.Top

theorem UpperTheory.T3.supplyOfAdmOfDirect400 :
    (∀ eps C0 : ℝ, 0 < eps → eps < 1 / 52 → 1 ≤ C0 → ∃ CT2 C8 c6 Cb x0 : ℝ, C0 ≤ C8 ∧ 0 < c6 ∧ 0 < Cb ∧
      ∀ (s : Scale) (R : Ranks) (H0 : HostAx R.toFrame) (M : ℕ) (Y : ℝ), s.eps = eps → x0 ≤ s.x → RankVal s R →
        s.J ≤ C0 → (R.o : ℝ) ≤ C0 → (H0.QS : ℝ) ≤ C0 * R.n → 0 < M → (M : ℝ) ≤ C0 → H0.QS ∣ Nat.lcm (2 ^ (R.e + 2)) M →
        PairWin s Y → PairGood M eps Y s.x H0.q H0.d → FieldRows H0.toHostRaw ⌊Y ^ (eps / 5)⌋₊ → admitted R H0 →
        ∃ (H : Host R) (q0 : ℕ), H.toHostAx = H0 ∧ H.CT2 = CT2 ∧ HostGood s C8 4 c6 Cb H q0 ∧
          R.toFrame.Shares H.TT (s.x ^ (-1 + s.eps))) → ∀ ψ : PChar, ψ.χ = 1 → VWinDirect400 ψ →
      (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
        s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
        ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
      HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (s.b * (s.x ^ s.eps)^2)) := by
  intro hSup ψ hχ hV hAdm eps heps heps'
  haveI := ψ.ne
  have hN0 : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  have heps0 : eps ≠ 0 := heps.ne'
  obtain ⟨c, e0, hceq, hc, hF⟩ := UpperTheory.Top.fieldChi_unit400 ψ hχ
  obtain ⟨J, hJ, hwin⟩ := UpperTheory.Top.winPairsDirect400 ψ eps (c : ℝ) heps heps' (by exact_mod_cast hceq) hV
  obtain ⟨C0, hC1, hCJ, hCo, hCN⟩ : ∃ C0 : ℝ, 1 ≤ C0 ∧ J ≤ C0 ∧ ((Level.cyc ψ).o : ℝ) ≤ C0 ∧
      8 * (ψ.N : ℝ) ≤ C0 :=
    by
      have h1 : (0 : ℝ) ≤ ((Level.cyc ψ).o : ℝ) := Nat.cast_nonneg _
      have h2 : (0 : ℝ) ≤ (ψ.N : ℝ) := Nat.cast_nonneg _
      exact ⟨J + ((Level.cyc ψ).o : ℝ) + 8 * (ψ.N : ℝ), by linarith, by linarith, by linarith, by linarith⟩
  obtain ⟨CT2, C8, c6, Cb, x0A, hC8, hc6, hCb, hA⟩ := hSup eps C0 heps heps' hC1
  obtain ⟨x0B, hB⟩ := hAdm eps heps heps'
  obtain ⟨x0T, hT⟩ := UpperTheory.Top.eventually_rank_le_rpow_of_lt_one_div_fiftytwo eps heps heps'
  obtain ⟨K, hK5, hK4⟩ : ∃ K : ℝ, 5 ≤ K ∧ 4 * (ψ.N : ℝ) ≤ K :=
    by
      have h2 : (0 : ℝ) ≤ (ψ.N : ℝ) := Nat.cast_nonneg _
      exact ⟨5 + 4 * (ψ.N : ℝ), by linarith, by linarith⟩
  have hK0 : 0 ≤ K := by linarith
  obtain ⟨A, hA0, hAK⟩ : ∃ A : ℝ, 0 ≤ A ∧ A ^ (eps / 5) = K := by
    refine ⟨K ^ (5 / eps), Real.rpow_nonneg hK0 _, ?_⟩
    rw [← Real.rpow_mul hK0, show 5 / eps * (eps / 5) = (1 : ℝ) by field_simp, Real.rpow_one]
  have hc0 : (0 : ℝ) ≤ c := by positivity
  have hAJ0 : 0 ≤ A ^ J := Real.rpow_nonneg hA0 _
  obtain ⟨x1, h1A, h1B, h1T, h1J, h1c⟩ : ∃ x1 : ℝ, x0A ≤ x1 ∧ x0B ≤ x1 ∧ x0T ≤ x1 ∧ A ^ J ≤ x1 ∧
      (c : ℝ) * 2 ^ e0 < x1 := by
    have h2 : (0 : ℝ) ≤ (c : ℝ) * 2 ^ e0 := by positivity
    refine ⟨|x0A| + |x0B| + |x0T| + A ^ J + (c : ℝ) * 2 ^ e0 + 1, ?_, ?_, ?_, ?_, ?_⟩ <;>
      linarith [le_abs_self x0A, le_abs_self x0B, le_abs_self x0T, abs_nonneg x0A, abs_nonneg x0B,
        abs_nonneg x0T]
  refine ⟨CT2, C8, 4, c6, Cb, x1, le_trans hC1 hC8, by norm_num, hc6, hCb, ?_⟩
  refine ⟨⟨J, hJ, {x | ∃ Y q d e, UpperTheory.Top.WinDatumWide ψ eps J c x Y q d e}, hwin⟩, ?_⟩
  rintro s hs hx ⟨hsJ, Y, q, d, e, hW⟩
  have hx1 : 1 < s.x := s.one_lt_alt
  have hJ0 : 0 < J := by linarith
  have hYA : A ≤ Y := by
    calc A = (A ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hA0 hJ0.ne']
      _ ≤ s.x ^ (1 / J) := Real.rpow_le_rpow hAJ0 (h1J.trans hx) (div_nonneg zero_le_one hJ0.le)
      _ ≤ Y := hW.lo
  have hY0 : 0 ≤ Y := hA0.trans hYA
  have hYK : K ≤ Y ^ (eps / 5) := by
    rw [← hAK]
    exact Real.rpow_le_rpow hA0 hYA (by positivity)
  obtain ⟨hHyp, hjac, -⟩ := UpperTheory.Top.pairHyp eps Y q d hW.good.pair
  have hq3 : q ≠ 3 := by
    intro hq
    have h1 := hW.good.pair.q_lo
    rw [hq] at h1
    push_cast at h1
    have h2 : Real.log 3 ≤ 2 := by
      have := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 3)
      linarith
    linarith
  have he : e ≥ e0 := by
    by_contra hlt
    push_neg at hlt
    have h1 : (2 : ℝ) ^ e ≤ 2 ^ e0 := pow_le_pow_right₀ (by norm_num) hlt.le
    have h2 : s.x ≤ s.x ^ (2 + 8 * eps) := by
      calc s.x = s.x ^ (1 : ℝ) := (Real.rpow_one _).symm
        _ ≤ _ := Real.rpow_le_rpow_of_exponent_le hx1.le (by linarith)
    have h3 := hW.n_lo
    linarith [mul_le_mul_of_nonneg_left h1 hc0]
  have h4N : 4 * ψ.N ≤ ⌊Y ^ (eps / 5)⌋₊ := by
    apply Nat.le_floor
    push_cast
    linarith
  have hjacb : ∀ p : ℕ, Nat.Prime p → p ≠ 2 → p ≤ ⌊Y ^ (eps / 5)⌋₊ → jacobiSym (-(d : ℤ)) p = 1 :=
    fun p hp hp2 hpb => hjac p hp hp2 ((Nat.cast_le.2 hpb).trans (Nat.floor_le (Real.rpow_nonneg hY0 _)))
  obtain ⟨φ, H0, hφe, hφord, hHq, hHd, hφo, hFR, hQSdvd, hQSle, hkept, hps, hker, htw⟩ :=
    hF e he q d ⌊Y ^ (eps / 5)⌋₊ hHyp hq3 hW.good.coprime h4N hjacb
  obtain ⟨R, h, hRV, hAdmR⟩ := hB s φ H0 hs (h1B.trans hx)
    (by rw [hφord]; push_cast; exact hW.n_lo) (by rw [hφord]; push_cast; exact hW.n_up) hφo hker
  subst h
  have hnlo := hRV.n_lo
  rw [hs] at hnlo
  have hQS : (H0.QS : ℝ) ≤ C0 * R.n := by
    have hq' : (H0.QS : ℝ) ≤ 4 * ψ.N * R.toFrame.ord := by exact_mod_cast hQSle
    have hord : (R.toFrame.ord : ℝ) = c * 2 ^ e := by rw [hφord]; push_cast; ring
    have hn : (0 : ℝ) ≤ R.n := Nat.cast_nonneg _
    have hN : (0 : ℝ) ≤ ψ.N := Nat.cast_nonneg _
    rw [hord] at hq'
    have h5 := hW.n_up
    nlinarith [mul_le_mul_of_nonneg_left h5 (by positivity : (0 : ℝ) ≤ 4 * ψ.N),
      mul_le_mul_of_nonneg_left hnlo (by positivity : (0 : ℝ) ≤ 8 * ψ.N),
      mul_le_mul_of_nonneg_right hCN hn]
  obtain ⟨H, q0, hH, hCT, hGood, hSh⟩ := hA s R H0 ψ.N Y hs (h1A.trans hx) hRV
    (by rw [hsJ]; exact hCJ) (by rw [hφo]; exact hCo) hQS hN0
    (by have : (0 : ℝ) ≤ ψ.N := Nat.cast_nonneg _; linarith)
    (by rw [hφe]; exact hQSdvd) ⟨by rw [hsJ]; exact hW.lo, hW.up⟩
    (by rw [hHq, hHd]; exact hW.good) hFR hAdmR
  subst hH
  refine ⟨R, H, q0, hRV, hCT, hGood, ?_, ?_⟩
  · have hprime : ∀ l : ℕ, Nat.Prime l → l ∣ H.QS → l ∣ 2 * ψ.N := by
      intro l hl hlQ
      have h1 : l ∣ 2 ^ (e + 2) * ψ.N := hlQ.trans (hQSdvd.trans (Nat.lcm_dvd (dvd_mul_right _ _) (dvd_mul_left _ _)))
      rcases (Nat.Prime.dvd_mul hl).1 h1 with h2 | h2
      · have h3 := (Nat.prime_dvd_prime_iff_eq hl Nat.prime_two).1 (hl.dvd_of_dvd_pow h2)
        subst h3
        exact dvd_mul_right 2 _
      · exact dvd_mul_of_dvd_right h2 2
    have hbd := UpperTheory.Top.boundedTw ψ R.toFrame H.toHostRaw eps Y s.x heps hx1.le hW.up htw hker.1 hprime
      (by rw [hHq, hHd]; exact hW.good)
    rw [hs] at hSh ⊢
    exact ⟨hφo, hkept, hps, hSh, hbd.1, hbd.2⟩
  · have hCF := UpperTheory.Top.isChiField ψ R.toFrame H.toHostRaw hker
    rw [hφe, hHq, hHd] at hCF
    have hv := hW.bound H.E hCF
    refine hv.mono ?_ (le_of_eq ?_)
    · apply Nat.le_floor
      exact hT s R hs (h1T.trans hx) hRV
    · rw [wideBudget, Formalism.BasicNotions.Scale.b, Formalism.BasicNotions.Scale.L, hs]


theorem UpperTheory.Top.supplyChiDirect400 :
    VWinDirect400 PChar.one → HostExW (3 / 2) (GChiWide PChar.one).req := by
  intro hV
  refine UpperTheory.T3.supplyOfAdmOfDirect400 UpperTheory.Top.hostOfField PChar.one rfl hV ?_
  intro eps he0 he1
  obtain ⟨x0, hx0⟩ := admissibleClassesTwistedChar eps he0 he1
  refine ⟨x0, fun s φ H0 hs hx hlo hhi _ _ => ?_⟩
  subst hs
  exact hx0 s φ H0 rfl hx hlo hhi

theorem UpperTheory.Top.supplyChiDirect400_original_bridge
    (hV : VWinAt PChar.one 401) :
    HostExW (3 / 2) (GChiWide PChar.one).req := by
  have hD := vwinDirect400_of_original PChar.one hV QH.pairEx
  first
  | (rh_reduce 2 using [supplyChiDirect400]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact supplyChiDirect400 hD

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Pk Formalism.MainNotions.Lnk Formalism.MainNotions.GlobalTheoryTheory Formalism.L2.GlobalTheoryTheory Formalism.MainNotions.RT Formalism.L2.Top3 Formalism.L2.Top4

namespace RHPrincipalNative

theorem principal_rh_direct400 (hG : GlobalTheory.GLq.Green)
    (hV : VWinDirect400 PChar.one)
    (h : Nonempty (_root_.GlobalTheory.Fc.HypsAlt
      (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) _root_.GlobalTheory.Fc.DefiniteSideCondition)) :
    RiemannHypothesis := by
  have hT : TopGRecord := h.elim fun h =>
    _root_.GlobalTheory.Fc.forall_goal_of_shape_of_hyps _ _ _ _
      (UpperTheory.Top.shape_closed_link_n_of_green_record hG) trivial trivial h
  have hS := supplyChiDirect400 hV
  have hla : (1 : ℝ) < 3 / 2 := by norm_num
  have hw := principal_window_of_topGRecord hla hT hS
  first
  | (rh_reduce 3 using [Formalism.VW.rh_of_right, principal_right_of_window]; done)
  | (rh_auto 3; done)
  | (rh_auto_frontier 3; done)
  | exact Formalism.VW.rh_of_right (principal_right_of_window hla hw)

end RHPrincipalNative

rh_scan UpperTheory.Top.winPairs limit 2000
rh_scan UpperTheory.Top.winPairsDirect400 limit 2000
rh_scan UpperTheory.T3.supplyOfAdmOfDirect400 limit 2000
rh_scan RHPrincipalNative.principal_rh_direct400 limit 2000
rh_prune UpperTheory.Top.winPairsDirect400 as RHWinPairsDirect400Pruned
rh_prune UpperTheory.Top.supplyChiDirect400 as RHSupplyChiDirect400Pruned
#print axioms UpperTheory.Top.vwinDirect400_of_wide
#print axioms UpperTheory.Top.vwinDirect400_of_original
#print axioms UpperTheory.Top.winPairsDirect400
#print axioms UpperTheory.T3.supplyOfAdmOfDirect400
#print axioms UpperTheory.Top.supplyChiDirect400
#print axioms UpperTheory.Top.supplyChiDirect400_original_bridge
#print axioms RHPrincipalNative.principal_rh_direct400
end

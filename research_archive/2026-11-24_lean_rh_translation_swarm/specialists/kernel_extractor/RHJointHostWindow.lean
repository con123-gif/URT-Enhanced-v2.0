import RHWideHostWindowTransport

/-!
Lane 11, 25 Nov 2026 — joint-window arithmetic premise (PREPARED, NOT COMPILED).
Latest mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc including engine;
AGENTS, SWARM, HANDOFF, EXPANSION, continuity, current manuscript
7beedb2752d934a81d4c92b5a19c1c48362e0dc9, latest peers c11635a0 (two-sided
ramp), e02666f2 (count caller), 188850b1 (mass endpoint), e627db49
(signed slack), a543f365 (far range), e669681c (paired torsion), and
Galois e70e93e7 and editor 91754a9c (two reference integers) reviewed.
Distinct from their reductions. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Upstream latest 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a (unchanged from
prior lane); no mixing. Pinned ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7,
WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b,
PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939,
TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981,
supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc.
Prior lane RHWideHostWindowTransport.lean blob 31efce9c74ce3e8802475810d82662ea927355b6.
Arithmetic source VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4,
TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e.

Human proof block (conditional): fix eps and psi. It is not necessary
to prove the weighted cohomology bound for EVERY allowed page selector,
EVERY large X, and EVERY pair satisfying WinPair. Choose one J>=1.
For arbitrarily large M choose X>=M^J, W between X^(1/J) and sqrt(X),
and a SINGLE pair q,d satisfying the full PairGood at (X^(1/J),X).
For each z in [W,W²] it suffices to choose ONE page e(z) locally with
PageN(eps,z,e(z)) and VAtWide on that same pair and page. The choice
may vary with z; the pair and J cannot. This is weaker as an input
interface: the original VWinAtWide plus PairEx imply it (bridge below).
No converse or strict logical separation asserted. No dropping
all-eligible-field or full coefficient-prime/degree/finite-length guards.

The actual winPairs body has only one page use at z=x/k and one
VAt use at exactly the same z and page. Here k=c^(1/(2+8eps)).
Take M>=max(1,y,k³,k^400); then W>=M and [kW,(kW)^(3/2)]/k lies
in [W,W²] since k³<=W. The same source comparison
(kz)^400<=z^401 uses z>=k^400. Page multiplication by c
gives the native two rank inequalities and monotone wideBudget
transports the cohomology bound. All other WinDatumWide fields and
the actual host construction survive unchanged. No new norm loss.

Old overlay: VWinAtWide + PairEx -> winPairsWide -> supplyOfAdmOfWide
-> supplyOfAdmWide -> supplyChiWide -> principal_window_of_topGRecord
-> principal_rh_wide. New overlay: VWinAtJoint -> winPairsJoint ->
supplyOfAdmOfJoint -> supplyOfAdmJoint -> supplyChiJoint -> identical
TopGRecord/analytic endpoint. The old bridge still requires PairEx;
the direct joint input does not require a universal PairEx proof as
a separate supplier. Keep all PairGood character bounds and boxes.
Retain original source and previous candidate graph, no kernel-edge
deletion claimed. Context cache key pin, psi, eps,J,M,X,W,q,d,z,e,E.
No URT used: exact quantifier specialization, not ordering search.
Executed guarded source generation: 22 exact occurrence substitutions in
the prior overlay, with expected cardinalities checked. No Lean or Lake
on local PATH. Prior CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved; both pass only
for the older engine tests and conditional half-strip root. New file and
its imported overlays have not been compiled; no new axiom claim.
Open: direct joint window, full arithmetic and geometry, imported
replacement replay. RH OPEN.

RESUME HERE: replay prior R H wide chain (RHSelectedRecordDivisionBudget,
RHPrincipalNativeWindow, RHWideHostWindowTransport) then this file in
the pinned Lean environment. Check output of scans/prune and axiom
ledger, repair failures, compare caller edges. Arithmetic lane can
target the jointly chosen pair and local page instead of uniform
all-pair windows; do not claim this already follows from finite bounds.
HANDOFF TO: Galois, character boxes, integration, audit, editor.
-/

noncomputable section
open NumberField Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.HC GlobalTheory.EX UpperTheory.Top HostParam.Seam

namespace UpperTheory.Top

def VWinAtJoint (ψ : PChar) (Ct : ℝ) : Prop :=
  ∀ eps : ℝ, 0 < eps → eps < 1 / 52 →
    ∃ J : ℝ, 1 ≤ J ∧ ∀ M ≥ (1 : ℝ),
      ∃ (X W : ℝ) (q d : ℕ), M ^ J ≤ X ∧
        PairGood ψ.N eps (X ^ (1 / J)) X q d ∧
        X ^ (1 / J) ≤ W ∧ W ^ (2 : ℝ) ≤ X ∧
        ∀ z : ℝ, W ≤ z → z ≤ W ^ (2 : ℝ) →
          ∃ e : ℕ, PageN eps z e ∧ VAtWide ψ eps Ct q d e z

theorem vwinAtJoint_of_wide (ψ : PChar) (Ct : ℝ)
    (hV : VWinAtWide ψ Ct) (hP : PairEx) : VWinAtJoint ψ Ct := by
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
  have hW1 : 1 ≤ W := hA1.trans (hAX.trans hW0)
  refine ⟨X, W, q, d, (Real.rpow_le_rpow (by linarith : 0 ≤ M) hMA (by linarith : 0 ≤ J)).trans hXA,
    hpg, hW0, hW2, fun z hz hz2 => ⟨e z, hpage z (hW1.trans hz), hWV z hz hz2⟩⟩

theorem vwinAtJoint_of_original (ψ : PChar) (Ct : ℝ)
    (hV : VWinAt ψ Ct) (hP : PairEx) : VWinAtJoint ψ Ct :=
  vwinAtJoint_of_wide ψ Ct (vwinAtWide_of_vwinAt ψ Ct hV) hP

end UpperTheory.Top

theorem UpperTheory.Top.winPairsJoint :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → 1 ≤ c → VWinAtJoint ψ 401 →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatumWide ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV
  obtain ⟨J, hJ, hJoint⟩ := hV eps heps heps52
  have ha : 0 < 2 + 8 * eps := by linarith
  have hc0 : 0 ≤ c := by linarith
  obtain ⟨k, hk1, hka⟩ : ∃ k : ℝ, 1 ≤ k ∧ k ^ (2 + 8 * eps) = c := by
    refine ⟨c ^ (1 / (2 + 8 * eps)), Real.one_le_rpow hc (one_div_nonneg.2 ha.le), ?_⟩
    rw [one_div, Real.rpow_inv_rpow hc0 ha.ne']
  have hk0 : 0 ≤ k := by linarith
  refine ⟨J, hJ, fun y => ?_⟩
  have hJ0 : J ≠ 0 := ne_of_gt (by linarith)
  have hJi : 0 ≤ 1 / J := one_div_nonneg.2 (by linarith)
  obtain ⟨M, hM1, hMy, hMk3, hMk400⟩ : ∃ M : ℝ, 1 ≤ M ∧ y ≤ M ∧
      k ^ (3 : ℝ) ≤ M ∧ k ^ (400 : ℝ) ≤ M :=
    ⟨max 1 (max y (max (k ^ (3 : ℝ)) (k ^ (400 : ℝ)))), by simp, by simp, by simp, by simp⟩
  obtain ⟨X, W, q, d, hXM, hpg, hW0, hW2, hWV⟩ := hJoint M hM1
  have hM0 : 0 ≤ M := by linarith
  have hX1 : 1 ≤ X := (Real.one_le_rpow hM1 (by linarith)).trans hXM
  have hX0' : 0 ≤ X := by linarith
  have hY0M : M ≤ X ^ (1 / J) := by
    calc M = (M ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hM0 hJ0]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hM0 _) hXM hJi
  have hXJ : (X ^ (1 / J)) ^ J = X := by rw [one_div, Real.rpow_inv_rpow hX0' hJ0]
  have hWM : M ≤ W := hY0M.trans hW0
  have hW1 : 1 ≤ W := hM1.trans hWM
  have hWnn : 0 ≤ W := by linarith
  have hk3 : k ^ (3 : ℝ) ≤ W := hMk3.trans hWM
  have hlem : (k * W) ^ ((3 : ℝ) / 2) ≤ W ^ (2 : ℝ) := by
    have h1 : (k * W) ^ ((3 : ℝ) / 2) = ((k * W) ^ (3 : ℝ)) ^ ((1 : ℝ) / 2) := by
      rw [← Real.rpow_mul (mul_nonneg hk0 hWnn)]
      norm_num
    have h2 : W ^ (2 : ℝ) = (W ^ (4 : ℝ)) ^ ((1 : ℝ) / 2) := by
      rw [← Real.rpow_mul hWnn]
      norm_num
    rw [h1, h2]
    apply Real.rpow_le_rpow (Real.rpow_nonneg (mul_nonneg hk0 hWnn) _) _ (by norm_num)
    rw [Real.mul_rpow hk0 hWnn, show (4 : ℝ) = 1 + 3 by norm_num, Real.rpow_add (by linarith : 0 < W),
      Real.rpow_one]
    exact mul_le_mul_of_nonneg_right hk3 (Real.rpow_nonneg hWnn _)
  refine ⟨k * W, hMy.trans (hWM.trans (le_mul_of_one_le_left hWnn hk1)), fun x hZx hxZ => ?_⟩
  have hkpos : 0 < k := by linarith
  have hxW2 : x ≤ W ^ (2 : ℝ) := hxZ.trans hlem
  have hxX : x ≤ X := hxW2.trans hW2
  have hx1 : W ≤ x := (le_mul_of_one_le_left hWnn hk1).trans hZx
  have hx0 : 0 ≤ x := by linarith
  obtain ⟨x', rfl⟩ : ∃ x', x = k * x' := ⟨x / k, by field_simp⟩
  have hWx' : W ≤ x' := le_of_mul_le_mul_left hZx hkpos
  have hx'0 : 0 ≤ x' := hWnn.trans hWx'
  have hx'1 : 1 ≤ x' := hW1.trans hWx'
  have hx'x : x' ≤ k * x' := le_mul_of_one_le_left hx'0 hk1
  obtain ⟨e, hpage, hvAt⟩ := hWV x' hWx' (hx'x.trans hxW2)
  change ^ (2 + 8 * eps) ≤ 2 ^ e ∧ 2 ^ e ≤ 2 * x' ^ (2 + 8 * eps) at hpage
  have hpow : (k * x') ^ (2 + 8 * eps) = c * x' ^ (2 + 8 * eps) := by rw [Real.mul_rpow hk0 hx'0, hka]
  refine ⟨X ^ (1 / J), q, d, e, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact Real.rpow_le_rpow hx0 hxX hJi
  · exact hW0.trans hx1
  · exact hpg.mono (by rw [hXJ]; exact hxX)
  · rw [hpow]
    exact mul_le_mul_of_nonneg_left hpage.1 hc0
  · rw [hpow]
    calc c * 2 ^ (e) ≤ c * (2 * x' ^ (2 + 8 * eps)) := mul_le_mul_of_nonneg_left hpage.2 hc0
      _ = 2 * (c * x' ^ (2 + 8 * eps)) := by ring
  · intro E _ _ hE
    have hv := hvAt E hE
    refine hv.mono ?_ ?_
    · apply Nat.floor_mono
      rw [Real.mul_rpow hk0 hx'0, show (401 : ℝ) = 1 + 400 by norm_num, Real.rpow_add (by linarith : 0 < x'),
        Real.rpow_one]
      exact mul_le_mul_of_nonneg_right (hMk400.trans (hWM.trans hWx')) (Real.rpow_nonneg hx'0 _)
    · exact wideBudget_mono heps.le hx'0 hx'x

theorem UpperTheory.T3.supplyOfAdmOfJoint :
    (∀ eps C0 : ℝ, 0 < eps → eps < 1 / 52 → 1 ≤ C0 → ∃ CT2 C8 c6 Cb x0 : ℝ, C0 ≤ C8 ∧ 0 < c6 ∧ 0 < Cb ∧
      ∀ (s : Scale) (R : Ranks) (H0 : HostAx R.toFrame) (M : ℕ) (Y : ℝ), s.eps = eps → x0 ≤ s.x → RankVal s R →
        s.J ≤ C0 → (R.o : ℝ) ≤ C0 → (H0.QS : ℝ) ≤ C0 * R.n → 0 < M → (M : ℝ) ≤ C0 → H0.QS ∣ Nat.lcm (2 ^ (R.e + 2)) M →
        PairWin s Y → PairGood M eps Y s.x H0.q H0.d → FieldRows H0.toHostRaw ⌊Y ^ (eps / 5)⌋₊ → admitted R H0 →
        ∃ (H : Host R) (q0 : ℕ), H.toHostAx = H0 ∧ H.CT2 = CT2 ∧ HostGood s C8 4 c6 Cb H q0 ∧
          R.toFrame.Shares H.TT (s.x ^ (-1 + s.eps))) → ∀ ψ : PChar, VWinAtJoint ψ 401 →
      (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
        s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
        ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
      HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (s.b * (s.x ^ s.eps)^2)) := by
  intro hSup ψ hV hAdm eps heps heps'
  haveI := ψ.ne
  have hN0 : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  have heps0 : eps ≠ 0 := heps.ne'
  obtain ⟨c, e0, hc, hF⟩ := UpperTheory.Top.fieldChi ψ
  obtain ⟨J, hJ, hwin⟩ := UpperTheory.Top.winPairsJoint ψ eps (c : ℝ) heps heps' (by exact_mod_cast hc) hV
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

theorem UpperTheory.Top.supplyOfAdmJoint :
    ∀ ψ : PChar, VWinAtJoint ψ 401 →
    (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
      s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
      ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
    HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (s.b * (s.x ^ s.eps)^2)) :=
  UpperTheory.T3.supplyOfAdmOfJoint UpperTheory.Top.hostOfField

theorem UpperTheory.Top.supplyChiJoint :
    ∀ ψ : PChar, VWinAtJoint ψ 401 → HostExW (3 / 2) (GChiWide ψ).req := by
  intro ψ hψ
  refine supplyOfAdmJoint ψ hψ ?_
  intro eps he0 he1
  obtain ⟨x0, hx0⟩ := admissibleClassesTwistedChar eps he0 he1
  refine ⟨x0, fun s φ H0 hs hx hlo hhi _ _ => ?_⟩
  subst hs
  exact hx0 s φ H0 rfl hx hlo hhi


open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Pk Formalism.MainNotions.Lnk Formalism.MainNotions.GlobalTheoryTheory Formalism.L2.GlobalTheoryTheory Formalism.MainNotions.RT Formalism.L2.Top3 Formalism.L2.Top4

namespace RHPrincipalNative
theorem principal_rh_joint (hG : GlobalTheory.GLq.Green)
    (hV : VWinAtJoint PChar.one 401)
    (h : Nonempty (_root_.GlobalTheory.Fc.HypsAlt
      (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) _root_.GlobalTheory.Fc.DefiniteSideCondition)) :
    RiemannHypothesis := by
  have hT : TopGRecord := h.elim fun h =>
    _root_.GlobalTheory.Fc.forall_goal_of_shape_of_hyps _ _ _ _
      (UpperTheory.Top.shape_closed_link_n_of_green_record hG) trivial trivial h
  have hS := supplyChiJoint PChar.one hV
  have hla : (1 : ℝ) < 3 / 2 := by norm_num
  have hw := principal_window_of_topGRecord hla hT hS
  first
  | (rh_reduce 3 using [Formalism.VW.rh_of_right, principal_right_of_window]; done)
  | (rh_auto 3; done)
  | (rh_auto_frontier 3; done)
  | exact Formalism.VW.rh_of_right (principal_right_of_window hla hw)


end RHPrincipalNative

rh_scan UpperTheory.Top.winPairs limit 2000
rh_scan UpperTheory.Top.winPairsJoint limit 2000
rh_scan UpperTheory.T3.supplyOfAdmOfJoint limit 2000
rh_scan RHPrincipalNative.principal_rh_joint limit 2000
rh_prune UpperTheory.Top.winPairsJoint as RHWinPairsJointPruned
rh_prune UpperTheory.Top.supplyChiJoint as RHSupplyChiJointPruned
#print axioms UpperTheory.Top.vwinAtJoint_of_wide
#print axioms UpperTheory.Top.vwinAtJoint_of_original
#print axioms UpperTheory.Top.winPairsJoint
#print axioms UpperTheory.T3.supplyOfAdmOfJoint
#print axioms UpperTheory.Top.supplyChiJoint
#print axioms RHPrincipalNative.principal_rh_joint
end

import Development.AutomorphicArithmetic.CharacterBoxes.SupplyChi
import Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.TopShape
import Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.ShapeOf
import RHSelectedRecordDivisionBudget
import RHPrincipalNativeWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11, 2026-11-25. Source-matched, PREPARED NOT COMPILED.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Previous lane 82c81900, principal endpoint d131f208; current shared
manuscript 4f571d3bfce24fbaef352cd403666872a8981175.
Latest peers: 9e7a5f49 (mass-volume), 5ea960de (Vandermonde),
f7f5779b (classifier exponent); distinct from this host-budget transport.
Protocol, handoff, expansion, AGENTS and continuity read.
Source paths below relative to src/Development/AutomorphicArithmetic/:
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
CharacterBoxes/TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981
CharacterBoxes/WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
CharacterBoxes/HostOfField.lean d98214b25bf84966a5b4e858a35f21ac9193b49f
CharacterBoxes/SupplyChi.lean 339885b77069601fb716a60739369805241e8222
ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd
ShapeOf.lean 236d0eadd60b292bd0a832114f8c4a6253131250 (generic G).
Supply.lean b104f034fc9c13758e280d1b7d33ac1ea370663a;
ZeroFreeAllOfTopG.lean 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1.
Latest upstream observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a
(PR 2960); Main blob eb95ca808793dd61984cc853ab5630f54a74490c,
ExistsPageN b68a246116631ab047f73a0c4bb869c85e5fd779 changed vs pin;
old supplyOfAdmOf path 404 at latest. No cross-version equivalence.

RESULT: the SAME host and same window can carry the weaker budget
B(eps,x)=exp(x^eps)*(x^eps)^2 all the way from VWinAt to TopG.
The key is monotonicity: x>=x'>=0, eps>=0 implies
y'=x'^eps<=y=x^eps; exp(y')*y'^2 <= exp(y)*y^2.
In winPairs x=k*x', k>=1, so the original page/rank adjustment
and all six WinDatum fields remain valid, with only the last scalar
comparison changed. The actual host supplier uses WinDatum.bound
exactly once, on the selected H.E after isChiField; it only shrinks
the t cutoff and transports s.eps=eps. Its field, rank, pair, twist,
admission, kept characters, shares, and EAtH are unchanged.
TopShapeAlt is generic in its final goal, so the existing geometry
producer body is unchanged except its topDesWin consumer. There the
prior record-budget argument uses S<=b*y^2<=y*(B0+Nc).
The new endpoint requires VWinAtWide only at PChar.one and exactly
the existing Green and HypsAlt. The wide window hypothesis itself,
the original finite-length and uniformity requirements, and all
geometry/host premises remain OPEN. No Main or claimed RH import.

Old graph: VWinAt -> winPairs -> supplyOfAdmOf -> supplyOfAdm ->
supplyChi -> GChi.cls -> hypV_of_cls -> topDesWin -> TopG ->
principal window -> formB -> rh_of_right.
Overlay: VWinAtWide -> winPairsWide -> supplyOfAdmOfWide ->
supplyOfAdmWide -> supplyChiWide -> GChiWide.cls ->
HypVWide -> RecordBudget -> topDesWin_recordBudget -> TopGRecord ->
principal window -> same analytic endpoint. EAtH remains the same.
Original source graph and previous evidence retained, no global
kernel-edge deletion claimed. Cache key pin, psi, eps, q,d,e, J,
window Y, actual host H, t, record D and budget expression.
This is a local-to-caller premise weakening, not a new RH criterion.
No change to the universal quantifiers of VAt or VWinAt.

Execution: source transformation checked unique exact replacements
in the pinned source bodies, with 6 guarded scalar replacements.
No local Lean/Lake installed (command -v returned no paths).
Previous CI 45577239749 and 45576756833 status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 independently retrieved,
both pass; neither covers this new file or its two uncompiled imports.
No new native axiom result asserted.

RESUME HERE: compile RHSelectedRecordDivisionBudget and
RHPrincipalNativeWindow first in pinned Lean 4.33.1/Mathlib
0df444a360eaa60ab8c11dca51a86af692955474, then this file.
Inspect actual axioms and kernel scan output; repair errors before
adopting the overlay. Galois lane may now target the weaker budget,
not discard the uniform window, finite lengths or host conditions.
HANDOFF TO: Galois, theta, integration, audit, editor. RH OPEN.
-/

noncomputable section
open NumberField Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.HC GlobalTheory.EX UpperTheory.Top HostParam.Seam
namespace UpperTheory.Top

def wideBudget (eps x : ℝ) : ℝ := Real.exp (x ^ eps) * (x ^ eps)^2

theorem wideBudget_mono {eps x z : ℝ} (he : 0 ≤ eps) (hx : 0 ≤ x) (hz : x ≤ z) :
    wideBudget eps x ≤ wideBudget eps z := by
  have h : x ^ eps ≤ z ^ eps := Real.rpow_le_rpow hx hz he
  have h0 : 0 ≤ x ^ eps := Real.rpow_nonneg hx _
  have h1 : 0 ≤ z ^ eps := h0.trans h
  have hs : (x ^ eps)^2 ≤ (z ^ eps)^2 := by nlinarith
  unfold wideBudget
  exact mul_le_mul (Real.exp_le_exp.2 h) hs (sq_nonneg _) (Real.exp_pos _).le

theorem sqrt_le_wideBudget {eps x : ℝ} (hx : 1 ≤ x) (he : 0 ≤ eps) :
    Real.sqrt (Real.exp (x ^ eps)) ≤ wideBudget eps x := by
  have hy := Real.one_le_rpow hx he
  have hb : 1 ≤ Real.exp (x ^ eps) := Real.one_le_exp (by linarith)
  have hs : 1 ≤ (x ^ eps)^2 := by nlinarith
  unfold wideBudget
  exact (Real.sqrt_le_self_iff.2 (Or.inr hb)).trans
    (by simpa using mul_le_mul_of_nonneg_left hs (Real.exp_pos (x ^ eps)).le)

def VAtWide (ψ : PChar) (eps Ct : ℝ) (q d e : ℕ) (x : ℝ) : Prop :=
  ∀ (E : Type) [Field E] [NumberField E], IsChiField ψ e q d E → VVle E ⌊x ^ Ct⌋₊ (wideBudget eps x)

def VWinAtWide (ψ : PChar) (Ct : ℝ) : Prop :=
  ∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∀ e : ℝ → ℕ, (∀ x ≥ (1 : ℝ), PageN eps x (e x)) →
    ∃ J : ℝ, 1 ≤ J ∧ ∃ X0 : ℝ, ∀ X ≥ X0, ∀ q d : ℕ, WinPair eps (X ^ (1 / J)) q d →
      ∃ Y : ℝ, X ^ (1 / J) ≤ Y ∧ Y ^ (2 : ℝ) ≤ X ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ (2 : ℝ) → VAtWide ψ eps Ct q d (e x) x

structure WinDatumWide (ψ : PChar) (eps J c x Y : ℝ) (q d e : ℕ) : Prop where
  lo : x ^ (1 / J) ≤ Y
  up : Y ≤ x
  good : PairGood ψ.N eps Y x q d
  n_lo : x ^ (2 + 8 * eps) ≤ c * 2 ^ e
  n_up : c * 2 ^ e ≤ 2 * x ^ (2 + 8 * eps)
  bound : ∀ (E : Type) [Field E] [NumberField E], IsChiField ψ e q d E →
    VVle E ⌊x ^ (400 : ℝ)⌋₊ (wideBudget eps x)

theorem vwinAtWide_of_vwinAt (ψ : PChar) (Ct : ℝ) (h : VWinAt ψ Ct) :
    VWinAtWide ψ Ct := by
  intro eps he h52 e hepage
  obtain ⟨J, hJ, X0, hX0⟩ := h eps he h52 e hepage
  refine ⟨J, hJ, max X0 1, fun X hX q d hp => ?_⟩
  obtain ⟨Y, hY, hY2, hV⟩ := hX0 X (le_trans (le_max_left _ _) hX) q d hp
  refine ⟨Y, hY, hY2, fun x hx hx2 E _ _ hE => ?_⟩
  have hX1 : 1 ≤ X := (le_max_right _ _).trans hX
  have hY1 : 1 ≤ Y := (Real.one_le_rpow hX1 (one_div_nonneg.2 (by linarith))).trans hY
  exact (hV x hx hx2 E hE).mono le_rfl (sqrt_le_wideBudget (hY1.trans hx) he.le)

def GChiWide (ψ : PChar) : FReq := fun s _ H TT t =>
  EAtH (Level.cyc ψ) H.toHostRaw TT s.x s.eps 4 ∧
    VVle H.E t (s.b * (s.x ^ s.eps)^2)

def TopGRecord : Prop :=
  ∀ (la : ℝ) (G : FReq), 1 < la → HostExW la G.req →
    (∀ {eps : ℝ} (Fm : FamP eps), G.cls la Fm → RecordBudget Fm) →
    FamilyClassConnected (G.cls la)

theorem recordBudget_of_wide_cls (ψ : PChar) (la : ℝ) {eps : ℝ}
    (Fm : FamP eps) (h : (GChiWide ψ).cls la Fm) : RecordBudget Fm := by
  apply recordBudget_of_hypVWide
  exact ⟨Fm.x1 + 1, fun x hx i => (h.2 x (by linarith) i).2⟩

theorem eFamC_of_wide_cls (ψ : PChar) (la : ℝ) {eps : ℝ}
    (Fm : FamP eps) (h : (GChiWide ψ).cls la Fm) : EFamC (Level.cyc ψ) Fm.toFamCore := by
  refine ⟨4, Fm.x1 + 1, fun x hx i => ?_⟩
  have h1 := (h.2 x (by linarith) i).1
  rw [Fm.L_x x i (by linarith), Fm.L_eps x i] at h1
  exact h1

end UpperTheory.Top

theorem UpperTheory.Top.winPairsWide :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → 1 ≤ c → VWinAtWide ψ 401 → PairEx →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatumWide ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV hP
  obtain ⟨e, he⟩ := exists_pageN eps heps
  obtain ⟨J, hJ, X0, hX0⟩ := hV eps heps heps52 e he
  have hN : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  obtain ⟨Y1, hY1⟩ := hP ψ.N hN eps J heps heps52 hJ
  have ha : 0 < 2 + 8 * eps := by linarith
  have hc0 : 0 ≤ c := by linarith
  obtain ⟨k, hk1, hka⟩ : ∃ k : ℝ, 1 ≤ k ∧ k ^ (2 + 8 * eps) = c := by
    refine ⟨c ^ (1 / (2 + 8 * eps)), Real.one_le_rpow hc (one_div_nonneg.2 ha.le), ?_⟩
    rw [one_div, Real.rpow_inv_rpow hc0 ha.ne']
  have hk0 : 0 ≤ k := by linarith
  refine ⟨J, hJ, fun y => ?_⟩
  have hJ0 : J ≠ 0 := ne_of_gt (by linarith)
  have hJi : 0 ≤ 1 / J := one_div_nonneg.2 (by linarith)
  obtain ⟨M, hM1, hMy, hMY1, hMk3, hMk400⟩ : ∃ M : ℝ, 1 ≤ M ∧ y ≤ M ∧ Y1 ≤ M ∧
      k ^ (3 : ℝ) ≤ M ∧ k ^ (400 : ℝ) ≤ M :=
    ⟨max 1 (max y (max Y1 (max (k ^ (3 : ℝ)) (k ^ (400 : ℝ))))), by simp, by simp, by simp, by simp, by simp⟩
  obtain ⟨X, hXX0, hXM⟩ : ∃ X : ℝ, X0 ≤ X ∧ M ^ J ≤ X := ⟨max X0 (M ^ J), le_max_left _ _, le_max_right _ _⟩
  have hM0 : 0 ≤ M := by linarith
  have hX1 : 1 ≤ X := (Real.one_le_rpow hM1 (by linarith)).trans hXM
  have hX0' : 0 ≤ X := by linarith
  have hY0M : M ≤ X ^ (1 / J) := by
    calc M = (M ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hM0 hJ0]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hM0 _) hXM hJi
  have hXJ : (X ^ (1 / J)) ^ J = X := by rw [one_div, Real.rpow_inv_rpow hX0' hJ0]
  obtain ⟨q, d, hpg⟩ := hY1 (X ^ (1 / J)) (hMY1.trans hY0M)
  obtain ⟨W, hW0, hW2, hWV⟩ := hX0 X hXX0 q d hpg.pair
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
  have hpage : x' ^ (2 + 8 * eps) ≤ 2 ^ (e x') ∧ 2 ^ (e x') ≤ 2 * x' ^ (2 + 8 * eps) := he x' hx'1
  have hpow : (k * x') ^ (2 + 8 * eps) = c * x' ^ (2 + 8 * eps) := by rw [Real.mul_rpow hk0 hx'0, hka]
  refine ⟨X ^ (1 / J), q, d, e x', ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact Real.rpow_le_rpow hx0 hxX hJi
  · exact hW0.trans hx1
  · exact hpg.mono (by rw [hXJ]; exact hxX)
  · rw [hpow]
    exact mul_le_mul_of_nonneg_left hpage.1 hc0
  · rw [hpow]
    calc c * 2 ^ (e x') ≤ c * (2 * x' ^ (2 + 8 * eps)) := mul_le_mul_of_nonneg_left hpage.2 hc0
      _ = 2 * (c * x' ^ (2 + 8 * eps)) := by ring
  · intro E _ _ hE
    have hv := hWV x' hWx' (hx'x.trans hxW2) E hE
    refine hv.mono ?_ ?_
    · apply Nat.floor_mono
      rw [Real.mul_rpow hk0 hx'0, show (401 : ℝ) = 1 + 400 by norm_num, Real.rpow_add (by linarith : 0 < x'),
        Real.rpow_one]
      exact mul_le_mul_of_nonneg_right (hMk400.trans (hWM.trans hWx')) (Real.rpow_nonneg hx'0 _)
    · exact wideBudget_mono heps.le hx'0 hx'x

theorem UpperTheory.T3.supplyOfAdmOfWide :
    (∀ eps C0 : ℝ, 0 < eps → eps < 1 / 52 → 1 ≤ C0 → ∃ CT2 C8 c6 Cb x0 : ℝ, C0 ≤ C8 ∧ 0 < c6 ∧ 0 < Cb ∧
      ∀ (s : Scale) (R : Ranks) (H0 : HostAx R.toFrame) (M : ℕ) (Y : ℝ), s.eps = eps → x0 ≤ s.x → RankVal s R →
        s.J ≤ C0 → (R.o : ℝ) ≤ C0 → (H0.QS : ℝ) ≤ C0 * R.n → 0 < M → (M : ℝ) ≤ C0 → H0.QS ∣ Nat.lcm (2 ^ (R.e + 2)) M →
        PairWin s Y → PairGood M eps Y s.x H0.q H0.d → FieldRows H0.toHostRaw ⌊Y ^ (eps / 5)⌋₊ → admitted R H0 →
        ∃ (H : Host R) (q0 : ℕ), H.toHostAx = H0 ∧ H.CT2 = CT2 ∧ HostGood s C8 4 c6 Cb H q0 ∧
          R.toFrame.Shares H.TT (s.x ^ (-1 + s.eps))) → ∀ ψ : PChar, VWinAtWide ψ 401 →
      (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
        s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
        ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
      HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (s.b * (s.x ^ s.eps)^2)) := by
  intro hSup ψ hV hAdm eps heps heps'
  haveI := ψ.ne
  have hN0 : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  have heps0 : eps ≠ 0 := heps.ne'
  obtain ⟨c, e0, hc, hF⟩ := UpperTheory.Top.fieldChi ψ
  obtain ⟨J, hJ, hwin⟩ := UpperTheory.Top.winPairsWide ψ eps (c : ℝ) heps heps' (by exact_mod_cast hc) hV QH.pairEx
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

theorem UpperTheory.Top.supplyOfAdmWide :
    ∀ ψ : PChar, VWinAtWide ψ 401 →
    (∀ eps : ℝ, 0 < eps → eps < 1 / 52 → ∃ x0 : ℝ, ∀ (s : Scale) (φ : Frame) (H0 : HostAx φ), s.eps = eps → x0 ≤ s.x →
      s.x ^ (2 + 8 * eps) ≤ (φ.ord : ℝ) → (φ.ord : ℝ) ≤ 2 * s.x ^ (2 + 8 * eps) → φ.o = (Level.cyc ψ).o → KerChi ψ H0.toHostRaw →
      ∃ (R : Ranks) (h : R.toFrame = φ), RankVal s R ∧ admitted R (h ▸ H0)) →
    HostExW (3 / 2) (fun _ s R H _ => EAtH (Level.cyc ψ) H.toHostRaw H.TT s.x s.eps 4 ∧ VVle H.E R.t (s.b * (s.x ^ s.eps)^2)) :=
  UpperTheory.T3.supplyOfAdmOfWide UpperTheory.Top.hostOfField

theorem UpperTheory.Top.supplyChiWide :
    ∀ ψ : PChar, VWinAtWide ψ 401 → HostExW (3 / 2) (GChiWide ψ).req := by
  intro ψ hψ
  refine supplyOfAdmWide ψ hψ ?_
  intro eps he0 he1
  obtain ⟨x0, hx0⟩ := admissibleClassesTwistedChar eps he0 he1
  refine ⟨x0, fun s φ H0 hs hx hlo hhi _ _ => ?_⟩
  subst hs
  exact hx0 s φ H0 rfl hx hlo hhi


open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Pk Formalism.MainNotions.Lnk Formalism.MainNotions.GlobalTheoryTheory Formalism.L2.GlobalTheoryTheory Formalism.MainNotions.RT Formalism.L2.Top3 Formalism.L2.Top4

set_option maxHeartbeats 2000000 in
theorem UpperTheory.Top.shape_closed_link_n_of_green_record : GlobalTheory.GLq.Green → _root_.GlobalTheory.Fc.TopShapeAlt True True (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) UpperTheory.Top.TopGRecord := by
  intro hGreen 𝒜 cT hEx sel hduty selS selP selDH selC selB hRB hTw hPA hLamP hDivG hDcPtG hTu hn4 hLit hVC hWu hRF hTF c30 hc30 sTy sNG sM sLp sO h30 hInstR selJ jOn hMt rRows aPt0 aPtTw aPer0 aPerTw aP10 aAtG aC2 hServ nR nRest cIc hcI irrC zL tie hU hG la G hla hH hV
  have hgl := GlobalTheory.Top.link_gl 𝒜 hduty tie hU hG
  have bRest := _root_.GlobalTheory.Top.link_brest_alt 𝒜 sel selS selP selDH selC selB hRB hPA hDivG hDcPtG rRows tie
  have hCsz : Closed (D3 3 𝒜) fun Fm _ => 0 ≤ Fm.Csz := Formalism.MainNotions.DIV.closed_Csz_ge_fn (D3 3 𝒜) fun _ => 0
  have oneMap : Closed (D3 3 𝒜) fun Fm _ => ∀ hc : D3 3 𝒜 Fm, _root_.Formalism.L2.Top4.EventuallyAlongSelection sel Fm (d3_a hc) ((_root_.Formalism.L2.Top4.SingleMapCondition selB) Fm (d3_a hc)) :=
    Closed.of_class fun Fm _ _ hc => ⟨0, fun x hx h _ i j => (hRB Fm (d3_a hc) x hx h i).oneMap j⟩
  have hA2 := _root_.GlobalTheory.Top.closed_family_admissible_twist_link_alt 𝒜 sel aPt0 aPtTw aPer0 aPerTw aP10 aAtG hServ
  have hC5 := _root_.GlobalTheory.Top.selection_closed_of_wu_decay_alt 𝒜 sel selS selP selDH selC selB hWu hRF selJ jOn rRows
  have hBR : Closed (D3 3 𝒜) fun Fm CH => ∀ hc : D3 3 𝒜 Fm, TuSize Fm → DGamSize Fm →
      _root_.Formalism.L2.DIV.DivisionKernelConstantBounds Fm (_root_.Formalism.L2.Top4.RankOfDivisionKernel sel selS selP selDH selC (_root_.Formalism.L2.Top4.kernelChoiceOfSelection selB) (_root_.Formalism.L2.Top4.indefiniteRealisationChoiceOfSelection selB) hPA Fm hc) 2 CH :=
    (bRest.and ((Closed.of_class fun Fm _ hc => cut_of_stable (hMt Fm (d3_a hc))).and (rRows.and (oneMap.and (hCsz.and (hA2.and (aC2.and hC5))))))).imp
      fun Fm CH _ ⟨r, o, rr, om, cz, a, c, c5⟩ hc hT hD =>
        (r hc hT hD).toRows_alt (fun hN => _root_.GlobalTheory.Top.wire_sel_alt 𝒜 sel selS selP selDH selC selB hTw hPA hDivG hDcPtG Fm hc CH cz hD (rr hc) (om hc) (r hc hT hD).bu hN) o a (complement_two_of_items c) c5
  have hDIV := _root_.Formalism.L2.DIV.closed_linkDIVt_of_closed_bridge_kernel (D3 3 𝒜) 2 (_root_.Formalism.L2.Top4.RankOfDivisionKernel sel selS selP selDH selC (_root_.Formalism.L2.Top4.kernelChoiceOfSelection selB) (_root_.Formalism.L2.Top4.indefiniteRealisationChoiceOfSelection selB) hPA) hBR
  have hsub : ∀ {eps : ℝ} (Fm : FamP eps), WithTw (WithSm (WithChN fun Fm => 𝒜 Fm ∧ G.cls la Fm)) Fm →
      WithTw (WithSm (WithChN 𝒜)) Fm := fun _ hc => ⟨⟨⟨hc.1.1.1.1, hc.1.1.2⟩, hc.1.2⟩, hc.2⟩
  have hE := _root_.GlobalTheory.Top.designExists_of_tuSize_aux4n_litThin (fun Fm => 𝒜 Fm ∧ G.cls la Fm) cT (fun hM => hEx hM la G hla hH) (fun Fm hc => sel Fm hc.1)
    (fun Fm hc => hduty Fm hc.1) (Pk.Closed.sub hTu hsub) (Pk.Closed.sub hn4 hsub) hLit
  exact UpperTheory.Top.topDesWin_recordBudget (WithChN 𝒜) (WithChN fun Fm => 𝒜 Fm ∧ G.cls la Fm) (G.cls la) 2 3 2 0 hE
    (fun _ hc => ⟨hc.1.1, hc.2⟩) (fun _ hc => hc.1.2) hV nRest (_root_.GlobalTheory.Top.closed_linkEta_of_duty 𝒜 sel hduty)
    (_root_.GlobalTheory.Top.Irr.closed_linkIRR_of_join_count hGreen 𝒜 sel cIc hcI irrC) (_root_.GlobalTheory.Top.link_alt_alt_alt 𝒜 sel selS selP selDH selC selB hPA hLamP hDivG zL) hDIV hgl.1 (_root_.GlobalTheory.Top.closed_linkG_of_duty 𝒜 sel hduty)
    (_root_.GlobalTheory.Top.link_alt_alt_bis 𝒜 sel selS hWu hRF hTF c30 hc30 sTy sNG sM sLp sO h30 hInstR) hgl.2


namespace RHPrincipalNative
theorem principal_window_of_topGRecord {la : ℝ} (hla : 1 < la) (h : TopGRecord)
    (hS : HostExW la (GChiWide PChar.one).req) :
    ∀ E : ℝ, 0 < E → HasWindows {x | Deduction.G x ≤ x ^ ((1 : ℝ) / 2 + E)} la := by
  intro E hE
  obtain ⟨eD, eL, ε₁, h1, h2⟩ :=
    h la (GChiWide PChar.one) hla hS (recordBudget_of_wide_cls PChar.one la)
  obtain ⟨eps, he, hlt, hCe⟩ := exists_small_eps (eD + eL + 7) hE h1
  obtain ⟨Fm, c, d⟩ := h2 eps he hlt
  obtain ⟨x1, hx⟩ :=
    UpperTheory.Comparison₂.level_gm_le_on_family_scales (Level.cyc PChar.one)
      eD eL eps he Fm (eFamC_of_wide_cls PChar.one la Fm c) d
  refine ((windows_iff _ la).1 c.1).mono (x0 := max x1 1) ?_
  intro x hxx hw
  change Deduction.G x ≤ _
  rw [← cyc_one_gm]
  exact (hx x (le_of_max_le_left hxx) hw).trans
    (Real.rpow_le_rpow_of_exponent_le (le_of_max_le_right hxx) (by linarith))

theorem principal_rh_wide (hG : GlobalTheory.GLq.Green)
    (hV : VWinAtWide PChar.one 401)
    (h : Nonempty (_root_.GlobalTheory.Fc.HypsAlt
      (fun 𝒞 => Closed 𝒞 fun Fm _ => LinkN Fm) _root_.GlobalTheory.Fc.DefiniteSideCondition)) :
    RiemannHypothesis := by
  have hT : TopGRecord := h.elim fun h =>
    _root_.GlobalTheory.Fc.forall_goal_of_shape_of_hyps _ _ _ _
      (UpperTheory.Top.shape_closed_link_n_of_green_record hG) trivial trivial h
  have hS := supplyChiWide PChar.one hV
  have hla : (1 : ℝ) < 3 / 2 := by norm_num
  have hw := principal_window_of_topGRecord hla hT hS
  first
  | (rh_reduce 3 using [Formalism.VW.rh_of_right, principal_right_of_window]; done)
  | (rh_auto 3; done)
  | (rh_auto_frontier 3; done)
  | exact Formalism.VW.rh_of_right (principal_right_of_window hla hw)

end RHPrincipalNative

rh_scan UpperTheory.T3.supplyOfAdmOf limit 2000
rh_scan UpperTheory.T3.supplyOfAdmOfWide limit 2000
rh_scan UpperTheory.Top.shape_closed_link_n_of_green_record limit 2000
rh_scan RHPrincipalNative.principal_rh_wide limit 2000
rh_prune UpperTheory.Top.winPairsWide as RHWinPairsWidePruned
rh_prune UpperTheory.Top.supplyChiWide as RHSupplyChiWidePruned
#print axioms UpperTheory.Top.winPairs
#print axioms UpperTheory.Top.winPairsWide
#print axioms UpperTheory.T3.supplyOfAdmOf
#print axioms UpperTheory.T3.supplyOfAdmOfWide
#print axioms UpperTheory.Top.supplyChiWide
#print axioms UpperTheory.Top.shape_closed_link_n_of_green_record
#print axioms RHPrincipalNative.principal_rh_wide
end

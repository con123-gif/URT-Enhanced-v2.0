import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration, 25 Nov 2026. Source-matched candidate, NOT compiled.
One contribution: actual core AND ch_core consumer replacement with
a signed SUM over the actual translation subgroup, not pointwise loss.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de;
CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read including mandatory
engine; living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc, SWARM,
HANDOFF, AGENTS, state consulted. Source transformation 10 unique
replacements executed. No Main import, original declarations unchanged.

Mathematical invariant: writing L(u)=sum_{t,j} Re Th, native th_le and
ch_balance prove L(u)<=gapA(u)+2Q/x. The consumer only uses sum_u L(u).
Consequently the weaker sufficient input is
   sum_{u in A0} gapA(u) <= |A0| Err.
Sum the existing signed inequality BEFORE imposing a bound. Then the
exact native sum_Th and original hY produce the original core conclusion.
This works for signed Err; no multiplication by a negative scalar,
no choice of independently minimizing witnesses, no normalization over
unequal fibres. The old pointwise premise implies the new one by summing.
The new ch_core retains the exact original error bracket, which is
nonnegative in actual core_gm (hBr), so no signed height issue arises
if a signed quotient budget K+J is bounded by that bracket.
If instead passing signed E=2(K+J)/(Qd)+4/(xd) to the principal height
bridge, preserve F_*(x)<=1+(x/mean y)E (Landau 29c54b4f); do not drop
x/mean y when E<0. This is not a further downstream RH criterion.
The previous selected-witness certificate 3eba527a is distinct: it
requires an actual maximizing/mean-dominating translation. This route
does not select one and is compatible with 0810c534's joint fibre budget.

Exact source-visible graph before:
  core_gm -> ch_core -> core -> th_le,ch_balance,sum_Th,hTop pointwise.
Candidate:
  core_gm (future caller overlay) -> ch_core_mean38 -> core_mean38
    -> same th_le,ch_balance,sum_Th,hTop SUM.
Original bridges provided at both native consumer levels; no claim
of global dependency deletion. All EAtH/CoreAtH, hLed, arithmetic
and geometry producers remain open. Cache key includes source/toolchain,
H,A0,D,N,TT,T2,a,w,host and exact Err/epsilon/cutoff; same contexts only.
Backtrack to original ch_core if consumer overlay fails.
Source checked native core_gm consumes ch_top via hcov and hBr; must
replace this caller only when a same-host SUM supplier is available.

Actual conditional diagonal root verification:
CI 45670987597 (head f41c3be3d8ef2c727333f09ceb42b76bb503bb53)
job 139405972693 log independently fetched: RH32SingletonPoleData 0,
RH33DirectLogWindow 0, RH33DiagonalRoot 0; 'Conditional diagonal analytic
bridge checked; arithmetic premise not proved.' All three jobs success.
Status blob 0669c532840ad3a26459a9ac71be41d6f4bc9fb1 returncode 0,
277.66s. Strict runner checks eight axiom lists against only propext,
Classical.choice, Quot.sound, 10 bounded scans, 3 prune outcomes and
generated bridges if applicable. Artifact 15050511588, SHA256
4aae041911e10310fdf0550d16075439491002efe9e2e8275c9c923ff7937a86.
Direct result.json and scan_bridge_ledger.json fetch failed 404,
including logs/ variant; do not claim raw individual scan/prune results.
Original import DAG hash 9252a80c4094145869e93fd6d1eca4aad36eef018a0efb30b353f831c1a5aceb;
scan ledger bfc96285b20dcf1398c3354ad55c737b08bf69e130f4185cad053a4afa1c38c2.
Failed parser run 45663493094 retained. Prior engine CI only baseline.
No Lean/Lake on local PATH; THIS file not compiled or queued. No new
axiom evidence, no root discharge, no URT benchmark or claimed speedup.

Executed exact finite signed-sum regression in connector JS:
17010 cases satisfying aggregate input (three integer gaps, Err
from -4..4, constant offsets -2..2), 1377 aggregate-admissible
triples not pointwise admissible (before offsets). Generic negative
control gaps [0,2], Err=1 satisfy aggregate but not pointwise. These
are scalar logical tests, not actual geometric witnesses or prime tests.

Peer frontier consulted (recent commit diff or full relevant note):
c0c7d3f7 shared trace/gauge rank, 3232ac0e one Haar calibration,
21574277 CaseI inverse exceptions empty on native host, a7ba9251
dyadic exception sum, 2a39654b shallow K2 exact log card, 42529776
CountQ dual, e9256be1 residual transport, 9f9a5e0e odd layer,
410fcbc2 canonical gauge, 31cc317d loss-free shallow descent,
6c92b85b conditional Kato, 47b619fd torsion, dcf3192e exact fibre,
29c54b4f conditional analytic pass/sign guard. All upstream candidates
still PREPARED unless independently certified; no new peer root closure.
Do not infer KatoUseN from KatoTwo or infer VWinAt from isolated estimates.

RESUME HERE: compile this exact file with pinned warmed runner and
engine modules, inspect both original bridges and actual bounded scans,
then substitute ch_core_mean38 at core_gm using the SAME host's joint
budget K+J <= nonnegative native Err. Do not require independent
per-translation LossBounds at that caller; other consumers retained.
Upstream priority remains producing this bound and full VWinAt(1,401)
on arbitrarily distant complete windows, not rewriting Landau.
HANDOFF TO kernel, audit, geometry, editor. RH OPEN.
-/

open Finset
noncomputable section
namespace Deduction
open Deduction.CH Formalism Formalism.D5 Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.LChain
namespace CharacterBalanceMoves
variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]

lemma core_mean38 (A0 : AddSubgroup H) (D : ArithData H) (S : Finset ℕ) (hD : HostFactsS D S) (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) {m : ℕ}
    (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ) {x b b' η X' θ Err Y : ℝ}
    (hx : 3 ≤ x) (hb : 0 < b) (hS : SizesA A0 TT T2 a w N x b b' η X' θ) (hThin : ThinScales D ell X' θ)
    (hC : CostWindows x (fPl H) b η θ) (hT2 : ∀ s ∈ T2, s ∈ A0)
    (hTop : (∑ u : A0, gapA D N ell TT a w u) ≤ (Fintype.card A0 : ℝ) * Err)
    (hY : (TT.card : ℝ) * Y ≤ ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) :
    (TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x := by
  classical
  obtain ⟨hη, hX', hb', hbX, hθ, ha, hwpos, hwthick, hwthin, hN⟩ := hS
  have hapos : ∀ t ∈ TT, 0 < a t := fun t ht => by
    have h1 : x - 1 ≤ a t / b := by linarith [(abs_le.1 (ha t ht)).1]
    rw [le_div_iff₀ hb] at h1
    nlinarith
  have hK : 2 * fPl H * (3 * (x + 1) * (η + 1) + (x + 1) * b * θ) ≤ 2 * b / x := by
    have h1 := mul_le_mul_of_nonneg_left hC.1 hb.le
    have h2 := hC.2
    have e : 2 * b / x = b * (1 / x) + b / x := by ring
    rw [e]
    nlinarith
  have hu : ∀ u0 ∈ A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u0 t).re ≤ gapA D N ell TT a w u0 + 2 * (TT.card : ℝ) * m * b / x := by
    intro u0 hu0
    have h1 : ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u0 t).re
        ≤ ∑ t ∈ TT, ∑ j : Fin m, (ASK D N (a t) t (w u0 j) - (MAIN ell (a t) (w u0 j)).re + 2 * b / x) := by
      refine Finset.sum_le_sum fun t ht => Finset.sum_le_sum fun j _ => ?_
      have k1 := th_le D ell T2 x b b' η X' θ (a t) u0 t (w u0 j) hx hb hη hX' hb' hbX hθ (ha t ht) (hwpos u0 hu0 j)
        (hwthick u0 hu0 j) (hwthin u0 hu0 j) hThin (lipschitz_weight_all H D ell)
      have k2 := congrArg Complex.re (ch_balance D S hD ell (a t) t (w u0 j) (hapos t ht) (hwpos u0 hu0 j) N
        (fun ρ hρ => hN u0 hu0 j t ρ ht hρ))
      rw [Complex.sub_re, Complex.ofReal_re] at k2
      linarith
    simp only [Finset.sum_add_distrib] at h1
    have e : ∑ _t ∈ TT, ∑ _j : Fin m, 2 * b / x = 2 * (TT.card : ℝ) * m * b / x := by
      simp only [Finset.sum_const, nsmul_eq_mul, Finset.card_univ, Fintype.card_fin]
      ring
    rw [e] at h1
    unfold gapA
    linarith
  have hA : (0 : ℝ) < Fintype.card A0 := by exact_mod_cast Fintype.card_pos
  have h1 : ∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re
      ≤ (Fintype.card A0 : ℝ) * (Err + 2 * (TT.card : ℝ) * m * b / x) := by
    refine (Finset.sum_le_sum fun (u : A0) _ => hu u u.2).trans ?_
    rw [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul, Finset.card_univ, mul_add]
    linarith
  have h2 : ∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re
      = (Fintype.card A0 : ℝ) * ((m * b * (delta2 T2 / 2)) *
        ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) := by
    rw [Finset.sum_comm, Finset.mul_sum, Finset.mul_sum]
    refine Finset.sum_congr rfl fun t _ => ?_
    simp only [Finset.sum_const, nsmul_eq_mul, Finset.card_univ, Fintype.card_fin]
    rw [← Finset.mul_sum, ← Complex.re_sum, sum_Th A0 D ell T2 hT2, Complex.re_ofReal_mul]
    ring
  rw [h2] at h1
  have h3 := le_of_mul_le_mul_left h1 hA
  have h4 : 0 ≤ (m : ℝ) * b * (delta2 T2 / 2) := by unfold delta2; positivity
  have h5 := mul_le_mul_of_nonneg_left hY h4
  nlinarith

lemma core_mean38_original (A0 : AddSubgroup H) (D : ArithData H) (S : Finset ℕ) (hD : HostFactsS D S) (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) {m : ℕ}
    (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ) {x b b' η X' θ Err Y : ℝ}
    (hx : 3 ≤ x) (hb : 0 < b) (hS : SizesA A0 TT T2 a w N x b b' η X' θ) (hThin : ThinScales D ell X' θ)
    (hC : CostWindows x (fPl H) b η θ) (hT2 : ∀ s ∈ T2, s ∈ A0)
    (hTop : ∀ u0 ∈ A0, gapA D N ell TT a w u0 ≤ Err)
    (hY : (TT.card : ℝ) * Y ≤ ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) :
    (TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x := by
  classical
  refine core_mean38 A0 D S hD ell N TT T2 a w hx hb hS hThin hC hT2 ?_ hY
  calc
    _ ≤ ∑ _u : A0, Err := Finset.sum_le_sum fun (u : A0) _ => hTop u u.2
    _ = _ := by rw [Finset.sum_const, nsmul_eq_mul, Finset.card_univ]

end CharacterBalanceMoves

set_option maxHeartbeats 1600000 in
theorem ch_core_mean38 (C ε CE Ko c M : ℝ) (hC : 0 ≤ C) (hε : 0 < ε) (hc : |c| ≤ 1) : ∃ x1 : ℝ, ∀ x ≥ x1,
    ∀ (H : Type) [AddCommGroup H] [Fintype H] [DecidableEq H] (m : ℕ) (D : ArithData H) (S : Finset ℕ)
      (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ)
      (b b' k aE η X' θ : ℝ) (A0 : AddSubgroup H) (Kp : Finset (AddChar (E0 × H) ℂ)),
      HostFactsS D S → 0 < b → 0 ≤ aE → 0 < k → (m : ℝ) ≤ x ^ ((1 : ℝ) / 2 + ε / 2) → x * m ≤ k →
      SizesA A0 TT T2 a w N x b b' η X' θ → ThinScales D ell X' θ → CostWindows x (fPl H) b η θ →
      RestSize ε x (Fintype.card H) TT.card T2.card m b k aE → (∀ s ∈ T2, s ∈ A0) → CharsA ell A0 Kp TT c M Ko CE ε x →
      ((∑ u : A0, gapA D N ell TT a w u) ≤ (Fintype.card A0 : ℝ) * (x ^ (C * ε) * errorBracketSizeWindows x ε (Fintype.card H) TT.card T2.card m b k aE)) →
      GmA D ell Kp c x ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) + SigA D ell A0 Kp x := by
  obtain ⟨Cd, hCd, hDer⟩ := derivative_integral_all
  obtain ⟨x₁, hx₁⟩ := Filter.eventually_atTop.1
    ((tendsto_rpow_atTop (show 0 < 3 * ε / 8 by positivity)).eventually_ge_atTop 26)
  set A1 : ℝ := 5 + Cd + |Ko| + |M| * (4 + Cd + |Ko|) + 4 * |CE| with hA1
  have hA10 : 0 ≤ A1 := by positivity
  obtain ⟨x₂, hx₂⟩ := Filter.eventually_atTop.1
    ((tendsto_rpow_atTop (show (0 : ℝ) < 1 / 4 by norm_num)).eventually_ge_atTop (|M| * A1))
  refine ⟨max 3 (max x₁ x₂), fun x hx => ?_⟩
  intro H _ _ _ m D S ell N TT T2 a w b b' k aE η X' θ A0 Kp hHost hb ha hk hm hxm hS hThin hCost hSize hT2 hCh hTop
  obtain ⟨h0K, hKp, hM, hE2, hKo, hE3⟩ := hCh
  have hx3 : 3 ≤ x := le_of_max_le_left hx
  have h26 := hx₁ x (le_of_max_le_left (le_of_max_le_right hx))
  have hbig := hx₂ x (le_of_max_le_right (le_of_max_le_right hx))
  have hx0 : 0 < x := by linarith
  have w1 : 1 ≤ x := by linarith
  have hW : SizeWindows C ε x (Fintype.card H) TT.card T2.card m b k aE
      (x ^ (C * ε) * errorBracketSizeWindows x ε (Fintype.card H) TT.card T2.card m b k aE) :=
    (size_windows_split _ _ _ _ _ _ _ _ _ _ _).2 ⟨hSize, le_refl _, ⟨hx3, h26⟩, hε, hC,
      Fintype.card_pos, hb, ha, Finset.card_le_univ T2, hm, hxm⟩
  set s : ℝ := x ^ ((1 : ℝ) / 4) with hs
  set e : ℝ := x ^ ε with he
  have hs1 : 1 ≤ s := Real.one_le_rpow w1 (by norm_num)
  have he1 : 1 ≤ e := Real.one_le_rpow w1 hε.le
  have hX : x ^ ((1 : ℝ) / 2 + ε) = s * (s * e) := by
    rw [hs, he, ← Real.rpow_add hx0, ← Real.rpow_add hx0]
    congr 1
    ring
  have hρ : x ^ (-1 + ε) * x = e := by
    rw [Real.rpow_add hx0, Real.rpow_neg_one]
    field_simp
    rfl
  have hl0 : 0 ≤ Real.log x := Real.log_nonneg w1
  have hl : Real.log x ≤ 4 * s := by
    have := Real.log_le_rpow_div hx0.le (by norm_num : (0 : ℝ) < 1 / 4)
    linarith
  have hl1 : Real.log (x + 1) ≤ 5 * s := by
    have h1 : Real.log (x + 1) ≤ Real.log (2 * x) := Real.log_le_log (by linarith) (by linarith)
    rw [Real.log_mul (by norm_num) hx0.ne'] at h1
    have h2 : Real.log 2 ≤ 2 - 1 := Real.log_le_sub_one_of_pos (by norm_num)
    linarith
  have hse : s ≤ s * e := le_mul_of_one_le_right (by linarith) he1
  have hse1 : 1 ≤ s * e := by linarith
  have up : ∀ z : ℝ, 0 ≤ z → z ≤ z * (s * e) := fun z hz => le_mul_of_one_le_right hz hse1
  have hMe : 0 ≤ |M| * (4 + Cd + |Ko|) * (s * e) := by positivity
  have hCe : 0 ≤ |CE| * (s * e) := by positivity
  have hKe : 0 ≤ |Ko| * (s * e) := by positivity
  have hCde : 0 ≤ Cd * (s * e) := by positivity
  have hR : A1 * (s * e) = 5 * (s * e) + Cd * (s * e) + |Ko| * (s * e) + |M| * (4 + Cd + |Ko|) * (s * e)
      + 4 * (|CE| * (s * e)) := by
    rw [hA1]; ring
  have hρ0 : 0 ≤ x ^ (-1 + ε) := Real.rpow_nonneg hx0.le _
  have r1 : Cd ≤ A1 * (s * e) := by linarith [up Cd hCd]
  have r2 : Real.log (x + 1) + Cd + |Ko| + |M| * x ^ (-1 + ε) * (x * (Real.log x + Cd + |Ko|)) ≤ A1 * (s * e) := by
    have e1 : |M| * x ^ (-1 + ε) * (x * (Real.log x + Cd + |Ko|)) = |M| * ((Real.log x + Cd + |Ko|) * e) := by
      rw [← hρ]; ring
    have e2 : Real.log x + Cd + |Ko| ≤ (4 + Cd + |Ko|) * s := by
      have := le_mul_of_one_le_right hCd hs1
      have := le_mul_of_one_le_right (abs_nonneg Ko) hs1
      linarith
    have e3 : |M| * ((Real.log x + Cd + |Ko|) * e) ≤ |M| * ((4 + Cd + |Ko|) * s * e) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right e2 (by linarith)) (abs_nonneg M)
    have e4 : |M| * ((4 + Cd + |Ko|) * s * e) = |M| * (4 + Cd + |Ko|) * (s * e) := by ring
    rw [e1]
    linarith [up Cd hCd, up _ (abs_nonneg Ko)]
  have r3 : Real.log (x + 1) + Cd + |CE| * Real.log x ≤ A1 * (s * e) := by
    have e1 : |CE| * Real.log x ≤ |CE| * (4 * (s * e)) := mul_le_mul_of_nonneg_left (by linarith) (abs_nonneg CE)
    linarith [up Cd hCd]
  have hone := CharacterBalanceMoves.one_char A0 Kp D ell TT (fun t => a t / b) (c := c) (ρ := |M| * x ^ (-1 + ε)) (Ko := |Ko|)
    (L := |CE| * Real.log x) hx3 hCd hS.2.2.2.2.2.1 (hDer H D ell) (by positivity) (abs_nonneg _) h0K
    (fun ψ h => (hKp ψ h).2)
    (fun ψ h h' => (hE2 ψ h h').trans (by gcongr; exact le_abs_self M))
    (fun ψ h h' => (hKo ψ h h').trans (le_abs_self Ko))
    (fun ψ h h1 => (hE3 ψ h h1).trans (mul_le_mul_of_nonneg_right (le_abs_self CE) hl0))
    r1 r2 r3
  set G : ℝ := GmA D ell Kp c x - SigA D ell A0 Kp x with hG
  have hY : (TT.card : ℝ) * (G - 4 * x ^ ((1 : ℝ) / 2 + ε)) ≤
      ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (CharacterBalanceMoves.e1 t) * GPsi D ell ψ (a t / b)).re := by
    simp_rw [Complex.re_sum]
    rw [Finset.sum_comm]
    refine le_trans ?_ (Finset.sum_le_sum hone)
    rw [← Finset.mul_sum, Finset.sum_sub_distrib, CharacterBalanceMoves.sum_vv A0 Kp (fun ψ h => (hKp ψ h).1), Finset.sum_const,
      nsmul_eq_mul, hX]
    refine mul_le_mul_of_nonneg_left ?_ (Nat.cast_nonneg _)
    have k1 := mul_le_mul_of_nonneg_right (hM.trans (le_abs_self M)) (show 0 ≤ A1 * (s * e) by positivity)
    have k2 := mul_le_mul_of_nonneg_right hbig (show 0 ≤ s * e by positivity)
    have k3 : 0 ≤ s * (s * e) := by positivity
    have k4 : |M| * (A1 * (s * e)) = |M| * A1 * (s * e) := by ring
    linarith
  have hc' := CharacterBalanceMoves.core_mean38 A0 D S hHost ell N TT T2 a w hx3 hb hS hThin hCost hT2 hTop hY
  have hz := proposition_size_bound _ _ _ _ _ _ _ _ _ _ _ G hW hc'
  linarith

set_option maxHeartbeats 1600000 in
theorem ch_core_mean38_original (C ε CE Ko c M : ℝ) (hC : 0 ≤ C) (hε : 0 < ε) (hc : |c| ≤ 1) : ∃ x1 : ℝ, ∀ x ≥ x1,
    ∀ (H : Type) [AddCommGroup H] [Fintype H] [DecidableEq H] (m : ℕ) (D : ArithData H) (S : Finset ℕ)
      (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ)
      (b b' k aE η X' θ : ℝ) (A0 : AddSubgroup H) (Kp : Finset (AddChar (E0 × H) ℂ)),
      HostFactsS D S → 0 < b → 0 ≤ aE → 0 < k → (m : ℝ) ≤ x ^ ((1 : ℝ) / 2 + ε / 2) → x * m ≤ k →
      SizesA A0 TT T2 a w N x b b' η X' θ → ThinScales D ell X' θ → CostWindows x (fPl H) b η θ →
      RestSize ε x (Fintype.card H) TT.card T2.card m b k aE → (∀ s ∈ T2, s ∈ A0) → CharsA ell A0 Kp TT c M Ko CE ε x →
      (∀ u ∈ A0, gapA D N ell TT a w u ≤ x ^ (C * ε) * errorBracketSizeWindows x ε (Fintype.card H) TT.card T2.card m b k aE) →
      GmA D ell Kp c x ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) + SigA D ell A0 Kp x := by
  obtain ⟨x1, hx1⟩ := ch_core_mean38 C ε CE Ko c M hC hε hc
  refine ⟨x1, fun x hx => ?_⟩
  intro H _ _ _ m D S ell N TT T2 a w b b' k aE η X' θ A0 Kp hHost hb ha hk hm hxm hS hThin hCost hSize hT2 hCh hTop
  classical
  refine hx1 x hx H m D S ell N TT T2 a w b b' k aE η X' θ A0 Kp hHost hb ha hk hm hxm hS hThin hCost hSize hT2 hCh ?_
  exact (Finset.sum_le_sum fun (u : A0) _ => hTop u u.2).trans (le_of_eq (by rw [Finset.sum_const, nsmul_eq_mul, Finset.card_univ]))

end Deduction
end

#print axioms Deduction.CharacterBalanceMoves.core_mean38
#print axioms Deduction.CharacterBalanceMoves.core_mean38_original
#print axioms Deduction.ch_core_mean38
#print axioms Deduction.ch_core_mean38_original
rh_scan Deduction.CharacterBalanceMoves.core_mean38 limit 2000
rh_scan Deduction.ch_core_mean38 limit 2000
rh_prune Deduction.CharacterBalanceMoves.core_mean38 as RHMean38CorePruned
rh_prune Deduction.ch_core_mean38 as RHMean38ChPruned

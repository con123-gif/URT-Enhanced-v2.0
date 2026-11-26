import Development.AutomorphicArithmetic.CharacterBoxes.WinPairs
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open Formalism.HC UpperTheory.Top

/-!
RUN51 — lane 3 — 26 Nov 2026. PREPARED / human implication;
native Lean compilation and independent audit OUTSTANDING. RH OPEN.
Mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45 (26 Nov sprint),
prior RUN50, latest peer integration 3aadcd5e755ce1d96ddb0143924f02775c5704a0
(exceptional scale bridge), c4320d6f8bdc9d90ef211d8727b8087a676fba48
(positive L2), 5b32b94bb523464b8e2e69ad6e16a7957ed6f98d (low-prime
kappa), 394fdb... (aggregate kappa), 03b9179d78aa6f963bd9f77d8b8d9112e3f934e1
(shared replay). Read AGENTS and swarm/handoff/expansion excerpts.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; observed latest
e4098b46b46c934574c0abba2d107d1fd9c8bfcf not adopted.
Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source anchors under src/Development/AutomorphicArithmetic:
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
(PageN,VAt,VWinAt,VVle.mono);
CharacterBoxes/WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b
(winPairs, especially l.10–35,58–81);
CharacterBoxes/TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981
(WinDatum.bound, l.19–26);
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
(actual consumer of winPairs and WinDatum.bound).

Human proof:
Let a=2+8 eps, eps in (0,1/52). Fix q,d selected by the SAME PairEx
call and W from the SAME scale window. If u<=z and PageN eps u n
and PageN eps z n then z^a<=2^n<=2*u^a. Thus z<=2^(1/a)*u<=2*u.
No changes to IsChiField, E, LData or the finite-prime-set quantifiers.
The VAt bound at 401 at u implies the actual WinDatum bound at 400
at x=k*z (k^a=c, k>=1), provided u>=(2*k)^400, since
    (k*z)^400 <= (2*k)^400*u^400 <= u^401.
Also u<=z<=x, so sqrt(exp(u^eps))<=sqrt(exp(x^eps)).
Apply native VVle.mono with the same e, q, d, all E. This does NOT
propagate VAt401 itself to larger scales. The original caller already
spends the slack 401->400: our modified caller spends it jointly on k
and same-page extension. The threshold is finite with constants fixed.
All PairGood, rank, host, thinness and other WinDatum conditions unchanged.
This is a genuine sufficient replacement of VWinAt at this consumer,
not a claimed proof of the new anchored supplier.

Canonical schedule e(z)=floor(log2(z^a))+1 for z>=1 satisfies PageN;
pages are [2^((n-1)/a),2^(n/a)). Every page meeting [W,W^2] has a
least point within that closed window. It suffices to prove VAt401
only at these leftmost points, using the same q,d and fixed W for
the entire window, not independently selected fields. This gives
AnchoredVWinAt51. For a padded dyadic block [L/2,3L] in final x
(or rescaled z=x/k), the log2 coordinate width a*log2(6)<6
because a<28/13 and 6^28<2^78. Thus at most seven pages intersect.
The total number of anchors across [W,W^2] is O(log W), not O(W^2).
If the first certified anchor in a page is later, only its prefix
remains unverified at THIS supplier, and the sum of prefix lengths
is an outer measure bound on arithmetic failures (multiply by k
when returning from z to x). If a short page has no anchor, charge
the whole page. Endpoints are included in the cover as needed.
A uniform O(L^((1+alpha)/2)) bound on these prefixes on padded
dyadic blocks, alpha=1/2+epsilon, would handle THIS part of the
integration peer's exceptional-scale budget. It is NOT established
here and other failure sets must also be controlled. Padding must
stay inside the chosen window, or shorten it. No measure inferred
from finite tests or from the geometry averages over a fixed scale.

Original selected source-visible graph (not a kernel closure):
supplyOfAdmOf -> winPairs -> VWinAt401 + PairEx + exists_pageN + VVle.mono;
supplyOfAdmOf -> WinDatum.bound + boundedTw + all other native suppliers.
Candidate:
supplyOfAdmOf (future substitution) -> winPairsAnchored51 ->
AnchoredVWinAt51 + PairEx + VVle.mono + elementary scale comparison.
Original graph preserved; no global dependency elimination.
All class/Selmer uniform estimates, homology, host, loss and
Gm/window arithmetic cancellation obligations remain open.
Cache key: source/toolchain, psi, eps, fixed page schedule, q,d,e,
J,X,W,k,u, full IsChiField context. No URT benefit claimed.

Executed in connector: upstream blob checked; 7 exact unique
source splice anchors checked, exact integer inequality 6^28<2^78
checked. Local lean/lake unavailable. Actual shared replay status
compute/rh-shared-prime-countq-replay-20261126/status.json reports
error rc=1, 133.27s, unhandled import containing GaloisCohomology₂.
Shared runner ASCII-only module regex is a blocking parser bug.
Historical baseline engine PASS statuses were retrieved, not
evidence of RUN51 or new caller verification. No new axiom audit.
No duplicate CI job launched; send to shared kernel replay lane.
RESUME HERE: repair shared Unicode module parser in kernel lane;
replay actual candidate and compare proof/type/constructor dependencies
and #print axioms, then substitute at supplyOfAdmOf after audit.
Mathematics lane: prove simultaneous VAt401 at page left anchors,
or bound total missing prefix length; do not rederive local exponent
factors or assume pointwise bounds at all x. Preserve original
full-window quantifier unless the new anchored path is established.
HANDOFF TO integration, kernel, audit, math; RH remains open.
-/

noncomputable section
namespace RHPrime51

-- A single fixed page schedule, followed by a single W and the same q,d.
-- The ratio guard follows from PageN for eps>0 (see human proof).
def AnchoredVWinAt51 (ψ : PChar) (eps : ℝ) : Prop :=
  ∃ e : ℝ → ℕ, (∀ x ≥ (1 : ℝ), PageN eps x (e x)) ∧
    ∃ J : ℝ, 1 ≤ J ∧ ∃ X0 : ℝ, ∀ X ≥ X0, ∀ q d : ℕ,
      WinPair eps (X ^ (1 / J)) q d →
      ∃ W : ℝ, X ^ (1 / J) ≤ W ∧ W ^ (2 : ℝ) ≤ X ∧
        ∀ x : ℝ, W ≤ x → x ≤ W ^ (2 : ℝ) →
          ∃ u : ℝ, W ≤ u ∧ u ≤ x ∧ e u = e x ∧ x ≤ 2 * u ∧
            VAt ψ eps 401 q d (e u) u

theorem anchored_of_vwin51 (ψ : PChar) (eps : ℝ) (heps : 0 < eps)
    (heps52 : eps < 1 / 52) (hV : VWinAt ψ 401) :
    AnchoredVWinAt51 ψ eps := by
  obtain ⟨e, he⟩ := exists_pageN eps heps
  obtain ⟨J, hJ, X0, hX0⟩ := hV eps heps heps52 e he
  refine ⟨e, he, J, hJ, max X0 1, ?_⟩
  intro X hX q d hpair
  obtain ⟨W, hW0, hW2, hWV⟩ := hX0 X ((le_max_left _ _).trans hX) q d hpair
  have hX1 : 1 ≤ X := (le_max_right _ _).trans hX
  have hW1 : 1 ≤ W :=
    (Real.one_le_rpow hX1 (one_div_nonneg.2 (by linarith))).trans hW0
  refine ⟨W, hW0, hW2, ?_⟩
  intro x hx hx2
  exact ⟨x, hx, le_rfl, rfl, by linarith [hW1.trans hx], hWV x hx hx2⟩

-- Native caller reconstructed from pinned winPairs; only window
-- interface, threshold and final arithmetic consumer are changed.
theorem winPairsAnchored51 :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → 1 ≤ c → AnchoredVWinAt51 ψ eps → PairEx →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatum ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV hP
  obtain ⟨e, he, J, hJ, X0, hX0⟩ := hV
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
      k ^ (3 : ℝ) ≤ M ∧ (2 * k) ^ (400 : ℝ) ≤ M :=
    ⟨max 1 (max y (max Y1 (max (k ^ (3 : ℝ)) ((2 * k) ^ (400 : ℝ))))), by simp, by simp, by simp, by simp, by simp⟩
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
    obtain ⟨u, hWu, hux, heq, hratio, hVu⟩ :=
      hWV x' hWx' (hx'x.trans hxW2)
    have hu0 : 0 ≤ u := hWnn.trans hWu
    have huX : u ≤ k * x' := hux.trans hx'x
    have hR : 0 ≤ 2 * k := by positivity
    have hscale : k * x' ≤ (2 * k) * u := by
      calc k * x' ≤ k * (2 * u) := mul_le_mul_of_nonneg_left hratio hk0
        _ = (2 * k) * u := by ring
    have hbudget : (k * x') ^ (400 : ℝ) ≤ u ^ (401 : ℝ) := by
      calc
        (k * x') ^ (400 : ℝ) ≤ ((2 * k) * u) ^ (400 : ℝ) :=
          Real.rpow_le_rpow (mul_nonneg hk0 hx'0) hscale (by norm_num)
        _ = (2 * k) ^ (400 : ℝ) * u ^ (400 : ℝ) := Real.mul_rpow hR hu0
        _ ≤ u * u ^ (400 : ℝ) :=
          mul_le_mul_of_nonneg_right (hMk400.trans (hWM.trans hWu)) (Real.rpow_nonneg hu0 _)
        _ = u ^ (401 : ℝ) := by
          rw [show (401 : ℝ) = 1 + 400 by norm_num,
            Real.rpow_add (by linarith [hW1.trans hWu] : 0 < u), Real.rpow_one]
    rw [heq] at hVu
    exact (hVu E hE).mono (Nat.floor_mono hbudget)
      (Real.sqrt_le_sqrt (Real.exp_le_exp.2 (Real.rpow_le_rpow hu0 huX heps.le)))

-- Exercise the same native consumer context; fallback remains explicit.
example (ψ : PChar) (eps c : ℝ) (heps : 0 < eps) (heps52 : eps < 1 / 52)
    (hc : 1 ≤ c) (hV : AnchoredVWinAt51 ψ eps) (hP : PairEx) :
    ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ,
      Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
      ∃ (Y : ℝ) (q d e : ℕ), WinDatum ψ eps J c x Y q d e := by
  first
  | (rh_reduce 2 using [winPairsAnchored51]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact winPairsAnchored51 ψ eps c heps heps52 hc hV hP

end RHPrime51
rh_scan UpperTheory.Top.winPairs limit 2000
rh_scan RHPrime51.winPairsAnchored51 limit 2000
rh_scan RHPrime51.anchored_of_vwin51 limit 2000
rh_prune RHPrime51.winPairsAnchored51 as RHPrimeWinPairsPruned51
#print axioms RHPrime51.winPairsAnchored51
#print axioms RHPrime51.anchored_of_vwin51
end

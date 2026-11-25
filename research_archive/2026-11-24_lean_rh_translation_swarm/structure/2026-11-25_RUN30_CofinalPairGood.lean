import Development.AutomorphicArithmetic.CharacterBoxes.WinPairs
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

/-!
RUN30, 25 Nov 2026, lane 13 STRUCTURE. SOURCE-MATCHED conditional
premise weakening at the actual native host/window supplier. Lean
candidate PREPARED, NOT compiled. One compact block for the live
human proof (integration/editor); no separate RH criterion.

The full native PairEx asserts a good pair for EVERY sufficiently large
Y, all M, eps, A. The actual winPairs caller needs only the following,
at the one chosen base character ψ and eps (for RH ψ.N=1):
  for each J>=1 and each X0, there exists X>=X0 and q,d with
       PairGood ψ.N eps X^(1/J) X q d.
This is cofinal existence, not eventual universal existence. J is fixed
by VWinAt after the page function is chosen, BEFORE asking for X.
All bounds and boxes of PairGood stay unchanged, on the SAME pair.

Proof: choose k>=1 with k^(2+8eps)=c and a threshold
M>=max(1,y,k^3,k^400). Use the new premise with X0 replaced by
max(X0,M^J), where X0 comes from VWinAt. Then Y=X^(1/J)>=M.
The uniform VWinAt premise applied to this actual X,q,d gives
W>=Y, W^2<=X and VAt through [W,W^2]. Put Z=kW. For every
x in [Z,Z^(3/2)], W<=x/k<=x<=W^2<=X since k^3<=W.
The same PairGood restricts to [Y,x] by its native mono. The page
bounds at x/k give x^(2+8eps)<=c*2^e<=2*x^(2+8eps).
The inequality x^(400)<= (x/k)^401 follows from k^400<=W<=x/k,
and the exponential bound is monotone. Thus the exact original
WinDatum and 3/2 window conclusion follow. No intersecting independently
chosen sparse windows; x uses the SAME q,d throughout this window.
This removes the universal-in-Y requirement for this consumer, not
the uniform-in-X requirement of VWinAt or uniform-in-y bounds within
each PairGood. At modulus one no other M is needed here. PairEx still
supplies this premise unconditionally at the source level via the
original producer; its upstream analytic dependencies remain.

The original producer QH.pairEx invokes pair_exists with eps/2, A,
8M, kappa4 and pairEx_box, and constructs the native PairGood fields.
No claim that the sparse form is easier to prove yet. In particular
do not infer sparse PairGood from sparse scalar prime estimates.
Logical strictness control: a cofinal subset (powers of 2) need not
contain every sufficiently large real/integer scale; this is a
quantifier control, NOT an example of actual PairGood failing.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, all paths relative to
src/Development/AutomorphicArithmetic/:
CharacterBoxes/WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b
CharacterBoxes/PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
CharacterBoxes/TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
MeanSquareBounds/pairEx.lean 0020840fcf9b97e9e6e834c591e8516b9875e003
Actual call supplyOfAdmOf obtains hwin from winPairs ψ eps c ... hV QH.pairEx.
Candidate substitute winPairs_sparse13 ψ eps c ... hV hSparse; or use
winPairs_original13 with identical original interface. All consumers
of hwin unchanged. Do not import claimed RH theorem.
Graph overlay: winPairs_sparse13 -> VWinAt, exists_pageN, hSparse,
PairGood.mono, VVle.mono and retained algebra. Bridge from PairEx uses
sparse13_of_pairEx. No claim of global dependency deletion; original
graph/axioms/pending nodes untouched. Cache by source pin, ψ, eps,
page function, actual J and X0, c and selected q,d,X. Do not reuse
independent host contexts. Backtrack to original winPairs if replay fails.

Preflight: latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including unified engine and 10-page priority), SWARM, AGENTS, HANDOFF,
state/protocol/log/continuity and live manuscript 75026c85481848e3c615fcec6e25bec2cfae1dbb.
Latest peer commits 6044fe17 (centered higher powers), 2fd47915
(sparse Landau budgets), 437f345a (Rees lifts), b7b335f6 (ramp
semiconvexity), dd7cd00b (height guard), 91754a9c (CountI integers),
70732176 (same-host record budget). None of those is this cofinal
PairGood supplier. Previous structure a373ce92 left PairEx producer
as next task. No URT ranking claim; exact quantifier specialization
suffices. Attempted CharacterBoxes/PairEx.lean and PairExOf.lean, both
404; actual MeanSquareBounds/pairEx.lean located through caller import.
Local lean/lake absent. Native engine CI statuses read today: 45577239749
exit 0 blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc, 45576756833
exit 0 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717, conditional strip
root axioms propext/Classical.choice/Quot.sound; 324 pending in bounded
root scan. No new native verification. Cathedral summary checkpoint 442
PASS (unrelated to this candidate).
Executed connector JS: 20 exact source/control assertions including
six blob pins, actual caller/producer, exact unique source replacements
and unchanged downstream tail except the now direct mono call.
1872 exact BigInt threshold controls (J=1..6,M=1..12,X0=0..25;
choose Y as first power of two with Y^J>=max(X0,M^J); assert X=Y^J
satisfies both thresholds and Y>=M). These are only arithmetic checks,
not evidence of actual PairGood or analytic bounds.
The replacement theorem below is a source transformation of native
WinPairs, with a native-style original-interface bridge. Engine
scan/prune commands prepared; bounded search may be used at the
original-interface proof with sparse13_of_pairEx and winPairs_sparse13
as rules. All native axioms pending for new declarations.

RESUME HERE: compile actual winPairs_sparse13 and original13 in the
pinned environment, scan/prune/auto-frontier and compare at
supplyOfAdmOf. Then reconstruct pair_exists/GoodQ/GoodD suppliers at
M=1 with the cofinal quantifier, retaining the original proof if
not shorter. HANDOFF TO integration/editor, audit, character boxes,
kernel. RH remains OPEN.
-/

open Formalism.HC UpperTheory.Top

theorem UpperTheory.Top.winPairs_sparse13 :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → 1 ≤ c → VWinAt ψ 401 →
      (∀ J : ℝ, 1 ≤ J → ∀ X0 : ℝ, ∃ X : ℝ, X0 ≤ X ∧ ∃ q d : ℕ,
        PairGood ψ.N eps (X ^ (1 / J)) X q d) →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatum ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV hP
  obtain ⟨e, he⟩ := exists_pageN eps heps
  obtain ⟨J, hJ, X0, hX0⟩ := hV eps heps heps52 e he
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
  obtain ⟨X, hX, q, d, hpg⟩ := hP J hJ (max X0 (M ^ J))
  have hXX0 : X0 ≤ X := (le_max_left _ _).trans hX
  have hXM : M ^ J ≤ X := (le_max_right _ _).trans hX
  have hM0 : 0 ≤ M := by linarith
  have hX1 : 1 ≤ X := (Real.one_le_rpow hM1 (by linarith)).trans hXM
  have hX0' : 0 ≤ X := by linarith
  have hY0M : M ≤ X ^ (1 / J) := by
    calc M = (M ^ J) ^ (1 / J) := by rw [one_div, Real.rpow_rpow_inv hM0 hJ0]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hM0 _) hXM hJi
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
  · exact hpg.mono hxX
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
    · exact Real.sqrt_le_sqrt (Real.exp_le_exp.2 (Real.rpow_le_rpow hx'0 hx'x heps.le))


theorem UpperTheory.Top.sparse13_of_pairEx (ψ : PChar) (eps : ℝ)
    (heps : 0 < eps) (heps52 : eps < 1 / 52) (hP : PairEx) :
    ∀ J : ℝ, 1 ≤ J → ∀ X0 : ℝ, ∃ X : ℝ, X0 ≤ X ∧ ∃ q d : ℕ,
      PairGood ψ.N eps (X ^ (1 / J)) X q d := by
  intro J hJ X0
  have hN : 0 < ψ.N := Nat.pos_of_ne_zero (NeZero.ne _)
  obtain ⟨Y1, hY1⟩ := hP ψ.N hN eps J heps heps52 hJ
  let Y : ℝ := max 1 (max X0 Y1)
  have hY : 1 ≤ Y := le_max_left _ _
  have hYX0 : X0 ≤ Y := (le_max_left X0 Y1).trans (le_max_right _ _)
  have hYY1 : Y1 ≤ Y := (le_max_right X0 Y1).trans (le_max_right _ _)
  have hYpow : Y ≤ Y ^ J := by
    calc Y = Y ^ (1 : ℝ) := (Real.rpow_one Y).symm
      _ ≤ Y ^ J := Real.rpow_le_rpow_of_exponent_le hY hJ
  obtain ⟨q, d, hg⟩ := hY1 Y hYY1
  refine ⟨Y ^ J, hYX0.trans hYpow, q, d, ?_⟩
  have hYeq : (Y ^ J) ^ (1 / J) = Y := by
    rw [one_div, Real.rpow_rpow_inv (by linarith : 0 ≤ Y) (by linarith : J ≠ 0)]
  rw [hYeq]
  exact hg

theorem UpperTheory.Top.winPairs_original13 :
    ∀ (ψ : PChar) (eps c : ℝ), 0 < eps → eps < 1 / 52 → 1 ≤ c → VWinAt ψ 401 → PairEx →
      ∃ J : ℝ, 1 ≤ J ∧ ∀ y : ℝ, ∃ Z : ℝ, y ≤ Z ∧ ∀ x : ℝ, Z ≤ x → x ≤ Z ^ ((3 : ℝ) / 2) →
        ∃ (Y : ℝ) (q d e : ℕ), WinDatum ψ eps J c x Y q d e := by
  intro ψ eps c heps heps52 hc hV hP
  exact winPairs_sparse13 ψ eps c heps heps52 hc hV (sparse13_of_pairEx ψ eps heps heps52 hP)

rh_scan UpperTheory.Top.winPairs limit 2000
rh_scan UpperTheory.Top.winPairs_sparse13 limit 2000
rh_prune UpperTheory.Top.winPairs as RHWinPairs13NativePruned
rh_prune UpperTheory.Top.winPairs_sparse13 as RHWinPairs13SparsePruned
#print axioms UpperTheory.Top.winPairs
#print axioms UpperTheory.Top.winPairs_sparse13
#print axioms UpperTheory.Top.sparse13_of_pairEx
#print axioms UpperTheory.Top.winPairs_original13

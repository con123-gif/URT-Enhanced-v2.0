import New.Endgame.LongForms
import Mathlib.Tactic
import Lean

/-!
# Editor: eliminate the absolute remainder estimate at the actual star
28 November 2026. HUMAN DERIVATION / SOURCE-MATCHED CANDIDATE, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, continuity, swarm, handoff, expansion and current registry read.
Peers: 39e0f825 (minimal squared C/star), fcca937a (finite-shell common
star), daec59c9 (finite C1 budget), 717fa8f3 (quartic endpoint), 3da4db5a
(rank-only A/B). These are distinct prepared callers. Do not duplicate.
No matching reduction in HUMAN_PROOF_COMPACT blob 619ae01be98c32e053eef1c8bcd44ccddd0664e7:
section 5 still charges |H|+m|R| to the missing-rank term.

Actual source:
 New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65, star_inequality.
 New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
 abs_mainHeight_add_remainder_le, mainHeight and remainder.
 New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05,
 exists_family_covolumeSq_le and integral_forms_long.
 New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
 HasLogBound and le_of_hasLogBound (strict logarithmic exponent slack).

Mathematical reduction at the native star, not a new A/B/C supplier:
write d>0, n<=d, d-n<=4d/b², b²>=8, S=mR, H=mainHeight, L=logB*budget,
X=x^99, I=5 log(1+b²)*budget, K=logB²*budget.
The actual common y gives
  d(H-3L) <= n(H-S+L)+2delta, delta<=d I.
Rather than estimate -h=S-H-L (which contains the unknown S), cancel
the shared height BEFORE bounding the dimension loss:
  n S <= -(d-n)H + (3d+n)L + 2delta
      <= (d-n)b²X + 4d L + 2d I
      <= d(4X+4L+2I).
Only -H<=b²X is needed; no upper or lower estimate on S is needed.
Since n>=d/2>0 and K>=0, the unchanged final bound follows from the
native logarithmic scale calculus with a factor 2 slack:
  8X+8L+4I <= K
  n S <= d(K/2) <= n K.
Divide by n. All signed terms are retained; no assumption H>=0 or S>=0.
This is a strict weakening of the crude premise, not of the conclusion.
It removes the absolute remainder/mainAsk calculation from this specific
star caller; the separate remainder_eq at the analytic endpoint remains.
The new height-only bound reuses the exact local primeSum upper-bound
argument of the native crude theorem (dirCost still contains primeSum).
No claim that all primeSum or crude-bound dependencies vanish globally.
Both the new scale comparison and source-derived height-only theorem
must be natively replayed before selecting this variant.

Actual sandbox test (Python stdlib Fraction, no Lean): 21,240 exact
feasible rational cases, 7,080 just-above-bound violations, three
omitted-premise counterexamples (H lower bound, half-rank, index),
one strict separation. Reproduce with b in {3,4,10,1000}, d in
{1,2,5,13,40}, X in {1,7}, L in {1,9}, I in {0,3}; for n=1..d
with (d-n)b²<=4d, H in {-C,-C+1,0,C,100C}, C=b²X, delta in
{0,dI/2,dI}; top=(-(d-n)H+(3d+n)L+2delta)/n.
For S in {top,top-1,top-10C}, test original volume and both conclusions;
top+1 violates volume. For omitted-premise cases (b,d,n,X,L,I,H,delta)
use (4,4,3,1,1,0,-10000,0), (2,10,1,1,1,0,-4,0),
(4,4,4,1,1,0,0,10000); S=top>2(4L+4X+2I).
Strict separation: b=4,d=n=4,X=L=1,I=delta=0,H=1000,S=4.
Original crude |H|+|S|<=16 fails but all new scalar premises hold.
These are algebra regression tests, not instances of admissible native D.
Exact native source blobs retrieved; no native compiler present locally.
Actual shared artifact 15234434421 listed unexpired, 900881325 bytes;
existing C2 receipt retained, not claimed as verification of this file.
No new rh_scan/prune/reduce/auto/frontier executed and no root retired.

RESUME HERE: in the retained compact workspace already needed by
character RUN91 (C2SquaredStarMinimal), compile THIS file after
LongForms, using normal kernel checking; require both named axiom reports,
original exact star type and direct edge guard. Compare its full
constructor-inclusive graph to run91_original_star_control, checking
whether abs_mainHeight_add_remainder_le is absent and which primeSum
dependencies survive. If accepted, retarget only its three A/B/C
supplier edges to the verified common family, row positivity and squared
C replacements, preserving the same D. If scale instance search fails,
repair only the explicit factor-2 comparison using actual HasLogBound
exponents (not an extra premise). Do not rebuild the shared source.
HANDOFF TO integration/kernel/audit. Root obligations remain OPEN.
-/

open Finset Module Parameters Real Stirling Submodule LevelPlaces.LevelForm

lemma Data.editor_abs_mainHeight_le {P} (D : Data P) :
    |D.mainHeight| ≤ D.b ^ 2 * D.x ^ 99 := by
  have := D.hasLogUpper_of_abs_le (by grind [c, sum_nonneg] :
    |chowlaSelbergConst P.d| ≤ P.c)
  have {σ y l} [h : D.HasLogUpper (D.a * (2 * y)) l] :
      D.HasLogUpper (D.primeSum y σ) l := ⟨h.1.trans' (by
    grw [primeSum, abs_sum_le_sum_abs, sum_le_card_nsmul _ _ |2 * y|] <;>
      simp [posPart, abs_of_nonneg]
    grw [(lambdaClass_nonneg_and_abs_le ..).2, ← nominalWeight_nonneg, le_abs_self y]
    simp_all [field])⟩
  simpa [mainHeight, dirCost, jetSize] using D.le_of_hasLogBound

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

set_option maxHeartbeats 0 in
lemma editor_one_sided_rank_star {P} {D : Data P} :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  have hn : (n : ℝ) ≤ d := mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank
  have gap0 : 0 ≤ d - (n : ℝ) := sub_nonneg.2 hn
  have gap : d - (n : ℝ) ≤ 4 / D.b ^ 2 * d := by linarith
  have b2 : 0 < D.b ^ 2 := HasLogBound.pos D
  have half : d / 2 ≤ (n : ℝ) := by
    have q : 4 / D.b ^ 2 ≤ (1 / 2 : ℝ) := (div_le_iff₀ b2).2 (by
      linarith [show (8 : ℝ) ≤ D.b ^ 2 from D.le_of_hasLogBound])
    linarith [mul_le_mul_of_nonneg_right q d0.le]
  have n0 : (0 : ℝ) < n := by linarith
  have hH : -D.mainHeight ≤ D.b ^ 2 * D.x ^ 99 :=
    (neg_le_abs _).trans D.editor_abs_mainHeight_le
  have cap0 : 0 ≤ D.b ^ 2 * D.x ^ 99 := (HasLogBound.pos D).le
  have loss : (d - (n : ℝ)) * -D.mainHeight ≤ 4 * d * D.x ^ 99 := calc
    _ ≤ (d - (n : ℝ)) * (D.b ^ 2 * D.x ^ 99) :=
      mul_le_mul_of_nonneg_left hH gap0
    _ ≤ (4 / D.b ^ 2 * d) * (D.b ^ 2 * D.x ^ 99) :=
      mul_le_mul_of_nonneg_right gap cap0
    _ = _ := by field_simp [ne_of_gt D.logB.exp_pos] <;> ring
  have L0 : 0 ≤ L := (HasLogBound.pos D).le
  have nL : (n : ℝ) * L ≤ d * L := mul_le_mul_of_nonneg_right hn L0
  have long : d * (D.mainHeight - 3 * L) ≤
      (n : ℝ) * (D.mainHeight - D.m * D.remainder + L) + 2 * δ :=
    integral_forms_long i big I short
  have bound : (n : ℝ) * (D.m * D.remainder) ≤
      d * (4 * L + 4 * D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ (d - (n : ℝ)) * -D.mainHeight + (3 * d + n) * L + 2 * δ := by
      nlinarith only [long]
    _ ≤ _ := by nlinarith only [loss, nL, index]
  have scale : 8 * L + 8 * D.x ^ 99 + 20 * log (1 + D.b ^ 2) * D.budget ≤
      D.logB ^ 2 * D.budget := D.le_of_hasLogBound
  have K0 : 0 ≤ D.logB ^ 2 * D.budget := (HasLogBound.pos D).le
  apply le_of_mul_le_mul_left _ n0
  calc (n : ℝ) * (D.m * D.remainder) ≤ _ := bound
    _ ≤ d * (D.logB ^ 2 * D.budget / 2) :=
      mul_le_mul_of_nonneg_left (by linarith only [scale]) d0.le
    _ = (d / 2) * (D.logB ^ 2 * D.budget) := by ring
    _ ≤ (n : ℝ) * (D.logB ^ 2 * D.budget) := mul_le_mul_of_nonneg_right half K0

set_option debug.skipKernelTC false
open Lean in
run_cmd do
  let .thmInfo info ← getConstInfo ``editor_one_sided_rank_star |
    throwError "missing editor star theorem"
  let deps := info.value.getUsedConstants
  for n in #[``Data.editor_abs_mainHeight_le, ``Data.exists_family_covolumeSq_le,
      ``Data.finrank_rows_ne_zero, ``Data.integral_forms_long] do
    unless deps.contains n do throwError "EDITOR_RANK_STAR missing supplier {n}"
  if deps.contains ``Data.abs_mainHeight_add_remainder_le then
    throwError "EDITOR_RANK_STAR retained original crude supplier"
  for n in #[``Data.editor_abs_mainHeight_le, ``editor_one_sided_rank_star] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "EDITOR_RANK_STAR nonstandard axiom: {n}"
  logInfo "EDITOR_RANK_STAR direct height-only supplier; standard axioms"

#print axioms Data.editor_abs_mainHeight_le
#print axioms editor_one_sided_rank_star

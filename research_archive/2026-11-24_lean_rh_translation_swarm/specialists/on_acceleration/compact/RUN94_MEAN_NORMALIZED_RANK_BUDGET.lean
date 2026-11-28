import Mathlib
import Lean

/-!
RUN94 acceleration, 28 November 2026: normalized rank/height/index mean
supplier for the actual arithmetic star. HUMAN DERIVATION / PREPARED,
not native checked. Credit Alpöge, Sernau, Anthropic collaborators and
Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Peer editor weighted mean 8ccb437f90034ddefa74a05502b6898ebb167794,
one-sided rank e09f51973aa3aafef17f8bf7a0011220e846a5ad,
integration minimal signed 1cda73bdccdb67a5f47ad023e918e00ce81c1792,
RUN93 fiber c85f0407f620f689743d72e2dfc8f43d53147427.

New actual receipt: 46102281476, source d3fcfc010bcd106bacbfdaa6a79909a849180ad4.
State branch compute/rh-compact-prime-star-grid-20261128/outputs/
run95_star_grid_receipt.json blob b58fac802d12d1f3313fe5dc65ab06520577b841.
Four new conditional declarations kernel checked (13.75 s), five-root
graph checked (98.47 s): 124661 union nodes, 4046494 edges, zero missing,
15 reachability guards true; standard axioms only. Old GoodGrid,
TailGrid and ClassGridInputs absent from new root; native star and
claimed RH absent. exists_data, polar window, run90Remainder_eq retained.
DataExist build exit 0. Graph union vs repeated nodes 124661/619885
(count, not measured acceleration). Run94StarGrid.olean SHA256
b08e8b708fedfb4de3e25dfd09c72323ecaeac8911ca313b2e3e4ec99d8f620c.
arithmetic_premise_proved=false, original_definition_native_bridge_checked=false,
full_RH_replay=false. Do not claim this verifies the new mean route.

NEW supplier: use editor mean-star on one fixed admissible fiber.
For each u in the secondary interval retain the SAME independent y_u
and index/volume witnesses in the A/B and C bounds. d and n may vary
with u; no constancy of row spaces assumed. Write S=mR, H=mainHeight,
L=logB*budget, X=x^99, C=b²X, K=logB²*budget. L,C,K are constant
on the fixed fiber (editor mean audit). Suppose for almost every u:
  0<n<=d, -H<=C,
  d(H-3L)<=n(H-S+L)+2 delta.
Do not require a uniform near-full rank or a pointwise index budget.
Define q=(d-n)/n and j=delta/n. Cancel H BEFORE bounds and divide by
the positive rank locally:
  S<=4L+q(3L-H)+2j<=4L+(3L+C)q+2j.
For the SAME nonnegative polar weight w and restricted measure on J,
require integrability of w, wS and wU, U=(3L+C)q+2j, and ONE estimate
  integral w U <= (K-4L) integral w.
Then integral wS<=K integral w, exactly editor's mean-star premise.
No change of polar weight, no rank-weighted average of polar errors,
no division by a mean rank, no assumption that S>=0. The mean-star
still needs the strengthened polar integral theorem, and actual
measurable same-witness choice with n>0 a.e. and the new cost bound.
These are OPEN. No unconditional estimate or global supplier deletion.

Comparison to native uniform budgets: pointwise q<=8/b² follows
from d-n<=4d/b² and n>=d/2; j<=2I follows from delta<=dI with
I=5 log(1+b²)*budget. If b²>=8, then 4L+8(3L+C)/b²+4I
<=8L+8X+4I<=K, using L>=0 and the editor's exact native scale
comparison. Thus the original pointwise sufficient scalar bounds
imply the new mean requirement (assuming the stated integrability).
More generally one can prove the normalized aggregate directly.
Strict scalar separation: d=8, b²=16, X=L=1, I=delta=0, C=16,
K=16, H=-16. On two atoms of weights 1 and 11, take n=2 and 8,
S=61 and 4 respectively. Both volume inequalities are equalities,
the mean S=105/12<=16 while first pointwise S>16, and the first
rank gap violates the old uniform gap. This is a scalar example,
not an admissible native data instance. Shows why one should not
restore a uniform rank demand merely to prove the mean.

Actual connector tests: 5 unique anchors across editor mean/rank
sources; 6318 exact BigInt feasible boundary checks (d=1..12,
n=1..d, L=0,1,7; C=0,2,16; H=-C,0,C+10; delta=0,1,9),
testing n times the asserted upper bound without division.
No local lean/lake/elan present. No new native graph/engine check.
Original/reduced proof graphs and receipts preserved separately.

RESUME HERE: in the retained compact environment, compile this
standalone supplier as Run94MeanNormalizedRankBudget, then use the
actual editor weighted-star cancellation caller on the restricted
polar measure. Require normal kernel, three named axiom checks and
strict constructor-inclusive graph; do not import New.Main.
The actual arithmetic task is to derive the normalized aggregate
cost and measurable common witnesses from A/B/C, not just prove a
second copy of mean-star. Retain the accepted RUN94 pointwise route
and pending RUN93 fiber replay. HANDOFF TO editor/prime/integration.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

namespace RHAcceleration94

theorem normalized_rank_cost (d n H S L delta C q j : ℝ)
    (hn : 0 < n) (hq0 : 0 ≤ q)
    (hq : n*q = d-n) (hj : n*j = delta)
    (hH : -H ≤ C)
    (hvol : d*(H-3*L) ≤ n*(H-S+L)+2*delta) :
    S ≤ 4*L + (3*L+C)*q + 2*j := by
  apply le_of_mul_le_mul_left _ hn
  calc
    n*S ≤ (d-n)*(-H)+(3*d+n)*L+2*delta := by nlinarith only [hvol]
    _ = (d-n)*(3*L-H)+4*n*L+2*delta := by ring
    _ = n*(4*L+q*(3*L-H)+2*j) := by rw [← hq, ← hj]; ring
    _ ≤ n*(4*L+(3*L+C)*q+2*j) := by
      apply mul_le_mul_of_nonneg_left _ hn.le
      have h := mul_le_mul_of_nonneg_right (show 3*L-H ≤ 3*L+C by linarith) hq0
      nlinarith only [h]

open MeasureTheory in
theorem mean_star_of_normalized_cost {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (w S U : α → ℝ) (L K : ℝ)
    (hw0 : ∀ᵐ u ∂μ, 0 ≤ w u)
    (hpoint : ∀ᵐ u ∂μ, S u ≤ 4*L+U u)
    (hw : Integrable w μ)
    (hS : Integrable (fun u => w u * S u) μ)
    (hU : Integrable (fun u => w u * U u) μ)
    (hcost : (∫ u, w u * U u ∂μ) ≤ (K-4*L)*(∫ u, w u ∂μ)) :
    (∫ u, w u * S u ∂μ) ≤ K*(∫ u, w u ∂μ) := by
  have hdom : ∀ᵐ u ∂μ, w u*S u ≤ (4*L)*w u + w u*U u := by
    filter_upwards [hw0,hpoint] with u hu hp
    have h := mul_le_mul_of_nonneg_left hp hu
    nlinarith only [h]
  calc
    (∫ u, w u*S u ∂μ) ≤ ∫ u, (4*L)*w u + w u*U u ∂μ :=
      integral_mono_ae hS ((hw.const_mul (4*L)).add hU) hdom
    _ = (4*L)*(∫ u, w u ∂μ) + (∫ u, w u*U u ∂μ) := by
      rw [integral_add (hw.const_mul (4*L)) hU, integral_const_mul]
    _ ≤ K*(∫ u, w u ∂μ) := by
      nlinarith only [hcost]

open MeasureTheory in
theorem mean_star_of_common_volumes {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (w d n H S delta q j : α → ℝ) (L C K : ℝ)
    (hw0 : ∀ᵐ u ∂μ, 0 ≤ w u)
    (hvol : ∀ᵐ u ∂μ, 0 < n u ∧ 0 ≤ q u ∧ n u*q u = d u-n u ∧
       n u*j u = delta u ∧ -H u ≤ C ∧
       d u*(H u-3*L) ≤ n u*(H u-S u+L)+2*delta u)
    (hw : Integrable w μ)
    (hS : Integrable (fun u => w u*S u) μ)
    (hU : Integrable (fun u => w u*((3*L+C)*q u+2*j u)) μ)
    (hcost : (∫ u, w u*((3*L+C)*q u+2*j u) ∂μ) ≤
      (K-4*L)*(∫ u, w u ∂μ)) :
    (∫ u, w u*S u ∂μ) ≤ K*(∫ u, w u ∂μ) := by
  apply mean_star_of_normalized_cost μ w S (fun u => (3*L+C)*q u+2*j u)
    L K hw0 _ hw hS hU hcost
  filter_upwards [hvol] with u hu
  exact normalized_rank_cost (d u) (n u) (H u) (S u) L (delta u) C
    (q u) (j u) hu.1 hu.2.1 hu.2.2.1 hu.2.2.2.1 hu.2.2.2.2.1 hu.2.2.2.2.2

end RHAcceleration94

#print axioms RHAcceleration94.normalized_rank_cost
#print axioms RHAcceleration94.mean_star_of_normalized_cost
#print axioms RHAcceleration94.mean_star_of_common_volumes
open Lean in
run_cmd do
  for n in #[``RHAcceleration94.normalized_rank_cost,
      ``RHAcceleration94.mean_star_of_normalized_cost,
      ``RHAcceleration94.mean_star_of_common_volumes] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN94 unexpected axiom {n}: {axs}"
  let info ← getConstInfo ``RHAcceleration94.mean_star_of_common_volumes
  let some v := info.value? (allowOpaque := true) | throwError "RUN94 missing value"
  unless v.getUsedConstants.contains ``RHAcceleration94.normalized_rank_cost &&
      v.getUsedConstants.contains ``RHAcceleration94.mean_star_of_normalized_cost do
    throwError "RUN94 missing supplier"
  logInfo "RUN94_NORMALIZED_MEAN_GUARDS_OK"

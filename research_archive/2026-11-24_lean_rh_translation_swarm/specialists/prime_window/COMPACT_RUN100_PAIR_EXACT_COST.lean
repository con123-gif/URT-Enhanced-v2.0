import Run98SelectedReciprocalSupplier
import DepPairMean84
import Lean

/-!
# RUN100 — actual reciprocal-cost supplier for the fixed pair-mean endpoint
28 November 2026. SOURCE-MATCHED / PREPARED; not native compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and latest peer work.
Dependency 9c65fc2c (pair mean) and acceleration 265ffc21 (actual C
cost) provide DIFFERENT suppliers; connect them rather than duplicate
either. Editor cbba4f59 and audit 108e8dac retained.
Stage exact modules:
  Run98SelectedReciprocalSupplier: specialists/on_acceleration/compact/
    RUN98_SELECTED_RECIPROCAL_SUPPLIER.lean, blob 36b56f4a2ec3b61a913ed134f20772a26f9e3c04.
  DepPairMean84: dependencies/compact/RUN84_PAIR_MEAN_PACKING_SELECTOR.lean,
    blob 223ca08edc39b5a836b4d69ec4d528991b163423.
  EditorSelectedRecord blob 03d0e2968201611d277835e99ac5f32361ca5f30.
  Run90 adapter blob ab798deac49f97177fdcf38a9f35f00252b3cedc.
All new peer modules pending native replay. Actual prior RUN95 receipt
b58fac802d12d1f3313fe5dc65ab06520577b841 fetched: conditional graph PASS,
arithmetic=false, original-definition bridge=false, full RH=false.
RUN99 status AND exact receipt paths returned 404; no failure or PASS inferred.

RESULT: the new pair criterion can be supplied from the actual signed C
cost without requiring either twist's individual finite-power budget.
Fix P,Q (and common modulus M), beta>0, before v tends to infinity.
For each sufficiently large real v choose two native records at x=exp v
with their own independent row witnesses and signed upper budgets K1,K2.
The two records need not share auxiliary scales, dimensions, or rows.
For each record write H=#thick, A=m*a*H>0, S=m*run90Remainder,
and T=primeError(d,M,x1)-towerDeg/#thick*primeError(d,1,x1).
The actual normalized identity gives primeError(d,M,x)=S/A+T.
ExactCostAt D K supplies S<=K by the existing reciprocal-cost lemma.
Retain the weak polar guards T_i<=exp(-10^6 v). Then ONE joint bound
    K1/A1 + K2/A2 <= 2*(exp((beta-1)*v)-exp(-10^6*v))
suffices for the mean prime-error inequality at the actual Landau caller.
No sign restriction on the signed K_i, no splitting the joint bound
into individual estimates, no mixing denominators from different data.
If beta>0 the right side is nonnegative for v>=0 (not needed in proof).
The source-derived K_i may e.g. be 2L+((d-n)(L+U-Hmain)+dE+2delta)/n
from acceleration's exact completion, n>0. Those witnesses are OPEN.
The pair fixed before v grows is essential. We retain an explicit
real-residue guard and rho; peer selection must still produce a good
fixed pair satisfying all its bad-prime avoidance/count premises.
No full RH claim, no new proof of any A/B/C estimate.
This is not another within-fiber mean claim: each summand comes from a
distinct fixed auxiliary twist, and its own exact normalized cost.
All real scales are used here; the quartic-only extension of the pair
criterion would require a separate interpolation audit. This is a
supplier transport, not an assertion the aggregate bound is easier.

Actual execution: connector JS exact integer regression, denominators
p,q=1..4; signed budgets k,l=-4..4; remainders r=-4..k,s=-4..l;
tail a,b=-2..1; target=2, tail upper=1. For each tuple with
k*q+l*p<=2*(2-1)*p*q test
r*q+s*p+(a+b)*p*q<=4*p*q. 518400 examined, 356512 accepted,
0 failures, 3672 accepted cases where at least one individual
endpoint exceeds target. Integer regression only, not prime data or
a Lean certificate execution. No native rh_scan/prune/reduce/auto/
frontier or new graph PASS. Preserve all old graphs and obligations.
Original remainder bridge still awaiting actual native replay.

RESUME HERE: after RUN99 and the already prepared C/selected and
pair-mean peer modules replay, compile this file as Run100PairExactCost
in their authenticated workspace; check the three axiom reports and
direct guards, then attach to peer degree-normalized fixed-pair selector
only if its actual count/avoidance proof is supplied. Do not start
another cold A/B/C build. HANDOFF dependency/integration/audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHPrimeWindow100

noncomputable def normalizedBudget {P : Parameters} (D : Data P) (K : ℝ) : ℝ :=
  K / D.m / D.a / #D.thick

noncomputable def tail {P : Parameters} (D : Data P) : ℝ :=
  primeError P.d P.N₀ D.x₁ - towerDeg D.s / #D.thick * primeError P.d 1 D.x₁

theorem primeError_le_cost {P : Parameters} (D : Data P) (K : ℝ)
    (hthick : towerDeg D.s / D.logB ≤ #D.thick)
    (hcost : RHAcceleration98.ExactCostAt D K) :
    primeError P.d P.N₀ D.x ≤ normalizedBudget D K + tail D := by
  have := D.hasLogLower_of_le hthick
  have hm : (0 : ℝ) < D.m := HasLogBound.pos D
  have ha : (0 : ℝ) < D.a := HasLogBound.pos D
  have hH : (0 : ℝ) < #D.thick := HasLogBound.pos D
  have hS := RHAcceleration98.selected_budget_of_exact_cost D K hcost
  calc
    primeError P.d P.N₀ D.x = D.m * D.run90Remainder / D.m / D.a / #D.thick + tail D := by
      simp [tail, run90Remainder_eq, tops, card_placeClass_eq, field, HasLogBound.pos D, ne_of_gt]
    _ ≤ normalizedBudget D K + tail D := by
      unfold normalizedBudget
      exact add_le_add_right (div_le_div_of_nonneg_right
        (div_le_div_of_nonneg_right (div_le_div_of_nonneg_right hS hm.le) ha.le) hH.le) _

/-- Two actual signed costs, no individual bound on either twist. -/
def PairCostAt (P Q : Parameters) (beta v : ℝ) : Prop :=
  ∃ (D : Data P) (E : Data Q) (K J : ℝ),
    D.x = exp v ∧ E.x = exp v ∧
    towerDeg D.s / D.logB ≤ #D.thick ∧
    towerDeg E.s / E.logB ≤ #E.thick ∧
    RHAcceleration98.ExactCostAt D K ∧ RHAcceleration98.ExactCostAt E J ∧
    tail D ≤ exp (-(1e6*v)) ∧ tail E ≤ exp (-(1e6*v)) ∧
    normalizedBudget D K + normalizedBudget E J ≤
      2*(exp ((beta-1)*v)-exp (-(1e6*v)))

theorem pair_mean_from_exact_cost (P Q : Parameters) {beta v : ℝ}
    (h : PairCostAt P Q beta v) :
    (primeError P.d P.N₀ (exp v) + primeError Q.d Q.N₀ (exp v))/2 ≤
      exp ((beta-1)*v) := by
  obtain ⟨D,E,K,J,hD,hE,hd,he,hc,hj,ht,hu,hb⟩ := h
  have h1 := primeError_le_cost D K hd hc
  have h2 := primeError_le_cost E J he hj
  rw [hD] at h1
  rw [hE] at h2
  linarith only [h1,h2,ht,hu,hb]

/-- Actual signed-Landau consumer; the selection and residue premise
remain explicit. Parameters do not change with v. -/
theorem pair_landau_from_exact_cost (P Q : Parameters)
    (hM : Q.N₀ = P.N₀) {beta : ℝ} (hb : 0 < beta)
    (hr : ∀ x : ℝ, beta < x →
      0 ≤ ((RHDepPairMean84.primeResidue P.d P.N₀ x +
        RHDepPairMean84.primeResidue Q.d P.N₀ x)/2).re)
    (h : ∀ᶠ v : ℝ in atTop, PairCostAt P Q beta v)
    {rho : ℂ} (hρ : beta < rho.re) :
    (RHDepPairMean84.primeResidue P.d P.N₀ rho +
      RHDepPairMean84.primeResidue Q.d P.N₀ rho)/2 = 0 := by
  have hw : ∀ᶠ v : ℝ in atTop,
      (primeError P.d P.N₀ (exp v)+primeError Q.d P.N₀ (exp v))/2 ≤
        exp ((beta-1)*v) := by
    filter_upwards [h] with v hv
    simpa only [hM] using pair_mean_from_exact_cost P Q hv
  have hp : P.N₀.Coprime P.d := (P.coprime_N₁_d 0).coprime_mul_right
  have hq : P.N₀.Coprime Q.d := by
    rw [← hM]
    exact (Q.coprime_N₁_d 0).coprime_mul_right
  exact RHDepPairMean84.pair_primeError_landau
    P.instHeegD.2 Q.instHeegD.2 hp hq hb hr hw hρ

end RHPrimeWindow100

#print axioms RHPrimeWindow100.primeError_le_cost
#print axioms RHPrimeWindow100.pair_mean_from_exact_cost
#print axioms RHPrimeWindow100.pair_landau_from_exact_cost

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHPrimeWindow100.primeError_le_cost,
      #[``Data.run90Remainder_eq,``RHAcceleration98.selected_budget_of_exact_cost]),
    (``RHPrimeWindow100.pair_mean_from_exact_cost,
      #[``RHPrimeWindow100.primeError_le_cost]),
    (``RHPrimeWindow100.pair_landau_from_exact_cost,
      #[``RHPrimeWindow100.pair_mean_from_exact_cost,``RHDepPairMean84.pair_primeError_landau])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN100 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some val := i.value? (allowOpaque := true) | throwError "missing value {n}"
    unless req.all (fun a => val.getUsedConstants.contains a) do
      throwError "RUN100 missing supplier {n}"
  logInfo "RUN100_PAIR_EXACT_COST_GUARDS_OK"

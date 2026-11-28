import Run100PairExactCost
import Run88Endpoint
import Lean

/-!
# RUN101 — paired exact reciprocal cost only at quartic scales
28 November 2026. SOURCE-MATCHED / PREPARED, not native compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/protocol inspected.
Prior work: RUN100 blob b5dc0f6289561c097357e69a05998efdd47d751c
explicitly leaves quartic-only extension open; RUN84 pair mean blob
223ca08edc39b5a836b4d69ec4d528991b163423; acceleration exact supplier
36b56f4a2ec3b61a913ed134f20772a26f9e3c04. Dependency 45f43a9e
constant-free singleton contracting window, audit 1ee12799 deterministic
second-scale endpoint, math 69d79aa2 canonical selected count are distinct.
Search "pair quartic" found no prior commit. No duplicate singleton proof.

Use the already accepted Run88Endpoint (actual repaired source blob
3398702ee71980b05b67dac8747d5a2c40c6e68f) chord and quartic_cover.
Pinned New/Endgame/PrimeError.lean blob 63eb3d79d95ad815878e623b96f237240058c8e2
retrieved: lambdaClass_nonneg_and_abs_le and primeError_eq_sum are the
native suppliers. For two FIXED twists d,e with COMMON modulus M, let
F(x)=(R_d(x)+R_e(x))/2. In the coordinate 1/x, both native chord bounds
have the IDENTICAL log-curvature correction c(a,b,x,t). Average them
BEFORE bounding the endpoints:
    F(x) <= (1-t)F(a)+tF(b)+c(a,b,x,t).
There is no factor of two on the correction and no individual prime-error
bound. Apply the accepted quartic_cover for 0<epsilon<.01: for all large
real x there are consecutive a=k^4,b=(k+1)^4 and bounds U,V with
a^(4epsilon-1/2), b^(4epsilon-1/2)<=U, c<=V and
U+V<=x^(8epsilon-1/2). Hence eventual quartic F(k^4)<=
(k^4)^(4epsilon-1/2) suffices for all-real F(x)<=x^(8epsilon-1/2).
This is the missing interpolation at the ACTUAL fixed-pair consumer.

At each sufficiently large k only, set x=k^4 and choose two native
records D,E for fixed P,Q, with x common, and their own positive
thickness and exact reciprocal-cost witnesses K,J. Put
B_D=K/(m_D a_D #thick_D), T_D=tail D, analogously for E.
By RUN100.primeError_le_cost, it is enough to prove the ONE signed bound
    (B_D+T_D)+(B_E+T_E) <= 2*x^(4epsilon-1/2).
The two signed tails are kept EXACT until the sum; no separate polar
upper guards required for this implication. No claim they cancel on
actual data, or that the cost witnesses exist. No reuse of row witnesses
after changing x or x1. Compare RUN100's all-real sufficient premise
at the stronger tolerance beta=4epsilon+1/2: its two separate tail
bounds and cost bound give the displayed inequality at every k>=1.
The new sufficient condition can be stated on quartic scales alone,
but final zero exclusion uses beta=8epsilon+1/2. To use the degree-
normalized pair-count selector, count edges good at the grid exponent
for EACH tolerance, and use bad-set density at the FINAL beta; both
parameters and the selected edge must be fixed before k varies.
For beta cofinal above 1/2 this preserves the proposed pair route.
Do not infer the count condition from mere existence of one pair.
The real-residue sign and rho guard remain explicit in the native
consumer below. No proof of pair count, A/B/C, or RH.

New source-level route: PairGridCost -> same-record signed cost transport
-> PairGrid -> common chord/cover -> native paired Landau. Old all-real
PairCostAt route and all original/reduced graphs and axioms preserved.
No assertion of global graph deletion. Exact signed cost is not a norm.

Verification: RUN95 actual receipt blob b58fac802d12d1f3313fe5dc65ab06520577b841
retrieved again: conditional module+graph true; arithmetic=false,
definition bridge=false, full_RH=false. RUN99 status and receipt paths
both returned 404, not a failure or a success. Local lean/lake absent.
New candidate source anchors checked against the actual repaired chord,
cover, RUN100 and acceleration modules. No new native kernel,
rh_scan/prune/reduce/auto/frontier or graph execution; no extra cold
build. Standard-axiom checks and direct supplier guards below executable
in the combined authenticated workspace once the prerequisite modules
have accepted receipts. The new arithmetic premise remains OPEN.

RESUME HERE: after accepted DepPairMean84 and Run100PairExactCost objects
are available, compile this file as Run101PairQuarticCost with the
authenticated Run88Endpoint, require the four axiom reports/direct guards
and audit old/new constructor-inclusive roots. Then use the same fixed
pair density-selection consumer (do not switch pairs across k).
HANDOFF TO dependency/integration/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHPrimeWindow101

noncomputable def mean (d e M : ℕ) [Fact d.Prime] [Fact e.Prime] [NeZero M]
    (x : ℝ) : ℝ :=
  (primeError d M x + primeError e M x)/2

theorem pair_chord (d e M : ℕ) [Fact d.Prime] [Fact e.Prime] [NeZero M]
    (A : ℕ) (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b) (hx0 : 0 < x)
    (hA : a ≤ A) (hB : b ≤ A) (hX : x ≤ A)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : 1/x = (1-t)/a+t/b) :
    mean d e M x ≤ (1-t)*mean d e M a+t*mean d e M b+
      ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) := by
  have hd := RHPrimeWindow84.primeError_chord d M A a b x t ha hb hx0
    hA hB hX ht ht1 hx
  have he := RHPrimeWindow84.primeError_chord e M A a b x t ha hb hx0
    hA hB hX ht ht1 hx
  unfold mean
  refine (div_le_div_of_nonneg_right (add_le_add hd he) (by norm_num : (0:ℝ) ≤ 2)).trans ?_
  ring_nf

def PairGrid (d e M : ℕ) [Fact d.Prime] [Fact e.Prime] [NeZero M]
    (η : ℝ) : Prop :=
  ∃ K : ℕ, ∀ k : ℕ, K ≤ k →
    mean d e M ((k : ℝ)^4) ≤ ((k : ℝ)^4)^(8*η+2⁻¹-1)

theorem eventual_pair_grid (d e M : ℕ) [Fact d.Prime] [Fact e.Prime] [NeZero M]
    (ε : ℝ) (he : 0 < ε/6 ∧ ε < 1/100)
    (hg : PairGrid d e M (ε/2)) :
    ∀ᶠ x : ℝ in atTop, mean d e M x ≤ x^(8*ε+2⁻¹-1) := by
  obtain ⟨K,hpoint⟩ := hg
  filter_upwards [RHPrimeWindow87.quartic_cover M ε (by linarith [he.1]) he.2 K] with x hc
  obtain ⟨A,k,a,b,t,U,V,hk,ha,hb,ha0,hb0,hx0,hA,hB,hX,ht,ht1,hr,hUa,hUb,hV,hW⟩ := hc
  have haR : mean d e M a ≤ U := by
    rw [ha] at hUa ⊢
    exact (hpoint k hk).trans hUa
  have hbR : mean d e M b ≤ U := by
    rw [hb] at hUb ⊢
    exact (hpoint (k+1) (hk.trans (Nat.le_succ k))).trans hUb
  calc
    _ ≤ (1-t)*mean d e M a+t*mean d e M b+
        ((1-t)*a+t*b-x)/x/(Nat.totient M : ℝ) :=
      pair_chord d e M A a b x t ha0 hb0 hx0 hA hB hX ht ht1 hr
    _ ≤ (1-t)*U+t*U+V := add_le_add
      (add_le_add (mul_le_mul_of_nonneg_left haR (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hbR ht)) hV
    _ = U+V := by ring
    _ ≤ _ := hW

/-- The records need not share second scales, rows or dimension.
Only the joint signed normalized cost at each quartic is bounded. -/
def PairGridCost (P Q : Parameters) (η : ℝ) : Prop :=
  ∀ᶠ k : ℕ in atTop, ∃ (D : Data P) (E : Data Q) (K J : ℝ),
    D.x = (k : ℝ)^4 ∧ E.x = (k : ℝ)^4 ∧
    towerDeg D.s / D.logB ≤ #D.thick ∧
    towerDeg E.s / E.logB ≤ #E.thick ∧
    RHAcceleration98.ExactCostAt D K ∧ RHAcceleration98.ExactCostAt E J ∧
    (RHPrimeWindow100.normalizedBudget D K + RHPrimeWindow100.tail D) +
      (RHPrimeWindow100.normalizedBudget E J + RHPrimeWindow100.tail E) ≤
        2*((k : ℝ)^4)^(8*η+2⁻¹-1)

theorem grid_from_cost (P Q : Parameters) (hM : Q.N₀ = P.N₀)
    (η : ℝ) (h : PairGridCost P Q η) :
    PairGrid P.d Q.d P.N₀ η := by
  obtain ⟨K,hK⟩ := eventually_atTop.1 h
  refine ⟨K,?_⟩
  intro k hk
  obtain ⟨D,E,B,J,hD,hE,hd,he,hc,hj,hs⟩ := hK k hk
  have h1 := RHPrimeWindow100.primeError_le_cost D B hd hc
  have h2 := RHPrimeWindow100.primeError_le_cost E J he hj
  rw [hD] at h1
  rw [hE] at h2
  have h2' : primeError Q.d P.N₀ ((k : ℝ)^4) ≤
      RHPrimeWindow100.normalizedBudget E J + RHPrimeWindow100.tail E := by
    simpa only [hM] using h2
  unfold mean
  linarith only [h1,h2',hs]

theorem pair_landau_from_quartic_cost (P Q : Parameters)
    (hM : Q.N₀ = P.N₀) (ε : ℝ) (he : 0 < ε/6 ∧ ε < 1/100)
    (hr : ∀ x : ℝ, 8*ε+2⁻¹ < x →
      0 ≤ ((RHDepPairMean84.primeResidue P.d P.N₀ x +
        RHDepPairMean84.primeResidue Q.d P.N₀ x)/2).re)
    (h : PairGridCost P Q (ε/2))
    {rho : ℂ} (hρ : 8*ε+2⁻¹ < rho.re) :
    (RHDepPairMean84.primeResidue P.d P.N₀ rho +
      RHDepPairMean84.primeResidue Q.d P.N₀ rho)/2 = 0 := by
  have hx := eventual_pair_grid P.d Q.d P.N₀ ε he (grid_from_cost P Q hM (ε/2) h)
  have hv : ∀ᶠ v : ℝ in atTop,
      mean P.d Q.d P.N₀ (Real.exp v) ≤ (Real.exp v)^(8*ε+2⁻¹-1) :=
    tendsto_exp_atTop.eventually hx
  have hw : ∀ᶠ v : ℝ in atTop,
      (primeError P.d P.N₀ (Real.exp v)+primeError Q.d P.N₀ (Real.exp v))/2 ≤
        Real.exp ((8*ε+2⁻¹-1)*v) := by
    filter_upwards [hv] with v hv'
    have hpow : (Real.exp v)^(8*ε+2⁻¹-1) = Real.exp ((8*ε+2⁻¹-1)*v) := by
      rw [Real.rpow_def_of_pos (Real.exp_pos v), Real.log_exp]
      congr 1
      ring
    rw [hpow] at hv'
    exact hv'
  have hp : P.N₀.Coprime P.d := (P.coprime_N₁_d 0).coprime_mul_right
  have hq : P.N₀.Coprime Q.d := by
    rw [← hM]
    exact (Q.coprime_N₁_d 0).coprime_mul_right
  exact RHDepPairMean84.pair_primeError_landau
    P.instHeegD.2 Q.instHeegD.2 hp hq (by linarith [he.1]) hr hw hρ

end RHPrimeWindow101

#print axioms RHPrimeWindow101.pair_chord
#print axioms RHPrimeWindow101.eventual_pair_grid
#print axioms RHPrimeWindow101.grid_from_cost
#print axioms RHPrimeWindow101.pair_landau_from_quartic_cost

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHPrimeWindow101.pair_chord, #[``RHPrimeWindow84.primeError_chord]),
    (``RHPrimeWindow101.eventual_pair_grid,
      #[``RHPrimeWindow87.quartic_cover,``RHPrimeWindow101.pair_chord]),
    (``RHPrimeWindow101.grid_from_cost, #[``RHPrimeWindow100.primeError_le_cost]),
    (``RHPrimeWindow101.pair_landau_from_quartic_cost,
      #[``RHPrimeWindow101.eventual_pair_grid,``RHPrimeWindow101.grid_from_cost,
        ``RHDepPairMean84.pair_primeError_landau])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN101 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN101 missing supplier {n}"
  logInfo "RUN101_PAIR_QUARTIC_COST_GUARDS_OK"

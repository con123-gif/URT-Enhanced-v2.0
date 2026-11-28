import C2ExactLiftBudget
import Lean

/-!
RUN99 character boxes — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN98 exact-lift module blob 96facecd17078919cde0f0af70cc5d3d3aca8400.
Source New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05,
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 (read, NOT imported),
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity; recent peer
e4f993ab5 (C1 cache-path repair), 8f441c844 (pair quartic endpoint),
d8fe4185 (B4 spread transport) and 265ffc21 (RUN96 selected supplier).
No duplicate pair or selected-record existence route.

Close the missing aggregate scale guard from RUN98 at the actual native
near-full-rank caller, rather than replacing all costs by the rank-free
completion U (whose x1^2 b^2 term can be prohibitive). Keep BOTH routes.
Write A=logX, Q=logB, ell=log Q, c=P.c, B=budget,
L=QB, H=mainHeight, E=m^2 t x^999, J=run98ChainBudget.
Then J+E+b < L follows from native admissible scales; no new premise.

Explicit logarithmic upper bounds from Magnitudes:
log B <= Q+12A+(16/5)ell+c+1;
log B0 <= Q+(13/2)A+(16/5)ell+c+3
because B0=B/(mk), log m>=A/2 and log k>=5A-2.
Use upper exponents (not log of a signed quantity) for positive factors.
rB0 <= exp(Q+(23/2)A+(16/5)ell+c+6).
2rB0 and 6kB0 have upper exponents with respective constants 8 and 12.
10m x^999 has upper exponent (1999/2)A+12.
The native scale Q >= 10^12 A and A >=100ell make the latter
dominated by Q+(23/2)A+(16/5)ell+c+12. Sum of four terms costs
at most 3 extra in the log exponent; multiplying by m costs A/2+2.
Thus J <= exp(Q+12A+(16/5)ell+c+17).
E <= exp(1005A+12), b=exp(Q); both dominated by the J upper exponent.
Two more additions give upper exponent Q+12A+(16/5)ell+c+19.
L has lower exponent Q+12A+4ell. Since ell>=10^12 c and c>=64,
(4/5)ell>c+19. These comparisons are strict for every native D,
not an asymptotic choice of a different D or an additional guard.
The executable declaration uses native lt_of_hasLogBound directly
on the expanded expression; exact exponent synthesis remains to replay.

At the SAME fit family and SAME y,I,hV, original near-rank forward
height is a=V+2delta+db, RUN98 reciprocal height is 2d(J-H+E).
The exact signed product formula gives
  d(H-J-E-b) <= V+2delta.
With J+E+b<L and d>=0 we obtain the stronger near-rank C
  d(H-L) <= V+2delta.
Thus native A/B family, unchanged rank threshold and index bounds,
give S=m*remainder <= 2L + 4 x^99 + 10 log(1+b^2) B.
This is a caller-level bridge to the original star inequality:
the original proof's final 4L can be replaced by 2L, using the
existing near-rank forward height rather than the much larger U.
No claim of rank-free root closure; near-rank supplier still retained.
No new proof of native fit family, A/B or prime endpoint.
No reuse of a different D or y and no circular use of New.Main.

Executed local SymPy: expanded signed product formula residual,
near-rank expansion residual and common H cancellation residual,
all exactly 0. Lean/lake not on PATH; no new native proof execution.
Actual run 46125697285 is complete but executed A2 leaf repair,
not C2. RUN97 C2 job 46122658976 returned no jobs and queried
C2 repair status path 404. Do not infer acceptance from other
queue successes. No new rh_scan/prune/reduce/auto/frontier, graph
or axiom execution. Prior graphs and open obligations preserved.

RESUME HERE: in the authenticated C2 workspace compile RUN98 as
C2ExactLiftBudget and then this module as C2NearRankStar. First
check the scale guard, then original statement equivalence of the
star caller and the C inequality; audit constructor-inclusive
graphs for original C, exact near-rank C, actual A/B consumer and
original/reduced star (original reference only in separate audit).
No duplicate cold build. HANDOFF integration/editor/kernel/audit.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Finset LinearMap Real Submodule LevelPlaces.LevelForm Data

namespace Data
variable {P} {D : Data P}

/-- All three errors fit in one old unit of error, not three. -/
lemma run99_combined_budget_lt (D : Data P) :
    D.run98ChainBudget + (D.m : ℝ)^2 * D.t * D.x^999 + D.b <
      D.logB * D.budget := by
  unfold run98ChainBudget run98PerLiftBudget
  exact D.lt_of_hasLogBound

variable {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y)
  (hn : (1 - 4 / D.b ^ 2) * D.rowDim ≤ n)
  (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i hn I hV in
lemma run99_integral_forms_long_near_rank :
    D.rowDim * (D.mainHeight - D.logB * D.budget) ≤ V + 2 * δ := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + D.rowDim * D.b) +
      2 * D.rowDim * (D.run98ChainBudget - D.mainHeight +
        (D.m : ℝ)^2 * D.t * D.x^999) :=
    c2_heightLe_nonneg_arch ((((Data.heightLe_volume_rows i hn I hV o).pow 2).mul
      (Data.run98_heightLe_volume_ratio_sq_exact o)).mono le_rfl
      (by simp [field]; simp [(Z _).1]))
  have hbudget := (run99_combined_budget_lt D).le
  calc
    _ ≤ D.rowDim * (D.mainHeight - D.run98ChainBudget -
          (D.m : ℝ)^2 * D.t * D.x^999 - D.b) :=
      mul_le_mul_of_nonneg_left (by linarith only [hbudget]) (by positivity)
    _ ≤ _ := by linarith only [formula]

end Data

/-- Source-matched New.Main star consumer, without importing New.Main. -/
lemma run99_star_sharp_error {P} {D : Data P} :
    D.m * D.remainder ≤ 2 * (D.logB * D.budget) + 4 * D.x ^ 99 +
      10 * log (1 + D.b ^ 2) * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y, i, big, ⟨δ, index, I⟩, short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  set h := D.mainHeight - D.m * D.remainder + L with def_h
  have crude : -h ≤ D.b ^ 2 * D.x ^ 99 := by
    grw [def_h, ← abs_mainHeight_add_remainder_le, ← neg_le_abs, ← le_abs_self,
      ← (HasLogBound.pos D : 0 < L)]
    simp
  have both : d * (D.mainHeight - L) ≤ d * (D.mainHeight - D.m * D.remainder + L + 4 *
    D.x ^ 99 + 10 * log (1 + D.b ^ 2) * D.budget) := calc
    _ ≤ d * h + (d - n) * -h + 2 * δ :=
      (Data.run99_integral_forms_long_near_rank i big I short).trans_eq (by ring)
    _ ≤ d * h + 4 / D.b ^ 2 * d * (D.b ^ 2 * D.x ^ 99) + 2 *
      (5 * d * log (1 + D.b ^ 2) * D.budget) := by
      grw [crude, index, show d - n ≤ 4 / D.b ^ 2 * d by linarith]
      exact sub_nonneg.2 (mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank : (n : ℝ) ≤
        D.rowDim)
    _ = _ := by rw [def_h]; field [exp_ne_zero]
  linarith [le_of_mul_le_mul_left both d0]

lemma run99_star_inequality {P} {D : Data P} :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run99_star_sharp_error.trans D.le_of_hasLogBound

#print axioms Data.run99_combined_budget_lt
#print axioms Data.run99_integral_forms_long_near_rank
#print axioms run99_star_sharp_error
#print axioms run99_star_inequality

open Lean in
run_cmd do
  for (root, required) in #[
    (``Data.run99_combined_budget_lt, #[``Data.lt_of_hasLogBound]),
    (``Data.run99_integral_forms_long_near_rank,
      #[``Data.run99_combined_budget_lt, ``Data.heightLe_volume_rows,
        ``Data.run98_heightLe_volume_ratio_sq_exact, ``c2_exists_isFitFamily,
        ``c2_heightLe_nonneg_arch]),
    (``run99_star_sharp_error,
      #[``Data.exists_family_covolumeSq_le, ``Data.run99_integral_forms_long_near_rank]),
    (``run99_star_inequality, #[``run99_star_sharp_error])] do
    let .thmInfo info ← getConstInfo root | throwError "RUN99 missing theorem {root}"
    for a in required do
      unless info.value.getUsedConstants.contains a do
        throwError "RUN99 missing direct supplier {a} at {root}"
    for a in #[``Data.integral_forms_long, ``Data.heightLe_volume_ratio_sq] do
      if info.value.getUsedConstants.contains a then
        throwError "RUN99 stale direct supplier {a} at {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN99 nonstandard axiom {root}: {axs}"
  logInfo "RUN99_NEAR_RANK_STAR_GUARDS_OK"

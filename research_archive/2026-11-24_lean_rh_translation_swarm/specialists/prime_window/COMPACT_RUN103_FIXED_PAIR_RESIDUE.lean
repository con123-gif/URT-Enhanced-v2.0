import Run101PairQuarticCost
import Lean

/-!
# RUN103 — connect fixed-pair avoidance to the actual quartic cost consumer
28 November 2026. SOURCE-MATCHED human derivation / PREPARED Lean, not replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION, continuity, state and protocol inspected.
RUN102 status and both output receipt paths returned 404 on state branch:
no fresh PASS/FAIL inferred, no duplicate compute job launched.
RUN101 blob d658307b7a75b64494e9105bc6175d066c4dc5b5; RUN84 pair module
223ca08edc39b5a836b4d69ec4d528991b163423; RUN86 count repair
9fb9d11e5503ccf222b4ad87ff3a76f9ff1e02f3. The latter does not supply
the pair selection. Native PrimeError blob 63eb3d79d95ad815878e623b96f237240058c8e2,
PolarLandau blob 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9,
OneSidedCriterion blob 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3.
Search commits for fixed pair residue returned no duplicate.

RESULT: implement the human residue argument from dependency RUN84 at
the actual prime RUN101 caller. For FIXED d,e and common M, define
U(s)=sum_xi ord_s entireL(xi), a nonnegative INTEGER.
If both twists avoid zeros at s then their native residues agree exactly:
 (r_d(s)+r_e(s))/2 = U(s)/[phi(M) s(1-s)].
No norm or triangle inequality. Fix rho, beta>1/2, Re rho>beta,
and require both twists avoid the rectangle Re s>=beta,
|Im s|<=|Im rho|, for every character of M.
The equality holds at all real x>beta (the rectangle includes Im=0)
and at rho. At real beta<x<=1 the denominator is nonnegative and the
numerator is nonnegative; at x=1 Lean total division yields zero.
For x>1 the numerator is zero by native entireL_ne_zero. Thus the
real-residue premise of pair_landau_from_quartic_cost is supplied by
the very SAME avoidance assumption used for the contradiction.
If entireL(chi)(rho)=0 then U(rho)>=1 by one term and the exact
zero-order equivalence; Re rho<1 by entireL_ne_zero, Re rho>0 by beta.
Hence phi(M),rho,1-rho nonzero and the displayed residue nonzero,
contradicting RUN101. No independent residue hypothesis survives.
The arithmetic PairGridCost and quantitative fixed-pair selection
remain OPEN. This does not assert existence of the pair.
Use RUN84 weighted_hit_bound and the actual finite-character union
density next, not a moving pair depending on k.

Source-level graph: fixed-pair rectangle + PairGridCost -> exact
residue identity -> real guard -> RUN101 -> contradiction.
All original/reduced graphs and obligations preserved; no global
dependency deletion asserted. Native axiom/direct checks below
prepared; local kernel and rh_scan/prune/reduce/auto/frontier not run.
Actual execution this run: fetch current three live entry files,
RUN102 runner and 404 receipts, RUN101 source and three anchors,
RUN84, RUN86, pinned native residue and zero-order declarations.
No scalar regression substituted for kernel verification.

RESUME HERE: after accepted Run101PairQuarticCost and DepPairMean84
objects exist, compile this file in the same pinned workspace,
require its six axiom reports and caller guards, then use the actual
RUN84 incidence/finite-character density to supply both rectangle
avoidance witnesses on one fixed pair. First inspect pending RUN102
receipt; preserve any failures and do not duplicate cold builds.
HANDOFF dependency/integration/audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Complex Finset Filter Nat DirichletCharacter Real Data Parameters

namespace RHPrimeWindow103

noncomputable def U (M : ℕ) [NeZero M] (s : ℂ) : ℕ :=
  ∑ ξ : DirichletCharacter ℂ M, analyticOrderNatAt (entireL ξ) s

def Avoid (M d : ℕ) [NeZero M] [Fact d.Prime] (β : ℝ) (ρ : ℂ) : Prop :=
  ∀ (ξ : DirichletCharacter ℂ M) (s : ℂ), β ≤ s.re →
    |s.im| ≤ |ρ.im| → entireL (quadTwist ξ d) s ≠ 0

theorem residue_eq (M d : ℕ) [NeZero M] [Fact d.Prime] (s : ℂ)
    (hz : ∀ ξ : DirichletCharacter ℂ M, entireL (quadTwist ξ d) s ≠ 0) :
    RHDepPairMean84.primeResidue d M s =
      (U M s : ℂ) / Nat.totient M / (s*(1-s)) := by
  have horder (ξ : DirichletCharacter ℂ M) :
      analyticOrderNatAt (entireL (quadTwist ξ d)) s = 0 :=
    (tendsto_sub_mul_logDeriv_entireL _).1.mpr (hz ξ)
  simp [RHDepPairMean84.primeResidue, U, horder, Nat.cast_sum]

theorem pair_eq (M d e : ℕ) [NeZero M] [Fact d.Prime] [Fact e.Prime] (s : ℂ)
    (hd : ∀ ξ : DirichletCharacter ℂ M, entireL (quadTwist ξ d) s ≠ 0)
    (he : ∀ ξ : DirichletCharacter ℂ M, entireL (quadTwist ξ e) s ≠ 0) :
    (RHDepPairMean84.primeResidue d M s + RHDepPairMean84.primeResidue e M s)/2 =
      (U M s : ℂ) / Nat.totient M / (s*(1-s)) := by
  rw [residue_eq M d s hd, residue_eq M e s he]
  ring

theorem real_guard (M d e : ℕ) [NeZero M] [Fact d.Prime] [Fact e.Prime]
    {β : ℝ} {ρ : ℂ} (hb : 0 < β) (hd : Avoid M d β ρ)
    (he : Avoid M e β ρ) :
    ∀ x : ℝ, β < x →
      0 ≤ ((RHDepPairMean84.primeResidue d M x +
        RHDepPairMean84.primeResidue e M x)/2).re := by
  intro x hx
  have hxd : ∀ ξ : DirichletCharacter ℂ M, entireL (quadTwist ξ d) (x : ℂ) ≠ 0 :=
    fun ξ => hd ξ x (by simpa using hx.le) (by simp)
  have hxe : ∀ ξ : DirichletCharacter ℂ M, entireL (quadTwist ξ e) (x : ℂ) ≠ 0 :=
    fun ξ => he ξ x (by simpa using hx.le) (by simp)
  rw [pair_eq M d e x hxd hxe]
  by_cases h1 : x ≤ 1
  · have hden : 0 ≤ x*(1-x) :=
      mul_nonneg (hb.trans hx).le (sub_nonneg.mpr h1)
    have hcast : (U M (x : ℂ) : ℂ) / Nat.totient M / ((x : ℂ)*(1-(x : ℂ))) =
        (((U M (x : ℂ) : ℝ) / Nat.totient M / (x*(1-x)) : ℝ) : ℂ) := by
      push_cast <;> rfl
    rw [hcast, Complex.ofReal_re]
    exact div_nonneg (div_nonneg (by positivity) (by positivity)) hden
  · have hzero (ξ : DirichletCharacter ℂ M) :
        analyticOrderNatAt (entireL ξ) (x : ℂ) = 0 :=
      (tendsto_sub_mul_logDeriv_entireL ξ).1.mpr
        (entireL_ne_zero ξ (by simpa using (le_of_lt (lt_of_not_ge h1))))
    simp [U,hzero]

theorem U_pos_of_zero (M : ℕ) [NeZero M] (ρ : ℂ)
    (χ : DirichletCharacter ℂ M) (hz : entireL χ ρ = 0) : 0 < U M ρ := by
  have horder : analyticOrderNatAt (entireL χ) ρ ≠ 0 := by
    intro h
    exact ((tendsto_sub_mul_logDeriv_entireL χ).1.mp h) hz
  exact (Nat.pos_of_ne_zero horder).trans_le
    (Finset.single_le_sum (f := fun ξ : DirichletCharacter ℂ M =>
      analyticOrderNatAt (entireL ξ) ρ) (fun _ _ => Nat.zero_le _)
        (Finset.mem_univ χ))

theorem pair_nonzero_at_zero (M d e : ℕ) [NeZero M] [Fact d.Prime] [Fact e.Prime]
    {β : ℝ} {ρ : ℂ} (hb : 0 < β) (hρ : β < ρ.re)
    (hd : Avoid M d β ρ) (he : Avoid M e β ρ)
    (χ : DirichletCharacter ℂ M) (hz : entireL χ ρ = 0) :
    (RHDepPairMean84.primeResidue d M ρ + RHDepPairMean84.primeResidue e M ρ)/2 ≠ 0 := by
  rw [pair_eq M d e ρ (fun ξ => hd ξ ρ hρ.le le_rfl)
      (fun ξ => he ξ ρ hρ.le le_rfl)]
  have hr1 : ρ.re < 1 := lt_of_not_ge fun h => entireL_ne_zero χ h hz
  have hr0 : 0 < ρ.re := hb.trans hρ
  have hn0 : ρ ≠ 0 := by
    intro h
    rw [h] at hr0
    simpa using hr0
  have hn1 : ρ ≠ 1 := by
    intro h
    rw [h] at hr1
    simpa using hr1
  have hu : (U M ρ : ℂ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt (U_pos_of_zero M ρ χ hz))
  have hφ : (Nat.totient M : ℂ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt (Nat.totient_pos.mpr (NeZero.pos M)))
  exact div_ne_zero (div_ne_zero hu hφ)
    (mul_ne_zero hn0 (sub_ne_zero.mpr (Ne.symm hn1)))

theorem excludes_from_pair_grid (P Q : Parameters) (hM : Q.N₀ = P.N₀)
    (ε : ℝ) (he : 0 < ε/6 ∧ ε < 1/100) {ρ : ℂ}
    (hρ : 8*ε+2⁻¹ < ρ.re)
    (hd : Avoid P.N₀ P.d (8*ε+2⁻¹) ρ)
    (hq : Avoid P.N₀ Q.d (8*ε+2⁻¹) ρ)
    (hg : RHPrimeWindow101.PairGridCost P Q (ε/2))
    (χ : DirichletCharacter ℂ P.N₀) : entireL χ ρ ≠ 0 := by
  intro hz
  have hb : 0 < 8*ε+2⁻¹ := by linarith [he.1]
  have hguard := real_guard P.N₀ P.d Q.d hb hd hq
  have hzero := RHPrimeWindow101.pair_landau_from_quartic_cost P Q hM ε he hguard hg hρ
  exact pair_nonzero_at_zero P.N₀ P.d Q.d hb hρ hd hq χ hz hzero

end RHPrimeWindow103

#print axioms RHPrimeWindow103.residue_eq
#print axioms RHPrimeWindow103.pair_eq
#print axioms RHPrimeWindow103.real_guard
#print axioms RHPrimeWindow103.U_pos_of_zero
#print axioms RHPrimeWindow103.pair_nonzero_at_zero
#print axioms RHPrimeWindow103.excludes_from_pair_grid

open Lean in
run_cmd do
  for (n, req) in #[
    (``RHPrimeWindow103.residue_eq, #[``tendsto_sub_mul_logDeriv_entireL]),
    (``RHPrimeWindow103.pair_eq, #[``RHPrimeWindow103.residue_eq]),
    (``RHPrimeWindow103.real_guard, #[``RHPrimeWindow103.pair_eq, ``entireL_ne_zero]),
    (``RHPrimeWindow103.U_pos_of_zero, #[``tendsto_sub_mul_logDeriv_entireL]),
    (``RHPrimeWindow103.pair_nonzero_at_zero,
      #[``RHPrimeWindow103.pair_eq, ``RHPrimeWindow103.U_pos_of_zero]),
    (``RHPrimeWindow103.excludes_from_pair_grid,
      #[``RHPrimeWindow101.pair_landau_from_quartic_cost,
        ``RHPrimeWindow103.real_guard, ``RHPrimeWindow103.pair_nonzero_at_zero])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN103 unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "RUN103 missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "RUN103 missing direct supplier {n}"
  logInfo "RUN103_FIXED_PAIR_RESIDUE_GUARDS_OK"

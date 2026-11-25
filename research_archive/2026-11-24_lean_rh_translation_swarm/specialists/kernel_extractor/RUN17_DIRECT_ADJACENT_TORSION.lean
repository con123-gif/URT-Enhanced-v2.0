import RHAdjacentTorsionBudget16
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.ExponentLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11 RUN17, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
pipeline; SWARM, HANDOFF, EXPANSION, AGENTS, state/log/protocol/continuity
openings and CI summary consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream observed 686902ae1da717a63faf52d2dc6a50e5722942cd
(cache-layout change per commit message); no pin migration.
Peers integration 700e3969, acceleration 619e11df: qualitative CountV
removes quantitative SNum from that consumer only; quantitative CountI,
II/III, core tower and CountVs still use hK or hSha. Do not duplicate
their qualitative replacements. RUN16 72bd1ee1 blob 0d27d2969e28bfd9f6698f34452072b46bf63f08.

RESULT: derive RUN16 joint torsion budget directly from native finite
complex bounds, using one orbit envelope at the higher adjacent degree.
For m=2E, N=4E+6, A=orbBound L N (m+1), s=3^(dd L N*N),
KT.orbBound_mono and two KT.tors_le give
 log T_m + log T_(m+1) <=
 A [log(m+2)+log(m+3)+s^m (m+(m+1)s) log s].
No separate orbit-count estimates or uniform STors premise. In the
actual supplier use the common exponential envelope with the higher
m+1 only, and a single native exponent_le at that higher degree. C=24
works uniformly in E,L, not selected per field/prime. Finiteness of both
torsion groups is retained via tors_le. This is a direct proof of the
reduced local supplier from the pinned native prerequisites, not a new
unconditional proof of those prerequisites, and not an RH proof.
Original native sTors already derives the same sufficient budget.
No global dependency retirement: sibling consumers may still use sTors.
Original graph RUN16 -> torsPair_of_STors16 -> sTors -> torsAll ->
KT.tors_le, KT.orbnum, exponent_le. Candidate RUN17 -> torsPair_native17
-> two KT.tors_le, one orbBound_mono, one high-degree orbnum and
exponent_le, same coefficient field and all original SFew/SCount/SSha/
SLayer inputs. Preserve exact term roles/axioms/pending nodes from both
graphs; no cache by declaration name alone. Key = pin, toolchain,
L/instances, N,m,A,s, field degree/disc, same hB and consumer role.
Backtrack to RUN16 or original native supplier if replay fails.
Source ledger:
HermiteNormalForms/Assembly.lean 2170a3e28188b4e75f62aade0ae9e7890155076c
HermiteNormalForms/Orbnum.lean 91b6071b9a06356e587ccafae21fd8354f52cb76
TorsionBoundsChains/LogLeExp.lean c579335d4b6901c3a2c6aeaf4a1d8e7294127fdc
ModularityArgument/ClassCounting/ExponentLe.lean 2b3e4233ad68b7007573c70feaf4703d85452b47
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
Executed 27 fail-on-error source/hash/unique-edit checks and
455 exact integer checks of the factored stabilizer exponent and
upper monotonicity (not computations of number-field homology).
Local lean/lake absent. Actual baseline status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0; baseline only.
No new CI dispatch or axiom result; compile commands below are prepared.
RESUME HERE: compile RUN16 as RHAdjacentTorsionBudget16 after its own
peer prerequisites, then this file as RHAdjacentTorsionDirect17;
compare both actual caller scans and #print axioms. If any definitional
conversion fails, retain original and fix with the native tc/dd
unfoldings. Then focus on quantitative class-group/cohomology or
geometric joint loss, not another exponent tweak.
HANDOFF TO integration, audit, dependency, editor.
-/

noncomputable section
open NumberField UpperTheory.V
namespace UpperTheory.V.ZK

-- A shared exact bound before the exponential envelope.
theorem adjacent_log_exact17 (L : Type) [Field L] [NumberField L]
    [IsTotallyComplex L] (N m : ℕ) :
    let A := KT.orbBound L N (m + 1)
    let s := 3 ^ (KT.dd L N * N)
    Real.log (tc L N m) + Real.log (tc L N (m + 1)) ≤
      (A : ℝ) * (Real.log ((m + 2 : ℕ) : ℝ) +
        Real.log ((m + 3 : ℕ) : ℝ) +
        (s : ℝ) ^ m * ((m : ℝ) + (m + 1 : ℝ) * s) * Real.log s) := by
  dsimp only
  let A := KT.orbBound L N (m + 1)
  let B := KT.orbBound L N m
  let s := 3 ^ (KT.dd L N * N)
  have hs : 1 ≤ s := Nat.one_le_pow _ _ (by norm_num)
  have hsR : (1 : ℝ) ≤ s := by exact_mod_cast hs
  have hslog : 0 ≤ Real.log (s : ℝ) := Real.log_nonneg hsR
  have hBA : (B : ℝ) ≤ A := by
    exact_mod_cast (KT.orbBound_mono L N (show m ≤ m + 1 by omega))
  have h0 := (KT.tors_le L N m).log_le hs (show 1 ≤ m + 2 by omega)
  have h1 := (KT.tors_le L N (m + 1)).log_le hs (show 1 ≤ m + 1 + 2 by omega)
  change Real.log (tc L N m) ≤ (B : ℝ) * Real.log ((m + 2 : ℕ) : ℝ) +
    (m : ℝ) * B * (s : ℝ) ^ m * Real.log s at h0
  change Real.log (tc L N (m + 1)) ≤ (A : ℝ) * Real.log ((m + 1 + 2 : ℕ) : ℝ) +
    ((m + 1 : ℕ) : ℝ) * A * (s : ℝ) ^ (m + 1) * Real.log s at h1
  have hlog : 0 ≤ Real.log ((m + 2 : ℕ) : ℝ) :=
    Real.log_nonneg (by exact_mod_cast (show 1 ≤ m + 2 by omega))
  have hcoef : 0 ≤ Real.log ((m + 2 : ℕ) : ℝ) + (m : ℝ) * (s : ℝ) ^ m * Real.log s :=
    add_nonneg hlog (by positivity)
  have h0' : Real.log (tc L N m) ≤
      (A : ℝ) * (Real.log ((m + 2 : ℕ) : ℝ) + (m : ℝ) * (s : ℝ) ^ m * Real.log s) := by
    calc _ ≤ _ := h0
         _ = (B : ℝ) * (Real.log ((m + 2 : ℕ) : ℝ) + (m : ℝ) * (s : ℝ) ^ m * Real.log s) := by ring
         _ ≤ _ := mul_le_mul_of_nonneg_right hBA hcoef
  change Real.log (tc L N m) + Real.log (tc L N (m + 1)) ≤
    (A : ℝ) * (Real.log ((m + 2 : ℕ) : ℝ) +
      Real.log ((m + 3 : ℕ) : ℝ) +
      (s : ℝ) ^ m * ((m : ℝ) + (m + 1 : ℝ) * s) * Real.log s)
  calc _ ≤ _ := add_le_add h0' h1
       _ = _ := by
         rw [show m + 1 + 2 = m + 3 by omega, pow_succ]
         push_cast
         ring

theorem torsPair_native17 : STorsPair16 := by
  refine ⟨24, ?_⟩
  intro L _ _ hL e he
  haveI := hL
  let N := 4 * e + 6
  let m := 2 * e + 1
  have hN1 : 1 ≤ N := by dsimp [N]; omega
  have hN : N ≤ 4 * e + 6 := le_rfl
  have hm : m ≤ 2 * e + 1 := le_rfl
  have ht := UpperTheory.V.KT.tors_le L N m
  have ht0 := UpperTheory.V.KT.tors_le L N (2 * e)
  have hn : 1 ≤ Module.finrank ℚ L := Module.finrank_pos
  have hD : 1 ≤ (discr L).natAbs := Int.natAbs_pos.2 (NumberField.discr_ne_zero L)
  have hdd : 1 ≤ Module.finrank ℚ L * N := Nat.one_le_iff_ne_zero.2 (Nat.mul_ne_zero (by omega) (by omega))
  have hA := UpperTheory.V.KT.orbnum L N m hN1
  have hBn : 0 < 2 * (discr L).natAbs * (Module.finrank ℚ L * N) := by positivity
  have hB : (0 : ℝ) < ((2 * (discr L).natAbs * (Module.finrank ℚ L * N) : ℕ) : ℝ) := by exact_mod_cast hBn
  have hAexp : ((UpperTheory.V.KT.orbBound L N m : ℕ) : ℝ) ≤
      Real.exp (12 * ((m : ℝ) + 1) * ((Module.finrank ℚ L : ℝ) * N) ^ 3 * N *
        Real.log (2 * ((discr L).natAbs : ℝ) * ((Module.finrank ℚ L : ℝ) * N))) := by
    have h1 : ((UpperTheory.V.KT.orbBound L N m : ℕ) : ℝ) ≤
        ((2 * (discr L).natAbs * (Module.finrank ℚ L * N) : ℕ) : ℝ) ^
          (12 * (m + 1) * (Module.finrank ℚ L * N) ^ 3 * N) := by exact_mod_cast hA
    rw [← Real.rpow_natCast, Real.rpow_def_of_pos hB] at h1
    refine h1.trans (le_of_eq ?_)
    congr 1
    push_cast
    ring
  have hsexp : (((3 ^ (UpperTheory.V.KT.dd L N * N) : ℕ)) : ℝ) ≤
      Real.exp (2 * ((Module.finrank ℚ L : ℝ) * N * N)) := by
    have hl3 : Real.log 3 ≤ 2 := by
      have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 3 by norm_num)
      linarith
    push_cast
    rw [← Real.rpow_natCast, Real.rpow_def_of_pos (by norm_num)]
    apply Real.exp_le_exp.2
    push_cast
    have : (0 : ℝ) ≤ (Module.finrank ℚ L : ℝ) * N * N := by positivity
    nlinarith
  have hs1 : 1 ≤ 3 ^ (UpperTheory.V.KT.dd L N * N) := Nat.one_le_pow _ _ (by norm_num)
  have hAmono : (UpperTheory.V.KT.orbBound L N (2 * e) : ℝ) ≤
      (UpperTheory.V.KT.orbBound L N m : ℝ) := by
    exact_mod_cast (UpperTheory.V.KT.orbBound_mono L N (show 2 * e ≤ m by dsimp [m]; omega))
  have key := ht.log_le_exp hs1 hAexp hsexp
  have key0 := ht0.log_le_exp hs1 (hAmono.trans hAexp) hsexp
  have hmono : Real.exp (12 * ((m : ℝ) + 1) * ((Module.finrank ℚ L : ℝ) * N) ^ 3 * N *
        Real.log (2 * ((discr L).natAbs : ℝ) * ((Module.finrank ℚ L : ℝ) * N)) +
        (((2 * e : ℕ) : ℝ) + 1) * (2 * ((Module.finrank ℚ L : ℝ) * N * N)) + 2 * ((2 * e : ℕ) : ℝ)) ≤
      Real.exp (12 * ((m : ℝ) + 1) * ((Module.finrank ℚ L : ℝ) * N) ^ 3 * N *
        Real.log (2 * ((discr L).natAbs : ℝ) * ((Module.finrank ℚ L : ℝ) * N)) +
        ((m : ℝ) + 1) * (2 * ((Module.finrank ℚ L : ℝ) * N * N)) + 2 * (m : ℝ)) := by
    apply Real.exp_le_exp.mpr
    have hs0 : 0 ≤ 2 * ((Module.finrank ℚ L : ℝ) * N * N) := by positivity
    dsimp [m]
    push_cast
    linarith
  have hE := UpperTheory.V.ZK.TorsionExponentBound.exponent_le (e : ℝ) (Module.finrank ℚ L : ℝ) (N : ℝ) (m : ℝ)
    ((discr L).natAbs : ℝ) (by exact_mod_cast he) (by exact_mod_cast hn) (by exact_mod_cast hN1)
    (by exact_mod_cast hN) (by exact_mod_cast hm) (by exact_mod_cast hD)
  have hTop : Real.exp (12 * ((m : ℝ) + 1) * ((Module.finrank ℚ L : ℝ) * N) ^ 3 * N *
        Real.log (2 * ((discr L).natAbs : ℝ) * ((Module.finrank ℚ L : ℝ) * N)) +
        ((m : ℝ) + 1) * (2 * ((Module.finrank ℚ L : ℝ) * N * N)) + 2 * (m : ℝ)) ≤
      kBound 24 e (Module.finrank ℚ L) (discr L).natAbs := by
    unfold kBound
    apply Real.exp_le_exp.mpr
    refine hE.trans (le_of_eq ?_)
    rw [show ((24 : ℝ)) = ((24 : ℕ) : ℝ) by norm_num, Real.rpow_natCast]
  have k1 : Real.log (tc L N m) ≤ kBound 24 e (Module.finrank ℚ L) (discr L).natAbs := key.trans hTop
  have k0 : Real.log (tc L N (2 * e)) ≤ kBound 24 e (Module.finrank ℚ L) (discr L).natAbs := by
    apply le_trans key0
    exact hmono.trans hTop
  change Real.log (tc L N m) + Real.log (tc L N (2 * e)) ≤ _
  linarith

theorem sha_of_bOdd17 (hB : BOdd) : ∃ C : ℝ, ShaK C :=
  sNum_pair16
    (LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
      (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc)
      sPhi
      (sClassOf sChain sPrism sPrismMul sZc
        LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
        LateralTheory.Fin.SStein.intersectionNumber_baseChange)
      (sUpperOf sChain hB)
      LateralTheory.Fin.SDetect.intersectionNumber_baseChange)
    sCount PositivityTheory.QuaternionShaBounds.sSha
    LateralTheory.Fin.SLayer.intersectionNumber_baseChange torsPair_native17

end UpperTheory.V.ZK

namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_pair17 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_sha41 hH
  first
  | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd17, _root_.PositivityTheory.KB.bOdd15]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact _root_.UpperTheory.V.ZK.sha_of_bOdd17 _root_.PositivityTheory.KB.bOdd15
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.ZK.torsPair_native17 limit 2000
rh_scan UpperTheory.V.ZK.sha_of_bOdd17 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_pair17 limit 2000
rh_prune UpperTheory.V.ZK.torsPair_native17 as UpperTheory.V.ZK.TorsPairPruned17
#print axioms UpperTheory.V.KT.tors_le
#print axioms UpperTheory.V.ZK.adjacent_log_exact17
#print axioms UpperTheory.V.ZK.torsPair_native17
#print axioms UpperTheory.V.ZK.sha_of_bOdd17
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_pair17

end

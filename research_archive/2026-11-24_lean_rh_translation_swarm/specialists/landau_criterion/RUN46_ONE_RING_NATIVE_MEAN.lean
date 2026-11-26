import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.MidMeanOf
import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.TheoremIOfIntermediateBounds
import Formalism.SharpRestriction.GrowthBounds.Joints
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46 lane 4 / 26 Nov 2026. SOURCE-MATCHED reduction, PREPARED / UNCOMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine,
SWARM/HANDOFF/EXPANSION/AGENTS/continuity and latest peer commits consulted.
Peer lane2 59085d33 (dyadic drawdown, different approach); lane3 5f0e858f,
integration 65d0f958, audit e3f9d949, geometry bbb56405, kernel 5d4f6c50.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Sources (relative to src/Formalism/SharpRestriction/GrowthBounds):
DefsInst.lean 17ab05a631ed05f8e6b8a1c6a395caab6e34ad69: KapIDef, mem_Icc, mem.
Joints.lean e5cd21468e7a936e89169c028c431d936499c771: kappa_share_of_least_serving,
type_one_hypothesis_of_segments, type_one_hypothesis_of_bounds.
ColumnSpanDensity/MeanDefs.lean 4ce8ad2af2dd2fa94f328342b9f967fd651ce15b: MidMean, Avg, MeanX.
ColumnSpanDensity/TheoremIOfIntermediateBounds.lean 409a362378e1f1f833f080c9b40d073debdfbe16:
actual theorem_I_of_intermediate_bounds body.
ColumnSpanDensity/MidMeanOf.lean 448db6f5181919e0ae58e0581632bc260cacc3b2: midMean_of.
ColumnSpanDensity/TheoremIOfLatticeFunctorComparison.lean
6b4b0385f4c878b3e70890990b246049a90c5a60: second_estimate_of_restrictions.
ColumnSpanDensity/ColumnSpanNumericalFacts.lean
55a6d938acb26d39458c848d91b625c3e8c8c91d: mean_of.
RUN45 06c6e652a720d3d25d80918e383aca849ece5269.

ACTUAL upstream arithmetic constructor located:
FamP.ex.kapI_def : KapIDef, i.e. kapI = sInf kapISet.
Native KapIDef.mem and mem_Icc prove the infimum attained and 0<=kapI<=1.
Native kappa_share_of_least_serving already supplies adm7 from KapIDef:
do NOT count it as newly proved or an independent frontier. The adm8
nonnegative conjunct also already follows. type_one_hypothesis_of_segments
uses Conclusion2 (flipOneThree) to construct a nonnegative loss witness κ,
then KapIDef.le and exact window mean transport to upper bound native kapI.
Hence the unresolved quantitative input is upstream mean of this witness,
not nonnegativity or arbitrary choices of kapI.

RESULT: The actual theorem_I_of_intermediate_bounds uses MidMean at just
one R₀ : RS p n', and transports LP (not the mean) from that SAME R₀
to every other ring via LPRingIndep. The empty RS case uses zero loss and
vacuous LP and must stay. Replace forall R by Nonempty RS -> exists R₀
with mean bound, retaining all X/K/hAdm/FactsLP/FM and threshold constants.
For a nonempty class the new proof selects R₀ from the mean premise and
uses hLP on that precise ring. No independent existential witness for
different weights or for LP; hLP remains uniform on every R. Empty case
unchanged. This is a mathematical premise weakening at the actual consumer.
The old MidMean implies MidMeanOne46 by choosing any ring. Conversely not
a logical implication without a proof of equality/transport of means:
abstract two-ring control, loss means 0 and 1, target 1/2. This is not a
native counterexample and no strictness claimed on the native ring model.

The mean supplier itself can require just one common ring where Avg(0),
Avg(ccl) and MeanX hold, using native mean_of; retain all numerical facts.
Do not assume these estimates or infer they hold for a canonical ring.
Native route can instead retain the old uniform proof unchanged.

Executed 10 guarded source/hash/transformation assertions in V8.
Four unique substitutions in exact pinned theorem body; actual hR and
empty case checked unchanged. No local lean/lake/gh. Actual jobs in
45577239749, 45576756833, 45670987597 retrieved completed/success (baseline
only). New code and engine commands below PREPARED, NOT RUN.
Original graph: type_one_hypothesis_of_bounds -> type_one_hypothesis_of_segments
 -> flipOneThree.Conclusion2 <- SecondPartClosed
 <- theorem_I_of_intermediate_bounds <- MidMean <- midMean_of
 <- keyIneq_of / avg_of (0,ccl) / meanX_of / mean_of.
Reduced graph: same downstream consumers; theorem_I_of_intermediate_bounds_one46
 <- MidMeanOne46 <- one common ring's Avg(0), Avg(ccl), MeanX / mean_of.
Retain original graph, hLP/hR, all source obligations, no new axiom evidence.
Cache pin, toolchain, D/K/X/R0, actual TT/windows, transport and thresholds.
No claimed RH theorem shortcut. No claimed global dependency retirement.
RESUME HERE: attack the actual keyIneq_of / meanX_of suppliers on one common
admissible RS; audit whether LPRingIndep has any corresponding quantitative
mean transport (not assumed), and batch native replay of this replacement
and RUN45. Inspect actual CI output and transitive axioms before PASS.
HANDOFF TO integration, geometry, kernel, audit, mathematics/editor.
-/

noncomputable section
namespace Formalism.MainNotions.flipOneThree.Pf
open Formalism.MainNotions.G Formalism.MainNotions.flipOneThree

def MidMeanOne46 (D : Formalism.BasicNotions.D7) (K : Cst) (F : Dat → Prop) : Prop :=
  K.admitted D → ∀ X : Dat, F X → Nonempty (RS X.p X.n') →
    ∃ R : RS X.p X.n',
      meanKap X.TT X.m X.Y X.ar X.bl X.bu (X.kText K R) ≤
        K.Cmean * X.TT.card * X.N₁ / X.Y

theorem midMean_to_one46 {D : Formalism.BasicNotions.D7} {K : Cst} {F : Dat → Prop}
    (h : MidMean D K F) : MidMeanOne46 D K F := by
  intro hA X hF hne
  obtain ⟨R⟩ := hne
  exact ⟨R, h hA X hF R⟩

theorem midMeanOne_of_joint46 (D : Formalism.BasicNotions.D7) (K : Cst)
    (hK : K.Pos) (hJ : K.admitted D → ∀ X : Dat, FM K X →
      Nonempty (RS X.p X.n') → ∃ R : RS X.p X.n',
        Avg K X R 0 ∧ Avg K X R X.ccl ∧ MeanX K X R) :
    MidMeanOne46 D K (FM K) := by
  intro hA X hF hne
  obtain ⟨R, h0, hc, hx⟩ := hJ hA X hF hne
  exact ⟨R, mean_of K hK X hF.2.2.2 R h0 hc hx⟩

theorem theorem_I_of_intermediate_bounds_one46 (D : Formalism.BasicNotions.D7) (FM : Cst → Dat → Prop) (hR : LPRingIndep) (hLP : ∀ K C, MidLP K C)
    (hMean : ∀ K : Cst, K.Pos → MidMeanOne46 D K (FM K)) (hN1 : ∀ K : Cst, K.Pos → TransportedAlt K (FactsLP K))
    (hN2 : ∀ K : Cst, K.Pos → TransportedAlt K (fun _ => FM K)) : SecondPartClosed D := by
  intro hA
  obtain ⟨T0, hT0, h0⟩ := hA 4 (by norm_num)
  refine ⟨T0, hT0, fun C₀ hC₀ => ?_⟩
  obtain ⟨T1, hT1, h1⟩ := h0 C₀ hC₀
  obtain ⟨T2, hT2, h2⟩ := h1 T1 T1 T1 le_rfl le_rfl le_rfl
  obtain ⟨CA, Ckap, Ct, Cs, hCA, hCkap, hCt, hCs, hAdm⟩ := h2 T2 le_rfl
  let K : Cst := ⟨C₀, T2, CA, T1, T1, T1, Ckap, Ct, Cs⟩
  have hK : K.Pos := ⟨lt_of_lt_of_le hT0 hC₀, hT2, hCA, hT1, hT1, hT1, hCkap, hCt, hCs⟩
  obtain ⟨Ta, Ca, hTa, hCa, hFa⟩ := hN1 K hK
  obtain ⟨Tb, Cb, hTb, hCb, hFb⟩ := hN2 K hK
  refine ⟨max Ta Tb, max (max Ca Cb) K.Cmean, lt_max_of_lt_left hTa,
    lt_max_of_lt_left (lt_max_of_lt_left hCa), fun CH hCH => ?_⟩
  intro p n' m TT G' N₁ Y Yb a b' bl bu ccl Dp cStar hH
  have hm : m ≠ 0 := by
    have := hH.2.2.2.2.2.2.1
    omega
  have hY : 1 ≤ Y := hH.1
  let X : Dat := ⟨p, n', m, hm, TT, G', N₁, Y, Yb, a, b', bl, bu, ccl, Dp, cStar⟩
  have hX : X.Hyp K.C₀ CH := hH
  have hLPf : FactsLP K (max (max Ca Cb) K.Cmean) X :=
    hFa CH (le_trans (le_max_left _ _) hCH) _ (le_trans (le_max_left _ _) (le_max_left _ _)) X hX
  have hMf : FM K X :=
    hFb CH (le_trans (le_max_right _ _) hCH) (max (max Ca Cb) K.Cmean)
      (le_trans (le_max_right _ _) (le_max_left _ _)) X hX
  have hnn : 0 ≤ (TT.card : ℝ) * N₁ / Y := by positivity
  by_cases hne : Nonempty (RS p n')
  · obtain ⟨R₀, hmean₀⟩ := hMean K hK hAdm X hMf hne
    refine ⟨X.kText K R₀, kText_nonneg X K R₀ hLPf.bpos, ?_, ?_⟩
    · have h := hmean₀
      have h' : K.Cmean * (TT.card : ℝ) * N₁ / Y ≤ max (max Ca Cb) K.Cmean * (TT.card : ℝ) * N₁ / Y := by
        have := mul_le_mul_of_nonneg_right (le_max_right (max Ca Cb) K.Cmean) hnn
        calc K.Cmean * (TT.card : ℝ) * N₁ / Y = K.Cmean * ((TT.card : ℝ) * N₁ / Y) := by ring
          _ ≤ max (max Ca Cb) K.Cmean * ((TT.card : ℝ) * N₁ / Y) := this
          _ = _ := by ring
      exact le_trans h h'
    · intro W Qq O Kf _ _ _ _ _ _ _ _ _ _ ι σ j w hstd aw bw lam0 hW t ht
      let R : RS p n' := ⟨W, Qq, O, Kf, ι, σ, j, w, hstd⟩
      exact hR p n' R₀ R m 1 lam0 t Dp _ cStar (hLP K _ X hLPf R₀ aw bw lam0 hW t ht)
  · refine ⟨fun _ _ => 0, fun _ _ => le_rfl, ?_, ?_⟩
    · have h0 : meanKap TT m Y a bl bu (fun _ _ => (0 : ℝ)) = 0 := by simp [meanKap]
      rw [h0]
      have hC : 0 ≤ max (max Ca Cb) K.Cmean := le_of_lt (lt_max_of_lt_left (lt_max_of_lt_left hCa))
      have := mul_nonneg hC hnn
      calc (0 : ℝ) ≤ max (max Ca Cb) K.Cmean * ((TT.card : ℝ) * N₁ / Y) := this
        _ = _ := by ring
    · intro W Qq O Kf _ _ _ _ _ _ _ _ _ _ ι σ j w hstd
      exact absurd ⟨(⟨W, Qq, O, Kf, ι, σ, j, w, hstd⟩ : RS p n')⟩ hne


theorem original_interface46 (D : Formalism.BasicNotions.D7)
    (F : Cst → Dat → Prop) (hR : LPRingIndep) (hLP : ∀ K C, MidLP K C)
    (hMean : ∀ K : Cst, K.Pos → MidMean D K (F K))
    (hN1 : ∀ K : Cst, K.Pos → TransportedAlt K (FactsLP K))
    (hN2 : ∀ K : Cst, K.Pos → TransportedAlt K (fun _ => F K)) :
    SecondPartClosed D := by
  exact theorem_I_of_intermediate_bounds_one46 D F hR hLP
    (fun K hK => midMean_to_one46 (hMean K hK)) hN1 hN2

end Formalism.MainNotions.flipOneThree.Pf

rh_scan Formalism.MainNotions.flipOneThree.Pf.theorem_I_of_intermediate_bounds limit 2000
rh_scan Formalism.MainNotions.flipOneThree.Pf.theorem_I_of_intermediate_bounds_one46 limit 2000
rh_prune Formalism.MainNotions.flipOneThree.Pf.theorem_I_of_intermediate_bounds_one46 as RHOneRing46Pruned
#print axioms Formalism.MainNotions.flipOneThree.Pf.midMean_to_one46
#print axioms Formalism.MainNotions.flipOneThree.Pf.midMeanOne_of_joint46
#print axioms Formalism.MainNotions.flipOneThree.Pf.theorem_I_of_intermediate_bounds_one46
#print axioms Formalism.MainNotions.flipOneThree.Pf.original_interface46
end

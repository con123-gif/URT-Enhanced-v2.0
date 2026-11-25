import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChTop
import Development.AutomorphicArithmetic.PrimitiveCosets.LevelGmLeOnFamilyScales
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37, 25 Nov 2026, lane 4. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read, including
mandatory engine. SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS, state/log/protocol/continuity openings, living proof 10e3d636b read.
Peer 678de808 actual mean core/ch_core candidate, 79428d5b power-image
LemmaK, 3232ac0e Haar calibration read; recent 20 commits surveyed.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream separately observed
98d36aafeeb30c1f40fdda96c3574faa34dfa413. No source mixing.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

NEW SOURCE SPECIALIZATION: actual root-reachable ChainTied uses tr=id,
not an arbitrary surjection. TieGlobal.lean 00acf811793877fe42d18c0d69f2d5833f75bf94
defines Data on (Fm.D x i0).R.A; LevelGmLeOnFamilyScales.lean
de994949e6fd2d7238cfcb1c19d361ccdfe904fc, tiedCore_of_chainTied,
explicitly constructs CoreAtH with U0=the SAME group, tr=id and
hcov := fun s _ => <s,rfl>. WindowInequalityOfArtinInputs.lean
c349e34925ac26b8bc76bd36e9b91562f86d6b8d consumes this same witness
and hE for the SAME index i. ZeroFreeAllOfTopG.lean
54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1 calls this exact route.
For principal Level.cyc, hE.o_eq and Frame.index_A0_eq_o imply A0=top
(index one). Thus every fibre is a singleton and the translation
mean in 0810c534 is literally the native umean over U0. No section,
fibre multiplicity, quotient weighting, or optimizing representative
is needed on THIS path. Generic CoreAtH remains unchanged. Do not
infer an identity map for arbitrary existential CoreAtH witnesses.

NEW upstream local replacement: D.Losses C already means two UNIFORM
mean bounds (MeanBoundSecondForm.lean e4332fd8680d2b2f82e0a1e44a276453e03e2109).
The native weighted_mean_bound_statement uses them only in the
weighted sum of their upper bounds. Put
    c=(1+(1-delBar)^(-1)*4 log(1+x^cHH))*cSl1 >= 0,
    L=LoP C,
    umean(ASK-Ga)+c*umean(IO) <= (1+c)*L.
This single signed budget is sufficient for the SAME native
errorTermWith, without bounding either loss separately. It follows
from D.Losses C (and hence pointwise LossBounds) since c>=0.
Proof: exact same Ga_bound5 and weighted_mean_lower_bound_le,
native umean_le_comb twice, exact expansion MLo5 and UBar5;
only the two separate loss estimates are replaced by this joint
inequality. No independent host or witness choices. This is more
specific than the generic quotient route; keeps ErrWindows pointwise
cardinality guard and all ten other SizeData2 fields.
Example at c=2,L=4: mean ASK-Ga=8, mean IO=1 satisfies 10<=12
but violates separate ASK-Ga<=4. This is a generic scalar control,
not a claimed native geometric host.

The error term is exactly umean(ErrX5at), since only log |W(u)|
depends on u. Apply existing errX5at_le before the final scalar
bound, and same BNBoundsU/positive rpow as in ch_top. Transport
IdentU along id, and reindex the full group to A0 at principal level.
This gives the aggregate hTop input in peer 678de808, with unchanged
nonnegative error bracket. RUN36 signed height guard remains valid.
This is an actual upstream consumer bridge, NOT proof of the
new joint-loss premise on VWinAt(1,401) or proof of RH.

Original source-visible branch retained:
  zeroFreeAll_of_topG -> level_gm_le_on_family_scales
  -> windowInequality_of_artinInputs -> core_gm -> ch_top -> each_unit_bound_statement
  -> pointwise LossBounds, plus ch_core -> core.
Candidate branch:
  same ChainTied data -> ch_top_joint37 -> weighted_mean_joint37
  -> joint signed mean, then sum over A0 -> peer ch_core_mean38.
No deletion of other consumers or proof-term edges, no native global
reachability claim. Cache source+toolchain+H,A0,level,i0,pt,Dd,C,Xpp,
eT,eP,ell,N,TT,T2,a,w,epsilon,x and bound; backtrack to original
ch_top if replay or actual caller substitution fails.

Executed V8 exact source transformation 3 unique replacements of
weighted_mean_bound_statement on pinned blob e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef.
Executed 7248 joint-admissible integer scalar cases, 3335 of which
violate at least one separate bound; original-to-joint implication
checked on all parameter combinations (c=0..6,L=0..5,a,d=-6..12).
Not Lean or actual prime/geometry data. Baseline CI status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 reread returncode 0.
Conditional diagonal endpoint 45670987597 previously recorded;
not evidence for this file. Lean/Lake unavailable locally. No new
native axiom result or reduction-engine replay. Prepared commands
below; use existing CI lane. No URT experiment necessary.

RESUME HERE: compile this file with engine modules, audit scans
and original-to-joint bridge; then overlay peer ch_core_mean38
at the actual principal ChainTied caller (preserve the id witness,
not arbitrary CoreAtH). Trace the actual producer of SizeData2
LossBounds and prove this single uniform signed budget at each
x of the SAME native windows. Full ErrWindows, EAtH, all other
SizeData2 fields and VWinAt remain open. Do not repeat analytic
endpoint or reprove the already identified generic quotient.
HANDOFF TO integration, geometry, kernel, formal audit, editor.
-/

noncomputable section
open Finset
open Real
namespace Formalism.LFunctionChainParameters.WeightedSlopeBounds
open Formalism.RankGapBounds.WeightedMeanData

section
variable {U0 : Type} [Fintype U0] {W : U0 → Type}
    [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
    {Top : Type} [Fintype Top] {m f : ℕ}
variable (D : Data U0 W Top m f) (C : Consts) (Xpp : ℝ)

def JointLoss37 : Prop :=
  umean (fun u0 => D.ASK u0 - D.Ga u0) +
    ((1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * C.cSl1) * umean D.IO
    ≤ (1 + ((1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * C.cSl1)) * D.LoP C

def JointMeanBound37 : Prop :=
  Nonempty U0 → D.HidaSetting C → D.DIV C → EComp5 D C → D.HComp C →
  Count5 D C → D.Slopes C → QuotientSlopeBoundsWith D C Xpp →
  JointLoss37 D C → D.SlopeIneq → D.HHBound C → D.FParams →
  umean D.ASK ≤ umean D.Main + errorTermWith D C Xpp

theorem jointLoss37_of_losses (hS : D.HidaSetting C) (h : D.Losses C) : JointLoss37 D C := by
  have hx : 0 < D.x := hS.1
  have hd : D.delBar < 1 := hS.2.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hs : 0 ≤ C.cSl1 := hS.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hX : 0 < D.x ^ C.cHH := Real.rpow_pos_of_pos hx _
  have hl : 0 ≤ Real.log (1 + D.x ^ C.cHH) := Real.log_nonneg (by linarith)
  have hi : 0 ≤ (1 - D.delBar)⁻¹ := inv_nonneg.mpr (by linarith)
  have hp : 0 ≤ (1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * C.cSl1 :=
    mul_nonneg (add_nonneg zero_le_one (mul_nonneg hi (mul_nonneg (by norm_num) hl))) hs
  have h3 := mul_le_mul_of_nonneg_left h.2 hp
  have h4 := h.1
  unfold JointLoss37
  linarith

end

theorem weighted_mean_joint37 {U0 : Type} [Fintype U0] {W : U0 → Type}
    [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)] {Top : Type} [Fintype Top] {m f : ℕ}
    (D : Data U0 W Top m f) (C : Consts) (Xpp : ℝ) : JointMeanBound37 D C Xpp := by
  intro hne hS hDIV hE hH hCount hSl hSN hLoss hSI hHH hFP
  have := hne
  have hx : 0 < D.x := hS.1
  have hdelBar : D.delBar < 1 := hS.2.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hcSl1 : 0 ≤ C.cSl1 := hS.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hinv0 : 0 ≤ (1 - D.delBar)⁻¹ := inv_nonneg.mpr (by linarith)
  have hX : 0 < D.x ^ C.cHH := Real.rpow_pos_of_pos hx _
  have hLX : 0 ≤ Real.log (1 + D.x ^ C.cHH) := Real.log_nonneg (by linarith)
  have hc4 : 0 ≤ (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH)) :=
    mul_nonneg hinv0 (mul_nonneg (by norm_num) hLX)
  have hp : 0 ≤ (1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * C.cSl1 :=
    mul_nonneg (by linarith) hcSl1
  have hGa : ∀ u0, D.Ga u0 ≤ D.Main u0 + Real.log (Fintype.card (W u0) : ℝ)
      + ((1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * C.cSl1) * D.IO u0
      + 0 * D.IO u0
      + (K0v5 D C + (1 + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH))) * K7v5 D C Xpp
        + (1 - D.delBar)⁻¹ * (4 * Real.log (1 + D.x ^ C.cHH)) * (D.K3 C + D.b)
        + (1 - D.delBar)⁻¹ * ((D.etaBar + 4 * Real.sqrt D.eBar) * (D.x ^ C.cHH * D.b))) := by
    intro u0
    have h1 := Ga_bound5 D C Xpp hS hDIV hE hH hCount hSl hSN hSI hHH hFP u0
    have h2 := weighted_mean_lower_bound_le D C Xpp hS hCount u0
    have h3 := mul_le_mul_of_nonneg_left h2 hc4
    linarith
  have h1 := umean_le_comb (X := D.Ga) (A := D.Main)
    (B := fun u0 => Real.log (Fintype.card (W u0) : ℝ)) (P := D.IO) (E := D.IO) _ _ _ hGa
  have h2 := umean_le_comb (X := D.ASK) (A := fun u0 => D.ASK u0 - D.Ga u0) (B := D.Ga)
    (P := D.Ga) (E := D.Ga) 0 0 0 (fun i => by
      show D.ASK i ≤ (D.ASK i - D.Ga i) + D.Ga i + 0 * D.Ga i + 0 * D.Ga i + 0
      linarith)
  unfold JointLoss37 at hLoss
  unfold K0v5 Data.K3 K7v5 Data.EDiv at h1
  unfold errorTermWith UBar5 MLo5
  linarith

section
variable {U0 : Type} [Fintype U0] [Nonempty U0] {W : U0 → Type}
    [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
    {Top : Type} [Fintype Top] {m f : ℕ}

theorem meanErr37 (D : Data U0 W Top m f) (C : Consts) (Xpp : ℝ) :
    umean (fun u => ErrX5at D C Xpp u) = errorTermWith D C Xpp := by
  simp only [ErrX5at, errorTermWith, umean_add, umean_const]

end
end Formalism.LFunctionChainParameters.WeightedSlopeBounds

namespace Deduction
open Deduction.CH Formalism Formalism.D5 Formalism.RankGapBounds.WeightedMeanData
  Formalism.LFunctionChainParameters.WeightedSlopeBounds
  Formalism.LFunctionChainParameters.characterSumData
  Formalism.LFunctionChainParameters.ThickSetMeanBounds
  Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.LChain

theorem ch_top_joint37 {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]
    {W : H → Type} [∀ u, Fintype (W u)] [∀ u, Nonempty (W u)]
    {Top : Type} [Fintype Top] {m f : ℕ} (Dd : Data H W Top m f)
    (C : Consts) (Xpp eK K : ℝ)
    (D : ArithData H) (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) (TT T2 : Finset H)
    (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ) (eT : Top ≃ TT)
    (eP : Fin f ≃ PhiSet (H := H))
    (h1 : IdentU Dd id D N ell TT a w eT eP)
    (h2 : Dd.HidaSetting C ∧ Dd.DIV C ∧ EComp5 Dd C ∧ Dd.HComp C ∧
      Count5 Dd C ∧ Dd.Slopes C ∧ QuotientSlopeBoundsWith Dd C Xpp ∧
      JointLoss37 Dd C ∧ Dd.SlopeIneq ∧ Dd.HHBound C ∧ Dd.FParams)
    (h3 : ErrWindows Dd C Xpp eK K) (h4 : BNBoundsU Dd T2)
    (h5 : LargeX Dd.x Dd.ε K C.cHH eK) (A0 : AddSubgroup H)
    (hall : ∀ u : H, u ∈ A0) :
    (∑ u : A0, gapA D N ell TT a w (u : H)) ≤ (Fintype.card A0 : ℝ) *
      (Dd.x ^ (CErr C * Dd.ε) * errorBracketSizeWindows Dd.x Dd.ε
        (Fintype.card H) TT.card T2.card m Dd.b Dd.k Dd.a) := by
  classical
  have hgap : ∀ u : H, gapA D N ell TT a w u = Dd.ASK u - Dd.Main u := by
    intro u
    have hmain := ch_top_main_eq Dd id D N ell TT a w eT eP h1 u
    have hask := h1.2.2.2.2 u
    change Dd.Main u = ∑ t ∈ TT, ∑ j : Fin m, (MAIN ell (a t) (w u j)).re at hmain
    change Dd.ASK u = ∑ t ∈ TT, ∑ j : Fin m, ASK D N (a t) t (w u j) at hask
    rw [hask, hmain]
    unfold gapA
    rw [← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun t _ => ?_
    rw [← Finset.sum_sub_distrib]
  obtain ⟨s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11⟩ := h2
  have hMean := weighted_mean_joint37 Dd C Xpp (inferInstance : Nonempty H)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11
  have herr := umean_mono (X := fun u : H => ErrX5at Dd C Xpp u)
    (Y := fun _ : H => Dd.x ^ (CErr C * Dd.ε) * ErrText Dd)
    (fun u => errX5at_le Dd C Xpp eK K h3 h5 u)
  rw [meanErr37, umean_const] at herr
  have hnT : Dd.nT = (TT.card : ℝ) := by
    unfold Data.nT
    have h := Fintype.card_congr eT
    rw [Fintype.card_coe] at h
    exact_mod_cast h
  have htext : ErrText Dd ≤ errorBracketSizeWindows Dd.x Dd.ε (Fintype.card H)
      TT.card T2.card m Dd.b Dd.k Dd.a := by
    unfold ErrText errorBracketSizeWindows
    rw [hnT]
    have hm : (0 : ℝ) ≤ m := Nat.cast_nonneg m
    gcongr
    · exact h4.1
    · exact h4.2
  have hpow : 0 ≤ Dd.x ^ (CErr C * Dd.ε) := Real.rpow_nonneg s1.1.le _
  have ht := mul_le_mul_of_nonneg_left htext hpow
  have hgmean : umean (fun u : H => gapA D N ell TT a w u) = umean Dd.ASK - umean Dd.Main := by
    unfold umean
    simp_rw [hgap]
    rw [Finset.sum_sub_distrib, sub_div]
  have hb : umean (fun u : H => gapA D N ell TT a w u) ≤
      Dd.x ^ (CErr C * Dd.ε) * errorBracketSizeWindows Dd.x Dd.ε (Fintype.card H)
        TT.card T2.card m Dd.b Dd.k Dd.a := by
    rw [hgmean]
    linarith
  have hcard : (0 : ℝ) < Fintype.card H := by exact_mod_cast Fintype.card_pos
  unfold umean at hb
  have hs := (div_le_iff₀ hcard).mp hb
  let e : A0 ≃ H := ⟨Subtype.val, fun u => ⟨u,hall u⟩,
    fun u => Subtype.ext rfl, fun _ => rfl⟩
  have hsum := Equiv.sum_comp e (fun u : H => gapA D N ell TT a w u)
  change (∑ u : A0, gapA D N ell TT a w (u : H)) =
    ∑ u : H, gapA D N ell TT a w u at hsum
  rw [hsum, Fintype.card_congr e]
  simpa only [mul_comm (Fintype.card H : ℝ)] using hs

end Deduction

#print axioms Formalism.LFunctionChainParameters.WeightedSlopeBounds.jointLoss37_of_losses
#print axioms Formalism.LFunctionChainParameters.WeightedSlopeBounds.weighted_mean_joint37
#print axioms Deduction.ch_top_joint37
rh_scan Deduction.ch_top_joint37 limit 2000
rh_prune Deduction.ch_top_joint37 as RHJoint37Pruned
end

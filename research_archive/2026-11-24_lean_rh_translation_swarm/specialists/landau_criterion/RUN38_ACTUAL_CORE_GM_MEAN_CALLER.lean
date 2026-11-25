import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import RHMean38
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN38 lane 4 Landau, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED,
NOT COMPILED. RH OPEN. Actual caller overlay, NOT a new RH criterion.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine.
AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION, continuity,
state/log/protocol openings, living proof 10e3d636 consulted. Latest 20
commits surveyed, detailed peers f26f77b4 (actual four-count core),
2d9cc303 (finite calibration), bed688c0 (local index), 678de808 (mean
consumer), previous RUN37 a9dc2a6f (identity translation/joint losses).
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream separately observed
07be9a52ebbee066d706195cad0f6863880f9284, not substituted. Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Pinned source blobs:
CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097
CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d
ChTop.lean ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5
LevelGmLeOnFamilyScales.lean de994949e6fd2d7238cfcb1c19d361ccdfe904fc
WindowInequalityOfArtinInputs.lean c349e34925ac26b8bc76bd36e9b91562f86d6b8d.

Actual caller: core_gm uses hcov, hId, hLed, hBN only in the lambda
supplying the final input to ch_core. Replace that pointwise lambda by
peer ch_core_mean38's signed subgroup SUM. Supply a same-context
sum bound at the ORIGINAL exponent CErr Cc*eps, conditional on LargeX.
Multiply by card(A0)>=0 only AFTER using the existing hExp and hBr.
No new choice of host, x, weights, or coefficients. The new existential
packet no longer carries tr, coverage, IdentU, SizeData2 or BNBoundsU.
These can be replaced by one aggregate bound at THIS consumer, not
deleted from any other branch. Keep ErrWindows (27 scalar fields and
constants), Dd, eT/eP and all other native data; no claim they are minimal.
Original bridge uses ch_top at a representative for each u, only as
fallback; the reduced packet itself makes no representative choice.
This preserves the same uniform x1 threshold (may change its value),
same EAtH, principal or other level, and exact exponent of core_gm.
At actual principal ChainTied, RUN37 ch_top_joint37 would supply the
aggregate with U0=phi.A, tr=id, A0=top, unchanged other fields. This
upstream bridge is conditional and is NOT established by this file.

Original graph: windowInequality_of_artinInputs -> core_gm -> ch_core,
ch_top -> each_unit_bound_statement and hcov,hId,hLed,hBN.
Reduced candidate: core_gm_mean38 -> ch_core_mean38 -> core_mean38;
CoreAtHMean38 -> signed sum condition plus hWin and remaining fields.
Original-to-reduced adapter -> original ch_top (keep fallback).
No deletion of original graph, axioms, imports or other consumers.
Cache key source/toolchain, Lambda, phi, host, x, eps, eD/eL,K,cHH,eK,C,
Dd,TT,T2,ell,N,a,w and actual sum proof. Backtrack if native replay
fails; do not merge contexts or count this as global edge removal.

Executed connector V8 source check: two exact pinned blob matches and
9 unique guarded replacements of the actual native declarations.
No numerical claim, no actual geometry host constructed. Lean/Lake
not on local PATH. Baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved, returncode 0.
Conditional analytic endpoint 45670987597 independently reported by
peer 678de808 with exact job log; no evidence for THIS new module.
No new axiom audit or native proof search executed. No URT needed.

Replay: stage integration/2026-11-25_1900_NATIVE_MEAN_CONSUMER.lean as
RHMean38.lean and compile to RHMean38.olean in the same LEAN_PATH as
the pinned native imports and three engines; compile THIS module.
Run rh_scan/rh_prune below; then on the actual adapter goal run
rh_reduce 2 using [coreAtHMean38_of_native], rh_auto 2, and
rh_auto_frontier 2 in separate scratch examples, preserving open
frontiers and failed branches. Use existing pinned compute runner;
no protected workflow edits. Do not accept sorryAx or missing logs.

RESUME HERE: replay peer mean38 and RUN37 first, then this module;
check actual CoreAtHMean38 caller bridge and add same-host principal
ChainTied producer by using joint37 at A0=top (prove group equality
from principal EAtH, not from arbitrary CoreAtH). Trace the producer
of joint signed losses/ErrWindows; VWinAt(1,401) and all quantitative
suppliers remain open. Do not repeat downstream Landau derivations.
HANDOFF TO integration, geometry, kernel, audit, editor.
-/

open Finset
open UpperTheory.Comparison₂ Deduction.CH Formalism Formalism.HC Formalism.D5 Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.LChain Formalism.LFunctionChainParameters.LHost

noncomputable section
namespace UpperTheory.Comparison₂
variable {φ : Frame}

def CoreAtHMean38 (H : HostRaw φ) (TT : Finset φ.A) (eD eL K cHH eK eps x : ℝ) : Prop :=
  ∃ (U0 : Type) (_ : Fintype U0)
    (W : U0 → Type) (_ : ∀ u0, Fintype (W u0)) (_ : ∀ u0, Nonempty (W u0)) (Top : Type) (_ : Fintype Top)
    (m f : ℕ) (Dd : Data U0 W Top m f) (C : Consts) (Xpp : ℝ)
    (ell : AddChar (E0 × φ.A) ℂ → ℂ) (N : ℕ) (T2 : Finset φ.A) (a : φ.A → ℝ)
    (w : φ.A → Fin m → E0 × φ.A → ℝ) (eT : Top ≃ TT) (eP : Fin f ≃ PhiSet (H := φ.A)) (η X' θ : ℝ),
    HostAddCharCompatible H ell ∧ Dd.x = x ∧ Dd.ε = eps ∧ C.eDiv ≤ eD ∧ C.eLoss ≤ eL ∧ C.cHH ≤ cHH ∧
    ErrWindows Dd C Xpp eK K ∧
    (LargeX Dd.x Dd.ε K C.cHH eK →
      (∑ u : φ.A0, gapA (arith H) N ell TT a w (u : φ.A)) ≤ (Fintype.card φ.A0 : ℝ) *
        (Dd.x ^ (CErr C * Dd.ε) * errorBracketSizeWindows Dd.x Dd.ε
          (Fintype.card φ.A) TT.card T2.card m Dd.b Dd.k Dd.a)) ∧
    SizesA φ.A0 TT T2 a w N x Dd.b Dd.b' η X' θ ∧ ThinScales (arith H) ell X' θ ∧
    CostWindows x (fPl φ.A) Dd.b η θ ∧
    RestSize eps x (Fintype.card φ.A) TT.card T2.card m Dd.b Dd.k Dd.a ∧
    ∀ s ∈ T2, s ∈ φ.A0

theorem coreAtHMean38_of_native {φ : Frame} (H : HostRaw φ) (TT : Finset φ.A)
    (eD eL K cHH eK eps x : ℝ) (hCore : CoreAtH H TT eD eL K cHH eK eps x) :
    CoreAtHMean38 H TT eD eL K cHH eK eps x := by
  classical
  obtain ⟨U0, i0, tr, W, i4, i5, Top, i6, m, f, Dd, Cc, Xpp, ell, N, T2, a, w, eT, eP, η, X', θ,
    hell, hxx, hε, heD, heL, hcHH, hcov, hId, hLed, hWin, hBN, hSz, hThin, hCost, hRest, hT2⟩ := hCore
  refine ⟨U0, i0, W, i4, i5, Top, i6, m, f, Dd, Cc, Xpp, ell, N, T2, a, w, eT, eP, η, X', θ,
    hell, hxx, hε, heD, heL, hcHH, hWin, ?_, hSz, hThin, hCost, hRest, hT2⟩
  intro hLX
  have hp : ∀ u : φ.A0, gapA (arith H) N ell TT a w (u : φ.A) ≤
      Dd.x ^ (CErr Cc * Dd.ε) * errorBracketSizeWindows Dd.x Dd.ε
        (Fintype.card φ.A) TT.card T2.card m Dd.b Dd.k Dd.a := by
    intro u
    obtain ⟨v, hv⟩ := hcov u u.2
    rw [← hv]
    exact Deduction.ch_top Dd tr Cc Xpp eK K (arith H) ell N TT T2 a w eT eP hId hLed hWin hBN hLX v
  calc
    _ ≤ ∑ _u : φ.A0, Dd.x ^ (CErr Cc * Dd.ε) * errorBracketSizeWindows Dd.x Dd.ε
        (Fintype.card φ.A) TT.card T2.card m Dd.b Dd.k Dd.a := Finset.sum_le_sum fun u _ => hp u
    _ = _ := by rw [Finset.sum_const, nsmul_eq_mul, Finset.card_univ]

theorem coreAtHMean38_reduction {φ : Frame} (H : HostRaw φ) (TT : Finset φ.A)
    (eD eL K cHH eK eps x : ℝ) :
    CoreAtH H TT eD eL K cHH eK eps x → CoreAtHMean38 H TT eD eL K cHH eK eps x := by
  intro h
  first | rh_reduce 2 using [coreAtHMean38_of_native] | exact coreAtHMean38_of_native H TT eD eL K cHH eK eps x h

end UpperTheory.Comparison₂

theorem UpperTheory.Comparison₂.core_gm_mean38 :
    ∀ (Λ : Level) (eD eL K cHH eK C eps : ℝ), 0 < eps → ∃ x1 : ℝ, ∀ x ≥ x1, ∀ (φ : Frame) (H : HostAx φ) (TT : Finset φ.A),
      EAtH Λ H.toHostRaw TT x eps C → CoreAtHMean38 H.toHostRaw TT eD eL K cHH eK eps x →
        Λ.Gm x ≤ x ^ ((1 : ℝ) / 2 + (eD + eL + 7) * eps) := by
  intro Λ eD eL K cHH eK C eps heps
  have ho : (0 : ℝ) ≤ Λ.o := Nat.cast_nonneg _
  have hc : |(3 * (Λ.o : ℝ) + 1)⁻¹| ≤ 1 := by
    rw [abs_of_nonneg (by positivity)]
    exact inv_le_one_of_one_le₀ (by linarith)
  obtain ⟨x₁, hx₁⟩ := Deduction.ch_core_mean38 (max (eD + eL) 0 + 3) eps C (koOf Λ) (3 * (Λ.o : ℝ) + 1)⁻¹ (4 * (Λ.o : ℝ))
    (by positivity) heps hc
  obtain ⟨x₂, hx₂⟩ := large_x_eventually eps K cHH eK heps
  obtain ⟨x₃, hx₃⟩ := Filter.eventually_atTop.1
    ((tendsto_rpow_atTop heps).eventually_ge_atTop (1 + 4 * (Λ.o : ℝ)))
  refine ⟨max x₁ (max x₂ x₃), fun x hx φ H TT hE hCore => ?_⟩
  have g1 : x₁ ≤ x := le_trans (le_max_left _ _) hx
  have g2 : x₂ ≤ x := le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) hx
  have g3 : x₃ ≤ x := le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) hx
  obtain ⟨U0, i0, W, i4, i5, Top, i6, m, f, Dd, Cc, Xpp, ell, N, T2, a, w, eT, eP, η, X', θ,
    hell, hxx, hε, heD, heL, hcHH, hWin, hTop, hSz, hThin, hCost, hRest, hT2⟩ := hCore
  subst hxx hε
  have hLX := hx₂ _ g2
  have hWin' := hWin
  obtain ⟨⟨w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22,
    w23, w24, w25, w26, w27, wC⟩, wEta⟩ := hWin'
  obtain ⟨c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17⟩ := wC
  have hLX' : LargeX Dd.x Dd.ε K Cc.cHH eK := by
    refine ⟨hLX.1, le_trans ?_ hLX.2⟩
    unfold KBig
    exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left (by linarith) (by positivity)) (by linarith)
  have hb : 0 < Dd.b := by linarith
  have hx0 : 0 < Dd.x := by linarith
  have hk : 0 < Dd.k := by linarith
  have ha : 0 ≤ Dd.a := le_trans (by positivity) w5
  have hE0 : 0 ≤ eD + eL := by linarith
  rw [max_eq_left hE0] at hx₁
  have hBr : 0 ≤ errorBracketSizeWindows Dd.x Dd.ε (Fintype.card φ.A) TT.card T2.card m Dd.b Dd.k Dd.a := by
    unfold errorBracketSizeWindows
    positivity
  have hExp : Dd.x ^ (CErr Cc * Dd.ε) ≤ Dd.x ^ ((eD + eL + 3) * Dd.ε) := by
    refine Real.rpow_le_rpow_of_exponent_le w1 (mul_le_mul_of_nonneg_right ?_ w2.le)
    unfold CErr
    linarith
  have hmain := hx₁ _ g1 φ.A m (arith H.toHostRaw) _ ell N TT T2 a w Dd.b Dd.b' Dd.k Dd.a η X' θ φ.A0
    (keptA Λ H.toHostRaw) (hostFactsS φ H) hb ha hk w7 w8 hSz hThin hCost hRest hT2
    (charsA Λ φ H TT _ _ C ell hx0 hE hell) (by
      exact (hTop hLX').trans (mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_right hExp hBr) (Nat.cast_nonneg _)))
  rw [gmA_eq Λ φ H TT _ _ C ell hE hell] at hmain
  have hs := sigA_le Λ φ H TT _ _ C ell hx0 hE hell
  have h1 : Dd.x ^ ((1 : ℝ) / 2 + Dd.ε) ≤ Dd.x ^ ((1 : ℝ) / 2 + (eD + eL + 3 + 3) * Dd.ε) :=
    Real.rpow_le_rpow_of_exponent_le w1 (by nlinarith)
  have h2 : Dd.x ^ ((1 : ℝ) / 2 + (eD + eL + 7) * Dd.ε)
      = Dd.x ^ Dd.ε * Dd.x ^ ((1 : ℝ) / 2 + (eD + eL + 3 + 3) * Dd.ε) := by
    rw [← Real.rpow_add hx0]
    congr 1
    ring
  have h3 := mul_le_mul_of_nonneg_right (hx₃ _ g3)
    (Real.rpow_nonneg hx0.le ((1 : ℝ) / 2 + (eD + eL + 3 + 3) * Dd.ε))
  have h4 := mul_le_mul_of_nonneg_left h1 (show 0 ≤ 4 * (Λ.o : ℝ) by positivity)
  rw [h2]
  linarith

end

#print axioms UpperTheory.Comparison₂.coreAtHMean38_of_native
#print axioms UpperTheory.Comparison₂.core_gm_mean38
rh_scan UpperTheory.Comparison₂.core_gm_mean38 limit 2000
rh_prune UpperTheory.Comparison₂.core_gm_mean38 as RHCoreGmMean38Pruned

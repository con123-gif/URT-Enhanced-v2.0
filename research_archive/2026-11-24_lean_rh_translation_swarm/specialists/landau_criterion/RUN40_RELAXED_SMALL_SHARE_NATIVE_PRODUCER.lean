import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40 lane 4, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED. RH OPEN.
Actual upstream producer of LossBounds, not another Landau criterion.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 and pinned
e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1, mandatory engine; SWARM,
HANDOFF, EXPANSION, AGENTS, continuity, state and living proof fd2d51ae
consulted. Latest 20 peer commit titles inspected; integration a5f9e057,
geometry 9530ff09, editor a5db7249 and selected-point fec5acd7 read.
Prior RUN37-39 remain uncompiled here. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream head separately observed 756a70250dcba9162b99d4ea35c186558434c17e;
not substituted. Source ledger:
src/Formalism/SizeWindowBrackets/ChainSlopeWindows/DiscriminantSettingSatisfied.lean edc32424311c076565c2e13b7657f6a5f58cfd84
src/Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean 3f609406f5456e034f5dfb94e9688fca6c9f95a9
src/Formalism/SizeWindowBrackets/WindowSettingSatisfiable.lean 641dc12c8c7005d532889ed7a3044636ba72b3c5
src/Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean 287dcaae544bf078e47910aa5c9986ec501bdbd2
src/Formalism/LocalToGlobal/GlobalTheory/SmallShareWeightExists.lean 1fa3d7c7c5fcd4a31a376dd26beea1372b8d3c8e

RESULT: at the ACTUAL joint_discriminant_bound consumer, weaken the
shared small-share requirement lhsW <= x^(-9) to lhsW <= 1/(2*x).
This is a factor x^8/2 in admissible budget (for x>=2). No change
to the final native pointwise bounds ASK-Ga <= (3C+13)U, IO <= U.
Let M=|J|, T=|TT|, U=T*M*b >=0, a=x*b (native Facts.ha).
Native second_discriminant_bound gives Second <= 2*a*M*T*lhsW <= U.
Native io_discriminant_bound gives IO <= a*M*T*lhsW <= U/2.
Sum the other TEN contributions BEFORE adding Second: nine ordinary
sg*U terms and the high bucket (2 log 4*C+3*sg)*U give
(2 log 4*C+12*sg)*U. Keep all side conditions, 0<=C, 0<=sg<=1.
Hence ASK-Ga <= (2 log 4*C+12*sg+1)*U <= (3C+13)*U.
The native strong explicit sg-bound is NOT asserted with the weaker
premise; it remains available through the original branch.
At x>=2, 2*x <= x^9, so original budget implies new. This is
analytic algebra, not an empirical estimate of actual small shares.
The new local loss_setting_family40 retains PtH, LinkG_at, ParTie,
ChBadp_at, all local parameters and exact chosen support; it accepts
the new bound at that same P and same X. It does not change ChW_at
globally, nor assume a different independent weight for each translation.
The native chosenW_of supplies the stronger x^-9 using MeanKappaBound;
next weaken THAT producer's aggregate mean on the actual same vector,
not assume the relaxed premise. Other ChW consumers remain unchanged.

Selected original graph:
losses_of_small_share_weight -> loss_setting_family -> ChW_at;
-> joint_discriminant_eventually -> joint_discriminant_bound -> joint_core
-> size_core, second_discriminant_bound, io_discriminant_bound, sizeIo_core.
Candidate graph:
loss_setting_family40 -> relaxed lhsW (same host/vector);
joint_discriminant_bound40 -> joint_core40 -> size_without_second40,
same second/io_discriminant_bound with relaxed R, same loss_bound.
Retain old stronger explicit estimate, all other consumers and complete
original/reduced type/value/constructor/axiom evidence; no global
dependency retired. Cache key pin, toolchain, P,X,K,Cr,C,bo, e,
same selected vector, Ps,cand,PR,J,TT,BAD,Sig,io,D, exact role.
Backtrack to original if native replay fails. No URT claim.
Actually executed: 36 source/hash/guard checks and 999 exact
integer threshold comparisons, x=2..1000. No native host test.
Actions 45577239749,45576756833,45670987597 jobs fetched in this run,
all completed/success; these cover prior engine/conditional endpoint,
not this module. No new native axiom result or CI job.
RESUME HERE: replay RUN37-39 and this module in the pinned existing
runner. For actual chosenW_of replace its oversmall x^-9 target with
1/(2x), preserving the SAME chosen vector across the native covered
family. Trace the remaining MeanKappaBound and LinkG_at uses, do not
remove them globally; use only a checked consumer substitution.
All actual VWinAt(1,401), rank/count, entropy, local gain and arithmetic
window premises remain open. HANDOFF TO integration, geometry, kernel,
audit, editor.
-/

noncomputable section
namespace Formalism.LFunctionChainParameters.SmallOrderPrimeLosses
open Finset Classical
open Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.PrimeWindowSizeBounds
variable {ι κ τ : Type}

def PrimeClassLossHypotheses40 (P : Par) {U : Type} (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
    (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ) : Prop :=
  TT.Nonempty ∧ (∀ p ∈ Ps, p.Prime ∧ p ≠ 2) ∧ (∀ p ∈ cand, 0 ≤ Sig p) ∧
  lhsW cand P.θ Sig ≤ 1 / (2 * P.x) ∧
  badPrimeLogWeightedCount PR TT BAD ≤ (TT.card : ℝ) * P.x ^ (-2 + P.ε) ∧
  (∀ υ, ∀ p ∈ cand, io υ p ≤ 2 * Sig p * (2 * ((J.card : ℝ) * TT.card * P.a) / p)) ∧
  (∀ υ, ParametersHyp P Ps J TT (D υ) ∧ FirstHyp P Ps (D υ).cl ∧
    (∀ p ∈ Ps, (D υ).cl p = PClass.second → p ∈ cand ∧ P.θ < Sig p) ∧
    (∀ p ∈ Ps, (D υ).cl p = PClass.served → ∀ t ∈ TT \ (D υ).TTp p, p ∈ PR ∧ BAD p t))

def LossBoundsUnderSizeWindows40 : Prop :=
  ∃ Cord : ℝ, 0 ≤ Cord ∧ ∀ (P : Par) (e K : ℝ), P.Cord = Cord → WindowsD P e K → LargeX P.x P.ε e K →
    ∀ (ι κ τ U : Type) (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
      (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ),
      PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D → ExcessAndPrimeLogSumUnitBounds P Ps cand J TT io D

lemma size_without_second40 {P : Par} {e K m T : ℝ} (hW : Windows P e K) (hL : LargeX P.x P.ε e K) (hm : 0 ≤ m)
    (hT : 1 ≤ T) : tDetD P m T - tSecondD P m T ≤ (2 * Real.log 4 * P.C + 12 * sg P K) * unitU P m T := by
  have a1 := size_floors_bound P e K m T hW hL hm hT
  have a2 := size_cp_bucket_bound P e K m T hW hL hm hT
  have a3 := size_prime_low_bound P e K m T hW hL hm hT
  have a4 := size_prime_high_bound P e K m T hW hL hm hT
  have a5 := size_or_bucket_bound P e K m T hW hL hm hT
  have a6 := sizeOut_core hW hL hm hT
  have a7 := size_orders_bucket_bound P e K m T hW hL hm hT
  have a8 := size_band_bound P e K m T hW hL hm hT
  have a9 := size_high_bucket_bound P e K m T hW hL hm hT
  have a10 := size_discriminant_bound P e K m T hW hL hm hT
  unfold tDetD
  linarith

lemma joint_core40 : ∃ Cord : ℝ, 0 ≤ Cord ∧ ∀ (P : Par) (e K : ℝ), P.Cord = Cord → Windows P e K →
    LargeX P.x P.ε e K →
    ∀ (ι κ τ U : Type) (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
      (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ),
      PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D →
      ExcessAndPrimeLogSumUnitBounds P Ps cand J TT io D := by
  obtain ⟨C₁, hC₁⟩ := first_kind_bound
  refine ⟨max C₁ 0, le_max_right _ _, ?_⟩
  intro P e K hCord hW hL ι κ τ U Ps cand PR J TT BAD Sig io D hS
  obtain ⟨hTT, hPs, hSig0, hWW, hT2, hio, hAll⟩ := hS
  obtain ⟨z, u, E, X, S, sb, v, w8, F⟩ := facts hW hL
  obtain ⟨s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, -⟩ :=
    side_condition_of_windows P e K hW hL
  have hm : (0 : ℝ) ≤ (J.card : ℝ) := Nat.cast_nonneg _
  have hT : (1 : ℝ) ≤ (TT.card : ℝ) := by exact_mod_cast Finset.card_pos.2 hTT
  have hT0 : (0 : ℝ) ≤ (TT.card : ℝ) := Nat.cast_nonneg _
  have ha0 : 0 ≤ P.a := F.apos.le
  have hU := unitU_nonneg (P := P) hm hT
  have hscale : 2 * P.a * (J.card : ℝ) * TT.card * (1 / (2 * P.x)) = unitU P J.card TT.card := by
    rw [F.ha]
    unfold unitU
    field_simp [ne_of_gt F.xpos] <;> ring
  have hA : ∀ υ, (D υ).ASK P.d Ps J TT - (D υ).Ga J ≤
      (2 * Real.log 4 * P.C + 12 * sg P K) * unitU P J.card TT.card + unitU P J.card TT.card := by
    intro υ
    obtain ⟨hLed, hFirst, hSecond, hBad⟩ := hAll υ
    obtain ⟨l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11⟩ := hLed
    have led := loss_bound ι κ τ (D υ).W (D υ).below (D υ).l Ps (D υ).cl J TT (D υ).TTp
      (D υ).Iex (D υ).at_ (D υ).wz (D υ).Id (D υ).wd P.d (D υ).gainW (D υ).tauW
      (D υ).gain (D υ).tau (D υ).lo (D υ).fl P.a P.th P.wpp P.Xpp P.Xp P.C P.f P.N P.Sk P.Q₁ P.Q₂
      P.lx P.La P.k P.K₀ (D υ).L₁ P.p₀ l1 (fun p hp => (hPs p hp).1) s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
      s11 s12 s13 s14 s15 s16 s17 s18 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11
    have out := out_discriminant_bound τ Ps PR (D υ).cl TT (D υ).TTp BAD J.card P.a _ hm ha0 hT2 hBad
    have first := first_le hC₁ (by rw [hCord]; exact le_max_left _ _) hW hL Ps (D υ).cl hPs hFirst
      J.card TT.card hm hT0
    have second := second_discriminant_bound Ps cand (D υ).cl Sig P.θ J.card TT.card P.a _ hm hT0 ha0 hSig0 hWW hSecond
    rw [hscale] at second
    have size := size_without_second40 hW hL hm hT
    unfold tDetD tFloors tCp tPrLow tPrHigh tOr tHigh tD tOutD at size
    unfold LD.ASK LD.Ga
    linarith
  have hI : ∀ υ, ∑ p ∈ cand, Real.log p * io υ p ≤ unitU P J.card TT.card := by
    intro υ
    have h := io_discriminant_bound cand Sig (io υ) P.θ J.card TT.card P.a _ hm hT0 ha0 hWW (hio υ)
    have he : P.a * (J.card : ℝ) * TT.card * (1 / (2 * P.x)) = unitU P J.card TT.card / 2 := by
      linarith only [hscale]
    rw [he] at h
    linarith
  refine ⟨fun υ => (hA υ).trans ?_, hI⟩
  have h1 : 2 * Real.log 4 * P.C + 12 * sg P K + 1 ≤ 3 * P.C + 13 := by
    have := mul_le_mul_of_nonneg_right (show 2 * Real.log 4 ≤ 3 by linarith [log_four_le_three_halves]) F.C0
    linarith [F.sg1]
  calc _ = (2 * Real.log 4 * P.C + 12 * sg P K + 1) * unitU P J.card TT.card := by ring
       _ ≤ _ := mul_le_mul_of_nonneg_right h1 hU

theorem joint_discriminant_bound40 : LossBoundsUnderSizeWindows40 := by
  obtain ⟨Cord, h0, h⟩ := joint_core40
  refine ⟨Cord, h0, ?_⟩
  intro P e K hC hW hL ι κ τ U Ps cand PR J TT BAD Sig io D hS
  exact h (clr P) e K hC ((discriminant_windows_iff P e K).1 hW) hL ι κ τ U Ps cand PR J TT BAD Sig io D hS


theorem budget40_of_native (x : ℝ) (hx : 2 ≤ x) :
    (x ^ 9)⁻¹ ≤ 1 / (2 * x) := by
  have hx0 : 0 < x := by linarith
  have hp : 1 ≤ x ^ 7 := one_le_pow₀ (by linarith) 
  have h2 : 2 * x ≤ x ^ 9 := calc
    _ ≤ x * x := mul_le_mul_of_nonneg_right hx hx0.le
    _ = x ^ 2 := by ring
    _ ≤ x ^ 2 * x ^ 7 := le_mul_of_one_le_right (sq_nonneg x) hp
    _ = _ := by ring
  rw [← one_div]
  apply (div_le_div_iff₀ (by positivity : 0 < x ^ 9) (by positivity : 0 < 2 * x)).2
  simpa using h2

theorem primeClass40_of_native (P : Par) {U : Type}
    (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
    (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ)
    (hx : 2 ≤ P.x) (h : PrimeClassLossHypotheses P Ps cand PR J TT BAD Sig io D) :
    PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D := by
  obtain ⟨h1,h2,h3,h4,h5,h6,h7⟩ := h
  exact ⟨h1,h2,h3,h4.trans (budget40_of_native P.x hx),h5,h6,h7⟩

example (P : Par) {U : Type} (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
    (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ)
    (hx : 2 ≤ P.x) (h : PrimeClassLossHypotheses P Ps cand PR J TT BAD Sig io D) :
    PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D := by
  first | rh_reduce 2 using [primeClass40_of_native] | exact primeClass40_of_native P Ps cand PR J TT BAD Sig io D hx h

example (P : Par) {U : Type} (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
    (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ)
    (hx : 2 ≤ P.x) (h : PrimeClassLossHypotheses P Ps cand PR J TT BAD Sig io D) :
    PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D := by
  first | rh_auto 2 | exact primeClass40_of_native P Ps cand PR J TT BAD Sig io D hx h

example (P : Par) {U : Type} (Ps cand PR : Finset ℕ) (J : Finset κ) (TT : Finset τ)
    (BAD : ℕ → τ → Prop) (Sig : ℕ → ℝ) (io : U → ℕ → ℝ) (D : U → LD ι κ τ)
    (hx : 2 ≤ P.x) (h : PrimeClassLossHypotheses P Ps cand PR J TT BAD Sig io D) :
    PrimeClassLossHypotheses40 P Ps cand PR J TT BAD Sig io D := by
  first | (rh_auto_frontier 2 <;> done) | exact primeClass40_of_native P Ps cand PR J TT BAD Sig io D hx h

end Formalism.LFunctionChainParameters.SmallOrderPrimeLosses

namespace Formalism.L2.GlobalTheoryTheory.Loss7
open Formalism.BasicNotions Formalism.MainNotions Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.PrimeWindowSizeBounds Formalism.LFunctionChainParameters.SmallOrderPrimeLosses Formalism.L2.GlobalTheoryTheory.Loss

def LossSettingFamily40 : Prop :=
  ∀ (D : D7) (L : SizeData₂ D) (X : G.Inst D L) (K : G.Consts) (Cr C bo : ℝ) (P : Par),
    PtH X K Cr → LinkG_at X K C bo → ParTie P L K C bo Cr → 0 ≤ bo → 0 ≤ L.LaG → L.sc.p0 D.R.k ≤ L.sc.X' →
    D.host.TT.Nonempty → ChBadp_at X →
    lhsW (sAt L K) P.θ (fun p => G.Sig X K (G.aL L) (G.bL L) p) ≤ 1 / (2 * P.x) →
    PrimeClassLossHypotheses40 P (PsAt L) (sAt L K) (largeOrderResiduePrimes L) (SizeData₂.lifts D) (TTv D) (badAt X)
      (fun p => G.Sig X K (G.aL L) (G.bL L) p) (fun (_ : Unit) p => G.ioP X K (G.aL L) (G.bL L) p)
      (fun _ => ldAt X K C bo)

theorem loss_setting_family40 : LossSettingFamily40 := by
  classical
  intro D L X K Cr C bo P H hG tie hbo hLa hp0 hTT hB hW
  obtain ⟨-, -, -, -, -, -, -, ea, -, eθ⟩ := side_at X K Cr C bo H P tie hbo hLa hp0
  have hx0 : 0 < L.sc.x := lt_trans one_pos L.sc.one_lt_alt
  have hSig : ∀ p, 0 ≤ G.Sig X K (G.aL L) (G.bL L) p :=
    fun p => Lnk.Sig_nonneg X K H.Knn H.kapI _ _ p
  refine ⟨?_, ?_, fun p _ => hSig p, ?_, ?_, ?_, fun _ => ⟨?_, ?_, ?_, ?_⟩⟩
  · unfold TTv; exact hTT.image _
  · intro p hp
    obtain ⟨h1, h2⟩ := mem_PsAt hp
    exact ⟨h1, fun h => two_not_inert _ (h ▸ h2)⟩
  · exact hW
  · unfold ChBadp_at at hB
    unfold badPrimeLogWeightedCount
    rw [card_TTv, tie.x, tie.ε]
    simp only [bad_card_at]
    exact hB
  · intro _ p _
    have h := Lnk.ioP_le X K p (hG.2.1 p) (hSig p)
    rw [card_lifts, card_TTv, ea]
    exact h
  · exact lossHyp_at X K Cr C bo H hG P tie hbo hLa hp0
  · exact firstHyp_at X K Cr C bo H (T_not_inert _) P tie
  · intro p _ h
    obtain ⟨h1, h2⟩ := second_spec X K p h
    rw [eθ]
    exact ⟨(mem_sAt K).mpr h1, h2⟩
  · intro p hp h n hn
    have hn' : n ∈ TTv D ∧ n ∉ (ldAt X K C bo).TTp p := by
      simpa only [Finset.mem_sdiff] using hn
    exact unserved_bad X K Cr C bo H (T_not_inert _) p hp h n (Finset.mem_sdiff.mpr hn')

end Formalism.L2.GlobalTheoryTheory.Loss7

#print axioms Formalism.LFunctionChainParameters.SmallOrderPrimeLosses.joint_discriminant_bound40
#print axioms Formalism.LFunctionChainParameters.SmallOrderPrimeLosses.primeClass40_of_native
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.loss_setting_family40
rh_scan Formalism.LFunctionChainParameters.SmallOrderPrimeLosses.joint_discriminant_bound40 limit 2000
rh_prune Formalism.LFunctionChainParameters.SmallOrderPrimeLosses.joint_discriminant_bound40 as RHDiscriminant40Pruned
end

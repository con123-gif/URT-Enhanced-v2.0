import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45 lane 4, 26 Nov 2026. HUMAN SOURCE-MATCHED small-prime budget
discharged under existing native size conditions; Lean PREPARED, UNCOMPILED.
RH OPEN. Not a claim of new number theory or verified global pruning.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, SWARM, HANDOFF, EXPANSION, AGENTS, state, protocol and continuity
consulted. Peer prime RUN47 e827b4fe (class/local exact rank) read; distinct
supplier. Latest peer 12 commit identifiers inspected. Upstream observed
2746005d8130ee6d0c82d771ec11d69521a65093; retain pinned
40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Source blobs (relative to src/):
Formalism/LocalRingCardinality/DataParams₂.lean
50914500995df91e2646d91a6c5c99a7e603a51b: Scale.A=26.
Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean
9fbb7879d0519f9a136e190551422881ef5d2f0b:
Inst.bs_orb/bs_step, rG, KG, hG, Cand, kapIIf, kapLoc, kapv, Sig.
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
8166795ec6e846795d7272781119ee7d17d426c0:
Marg.phi_inj, Marg.sum_Nv_le, threshold_prime_le_pow (uses Lnk.winC).
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
287dcaae544bf078e47910aa5c9986ec501bdbd2:
size_alt_alt, term_le, chosenW_of (actual Mertens bound).
Formalism/SharpRestriction/GrowthBounds/SmallOrderPrimes.lean
a35ad58d20f072b48cbb03f619f1bf0f1501e66f: adm7, adm8, HypI.
RUN44 blob 05aa9e758bf2748914eb48a34ec57f18bc62fe11.

RESULT: no new arithmetic premise needed for small-prime weight budget.
For fixed family epsilon, rG depends only on epsilon (exact definitions),
and K.kII is a fixed family constant. Eventually both <= x, uniformly
in i. Native SizeK supplies k<=x^5. Thus the exact small-prime coefficient
C_x = K.kII*rG^2*k*x^(-26) <= x^(-18) <= x^(-12).
For each good representative t, the map i -> t+i*hP is injective
on topsPos (native Marg.phi_inj). Since t is in the image of bs(hP,-),
bs_orb and repeated bs_step give bs(hP,t)=t. Cand makes stepP=hP
(inertClass, not signal). Hence the image is contained in topsOn;
only the injection is needed, not the inverse orbit parameterization.
So card(topsPos)<=Nv. Summing Nv over goodReps is <= card(host.TT)
by native Marg.sum_Nv_le. The deterministic actual Sig for p<p0 is
therefore bounded by m*card(TT)*x^(-12), and is nonnegative.
This also discharges the small-prime pointwise clause of MeanKappaBound
under the same native guards. Its small-prime average follows by averaging
the constant over nonempty native boxes (empty box convention gives 0).

Apply native term_le and the actual Mertens bound over sAt, as in chosenW_of.
Because the weights are nonnegative, restricting to p<p0 costs no more.
Native size_alt_alt with the original SizeN/SizeM/SizeTT gives:
  sum_{p in sAt, p<p0} log(p)/p *
    (2*1_{theta<Sig(p)} + 4*Sig(p)) <= x^(-9).
This holds for EVERY admissible vector (in fact all vectors), for the
same host/index, eventually uniformly. All guards are available in
the original family size bundle or by eventual growth of x: SizeK,
SizeN, SizeM, SizeTT; Fm.L_eps, Fm.L_x, Fm.GK_nonneg; fixed
K.kII and rG(eps); eventual 24<=x^(1/4). No use of MeanKappaBound
or adm8 to prove the small-prime portion. This replaces RUN44's
unresolved scalar budget. It leaves the large-prime cost <=1/(2*x)-x^-9
as a sufficient residual budget (>=1/(4*x) for x>=2, so the simple
large-prime budget <=1/(4*x) suffices). This is a local human proof,
not a completed LinkG, VWinAt or RH proof. No other consumer retired.

Large-prime source audit: X.kapI is a free field of G.Inst;
nonnegativity alone cannot prove adm8 (which asks for meanLoc<=
Cm*card(TT)*N1/x^13). Need actual arithmetic constructor / bound,
not algebra on a freely quantified function. Preserve adm7 LPprime,
HypI, all candidate orbit/size guards and uniform family quantifiers.
In the next step trace (Fm.ex x hx i).kapI_def, not a synthetic
choice of kapI or analogous GD definitions. Do not assume adm8.

Executed V8 5373 exact integer product/exponent checks (x=2..200,
k in {0,1,x^5}, r and K in {0,1,x}) and 4100 finite cyclic-orbit
partition controls (n=1..40, h=0..n-1, five periodic top subsets).
These are arithmetic/structural controls only, not native host tests.
No local lean/lake/gh; git DNS unavailable. Actual CI job outputs
45577239749,45576756833,45670987597 retrieved completed/success for
previous native baselines only. New code below not compiled.
No new axiom evidence; preserve old logs and all unresolved obligations.

Original selected graph: chosenW_of -> mean_SigO -> MeanKappaBound
 -> kapLoc -> kapIIf (small) / kapI (large).
Candidate small branch: smallBudget45 -> smallSig_le45 ->
 kapIIf_le45 -> coeff_le45 -> native winC;
 card_topsPos_le45 -> bs_orb/bs_step, Marg.phi_inj;
 Marg.sum_Nv_le; native term_le, size_alt_alt, Mertens.
Large branch unchanged, RUN44/43/42/41/40 fallback preserved.
Cache pin/toolchain/Fm/x/i/D/L/X/K/p/t0/actual orbit/weight vectors/
sAt/threshold/consumer. No global minimality or URT acceleration.
No claimed RH theorem imported as shortcut.

RESUME HERE: native replay of this independent certificate with the
existing overlay (no dependence on uncompiled RUN44). Then trace actual
kapI_def constructor and prove or authenticate adm8 quantitative bound;
use large-prime capped budget <=1/(4*x) with the SAME host and vector.
Preserve all original/reduced graphs and axiom evidence.
HANDOFF TO geometry, integration, kernel, audit, editor.
-/

noncomputable section
open scoped BigOperators
namespace Formalism.L2.GlobalTheoryTheory.Loss
open Formalism.BasicNotions Formalism.MainNotions Formalism.FrobeniusOrbits

section AtRecord
variable {D : D7} {L : SizeData₂ D}

theorem rg_eq_of_eps45 (s t : Scale) (h : s.eps = t.eps) :
    G.rG s = G.rG t := by simp [G.rG, G.KG, G.hG, h]

theorem coeff_le45 (K : G.Consts) (sK : SizeK L)
    (hK : K.Nonneg) (hKx : K.kII ≤ L.sc.x)
    (hr : (G.rG L.sc : ℝ) ≤ L.sc.x) :
    K.kII * (G.rG L.sc : ℝ)^2 * (D.R.k : ℝ) *
        L.sc.x ^ (-Scale.A) ≤ L.sc.x ^ (-12 : ℝ) := by
  have hx0 : 0 < L.sc.x := scale_pos_alt L.sc
  have hK0 : 0 ≤ K.kII := hK.2.2.1
  have hk := Lnk.winC sK
  calc
    _ ≤ L.sc.x * L.sc.x^2 * L.sc.x ^ (5 : ℝ) *
          L.sc.x ^ (-26 : ℝ) := by
      unfold Scale.A
      gcongr
    _ = L.sc.x ^ (1 : ℝ) * L.sc.x ^ (2 : ℝ) *
          L.sc.x ^ (5 : ℝ) * L.sc.x ^ (-26 : ℝ) := by
      rw [Real.rpow_one, Real.rpow_two]
    _ = L.sc.x ^ (-18 : ℝ) := by
      rw [← Real.rpow_add hx0, ← Real.rpow_add hx0, ← Real.rpow_add hx0]
      norm_num
    _ ≤ L.sc.x ^ (-12 : ℝ) :=
      Real.rpow_le_rpow_of_exponent_le L.sc.one_lt_alt.le (by norm_num)

theorem kapIIf_le45 (K : G.Consts) (sK : SizeK L)
    (hK : K.Nonneg) (hKx : K.kII ≤ L.sc.x)
    (hr : (G.rG L.sc : ℝ) ≤ L.sc.x) (N : ℕ) :
    G.kapIIf K L N ≤ (N : ℝ) * L.sc.x ^ (-12 : ℝ) := by
  unfold G.kapIIf
  calc
    _ ≤ _ := min_le_right _ _
    _ = (N : ℝ) * (K.kII * (G.rG L.sc : ℝ)^2 * (D.R.k : ℝ) *
          L.sc.x ^ (-Scale.A)) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left (coeff_le45 K sK hK hKx hr)
      (Nat.cast_nonneg _)

theorem bs_nsmul45 (X : G.Inst D L) (h t : G.HH D) (n : ℕ) :
    X.bs h (t + n • h) = X.bs h t := by
  induction n with
  | zero => simp
  | succ n ih => rw [succ_nsmul, ← add_assoc, X.bs_step, ih]

theorem card_topsPos_le45 (X : G.Inst D L) (K : G.Consts)
    (p : ℕ) (hc : G.Cand D L K p) (t : G.HH D)
    (ht : t ∈ G.goodReps X p) :
    (G.topsPos D p t).card ≤ G.Nv X p t := by
  classical
  have hcl : G.IsResidueClassZero D p := hc.2.2.1
  have hstep : G.stepP D p = G.hP D p := by
    unfold G.stepP G.IsSg
    unfold G.IsResidueClassZero at hcl
    rw [hcl]
    simp
  have ht' : t ∈ G.reps X p := (Finset.mem_filter.mp ht).1
  unfold G.reps at ht'
  obtain ⟨v, _, hv⟩ := Finset.mem_image.mp ht'
  rw [hstep] at hv
  obtain ⟨j,hj⟩ := X.bs_orb (G.hP D p) v
  rw [hv] at hj
  have hfix : X.bs (G.hP D p) t = t := by
    calc
      _ = X.bs (G.hP D p) (t + j • G.hP D p) :=
        (bs_nsmul45 X _ _ _).symm
      _ = t := by rw [hj,hv]
  let e : Fin (addOrderOf (G.hP D p)) ↪ G.HH D :=
    ⟨Marg.phi D p t, Marg.phi_inj p t⟩
  have hsub : (G.topsPos D p t).map e ⊆ G.topsOn X p t := by
    intro u hu
    obtain ⟨i,hi,rfl⟩ := Finset.mem_map.mp hu
    have hi' : t + (i : ℕ) • G.hP D p ∈ D.host.TT :=
      (Finset.mem_filter.mp hi).2
    simp only [G.topsOn, Finset.mem_filter]
    change (t + (i : ℕ) • G.hP D p ∈ D.host.TT) ∧
      X.bs (G.stepP D p) (t + (i : ℕ) • G.hP D p) = t
    exact ⟨hi', by rw [hstep, bs_nsmul45, hfix]⟩
  simpa only [Finset.card_map, G.Nv] using Finset.card_le_card hsub

theorem smallKapv_le45 (X : G.Inst D L) (K : G.Consts)
    (sK : SizeK L) (hK : K.Nonneg) (hKx : K.kII ≤ L.sc.x)
    (hr : (G.rG L.sc : ℝ) ≤ L.sc.x)
    (a b : G.HH D → ℤ) (p : ℕ) (hc : G.Cand D L K p)
    (hp : (p : ℝ) < L.sc.p0 D.R.k) (t : G.HH D)
    (ht : t ∈ G.goodReps X p) :
    G.kapv X K a b p t ≤ (G.Nv X p t : ℝ) * L.sc.x ^ (-12 : ℝ) := by
  unfold G.kapv G.kapLoc
  rw [if_pos hp]
  refine (kapIIf_le45 K sK hK hKx hr _).trans ?_
  exact mul_le_mul_of_nonneg_right (by exact_mod_cast card_topsPos_le45 X K p hc t ht)
    (Real.rpow_nonneg (scale_pos_alt L.sc).le _)

theorem smallSig_le45 (X : G.Inst D L) (K : G.Consts)
    (sK : SizeK L) (hK : K.Nonneg) (hKx : K.kII ≤ L.sc.x)
    (hr : (G.rG L.sc : ℝ) ≤ L.sc.x)
    (a b : G.HH D → ℤ) (p : ℕ) (hc : G.Cand D L K p)
    (hp : (p : ℝ) < L.sc.p0 D.R.k) :
    G.Sig X K a b p ≤ (D.R.m : ℝ) * (D.host.TT.card : ℝ) *
      L.sc.x ^ (-12 : ℝ) := by
  have hN : (∑ t ∈ G.goodReps X p, (G.Nv X p t : ℝ)) ≤
      (D.host.TT.card : ℝ) := by
    exact_mod_cast Marg.sum_Nv_le X p (G.goodReps X p)
  unfold G.Sig
  calc
    _ ≤ (D.R.m : ℝ) * ∑ t ∈ G.goodReps X p,
        (G.Nv X p t : ℝ) * L.sc.x ^ (-12 : ℝ) :=
      mul_le_mul_of_nonneg_left
        (Finset.sum_le_sum fun t ht => smallKapv_le45 X K sK hK hKx hr a b p hc hp t ht)
        (Nat.cast_nonneg _)
    _ = (D.R.m : ℝ) * ((∑ t ∈ G.goodReps X p, (G.Nv X p t : ℝ)) *
         L.sc.x ^ (-12 : ℝ)) := by rw [Finset.sum_mul]
    _ ≤ _ := by
      rw [mul_assoc]
      exact mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_right hN (Real.rpow_nonneg (scale_pos_alt L.sc).le _))
        (Nat.cast_nonneg _)

theorem smallSig_nonneg45 (X : G.Inst D L) (K : G.Consts)
    (hK : K.Nonneg) (a b : G.HH D → ℤ) (p : ℕ)
    (hp : (p : ℝ) < L.sc.p0 D.R.k) : 0 ≤ G.Sig X K a b p := by
  have hK0 : 0 ≤ K.kII := hK.2.2.1
  have hx0 := scale_pos_alt L.sc
  unfold G.Sig
  apply mul_nonneg (Nat.cast_nonneg _)
  apply Finset.sum_nonneg
  intro t _
  unfold G.kapv G.kapLoc
  rw [if_pos hp]
  unfold G.kapIIf
  exact le_min (by norm_num) (by positivity)

end AtRecord
end Formalism.L2.GlobalTheoryTheory.Loss

namespace Formalism.L2.GlobalTheoryTheory.Loss7
open Formalism.BasicNotions Formalism.MainNotions Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.PrimeWindowSizeBounds Formalism.LFunctionChainParameters.SmallOrderPrimeLosses Formalism.L2.GlobalTheoryTheory.Loss

section AtRecord
variable {D : D7} {L : SizeData₂ D}

theorem smallBudget45 (X : G.Inst D L) (K : G.Consts)
    (sN : SizeN L) (sM : SizeM L) (sK : SizeK L) (sTT : SizeTT L)
    (hK : K.Nonneg) (hKx : K.kII ≤ L.sc.x)
    (hr : (G.rG L.sc : ℝ) ≤ L.sc.x)
    (h24 : 24 ≤ L.sc.x ^ ((1 : ℝ)/4)) (a b : G.HH D → ℤ) :
    (∑ p ∈ (sAt L K).filter (fun p => (p : ℝ) < L.sc.p0 D.R.k),
      Real.log (p : ℝ)/p *
        ((if L.sc.x ^ (-L.sc.eps) < G.Sig X K a b p then 2 else 0) +
          4 * G.Sig X K a b p)) ≤ L.sc.x ^ (-9 : ℝ) := by
  classical
  let S := (sAt L K).filter (fun p => (p : ℝ) < L.sc.p0 D.R.k)
  let θ : ℝ := L.sc.x ^ (-L.sc.eps)
  let s0 : ℝ := (D.R.m : ℝ) * (D.host.TT.card : ℝ) * L.sc.x ^ (-12 : ℝ)
  have hx0 := scale_pos_alt L.sc
  have hθ : 0 < θ := Real.rpow_pos_of_pos hx0 _
  have hs0 : 0 ≤ s0 := by dsimp [s0]; positivity
  have hA : 0 ≤ 2/θ+4 := by positivity
  have hlp : ∀ p : ℕ, 0 ≤ Real.log (p : ℝ)/p :=
    fun p => div_nonneg (Real.log_natCast_nonneg p) (Nat.cast_nonneg p)
  have hX' : L.sc.X' = Real.exp (L.sc.x ^ (L.sc.eps/3)) := rfl
  have hM : ∑ p ∈ sAt L K, Real.log (p : ℝ)/p ≤
      2 * L.sc.x ^ (L.sc.eps/3) := by
    have h1 := Formalism.L2.GlobalTheoryTheory.Places.mertens L.sc.X' (pd_one_le_X' _)
    rw [hX', Real.log_exp, ← hX'] at h1
    refine le_trans (Finset.sum_le_sum_of_subset_of_nonneg ?_ (fun p _ _ => hlp p)) h1
    intro p hp
    have hc := (mem_sAt K).mp hp
    exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (Nat.lt_ceil.mpr hc.2.1), hc.1⟩
  have hMS : ∑ p ∈ S, Real.log (p : ℝ)/p ≤ 2 * L.sc.x ^ (L.sc.eps/3) :=
    (Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _) (fun p _ _ => hlp p)).trans hM
  change (∑ p ∈ S, Real.log (p : ℝ)/p *
    ((if θ < G.Sig X K a b p then 2 else 0) + 4 * G.Sig X K a b p)) ≤ _
  calc
    _ ≤ ∑ p ∈ S, Real.log (p : ℝ)/p * ((2/θ+4)*s0) := by
      refine Finset.sum_le_sum fun p hp => mul_le_mul_of_nonneg_left ?_ (hlp p)
      have hp' := Finset.mem_filter.mp hp
      have hc := (mem_sAt K).mp hp'.1
      exact (term_le θ _ hθ (smallSig_nonneg45 X K hK a b p hp'.2)).trans
        (mul_le_mul_of_nonneg_left (smallSig_le45 X K sK hK hKx hr a b p hc hp'.2) hA)
    _ = ((2/θ+4)*s0) * ∑ p ∈ S, Real.log (p : ℝ)/p := by
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun p _ => mul_comm _ _
    _ ≤ ((2/θ+4)*s0) * (2 * L.sc.x ^ (L.sc.eps/3)) :=
      mul_le_mul_of_nonneg_left hMS (mul_nonneg hA hs0)
    _ ≤ _ := size_alt_alt sN sM sTT h24

end AtRecord
end Formalism.L2.GlobalTheoryTheory.Loss7

rh_scan Formalism.MainNotions.G.kapIIf limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.smallBudget45 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.Loss.smallKapv_le45 as RHSmallKapv45Pruned
rh_prune Formalism.L2.GlobalTheoryTheory.Loss7.smallBudget45 as RHSmallBudget45Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.card_topsPos_le45
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.coeff_le45
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.smallBudget45
end

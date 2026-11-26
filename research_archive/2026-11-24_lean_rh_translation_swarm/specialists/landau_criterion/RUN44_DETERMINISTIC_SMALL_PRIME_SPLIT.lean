import RUN43_CAPPED_LOCAL_MOMENT

/-!
RUN44 lane 4, 26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION / PREPARED
LEAN (UNCOMPILED). RH OPEN. No source migration or gate/schedule changes.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory
engine; AGENTS, protocol, handoff, expansion, continuity, state/log consulted.
Recent peer integration 3463c301, geometry fac11f41, prime 31ac8a22:
distinct rank-two, measure and Mobius routes. Upstream latest observed
de330e73d828ea08f621cb28395d48480806d00f bumps Lean 4.37.0-rc1:
retain pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Actual source (relative to src/):
Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean
9fbb7879d0519f9a136e190551422881ef5d2f0b:
G.kapLoc, kapIIf, kapv, Sig, Cand, MeanKappaBound, topsPos,
Inst.bs_orb/bs_step, stepP, reps, goodReps. This is the D7 version;
do NOT substitute the analogous GD definitions in InertJacobiLevels/TiesCore.
Formalism/SharpRestriction/GrowthBounds/SmallOrderPrimes.lean
a35ad58d20f072b48cbb03f619f1bf0f1501e66f: adm7, adm8.
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
8166795ec6e846795d7272781119ee7d17d426c0: Marg.phi_inj, Marg.sum_Nv_le,
sum_box_product, pf_sum_Wt, pf_card_Wt.
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
287dcaae544bf078e47910aa5c9986ec501bdbd2: chosenW_of, actual lhsW consumer.
RUN43 blob 1d540ad5a53c2f474297cee25fcca1f17a828f25.

RESULT: for p<p0, kapLoc is identically kapIIf K L TT.card,
independent of BOTH weight vectors. Thus for that branch the actual
Sig equals s_p=m sum_{t in goodReps} min(1,C_x N_t), where
C_x=K.kII*(rG L.sc)^2*k*x^(-Scale.A), N_t=card(topsPos D p t).
Pay exact charge 4*s_p + 2*1_{theta<s_p}, not the sum of capped
individual penalties. No probability/mean or KapIDef needed for this
identity. For p>=p0 retain RUN43's marginal of the capped cost.
This mixed budget suffices at the actual ChosenW42 consumer by averaging
over the SAME nonempty Wt, then the native Sig_eq transport. This is
pointwise no worse than RUN43's bound on the small branch.

Additional human bound (not native-checked): Cand implies inertClass
and hence stepP=hP. bs(h,t+i*h)=bs(h,t) by induction from bs_step.
For t0 in reps, choose v with bs(h,v)=t0. bs_orb gives
v=t0+j*h, so bs(h,t0)=t0. Every topsPos image under Marg.phi lies
in topsOn; conversely t in topsOn has t=t0+j*h from bs_orb, reduce
j modulo addOrderOf(h) using order annihilation. Marg.phi_inj gives a
bijection and card(topsPos)=Nv. Consequently Marg.sum_Nv_le gives
sum_{t in goodReps} N_t <= card(host.TT). With C_x>=0:
s_p <= B_x := m*C_x*card(host.TT). If B_x<=theta, the entire small
branch threshold charge is ZERO, including equality (strict native test).
Its weighted cost is <=4*B_x*sum_{p in sAt,p<p0} log(p)/p.
The remaining budget is then solely the large-prime capped local moments
plus this explicit scalar term; sufficient to show their sum <=1/(2*x).
Can use exact small charge even if B_x>theta. The uniform scalar
budget at actual scales and large-prime moment estimate are NOT proved
here. In particular retain adm7/adm8 and all other MeanKappaBound
consumers (including its second pointwise clause); no global deletion.
Native orbit bijection audit still needed.

Exact V8 scalar controls, not native host tests: theta=t/8,
m absorbed into three shares a/8,b/8,c/8. t=1..8 and a,b,c=0..24.
Compare exact charge numerator 16*t*1_{a+b+c>t}+4*(a+b+c)*t
with capped sum numerator 16*sum(min(t,a_i))+4*(a+b+c)*t.
Executed 125000 cases, 124524 strict improvements, 494 zero-threshold cases,
0 counterexamples. This does not establish uniform arithmetic estimates.
Local command -v lean and lake returned no path. Actual CI jobs
45577239749, 45576756833, 45670987597 retrieved completed/success
for prior native baseline only; no new CI pass or axiom audit.

Original selected graph: chosenW_of -> mean_SigO -> MeanKappaBound
-> kapLoc -> kapIIf (small) / kapI (large).
RUN43: chosenW_of43 -> localBudget43 -> localCost43 -> capCost43,
sum_costO43 -> sum_box_product.
RUN44: chosenW_of44 -> hybridBudget44 -> exact smallSig44/charge44
or localCost43 (large), sum_hybrid44 -> sum_costO43 (large).
Retain all original/reduced graphs, axiom evidence and pending nodes;
cache pin/toolchain/Fm/x/i0/D/L/X/K/p/threshold/full local functions,
box and consumer. No global pruning claim or URT speedup.
No claimed RH theorem imported as shortcut.

RESUME HERE: native replay RUN40--44; check actual orbit bijection and
scalar B_x with the existing Fm.sizes and scale exponent suppliers,
then attack large-prime adm8 (mean of kapI), not more endpoint rewrites.
If exact small charge cannot close the scalar guard, retain the mixed
budget and original RUN43 fallback. Preserve every shared consumer.
HANDOFF TO geometry, integration, kernel, audit and editor.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss
open Formalism.BasicNotions Formalism.MainNotions
open scoped BigOperators

section AtRecord
variable {D : D7} {L : SizeData₂ D}

def smallSig44 (X : G.Inst D L) (K : G.Consts) (p : ℕ) : ℝ :=
  (D.R.m : ℝ) * ∑ t ∈ G.goodReps X p, G.kapIIf K L (G.topsPos D p t).card

def charge44 (θ s : ℝ) : ℝ := (if θ < s then 2 else 0) + 4*s

theorem smallSig_eq44 (X : G.Inst D L) (K : G.Consts)
    (a b : G.HH D → ℤ) (p : ℕ) (hp : (p : ℝ) < L.sc.p0 D.R.k) :
    G.Sig X K a b p = smallSig44 X K p := by
  unfold G.Sig smallSig44
  congr 1
  exact Finset.sum_congr rfl (fun t _ => by simp [G.kapv, G.kapLoc, hp])

def rawSmall44 (X : G.Inst D L) (K : G.Consts) (p : ℕ) : ℝ :=
  (D.R.m : ℝ) * ∑ t ∈ G.goodReps X p,
    K.kII * ((G.topsPos D p t).card : ℝ) * (G.rG L.sc : ℝ)^2 *
      (D.R.k : ℝ) * L.sc.x ^ (-Scale.A)

theorem smallSig_le_raw44 (X : G.Inst D L) (K : G.Consts) (p : ℕ) :
    smallSig44 X K p ≤ rawSmall44 X K p := by
  unfold smallSig44 rawSmall44
  apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
  exact Finset.sum_le_sum (fun t _ => min_le_right _ _)

theorem smallCharge_le_raw44 (X : G.Inst D L) (K : G.Consts)
    (p : ℕ) (θ : ℝ) (h : rawSmall44 X K p ≤ θ) :
    charge44 θ (smallSig44 X K p) ≤ 4 * rawSmall44 X K p := by
  have hs := smallSig_le_raw44 X K p
  unfold charge44
  rw [if_neg (not_lt_of_ge (hs.trans h))]
  linarith

end AtRecord

section Family
variable {eps : ℝ} {Fm : FamP eps} {x : ℝ} {i0 : Fm.Ix x}

def hybridCost44 (θ : ℝ) (p : ℕ) (o : Lnk.Wt Fm x i0) : ℝ :=
  if (p : ℝ) < (Fm.L x i0).sc.p0 (Fm.D x i0).R.k then
    charge44 θ (smallSig44 (Fm.Gx x i0) Fm.GK p)
  else costO43 θ p o

def hybridMean44 (Fm : FamP eps) (x : ℝ) (i0 : Fm.Ix x)
    (θ : ℝ) (p : ℕ) : ℝ :=
  if (p : ℝ) < (Fm.L x i0).sc.p0 (Fm.D x i0).R.k then
    charge44 θ (smallSig44 (Fm.Gx x i0) Fm.GK p)
  else localCost43 (Fm.Gx x i0) Fm.GK θ p

theorem charge_le_hybrid44 (hx : Fm.x1 < x) (θ : ℝ) (hθ : 0 < θ)
    (p : ℕ) (o : Lnk.Wt Fm x i0) :
    ((if θ < SigO p o then 2 else 0) + 4*SigO p o : ℝ) ≤ hybridCost44 θ p o := by
  unfold hybridCost44
  split_ifs with hp
  · have hs : SigO p o = smallSig44 (Fm.Gx x i0) Fm.GK p :=
      smallSig_eq44 (Fm.Gx x i0) Fm.GK (aO o) (bO o) p hp
    rw [hs]
    exact le_rfl
  · exact cap_costO43 hx θ hθ p o

theorem sum_hybrid44 (hx : Fm.x1 < x) (θ : ℝ) (p : ℕ) :
    (∑ o : Lnk.Wt Fm x i0, hybridCost44 θ p o) =
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) * hybridMean44 Fm x i0 θ p := by
  classical
  by_cases hp : (p : ℝ) < (Fm.L x i0).sc.p0 (Fm.D x i0).R.k
  · simp only [hybridCost44, hybridMean44, if_pos hp, Finset.sum_const,
      Finset.card_univ, nsmul_eq_mul]
  · simpa only [hybridCost44, hybridMean44, if_neg hp] using
      (sum_costO43 (i0 := i0) hx θ p)

end Family
end Formalism.L2.GlobalTheoryTheory.Loss

namespace Formalism.L2.GlobalTheoryTheory.Loss7
open Formalism.BasicNotions Formalism.MainNotions Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.PrimeWindowSizeBounds Formalism.LFunctionChainParameters.SmallOrderPrimeLosses Formalism.L2.GlobalTheoryTheory.Loss

section Family
variable {eps : ℝ} (Fm : FamP eps)

def hybridBudget44 (x : ℝ) (i0 : Fm.Ix x) : Prop :=
  (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ)/p *
    hybridMean44 Fm x i0 ((Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps)) p)
    ≤ 1/(2*(Fm.L x i0).sc.x)

theorem chosenW_of44
    (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, hybridBudget44 Fm x i0) :
    ChosenW42 Fm := by
  classical
  obtain ⟨xG,hG⟩ := hG
  refine ⟨max (Fm.x1+1) xG, fun x hxx hxWin => ?_⟩
  have hx : Fm.x1 < x := by
    have := le_trans (le_max_left _ _) hxx
    linarith
  obtain ⟨i0,hB⟩ := hG x (le_trans (le_max_right _ _) hxx) hxWin
  have := Lnk.wt_nonempty (i0 := i0) hx
  have hx0 : 0 < (Fm.L x i0).sc.x := lt_trans one_pos (Fm.L x i0).sc.one_lt_alt
  have hcard : (0 : ℝ) < (Fintype.card (Lnk.Wt Fm x i0) : ℝ) := by exact_mod_cast Fintype.card_pos
  set θ : ℝ := (Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps) with hθ
  have hθ0 : 0 < θ := Real.rpow_pos_of_pos hx0 _
  have hlp : ∀ p : ℕ, 0 ≤ Real.log (p : ℝ)/p :=
    fun p => div_nonneg (Real.log_natCast_nonneg p) (Nat.cast_nonneg p)
  have hsum : ∑ o : Lnk.Wt Fm x i0, lhsW (sAt (Fm.L x i0) Fm.GK) θ (fun p => SigO p o) ≤
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) * (1/(2*(Fm.L x i0).sc.x)) := by
    calc _ ≤ ∑ o : Lnk.Wt Fm x i0, ∑ p ∈ sAt (Fm.L x i0) Fm.GK,
        Real.log (p : ℝ)/p * hybridCost44 θ p o := by
      refine Finset.sum_le_sum fun o _ => ?_
      unfold lhsW
      exact Finset.sum_le_sum fun p _ =>
        mul_le_mul_of_nonneg_left (charge_le_hybrid44 hx θ hθ0 p o) (hlp p)
    _ = ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ)/p *
        (∑ o : Lnk.Wt Fm x i0, hybridCost44 θ p o) := by
      rw [Finset.sum_comm]
      exact Finset.sum_congr rfl fun p _ => by rw [Finset.mul_sum]
    _ = (Fintype.card (Lnk.Wt Fm x i0) : ℝ) *
        (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ)/p *
          hybridMean44 Fm x i0 θ p) := by
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun p _ => by rw [sum_hybrid44 hx θ p]; ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hB hcard.le
  obtain ⟨o,ho⟩ := exists_le_of_sum _ _ hsum
  refine ⟨i0, Lnk.avOf o, Lnk.bvOf o, Lnk.admissible_weight_of_vector o, fun i hi => ?_⟩
  unfold ChW_at42
  rw [cands_eq, sAt_eq (i0 := i0) hx i, Lnk.sc_eq Fm hx i i0]
  simp only [Sig_eq hx i o hi]
  exact ho

example (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, hybridBudget44 Fm x i0) :
    ChosenW42 Fm := by
  first | (rh_reduce 2 using [chosenW_of44]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact chosenW_of44 Fm hG
end Family
end Formalism.L2.GlobalTheoryTheory.Loss7

rh_scan Formalism.MainNotions.G.kapLoc limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of44 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.Loss.smallSig_eq44 as RHSmallSig44Pruned
rh_prune Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of44 as RHChosenW44Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.smallSig_eq44
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.smallCharge_le_raw44
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.sum_hybrid44
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of44
end

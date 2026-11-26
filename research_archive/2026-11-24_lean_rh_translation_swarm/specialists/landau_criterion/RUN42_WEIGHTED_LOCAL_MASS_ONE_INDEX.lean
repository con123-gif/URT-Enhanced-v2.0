import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN42 lane 4, 26 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED. RH OPEN.
Mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory
engine included), AGENTS, SWARM, HANDOFF, EXPANSION and continuity/state/runner
openings consulted. Peer geometry 706da3bb, editor c9fdbd77, integration
f304da1a, prime 3fae1b85, kernel b0fd82e7, dependency 72787a07 checked.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1; Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream search fc32f250
not substituted. Sources relative to src/:
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
8166795ec6e846795d7272781119ee7d17d426c0: sum_box_product, pf_sum_Sig_le, pf_sum_Wt,
pf_card_Wt, mean_SigO, Sig_eq.
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
287dcaae544bf078e47910aa5c9986ec501bdbd2: term_le, exists_le_of_sum, chosenW_of.
Prior RUN41 blob b58d0f1c21d0364e09726e211a694dde8dad83ed and RUN40 retained.

RESULT: exact same-host box marginal identity before bounding any local mean.
Let M(p) = sum_{t in goodReps X p} meanLoc(kapLoc X K p t).
The native sum_box_product and equal-cardinality box bijection give
sum_o SigO(p,o) = |Wt| * m * M(p). This holds even when individual
means exceed the former Nv*x^-4 budget. It is not a new distribution.
For the actual threshold theta=x^-eps the native term_le now yields
   mean_o lhsW(o) <= (2/theta+4)*m*sum_{p in sAt}(log p/p)*M(p).
Thus a single weighted local mean budget <=1/(2*x) suffices, no
per-prime or per-orbit upper bound, no separate size/mertens exponent
bound at this consumer. Choose one i0 in the same Fm at each large x
in Fm.Win; this budget is needed only for that index, NOT all i.
Select one vector by native exists_le_of_sum. Native Sig_eq, sAt_eq,
sc_eq and CoverAll transport this same vector, not an independent
choice. No claim that other LinkG consumers can lose their hypotheses.
Nonnegative Sig from native kapI_def and GK_nonneg; log(p)/p nonnegative;
theta positive and weight type nonempty. Exact same native thresholds.

Original selected graph: chosenW_of -> LinkG -> MeanKappaBound (first)
-> mean_SigO -> pf_sum_Sig_le -> pf_sum_kapv_le -> sum_box_product;
size_alt_alt, Mertens; exists_le_of_sum, Sig_eq, coverage.
Reduced selected graph: chosenW_of42 -> one-index eventual localBudget42
-> sum_SigO_eq42 -> pf_sum_Sig_eq42 -> sum_box_product, pf_sum_Wt,
pf_card_Wt; term_le, exists_le_of_sum, Sig_eq, coverage unchanged.
ChW_at42 is RUN41's relaxed interface, consumed conditionally by RUN40;
actual final caller substitution and other LinkG obligations remain open.
No declaration globally retired. Cache pin/toolchain, Fm,x,i0,D,L,X,K,p,t,
actual marginal functions, same vector and caller. Preserve original graph,
all type/value/constructor roles and axiom/unexpanded frontier. Backtrack
to prior path on replay failure.

Human derivation: exact marginal identity follows by applying the original
sum_box_product to kapLoc, summing t, multiplying by m, then transporting
via pf_sum_Wt and pf_card_Wt. The weighted inequality follows by term_le
and interchanging finite sums. Selection by averaging uses one whole
vector and one shared record. Strict weakening of uniform-index premise
is only asserted for this local consumer; no claim of realized native
counterexample. No synthetic numeric host test. 23 source/hash/transformation guards executed
in V8; local lean/lake unavailable. Actual CI jobs 45577239749,45576756833,
45670987597 retrieved success for prior baseline only. New native replay
and axiom ledger outstanding. No URT comparison or speedup claim.

RESUME HERE: replay exact identities and choice adapter with RUN40/41 in
existing pinned runner; prove localBudget42 from actual kapLoc count
producer on one admissible host per x in the same windows. Audit other
MeanKappaBound consumers before removing any global premise.
HANDOFF TO geometry, integration, kernel, audit, editor.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss
open Formalism.BasicNotions Formalism.MainNotions
section AtRecordMean
variable {D : D7} {L : SizeData₂ D}

def localMass42 (X : G.Inst D L) (K : G.Consts) (p : ℕ) : ℝ :=
  ∑ t0 ∈ G.goodReps X p,
    G.meanLoc D K L.sc (addOrderOf (G.hP D p)) (G.topsPos D p t0)
      (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)

theorem pf_sum_Sig_eq42 (X : G.Inst D L) (K : G.Consts)
    (hWA : D.host.TT.Nonempty → (G.winA D L.sc).Nonempty)
    (hWB : D.host.TT.Nonempty → (G.winB D K L.sc).Nonempty) (p : ℕ) :
    ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.Sig X K a b p =
      ((G.box D (G.winA D L.sc)).card : ℝ) * ((G.box D (G.winB D K L.sc)).card : ℝ) *
        (D.R.m : ℝ) * localMass42 X K p := by
  classical
  let cc : ℝ := ((G.box D (G.winA D L.sc)).card : ℝ) * ((G.box D (G.winB D K L.sc)).card : ℝ)
  have ee : ∀ t0 ∈ G.goodReps X p,
      (∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0) =
        cc * G.meanLoc D K L.sc (addOrderOf (G.hP D p)) (G.topsPos D p t0)
          (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b) := by
    intro t0 _
    exact sum_box_product K hWA hWB p t0
      (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)
  unfold G.Sig
  have e1 : ∀ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc),
      (D.R.m : ℝ) * ∑ t0 ∈ G.goodReps X p, G.kapv X K a b p t0 =
      (D.R.m : ℝ) * ∑ t0 ∈ G.goodReps X p, ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0 := by
    intro a _
    rw [← Finset.mul_sum, Finset.sum_comm]
  rw [Finset.sum_congr rfl e1, ← Finset.mul_sum, Finset.sum_comm]
  rw [Finset.sum_congr rfl ee, ← Finset.mul_sum]
  unfold localMass42 cc
  ring
end AtRecordMean

section FamilyMean
variable {eps : ℝ} {Fm : FamP eps} {x : ℝ} {i0 : Fm.Ix x}
theorem sum_SigO_eq42 (hx : Fm.x1 < x) (p : ℕ) :
    (∑ o : Lnk.Wt Fm x i0, SigO p o) =
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) *
        ((Fm.D x i0).R.m : ℝ) * localMass42 (Fm.Gx x i0) Fm.GK p := by
  have hne := Lnk.wt_nonempty (i0 := i0) hx
  have hcard : (0 : ℝ) < (Fintype.card (Lnk.Wt Fm x i0) : ℝ) := by exact_mod_cast Fintype.card_pos
  have hWA : (Fm.D x i0).host.TT.Nonempty → (G.winA (Fm.D x i0) (Fm.L x i0).sc).Nonempty := by
    rintro ⟨t, ht⟩
    exact ⟨(Fm.L x i0).aT ⟨t, ht⟩, Finset.mem_Icc.mpr
      ⟨Int.ceil_le.mpr ((Fm.L x i0).aT_win _).1, Int.le_floor.mpr ((Fm.L x i0).aT_win _).2⟩⟩
  have hWB : (Fm.D x i0).host.TT.Nonempty → (G.winB (Fm.D x i0) Fm.GK (Fm.L x i0).sc).Nonempty := by
    rintro ⟨t, ht⟩
    rw [← pf_winB_eq hx]
    exact ⟨(Fm.L x i0).bT ⟨t, ht⟩, Finset.mem_Icc.mpr
      ⟨Int.ceil_le.mpr ((Fm.L x i0).bT_ge _), Int.le_floor.mpr (Fm.bT_le x hx i0 _)⟩⟩
  have h1 := pf_sum_Wt (i0 := i0) hx (fun a b => G.Sig (Fm.Gx x i0) Fm.GK a b p)
  have h2 := pf_sum_Sig_eq42 (Fm.Gx x i0) Fm.GK hWA hWB p
  have h3 : ∑ o : Lnk.Wt Fm x i0, SigO p o =
      ∑ o : Lnk.Wt Fm x i0, G.Sig (Fm.Gx x i0) Fm.GK (aO o) (bO o) p := rfl
  rw [h3, h1, pf_card_Wt hx, h2]
  ring

end FamilyMean
end Formalism.L2.GlobalTheoryTheory.Loss

namespace Formalism.MainNotions
open Formalism.BasicNotions
section AtRecord
variable {D : D7} {L : SizeData₂ D}
open Classical in

def ChW_at42 (X : G.Inst D L) (K : G.Consts) : Prop :=
  ∑ p ∈ cands L K, Real.log p / p *
      ((if L.sc.x ^ (-L.sc.eps) < G.Sig X K (G.aL L) (G.bL L) p then 2 else 0) +
        4 * G.Sig X K (G.aL L) (G.bL L) p) ≤ 1 / (2 * L.sc.x)

end AtRecord
section Family
variable {eps : ℝ} (Fm : FamP eps)
def ChosenW42 : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, x ∈ Fm.Win → ∃ (i0 : Fm.Ix x) (av bv : ℕ → ℤ),
    (∀ t ∈ Fm.TTn x, aWin (Fm.L x i0) (av t) ∧ (Fm.L x i0).sc.b' ≤ (bv t : ℝ) ∧ (bv t : ℝ) ≤ Fm.bTop x) ∧
    ∀ i : Fm.Ix x, (∀ t : (Fm.D x i).host.TT,
        (Fm.L x i).aT t = av (t : (Fm.D x i).R.A).val ∧
        (Fm.L x i).bT t = bv (t : (Fm.D x i).R.A).val) → ChW_at42 (Fm.Gx x i) Fm.GK

def ChosenWS42 : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, x ∈ Fm.Win → ∃ (i0 : Fm.Ix x) (av bv : ℕ → ℤ),
    (∀ t ∈ Fm.TTn x, aWin (Fm.L x i0) (av t) ∧ (Fm.L x i0).sc.b' ≤ (bv t : ℝ) ∧ (bv t : ℝ) ≤ Fm.bTop x) ∧
    (∃ i1 : Fm.Ix x, ∀ t : (Fm.D x i1).host.TT,
        (Fm.L x i1).aT t = av (t : (Fm.D x i1).R.A).val ∧
        (Fm.L x i1).bT t = bv (t : (Fm.D x i1).R.A).val) ∧
    ∀ i : Fm.Ix x, (∀ t : (Fm.D x i).host.TT,
        (Fm.L x i).aT t = av (t : (Fm.D x i).R.A).val ∧
        (Fm.L x i).bT t = bv (t : (Fm.D x i).R.A).val) → ChW_at42 (Fm.Gx x i) Fm.GK

theorem chosenWS_of_cover42 (hW : ChosenW42 Fm) (hc : Fm.CoverAll) : ChosenWS42 Fm := by
  obtain ⟨x0, hx0⟩ := hW
  refine ⟨max x0 (Fm.x1 + 1), fun x hx hxW => ?_⟩
  have hxa : x0 ≤ x := le_trans (le_max_left _ _) hx
  have hx1 : Fm.x1 < x := by
    have := le_max_right x0 (Fm.x1 + 1)
    linarith
  obtain ⟨i0, av, bv, hwin, hall⟩ := hx0 x hxa hxW
  have hu : (Fm.D x i0).host.u0.val < (Fm.D x i0).R.n := by
    first
      | exact (Fm.D x i0).host.u0.isLt
      | exact ZMod.val_lt _
  obtain ⟨i1, -, hi1⟩ := hc x hx1 i0 _ av bv hu hwin
  exact ⟨i0, av, bv, hwin, ⟨i1, hi1⟩, hall⟩

end Family
end Formalism.MainNotions


namespace Formalism.L2.GlobalTheoryTheory.Loss7
open Formalism.BasicNotions Formalism.MainNotions Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.PrimeWindowSizeBounds Formalism.LFunctionChainParameters.SmallOrderPrimeLosses Formalism.L2.GlobalTheoryTheory.Loss

section Family
variable {eps : ℝ} (Fm : FamP eps)
def localBudget42 (x : ℝ) (i0 : Fm.Ix x) : Prop :=
  (2 / (Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps) + 4) *
    ((Fm.D x i0).R.m : ℝ) *
    (∑ p ∈ sAt (Fm.L x i0) Fm.GK,
      Real.log (p : ℝ) / p * localMass42 (Fm.Gx x i0) Fm.GK p) ≤
      1 / (2 * (Fm.L x i0).sc.x)

theorem chosenW_of42
    (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, localBudget42 Fm x i0) :
    ChosenW42 Fm := by
  obtain ⟨xG, hG⟩ := hG
  refine ⟨max (Fm.x1 + 1) xG, fun x hxx hxWin => ?_⟩
  have hx : Fm.x1 < x := by
    have := le_trans (le_max_left _ _) hxx
    linarith
  obtain ⟨i0, hB⟩ := hG x (le_trans (le_max_right _ _) hxx) hxWin
  have := Lnk.wt_nonempty (i0 := i0) hx
  have hx0 : 0 < (Fm.L x i0).sc.x := lt_trans one_pos (Fm.L x i0).sc.one_lt_alt
  have hcard : (0 : ℝ) < (Fintype.card (Lnk.Wt Fm x i0) : ℝ) := by exact_mod_cast Fintype.card_pos
  set θ : ℝ := (Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps) with hθ
  have hθ0 : 0 < θ := Real.rpow_pos_of_pos hx0 _
  have hSig : ∀ p (o : Lnk.Wt Fm x i0), 0 ≤ SigO p o := fun p o =>
    Lnk.Sig_nonneg (Fm.Gx x i0) Fm.GK Fm.GK_nonneg (Fm.ex x hx i0).kapI_def _ _ p
  have hlp : ∀ p : ℕ, 0 ≤ Real.log (p : ℝ) / p := fun p => div_nonneg (Real.log_natCast_nonneg p) (Nat.cast_nonneg p)

  have hsum : ∑ o : Lnk.Wt Fm x i0, lhsW (sAt (Fm.L x i0) Fm.GK) θ (fun p => SigO p o) ≤
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) * (1 / (2 * (Fm.L x i0).sc.x)) := by
    have t1 : ∑ o : Lnk.Wt Fm x i0, lhsW (sAt (Fm.L x i0) Fm.GK) θ (fun p => SigO p o) ≤
        ∑ o : Lnk.Wt Fm x i0, ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p * ((2 / θ + 4) * SigO p o) := by
      refine Finset.sum_le_sum fun o _ => ?_
      unfold lhsW
      exact Finset.sum_le_sum fun p _ => mul_le_mul_of_nonneg_left (term_le θ _ hθ0 (hSig p o)) (hlp p)
    have t2 : ∑ o : Lnk.Wt Fm x i0, ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p * ((2 / θ + 4) * SigO p o) =
        ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p * ((2 / θ + 4) * ∑ o : Lnk.Wt Fm x i0, SigO p o) := by
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [Finset.mul_sum, Finset.mul_sum]
    have t3 : ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
          ((2 / θ + 4) * ∑ o : Lnk.Wt Fm x i0, SigO p o) =
        (Fintype.card (Lnk.Wt Fm x i0) : ℝ) * ((2 / θ + 4) *
          ((Fm.D x i0).R.m : ℝ) *
          (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
            localMass42 (Fm.Gx x i0) Fm.GK p)) := by
      rw [show (Fintype.card (Lnk.Wt Fm x i0) : ℝ) * ((2 / θ + 4) *
          ((Fm.D x i0).R.m : ℝ) * (∑ p ∈ sAt (Fm.L x i0) Fm.GK,
            Real.log (p : ℝ) / p * localMass42 (Fm.Gx x i0) Fm.GK p)) =
          ((Fintype.card (Lnk.Wt Fm x i0) : ℝ) * ((2 / θ + 4) * ((Fm.D x i0).R.m : ℝ))) *
            (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p * localMass42 (Fm.Gx x i0) Fm.GK p) by ring,
        Finset.mul_sum]
      refine Finset.sum_congr rfl fun p hp => ?_
      rw [sum_SigO_eq42 hx p]
      ring
    have hB' : (2 / θ + 4) * ((Fm.D x i0).R.m : ℝ) *
          (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
            localMass42 (Fm.Gx x i0) Fm.GK p) ≤ 1 / (2 * (Fm.L x i0).sc.x) := hB
    calc _ ≤ _ := t1
      _ = _ := t2
      _ = _ := t3
      _ ≤ _ := mul_le_mul_of_nonneg_left hB' hcard.le
  obtain ⟨o, ho⟩ := exists_le_of_sum _ _ hsum
  refine ⟨i0, Lnk.avOf o, Lnk.bvOf o, Lnk.admissible_weight_of_vector o, fun i hi => ?_⟩
  unfold ChW_at42
  rw [cands_eq, sAt_eq (i0 := i0) hx i, Lnk.sc_eq Fm hx i i0]
  simp only [Sig_eq hx i o hi]
  exact ho

example (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, localBudget42 Fm x i0) :
    ChosenW42 Fm := by
  first | (rh_reduce 2 using [chosenW_of42]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact chosenW_of42 Fm hG

end Family
end Formalism.L2.GlobalTheoryTheory.Loss7
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of42 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of42 as RHChosenW42Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.pf_sum_Sig_eq42
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.sum_SigO_eq42
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of42
#print axioms Formalism.MainNotions.chosenWS_of_cover42
end

import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 lane 4. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED. RH OPEN.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory
engine included), SWARM, HANDOFF, EXPANSION, AGENTS and continuity
consulted. Latest 20 peer titles inspected, geometry RUN41 1c2ef505
read: independent mass normalization remains open. Upstream pin
40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest observed
upstream commit search 686902ae1da717a63faf52d2dc6a50e5722942cd,
not substituted. RUN40 96f96c3c: relaxed joint loss consumer still
uncompiled; this is its actual upstream weight producer.
Sources (relative to src/):
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
8166795ec6e846795d7272781119ee7d17d426c0 (sum_box_product,
pf_sum_kapv_le, pf_sum_Sig_le, mean_SigO, Sig_eq, sAt_eq);
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
287dcaae544bf078e47910aa5c9986ec501bdbd2 (size_alt_alt, chosenW_of);
Formalism/SharpRestriction/GlobalSchurBounds/WeightVectorSmallSharesSeven.lean
370098c956d2156e2c95069994e4c8cfae490b03 (ChosenW/WS, coverage).

RESULT: At the actual chosenW_of producer, it suffices to require
the FIRST local MeanKappaBound inequality with x^-4 replacing x^-12,
a factor x^8 relaxation, to obtain RUN40's weaker ChW conclusion.
Do not assert the second MeanKappaBound conjunct or any other LinkG
consumer is redundant. Native box marginal identity, goodReps
sum_Nv_le, pf_sum_Wt and pf_card_Wt unchanged; hence mean SigO
<= m*T*x^-4. Same original threshold estimate yields mean lhsW
<= (2/theta+4)*m*T*x^-4*2*x^(eps/3).
Use native size bounds m<=x^(eps/100+(1-eps/8)/2),
T<=2*x^(2+8eps+eps/100-eps/8). Before absorbing constant 24,
result <=24*x^(-3/2+(10999/1200)*eps). With eps<1/52 and
24<=x^(1/4), exponent <= -17/16; with 2<=x^(1/16), result
<=1/(2*x). Exact exponent comparison:
(-5/4)+(10999/1200)/52 < -17/16. These thresholds are eventual
and uniform over the family indices. Selection by exists_le_of_sum
chooses ONE vector; same Sig_eq, sAt_eq, sc_eq transport it to all
carrying indices, and chosenWS_of_cover supplies same realized
witness. No independent choices. Native admissibility, cover,
candidate and eps guards retained. Does not prove new local bound.

Original selected source graph:
chosenW_of -> LinkG -> MeanKappaBound -> mean_SigO -> pf_sum_Sig_le
-> pf_sum_kapv_le -> sum_box_product; size_alt_alt; Sig_eq; coverage.
Candidate graph:
chosenW_of41 -> eventual MeanKappaFirst41 -> mean_SigO41 ->
pf_sum_Sig_le41 -> pf_sum_kapv_le41 -> same sum_box_product;
size_alt_alt41; same Sig_eq; chosenWS_of_cover41.
ChW_at41 -> lhsW with same par/scale/threshold -> RUN40 loss_setting_family40,
then joint_discriminant_bound40. Final caller swap pending; original
lossF_of_7W and other exact ChW consumers not retired. Preserve
original graph, type/value/constructor/axiom roles, unexpanded nodes
and prior failures. Cache by pin, toolchain, Fm,x,i0,D,L,X,K,p,t0,
actual box measures, same vector/carries, field and consumer;
backtrack to original if replay fails. No URT claim.

Executed V8: 21 exact source/hash/transformation/exponent guards.
No native host numbers or synthetic test asserted. Actual Actions jobs
45577239749,45576756833,45670987597 retrieved, all success for baseline
only; no new native replay/axiom result. Needs existing pinned Lean
overlay. All unresolved arithmetic, rank/count, local gain, entropy,
VWinAt and joint-loss premises preserved.
RESUME HERE: replay this with RUN40 in pinned runner; inspect actual
producer of first MeanKappaBound field, prove relaxed x^-4 from same
local kappa counts. Propagate ChosenWS41 through actual lossF_of_7W /
loss_setting_family40 only after checking all consumers.
HANDOFF TO geometry, integration, kernel, audit, editor.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss
open Formalism.BasicNotions Formalism.MainNotions
section AtRecordMean
variable {D : D7} {L : SizeData₂ D}
def MeanKappaFirst41 (X : G.Inst D L) (K : G.Consts) : Prop :=
  ∀ p : ℕ, G.Cand D L K p → ∀ t0 : G.HH D, t0 ∈ G.goodReps X p →
    G.meanLoc D K L.sc (addOrderOf (G.hP D p)) (G.topsPos D p t0)
      (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)
      ≤ (G.Nv X p t0 : ℝ) * L.sc.x ^ (-4 : ℝ)

theorem pf_sum_kapv_le41 (X : G.Inst D L) (K : G.Consts) (hWA : D.host.TT.Nonempty → (G.winA D L.sc).Nonempty)
    (hWB : D.host.TT.Nonempty → (G.winB D K L.sc).Nonempty) (h2 : MeanKappaFirst41 X K)
    (p : ℕ) (hc : G.Cand D L K p) (t0 : G.HH D) (ht0 : t0 ∈ G.goodReps X p) :
    ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0 ≤
      ((G.box D (G.winA D L.sc)).card : ℝ) * ((G.box D (G.winB D K L.sc)).card : ℝ) *
        ((G.Nv X p t0 : ℝ) * L.sc.x ^ (-4 : ℝ)) := by
  have h := sum_box_product K hWA hWB p t0
    (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)
  have h' : ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0 =
      ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc),
        (fun a b => G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)
          (G.wPos D p t0 a) (G.wPos D p t0 b) :=
    Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => rfl
  rw [h', h]
  exact mul_le_mul_of_nonneg_left (h2 p hc t0 ht0) (by positivity)

theorem pf_sum_Sig_le41 (X : G.Inst D L) (K : G.Consts) (hWA : D.host.TT.Nonempty → (G.winA D L.sc).Nonempty)
    (hWB : D.host.TT.Nonempty → (G.winB D K L.sc).Nonempty) (h2 : MeanKappaFirst41 X K)
    (p : ℕ) (hc : G.Cand D L K p) :
    ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.Sig X K a b p ≤
      ((G.box D (G.winA D L.sc)).card : ℝ) * ((G.box D (G.winB D K L.sc)).card : ℝ) *
        ((D.R.m : ℝ) * (D.host.TT.card : ℝ) * L.sc.x ^ (-4 : ℝ)) := by
  have hx12 : 0 ≤ L.sc.x ^ (-4 : ℝ) := Real.rpow_nonneg (lt_trans one_pos L.sc.one_lt_alt).le _
  generalize hcc : ((G.box D (G.winA D L.sc)).card : ℝ) * ((G.box D (G.winB D K L.sc)).card : ℝ) = cc
  have hcc0 : 0 ≤ cc := by rw [← hcc]; positivity
  have e2 : ∀ t0 ∈ G.goodReps X p,
      ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0 ≤
      cc * ((G.Nv X p t0 : ℝ) * L.sc.x ^ (-4 : ℝ)) := by
    intro t0 ht0
    rw [← hcc]
    exact pf_sum_kapv_le41 X K hWA hWB h2 p hc t0 ht0
  unfold G.Sig
  have e1 : ∀ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc),
      (D.R.m : ℝ) * ∑ t0 ∈ G.goodReps X p, G.kapv X K a b p t0 =
      (D.R.m : ℝ) * ∑ t0 ∈ G.goodReps X p, ∑ b ∈ G.box D (G.winB D K L.sc), G.kapv X K a b p t0 := by
    intro a _
    rw [← Finset.mul_sum, Finset.sum_comm]
  rw [Finset.sum_congr rfl e1, ← Finset.mul_sum, Finset.sum_comm]
  have e3 : ∑ t0 ∈ G.goodReps X p, cc * ((G.Nv X p t0 : ℝ) * L.sc.x ^ (-4 : ℝ)) ≤
      cc * ((D.host.TT.card : ℝ) * L.sc.x ^ (-4 : ℝ)) := by
    rw [← Finset.mul_sum, ← Finset.sum_mul]
    have h : (∑ t0 ∈ G.goodReps X p, (G.Nv X p t0 : ℝ)) ≤ (D.host.TT.card : ℝ) := by
      exact_mod_cast Marg.sum_Nv_le X p (G.goodReps X p)
    exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right h hx12) hcc0
  have e4 := mul_le_mul_of_nonneg_left (le_trans (Finset.sum_le_sum e2) e3) (Nat.cast_nonneg D.R.m : (0 : ℝ) ≤ _)
  calc _ ≤ (D.R.m : ℝ) * (cc * ((D.host.TT.card : ℝ) * L.sc.x ^ (-4 : ℝ))) := e4
    _ = _ := by ring

end AtRecordMean
section FamilyMean
variable {eps : ℝ} {Fm : FamP eps} {x : ℝ} {i0 : Fm.Ix x}
theorem mean_SigO41 (hx : Fm.x1 < x) (h4 : MeanKappaFirst41 (Fm.Gx x i0) Fm.GK) (p : ℕ)
    (hc : G.Cand (Fm.D x i0) (Fm.L x i0) Fm.GK p) :
    (∑ o : Lnk.Wt Fm x i0, SigO p o) / (Fintype.card (Lnk.Wt Fm x i0) : ℝ) ≤
      ((Fm.D x i0).R.m : ℝ) * ((Fm.D x i0).host.TT.card : ℝ) * (Fm.L x i0).sc.x ^ (-4 : ℝ) := by
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
  rw [div_le_iff₀ hcard]
  have h1 := pf_sum_Wt (i0 := i0) hx (fun a b => G.Sig (Fm.Gx x i0) Fm.GK a b p)
  have h2 := pf_sum_Sig_le41 (Fm.Gx x i0) Fm.GK hWA hWB h4 p hc
  have h3 : ∑ o : Lnk.Wt Fm x i0, SigO p o =
      ∑ o : Lnk.Wt Fm x i0, G.Sig (Fm.Gx x i0) Fm.GK (aO o) (bO o) p := rfl
  rw [h3, h1, pf_card_Wt hx]
  linarith

end FamilyMean
end Formalism.L2.GlobalTheoryTheory.Loss

namespace Formalism.MainNotions
open Formalism.BasicNotions
section AtRecord
variable {D : D7} {L : SizeData₂ D}
open Classical in

def ChW_at41 (X : G.Inst D L) (K : G.Consts) : Prop :=
  ∑ p ∈ cands L K, Real.log p / p *
      ((if L.sc.x ^ (-L.sc.eps) < G.Sig X K (G.aL L) (G.bL L) p then 2 else 0) +
        4 * G.Sig X K (G.aL L) (G.bL L) p) ≤ 1 / (2 * L.sc.x)

end AtRecord
section Family
variable {eps : ℝ} (Fm : FamP eps)
def ChosenW41 : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, x ∈ Fm.Win → ∃ (i0 : Fm.Ix x) (av bv : ℕ → ℤ),
    (∀ t ∈ Fm.TTn x, aWin (Fm.L x i0) (av t) ∧ (Fm.L x i0).sc.b' ≤ (bv t : ℝ) ∧ (bv t : ℝ) ≤ Fm.bTop x) ∧
    ∀ i : Fm.Ix x, (∀ t : (Fm.D x i).host.TT,
        (Fm.L x i).aT t = av (t : (Fm.D x i).R.A).val ∧
        (Fm.L x i).bT t = bv (t : (Fm.D x i).R.A).val) → ChW_at41 (Fm.Gx x i) Fm.GK

def ChosenWS41 : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, x ∈ Fm.Win → ∃ (i0 : Fm.Ix x) (av bv : ℕ → ℤ),
    (∀ t ∈ Fm.TTn x, aWin (Fm.L x i0) (av t) ∧ (Fm.L x i0).sc.b' ≤ (bv t : ℝ) ∧ (bv t : ℝ) ≤ Fm.bTop x) ∧
    (∃ i1 : Fm.Ix x, ∀ t : (Fm.D x i1).host.TT,
        (Fm.L x i1).aT t = av (t : (Fm.D x i1).R.A).val ∧
        (Fm.L x i1).bT t = bv (t : (Fm.D x i1).R.A).val) ∧
    ∀ i : Fm.Ix x, (∀ t : (Fm.D x i).host.TT,
        (Fm.L x i).aT t = av (t : (Fm.D x i).R.A).val ∧
        (Fm.L x i).bT t = bv (t : (Fm.D x i).R.A).val) → ChW_at41 (Fm.Gx x i) Fm.GK

theorem chosenWS_of_cover41 (hW : ChosenW41 Fm) (hc : Fm.CoverAll) : ChosenWS41 Fm := by
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
theorem rpow_budget41 (x : ℝ) (hx : 0 < x) (h : 2 ≤ x ^ ((1 : ℝ) / 16)) :
    x ^ (-1 - 1 / 16 : ℝ) ≤ 1 / (2 * x) := by
  rw [show (-1 - 1 / 16 : ℝ) = -(1 : ℝ) + -((1 : ℝ) / 16) by ring,
    Real.rpow_add hx, Real.rpow_neg hx.le, Real.rpow_neg hx.le, Real.rpow_one]
  have hp : 0 < x ^ ((1 : ℝ) / 16) := Real.rpow_pos_of_pos hx _
  have he : x⁻¹ * (x ^ ((1 : ℝ) / 16))⁻¹ = 1 / (x * x ^ ((1 : ℝ) / 16)) := by
    field_simp [hx.ne', hp.ne']
  rw [he]
  exact (div_le_div_iff₀ (mul_pos hx hp) (by positivity)).2 (by nlinarith [mul_le_mul_of_nonneg_left h hx.le])

section Size
variable {D : D7} {L : SizeData₂ D}
theorem size_alt_alt41 (sN : SizeN L) (sM : SizeM L) (sTT : SizeTT L) (h24 : 24 ≤ L.sc.x ^ ((1 : ℝ) / 4)) :
    (2 / L.sc.x ^ (-L.sc.eps) + 4) * ((D.R.m : ℝ) * (D.host.TT.card : ℝ) * L.sc.x ^ (-4 : ℝ)) *
      (2 * L.sc.x ^ (L.sc.eps / 3)) ≤ L.sc.x ^ (-1 - 1 / 16 : ℝ) := by
  have hx1 : 1 < L.sc.x := L.sc.one_lt_alt
  have hx0 : 0 < L.sc.x := by linarith
  have he0 : 0 < L.sc.eps := L.sc.eps_pos
  have he1 : L.sc.eps < 1 / 52 := L.sc.eps_lt
  have hδ : L.sc.delta1 = L.sc.x ^ (-(L.sc.eps / 8)) := rfl
  have hA : 2 / L.sc.x ^ (-L.sc.eps) + 4 ≤ 6 * L.sc.x ^ L.sc.eps := by
    rw [Real.rpow_neg hx0.le, div_inv_eq_mul]
    have : 1 ≤ L.sc.x ^ L.sc.eps := Real.one_le_rpow hx1.le he0.le
    linarith
  have hm : (D.R.m : ℝ) ≤ L.sc.x ^ (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) := by
    have h := sM.2
    unfold szTh at h
    rw [hδ] at h
    have hs : Real.sqrt (L.sc.x * L.sc.x ^ (-(L.sc.eps / 8))) = L.sc.x ^ ((1 - L.sc.eps / 8) / 2) := by
      rw [Real.sqrt_eq_rpow, show L.sc.x * L.sc.x ^ (-(L.sc.eps / 8)) = L.sc.x ^ (1 - L.sc.eps / 8) by
        rw [sub_eq_add_neg, Real.rpow_add hx0, Real.rpow_one], ← Real.rpow_mul hx0.le]
      congr 1
      ring
    rw [hs, ← Real.rpow_add hx0] at h
    exact h
  have hT : (D.host.TT.card : ℝ) ≤ 2 * L.sc.x ^ (2 + 8 * L.sc.eps + L.sc.eps / 100) * L.sc.x ^ (-(L.sc.eps / 8)) := by
    have h1 := sTT.2
    have h2 := sN.2
    unfold szNst at h1
    unfold szTh at h2
    rw [hδ] at h1
    calc _ ≤ _ := h1
      _ ≤ _ := by gcongr
  have hprod : L.sc.x ^ L.sc.eps * L.sc.x ^ (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) *
      L.sc.x ^ (2 + 8 * L.sc.eps + L.sc.eps / 100) * L.sc.x ^ (-(L.sc.eps / 8)) * L.sc.x ^ (-4 : ℝ) *
      L.sc.x ^ (L.sc.eps / 3) =
      L.sc.x ^ (L.sc.eps + (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) + (2 + 8 * L.sc.eps + L.sc.eps / 100) +
        -(L.sc.eps / 8) + (-4 : ℝ) + L.sc.eps / 3) := by
    simp only [Real.rpow_add hx0]
  have hexp : (1 / 4 : ℝ) + (L.sc.eps + (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) + (2 + 8 * L.sc.eps + L.sc.eps / 100) +
      -(L.sc.eps / 8) + (-4 : ℝ) + L.sc.eps / 3) ≤ -1 - 1 / 16 := by linarith
  calc (2 / L.sc.x ^ (-L.sc.eps) + 4) * ((D.R.m : ℝ) * (D.host.TT.card : ℝ) * L.sc.x ^ (-4 : ℝ)) *
        (2 * L.sc.x ^ (L.sc.eps / 3))
      ≤ (6 * L.sc.x ^ L.sc.eps) * (L.sc.x ^ (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) *
          (2 * L.sc.x ^ (2 + 8 * L.sc.eps + L.sc.eps / 100) * L.sc.x ^ (-(L.sc.eps / 8))) * L.sc.x ^ (-4 : ℝ)) *
        (2 * L.sc.x ^ (L.sc.eps / 3)) := by gcongr
    _ = 24 * (L.sc.x ^ L.sc.eps * L.sc.x ^ (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) *
      L.sc.x ^ (2 + 8 * L.sc.eps + L.sc.eps / 100) * L.sc.x ^ (-(L.sc.eps / 8)) * L.sc.x ^ (-4 : ℝ) *
      L.sc.x ^ (L.sc.eps / 3)) := by ring
    _ ≤ L.sc.x ^ ((1 : ℝ) / 4) * (L.sc.x ^ L.sc.eps * L.sc.x ^ (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) *
      L.sc.x ^ (2 + 8 * L.sc.eps + L.sc.eps / 100) * L.sc.x ^ (-(L.sc.eps / 8)) * L.sc.x ^ (-4 : ℝ) *
      L.sc.x ^ (L.sc.eps / 3)) := by gcongr
    _ = L.sc.x ^ ((1 : ℝ) / 4 + (L.sc.eps + (L.sc.eps / 100 + (1 - L.sc.eps / 8) / 2) +
        (2 + 8 * L.sc.eps + L.sc.eps / 100) + -(L.sc.eps / 8) + (-4 : ℝ) + L.sc.eps / 3)) := by
      rw [hprod, ← Real.rpow_add hx0]
    _ ≤ L.sc.x ^ (-1 - 1 / 16 : ℝ) := Real.rpow_le_rpow_of_exponent_le hx1.le hexp

end Size
section Family
variable {eps : ℝ} (Fm : FamP eps)
theorem chosenW_of41
    (hG : ∃ xG : ℝ, ∀ x ≥ xG, ∀ i : Fm.Ix x, MeanKappaFirst41 (Fm.Gx x i) Fm.GK) :
    ChosenW41 Fm := by
  obtain ⟨xG, hG⟩ := hG
  obtain ⟨a24, -, h24⟩ := Lnk.ev_le_rpow ((1 : ℝ) / 4) (by norm_num) 24
  obtain ⟨a2, -, h2⟩ := Lnk.ev_le_rpow ((1 : ℝ) / 16) (by norm_num) 2
  refine ⟨max (Fm.x1 + 1) (max xG (max a24 a2)), fun x hxx hxWin => ?_⟩
  have hx : Fm.x1 < x := by
    have := le_trans (le_max_left _ _) hxx
    linarith
  have eG : x ≥ xG := le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) hxx
  have e24 : x ≥ a24 := le_trans (le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) (le_max_right _ _)) hxx
  have e2 : x ≥ a2 := le_trans (le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) (le_max_right _ _)) hxx
  obtain ⟨i0⟩ := Fm.Ix_win x hxWin
  have h4 : MeanKappaFirst41 (Fm.Gx x i0) Fm.GK := hG x eG i0
  have := Lnk.wt_nonempty (i0 := i0) hx
  have hsx := Fm.L_x x i0 hx
  have hx0 : 0 < (Fm.L x i0).sc.x := lt_trans one_pos (Fm.L x i0).sc.one_lt_alt
  have hcard : (0 : ℝ) < (Fintype.card (Lnk.Wt Fm x i0) : ℝ) := by exact_mod_cast Fintype.card_pos
  set θ : ℝ := (Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps) with hθ
  have hθ0 : 0 < θ := Real.rpow_pos_of_pos hx0 _
  set s0 : ℝ := ((Fm.D x i0).R.m : ℝ) * ((Fm.D x i0).host.TT.card : ℝ) * (Fm.L x i0).sc.x ^ (-4 : ℝ) with hs0
  have hs00 : 0 ≤ s0 := mul_nonneg (mul_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)) (Real.rpow_nonneg hx0.le _)
  have hA0 : 0 ≤ 2 / θ + 4 := by
    have : 0 ≤ 2 / θ := div_nonneg (by norm_num) hθ0.le
    linarith
  have hSig : ∀ p (o : Lnk.Wt Fm x i0), 0 ≤ SigO p o := fun p o =>
    Lnk.Sig_nonneg (Fm.Gx x i0) Fm.GK Fm.GK_nonneg (Fm.ex x hx i0).kapI_def _ _ p
  have hlp : ∀ p : ℕ, 0 ≤ Real.log (p : ℝ) / p := fun p => div_nonneg (Real.log_natCast_nonneg p) (Nat.cast_nonneg p)

  have hX' : (Fm.L x i0).sc.X' = Real.exp ((Fm.L x i0).sc.x ^ ((Fm.L x i0).sc.eps / 3)) := rfl
  have hM : ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p ≤ 2 * (Fm.L x i0).sc.x ^ ((Fm.L x i0).sc.eps / 3) := by
    have h1 := Formalism.L2.GlobalTheoryTheory.Places.mertens (Fm.L x i0).sc.X' (pd_one_le_X' _)
    rw [hX', Real.log_exp, ← hX'] at h1
    refine le_trans (Finset.sum_le_sum_of_subset_of_nonneg ?_ (fun p _ _ => hlp p)) h1
    intro p hp
    have hc := (mem_sAt Fm.GK).mp hp
    exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (Nat.lt_ceil.mpr hc.2.1), hc.1⟩

  have hsum : ∑ o : Lnk.Wt Fm x i0, lhsW (sAt (Fm.L x i0) Fm.GK) θ (fun p => SigO p o) ≤
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) *
        ((2 / θ + 4) * s0 * (2 * (Fm.L x i0).sc.x ^ ((Fm.L x i0).sc.eps / 3))) := by
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
    have t3 : ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p * ((2 / θ + 4) * ∑ o : Lnk.Wt Fm x i0, SigO p o) ≤
        ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
          ((2 / θ + 4) * (s0 * (Fintype.card (Lnk.Wt Fm x i0) : ℝ))) := by
      refine Finset.sum_le_sum fun p hp => ?_
      have hmean := mean_SigO41 hx h4 p ((mem_sAt Fm.GK).mp hp)
      rw [div_le_iff₀ hcard] at hmean
      exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hmean hA0) (hlp p)
    have t4 : ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
          ((2 / θ + 4) * (s0 * (Fintype.card (Lnk.Wt Fm x i0) : ℝ))) =
        ((2 / θ + 4) * (s0 * (Fintype.card (Lnk.Wt Fm x i0) : ℝ))) * ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p := by
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun p _ => mul_comm _ _
    have t5 := mul_le_mul_of_nonneg_left hM
      (show 0 ≤ (2 / θ + 4) * (s0 * (Fintype.card (Lnk.Wt Fm x i0) : ℝ)) from
        mul_nonneg hA0 (mul_nonneg hs00 hcard.le))
    calc _ ≤ _ := t1
      _ = _ := t2
      _ ≤ _ := t3
      _ = _ := t4
      _ ≤ _ := t5
      _ = _ := by ring
  obtain ⟨o, ho⟩ := exists_le_of_sum _ _ hsum
  have hS := Fm.sizes x hx i0
  have hsize0 := size_alt_alt41 hS.1 hS.2.1 hS.2.2.2.2.2.2.2.1 (by rw [hsx]; exact h24 x e24)
  have h2' : 2 ≤ (Fm.L x i0).sc.x ^ ((1 : ℝ) / 16) := by
    rw [hsx]; exact h2 x e2
  have hr := rpow_budget41 (Fm.L x i0).sc.x hx0 h2'
  have hsize := hsize0.trans hr
  refine ⟨i0, Lnk.avOf o, Lnk.bvOf o, Lnk.admissible_weight_of_vector o, fun i hi => ?_⟩
  unfold ChW_at41
  rw [cands_eq, sAt_eq (i0 := i0) hx i, Lnk.sc_eq Fm hx i i0]
  simp only [Sig_eq hx i o hi]
  exact le_trans ho hsize

example (hG : ∃ xG : ℝ, ∀ x ≥ xG, ∀ i : Fm.Ix x,
      MeanKappaFirst41 (Fm.Gx x i) Fm.GK) : ChosenW41 Fm := by
  first | (rh_reduce 2 using [chosenW_of41]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact chosenW_of41 Fm hG
end Family
end Formalism.L2.GlobalTheoryTheory.Loss7
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of41 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of41 as RHChosenW41Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.mean_SigO41
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.size_alt_alt41
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of41
#print axioms Formalism.MainNotions.chosenWS_of_cover41
end

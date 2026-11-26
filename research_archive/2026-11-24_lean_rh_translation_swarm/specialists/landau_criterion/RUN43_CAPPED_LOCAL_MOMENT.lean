import RUN42_WEIGHTED_LOCAL_MASS_ONE_INDEX

/-!
RUN43 lane 4, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED LEAN, NOT COMPILED. RH OPEN.
Mission current blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine,
protocol, handoff, expansion, AGENTS, continuity and state/runner/log openings consulted.
Peer dependency 6615a312, kernel 86de3c73, acceleration edb25260, integration
ce4476bd, editor 8c83c632, geometry 75e75229, prime 3fae1b85; distinct task.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. No source migration.
Sources relative to src/:
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
287dcaae544bf078e47910aa5c9986ec501bdbd2: term_le, chosenW_of, exists_le_of_sum.
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
8166795ec6e846795d7272781119ee7d17d426c0: sum_box_product, pf_sum_Wt,
pf_card_Wt, pf_sum_Sig_le.
Formalism/SharpRestriction/GlobalSchurBounds/FrameCodeOfAdditive.lean
a26c19cd46d322546d8a1784c3c3e9aac3acef85: kapv_nonneg, Sig_nonneg.
RUN42 blob 72a953782d72e4b7b9c66b121dd933d574262107.

RESULT. Keep native strict threshold and bound it BEFORE taking a mean:
  cap_c(k)=4*m*k+2*min(1,m*k/theta).
For all nonnegative orbit shares k_t,
  2*1_{m*sum k_t>theta}+4*m*sum k_t <= sum_t cap_c(k_t)
    <= (2/theta+4)*m*sum k_t.
Proof: min(1,a+b)<=min(1,a)+min(1,b) for nonnegative a,b;
1_{z>1}<=min(1,z) for z>=0. The linear term is unchanged.
Use sum_box_product with the FULL cap_c composed with kapLoc, not cap_c
of the local mean (the latter loses the rare-event saving). Thus the same
native box marginal gives the sufficient one-index budget
  sum_{p in sAt}(log p/p)*sum_{t in goodReps}
      meanLoc(cap_c(kapLoc(p,t))) <= 1/(2*x).
It is no stronger than RUN42 by pointwise cap_c(k)<=old linear bound.
Same Wt measure, actual candidate set, actual theta, same admissible vector
and same family transport. This changes the required local distribution
estimate, not the original final loss. It does not prove the budget.
All high outliers pay at most 2 in the threshold term; the unbounded
linear term 4*m*k is retained. No replacement of the actual prime weights.

Executed exact integer regression (V8): theta numerator t=1..8, orbit
numerators a,b,c=0..24, all in eighths, m absorbed into shares.
For s=a+b+c, compare 16*t*1_{s>t}+4*s*t,
16*(min(t,a)+min(t,b)+min(t,c))+4*s*t, and 16*s+4*s*t.
125000 cases checked, 122976 strict cap<old. These are scalar algebra
controls, NOT actual arithmetic hosts. Abstract strict budget example:
theta=1/100, m=1, 10000 equally weighted vectors, one nonzero share=1.
New mean=6/10000, old=204/10000; budget=1/200. No claim this is realized
by a native host. Actual local Lean/Lake unavailable. CI jobs
45577239749,45576756833,45670987597 retrieved completed/success for
prior native baseline ONLY. New certificate and axiom/dependency audit
uncompiled; do not report PASS.

Original selected graph: chosenW_of -> mean_SigO -> MeanKappaBound
and uniform size/Mertens controls -> sum_box_product.
RUN42 selected graph: chosenW_of42 -> localBudget42 -> sum_SigO_eq42
-> sum_box_product, pf_sum_Wt, pf_card_Wt.
RUN43 candidate: chosenW_of43 -> localBudget43 -> cap_costO43,
sum_costO43 -> sum_box_product, pf_sum_Wt, pf_card_Wt, kapv_nonneg.
Keep actual native exists_le_of_sum, Sig_eq, cands_eq, sc_eq,
coverage, all other LinkG consumers and RUN40/41/42 fallbacks.
Cache exact pin, toolchain, Fm,x,i0,D,L,X,K,p,t0,theta, full local
function, box and consumer. No global deletion or claim of engine speedup.
No root theorem imported as shortcut.

RESUME HERE: compile RUN40--43 on pinned runner, audit term roles and
axioms, then trace the actual kapLoc/kapIIf and KapIDef producers to
bound the *truncated* local moments and retained linear moments on
the same native orbit boxes. Need one host for every x in each required
window, not just finite examples. If capped moment route cannot be
bounded more easily, backtrack to RUN42 or the original supplier.
HANDOFF TO geometry, integration, kernel, audit, editor.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss

open Formalism.BasicNotions Formalism.MainNotions
open scoped BigOperators

def capCost43 (θ m k : ℝ) : ℝ :=
  4 * m * k + 2 * min 1 ((m / θ) * k)

theorem min_one_add43 (a b : ℝ) (ha0 : 0 ≤ a) (hb0 : 0 ≤ b) :
    min 1 (a+b) ≤ min 1 a + min 1 b := by
  by_cases ha : a ≤ 1
  · by_cases hb : b ≤ 1
    · rw [min_eq_right ha, min_eq_right hb]
      exact min_le_right _ _
    · rw [min_eq_right ha, min_eq_left (le_of_not_ge hb)]
      exact le_trans (min_le_left _ _) (by linarith)
  · rw [min_eq_left (le_of_not_ge ha)]
    have hb' : 0 ≤ min 1 b := le_min zero_le_one hb0
    exact le_trans (min_le_left _ _) (by linarith)

theorem min_one_sum43 {ι : Type*} (s : Finset ι) (f : ι → ℝ)
    (h : ∀ i ∈ s, 0 ≤ f i) :
    min 1 (∑ i ∈ s, f i) ≤ ∑ i ∈ s, min 1 (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
    have ha0 := h a (Finset.mem_insert_self a s)
    have hs : ∀ i ∈ s, 0 ≤ f i := fun i hi => h i (Finset.mem_insert_of_mem hi)
    simp only [Finset.sum_insert ha]
    exact (min_one_add43 _ _ ha0 (Finset.sum_nonneg hs)).trans
      (add_le_add_left (ih hs) _)

theorem capCost_le_linear43 (θ m k : ℝ) :
    capCost43 θ m k ≤ (2/θ+4)*m*k := by
  unfold capCost43
  calc _ ≤ 4*m*k + 2*((m/θ)*k) := by
        gcongr
        exact min_le_right _ _
    _ = _ := by ring

theorem threshold_cap_sum43 {ι : Type*} (s : Finset ι) (k : ι → ℝ)
    (θ m : ℝ) (hθ : 0 < θ) (hm : 0 ≤ m) (hk : ∀ i ∈ s, 0 ≤ k i) :
    ((if θ < m * ∑ i ∈ s, k i then 2 else 0) +
      4 * (m * ∑ i ∈ s, k i) : ℝ) ≤ ∑ i ∈ s, capCost43 θ m (k i) := by
  classical
  have hsum : (∑ i ∈ s, (m/θ)*k i) = (m * ∑ i ∈ s, k i)/θ := by
    rw [← Finset.mul_sum]
    ring
  have hcap := min_one_sum43 s (fun i => (m/θ)*k i)
    (fun i hi => mul_nonneg (div_nonneg hm hθ.le) (hk i hi))
  rw [hsum] at hcap
  have hI : (if θ < m * ∑ i ∈ s, k i then 2 else 0 : ℝ) ≤
      2 * min 1 ((m * ∑ i ∈ s, k i)/θ) := by
    split_ifs with h
    · have h1 : 1 ≤ (m * ∑ i ∈ s, k i)/θ := (le_div_iff₀ hθ).2 (by simpa using h.le)
      rw [min_eq_left h1]; norm_num
    · have h0 : 0 ≤ min 1 ((m * ∑ i ∈ s, k i)/θ) :=
        le_min zero_le_one (div_nonneg (mul_nonneg hm (Finset.sum_nonneg hk)) hθ.le)
      linarith
  calc _ ≤ 2 * (∑ i ∈ s, min 1 ((m/θ)*k i)) + 4*(m*∑ i ∈ s, k i) := by linarith
    _ = _ := by
      simp only [capCost43, Finset.sum_add_distrib, ← Finset.mul_sum]
      ring

section AtRecord
variable {D : D7} {L : SizeData₂ D}

def orbitCost43 (X : G.Inst D L) (K : G.Consts) (θ : ℝ)
    (a b : G.HH D → ℤ) (p : ℕ) : ℝ :=
  ∑ t0 ∈ G.goodReps X p, capCost43 θ (D.R.m : ℝ) (G.kapv X K a b p t0)

def localCost43 (X : G.Inst D L) (K : G.Consts) (θ : ℝ) (p : ℕ) : ℝ :=
  ∑ t0 ∈ G.goodReps X p,
    G.meanLoc D K L.sc (addOrderOf (G.hP D p)) (G.topsPos D p t0)
      (fun a b => capCost43 θ (D.R.m : ℝ)
        (G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b))

theorem orbitCost_bound43 (X : G.Inst D L) (K : G.Consts) (θ : ℝ) (hθ : 0 < θ)
    (hK : K.Nonneg) (hI : G.KapIDef X K) (a b : G.HH D → ℤ) (p : ℕ) :
    ((if θ < G.Sig X K a b p then 2 else 0) + 4 * G.Sig X K a b p : ℝ)
      ≤ orbitCost43 X K θ a b p := by
  unfold G.Sig orbitCost43
  exact threshold_cap_sum43 _ _ θ _ hθ (Nat.cast_nonneg _)
    (fun t _ => Lnk.kapv_nonneg X K hK hI a b p t)

theorem orbitCost_le_linear43 (X : G.Inst D L) (K : G.Consts) (θ : ℝ)
    (a b : G.HH D → ℤ) (p : ℕ) :
    orbitCost43 X K θ a b p ≤ (2/θ+4)*G.Sig X K a b p := by
  unfold orbitCost43 G.Sig
  calc _ ≤ ∑ t0 ∈ G.goodReps X p, (2/θ+4)*(D.R.m : ℝ)*G.kapv X K a b p t0 :=
      Finset.sum_le_sum fun _ _ => capCost_le_linear43 _ _ _
    _ = _ := by rw [← Finset.mul_sum]; ring

theorem box_cost43 (X : G.Inst D L) (K : G.Consts) (θ : ℝ)
    (hWA : D.host.TT.Nonempty → (G.winA D L.sc).Nonempty)
    (hWB : D.host.TT.Nonempty → (G.winB D K L.sc).Nonempty) (p : ℕ) :
    ∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc),
        orbitCost43 X K θ a b p =
      ((G.box D (G.winA D L.sc)).card : ℝ) *
      ((G.box D (G.winB D K L.sc)).card : ℝ) * localCost43 X K θ p := by
  classical
  let cc : ℝ := ((G.box D (G.winA D L.sc)).card : ℝ) *
    ((G.box D (G.winB D K L.sc)).card : ℝ)
  have ee : ∀ t0 ∈ G.goodReps X p,
      (∑ a ∈ G.box D (G.winA D L.sc), ∑ b ∈ G.box D (G.winB D K L.sc),
        capCost43 θ (D.R.m : ℝ) (G.kapv X K a b p t0)) =
        cc * G.meanLoc D K L.sc (addOrderOf (G.hP D p)) (G.topsPos D p t0)
          (fun a b => capCost43 θ (D.R.m : ℝ)
            (G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b)) := by
    intro t0 _
    exact sum_box_product K hWA hWB p t0
      (fun a b => capCost43 θ (D.R.m : ℝ)
        (G.kapLoc X K p (addOrderOf (G.hP D p)) (G.topsPos D p t0) a b))
  unfold orbitCost43
  have e1 : ∀ a ∈ G.box D (G.winA D L.sc),
      (∑ b ∈ G.box D (G.winB D K L.sc), ∑ t0 ∈ G.goodReps X p,
        capCost43 θ (D.R.m : ℝ) (G.kapv X K a b p t0)) =
      ∑ t0 ∈ G.goodReps X p, ∑ b ∈ G.box D (G.winB D K L.sc),
        capCost43 θ (D.R.m : ℝ) (G.kapv X K a b p t0) := by
    intro a _
    rw [Finset.sum_comm]
  rw [Finset.sum_congr rfl e1, Finset.sum_comm, Finset.sum_congr rfl ee, ← Finset.mul_sum]
  rfl
end AtRecord

section Family
variable {eps : ℝ} {Fm : FamP eps} {x : ℝ} {i0 : Fm.Ix x}

def costO43 (θ : ℝ) (p : ℕ) (o : Lnk.Wt Fm x i0) : ℝ :=
  orbitCost43 (Fm.Gx x i0) Fm.GK θ (aO o) (bO o) p

theorem cap_costO43 (hx : Fm.x1 < x) (θ : ℝ) (hθ : 0 < θ) (p : ℕ)
    (o : Lnk.Wt Fm x i0) :
    ((if θ < SigO p o then 2 else 0) + 4 * SigO p o : ℝ) ≤ costO43 θ p o := by
  exact orbitCost_bound43 (Fm.Gx x i0) Fm.GK θ hθ Fm.GK_nonneg
    (Fm.ex x hx i0).kapI_def (aO o) (bO o) p

theorem sum_costO43 (hx : Fm.x1 < x) (θ : ℝ) (p : ℕ) :
    (∑ o : Lnk.Wt Fm x i0, costO43 θ p o) =
      (Fintype.card (Lnk.Wt Fm x i0) : ℝ) *
        localCost43 (Fm.Gx x i0) Fm.GK θ p := by
  have hWA : (Fm.D x i0).host.TT.Nonempty → (G.winA (Fm.D x i0) (Fm.L x i0).sc).Nonempty := by
    rintro ⟨t, ht⟩
    exact ⟨(Fm.L x i0).aT ⟨t, ht⟩, Finset.mem_Icc.mpr
      ⟨Int.ceil_le.mpr ((Fm.L x i0).aT_win _).1, Int.le_floor.mpr ((Fm.L x i0).aT_win _).2⟩⟩
  have hWB : (Fm.D x i0).host.TT.Nonempty → (G.winB (Fm.D x i0) Fm.GK (Fm.L x i0).sc).Nonempty := by
    rintro ⟨t, ht⟩
    rw [← pf_winB_eq hx]
    exact ⟨(Fm.L x i0).bT ⟨t, ht⟩, Finset.mem_Icc.mpr
      ⟨Int.ceil_le.mpr ((Fm.L x i0).bT_ge _), Int.le_floor.mpr (Fm.bT_le x hx i0 _)⟩⟩
  unfold costO43
  rw [pf_sum_Wt hx, box_cost43 _ _ θ hWA hWB p, pf_card_Wt hx]
end Family
end Formalism.L2.GlobalTheoryTheory.Loss

namespace Formalism.L2.GlobalTheoryTheory.Loss7
open Formalism.BasicNotions Formalism.MainNotions Formalism.LFunctionChainParameters.DeficitSplitLemmas Formalism.LFunctionChainParameters.PrimeWindowSizeBounds Formalism.LFunctionChainParameters.SmallOrderPrimeLosses Formalism.L2.GlobalTheoryTheory.Loss

section Family
variable {eps : ℝ} (Fm : FamP eps)

def localBudget43 (x : ℝ) (i0 : Fm.Ix x) : Prop :=
  (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ) / p *
    localCost43 (Fm.Gx x i0) Fm.GK ((Fm.L x i0).sc.x ^ (-(Fm.L x i0).sc.eps)) p)
      ≤ 1 / (2 * (Fm.L x i0).sc.x)

theorem chosenW_of43
    (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, localBudget43 Fm x i0) :
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
        Real.log (p : ℝ)/p * costO43 θ p o := by
      refine Finset.sum_le_sum fun o _ => ?_
      unfold lhsW
      exact Finset.sum_le_sum fun p _ =>
        mul_le_mul_of_nonneg_left (cap_costO43 hx θ hθ0 p o) (hlp p)
    _ = ∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ)/p *
        (∑ o : Lnk.Wt Fm x i0, costO43 θ p o) := by
      rw [Finset.sum_comm]
      exact Finset.sum_congr rfl fun p _ => by rw [Finset.mul_sum]
    _ = (Fintype.card (Lnk.Wt Fm x i0) : ℝ) *
        (∑ p ∈ sAt (Fm.L x i0) Fm.GK, Real.log (p : ℝ)/p *
          localCost43 (Fm.Gx x i0) Fm.GK θ p) := by
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun p _ => by rw [sum_costO43 hx θ p]; ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hB hcard.le
  obtain ⟨o,ho⟩ := exists_le_of_sum _ _ hsum
  refine ⟨i0, Lnk.avOf o, Lnk.bvOf o, Lnk.admissible_weight_of_vector o, fun i hi => ?_⟩
  unfold ChW_at42
  rw [cands_eq, sAt_eq (i0 := i0) hx i, Lnk.sc_eq Fm hx i i0]
  simp only [Sig_eq hx i o hi]
  exact ho

example (hG : ∃ xG : ℝ, ∀ x ≥ xG, x ∈ Fm.Win → ∃ i0 : Fm.Ix x, localBudget43 Fm x i0) :
    ChosenW42 Fm := by
  first | (rh_reduce 2 using [chosenW_of43]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact chosenW_of43 Fm hG
end Family
end Formalism.L2.GlobalTheoryTheory.Loss7

rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of43 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of43 as RHChosenW43Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.threshold_cap_sum43
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.box_cost43
#print axioms Formalism.L2.GlobalTheoryTheory.Loss.sum_costO43
#print axioms Formalism.L2.GlobalTheoryTheory.Loss7.chosenW_of43
end

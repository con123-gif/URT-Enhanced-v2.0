import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.FactorizationBoundMonoLattices
import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.DensityNumericalFacts
import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.RhoSumBoundOfMapsSplitting
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48 lane 4, 26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION / LEAN PREPARED, NOT COMPILED.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4, mandatory engine.
SWARM/HANDOFF/EXPANSION/AGENTS and continuity reviewed; latest peer commit
d2660dc3 (prime modular witness), 7f45ab3c (even trace), 7d1fc0e1 (local Hodge),
04b054aa (shared flag), fccd0f04 (Satake row), 2becd062f (scaled primary).
Upstream pinned 40e56bab026552e089d7afcfeff08d2defb9c005; observed new head
4249e7b98bbb0ad3ba610e4c8c978fabf4569a83 not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Sources relative to src/Formalism/SharpRestriction/GrowthBounds/:
ObjSeg.lean 5752a5148ca0341a560e6eead3acf9803937c0ea: FactorsLE, RhoGE.
ColumnSpanDensity/RhoLowerBoundLargeConductor.lean 3efd1244957f82fdd38dafb567441cf4af74745d:
  RhoL, kF, dL, RestEdge, RhoUpperBoundSmallDepth.
ColumnSpanDensity/FactorizationBoundMonoLattices.lean dde56090153aec85dae30f9fd3113133db1e5850:
  keyIneq_of, infimum_kappa_le_of_rho_bound, flattened_weight_dominant.
ColumnSpanDensity/DensityNumericalFacts.lean 5b9176dfb19d0d48e2cf1d86f8817a187bbe5f42:
  sum_kF_mul_prod_le_kx, exact normalization.
ColumnSpanDensity/RhoSumBoundOfMapsSplitting.lean 051a7c32c24c0efe970b805ec0ebb21c64fb1864:
  rho_sum_bound_of_maps_splitting, actual h61a producer. Its projected pairing
  matrices Aj sum to p^(3u) z I; BlockSplit supplies integer ranks nu_j,
  and lattice transport incurs 3u depth (native interface allows 4u).
RUN47 088776f39a07b37c91ff9219565da8d92e5a0388.

RESULT (exact, not merely a bound): fix same ring R and a native weight
(al,be), t=tStar, d=dL, depth D1>=0 and 2D1<c4. Let r be the largest
integer n for which FacL holds on every edge. Zero is feasible by the
literal FactorsLE disjunction. h60ab bounds n<=d, so the feasible set is
finite. There must be an edge: otherwise h60ab applied at ceil(d)+1
contradicts its own upper bound. By RestEdge, the feasible set on any
one edge is exactly the all-edge feasible set. For d>0, RhoL at target
(1-kappa)d is therefore equivalent to (1-kappa)d<=r. Thus
kF=1-r/d, and kF*d=d-r. For d=0 the product is zero (indeed kF=0).
No approximation, no interchange of infimum and sum, no new ring.

At each actual RUN47 term the EXACT identity is
  kF(A-j,B-j)*q(A,B,j) =
  (dL(A-j,B-j)-r(A-j,B-j))*gaussianNumber(p^n',m+1)
    / prod_s(dimPol(m,A_s)*dimPol(m,B_s)).
Consequently KeyMass47 is precisely a finite normalized integer-rank
deficiency budget. No real infimum remains. The necessary local defect
d-r>=d-floor(d) also exposes a quantization obstruction if the native
dimension ratio is nonintegral. No assumption of integrality, or of
monotone rank search, has been made. These facts do NOT prove the
uniform arithmetic budget.

Original graph: KeyMass47 <- kF (sInf) + hD normalization; native
keyIneq_of <- h61a (rho_sum_bound_of_maps_splitting <- RhoSumLatticeMaps,
BlockSplit), h60ab, RestEdge, hA.2.1, hD; meanX_of <- hA.1/hA.2.2.1.
Reduced exact interface: KeyMass47 <-> finite normalized rank budget
under h60ab, RestEdge, hD, dominance and same depth/host. The old
h61a/meanX path remains intact, as do all original type/value/axiom
obligations. New native graph/axiom output is not yet available.
Context: pin + toolchain + R + K + X + al/be + tStar + c4 + D1.
Executed V8 21 source hash/string assertions, 60528 exact integer
threshold comparisons, 685 nonintegral rank-floor controls, 9 zero
dimension cases, 343 two-edge minimum controls. Abstract arithmetic
checks only, not actual native ranks. The two-edge control shows that
one-edge maximality without RestEdge is not sufficient. Baseline CI
45577239749 and 45576756833 jobs retrieved as successful this run.
They do NOT verify this certificate. Native commands below prepared;
no Lean kernel or new axiom evidence claimed.

RESUME HERE: on the actual projected pairing matrices Aj in
rho_sum_bound_of_maps_splitting, derive the missing normalized
short-box rank deficit bound directly (possibly via DVR Smith
invariants), with the same ring and depth; test whether the complement
block may be grouped without losing dimension control. Replay this
certificate and RUN46/47 in native Lean, check exact caller substitution
and axioms. Do not count exact reformulation as arithmetic closure.
HANDOFF TO integration, audit, kernel, math/editor.
-/

noncomputable section
namespace Formalism.MainNotions.flipOneThree.Pf
open Formalism.MainNotions.G Formalism.MainNotions.flipOneThree Formalism.CountingSumsFrames
open Classical

def rankFeasible48 (K : Cst) (X : Dat) (R : RS X.p X.n')
    (al be : X.TT → ℕ) (n : ℕ) : Prop :=
  ∀ e, IsEdge X.p X.n' 1 e →
    FacL R (flatW X.m al be) (X.tStar K al be) X.c4 e n (X.D1 K)

def rankSet48 (K : Cst) (X : Dat) (R : RS X.p X.n') (al be : X.TT → ℕ) : Finset ℕ :=
  (Finset.range (⌈dL R (flatW X.m al be)⌉₊ + 1)).filter
    (rankFeasible48 K X R al be)

theorem rankSet_nonempty48 (K : Cst) (X : Dat) (R : RS X.p X.n') (al be : X.TT → ℕ) :
    (rankSet48 K X R al be).Nonempty := by
  refine ⟨0, Finset.mem_filter.2 ⟨Finset.mem_range.2 (Nat.zero_lt_succ _), ?_⟩⟩
  intro e he
  exact Or.inl rfl

def rankMax48 (K : Cst) (X : Dat) (R : RS X.p X.n') (al be : X.TT → ℕ) : ℕ :=
  (rankSet48 K X R al be).max' (rankSet_nonempty48 K X R al be)

theorem rankMax_feasible48 (K : Cst) (X : Dat) (R : RS X.p X.n') (al be : X.TT → ℕ) :
    rankFeasible48 K X R al be (rankMax48 K X R al be) := by
  exact (Finset.mem_filter.1 (Finset.max'_mem _ (rankSet_nonempty48 K X R al be))).2

theorem exact_rank_defect48 (h60 : RhoUpperBoundSmallDepth) (hE : RestEdge)
    (K : Cst) (X : Dat) (R : RS X.p X.n') (al be : X.TT → ℕ)
    (hD : 0 ≤ X.D1 K) (hdepth : 2 * X.D1 K < X.c4) :
    X.kF K R al be * dL R (flatW X.m al be) =
      dL R (flatW X.m al be) - (rankMax48 K X R al be : ℝ) := by
  let d := dL R (flatW X.m al be)
  let n := rankMax48 K X R al be
  have hub (i : ℕ) (hi : rankFeasible48 K X R al be i) : (i : ℝ) ≤ d :=
    h60 X.p X.n' R X.m _ (flattened_weight_dominant _ _ _) _ _ i _ hD hdepth hi
  have hn := rankMax_feasible48 K X R al be
  have hnd : (n : ℝ) ≤ d := hub n hn
  have hd0 : 0 ≤ d := le_trans (Nat.cast_nonneg n) hnd
  have hmax (i : ℕ) (hi : rankFeasible48 K X R al be i) : i ≤ n := by
    have hib : (i : ℝ) ≤ (⌈d⌉₊ : ℝ) := le_trans (hub i hi) (Nat.le_ceil d)
    have hib' : i ≤ ⌈d⌉₊ := by exact_mod_cast hib
    have him : i ∈ rankSet48 K X R al be :=
      Finset.mem_filter.2 ⟨Finset.mem_range.2 (Nat.lt_succ_of_le hib'), hi⟩
    exact Finset.le_max' _ _ him
  rcases hd0.eq_or_lt with hd | hd
  · have hn0 : (n : ℝ) = 0 := by linarith [Nat.cast_nonneg n]
    change X.kF K R al be * d = d - (n : ℝ)
    rw [← hd, hn0, mul_zero, sub_zero]
  · obtain ⟨e0, he0⟩ : ∃ e : Edge R.W R.Qq (X.m + 1), IsEdge X.p X.n' 1 e := by
      by_contra hne
      push Not at hne
      have h := hub (⌈d⌉₊ + 1) (fun e he => absurd he (hne e))
      have hceil := Nat.le_ceil d
      push_cast at h
      linarith
    let k := 1 - (n : ℝ) / d
    have hk0 : 0 ≤ k := by
      dsimp [k]
      linarith [(div_le_one hd).2 hnd]
    have hkprod : (1-k)*d = (n : ℝ) := by dsimp [k]; field_simp; ring
    have hkrho : RhoL R (flatW X.m al be) (X.tStar K al be) X.c4 (X.D1 K)
        ((1-k)*d) := fun e he => ⟨n, by rw [hkprod], hn e he⟩
    have hkle : X.kF K R al be ≤ k :=
      infimum_kappa_le_of_rho_bound X K R al be k hk0 hkrho
    have hkg : k ≤ X.kF K R al be := by
      unfold Dat.kF
      refine le_csInf ⟨k, hk0, hkrho⟩ ?_
      intro k' hk'
      obtain ⟨i, hi, hfac⟩ := hk'.2 e0 he0
      have hiall : rankFeasible48 K X R al be i := fun e he =>
        hE X.p X.n' R X.m _ (flattened_weight_dominant _ _ _) _ _ i _ e0 e he0 he hfac
      have hi' : (i : ℝ) ≤ (n : ℝ) := by exact_mod_cast hmax i hiall
      have hbound : (1-k')*d ≤ (1-k)*d := by rw [hkprod]; exact le_trans hi hi'
      by_contra hnle
      have hstrict := mul_lt_mul_of_pos_right (show 1-k < 1-k' by linarith) hd
      linarith
    change X.kF K R al be * d = d - (n : ℝ)
    rw [le_antisymm hkle hkg]
    linarith

theorem normalized_rank_term48 (h60 : RhoUpperBoundSmallDepth) (hE : RestEdge)
    (hD : RestDims) (K : Cst) (X : Dat) (hm : 1 ≤ X.m)
    (R : RS X.p X.n') (hD1 : 0 ≤ X.D1 K) (hdepth : 2 * X.D1 K < X.c4)
    (A B j : X.TT → ℕ) :
    X.kF K R (fun s => A s - j s) (fun s => B s - j s) *
      ∏ s, ((dimHar X.m (A s - j s) (B s - j s) : ℝ) /
          ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s))) =
      (dL R (flatW X.m (fun s => A s - j s) (fun s => B s - j s)) -
        (rankMax48 K X R (fun s => A s - j s) (fun s => B s - j s) : ℝ)) *
      (gaussianNumber (X.p ^ X.n') (X.m + 1) /
        ∏ s, ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s))) := by
  have hNe := Ne_pos R X.m
  have hPpos : 0 < ∏ s, ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s)) :=
    Finset.prod_pos fun s _ => mul_pos (by exact_mod_cast dimPol_pos _ _) (by exact_mod_cast dimPol_pos _ _)
  rw [← exact_rank_defect48 h60 hE K X R _ _ hD1 hdepth]
  unfold dL
  rw [(hD X.p X.n' R X.m hm X.TT (fun s => A s - j s) (fun s => B s - j s)).2,
    Finset.prod_div_distrib]
  push_cast
  field_simp

-- Exact substitution at the complete triple-sum consumer, not just a
-- pointwise restatement; the right budget can now be supplied by ranks.
theorem normalized_rank_mass48 (h60 : RhoUpperBoundSmallDepth) (hE : RestEdge)
    (hD : RestDims) (K : Cst) (X : Dat) (hm : 1 ≤ X.m)
    (R : RS X.p X.n') (hD1 : 0 ≤ X.D1 K) (hdepth : 2 * X.D1 K < X.c4) :
    (∑ A ∈ Fintype.piFinset (fun _ : X.TT => X.WaP K),
      ∑ B ∈ Fintype.piFinset (fun _ : X.TT => X.WbP K),
        ∑ j ∈ Fintype.piFinset (fun _ : X.TT => Finset.range (X.Jn K + 1)),
          X.kF K R (fun s => A s - j s) (fun s => B s - j s) *
            ∏ s, ((dimHar X.m (A s - j s) (B s - j s) : ℝ) /
              ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s)))) =
    (∑ A ∈ Fintype.piFinset (fun _ : X.TT => X.WaP K),
      ∑ B ∈ Fintype.piFinset (fun _ : X.TT => X.WbP K),
        ∑ j ∈ Fintype.piFinset (fun _ : X.TT => Finset.range (X.Jn K + 1)),
          (dL R (flatW X.m (fun s => A s - j s) (fun s => B s - j s)) -
            (rankMax48 K X R (fun s => A s - j s) (fun s => B s - j s) : ℝ)) *
          (gaussianNumber (X.p ^ X.n') (X.m + 1) /
            ∏ s, ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s)))) := by
  refine Finset.sum_congr rfl fun A hA => Finset.sum_congr rfl fun B hB =>
    Finset.sum_congr rfl fun j hj => ?_
  first
  | (rh_reduce 2 using [normalized_rank_term48]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact normalized_rank_term48 h60 hE hD K X hm R hD1 hdepth A B j

end Formalism.MainNotions.flipOneThree.Pf

rh_scan Formalism.MainNotions.flipOneThree.Pf.keyIneq_of limit 2000
rh_scan Formalism.MainNotions.flipOneThree.Pf.rho_sum_bound_of_maps_splitting limit 2000
rh_scan Formalism.MainNotions.flipOneThree.Pf.normalized_rank_mass48 limit 2000
rh_prune Formalism.MainNotions.flipOneThree.Pf.normalized_rank_mass48 as RHRankMass48Pruned
#print axioms Formalism.MainNotions.flipOneThree.Pf.exact_rank_defect48
#print axioms Formalism.MainNotions.flipOneThree.Pf.normalized_rank_mass48
end

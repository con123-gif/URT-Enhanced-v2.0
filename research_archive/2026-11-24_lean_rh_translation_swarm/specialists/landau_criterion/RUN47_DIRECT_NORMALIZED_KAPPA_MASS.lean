import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.MidMeanOf
import Formalism.SharpRestriction.GrowthBounds.ColumnSpanDensity.TheoremIOfIntermediateBounds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47 lane 4, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine.
SWARM/HANDOFF/EXPANSION/AGENTS/continuity and latest peer list read; integration
58dbb472, math 05da337a (gap-only obstruction), kernel 98267b5b, dependency
f3faec21, geometry 14448eecf, audit d3079b63, editor 8d7348e7. Distinct lane.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed a7231db2ec4917f8c63b88c2e09bfc2086e3f613,
not adopted or audited. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Pinned sources relative to src/Formalism/SharpRestriction/GrowthBounds/ColumnSpanDensity/:
DensityNumericalFacts.lean 5b9176dfb19d0d48e2cf1d86f8817a187bbe5f42: avg_abs, avg_of, sum_kF_mul_prod_le_kx.
ColumnSpanNumericalFacts.lean 55a6d938acb26d39458c848d91b625c3e8c8c91d: mean_of, sum_of_meanN, shift.
FactorizationBoundMonoLattices.lean dde56090153aec85dae30f9fd3113133db1e5850: keyIneq_of.
LocalHypothesisOfGlobal.lean e7606a9965283ebf55c0feb269304a6d6f70463b: meanX_of, segment_sum_kappa_bound.
MidMeanOf.lean 448db6f5181919e0ae58e0581632bc260cacc3b2: midMean_of, FM.
MeanDefs.lean 4ce8ad2af2dd2fa94f328342b9f967fd651ce15b.
RUN46 92d36547d12f535452cba0eef004dd05c56fcbec.

RESULT: At the actual density consumer avg_abs, the pointwise normalized
key bound is used ONLY to derive h1, a triple sum. The separate MeanX bound
then only caps the sum of kx. Combine them before bounding, eliminating kx
as an intermediate from the mean consumer entirely. With PA,PB the native
expanded windows, J the native shifts, q the product of normalized harmonic
dimensions, M=(CA+Cs)*N*N1/Y, the single sufficient interface is
  sum_(A,B in PA x PB) sum_(j in J) kF(A-j,B-j)*q(A,B,j)
      <= M*|PA|*|PB|.
Here |PA| and |PB| are PRODUCT-window cardinalities, not 1-D cardinalities.
All on ONE common ring R from RUN46, same actual weights and thresholds.
No independent ring choices, no changed measures. Nonnegative q,kF, injective
shift (A,B)->(A+j,B+j) at fixed j, density lower bound and card comparison
give delta^N*sum_inner kF <= M*|PA|*|PB| and hence mean_inner kF<=2M.
Retain empty inner window handling and strictly positive expanded cardinality.
Apply for tau=0,ccl; existing shift/boundary proof gives meanKap <=
(6(CA+Cs)+8)*N*N1/Y, same native Cmean. Native proof counts two boundary
errors <=2/Y and 2/Y<=8*N*N1/Y. No new arithmetic conjecture used for the
implication; KeyMass47 itself still open on a common ring.

Old native KeyIneq + MeanX imply KeyMass47 by exact positive normalization
before summation (not by summing unnormalized inequalities). Reverse need
not hold for abstract losses: L=(2,0), kx=(1,1), sum equal but pointwise fails.
This is not a counterexample on a native ring.
Source keyIneq_of: rank witness n_j, all-edge transport, n_j<=d_j,
n_j<=(1-kF_j)d_j on the short shift box, total dimension identity, then
(1-kx)*D<=sum n_j. The next target is to prove the NORMALIZED aggregate
rank deficiency <= M*|PA|*|PB| directly, retaining zero-dimension branches.
Do not cancel different normalizing denominators or infer pointwise bounds.
Native meanX_of separately uses hA.1 segment averages and hA.2.2.1 kapPI;
these remain in the original graph and any other consumers.
Original graph: MidMean <- keyIneq_of, avg_of(0,ccl), meanX_of, mean_of;
keyIneq_of <- h61a,h60ab,RestEdge,RestDims,hA.2.1;
meanX_of <- segment_sum_kappa_bound/hA.1,hA.2.2.1,sg_count.
Reduced graph: one-ring MidMean <- KeyMass47, avg_of_mass47(0,ccl),
mean_of_mass47, retained FM/numeric/density guards. Old route supplies
KeyMass47 via keyMass_of_native47. No global deletion or new axiom evidence.
Context key: pin+toolchain+D,K,X,R,TT,PA,PB,J,normalized dimensions, FM.
Executed 28 guarded source/hash/transformation assertions; 14641
exact abstract two-row integer controls, 3410 strict aggregate-only
cases. No native Lean/Lake/gh locally. Previous CI runs 45577239749,
45576756833,45670987597 actual jobs retrieved success, NOT evidence of
this file. Commands below PREPARED NOT EXECUTED. No RH theorem imported
as shortcut, no claimed asymptotic bound or kernel verification.
RESUME HERE: derive aggregate normalized deficit from actual h61a rank
producer, using the same admissible ring; trace hA.2.1 and avoid merely
restating KeyMass47. Batch RUN46/47 with pinned native runner, verify
actual compiler output, caller bridge and transitive axioms. Preserve
the original graph and all unresolved dependencies.
HANDOFF TO integration, audit, kernel, math/editor.
-/

noncomputable section
namespace Formalism.MainNotions.flipOneThree.Pf
open Formalism.MainNotions.G Formalism.MainNotions.flipOneThree Formalism.CountingSumsFrames

def massBudget47 (K : Cst) (X : Dat) : ℝ :=
  (K.CA + K.Cs) * X.N * X.N₁ / X.Y

def KeyMass47 (K : Cst) (X : Dat) (R : RS X.p X.n') : Prop :=
  ∑ A ∈ Fintype.piFinset (fun _ : X.TT => X.WaP K),
    ∑ B ∈ Fintype.piFinset (fun _ : X.TT => X.WbP K),
      ∑ j ∈ Fintype.piFinset (fun _ : X.TT => Finset.range (X.Jn K + 1)),
        X.kF K R (fun s => A s - j s) (fun s => B s - j s) *
          ∏ s, ((dimHar X.m (A s - j s) (B s - j s) : ℝ) /
            ((dimPol X.m (A s) : ℝ) * dimPol X.m (B s))) ≤
    massBudget47 K X * (((X.WaP K).card : ℝ) ^ Fintype.card X.TT *
      ((X.WbP K).card : ℝ) ^ Fintype.card X.TT)

theorem keyMass_of_native47 (hD : RestDims) (K : Cst) (X : Dat)
    (hF : DensityNumericalFacts K X) (R : RS X.p X.n')
    (hk : KeyIneq K X R) (hx : MeanX K X R) : KeyMass47 K X R := by
  unfold KeyMass47
  have hm : meanN (X.WaP K) (X.WbP K) (X.kx K R) ≤ massBudget47 K X := hx
  exact le_trans (Finset.sum_le_sum fun A hA => Finset.sum_le_sum fun B hB =>
    sum_kF_mul_prod_le_kx hD K X hF.m1 R hk A hA B hB)
    (sum_of_meanN _ _ _ _ hF.cardP.1 hF.cardP.2 hm)

theorem avg_abs_mass47 {ι : Type} [Fintype ι] [DecidableEq ι] (SaP SbP Sa Sb : Finset ℕ) (J : ℕ)
    (kf : (ι → ℕ) → (ι → ℕ) → ℝ) (M : ℝ) (hM : 0 ≤ M) (q : ℕ → ℕ → ℕ → ℝ) (hq : ∀ A B j, 0 ≤ q A B j) (hkf : ∀ A B, 0 ≤ kf A B)
    (hkey : ∑ A ∈ Fintype.piFinset (fun _ : ι => SaP), ∑ B ∈ Fintype.piFinset (fun _ : ι => SbP),
      ∑ j ∈ Fintype.piFinset (fun _ : ι => Finset.range (J + 1)),
        kf (fun s => A s - j s) (fun s => B s - j s) * ∏ s, q (A s) (B s) (j s) ≤
      M * ((SaP.card : ℝ) ^ Fintype.card ι * (SbP.card : ℝ) ^ Fintype.card ι))
    (hsa : ∀ a ∈ Sa, ∀ j ≤ J, a + j ∈ SaP) (hsb : ∀ b ∈ Sb, ∀ j ≤ J, b + j ∈ SbP)
    (δ : ℝ) (hδ0 : 0 ≤ δ)
    (hδ : ∀ al ∈ Sa, ∀ be ∈ Sb, δ ≤ ∑ j ∈ Finset.range (J + 1), q (al + j) (be + j) j)
    (hcard : (SaP.card : ℝ) ^ Fintype.card ι * (SbP.card : ℝ) ^ Fintype.card ι ≤
      2 * δ ^ Fintype.card ι * ((Sa.card : ℝ) ^ Fintype.card ι * (Sb.card : ℝ) ^ Fintype.card ι))
    (hpa : 0 < SaP.card) (hpb : 0 < SbP.card) :
    meanN Sa Sb kf ≤ 2 * M := by
  set SJ := Fintype.piFinset (fun _ : ι => Finset.range (J + 1)) with hSJ
  set SA := Fintype.piFinset (fun _ : ι => SaP) with hSA
  set SB := Fintype.piFinset (fun _ : ι => SbP) with hSB
  set Ta := Fintype.piFinset (fun _ : ι => Sa) with hTa
  set Tb := Fintype.piFinset (fun _ : ι => Sb) with hTb
  let F : (ι → ℕ) → (ι → ℕ) → (ι → ℕ) → ℝ := fun A B j =>
    kf (fun s => A s - j s) (fun s => B s - j s) * ∏ s, q (A s) (B s) (j s)
  have hFnn : ∀ A B j, 0 ≤ F A B j := fun A B j =>
    mul_nonneg (hkf _ _) (Finset.prod_nonneg fun s _ => hq _ _ _)
  have h1 : ∑ A ∈ SA, ∑ B ∈ SB, ∑ j ∈ SJ, F A B j ≤
      M * ((SaP.card : ℝ) ^ Fintype.card ι * (SbP.card : ℝ) ^ Fintype.card ι) := hkey
  have h2 : ∑ al ∈ Ta, ∑ be ∈ Tb, ∑ j ∈ SJ, F (al + j) (be + j) j ≤ ∑ A ∈ SA, ∑ B ∈ SB, ∑ j ∈ SJ, F A B j := by
    have e1 : ∑ al ∈ Ta, ∑ be ∈ Tb, ∑ j ∈ SJ, F (al + j) (be + j) j =
        ∑ j ∈ SJ, ∑ al ∈ Ta, ∑ be ∈ Tb, F (al + j) (be + j) j := by
      calc _ = ∑ al ∈ Ta, ∑ j ∈ SJ, ∑ be ∈ Tb, F (al + j) (be + j) j :=
            Finset.sum_congr rfl fun al _ => Finset.sum_comm
        _ = _ := Finset.sum_comm
    have e2 : ∑ A ∈ SA, ∑ B ∈ SB, ∑ j ∈ SJ, F A B j = ∑ j ∈ SJ, ∑ A ∈ SA, ∑ B ∈ SB, F A B j := by
      calc _ = ∑ A ∈ SA, ∑ j ∈ SJ, ∑ B ∈ SB, F A B j := Finset.sum_congr rfl fun A _ => Finset.sum_comm
        _ = _ := Finset.sum_comm
    rw [e1, e2]
    refine Finset.sum_le_sum fun j hj => ?_
    have hj' : ∀ s, j s ≤ J := fun s => by
      have := (Fintype.mem_piFinset.1 hj) s
      exact Nat.lt_succ_iff.1 (Finset.mem_range.1 this)
    have hmapA : ∀ al ∈ Ta, al + j ∈ SA := fun al hal =>
      Fintype.mem_piFinset.2 fun s => hsa _ ((Fintype.mem_piFinset.1 hal) s) _ (hj' s)
    have hmapB : ∀ be ∈ Tb, be + j ∈ SB := fun be hbe =>
      Fintype.mem_piFinset.2 fun s => hsb _ ((Fintype.mem_piFinset.1 hbe) s) _ (hj' s)
    calc ∑ al ∈ Ta, ∑ be ∈ Tb, F (al + j) (be + j) j
        ≤ ∑ al ∈ Ta, ∑ B ∈ SB, F (al + j) B j := Finset.sum_le_sum fun al _ =>
          sum_map_le Tb SB (fun be => be + j) (fun x _ y _ h => add_right_cancel h) hmapB
            (fun B => F (al + j) B j) (fun _ _ => hFnn _ _ _)
      _ ≤ ∑ A ∈ SA, ∑ B ∈ SB, F A B j :=
          sum_map_le Ta SA (fun al => al + j) (fun x _ y _ h => add_right_cancel h) hmapA
            (fun A => ∑ B ∈ SB, F A B j) (fun _ _ => Finset.sum_nonneg fun _ _ => hFnn _ _ _)
  have h3 : ∀ al ∈ Ta, ∀ be ∈ Tb, δ ^ Fintype.card ι * kf al be ≤ ∑ j ∈ SJ, F (al + j) (be + j) j := by
    intro al hal be hbe
    have e : ∀ j : ι → ℕ, F (al + j) (be + j) j = kf al be * ∏ s, q (al s + j s) (be s + j s) (j s) := by
      intro j
      simp only [F, Pi.add_apply, Nat.add_sub_cancel]
    simp only [e]
    rw [← Finset.mul_sum, hSJ,
      ← Finset.prod_univ_sum (fun _ : ι => Finset.range (J + 1)) (fun s j => q (al s + j) (be s + j) j), mul_comm]
    refine mul_le_mul_of_nonneg_left ?_ (hkf _ _)
    calc δ ^ Fintype.card ι = ∏ _s : ι, δ := by rw [Finset.prod_const, Finset.card_univ]
      _ ≤ _ := Finset.prod_le_prod (fun _ _ => hδ0) fun s _ =>
        hδ (al s) ((Fintype.mem_piFinset.1 hal) s) (be s) ((Fintype.mem_piFinset.1 hbe) s)
  have h4 : δ ^ Fintype.card ι * ∑ al ∈ Ta, ∑ be ∈ Tb, kf al be ≤ M * ((SaP.card : ℝ) ^ Fintype.card ι * (SbP.card : ℝ) ^ Fintype.card ι) := by
    refine le_trans ?_ (le_trans h2 h1)
    rw [Finset.mul_sum]
    refine Finset.sum_le_sum fun al hal => ?_
    rw [Finset.mul_sum]
    exact Finset.sum_le_sum fun be hbe => h3 al hal be hbe
  unfold meanN
  set s := ∑ al ∈ Ta, ∑ be ∈ Tb, kf al be with hs
  have hs0 : 0 ≤ s := Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => hkf _ _
  set u := (Sa.card : ℝ) ^ Fintype.card ι * (Sb.card : ℝ) ^ Fintype.card ι with hu
  set v := (SaP.card : ℝ) ^ Fintype.card ι * (SbP.card : ℝ) ^ Fintype.card ι with hv
  have hv0 : 0 < v := mul_pos (pow_pos (by exact_mod_cast hpa) _) (pow_pos (by exact_mod_cast hpb) _)
  have hu0 : 0 ≤ u := by positivity
  rcases eq_or_lt_of_le hu0 with hu' | hu'
  · rw [← hu', div_zero]
    linarith
  · apply (div_le_iff₀ hu').2
    apply (mul_le_mul_right hv0).1
    calc s * v ≤ s * (2 * δ ^ Fintype.card ι * u) := mul_le_mul_of_nonneg_left hcard hs0
      _ = 2 * (δ ^ Fintype.card ι * s) * u := by ring
      _ ≤ 2 * (M * v) * u := by gcongr
      _ = (2 * M * u) * v := by ring

theorem avg_of_mass47 (K : Cst) (X : Dat) (hF : DensityNumericalFacts K X) (R : RS X.p X.n') (hK : KeyMass47 K X R) (hM : 0 ≤ massBudget47 K X)
    (τ : ℕ) (hτ : τ ≤ X.ccl) : meanN (X.Wa τ) (X.Wb τ) (X.kF K R) ≤ 2 * massBudget47 K X := by
  obtain ⟨δ, hδ0, hδ, hcard⟩ := hF.dens
  refine avg_abs_mass47 (X.WaP K) (X.WbP K) (X.Wa τ) (X.Wb τ) (X.Jn K) (X.kF K R) (massBudget47 K X) hM
    (fun A B j => (dimHar X.m (A - j) (B - j) : ℝ) / ((dimPol X.m A : ℝ) * dimPol X.m B))
    (fun A B j => by positivity) (fun _ _ => Real.sInf_nonneg fun _ h => h.1)
    hK ?_ ?_ δ hδ0 ?_ ?_ hF.cardP.1 hF.cardP.2
  · intro a ha j hj
    have := Finset.mem_Icc.1 ha
    simp only [Dat.WaP, Finset.mem_Icc]
    omega
  · intro b hb j hj
    have := Finset.mem_Icc.1 hb
    simp only [Dat.WbP, Finset.mem_Icc]
    omega
  · intro al hal be hbe
    have := hδ τ hτ al hal be hbe
    simpa only [P1, Nat.add_sub_cancel] using this
  · rw [card_Wa, card_Wb, Fintype.card_coe]
    exact hcard

private theorem sum_piFinset_Icc_shift_eq47 {ι : Type} [Fintype ι] [DecidableEq ι] (lo hi c : ℕ) (g : (ι → ℕ) → ℝ) :
    ∑ A ∈ Fintype.piFinset (fun _ : ι => Finset.Icc lo hi), g (fun s => A s + c) =
      ∑ A ∈ Fintype.piFinset (fun _ : ι => Finset.Icc (lo + c) (hi + c)), g A := by
  refine Finset.sum_nbij' (fun A s => A s + c) (fun A s => A s - c) ?_ ?_ ?_ ?_ ?_
  · intro A hA
    simp only [Finset.mem_coe, Fintype.mem_piFinset, Finset.mem_Icc] at hA ⊢
    intro s
    have := hA s
    omega
  · intro A hA
    simp only [Finset.mem_coe, Fintype.mem_piFinset, Finset.mem_Icc] at hA ⊢
    intro s
    have := hA s
    omega
  · intro A _
    funext s
    show A s + c - c = A s
    omega
  · intro A hA
    simp only [Finset.mem_coe, Fintype.mem_piFinset, Finset.mem_Icc] at hA
    funext s
    have := hA s
    show A s - c + c = A s
    omega
  · intro A _
    rfl

theorem mean_of_mass47 (K : Cst) (hKp : K.Pos) (X : Dat) (hF : ColumnSpanNumericalFacts K X) (R : RS X.p X.n') (h0 : meanN (X.Wa 0) (X.Wb 0) (X.kF K R) ≤ 2 * massBudget47 K X)
    (hc : meanN (X.Wa X.ccl) (X.Wb X.ccl) (X.kF K R) ≤ 2 * massBudget47 K X) :
    meanKap X.TT X.m X.Y X.ar X.bl X.bu (X.kText K R) ≤ K.Cmean * X.TT.card * X.N₁ / X.Y := by
  classical
  obtain ⟨arnn, uann, blnn, bunn, Y1, N1, Npos, wpos, below, eps⟩ := hF
  have hu : 0 ≤ X.ar + X.ar / (((X.m : ℝ) + 1) * X.Y) := by simpa [Dat.k] using uann
  have hIa : Formalism.MainNotions.flipOneThree.IaZ X.m X.Y X.ar = Finset.Icc ((X.a : ℕ) : ℤ) ((X.ua : ℕ) : ℤ) := by
    unfold Formalism.MainNotions.flipOneThree.IaZ Dat.a Dat.ua Dat.k
    rw [ceil_cast arnn, floor_cast hu]
  have hIb : Formalism.MainNotions.flipOneThree.IbZ X.bl X.bu = Finset.Icc ((X.lb : ℕ) : ℤ) ((X.ub : ℕ) : ℤ) := by
    unfold Formalism.MainNotions.flipOneThree.IbZ Dat.lb Dat.ub
    rw [ceil_cast blnn, floor_cast bunn]
  have hWa0 : X.Wa 0 = Finset.Icc X.a X.ua := by simp [Dat.Wa]
  have hWb0 : X.Wb 0 = Finset.Icc X.lb X.ub := by simp [Dat.Wb]
  have hcA : (X.Wa X.ccl).card = (Finset.Icc X.a X.ua).card := by
    simp only [Dat.Wa, Nat.card_Icc]; omega
  have hcB : (X.Wb X.ccl).card = (Finset.Icc X.lb X.ub).card := by
    simp only [Dat.Wb, Nat.card_Icc]; omega
  have hN : Fintype.card X.TT = X.N := by simp [Dat.N]
  have hNN : X.TT.card = X.N := rfl
  have hkf : ∀ A B, 0 ≤ X.kF K R A B := by
    intro A B
    unfold Dat.kF
    exact Real.sInf_nonneg fun x hx => hx.1
  have Ypos : (0 : ℝ) < X.Y := by linarith
  unfold massBudget47 at h0 hc
  rw [hWa0, hWb0] at wpos below h0
  have hT : (0 : ℝ) < ((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N :=
    mul_pos (pow_pos (by exact_mod_cast wpos.1) _) (pow_pos (by exact_mod_cast wpos.2) _)
  have s0 := sum_of_meanN _ _ (X.kF K R) _ wpos.1 wpos.2 h0
  have sc := sum_of_meanN _ _ (X.kF K R) _ (by rw [hcA]; exact wpos.1) (by rw [hcB]; exact wpos.2) hc
  have s1 := sum_first X.a X.ua X.lb X.ub X.ccl (X.kF K R) hkf
  rw [hN] at s0 sc s1
  rw [hcA, hcB] at sc
  have hsh : (∑ A ∈ Fintype.piFinset (fun _ : X.TT => Finset.Icc X.a X.ua),
      ∑ B ∈ Fintype.piFinset (fun _ : X.TT => Finset.Icc X.lb X.ub),
        X.kF K R (fun s => A s + X.ccl) (fun s => B s + X.ccl)) =
      ∑ A ∈ Fintype.piFinset (fun _ : X.TT => X.Wa X.ccl),
        ∑ B ∈ Fintype.piFinset (fun _ : X.TT => X.Wb X.ccl), X.kF K R A B := by
    unfold Dat.Wa Dat.Wb
    rw [← sum_piFinset_Icc_shift_eq47 X.a X.ua X.ccl (fun A => ∑ B ∈ Fintype.piFinset
      (fun _ : X.TT => Finset.Icc (X.lb + X.ccl) (X.ub + X.ccl)), X.kF K R A B)]
    refine Finset.sum_congr rfl fun A _ => ?_
    exact sum_piFinset_Icc_shift_eq47 X.lb X.ub X.ccl (fun B => X.kF K R (fun s => A s + X.ccl) B)
  rw [← hsh] at sc
  have hS : (∑ aa ∈ Fintype.piFinset (fun _ : X.TT => Formalism.MainNotions.flipOneThree.IaZ X.m X.Y X.ar),
      ∑ bb ∈ Fintype.piFinset (fun _ : X.TT => Formalism.MainNotions.flipOneThree.IbZ X.bl X.bu), X.kText K R aa bb) =
      ∑ A ∈ Fintype.piFinset (fun _ : X.TT => Finset.Icc X.a X.ua),
        ∑ B ∈ Fintype.piFinset (fun _ : X.TT => Finset.Icc X.lb X.ub),
          ((if (∀ s, X.a + X.ccl ≤ A s ∧ X.lb + X.ccl ≤ B s) then
            X.kF K R (fun s => A s - X.ccl) (fun s => B s - X.ccl) else 1) +
          2 * X.kF K R (fun s => A s + X.ccl) (fun s => B s + X.ccl) +
            12 * X.N * X.k * X.ccl / X.b') := by
    rw [hIa, hIb, sum_pi_cast]
    refine Finset.sum_congr rfl fun A _ => ?_
    rw [sum_pi_cast]
    refine Finset.sum_congr rfl fun B _ => ?_
    exact kText_cast K X R blnn A B
  unfold Formalism.MainNotions.flipOneThree.meanKap
  rw [hS, hIa, hIb, card_Icc_cast, card_Icc_cast, hNN, div_le_iff₀ hT]
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_const, nsmul_eq_mul,
    Fintype.card_piFinset, Finset.prod_const, Finset.card_univ, hN, Nat.cast_pow]
  have p1 := mul_le_mul_of_nonneg_left eps hT.le
  have hN1 : (1 : ℝ) ≤ (X.N : ℝ) * (X.N₁ : ℝ) :=
    one_le_mul_of_one_le_of_one_le (by exact_mod_cast Npos) (by exact_mod_cast N1)
  have p3 : 2 / X.Y ≤ 8 * (X.N : ℝ) * X.N₁ / X.Y := by
    apply div_le_div_of_nonneg_right _ Ypos.le
    nlinarith
  have p4 := mul_le_mul_of_nonneg_left p3 hT.le
  unfold Cst.Cmean
  have e1 : ((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N * (1 / X.Y) +
      ((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N * (1 / X.Y) =
      ((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N * (2 / X.Y) := by ring
  have e2 : (6 * (K.CA + K.Cs) + 8) * (X.N : ℝ) * X.N₁ / X.Y *
      (((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N) =
      6 * (((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N *
        ((K.CA + K.Cs) * X.N * X.N₁ / X.Y)) +
      ((Finset.Icc X.a X.ua).card : ℝ) ^ X.N * ((Finset.Icc X.lb X.ub).card : ℝ) ^ X.N *
        (8 * (X.N : ℝ) * X.N₁ / X.Y) := by ring
  rw [e2]
  nlinarith [s0, s1, sc, below, p1, p4, e1]

theorem midMeanOne_mass47 (D : Formalism.BasicNotions.D7) (K : Cst)
    (hK : K.Pos) (hJ : K.admitted D → ∀ X : Dat, FM K X →
      Nonempty (RS X.p X.n') → ∃ R : RS X.p X.n', KeyMass47 K X R) :
    K.admitted D → ∀ X : Dat, FM K X → Nonempty (RS X.p X.n') →
      ∃ R : RS X.p X.n',
        meanKap X.TT X.m X.Y X.ar X.bl X.bu (X.kText K R) ≤
          K.Cmean * X.TT.card * X.N₁ / X.Y := by
  intro hA X hF hne
  obtain ⟨R, hmass⟩ := hJ hA X hF hne
  have hY := hF.2.2.2.Y1
  have hCA : 0 < K.CA := hK.2.2.1
  have hCs : 0 < K.Cs := hK.2.2.2.2.2.2.2.2
  have hM : 0 ≤ massBudget47 K X := by unfold massBudget47; positivity
  exact ⟨R, mean_of_mass47 K hK X hF.2.2.2 R
    (avg_of_mass47 K X hF.2.1 R hmass hM 0 (Nat.zero_le _))
    (avg_of_mass47 K X hF.2.1 R hmass hM X.ccl le_rfl)⟩

theorem keyMass_from_native_suppliers47 (D : Formalism.BasicNotions.D7)
    (h61a : RhoSumLowerBoundEdge) (h60ab : RhoUpperBoundSmallDepth)
    (hE : RestEdge) (hD : RestDims) (K : Cst) (hK : K.Pos)
    (hA : K.admitted D) (X : Dat) (hF : FM K X) (R : RS X.p X.n') :
    KeyMass47 K X R := by
  have hk := keyIneq_of D K hA h61a h60ab hE hD X hF.1 R
  have hx := meanX_of D K hK hA X hF.2.2.1 R
  first
  | (rh_reduce 2 using [keyMass_of_native47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact keyMass_of_native47 hD K X hF.2.1 R hk hx


end Formalism.MainNotions.flipOneThree.Pf

rh_scan Formalism.MainNotions.flipOneThree.Pf.midMean_of limit 2000
rh_scan Formalism.MainNotions.flipOneThree.Pf.midMeanOne_mass47 limit 2000
rh_prune Formalism.MainNotions.flipOneThree.Pf.midMeanOne_mass47 as RHMass47Pruned
#print axioms Formalism.MainNotions.flipOneThree.Pf.keyMass_of_native47
#print axioms Formalism.MainNotions.flipOneThree.Pf.avg_abs_mass47
#print axioms Formalism.MainNotions.flipOneThree.Pf.mean_of_mass47
#print axioms Formalism.MainNotions.flipOneThree.Pf.midMeanOne_mass47
#print axioms Formalism.MainNotions.flipOneThree.Pf.keyMass_from_native_suppliers47
end

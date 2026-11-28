import New.Filling.Moments

/-!
# B3: convex closure of the exact normalized finite SieveSystem
28 November 2026. SOURCE-MATCHED human proof; executable candidate PREPARED,
NOT native-checked. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS/SWARM/HANDOFF/EXPANSION read. Continue 3751e66b, not scalar tests.
Source New/Filling/EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce
(SieveSystem, pi, step_sum), GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372,
BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1f2451058.
Peer Landau RUN99 32cb51c0 restricts shell depth, separate from this closure;
latest peer kernel 426d7f70 and common star work retain their own replay.
Actual source inspected, including Mathlib/LinearAlgebra/Matrix/PosDef.lean
(PosSemidef.smul, posSemidef_sum), MeasureTheory/Integral/Bochner/Basic.lean
(integral_finsetSum, integral_smul) and L1Space/Integrable.lean
(integrable_finsetSum, Integrable.smul) at the compact Mathlib pin.

## Exact mathematics
Take systems J_a with identical u, iota, n, psi, Lambda, beta, but
bottom bounds e_a. Let w_a>=0, sum w_a=1, Jbar=sum w_a J_a.
For EVERY i<=n, EVERY p,q and EVERY xi (not only units or zero),
put f_a(c)=psi(xi*c)*J_a(i+1)(update p i (u c))(update q i (u c)).
Then fbar=sum w_a f_a pointwise. Each f_a is integrable by its
own step field. Finite linearity gives Ibar=sum w_a I_a, I_a=int f_a.
For xi=0, Ibar=Jbar_i exactly. For unit xi, triangle inequality gives
norm Ibar <= sum w_a norm I_a <= (sum w_a)*beta(xi)*Lambda_i(p)*Lambda_i(q),
with parentheses as in the original field. No separate nonnegativity
of beta or Lambda is needed: multiply each existing inequality by w_a.
At the top, for arbitrary finite index type kappa and common n-entry t,
the Hermitian PSD matrix of Jbar is the sum of the PSD matrices of J_a
with nonnegative REAL coefficients; use Mathlib PosSemidef.smul and
posSemidef_sum. Continuity is finite linearity. Bottom bound is
sum w_a e_a. Off-diagonal uses the SAME difference iota(p_i)-iota(q_i),
not a mixture of frequencies; apply the same norm bound for each a.
psi_zero is unchanged (choose an index, available since sum w=1).
Thus all six original fields hold with the SAME beta, Lambda, psi.
This proof works after each subgroup normalization, not before it.

The weighted label padding from 3751e66b is included below. For actual
prefix coefficients c_a with P=sum c_a>0 use w_a=c_a/P. The global
sieve's affine error then has factor P after multiplying back, whereas
the bottom term is sum c_a e_a. In particular the existing discounted
shell route of RUN99 can use its own e_a without changing this closure.
No mixing of raw subgroup kernels/averaged mass denominators; no
monotonicity assertion for complex head partial sums. Original
GlobalToLocal, FiniteSystem, local real/finite band, scalar calibration
and CrudeEnergy suppliers remain. No actual weighted Moments caller
compiled; no B3/B4 or RH closure.

## Verification / replay
No lean/lake executables in local PATH. No native rh_scan/prune/reduce/
auto/frontier execution this run, no invented graph or axiom verdict.
Only source/API inspection and human proof of exact six-field closure.
Original and proposed graph unchanged except new convex closure and
weighted-label nodes at the proposed one-sieve caller. Keep all previous
receipts. Shared peer native jobs have their own pending scope.
RESUME HERE: compile this file on the retained compact workspace via
one coordinated existing runner slot, inspect exit and all three
axiom reports; repair any real elaboration errors before attempting
the exact weighted Moments.energy_fixingSet_le caller. Do not replace
the original proof or claim native verification from this source.
HANDOFF TO integration / Landau / positivity / audit.
-/

noncomputable section
open Finset Function Matrix MeasureTheory ComplexOrder
open scoped BigOperators
set_option debug.skipKernelTC false
set_option Elab.async false

namespace PositivityConvexSieve

theorem norm_mix_le {I : Type} [Fintype I] (w : I → ℝ)
    (hw : ∀ j, 0 ≤ w j) (z : I → ℂ) (b : I → ℝ)
    (hb : ∀ j, ‖z j‖ ≤ b j) :
    ‖∑ j, w j • z j‖ ≤ ∑ j, w j * b j := by
  classical
  calc
    ‖∑ j, w j • z j‖ ≤ ∑ j, ‖w j • z j‖ := norm_sum_le _ _
    _ ≤ ∑ j, w j * b j := by
      apply Finset.sum_le_sum
      intro j hj
      rw [norm_smul, Real.norm_eq_abs, abs_of_nonneg (hw j)]
      exact mul_le_mul_of_nonneg_left (hb j) (hw j)

theorem convexSystem {C U I : Type} [CommRing C] [MeasureSpace C]
    [TopologicalSpace U] [Fintype I]
    {u : C → U} {ι : U → C} {n : ℕ} {ψ : C → ℂ}
    {Λ : ℕ → (ℕ → U) → ℝ} {β : C → ℝ}
    (J : I → ℕ → (ℕ → U) → (ℕ → U) → ℂ) (e : I → ℝ)
    (K : ∀ j, SieveSystem u ι n (J j) ψ (e j) Λ β)
    (w : I → ℝ) (hw : ∀ j, 0 ≤ w j) (hs : ∑ j, w j = 1) :
    SieveSystem u ι n (fun i p q ↦ ∑ j, w j • J j i p q)
      ψ (∑ j, w j * e j) Λ β := by
  classical
  have hn : Nonempty I := by
    by_contra h
    letI : IsEmpty I := not_nonempty_iff.mp h
    simp at hs
  let j₀ : I := Classical.choice hn
  refine ⟨(K j₀).psi_zero, ?_, ?_, ?_, ?_, ?_⟩
  · intro i p q ξ hi
    dsimp only
    let f : I → C → ℂ := fun j c ↦
      ψ (ξ * c) * J j (i + 1) (update p i (u c)) (update q i (u c))
    have hI : ∀ j, Integrable (f j) := fun j ↦ (K j).step i p q ξ hi |>.1
    have hF : (fun c ↦ ψ (ξ * c) *
        ∑ j, w j • J j (i+1) (update p i (u c)) (update q i (u c))) =
        (fun c ↦ ∑ j, w j • f j c) := by
      funext c
      simp only [f, Finset.mul_sum, mul_smul_comm]
    rw [hF]
    have hInt : (∫ c, ∑ j, w j • f j c) =
        ∑ j, w j • (∫ c, f j c) := by
      rw [integral_finsetSum _ (fun j _ ↦ (hI j).smul (w j))]
      simp only [integral_smul]
    refine ⟨integrable_finsetSum _ (fun j _ ↦ (hI j).smul (w j)), ?_, ?_⟩
    · intro hz
      rw [hInt]
      exact Finset.sum_congr rfl (fun j _ ↦
        congrArg (fun z : ℂ ↦ w j • z) ((K j).step i p q ξ hi |>.2.1 hz))
    · intro hu
      rw [hInt]
      calc
        _ ≤ ∑ j, w j * (β ξ * (Λ i p * Λ i q)) :=
          norm_mix_le w hw _ _ (fun j ↦ (K j).step i p q ξ hi |>.2.2 hu)
        _ = _ := by rw [← Finset.sum_mul, hs, one_mul]
  · intro κ inst a t ha
    let M : I → Matrix κ κ ℂ := fun j ↦ of fun r s ↦ J j (n+1) (a r) (a s)
    have hM : ∀ j, (M j).PosSemidef := fun j ↦ (K j).posSemidef a t ha
    have hS : (∑ j, w j • M j).PosSemidef :=
      Matrix.posSemidef_sum Finset.univ (fun j _ ↦ (hM j).smul (hw j))
    convert hS using 1
    ext r s
    simp only [Matrix.of_apply, Matrix.sum_apply, Matrix.smul_apply, M]
  · change Continuous (fun x : (ℕ → U) × (ℕ → U) ↦
      ∑ j, w j • J j (n+1) x.1 x.2)
    exact continuous_finsetSum _ (fun j _ ↦ (K j).continuous.const_smul (w j))
  · intro p q
    exact norm_mix_le w hw _ e (fun j ↦ (K j).norm_bot_le p q)
  · intro i p q hi
    dsimp only
    intro hu
    calc
      _ ≤ ∑ j, w j * (β (ι (p i) - ι (q i)) * (Λ (i+1) p * Λ (i+1) q)) :=
        norm_mix_le w hw _ _ (fun j ↦ (K j).off_diagonal i p q hi hu)
      _ = _ := by rw [← Finset.sum_mul, hs, one_mul]

theorem commonTopLabels_weighted
    {I T : Type} [Fintype I] [DecidableEq T]
    (c : I → ℝ) (V : I → Finset T) (U : Finset T)
    (Q : I → T → ℝ)
    (hc : ∀ i, 0 ≤ c i) (hV : ∀ i, V i ⊆ U)
    (hQ : ∀ i t, t ∈ U → 0 ≤ Q i t) :
    (∑ i, c i * ∑ t ∈ V i, Q i t) ≤
      ∑ t ∈ U, ∑ i, c i * Q i t := by
  classical
  calc
    _ ≤ ∑ i, c i * ∑ t ∈ U, Q i t := by
      apply Finset.sum_le_sum
      intro i hi
      apply mul_le_mul_of_nonneg_left _ (hc i)
      exact Finset.sum_le_sum_of_subset_of_nonneg (hV i)
        (fun t ht _ ↦ hQ i t ht)
    _ = _ := by
      simp_rw [Finset.mul_sum]
      rw [Finset.sum_comm]

#print axioms norm_mix_le
#print axioms convexSystem
#print axioms commonTopLabels_weighted

end PositivityConvexSieve

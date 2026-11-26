import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN47 (26 Nov 2026). HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine);
SWARM, HANDOFF, AGENTS, state/log/protocol/continuity heads and latest
peers through 03d8a69f checked. Prior structure f4dbaa92 read.
Peers d3079b63 (norm torsion), 03d8a69f (SFew exponent), 088776f3
(density), f3faec21 (Satake), 98267b5b (finite seed) inspected.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/:
HeckeDoubleCosets/Assemble.lean e4d979d0286ecf7ca91753755cd61cc907ebdc6b
SBridgeAlt.lean ec6c9ebdf9477b507dee27a41d1b7ddd12fe9106
SBridge.lean a064e6ae8bbe1525d23523ce15135f61a125a3b6
HeckeDoubleCosets/SHeckeOf.lean c08137d1e3e49af2eea40ede9bba309c32a51ae6
IteratedHeckeBounds/LemForm.lean fa1fbd6622fa0603e9e2d08b8d7a9815aa7f73fc
IteratedHeckeBounds/LemBound.lean 59e23b33fa6d779ab02f33af97bb59ce9350347b

RESULT: native assemble consumes decay ONLY on images of its finite
stable generating cycles s at n=2(k+1)+4. It suffices to have a common
D>=0 and arbitrarily late t at which ALL those finitely many
evaluations obey |x_t(z)| <= D(3/5)^t, not every cycle at every t.
Fix same L,k,pi,N,F. Existing recurrence gives
  x_(j+1)=(1-a)x_j+a Q(resF(T^j F)),
  ||Q(resF(T^j F))|| <= K||x_j||, a(1+K)<=1/5.
Thus (4/5)^t ||x_0|| <= ||x_t||, and for any j choose common t>=j:
  ||x_0|| <= D(3/4)^t <= D(3/4)^j -> 0.
Native span, boundary annihilation and stabilization surjectivity
give vanishing on every cycle, as in original assemble.
No bounded gap between sampled times needed; empty s is permitted.
Separate per-coordinate cofinal subsequences do NOT suffice (alternating
(1,0),(0,1) illustrates failure of the norm inference, not a counterexample
to the full Hecke theorem). Original decay supplies new condition by
summing absolute coordinate constants. Actual key uses lem_bound only
on chosen finite s. All Hecke transfer, affine, index, stability, finite
generation, spectral gap, integrability and same-host premises remain.
This candidate retains SInv to isolate the new change; RUN46 separately
removes its second projection, not yet replayed. Original graph:
bStarOdd -> sSurj_of -> key -> sHecke -> sHecke_of -> assemble ->
all-cycle all-time decay; hKey/hF/hK/hI/hSK/hCh/hEv/hSt/hFin/hAff.
Reduced: bStarOdd47 -> sSurj47 -> key47 -> sHeckeFinite47 ->
assemble47 -> finite common cofinal decay via finite_decay47 and
lem_bound only on s. Other native suppliers retained. Source-visible
edges only, not elaborated graph. Prior graphs/axiom evidence preserved.
Cache by pin, exact L,k,pi,N,F, stable family and proof role; original
fallback on failed replay. No URT advantage claimed.

Executed 1672 JS assertions (1617 exact integer ratio checks,
32 unsynchronized controls, remainder source/transform checks).
Reproduce: for j=0..32,t=j..64 assert 3^t*4^j<=3^j*4^t;
for j=0..31 assert max(j%2,1-j%2)=1. Each transformation required
unique old snippet and exact reversal; checked original hdec reference
count, hstep, hall. Failed SHecke.lean guess (404), located via SBridge.
An initial source assertion counting hdec' as hdec failed, corrected
identifier matcher before successful run. No local lean/lake/elan.
Historical status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched, status pass and
returncode 0, runs 45577239749 and 45576756833 ONLY. New compilation,
axiom check and native frontier extraction outstanding.
RESUME HERE: replay assemble47 and key47 in pinned runner; then inspect
SGapOf for direct finite-coordinate common cofinal bound; combine
RUN45/46 only after independent replay. HANDOFF TO kernel, audit,
integration. RH OPEN.
-/

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL

namespace PositivityTheory.KB

def SHeckeFinite47 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L], IsTotallyComplex L → ∀ k : ℕ, k + 1 < nrComplexPlaces L →
    ∀ (π : 𝓞 L) (hπ : Prime π), ∃ N₀ : ℕ, ∀ N, N₀ ≤ N →
      ∃ s : Finset (Chn (Gm L N) (k + 1)), (∀ z ∈ s, IsCyc z) ∧
        ∀ F : (Fin (k + 2) → GK L N) → ℝ, Inv (toK L N) F → dC F = 0 →
          (∃ D : ℝ, 0 ≤ D ∧ ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ∀ z ∈ s,
            |ev (toK L N) ((hecke (toK L N) (MonoidHom.id (GK L N)) (qel L N π hπ.ne_zero))^[t] F) 1 z| ≤
              D * (3 / 5 : ℝ) ^ t) →
          ∀ z : Chn (Gm L N) (k + 1), IsCyc z → ev (toK L N) F 1 z = 0

theorem finite_decay47 {Z : Type} (s : Finset Z) (f : Z → ℕ → ℝ)
    (h : ∀ z ∈ s, ∃ C : ℝ, ∀ t : ℕ, |f z t| ≤ C * (3 / 5 : ℝ) ^ t) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ∀ z ∈ s,
      |f z t| ≤ D * (3 / 5 : ℝ) ^ t := by
  classical
  have hh : ∀ z : ↥s, ∃ C : ℝ, ∀ t : ℕ, |f z.1 t| ≤ C * (3 / 5 : ℝ) ^ t :=
    fun z => h z.1 z.2
  choose C hC using hh
  refine ⟨∑ z : ↥s, |C z|, by positivity, fun j => ⟨j, le_rfl, ?_⟩⟩
  intro z hz
  calc |f z j| ≤ C ⟨z, hz⟩ * (3 / 5 : ℝ) ^ j := hC ⟨z, hz⟩ j
    _ ≤ |C ⟨z, hz⟩| * (3 / 5 : ℝ) ^ j := by gcongr; exact le_abs_self _
    _ ≤ (∑ w : ↥s, |C w|) * (3 / 5 : ℝ) ^ j := by
      gcongr
      exact Finset.single_le_sum (f := fun w : ↥s => |C w|) (fun _ _ => abs_nonneg _) (Finset.mem_univ ⟨z, hz⟩)

theorem sHecke_of_finite47 (h : SHeckeFinite47) : SHecke := by
  intro L _ _ hL k hk π hπ
  obtain ⟨N₀, hN₀⟩ := h L hL k hk π hπ
  refine ⟨N₀, fun N hN F hFi hFc hdec => ?_⟩
  obtain ⟨s, hs, hTest⟩ := hN₀ N hN
  exact hTest F hFi hFc (finite_decay47 s _ fun z hz => hdec z (hs z hz))

namespace AffineStabilizerVanishing

private theorem lift_map_comp {V ι : Type} [AddCommGroup V] [Module ℝ V] [Fintype ι]
    (P Q : V →ₗ[ℝ] (ι → ℝ)) (h : ∀ v, P v = 0 → Q v = 0) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ v, ‖Q v‖ ≤ K * ‖P v‖ := by
  have hk : LinearMap.ker P ≤ LinearMap.ker Q := fun v hv => h v hv
  obtain ⟨M, hM⟩ := LinearMap.exists_extend (((LinearMap.ker P).liftQ Q hk).comp
    (P.quotKerEquivRange.symm : LinearMap.range P →ₗ[ℝ] V ⧸ LinearMap.ker P))
  refine ⟨‖LinearMap.toContinuousLinearMap M‖, norm_nonneg _, fun v => ?_⟩
  have hv : Q v = M (P v) := by
    have := LinearMap.congr_fun hM ⟨P v, LinearMap.mem_range_self P v⟩
    simp only [LinearMap.comp_apply, Submodule.subtype_apply] at this
    rw [this, LinearEquiv.coe_coe, LinearMap.quotKerEquivRange_symm_apply_image]
    rfl
  rw [hv]
  exact (LinearMap.toContinuousLinearMap M).le_opNorm (P v)

private theorem eq_zero_of_mem_all_maximalIdeal_pow {G : Type} [Group G] {k : ℕ} (E : Chn G (k + 1) →ₗ[ℝ] ℝ)
    (s : Finset (Chn G (k + 1)))
    (hs : ∀ z, IsCyc z → ∃ z' ∈ Submodule.span ℝ (s : Set (Chn G (k + 1))), IsBd (z - z'))
    (hbd : ∀ z, IsBd z → E z = 0) (h0 : ∀ z ∈ s, E z = 0) : ∀ z, IsCyc z → E z = 0 := by
  intro z hz
  obtain ⟨z', hz', hb⟩ := hs z hz
  have h1 : z' ∈ LinearMap.ker E :=
    (Submodule.span_le (p := LinearMap.ker E)).2 (fun w hw => h0 w hw) hz'
  have h2 := hbd _ hb
  rw [map_sub, LinearMap.mem_ker.1 h1, sub_zero] at h2
  exact h2

private theorem ev_resF_eq_ev_cmap_stab (L : Type) [Field L] [NumberField L] (n r k : ℕ)
    (hc : ∀ c : Gm L n, toK L (n + r) (stab (𝓞 L) n (n + r) (Nat.le_add_right n r) c) =
      stab L n (n + r) (Nat.le_add_right n r) (toK L n c))
    (G : (Fin (k + 2) → GK L (n + r)) → ℝ) (z : Chn (Gm L n) (k + 1)) :
    ev (toK L n) (resF L n r k G) 1 z =
      ev (toK L (n + r)) G 1 (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z) := by
  unfold ev cmap
  rw [Finsupp.lmapDomain_apply, Finsupp.sum_mapDomain_index (fun _ => by simp) (fun _ _ _ => by ring)]
  refine Finsupp.sum_congr fun g _ => ?_
  simp only [resF, smul_eq_mul, mul_one, ← map_partialProd, hc]

private theorem exists_linearMap_eq_ev {G : Type} [Group G] {H Y : Type} [Group H] [MulAction H Y] (ρ : G →* H)
    {m : ℕ} (F : (Fin (m + 1) → Y) → ℝ) (y : Y) :
    ∃ E : Chn G m →ₗ[ℝ] ℝ, ∀ z, E z = ev ρ F y z := by
  refine ⟨Finsupp.lsum ℝ fun g => LinearMap.id.smulRight (F fun j => ρ (Fin.partialProd g j) • y),
    fun z => ?_⟩
  rw [Finsupp.lsum_apply]
  unfold ev
  refine Finsupp.sum_congr fun g _ => ?_
  simp [smul_eq_mul]


theorem assemble47 (hCh : SChain) (hEv : SEv) (hSt : SStab) (hFin : SFin) (hAff : SAff) (hKey : PKey)
    (hF : PHeckeFormal) (hK : PHeckeKer) (hI : PIndex) (hSK : PStabK) : SHeckeFinite47 := by
  unfold SHeckeFinite47
  classical
  intro L _ _ hL k hk π hπ
  have hπ0 : π ≠ 0 := hπ.ne_zero
  have hCh' := hCh
  obtain ⟨_, hcm, _, _⟩ := hCh
  have hbdmap : ∀ {G H : Type} [Group G] [Group H] (f : G →* H) (w : Chn G (k + 1)), IsBd w →
      IsBd (cmap f (k + 1) w) := by
    intro G H _ _ f w hw
    obtain ⟨v, rfl⟩ := hw
    exact ⟨cmap f (k + 2) v, hcm G H f (k + 1) v⟩
  have hcycmap : ∀ {G H : Type} [Group G] [Group H] (f : G →* H) (w : Chn G (k + 1)), IsCyc w →
      IsCyc (cmap f (k + 1) w) := by
    intro G H _ _ f w hw
    unfold IsCyc at *
    rw [hcm, hw, map_zero]
  set n := 2 * (k + 1) + 4 with hn_def
  have hn1 : 1 ≤ n := by omega
  obtain ⟨s, hs1, hs2⟩ := hFin L hL n k
  have hfinn := (hI L n π hπ).1
  let P : invCoc L n k →ₗ[ℝ] (↥s → ℝ) :=
    { toFun := fun H z₀ => ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) 1 z₀.1
      map_add' := fun H H' => by
        funext z₀
        simp only [Submodule.coe_add, ev_fadd1, Pi.add_apply]
      map_smul' := fun c H => by
        funext z₀
        simp only [Submodule.coe_smul, ev_fsmul, Pi.smul_apply, smul_eq_mul, RingHom.id_apply] }
  let Q : invCoc L n k →ₗ[ℝ] (↥s → ℝ) :=
    { toFun := fun H z₀ => ev (toK L n) (hecke (toK L n) (MonoidHom.id (GK L n)) (qel L n π hπ0)
        (H : (Fin (k + 2) → GK L n) → ℝ)) 1 z₀.1
      map_add' := fun H H' => by
        funext z₀
        have h1 := (hF _ _ (toK L n) _ hfinn (k + 1) H H' 1 H.2.1).2.2
        rw [one_smul, one_smul] at h1
        simp only [Submodule.coe_add, h1, ev_fadd1, Pi.add_apply]
      map_smul' := fun c H => by
        funext z₀
        have h1 := (hF _ _ (toK L n) _ hfinn (k + 1) 0 H c (fun _ _ => rfl)).2.2
        rw [zero_add, hecke_zero, zero_add] at h1
        simp only [Submodule.coe_smul, h1, ev_fsmul, Pi.smul_apply, smul_eq_mul, RingHom.id_apply] }
  have hPQ : ∀ H, P H = 0 → Q H = 0 := by
    intro H hH
    have hvan : ∀ z : Chn (Gm L n) (k + 1), IsCyc z → ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) 1 z = 0 := by
      obtain ⟨E, hE⟩ := exists_linearMap_eq_ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) (1 : GK L n)
      intro z hz
      rw [← hE]
      refine eq_zero_of_mem_all_maximalIdeal_pow E s hs2 (fun w hw => ?_) (fun w hw => ?_) z hz
      · rw [hE]
        exact (hEv _ _ _ (toK L n) k _ H.2.1 H.2.2).1 1 w hw
      · rw [hE]
        exact congrFun hH ⟨w, hw⟩
    funext z₀
    exact hK hEv _ _ (toK L n) (toK_injective L n) _ hfinn k _ H.2.1 H.2.2 hvan z₀.1 (hs1 _ z₀.2)
  obtain ⟨K, hK0, hKb⟩ := lift_map_comp P Q hPQ
  set i0 : ℝ := ((Gq (toK L n) (qel L n π hπ0)).index : ℝ) with hi0_def
  refine ⟨n + 1 + ⌈5 * (1 + K) * i0⌉₊, fun N hN => ?_⟩
  obtain ⟨r, rfl⟩ : ∃ r, N = n + r := ⟨N - n, by omega⟩
  let f := cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1)
  refine ⟨s.image f, ?_, ?_⟩
  · intro w hw
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hw
    exact hcycmap _ _ (hs1 _ hv)
  intro F hFi hFc hdec z hz
  have hr : 1 ≤ r := by omega
  have hfinN := hI L (n + r) π hπ
  set iN : ℝ := ((Gq (toK L (n + r)) (qel L (n + r) π hπ0)).index : ℝ) with hiN_def
  have hiN : ((n + r : ℕ) : ℝ) ≤ iN := Nat.cast_le.2 hfinN.2
  have hi0 : 0 ≤ i0 := Nat.cast_nonneg _
  have hceil : 5 * (1 + K) * i0 ≤ iN := by
    have h1 := Nat.le_ceil (5 * (1 + K) * i0)
    have h2 : ((n + 1 + ⌈5 * (1 + K) * i0⌉₊ : ℕ) : ℝ) ≤ ((n + r : ℕ) : ℝ) := by exact_mod_cast hN
    push_cast at h2 hiN
    linarith
  have hiNpos : 0 < iN := by
    have h1 : (1 : ℝ) ≤ ((n + r : ℕ) : ℝ) := by exact_mod_cast (by omega : 1 ≤ n + r)
    linarith
  set a : ℝ := i0 / iN with ha
  have ha0 : 0 ≤ a := div_nonneg hi0 hiNpos.le
  have haK : a * (1 + K) ≤ 1 / 5 := by
    rw [ha, div_mul_eq_mul_div, div_le_iff₀ hiNpos]
    linarith
  have ha15 : a ≤ 1 / 5 := by nlinarith [mul_nonneg ha0 hK0]
  set TN : ((Fin (k + 2) → GK L (n + r)) → ℝ) → ((Fin (k + 2) → GK L (n + r)) → ℝ) := hecke (toK L (n + r)) (MonoidHom.id (GK L (n + r))) (qel L (n + r) π hπ0) with hTN
  have hit : ∀ j, Inv (toK L (n + r)) (TN^[j] F) ∧ dC (TN^[j] F) = 0 := by
    intro j
    induction j with
    | zero => exact ⟨hFi, hFc⟩
    | succ j ih =>
      rw [Function.iterate_succ_apply']
      obtain ⟨h1, h2, _⟩ := hF _ _ (toK L (n + r)) _ hfinN.1 (k + 1) (TN^[j] F) 0 0 ih.1
      refine ⟨h1, ?_⟩
      rw [h2, ih.2, hecke_zero]
  have hc := (hSK L π hπ0 n r hn1).1
  have hres : ∀ G : (Fin (k + 2) → GK L (n + r)) → ℝ, Inv (toK L (n + r)) G → dC G = 0 →
      resF L n r k G ∈ invCoc L n k := by
    intro G hGi hGc
    refine ⟨fun g y => ?_, ?_⟩
    · have h1 := hGi (stab (𝓞 L) n (n + r) (Nat.le_add_right n r) g)
        (fun j => stab L n (n + r) (Nat.le_add_right n r) (y j))
      rw [hc] at h1
      simp only [resF, smul_eq_mul, map_mul] at h1 ⊢
      exact h1
    · funext y
      have h1 := congrFun hGc (fun j => stab L n (n + r) (Nat.le_add_right n r) (y j))
      simpa [dC, resF] using h1
  let x : ℕ → (↥s → ℝ) := fun j z₀ => ev (toK L (n + r)) (TN^[j] F) 1
    (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z₀.1)
  have hstep : ∀ j, (4 / 5 : ℝ) * ‖x j‖ ≤ ‖x (j + 1)‖ := by
    intro j
    have hy : ‖Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩‖ ≤ K * ‖x j‖ := by
      have hP : P ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ = x j :=
        funext fun z₀ => ev_resF_eq_ev_cmap_stab L n r k hc _ z₀.1
      rw [← hP]
      exact hKb _
    have hxy : (1 - a) • x j = x (j + 1) - a • Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ := by
      funext z₀
      have h1' : x (j + 1) z₀ = (1 - a) * x j z₀ +
          a * Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ z₀ := by
        have h1 := hKey hCh' hEv hAff L hL k hk π hπ n r hn1 hr (TN^[j] F) (hit j).1 (hit j).2 z₀.1
          (hs1 _ z₀.2)
        simp only [x, Function.iterate_succ_apply']
        exact h1
      simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
      rw [h1']
      ring
    have h1 := norm_sub_le (x (j + 1)) (a • Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩)
    rw [← hxy, norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg ha0,
      abs_of_nonneg (by linarith)] at h1
    have h2 := mul_le_mul_of_nonneg_left hy ha0
    have h3 := mul_le_mul_of_nonneg_right haK (norm_nonneg (x j))
    nlinarith [norm_nonneg (x j)]
  have hlow : ∀ j, (4 / 5 : ℝ) ^ j * ‖x 0‖ ≤ ‖x j‖ := by
    intro j
    induction j with
    | zero => simp
    | succ j ih =>
      rw [pow_succ]
      nlinarith [hstep j, ih]
  obtain ⟨D, hD, hdecD⟩ := hdec
  have hup : ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ‖x t‖ ≤ D * (3 / 5 : ℝ) ^ t := by
    intro j
    obtain ⟨t, hjt, ht⟩ := hdecD j
    refine ⟨t, hjt, (pi_norm_le_iff_of_nonneg (by positivity)).2 ?_⟩
    intro z₀
    rw [Real.norm_eq_abs]
    exact ht _ (Finset.mem_image.mpr ⟨z₀.1, z₀.2, rfl⟩)
  have hx0 : ‖x 0‖ = 0 := by
    have hb : ∀ j, ‖x 0‖ ≤ D * (3 / 4 : ℝ) ^ j := by
      intro j
      obtain ⟨t, hjt, ht⟩ := hup j
      have h1 := (hlow t).trans ht
      have hp : (0 : ℝ) < (4 / 5) ^ t := by positivity
      have h2 : (3 / 5 : ℝ) ^ t = (3 / 4) ^ t * (4 / 5) ^ t := by rw [← mul_pow]; norm_num
      rw [h2] at h1
      have h3 : (4 / 5 : ℝ) ^ t * ‖x 0‖ ≤ (4 / 5 : ℝ) ^ t * (D * (3 / 4) ^ t) := by linarith
      exact (le_of_mul_le_mul_left h3 hp).trans
        (mul_le_mul_of_nonneg_left (pow_le_pow_right_of_le_one (by norm_num) (by norm_num) hjt) hD)
    have ht : Filter.Tendsto (fun j : ℕ => D * (3 / 4 : ℝ) ^ j) Filter.atTop (nhds 0) := by
      simpa using (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0 : ℝ) ≤ 3 / 4)
        (by norm_num)).const_mul D
    exact le_antisymm (ge_of_tendsto' ht hb) (norm_nonneg _)
  have hx0' : ∀ z₀ ∈ s, ev (toK L (n + r)) F 1
      (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z₀) = 0 := by
    intro z₀ hz₀
    exact congrFun (norm_eq_zero.1 hx0) ⟨z₀, hz₀⟩
  obtain ⟨E, hE⟩ := exists_linearMap_eq_ev (toK L (n + r)) F (1 : GK L (n + r))
  have hall := eq_zero_of_mem_all_maximalIdeal_pow (E.comp (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1))) s hs2
    (fun w hw => by
      rw [LinearMap.comp_apply, hE]
      exact (hEv _ _ _ _ k F hFi hFc).1 1 _ (hbdmap _ w hw))
    (fun w hw => by
      rw [LinearMap.comp_apply, hE]
      exact hx0' w hw)
  obtain ⟨z₀, hz₀, hb⟩ := (hSt (𝓞 L) k n (n + r) (Nat.le_add_right n r) (le_refl _)).2 z hz
  have h1 := (hEv _ _ _ _ k F hFi hFc).1 1 _ hb
  have h2 := hall z₀ hz₀
  rw [← hE, map_sub] at h1
  rw [LinearMap.comp_apply] at h2
  rw [← hE]
  linarith


end AffineStabilizerVanishing

open AffineStabilizerVanishing

theorem sHeckeFinite47 : SHeckeFinite47 := by
  first
  | (rh_reduce 2 using [AffineStabilizerVanishing.assemble47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact assemble47 sChain sEv sStab sFin sAff (pKey (pTransfer pCobSub pEvDC))
      pHeckeFormal (pHeckeKer (pTransfer pCobSub pEvDC) pEvDC) pIndex pStabK

namespace JoinReconstruction
theorem key47 (hPrime : SPrime) (hHecke : SHeckeFinite47) (hHt : SHt) (hPU : SPU) (hMom : SMom) (hWhit : SWhit)
    (hCen : SCen) (hGap : SGap) (hLoc : SLoc) (hMean : SMean) (hInv : SInv) : SSurj := by
  intro L _ _ hC k hkr n₀
  obtain ⟨π, hπ, hπ25⟩ := hPrime L
  obtain ⟨a, hPUa⟩ := hPU L hC
  obtain ⟨N₀, hN₀⟩ := hHecke L hC k hkr π hπ
  obtain ⟨N₁, hN₁⟩ := hMom L hC (2 * (a * (k + 1)))
  obtain ⟨N, hN⟩ : ∃ N, N = max (max N₀ N₁) (max n₀ 3) := ⟨_, rfl⟩
  have hN0 : N₀ ≤ N := by rw [hN]; exact (le_max_left N₀ N₁).trans (le_max_left _ _)
  have hN1 : N₁ ≤ N := by rw [hN]; exact (le_max_right N₀ N₁).trans (le_max_left _ _)
  have hn₀ : n₀ ≤ N := by rw [hN]; exact (le_max_left n₀ 3).trans (le_max_right _ _)
  have h3N : 3 ≤ N := by rw [hN]; exact (le_max_right n₀ 3).trans (le_max_right _ _)
  have h1N : 1 ≤ N := by omega
  refine ⟨N, hn₀, fun c hcI hcd => ?_⟩
  obtain ⟨d, hd⟩ := hN₁ N hN1
  obtain ⟨ω', hω'G, hω'γ, hω's, hω'z, K, hK⟩ :=
    lem_form hHt hPU hWhit hCen L hC k a N h1N (hPUa N h1N) c hcI hcd
  obtain ⟨_, _, ⟨c0, hc0, hc0le⟩, _⟩ := hHt L hC N h1N
  have hht0 : ∀ x, 0 ≤ ht x := fun x => hc0.le.trans (hc0le x)
  haveI : IsFiniteMeasure (d.μ.restrict d.D) := isFiniteMeasure_restrict.2 d.fin.ne
  have hsq' : IntegrableOn (fun x => ‖fr ω' (ofS L N x)‖ ^ 2) d.D d.μ := by
    refine Integrable.mono' (hd.const_mul (K ^ 2)) ((lem_meas d hω'G.1).norm.pow 2)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖‖fr ω' (ofS L N x)‖ ^ 2‖ ≤ K ^ 2 * ht (ofS L N x) ^ (2 * (a * (k + 1)))
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), mul_comm 2 (a * (k + 1)), pow_mul, ← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hK _) 2
  have hint' : IntegrableOn (fun x => fr ω' (ofS L N x)) d.D d.μ := by
    refine Integrable.mono' (hsq'.add (integrable_const (1 : ℝ))) (lem_meas d hω'G.1)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖fr ω' (ofS L N x)‖ ≤ ‖fr ω' (ofS L N x)‖ ^ 2 + 1
    nlinarith [sq_nonneg (‖fr ω' (ofS L N x)‖ - 1)]
  obtain ⟨ωb, hωbI, hωbfr⟩ := hMean L N (k + 1) h1N d ω' hω'G.1 hω'γ hω's hint'
  have hωbG : Good ωb := (hInv L N k ωb hωbI).1
  have hγ0 : ∀ γ, FInv (ω' - ωb) (emb L N γ) := fun γ => finv_sub (hω'γ γ) (hωbI _)
  have hs0 : ∀ s, FInv (ω' - ωb) (scal L N s) := fun s => finv_sub (hω's s) (hωbI _)
  have hLz0 := lem_Lz d hω'G.1 hωbG.1 hγ0 hs0 hωbfr hint' hsq'
  have e2 : intP (ω' - ωb) = fun y => intP ω' y - intP ωb y := funext (intP_sub hω'G.1 hωbG.1)
  have hG0 : Good (ω' - ωb) := by
    refine ⟨hω'G.1.sub hωbG.1, ?_⟩
    rw [e2, dC_sub, hω'G.2, hωbG.2]
    funext y
    simp
  have hFI : Inv (toK L N) (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) :=
    fun γ y => by
      show (intP (ω' - ωb) fun j => toP L N (toK L N γ • y j) • one L N) =
        intP (ω' - ωb) fun j => toP L N (y j) • one L N
      simp only [smul_eq_mul, map_mul, mul_smul]
      exact intP_inv (hγ0 γ) _
  have hFd : dC (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) = 0 := by
    funext y
    have h4 := congrFun hG0.2 (fun j => toP L N (y j) • one L N)
    simp only [dC, Pi.zero_apply] at h4 ⊢
    exact h4
  obtain ⟨s, hs, hTest⟩ := hN₀ N hN0
  have hF0 := hTest _ hFI hFd (finite_decay47 s _ fun z hz =>
    lem_bound hGap hLoc L hC π hπ hπ25 N k h3N d (ω' - ωb) hG0 hγ0 hs0 hLz0 z (hs z hz))
  refine ⟨ωb, hωbI, fun z hz => ?_⟩
  have h5 := hF0 z hz
  rw [ev_toK _ (intP (ω' - ωb)) (fun y => rfl) z, e2, ev_sub] at h5
  rw [← hω'z z hz]
  linarith

end JoinReconstruction

theorem sSurj47 : SSurj :=
  JoinReconstruction.key47 sPrime_of sHeckeFinite47 sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInv

theorem bStarOdd47 : BStarOdd :=
  sBStarOdd_of sChain sSep' sBridge sStab sSurj47
    (sWtOdd_of sChain sEv sPsi sStokes_of)

end PositivityTheory.KB
end

rh_prune PositivityTheory.KB.AffineStabilizerVanishing.assemble as RHStructure47AssemblePruned
rh_scan PositivityTheory.KB.AffineStabilizerVanishing.assemble limit 2000
rh_scan PositivityTheory.KB.AffineStabilizerVanishing.assemble47 limit 2000
rh_scan PositivityTheory.KB.bStarOdd47 limit 2000
#print axioms PositivityTheory.KB.AffineStabilizerVanishing.assemble
#print axioms PositivityTheory.KB.AffineStabilizerVanishing.assemble47
#print axioms PositivityTheory.KB.sHecke_of_finite47
#print axioms PositivityTheory.KB.bStarOdd47

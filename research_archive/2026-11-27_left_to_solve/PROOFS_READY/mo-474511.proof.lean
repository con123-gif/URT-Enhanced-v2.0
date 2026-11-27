import OMAStatements.S_mo_474511
import Mathlib

-- Source: Ayman Moussa, MathOverflow474511, CC BY-SA4.0.
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- Bounded cluster argument credited to Olivier Benoist in the source;
-- joint scouting, combinatorics and Lean-runtime contribution.


/-! Helper for MO474511. Candidate, not yet kernel verified. -/
namespace OMA.MO474511

open Filter Topology
open scoped NNReal BigOperators Matrix.Norms.Elementwise

abbrev Mat (n : ℕ) := Matrix (Fin n) (Fin n) ℝ

def commRight {n : ℕ} (x : Mat n) : Mat n →ₗ[ℝ] Mat n where
  toFun y := y * x - x * y
  map_add' y z := by simp only [Matrix.add_mul, Matrix.mul_add]; abel
  map_smul' c y := by
    simp only [Matrix.smul_mul, Matrix.mul_smul, smul_sub, RingHom.id_apply]

/-- Right test matrices whose commutators with the curve have bounded norm. -/
def boundedTests {n : ℕ} (A : ℝ≥0 → Mat n) : Submodule ℝ (Mat n) where
  carrier := {x | ∃ C : ℝ, ∀ t, ‖A t * x - x * A t‖ ≤ C}
  zero_mem' := ⟨0, by simp⟩
  add_mem' := by
    rintro x y ⟨C, hC⟩ ⟨D, hD⟩
    refine ⟨C + D, fun t => ?_⟩
    have h : A t * (x + y) - (x + y) * A t =
        (A t * x - x * A t) + (A t * y - y * A t) := by
      simp only [Matrix.mul_add, Matrix.add_mul]; abel
    rw [h]
    exact (norm_add_le _ _).trans (add_le_add (hC t) (hD t))
  smul_mem' := by
    rintro c x ⟨C, hC⟩
    refine ⟨‖c‖ * C, fun t => ?_⟩
    have h : A t * (c • x) - (c • x) * A t =
        c • (A t * x - x * A t) := by
      simp only [Matrix.mul_smul, Matrix.smul_mul, smul_sub]
    rw [h, norm_smul]
    exact mul_le_mul_of_nonneg_left (hC t) (norm_nonneg c)

/-- Uniformly bounded commutators imply boundedness modulo the center of the
linear span of the curve. No boundedness of the original curve is assumed. -/
theorem bounded_mod_center {n : ℕ} (A : ℝ≥0 → Mat n)
    (hA : Continuous A)
    (hcomm : ∀ s t, ‖A t * A s - A s * A t‖ ≤ 1) :
    ∃ Zm : Submodule ℝ (Mat n),
      (∀ x ∈ Zm, ∀ y ∈ Zm, x * y = y * x) ∧
      ∃ z b : ℝ≥0 → Mat n,
        Continuous z ∧ Continuous b ∧
        (∀ t, z t ∈ Zm) ∧
        (∀ t, z t + b t = A t) ∧
        (∀ x ∈ Zm, ∀ t, x * b t = b t * x) ∧
        Bornology.IsBounded (Set.range b) := by
  classical
  let V := Submodule.span ℝ (Set.range A)
  let Av : ℝ≥0 → V := fun t => ⟨A t, Submodule.subset_span ⟨t, rfl⟩⟩
  have hAv : Continuous Av := hA.subtype_mk _
  have htests : V ≤ boundedTests A := by
    apply Submodule.span_le.mpr
    rintro x ⟨s, rfl⟩
    exact ⟨1, fun t => hcomm s t⟩
  let basis := Module.finBasis ℝ V
  let F : V →ₗ[ℝ] (Fin (Module.finrank ℝ V) → Mat n) :=
    LinearMap.pi fun i => (commRight (basis i : Mat n)).comp V.subtype
  let Z := LinearMap.ker F
  have hcentral (z : V) (hz : z ∈ Z) (v : V) :
      (z : Mat n) * (v : Mat n) = (v : Mat n) * (z : Mat n) := by
    have hzF : F z = 0 := hz
    let g : V →ₗ[ℝ] Mat n := (commRight (z : Mat n)).comp V.subtype
    have hg : g = 0 := by
      apply basis.ext
      intro i
      have hi : (z : Mat n) * (basis i : Mat n) -
          (basis i : Mat n) * (z : Mat n) = 0 := by
        simpa [F, commRight] using congrFun hzF i
      change (basis i : Mat n) * (z : Mat n) -
        (z : Mat n) * (basis i : Mat n) = 0
      exact sub_eq_zero.mpr (sub_eq_zero.mp hi).symm
    have hv : (v : Mat n) * (z : Mat n) - (z : Mat n) * (v : Mat n) = 0 := by
      simpa [g, commRight] using LinearMap.congr_fun hg v
    exact (sub_eq_zero.mp hv).symm
  obtain ⟨L, hZL⟩ := Z.exists_isCompl
  let pZ : V →ₗ[ℝ] V := Z.projection L hZL
  let pL : V →ₗ[ℝ] V := L.projection Z hZL.symm
  have hsplit (v : V) : pZ v + pL v = v := by
    exact Submodule.projection_add_projection_eq_self hZL v
  have hFproj (v : V) : F (pL v) = F v := by
    have hz : F (pZ v) = 0 := by
      exact Submodule.projection_apply_mem hZL v
    calc
      F (pL v) = F (pZ v) + F (pL v) := by rw [hz]; simp
      _ = F (pZ v + pL v) := (F.map_add _ _).symm
      _ = F v := congrArg F (hsplit v)
  let FL : L →ₗ[ℝ] (Fin (Module.finrank ℝ V) → Mat n) := F.comp L.subtype
  have hFL : Function.Injective FL := by
    intro x y hxy
    change F (x : V) = F (y : V) at hxy
    have hFsub : F ((x : V) - (y : V)) = 0 := by
      rw [F.map_sub, hxy, sub_self]
    have hZ : (x : V) - (y : V) ∈ Z := hFsub
    have hL : (x : V) - (y : V) ∈ L := L.sub_mem x.property y.property
    have hzero : (x : V) - (y : V) = 0 :=
      (Submodule.disjoint_def.mp hZL.disjoint) _ hZ hL
    exact Subtype.ext (sub_eq_zero.mp hzero)
  obtain ⟨K, _, hK⟩ :=
    (LinearMap.injective_iff_antilipschitz (𝕜 := ℝ) (E := L)
      (F := Fin (Module.finrank ℝ V) → Mat n) FL).mp hFL
  have htest (i : Fin (Module.finrank ℝ V)) :
      ∃ C : ℝ, ∀ t, ‖(F (Av t)) i‖ ≤ C := by
    simpa [F, Av, commRight, boundedTests] using htests (basis i).property
  choose C hC using htest
  let D : ℝ := ∑ i, max (C i) 0
  have hD : 0 ≤ D := Finset.sum_nonneg fun i _ => le_max_right _ _
  have hFbound (t : ℝ≥0) : ‖F (Av t)‖ ≤ D := by
    apply (pi_norm_le_iff_of_nonneg hD).mpr
    intro i
    exact (hC i t).trans ((le_max_left _ _).trans
      (Finset.single_le_sum (fun j _ => le_max_right (C j) 0) (Finset.mem_univ i)))
  let zmap : V →ₗ[ℝ] Mat n := V.subtype.comp pZ
  let bmap : V →ₗ[ℝ] Mat n := V.subtype.comp pL
  let z := zmap ∘ Av
  let b := bmap ∘ Av
  let Zm : Submodule ℝ (Mat n) := Z.map V.subtype
  refine ⟨Zm, ?_, z, b, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rintro x ⟨u, hu, rfl⟩ y ⟨v, hv, rfl⟩
    exact hcentral u hu v
  · exact zmap.continuous_of_finiteDimensional.comp hAv
  · exact bmap.continuous_of_finiteDimensional.comp hAv
  · intro t
    exact ⟨pZ (Av t), Submodule.projection_apply_mem hZL _, rfl⟩
  · intro t
    exact congrArg (fun v : V => (v : Mat n)) (hsplit (Av t))
  · rintro x ⟨u, hu, rfl⟩ t
    exact hcentral u hu (pL (Av t))
  · apply isBounded_iff_forall_norm_le.mpr
    refine ⟨(K : ℝ) * D, ?_⟩
    rintro x ⟨t, rfl⟩
    let l : L := ⟨pL (Av t), Submodule.projection_apply_mem hZL.symm _⟩
    have hl := ZeroHomClass.bound_of_antilipschitz FL hK l
    have hFl : FL l = F (Av t) := hFproj _
    change ‖(l : V)‖ ≤ (K : ℝ) * D
    calc
      ‖(l : V)‖ ≤ (K : ℝ) * ‖FL l‖ := hl
      _ = (K : ℝ) * ‖F (Av t)‖ := by rw [hFl]
      _ ≤ (K : ℝ) * D := mul_le_mul_of_nonneg_left (hFbound t) K.coe_nonneg

end OMA.MO474511


/-! The bounded residual step in MO474511. Candidate, not yet kernel verified. -/
namespace OMA.MO474511.Bounded

open Filter Topology
open scoped NNReal Matrix.Norms.Elementwise

abbrev Mat (n : ℕ) := Matrix (Fin n) (Fin n) ℝ

def commRight {n : ℕ} (z : Mat n) : Mat n →ₗ[ℝ] Mat n where
  toFun x := x * z - z * x
  map_add' x y := by simp only [Matrix.add_mul, Matrix.mul_add]; abel
  map_smul' c x := by
    simp only [Matrix.smul_mul, Matrix.mul_smul, smul_sub, RingHom.id_apply]

def clusterSpan {n : ℕ} (b : ℝ≥0 → Mat n) : Submodule ℝ (Mat n) :=
  Submodule.span ℝ {x | MapClusterPt x atTop b}

theorem commutes_span {n : ℕ} {S : Set (Mat n)} {z : Mat n}
    (hS : ∀ x ∈ S, z * x = x * z) :
    ∀ x ∈ Submodule.span ℝ S, z * x = x * z := by
  have hker : Submodule.span ℝ S ≤ LinearMap.ker (commRight z) := by
    apply Submodule.span_le.mpr
    intro x hx
    change x * z - z * x = 0
    exact sub_eq_zero.mpr (hS x hx).symm
  intro x hx
  have h : x * z - z * x = 0 := hker hx
  exact (sub_eq_zero.mp h).symm

theorem abelian_span {n : ℕ} {S : Set (Mat n)}
    (hS : ∀ x ∈ S, ∀ y ∈ S, x * y = y * x) :
    ∀ x ∈ Submodule.span ℝ S, ∀ y ∈ Submodule.span ℝ S,
      x * y = y * x := by
  have hgen : ∀ x ∈ S, ∀ y ∈ Submodule.span ℝ S, x * y = y * x := by
    intro x hx
    exact commutes_span (hS x hx)
  intro x hx y hy
  exact (commutes_span (fun z hz => (hgen z hz y hy).symm) x hx).symm

theorem clusters_commute {n : ℕ} (b : ℝ≥0 → Mat n)
    (hcomm : Tendsto (fun p : ℝ≥0 × ℝ≥0 => b p.1 * b p.2 - b p.2 * b p.1)
      (atTop ×ˢ atTop) (𝓝 0)) :
    ∀ x, MapClusterPt x atTop b → ∀ y, MapClusterPt y atTop b →
      x * y = y * x := by
  intro x hx y hy
  have hxy : MapClusterPt (x, y) (atTop ×ˢ atTop) (Prod.map b b) :=
    hx.prodMap hy
  have hcont : Continuous (fun p : Mat n × Mat n => p.1 * p.2 - p.2 * p.1) :=
    (continuous_fst.mul continuous_snd).sub (continuous_snd.mul continuous_fst)
  have hc : MapClusterPt (x * y - y * x) (atTop ×ˢ atTop)
      (fun p : ℝ≥0 × ℝ≥0 => b p.1 * b p.2 - b p.2 * b p.1) :=
    hxy.continuousAt_comp hcont.continuousAt
  have hz : ClusterPt (x * y - y * x) (𝓝 (0 : Mat n)) :=
    hc.clusterPt.mono hcomm
  exact sub_eq_zero.mp (inseparable_iff_eq.mp (Inseparable.of_nhds_neBot hz))

theorem clusterSpan_abelian {n : ℕ} (b : ℝ≥0 → Mat n)
    (hcomm : Tendsto (fun p : ℝ≥0 × ℝ≥0 => b p.1 * b p.2 - b p.2 * b p.1)
      (atTop ×ˢ atTop) (𝓝 0)) :
    ∀ x ∈ clusterSpan b, ∀ y ∈ clusterSpan b, x * y = y * x :=
  abelian_span (clusters_commute b hcomm)

/-- Every fixed matrix commuting with the whole residual curve commutes with
its cluster span. -/
theorem clusterSpan_centralizes {n : ℕ} (b : ℝ≥0 → Mat n) (z : Mat n)
    (hz : ∀ t, z * b t = b t * z) :
    ∀ x ∈ clusterSpan b, z * x = x * z := by
  apply commutes_span
  intro x hx
  have hclosed : IsClosed {y : Mat n | z * y = y * z} :=
    isClosed_eq (continuous_const.mul continuous_id) (continuous_id.mul continuous_const)
  exact hclosed.mem_of_mapClusterPt hx (Filter.Eventually.of_forall hz)

/-- A continuous linear map vanishing on the cluster span sends a bounded
curve to zero. This is the compactness step attributed to Benoist in the source. -/
theorem tendsto_zero_of_vanish {n : ℕ} (b : ℝ≥0 → Mat n)
    (hb : Bornology.IsBounded (Set.range b)) (D : Mat n →ₗ[ℝ] Mat n)
    (hD : ∀ x ∈ clusterSpan b, D x = 0) :
    Tendsto (fun t => D (b t)) atTop (𝓝 0) := by
  have hcompact : IsCompact (closure (Set.range b)) := hb.isCompact_closure
  have hmem : ∀ᶠ t in atTop, b t ∈ closure (Set.range b) :=
    Filter.Eventually.of_forall fun t => subset_closure ⟨t, rfl⟩
  have hnear : Tendsto b atTop (𝓝ˢ (clusterSpan b : Set (Mat n))) := by
    apply hcompact.tendsto_nhdsSet_of_mapClusterPt hmem
    intro x _ hx
    exact Submodule.subset_span hx
  have hmap : Tendsto D (𝓝ˢ (clusterSpan b : Set (Mat n))) (𝓝 0) :=
    D.continuous_of_finiteDimensional.tendsto_nhdsSet_nhds hD
  exact hmap.comp hnear

end OMA.MO474511.Bounded


/-! Assemble after the statement and the Center/Bounded helper files.
Complete candidate; no kernel verification claimed. -/
namespace OMA.MO474511

open Filter Topology
open scoped NNReal Matrix.Norms.Elementwise

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 1024 in
theorem full_solution : ∀ n : ℕ, ∀ A : ℝ≥0 → Mat n,
    Continuous A → OMA.S_mo_474511.asymptoticallyCommutes A →
    ∃ B : ℝ≥0 → Mat n,
      Continuous B ∧ (∀ t s, B t * B s = B s * B t) ∧
      Tendsto (fun t => A t - B t) atTop (𝓝 0) := by
  classical
  intro n A hA hcomm
  change Tendsto (fun p : ℝ≥0 × ℝ≥0 => A p.1 * A p.2 - A p.2 * A p.1)
    (atTop ×ˢ atTop) (𝓝 0) at hcomm
  have hsmall : ∀ᶠ p : ℝ≥0 × ℝ≥0 in atTop ×ˢ atTop,
      ‖A p.1 * A p.2 - A p.2 * A p.1‖ < 1 :=
    hcomm.norm.eventually (gt_mem_nhds (by simp))
  have hsmall' : ∀ᶠ p : ℝ≥0 × ℝ≥0 in atTop,
      ‖A p.1 * A p.2 - A p.2 * A p.1‖ < 1 := by
    simpa only [Filter.prod_atTop_atTop_eq] using hsmall
  obtain ⟨T, hT⟩ :=
    (Filter.eventually_atTop_prod_self (α := NNReal)
      (p := fun p : NNReal × NNReal =>
        ‖A p.1 * A p.2 - A p.2 * A p.1‖ < 1)).mp hsmall'
  let A' : NNReal → Mat n := fun t => A (max t T)
  have hclamp : Continuous (fun t : NNReal => max t T) :=
    continuous_id.max continuous_const
  have hA' : Continuous A' := hA.comp hclamp
  have hAe : A =ᶠ[atTop] A' := by
    apply eventually_atTop.2
    refine ⟨T, fun t ht => ?_⟩
    simp only [A', max_eq_left ht]
  have hcomm' : Tendsto (fun p : NNReal × NNReal => A' p.1 * A' p.2 - A' p.2 * A' p.1)
      (atTop ×ˢ atTop) (𝓝 0) := by
    apply hcomm.congr'
    filter_upwards [hAe.prod_inl (atTop : Filter NNReal),
      hAe.prod_inr (atTop : Filter NNReal)] with p hp1 hp2
    exact congrArg₂ (fun X Y : Mat n => X * Y - Y * X) hp1 hp2
  have hbound : ∀ s t, ‖A' t * A' s - A' s * A' t‖ ≤ 1 := by
    intro s t
    exact (hT (max t T) (max s T) (le_max_right t T) (le_max_right s T)).le
  obtain ⟨Z, hZZ, z, b, hzcont, hbcont, hzmem, hdecomp, hZb, hbbound⟩ :=
    bounded_mod_center A' hA' hbound
  have hbcomm_eq (s t : ℝ≥0) :
      b s * b t - b t * b s = A' s * A' t - A' t * A' s := by
    rw [← hdecomp s, ← hdecomp t]
    simp only [Matrix.add_mul, Matrix.mul_add]
    rw [hZZ (z s) (hzmem s) (z t) (hzmem t),
      hZb (z s) (hzmem s) t, hZb (z t) (hzmem t) s]
    abel
  have hbcomm : Tendsto (fun p : ℝ≥0 × ℝ≥0 => b p.1 * b p.2 - b p.2 * b p.1)
      (atTop ×ˢ atTop) (𝓝 0) :=
    hcomm'.congr' (Filter.Eventually.of_forall fun p => (hbcomm_eq p.1 p.2).symm)
  let W := Bounded.clusterSpan b
  have hWW : ∀ x ∈ W, ∀ y ∈ W, x * y = y * x :=
    Bounded.clusterSpan_abelian b hbcomm
  have hZW : ∀ x ∈ Z, ∀ y ∈ W, x * y = y * x := by
    intro x hx
    exact Bounded.clusterSpan_centralizes b x (hZb x hx)
  let H := Z ⊔ W
  have hZH : Z ≤ H := le_sup_left
  have hWH : W ≤ H := le_sup_right
  have hHH : ∀ x ∈ H, ∀ y ∈ H, x * y = y * x := by
    intro x hx y hy
    obtain ⟨zx, hzx, wx, hwx, rfl⟩ := Submodule.mem_sup.mp hx
    obtain ⟨zy, hzy, wy, hwy, rfl⟩ := Submodule.mem_sup.mp hy
    calc
      (zx + wx) * (zy + wy) = zx * zy + zx * wy + wx * zy + wx * wy := by
        noncomm_ring
      _ = zy * zx + wy * zx + zy * wx + wy * wx := by
        rw [hZZ zx hzx zy hzy, hZW zx hzx wy hwy,
          ← hZW zy hzy wx hwx, hWW wx hwx wy hwy]
      _ = (zy + wy) * (zx + wx) := by noncomm_ring
  obtain ⟨J, hHJ⟩ := H.exists_isCompl
  let P : Mat n →ₗ[ℝ] Mat n := H.projection J hHJ
  let D : Mat n →ₗ[ℝ] Mat n := LinearMap.id - P
  have hDzero (x : Mat n) (hx : x ∈ H) : D x = 0 := by
    change x - P x = 0
    rw [Submodule.projection_apply_of_mem_left hHJ hx]
    simp
  have hDb : Tendsto (fun t => D (b t)) atTop (𝓝 0) := by
    apply Bounded.tendsto_zero_of_vanish b hbbound D
    intro x hx
    exact hDzero x (hWH hx)
  let B : ℝ≥0 → Mat n := fun t => P (A' t)
  have hBcont : Continuous B := P.continuous_of_finiteDimensional.comp hA'
  have hBcomm : ∀ t s, B t * B s = B s * B t := by
    intro t s
    exact hHH (B t) (Submodule.projection_apply_mem hHJ _)
      (B s) (Submodule.projection_apply_mem hHJ _)
  have herror (t : ℝ≥0) : A' t - B t = D (b t) := by
    change D (A' t) = D (b t)
    rw [← hdecomp t, D.map_add, hDzero (z t) (hZH (hzmem t))]
    simp
  have he : (fun t => D (b t)) =ᶠ[atTop] (fun t => A t - B t) := by
    filter_upwards [hAe] with t ht
    rw [ht, herror]
  exact ⟨B, hBcont, hBcomm, hDb.congr' he⟩

end OMA.MO474511

open scoped NNReal Matrix.Norms.Elementwise

theorem OMA.solution : type_of% @OMA.S_mo_474511.main :=
  OMA.MO474511.full_solution

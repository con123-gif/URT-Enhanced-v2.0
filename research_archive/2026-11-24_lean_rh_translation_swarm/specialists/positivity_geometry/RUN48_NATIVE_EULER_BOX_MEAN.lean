import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatioOfUnfolding
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.EulerProductMeasureIntegralStatement
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.EulerProductMeasureTransportStatement
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.SiegelMeanValueNonnegativeStatement
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.SiegelWeilMeasureRankOneStatement
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN48 lane 7, 26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION /
LEAN PREPARED, NOT COMPILED. RH OPEN.
Current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, mandatory
engine and lane 7 read. SWARM/HANDOFF/EXPANSION/AGENTS/continuity
and state/runner/log openings consulted. Latest peer integration
58dbb472, theta 8ebb60f6, editor 8d7348e7, Landau 088776f3,
and RUN47 14448eecf inspected. Source pin
40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed
ef1760f555d5386fe8eea9c663110f7b8d08e467, not substituted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: native rank-one Euler measure already has the exact BOX
consumer needed by ratio_of_setting. Do not build general tensor
Schwartz-Bruhat factorization or pass arbitrary nonnegative test
products to SW1b2. Use the actual completed lattice L and its local
sets A_v={Y:Y(0) in L_v}. The native mem_latHat_iff gives
  X_fin(0) in Lhat iff forall v, projV(v,X_fin) in A_v.
Consequently latTensor(L,Phi_i)=1_box*Phi_i(projInf).
The native euler_product_measure_integral gives the integral of
this exact test as a single arch integral times the real product
of local masses; eventual equality A_v=latV(b,v) is already a
native lattice theorem, not a new convergence assumption.

Key new executable bridge: apply native euler_product_measure_transport
with EVERY map the identity and the inverse relative normalization
scales (coordinate measure = inverse-scale * selfdual measure).
IsUnitProd from RUN45 is preserved under inverse. Thus the normalized
fibres satisfy IsEulerProd with global constant STILL 1. No division
by a local integral, no exchange of arbitrary infinite ENNReal
products, no auxiliary arbitrary complex test. This is exact even
if a fibre mass is zero. Finiteness of the normalized standard-lattice
masses follows from finite coordinate masses and nonzero finite scales;
it is kept explicit in the adapter. Actual A_v masses are finite by
the selected local_value46 calculation. With normalized arch mass a
and local masses ofReal(d_v), d_v>=0, the decisive equation is
  integral latTensor d(thetaMeas) = a * ofReal(prod'_v d_v).
Use native siegel_mean_value_nonnegative with this SAME test to
turn the integral into the rational representation mean. At
ratio_of_setting the native tsum_coords and hunf then give
  V^{-1} V' c^{-f} a = a * p
and cancel a>0 finite via the existing ratio_of_eq. This explicitly
connects RUN45's scalar factors to the actual mean consumer rather
than constructing a general SWAt46 as an intermediate. The rank-one
SWMeas theorem is the intended producer of the unscaled Euler measure.
The coordinate/selfdual families are NOT yet supplied in compiled Lean.

Original graph retained:
volumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting ->
SW1b2 -> arbitrary tests, pure tensors, fibre families, mean and product.
Candidate selected path:
ratio_of_setting -> same hIa/hvol/hunf/tsum_coords/ratio_of_eq ->
selected_euler_mean48 -> native mean theorem + selected_box48 ->
native EulerBox + euler_rescale48 -> coordinate SWMeas and same-host
rank-one scalar fibre transport (RUN45-47), local_value46, native arch.
No global deletion; independent SW1b2 consumers unchanged.
Outstanding: exact HermR pairing/regular scalar fibre transport,
arch real nullity, common local Haar witnesses, global box measurability
from countable local measurable projections, definitional comparison
of the native theta action and atInv, full consumer replay and
constructor/axiom audit. Guarded proof below explicitly assumes
hbox and local measurable sets; no claim of their compilation.
The completed-lattice set equality does not require a finprod proof:
use mem_latHat_iff directly. Keep same rational lattice and basis.
Cache by source/toolchain, F,E,sigma,J,M,b, L,beta, psi, mu,
fundamental domain, local fibre family and scale witness; backtrack
if any is changed. No URT comparison or unrelated physics.

31 fail-on-error source/hash/token assertions executed on:
EulerProductMeasureIntegralStatement.lean 8e13b3f9261a59da2d3b5f80e3c0ce03a98dde6a
EulerProductMeasureTransportStatement.lean e9780f2db1f12ae16033369678cafe8a4c2e953c
SiegelMeanValueNonnegativeStatement.lean e8232f9fe01024f00bbec8c9db034cafb225b3fe
IndicatorCompletedLatticeEqFinprodLocal.lean e289f9861a9bc26d68ff25c87b420163b087454a
EventuallyLocalLatticeCompletionEqCoordinateLattStatement.lean e83bd847b75887138ade270a1080f529742e2239
LatticeTensorUnfolding.lean 3c60ab20ffdb5db135e5e39bcbf2d05b112818f9
VolumeRatioOfUnfolding.lean bf534d0467940a3315375b49ab216a548170c422.
Baseline native CI status JSONs for runs 45577239749 and 45576756833
retrieved: pass/returncode 0. No local lean/lake executable.
No new CI, kernel or axiom evidence; no root obligation retired.

RESUME HERE: replay euler_rescale48 and selected_euler_mean48 with
pinned native runner; instantiate hEuler via actual SWMeas rank-one,
coordinate-to-selfdual scaled fibre witnesses from RUN45-47 and
local_value46. Use exact lattice/projection measurability; replace
the hSW/hmean/hloc block of ratio_of_setting by this mean at the
same lattice, character and host. Check original bridge and scans,
then propagate into the signed ASK-MAIN row. HANDOFF TO kernel,
integration, editor, audit and theta.
-/

noncomputable section
open HeckeCharacterZeroLocus.SiegelWeilU GlobalTheory.CompanionTheory.SW
open NumberField IsDedekindDomain MeasureTheory Topology Matrix
open scoped ENNReal NNReal TensorProduct
namespace RHPositivity48

section Euler
variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
  [Algebra F E] {σ : E →ₐ[F] E}

theorem euler_rescale48 (hcm : IsCMExt F E σ) {d : ℕ}
    (b : Module.Basis (Fin d) F E) (n M : ℕ)
    (I : Measure (Fin n → Fin M → AF F ⊗[F] E))
    (mi mi' : Measure (Fin n → Fin M → Ainf F ⊗[F] E))
    (m m' : ∀ v : HeightOneSpectrum (𝓞 F), Measure (Fin n → Fin M → Fv F v ⊗[F] E))
    (c0 : ℝ≥0) (c : HeightOneSpectrum (𝓞 F) → ℝ≥0)
    (hu : IsUnitProd c0 c) (hi : mi = c0 • mi')
    (hv : ∀ v, m v = c v • m' v)
    (hfin : ∀ v, m' v (latV b v) < ⊤)
    (h : IsEulerProd b I 1 mi m) : IsEulerProd b I 1 mi' m' := by
  have ht := GlobalTheory.T.euler_product_measure_transport F E σ hcm d b n M I mi mi' m m'
    id id (fun _ => id) measurable_id measurable_id (fun _ => measurable_id)
    (fun _ => ⟨rfl, fun _ => rfl⟩)
    (Filter.Eventually.of_forall fun _ _ => Iff.rfl)
    c0 c hu (by simpa only [Measure.map_id] using hi)
    (fun v => by simpa only [Measure.map_id] using hv v) hfin h
  simpa only [Measure.map_id] using ht

open Formalism.MainNotions.StandardLattice
open GlobalTheory.AdelicU
open GlobalTheory.IndefiniteRowSideFullHecke

def box48 {M : ℕ} (L : Submodule (𝓞 E) (Fin M → E)) :
    Set (Fin 1 → Fin M → AF F ⊗[F] E) :=
  {X | ∀ v : HeightOneSpectrum (𝓞 F), projV v (projFin X) 0 ∈ latLoc F L v}

theorem latTensor_eq_box48 {M : ℕ} (L : Submodule (𝓞 E) (Fin M → E))
    (hL : Submodule.IsLattice E L)
    (φ : (Fin 1 → Fin M → Ainf F ⊗[F] E) → ℝ≥0∞) :
    LatticeTensorUnfolding.latTensor (F := F) (L : Set (Fin M → E)) φ =
      (box48 (F := F) L).indicator (fun X => φ (projInf X)) := by
  funext X
  have hh : projFin X 0 ∈ latHat F E (L : Set (Fin M → E)) ↔
      X ∈ box48 (F := F) L := by
    exact mem_latHat_iff hL.fg _
  by_cases hx : X ∈ box48 (F := F) L
  · simp [LatticeTensorUnfolding.latTensor, hx, hh.mpr hx]
  · have hn := mt hh.mp hx
    simp [LatticeTensorUnfolding.latTensor, hx, hn]

theorem selected_box48 (hcm : IsCMExt F E σ) {d M : ℕ}
    (b : Module.Basis (Fin d) F E)
    (L : Submodule (𝓞 E) (Fin M → E)) (hL : Submodule.IsLattice E L)
    (I : Measure (Fin 1 → Fin M → AF F ⊗[F] E))
    (mi : Measure (Fin 1 → Fin M → Ainf F ⊗[F] E))
    (m : ∀ v : HeightOneSpectrum (𝓞 F), Measure (Fin 1 → Fin M → Fv F v ⊗[F] E))
    (hEuler : IsEulerProd b I 1 mi m)
    (φ : (Fin 1 → Fin M → Ainf F ⊗[F] E) → ℝ≥0∞) (hφ : Measurable φ)
    (hbox : MeasurableSet (box48 (F := F) L))
    (hA : ∀ v : HeightOneSpectrum (𝓞 F),
      MeasurableSet {Y : Fin 1 → Fin M → Fv F v ⊗[F] E | Y 0 ∈ latLoc F L v})
    (a : ℝ≥0∞) (p : HeightOneSpectrum (𝓞 F) → ℝ) (hp : ∀ v, 0 ≤ p v)
    (ha : ∫⁻ X, φ X ∂mi = a)
    (hm : ∀ v, m v {Y : Fin 1 → Fin M → Fv F v ⊗[F] E | Y 0 ∈ latLoc F L v}
      = ENNReal.ofReal (p v)) :
    Multipliable p ∧
      ∫⁻ X, LatticeTensorUnfolding.latTensor (F := F) (L : Set (Fin M → E)) φ X ∂I =
        a * ENNReal.ofReal (∏' v, p v) := by
  let A := fun v : HeightOneSpectrum (𝓞 F) =>
    {Y : Fin 1 → Fin M → Fv F v ⊗[F] E | Y 0 ∈ latLoc F L v}
  have hfin : ∀ v, m v (A v) < ⊤ := fun v => by
    rw [show m v (A v) = ENNReal.ofReal (p v) from hm v]
    exact ENNReal.ofReal_lt_top
  have hev : ∀ᶠ v in Filter.cofinite, A v = latV b v :=
    GlobalTheory.T.eventually_localLatticeCompletion_eq_coordinateLattice F E M d b L hL
  have ht := GlobalTheory.T.euler_product_measure_integral F E σ hcm d b 1 M I 1 mi m
    hEuler φ A hφ hA hfin hev
  have hr : (fun v => (m v (A v)).toReal) = p := by
    funext v
    rw [show m v (A v) = ENNReal.ofReal (p v) from hm v, ENNReal.toReal_ofReal (hp v)]
  rw [hr] at ht
  refine ⟨ht.1, ?_⟩
  rw [latTensor_eq_box48 L hL φ, lintegral_indicator hbox]
  simpa only [box48, A, NNReal.coe_one, one_mul, ha] using ht.2

-- The exact test of the actual rank-one theta mean; hS is a selected
-- representation set, not an independent host. Instantiate it by the
-- native gramE=T and then tsum_coords (beta!=0).
theorem selected_euler_mean48 (hcm : IsCMExt F E σ) {d M : ℕ}
    (J : Matrix (Fin M) (Fin M) E) (hJ : IsHermND σ J)
    (b : Module.Basis (Fin d) F E)
    (L : Submodule (𝓞 E) (Fin M → E)) (hL : Submodule.IsLattice E L)
    (μ : Measure (HA (AF F) σ J)) (𝓕 : Set (HA (AF F) σ J))
    (hμ : IsHaarH F E σ M J μ) (h𝓕 : IsFDH F E σ M J μ 𝓕)
    (S : Set (Fin 1 → Fin M → E))
    (mi : Measure (Fin 1 → Fin M → Ainf F ⊗[F] E))
    (m : ∀ v : HeightOneSpectrum (𝓞 F), Measure (Fin 1 → Fin M → Fv F v ⊗[F] E))
    (hEuler : IsEulerProd b (thetaMeas σ J μ 𝓕 S) 1 mi m)
    (φ : (Fin 1 → Fin M → Ainf F ⊗[F] E) → ℝ≥0∞) (hφ : Measurable φ)
    (hbox : MeasurableSet (box48 (F := F) L))
    (hA : ∀ v : HeightOneSpectrum (𝓞 F),
      MeasurableSet {Y : Fin 1 → Fin M → Fv F v ⊗[F] E | Y 0 ∈ latLoc F L v})
    (hφt : Measurable (LatticeTensorUnfolding.latTensor (F := F) (L : Set (Fin M → E)) φ))
    (a : ℝ≥0∞) (p : HeightOneSpectrum (𝓞 F) → ℝ) (hp : ∀ v, 0 ≤ p v)
    (ha : ∫⁻ X, φ X ∂mi = a)
    (hm : ∀ v, m v {Y : Fin 1 → Fin M → Fv F v ⊗[F] E | Y 0 ∈ latLoc F L v}
      = ENNReal.ofReal (p v)) :
    (μ 𝓕)⁻¹ * ∫⁻ h in 𝓕, ∑' X : S,
      LatticeTensorUnfolding.latTensor (F := F) (L : Set (Fin M → E)) φ
        (actW (AF F) σ J h⁻¹ (ratTup (AF F) (X : Fin 1 → Fin M → E))) ∂μ =
      a * ENNReal.ofReal (∏' v, p v) := by
  have h1 := GlobalTheory.T.siegel_mean_value_nonnegative F E σ hcm M J hJ μ 𝓕 hμ h𝓕 1 S
    (LatticeTensorUnfolding.latTensor (F := F) (L : Set (Fin M → E)) φ) hφt
  have h2 := selected_box48 hcm b L hL (thetaMeas σ J μ 𝓕 S) mi m hEuler
    φ hφ hbox hA a p hp ha hm
  exact h1.symm.trans h2.2

end Euler

rh_scan GlobalTheory.VolRatioUnfold.ratio_of_setting limit 2000
rh_scan GlobalTheory.T.euler_product_measure_transport limit 2000
rh_scan euler_rescale48 limit 2000
rh_prune euler_rescale48 as RH48RescalePruned
rh_scan selected_euler_mean48 limit 2000
rh_prune selected_euler_mean48 as RH48MeanPruned
#print axioms euler_rescale48
#print axioms latTensor_eq_box48
#print axioms selected_box48
#print axioms selected_euler_mean48
end RHPositivity48

import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatioOfUnfolding
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.RestrFamily
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.DisintegrationDensityContinuous
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47 2026-11-26 | lane 7 | SOURCE-MATCHED human proof / Lean prepared,
NOT COMPILED. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, mandatory engine read.
Prior geometry bbb56405d128bda33aeee616730efcf90f5e14fa (RUN46);
theta 846e90ecc2851847edb02e362d9bbd22d1d047c6; editor
893007c3a60a0db2884e27d9d010c8659e6e758e; integration
65d0f958753df370c0dca6c1263beb794a0db109 inspected.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; no migration.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native source paths:
* CompanionTheory/SpectralGeometry/LocalGlobalProofs/AdelicAnalysis/
  RestrFamily.lean 304d6188a3e0b7d5e009081692c2509981a91907:
  ae_g_eq, glue (actual base cutoff argument).
  DisintegrationDensityContinuous.lean 3b194b32ff2ca0226d3f8553e9ffeb14d315d45b:
  exists_bump, fibre_family_basic.
* Development/AbelianVarietyTheory/BlockTheory/GlobalSignature/
  ActionCoordinates.lean 279017208fdabe25ca92942d9db6e6b3c9bb2c7b.
* Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/
  VolumeRatioOfUnfolding.lean bf534d0467940a3315375b49ab216a548170c422:
  arch (hq,h1,hB,h3,h4), ratio_of_setting (hfibre).
Executed 23 source assertions (four exact blob pins and required
declaration/body tokens), plus commit readback if successful. Prior native
CI 45577239749 and 45576756833 status JSONs actually retrieved: returncode 0;
not RUN47 verification. No local Lean; no new kernel or axiom output.

RESULT. Unlike RUN46 finite-place weakening, native arch really needs
Set.univ because its map-homeomorphism and fibreIntegral_pi_prod_eq_prod
suppliers demand it. Keep arch unchanged. Let B be the componentwise
nonzero real parameters and U=q^(-1)(B). A regular family F on U extends
to full ambient space with THE SAME F when mu(U^c)=0. The support
condition weakens, disintegration is unchanged by restriction to a
conull set, and for each b in B use the existing compact-base cutoff.
Choose compact D inside B containing a neighborhood of b, choose chi
equal to one on D and supported in B, and put psi=phi*(chi o q).
On every fibre over D, psi=phi almost everywhere by ae_g_eq. Thus
integrability and continuity for every compactly supported continuous
phi follow from the regular-family axiom for psi. No continuity at
singular parameters is asserted or needed.

ACTUAL ARCH NULLITY (human proof): native arch.hq identifies the q
coordinates, and arch.h1 identifies pushforward of the SAME selfdual
mu_i with the finite product of dx(P,Q). ActionCoordinates.dx is
2^(P+Q) times Lebesgue on C^(P+Q). Its qf is the signed sum of squared
complex moduli. Since M=P+Q>=3, choose one complex coordinate, split
it into real t and imaginary u; hold all other real coordinates fixed.
The equation qf=0 is t*t=a, where a is a continuous polynomial in the
remaining coordinates (leading coefficient +1 or -1). Each section
has at most two points, hence Lebesgue measure zero. Tonelli gives
zero for that place. Product Haar and a finite union over T give
mu_i(U^c)=0 via native hq,h1 and hB. The scalar Haar factor cannot
change nullity. The proof does not require the quadratic form to
be definite, a polynomial-zero theorem in arbitrary dimensions,
or any finite-place null-cone assertion. The Lean square-section
lemma below is a prepared local component; the concrete real-coordinate
measure transport still has to be elaborated, not assumed proved in Lean.
Negative controls: M=0 has identically zero q; if mu(U^c)>0, a full
extension with the same family is impossible (test indicator U^c).
Retain positive finite a, same Haar/character/domain, hSD and all
other arch premises. No taking norms or new global assumptions.

Graph overlay: ratio_of_setting -> arch -> native full IsFibreFamily
-> extend_regular47 -> [regular scaled rank-one Gram fibre from RUN45,
arch_nullity (hq,h1,hB plus square_graph_null47), native cutoff].
Finite branch remains RUN46. No original graph removed, no unconditional
root obligation retired. Cache by F,E,sigma,J,M,P,Q,chosen coordinates,
character, mu_i,nu_i, B, beta, test. Backtrack on different Haar or
coordinate witnesses. Still outstanding: concrete Lean nullity transport,
RUN45 selfdual HermR/scalar pairing, exact nonnegative Euler-product
factorization and actual SWAt46 replacement. After replay, propagate
through the same ASK-MAIN row and signed budget; not RH proof.

RESUME HERE: instantiate square_graph_null47 in real coordinates
of native arch.h1, use finite-union nullity and extend_regular47 in
the actual hfibre consumer of ratio_of_setting, then substitute
the normalized rank-one Euler mean from RUN45/46. Compare original
and reduced rh_scan output and axiom evidence; run native CI before
reporting success. Keep all previous files and unresolved obligations.
-/

open MeasureTheory Topology
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open scoped ENNReal
namespace RHPositivity47

theorem extend_regular47 {V X : Type} [TopologicalSpace V]
    [MeasurableSpace V] [BorelSpace V] [TopologicalSpace X]
    [MeasurableSpace X] [BorelSpace X] [LocallyCompactSpace X] [T2Space X]
    (mu : Measure V) (nu : Measure X) (q : V → X) (hq : Continuous q)
    (B : Set X) (hB : IsOpen B) (fib : X → Measure V)
    (hnull : mu (q ⁻¹' B)ᶜ = 0)
    (hF : IsFibreFamily mu q id (q ⁻¹' B) nu B fib) :
    IsFibreFamily mu q id Set.univ nu B fib := by
  classical
  refine ⟨?_, ?_, ?_⟩
  · intro b
    simpa only [Set.inter_univ] using
      measure_mono_null (Set.compl_subset_compl.2
        (Set.inter_subset_left : q ⁻¹' {id b} ∩ q ⁻¹' B ⊆ q ⁻¹' {id b})) (hF.1 b)
  · intro phi hphi
    have hm : mu.restrict (q ⁻¹' B) = mu := by
      ext s hs
      rw [Measure.restrict_apply hs, measure_inter_conull hnull]
    simpa only [Measure.restrict_univ, hm] using hF.2.1 phi hphi
  · intro phi hphi hphic _
    have key : ∀ b ∈ B, Integrable phi (fib b) ∧
        ContinuousAt (fun t => ∫ x, phi x ∂(fib t)) b := by
      intro b hb
      obtain ⟨D, hDc, hbD, hDB⟩ := exists_compact_between
        (isCompact_singleton (x := b)) hB (Set.singleton_subset_iff.2 hb)
      have hDn : D ∈ 𝓝 b := mem_interior_iff_mem_nhds.1 (hbD rfl)
      obtain ⟨chi, hchi, _, hchis, _, _, hchi1⟩ :=
        GlobalTheory.CompanionTheory.SW.FibreFam.exists_bump hDc hB hDB
      let psi : V → ℝ := phi * (chi ∘ q)
      have hp : Continuous psi := hphi.mul (hchi.comp hq)
      have hpc : HasCompactSupport psi := hphic.mul_right
      have hps : tsupport psi ⊆ q ⁻¹' B :=
        tsupport_mul_subset_right.trans
          ((tsupport_comp_subset_preimage _ hq).trans (Set.preimage_mono hchis))
      have H := hF.2.2 psi hp hpc hps
      have hae : ∀ t ∈ D, ∀ᵐ x ∂(fib t), psi x = phi x := by
        intro t ht
        refine (GlobalTheory.CompanionTheory.SW.FibreGlue.ae_g_eq
          (ι := id) Function.injective_id (fun _ => rfl) (hF.1 t)).mono ?_
        intro x hx
        simp [psi, hx, hchi1 t ht]
      exact ⟨(H.1 b hb).congr (hae b (mem_of_mem_nhds hDn)),
        (H.2.continuousAt (hB.mem_nhds hb)).congr (by
          filter_upwards [hDn] with t ht
          exact integral_congr_ae (hae t ht))⟩
    exact ⟨fun b hb => (key b hb).1, fun b hb => (key b hb).2.continuousWithinAt⟩

theorem square_fibre_null47 (a : ℝ) :
    (volume : Measure ℝ) {t : ℝ | t*t = a} = 0 := by
  have hs : {t : ℝ | t*t = a} ⊆ {Real.sqrt a, -Real.sqrt a} := by
    intro t ht
    have h : t*t = a := ht
    have ha : 0 ≤ a := by rw [← h]; positivity
    have hr := Real.sq_sqrt ha
    have hp : (t - Real.sqrt a) * (t + Real.sqrt a) = 0 := by nlinarith
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
    rcases mul_eq_zero.mp hp with h1 | h2
    · exact Or.inl (by linarith)
    · exact Or.inr (by linarith)
  exact measure_mono_null hs (by simp)

theorem square_graph_null47 {Y : Type} [MeasurableSpace Y]
    (mu : Measure Y) [SigmaFinite mu] (a : Y → ℝ) (ha : Measurable a) :
    (mu.prod (volume : Measure ℝ)) {z : Y × ℝ | z.2*z.2 = a z.1} = 0 := by
  have hm : MeasurableSet {z : Y × ℝ | z.2*z.2 = a z.1} :=
    measurableSet_eq_fun (measurable_snd.mul measurable_snd) (ha.comp measurable_fst)
  rw [Measure.prod_apply hm]
  have h : ∀ y : Y, (volume : Measure ℝ)
      (Prod.mk y ⁻¹' {z : Y × ℝ | z.2*z.2 = a z.1}) = 0 :=
    fun y => square_fibre_null47 (a y)
  simp only [h, lintegral_zero]

-- Actual native consumer is unchanged; the next replay supplies the
-- full-domain premise via extend_regular47, not a synthetic stand-in.
rh_scan GlobalTheory.VolRatioUnfold.arch limit 2000
rh_scan GlobalTheory.VolRatioUnfold.ratio_of_setting limit 2000
rh_scan extend_regular47 limit 2000
rh_prune extend_regular47 as extend_regular47Pruned
rh_auto_frontier square_graph_null47
#print axioms extend_regular47
#print axioms square_fibre_null47
#print axioms square_graph_null47
end RHPositivity47

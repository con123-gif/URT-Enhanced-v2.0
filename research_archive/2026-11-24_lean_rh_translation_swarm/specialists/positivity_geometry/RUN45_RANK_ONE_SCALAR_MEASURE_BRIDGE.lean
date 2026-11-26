/-!
RUN45 — 26 Nov 2026. Lane 7. SOURCE-MATCHED HUMAN DERIVATION;
LEAN CERTIFICATE PREPARED, NOT EXECUTED. No root obligation retired.

Mission latest blob f8b4b837301f8cf43d673be4979f04c4e4b415a4.
Read mission including mandatory unified engine, protocol, handoff,
expansion, AGENTS and recent peer handoffs. RUN43 and RUN44 retained.
Native pin 40e56bab026552e089d7afcfeff08d2defb9c005; no migration.
Lean 4.33.1; mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

ACTUAL CONSUMER:
VolumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting -> SW1b2.
RUN43 reduction: volumeRatio_of_host43 -> ratio_of_setting43 -> SWAt43.
RUN44 supplier: SWMeas -> siegel_weil_measure_rank_one -> sw_one.
New candidate edge connects SWMeas coordinate disintegration to SWAt43
scalar selfdual disintegration. Original graphs and obligations retained.

1. Rank-one Hermitian coordinate is exactly t(S)=Tr(S)/2, inverse
   iota(r)=hermScal(r). Native map_coordHerm proves that pushing forward
   coordinate Hermitian measure gives the original scalar base measure,
   with no factor two. t(Gram(X))=q_R(X 0); pairHerm(iota(s),iota(t))=st
   by trace of scalar multiplication on a degree-two extension.
   Trace is additive; use additive homeomorphism and native
   selfdual_measure_transport_equiv to transport the scaled base measure.

2. IsGramFib disintegrates over the open nonsingular U; SW1b2 requests
   the whole ambient space. U=q^{-1}(B), where B consists of nonzero
   scalars at a finite place and componentwise nonzero scalars at infinity.
   Indeed scalar multiplication on the finite free rank-two extension
   is invertible iff the scalar is a unit. At each field component the
   nondegenerate Hermitian form gives a nonzero quadratic polynomial
   (polarization and the CM involution). Its zero set has Haar measure zero:
   induction on the number of coordinates, using a nonzero coefficient
   polynomial and finite root sets in the last variable, Fubini on
   sigma-finite product Haar and nonatomic local-field Haar.
   At infinity take the finite union of componentwise zero sets.
   Thus ambient restriction to U equals ambient measure.
   The Gram fibre family m is already zero at singular parameters by its
   support axiom (intersection with U is empty). Define scalar fibres
   f(r)=(c/e) times m(iota(r)). Support and disintegration follow by
   pushforward on the base and the null complement. For continuity on B,
   use a continuous base cutoff eta supported inside B and identically
   one near the chosen regular r0. For any ambient compactly supported
   continuous test phi, phi*eta(q) has compact support contained in U;
   its fibre integrals agree with phi on the neighborhood. This supplies
   the required local continuity and integrability. No continuity across
   singular fibres is asserted.

3. Apply native selfdual ambient/Hermitian scaling suppliers at n=1 to
   the same character, basis, Haar and domain. Write their factors as
   c_inf,c_v and e_inf,e_v. Both satisfy IsUnitProd and are nonzero.
   Native unit_product_closure_properties yields the quotient family.
   Choose S containing finite nonunit scaling support, SW Euler-product
   exceptional set and finite nonstandard test support. Then
       (c_inf/e_inf) * prod_{v in S}(c_v/e_v) = 1.
   All scales outside S equal one. Consequently the coordinate and
   selfdual product integrals agree EXACTLY, with unchanged infinite tail.
   No dividing integrals, taking norms or discarding zero factors;
   ENNReal finite algebra below applies also to zero/infinite integrals.
   Coordinate Euler convergence comes from SWMeas, not an additional
   independently assumed Euler-product theorem.

4. At the selected beta=+/-1, T is the 1x1 matrix with entry beta.
   gramE(X)=T iff X 0 != 0 and hE(X 0,X 0)=algebraMap beta.
   Nonzero follows from beta!=0. The native nonnegative theta mean
   theorem exchanges the count and integral on the actual domain;
   actW is the same action as inverse h acting on ratTup.
   Thus the same selected arch test and finite local indicators are used.
   This gives the human coordinate-to-selfdual argument, conditional on
   the native rank-one theorem and stated local measure facts. It is not
   a compiled SWAt43 replacement.

Source pins:
CompanionTheory/SpectralGeometry/LocalGlobalProofs/AdelicAnalysis/
 HermitianRankOneHomeomorphBase.lean 97d4b092fd8bd5725c6b5b9dbdffd45171c01b5b
 SelfdualMeasureTransportEquivStatement.lean b56d9c18326ce6db563031176219938541c8e9e6
 FibreFamilySmul.lean 5de184b3c4c8b4fb6546ffa99716bc9371905abf
 GramFiberMeasuresScalingStatement.lean 3076bac327b3b555287fdae0719f13c86f1aa892
 ExistsUnitScalingSelfdualAdelicMeasuresStatement.lean da7602234ea7c5216101d5671470fe57c290bfdb
 ExistsUnitScalingSelfdualHermMeasuresStatement.lean 227a62abbe24fee70aa681f2babb4ba843f40ad9
 UnitProductClosurePropertiesStatement.lean 7099dec3112b6f4a52ff1dd166c1260741950695
 SiegelMeanValueNonnegativeStatement.lean e8232f9fe01024f00bbec8c9db034cafb225b3fe
IsEulerProd.lean 6341eea11489ecd82bda087171023fad7d68415e
StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
GenusMassVolumes.lean 525618b770cb535fd890f10277af11ffbe76af40
VolumeRatio.lean 2c0102e38f7e31a7132366fdfe495a6b09402738

32 source hash/token assertions executed across ten pinned files.
Baseline CI 45577239749 and 45576756833 status JSONs retrieved: pass/exit 0.
These authenticate prior engines only. No local Lean/lake; no new native
compilation, kernel axiom output or CI pass. Prior axiom evidence unchanged.
Context cache: source/toolchain, F,E,sigma,J,M,basis,beta,character,Haar,
domain, test factors, place, consumer. Backtrack to original SW1b2 if
actual substitution or axiom comparison fails. No URT performance claim.

RESUME HERE:
Implement local null-complement lemma and scalar additive homeomorphism
transport, including cutoff proof; instantiate both native scaling
suppliers and the selected mean on the actual RUN43 consumer.
Compile the certificate below with the exact pinned imports/engines,
then actual SWAt43 wrapper; compare original/reduced dependency graphs,
run axiom checks, and locate original published SW1b2 field supplier.
Do not report root retirement until actual consumer replay succeeds.
HANDOFF TO: native kernel lane, theta lane, integration and editor.
-/
import Mathlib
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.HermitianRankOneHomeomorphBase
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.UnitProductClosurePropertiesStatement
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.SiegelMeanValueNonnegativeStatement
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open HeckeCharacterZeroLocus.SiegelWeilU GlobalTheory.CompanionTheory.SW
open GlobalTheory.CompanionTheory.SW.BB.HermOne
open NumberField IsDedekindDomain MeasureTheory Topology
open scoped TensorProduct ENNReal NNReal Matrix

namespace RH45ScalarMeasure

theorem rank_one_base45 {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] {σ : E →ₐ[F] E}
    (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R]
    [IsTopologicalRing R] [MeasurableSpace R] [BorelSpace R]
    (hcm : IsCMExt F E σ) {d : ℕ} (b : Module.Basis (Fin d) F E)
    (lam : Measure R) [SigmaFinite lam] :
    (coordHerm R σ b lam 1).map (hermHomeo R hcm) = lam := by
  exact map_coordHerm R hcm b lam

theorem unit_ratio45 (F : Type) [Field F] [NumberField F]
    (a b : ℝ≥0) (c e : HeightOneSpectrum (𝓞 F) → ℝ≥0)
    (hc : IsUnitProd a c) (he : IsUnitProd b e) :
    IsUnitProd (a / b) (fun v => c v / e v) := by
  obtain ⟨_, _, _, _, h, _, _, _⟩ :=
    GlobalTheory.T.unit_product_closure_properties F a b c e hc he
  exact h

theorem exact_scale_budget45 (F : Type) [Field F] [NumberField F]
    (a b : ℝ≥0) (c e : HeightOneSpectrum (𝓞 F) → ℝ≥0)
    (hc : IsUnitProd a c) (he : IsUnitProd b e) :
    ∃ S₀ : Finset (HeightOneSpectrum (𝓞 F)), ∀ S, S₀ ⊆ S →
      (∀ v, v ∉ S → c v / e v = 1) ∧
      (a/b) * ∏ v ∈ S, c v / e v = 1 := by
  have h := unit_ratio45 F a b c e hc he
  obtain ⟨_, _, _, _, _, _, _, hs⟩ :=
    GlobalTheory.T.unit_product_closure_properties F (a/b) (a/b)
      (fun v => c v / e v) (fun v => c v / e v) h h
  exact hs

theorem finite_scale_cancel45 {ι : Type} (S : Finset ι)
    (r A : ℝ≥0∞) (s p : ι → ℝ≥0∞)
    (h : r * ∏ v ∈ S, s v = 1) :
    (r*A) * ∏ v ∈ S, (s v * p v) = A * ∏ v ∈ S, p v := by
  rw [Finset.prod_mul_distrib]
  calc
    _ = (r * ∏ v ∈ S, s v) * (A * ∏ v ∈ S, p v) := by ac_rfl
    _ = _ := by rw [h, one_mul]

#print axioms rank_one_base45
#print axioms unit_ratio45
#print axioms exact_scale_budget45
#print axioms finite_scale_cancel45
end RH45ScalarMeasure

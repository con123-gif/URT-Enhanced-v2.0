import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsFundamentalDomainMeasureEq
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.AutomorphicInstanceExistsFundamentalDomain
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN39 | 25 Nov 2026 | SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. Read mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, SWARM,
HANDOFF, EXPANSION, AGENTS and current living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc.
Peer geometry a2d27f27 and 2d9cc303, integration f26f77b4, theta 410fcbc2
and prior editor d5bb73cf inspected in detail; latest 25 commits surveyed.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Peer observed main
07be9a52, not substituted.

RESULT: use the actual native infimum covolume directly, with the SAME
positive finite Haar calibration scalar in numerator and denominator.
This is a local factorization of the existing native normalization
argument, not a new general measure theorem or a claim of RH closure.
It avoids proving another measurable-transversal transport for AutInst.

Source ledger at pin:
Definitions/SemilocalFrames/DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
  gaugeVol = ofReal(prod c) * covol GFset (muA muf) univ / muf Kset.
Proofs/FlagMeasures/GaugeVolumeEqOfSemilinearIsometryGenus.lean
  d8e911ba588e91954a6b50bf044fd455e8715376:
  covol_map, covol_smul, pos_of_isGauge, gaugeVol_transport.
Proofs/FlagMeasures/ExistsAdelicUnitaryGroupModelsEquiv.lean
  881f8a11ac4a415b29939e496acb71d63b5fadc0:
  exists_adelic_equiv includes rational diagonal iff, finite and infinite
  matrix coordinates. This is the exact native AutInst-to-HA bridge.
Proofs/FlagMeasures/ExistsFundamentalDomainMeasureEq.lean
  49dd18506ffe15a2e08f041f1f9e3cd2c0a16cef:
  exists_fundamentalDomain_measure_eq pushes the SAME Haar and domain;
  vol_finite_pos already proves finite positive quotient mass.
Proofs/FlagMeasures/AutomorphicInstanceExistsFundamentalDomain.lean
  1b138ff2c4bda71bb2ae314716a34747673b87b1: exists_isFundDom.
Proofs/FlagMeasures/CovolEqOfAedisjoint.lean
  4fc0ab445bed7529d0aac27ae88a8b3e55e3f84f: covol_eq_of_aedisjoint
  directly identifies covering infimum with exact FD mass under
  countability, measurability, invertibility, invariance and disjointness.
Proofs/FlagMeasures/RationalUnitaryPointsDiscreteFundamentalDomain.lean
  5b2d05f93d7090ca997ba239d3cb0764e77c13ef: rational_points, ratSub.
Definitions/SemilocalFrames/IsGaugeAll.lean
  5abc045266b05be6cd3f3fcc67b369ddd167f92b: IsGaugeAll, rankFac.
Paths above relative to src/Development/AbelianVarietyTheory/.

Human reduction. Fix actual I, gauge c, finite Haar muf. Let C=prod c>0,
m=C*(I.muA muf) as a scaled measure, K=muf(I.Kset).
Given same-form measurable group equivalence T onto conventional
adelic coordinates, T(GFset)=Gamma, reference Haar nu and a finite
positive a with T_*m=a nu, K=a k, then
  gaugeVol(I,c,muf) = covol(Gamma,nu)/k.
Proof: native covol_smul absorbs C; native covol_map transports the
covering infimum exactly; native covol_smul extracts a, which cancels
from numerator and denominator using ENNReal.mul_div_mul_left.
No division by covol or assumption of its positivity/finiteness is
needed for this identity; the scalar a MUST be neither 0 nor top.
If a=0, for positive finite k and covol both sides need not agree.
There is no assertion that arbitrary reference Haar has k=1: for
nu=real trace-density x finite Haar with stabilizer volume k, local
density matching forces equality K=a*k. Can calibrate with any
positive finite real rectangle B of trace-density b, since its
product with Kset has mass b*K; its image under T must have mass b*k
under nu. Compare on this single rectangle, cancel b>0. This is
exactly the simultaneous normalization, not two independently chosen
Haar scalars. Need check real gauge and reference density in native
coordinates before setting k=1. For D.vol the separate IsVolMeas and
VolTie consumers are retained; same-form model equivalence is not a
cross-signature isomorphism. For adjacent ranks use the previous
determinant-torus formula with absolutely convergent j>=2 products.

Editor integration also corrects stale PropZ statement: independently
read native HVCore f4b900eb, PropZ 725ebfc6, CountZ 5601df23,
JointWinOfCounts 2f86e494. of_four_alt already uses countZ X.propZ,
and pointHV_of_counts uses countIV. These are supplied locally,
not globally removed or assumed kernel-verified. Other four counts,
cohomology inputs, same-host LemmaK and all quantitative guards remain.

Original graph: gaugeVol_transport -> covol_map + covol_smul +
real/finite Haar transport; canonical36 -> rank recurrence -> count.
Candidate graph: same-form exists_adelic_equiv -> native_gauge_calibrated
-> covol_map + covol_smul + shared scalar calibration -> prior
TorusFormula -> canonical_rank_of_torus -> counting_of_torus.
Keep original path and all pending type/value/constructor/axiom edges,
including determinant splitting, trace density, local lattice masses,
Tamagawa and distinct D.vol measure dictionary. Key cache by pin,
toolchain, I.cm, I.J, lattice, gauge witness, T, nu, K, a, k and consumer.
Backtrack to original VolumeStep on failed comparison. No global graph
edge deleted. No new axiom ledger or root closure.

Executed: actual source retrieval and inspection of the eight geometric
files and four count files above; peer content and live proof read.
Native Lean/Lake absent on PATH. Actual baseline status records read:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717,
both returncode 0; neither validates this candidate. No URT comparison.
No new CI job was dispatched; below is a prepared native certificate.

RESUME HERE: replay this file with RUN36–38 in existing pinned runner,
then supply the actual hmap/hK for the canonical diagonal trace-density
product by evaluating the single positive rectangle using native
exists_adelic_equiv finite/infinite coordinate statements. Verify the
same normalization on the separate D.vol branch before propagation.
Preserve all open arithmetic, entropy, local-gain and prime-window
premises; no further downstream rewrite.
HANDOFF TO integration, geometry, theta, kernel and audit.
-/

noncomputable section
open MeasureTheory NumberField Matrix Finset Formalism.MainNotions.S GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal
namespace RHEditorCalibration

theorem normalized_covol_transport {G G' : Type} [Mul G] [Mul G']
    [MeasurableSpace G] [MeasurableSpace G']
    (T : G' ≃ᵐ G) (hmul : ∀ x y, T (x*y) = T x * T y)
    (Γ : Set G) (Γ' : Set G') (hΓ : ∀ x, x ∈ Γ' ↔ T x ∈ Γ)
    (μ : Measure G) (μ' : Measure G') (a k k' : ENNReal)
    (ha : a ≠ 0) (hat : a ≠ ⊤)
    (hmap : μ'.map T = a • μ) (hk : k' = a*k) :
    covol Γ' μ' Set.univ / k' = covol Γ μ Set.univ / k := by
  rw [← GlobalTheory.GaugeTransport.covol_map T hmul Γ Γ' hΓ,
    hmap, GlobalTheory.GaugeTransport.covol_smul _ _ _ _ ha hat,
    hk, ENNReal.mul_div_mul_left _ _ ha hat]

theorem native_gauge_calibrated (I : AutInst)
    (c : InfinitePlace I.F → ℝ) (μf : Measure I.Gf)
    [SigmaFinite μf] (hc : IsGaugeAll I c)
    {G : Type} [Mul G] [MeasurableSpace G]
    (T : I.GA ≃ᵐ G) (hmul : ∀ x y, T (x*y) = T x * T y)
    (Γ : Set G) (hΓ : ∀ x, x ∈ I.GFset ↔ T x ∈ Γ)
    (ν : Measure G) (a k : ENNReal) (ha : a ≠ 0) (hat : a ≠ ⊤)
    (hmap : ((ENNReal.ofReal (∏ v, c v)) • I.muA μf).map T = a • ν)
    (hk : μf I.Kset = a*k) :
    gaugeVol I c μf = covol Γ ν Set.univ / k := by
  have hC : ENNReal.ofReal (∏ v, c v) ≠ 0 :=
    (ENNReal.ofReal_pos.2 (Finset.prod_pos fun v _ =>
      GlobalTheory.GaugeTransport.pos_of_isGauge (hc v))).ne'
  unfold gaugeVol
  rw [← GlobalTheory.GaugeTransport.covol_smul _ _ _ _ hC ENNReal.ofReal_ne_top]
  exact normalized_covol_transport T hmul Γ I.GFset hΓ ν _ a k _ ha hat hmap hk

theorem actual_domain_exists (I : AutInst) (μf : Measure I.Gf)
    [μf.IsHaarMeasure] [SigmaFinite μf] :
    ∃ fund, I.IsFundDom (I.muA μf) fund := by
  first
  | (rh_reduce 2 using [GlobalTheory.FundExists.exists_isFundDom]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.FundExists.exists_isFundDom I μf

end RHEditorCalibration
rh_scan GlobalTheory.GaugeTransport.gaugeVol_transport limit 2000
rh_scan GlobalTheory.AdelicVol.exists_fundamentalDomain_measure_eq limit 2000
rh_scan RHEditorCalibration.native_gauge_calibrated limit 2000
rh_prune RHEditorCalibration.native_gauge_calibrated as RHEditorCalibrationPruned
#print axioms GlobalTheory.AdelicModels.exists_adelic_equiv
#print axioms GlobalTheory.AdelicVol.vol_finite_pos
#print axioms RHEditorCalibration.normalized_covol_transport
#print axioms RHEditorCalibration.native_gauge_calibrated
#print axioms RHEditorCalibration.actual_domain_exists

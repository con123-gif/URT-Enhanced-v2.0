import Formalism.LocalToGlobal.GlobalTheory.GL5.PacketStatementOfIndependence
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.LeftQuotientCovolumeEqFundamentalDomainInter
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN48, 26 Nov 2026. SOURCE-MATCHED human relative mass argument;
Lean bridge PREPARED, NOT COMPILED. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine)
read first; AGENTS, SWARM, HANDOFF, EXPANSION, state/continuity/runner
openings, living proof, and latest peer commit summaries consulted.
Editor RUN47 8d7348e738b021d3a527e6a2532742acb90d2226; theta RUN47
8ebb60f67b6a4f6c206a190581a47b6342b72af1 (trace-one congruence lift);
geometry 14448eecf49de51a786b516c6b90de502e8f56c7 (regular arch fibre);
integration 58dbb472eb4957d41d1bc0948de5313661243b48 (same rank-three
witness); Landau 088776f39a07b37c91ff9219565da8d92e5a0388.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream latest observed ef1760f555d5386fe8eea9c663110f7b8d08e467
(C_p API merge), not adopted or checked for equivalence.

NEW: compare the actual indefinite row W=Y0 directly with the
standard positive space W0=stdPos(D,r) at the SAME rank and field.
For this base-mass caller neither the absolute unitary mass formula
nor the adjacent-rank GAUGE formula needs derivation. The native
model mass recurrence is retained and used ONLY after the endpoint
comparison. Other consumers of VolumeStep/VolSigIndep are unchanged.

Human relative proof, with exact hypotheses:
E/F is the same quadratic CM extension, unramified at all finite
places, both lattices are self-dual and have rank r>=2.
At an inert finite place, each lattice has an orthogonal integral
basis of unit norms: reduce the perfect Hermitian form, use the
surjective residue trace to exclude all norms zero (even at 2),
lift a nonzero-norm vector and split its integral orthogonal
complement, then induct. The norm on units of the unramified
quadratic extension is surjective: the residue norm is surjective,
and at each higher congruence level the linearized norm is the
surjective residue trace; completeness gives the lift. Thus scale
each basis vector to norm 1. At a split place the two components
are dual and a basis in one and its dual in the other suffice.
Hence a finite-place isometry A_v identifies the two stabilizers
and their determinant maps. No global rational isometry between
different signatures is asserted.

Use the same trace density convention as editor RUN46/47. The
differential X -> A_v X A_v^-1 preserves tr(XY) by cyclicity.
It preserves its absolute Gram density and consequently the
associated invariant Haar measures, not just group cardinalities.
Thus at each finite place the two stabilizer masses are IDENTICAL.
For H=SU, use the invariant differential obtained by contracting
the full unitary top form with the fixed torus differential along
the determinant sequence. The two finite-place maps commute with
det, so they preserve this quotient density as well. This avoids
restricting the trace pairing to sl_r at primes dividing r.

For each group separately a rational Lie basis gives local trace
density = |det Gram|_v^(1/2) times its rational top-form measure.
The product of these multipliers is 1 by the product formula.
Discriminant normalization and the rank-one convergence factors
are identical at the two endpoints (same F,E,r). The rational
determinant section exists separately in each unitary group by
rational orthogonal diagonalization. Its rationality and finite
integrality outside finitely many places suffice. Its quotient
disintegration gives the product of the special-unitary quotient
mass and the common norm-one torus quotient mass; the local
constant-fibre proof of RUN47 is used, not an assumed integral
global section. The determinant action preserves the invariant
SU density (conjugation has determinant of absolute value 1).
A fundamental-domain product using measurable transversals gives
this quotient formula: reduce the torus coordinate by its rational
points, then the SU coordinate by its rational points. The
corresponding Haar Jacobian is 1. This step still needs the native
adelic dictionary and disintegration authenticated.

The simply connected Tamagawa theorem gives tau(SU(W)) =
tau(SU(W0)) = 1; cite Kottwitz, or the standard theorem described
in Lurie/Gaitsgory, https://people.math.harvard.edu/~lurie/papers/tamagawa-abridged.pdf
(introduction, retrieved 26 Nov). Thus the two total quotient
masses in these common conventions are equal. We do NOT need
their numerical value, the torus Tamagawa number, any local point
count, or any evaluation of an Euler product. The finite
normalization factors agree place by place BEFORE forming the
global product; use the same convergence factors on both sides.
Use RUN46 to convert the arch density to native measures:
the conversion is volU(r)^f at both endpoints. Therefore, in
the native notation after the retained measure identifications,

             V(W) / V(W0) = 1.

The same-rank comparison is a genuine simplification over deriving
the full formula C_T*d_F^((r^2-1)/2)*prod L_F(j,eta^j), and over
proving VolSigIndep for all W,W0 and every measure pair at the
base-mass caller. Do not apply it to different fields or ranks,
ramified self-dual models, or arbitrary non-self-dual lattices.
It does not remove the distinct VolumeStep rank-change consumer.

Actual caller: PNamed.vol_eq_of_indep only uses hI once, on a
pair of measures and fundamental domains from the SAME VolTie D.
It suffices to exhibit ONE such pair with equal measure, as
volTie_toReal already turns each into D.vol. No proof of a
universally quantified VolSigIndep required for this local caller.
The certificate below proves this restricted interface and its
specialization to the actual base row, retaining the equality of
the two chosen native measures as an explicit premise.
At W0 the actual definite_class_decomposition and the model
definition establish D.vol W0 = massI D r, subject to the prior
prepared certificate integration/2026-11-25_INTERACTIVE_STANDARD_MASS_BY_DEFINITION.lean.
Its source chain is not a new axiom: genus_class_mass ->
unitary_class_mass_hermitian -> UJClassMass.unitary_class_mass ->
hermitian_approximation -> tensor_localization, local switching,
lattices close locally, wPlace, bcU and gramOK. Preserve all
these suppliers and audit their bodies. Then the native mass
telescope gives the signed-budget anchor with defect zero.

Executed 26 fail-on-error pinned source hash/token checks on 7
actual files (connector V8):
Formalism/LocalToGlobal/GlobalTheory/GL5/
 PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d
 PClassItems.lean 1727950e8085a74f7895746b3ae240083d7be0
 PacketStatementOfIndependence.lean 1cebe7595e0dc808d6d38fb6d359edf122148c9f
Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 LeftQuotientCovolumeEqFundamentalDomainInter.lean 81767f05db5d4d10576659201013df459adde451
Formalism/PeriodIntegrals/UnitaryGroupMassFormula/UnitaryClassMass/
 UnitaryClassMass.lean c2168685211cda28e2a4a72b72380a2380ebe2a4

Original graph retained: VolTie + VolSigIndep + definite class
mass + model telescope -> BaseVolumeEqualsMass; separate VolumeStep
rank-change branch. Candidate overlay: same D, selected W/W0,
local isometries and trace/contracted density, common torus,
tau_SU=1, native normalization -> one_pair_eq48 -> base_pair48
-> model telescope -> signed family count. No deletion of original
edges, axioms or pending nodes. Cache by pin, toolchain, D, W,W0,
rank, fields, local lattices, determinant map, chosen measures/FDs
and actual caller. Backtrack to RUN47 absolute gauge calculation
if common normalization cannot be authenticated.

Local command -v lean/lake/elan returned no paths.
Reread actual CI status.json on cathedral-research-state:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717,
both status pass, returncode 0. Existing conditional root only;
prior bounded scan leaves 324 pending and classical axioms.
No new Lean compilation, CI dispatch or axiom audit. No global
retirement, synthetic tests or URT benefit claim.

RESUME HERE: kernel/audit stage this pair bridge and prior
standard definite model certificate. Geometry/theta authenticate
the actual native finite-place isometry and common contracted
density, using existing local lattice/adelic transports, then
prove the one-pair equality directly, without evaluating Euler
products. Propagate into the signed global caller once checked.
All CountI/II/V/Vs, TopG/Green/J/VWin and prime-window obligations
remain open.
HANDOFF TO geometry, theta, kernel, audit, integration.
-/

noncomputable section
open MeasureTheory
open scoped TensorProduct ENNReal
namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes

open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
attribute [local instance] Formalism.BasicNotions.Host.cmStar

/-- Only one matched native measure pair is required by this caller. -/
theorem one_pair_eq48 (D : D7) (hT : VolTie D)
    (W W0 : HSpace D.host.E) (P Q P0 Q0 : ℕ)
    (hW : W.SigOK) (hW0 : W0.SigOK)
    (hs : ∀ τ, W.sig τ = (P,Q)) (hs0 : ∀ τ, W0.sig τ = (P0,Q0))
    (μ : Measure (HA (AF D.host.F) D.sp.cm.sig W.gram))
    (F : Set (HA (AF D.host.F) D.sp.cm.sig W.gram))
    (μ0 : Measure (HA (AF D.host.F) D.sp.cm.sig W0.gram))
    (F0 : Set (HA (AF D.host.F) D.sp.cm.sig W0.gram))
    (hμ : IsVolMeas D W P Q μ)
    (hF : IsFundamentalDomain (HFinIn (AF D.host.F) D.sp.cm.sig W.gram) F μ)
    (hμ0 : IsVolMeas D W0 P0 Q0 μ0)
    (hF0 : IsFundamentalDomain (HFinIn (AF D.host.F) D.sp.cm.sig W0.gram) F0 μ0)
    (he : μ F = μ0 F0) : D.vol W = D.vol W0 := by
  have h1 := volTie_toReal D hT W P Q hW hs μ F hμ hF
  have h0 := volTie_toReal D hT W0 P0 Q0 hW0 hs0 μ0 F0 hμ0 hF0
  exact h1.symm.trans ((congrArg ENNReal.toReal he).trans h0)

/-- The full signature-independence theorem is not an input here.
The actual same-rank measure-pair comparison and standard mass remain. -/
theorem base_pair48 (D : D7) (hT : VolTie D)
    (μ : Measure (HA (AF D.host.F) D.sp.cm.sig (D.sp.Y 0).gram))
    (F : Set (HA (AF D.host.F) D.sp.cm.sig (D.sp.Y 0).gram))
    (μ0 : Measure (HA (AF D.host.F) D.sp.cm.sig (stdPos D D.R.r).gram))
    (F0 : Set (HA (AF D.host.F) D.sp.cm.sig (stdPos D D.R.r).gram))
    (hμ : IsVolMeas D (D.sp.Y 0) D.R.sigY0.1 D.R.sigY0.2 μ)
    (hF : IsFundamentalDomain (HFinIn (AF D.host.F) D.sp.cm.sig (D.sp.Y 0).gram) F μ)
    (hμ0 : IsVolMeas D (stdPos D D.R.r) D.R.r 0 μ0)
    (hF0 : IsFundamentalDomain (HFinIn (AF D.host.F) D.sp.cm.sig (stdPos D D.R.r).gram) F0 μ0)
    (he : μ F = μ0 F0)
    (hStd : D.vol (stdPos D D.R.r) = massI D D.R.r) :
    BaseVolumeEqualsMass D := by
  change D.vol (D.sp.Y 0) = massI D D.R.r
  have hp : D.vol (D.sp.Y 0) = D.vol (stdPos D D.R.r) := by
    first
    | (rh_reduce 2 using [one_pair_eq48]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact one_pair_eq48 D hT (D.sp.Y 0) (stdPos D D.R.r)
        D.R.sigY0.1 D.R.sigY0.2 D.R.r 0 (D.sp.Y_sig 0)
        (stdPos_sigOK D D.R.r) (fun τ => D.sp.baseSpace_signature_eq τ)
        (stdPos_sig D D.R.r) μ F μ0 F0 hμ hF hμ0 hF0 he
  exact hp.trans hStd

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes

rh_scan Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.vol_eq_of_indep limit 2000
rh_scan Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.base_pair48 limit 2000
rh_prune Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.base_pair48 as RHBasePair48Pruned
#print axioms Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.one_pair_eq48
#print axioms Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.base_pair48

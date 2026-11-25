import CompanionTheory.AutomorphicTheory.SiegelUnitTheory.VolumeSignatureIndependent
import Development.AbelianVarietyTheory.Proofs.HeightProofs.HaarUpqEqOfOmegaDensity
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.RealPlaceMeasures
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40, 25 November 2026, lane 7. SOURCE-MATCHED human derivation of
regularized calibration; Lean adapter PREPARED, not compiled. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first; SWARM
4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d,
continuity/state/summary and live proof fd2d51ae41d5a18a548f009918f298f1bf0e222c
inspected. Joint-loss integration 65d3dafb700180b79e35625c8fc22337ace68005
and latest Galois peer 3408a84 (file bbd17e96) read. RUN39 a2d27f27,
RUN38 2d9cc303, RUN35 04a29a86 retained. Pin remains
40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

NEW: match the actual native IsOmegaLeb normalization to the rational
trace-pairing density, rather than assuming an unspecified common
archimedean Haar constant. Also cancel the degree-one convergence
factor before forming the finite product. No absolute Tamagawa number
or infinite unregularized product is required.

Fix the SAME totally real F, finite-unramified CM extension E/F,
positive rank n, W and W0 satisfying the original self-dual lattice
and signature/frame premises. Write G_J for U(J). On its F-Lie algebra
use B_J(X,Y)=tr_E(XY), valued in F: the conjugate is
tr((Y^*) (X^*))=tr(JYXJ^{-1})=tr(XY). After extension to E this is the
ordinary perfect matrix trace pairing. In an F-basis b write
D_J=det(B_J(b_i,b_j)) in F^times. The real and finite densities
d_J,v at the identity are |D_J|_v^(1/2) times coordinate Lebesgue/Haar
density (finite additive measure normalized by O_v volume 1).
They extend by left translation. A rational change of basis has
the correct absolute determinant. The number-field product formula
gives product_v |D_J|_v^(1/2)=1, for EACH form separately. Thus their
regularized global product is the conventional Tamagawa measure
up to the usual common base-field and character-L normalization.
This does not assert that the Lie algebra map X->JX is a group
isomorphism or even a trace-pairing isometry.

ARCHIMEDES: in the normalized signature frame J=diag(s_i), s_i=+-1,
X_ii=i t_i, X_ij=z_ij=a+ib and X_ji=-(s_i s_j) conjugate(z_ij).
The trace pairing is diagonal in these real coordinates: -1 on
each t_i, -2 s_i s_j on each of a,b. Hence its absolute determinant
is 4^(n(n-1)/2) and its density is 2^(n(n-1)/2).
For the native DataCD.IsOmegaLeb, apply its exact realification
map (X,Y)->X+iY. A diagonal coordinate pair has absolute determinant
1. An off-diagonal pair (a,b,c,d) gives output
(a-d,b+c,-s(a+d),s(b-c)), where s=s_i s_j. Its real 4x4 determinant
has absolute value 4 for BOTH signs. Thus the total determinant is
4^(n(n-1)/2); pushing forward the product of two copies of
2^(n(n-1)/2) coordinate Lebesgue gives exactly ambient Lebesgue.
This identifies d_J,v with the native OmegaLeb at identity, with
no unproved cross-signature factor. In a general complex frame
conjugation preserves B by trace cyclicity. The source
CompactDualUnique.isOmegaLeb_unique and omegaDensity_unique give
uniqueness, and CDHaar.trick identifies the scaling with compact
rank n, not with arbitrary real-group measure normalization.

Optional explicit rank scalar: on compact U(n), the map g->g e_n
has stabilizer U(n-1). At the base vector its tangent quotient
has coordinates t_n and the n-1 complex off-diagonal entries.
The ratio of the trace densities on the two ranks is 2^(n-1),
exactly the coarea density of dx=2^n ordinary Lebesgue at
qf=1 (Euclidean gradient magnitude 2). By invariance these
agree on the whole unit sphere. The native sphereMass is
cM(n)=(2*pi)^n/(n-1)!, so, using Haar quotient integration,
d_n(U(n))=cM(n)*d_(n-1)(U(n-1)), d_0=1. Therefore the
native compact-dual probability normalization is
  a_n = (product_{j=1}^n cM(j))^{-1},
  cd(P,Q)=a_n*d_J,v when P+Q=n.
All factors are positive and finite. This is a HUMAN Lie-density
calculation; the native proof below only implements the exact
normalization adapter, not the entire coarea/invariant-form proof.

FINITE: for each v, the quadratic O_E,v/O_F,v algebra is finite
etale, including split places and unramified residue characteristic
two. In a lattice frame self-duality means the Hermitian pairing
is perfect. The integral unitary group scheme and its Lie algebra
become GL_n and M_n after the finite faithfully flat etale splitting
base change. In these coordinates B is the ordinary matrix trace
pairing, perfect even in characteristic two (matrix units have
dual transposed matrix units). Perfectness descends; hence the
determinant of B is a unit on the integral Lie lattice.
Do NOT divide a trace by two at dyadic places. The group scheme
is smooth by descent. With O_v volume 1, the corresponding
invariant density assigns the stabilizer K_v the exact mass
  #G(k_v)/q_v^(n^2).
Indeed reduction is surjective by smoothness/Hensel, each residue
class has mass q_v^(-n^2) by smooth local coordinates and left
translation. This is an ordinary finite-dimensional group-scheme
argument, not a claim to have compiled the source local-model
identification.

Put chi_v=+1 at split and -1 at inert v. Over k_v the group is
GL_n(q_v) or U_n(q_v). For GL_n count ordered independent columns.
For U_n let B_m count vectors of norm 1 in m dimensions and A_m
count norm zero. All nonzero norm values have equal counts, so
A_m+(q-1)B_m=q^(2m). The finite field norm has 1 preimage of zero
and q+1 of each nonzero value, giving
  B_m=(q+1)q^(2m-2)-q B_(m-1), B_0=0.
Thus B_m=q^(m-1)(q^m-(-1)^m). Choose an orthonormal basis one
vector at a time; the perpendicular complement is nondegenerate
and standard over the finite field. Multiplying B_m gives the
unitary group order. Both split and inert formulas give
  d_J,v(K_v)=product_{j=1}^n (1-chi_v^j/q_v^j).
The character lattice of the rational character module over the
splitting field is generated by det, with quadratic sign action.
The required degree-one local convergence factor is
L_v(1,chi)=(1-chi_v/q_v)^(-1), hence the EXACT cancellation
  L_v(1,chi)*d_J,v(K_v)
       = product_{j=2}^n (1-chi_v^j/q_v^j).
For n=1 the empty product equals 1. For fixed n, all factors are
positive and the product over finite places converges absolutely
to a strictly positive finite value, since sum_v q_v^(-2)<infty
(by absolute convergence of Dedekind zeta at 2; no RH needed).
The global Artin L(1,chi)=res(zeta_E,1)/res(zeta_F,1) is positive
finite by the ordinary class number formula. Same base field,
rank and determinant character module imply identical remaining
global discriminant and L normalization factors. Reference for
invariant differential-form product/convergence conventions:
https://encyclopediaofmath.org/wiki/Tamagawa_measure
Retain the standard choice of global factors and do not infer
convergence of the uncorrected j=1 product.

ASSEMBLY: write C(F,E,n)>0 for the standard global prefactor in
the Tamagawa convention. In the RUN38-39 calibration rectangle
R_W, using a positive finite cd-mass B_rho in each real factor,
  T_W(R_W) / product_rho cd(P,Q)(B_rho)
    = C(F,E,n) * a_n^(-[F:Q])
      * product_{v finite} product_{j=2}^n (1-chi_v^j/q_v^j).
All quantities on RHS are common to W and W0, exactly. Even the
absolute value of this RHS is unnecessary: it cancels at the
same-host volume ratio. This derives the common scalar at the
HUMAN mathematical level from the standard unramified group model,
trace density, coarea/Haar quotient and Tamagawa convention.
With the original RUN39 quotient identification and Kottwitz
inner-form Tamagawa invariance (RUN35 citation), this is the
candidate VolSigIndep argument. Rank zero separate trivial group.
Native source-to-algebraic-group model, normalized Haar and
coarea transport still need independent replay/audit; no claim
that the actual ASK-MAIN average or signed interval is proved.

Original source graph preserved: CompanionTheory.HU.volume_signature_independent
-> volSigIndep_of + siegel_mass_rank_one -> native volumeRatio and
retie_volTieG_and_cdScaleTie -> volMeas_fundDomain_eq_of_tiedIndep;
retain all rank-one mass/other exact consumers. Alternative graph:
DataCD.IsOmegaLeb + trace determinant -> local arch density;
native selfDualLatticeLemmas + etale perfect descent -> finite
density; determinant character + order recurrence -> corrected
product; RUN39 fixed-form quotient + inner-twist invariance +
scalar -> proposed actual VolSigIndep consumer. No globally retired
edge, preserve unexpanded type/value/constructor/axiom nodes and
all joint-loss/CountI/II/V/Vs/TopG premises. Cache by source/toolchain,
D/retie D, E/F, J, W, W0, frames, L, rank, local models, normalized
measures and exact consumer. Backtrack to native mass ratio if
any transport fails; no URT ranking needed.

Pinned source files retrieved:
src/Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222
src/Development/AbelianVarietyTheory/Proofs/HeightProofs/HaarUpqEqOfOmegaDensity.lean 7ba8c7d73a7e88a79c2d5587b7f39b5b6c9de7aa
src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/NonemptyCompactDualHaar.lean 6e208a716c68a908695eaabb59867bf2c01836af
src/Development/AbelianVarietyTheory/BlockTheory/GlobalSignature/PerpendicularEmbedding.lean cb6225aa41140e1afa7793358c31286dc350dce4
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/RealPlaceMeasures.lean 22959e77975996ed3d726b5d6839665781463ebe
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/PositiveDefiniteUnitSphereMassProof.lean 12e9b9a14208887d7daf4c9cf574ddc61514e27f
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/SelfDualLatticesUnramifiedPlaceNoHypothesis.lean 31be5f192e1cb2596fe53a2bfedad4beeebef357
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/CmLocalDensitiesProductFormulaStatement.lean 80b3214c7f1d3934771b312e3199bd003727f75d
src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdelicQuotientVolumeEqOfSignatureRankIndep.lean 5df13f58118a8edd91ceed1143cf20581f71a1ec
src/CompanionTheory/AutomorphicTheory/SiegelUnitTheory/VolumeSignatureIndependent.lean afe9722dfbc1755ed666f65e6ad326d2f9e6d448

Executed in local container, not synthetic RH tests:
SymPy exact determinant of realification block -4, both signs
absolute determinant 4, both trace blocks determinant 4.
Python exact Fraction arithmetic: q=2,3,4,5,7,8,9,11, n=1..12,
192 split/inert finite order and regularization checks, all
assertions succeeded; these only cross-check the explicit formulas,
not the local group-model identification or the infinite theorem.
Reproduction:
  B=0; U=1
  for n in range(1,13):
    B=(q+1)*q**(2*n-2)-q*B
    assert B==q**(n-1)*(q**n-(-1)**n)
    U*=B
    for chi,order in [(-1,U),(1,prod(q**n-q**i for i in range(n)))]:
      p=prod(Fraction(1)-Fraction(chi**j,q**j) for j in range(1,n+1))
      assert Fraction(order,q**(n*n))==p
      assert p/(1-Fraction(chi,q))==prod(Fraction(1)-Fraction(chi**j,q**j) for j in range(2,n+1))
Baseline CI status read b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode 0, exact
native engine runs 45577239749 and 45576756833. Not evidence for
this replacement. command -v lean/lake and local elan toolchain
directory yielded no paths. No new native proof/axiom log.
No registry or protected workflow edits. No full upstream HEAD
comparison in this run (pin unchanged).

RESUME HERE: independent audit the trace-density model at the
actual native self-dual lattice, including split and dyadic
places, and check global product conventions with literature
lane. Compile the compact-reference adapter below with the
existing pinned runner and batch RUN35-40; then use the actual
VolSigIndep consumer, retaining original proof and signed interval
fallback until verified. No more independent normalization
reparametrizations: move to the actual count/ASK-MAIN supplier
once the classical comparison is accepted or an exact gap is found.
HANDOFF TO integration, literature, kernel, audit and editor.
-/

noncomputable section
namespace RHPositivity40
open Formalism.BasicNotions MeasureTheory
open scoped ENNReal

-- Actual native compact-dual normalization consumer:
-- the candidate need only match the compact reference density.
-- Its positive/finite density guards come from CDHaar.trick.
theorem cd_of_matching_reference (cd : CDHaar) (P Q : ℕ)
    (ν : Measure (UpqT P Q)) (hν : ν.IsHaarMeasure)
    (a : ENNReal) (hνa : OmegaDensity ν a)
    (ha : OmegaDensity (cd.cd (P + Q) 0) a) :
    ν = cd.cd P Q := by
  obtain ⟨c,hc0,hct,hc,hcc⟩ := cd.trick P Q
  have e : a = c := GlobalTheory.CompactDualUnique.omegaDensity_unique ha hcc
  subst a
  first
  | (rh_reduce 2 using [GlobalTheory.CompactDualUnique.eq_cd]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact GlobalTheory.CompactDualUnique.eq_cd cd P Q ν
      (cd.cd (P + Q) 0) c hν (cd.haar (P + Q) 0)
      (cd.prob (P + Q)) hc0 hct hνa hcc

-- Algebraic cancellation of the degree-one convergence factor BEFORE
-- taking any infinite product. The finite tail is the only factor needed.
theorem cancel_first_factor (a b : ℝ) (ha : a ≠ 0) :
    (a * b) / a = b := by
  field_simp

rh_scan GlobalTheory.CompactDualUnique.eq_cd limit 2000
rh_scan CompanionTheory.HU.volume_signature_independent limit 2000
rh_scan cd_of_matching_reference limit 2000
rh_prune cd_of_matching_reference as RH40CDReferencePruned
#print axioms GlobalTheory.CompactDualUnique.eq_cd
#print axioms CompanionTheory.HU.volume_signature_independent
#print axioms cd_of_matching_reference
#print axioms cancel_first_factor
end RHPositivity40

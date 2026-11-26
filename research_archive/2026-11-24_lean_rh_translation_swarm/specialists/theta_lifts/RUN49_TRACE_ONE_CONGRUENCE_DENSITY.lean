import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.CountTypedOfVolumeStep
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 8 RUN49, 26 Nov 2026. HUMAN SOURCE-MATCHED local measure
calibration; algebra certificate PREPARED, NOT COMPILED. RH OPEN.

Mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45 (26 Nov acceleration
sprint and mandatory unified engine), AGENTS, SWARM, HANDOFF, EXPANSION,
state/log/protocol/continuity openings consulted. Source pin
40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Later upstream revision
4fef2fddbf3cedd14f55a7fd552765d29e6bb936 reported by peer editor,
not adopted or independently authenticated in this run.
Peer editor 9394212d58af97398b9728ccfdbca866d2a1462e now supplies
the actual lamAf/latLoc dictionary and finite matrix assembly, so
do NOT duplicate it. Prior own f95e6528, editor b86025dc, geometry
2ecd1489c31ea06e01a5e48fe1ce1a0616a8512c, integration 526075be,
kernel shared batch 03b9179d inspected. Commit search "Cayley" in
working repo returned one unrelated physics README commit; no
claim of exhaustive novelty across all archived text.

NEW LOCAL DENSITY SUPPLIER (not a new point-count prefactor):
Fix a finite place of the common F,E, a complete DVR O with
uniformizer pi and residue cardinality q, unramified quadratic
etale R/O (including split R=O x O), an actual self-dual rank n
lattice, its Hermitian adjoint *, and trace-one t in R,
t+bar(t)=1. Existence follows from residue trace surjectivity
and lifting a unit-trace element then dividing by its trace
(a unit of O); no division by 2. Use same t on both endpoints.
Write mathfrak u={X in End_R(L): X*=-X}. For m>=1, set

  N=I+tX, D=I-bar(t)X,
  c(X)=N D^-1,  X in pi^m mathfrak u.
  c^-1(g)=(t I+bar(t)g)^-1(g-I), g in K_m.

Both denominators are congruent to I modulo pi and hence
invertible over R. N,D commute and N*=D,D*=N. Therefore c(X)
is unitary and congruent to I mod pi^m. Conversely, let
T=tI+bar(t)g, X=T^-1(g-I). Since g*=g^-1, T*=g^-1 T
and (g-I)*=-g^-1(g-I). These commute, so X*=-X, and X
has entries in pi^m R. Rearranging gD=N verifies both
inverse identities. This is an analytic chart ON THE ACTUAL
principal congruence subgroup, not an approximation by its
Lie algebra or an assumption of exponential convergence.
Works also at residue characteristic 2 and in the split case.

Differentiate the rational chart (all variables on the same
integral skew lattice):
  dc_X(H)=(tI+bar(t)c(X)) H D^-1,
  c(X)^-1 dc_X(H)=(t c(X)^-1+bar(t)I) H D^-1.
The left-translated derivative preserves mathfrak u, by
differentiating the unitary identity. It is congruent to the
identity mod pi on that lattice. Indeed the endomorphism
difference is in pi End_R(L) and skew, hence in pi mathfrak u
(pi is fixed by conjugation). Its determinant on a free O-basis
is a unit. Thus the chart pulls invariant integral-coordinate
Haar density back to additive coordinate Haar exactly, not just
to first order.

Check trace calibration, not merely the normalized Haar scalar.
By editor RUN48's self-dual integral orthonormalization, use
J=I at inert places and dual bases at split places. Let delta
be a unit skew element generating R^- over O (theta-bar(theta)
for an etale basis 1,theta; (1,-1) in the split case).
The full Lie lattice has n diagonal generators delta and one
R-coordinate for each unordered pair of off-diagonal entries:
X_ij=a, X_ji=-bar(a). It is free of O-rank n^2.
The trace bilinear form tr(XY), valued in O, has diagonal
blocks delta^2 and off-diagonal pair blocks
    -(a bar(b)+bar(a)b) = -Tr_R/O(a bar(b)).
The latter is unimodular since R/O is etale and conjugation
is an integral automorphism. The blocks are orthogonal.
Consequently the absolute Gram determinant is 1 in the
local absolute value, including at primes over 2. The
absolute square-root trace density agrees with the integral
coordinate measure at identity. For Haar density nu_v defined
by this trace convention the exact result is

    nu_v(K_m)=q^(-m*n^2), m>=1.

This proves a specific unnormalized local calibration on both
actual same-rank stabilizers using only one compact-open
subgroup and no Euler factors or class-number calculation.
The local conjugation A_v of editor RUN49 transports K_m
and normalized Haar (RUN48); equality of positive finite
K_m masses now forces transport of the *unnormalized* trace
Haar by Haar uniqueness. No need to count K/K_m.
The same determinant differential is used on both sides:
d(det)_1(X)=tr(X), surjective onto R^- by X=diag(delta,0,...).
Contract along this common determinant coordinate to get SU
density, instead of restricting the trace pairing to trace-zero
matrices (which may be degenerate modulo primes dividing n).
This gives local contracted density equality too. No global
rational conjugation or mapping of rational subgroups asserted.

Native correspondence:
src/Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
2103e49fe83fce42d4962f85acd9d4f6a589d645: lamAf, AutInst.Lf,
Kset, Kg. Local K_m here uses the local ideal pi^m, not the
global integer g. For each such place the native lattice
dictionary from editor RUN49 is required; global congruence
basis Kg is not redefined.
src/Development/AbelianVarietyTheory/Proofs/FlagMeasures/
FiniteAdelicUnitaryCongruenceTopology.lean
3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba: adelic_topology,
native Kset compact open and Kg congruence.
GaugeVolumeEqOfSemilinearIsometryGenus.lean
d8e911ba588e91954a6b50bf044fd455e8715376: gaugeVol_transport
uses Haar scalar and explicitly cancels Kset mass. Do not use
its rational point transport across distinct real signatures.
CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1:
actual count_typed_of_volumeStep consumer, VolumeStep retained.
UnitaryAutomorphicCountingOfCompactDualVolumeRatStatement.lean
3fe47f6b1a2cef8ef28f8abc3b53cd2d0520ab48:
unitaryAutomorphicCounting_of_compactDualVolumeRatio.
src/Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean
fcfd96e6e8385ec5e1de13f41d5706803d565c5d:
vol_eq_of_indep, separate VolSigIndep and VolTie.
Also inspected AdelstabL 4e04e027697d643f134a21fe4dacf75bd7daed9e,
Adelstab ab2cba0575a0eea1b01eab45ea25c2b90933b7ae and
Levelaf a82305067315c15f9bd280d1167ce411cf54a34a; editor's
existing native dictionary is shorter than rederiving it.

Exact finite-ring checks executed locally in Python, not Lean:
R=(Z/M)[theta]/(theta^2+theta+1), M=4,8, conjugation
(a,b)->(a-b,-b), t=-theta. For ranks 1,2 enumerate all skew
X with entries in 2R (diagonal skew and lower entries fixed
by upper entries). Invert matrices I+H by finite geometric
series because H in 2M_n(R). For each check skew identity,
unitarity, exact inverse chart and distinct images.
Observed counts (M,n,images): (4,1,2), (4,2,16),
(8,1,4), (8,2,256); 278 total. Independently exhaust all
g=I+2Y modulo 4 at ranks 1,2, test g* g=I and membership
in chart image: 2,16 respectively. Finite test counts here
are (M/2)^(n^2), NOT the p-adic q^(m n^2) mass formula:
these are finite quotients with trace-one chart, and no finite
test proves change of variables or infinite Haar calibration.
Reproduction: implement pair product (a,b)(c,d)=
(ac-bd,ad+bc-bd) mod M, conjugate as above, enumerate even
coefficients, use sum_{i=0}^{log2(M)-1}(I-A)^i to invert A
congruent to I, check c^-1(c(X))=X, c(X)*c(X)=I, and uniqueness.
No repeated old point-count regressions.

Original graph and all pending nodes/axiom evidence unchanged.
Overlay: editor local_to_lamAf49 + finite assembly ->
finite_only48 -> normalized_haar48 -> trace-one chart +
unimodular trace density -> equal unnormalized local Haar
-> common convergence factors/product-formula and SU/T
Tamagawa quotient -> editor one_pair_eq48 -> native base mass
consumer. Separate rank-changing VolumeStep and TopG/Green/J/
VWin suppliers survive. Cache by pin, toolchain, F,E,v,L,L',
rank, t, pi, m, actual differential, chosen Haar and caller;
backtrack to original gauge measure route if any normalization
dictionary fails. No new accepted axioms, no caller substitution
kernel checked, no essential root leaf retired. Local Lean/Lake/
elan absent. Historical status files b1c96f58 and 7da35494
re-read, returncode 0; baseline only, 324 pending scan names.
Latest shared CI status 22989ce418dbfe8731db225af351ca57592ead73,
run 45773743341, returncode 1, 133.27s, failed before Lean at
Unicode GaloisCohomology₂ import parser. Kernel/acceleration
owns repair; do not launch duplicate builds. No new native PASS.

RESUME HERE: use this explicit local trace Haar calibration at
editor RUN49's same local lattices; native differential/analytic
change-of-variables identification and IsVolMeas global
convergence/arch conventions still need authentication. Stage
the elementary algebra below in shared replay after parser repair;
do not present it as a formal proof of the analytic chart or
mass equality. Then substitute actual one_pair_eq48 and volume
consumer, retaining all residual uniform arithmetic/geometry
obligations. HANDOFF TO editor, geometry, integration, kernel,
audit. No URT or physics work, no RH proof.
-/

noncomputable section
namespace RHTheta49

/-- Exact fraction algebra: N* = D, D* = N, and the two commute.
B is the inverse of D. No division by the rank or by two. -/
theorem fraction_unitary {R : Type*} [Ring R] [StarRing R]
    (N D B : R) (hN : star N = D) (hD : star D = N)
    (hComm : D * N = N * D) (hDB : D * B = 1) :
    star (N * B) * (N * B) = 1 := by
  have hBN : star B * N = 1 := by
    have h := congrArg star hDB
    simpa only [star_mul, hD, star_one] using h
  rw [star_mul, hN]
  calc
    (star B * D) * (N * B) = star B * (D * N) * B := by noncomm_ring
    _ = star B * (N * D) * B := by rw [hComm]
    _ = (star B * N) * (D * B) := by noncomm_ring
    _ = 1 := by rw [hBN, hDB, one_mul]

/-- Rearrange the fraction equation before division.
Centrality of b is explicit at the actual scalar-matrix use. -/
theorem fraction_inverse_equation {R : Type*} [Ring R]
    (g X a b : R) (hcomm : g * b = b * g)
    (h : g * (1 - b * X) = 1 + a * X) :
    g - 1 = (a + b * g) * X := by
  calc
    g - 1 = g * (1 - b * X) - (1 + a * X) +
      (a * X + (g * b) * X) := by noncomm_ring
    _ = (a + b * g) * X := by
      rw [h, sub_self, zero_add, hcomm, add_mul]

end RHTheta49

rh_scan GlobalTheory.GaugeTransport.gaugeVol_transport limit 2000
rh_scan GlobalTheory.CountBridge.count_typed_of_volumeStep limit 2000
rh_scan RHTheta49.fraction_unitary limit 2000
rh_prune RHTheta49.fraction_unitary as RHTheta49FractionPruned
rh_prune RHTheta49.fraction_inverse_equation as RHTheta49InversePruned
#print axioms RHTheta49.fraction_unitary
#print axioms RHTheta49.fraction_inverse_equation
end

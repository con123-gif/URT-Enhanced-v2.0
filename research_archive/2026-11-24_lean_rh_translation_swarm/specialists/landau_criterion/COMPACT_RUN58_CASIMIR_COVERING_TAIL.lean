import Lib.DiscreteSeries.FlenstedJensen.TailBounds

/-!
# RUN58 — direct generator Casimir bound, covering and tail at the B caller
26 November 2026. Human source-matched, independent audit and native replay pending.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb. RUN57 7d0755f32fad9615f6893bce60189c5990307e5f.
Latest manuscript 2eea9dc47d0e037627e4f4c1894f0bc86426454e.
Peer geometry bee7866c (conductor/ideal zeta, distinct), editor 9a920a1a,
dependencies 5321cfa7, prime 80b36408 and kernel 3e2e639b inspected.
No URT, no physics, no imported RH root, no global deletion.

## 1. Remove filtration growth at the actual s=0 consumer

Correct TailBounds path is Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean,
blob 3c13565c8bfecf91497747b0fe7cd7e39e50369c (RUN57 gave wrong directory,
same blob). The native norm_dsCoeff_sub_le uses norm_apply_le_of_mem_filtration
(CasimirGrowth.lean 46e437f11a82ea966051cc0edec3d6eaa2f9496b) only on the
generator at s=0. We can instead bound that generator directly.

Let n>=1, l have large gap, |l_i|<=L, beta=n+L+1, Lambda=l.lowestKType,
v=l.dsGenerator and rho=l.dsAction. SchurOrthogonality.lean
7be5411c2c4c3662db6f10be4c7fda7f63c27287 supplies
isKHighest_dsGenerator and isUnitaryCasimirGe_dsAction:
||v||=1, |y(g)|<=||y|| for every module vector, and invariant form
with full Casimir >= casimirValue(l). Retain these explicit inputs.
CasimirBound.lean f47bbb602c8e77086cbc4506f6580739716dd2b7 gives
inner_casimir, casimirK_eq_smul and abs_lowestKType_le.
Put P=sum_{same sign}||rho(E_ab)v||^2 and Q=sum_{opposite sign}||rho(E_ab)v||^2.
By the signed form and highest-weight property:
 P=casimirKValue(Lambda), P-Q>=casimirValue(l).
Hence the exact signed aggregate is
 P+Q=2P-(P-Q)<=2 casimirKValue(Lambda)-casimirValue(l).
RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea
defines casimirValue = sum(l_i^2-(2rho)_i^2)/4 >= -n^3/4.
Since |Lambda_i|<=L+n and |2rho_c,i|<=n,
 P<=n(L+n)(L+2n)<=2n beta^2.
Thus P+Q<=5n beta^2. For any complex matrix X, expand the Lie action
as sum X_ab rho(E_ab), use Cauchy-Schwarz once and |X_ab|<=||X||op:
 ||rho(X)v||^2 <= n^2||X||op^2 (P+Q)
               <=5n^3 beta^2||X||op^2 <= beta^10||X||op^2.
Last step uses n<=beta, beta>=2 and beta^5>=5.
This is the original sufficient beta^5 derivative budget. No need for
finite-dimensional filtration, highest weight selection in arbitrary
filtration levels or their spectral bound in THIS caller.
Those native declarations may be needed elsewhere, so no global deletion.

## 2. Explicit group curve and native coefficient Lipschitz inequality

Let g in U(J), A=g-I, a=||A||op. If a>=1, |psi(xg)-psi(x)|<=2
by norm_dsCoeff_le_one, which suffices. Otherwise for 0<=t<=1 let
 B=I+(1-t)A/2, N=I+(1+t)A/2, C=N B^(-1)=I+t A B^(-1).
Both B and N invertible by Neumann series (a<1).
The exact group relation A*J+JA+A*JA=0 gives
 N*JN-B*JB=t(A*J+JA+A*JA)=0.
Thus C in U(J), C(0)=I, C(1)=g; ||B^(-1)||<=2 and ||C||<=3.
U.norm_inv from Haar/UnitaryNorm.lean 8b8e1396db15092582d473497d7a29b3c1f43059
gives ||C^(-1)||=||C||. Because A,B,N commute,
 C'=A(I+A/2)B^(-2), ||C'||<=6a.
For X=C^(-1)C', ||X||<=18a, and X is tangent by differentiation
of C*JC=J. The same native chain rule hasDerivAt_curve
(RightDerivatives.lean 95d8ed76133c1019fcdcd95ac79988831eb45533,
lines 90-97) gives derivative of psi(xC(t)) as (rho(X)v)(xC(t)).
Section 1 and evaluation contraction bound its modulus by 18 beta^5 a.
Integrate on [0,1], retaining the native weaker constant:
 |psi(xg)-psi(x)|<=100 beta^5||g-I||op.
With psi(I)=1 this gives half_le_norm_dsCoeff at radius (200 beta^5)^(-1).
This is the actual original pointwise hypothesis, not an assumed uniform
bound on noncompact g or an estimate using a different matrix norm.

## 3. Covering bound with no injectivity/properness of j

Haar/RegularRepL2.lean 6a3f37e076f6d5fce2dc6943adf74cf3b003e7e8,
measure_ball_le_covering. Let j:S->U(J) a group homomorphism, nu right
invariant, y in U(J), D,R>=1, K>=3DR^2. Put F(s)=j(s)y and
S_R={s:||F(s)||<=R}; delta=1/(DR).
Choose a maximal delta-separated subset of the image F(S_R), and
one preimage s_i for each point. Any finite separated set has disjoint
open ambient operator-norm balls of radius delta/2, contained in ball
R+delta/2. The real dimension is 2n^2; translation invariance and
homogeneous scaling of Lebesgue measure bound its size by
 (1+2R/delta)^(2n^2) <= (3DR^2)^(2n^2) <= K^(2n^2).
Hence greedy selection terminates in finitely many steps and is maximal;
if S_R empty the conclusion is immediate. For n=0 the image is a point.
For every s in S_R, some i satisfies ||F(s)-F(s_i)||<delta
(or s itself is a center). Exact multiplication BEFORE the norm:
 j(s s_i^(-1))-I=(F(s)-F(s_i)) F(s_i)^(-1).
Since ||F(s_i)^(-1)||=||F(s_i)||<=R, s belongs to H s_i,
H={h:||j(h)-I||<=1/D}. Therefore
 nu(S_R)<=sum_i nu(H s_i)=#i nu(H)<=K^(2n^2) nu(H).
This uses right translations, not left; no j-injectivity or properness.
The measure inequality holds with outer measures as in the native
statement; the real-integral consumer has its own integrability guards.

## 4. Original measure/degree bounds and actual Gaussian caller

Choose D=200 beta^5 and K=2000 beta^6 R^2; K>=3DR^2.
On H, |psi(j(s))|>=1/2, so nu(H)<=4 integral |psi(j(s))|^2 dnu.
At y=I the preceding cover proves the exact native
measure_ball_le_integral_dsCoeff. No measure normalization changed:
 nu{||j(s)||<=R} <= 4 (2000 beta^6)^(2n^2) R^(4n^2)
                          integral |psi(j(s))|^2 dnu.
At compact Haar probability and R=1 all elements are included;
using native dsCoeff_of_mem_maxCompactU gives RUN57's exact
 1<=4 (2000 beta^6)^(2n^2) H0,
 H0=integral |weightMinors(Lambda,k)|^2 dk.
Actual New/DiscreteSeries/GaussianShape.lean
37f359a0100b2ed6b67b4256af5e976bbbb19259 lines 55-58
calls this bound; dsCoeff_gaussian_shape used twice in
New/DiscreteSeries/RestrictionLemma.lean 3d34e61d993473d314a9af56d55f0444a874aab6
lines 165-166 (IsTwoFactor.laplace_method).
Thus the coverage input of RUN57 is supplied under the retained
representation identities of section 1 and the compact coefficient identity.

For the adjacent native integral_tail_le use G=U(J), nu its Haar
measure, j=id. Let d=4n^2 and C=4(2000 beta^6)^(2n^2).
Let I=integral |psi(g)|^2, finite and positive by native memLp and
formalDegree_pos. Then nu{||g||<=R}<=C I R^d for R>=1.
For c>8n^2=2d, ||g||>=1. The nonnegative layer identity and Tonelli:
 integral ||g||^(-c) dnu
  = c integral_1^infty R^(-c-1) nu{||g||<=R} dR
  <= CI c/(c-d) <= 2CI.
Hence integrable, and multiplying by formalDegree=1/I and 2^c gives
 integral formalDegree*(2/||g||)^c <= 8(2000 beta^6)^(2n^2) 2^c.
This is precisely the original theorem and strict exponent guard.
No assumption of a finite total Haar measure on the noncompact group.

## Dependency/execution ledger
Original local source-level value path:
 dsCoeff_gaussian_shape -> measure_ball_le_integral_dsCoeff
 -> {measure_ball_le_covering,half_le_norm_dsCoeff}
 -> norm_dsCoeff_sub_le -> {norm_apply_le_of_mem_filtration at s=0,
 isUnitaryCasimirGe_dsAction,isKHighest_dsGenerator,hasDerivAt_curve}.
 integral_tail_le -> {measure_ball_le_integral_dsCoeff,integral_rpow_neg_le_of_layers,
 memLp,formalDegree_pos}.
Candidate replacement:
 {isKHighest_dsGenerator, invariant form, signed Casimir identity, eval bound}
 -> direct generator action bound -> Lipschitz -> half-ball;
 {ambient norm packing,right translation,isometric inversion} -> cover;
 {cover,half-ball} -> measure bound -> RUN57 normalization -> Gaussian -> Laplace.
 {measure bound,positive finite I,Tonelli} -> degree tail.
Scope: only local mathematical replacement, not an elaborated global graph;
all other representation, peak/energy, A/B/C, source and axiom obligations
remain. In particular isKHighest_dsGenerator, isUnitaryCasimirGe_dsAction,
dsCoeff_of_mem_maxCompactU, native Haar and smooth coefficient constructions
are not reconstructed here.

Local command -v lean and -v lake returned no executables. No native
rh_scan/prune/reduce/auto/frontier this run. Original baseline actual state
JSONs re-read: 45577239749 (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc)
and 45576756833 (7da354941e402b6f8b364ed03d8c5c82d27b7717) status pass,
returncode 0, original pin only. No new compact kernel or axiom evidence.
Scalar certificates below prepared for shared compact replay, uncompiled.

Executed local Python/SymPy/Fraction regressions:
A,t,P,Q symbolic, B=1+(1-t)*A/2, N=1+(1+t)*A/2:
 expand(diff(N,t)*B-N*diff(B,t)-A*(1+A/2))=0;
 expand((1+t)/2-(1-t)/2-t)=0;
 expand(((1+t)/2)^2-((1-t)/2)^2-t)=0;
 expand(2*P-(P-Q)-(P+Q))=0.
For n=1..100,L=0..100 (10100 pairs), beta=n+L+1:
 assert 2*n*(L+n)*(L+2*n)+Fraction(n^3,4)<=5*n*beta^2
 assert 5*n^3*beta^2<=beta^10.
For n=1..100,j=1..100 (10000 pairs), c=8*n^2+j:
 assert Fraction(c,c-4*n^2)<2.
All passed. These are scalar/symbolic regressions only, not native geometry
or evidence for universal prime estimates. No numerical surrogate matrices.

RESUME HERE: integrate sections 1-4 at actual Gaussian consumer and
audit signed Casimir identity and right translation orientation. Next derive
isKHighest_dsGenerator and compact coefficient identity using Borel
equivariance and normalized integral; retain full unitarity until its
Schur-orthogonality construction is reconstructed. Coordinate boxed-frame
and local Bessel band with geometry lane; no new endpoint redesign.
HANDOFF TO editor, integration, audit, kernel, geometry.
-/

namespace CompactRun58

lemma signed_casimir_budget (P Q K C : ℝ) (hP : P = K)
    (hC : C ≤ P-Q) : P+Q ≤ 2*K-C := by linarith

lemma generator_budget (n L b : ℝ) (hn : 0 ≤ n) (hL : 0 ≤ L)
    (hb : b = n+L+1) :
    2*n*(L+n)*(L+2*n)+n^3/4 ≤ 5*n*b^2 := by
  rw [hb]
  nlinarith [mul_nonneg hn (sq_nonneg L),
    mul_nonneg hL (sq_nonneg n), mul_nonneg hn (sq_nonneg n),
    mul_nonneg hn hL, sq_nonneg n]

lemma cover_radius_budget (D R : ℝ) (hD : 1 ≤ D) (hR : 1 ≤ R) :
    1+2*D*R^2 ≤ 3*D*R^2 := by
  have hr : 1 ≤ R^2 := by nlinarith
  have h : 1 ≤ D*R^2 := by nlinarith [mul_nonneg (sub_nonneg.mpr hD) (sub_nonneg.mpr hr)]
  linarith

lemma tail_layer_budget (c d : ℝ) (hd : 0 ≤ d) (hc : 2*d < c) :
    c/(c-d) ≤ 2 := by
  have hp : 0 < c-d := by linarith
  apply (div_le_iff₀ hp).2
  linarith

#print axioms signed_casimir_budget
#print axioms generator_budget
#print axioms cover_radius_budget
#print axioms tail_layer_budget
#check norm_dsCoeff_sub_le
#check measure_ball_le_covering
#check measure_ball_le_integral_dsCoeff
#check integral_tail_le
end CompactRun58

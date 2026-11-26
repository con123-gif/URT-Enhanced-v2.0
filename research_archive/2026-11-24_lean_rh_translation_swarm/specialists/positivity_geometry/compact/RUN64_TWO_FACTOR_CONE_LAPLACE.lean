import New.Filling.FillingData
import New.DiscreteSeries.RestrictionLemma
import Mathlib.Tactic

/-!
# RUN64 — the two-factor cone, absorption and Lagrange moments at B
26 Nov 2026. HUMAN SOURCE-MATCHED derivations, independent audit pending.
Lean certificate below prepared, not compiled. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first),
manuscript d6bcd68693074c5d4220541d68c61a222287cb42,
predecessor RUN63 fcb667eaa02d6661703a5cebf9905633e83e8a47.
Read AGENTS, protocol, handoff, expansion, current manuscript and
character RUN63 (9661d855, distinct C consumer). No physics or URT.

## 1. Near-diagonal reduction: exact real trace balance before norms
Actual IsTwoFactor.exists_near_one, with the original hypotheses.
Write g=j1(s), g'=j2(s), A=g-I, A'=g'-I, off_i the Frobenius norm
of the part connecting opposite signs. Let P be projection onto the
first zero-weight positive X block and Q=I-P. Suppose
off_1^2+off_2^2 <= e^2, 0<e<=1/100, B>=1.
The native norm_sq_add_re_trace_le with v=1_Q,w=-Lambda,a=B,C=3B
gives B||QA||_F^2-2Re tr(Lambda A)<=6B off_1^2. For the second
factor take v=0,w=Lambda',a=0,C=3B; it gives
2Re tr(Lambda' A')<=6B off_2^2. The purely imaginary phase gives
equality of the two real traces. Thus, before estimating either trace,
    ||QA||_F^2 <= 6 e^2.                         (1)
The same trace inequality with v=1_Q,w=-1_Q,a=-1,C=0 gives
Re tr(QA)>=-||QA||_F^2/2. These inequalities follow entrywise from
g^-1=J g* J and 2Re tr(W A)=Re tr(W A(1-g^-1)):
same-sign contributions enter with negative squared norms and
opposite-sign contributions with positive squared norms. The native
weights ensure a v_i^2<=w_i and w_i<=C for opposite signs.

Here is an ordinary polar-decomposition alternative to the native
Cayley correction, with the same conclusion and no stronger
hypothesis. In X+X^perp write g=[[a,b],[c,d]], J=diag(I,J_Y).
From (1), ||c||_F^2+||d-I||_F^2<=6e^2. The identity
a*a=I-c*J_Y c makes a invertible. Put H=(a*a)^(1/2), a=u H.
The X block can be empty, in which case the correction is the identity.
Left multiply by diag(u*,I), realized simultaneously in both factors
by the actual exists_diagonal. The new top-left block is H.
The spectrum of a*a lies in [1-6e^2,1+6e^2].
Hence ||H-I||_F<=||c||_F^2, and
Re tr(H-I)=-tr((H+I)^(-1)c*J_Y c)>=-||c||_F^2.
The mixed-block equation a*b+c*J_Y d=0 gives
||b||_F<=||a^-1||_op ||d||_op ||c||_F<=2||c||_F,
since e<=.01. Thus the corrected first T=g_new-I satisfies
||T||_F^2 <= ||c||_F^4+4||c||_F^2+||QA||_F^2
            <= 100 e^2.
Furthermore Re tr T>=-3||QA||_F^2/2>=-9e^2.
The native zero-weight block lemma for the simultaneous correction gives
||T'||_F^2+2Re tr T'<=2 off_2^2. Since trace_eq holds at the
corrected group element, ||T'||_F^2<=20e^2<=100e^2.
The two coefficients are unchanged by the zero-weight unitary
block, and its phase is zero (the diagonal weight times the
block difference is zero). By phase_mul the integrand is unchanged.
This proves the actual near-one conclusion with radius 10e, using
ordinary finite-dimensional polar decomposition instead of the
longer Cayley identity; the native zero-weight block lemma is retained.

The exact logarithmic phase identity is also transparent. For the
linear functional F on pairs of matrices, A_st=A_s+A_t+A_s A_t.
The additive phase and phase_eq imply F(A_s A_t)=0. Induction in k
(or the binomial expansion of A_{s^k}) gives F(A_s^k)=0 for k>=2.
For both norms <=1/2, absolute convergence of the logarithmic
series gives F(log(1+A_s))=F(A_s)=phi(s). Thus the product of
the two coefficient phases cancels e^(-phi(s)) exactly.
Use the native negative-parameter/conjugate coefficient identity
for the second factor as in RestrictionLemma (not conjugation
of a non-imaginary phase without justification).

## 2. Actual pointwise cone at RestrictionLemma.IsTwoFactor.laplace_method
Retain ALL its hypotheses: n,m nonempty, h gaps, B>=1, |l|,|k|<=L,
beta>=10^12, card n+card m+L<=beta, h>=10^30 T^3 with
N=(card n+card m)^2, T=N log beta, proper j1, continuous j2,
right invariant measure finite on compacts and native lip.
Let theta=laplaceIntegrand, G=2/||j1(s)||_op, E=exp(-100T),
e=10^(-13)/T, D=beta^(-50N)*G^(8N).
The native coefficient power decay gives |theta|<=G^c for
all natural c<=18N. The imaginary phase has modulus one.
We prove the exact native inequality
       (1/2)|theta| <= Re theta +16D.           (2)
If |theta|<=D it is immediate from Re theta>=-|theta|.
Otherwise G^(18N)>=|theta|>beta^(-50N)G^(8N), so G>beta^-5
and D>beta^(-90N)>=E. This is only a scalar comparison; it
does not assume a lower bound on the integrand.

Far case: put x=off_1^2, y=off_2^2. The two native fourth-power
coefficient bounds yield |theta|^4<=((1+x)(1+y))^-h.
Their determinant supplier follows from
det(I+O*O)=product(1+lambda_i)>=1+sum lambda_i
and the actual block-diagonal Gram identity
A* A=I+O*O, where A is the sign-diagonal part and O is
the opposite-sign part. Retain norm_dsCoeff_sq_mul_det_pow_le_one.
If x+y>e^2, then (1+x)(1+y)>1+e^2 and
  -log |theta| >= h log(1+e^2)/4
                >= h e^2/8 >=1250T>=100T
(for theta=0 the conclusion is automatic). We used
log(1+u)>=u/2 for 0<=u<=1. Thus |theta|<=E<D,
contradicting the non-small case. No norm of a complex
sum was substituted for its real part.

Near case: apply section 1 with e, so both corrected
Frobenius differences <=10e. In the native GaussianShape theorem,
delta=10e satisfies delta*T=10^(-12), T>=1 and each
dimension squared and dimension squared times log(dim+L+1)
is <=T (other dimension is nonempty). After exact log-phase
cancellation, theta=(a+x)(c+y), with a,c in [0,1],
|x|<=a/10+E, |y|<=c/10+E. The actual GaussianShape theorem
is an essential supplier, not assumed as an asymptotic.
With E<=1,
 |theta-ac| <= a|y|+c|x|+|x||y|
             <= .21 ac + 2.2 E + E^2 <= .21 ac+3.2 E.
Therefore |theta|/2-Re theta <= -.185ac+4.8E <=16D.
This proves (2) in every case, with explicit slack but unchanged
native constant. This is the scalar cone certificate below.

## 3. Integrate and ABSORB the tail; supply the actual peak caller
Put V=nu.real{||j1(s)-I||_op<=1}. It is finite by properness.
For R=beta+1,D0=200 beta^5, apply the native covering bound
to the block sum j1+j2. Its operator norm is max of the two.
The original lip condition places the V-ball within the R-ball.
The real dimension of the ambient complex matrix space is 2N.
A maximal D0^-1/R-separated set in the R-ball has at most
(3D0 R^2)^(2N) elements by the volume of disjoint norm balls.
Every uncovered point is within D0^-1/R of some center;
multiplying on the right by its inverse, whose norm <=R
by the unitary-sign identity, puts it in the small identity
ball. Right invariance now gives the covering inequality.
Since 3D0 R^2<=beta^8, this gives
  V <= beta^(16N) nu.real{max_i ||ji(s)-I||_op<=D0^-1}.
On that small ball the actual half_le_norm_dsCoeff (operator
norm) gives both coefficient norms >=1/2, so |theta|>=1/4.
The cone (2) yields a pointwise majorant of the small-ball
indicator by 8(Re theta+16 beta^(-50N)G^(8N)), also outside
the ball where (2) gives nonnegativity.
Proper j1 and the native integral_decay_le at 8N>8 card n^2
give integrability and integral G^(8N)<=16^(8N)V.
Also theta integrable by the same majorant of its absolute
value G^(8N). Thus
 V <= 8 beta^(16N) Re integral theta
        +128 beta^(-34N)16^(8N) V.
Because beta>=10^12, N>=1,
8 beta^(16N)<=beta^(20N)/2 and
128 beta^(-34N)16^(8N)<=1/2.
Absorb the V/2 term, bounding the real part by absolute value
only at the final step. The native conclusion is exactly
       V <= beta^(20N) |integral theta|.         (3)
This supplies La at Data.exists_besselSystem lines 85-93 with
beta=b^3 and compact second group (operator norm one).
The exponent in b is 60N. Use the SAME x, l,u,j and graph
measure as RUN63. This is the missing peak-Laplace input there,
conditional on the precise GaussianShape/decay and frame
suppliers, not a second independent Bessel model.

## 4. Lagrange moments for the actual frame (first half of construction)
At IsSteep.exists_isTwoFactor_besselPairHom write n0=rho+1,
m0=2n0, t_i=Lambda_i-a, i=0,...,m0-1, with t_i<0 strictly
decreasing integers. Nodes x_0=0,x_(i+1)=t_i. Define
c_j^2=(-1)^j product_(k!=j)(x_j-x_k)>0 and take c_j>0.
Strict integral node separation implies c_j>=1.
Taking the leading coefficient in the exact Lagrange interpolation
formula for each monomial of degree d<=m0 gives
 sum_j (-1)^j x_j^d/c_j^2 = 1_(d=m0).
Thus sum_i (-1)^i t_i^d/c_(i+1)^2
       = 1_(d=0)/c_0^2 - 1_(d=m0).
This is the actual moment identity hc used for the columns C
of BesselExistence, not a numerical fit. Let v_j be the non-X
column with entries c_0^(0^j) t_i^j/c_(i+1) (0^0=1 in the
exponent). Then the signed Gram pairing is 1 at j=k=0,
zero for 0<j+k<m0, and -1 at j+k=m0 when j,k>0.
The X columns are orthonormal and disjoint from these.
In particular all Gram tests j+k<=2rho at the native hC
follow exactly. The actual source constructs the Witt extension
using the dual columns and its unitriangular determinant one.
Retain that specific determinant/nondegenerate extension check
and the subsequent besselSize_le_of_dual caller; no assertion
that the full matrix of all moment columns is unitary.

For j>=1 the norm satisfies ||p v_j||_2^2<=m0 b^(5j),
because p is unitary, c_i>=1 and t_i^2<=b^5 (the native
3B+a<=2b^2 and b>=8n0). For j=0 the source instead uses
the exact Gram identity, not this bound. On the moment columns
Lambda v_j=a v_j+v_(j+1) for j>=1 and
Lambda v_0=a v_0+c_0 v_1. On X the weight is zero.
These are the exact shift relations d in BesselExistence after
the chosen q=g p maps the relevant columns to Y.
The remaining flag triangularity of
q diag(Lambda) q^-1-besselCharMatrix, the exact phase trace,
Witt determinant and dual-frame size comparison must be
derived at the native caller before this frame is complete.
The moment derivation alone does NOT establish existence
of the required x or phase.

## 5. Source / audit / surviving frontier
Actual source blobs, all at the compact pin:
New/DiscreteSeries/RestrictionLemma.lean 3d34e61d993473d314a9af56d55f0444a874aab6
New/DiscreteSeries/TwoFactorSetup.lean fe2191cfa7eadc8683787a881a5f2fa16a9a0667
New/DiscreteSeries/GaussianShape.lean 37f359a0100b2ed6b67b4256af5e976bbbb19259
New/DiscreteSeries/MinorExpansion.lean 772d0fa5ac3e3b6bfbd4cf90c181e3e1ad359acb
New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad
Lib/DiscreteSeries/Haar/RegularRepL2.lean 6a3f37e076f6d5fce2dc6943adf74cf3b003e7e8
Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c
New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
FramedCoefficient.exists_lagrange_weights statement retrieved via search;
the interpolation proof above is independent.
Original graph: MinorExpansion -> GaussianShape -> TwoFactorSetup
and RestrictionLemma -> BesselExistence/actual Laplace caller ->
FillingData -> BesselCut -> BesselSystem/Moments -> B.
Reduced human route: exact trace balance -> polar correction -> exact
log-phase -> cone -> absorption -> same La -> RUN63 peak and cut.
No deletion from original graph; retain all shared suppliers,
GaussianShape/MinorExpansion, coefficient determinant/decay, properness,
Haar, frame/Witt/dual size and the separate Rallis/Siegel-Weil callers.
Cache context compact pin, actual IsTwoFactor l,k,j,phi, nu, beta, T,
and same x at FillingData; no cross-frame reuse or root import.
No native lean/lake/elan available (local PATH check). Old-pin
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier not executed in
compact toolchain. Re-read actual primitive CI results blob
088cd2ec0e935ee1a282f10096949bcf671cc804: six named probes
TiltingLemma/Moments with propext, Classical.choice, Quot.sound;
module_1_build timeout 124, all_requested_checks_ok=false,
full_RH_replay=false. No fresh native PASS or removed axiom.
Scalar certificate below prepared, independent audit required.

RESUME HERE: derive GaussianShape.dsCoeff_gaussian_shape from the
actual MinorExpansion, including the normalized compact K integral
and uniform large-remainder bound, then the actual Witt dual-frame
and triangular phase trace in BesselExistence. Integrate (1)-(3)
at the SAME Data.exists_besselSystem caller and RUN63 peak/cut.
HANDOFF TO integration/editor, positivity, audit and compact replay.
Human RH reconstruction incomplete.
-/

namespace CompactGeometryRun64

/-- Pure real scalar implication of the product-error cone. -/
theorem near_cone (a c E D u v : ℝ)
    (ha : 0 ≤ a) (hc : 0 ≤ c) (hE : 0 ≤ E) (hDE : E ≤ D)
    (hu : u ≤ (121/100 : ℝ)*a*c+(32/10 : ℝ)*E)
    (hv : (79/100 : ℝ)*a*c-(32/10 : ℝ)*E ≤ v) :
    u/2 ≤ v+16*D := by
  nlinarith [mul_nonneg ha hc]

/-- Small absolute value branch; valid before integration. -/
theorem small_cone (u v D : ℝ) (hu : 0 ≤ u)
    (hd : u ≤ D) (hv : -u ≤ v) : u/2 ≤ v+16*D := by
  linarith

/-- Explicit absorption, with the sign of the integrated real part
handled only by the nonnegative upper bound J. -/
theorem absorb (V C E I J : ℝ) (hV : 0 ≤ V)
    (hC : 0 ≤ C) (hJ : 0 ≤ J) (hIJ : I ≤ J)
    (hE : E ≤ 1/2) (h : V ≤ C*I + E*V) : V ≤ 2*C*J := by
  have h₁ := mul_le_mul_of_nonneg_left hIJ hC
  have h₂ := mul_le_mul_of_nonneg_right hE hV
  linarith

#print axioms near_cone
#print axioms small_cone
#print axioms absorb
#check IsTwoFactor.exists_near_one
#check IsTwoFactor.phase_logOneAdd
#check IsTwoFactor.laplace_method
#check dsCoeff_gaussian_shape
#check IsSteep.exists_isTwoFactor_besselPairHom
#check Data.exists_besselSystem
#print axioms IsTwoFactor.laplace_method

end CompactGeometryRun64

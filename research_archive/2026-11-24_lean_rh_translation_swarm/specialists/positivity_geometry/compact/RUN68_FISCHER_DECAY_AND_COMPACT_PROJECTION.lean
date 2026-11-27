import Lib.DiscreteSeries.FlenstedJensen.PsiDecay
import Lib.DiscreteSeries.FlenstedJensen.KTypeProjection
import New.Filling.FillingData
import Mathlib.Tactic

/-!
# RUN68 — Fischer decay and compact projection at the actual Bessel consumer
27 Nov 2026. Human source-matched derivations; independent audit/native replay
pending. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src. Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
manuscript 944957c6f43b63df7a845472b31492dc0ca1cb8f. AGENTS,
protocol, handoff and expansion inspected; predecessor 3209e00b and recent
peer commits 885b65aa,8193aed7,2422c248,b1d63411 have distinct consumers.
Actual caller Data.exists_besselSystem in New/Filling/FillingData.lean
(0ef8b0dfe13173b16bd0a8820a4924f10124e278, as pinned in RUN67),
via isIdempotentKernel_psiInFrame, exists_isBesselFunction and BesselCut.
RUN67 explicitly retained PsiDecay and KTypeProjection. Discharge their
human analytic argument here without assuming a discrete series exists.

## 1. Exact Fischer inequality on a threshold strip
PsiDecay.lean 2ca9efe4949fe0b10512153a3562daf2b97d2edf,
norm_dsCoeff_sq_mul_det_pow_le_one, norm_dsCoeff_le_pow.
RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea;
CasimirBound.lean f47bbb602c8e77086cbc4506f6580739716dd2b7;
ExpSurjective.lean deeeab7538decdb54fc968a3ca9d762ca75b94e8.
Let J=diag(epsilon), z positive Hermitian in U(J), q=blockDiagPart z.
Then det z=1, z^-1=JzJ, q=(z+z^-1)/2 positive definite.
For subset S let d_z(S)=det z[S,S], d_z(empty)=1. Jacobi gives
d_z(S^c)=d_z(S), since the inverse is sign-conjugate and det z=1.
Write m_w=weightMinors w with the exact finite product
m_w(z)=(det z)^a prod_{a<t<=b} d_z({i:w_i>=t}), bounds a<=w_i<=b.
In particular m_{-w}(z)=m_w(z^-1)=m_w(z), NOT a reciprocal.
w=paramAddRho l=(l+2rho)/2 and v=w+c, 0<=c<=h an integer.
Native gap only constrains opposite-sign indices, not all pairs:
if l_i>l_j and epsilon_i!=epsilon_j then l_i-l_j>=2h;
twoRho l top is increasing in l, so w_i-w_j>=h>=c.
For each integer t let S={w>=t}, T={v>=t}, D=T minus S.
All D indices have the SAME sign: their w's belong to [t-c,t),
so no opposite pair can differ by >=c. Empty D allowed, c=0 allowed.
Therefore q[D,D]=z[D,D]. Two applications of Fischer to disjoint sets
give the single threshold inequality (all determinants positive):
  d_q(T)/d_q(S) <= d_q(D)=d_z(D)=d_z(D^c)
                        <= d_z(S)d_z(T^c).
The first inequality is Fischer on q[T,T]; the last on z[D^c,D^c].
No triangle estimate, and no false assumption that D has at most one index.
Multiply over a common finite threshold interval containing w and v.
The determinant factors on q cancel in the quotient and det z=1;
Jacobi converts d_z(T^c) to d_{z^-1}(T). Consequently
  (det q)^c = m_v(q)/m_w(q)
            <= m_w(z)m_v(z^-1)=m_{-w}(z)^2.                 (F)
This is the source's exact pointwise minor inequality, independent of
all representation-theoretic existence theorems.

## 2. Uniform coefficient decay and polar norm
PsiBasic.lean d888fafb9db9b1a5e78aa2551a1480f0cf057d20;
BlockDiagonalDet.lean b1d55df3cc9904149bc6a767a07a3e21970b600b.
For g=k z polar, k in K=U(J) intersect U(n), apply (F) to u^-1 z u
for each u in K. The block diagonal determinant is unchanged by k
or u (in modulus), denote it d>0. The native polar formula has numerator
m_Lambda(k u) conj m_Lambda(u), denominator m_{-w}(u^-1 z u),
and normalization C=int_K |m_Lambda|²>0 for probability Haar.
The denominator is positive and >=d^(c/2); Cauchy-Schwarz and left
Haar invariance yield
 |psi(g)| <= (1/(C d^(c/2))) int |m_Lambda(k u)||m_Lambda(u)| du
           <= d^(-c/2).
Thus |psi|² d^c<=1 exactly, and c=0 gives |psi|<=1.
For R=||g||=||z||>=1, z and z^-1 have the same spectrum (J conjugacy).
If R>1, eigenvalues R and 1/R are distinct and both occur.
q=(z+z^-1)/2 has these two eigenvalues replaced by (R+1/R)/2;
all its other eigenvalues >=1. Hence det q >=((R+1/R)/2)^2 >=(R/2)^2.
For R=1 use q=I. Nonempty index type as in source norm bound.
We obtain
                 |psi(g)| <= (2/||g||)^c.                   (D)
This supplies RUN67 uniform L1/L2 and degree-tail estimates with the
actual exponent c<=h and no new loss. The polar formula depends on the
splitting identity below.

## 3. Splitting independence by exact infinitesimal cancellation
FlenstedJensenInvariance.lean 46f4a4931a139742e73fc43f519da651ed680233,
flenstedJensen_eq_of_accretive, dsCoeff_eq_flenstedJensen.
MinorEquivariance.lean 062b3ebed0519f48edeb7853533ed8ccdda4370a.
Fix g in U(J). Consider all block diagonal a for which g^-1 a is
accretive (positive Hermitian part); this is convex in the real matrix
space. It is equivalent to a^-1 g accretive, since the Hermitian part of
an inverse is the conjugate of the original Hermitian part by the inverse.
Both a and the relevant minors are invertible. Using m_{-w}(x)=m_w(x^-1),
the unnormalized integral is int_K Phi(a,k) dk, where
 Phi(a,k)=m_Lambda(a k) m_Lambda(k^-1) / m_w(k^-1 g^-1 a k).
On K the inverse factor is exactly the conjugate factor. Use rational
extension in a and k to differentiate; compactness of K ensures local
uniform nonzero denominators and justifies integration of derivatives.
For a block diagonal direction X put Y=k^-1 a^-1 X k. Its entries are
zero across opposite signs. Write D_ij Phi for the a-direction a k E_ij k^-1.
For l_j<=l_i, right triangular semi-invariance of m_Lambda and m_w
gives D_ij Phi=delta_ij (Lambda_i-w_i) Phi. The weights are dominant
for order -l within each sign block, as in source.
For the remaining pairs l_i<l_j of equal sign, complexify the
right-K Lie derivative in direction E=E_ij. This is legitimate because
the complexified Lie algebra of K is the full block diagonal algebra,
and the rational integrand is holomorphic near K. Directly on I+tE,
E²=0: m_Lambda((I-tE)k^-1)=m_Lambda(k^-1), and the left factor
I-tE in the denominator drops by opposite triangular semi-invariance
(det diagonal=1). Thus this k derivative of Phi equals D_ij Phi.
The same direction differentiates Y_ij to [Y,E]_ij=Y_ii-Y_jj.
Right Haar invariance for real Lie derivatives, extended complex-linearly,
then yields int_K [Y_ij D_ij Phi+(Y_ii-Y_jj)Phi] dk=0.
Sum over equal-sign pairs l_i<l_j. Their diagonal coefficient in
sum(Y_ii-Y_jj) is -twoRho_c. Hence the integral of the full a derivative is
 int_K sum_i [(Lambda_i-w_i)+twoRho_c(i)]Y_ii Phi dk=0.
The bracket vanishes EXACTLY by Lambda=w-twoRho_c. Integrate along a
line segment in the convex domain to obtain splitting independence.
The canonical splitting blockDiagPart g is admissible by the native
unitary polar identity; for g=k z, a=k admissible with a^-1g=z>0.
This proves the normalized polar expression used in section 2.
No assumed Schur orthogonality in this derivation.

## 4. Compact torus constant term — actual lowest K-type consumer
KTypeProjection.lean f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a,
integral_conj_weightMinors_mul_dsCoeff at nu=Lambda, the sole instance
needed for RUN67 projector. HolomorphicExtension.lean
2cfbf29e001ad5906736dcadbecc9a3cde9b538d:
eventually_exists_torus_entire_factor, IsHolOfWeight.circle_mean_weightMinors.
Here are the local factor and circle step, not an appeal to existence
of a discrete-series representation.
For injective integer order o and near-identity block diagonal y use
ordinary Gaussian elimination in order o: y=L B, L unit lower triangular
(only entries o_i>o_j off diagonal), B invertible upper triangular.
Existence near identity follows from nonzero leading pivots; L,B vary
rationally and continuously there. If d(s)=diag(s^o), then on |s|=1
 d(s)y=A(s)d(s)B, A(s)=I+sum_{o_i>o_j}s^(o_i-o_j)L_ij E_ij.
A polynomial, A(0)=I, uniformly close to I on the closed disc for y
near I. Dominant minor weights have m_w(y)=diagChar_w(B), by
triangular semi-invariance on both sides. This proves the source
entire-factor statement (also for the single full block epsilon'=1).

For F(h)=m_nu(v h) with v in K, the same factorization of near-identity
h gives F(d(s)h) d(s)^(-nu)=F(A(s)) m_nu(h) in the disc extension
(the diagonal character notation is multiplicative).
Multiply by any q(s) holomorphic near the closed disc; circle averaging
gives q(0)m_nu(h)F(I). Extend from h near I to any h in K by
h(t)=exp(tX) for skew-Hermitian block diagonal X, using real analytic
identity on R. Compactness of the circle gives analyticity of the
averaged expression; minors of these unitary block matrices may vanish
for general weight, but dominant weight expressions are products of
nonnegative powers of leading minors times integer powers of the
nonzero full block determinants. Thus there are no poles on this path.
This is precisely the needed special case of native circle mean.
(The broader source holomorphic coefficient-map theorem is not claimed.)

For x,b in G, a=blockDiagPart x, X=a^-1 x, m=m_Lambda, P=m_{-w}.
Take b near I. Splitting a k for x k b is admissible uniformly in k
by compactness. Expand psi in its compact integral, replace k j by u,
j by v, and use Haar invariance and m_nu(k^-1)=conj m_nu(k):
 C int_K conj m_nu(k) psi(x k b) dk
  = int_{K²} m_nu(v u^-1) m(a u) conj m(v)
                   / P(u^-1 X u v^-1 b v) du dv.            (E)
All denominators stay nonzero by accretivity, compact Fubini valid.
Set nu=Lambda, o=-l. Replace v by v d(s) and average over circle.
For y=v^-1 b v near I, use above factorization in FULL matrix block
with order -o (since -w is dominant for that order):
 d(s)^-1 y d(s)=A(s)d(s)^-1 B d(s).
Right triangular equivariance of P makes its denominator factor
P(u^-1 X u A(s))*diagChar_{-w}(B), the latter independent of s and
equal to P(y). A(s) uniformly near I; u^-1 X u accretive uniformly
in u, so this expression is nonzero on closed disc. The torus factor
conj m(v d(s))=conj m(v) d(s)^(-Lambda) cancels the circle weight
of m_nu(v d(s) u^-1) EXACTLY for nu=Lambda.
Apply the preceding circle mean with F(h)=m_nu(v h), h=u^-1
and q(s)=1/P(u^-1 X u A(s)). The right side of (E) becomes
 [int_K m(a u) m(u^-1)/P(u^-1 X u) du]
 [int_K m(v) conj m(v)/P(v^-1 b v) dv]
 = C² psi(x) psi(b).
For b near I the splitting I is admissible for b itself. Divide by C>0.
For arbitrary b choose a real analytic group path b(t) from I to b
(native exists_analytic_path; polar decomposition and exponentials).
Both sides are real analytic on R, by compact parameter analyticity and
analyticAt_dsCoeff on G. Equality near t=0 extends to t=1.
This proves the exact native lowest-type statement
 int_K conj m(k) psi(x k b) dk = C psi(x) psi(b).
It is (P) in RUN67, giving the Schur convolution and formal degree
normalization without assuming the eventual representation.
The other K-types in the full source theorem are not pruned globally.

## Dependency and verification ledger
Original source-visible branch: FillingData -> BesselExistence/BesselCut
 -> SchurOrthogonality -> KTypeProjection, PsiDecay -> FlenstedJensenInvariance,
 PsiBasic, HolomorphicExtension, BlockDiagonalDet, MinorEquivariance.
Replacement: same caller -> exact threshold (F), polar Cauchy-Schwarz
 and paired eigenvalues, splitting infinitesimal cancellation, compact
 circle constant term -> finite matrix Fischer/Jacobi, Gaussian elimination,
 Haar invariance, compact integration of analytic families, circle mean and
 analytic identity theorem. These are standard mathematical facts with
 explicit uses above; no new axiom asserted. General K-type/holomorphic
 representation lemmas, generator/Casimir/smearing and deeper Siegel-Weil,
 Rallis still retained where used. Original/reduced shared graphs unchanged;
 this is a local human dependency bridge, not elaborated global pruning.
Lean/lake absent in local container (command -v returned no paths).
No new Lean or rh_scan/rh_prune/rh_reduce/rh_auto execution. Below scalar
certificate and named native declaration/axiom probes are prepared, not compiled.
Existing CI jobs 45799225653,45577239749,45576756833 freshly retrieved;
pick/run/record each success. They do NOT verify this file.
No finite numerical experiment used as proof. No claim RH manuscript done.

RESUME HERE: at actual FillingData Bessel consumer integrate RUN68 with
RUN67 and RUN63. Inspect the remaining SchurOrthogonality smearing and
generator/Casimir supplier at its actual derivative order, and distinct
Siegel-Weil/Rallis theorem hypotheses. Do not repeat Fischer or circle
mean; check the exact accretive/triangular conventions independently.
HANDOFF TO: integration/editor, literature and formal audit.
-/

namespace RHPositivityRun68

-- Scalar step after the two actual Fischer inequalities and Jacobi.
theorem threshold_ratio_le (qS qT dD zS zTc : ℝ)
    (hS : 0 < qS) (hF : qT ≤ qS * dD) (hJ : dD ≤ zS * zTc) :
    qT / qS ≤ zS * zTc := by
  apply (div_le_iff₀ hS).2
  calc
    qT ≤ qS * dD := hF
    _ ≤ qS * (zS * zTc) := mul_le_mul_of_nonneg_left hJ hS.le
    _ = zS * zTc * qS := by ring

end RHPositivityRun68

#check norm_dsCoeff_sq_mul_det_pow_le_one
#check norm_dsCoeff_le_pow
#check integral_conj_weightMinors_mul_dsCoeff
#check flenstedJensen_eq_of_accretive
#print axioms RHPositivityRun68.threshold_ratio_le
#print axioms norm_dsCoeff_sq_mul_det_pow_le_one
#print axioms norm_dsCoeff_le_pow
#print axioms integral_conj_weightMinors_mul_dsCoeff
#print axioms flenstedJensen_eq_of_accretive

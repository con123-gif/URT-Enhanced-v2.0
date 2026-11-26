import Lib.DiscreteSeries.CuspKernel.SchurOrthogonality
import Lib.General.LinearAlgebra.BlockDiagonalDet
import Mathlib.Tactic

/-!
# RUN60 — circle-mean projection, Fischer decay, accretive splitting
26 November 2026. Human derivations, not a native replay. Source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src.
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
RUN59 45aa6830a1834a2a943c41130f48f38860914a67.
Latest peer commit summaries c3b2fad4 (local Tate), 3392d9c7 (A flag),
46483cc0 (Hecke pairing), 6328abd9 (C reciprocity), c2c5b63c (editor);
distinct from this B chain. No URT or final RH import.

Source blobs under Lib/DiscreteSeries/FlenstedJensen:
RepresentationDefs 94fea15fbc65ed74c2a44e83dda2cd423d39fbea;
FlenstedJensenInvariance 46f4a4931a139742e73fc43f519da651ed680233;
PsiBasic d888fafb9db9b1a5e78aa2551a1480f0cf057d20;
KTypeProjection f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a;
PsiDecay 2ca9efe4949fe0b10512153a3562daf2b97d2edf.
Holomorphic/HolomorphicExtension 2cfbf29e001ad5906736dcadbecc9a3cde9b538d;
Holomorphic/MinorEquivariance 062b3ebed0519f48edeb7853533ed8ccdda4370a;
Lib/General/LinearAlgebra/BlockDiagonalDet b1d55df3cc9904149bc6a767a07a3e21970b600b;
CuspKernel/SchurOrthogonality 7be5411c2c4c3662db6f10be4c7fda7f63c27287.

Notation G=U(J), K=G intersect U(n), J=diag(epsilon), Haar(K)=1,
mu=lambda+rho, Lambda=mu-2rho_c, l=2lambda, native HasGap(h).
m_w(A)=product over integer t of det A[{w_i>=t}], divided by det A
for t<=0 (only finitely many nontrivial factors). All uses are in
the domains where necessary principal minors are nonzero.
c_Lambda=int_K |m_Lambda(k)|^2>0 (continuity and value 1 at identity).
The parameter parity makes mu integral; opposite signs imply
|lambda_i-lambda_j|>=h, and mu strictly respects the l-order.

## 1. Accretive splitting independence (actual theorem)
Write z=a^-1 g, a block diagonal, z accretive (positive Hermitian part).
Inverting preserves accretivity: Re(z^-1)=z^{-*} Re(z) z^-1.
Thus H=k^-1 g^-1 a k accretive. All principal compressions and
their inverses are nonsingular. On the convex open set of block
diagonal a with Re(g^-1 a)>0, the integral's numerator/denominator
can be written as
   Phi(a,k)=m_Lambda(a k)m_Lambda(k^-1)/m_mu(H).
This follows from m_{-w}(z)=m_w(z^-1) (Jacobi complementary
minors) and conjugation on K. The original normalized FJ integral
is int Phi/c_Lambda. For fixed a let Y=(a k)^-1 X k, X any block
diagonal variation. Phi is holomorphic in a and in the complex
block diagonal k near K. Compactness and nonzero denominators
justify all differentiations under the K integral.

Put T={(i,j):eps_i=eps_j, l_i<l_j}. Let D_{ij}Phi be the a
derivative in direction a k E_ij k^-1. For the complementary
triangular directions l_j<=l_i, the right Borel identity for
m_Lambda and m_mu (both dominant for -l) gives
   D_{ij}Phi=delta_ij (Lambda_i-mu_i) Phi.
For (i,j) in T, put B=I+tE_ij. Both B^-1 and B are unipotent
triangular for l, so left opposite-Borel semi-invariance gives
   Phi(a,kB)=Phi(a k B k^-1,k).
Indeed m_Lambda(B^-1 k^-1)=m_Lambda(k^-1), and
m_mu(B^-1 H B)=m_mu(H B); the first numerator factor is identical.
These are local holomorphic identities, not an assertion kB in K.

The right derivative on K along any compact real Lie algebra
direction integrates to zero by Haar invariance. By holomorphic
extension the same holds for its complex span, including E_ij.
Apply this to Phi(a,k)Y_ij(k), using
   (d/dt) (B^-1 Y B)_ij at 0 = Y_ii-Y_jj.
Hence
   int Y_ij D_{ij}Phi = -int Phi (Y_ii-Y_jj).
Sum over T BEFORE taking any norm. The coefficient of Y_ii is
#same-sign lower l minus #same-sign higher l = 2rho_{c,i}.
Adding the complementary triangular derivatives cancels exactly:
   D_X int Phi = int Phi sum_i (Lambda_i-mu_i+2rho_{c,i})Y_ii = 0.
The convex domain is connected, so the integral is constant there.
This is the full splitting-independence argument, with the original
normalization. In particular psi(g)=FJ(a,a^-1g) for every admissible
a, not just blockDiagPart(g). Analyticity near g follows by using
the analytic splitting a=blockDiagPart(g), uniform accretivity and
compact integration; no representation existence used.
Borel identities used above follow because the threshold index sets
of a dominant weight are initial segments in each relevant block;
the triangular column or row operation multiplies the restricted
determinant by the product of the corresponding diagonal entries.
For opposite Borel transpose. The det normalizers give diagChar.

## 2. Lowest K-type projection, exact normalization
Actual consumer SchurOrthogonality.integral_mul_dsCoeff_translate
uses only nu=Lambda of integral_conj_weightMinors_mul_dsCoeff.
We prove that instance, retaining the same arbitrary x,b in G.
Write a=blockDiagPart(x), z=a^-1x, m=m_Lambda, d=m_{-mu},
c=c_Lambda. Choose o=-l, injective. Let b(t) be a real-analytic
path in G, b(0)=I,b(1)=b (polar decomposition and compact
exponentials give such a path on all real t). It suffices to
prove the projection near t=0: both sides analytic on R by
compact integration and the local holomorphic psi just proved.

For b=b(t) near I the admissible splitting of x u b is a u
for u in K: u^-1 z u b remains accretive uniformly by compactness.
Expand psi using this splitting and put j=u k in the inner
integral, preserving product Haar measure. Since conj m(u)=m(u^-1),
   c int_K conj m(u) psi(x u b) du
     = int_{KxK} m(k j^-1) G(j,k,k^-1 b k) dj dk,        (1)
   G(j,k,y)=m(a j)conj m(k)/d(j^-1 z j y).
Let D(s)=diag(s^{o_i}) on |s|=1. Average (1) under k->kD(s);
the numerator conj m(kD(s)) acquires s^{-o dot Lambda}.
For each k, factor b_k=k^-1 b k=L C near I using lower
unitriangular L and upper triangular C for order -o (ordinary
Gaussian elimination, pivots nonzero near I). Then
   D^-1 b_k D = A(s) D^-1 C D,
   A(s)=D^-1 L D,  A(0)=I.
Indeed for each strict lower entry relative to -o, o_j-o_i>0,
so A has polynomial entries and is uniformly near I on the
closed disc when b is near I. This convention is equivalent to
the source factorization with order -o for the denominator.
The denominator is dominant for -o and its Borel semi-invariance
extracts diagChar(-mu,C)=d(b_k) (opposite left unipotent invariance).
Consequently the circle-integrand in (1) is
   m(k D(s) j^-1) s^{-o dot Lambda} q(s),
   q(s)=G(j,k,A(s))/d(b_k).
There are no denominator zeros on the closed disc: uniform
accretivity of j^-1 z j times A(s); hence q is holomorphic on
a neighbourhood of the disc.

For clarity the elementary circle-mean identity being used is
   mean_s m(k D(s) h) s^{-o dot Lambda} q(s)
     = m(k)m(h) q(0), h in K.                            (2)
To prove it first take h near I: factor h=L'C' with L' lower
unitriangular for order o, C' upper triangular, so D L'D^-1
is polynomial, equals I at 0, and is near I uniformly on disc.
Right Borel equivariance removes s^{o dot Lambda} diagChar(Lambda,C')
and the latter equals m(h) by opposite-left unipotent invariance.
The remaining holomorphic function m(k D L'D^-1) q(s) has
circle mean its value at 0. Extend from h near I to all h in
K along compact real-analytic exponential paths (K is a product
of connected unitary groups). For all real t, the circle matrices
are unitary, but individual principal minors CAN vanish:
m_Lambda on block diagonal matrices is polynomial in the nested
principal minors per sign, times integer powers of the two
block determinants, by compact dominance. This makes the
expression analytic on the block diagonal invertible group even
when individual minors vanish. Same observation justifies all
uses of m_Lambda in sections 1 and 2. For d and m_mu the
accretive domain makes all principal minors nonzero.

Insert h=j^-1 in (2), with q as above. The double integral
becomes exactly
   [int_K m(a j)conj m(j)/d(j^-1 z j) dj]
   [int_K |m(k)|²/d(k^-1 b k) dk]
   = c² psi(x) psi(b).
For b near I, its admissible splitting is I, so the second equality
uses section 1. Divide by c and extend along b(t). Thus
   int_K conj m_Lambda(u) psi(x u b) du = c psi(x)psi(b). (P)
No off-cone exclusion is needed at this caller; other consumers
of the nu!=Lambda clause are NOT deleted. To extend (P) to
that clause the same torus average inserts s^N, N>0, so q(0)=0,
with a separating order satisfying the native rootCone hypothesis.
This latter choice is not required for RUN59.

## 3. Complementary-minor decay (both native inequalities)
For z positive definite in G, det z=1 and z^-1=JzJ; hence
det z_{U^c}=det (z^-1)_U=det z_U for each subset U (Jacobi).
Put Q=blockDiagPart(z)=(z+z^-1)/2>0. For integer c0>=0 <=h,
v=mu+c0, S_t={mu_i>=t}, T_t={v_i>=t}, D_t=T_t minus S_t.
D_t has a single sign, or is empty: its mu entries lie in
[t-c0,t), whereas opposite-sign mu differences are at least
c0 (in fact at least c0+1 if c0>=0). Thus Q_D=z_D.
Fischer on Q at S_t,D_t and on z at disjoint S_t,T_t^c yields
   det Q_T/det Q_S <= det Q_D = det z_D
        = det z_{S union T^c} <= det z_S det z_{T^c}.   (F)
All determinants positive; no division by a possibly zero minor.
Multiply over t (finite nontrivial factors); normalizers in the
ratio for Q cancel and det z=1. Translation of thresholds
m_{mu+c0}(Q)/m_mu(Q)=det(Q)^c0 gives
   det(Q)^c0 <= m_mu(z) m_{mu+c0}(z^-1)=m_{-mu}(z)^2.  (D)
Here the last equality uses det z=1, z^-1=JzJ and Jacobi, not
the false claim that m_{-mu}(z)=1/m_mu(z).
Use (D) on u^-1 z u; Q determinant independent of u. Polar
formula psi(pz) with p in K and Haar invariance now give
   |psi(pz)| <= det(Q)^(-c0/2)/c_Lambda
                * int |m(pu)m(u)| du
             <= det(Q)^(-c0/2)
by Cauchy-Schwarz (both L² norms squared c_Lambda).
The determinant modulus of blockDiagPart(pz) equals det Q.
This proves norm_dsCoeff_sq_mul_det_pow_le_one with original
constant 1, including c0=0.

For nonempty n, if ||z||=r>1, its spectrum contains r and
1/r as distinct eigenvalues since z^-1=JzJ. Q has eigenvalues
(q+1/q)/2>=1. Therefore det Q >= ((r+r^-1)/2)^2 >= (r/2)^2.
For r=1, z=I by reciprocal pairing, Q=I and inequality holds.
Since ||pz||=||z||, this gives sq_le_norm_det_blockDiagPart
and |psi(g)| <= (2/||g||)^c0. No dependence on lambda in
the constants. This is precisely the decay used to establish
RUN59's integrability BEFORE formal degree is defined.

## Local dependency ledger and integration
Original static edges: RepresentationDefs -> MinorEquivariance ->
FlenstedJensenInvariance -> PsiBasic -> KTypeProjection and
BlockDiagonalDet -> PsiDecay -> SchurOrthogonality ->
TailBounds -> GaussianShape -> RestrictionLemma.IsTwoFactor.laplace_method
-> Bessel peak (RUN55) -> B enough_forms -> star_inequality.
HolomorphicExtension (analytic path, torus factor, circle mean)
feeds PsiBasic and KTypeProjection. Source-matched human replacement:
triangular minor identity + complementary Jacobi + compact derivative
-> splitting -> polar formula; ordinary local LU + analytic
continuation -> (P); Fischer + reciprocal eigenvalues + Cauchy-Schwarz
-> (D) and decay -> RUN59 Schur, L², Casimir -> RUN58/57.
All are mathematical derivations of the specified local consumers,
not a new kernel dependency export. No global edge deletions; the
other K-type projection clause and all other B/A/C primitives
remain visible. Earlier source still has independent callers of
holomorphic extension. Standard finite-dimensional Fischer,
Jacobi, analytic identity theorem, Haar, LU and compact/polar
decomposition retained as explicit conventional foundations.
Native earlier positive polar/inversion identities are not replaced
elsewhere; for this chain follow PsiBasic by splitting and Haar.

Local lean/lake absent (command -v both returned no path).
Historical CI jobs 45577239749, 45576756833, 45799225653
all re-read as successful; these are not verification of RUN60.
No new native replay, no finite diagnostic claimed, no new axiom
ledger or rh_scan/prune/reduce/auto/frontier execution. Below
is an uncompiled scalar certificate and actual native query set
for shared bounded replay, not a replacement proof term.
Maintain earlier original/reduced graph and axiom evidence.

RESUME HERE: trace remaining B coherent-link energy and boxed
frame separation at actual native consumers; coordinate with
geometry lane. First audit this circle projection and Fischer
bridge against source; integrate RUN59 with RUN60, not another
reformulation of the endpoint. Check remaining nontrivial
holomorphic-extension consumers before deleting any branch.
HANDOFF TO integration/editor, formal audit, compact kernel lane.
Human RH reconstruction incomplete.
-/

namespace CompactRun60

lemma split_diagonal_cancel (mu rho y : ℝ) :
    ((mu - 2 * rho) - mu + 2 * rho) * y = 0 := by ring

lemma commutator_entry (yij yii yjj t : ℂ) :
    yij + t * (yii - yjj) = yij + t * yii - t * yjj := by ring

lemma spectral_pair_lower (r u : ℝ) (hr : 0 ≤ r) (hu : 0 ≤ u) :
    (r / 2)^2 ≤ ((r + u) / 2)^2 := by
  nlinarith [mul_nonneg hr hu, sq_nonneg u]

#print axioms split_diagonal_cancel
#print axioms commutator_entry
#print axioms spectral_pair_lower
#check flenstedJensen_eq_of_accretive
#check integral_conj_weightMinors_mul_dsCoeff
#check norm_dsCoeff_sq_mul_det_pow_le_one
#check norm_dsCoeff_le_pow
#check sq_le_norm_det_blockDiagPart
#print axioms flenstedJensen_eq_of_accretive
#print axioms integral_conj_weightMinors_mul_dsCoeff
#print axioms norm_dsCoeff_sq_mul_det_pow_le_one
#print axioms norm_dsCoeff_le_pow

end CompactRun60

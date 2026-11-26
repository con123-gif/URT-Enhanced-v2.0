# Complex Haar normalization and the geometric shell support

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION; independent mathematical
audit and native replay outstanding. This is supporting mathematics for the
RH reconstruction, not a claim of a complete human proof.

Source: Alpöge–Sernau and collaborators,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0 and Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

The actual consumer is ComplexShells.formConst_mul_lintegral_le. Peer
2e075352 (RUN54_SHELL_CAP_SUM.lean) already supplies its scalar shell sum.
The present note supplies the Haar comparison and the head/back-substitution
geometry that this peer explicitly retains. Use the SAME complex Level,
floor measures, heads and gauges as in the Fourier/descent note.

Write h=varrho, n=h+1, k=dim X0, r=k+2n-1. Put

    sigma_k = 2 pi^k/(k-1)!,
    V_j = product_(i=1)^j sigma_i,
    a = V_k/V_r,        c_G = a sigma_k.

H=U(X0) has probability Haar measure. The ambient Haar measure dy is the
compact-dual normalization in CompactDualMeasure, not an arbitrarily
rescaled Haar measure. The unipotent measures below use the source's free
complex entries and imaginary diagonal entries, with their specified
Lebesgue measures.

## 1. The two elementary Jacobians

For an n by n complex matrix, Gaussian elimination off its zero leading
minors gives

    Z = x* diag(c_0,...,c_h) y,
    dZ = product_(a<h)|c_a|^[4(h-a)] dc dx dy,          (H1)

where x,y are upper unitriangular. These coordinates cover the complement
of a complex algebraic null set. To see the exponent without a measure
convention, eliminate the first row and column. The two complex vectors
each undergo multiplication by c_0 in n-1 coordinates; together they
contribute |c_0|^[4(n-1)]. The remaining block is translated by their
outer product, which has Jacobian one. Induction proves (H1).

The other Jacobian is the unitary double-coset chart. Set F=frameCols,
F'=dualFrameCols, delta=1-|(Z^-1)_(h,h)|^2, and

    Omega = {det Z != 0, delta>0},
    g(Z) = |det Z|^2 delta.

The latter is also |det Z|^2 minus the squared modulus of its leading
h by h minor. In particular Omega={g>0}. Let gamma_Z be the source's
explicit sectionMatrix on Omega. Here are formulas sufficient to fix
the chart and its normalization: D(t)=diag(1,...,1,t), W=Z*,

    Y(Z,W)=D(0)-I-D(0)W^-1 [I-D(1/2)]Z^-1 D(2),
    S=(F Y(Z,W)+F'D(sqrt(delta)))Z,
    gamma_Z=I+(S-F)F*
                +(F W^-1-S Y(W,Z))D(delta^-1/2)F'* - F'F'*.

Multiplication shows gamma_Z* J gamma_Z=J and F*J gamma_Z F=Z:
on the span of F,F' this is the equality of the Gram matrices of

    [ Z^-1, Y(W,Z)Delta ; 0,I ] ,
    [ Y(Z,W), W^-1 Delta ; D(sqrt(delta)),0 ],
    Delta=D(delta^-1/2);

on its orthogonal coordinate complement gamma_Z is the identity. Thus
these formulas define an actual element of G, smoothly on Omega.

Use q,v in U0, the unipotent subgroup fixing F, and the source Cayley
charts C(theta) in H/U(k-1), C(eta) in H. The chart is

    (Z,theta,q,eta,v) ->
        q C(theta) gamma_Z (v C(eta))^-1.             (H2)

Here theta is the one-column skew coordinate, with complementary skew
block zero. Its real dimension is 2k-1, not k^2. This removes the
U(k-1) stabilizer. Together the real dimensions are

    2n^2+(2k-1)+2[2hk+h^2]+k^2 = r^2.

The absolute logarithmic Jacobian of (H2) is

    g(Z)^(k-1) d_k(theta) d_k(eta),                   (H3)

where d_k(t)=|det(I-skew(t)/2)|^(-2k), the compact Cayley density.
For completeness the determinant computation is as follows. Define

    M(A,B)=F[(A Delta-I)F*+B Delta F'*],
    K=I+M(Z^-1,Y(W,Z)),  R=I+F'(F-F')*.

The section formulas give gamma_Z K=R+M(Y(Z,W),W^-1).
In the F,F' block, K is upper triangular with diagonal
Z^-1 Delta,I, hence |det K|^2=g(Z)^-1. Congruence by K on
r by r skew-hermitian matrices therefore has real determinant g(Z)^-r.
This last identity follows by diagonalizing its singular values: each
diagonal skew coordinate contributes one squared singular value and each
off-diagonal complex coordinate the product of two squared values.

Read the logarithmic derivative in the following blocks: F'*AF; the
one-column skew coordinates of the X0 block with x_(k0) replaced by z;
the X0-to-isotropic and isotropic skew blocks; and the corresponding
right-hand blocks, with their signs reversed. This is the coordinate
permutation used by chartCoords; it preserves Lebesgue measure. After
the congruence by the left factor times K and determinant-one block
shears, its diagonal factors are:

| Block | Linear map or determinant |
| --- | --- |
| Z | E -> (W^-1 Delta)* E (Z^-1 Delta), determinant g(Z)^(-2n) |
| left one-column H | determinant d_k(theta) |
| left U0 | unitary right multiplication on its complex block and identity on its skew block; determinant modulus one |
| right H | determinant d_k(eta) |
| right U0 | the corresponding unitary multiplication and identity; determinant modulus one |

One can check the block elimination directly using

    T(eta,b,c)=(C eta+D b)C*+(D skew(c)-C b*)D*,

where C=definiteCols and D=dualCols: T M(A,B)=0 and
M(A,B)*T=0. Differentiating F*J gamma_Z F=Z gives the Z block in
the table. The remaining blocks are the differential of q C(theta)
and v C(eta); their strictly off-diagonal terms are shears. For a
complex n by n variable, E->AEB has real determinant modulus
|det A|^(2n)|det B|^(2n), giving the displayed g^-2n.
Dividing by the congruence determinant g^-r leaves
g^(r-2n)=g^(k-1), which proves (H3).

The chart is injective on Omega. First recover Z by its frame Gram.
Acting on F Z^-1 Delta then recovers q and the k0-th column of
C(theta); its Cayley column chart is injective. Cancel these factors
to recover v and C(eta) by their unipotent and X0 blocks. The ordinary
Cayley chart is injective. This is why the full left H cannot be used
as an additional independent chart coordinate.

The intrinsic Haar density at the identity in skew coordinates is
1/V_r, by the defining Cayley density of dy. Consequently the smooth
change-of-variables formula applied to the injective chart gives a
lower bound for its integral in G, with no assertion that this chart
covers G. Integrate the right H coordinates to obtain V_k. The
remaining one-column density has integral sigma_k. Indeed at complementary
block zero its denominator is

    [(1+|w|^2/4)^2+t^2/4]^k,  (t,w) in R x C^(k-1);

integrating first t and then w by polar coordinates gives
2 pi^k/(k-1)!. This also covers k=1, when w is absent.

It follows that, for measurable f>=0, if for EVERY k0 in H

    L <= c_G integral_Omega g(Z)^(k-1)
                   integral_H integral_U0 integral_U0
         f(u k0 gamma_Z (v h0)^-1) du dv dh0 dZ,      (H4)

then L<=integral_G f dy. To justify the quantifier, average (H4) over
the probability one-column density; (H3) is exactly the resulting
chart integral. This is the precise lower-bound interface
SobolevCell.le_lintegral_of_gramSection.

## 2. The tower has the required finite Haar ratio

Let eta_a be the Heisenberg measure of floor a, theta_a the floor
measure of the SAME complex Level, U its Bessel unipotent group,
nu=upperMeasure 0, and M=groupMeasure. Ordered multiplication of
eta_0,...,eta_(h-1) gives exactly mu_U: at each step the newly introduced
free entries have coefficient one, with polynomial translations in
earlier entries. This is a triangular change of real coordinates with
Jacobian one, including the imaginary central coordinate. It proves
ascConv_heisenbergMeasure_eq_besselHaar with no additional scalar.

Commuting a lower Heisenberg factor through the higher floors gives

    M=mu_U * nu.                                     (H5)

These are identities of S-finite nonnegative measures, so Tonelli
applies before finiteness is known. The last compact factor has
probability mass one. Right invariance of M uses only the level
construction, not an assumption that M is already locally finite:
theta_a pushes sigma to sigma^-1 f_(a+1) with exactly the invariant
quadric measure; a left-translation in H_a preserves that measure.
The residual stabilizer action is in Q_(a+1). Thus for a left
Q_(a+1)-invariant integrand the floor integral is right Q_a-invariant.
Induct from the compact last floor, commute eta_a with H_(a+1), and
factor H_a as the next floor group and its radical. This proves
stackMeasure_mconv_dirac, and hence right invariance on H_0=G.
Quadric invariance here follows from invariance of Lebesgue measure
and of its defining hermitian function under an isometry of determinant
modulus one; its flat-chart Leray disintegration has that normalization.
Every floor is nonzero, so M is nonzero.

Uniqueness of invariant S-finite measure gives M=lambda dy with
0<lambda<=infinity initially. Finiteness must still be proved.
Use f=1_{||g||<=2}. This has a finite positive Haar integral, because
the norm sublevel is compact and contains a neighborhood of 1.
It is invariant under inversion (g^-1=Jg*J, J a hermitian involution)
and left/right H, whose matrices are ordinary Euclidean unitaries.

The cell laws appearing when (H5) is expanded have densities

    d_a(c)=|c|^[2(k-1)+4(h-a)]                 (a<h),
    d_h(c)=sigma_k (|c|^2-1)_+^(k-1).                (H6)

The latter follows by the ordinary complex polar formula for the
hyperboloid at the top floor. Its support has |c|>1 up to a null
boundary (k>1 under RealPlaceSizes). The lower laws follow directly
from the Weyl density and the Heisenberg chart. For
Z=x*diag(c)y on this support,

    g(Z)=product_(a<h)|c_a|^2 (|c_h|^2-1),
    a product_(a<=h)d_a(c_a)
        = c_G g(Z)^(k-1) product_(a<h)|c_a|^[4(h-a)]. (H7)

This is an exact identity, including the factor 2 in sigma_k.

To compare the test integral to (H4), use the explicit representatives
g(c)=weylElem(h,c) cellChart(h,c_h). Their frame Gram is diag(c).
The full ordered cell convolution is their inverse law with density
product d_a. Split each U factor into its unitriangular frame part
and U0. Formula (H1) supplies the Z integral, and (H7) supplies its
density. For every resulting group element gamma with frame Gram Z,

    gamma=q h gamma_Z (q' h')^-1,  q,q' in U0, h,h' in H. (H8)

Here is the exact reason (H8) applies: on Omega the combined frame
(F,gamma F) has invertible hermitian Gram. The block Gram is
[[D(0)-I,Z],[Z*,D(0)-I]], whose invertibility follows from
det Z!=0 and delta>0 by a Schur complement. Its isometry to the
corresponding frame for gamma_Z extends by Witt's extension theorem.
The two frame stabilizers are U0 semidirect H, yielding (H8).

All replacements in these U0 integrals preserve their specified
Lebesgue Haar measure: inversion does so for a unipotent group;
translation does so; conjugation by H acts unitarily on the complex
block; and conjugation by the unitriangular frame group is unipotent,
with determinant one. Thus (H8) can be substituted inside the joint
integral, not merely at the level of marginal frame-Gram laws. The
remaining H factors disappear by the bi-H and inverse invariance of f.
For every left k0 the right side of (H4) is at least a integral f dM.
All integrands are nonnegative. By (H4),

    a integral f dM <= integral f dy.

Since 0<integral f dy<infinity and M=lambda dy, this proves

    0<lambda<infinity,       a lambda<=1.            (H9)

Finally, for EVERY measurable left-U-invariant F>=0, (H5) and the
quotient disintegration of dy give

    integral F dnu = lambda integral_(U\G) F d(mu_quot). (H10)

A way to avoid cancelling infinite invariant integrals is to choose
a measurable cutoff beta with integral_U beta(ug)du=1. Apply (H5)
to F beta, then disintegrate lambda dy. Tonelli gives both sides of
(H10), even if their common value is infinite. Such a cutoff exists
for the closed subgroup U by Haar quotient disintegration.

Equations (H5), (H9), (H10) give ALL fields of haarRatio_spec. They
do not identify lambda with one. In the shell caller, the cancellation
is instead

    formConst = (V_k/V_r)/(lambda card I)^2,

and it is valid because lambda is positive finite and I is nonempty.

## 3. The early columns come from actual head minors

Use a size filtration B_i as in Size. Products add exponents; a sum
of at most r+1 terms costs one exponent; minus and star preserve it.
For the complex gauge B_i={|z|<=L^i}, these rules hold since L>=rho>=8r.
A matrix product costs i+j+1; inversion in U(J) costs at most i+4,
by J^-1 A*J. Expansion by one row gives: a t by t matrix of size 7,
t<=h, has determinant in B_(8t). These rules are also valid over the
source's general size ring.

Suppose s g and eta w_p^-1 g lie in a box of matrix size one, with
s,eta in Q_j, j<=h. Set E=(s g)(eta w_p^-1 g)^-1=s w_p eta^-1;
its entries have size seven. Let D_t=product_(a<t)p_a. The minor
of E in columns e_0,...,e_(t-1) and rows
e*_0,...,e*_(t-2),i is

    det E_(these rows,columns) = D_t s_(i,e*_(t-1)).  (S1)

Indeed eta^-1 acts upper unitriangularly on the first t isotropic
vectors, with determinant one; w_p sends those vectors to p_a e*_a;
the first t-1 dual rows of s in these columns are the identity.
The determinant is consequently its last entry times product p_a.
This proves (S1), rather than assuming bounds on s from nearness.

The determinant bound gives D_t s_(i,e*_(t-1)) in B_(9n), and taking
i=e*_(t-1) gives D_t in B_(9n). The head hypothesis is precisely
D_t^-1 in B_1 for EVERY 0<=t<=j. Therefore

    p_a=D_(a+1)D_a^-1,  p_a^-1=D_a D_(a+1)^-1,
    s_(i,e*_a)=D_(a+1)^-1 [D_(a+1)s_(i,e*_a)]

all have size 10n for a<j. This proves the actual
head_entries_mem_ofSize, with the same p, s and box.

## 4. Back substitution does not assume a bounded unipotent

Let u belong to N_<j, let r0 be a star-fixed unit of size one, and
suppose for each a<j there is a test vector w_a whose first a+1
dual coordinates are delta_(a,b), with w_a and

    X w_a in B_c,       X=(I-u)/r0.                 (S2)

The elementary substitution fact used twice is this. If a row of a
matrix A is bounded by B_d in the nondual columns and the dual columns
with index at least j, and A w_a has size d, recover its remaining
dual entries in descending a. Writing

    A_(m,e*_a)=(A w_a)_m
                    -sum_l A_(m,l)(w_a-e*_a)_l

costs at most c+3 exponents per step. At stage i the bound is
d+(c+3)i; all coefficients in the sum are already known because
the earlier dual coordinates of w_a vanish. This is a triangular
induction, not an inverse-matrix norm assumption.

Apply it first to X in rows selected by a nonzero J_(row,column)
for an initially known column. Triangularity of N_<j makes their
initial entries zero; (S2) supplies the test products. Their bound
is c+(c+3)j. The unitary identity

    J[(I-u^-1)/r0] = [(I-u)/r0]* J

then bounds all initially known columns of X'=(I-u^-1)/r0 by
c+4+(c+3)j. This uses star(r0)=r0 and the Gram/inverse bounds;
it would not hold with an arbitrary complex r0.

Now use w'_a=u w_a=w_a-r0 X w_a. It has size c+2 and the same
normalized initial dual coordinates, and X'w'_a=-Xw_a has size c.
A second descending substitution therefore gives

    X' has matrix size c+4+(2c+8)j.                 (S3)

This proves hasMatSize_one_sub_inv including its exponent and its
star-fixed-unit premise. Only r0=1 is used below.

## 5. The actual floor-value witnesses supply (S2)

Take heads p,q at j for a gauge S and a larger gauge Gamma.
Assume every element of S-size 10n has Gamma-size one if j!=0.
Suppose

    A=u X,  B=v(XY) lie in the SAME level box,
    u,v in U,  B-A has Gamma matrix size two,
    w_p^-1 X and w_q^-1(XY) are near at j.

For each a>=j suppose c_a!=0 lies in floorValues(a,X,Y),
with c_a^-1 of Gamma-size one. Put u0=v u^-1 in U=N_<h.
We construct the tests for (S3), with c=6 and j there replaced by h.

For a<j use w_a=u e*_a. Section 3 and the two near conditions
bound its entries and those of v e*_a by Gamma-size one. Thus
w_a and (I-u0)w_a have size at most two. Its initial dual
coordinates are the required ones by the unitriangular row law.

For a>=j let z witness c_a in floorValues and write
b1=X^-1 z, b2=(XY)^-1 z. Both b1 and b1-b2 lie in the actual
level ball; they have Gamma-size one. Set

    w_a=c_a^-1 u z=c_a^-1 A b1.

It has size at most four and the required initial dual coordinates.
Moreover

    (I-u0)w_a
       =c_a^-1[(A-B)b1+B(b1-b2)],                  (S4)

which has size at most six. Every witness here is drawn from the
SAME pair (X,XY); none is chosen from an unrelated fibre.

By (S3), I-u0^-1 has size 10+20h=20n-10. Since B=u0 A Y,

    Y-I=A^-1[(B-A)-(I-u0^-1)B].                    (S5)

The product and inverse rules bound this by size 20n-1, hence
by the source's sufficient 99n. This proves
Gauge.hasMatSize_sub_one_of_floorValues. It also covers j=0:
the early-column branch is empty and its gauge-comparison premise
is not used.

For the shell T_i=t L^(11ni), use S with size L and Gamma with
size T_i. For i>=1, L^(10n)<=T_i. Nonzero cut kernels supply the
two box points, and 2rho<=T_i^2 gives their required size-two
difference. Outside the preceding shell's positions,
Y-I has an entry larger than T_i^(99n). The contrapositive of
the result just proved gives SOME floor a>=j whose entire
floorValues set lies in {|c|<1/T_i}; otherwise a nonzero witness
with inverse at most T_i could be chosen on EVERY floor.
The floor can depend on X,Y. Its volume is <=pi/T_i^2.

This is precisely the cap premise of LocalTheorem.formMajorant_sq_le.
Combine it with the fixed rho-gauge fibre masses, not the growing
Gamma masses. Peer RUN54 then supplies its geometric shell series.
For the first shell use the native t>1 input, or sigma=pi at t=1,
as that peer does; the preceding-shell contradiction is not applied
there. With W=F, epsilon=t=1, positive finite formConst and head
density, the resulting bound proves finite formMajorant integral.
This supplies the integrability premise used by the full joint-law
descent in the Fourier/descent note, without using that descent to
prove Haar normalization or the shell cap.

## 6. Actual dependency replacement and verification boundary

The connected human path is:

    complex Level and gauge construction
      -> Haar comparison (H9-H10) and support cap (S1-S5)
      -> fixed floor-mass estimates and capped tower inequalities
      -> RUN54 shell summation and majorant integrability
      -> joint-law descent and RUN53 band estimates
      -> the native Bessel-system caller.

Sections 1-2 expand the Haar supplier; sections 3-5 expand its
previously unproved head/back-substitution geometry. The capped pivot recursion and weighted selfNorm integration are now
expanded in 2026-11-26_COMPACT_WEIGHTED_TOWER_ENERGY.md at their
complex caller. Still retain Bessel majorant construction/boxed-frame separation,
and the global pointwise classSize and linkPairing suppliers. They
are separate obligations. This note is not an audit of all these
predecessors or of the entire B root. The matrix-Jacobian block
calculation and its actual caller require independent audit.

Source authentication is included in verify_compact_lattice_convergence.py.
Its extra shell and matrix-size exponent certificates are integer
polynomial checks, not tests of Haar measures, matrix geometry, or RH.
No native Lean run is claimed.

RESUME HERE: audit the companion capped recurrence and weighted
selfNorm derivation with the exact heads; next connect the remaining
pointwise classSize and LinkPairing primitive lifts to BlockBound.
Do not repeat the gauge inverse moment, cone mass or shell scalar sum.

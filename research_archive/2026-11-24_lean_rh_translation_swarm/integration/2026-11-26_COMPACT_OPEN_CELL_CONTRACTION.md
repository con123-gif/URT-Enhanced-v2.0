# A joint open-cell Bessel contraction with the native mass bound

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION; independent mathematical
audit and native replacement replay outstanding. Source: Alpöge–Sernau
and collaborators, lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Active-route update: positivity RUN56, commit
5a7952de01b6d1cbd1798cbd640edd41ba4ffd56, independently reconstructs
the native support cancellation with T=R^5, using the ORIGINAL
Sobolev exponent 2000n^2. The manuscript now uses that shorter route.
The enlarged-tube/sharper-Sobolev construction below remains a
supporting alternative, not a required active premise. RUN56 also
independently audits the exact global packet cancellation O11/O12
and supplies the native leading-minor cutoff floor. Its audit
retains the packet premise and the Haar/tube/Schur inputs; it does
not certify this entire note or all of B.

This proves the existential interface BesselSystem.open_cell. It uses
the SAME gamma, full Bessel function, formal degree, Haar and quotient
measures as the caller. We choose a larger auxiliary compact tube and
prove a sufficient sharper Sobolev estimate to retain the ORIGINAL
cellMass bound. These are local existential witnesses, not changes
to the global A/B/C family. All constants are specified below.

Write n=varrho+1, r=shape rank, k=dim X0, d=#I>0, W=W_full,
deg>0 its formal degree, g(Z)=gramDiscReal(Z), c_G=openCellConst.
The source BesselSystem gives ||W||_quotient,2^2=d,
norm invariance under the Bessel subgroup S, and Schur bounds
for its right-derivative words of length at most 2n^2:

    integral_(U\G)||integral phi(y)W_word(xy)dy||^2
        <=P^(2|word|)(d/deg) integral |phi|^2        (O1)

for every P>=b^5 and integrable phi. The first-derivative word
identity in HasSchurBound is retained exactly. The empty-coordinate
case d=0 is immediate with zero controlling measure.

## 1. A quantitative Gram-section Sobolev estimate

Suppose P>=8r, c0>0, and on the ball |Z'-Z|<P^-6 we have

    g(Z')>=c0,  ||Z'||,||Z'^-1||,delta(Z')^-1/2<=P.

For measurable integrable phi supported on ||y||<=P^20,

    c_G c0^(k-1) integral_H integral_(u in U0, ||u||<=P^20)
      ||integral phi(y)W(gamma_Z(uh)^-1 y)dy||^2 du dh
        <=P^(500n^2)(d/deg) integral |phi|^2.        (O2)

If the right side is infinite the assertion is automatic.
Otherwise the following finite-dimensional trace argument proves
it. Use measure-preserving real coordinates e on complex n by n
matrices, real dimension D0=2n^2. The cube [0,P^-8]^D0 maps
inside the HALF radius P^-6 ball: ||e x||<=2n^2||x|| and
P>=8n. The explicit section formulas in the Haar note give
||gamma_Z'||<=P^12 there; the holomorphic extension in the
two variables Z',Z'^* gives derivative bound 4P^18 on this
smaller cube, by Cauchy's estimate. This follows also by
direct differentiation of the displayed section formulas.

For a word i in quadruples ((a,b),c,d), replace phi by

    phi_i(y)=phi(y) product_(i)
                          [y^-1_(a,d) y_(c,b)/P^40].

On its support |phi_i|<=|phi|. Pair it with the derivative
word of W obtained by keeping the (a,b) entries. Differentiating
the corresponding convolution along a real cube coordinate
produces children of this form. The logarithmic derivative
of gamma_Z'(uh)^-1, multiplied by P^40, has norm at most
P^112. Indeed the section derivative costs 4P^18, its inverse
P^12, conjugation by u costs P^40, and the coordinate change
costs 2n^2; 8n^2<=P^2 absorbs these constants. There are at
most r^4<=P^4 children. Dominated differentiation is legitimate:
for a fixed finite word the derivatives of W are bounded and
the bound is a constant times the integrable |phi|.

We record the trace inequality being used. For a measurable
family f_i on a real cube [0,epsilon]^D0 with
||partial_a f_i||<=L sum_(child)||f_child||, and a common
bound K on the integrated squares of all |i|<=D0,

    integral ||f_empty(0)||^2
       <=[2/epsilon (1+(M L)^2)]^D0 K,             (O3)

where M is the number of children. Prove the one-coordinate
inequality by the fundamental theorem of calculus,
|a+b|^2<=2|a|^2+2|b|^2 and Cauchy–Schwarz; integrate the
base point over that interval. Iterate over coordinates
and use (sum_M a_i)^2<=M sum_M a_i^2. This proves (O3)
without differentiating any variable coefficients of the
derivative relation.

For completeness, the common integrated bound K follows
from the Haar/Gram-section formula already derived, not
from a pointwise assumption about W. Insert a measurable
U0-orbit cutoff chi, integral one along each U0 orbit, and
the indicator of the Z' ball. On its support any two
U-related frames have frameMatrix bounded by P^2, from
Z(sy)=frameMatrix(s)^*Z(y). Unfold U as U0 times its
unitriangular frame group, in the native Lebesgue coordinates.
The latter has at most n^2 complex free entries, each
bounded by P^2; its volume is at most (2P^2)^(2n^2)<=P^(6n^2).
The U0 integration of chi costs one. The lower Gram-section
Haar formula has density c_G g(Z')^(k-1), at least
c_G c0^(k-1). Norm invariance under H and U0 permits the
same cutoff at every left compact coordinate. Apply (O1)
to phi_i, and |phi_i|<=|phi|, to get the uniform bound

    K=P^(10n^2)(d/deg) integral |phi|^2:

the 6n^2 is the preceding frame-volume cost and 4n^2 bounds
the Schur word cost P^(2|i|), |i|<=2n^2.

In (O3), epsilon=P^-8, L=P^112, M<=P^4. Its bracket
is <=P^242 for P>=2. Therefore the total power is at
most P^[484n^2+10n^2]<=P^(500n^2), proving (O2).
All cutoff and cube integrations are nonnegative; there
is no cancellation of an infinite orbit integral.

## 2. A compact tube with a uniform orbit-mass bound

For every T>=8r there are a compact A and measurable Omega
in U0, with 0<nu0(Omega)<infinity, such that

    Omega {||y||<=T} subset A subset {||y||<=T^(20n)},
    integral_U0 1_A(u y)du <=T nu0(Omega) for all y. (O4)

Here is an elementary proof of the source tube lemma. Use
the diagonal dilation d_T with norm <=T^(6h), whose
conjugation j(u)=d_T^-1 u d_T satisfies

    ||j(u)||<=1+r^2||u||/T^6

on the unipotent. Put E_i={u:||j(u)||<=i+2},
N0=10r^2. These sets are compact with positive finite
measure and N0+2<=T^2. The matrix-ball covering bound in
real dimension 2r^2 gives

    nu0(E_N0)<=T^N0 nu0(E_0).

Indeed cover with relative norm balls of radius one,
using size T^5 and the exponent 2r^2; the radius-one
identity ball is contained in E_0. If every consecutive
ratio before N0 exceeded T, this would be contradicted.
Choose i<N0 with nu0(E_(i+1))<=T nu0(E_i). Take
Omega=E_i and A=Omega {||y||<=T}.

An element of Omega has norm <=T^(12h)(i+2), so
||A||<=T^(12h+3)<=T^(20n). For its uniform fibre
bound fix one u0 with u0y=s0 z0, s0 in Omega,
||z0||<=T. If uy=s z similarly, then
s^-1 u u0^-1 s0=z z0^-1 belongs to U0 and has norm
at most T^2. Its j-image has norm at most
1+r^2/T^4. Consequently
u u0^-1 s0 belongs to E_(i+1), since i+2<=T^2
and r<=T/8. Right translation preserves nu0, proving
(O4). This construction proves compactness, positive
finite mass and the bound using the SAME Omega.

## 3. Choose witnesses on the actual open cell

Assume g0=g(Z(gamma))>0, rho>=b>=8r, and some y0 and
gamma^-1 y0 are in frameBox(rho). Then the entries of
Z=Z(gamma) have modulus <=rho^2. Since
g0<=|det Z|^2<=(n rho^2)^(2n)<=rho^(6n), the number

    M=rho^(9n)/g0

is at least rho. Elementary determinant/adjugate perturbation,
as in CellNeighbourhood, gives on |Z'-Z|<P0^-6,

    P0=M^(9n),   g(Z')>=g0/2,
    ||Z'||,||Z'^-1||,delta(Z')^-1/2<=P0.             (O5)

One way to verify (O5) is to apply the Cauchy bound to each
squared leading determinant on the unit neighborhood of Z:
entries there are <=M^3, determinant modulus <=M^(4n),
and their change on P0^-6 is <=1/(4M). The two differences
give g(Z')>=g0/2>0. Cramer's rule bounds the inverse,
and g=|det Z'|^2delta bounds delta^-1/2; P0=M^(9n)
dominates these powers. All inequalities use n<=M/8
and g0>=1/M, with the SAME nonzero leading determinant.

Use the explicit section gamma_Z and its double-coset
decomposition

    gamma=q h gamma_Z (v h')^-1, q,v in U0, h,h' in H.

Choose

    T=P0^18,     Q=T^n=M^(162n^2),

and the tube A,Omega of section 2. Let the probability
space be H with its Haar probability times nu0|Omega/nu0(Omega).
For its point (a,u) define the ACTUAL random right shift

    t(a,u)=(v h') a^-1 u^-1.                        (O6)

It belongs to U0 H. The norm of the tensor integral for
W(gamma t y)W(t y)* is unchanged on deleting its fixed
left Bessel factors qh and vh', since their actions on W
are unitary. The same observation removes the varying
left S action on the second W, leaving the fixed scalar
test functions phi(y)conj(W_j(y)).

We check the required support in the SAME compact A.
If y is in frameBox(rho) and besselSize(gamma t y)<=rho,
put z=a^-1u^-1y. Since a,u fix F, z is still in that
frame box; S-invariance gives besselSize(gamma_Z z)<=rho.
Choose w in U with ||w gamma_Z z||<=rho. Its frame
matrix satisfies

    ||frameMatrix(w)||<=n rho^2 P0,
    ||z^-1 gamma_Z^-1 F||<=n rho^3 P0<=P0^5.

The first follows by pairing the two bounded frames and
using Z^-1; the second uses
(w gamma_Z z)^-1F=z^-1 gamma_Z^-1F frameMatrix(w)^-1.
No operator-norm bound on w is assumed.

Let F'=dualFrameCols. Multiplication of the explicit section
formula gives

    gamma_Z^-1F=F A0+F'B0,
    B0=diag(1,...,1,sqrt(delta)) Z*.

For example the last row follows by using the last column
of each sectionCoeff and
1-|(Z^-1)_(h,h)|^2=delta; omitting that term would give
the wrong block. Thus ||B0^-1||<=P0^2, while
||A0||<=||gamma_Z^-1||<=P0^12. Also
||z^-1F||<=n rho<=P0^2. Hence

    ||z^-1F'||<=(P0^5+P0^14)P0^2<=P0^17.

These bound all frame and dual-frame columns. Unitarity
then gives ||z||+1<=8n P0^17<=P0^18=T.
To see this elementary estimate, take the n orthonormal
negative vectors (e_a-e*_a)/sqrt(2), z: their inverse
images have squared norms summing to at most
(2n-1)P0^34. From g*Jg=J and J=I-2P_negative,
||g||^2<=1+2||g^-1 P_negative||^2. This yields the
stated sufficient bound. Therefore y=u a z belongs
to Omega {||y||<=T} subset A. This proves the support
property for every (a,u) in the probability space.

## 4. The controlling measure and its exact mass

Since A subset {||y||<=T^(20n)}={||y||<=Q^20},
apply (O2) with P=Q and c0=g0/2 to each
phi(y)conj(W_j(y)), and sum j.
Here Q>=b^5, Q>=8r, and its Q^-6 neighborhood is inside
the P0^-6 neighborhood in (O5), with the same lower g0/2
and bounds P0<=Q. Thus all Schur and local Sobolev
hypotheses hold before making this application.
The resulting controlling measure on G is

    dn(y)= [Q^(500n^2)d/deg]/
            [c_G(g0/2)^(k-1) nu0(Omega)]
                       1_A(y)||W(y)||^2 dy.        (O7)

It is measurable and finite by the following bound. Unfold
U into U0 and its unitriangular frame part. On the support
of 1_A(y)1_A(sy), every frameMatrix(s) entry is <=Q^40,
because both group norms are <=Q^20. Equation (O4)
bounds the U0 fibre by T nu0(Omega). The remaining complex
coordinate volume is at most
(2Q^40)^(2n^2)<=Q^(82n^2). Since the quotient L2 norm
of W is d,

    integral_A ||W||^2 <=T nu0(Omega)Q^(82n^2)d.

Consequently (O7) has total mass at most

    Q^(582n^2) T d^2/[deg c_G(g0/2)^(k-1)]
     =M^[94284n^4+162n] d^2/[deg c_G(g0/2)^(k-1)]
     <=M^(100000n^4) d^2/[deg c_G(g0/2)^(k-1)].      (O8)

The final exponent inequality holds for every n>=1:
5716n^4-162n>=0. The right side is EXACTLY cellMass.
Positive finite nu0(Omega) cancels only after this bound;
an unnormalized infinite measure is never divided.

For every bounded measurable phi, sections 1 and 3 give

    E_(a,u) sum_(i,j)
       |integral_A phi(y)W(gamma t(a,u)y)_i
                                 conj(W(t(a,u)y)_j)dy|^2
           <=integral |phi|^2 dn.                  (O9)

All functions phi W_j are integrable on compact A,
because W is bounded. Thus (O9) is the native
IsL2Contraction statement, with the SAME random t,
compact A and controlling n as in its support property.
It is not an inference from separate marginal laws.

## 5. The global cellMass/classSize comparison

Return to the actual Filling. Write f=#infinite places,
rho=boxSize=b^(2n^2), tau=b^(kf/4), d_B=product_v d_v,
Deg=product_v deg_v, nu=unipCovolume, D_E=absolute field
discriminant and v_O=vol(Ohat)=2^f/sqrt(D_E). For a near
term with nonzero termDisc put

    X=termDiscNorm>=1,
    l_(v,a)=kappa_v^[2(h-a)]/N,
    L=product_(v,a)l_(v,a),
    F0=frameScaleProd=product_(v,a)l_(v,a)^[k+2(h-a)],
    A0=100000n^4,
    W0=countWeight(0)=|Sbar|#Classes N^(-kf),
    a=classSize_top(X).

The native normalized local discriminants satisfy
product_v g_v=L^2 X. Therefore the product of (O8)'s
NATIVE cellMass upper bounds is

    V=rho^(9n A0 f) 2^((k-1)f) d_B^2/
              [Deg c_G^f (L^2X)^(A0+k-1)].         (O10)

We prove V<=(nu a/2)^2 using the standing packet bound,
not an independent volume-height estimate. That bound is

    packetConst <=(1+b^-9) mainEnergy Deg c_G^f/v_O^n
                                      (nu F0/d_B)^2.

Since a^2=tau^4 mainEnergy/
[W0 g^(2hkf)X^(k+1)], it is sufficient, after cancelling
positive common factors and X^(A0-2)>=1, that

    4(1+b^-9) rho^(9n A0 f) 2^((k-1)f)
                      F0^2/L^[2(A0+k-1)]
       <=tau^4 g^[f h(2h+1)]
           [pi^k/(k-1)!]^f D_E^(1/4) v_O^(k+n).   (O11)

Here packetConst/(W0 g^(2hkf))
=g^[f h(2h+1)] siegelConst N^(kf); the N^(-kf)
in siegelConst cancels exactly. Thus neither that
normalization nor the class count has been discarded.

In the remaining frame-scale ratio every l has exponent
4(h-a)-2A0+2, which is negative. Since |kappa_v|>=1,

    F0^2/L^[2(A0+k-1)] <=N^[2nf(A0-n)].

Use N<=b^(60n), g>=1 and 2<=b^(1/8). The size guard
(200fk rootDiscr)^1000<=b gives
k,rootDiscr<=b^(1/1000). Also

    [pi^k/(k-1)!]^f >=b^(-kf/1000),
    D_E^(1/4)v_O^(k+n)
      =2^[f(k+n)]rootDiscr^[-f(k+n-1/2)]
      >=b^[-f(k+n)/1000].

Thus (O11) follows from the sufficient scalar inequality

    (4/5)k >= n+1+18n^3 A0+120n^2 A0.              (O12)

Indeed tau^4=b^(kf), the two preceding losses cost at
most (2k+n)f/1000, 2^((k-1)f) costs at most kf/8,
and 4(1+b^-9)<=b costs at most one logarithmic unit.
The coefficient 1-1/8-2/1000 exceeds 4/5.
Inequality (O12) holds on the ACTUAL guard
n>=100001, k>=512000n^9; its exact nonnegative
coefficient certificate is supplied with this note.
This proves the original global comparison

    product_v cellMass_v <=(nu a/2)^2.             (O13)

There is also the exact lower cutoff scale

    a>=b^(-k^3 f).                                 (O14)

To see it, mainEnergy>=tau^44 besselEnergy and
besselEnergy=|Sbar|#Classes d_B give
a^2>=1/[g^(2hkf) X^(k+1)]. For a near term, the
raw frame Gram entries at each place are bounded by
N rho^2. Hadamard, n<=b and N<=b^(60n) give

    |Phi_v(termDisc)|<=b^(8n^3+120n^2+2n).

Here termDisc is nonnegative at the place and at most
the squared modulus of the full raw leading determinant.
Thus g<=b^23 and the sufficient inequality

    46hk+(k+1)(8n^3+120n^2+2n)<=2k^3

give (O14). This inequality also has an exact universal
coefficient certificate on k>=512000n^9. The algebraic
integer norm supplies X>=1 at this same caller, not a
separate hypothesis on an arbitrary real tuple.

## 6. Tensor contraction and the actual thick amplitude

Choose the native orbit representative and the SAME
epsilon cutoff omega used in BlockBound. It satisfies
0<=omega<=1 and is left U0 H-invariant. The absolute
convergence and cutoff-transport proof in the preceding
notes justifies this change of representative and weight
before applying the following calculation.

At each place section 4 supplies the joint probability
law of t_v, compact A_v, controlling measure n_v, and
the support inclusion. Finite product/tensoring of
(O9) gives the product-coordinate contraction: apply
the one-place inequality successively and use Fubini,
with bounded measurable omega. Equivalently this is
IsL2Contraction.pi. By omega<=1 and (O13), the expected
squared norm of the FULL kernel integral restricted
to product A_v is at most (nu a/2)^2. Hence some point
of the product probability space, outside the support
null set, gives norm at most nu a/2.

The CUT integral is supported on that SAME product A_v.
In fact its nonzero values force both InCut conditions;
the omega support then puts y in frameBox(rho), and the
support property proved in section 3 puts it in A_v.
Over the whole group its value is independent of t:
change variable z=t y and use omega(t^-1z)=omega(z).
This uses a joint kernel identity, not two separate
distributional laws.

Compare that cut integral with the restricted full
integral just bounded. Its error is at most the
uniform full-to-cut estimate in the convergence note,
nu b^(-k^3f)/2. The estimate applies also after t
translation and restriction: change variable by t,
use omega's invariance, and extend the nonnegative
error integral to the whole group. It is one term
of the already bounded total error, not a new
count multiplied by the number of shifts. By (O14)
the error is at most nu a/2. Therefore the cut
amplitude of this representative has norm <=nu a.

Sum by the absolutely convergent orbit decomposition.
In the thick region X>N^f minorNorm, level is top
and xRowsIndex_top=1 in both directions, so the SAME
classGauge is X. This proves precisely the thick
classSize contribution in
BlockBound.enorm_amplitudeSum_le_classSize_top.
Together with the thin bound in the companion note,
it supplies the pointwise classSize estimate used by
the weighted pair/counting chain. If s fails to agree,
the amplitude is zero by the native unipotent
character orthogonality; this is the existing orbital
transport identity, with the same finite level.

## Scope and verification

This constructs the full existential open_cell supplier,
including probability, measurability, common support,
finite controlling measure and the native cellMass constant.
Its analytic inputs are the source HasSchurBound derivative
and norm-equivariance fields of the SAME BesselSystem;
their existence and peak/graph predecessors retain their
own human derivation/audit requirements.

Sections 5-6 now prove the global comparison and its
actual thick-class consumer from the specified
packet/mass and scale guards. The packet supplier itself,
peak/Bessel-system existence and their retained global
Siegel/representation-theoretic prerequisites require
their existing human proofs and independent audits.

These are human proofs, awaiting independent mathematical
audit and native replacement replay. The new exponent
certificate checks only (O8), not the analytic or support
arguments. No RH completion or whole B verification.

RESUME HERE: audit the explicit B0 inverse-section block,
(O2) quotient/cutoff normalization and the packet cancellation
(O11) independently at their native callers. The pointwise
thin and thick branches are written; advance the actual
peak/Bessel-system and packet/Siegel prerequisites and
latest A/C peers instead of repeating these estimates.

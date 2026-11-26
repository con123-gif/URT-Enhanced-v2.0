# The frame-volume kernel and the actual thin-class bound

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION; independent audit and
native replay outstanding. Source: Alpöge–Sernau and collaborators,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0 and Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Actual path: VolumeKernel.exists_kernel_frameVolume_le ->
ThinClasses.tsum_schurIntegral_le -> tsum_amplitudeAbs_class_le ->
BlockBound.enorm_amplitudeSum_le_classSize. This note proves the
thin branch, using the same-frame alignment of peer 0a45200e and
the boxed-frame theorem in the preceding note. The distinct
thick/open-cell branch is retained at the end.

## 1. Hua's integral with its actual sufficient constant

Let S be an invertible t by t complex matrix, a a k by t
complex matrix, and n>=t. With ordinary complex Lebesgue measure,

    integral_(X in C^(k*t)) det(I+(XS+a)*(XS+a))^(-k-n)dX
       <= [pi^t/(t! |det S|^2)]^k.                 (V1)

This includes t=0 and k=0 with their zero-dimensional measure.
For t>0, integrating one row uses the determinant lemma
det(M+z*z)=det(M)(1+z M^-1 z*) and the complex polar beta
integral. For exponent A>=t+1 this integral is

    pi^t Gamma(A-t)/Gamma(A) det(M)^(-(A-1)).

Translation by its row of a does not change measure, and
right multiplication by S costs |det S|^-2. Since A is
an integer, Gamma(A-t)/Gamma(A)<=1/t!: the t consecutive
positive denominator factors are at least 1,...,t.
Integrate all k rows. Their exponents are k+n,...,n+1,
each at least t+1. Tonelli applies throughout. This proves
(V1), not a claimed exact Hua constant.

We also use the following determinant inequality. If H>=0
and Theta+Theta*>=H on C^j, then

    det H <= 2^j |det Theta|.                      (V2)

If H is singular this is automatic. Otherwise conjugate by
H^-1/2: the real part of 2H^-1/2 Theta H^-1/2 is at least I.
Every eigenvalue has real part at least one, by its eigenvector
quadratic form, and hence modulus at least one. Take their
product. This proves the precise Ostrowski–Taussky inequality
used below, including its factor 2^j.

## 2. An explicit kernel dominates the frame-volume ratio

Work at ONE infinite place. Put F=frameCols, J=J1, U=(I-J)F,

    Delta(y)=|det(U* y^-1 F)|,
    B=(U* y^-1 F)^-1 U* y^-1.

The inverse exists: a nonzero vector in the frame span has
nonpositive hermitian norm, and its projection onto a maximal
negative subspace cannot vanish unless the vector is zero.
Thus Delta(y)>0 and BF=I. Fix besselSize(y)<=theta; choose
omega in the Bessel unipotent with ||omega y||<=theta.
In particular theta>=1.

Fix a leading block z of Z of size j with det z!=0, j<=n.
Let i include its first j indices, let e include t selected
indices into j, and let R be invertible of size t. Let the
first j X0 frame components of gamma be

    V+A R e* z,

with realFrameGram(gamma)=Z and IsNormalForm(j,gamma).
Introduce the following matrices. The auxiliary t0,Y,W can depend
on gamma; p,T,B,C,S,a depend only on the fixed data. Their
selected block We will depend only on A, as (V3) shows:

    p=Z_(all,first j) z^-1,       p_(first j,all)=I,
    I0=F i,     T=theta frameMatrix(omega)_(first j,first j),
    t0=gamma I0 z^-1,             F*J t0=p,
    C=T p* B,
    Y=J t0 T*-C*,                W=X0Cols*Y,
    S=R e*T*e,
    a=(V z^-1 T*-X0Cols*C*)e.

Here det T=theta^j and |det S|=|det R|theta^t, since
frameMatrix(omega) and its selected principal submatrices
are unitriangular. Direct substitution gives

    W e=A S+a.                                    (V3)

The normal-form shared flag gives

    |det(B gamma F)|=|det(C t0)| |det z|/theta^j.   (V4)

To check it, set M=B gamma I0-i. The first j columns agree
in B gamma F and I+M p*. For each remaining column the
shared-frame vectors X_b,Y_b have leading coefficients
of moduli one and vanish above b. Multiplying their frame
identity by B+M t0*J gives
B gamma F Y_b=(I+M p*)X_b. If j<n, t0*J gamma F=0
because I0 consists of isotropic columns; if j=n there
are no remaining columns. The resulting two triangular
coefficient matrices have determinant modulus one. Sylvester's
identity then gives
det(I+M p*)=det(I+p*M)=det(p*B t0 z),
which is (V4).

Set Theta=-C t0 T*. We claim

    Theta+Theta* >= I+W*W.                         (V5)

Indeed F*Y=0 since CF=T p*. Thus Y has no original isotropic
or z rows, and Y*JY=W*W. Put D=C y and
Q=theta^-1(omega y)^-1 I0. Then ||Q||<=1, and DQ=I
by BF=I and the inverse leading unitriangular frame block.
Hence DD*>=I. Also DD*=-CJC*, because U lies in J's negative
eigenspace and y preserves J. Finally

    T t0*J t0 T*=-r0*r0,
    r0=zCol* I0 z^-1 T*.

This holds with r0=0 if j<n; at j=n it is exactly the one
negative z contribution to the frame Gram. Expanding Y*JY
therefore gives

    Theta+Theta*-(I+W*W)=DD*-I+r0*r0 >=0.

This proves (V5), with no missing positivity assumption on
an indefinite ambient Gram.

From the definition of B,
Delta(gamma^-1 y)=Delta(y)|det(B gamma F)|.
Equations (V2),(V4),(V5) imply

    Delta(y)/Delta(gamma^-1 y)
       <= (2theta^2)^j/[|det z| det(I+W*W)]
       <= (2theta^2)^j/[|det z| det(I+(AS+a)*(AS+a))]. (V6)

The second inequality is the principal-subspace determinant
inequality for a positive Gram matrix: Cauchy–Binet expresses
det(I+W*W) as a sum of nonnegative squared minors, including
all minors of We. Thus an ACTUAL common measurable kernel is

    K(A)=[(2theta^2)^j/|det z|]^(k+n)
                        det(I+(AS+a)*(AS+a))^(-k-n).

Apply (V1), using t<=n and the value of det S, to get

    integral K <= [(2theta^2)^j/|det z|]^(k+n)
                  [pi^t/(t!theta^(2t)|det R|^2)]^k. (V7)

This is the full conclusion of exists_kernel_frameVolume_le.
The same K works for EVERY gamma with the specified Z and
affine X0 data. It is not selected after gamma or after the
test variable A.

## 3. From this kernel to the Schur integral of one thin class

Return to the actual rational term gamma of level j over
(c,s,c'). Set m=min(h,j), D=minorNorm(j,gamma), I_gamma the
native xRowsIndex, nu=unipCovolume, d_B=#BesselCoord,
tau=tailScale=b^(kf/4). The Schur weight is

    beta_c'^0(gamma^-1 y)
       product_v[Delta(y_v)/Delta(gamma_v^-1 y_v)]^(k+n).

First, an averaging observation with the source's exact
covolume: if a classUnip0-invariant nonnegative F has
average <=C under the chosen U0 shifts at every boxed y,
and the parameter averaging set has measure at least one,
then

    integral beta_c^0(y) product_v||W_cut(y_v)||^2 F(y)dy
         <=C nu d_B.                              (V8)

Unfold the cutoff partition over the class unipotent
lattice, translate the U0 Haar variable, and use invariance
of the Bessel norm and of F. The remaining quotient L2
integrals are each <=card(I_v). Their product is d_B.
This is the same quotient/covolume identity as in the
orbital and convergence arguments. Nonnegative Tonelli
justifies the unfolding before a finite upper bound exists.

For each place use the actual shifts

    R_v=diag(pi g/[b alpha_(v,a)])_(a<m),
    s(A)_v=unipotentOf(incl_(a<m)(A_v R_v)*,0).

Average A over the coordinate unit polydisc X; its mass
is pi^(f k m)>=1. Terms delta in the SAME double class
have the same Z and level. Their lattice middle differences
lie in g times the full xRows span, by the principal-level
identity in terms_of_class_spec. Colour by the quotient of
this span by its first m rows. There are at most
I_gamma^(k+1) colours. ALL k+1 lattice-middle rows must be
included: the lattice basis can mix the raw z and X0 rows.

Within a colour, the same-Z alignment lemma reconstructed
in 0a45200e gives a rational class-c integral matrix l with

    (delta f-gamma0 f)_below_X = [g l xi;0],

where xi is exactly the first m xRows. Its hypotheses hold
because the colouring puts the middle differences in the
selected-row span; the preimage-lattice alternative can be
taken zero. The correction in that lemma is retained, and
the raw frame middle shift is exactly the displayed one.
For the chosen s(A) this translates its kernel variable by

    L(l)_v=(b/pi) Phi_v(l).

Distinct l cannot have overlapping translated polydiscs:
an overlap gives each column of their integral difference
squared norm <(2pi/b)^2 k<=64/b<1 at EVERY place, using
k<=b and b>=1000. Definite class-lattice rigidity then makes
the difference zero (apply the integral norm argument to
its squared length). This is stronger than mere distinct
complex coordinate labels.

For a fixed l, the remaining frame differences have only
isotropic rows, in real dimension at most 2f h n. The
weighted boxed-frame theorem therefore bounds the cutoff
sum on that fibre by

    b^(12f n^4)<=tau,

since k>=512000n^9. Thus, inside one colour, (V6) bounds the
averaged Schur-weight sum by tau times the product of the
integrals (V7): translated polydiscs with distinct l are
disjoint, so their integrals extend to the whole matrix
space without multiplicity. Apply (V8) to obtain

    sum_delta schurIntegral(delta)
       <=nu d_B tau I_gamma^(k+1) product_v integral K_v. (V9)

This keeps the SAME integral translates and fibre labels.
An unweighted count of all delta would be infinite.

## 4. Evaluate (V9) with the native sufficient sizes

Put theta=b^(6n+2). The normalized leading block satisfies

    product_v |det z_v|
      =sqrt(D) N^[f(j-h)_+]
                     product_(v,a<j)|alpha_(v,a)|^2.

Insert this identity and R_v into (V7). Its factors of
alpha at the selected m isotropic rows reduce to alpha^(-2n);
at full j=n, the extra alpha_h=N^-1/2 cancels the factor
N^[-f(k+n)] from the leading determinant. Dropping
(m!)^-k pi^(-mk)<=1 is allowed. The result is bounded by

    (b^4 g)^(-m k f) D^(-(k+1)/2).                 (V10)

Here are full-domain exponent checks for this sufficient
bound. Use |kappa|>=1, N<=b^(60n), g>=b^19,
2<=b^(1/8), n>=100001 and k>=512000n^9.
After factoring out the right side of (V10), the log_b
exponent divided by f is at most

    m[-103k/8+72n^2+33n/8]             if j<=h.

This is nonpositive. For j=n,m=n-1, integrality of the
RAW leading determinant gives D>=N^(-2f); the corresponding
upper exponent is

    (17-7n/8)k+72n^3+33n^2/8-60n,

also nonpositive: 17-7n/8<=-n/2, while
72n^3+33n^2/8<k n/2. These inequalities also handle j=0,
where m=0 and the zero-dimensional integral equals one.
Thus no adverse power of N, theta or a frame scale remains.

Enlarge tau to its original sufficient tau^2 in (V9).
Equations (V9)-(V10) give precisely

    sum_delta schurIntegral(delta)
      <=nu d_B tau^2 (b^4 g)^(-m k f)
                            (I_gamma/sqrt(D))^(k+1). (V11)

This is ThinClasses.tsum_schurIntegral_le with its original
constant, not an asymptotic substitute.

## 5. The thin pointwise classSize estimate

Weighted Cauchy–Schwarz gives

    amplitudeAbs(delta)^2
       <=schurIntegral(c,c',delta)
                              schurIntegral(c',c,delta^-1).

The opposite frameVolume ratios cancel exactly; their
cutoffs and Bessel norms recover the absolute-amplitude
integrand. Sum and apply Cauchy–Schwarz again. Inversion
is injective on the class, preserves D, and changes
I_gamma to I_(gamma^-1). By (V11), the class amplitude sum
is at most

    nu d_B tau^2 (b^4 g)^(-m k f)
                 [I_gamma I_(gamma^-1)/D]^((k+1)/2). (V12)

In the thin region termDiscNorm<=N^f D, the SAME classGauge
is N^f D/[I_gamma I_(gamma^-1)]. To compare (V12) to the
source classSize, square and cancel its positive factors.
The only required budget is

    d_B^2 countWeight(0) N^[f(k+1)] b^(-8m k f)
         <= E_j,

where E_j=tau^(13-32j)besselEnergy for j<=h, and E_j=mainEnergy
for j=n. The definitions columnDim=#Classes d_B,
countWeight(0)=|Sbar|#Classes N^(-kf) and
besselEnergy=|Sbar|columnDim turn its left side into

    N^f d_B besselEnergy tau^(-32m).

Now d_B<=b^(2kf)=tau^8 and N^f<=tau^5, by N<=b^(60n)
and k>=2000n. For j<=h this is <=E_j exactly. At the
top use mainEnergy>=tau^44 besselEnergy and
13-32h<=44. Thus

    sum_delta amplitudeAbs(delta)
         <=nu classSize_j(classGauge_j(gamma)).     (V13)

This supplies the actual thin-class caller, with all level,
same-class, cutoff and finite-place index witnesses.

## Remaining thick branch and verification

BlockBound splits terms according to termDiscNorm>N^f D.
For that thick region j=n, it needs the joint open-cell
mean-square Bessel contraction and its cellMass budget.
Sections 1-5 do not prove that distinct branch or the
peak-existence theorem underlying the Bessel system.
The same-Z alignment, cutoff quotient law and boxed-frame
proofs cited above retain their recorded independent-audit
requirements. No native replacement replay has been run.

Source anchors are VolumeKernel, ThinClasses, SchurTest,
BoxPartition, Setup and Lib/General/LinearAlgebra/HuaIntegral,
Lib/General/Analysis/OstrowskiTaussky at the compact pin.

RESUME HERE: reconstruct BesselSystem.open_cell from the
explicit Gram-section Sobolev estimate and common compact
tube; then prove its exact cellMass/classSize comparison.
Do not repeat this thin kernel, the shell/tower or the
global link determinant.

# Integral link lifts and their discriminant cost

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION; independent mathematical
audit and native replay outstanding. Source: Alpöge–Sernau and collaborators,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Actual consumers: LinkPairing.exists_lifts_linkDiscSq_le,
minorNorm_sq_le_linkDiscSq_mul, exists_link_split_le_classGauge and
pairInvariant_mul_le -> BlockBound.sum_pairWeight_le. The finite-fixer
enhancement is proved separately in section 5a, rather than inferred
from a determinant identity. All objects use the same terms over
(c,s,c') and the same class lattice.

Put R=Ohat_E, A=A_f,E, f=#infinite places, h=varrho, n=h+1.
For an adelic scalar t write [t]=genIndex(t). For rational t!=0,

    [t]=|Norm_(E/Q)t|=product_v |Phi_v(t)|^2.        (L1)

In particular [N]=N^(2f). A rational positive definite Gram matrix
always has nonzero determinant; this is used before applying (L1).

## 1. The Gram Liouville inequality, with both adelic lattices

Let Q be positive definite at every complex embedding, a,b rational
matrices of equal full column rank, and v,v' invertible adelic matrices.
If det(a*Qb)!=0 and

    0<=x<=[det(v* a*Qb v')],

then

    x^2 <= [det v]^2 |Norm det(a*Qa)|
                         |Norm det(b*Qb)| [det v']^2. (L2)

At each infinite place choose Q^(1/2). Cauchy–Schwarz on the
corresponding exterior powers gives

    |det(a*Qb)|^2 <= det(a*Qa) det(b*Qb).

Multiply over the SAME CM type, then use (L1) and multiplicativity
of generalized index. The two conjugate-transpose determinants have
the same index. This proves (L2), including both lattice factors.
It is BoxPartition.liouville_gram. No dimension/cardinality factor
arises in exterior-power Cauchy–Schwarz.

## 2. A complementary discriminant identity without a positivity premise

Let J be an integral unimodular hermitian matrix of size r. Let F be
integral of rank a and let m be primitive integral of rank r-a, with
F*Jm=0. Let p have b columns, and c0 be an adelic unit. Define

    B = [F,p]* J [F,p] + diag(0,c0 I_b),
    H = m*(J+c0^-1 J p p* J)m,
    i = [R^r intersect span_A(F) : F R^a].

Then

    [det H] i^2 [c0]^b = [det B].                  (L3)

Also ker(m*J)=span_A(F). This equality follows by dimension and
nondegeneracy of J; it does not require the restriction of J to
span(F) to be nondegenerate.

Here is a direct proof of (L3). Replace F by the primitive basis
F0=F a0 of its saturation. Local DVR basis extension, at almost all
places integral without change, gives an adelic basis; thus
[det a0]=i^-1. The matrix C=F0*J is an integral split surjection,
because F0 is primitive and J is unimodular. Choose Q with CQ=I.
Then U=[Q,m] is integral unimodular, with the given primitive
m spanning ker C. Put T=U*JU, z=U^-1p, and let E select the
first a coordinates. In this basis the bordered matrix B0 is

    [ (T^-1)_11, z1 ; z1*, c0 I+z*Tz ],

and H is the lower-right block of T+c0^-1 T z z*T.
Consider the single larger matrix

    K = [ T,  E,  Tz ;
          E*, 0,   0 ;
          z*T,0, -c0 I ].

Eliminating T gives
det K=det T (-1)^(a+b)det B0. Eliminating -c0 I first,
then using the identity blocks E,E*, gives
det K=(-1)^(a+b)c0^b det H. Hence

    det T det B0 = c0^b det H.

The calculation only inverts T and c0; it remains valid when H
or B0 is singular. Since [det T]=1 and
[det B0]=[det B][det a0]^2, (L3) follows. This proves
LatticeComplement.jacobi_perp_discriminant, rather than using
a positive definite orthogonal-complement formula in an indefinite
space.

## 3. The actual primitive lattice of link lifts

Let gamma have level j, put j0=min(j,h), q=h-j0, and let v be ANY
rational basis matrix of link(gamma), of rank k+1. Write

    m=[e_a, gamma e_a]_(a<h),
    F=[e_a (a<h), gamma e_a (a<j0)],
    s0=[e*_a]_(a>=j0),      p=[z,gamma z].

The nonzero leading minor at j and the normal-form shared flag
vectors imply that F is a basis of span(m): its rank is h+j0.
Indeed a relation is detected on the first j0 dual pairings;
the shared flag vectors express the remaining columns successively.
The normal-form equations have common leading coefficients c,1,
c bar c=1, so solving for their tail coordinates is triangular.

There is a rational matrix u=[u0,u1], with q and k+1 columns,
satisfying the three EXACT equations

    m*J u=0,       linkMatrix(gamma)u=[0,v],
    s0*J u=[I_q,0].                                (L4)

To construct it, lift each column of v through the defining map
from m-perp onto link(gamma). Its kernel consists of the shared
isotropic vectors. Projection of that kernel onto the last q
original isotropic coordinates is an isomorphism: the shared
normal-form flag gives a triangular matrix with nonzero diagonal,
and the leading minor excludes any additional relation. Subtract
the unique kernel vector giving the chosen lift's tail. This
gives u1 with zero tail; lifting the standard tail basis in the
kernel gives u0. This proves (L4) for the prescribed v, not for
a newly selected basis. It also proves u is a basis of F-perp:
applying the last two maps to a linear dependence gives zero
coefficients, and the dimensions are q+k+1=r-(h+j0).

Move u to the SAME class-c lattice coordinates. Local DVR basis
extension, adapted to the first q-dimensional flag, gives

    V=classCoord(c) u [a,z0;0,e]

primitive integral, with a,e invertible adelic. One may see this
by taking the preimage of the integral lattice under classCoord u,
choosing a lattice basis of its intersection with the first
coordinate subspace, and extending that basis. Patch these local
bases at finite places. In particular the last columns of V are
integral lifts of v e: the correction u0 z0 is in the kernel of
linkMatrix, by (L4). The witnesses t=u and the last columns of
[a,z0;0,e] satisfy every field of HasIntegralLifts c gamma.

Let D=minorNorm(j,gamma)>0. The bordered Gram matrix formed from
[F,s0,p] with N on its last q+2 diagonal positions satisfies

    [det B]=(N^(2f) D)^2.                           (L5)

Here the source's block permutation is essential. After permuting
the rows and columns its determinant is det A det A*, up to sign,
where A is paddedLeading(j,Z(gamma^-1)) with its LAST row replaced
by the full last row of Z(gamma^-1). If j=h+1 then A=Z(gamma^-1)
and |Norm det A|=N^(2f)D by the definition of minorNorm.
If j<=h, elimination by the invertible j-leading block expresses
det A as that leading determinant times its last Schur entry.
The shared last flag vector and h(z,z)=-N give the latter entry
as N times a norm-one scalar (up to sign): pair the shared-frame
identity with z and with gamma^-1 z, or use Cramer's rule on
that row. Its absolute norm is N^(2f). This proves (L5);
it is the determinant calculation in HasLevel.abs_norm_bordered_det.

Apply (L3) in the lattice basis, with primitive matrix V and the
selected F columns, p there equal to [s0,p], c0=N. Equation (L4)
and the identity for the link metric give, BEFORE primitive
basis change,

    u*J u+N^-1 ([s0,p]*J u)*([s0,p]*J u)
          =diag(N^-1 I_q, v*Q1 v),                 (L6)

where Q1=linkMetric. Indeed the two copies of the middle hermitian
form contribute one half each on a link, and the two z-pairing
rows give the N^-1 correction in Q1. This is obtained by expanding
the two middle projections; both isotropic remainders vanish
by m*J u=0. Equation (L6) shows the corrected form is positive
definite on these rational coordinates.

If I_F=[saturation(F):F R^(h+j0)], (L3)-(L6) give the EXACT identity

    linkDiscSq(v,e) [det a]^2 I_F^2 = D^2.           (L7)

The factors of N cancel as

    N^(-2fq) N^[2f(q+2)] = N^(4f),

against the factor N^(4f) in (L5). There is no surviving N or
root-discriminant factor in (L7).

Now put k0=termPosition(c,c',gamma), I(k0)=xRowsIndex(j,k0),
and Sat(k0)=saturationIndex(k0). The two actual index divisors are

    I(k0) divides [det a],
    I(k0^-1) Sat(k0) divides I_F.                  (L8)

For the first, the original-isotropic tail of u0 is I_q by (L4),
and classCoord is the identity on this block. Thus a is integral.
The first q columns of V are integral and have zero link image.
Their middle part is zero. Orthogonality to the moved frame then
reads xRows(Z(k0))* (u0 a)_X=0. Consequently the image of
a R^q in the quotient of all x-row columns by the first j0
columns is zero. The tail columns generate that quotient, so it
is a quotient of R^q/aR^q, of order [det a]. This proves the
first divisibility, not just an inequality.

For the second write L0=col_R(m(k0)), F0=col_R(F(k0)), Lsat its
saturation. Then F0 subset L0 subset Lsat, and
I_F=[L0:F0] Sat(k0). Pairing with the original full frame maps
m(k0) to [0,xRows(Z(k0^-1))*]. It maps the selected columns F0
to the first j0 of these x-row columns. Thus the quotient of
all inverse x-rows by its first j0 rows is an image of L0/F0.
Its order I(k0^-1) divides [L0:F0], proving the second part of
(L8). All indices are finite: (L5) is nonzero and the displayed
lattices have the same full adelic span.

Combining (L7)-(L8), for the SAME e and its integral lifts,

    w=I(k0)I(k0^-1)Sat(k0) != 0,
    linkDiscSq(v,e) w^2 <= D^2.                    (L9)

This is the actual exists_lifts_linkDiscSq_le for every chosen
basis v. Its witnesses include the kernel correction z0;
integrality of v alone was never assumed.

## 4. Splitting the same integral lift lattice

Let m,y be rational Q1-orthogonal columns forming a basis of a
link subspace, and suppose [m,y]f has integral lifts. Adapt its
adelic coefficient lattice to the m flag as above. This gives
a,v invertible and z with integral lifts of m a and m z+y v.
The change of lattice basis is integral unimodular, so its
generalized determinant index is one. Since the rational Gram
matrix of [m,y] is block diagonal,

    linkDiscSq(m,a) linkDiscSq(y,v)
                =linkDiscSq([m,y],f).               (L10)

The second actual lift is m z+y v, although the second rational
discriminant in (L10) is computed on y,v. The triangular
coefficient matrix [a,z;0,v] gives this equality exactly; deleting
z in the integrality condition would be invalid. This proves
HasIntegralLifts.exists_orthogonal_split.

## 5. The small z-quotient and the enhanced lower bound

Let L=zFormPair. Then Q1 is the positive diagonal matrix
one half times diag(I_k,N,I_k,N). Normal form and the nonzero
leading minor give two explicit link columns

    epsilon_1=(a,-1;0,u),  epsilon_2=(0,u';a',-1),

from gamma and gamma^-1 respectively. The first is obtained by
solving the shared-frame equations with last original coefficient
-1; at the top level use the full inverse Gram matrix. Expanding
the link-isotropy equation gives, for every link column w,

    epsilon*Q1 w=Lw,
    epsilon*Q1 epsilon=N [1,-bar u;-u,1],
    termDisc=leadingMinor_j bar(leadingMinor_j)(1-bar u u). (L11)

Thus at most two columns can be independent modulo ker L.
If j<=h, termDisc=0 by the actual HasLevel guard; positivity of
Q1 then gives rank epsilon<=1. Hence for y independent under L,

    rank y <= 1+(j-h)_+.

Choose independent rows of Ly and apply (L2) to the corresponding
epsilon columns and the actual integral lifts of y v. The cross
determinant is integral because their L-image is the paired
frame image of those SAME lifts. Its generalized index is at
least one. For zero, one or two selected rows the epsilon Gram
norm is respectively 1, N^(2f), or

    N^(4f)|Norm(1-bar u u)|
        =termDiscNorm(gamma)^2/D^2                 (two rows).

The last case forces j=h+1, and uses the full-level normalization
|Norm leadingMinor|=N^(2f)D. Consequently, without any additional
finite-fixer estimate,

    D^2 <= linkDiscSq(y,v)
                    max(termDiscNorm,N^f D)^2.     (L12)

The native strengthened conclusion replaces the left side by
x^2 D^2 only if j=h+1 and y fills the whole link quotient by ker L.
It uses the SPECIFIC finite result
BoxPartition.le_genIndex_det_of_fixesNormAtLeast: for these two
integral annihilator forms over an agreeing reduction s with
FixesNormAtLeast(s,x), their last two frame pairings have determinant
index at least x. This is stronger than integrality and is not
proved by (L2). Its hypotheses include the same chosen primes,
inverse-adjoint conjugate components and actual agreement character.
The separate finite argument in section 5a supplies this premise.

## 5a. Agreement forces the enhanced determinant divisor

Use the ACTUAL finite definitions. Agrees(s) says that integral
Bessel-unipotent u,u' with red(u)s=s red(u') have the same
character psi_f(simpleRootSum(u)/g). FixesNormAtLeast(s,x)
supplies a finite set A of chosen places or conjugate places,
with product of residue norms >=x. At each the indicated
component, inverse adjoint in the conjugate case, fixes a
nonzero vector in the frame span. These labels are distinct
in the native CRT family.

Let t be the two integral annihilator forms in the actual
finite-fixer lemma. Their pairings with the isotropic parts
of BOTH frames vanish. Let delta be the determinant of their
last two frame pairings, and suppose it is an adelic unit.
We show delta vanishes modulo every place in A.

Work at one selected residue field F. Write P for the original
frame matrix and P'=sP for the moved frame, using the specified
inverse-adjoint component if necessary. If delta were nonzero
in F, pairing a relation P x=P' y with the two forms gives
x_h=y_h=0. Their only remaining pairings constitute an
invertible 2 by 2 matrix. We show every x_a is zero, which
contradicts the prescribed nonzero fixed frame vector.

Descend on a, proving this for ALL relations. The last
coordinate was just proved. Suppose all higher x_b are
already zero for every relation, and a<h. Set

    X=shift(x)=(0,x_0,...,x_(h-1)),  Y=shift(y).

There is a relation P x'=P' y' with x'_b=X_b for b>=a+1
and y'_h=Y_h if, for every row ell killing P's columns
0,...,a and P''s columns 0,...,h-1,

    ell P X=ell P'Y.                               (L12a)

This is ordinary finite-dimensional duality: the difference
PX-P'Y must lie in the span of exactly those columns. A
functional separating it from that span would contradict
(L12a). Correct using those columns to obtain x',y'.

Agreement proves (L12a) with integral unipotent witnesses as
follows. CRT gives a selector omega:F->R, omega(0)=0, with
the prescribed residue at this one place, zero at the other
chosen places of its sector, and star(omega(t)) zero throughout
that sector. Disjointness from the conjugate selected primes
ensures the last property. Omega need not be additive.

Lift v=P omega(x) and the row ell entrywise by this selector.
Its support and annihilation properties imply h(v,v)=0 and
ell(v)=0 EXACTLY, since P consists of coordinate vectors.
Put w=J^-1 ell*. The integral Eichler element is

    E=I+r v ell-bar(r)w v*J
                  -tau r bar(r)h(w,w)v v*J,         (L12b)

for every r in R, where tau+bar(tau)=1 in R. Unimodularity
of J makes w integral; StablyUnram supplies tau. Expansion
of E*JE uses the two orthogonality conditions and
tau+bar(tau)=1 to give J. It is Bessel-unipotent: v lies in
the first a+1 isotropic directions and ell kills those
directions, so its action on the frame is upper unitriangular.
Its simple-root sum is

    r A(P,x),  A(P,x)=omega(ell P) dot shift(omega(x)).

The other two terms of (L12b) kill every frame column,
because v lies in the isotropic part of that frame.

For the second witness use v'=P omega(y), row omega(ell s).
Here y_h=0 and ell P' kills its first h columns, so the
same construction is Bessel-unipotent and has root sum
r A(sP,y). The selector's starred factors make the last
two terms of (L12b) vanish on reduction in the selected
sector. The two reductions there are exactly

    I+r_p (P x)ell,  I+r_p (P y)(ell s),

where r_p is the selected residue of r. At other components
these updates are zero. The relation Px=sPy therefore makes
the two reductions intertwine s. In the conjugate sector
apply the actual group automorphism idOrInvAdjoint; the
same assertion holds with its prescribed component. Thus
Agrees(s) gives, for EVERY integral r,

    psi_f(r[A(P,x)-A(sP,y)]/g)=1.

The source selfDualChar has conductor R, with the different
generator included. Its annihilator identity forces
[A(P,x)-A(sP,y)]/g to be integral. The native g_dvd_iff
then makes its residue zero at the selected place. Reducing
the displayed expression for A gives exactly (L12a).
Testing only one r or only a marginal phase would not suffice.

The corrected relation x',y' now exists. Apply the descending
induction to its coordinate a+1:
0=x'_(a+1)=X_(a+1)=x_a. Hence all x coordinates vanish
for all relations. In particular the specified fixed vector
would be zero, a contradiction. So delta vanishes at EVERY
selected place in A.

Finally delta is integral and nonzero. The principal ideal
delta R is contained in the kernel of the surjective CRT
map to product_(p in A)F_p. Thus

    [delta]=|R/delta R|>=product_(p in A)|F_p|>=x.    (L12c)

This proves BoxPartition.le_genIndex_det_of_fixesNormAtLeast
with the same selected primes and actual common reduction.
Apply it to the paired-frame images of the integral lifts
in section 5. It supplies the strengthened x'^2 D^2 version
of (L12); no archimedean lower bound was used to infer this
finite divisor.

## 6. The common-link split at its actual caller

Let L0=link(gamma) intersect link(gamma'), K=L0 intersect ker L,
and let m be a rational basis of K. Projection p of m onto the
first X0 is injective: a vector in K has both z coordinates zero;
link isotropy makes its two X0 squared norms equal. If the first
vanishes, positivity makes the second vanish as well. Moreover

    m*Q1 m=p*p.                                    (L13)

Thus the subspace col(p) is EXACTLY commonLink, and its class-c
discriminant is the one in pairInvariant.

Choose Q1-orthogonal rational complements u of K in L0, then y
of L0 in link(gamma). Put i=k+1-dim L0. Apply (L9) to the full
basis [m,u,y], and (L10) twice, maintaining the triangular
corrections in the actual lifts. Denote the resulting three
discriminants by d_m,d_u,d_y. Then

    d_m d_u d_y [I(k0)I(k0^-1)Sat(k0)]^2 <= D^2.   (L14)

The integral lifts of the m-part have first middle coordinates
classCoordX0(c) p a. Pairing their integral representatives with
the moved frame gives, by xRows_conjTranspose_mul_eq, columns
in the xRows column lattice. Apply the primitive Gram-index
inequality to the SAME class lattice on commonLink (as expanded
in the lattice/saturation note). With o=frameValueIndex(...,1,...)
and d_T=latticeDisc(c,commonLink), it says

    (d_T o)^2 <= d_m.                              (L15)

This also proves d_T>0 and o>=1 at this caller; an arbitrary
Euclidean lattice cannot replace this marked class lattice.

The columns u are independent under L. Their number r0 is
dim L0-dim K, at most 1+(j-h)_+ by section 5. Consequently

    k <= dim commonLink+i+(j-h)_+.

Apply (L12) to the integral lifts of the u-part, retaining its
kernel corrections along m. At i=0 its rank fills the whole
link quotient, so the enhanced bound follows from the separate
finite-fixer argument in section 5a. Write

    x'=x if j=h+1 and i=0, and 1 otherwise,
    M0=max(termDiscNorm,N^f D),  G0=M0/[I(k0)I(k0^-1)].

It gives d_u M0^2>=x'^2 D^2. Together (L14)-(L15) yield

    [pairInvariant(c,c',gamma,gamma') x']^2 d_y
         <= G0^2=classGauge(j,c,c',gamma)^2.         (L16)

The saturation factor in pairInvariant is precisely cancelled
against the one in (L14). At i=0, L0=link(gamma), by dimension.
The complement y has dimension i and the SAME actual lift
m0 z+y v, with m0 a basis of L0. This proves the data and
inequality in exists_link_split_le_classGauge, including the
finite-fixer enhancement of section 5a when x'!=1. Applying
it to gamma' reverses the pair with the same i and common L0.

## 7. Nonzero cross pairing and principal-level integrality

Let y,y' be these complements in the two links. The matrix

    C=y* linkForm y'

is invertible. For if Ct=0, y't is orthogonal to y and to L0.
It is therefore orthogonal to ALL of link(gamma). That link
is maximal isotropic for the nondegenerate linkForm, hence
equals its orthogonal complement. Thus y't belongs to L0;
the complement property implies t=0. This argument also handles
i=0 using the empty determinant one. Positivity alone would
not imply this cross determinant is nonzero.

Let alpha=m0 z+y v and beta=m0' z'+y'v' be the actual integral
link lifts, and let their rational-adelic lifting vectors be
t,t'. Since L0 lies in BOTH isotropic links, its cross terms
vanish, so

    alpha*linkForm beta = v* C v'.

The exact identity for the two middle projections is

    alpha*linkForm beta
        = t* J (I-gamma gamma'^-1)t'.               (L17)

Move all terms to class-c lattice coordinates. The two term
positions k0,k0' are integral and have the SAME reduction s;
thus k0 k0'^-1 belongs to the actual principal level K(g),
g=q0 q1. The defining equality of K(g) with the unitary
congruence level says (I-k0 k0'^-1)/g is integral over R.
It uses the selected primes and their conjugates from the
original g_dvd_iff, not just one residue component. The class
Gram and both lifting vectors are integral. Consequently

    g^-1 v* C v' is integral, with nonzero determinant. (L18)

This proves the genIndex lower bound one at the actual
Liouville caller, including the SAME principal-level divisor.
The triangular kernel corrections have disappeared from the
pairing, rather than being dropped from the lift hypothesis.

Put A0=diag(linkForm.diag/Q1.diag). Explicitly its entries are
2,-2,-2,2 on the first X0,z,second X0,z blocks, so

    Q1 A0=linkForm,       A0*linkForm=4Q1.

Apply (L2) with a=g^-1 y, b=A0 y', and the SAME adelic v,v'.
Equation (L18) supplies x=1 and the preceding paragraph its
nonzero determinant. Taking norms in its two Gram matrices
gives

    1 <= (2/g)^(4if) d_y d_y'.                     (L19)

Indeed the g^-2 on an i-dimensional Gram determinant has
norm g^(-4if), while the factor four on the other determinant
has norm 2^(4if). These exponents include the two real
dimensions at each complex place.

Multiply the two instances of (L16), use (L19), and take
nonnegative square roots:

    pairInvariant(gamma,gamma') pairInvariant(gamma',gamma) x'^2
       <= (2/g)^(2if) classGauge(gamma)classGauge(gamma'). (L20)

This is pairInvariant_mul_le with its dimension inequality,
common i, equal-link case and actual integrality witnesses.
The x'>1 case uses section 5a at the SAME common reduction and
selected place family as the native caller.

## Scope and next actual caller

Sections 1-4 supply human derivations of Gram Liouville,
complementary discriminant, arbitrary-basis integral link lifts
with their exact three index costs, and orthogonal splitting.
Sections 5-7 supply the ordinary minor lower bound, the same-lift
common-link split and cross-pair determinant and integrality,
including the separate finite-fixer enhancement in section 5a.
These are new human proofs,
not newly executed Lean theorems. Their source paths are
BoxPartition, LinkPairing, StableCells, GramLiouville and
LatticeComplement at the pinned source, already authenticated
by the scalar/source certificate.

The source's positivity of classGauge and xRows/saturation indices
follows from (L9) and D>0. It therefore licenses the divisions and
square roots in sections 6-7. It does not by itself construct
pointwise classSize, which additionally uses the real Bessel
open-cell contraction and the actual cut error.

RESUME HERE: independently audit the selector/Eichler reduction
in section 5a and the exact index divisors (L8); then address
the pointwise classSize estimate. No new global witness, shell
sum or analytic-endgame optimization is needed.

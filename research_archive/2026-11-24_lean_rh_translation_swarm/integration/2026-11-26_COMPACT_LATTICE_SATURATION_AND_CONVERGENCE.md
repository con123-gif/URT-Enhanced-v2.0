# Geometric primitives: lattice discriminants, saturation and absolute convergence

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION; independent mathematical audit
and native replay of the replacement arguments remain outstanding. This note
does not assert a complete reconstruction of Theorem B or RH.

Source: Alpöge–Sernau and collaborators, `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact/src/`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
It continues `6bdfdba6` (weighted count) and `0a45200e` (congruence-fibre
injectivity), rather than repeating the global determinant argument.

Throughout, use the SAME native filling datum S. Put R=O_hat_E, f=[E:Q]/2,
n=rho+1, k=dim X0, r=k+2n-1, b>=1000, and tau=b^(kf/4). All indices are
cardinalities of the specified finite additive quotients. The native generalized
index of a nonzero rational a is |Norm_(E/Q)(a)|; it is not its square root.
For a lattice with Gram matrix G its discriminant here is sqrt([det G]).

## 1. Primitive Gram-index inequality

This supplies `GramLiouville.sublatticeDisc_mul_index_sq_le`.
Let H have a left inverse, V be an s-dimensional rational subspace, and m be
an adelic basis of the lattice of vectors in V which H makes integral. Thus Hm
is primitive: an integral left inverse exists. Let x be s rational columns in V,
w an invertible adelic matrix, and assume Hxw is integral and its Gram determinant
has nonzero generalized index D. Write xw=mA. The integral left inverse of Hm
shows that A is integral. Nonvanishing of D makes det A an idele. Therefore
q=[R^s:AR^s]=[det A] is a positive integer. Gram congruence gives the EXACT identity

    D = [det(A* (m*m) A)] = d(V)^2 q^2.                 (1)

Here * is conjugate transpose; conjugation preserves the generalized index.
If YHxw has columns in K, the quotient of the image of YHm modulo its
intersection with K is a quotient of R^s/AR^s. Its cardinality i divides q.
Consequently i>=1, d(V)>0, and (d(V)i)^2<=D. This proof also establishes the
nonzero-index guards; a comparison of covolumes alone would not give divisibility.
Primitive bases exist by completing integral primitive columns over each local
DVR and combining the local bases in R. This is the actual adelic lattice, with
no assumption that a projective O_E-module is globally free.

## 2. The convergent subspace discriminant sum

This supplies `NearTerms.tsum_sublatticeDisc_inv_le` from classical Minkowski
theory, with the source constant. Let L=uR^k for finite adelic unitary u, and
let d_u(T) denote the native discriminant of L intersect T. Put

    C_s=(200 f k rd_E)^[f(k+1)s].

Then, for each nonnegative integer s,

    sum_(codim T=s) d_u(T)^(-k-1) <= C_s.              (2)

Here is the quantitative proof, including convergence. Unimodularity of L
gives d_u(T)=d_u(T^perp). One way to see the normalization is to put
A=L intersect T and B=L intersect T^perp. Locally both are saturated. The map
from L to A^dual is onto, since a homomorphism on the primitive direct summand
A extends to L and L is self-dual. Its kernel is B. Hence
L/(A+B)=A^dual/A; exchanging A and B gives B^dual/B. Their Gram determinant
indices are equal, and so are their positive square roots. This is precisely
`jacobi_perp_discriminant` with no extra border.

Apply Minkowski's second theorem to the s-dimensional orthogonal complement.
In the source's dyadic form there are independent rational lattice vectors
x_1,...,x_s with T=intersection x_i^perp and

    (prod_i ||x_i||)^(2f) <= (8 f s rd_E)^(fs) d_u(T). (3)

For completeness, choose a rational basis of T^perp and integral adelic
coordinates, and orthonormal coordinates at infinity. If g is the resulting
adelic coordinate matrix, |det g|_A=d_u(T)^(-1). The dyadic successive-minima
bound is
|det g|_A 2^[2f sum_i a_i]<=(8 f s rd_E)^(fs), with
||x_i||<=2^a_i. This gives (3). It is the classical Minkowski bound in the exact
normalization used by `Lib/Adelic/Reduction/MinkowskiSecond.minkowski_second`.

The archimedean realization of nonzero vectors of L is 1-separated and each
vector has norm at least 1. Indeed its positive Hermitian squared norm is a
nonzero algebraic integer; the product of its positive conjugates is at least
1. Apply this also to differences. In real dimension D0=2fk, disjoint balls
of radius 1/2 show that the number with norm<=R is <=(1+2R)^D0. Layer cake
therefore gives, for an integer p>=D0+2,

    sum_(x in L, x!=0) ||x||^(-p) <= 5^p.             (4)

Explicitly the bound is at most 3^D0 p/(p-D0), by integrating
p integral_1^infinity N(t)t^(-p-1)dt. Since
p/(p-D0)<=1+p/2 and (1+p/2)3^D0<=5^p, (4) follows. This also proves convergence.

Take p=2f(k+1). Equation (3) implies
d_u(T)^(-k-1)<=(8 f s rd_E)^[fs(k+1)] prod_i||x_i||^(-p).
Choose one such ordered tuple for every T. Two different T cannot have the
same tuple, because the tuple determines its orthogonal kernel. Sum over all
tuples, allowing dependent tuples only to enlarge the nonnegative sum. Tonelli
and (4) give (200 f s rd_E)^[fs(k+1)]<=C_s when 1<=s<=k.
For s=0 the only subspace is E^k and its discriminant is 1; for s>k the sum
is empty. These cases are handled separately, not by an expression 0^0.

## 3. The actual class sum, including the N^(-kf) gain

This supplies `BlockBound.sum_latticeDisc_inv_le`, using the weighted
congruence lemma already proved in `2026-11-26_COMPACT_WEIGHTED_PAIR_COUNT.md`.
Let K0 be the standard maximal compact on X0, H0 the inverse image of the
lattice stabilizer under inclHFin, and h=[K0:H0]. The native admissibility
guard is h>=(N^k/b)^f. The marked row is reduced modulo piBar R, where
[R:piBar R]=N^f because piBar bar(piBar)=N.

Fix u and representatives phi of K0/H0. Write each u phi in its rational,
chosen-class and level factors, transporting rational subspaces by that SAME
rational factor. The lattice for its chosen class consists of the vectors
in uR^k whose marked row lies in piBar R. If m is a primitive basis of
uR^k intersect T, let i_phi(T) be the index of the marked-row image modulo
piBar R. Applying (1) gives

    d_class(transport T) >= d_u(T) i_phi(T).           (5)

The matrices consisting of that marked row are integral. Two with equal
residues on all columns lie in the same H0 coset: their quotient fixes the
marked row modulo piBar. This is exactly
`LatticeChart.inclHFin_mem_latStabilizer`, including its inverse and
conjugate-column integrality condition; piBar is a unit on at least one place
of each conjugate pair. Thus the congruence-fibre count is 1. Apply the actual
weighted inverse-index lemma with one output row, s complementary columns,
and exponent k+1 (the number of columns of m is k-s). It gives

    sum_phi i_phi(T)^(-k-1) <= N^[f(s+1)].             (6)

Equations (2), (5), (6), with nonnegative summation, yield

    sum_phi F([u phi]) <= C_s N^[f(s+1)],
    F(c)=sum_(codim T=s) latticeDisc(c,T)^(-k-1).       (7)

There is no assumption that the map phi -> class([u phi]) is injective.
Average (7) on the finite-volume definite quotient, using the SAME Haar
normalization. Right translation preserves this integral, so its left side
integrates to h integral F. The level `columnLevel` has trivial rational
stabilizers (a field of Filling), so dividing by its cell volume gives
integral F / integral 1 = (sum_c F(c))/#Classes. It follows that

    sum_c F(c) <= #Classes C_s N^[f(s+1)]/h
              <= #Classes N^(-kf) tau^(s+1).          (8)

For the last inequality use the ACTUAL guards
(200fk rd_E)^1000<=b, N<=b^(60n), and k>=512000n^9.
The exponent to check is

    1+60n(s+1)+(k+1)s/1000 <= k(s+1)/4.              (9)

It is uniform for all s>=0. The accompanying exact polynomial certificate
checks (9) on the unbounded domain by substituting n=1+u,
k=512000n^9+v and expanding in u,v,s: every coefficient of the difference
is nonnegative. Thus no unmentioned restriction on s or independently
chosen class representative is used. Finiteness of F follows first from
(7), since all terms are nonnegative; the subsequent class integral is
therefore an ordinary finite sum. This avoids assuming convergence in order
to prove it.

## 4. Saturation divides the actual frame-value index

This supplies case A of `BlockBound.sum_pairWeight_le`, the missing divisor
in the inner weighted count. Take congruent terms gamma,gamma' over the SAME
(c,s,c'), put V=commonLink(gamma,gamma'), and

    W=V intersect ker((frameMiddle gamma)_X0*).

Let X be the rational span of the isotropic e_a. For the gamma' term let
F'=(e | gamma'e), L'=F'R^(2rho), and
Lsat=ambient integral lattice intersect span(F'). All these expressions are
in the class-c lattice coordinates. Its finite index [Lsat:L'] is the native
saturationIndex(k'), k'=termPosition(c,c',gamma').

We first prove the geometric assertion used in the source P,w construction:

    gamma' gamma^(-1) p - p belongs to X+gamma'X
                 whenever p belongs to W in X0.      (10)

Since p is orthogonal to the WHOLE gamma-frame, gamma^(-1)p=a e+q with
q in X0 (both its e* and z coordinates vanish). Thus (p,q) is in link(gamma).
By commonLink, some (p,q') with q' in X0 is in both links. Subtraction gives
(0,q-q') in link(gamma). A link is isotropic for T direct-sum (-T), as follows
by applying the unitary isometry to its defining lifts. Positive definiteness
on X0 implies q=q'. A lift of (p,q) through gamma' has
gamma'(a'e+q)=b'e+p. Subtracting proves (10). This uses definiteness in its
actual rational X0 summand; no assumed equality of the two links.

Now use the principal-level congruence. For each integral adelic p in W,

    v_p=(p-gamma' gamma^(-1)p)/g

is integral in the class-c lattice, since gamma' gamma^(-1)-1 is divisible
by g there. By (10), v_p is also in span(F'), hence in Lsat. Let
lambda(t)=(gamma'f)* J t be the frame pairing and put P(t)=g lambda(t).
Orthogonality to gamma f and isometry give

    lambda(p)=P(v_p),
    P(L')=g colLattice(xRows Z(gamma'))*.              (11)

The second equality is the direct block pairing with e and gamma'e: the
latter columns pair to zero, and the former give xRows Z adjoint, with the
same sign convention as native frameGram. Therefore the image of the
integral W-lattice under lambda, modulo that g-column lattice, is a subgroup
of P(Lsat)/P(L'). This latter quotient is a quotient of Lsat/L'. Lagrange's
theorem for these FINITE additive groups gives the required exact divisor

    frameValueIndex(c,k',gIdele,W) | saturationIndex(k'). (12)

The finiteness is justified by the integral rational generators of F': a
nonzero minor clears its saturation denominator, with a unit minor almost
everywhere. Equivalently use the native `one_le_xRowsIndex_and_saturationIndex`.
This is the divisor for the actual inner count at codimension <=i+n:
restriction of the frame map to V has at most n-dimensional range, so
codim W<=i+n. Together with (8), the already reconstructed outer divisor,
and congruence-fibre injection at `0a45200e`, it supplies the previously
retained lattice/saturation inputs of the pair-weight sum, whose value is
<=2tau^2. The pointwise pairInvariant and classSize estimates remain distinct.

## 5. Absolute amplitude convergence and the full-to-cut error

This supplies `AmplitudeSums.amplitudeAbs_lt_top_and_cut_le` and
`summable_amplitude` from the precise native Bessel-system hypotheses.
Retain each local `IsCutPair.exists_majorant`: a measurable left-U-invariant
A_v>=0 and finite measure m_v such that, for sigma=full or cut,

    b^[3r^3f 1_(W_full(y)!=W_cut(y))] ||W_sigma(y)|| <= A_v(y),
    A_v(y) <= m_v{a : InCut(ya,b)},
    m_v(G) integral_(U\G) A_v <= b^(2r^3) d_v,       (13)

where d_v=dim I_v. These are hypotheses of the ACTUAL BesselSystem, not
consequences of L2 closeness alone. Its construction from discrete series
remains on the separate Bessel-system dependency chain.

The boxed-frame counting estimate at the actual level, for fixed (c,s), is

    sum_(c',gamma) beta_c'(gamma^(-1)y)
        1_(InCut((gamma^(-1)y)a,b)) <= b^(12frn^3).    (14)

Its ambient real frame dimension is exactly 2frn. In its subspace version
the packing constant is b^[6n^2 dim_R V]. To obtain (14), move a cut point
to boxedPoints by a class-unipotent element and reindex the cutoff, whose
translates sum to 1. Distinct resulting frame classes are separated by
1/(N boxSize): otherwise their integral Gram and triangular frame-coordinate
differences have every conjugate of norm <1, hence vanish by the algebraic
integer norm argument. The triangular induction removes the isotropic rows
in reverse order; the residual X0 vector has zero positive norm and vanishes.
Equality of frames identifies the same class-unipotent orbit. All frames are
in the ball of radius boxSize. The disjoint-ball bound
(1+4N boxSize^2)^[dim_R V]<=b^[6n^2 dim_R V] gives (14).
This is the source `BoxPartition.tsum_classCutoff_box_le`; it uses its level,
box, integrality and cutoff hypotheses, not discreteness of arbitrary frames.

Integrate (14) against product m_v, and use (13) and Tonelli. With
A(y)=prod_v A_v(y_v) and M=prod_v m_v(G),

    sum_(c',gamma) beta_c'(gamma^(-1)y) A(gamma^(-1)y)
        <= b^(12frn^3) M.                            (15)

The original product cutoff integrates an invariant function with factor
nu=unipCovolume, so integrating beta_c(y)A(y) times (15) gives

    sum_(c',gamma) integral beta_c(y) beta_c'(gamma^(-1)y)
                        A(y)A(gamma^(-1)y)
       <= nu b^[12frn^3+2fr^3] prod_v d_v < infinity. (16)

The kernel norm is exactly the product of its two Bessel-vector norms; (13)
dominates it by the integrand in (16). Consequently every amplitude is
Bochner integrable and the amplitudes form an absolutely summable family.
This establishes the sum/integral exchanges used in the moment and orbital
arguments, rather than postulating them.

If the full and cut tensor kernels differ, at least one local vector at one
of the two arguments differs. The corresponding factor in (13) supplies
b^(-3r^3f). The triangle inequality therefore bounds the norm of their
difference by 2b^(-3r^3f)A(y)A(gamma^(-1)y). Applying (16) and
prod_v d_v<=b^(2kf) bounds the total error by

    2nu b^[f(12rn^3-r^3+2k)] <= (nu/2)b^(-k^3f).    (17)

Indeed r=k+2n-1 and k>=512000n^9 imply
r^3-k^3-12rn^3-2k>=1. Thus the left side is at most
2nu b^(-k^3f-f)<=(nu/2)b^(-k^3f), using f>=1,b>=4.
The exact unbounded-domain polynomial certificate checks this exponent too.
The squared energy normalization remains nu^(-2); (17) introduces no new Haar
or finite-place cardinality factor.

## 6. Changing cutoff is justified before using orbital transport

This supplies the relevant absolute-integrability step of
`AmplitudeSums.hasSum_amplitudeSum_change_of_weight`.
On the countable term set times G_infinity, let
Delta=classUnip(c) times classUnip(c') act by
(u,u'):(gamma,y)->(u gamma u'^(-1),uy). Counting times Haar measure is
invariant. The kernel and its norm are invariant: the two actual unipotent
characters at principal level cancel. The original product cutoff beta and
any proposed measurable nonnegative phi satisfy sum_delta beta(delta x)=
sum_delta phi(delta x)=1. For every invariant F>=0, Tonelli and change of
variables give

    integral beta F
      =sum_delta integral beta(x)phi(delta x)F(x)
      =integral phi F sum_delta beta(delta^(-1)x)
      =integral phi F.                               (18)

Apply (18) first to the kernel NORM, using the finite bound (16), and then
to its real and imaginary coordinates. This proves integrability and equality
for the vector-valued kernels. Apply it to the norm of the full-to-cut
difference to transfer (17). Freeness of the Delta action is not used in
(18); existence of a cutoff and invariance are the exact assumptions.
This validates the finite orbital unfolding and the coherent-link caller.

## Caller map and remaining obligations

| Result here | Actual consumer | Still required at that consumer |
|---|---|---|
| (1) primitive Gram-index inequality | BlockBound class sum; LinkPairing | actual primitive integral lifts |
| (2), (8) subspace and class sum | BlockBound.sum_pairWeight_le | native finite data and scale guards |
| (12) saturation divisor | inner count in sum_pairWeight_le | same congruent pair; peer fibre injection |
| (16), (17) convergence and cut error | moment unfolding; SchurTest.energy_sub_cut_le | native Bessel majorants and boxed-frame hypotheses |
| (18) cutoff transport | finite orbital/coherent-link assembly | actual invariant kernel and cutoff sum one |

This note does not discharge the local Fourier-modulus/Heisenberg/floor,
shell-geometry/descent suppliers, pointwise classSize/pairInvariant estimates,
or construction of the Bessel majorants. The boxed-frame separation in (14)
is a source-matched explanation of the native input; its detailed coordinate
induction still needs an independent human audit. It does not discharge any outstanding
A or C primitive. The common-witness determinant and analytic endpoint are
unchanged. Proof text and scalar/source checks are distinct from native Lean
verification. The latest published RUN28 evidence has full_RH_replay=false;
RUN29 primitive output was absent when this note began.

Independent review: after these arguments were drafted, `15bb1dae` landed with
the Landau worker's absolute-convergence reconstruction. Sections 5–6 above
AGREE with its analytic aggregation and cutoff calculation, under the same
majorant and frame-count hypotheses. Neither argument proves the majorant
constructor. This overlap is recorded as a REVIEW, not a second new primitive.
The peer obtains a slightly stronger exponent slack; the sufficient native
bound (17) is identical. No extra scheduled worker or competing replay was
started.

RESUME HERE: independently audit (10)-(12) at the exact BlockBound inner
index caller, and (5)-(8) at its marked-row class integral; then reconstruct
the actual LinkPairing primitive lift/minor bounds and pointwise estimates,
or the local Fourier modulus/shell/descent cluster. Do not reprove the
outer scalar pair summation or the determinant endgame.

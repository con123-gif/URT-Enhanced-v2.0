# RUN90 — dyadic Minkowski and the subspace-discriminant sum

27 November 2026. HUMAN SOURCE-MATCHED REVIEW; B2 remains PARTIAL.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: current mission 3adc7622 and amendment 99cfbd1f, live spine
87c621d0, current LIVE_OBLIGATIONS, HUMAN_PROOF_COMPACT (relevant B
section), SWARM_PROTOCOL 4b77b161, AGENTS 8db0201d, handoff, expansion,
Cathedral state/log/protocol and continuity records consulted.
Current CI summary 1dc1b93e, run 46059983549 is Cathedral CI, not a fresh
RH replay. Read RUN89 1d0fca9 and existing integration/2026-11-26_
COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md (blob 694fc9ad) section 2.
That section already supplies the height sum; the new audit below
expands its dyadic Minkowski primitive and checks the determinant
normalization. Recent Landau RUN86 796fd65b is B3 replay, not this task.

## 1. Source anchors and native premises

New/Filling/NearTerms.lean blob bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
27–60 Filling.siegel_lemma, 65–83 Filling.tsum_sublatticeDisc_inv_le.
Lib/Adelic/Reduction/MinkowskiSecond.lean
cc0f8a639dfe23caf2ca91b348a09628e60f814e, 28–55 adelic counting/first
minimum existence (use the named minkowski_first and
exists_ne_zero_inv_mulVec_mem), 129–149 norm/determinant conventions,
157–193 minkowski_second, 195–199 tuple sum inequality.
GramLiouville.lean e0e55155b72a00bb6c11d618bf1961e52a4e696c, 40–59,
chosen primitive adelic basis and d definition. BlockBound.lean
6c68e80e3b1ea2b7983696716305493a37f2b1fd, 21–73, specifically line 35
uses the resulting sum for the SAME u and codimension s.

Keep CMType E, StablyUnram E, f=numInfPlaces E>=1, k=card kappa,
u a finite adelic unitary, and s a natural number. Let R=O_hat_E,
L=E^k intersect uR^k. Write I for genIndex, and d(T) for the native
sqrt(I(det m* m)) for a primitive basis of the adelic T-lattice.

## 2. Actual dyadic Minkowski argument (expanded primitive)

For any g in GL_s(A_E), s>0, consider rational invertible basis
matrices Y (vectors as columns) and integer profiles x=(x_i):
g^-1 Y_i integral at finite places, combined Euclidean norm across
all complex places at most 2^x_i. Such profiles exist: choose
nonzero rational integer multiples of coordinate vectors clearing
the finitely many finite-place denominators, then round archimedean
lengths UP to dyadic powers. We want

    |det g|_A 2^(2f sum_i x_i) <= (8 f s rd_E)^(fs).    (90.1)

If no such profile exists, every feasible sum is strictly above
the fixed real threshold obtained by taking logarithms in (90.1).
Hence their nonempty subset of Z has a least element; choose Y,x
attaining it (this is precisely the source's contrary-assumption
minimality proof, not compactness of the set of bases).

Change rational coordinates by Y^-1: let (A_w,B) be the infinite
and finite components of Y^-1 g. Product formula gives
|det(Y^-1 g)|_A=|det g|_A. Order coordinate indices by increasing
x_i, breaking ties arbitrarily. At each complex place w take QR
of A_w^-1 in this order:

    A_w^-1 = Q_w R_w, Q_w* Q_w=1,
    (R_w)_ij=0 if i>j in the chosen order.

Put h=2 sqrt(fs)>0, b_w=(h R_w)^-1. Then
A_w^-1 b_w=Q_w/h, and |det b_w|^2=|det A_w|^2 h^(-2s).
Let D_x=dyadicDiag x (finite component 1), and
g'=mkAdelicGL((b_w)_w,B) D_x. Exact determinant normalization:

    |det g'|_A
       = |det g|_A 2^(2f sum_i x_i)/(4fs)^(fs)
       > (2 rd_E)^(fs).                              (90.2)

The inequality is the contrary assumption. Apply the actual
exists_ne_zero_inv_mulVec_mem to g' (Minkowski first with the strict
threshold, itself supplied by the adelic Blichfeldt count).
It yields c in E^s, c!=0, with B^-1 c integral and
|(b_w^-1 c)_i|<2^x_i at every w,i. Choose j LAST in the chosen
order among the nonzero coordinates of c. Then c_j!=0 and
x_i<=x_j on the support. Upper triangularity gives
(b_w^-1 c)_i=0 for every index AFTER j. Consequently

    sum_w ||A_w^-1 c||^2
      = h^(-2) sum_w ||b_w^-1 c||^2
      <= (fs)/(4fs) * 2^(2x_j)
      = 2^(2(x_j-1)).                                 (90.3)

Replace column j of Y by Yc, retaining the other columns.
Its determinant is det(Y)c_j !=0 by multilinearity; this
replacement is integral in g's finite chart because B^-1 c
is integral. By (90.3) the modified profile is x-e_j,
contradicting minimality. This proves (90.1).
The case s=0 is the unique empty basis and determinant 1.
The retained first Minkowski theorem is a separate native
primitive; no appeal to a conjectural lattice distribution.
This is the column-form version of the source row update,
using the SAME rational basis in both finite and infinite charts.

## 3. Exact norm-to-discriminant transfer at siegel_lemma

Let W=T^perp with dim_E W=s. Native Jacobi/complementary Gram
identity (RUN86) gives d(W)=d(T) because uR^k is self-dual.
Choose a rational column basis y of W and a in GL_s(A_f) such that
m=hat(y)a is the full adelic W-lattice basis. Fullness follows
from the integral left inverse of u^-1 m as in RUN89.
At w let G_w=y_w* y_w>0 and choose r_w with
r_w* G_w r_w=1 (e.g. inverse positive square root). Thus
y_w r_w is an isometry and |det r_w|^2=(det G_w)^(-1).
Set g=mkAdelicGL((r_w)_w,a). Since det(y*y) lies in the real
subfield and is positive at every complex place,

    I(det(hat(y)*hat(y))) = prod_w (det G_w)^2,
    I(det(m*m)) = (I(det a) prod_w det G_w)^2,
    d(W) = I(det a) prod_w det G_w.

The finite idele modulus is I(det a)^(-1); hence

    |det g|_A = [I(det a) prod_w det G_w]^(-1)
              = d(T)^(-1).                             (90.4)

This is the exact normalization in NearTerms 58–60; not d^(-2)
and not a bare archimedean covolume. Applying (90.1) to g gives
basis columns Y_i of E^s. Their finite coordinates a^-1 Y_i
are integral, so X_i=yY_i are in L. At infinity y_w r_w is
an isometry, so their original native Euclidean norms are at
most 2^x_i. They are independent and their common Hermitian
kernel is exactly T by positive definiteness and dimension.
Combining (90.1) and (90.4) gives the precise supplier

    (prod_i ||X_i||)^(2f) <= (8fs rd_E)^(fs) d(T).       (90.5)

All determinants are nonzero units adelically, including the
empty-dimensional convention. No replacement by globally free
O_E-basis or by independent archimedean-only choices.

## 4. Summation audit and caller bridge

For x!=0 in L, its Hermitian squared norm x*x is a nonzero
totally positive algebraic integer, since u^-1 x is integral
and u is unitary at every finite place. Some real conjugate is
>=1 by its integer norm. Thus the combined Euclidean norm
is >=1, also for x-y!=0 in L. In real dimension D=2fk, the
nonzero lattice vectors of norm<=t have disjoint radius-1/2
balls, giving N(t)<=(1+2t)^D. For k>0 and p=2f(k+1)>=D+2,
nonnegative layer cake gives

    Z=sum_(x!=0) ||x||^(-p)
      = p integral_1^infty N(t)t^(-p-1) dt
      <= 3^D p/(p-D) <= 5^p.                           (90.6)

The last inequality follows from D<=p, p/(p-D)<=p/2,
and p/2<=(5/3)^p for integer p>=2 (base p=2; successive ratio
(p+1)/p<=3/2<5/3). This provides a direct proof of the needed
separated-set estimate without assuming convergence in advance.

For 1<=s<=k, choose one ordered tuple X per T from (90.5).
The map tuple -> common Hermitian kernel determines T, so
the chosen tuple map is injective. Since all summands are
nonnegative, raising (90.5) to power k+1 and dividing by its
positive factors yields

    sum_(codim T=s) d(T)^(-k-1)
      <= (8fs rd_E)^[fs(k+1)] Z^s
      <= (200fs rd_E)^[fs(k+1)]
      <= (200fk rd_E)^[f(k+1)s].                      (90.7)

The tuple bound is Tonelli for a finite Cartesian power
(or the exact native tsum_prod_le_prod_tsum inequality).
Dependent tuples can be included in the upper bound, not in the
choice proving the kernel condition. The s=0 term is unique:
T=E^k, its self-dual lattice has d=1. For s>k there are no
terms. This includes k=0, s=0 with the native empty product 1;
no division by zero or positive-exponent assumption there.
Equation (90.7) is the exact ENNReal bound of NearTerms.65–83,
and thus gives the finite factor in BlockBound.35; retain all
class/coset, congruence-index and size hypotheses of that caller.
Use RUN89 (89.3)–(89.5) and the existing section 3 class bound,
not a new independent optimization or modified constants.

## 5. Failed shortcuts / verification

- Using d^-2 in (90.4) is wrong. Algebraic normalization example:
  E=Q(i), u=1, W=span(1,1), a=1, Gram determinant 2, d=2 and
  r=1/sqrt(2); idele modulus is 1/2, not 1/4. This small example
  illustrates normalization, not a claim of StablyUnram native data.
- Arbitrary orthonormalization without ordered triangularity is
  insufficient: a permutation exchanging two coordinate axes
  with x=(0,10) sends a vector supported on the first to the
  high-profile coordinate. One cannot deduce the support bound
  used in (90.3) from unitarity alone.
- The strict first-Minkowski threshold in (90.2) follows from
  the contrary assumption; one cannot assume strictness when
  |det g'| equals the threshold.
- Mere separation of a set not containing zero does not give
  every norm>=1 (a singleton epsilon, 0<epsilon<1). Use the
  additive lattice norm argument; likewise p=D is generally
  divergent (Z^D for D>=1, dyadic annuli).
- A count of all short tuples without a determined orthogonal
  kernel need not bound the count of subspaces. The injection
  is the essential link.

Actual verification: read exact pinned source for all three
modules and named BlockBound caller, checked the determinant and
ordered-QR minimality algebra and real summation proof by hand.
No local Lean run or fresh kernel result. Existing fused B2 replay
and graph audit are separate. The new contribution is the expanded
dyadic primitive and explicit determinant transfer, independently
auditing the existing subspace-sum derivation, not a new global
theorem or claimed speedup. URT-style ordering and cancellation
suggest the minimal-profile proof, whose validity rests entirely
on QR, product formula, first Minkowski and the lattice identities.
No protected file, live ledger, workflow or schedule edits.

RESUME HERE: independently audit the finite-refinement class-average
candidate at specialists/proof_editor/2026-11-27_FINITE_CLASS_AVERAGE.lean
(80f4ff6e), specifically coset orientation and aut_columnLevel
uniform fibres at BlockBound.65–73. Reuse (90.7), RUN89 and the
existing class average; do not repeat their derivations.
HANDOFF TO integration/audit: (90.1)–(90.5) expand the actual
Minkowski/Siegel primitive and (90.7) confirms the exact caller
constant. Full B2 human assembly and RH remain OPEN.

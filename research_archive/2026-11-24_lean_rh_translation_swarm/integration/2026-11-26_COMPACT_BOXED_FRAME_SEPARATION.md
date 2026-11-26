# Boxed-frame separation and the weighted frame count

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION, independent audit and
native replay outstanding. Source: Alpöge–Sernau and collaborators,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

This supplies BoxPartition.tsum_classCutoff_box_le at its actual
AmplitudeSums and ThinClasses callers. Peer b18678e2 already constructs
the required Bessel majorant with the same local measure and normalized
mass. It retains precisely the boxed-frame separation proved here;
do not duplicate its peak normalization argument.

Fix the actual Filling S and IsAdmissible, n=varrho+1, h=varrho,
B=boxSize=b^(2n^2), R=b^(6n+2). The native hypotheses give

    n>=100001, b>=1000, N<=b^(60n),
    1<=|kappa_v|<=b^23.

The scale of the b-th raw frame vector is
alpha_(v,b)=kappa_v^(h-b)/sqrt(N), including alpha_(v,h)=1/sqrt(N).
All frame norms below are the Euclidean norms of the NORMALIZED
complex frame, as in FrameNorm; rational integrality is asserted
in the ORIGINAL class lattice coordinates.

## 1. Separation: closeness forces exact frame equality

Let gamma,gamma' be two supported terms over the same (c,s), possibly
with different final classes. Assume both gamma^-1 y and gamma'^-1 y
are boxed. Let F_gamma(v) be the columns
y_v^-1 (ratToInf gamma)_v f_b. If

    ||F_gamma-F_gamma'||_sup < 1/(N B),             (B1)

then their rational frame images are equal.

Set g=gamma^-1 gamma' and Y=gamma^-1 y. Write
Delta_(v,b)=Y_v^-1 (g_v-I)f_b. Its norm is bounded by the left
side of (B1). The two sets of columns Y_v^-1 f_a and
Y_v^-1 g_v f_b have norm at most B.

First compare their hermitian products. In normalized coordinates

    |h(f_a,(g_v-I)f_b)|
      =|h(Y_v^-1 f_a,Delta_(v,b))|
      <= B ||Delta_(v,b)||,

since the normalized Gram J1 is a hermitian involution of operator
norm one. Passing back to rational frame products divides by
alpha_(v,a)alpha_(v,b), whose modulus is at least 1/N.
Consequently every infinite embedding of

    Z(g)_(a,b)-Z(1)_(a,b)

has modulus <1. This difference is an algebraic integer, by
integrality of the actual termPosition and its unimodular lattice
Gram. A nonzero algebraic integer has nonzero integer absolute
norm, at least one; the product of its conjugate moduli would
instead be <1. Therefore Z(g)=Z(1) exactly.

For each rational column d_b=(g-I)f_b this equality says its
dual-isotropic and z coordinates vanish. It also gives

    h(d_b,d_b)
       =h(gf_b,gf_b)+h(f_b,f_b)-2Re h(f_b,gf_b)=0.

The remaining middle X0 form is positive definite at every
infinite place. Hence its X0 component is zero. Thus all d_b
lie in the ORIGINAL isotropic span X; this step uses actual
definite rigidity, not a norm estimate on an indefinite form.

Because Y is in cut support, choose u_v in the actual Bessel
unipotent with ||u_v Y_v||<=R. No bound on u_v itself is assumed.
Then

    ||u_v (g_v-I)f_b|| <= R ||Delta_(v,b)||.         (B2)

Recover the rational isotropic rows in descending a. On X the
matrix u_v is upper unitriangular. Once all rows above a have
vanished, the a-th entry of u_v(g_v-I)f_b is exactly that of
(g_v-I)f_b. Returning to raw coordinates costs at most
|alpha_(v,a)/alpha_(v,b)|<=b^(23h). Thus the rational entry
g_(e_a,f_b)-I_(e_a,f_b) has every conjugate bounded by

    b^(23h) R ||Delta_(v,b)||
       <= B ||Delta_(v,b)|| < 1.                   (B3)

The sufficient exponent comparison is
23h+6n+2=29n-21<=2n^2, valid for n>=100001.
These particular rational entries are algebraic integers:
classCoord is the identity in the isotropic rows and the
termPosition frame columns have the native integral entries.
The same norm argument makes them zero. Descending induction
proves (g-I)f_b=0 for all b, hence gamma f=gamma'f.

This proof preserves all conjugates in the strict <1 step.
A small value at a single infinite place would not prove
an algebraic integer zero. The factor N in (B1) occurs
because the raw frame scale is alpha, not one.

## 2. Packing only distinct frames

Suppose all supported frame differences lie in a real subspace V
of dimension d. Choose one representative for each DISTINCT frame.
The preceding argument makes these representatives epsilon-separated,
epsilon=1/(N B). After subtracting one fixed frame their norms
are at most 2B. On every finite subset the disjoint open balls
of radius epsilon/2 lie in the ball of radius 2B+epsilon/2.
Comparison of their real Haar volumes gives

    #distinct frames <= (1+4 N B^2)^d <= b^(6n^2 d). (B4)

For the last inequality use N<=b^(60n), B=b^(2n^2),
1+4u<=5u<=bu for u>=1, and
4n^2+60n+1<=6n^2. Finite-subset bounds establish the same
cardinality bound without presuming finiteness of the original
support. No coordinates in a larger ambient space enter d.

## 3. The equal-frame fibres have weight at most x

Keep the actual hypotheses of tsum_classCutoff_box_le:
the labels p->(k_p,delta_p) are injective; gamma_p lies over
(c,s,k_p); delta_p^-1 gamma_p belongs to classUnip(k_p);
and

    w_p<=x beta_(k_p)(delta_p^-1 y').

If gamma_p and gamma_q have the same frame, the native
termsOver.eq_and_mem_classUnip0 gives

    k_p=k_q,       gamma_p^-1 gamma_q in classUnip0(k_p).

The class equality uses the SAME principal column level and
its freeness: a frame-fixing isometry lies in U0 H, and its
integral H component identifies the two definite class
representatives. The residual class automorphism is trivial
by the specified free level, leaving precisely U0. This is
the term/class identification at the caller; frame equality
alone without the common term data would not identify classes.

Fix one p0 in a nonempty fibre, with common class k. Every
delta_p can be written gamma_p0 u_p, u_p in classUnip(k).
The u_p are distinct because the original labels (k,delta_p)
are injective. The cutoff has its exact partition identity

    sum_(u in classUnip(k)) beta_k(u z)=1.

Therefore, with the same z=gamma_p0^-1 y' and reindexing by
inversion,

    sum_(p in this fibre) w_p
       <=x sum_(u in classUnip(k)) beta_k(u^-1 z)
       =x.                                        (B5)

This also covers infinitely many terms in one fibre: Tonelli
applies to their nonnegative cutoff weights. Multiplying (B5)
by the bound on the number of fibres in (B4) gives

    sum_p w_p <= b^(6n^2 dim_R V) x.                (B6)

This is the actual weighted frame-count theorem. Replacing
the fibre by its unweighted cardinality would be invalid.

## 4. Insert the new majorant peer without changing witnesses

Peer b18678e2, COMPACT_RUN54_BESSEL_MAJORANT_CONSTRUCTOR.lean,
constructs the actual local controlling measure and majorant
from one native HasPeakAt witness Y,x,P. Its key identities are

    Phi(y)=integral_graph (2/||x^-1 s y||)^(2M) ds,
    A0=c Phi,       m0=c mu,
    m0(G) integral A0 <= card(I) b^(2r^3),

where c normalizes Y by its OWN quotient L2 mass. The unknown
peak height cancels using the reproduction/Cauchy–Schwarz
inequality before the scalar bound is taken. On a mismatch
between full and cut functions the SAME A0 bounds both norms
with multiplier b^(3r^3 f). Its finite mu, graph disintegration,
peak positivity and nonzero quotient norm are essential.

Use (B6) on the same local majorant product and integral
weights, as in the lattice/convergence note, in real dimension
2f r n. It gives the packing factor b^(12f r n^3); the peer's
normalized mass product then yields the finite global majorant
J and the full-to-cut error already computed there. No new
normalization, independent majorant or implicit frame count
is introduced. This closes the boxed-frame supplier left in
that convergence argument as a human derivation.

## Exact remaining pointwise class-size frontier

The next distinct step is SchurTest/ThinClasses/BlockBound:
the thick class uses the actual open-cell mean-square Bessel
contraction and its explicit cellMass budget, plus the cut
error. Thin classes use the frameVolume kernel, integral
middle-row translates, opposite Schur weights and their
quantitative Hua integral. The present packing theorem
supplies a counting input to both; it does not prove either
pointwise classSize estimate alone.

The local open-cell theorem must give an ACTUAL probability
law of t in U0 H, a common compact support A and a finite
measure n with mass at most cellMass. A product of those
laws gives the tensor contraction before selecting one t.
Marginal distributions of frame coordinates cannot replace
that joint law. The quantitative Sobolev/Gram-section tube remains essential
at the thick caller. The thin frameVolume kernel and its full
Schur/classSize consumer are now expanded in the companion
2026-11-26_COMPACT_THIN_CLASS_VOLUME_KERNEL.md, pending audit.

Source paths used: Setup, NearTerms, BoxPartition, FrameNorm,
AmplitudeSums, SchurTest, ThinClasses and OpenCellBound.
The new geometric argument needs independent audit and
native replay of its replacement lemmas. The scalar/source
certificate authenticates bytes and exponent comparisons
only; no RH or human-proof verification is inferred.

RESUME HERE: complete the actual open-cell Bessel contraction
and cellMass/classSize comparison. Audit the companion thin
frameVolume kernel/Schur proof instead of repeating it. Preserve the same probability laws,
free-level class labels, all frame scaling and strict
all-conjugate <1 bounds.

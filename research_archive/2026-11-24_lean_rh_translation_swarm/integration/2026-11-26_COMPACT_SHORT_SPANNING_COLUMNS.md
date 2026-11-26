# Short integral columns span, with the actual ramified bound

26 November 2026. Human derivation with an established transference
theorem; source-matched, independent mathematical audit pending.
This supplies span_isShort_eq_top and span_short_ramifiedColumns at
Data.short_forms. The separate archimedean norm of the lifted chain
and the seesaw/Hecke identities retain their own suppliers.

Source pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
under grh-compact/src. Actual statements and bodies read:
New/Columns/ChainValuation.lean (98--155, 185--258),
Lib/Adelic/Transference/MassBasic.lean (33--110),
Lib/Adelic/Reduction/FirstMinimum.lean,
Lib/Adelic/CuspForms/ClassReps.lean (107--130),
Lib/Adelic/CuspForms/DeltaForms.lean,
Lib/GLn/SchurModule/Gram.lean and Hook.lean,
Lib/GLn/Branching/BranchingVector.lean (23--65),
New/Endgame/ShortAndEnough.lean (138--169).
Credit the original formal authors Alpoge, Sernau and collaborators.

## 1. Uniform short matrices at every adelic class

Let E be the actual CM field, f=[E:Q]/2, n>=1 and N>=1 an integer
in the absolute different ideal. Put

\[
                         R=6N(fn)^2.                  \tag{1}
\]

For every finite unitary g let L_g be the Hermitian lattice of rational
vectors x in E^n with g^{-1}x integral at all finite places. Its
completions are g O_w^n, so the standard Hermitian pairing makes it
unimodular: this follows by local duality and localization of the
finite lattice. Under the CM embedding its Euclidean lattice Lambda_g
has real dimension D=2fn, with inner product Re sum_tau x_tau^* y_tau.
Every nonzero vector has length at least one. Indeed, a shorter
vector would have a nonzero totally positive integral self-pairing
with every conjugate below one; its rational norm would be a positive
integer below one. Definiteness excludes zero self-pairing.

The Euclidean inner product is HALF the rational trace of the
Hermitian pairing. Therefore the trace-dual computation gives

\[
 \Lambda_g^*=\operatorname{arch}(2\mathfrak d^{-1}L_g)
                  \subseteq (2/N)\Lambda_g,\qquad
                  \lambda_1(\Lambda_g^*)\ge 2/N.       \tag{2}
\]

The inclusion uses N in the different; it is not a claim that N
generates it. To see the dual formula, test the trace pairing on
every a x with a in O_E: membership is exactly that each Hermitian
pairing lies in 2 times the codifferent. Unimodularity then gives
the displayed fractional lattice. The factor 2 must be kept.

An established Euclidean transference theorem now suffices. We use
Miller--Stephens-Davidowitz, *Kissing numbers and transference theorems
from generalized tail bounds*, Theorem 3.2 / (3.3), read in the
primary paper https://arxiv.org/pdf/1802.05708, printed page 8:

\[
 \mu(\Lambda)\lambda_1(\Lambda^*)
       \le D/(2\pi)+3\sqrt D/\pi\le D^2\quad(D\ge2).    \tag{3}
\]

Its hypotheses are exactly a full-rank lattice in real Euclidean
space, with the usual integral inner-product dual. They hold for
Lambda_g, and D>=2 because E is CM and n>=1. No asymptotic estimate
or norm other than Euclidean is substituted. With (2), its covering
radius is at most C=N D^2/2=2N(fn)^2.

The vectors of length at most 3C span the real space: if their span
were proper, choose a unit vector v perpendicular to it and a lattice
point within C of 2Cv. That point has length at most 3C and scalar
product at least C with v, a contradiction. Real spanning also forces
E-spanning, so choose n E-independent such vectors. Their columns
give Y_g in GL_n(E), with

\[
       g^{-1}Y_g\text{ integral at every finite place},\qquad
       |\phi(Y_g)_{ij}|\le R\text{ for EVERY embedding }\phi:E\to C.
                                                               \tag{4}
\]

These are E-bases, not asserted integral O_E-bases. This is all the
actual column construction needs. Choose Y_g once for each g; the
same choices will be used at all primes and all conjugations.

## 2. Clear determinant twists without a cost proportional to the exponent

Fix the actual weight (kappa,e), let b_kappa be its number of boxes
at heights strictly below n, and take M>=nf+b_kappa. The level K
has trivial rational stabilizers; retain its finite class set and
the usual free class-coordinate equivalence. For each representative
c, form the coefficient matrix

\[
 A_c=\left(\prod_\tau\det\phi_\tau(Y_{c^{e_\tau}})\right)
                             S_\kappa(\phi_\tau(Y_c)) .          \tag{5}
\]

Here phi_tau is the actual CONJUGATE weight embedding, and S_kappa
is the integral Schur matrix. Equation (5) uses Y at the powered
adele c^{e_tau}; it does NOT raise det(Y_c) to e_tau. It is valid
for positive, zero and negative e_tau. Every factor is nonzero
and the Schur matrix is invertible, so A_c is invertible.

Let ev_y be the native vector of basis minor products evaluated at
an array y whose entries are roots of unity. The vectors ev_y span
the coefficient space: a functional killing all of them gives a
polynomial zero on a Cartesian product of infinite root-of-unity
sets. Induction on the variables makes that polynomial zero, and
independence of the basis minor products makes the functional zero.
Hence the A_c ev_y span too. The delta forms at all classes with
these coefficients therefore span the ACTUAL column space.

At any p-adic embedding the gauge at c multiplies the coefficient
by the rational representation of c^{-1}. In its Schur factor this
gives S_kappa(c^{-1}Y_c), an integral matrix by (4). In its tau
determinant factor the product is exactly

\[
           \det(c^{-1})^{e_\tau}\det(Y_{c^{e_\tau}})
                   =\det(c^{-e_\tau}Y_{c^{e_\tau}}),              \tag{6}
\]

read at the same embedding. That matrix has integral entries by
(4), even when e_tau is negative. Root-of-unity entries are p-adic
units and Schur polynomials have integer coefficients. The gauge is
therefore at most one. Right-level invariance, rational equivariance
and the trivial stabilizer propagate this to the delta form at
every adelic point. All primes use the SAME A_c ev_y.

## 3. Bound all conjugates in the actual Gram norm

Let sigma be any complex field automorphism. Its restriction after
an embedding of E is still an embedding of E, and a root of unity
remains one. Thus (4) holds after sigma and every y-entry still has
absolute value one. Since R>=n, Hadamard or the operator norm gives

\[
 \left|\prod_\tau\det\sigma\phi_\tau(Y_{c^{e_\tau}})\right|^2
                           \le R^{4nf}.                        \tag{7}
\]

Indeed an n by n matrix with entries bounded by R has operator norm
at most nR and determinant at most (nR)^n<=R^{2n}.

Write X_tau for the square part of sigma(y). The native evaluation
identity is ev_(sigma y)=S_kappa(X_tau)v_high, with v_high of Gram
norm one. The matrices sigma(phi_tau(Y_c)) X_tau have entries
bounded by nR and operator norm at most n^2 R<=R^3. In the invariant
Schur Gram norm, a polynomial Schur functor of degree b_tau has
operator norm at most ||Z_tau||^{b_tau}. For completeness, singular
value decomposition reduces this to a positive diagonal matrix;
the diagonal torus has orthogonal weight spaces and every weight
has nonnegative exponents summing to b_tau. Its largest eigenvalue
is therefore at most the maximum singular value to that degree.
Continuity handles singular matrices. This uses the ACTUAL
contravariant form, whose highest evaluation vector has norm one,
so no hook-number rescaling is inserted.

Combining this bound with (7) gives

\[
             \|\sigma(A_c\,\mathrm{ev}_y)\|_G^2
                     \le R^{4nf+6b_\kappa}\le R^{6M}.            \tag{8}
\]

For the delta form, a trivial class automorphism group means there
is at most one rational-equivariant term at each point. The rational
unitary action remains unitary under every embedding of the CM field.
Consequently (8) bounds every value of every conjugate of the delta
form, with no class-count or stabilizer factor. Together with (6)
this proves span_isShort_eq_top with the precise hypothesis
B>=R^{6M}. The e_tau never enters that height bound.

## 4. The actual ramifying operator and the data budget

At each of the f primes dividing pi, the native central unit z_w
is in the integral maximal compact: lift a residue-field unit at w
and use its conjugate inverse at bar(w), with value one elsewhere.
Centrality preserves the actual level. Right translation by z_w
preserves integrality. For squared Gram norms, the triangle
inequality gives ||v-w||^2<=2||v||^2+2||w||^2. Hence applying
1-z_w to a B-short column makes it 4B-short. The product T over
these f places makes it 4^f B-short, and its image is exactly
ramifiedColumns. The image of a spanning family spans that image;
no assertion that T is invertible is needed.

For the actual D use N=N1 d_K, n=k and M=f(k+a); boxes<=fa since
only the height-one columns occur below the stage-zero rank. Use
L=log x, B=log b, C=log B as in the marked-orbit appendix. Its
explicit data bounds give N1<=e^(12L), d_K<=P.c<=C<=L, f<=e^(12L),
k<=e^(6L), and a>=k. Thus R<=e^(50L), M<=2fa, and

\[
 \log(4^f R^{6M})\le f\log4+600faL
                        \le fa B^3=\mathcal B.                 \tag{9}
\]

The last inequality uses a>=1, L>=100 and B>=10^12 L, the actual
scale hypotheses, not an unspecified sufficiently large choice.
Apply section 3 with B_short=exp(mathcal B)/4^f, then apply T.
The resulting columns are integral at EVERY p-adic embedding,
all conjugate values have squared Gram norm at most exp(mathcal B),
and their complex span is ramifiedColumns. This is precisely
span_short_ramifiedColumns, with mathcal B=D.budget, as used
inside Data.short_forms.

The same rational q and seesaw operator B_s in that caller can
now be applied to this spanning set; no independent set of small
vectors or altered column lattice is substituted. The remaining
chain-height estimate weylNormSq_Bmu_le still needs its own jet,
finite class-sum, branching and prime-sum suppliers. The local
index conclusion proved separately is not an archimedean bound.

Verification: actual compact source bodies and the precise primary
transference theorem read. No Lean/lake executed, no new native
or scalar PASS. Independent audit should check the half-trace in
(2), the POWERED-ADELE determinant in (5)--(6), and the squared
Gram exponent in (8). RH remains incomplete.

RESUME HERE: audit this spanning input together with the actual
class freeness/Schur norm conventions. Next complete the chain
archimedean bound and its single-stage theta transfer, retaining
the common q, integral columns and projected Poincare witness.

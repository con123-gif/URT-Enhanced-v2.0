# Theta dimension, irreducibility and the exact vacuum-expansion integer

26 November 2026. Human derivation; independent audit and native replay
pending. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`. Actual sources:

- `Lib/Shimura/Uniformisation/LieExponential.lean`: thetaSpace,
  riemannForm, Appell–Humbert data and thetaShift;
- `Lib/Shimura/ComplexTheta/ThetaDimension.lean`:
  finrank_sq_eq_relIndex, thetaSpace_le_of_thetaShift_mem, schur_lemma;
- `Lib/Shimura/GoodReduction/ThetaOrthogonality.lean`, blob
  `759f783ca424063e815a89a9626fed7be4eba028`: sum_shift_mul_shift;
- `Lib/Weil/Construction/FockThetaFunctions.lean`, blob
  `80c7d6ba1d8942e206e7420f62e85d0209c56ae4`:
  exists_entireTheta_eq;
- `New/Curve/FrameSections.lean`, blob
  `6bc331571971534045115e265473cfa148de9f14`: actual frame-product caller.

Prior work: character RUN61 explains the Schur average but retains
the dimension and irreducibility suppliers. This note proves them
by a convergent Fourier basis and identifies their use in the
finite vacuum expansion. It does not assume the source theorem
as its mathematical proof.

## 1. Match the normalization of the actual real-complex form

Let V have complex dimension g, L be a full lattice, and B the
source real-linear-in-first, complex-linear-in-second form. Assume
Re B is symmetric, chi is its Appell–Humbert semicharacter on L,
and the source Riemann form is positive. The native definitions are

\[
 E(u,v)=\frac{\operatorname{Im}(B(u,v)-B(v,u))}{2\pi},\quad
 (U_a f)(z)=e^{-B(a,z)-B(a,a)/2}f(z+a),                         \tag{1}
\]

and f(z+l)=chi(l) exp(B(l,z)+B(l,l)/2) f(z).

Separate the conjugate-linear and complex-linear parts of B in its
first argument:

\[
 H(u,v)=\tfrac12[B(u,v)+iB(iu,v)],\quad
 Q(u,v)=\tfrac12[B(u,v)-iB(iu,v)].
\]

Symmetry of Re B implies H is Hermitian and Q is symmetric complex
bilinear. This follows by applying the real symmetry to (u,v),
(iu,v), (u,iv) and (iu,iv), and adding/subtracting their real and
imaginary parts. Thus B=H+Q, E=Im(H)/pi, and positivity of E gives
H(u,u)>0 for u!=0. Multiplication by exp(-Q(z,z)/2) is an invertible
map from the theta space for B to that for H, intertwining U_a
exactly: the three Q terms cancel by symmetry. Put h=H/pi, so

\[
 E=\operatorname{Im}h,
 \qquad f(z+l)=\chi(l)e^{\pi h(l,z)+\pi h(l,l)/2}f(z).         \tag{2}
\]

This division by pi is necessary for the later lattice index.

The semicharacter identity, compared with the same identity with
l,m exchanged, implies exp(2pi i E(l,m))=1. Hence E is integer
valued on L. It is nondegenerate since E(u,iu)>0.

## 2. Polarization coordinates, with their hypotheses checked

Apply the integer alternating-matrix normal form to the free
rank-2g lattice L and its nondegenerate integral alternating E.
There is a basis alpha_j,beta_j with

\[
 E(\alpha_i,\alpha_j)=E(\beta_i,\beta_j)=0,\quad
 E(\alpha_i,\beta_j)=d_i\delta_{ij},\quad d_i>0.
\]

This is the ordinary integral normal form, obtained by simultaneous
integer row/column operations on an alternating matrix; no claim
about a rational symplectic basis replacing L is being made.
Set D=diag(d_i). The alpha_j form a complex basis: their real span
is E-isotropic and has trivial intersection with its i-multiple,
since a vector in that intersection would violate E(u,iu)>0.
Use alpha_j/d_j as the complex coordinate basis. Then

\[
 L=D\mathbb Z^g+\Omega\mathbb Z^g,
 \qquad \Omega^T=\Omega,\quad Y=\operatorname{Im}\Omega>0,
 \qquad h(u,v)=\bar u^T Y^{-1}v.                             \tag{3}
\]

Here are the bilinear checks, rather than an additional period-matrix
assumption. Since E vanishes on the real coordinate space, the
matrix S of h is real symmetric positive. The alpha/beta pairings
give S Im(Omega)=I. The beta/beta pairings then say
Re(Omega)^T-Re(Omega)=0. Thus Im(Omega)=S^{-1} is positive and
Omega is symmetric, proving (3).

## 3. Reduce the entire functions to one standard Fourier problem

Multiply f by exp(-pi z^T Y^{-1}z/2). Along a period l this removes
the holomorphic symmetric part of the exponential. Along D u the
remaining multiplier is chi(Du), a unitary character of Z^g.
Choose a in R^g with chi(Du)=exp(2pi i a^T u), and multiply further
by exp(-2pi i a^T D^{-1}z). The resulting entire F is D-periodic.
Its multiplier along Omega v is

\[
 F(z+\Omega v)=\kappa(v)
      e^{-\pi i v^T\Omega v-2\pi i v^Tz}F(z),
\]

where kappa:Z^g->C^* is a character. Indeed chi(Omega v) is a
character because E vanishes on the beta lattice, and the other
new factor is exponential-linear in v. Choose z0 in C^g with
kappa(v)=exp(2pi i v^T z0), and replace F(z) by F(z+z0). We have
reached the exact standard equations

\[
 F(z+Du)=F(z),\qquad
 F(z+\Omega v)=e^{-\pi i v^T\Omega v-2\pi i v^Tz}F(z).        \tag{4}
\]

All of these operations are invertible on entire functions.
Conjugating U_a by them changes its standard expression only by
a nonzero scalar depending on a, not on the function or its
Fourier label. Thus they preserve the span of dual translations,
invariant subspaces and the scalar commutant. In particular no
unitarity of this holomorphic gauge change is assumed.

## 4. Construct every theta function and count the dimension

D-periodicity identifies an entire F with a holomorphic function
on (C^*)^g through z -> (exp(2pi i z_j/d_j))_j. Its convergent
Laurent series, pulled back to any compact set, is

\[
 F(z)=\sum_{n\in\mathbb Z^g} a_n e^{2\pi i n^TD^{-1}z}.
\]

Substitution of v=e_j in (4) and uniqueness of Laurent coefficients
give

\[
 a_{n+De_j}=e^{\pi i\Omega_{jj}+2\pi i n^TD^{-1}\Omega e_j}a_n.
\]

Since Omega is symmetric, these recurrences are consistent and give

\[
 a_{\mu+Dk}=a_\mu
       e^{\pi i k^T\Omega k+2\pi i\mu^TD^{-1}\Omega k}.        \tag{5}
\]

Thus at most one free coefficient is available for each class
mu in Z^g/D Z^g. Conversely, for each such class the series

\[
 \vartheta_\mu(z)=\sum_{k\in\mathbb Z^g}
 e^{\pi i(k+D^{-1}\mu)^T\Omega(k+D^{-1}\mu)
        +2\pi i(k+D^{-1}\mu)^Tz}                             \tag{6}
\]

converges absolutely and uniformly on every compact set. A fixed
positive lower eigenvalue of Y bounds the absolute summands by
exp(-c|k|^2+C_K|k|+C_K). The same bound with a polynomial factor
permits termwise derivatives, so these functions are entire.
Their Fourier supports are disjoint, their coefficient in each
class is nonzero, and they satisfy (4) by reindexing k.
Equation (5) proves that they span every solution of (4).

Consequently the theta dimension is the positive INTEGER

\[
 h=\prod_jd_j=\det D.
\]

The E-dual lattice L# has basis alpha_j/d_j,beta_j/d_j, so
[L#:L]=h^2. The source square-root relative index is therefore
exactly h, not h^2 or a measure-dependent dimension. Empty products
give h=1 in complex dimension zero, where the functions are constants.

## 5. Clock and shift matrices prove the full endomorphism span

The dual generators represented by e_j and Omega e_j/d_j act,
after multiplication by their harmless nonzero scalar factors, by

\[
 C_j\vartheta_\mu=e^{2\pi i\mu_j/d_j}\vartheta_\mu,
 \qquad S_j\vartheta_\mu=\vartheta_{\mu+e_j}.                 \tag{7}
\]

For the second formula the standard form of the actual U at
a=Omega v is
F -> exp(pi i v^T Omega v+2pi i v^T z) F(z+Omega v);
put v=e_j/d_j and complete the square in (6). This checks the
direction of the shift. Real shifts give the first formula.

Finite Fourier averaging of the commuting C_j produces the
rank-one projector P_mu onto the line C theta_mu. Then
S_(nu-mu) P_mu is its elementary matrix to the line theta_nu.
Products of dual translations are scalar multiples of dual
translations, by their Heisenberg law. Thus the span of ALL
U_a for a in L# is exactly End(thetaSpace).

Every invariant space containing one nonzero theta function is
therefore the full theta space. Every endomorphism commuting
with the U_a is scalar. These prove exactly the three native
ThetaDimension consumers retained by character RUN61, without
assuming a further irreducibility theorem for a global group.

## 6. Schur averaging: preserve the integer in the caller

Let T be finite and a_t in L# such that every addition by b in L#
permutes the a_t modulo L, as in the source. For theta functions
f,g and a fixed z form the endomorphism

\[
 A(g)=\sum_{t\in T}(U_{-a_t}g)(z)\,U_{a_t}f.
\]

It commutes with every U_b. The two projective phases cancel in
the rank-one operator, and replacing a representative modulo L
inserts inverse scalar factors, which cancel as well. The given
permutation of T therefore proves the commutation exactly.
Section 5 gives A=c I. Since U_-a U_a=I, the trace of each
rank-one term is f(z). Hence h c=#T f(z), proving

\[
 h\sum_{t\in T}(U_{-a_t}g)(z)(U_{a_t}f)(w)
       =\#T\,f(z)g(w).                                     \tag{8}
\]

No conjugate appears in this rank-one trace calculation; the
evaluation functional is complex-linear. Equation (8) is precisely
`sum_shift_mul_shift`, for arbitrary T satisfying the source
permutation condition, not only one selected set of coset labels.

## 7. Apply to the actual finite theta datum and vacuum expansion

Now use the actual globally defined theta model V, all signs
positive, with its rational automorphy and product-formula character.
We retain its construction and normalization from ThetaFunctional;
the finite action alone does not construct the global functional.
Let delta be integral, delta bar delta=N>0, and let

\[
 L=\{-\operatorname{realImage}(\bar\delta\gamma):
                       \operatorname{finiteImage}(\gamma)\in\Lambda\}.
\]

This is the actual full lattice in FockThetaFunctions, not a new
unimodular lattice. Its B is the standard Hermitian form, with
native normalization as in section 1. Product-formula semicharacters
and delta-integrality put T(vac) in this theta space, where
T=entireTheta. This vector is nonzero: T is injective and vac is
nonzero. For injectivity, T(f)=0 means f vanishes on every real
vector after its nonzero Gaussian factor is removed. Rational
automorphy gives vanishing on all real vectors plus rational
vectors, a dense subset by finite-adelic rational approximation;
continuity gives f=0. These use the constructed global model,
not merely arbitrary entire functions.

Every a in L# has a nonzero multiple in L, so a=-realImage(gamma_a)
for a rational gamma_a. The exact translation formula is

\[
 T(\rho(\operatorname{finVec}(\operatorname{finiteImage}
                 (\gamma_a)))f)=U_a T(f).                  \tag{9}
\]

It also forces delta finiteImage(gamma_a) in Lambda. To see this,
pair the a-translation with -realImage(bar(delta)gamma) in L.
Their Riemann commutator is one. The product formula transports
this to triviality of the finite character pairing of
delta finiteImage(gamma_a) with finiteImage(gamma), for every
rational gamma whose finite image is integral. Those images are
dense in Lambda; continuity and the EXACT self-duality (1) of the
finite-cocycle note give the asserted integrality. In particular
N a belongs to L, using the rational vector delta gamma_a.

The image of finitePart under T contains all the U_a translates
of T(vac); section 5 proves it contains the entire theta space.
Thus every entire S with the source normalized lattice multiplier
is T(F) for some F in finitePart. This is the surjectivity required
by `exists_entireTheta_eq`, from the retained global model.

Finally take T0=L#/N L#, with representatives a_t. Because N L#
is contained in L, its translations satisfy the permutation
hypothesis of (8). Its cardinal is N^(2g). Take f=T(F), g=T(vac)
in (8), and apply any linear functional ell on the finite model
to its first factor. Transporting back through the injective T,
and writing y_t=-finiteImage(gamma_(a_t)), gives

\[
 h\sum_t\ell(\rho(\operatorname{finVec}y_t)\mathrm{vac})
                 \rho(\operatorname{finVec}(-y_t))F
       =N^{2g}\ell(F)\mathrm{vac},
 \qquad \delta y_t\in\Lambda.                               \tag{10}
\]

Both sides are finite tensors, so applying ell is purely algebraic;
no extension of ell to an infinite-dimensional space of functions
or interchange with an infinite series is needed. Here g=fn at
the caller. Thus (10) has exactly the cardinal N^(2fn) and the
natural multiplier h required by Space.VacuumExpansion. For the
frame delta=M, N=M^2, this cardinal is M^(4fn), precisely the
denominator used by the p-unit frame in the local-jet transfer.

## 8. Status and remaining foundations

This proves the finite-dimensional theta-space dimension,
irreducibility, exact translation average, and their surjectivity/
expansion bridge from the stated global model. It supplies the
inputs retained by character RUN61 at FrameSections and the
general tight-frame appendix. The original integral lattice,
phase, period and cardinal witnesses are preserved.

Global theta-functional existence and boundedness, rational
product-formula automorphy, the actual lattice/WeilData construction,
CM period and theta-product integrality, and independent audit
remain separately required. Existing structure RUN54 already
supplies the Wiener sampling estimate and definite period
convergence; do not repeat it as an unattempted primitive. The
present calculation does not prove the Rallis formula, Selmer
bound, central prime-error inequality or RH.

Validation: source and normalization reads, convergent Fourier and
finite-matrix derivation, and `git diff --check`. No new native
replay or certificate success claimed.

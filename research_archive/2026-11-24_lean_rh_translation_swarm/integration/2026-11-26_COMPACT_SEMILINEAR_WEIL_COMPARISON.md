# The finite semilinear Weil comparison with its exact multiplier

26 November 2026. Human derivation matched to the compact source;
independent mathematical audit pending. This continues structure RUN60
(622fbfec), which supplies the generator, unrestricted character identity
and well-defined semilinear span map. It does not reconstruct the whole
finite Weil representation or certify the human RH proof.

Pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
paths below are under grh-compact/src. Credit the original formal
authors Levent Alpoge, Luke Sernau and collaborators.

| Actual source and body read | Blob |
|---|---|
| Lib/CM/Reciprocity/SemilinearWeilLaw.lean | f0ceeb862976ee92b3dae11a122ce465901f7994 |
| Lib/Weil/Construction/FiniteMultiplier.lean | 7b35474d42010a69abe9ba5868c0fce4d4490efc |
| Lib/Weil/Construction/PairDefs.lean | 8a5eaed1249fcc1c482e3af4f15373682fa34af1 |
| Lib/Weil/Construction/Projections.lean | 7a187f8be18a00b889082b56818393f20a7f88e4 |
| Lib/Weil/Construction/FiniteVacuum.lean | b775c3efc7afae92b21402691f615e0dfbf73ee1 |
| Lib/Weil/MixedModel/AdelicSum.lean | 49baa2583b79e2ffc4fff7dc791415866c03071d |
| Lib/Weil/MixedModel/Names.lean | 7dc9e83b6974266a3ed74a0ab24b47ec63a3e953 |

The actual consumers are exists_semilinear_isJetConjugate in
New/Curve/ConjugatesOfJets.lean, then New/Rows/MemberKernels.lean.
The existential witnesses a,u,gamma below are fixed before g, the
datum or the test vector is varied; q_sigma(g) is an explicit function.

## 1. Inputs and normalization

Put A=the finite adeles of E, O=their integral subring, and
Lambda=O^n. Retain the actual CM Weil data and its character psi0,
not an arbitrarily rescaled additive character. Its exact self-duality is

\[
 z\in O\quad\Longleftrightarrow\quad
 \psi_0(zu)=1\text{ for every }u\in O.                 \tag{1}
\]

Write v for the native vacuum of norm one, rho(x) for its Heisenberg
translations, and H(x)=finHeisOp(x) for their semicharacter-normalized
version. The native finite part W is the span of H(x)v. Its Haar
normalization gives Lambda measure one. The finite Weil action omega(g)
is unitary and satisfies omega(g)H(x)=H(gx)omega(g).

Let sigma:C->C be a field embedding and L:W->W sigma-semilinear.
The peer supplies b in A with, for ALL z in A and x in A^n,

\[
 \sigma\psi_0(z)=\psi_0(b\bar b z),\qquad
 L\rho(x)=\rho(bx)L.                                 \tag{2}
\]

The same intertwining holds for H: its semicharacter is psi0 of a
fixed scalar times x*x, so the first identity of (2) transforms that
scalar exactly as x becomes bx. Fix a set R of finite places disjoint
from its conjugate, as required by the actual named-data caller.

## 2. The unrestricted character identity forces a unit

Let eta=b bar(b). Injectivity of sigma and (2) give
psi0(z)=1 iff psi0(eta z)=1. Apply this equivalence to every zu in
(1):

\[
                    z\in O\quad\Longleftrightarrow\quad\eta z\in O.
                                                               \tag{3}
\]

In particular eta is integral. At a finite place w test (3) on the
adele equal to a local uniformizer inverse at w and zero elsewhere.
It is not integral. If eta_w were zero or had positive valuation,
its product with that test adele would be integral, contradicting
(3). Hence every eta_w is a unit. The componentwise inverse is in
O, so eta is in O^*. It follows in the COMMUTATIVE adele ring that

\[
             b^{-1}=\bar b\,\eta^{-1}.                \tag{4}
\]

Thus b is an adelic unit. Pointwise nonvanishing alone was not used
as an idele criterion. This argument is independent of the target
rank; it remains valid in rank zero because (2) was already obtained
by the peer's separate rank-one character comparison.

Choose a in O^* with a bar(a)=eta and a_w=1 for every w in R.
Here is a direct construction on the ACTUAL b. At a place fixed by
conjugation, valuation(eta_w)=2 valuation(b_w)=0; choose a_w=b_w.
Such a place cannot belong to R. On each conjugate pair choose an
orientation; if one place belongs to R orient it first, and otherwise
choose either. Set a=1 at the first member and a=eta at the second,
using conjugation to identify the two completions. Since eta is
self-adjoint, a bar(a)=eta at both. Every component and its inverse
are integral, so these choices give an element of O^*. Now set

\[
                         u=b/a,\qquad u\bar u=1.       \tag{5}
\]

This is the native b=u a factorization, with the additional a|_R=1.
There is one a and one u for the whole comparison. No separate
choice for different data or different unitary matrices is made.

## 3. The lattice vacuum line and its coefficient functional

Define P on a finite vector by averaging H(y) over y in Lambda.
This is a FINITE average: a finite sum of vacuum translates has a
common open stabilizer in the compact group Lambda. On a generator,
Heisenberg commutation and H(y)v=v give

\[
 P(H(x)v)=\left(\int_\Lambda\psi_0(x^*y)\,dy\right)H(x)v
                 =1_\Lambda(x)v.                    \tag{6}
\]

The character integral is one on its annihilator and zero otherwise;
(1) identifies that annihilator with Lambda. On Lambda, H(x)v=v.
Thus P has range Cv, and the Lambda-fixed vectors in W are exactly
that line. Conjugating by omega(g), the gLambda-fixed line is
C omega(g)v. Equation (6) also identifies

\[
 P(f)=\ell(f)v,\qquad \ell(f)=\langle v,f\rangle,
 \qquad\ell(H(x)v)=1_\Lambda(x).                     \tag{7}
\]

This proof involves finite character orthogonality and the normalized
vacuum coefficient, not an integral through a discontinuous sigma.

Put U=omega(uI). Since a is an integral unit, bLambda=uLambda.
Intertwining in (2) and the fixed-line result therefore give a scalar
gamma, independent of f and g, with L(v)=gamma Uv. More generally,
a commutes with g and preserves Lambda, so L(omega(g)v) is fixed
by H on u g Lambda. There is a scalar gamma_g such that

\[
                 L(\omega(g)v)=\gamma_g U\omega(g)v.  \tag{8}
\]

For T=U^{-1}L we have T(H(x)v)=gamma H(ax)v. Since aLambda=Lambda,
equation (7) and semilinearity extend from these generators to

\[
                  \ell(Tf)=\gamma\,\sigma(\ell(f))
                             \quad(f\in W).           \tag{9}
\]

All uses of sigma here are on finite linear combinations. Surjectivity
or continuity of sigma is unnecessary.

## 4. Determine the exact multiplier, including its phase

Let Delta(g)=finMultiplier(g). The normalized finite Weil construction
has the actual coefficient

\[
 m(g)=\langle v,\omega(g)v\rangle=1/\overline{\Delta(g)},
 \qquad \Delta(g)\overline{\Delta(g)}=J(g),             \tag{10}
\]

where J(g)=[Lambda:Lambda intersect g^{-1}Lambda] is a positive
INTEGER. These are precisely dataInner_omega_of_vacElem and
norm_finMultiplier_sq, with real component 1. They follow from the
native saturating-lattice finite Weil normalization; that construction
and its splitting character are retained upstream inputs here.
In particular the coefficient is nonzero. It is not enough to replace
(10) by its absolute value or by a projective representation identity.

Apply (9) to omega(g)v and use (8):
gamma_g m(g)=gamma sigma(m(g)). Since sigma fixes J(g), (10) gives

\[
 \frac{\sigma(m(g))}{m(g)}
 =\frac{\overline{\Delta(g)}}{\sigma\overline{\Delta(g)}}
 =\frac{\sigma\Delta(g)}{\Delta(g)}=:q_\sigma(g).
                                                               \tag{11}
\]

Consequently gamma_g=gamma q_sigma(g). On a generator rho(x)v,
apply Weil covariance, (2) and (8). Scalar multiplication by u or b
commutes with g. The two sides are the same translate of U omega(g)v;
semilinearity extends the identity to all W:

\[
          L\omega(g)f=q_\sigma(g)\,\omega(g)Lf
                          \quad(f\in W).             \tag{12}
\]

This is exactly multiplierRatio, with its complex phase and the same L.
If L is injective, as in the jet caller, gamma is nonzero because v is.
Do not divide L by gamma: that would change the common jet identity
and the already established height bound.

For comparison with the native square formula, its fixed splitting
character satisfies upsilon(det g) Delta(g)=bar(Delta(g)). Equations
(10)--(11) give

\[
 q_\sigma(g)^2
   =\frac{\upsilon(\det g)}{\sigma\upsilon(\det g)}.    \tag{13}
\]

Any norm bound at a later caller must use that caller's character-weight
hypotheses; no general preservation of complex norms by sigma is claimed.

## 5. The named Schwartz datum transforms on the same vacuum

Let e_R be the finite-adelic idempotent of R, e its conjugate closure,
and B_R the box indicator. The native Schroedinger generator is

\[
 S_R(y)B_R(x)=\psi_0\bigl(\tfrac12 y^*e_R(2x+y)\bigr)B_R(x+y).
                                                               \tag{14}
\]

Since a|_R=1 and a bar(a)=eta, replacing y by ay leaves the box
indicator unchanged and multiplies the character argument by eta.
Equation (2) gives the exact POINTWISE equality

\[
                \sigma(S_R(y)B_R)=S_R(ay)B_R.           \tag{15}
\]

Every Schwartz--Bruhat datum above R is a finite combination
Psi=sum_y d_y S_R(y)B_R. The finite Fourier proof uses a common
small period lattice and a finite quotient of a support lattice:
translations give the support cosets, and characters from the
conjugate places give all characters of each finite quotient by
(1). Fourier inversion, with its rational factor 1/|Q|, gives each
smaller-box indicator. The disjointness of R and bar(R) is precisely
what permits these translation and modulation choices independently.
This is the actual exists_schrodingerComb_eq supplier, not an infinite
Fourier expansion.

The name map sends S_R(y)B_R, applied to v, to rho(e y)v.
Equation (15) and (2) then give term by term

\[
\begin{aligned}
 L(\operatorname{name}_R(\Psi)v)
   &=\sum_y\sigma(d_y)\rho(be y)Lv\\
   &=\gamma U\sum_y\sigma(d_y)\rho(ae y)v\\
   &=\gamma U\operatorname{name}_R(\sigma\circ\Psi)v.
\end{aligned}                                                   \tag{16}
\]

Thus (4), (8), (12) and (16) supply every conclusion of
Space.semilinear_intertwines_weil at its actual caller, using the
already constructed L,b and one common u,gamma. The peer's jet
identity, period scale and height estimates are preserved. The gamma
here is the intertwiner scalar; it is distinct from the integral
vacuum scale c in ConjugateGenerator.

Retained dependencies are explicit: the actual character self-duality
from the different and Weil datum; the finite Weil representation,
splitting character and normalized coefficient (10); and the peer's
CM/frame/period/compact-shift suppliers. Sections 2--5 give the missing
comparison argument from those inputs, rather than citing the whole
native semilinear theorem as a premise.

Verification: exact source statements and bodies inspected; no local
Lean/lake/elan, no new native replay, no synthetic scalar test. This
human derivation and its integration need independent audit, especially
the unit test in (3), the split orientation in (5), the conjugate in
(10)--(11), and the R-supported phase in (15). RH remains incomplete.

RESUME HERE: audit these four identities together with RUN60's jet
span map, then check the exact normalized finite Weil coefficient and
CM/frame suppliers at MemberKernels. Continue A single-stage theta
transfer/short-height, B absolute unfolding, and C safety/Ext and
comparison construction; do not rederive the final scalar budgets.

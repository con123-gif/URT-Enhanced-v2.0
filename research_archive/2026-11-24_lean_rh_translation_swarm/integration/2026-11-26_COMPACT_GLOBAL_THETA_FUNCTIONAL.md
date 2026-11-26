# Global theta functional: existence, normalized pairing and absolute Poisson sum

26 November 2026. Human derivation, independent audit/native replay
pending. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/Lib/Weil/Construction/ThetaFunctional.lean`, blob
`b21b5f01564922bbd2ed309ef614111698b2384a`, from
`isDualFamily_beta_sq` through `IsThetaFunctional.eq_smul`.
Model/reproduction: `Lib/Weil/Construction/Model.lean`.
Reuse structure RUN54 `RUN54_DEFINITE_THETA_CONVERGENCE.md` for
the already derived Wiener sampling bound. The finite group law
and positive theta-space/vacuum-expansion notes are separate.

This supplies the global-functional hypothesis retained by the
theta-space note. It uses the exact source vacuum/reproducing
model and rational adelic character, not an assumed RH theorem.

## 1. Exact hypotheses and common rational lattice

Let W be the actual finite-dimensional adelic additive space, mu
its source vacuum Haar measure, beta its Heisenberg bicharacter,
and e its source vacuum. The vacuum is continuous, even, real,
integrable, e(0)=1, and satisfies the twisted convolution identity.
The reproducing Banach model S consists of integrable functions

\[
 v(x)=\int_W v(y)\beta(y,x)e(x-y)\,d\mu(y),
 \qquad \|v\|_S=\int|v|.
\]

Write rho(y)v(x)=beta(y,x)v(x-y). Its operators are isometries
of S. The model inner product is <v,w>=integral bar(v)w,
and <rho(x)e,v>=v(x). In particular <e,e>=1. Reproduction gives

\[
 v=\int_W v(y)\rho(y)e\,d\mu(y).                            \tag{1}
\]

The integral converges in S since rho(y)e has constant S-norm.
This is an identity in the Banach model, not just an almost-everywhere
identity in L1. It follows pointwise by reproduction; bounded
evaluation and completeness give the same vector identity.

Let Gamma=V.vecAtPoint(E^n), the SAME rational lattice determined
by the fixed source frame V. It is discrete and cocompact,

\[
 \beta(\gamma,\delta)=1\quad(\gamma,\delta\in\Gamma),
 \qquad \widehat{W/\Gamma}=
   \{\chi_\gamma(x)=\beta(x,\gamma)^2:\gamma\in\Gamma\},      \tag{2}
\]

with gamma -> chi_gamma bijective. These are the rational product
formula and rational additive self-duality in the actual coordinates.
We integrate on W/Gamma with its probability Haar measure, exactly
the source quotMean. The square in (2) removes the Heisenberg half.

Here is the arithmetic annihilator check behind (2). For the ordinary
trace additive character on A_E, suppose a annihilates E. Choose
q in E so that (a-q)_f lies in the finite codifferent, using finite
adelic rational density. Testing against O_E makes (a-q)_infinity
belong to its archimedean trace-dual lattice, the embedded
codifferent. Subtract that element b in E as well. The infinite
component is now zero, and testing all of E and using density in
A_E,f makes the finite component zero by local additive
nondegeneracy. Thus a=q+b is rational. Conversely rational a
annihilates E by the product formula. The source frame change and
the invertible rational Gram matrix transport this calculation
coordinatewise to (2). The local real/p-adic character duality and
compact-group Fourier theorem are the usual additive Fourier
theorems, with the actual trace character, not a different conductor.

## 2. Absolute matrix-coefficient sampling, before any theta functional

The existing RUN54 Wiener estimate applies here with kappa=id,
test functional T=<w,->, vacuum u=e, and integrable envelope
|<w,rho(x)e>|=|w(x)|. Its compact difference-set overlap for the
discrete Gamma gives a finite constant C_w such that

\[
 \sum_{\gamma\in\Gamma}|\langle w,\rho(\gamma)v\rangle|
        \le C_w\|v\|_S.                                    \tag{3}
\]

The bound holds for EVERY v in S, with w fixed, and does not require
an existing theta functional. Therefore

\[
 \ell_w(v)=\sum_{\gamma\in\Gamma}
                         \langle w,\rho(\gamma)v\rangle
\]

is a bounded complex-linear functional. Equation (2) and an absolutely
convergent reindexing show ell_w rho(delta)=ell_w for delta in Gamma.

At least one ell_w is nonzero. Otherwise set v=w=rho(-x)e for
arbitrary x. Heisenberg commutation gives

\[
 0=\ell_{\rho(-x)e}(\rho(-x)e)
    =\sum_{\gamma\in\Gamma}e(\gamma)\chi_\gamma(x).
\]

The sum is uniformly absolutely convergent, since (3) at v=w=e
gives sum |e(gamma)| finite. Integrating it on W/Gamma gives its
constant coefficient e(0)=1, a contradiction. No unproved
nonvanishing of a theta value or L-value has entered this step.

## 3. Normalize one nonzero invariant functional

Choose one such nonzero ell and put

\[
 I=\int_{W/\Gamma}|\ell(\rho(x)e)|^2\,dx.
\]

The integrand is a continuous well-defined function on the compact
quotient; rational invariance cancels the unit-modulus projective
factor. It is bounded by ||ell||^2 ||e||_S^2, so I is finite.
It is positive: if I=0, continuity and full support of Haar make
ell(rho(x)e)=0 for all x; (1) would then imply ell=0.
Set theta=ell/sqrt(I). Thus

\[
 \theta\rho(\gamma)=\theta\quad(\gamma\in\Gamma),\qquad
 \int_{W/\Gamma}|\theta(\rho(x)e)|^2\,dx=1.                 \tag{4}
\]

Choose theta once. The ensuing identities hold for any already
selected normalized source functional, so this construction does
not license independent choices in later A/B/C callers.

## 4. Prove the invariant-form identity by the vacuum projector

We need the exact normalization of the pairing, not just existence.
First the vacuum convolution identity gives the bounded operator

\[
 P(v)=\int_W e(y)\rho(y)v\,d\mu(y)=v(0)e.                  \tag{5}
\]

To check it without assuming irreducibility, substitute v=rho(t)e.
At x the integrand is
e(y) beta(y,x) beta(t,x-y)e(x-y-t). Using the bicharacter law,
the vacuum convolution identity makes its integral e(t)e(x),
which is v(0)e(x). Agreement for every rho(t)e extends to all
v by (1). Every integral is absolutely convergent in S.

Let A be ANY bounded sesquilinear form on S, conjugate-linear
in its first variable, invariant under simultaneous rho(y).
Since e is real and even, (5) yields

\[
 \begin{aligned}
 A(v,e)&=\int e(y)A(v,\rho(y)e)\,dy\\
       &=A\!\left(\int e(y)\rho(-y)v\,dy,e\right)
         =\overline{v(0)}A(e,e).
 \end{aligned}
\]

Consequently A(v,rho(x)e)=A(e,e) bar(v(x)); (1), applied in the
second variable, proves

\[
 A(v,w)=A(e,e)\langle v,w\rangle.                            \tag{6}
\]

This proves the source invariant-form clause directly, without
citing a stronger irreducibility theorem or treating the L1
Banach model as a Hilbert completion.

For bounded Gamma-invariant ell,ell', apply (6) to

\[
 A(v,w)=\int_{W/\Gamma}
        \overline{\ell'(\rho(x)v)}\ell(\rho(x)w)\,dx.
\]

It is bounded because rho(x) is an S-isometry. Translation of
the quotient variable proves invariance; its two phases cancel.
Write c=A(e,e). Then

\[
 \int_{W/\Gamma}\ell(\rho(x)v)
                   \overline{\ell'(\rho(x)w)}\,dx
       =c\langle w,v\rangle.                               \tag{7}
\]

For theta paired with itself, (4) gives c=1 exactly.

## 5. Fourier inversion with the absolute bound already available

Set F(x)=ell(rho(x)v) bar(ell'(rho(x)w)). Rational invariance and
(2) make it continuous and Gamma-periodic. Equation (7), evaluated
at rho(-gamma)v, gives its Fourier coefficient at chi_gamma:

\[
 \widehat F(\chi_\gamma)=c\langle w,\rho(-\gamma)v\rangle.
\]

For example this follows directly from
ell(rho(x)rho(-gamma)v)=bar(chi_gamma(x)) ell(rho(x)v);
the rational-invariance factor is essential. The coefficient
family is absolutely summable by (3). Compact-group Fourier
inversion therefore applies with uniform absolute convergence.
At x=0, reindexing gamma by -gamma gives the exact Poisson formula

\[
 \sum_{\gamma\in\Gamma}c\langle w,\rho(\gamma)v\rangle
          =\ell(v)\overline{\ell'(w)}.                       \tag{8}
\]

For the SAME normalized theta, c=1. This is precisely
`IsRatInvariant.hasSum_modelInner`, including its absolute
summability and the quotient normalization.

Finally (8), first for (ell,theta), then for (theta,theta), shows
ell(v) bar(theta(w))=c theta(v) bar(theta(w)). Choose a w with
theta(w)!=0 and cancel: ell=c theta. Thus the bounded invariant
functional is unique up to scalar. Also (7) gives

\[
 \int_{W/\Gamma}|\theta(\rho(x)v)|^2\,dx=\langle v,v\rangle.
\]

This proves the global model pairing used by moving-vacuum bounds
and the definite-period argument, with no extra covolume factor.

## 6. Actual substitution and retained premises

This supplies `exists_isThetaFunctional`, its pairing normalization,
absolute rational sum and scalar uniqueness at the actual source
frame V. It is the global-functional input of FockThetaFunctions,
the theta-space/vacuum-expansion note, structure RUN59's moving
vacuum bound and RUN54's definite-period argument. The sampling
estimate was used before the normalization, avoiding a circular
appeal to Poisson summation to justify its own convergence.

The source Gaussian/finite vacuum convolution identities, Haar and
WeilData construction, ordinary local additive duality and the
stated rational frame are explicit prerequisites. The finite
vacuum identity and finite group law have separate derivations;
the real Gaussian/action supplier retains its own audit. These
results alone do not establish global pair/theta coherence at all
Rallis consumers, CM/theta-product integrality, Selmer bounds or
the final prime-error inequality. Independent mathematical audit
of the replacements and bounded native replay remain outstanding.

Validation: source reads, exact Heisenberg phase and integral
derivation, and `git diff --check`; no new Lean/scalar execution
or full human-RH verification claimed.

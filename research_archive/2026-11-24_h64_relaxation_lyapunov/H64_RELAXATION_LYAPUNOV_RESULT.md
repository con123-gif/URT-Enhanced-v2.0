# Native H64 relaxation: energy H-theorem, not entropy production

## Scope

This certificate isolates the already-declared positive history relaxation

\[
y(t)=y_\star+e^{-tA}(y(0)-y_\star),\qquad
A=H_{\rm bits}+r^2L_{24}^{(2)},
\]

at fixed native 190-coordinate geometry and source.  It uses the original
five-Platonic operator, the original 24-clock charge-two Laplacian, the native
64-history Hessian, and the deterministic mixed icosahedral vertex/curl states.
It introduces no metric identification, fitted constant, temperature, random
state, or new dissipative operator.

## Measurable result

The 1536-dimensional history operator is strictly positive:

- `lambda_min(A) = 0.010228725137850388`
- `lambda_max(A) = 23.332594103081153`
- therefore the global energy-gap bound is
  `F(t) <= exp(-0.020457450275700777 t) F(0)`.

For the 30 deterministic mixed-vortex orientations, starting from `y=0`, the
certificate measures the native minimizer, initial quadratic gap and exact
dissipation.  The seed-zero source has

- `||y_star|| = 0.00024218538514358438`,
- `F(0) = 5.281813880185388e-07`,
- `sigma(0) = ||A(y-y_star)||^2 = 1.9025257224942093e-05`,
- `sigma(0)/F(0) = 36.02030979606256`.

Its gap fractions are `0.16513124454368772` at `t=0.05`,
`0.027268377263199656` at `t=0.1`, and `0.0007435710374250697` at `t=0.2`.
The full native energy difference agrees with the quadratic gap to numerical
tolerance and the spectral decay bound holds at every sampled time.

## Exact law and obstruction

Writing `e=y-y_star` and

\[
F(e)=\frac12\langle e,Ae\rangle,
\]

the declared semigroup gives the genuine monotone law

\[
\frac{dF}{dt}=-\langle e,A^2e\rangle\le -2\lambda_{\min}(A)F.
\]

This is an exact energy/free-energy Lyapunov theorem for the H64 sector.
However, the existing eight-state KMS occupation probabilities depend on `z`
alone.  Since this test holds `z` fixed, their entropy is exactly constant.
The complex history amplitude `y` is not a probability distribution, so `F`
must not be relabelled as relative entropy.

**Conclusion:** the native construction contains a real irreversible history
energy relaxation, but it does not yet contain a thermodynamic entropy
production law, horizon temperature, area entropy, redshift observable, or
Lorentzian spin-2 response.  The previous reversible mixed-vortex result and
this positive semigroup therefore describe different dynamics and must not be
combined into a false horizon claim.

## Next decisive test

Search the existing native transfer/KMS construction for an explicitly declared
positive, probability-preserving generator on the eight occupation states.  If
one exists, test contractivity of its KMS relative entropy without fitting any
rate.  If no such generator exists, record that absence as the precise blocker
to genuine non-equilibrium thermodynamics rather than inventing one.

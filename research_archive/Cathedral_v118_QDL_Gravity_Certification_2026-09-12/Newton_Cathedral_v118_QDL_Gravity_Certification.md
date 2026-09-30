# Newton's Cathedral / URT v118 — QDL Gravity Certification Audit
Date: 2026-09-12

## Purpose

The external QDL diagram is not adopted as Cathedral's substrate. Its useful
contribution is treated as a four-gate gravity audit:

1. exactly two massless spin-2 polarizations;
2. universal coupling to one emergent geometry;
3. Bianchi/integrability;
4. information metric proportional to the geometric metric.

The tests below are run against the existing v117 architecture.

## Gate 1 — Exactly two massless spin-2 polarizations

Assume the IR action contains a nonzero Einstein-Hilbert two-derivative term.
For the null momentum
\[
k^\mu=(1,0,0,1)
\]
the linearized Einstein operator acts on the 10-dimensional space of symmetric
metric perturbations.

The explicit symbolic calculation gives
\[
\operatorname{rank}E_L=4,\qquad
\dim\ker E_L=6.
\]

The linearized diffeomorphism subspace
\[
h_{\mu\nu}=k_\mu\xi_\nu+k_\nu\xi_\mu
\]
has rank 4 and is contained exactly in the kernel. Therefore
\[
\boxed{6-4=2}
\]
physical massless polarizations remain.

Status: **conditional pass**, because the existence and nonzero coefficient of
the Einstein-Hilbert term still relies on the continuum/spectral completion.

Curvature-squared terms are fourth order in momentum. With a nonzero EH term
they do not generically add further massless \(k^2=0\) polarizations, though
they may add finite-mass higher-derivative modes.

## Gate 2 — Equivalence-principle / universality test

The v117 polarized transfer carrier is
\[
\operatorname{End}(V_4)
=
\boxed{4\oplus1\oplus3\oplus3'\oplus5}.
\]

The geometric quartet appears with multiplicity one.

Hence a minimal master Dirac operator has one coframe
\[
e=P_4X,
\]
and every internal species sees the same principal symbol
\[
\slashed D_e\otimes1.
\]

There is no second geometric quartet in the minimal carrier from which a
species-dependent metric could be formed.

Status: **pass at the principal-symbol/minimal-coupling level**.

This does not yet prohibit every possible species-dependent nonminimal
curvature coupling generated at higher order.

## Gate 3 — Bianchi/integrability

For the oriented icosahedral shell,
\[
d_0:C^0\to C^1,\qquad d_1:C^1\to C^2.
\]

The explicit integer incidence matrices have
\[
\operatorname{rank}d_0=11,\qquad
\operatorname{rank}d_1=19,
\]
and
\[
\boxed{d_1d_0=0}
\]
with exact integer residual 0.

This is the discrete boundary-of-boundary identity underlying the finite
linear Bianchi structure.

For the same linearized Einstein operator used in Gate 1,
\[
\boxed{k^\mu G^L_{\mu\nu}=0}
\]
holds exactly as a symbolic matrix identity.

Status: **exact finite pass and exact linearized-continuum pass**.

At nonlinear continuum level the differential Bianchi identity is automatic
once the coframe defines a single torsion-free, metric-compatible connection.
The remaining derivation is therefore the microscopic URT-to-Levi-Civita map.

## Gate 4 — Information metric versus geometric quartet metric

Use the frozen two-quartet state
\[
\rho_\star=aI_4\oplus bI_4,
\]
with
\[
a=\frac1{4(1+\Delta^2)},\qquad
b=\frac{\Delta^2}{4(1+\Delta^2)}.
\]

The Bogoliubov-Kubo-Mori / relative-entropy Hessian for an off-diagonal
\(4\leftrightarrow4\) perturbation has the common coefficient
\[
\chi_{35}
=
\frac{\ln(a/b)}{a-b}
=
8\eta_\Delta\frac{1+\Delta^2}{1-\Delta^2}.
\]

Numerically,
\[
\boxed{\chi_{35}=47.966978303380181}.
\]

Because each block of \(\rho_\star\) is scalar, this coefficient is identical
for all 16 cross-block directions. Therefore its restriction to the unique
geometric quartet is
\[
\boxed{
g^{\rm info}\big|_4
=
\chi_{35}\,I_4.
}
\]

Thus the relative-entropy metric and the carrier/coframe metric are exactly
conformal at the selected vacuum, with one scalar stiffness and no anisotropic
tensor fitting.

Status: **exact tangent-space pass**.

This does not alone generate Einstein dynamics; it identifies the local
information metric with the geometric carrier metric up to one scalar.

## Combined verdict

\[
\boxed{
\begin{array}{c|c}
\text{Gate}&\text{v118 result}\\
\hline
2\text{ massless spin-2}&\text{conditional IR pass}\\
\text{universal coframe}&\text{structural pass}\\
\text{Bianchi/integrability}&\text{exact finite + linearized pass}\\
g_{\rm info}\propto g_{\rm geom}&\text{exact selected-vacuum pass}
\end{array}
}
\]

The strongest new equation is
\[
\boxed{
g^{\rm info}\big|_4
=
8\eta_\Delta
\frac{1+\Delta^2}{1-\Delta^2}
\,g^{\rm carrier}\big|_4.
}
\]

This is the cleanest direct entropy-to-geometry metric bridge currently in
Cathedral.

## Remaining gravity bottleneck

Derive, from the microscopic v117 spectral/URT dynamics, a nonlinear continuum
coframe action whose connection is torsion-free and metric-compatible and whose
leading two-derivative term is Einstein-Hilbert with nonzero positive
coefficient.

If that is achieved, Gates 1 and 3 lift from conditional IR statements to the
full nonlinear gravitational sector. Absolute dimensional normalization
remains subject to the already-proved scale-identifiability boundary.
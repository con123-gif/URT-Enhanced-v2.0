# Native weak fixed-charge background-selection obstruction

## Result

The original five-Platonic 190/H64/24 action does not select a unique nonzero
weak-gravity background when its native U(1) Noether charge is fixed.  It
selects the charge-one clock index `m=9`, but the spatial state remains at
least 45-fold degenerate in exact-edge gauge directions.  Every such relative
equilibrium has zero vertex density, hidden source, coexact circulation, Hopf
current, 13-cell STF stress and entropy exchange.

This is an exact/numeric obstruction within the current weak-field selector,
not a no-go theorem for nonlinear or singularity gravity.

## Native construction

For each of the five Platonic surfaces, let `b1` and `b2` be the unchanged
vertex-edge and edge-face incidence matrices.  The original geometric
potential deliberately omits the edge-exact `b1.T @ b1` block.  Therefore

\[
z_{\rm edge}=b_1^T a,\qquad b_1b_2=0
\]

is annihilated both by the geometric Hessian and by the face-curl operator.
Removing the constant vertex parameter leaves `V-1` independent directions
per solid, hence

\[
\sum_{P\in\{T,C,O,D,I\}}(V_P-1)
=3+7+5+19+11=45.
\]

The executable certificate constructs all 45 embedded 190-component columns.
Their rank is 45 and the geometric-Hessian operator residual is below
`1e-10`.  The complete geometric Hessian has numerical nullity 47, so these
45 directions are a proven native subspace rather than a numerical basis
accident.

## Weak fixed-charge selector

For charge-one clock momentum `m`, the flat spatial directions have multiplier

\[
\lambda_m=r^2\left[2-2\cos\left(\theta-2\pi m/24\right)\right].
\]

The primitive values select `m=9` with

\[
\lambda_9=0.0025584063752810988,
\qquad E/Q=\lambda_9/2=0.0012792031876405494.
\]

The cheapest history-only charge-two mode is at `m=18` with
`E/Q=0.002557181284463583`, so the geometric exact-edge orbit is lower in the
quadratic fixed-Noether-charge comparison.

A normalized representative has full-action energy
`0.0012792031876408692`, charge one, relative-equilibrium gradient residual
below `1e-10`, and zero history gradient.  Its motion is only a U(1) phase
orbit; every component density is stationary.

## Gravity, vortex and entropy consequence

The representative—and the whole 45-dimensional exact-edge span—has:

- zero vertices and therefore zero icosahedral scalar/vector/STF carrier;
- zero face field and zero native `P3` and `P5` hidden source;
- zero circulation curl because `b1 b2=0`;
- zero Hopf vertex current because the vertex field vanishes;
- zero history forcing and no non-equilibrium energy/entropy transfer.

Thus native charge conservation alone cannot turn the previous symmetric
vacuum obstruction into a stress-bearing weak gravitational background.  It
also supplies no lapse, redshift, Lorentzian cone, horizon or horizon first
law.  Calling this phase orbit gravity would confuse gauge motion with a
physical continuum geometry.

The result does not exclude a nonlinear coexact vortex background, a
dynamically chosen nonzero hidden source, or a separate strong/singularity
sector.  It says those cannot be selected merely by fixing the present U(1)
charge before quotienting the exact-edge gauge kernel.

## Next discriminating test

Apply the native incidence-defined orthogonal quotient by the 45 exact-edge
directions to the existing all-five Hopf/circulation quadratic operator.  On
that gauge-reduced carrier, compute the lowest physical clock-`m=9` mode and
test, without parameter selection:

1. whether its vertex component is nonzero and produces a nonzero hidden
   source Jacobian;
2. whether the induced 13-cell STF Hessian has a conserved-stress Ward
   nullspace and exactly two massless transverse-traceless modes;
3. whether coexact circulation lifts or destabilizes the remaining two
   geometric zero modes;
4. whether any derived causal spatial symbol exists before defining redshift
   or horizon thermodynamics.

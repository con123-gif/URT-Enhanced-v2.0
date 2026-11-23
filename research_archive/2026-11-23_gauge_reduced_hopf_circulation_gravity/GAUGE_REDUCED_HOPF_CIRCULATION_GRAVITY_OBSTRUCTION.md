# Gauge-reduced all-five Hopf/circulation gravity obstruction

## Question

After quotienting the 45 exact-edge gauge directions found by the preceding
certificate, does the existing all-five projective Hopf and circulation join
select a nonzero stress-bearing weak-gravity background?

The calculation uses the unchanged 190/H64/24 action, the native incidence
quotient and the repository's existing Hopf magnetic replacement.  The
circulation feedback is retained honestly: because it is quartic in the
cochain field, its Hessian at the symmetric vacuum is exactly zero.  No
scalar-to-metric map, fit, random state or surrogate operator is introduced.

## Gauge-reduced spectrum

The exact-edge span has dimension 45.  Its orthogonal complement has dimension
145.  Projecting the joined quadratic operator to that complement gives:

- no negative modes;
- one remaining zero mode;
- first positive eigenvalue `0.3309858237944337`.

The exact-edge annihilation residual and Hermiticity residual are both below
`1e-10`.  Thus the Hopf replacement does not destabilize the gauge-reduced
vacuum, but it also does not supply a massless two-polarization tensor sector.

## What the remaining zero mode is

The unique reduced zero mode has unit norm entirely in the 50 face cells:

- vertex norm squared: zero to numerical tolerance;
- edge norm squared: zero to numerical tolerance;
- face norm squared: one.

Within each Platonic solid its face amplitudes are constant.  Each solid has
equal block norm `1/sqrt(5)`, so a face with `F` cells has amplitude
`1/sqrt(5F)`: `1/sqrt(20)` on the tetrahedron, `1/sqrt(30)` on the cube,
`1/sqrt(40)` on the octahedron, `1/sqrt(60)` on the dodecahedron and `1/10`
on the icosahedron.  This is the surviving all-five constant face harmonic.

With unit native Noether charge, the golden clock again selects `m=9`.  The
full nonlinear Hopf/circulation evolution of this state is a pure relative
phase orbit with energy `0.00127920318764`.  It has zero:

- vertex and 13-cell STF amplitude;
- face-square `P3/P5` hidden source;
- coexact circulation energy;
- Hopf vertex current and current curl;
- H64 history forcing and non-equilibrium entropy transfer.

Primitive Hopf frustration acts on vertex links and circulation feedback
requires vertex density times edge curl.  Neither can see or lift this pure
face harmonic.

## First stress-bearing mode

The first positive mode, at gap `0.3309858237944337`, is entirely supported on
the all-five vertex carrier to numerical tolerance.  It has nonzero native
face-field and both hidden sources:

- face-field norm `0.8435435562`;
- `P3` source norm `0.03554723246`;
- `P5` source norm `0.09065387801`.

Its icosahedral vertex component has norm `0.04850338384`; the existing STF
fiveplet projection has norm `0.02956944935`, a fraction `0.6096368338`.
This proves that the joined operator contains a stress-bearing excitation,
but it is gapped and is not the selected ground mode or a massless spin-2
field.

## Physical consequence

The native sequence now distinguishes three layers cleanly:

1. before quotient: 45 exact-edge gauge flat directions;
2. after quotient: one stress-free global face harmonic;
3. above it: a stress-bearing vertex excitation separated by a finite gap.

Therefore the present weak-field Hamiltonian does not yet yield Lorentzian
massless spin-2 gravity, redshift or horizon thermodynamics.  This is a scoped
obstruction to the current selector, not a no-go for nonlinear coexact vortex
or singularity gravity.

## Next discriminating test

Do not simply delete the face harmonic.  First determine whether its amplitude
is a conserved topological flux/Casimir of the full nonlinear 190/H64/24
dynamics.  Compute its Poisson derivative under the joined Hopf/circulation
Hamiltonian and its coupling to the first gapped vertex/STF mode.  If it is an
exact superselection charge, work in fixed-flux sectors and test whether a
nonzero flux background changes the vertex/STF gap or produces an induced
causal tensor response.  If it is not conserved, evolve the exact native
operators and measure the transfer rate rather than imposing a quotient.

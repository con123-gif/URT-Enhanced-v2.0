# Native face-harmonic invariant-flow obstruction

## Question

Can the surviving all-five constant-face harmonic exchange energy with the
first gapped stress-bearing mode through the existing nonlinear Hopf,
circulation, hidden-history or entropy terms?

This is the next test after quotienting the 45 exact-edge gauge directions.
It uses the unchanged 190/H64/24 canonical Hamiltonian and existing joined
operators. No mode is deleted, no coefficient is fitted and no new portal or
scalar-to-metric map is introduced.

## Exact structural result

Let `h` be the normalized equal-block face harmonic: within a solid with `F`
faces every face has amplitude `1/sqrt(5F)`. The native operators give:

- joined quadratic Hessian `H_join h = 0`;
- hidden sources `f(h) = h3(h) = h5(h) = 0`;
- Hopf energy and gradient zero, because Hopf links read vertices;
- circulation energy and gradient zero, because circulation reads vertex
  density and edge curl.

For an arbitrary full state decomposed as

`z_j = a_j h + z_perp,j`,

the complete energy separates as

`E[z,y] = E_h[a] + E_perp[z_perp,y]`,

where `E_h[a] = (r^2/2) <a,L1 a>`. Consequently the canonical equation is

`da/dt = -i r^2 L1 a`,

independently of the stress and H64 fields. The modal norm `sum_j |a_j|^2` is
conserved. This is an invariant linear sector, not a nontrivial symplectic
Casimir: the declared canonical symplectic form is nondegenerate.

## Numeric certificate

The certificate combines two clock harmonics in `a`, the first positive
stress-bearing spatial mode at gap `0.33098582379443636`, and an independent
nonzero H64 eigenmode. It verifies directly from the full gradients that:

- the harmonic-gradient projection is exactly the charge-one clock generator;
- subtracting that linear gradient leaves the nonharmonic gradient unchanged;
- the H64 gradient is unchanged;
- the mixed energy is zero to numerical tolerance;
- the instantaneous harmonic norm derivative is zero.

It then evolves both full nonlinear systems with the same RK4 canonical step:
one with the harmonic and one without it. After subtracting the separately
evolved linear harmonic, the stress and history trajectories coincide to the
certificate tolerance. This is a direct no-transfer result, not an inference
from the vacuum Hessian alone.

## Physical consequence

The face harmonic cannot be the missing bridge from the fixed-charge ground
state to weak gravity, redshift, vortex stress, entropy production or horizon
thermodynamics. The first native stress-bearing mode remains separated by a
finite gap and cannot be populated by this harmonic through the present
Hamiltonian.

This obstruction is sharply scoped. It does not rule out transfer from a
coexact edge-curl background, a nonuniform face mode, or a singular nonlinear
state. Those carriers are visible to the existing circulation and hidden
source operators, unlike the constant-face harmonic.

## Next test

Construct the lowest native coexact edge-curl stationary state at fixed
Noether charge, without external drive or fitted amplitude. Differentiate the
full Hamiltonian there and test whether its circulation density produces a
nonzero STF stress response and a causal spatial principal symbol.

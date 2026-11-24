# Mixed-vortex H64 activation and KMS entropy obstruction

## Question

When vertex density and coexact curl are both present, does the native
190/H64/24 canonical dynamics produce a genuine one-way entropy law, or only
reversible exchange among existing energy sectors?

The certificate uses equal-norm vertex and curl components only as a declared
initial condition. It changes no operator or coefficient.

## Native mixed-state audit

For each of the 30 oriented icosahedral edge seeds, the lowest coexact curl is
combined with its least-stiff native Hopf/circulation vertex direction. The
charge-one clock is `m=9`, the initial H64 field is zero, and the full canonical
right-hand side is evaluated.

The mixed state has effects absent from either pure carrier:

- the hidden source is nonzero and H64 begins to grow;
- circulation and Hopf component energies have orientation-dependent rates of
  both signs;
- the exact continuous-time total-energy derivative is zero;
- the exact continuous-time Noether-charge derivative is zero.

Thus this is genuine native vortex/history energy exchange, not a static
spectral analogy.

## KMS occupation entropy

The existing KMS probabilities define at each clock site

`S_occ = log(4) - p5 log(p5) - (1-p5) log(1-p5)`.

Differentiating the native source chain analytically along the Hamiltonian
right-hand side gives a negative initial `dS_occ/dt` for all 30 orientations.
The certificate then evolves one deterministic seed for 400 RK4 steps. Its
entropy record contains increments of both signs while energy and charge stay
fixed to numerical tolerance.

Therefore `S_occ` is an occupation state function, not a monotone entropy
production functional for the canonical dynamics. The result does not deny
the KMS construction; it blocks promoting that construction alone to genuine
horizon thermodynamics or an irreversible arrow of time.

The numerical entropy change is small because the native five-sector weight
is suppressed by `Delta^2`. Smallness does not repair monotonicity.

## Next test

Use the already-declared positive H64 relaxation semigroup at fixed geometry
and test the relative entropy to the instantaneous KMS/history minimizer. A
monotone relative-entropy balance there would be a legitimate H-theorem for
the dissipative URT update. It must remain explicitly distinct from the
reversible canonical Hamiltonian and from black-hole horizon entropy.

# Sun–Earth–Moon: Why an actual solar-system model is needed (2026-10-15)

**Source:** [solar_three_body_entanglement_baseline.py](solar_three_body_entanglement_baseline.py), a NumPy-only approximate Newtonian N-body baseline plus an exactly solvable *pure-state* three-qubit gravitational tidal-phase toy.

**Important status:** Model setup and independently checked orbit and reduced-purity calculations. Not a prediction that the existing Sun, Earth and Moon are measurably quantum-entangled. **No full JPL ephemeris, decoherence budget, relativistic correction or observational entanglement witness is constructed here.**

## Two distinct questions

1. **Mechanism in principle:** A position-dependent quantum two-body gravitational interaction is capable of creating entanglement in coherently delocalized quantum matter systems. Studying this does *not* require an entire solar system.
2. **Actual Sun–Earth–Moon physics:** Testable entanglement claims about existing astronomical bodies require a controlled multi-body model of orbital dynamics, quantum centre-of-mass coherence, tidal couplings, other celestial perturbers and environmental decoherence. Classical shared gravitational motion or formation history does not prove entanglement.

The primary starting Hamiltonian is

    H = sum_i p_i²/(2 m_i) - sum_{i<j} G m_i m_j/|r_i-r_j| + H_environment.

Separating classical orbital centres R_i(t) from quantum displacements x_i, the cross-coupling Hessian is

    H_cross,ij = G m_i m_j/r_ij³ *
                 x_i^T(3 n_ij n_ij^T - I_3)x_j,

where n_ij=(R_i-R_j)/r_ij. For aligned longitudinal fluctuations,

    H_cross,ij=K_ij x_i x_j,
    K_ij=2 G m_i m_j / r_ij³ (J/m²).

The gravitational cross-tidal Hessian is a genuine three-body input to quantum covariance evolution, but **does not by itself witness entanglement**. The relevant observable is a quantum entanglement measure under a physically justified initial state and environmental channel, not ordinary orbital correlations.

## First numbers (idealized current-sized orbit, not ephemeris)

Measured SI parameters (NASA planetary facts, CODATA G and hbar) and mean separations give approximately:

| Pair | K_ij (J/m²) | Equal coherent branch separation delta for 1 rad phase in 1 s |
|---|---:|---:|
| Sun–Earth | 4.734e11 | 1.49e-23 m |
| Earth–Moon | 1.024e12 | 1.01e-23 m |
| Sun–Moon (aligned, mean) | 5.789e9 | 1.35e-22 m |

The script initializes a toy planar, nearly circular Sun–Earth–Moon configuration and integrates Newton's exact Newtonian three-body force law for 30 days using velocity Verlet with hourly steps. An independent implementation gave Earth–Moon separation about 374,112–386,847 km, Sun–Earth separation 1.0000000–1.0001135 AU, and relative conserved-energy drift 2.8e-11. These are **model diagnostics**, not matches to the observed Moon ephemeris.

## Exactly solvable three-qubit thought experiment

To show what the gravitational interaction would do *if* each planetary centre-of-mass could be maintained in an ideal two-location coherent superposition, take position branches x_i=+/-delta_i/2. The longitudinal cross-Hamiltonian is Ising-like,

    H_int=sum_{i<j} [K_ij delta_i delta_j /4] sigma_z^i sigma_z^j.

Define pair entangling phases

    Phi_ij = K_ij delta_i delta_j t / hbar.

Starting in the pure, product |+>_Sun |+>_Earth |+>_Moon, unitary evolution gives the exact one-body reduced purity

    Tr(rho_i²)=1/2 * [1+prod_{j != i} cos²(Phi_ij/2)].

This formula was independently checked by constructing the eight-complex-amplitude state. For *chosen*, non-observed coherent branch separations delta_i=1e-23 metres and t=1 second, the illustrative purities are about 0.9752 (Sun), 0.8717 (Earth), 0.8911 (Moon), showing entanglement in the **assumed pure three-body model**. Such values should not be attributed to the real astronomical objects.

These phase scales are enormous owing to the masses; nevertheless **large gravitational phase is not evidence of an experimentally accessible coherent planetary state**. Radiation, gravitational/tidal/internal modes, atmosphere and other environmental interactions make the actual open-system state completely different from an isolated three-qubit toy. Reduced purity less than one in an open mixed system would not alone prove entanglement, because it can come from classical/environmental mixing.

## Next physical layer, without fitted explanations

- Replace toy initial coordinates by a reproducible dated Sun/planet/Moon ephemeris (e.g., JPL Horizons/SPICE) and include planetary perturbations.
- Compute the time-dependent full tensor cross-Hessian K_ij^{ab}(t), not only radial coefficients at one aligned epoch.
- Specify the physically plausible centre-of-mass quantum coherence widths or a quantum preparation mechanism; do not infer coherence from mutual gravity.
- Build a demonstrable environmental decoherence master equation with radiation, internal thermal states, scattering and tidal degrees of freedom.
- Compute a valid mixed-state entanglement witness (e.g. logarithmic negativity or multipartite witness), and compare with exactly matched classical stochastic correlations and orbital observations.
- Only then test whether any URT/Cathedral finite transfer, BKM geometry or kissing-cell network predicts new, falsifiable departures; do not insert unmeasured planetary quantum parameters into a purported parameter-free gravitational law.

External background: NASA [planetary fact sheet](https://nssdc.gsfc.nasa.gov/planetary/factsheet/), [Moon distance](https://science.nasa.gov/moon/facts/); Bose et al., PRL 119, 240401 (2017), doi:10.1103/PhysRevLett.119.240401; Marletto & Vedral, PRL 119, 240402 (2017), doi:10.1103/PhysRevLett.119.240402.

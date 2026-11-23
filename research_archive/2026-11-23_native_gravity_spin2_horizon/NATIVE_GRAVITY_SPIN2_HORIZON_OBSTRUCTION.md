# Native K4 gravity, causal spin-2 and horizon-thermodynamics audit

**Date:** 23 November 2026. **Result:** **OBSTRUCTION within the currently declared `newtons_cathedral/gravity.py` operator; physical gravity remains open.** This is not a no-go theorem for the full Cathedral and does not modify the five-Platonic 190/H64/24 dynamics.

## Prior-work ledger and scope

This calculation uses the current native definitions `DELTA_STAR`, `G_NEWTON = DELTA_STAR^2`, `K4_EIGENVALUES = (0,3,3,5)`, and the exact quadratic action written in `newtons_cathedral/gravity.py`. It was checked against the 13 October entropy/gravity audit, the 14 October conditional Fierz-Pauli scale-chain, the 22 November physical-root-cause audit, and the 23 November all-five circulation/Hopf join. Those records already keep Lorentzian geometry, stress sourcing, redshift, and horizon physics open. No random matrix, fitted constant, scalar-to-metric map, or external observed value is introduced here.

## Certificate result

Run:

`python research_archive/2026-11-23_native_gravity_spin2_horizon/NATIVE_GRAVITY_SPIN2_HORIZON_CERT.py`

The certificate imports the repository-native operator and obtains:

- `DELTA_STAR = 0.14751081015957962`, hence the **assigned** `G_NEWTON = 0.021759439113935537` and `m0^2 = 1.0217594391139355`.
- The declared K4 potential-Hessian spectrum is `(1.0217594391, 4.0217594391, 4.0217594391, 6.0217594391)`. Its rank is four and its massless-mode count is zero.
- The time-kinetic Hessian is `+I4`, with Sylvester inertia `(4 positive, 0 negative, 0 null)`. Fourier transformation in the one time variable changes the frequency sign for all four amplitudes; it does not turn their internal Euclidean kinetic metric into a spacetime metric of inertia `(1,3)`.
- Every declared denominator is independent of all three spatial momenta. The spatial principal-symbol rank is therefore zero. This operator alone has no propagation cone, retarded spatial Green function, or redshift observable, and cannot yet be a Lorentzian causal spin-2 response.
- The so-called Kretschmann analogue is the constant spectral moment `69.65467706618028`. It has no mass or position argument, so it cannot diagnose a horizon or curvature singularity.
- With the module's inserted continuum formulas, `T dS/dM = 1` identically for every positive `G` and `M`. Its finite-difference check at `dM/M = 10^-6` has the predetermined relative error `5e-7`. Passing that check certifies algebraic consistency of the inserted formulas, not emergent horizon thermodynamics.

## Physical interpretation

The current K4 construction is a stable four-oscillator system. Stability is useful, but four oscillator labels are not coordinates and their graph eigenvalues are not a derived Lorentzian coframe. The assignment `G_NEWTON = DELTA_STAR^2` also remains a dimensionless model identification, not a source-normalized Newton coupling.

This obstruction is deliberately local to `gravity.py`. It does not invalidate the separate conditional Fierz-Pauli scale-chain, the exact hidden-sector entropy identities, or the all-five Hopf/circulation Hamiltonian. It says those pieces have not yet been joined into one conserved, causal tensor response. In particular, the latest all-five Hamiltonian conserves energy and charge; it does not by itself generate non-equilibrium entropy production or a metric.

## Next decisive test

Construct, from the existing 13-cell stress channels and the unchanged 190/H64/24 action, a **typed symmetric-tensor response operator** with an actual spatial incidence symbol and the native clock as the time carrier. Before any redshift or horizon claim, require all four checks without fitting:

1. a two-polarization massless transverse-traceless kernel at long wavelength;
2. a discrete gravitational Ward nullspace for conserved native stress;
3. positive physical energy after constraints and a causal retarded cone;
4. a lapse/redshift observable derived from the same tensor response.

If the typed source map cannot be constructed, record that failure rather than identifying scalar entropy, K4 labels, or circulation energy with a metric.

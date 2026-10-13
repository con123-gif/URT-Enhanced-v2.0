# Exact 13-site spatial stress-tensor channel reconstruction — 2026-10-13

**Status:** closed as a finite spatial representation-theoretic identity; pending physical identification with stress-energy, Lorentz symmetry and dynamics.

## Kinematic dimension match

The real 13-site carrier has an A5 decomposition
\[
\mathbb R^{13}=\mathbf1_{\rm centre}\oplus\mathbf1_{\rm shell}
\oplus\mathbf3\oplus\mathbf3'\oplus\mathbf5.
\]
Under a *chosen spatial rotation* \(SO(3)\) and its icosahedral subgroup \(A_5\), a symmetric 4D stress tensor splits into two spatial scalars \(T_{00}\) and \(\mathrm{tr}\,T_{ij}\), one spatial momentum vector \(T_{0i}\), and a symmetric trace-free spatial stress \(\pi_{ij}\):
\[
10=1+1+3+5.
\]
The three-dimensional \(3'\) representation is orthogonal to these ten channels. This is a precise kinematic embedding of **component counts**, not a statement that the 13-site data already forms a physical covariant tensor.

## Explicit projector (no fitted coefficients)

Let \(n_j\in S^2\), \(j=1,\dots,12\), denote the normalized icosahedron vertices. For arbitrary sampled shell amplitudes \(f_j\), define
\[
a=\frac1{12}\sum_j f_j,\qquad
b_a=\frac14\sum_j n_j^a f_j,
\]
\[
Q_{ab}=\frac58\sum_j
(n_j^a n_j^b-\delta_{ab}/3)f_j.
\]
The fourfold moment identity
\(\sum_j n_j^a n_j^b n_j^c n_j^d
=\frac45(\delta_{ab}\delta_{cd}+\delta_{ac}\delta_{bd}+\delta_{ad}\delta_{bc})\)
proves that
\[
f_j^{(0,1,2)}=a+b_a n_j^a+Q_{ab}n_j^a n_j^b
\]
is the orthogonal projection onto the 9-dimensional shell subspace \(1\oplus3\oplus5\). The residual has dimension 3 and is orthogonal to all these modes. The independent centre amplitude supplies the tenth component.

The 12x9 sampling matrix has numerical rank 9. Fifty randomized complete-shell tests recover all nine projected channels to floating-point precision.

## Exact spectral placement

The centred icosahedral graph Laplacian restricts to:
- scalar doublet: eigenvalues 0 and 13;
- vertex-direction vector \(3\): \(6-\sqrt5\);
- quadrupole (STF) \(5\): \(7\);
- residual \(3'\): \(6+\sqrt5\).

The script verifies eigen-residual norms below \(10^{-10}\). This relates the stress-component *representation candidates* to the previously frozen finite Laplacian without altering it.

## Why this does not yet finish the Einstein bridge

1. These are spatial \(SO(3)\) components. A Lorentz-covariant \(T_{\mu\nu}\) requires an independently derived boost action mixing those components.
2. The decomposition supplies no energy-momentum conservation equation \(\nabla_\mu T^{\mu\nu}=0\).
3. The fiveplet is spin-2 *as a spatial rotation representation*, but its finite graph eigenvalue 7 does not prove a massless spin-2 propagator, transverse-traceless graviton dynamics or diffeomorphism gauge symmetry.
4. The map from shell amplitudes to physical energy density, momentum and stress still requires a matter operator and normalization. The existing scalar rail modular Hamiltonian only measures the one-dimensional population direction in each cell.

**Next physical gate:** find a self-adjoint local matter stress operator on the multi-cell/coframe Hilbert space whose reduced-state modular variation projects to these 10 channels and whose continuum Ward identity is the covariant stress conservation equation. Then test the area response and Einstein-equilibrium condition; no arbitrary coupling may be selected solely to reproduce the desired result.

Reproduce with Python + numpy by running
research_archive/2026-10-13_entropy_gravity/cathedral_13cell_stress_representation_2026_10_13.py

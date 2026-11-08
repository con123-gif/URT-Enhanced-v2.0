# Newton's Cathedral: one nonlinear 190×64×24 engine with native 3D history transport

**Date:** 8 November 2026. **Status:** exact finite-dimensional/Hamiltonian and conditional PDE theorems for the specified spatial extension; verified numerically against the *original*, unchanged 7 November Cathedral source. **No third-party work was imported.** All physical units remain internal.

## Result: integrate the existing two engines rather than substitute a third model

The 7 November original has five Platonic Hodge complexes (190 cochains, including all 50 vertices), the 50→8→12→20 icosahedral face source, the two hidden rank-four projectors, all 64 sign histories, and the 24 charged golden clock. The 8 November v3 module `cathedral_core/full_dynamics.py` advances geometry `z_j∈ℂ^190` and history `y_j∈ℂ^64` in one local nonlinear Hamiltonian action `S_Cat(z,y;θ)`. The separately established history propagation module supplies **the same exact** `H64=15I−∑_(a<b)X_aX_b` and six true icosahedral velocity axes.

This extension uses **neither** a substituted Gaussian heat equation **nor** new history transition rates. The additional ingredient is external three-dimensional position `x`, a declared field-theory completion. The spatial velocity coefficient is the original `r=π/e`, not a new empirical or tunable number.

### Native velocities, exactly tied to original history-bit order

Let the original antipodal pairs of the 12 icosahedral vertices be `(a_i,b_i)`, `i=0,…,5`. Take `u_i=vertex(a_i)/|vertex(a_i)|`. For native integer state `s∈{0,…,63}`, define `σ_i(s)=1−2((s≫i)&1)` and

\[
 v_s=\frac{\pi}{e}\sum_{i=0}^{5}\sigma_i(s)u_i,\qquad
 \sum_i u_i u_i^T=2I_3.
\]

The pair-flip operator has exact entries `H64[s,s]=15` and `H64[s,s xor (1<<i) xor (1<<j)]=−1`, so it commutes with history parity. This is the original model's actual bit indexing, not an independently numbered 64-state surrogate. The strict continuum characteristic-velocity bound is

\[
 \max_s\|v_s\|=\frac\pi e\sqrt{6+2\sqrt5}=3.7400122673791003.
\]

### A single spatially extended action

Let `z(x)∈ℂ^{24×190}`, `y(x)∈ℂ^{24×64}` on a periodic spatial three-torus. Keep the original 24 clock-link angles `θ_j` independent of physical `x`. Extend the **unchanged original local action** by the native diagonal first-order transport operator:

\[
\boxed{\quad
 \mathcal H[z,y]=\int_{\mathbb T^3}\left[
 S_{\rm Cat}(z(x),y(x);\theta)
 +\frac12\operatorname{Re}\sum_{j,s}\bar y_{js}(x)
 \left(-i v_s\cdot\nabla_x\right)y_{js}(x)
 \right]d^3x.\quad}
\]

In real-gradient convention `dS=Re⟨g_z,dz⟩+Re⟨g_y,dy⟩`, its canonical equations are

\[
\boxed{\quad
 \partial_t z=-i g_z[S_{\rm Cat}],\qquad
 \partial_t y_s+v_s\cdot\nabla_x y_s=-i g_{y_s}[S_{\rm Cat}].\quad}
\]

The local gradients are **exactly** those already checked against the archived `full_action` in URT v3, including the full original 64-history source coupling, hidden 3/5 amplitudes, eight-state KMS term, all five cochain energies, and charge-one/charge-two golden clock. All 64 history amplitudes are independent dynamic coordinates. The spatial transport does **not** turn the original complex clock link into a stochastic Markov generator.

This first-order spatial Hamiltonian is self-adjoint under periodic boundary conditions: `-i v_s·∇_x` is Hermitian. Its signed momentum spectrum is **not** bounded below for arbitrary continuum momenta, just as for an uncompleted first-order Dirac-type Hamiltonian. Unitarity and conservative finite dynamics follow, but do not treat the model as a positive-energy quantum vacuum without an additional physical spectral-sector construction. No new fitted mass was added to mask this.

## Theorem 1: exact homogeneous reduction

If `z,y` are independent of `x`, the new transport term vanishes. The full local energy and both evolution equations coincide **exactly** with the existing v3 `full_dynamics` engine, once per spatial cell. The code checks the original model's independent `full_action(z,y,θ)` to better than `1e−9` and matches its analytic field gradients to `1e−10`. This prevents a spatial upgrade from silently replacing the previously proved nonlinear model.

## Theorem 2: exact energy and local U(1) continuity

For smooth periodic solutions, the chain rule and self-adjointness give

\[
 d\mathcal H/dt=0.
\]

Global phase symmetry `z→e^{iα}z`, `y→e^{2iα}y` gives conserved charge

\[
 Q=\int_{\mathbb T^3}\left(\|z\|^2+2\|y\|^2\right)dx.
\]

The stronger **local** identity holds because the original onsite nonlinear source has charge `+2` for a quadratic charge-`+1` face signal:

\[
\boxed{\qquad
 \partial_t \rho+\nabla\cdot J=0,
 \quad\rho=\sum_{j,a}|z_{ja}|^2+2\sum_{j,s}|y_{js}|^2,
 \quad J=2\sum_{j,s}v_s|y_{js}|^2.\qquad}
\]

*Proof:* Differentiate `rho` using the two PDEs. The local source terms cancel pointwise by the original U(1) Ward identity; the history transport contributes `−2∑_s v_s·∇|y_s|²=−∇·J`. This is a **derived spatial current**, not an arbitrary constitutive law. Rephasings `α_j` depending on the 24 *clock* sites but not on `x` are gauge covariances of the full spatial action. Allowing gauge transformations depending on physical `x` requires spatial connection fields, which this extension does not pretend to contain.

## Theorem 3: finite propagation in the underlying PDE

The only spatial derivatives are diagonal transport terms with characteristic speeds `v_s`; `z` obeys an onsite evolution law. For two smooth solutions agreeing initially outside a compact region, uniqueness of the characteristic integral equations and the local nonlinearity imply agreement outside the region's characteristic cone, for as long as the smooth solutions exist. The maximum speed is exactly the native icosahedral number `vmax` above. The proof is via Duhamel along each `x−v_s t` history characteristic and the local-in-`x` z ODE, followed by Grönwall on the exterior region.

The computational implementation uses a periodic *Fourier collocation* grid and exact complex FFT differentiation, so its finite-grid interpolant can have global spectral tails. The finite-speed theorem concerns the continuum PDE, **not** a false assertion that a finite FFT update has compact grid support.

## Theorem 4: the same history operator determines the spatial fluctuation law

For spatial Fourier momentum `k` and 24-clock mode `m`, the *zero-background* history Hamiltonian block is the genuine 64×64 matrix

\[
 H_y(k,m)=H_{64}+\operatorname{diag}_s(v_s\cdot k)
 +r^2\left[2−2\cos(2\theta−2\pi m/24)\right]I_{64}.
\]

Set the original real history-tilt generator `B(k)=−H64+diag_s(v_s·k)`. Then the exact spectral identity is

\[
 \boxed{H_y(k,m)=r^2\ell_2(m)I_{64}−B(−k).}
\]

This is the promised **one-operator bridge**: the full 64-state stochastic history source and the spatial quantum/history evolution are linked without substituting another kinetic matrix. For the low mode and any fixed direction, the earlier exactly certified sixth-order history cumulants give

\[
 \omega_{\rm low}(k,m)=r^2\ell_2(m)
 -\frac{r^2}{5}\|k\|^2
 +\frac{r^4}{2000}\|k\|^4
 -c_{6,\pm}(\hat k)\|k\|^6+O(\|k\|^8).
\]

The first two spatial terms are isotropic by exact icosahedral symmetry; sixth-order orientation/history-parity differences survive. In the lowest `m=18` clock sector, the native `r² ℓ2` is `0.01022872513785791`. Along any Cartesian icosahedral symmetry axis, its lowest signed Hamiltonian branch crosses zero at approximately `|k|=0.1956897756015`. This is a **band crossing**, not evidence for a physical photon or a stable vacuum. It exposes the specific spectral-sector work needed for a fully semibounded quantum interpretation.

## Theorem 5: global existence for the finite FFT semidiscrete ODE

At a fixed finite periodic grid, FFT differentiation is a finite skew-Hermitian derivative and the nonlinear onsite action is smooth. The complex ODE has exact positive Noether charge `Q=||z||²+2||y||²`, which bounds **every** finite-grid amplitude for all times. Hence finite-dimensional ODE continuation proves a global solution in both time directions at fixed grid resolution. The numerical RK4 stepping approximates (but does not exactly preserve) these invariants; a future structure-preserving integrator can improve long-time numerical fidelity.

## Executable original-model regression, 8 November 2026

Run with original Cathedral archive, NumPy and SciPy installed:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -m pytest -q -s tests/test_spatial_dynamics.py
```

The **eight independent tests** verify:

1. Uniform spatial reduction reproduces full native `190×64×24` energy, source and analytic gradient exactly, and the original archive's `full_action` agrees.
2. All 64 native histories, six antipodal axes, 2 parity classes, and exact maximum velocity match the unchanged archived operators.
3. Exact 3D unitary history advection on the FFT grid, a non-axis-aligned three-dimensional plane wave, microscopic Green–Kubo `D=r²/5` and the full Markov/Hamiltonian dispersion identity.
4. Full nonlinear spatial energy Fréchet derivative, charge-one/two clock gauge covariance and exact ODE `dH/dt=dQ/dt=0`.
5. A transported, *nonzero original hidden source* perturbs all-five geometry at a **different** spatial site: numerical geometric gradient difference `0.050699395920585956` in the reproducible seven-site test.
6. Three nonlinear RK4 steps preserve energy within `1.78×10^-13` and charge within `2.84×10^-14` on the full 3-cell geometry/history/clock state.
7. A native spatial charge-current test gives local continuity residual `2.49×10^-17` for resolved Fourier modes.
8. The new public `native_urt_spatial_dynamics()` factory loads the original action with configurable three-dimensional grid spacing; the empty state has zero gradient and zero energy.

**Status of integration:** The source-loaded interaction **and** derived 3D history transport now run in a single conservative algorithm with an explicit local current and a reproducible propagation test. The module does not identify physical metres/seconds, Lorentz invariance, chiral Standard Model fields, or the Einstein gravitational action. Those are separate physical identifications, not part of the eight tested numerical checks. Neither the bare stochastic Markov history evolution nor the independent original spatial coordinates are silently claimed to be the entire physical universe.

**Provenance:** All six axes, history bits and full nonlinear local action are read from `research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py`. The original scalar URT controller, v2 optimising engine, v3 conservative engine and existing sixth-order propagation module are preserved. No James Montgomery Lockwood manuscript, calculations or code are used in this construction; his separate credited research remains unchanged in the repository.
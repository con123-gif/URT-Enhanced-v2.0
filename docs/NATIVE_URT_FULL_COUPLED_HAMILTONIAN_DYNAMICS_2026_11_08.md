# URT v3 — native 190+64 coupled nonlinear Hamiltonian evolution (8 Nov 2026)

## Implementation

The original scalar URT prototype remains in `cathedral_core/urt.py`; the existing all-five v2 energy-descent engine remains in `cathedral_core/native_urt.py`. This **new active alternative** `native_urt_full_dynamics()` constructs `cathedral_core.full_dynamics.NativeURTFullDynamics` from the unchanged 7 November **source**. It does **not** collapse the 64 signed histories into only the eight visible history directions; all 24x64 independent complex history coordinates are actually evolved, together with all 24x190 complex Platonic cochain coordinates.

## Exact dynamical construction

Let `S(z,y,θ)` be the exact original full action (including the full history kinetic `Hbits`, original 50→8→12 nonlinear incidence source, positive sector contact, adaptive eight-state KMS term, five-solid Hodge/cochain terms, and charge-one/charge-two 24-clock). At frozen gauge links `θ` take the real Fréchet gradients defined by

`dS=Re⟨g_z,dz⟩+Re⟨g_y,dy⟩`.

Define the **canonical complex Hamiltonian evolution law**

`dz/dt = -i g_z`, `dy/dt = -i g_y`.

This is a mathematically explicit conservative completion, replacing the old optimization-as-dynamics interpretation. It introduces no numerical fit to observations. However, adoption of this particular canonical symplectic law as physical time is a model premise; its physical necessity cannot be proved by energy conservation alone.

### Theorem 1: exact energy conservation

For smooth solutions of the above finite-dimensional ODE, the chain rule gives

`dS/dt=Re⟨g_z,-i g_z⟩+Re⟨g_y,-i g_y⟩=0`.

### Theorem 2: exact Noether charge

The original action obeys `S(e^{iα}z,e^{2iα}y,θ)=S(z,y,θ)` for any constant real α. Differentiating at zero gives `Im[⟨g_z,z⟩+2⟨g_y,y⟩]=0`. The dynamical law therefore conserves

`Q=||z||²+2||y||²`.

Local gauge covariance follows from the original action and is verified on random 24-site rephasings, with `θ_j -> θ_j+α_{j+1}-α_j`. These transformations are **not** the same as an emergent physical photon.

### Theorem 3: full original linearised spectrum

The hidden sources `h3,h5` are quadratic in the matter field `z`; both their cubic coupling to `y` and their quartic/KMS corrections vanish from the Hessian at the zero-field configuration. Therefore the **complete linearised Hessian** is precisely the direct sum

`K_z = H_geom⊗I24 + r² I190⊗L24^(charge1)`, `K_y = Hbits⊗I24 +r²I64⊗L24^(charge2)`.

In a Fourier clock basis its 6096 eigenvalues are exactly

`λ_geom,a + r²[2−2cos(θ−2πm/24)]` for a=1,...,190,

`λ_hist,b + r²[2−2cos(2θ−2πm/24)]` for b=1,...,64,

where `r=π/e`, `θ=2π/φ²`. The original 64-history spectrum remains `0(2),10(12),16(30),18(20)`. At the prescribed fixed golden twist the minimum positive eigenvalues of the full two blocks are:

- **geometry:** `0.00255840637527755` (clock mode 9);
- **history:** `0.0102287251378507` (clock mode 18).

These values are in internal dimensionless action units. They are not claimed to be observed particle masses. At zero field, the model has finite charged fluctuation gaps; a physical massless photon is **not** demonstrated by the existing clock-only U(1) gauge redundancy.

## Executed numerical regression and physical diagnostics

Run `PYTHONPATH=. OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python tests/test_full_dynamics.py` and `python -m pytest -q tests/test_full_dynamics_factory.py tests/test_native_urt.py`.

The test loads the original full `S(z,y,θ)` and compares energy with **independently assembled full action** from 7 November, checks both 6096-component analytic gradients against finite differences, local gauge covariance, and the exact energy and U(1)-charge derivative identities. It runs six RK4 canonical steps (`dt=0.001`). For the fixed seeded initial full state:

- initial `S=36.97528268458673`, final `36.97528268457909`; total drift `−7.6383344e−12`;
- initial `Q=11.61925785332867`, final `11.619257853327236`; drift `−1.4335200e−12`;
- history amplitude norm squared changes `0.10383254612452046 -> 0.10383975506460735` (nontrivial inter-sector transfer);
- instantaneous history amplitude-norm derivative `0.00118368711984798 ≠0`;
- original full-action absolute residual `1.42e−14`;
- finite-difference directional gradient `−0.327102880604` versus analytic `−0.327102880481`.

The **continuous ODE** has exactly conserved invariants; RK4 is only approximately conservative at finite step size and the quoted errors are numerical, not mathematically exact discrete conservation.

## What changed in the actual prototype

This is not a catalogue or a surrogate toy field. Before this change, the v2 engine either minimized all history variables conditional on geometry or relaxed the history at fixed geometry and performed a dissipative geometric line search. V3 allows the genuine full source-loaded geometry/history degrees to oscillate and exchange amplitude without forcing the whole machine to dissipate towards its vacuum. All five oriented Platonic complexes, original 64 Walsh history, 24 golden clock, positive hidden Gibbs weights and source-induced interaction remain live. The original and v2 behaviours are retained for reproducibility.

The model is therefore **a working nonlinear classical Hamiltonian finite machine**, with an explicit fluctuation spectrum and conserved quantities. An inferred physical 3+1 metric, physical chiral fermions, full non-Abelian gauge sector and gravitational Einstein dynamics are not inferred from conservation of these invariants alone. The next comparison to observations must use outputs, not unexplained inserted parameters.
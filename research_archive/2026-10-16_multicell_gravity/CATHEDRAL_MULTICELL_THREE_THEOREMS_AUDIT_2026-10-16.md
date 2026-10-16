# Newton's Cathedral — Multi-cell field physics: three-theorem verification (16 October 2026)

**Disposition:** three proposed theorems preserved as research hypotheses, with reproducible operator verification. The exact representation and transfer identities are retained; a graviton-polarization proof and an unscreened Newtonian gravitational law **do not follow** from the currently supplied multi-cell action. This is a local finding about the named argument, not a global no-go for URT/Cathedral. No fitted physical inputs are used in the finite geometry; the multi-cell coupling J is an explicitly chosen parameter for an illustrative screening test and is not derived.

**Run:** `python cathedral_multicell_three_theorems_2026_10_16.py` in this archive folder. Requires NumPy, and the icosahedral `cathedral_operator_audit.py` in sibling `2026-10-15_icosahedral_125_DEC_H64` (existing in the repository). Output JSON: `cathedral_multicell_three_theorems_results_2026_10_16.json`.

## Theorem 1 proposed: `5 - 3 = 2` graviton polarizations from dipole-gradient subtraction

**Supplied claim:** the 5-dimensional quadrupole sector and the 3-dimensional dipole-gradient sector have a 3-dimensional intersection on the 30 edges, leaving 2 physical polarizations.

**Exact result:** let `d0` be the oriented 30x12 vertex-to-edge coboundary, `L=d0.T@d0`, `P3` the vertex dipole projector onto eigenvalue `5-sqrt(5)`, and `P5` the vertex fiveplet projector onto eigenvalue 6. Orthogonality of spectral projectors implies

`(d0 P3)^T(d0 P5) = P3 L P5 = 0`.

The two edge-gradient subspaces are **orthogonal**, of ranks 3 and 5, with combined rank 8. The quadrupole gradient image has rank 5, not 2. Tested overlap norm: `9.10e-16`.

**Constructive correct 5-to-2 result:** for a **specified nonzero spatial wavevector** `k` in 3D, a spatial symmetric trace-free tensor `Q_ij` has 5 components. The linear map `Q_ij -> k^i Q_ij` has rank 3, leaving a 2-dimensional kernel. The canonical transverse/traceless projector is

`Q_TT=(P Q P) - (1/2) P tr(P Q), P=I-k k^T`.

Explicitly encoding the icosahedral STF quadrupole and three distinct wavevector directions gives TT rank 2 and transverse/traceless residuals `<2e-16`. This is standard tensor algebra; its promotion to gravitational propagating modes requires a multi-cell wave operator, consistent Lorentzian constraints and gauge invariance. The icosahedral dipole-gradient quotient does not establish the TT count.

## Theorem 2 proposed: BKM multi-cell free energy proves an isotropic `1/r²` Newton force

**Supplied model:** local positive BKM stiffness `chi=chi35≈47.9669783`, nearest-neighbour coupling `J`, a quadrupole field `q_x` and external mass-energy source `S_x`:

`F[q]= (chi/2) sum_x |q_x|² + (J/2) sum_<xy> |q_x-q_y|² - sum_x S_x·q_x`.

**Its Euler–Lagrange equation is exact:**

`(chi I + J L_network) q = S`.

**But this is a *massive* operator.** For a 3D regular nearest-neighbour lattice of spacing `a`, `L(k)=2 sum_j (1-cos(k_j a))=a² |k|²+O(k⁴a⁴)`. Thus the Fourier denominator is `chi + J a² |k|²`. In the infinite continuum approximation, the Green function behaves as

`G(r) ~ exp(-r/ell)/(4 pi J a² r), ell=a sqrt(J/chi)` (with measure/source-density normalization determined by the lattice-to-continuum dictionary).

Its force gradient has a Yukawa factor, not a pure long-range `1/r²` tail. Numerical FFT solution on a periodic `48³` nearest-neighbour lattice with **illustrative** ratio `J/chi=16` has equation residual `6.82e-16` and `ell=4` grid units. The quantity `r G(r)` decreases from `7.04e-5` at r=2 to `8.65e-6` at r=10; it does not approach a nonzero constant over those distances.

**A constructive alternative worth investigating:** a *protected massless mode* with shift-symmetric energy `F_grad=(J/2) sum_<xy>|q_x-q_y|² - sum S_x q_x` has symbol `J a²|k|²` and a `1/r` Green function in 3D (when zero-mode/neutrality and boundary issues are resolved). The resulting gradient scales as `1/r²`. The on-site BKM quadratic is absent for the protected mode; therefore a microscopic symmetry or cancellation has to *derive* its absence rather than merely discard the positive stiffness. Even then the coefficient involves the source coupling, spacing and `J`; `G_N∝chi35^{-1}` is not established from the current action.

**Geometry qualification:** perfectly regular icosahedra do not tile Euclidean 3-space by themselves. A cubic lattice also has an isotropic leading-order continuum Laplacian; its anisotropic corrections appear at higher order. Local `I_h` spin-2 irreducibility is useful but does not alone imply a globally space-filling, Lorentz-covariant isotropic continuum.

**Typing qualification:** the candidate `q_x` is a 5-component STF field, while mass density is scalar. A concrete symmetry-respecting tensor/source map is needed to deduce Newton's scalar potential or the tensor-mediated force between masses.

## Theorem 3 proposed: icosahedral sectors and transfer ratios

**The original finite operator is retained:**

`M=(L_ico + 1 1^T)/20`, where `(1 1^T)1=12 1` and `(1 1^T) x=0` for any vector orthogonal to 1.

Therefore the only sector to which 12 is added is the uniform monopole. For all nonuniform sectors the eigenvalue is `lambda_ico/20`:

| Irrep | Dimension | `L_ico` eigenvalue | Correct `M` eigenvalue | `M` normalized by singlet `.6` |
|---|---:|---:|---:|---:|
| Monopole 1 | 1 | 0 | 0.600000000 | 1.000000000 |
| Dipole 3 | 3 | `5-sqrt5` | 0.138196601 | 0.230327669 |
| Quadrupole 5 | 5 | 6 | 0.300000000 | 0.500000000 |
| Other triplet 3' | 3 | `5+sqrt5` | 0.361803399 | 0.603005665 |

Spectral residual on the full matrix: `3.32e-16`. As before, relative quadrupole power decreases by a factor `(1/2)^2=1/4` per normalized transfer step. For a specified diffusive graph law `p'= -Gamma L_ico p`, the exact fiveplet/dipole *damping eigenvalue ratio* is `6/(5-sqrt5)=2.170820393...`; the unknown physical `Gamma` remains external. The representation labels do not by themselves establish photon/gluon/graviton assignments.

**Why the originally supplied table failed:** it used `(lambda_V+12)/20` for the nonuniform modes, although the rank-one all-ones matrix vanishes on those modes. Its listed transfer eigenvalues and their normalized ratios therefore disagreed with one another.

## Canonical project continuity

These findings update **only** the status of the three explicitly tested multi-cell claims. Retain established original URT O(N) recursive/history/phase machinery, 13-cell/125-simplex Hodge identities, 64-state finite operator, hidden `4_3+4_5` sector, master KMS/BKM density state, complex fiveplet isometry, signed face chirality, exact local DEC edge curl, finite algebra/KO6 seed, previous flavour history, and separate kinetic/thermodynamic research branches.

The next useful multi-cell derivation must specify (a) a space-filling intercell geometry and its exact boundary matrices, (b) a 4D spacetime/gauge constraint that protects a massless spin-2 mode, (c) source coupling and physical normalization, and (d) an independently testable long-range observable. These are positive construction targets, not assumptions to insert into a result.

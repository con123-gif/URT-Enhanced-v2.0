# Prime-lattice URT → oscillator vacuum: exact conditional bridge and two obstructions

**Date:** 2026-11-21  
**Branch:** stand-alone arithmetic URT research; not a Cathedral physics derivation.  
**Status:** THEOREM for a specified magnetic prime-pair model; conditional quantum embedding. **Neither the origin of physical ZPE nor RH is established.**  
**Reproducible file:** `prime_urt_vacuum_bridge_2026_11_21.py` (local Python 3.11, NumPy, SymPy).  
**Provenance:** preceding committed prime-holonomy phase and magnetic gap: `research_archive/2026-11-21_urt_prime_reciprocity/`, `research_archive/2026-11-21_urt_prime_magnetic_gap/`. Their Legendre-symbol/golden-angle coupling is an explicitly *chosen* extension of primitive URT, not a first-principles uniqueness result.

## Result 1: exact four-site prime-plaquette spectrum

For each distinct odd prime pair `p<q` define `eps(p,q)=(-1)^(((p-1)/2)*((q-1)/2))` by quadratic reciprocity. For the selected history-dependent URT lift, the gauge-invariant plaquette holonomy is

`z = eps(p,q) exp(-i theta)`, `theta=2*pi/phi^2`, `phi=(1+sqrt(5))/2`.

On the four prime-exponent states `1,p,q,pq`, the Hermitian unit-link adjacency `A(z)` has square edges `1,1,z,1` around the loop. A direct determinant yields

`det(lambda I - A(z)) = lambda^4 - 4 lambda^2 + 2 - z - z^-1`.

The **finite graph magnetic Laplacian** is `L4(z)=2I-A(z)`. It is positive for `z!=1`; exactly

`det(L4)=2-z-z^-1=2(1-eps cos theta)`.

Let `F=|arg z|` with `0<F<=pi`. Its four eigenvalues are

`2 +/- 2 cos(F/4)` and `2 +/- 2 sin(F/4)`, individually nonnegative, with smallest `2-2cos(F/4)>0`.

For `eps=+1`: `F=theta=2.399963229729`, `lambda_min=0.349318389222`, `det(L4)=3.474737756157`.

For `eps=-1`: `F=pi-theta=0.741629423861`, `lambda_min=0.034277525278`, `det(L4)=0.525262243843`.

These are **dimensionless stiffness eigenvalues**, not physical energies.

## Result 2: if a charged harmonic quantum field is supplied, its vacuum observables change

**Additional physical assumptions, explicitly not derived from URT:** four *complex* scalar coordinates are canonically quantized, requiring 8 real canonical pairs, a mass `m` and frequency scale `omega0>0`. The complex Hermitian matrix `L4` cannot consistently represent a magnetic coupling in a single real scalar's quadratic potential: imaginary antisymmetric entries cancel for commuting real positions. Use the real symmetric 8×8 realification

`R(L) = [[Re(L), -Im(L)], [Im(L), Re(L)]]`.

The quantized Hamiltonian is

`H = (1/(2m)) P^T P + (m omega0^2/2) Q^T R(L4) Q`, with `Q,P` canonical and `[Q_i,P_j]=i hbar delta_ij`.

Each eigenvalue of `L4` occurs *twice* in `R(L4)`. Normal-mode diagonalisation gives the un-normal-ordered oscillator energy

`E0/(hbar omega0) = Tr sqrt(L4)`

`= 2[(1+sqrt(2)) cos(F/8)+sin(F/8)]`.

No phenomenological numbers were fitted. Exact relative energy shift between reciprocity sectors, in units of the **assumed** `hbar omega0`, is

`Delta E0/(hbar omega0) = 2[(1+sqrt2)(cos(theta/8)-cos((pi-theta)/8)) + sin(theta/8)-sin((pi-theta)/8)]`

`= 0.210974605569...`.

Values: `E0(+)/(hbar omega0)=5.203810807053`; `E0(-)/(hbar omega0)=4.992836201484`. Ratio `1.042255463039`.

For each *real component* at a site (variance units `hbar/(2 m omega0)`), the Gaussian vacuum covariance is `R(L4)^(-1/2)`; the diagonal per site is `0.963073531484` (+) or `1.834028556074` (-), a ratio `1.904349456316`. This is an actual prediction **inside the specified oscillator model**, not a measured property of empty spacetime. A local U(1) gauge transformation conjugates `L4` unitarily and leaves all quoted spectral quantities unchanged.

**Important:** normal-ordering can subtract the common oscillator vacuum contribution; this construction does not show that its absolute constant gravitates. The difference is invariant under a shared energy-zero convention but becomes physically observable only if sectors can be compared in a specified physical system.

## Result 3: infinite two-prime lattice has bounded quantum infrared fluctuations — conditionally

On the whole two-prime exponent quadrant `ell^2(N_0^2)`, the declared twisted shifts give bounded positive magnetic Dirichlet operator

`L=(I-Vp)^*(I-Vp)+(I-Vq)^*(I-Vq) >= g_eps I`, where

`g_eps=(1-eps cos theta)/4`, and `0<L<=8I`.

For a canonically quantised charged oscillator network of stiffness `L`, this forces all normal-mode frequencies to obey `omega>=omega0 sqrt(g_eps)` and the real-coordinate vacuum covariance satisfies

`0 < Cov_Q <= [hbar/(2m omega0 sqrt(g_eps))] I`.

Thus the **uniform infrared covariance bound** is inherited from arithmetic holonomy, once the independent quantum-Hamiltonian assumptions are supplied. It is the precise conditional stability-to-fluctuations bridge. This is not a derivation of CCR, the Planck constant, the vacuum state of QFT, or any vacuum-energy density.

For a `k×k` Dirichlet quadrant `L_k=4I-A_k(c)`, the dimensionless complex-field zero-point energy **per complex site** equals `k^-2 Tr sqrt(L_k)`. Direct diagonalisation:

| k | eps + | eps - | zero flux | plus minus difference |
|---|---:|---:|---:|---:|
| 5 | 1.944692616 | 1.940254076 | 1.938871154 | 0.004438541 |
| 9 | 1.937793308 | 1.931802609 | 1.929395677 | 0.005990699 |
| 15 | 1.934311670 | 1.927452358 | 1.924315473 | 0.006859312 |
| 25 | 1.932212454 | 1.924802376 | 1.921141210 | 0.007410078 |

**Existence theorem (not numerical extrapolation):** For each fixed holonomy `c`, the thermodynamic limit of `k^-2 Tr sqrt(L_k)` exists. Proof: `spec(L_k)` lies in `[0,8]`. For each polynomial `P`, the diagonal matrix element of `P(L_k)` agrees with the translation-gauge-invariant bulk coefficient away from a boundary layer whose relative site fraction is `O(deg P/k)`. Hence the normalised traces of every polynomial converge. Uniform polynomial approximation of `sqrt(x)` on `[0,8]` then proves convergence for the square root. For `c!=1`, the proven uniform gap also permits the same argument for `x^-1/2`, so the local covariance density has a finite thermodynamic limit. The **nonzero difference of the infinite-volume energy densities** is supported by finite data but is **not proved** by this existence argument.

## Result 4: first exact magnetic-sensitive bulk moment occurs at four prime moves

Closed-walk enumeration on `Z^2` gives

`<0|A(c)^4|0> = 28 + 4c + 4c^-1 = 28 + 8 Re(c)`.

There are exactly 28 phase-neutral closed four-step walks, four each of the two plaquette orientations. For the two reciprocity sectors their signed difference is exactly `m4(+) - m4(-) = 16 cos(theta)`, and their absolute difference is `16 |cos(theta)|`. Lower closed-walk moments do not detect the plaquette holonomy. A 9×9 matrix check at an interior site reproduces the exact result. This provides a **local spectral observable** sensitive to the arithmetic phase independent of any quantum oscillator interpretation.

## Two crucial obstructions (no inserted fixes)

**Algebraic:** If `U:N_{>=1}->B(H)` is a multiplicative monoid homomorphism, then `U(p)U(q)=U(pq)=U(qp)=U(q)U(p)`. Hence any nontrivial relation `U_p U_q=c U_q U_p`, `c!=1`, is incompatible with representing the *ordinary commutative integer multiplication* by that same operator family, provided products are nonzero (here they are isometries). Our prime lifts form a **twisted/projective** arithmetic representation with path-order information. Their spectra cannot be equated to those of classical `zeta` by an Euler-product argument. The separate commuting diagonal `log n` Hamiltonian still yields `Tr exp(-sH)=zeta(s)` for `Re s>1`, but a zeta-determinant identity for the magnetic operator remains missing.

**Physical dimensions and autonomy:** The numbers `pi,e,phi`, reciprocity signs and the lattice construction are dimensionless. The physical oscillator constants `hbar`, `m`, `omega0`, lattice spacing, physical locality and coupling to gravity **are not** produced by these inputs. Consequently we cannot deduce energy in joules, vacuum energy density in J/m^3, the cosmological constant, the previously discarded 9/13 target, or a ZPE experiment prediction without an independent scale and physical observable map. Noncommuting arithmetic shifts do not imply the canonical commutation relation `[Q,P]=i hbar` used in Result 2. Thus **a spectral gap alone does not force a physical vacuum energy**.

## Independent external context

Magnetic graph Laplacians and their relation to holonomy/frustration are established mathematical subjects: e.g., *Frustration index and Cheeger inequalities for discrete and continuous magnetic Laplacians* (2016), https://arxiv.org/abs/1502.06299. Oscillator-network vacuum response is a standard consequence of quadratic canonical quantisation, not a new derivation of QFT. Our exact phase/reciprocity numbers are conditional to the specified lift and cannot be claimed as experimentally established.

## Reproducibility, next task

Executed locally, `/mnt/data/prime_urt_vacuum_bridge_2026_11_21.py` with SymPy 1.14, NumPy 2.3.5; all assertions and direct diagonalisation through 625 sites passed. Source to be saved beside this report in the repository. Exact next test: derive, from primitive URT rather than imposed charged-field quantisation, either (a) a faithful physical observable map to a gauge-coupled system with independent energy scale, or (b) an exact trace/determinant identity connecting the twisted operator to the **classical** completed zeta function, including Gamma-factor and prime-power terms. Do not promote either task to a theorem without proof.

**RESUME HERE:** algebraic four-loop vacuum response and 2D magnetic-gap covariance bound are proved conditionally. The *physical identification* and *RH spectral link* are open. Do not add 9/13, 0.0012, or other fitted/target constants.
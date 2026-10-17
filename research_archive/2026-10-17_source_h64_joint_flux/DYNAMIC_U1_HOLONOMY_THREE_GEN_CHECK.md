# Selected H64 U(1) holonomy and three-generation quadratic response — 17 October 2026

**Source-executed result, without measured masses or a fitted Koide phase.** The calculation combines the original October 8 species-loaded 12-step H64 signed-history amplitudes (4 species) with its polar links, physical primitive 3Q charge words, colour multiplicities, and a specified positive fermionic Fock thermodynamic completion. It does not claim to be the uniquely selected full physical charged-lepton/photon transfer.

## Positive charged transfer and dynamical holonomy
Native 3x3 loaded amplitudes A_{f,k} and 3x3 polar links U_{f,k} give

```
(D_f(chi) psi)_k = A_{f,k+1}(psi_{k+1}-exp(i q_f chi/12) U_{f,k} psi_k)
H_f(chi) = D_f(chi)^dagger D_f(chi)
```

for primitive charges q=(2,-1,-3,0) on (u,d,e,nu) and natural colour/spin multiplicities n=(3,3,1,1). Compact flux chi is a **history Wilson phase**, distinct from Koide spectral delta. Original polar period products are the identity (residuals <1.6e-14), but the amplitude weights give species-dependent full 36-mode spectra away from zero flux.

At the **explicit finite Fock choice** beta/a = eta_Delta = -log Delta,

```
F(chi) = -sum_f n_f Tr log(I36 + exp[-eta_Delta H_f(chi)])
```

has two nonzero, stable and numerically selected compact minima at chi=+/-2.117803328392 radians, not a prescribed 2/9 or 2/3. F(chi*)=-54.950721743355 vs F(0)=-54.927025496805; curvature F''(chi*)=+1.333017579. At one branch, independently differentiated primitive U(1) currents (colour included) are u=-0.011380560, d=-0.020014723, e=+0.031395356, nu=0, summing 7.35e-8 at numerical stationarity. Gauge rephasing covariance holds to <2e-12. This is a **derived persistent-current balance within the stated conditional fermionic action**, not an inserted chiral source.

## Unfitted effective three-generation matrix
Let T_0=I3, T_{k+1}=U_k T_k and transported positive metrics B_k=T_{k+1}^dagger A_{k+1}^dagger A_{k+1}T_{k+1}. Integrating out the nonzero history modes (matrix-valued springs in series) gives the exact leading small-flux 3x3 operator

```
K_f^(2) = (1/12) [sum_{k=0}^{11} B_k^{-1}]^{-1},
lambda_{f,j}(chi) = q_f^2 chi^2 lambda_j(K_f^(2)) + O(chi^4).
```

For e, eigenvalues of K_e^(2): (0.003126277553360,0.012687436472529,0.025911264784838). Independent full 36x36 diagonalization at chi=0.001 verifies the quadratic eigenvalue prediction to relative 2.52e-8. No phenomenological mass parameters or measured charged-lepton data were used.

## Actual three charged history levels at selected chi
Electron effective flux is q_e chi* = -3 chi*, equivalent modulo 2pi to 0.07022444 rad. Three smallest positive history eigenenergies: (1.541721063827e-5,6.256798290953e-5,1.277811775232e-4).

- Consecutive energy ratios: 4.058320560 and 2.042277401.
- Koide Q if energies are *masses*: 0.384263249078.
- Koide Q if energies are *sqrt-masses*: 0.483716797383.

Neither is 2/3, and low-energy positive history eigenvalues do not automatically equal charged particle mass poles. **This calculation does not derive nature's lepton masses**; assigning this conditional history holonomy to the real A4 electromagnetic gauge connection and projecting the physical gauge-invariant charged correlator remain separate identifications. The archive itself distinguishes its explicitly declared positive Fock Hamiltonian from the canonical, fully selected H64 species-loaded physical action. Do not label chi* as Koide delta.

## Reproduction
Complete executable NumPy/SciPy script, original source-array subset, mathematical derivation and output JSON are in the conversation artifact `URT_H64_common_photon_holonomy_and_generation_2026-10-17.zip`. Its original subset SHA256: `1bf7f26d468bc6a672eba573522bd6063ac592a0642d8a9550e3b9df5c672642`. The script checks all four species, gauge covariance, analytical current balance and the 3x3 small-flux operator.

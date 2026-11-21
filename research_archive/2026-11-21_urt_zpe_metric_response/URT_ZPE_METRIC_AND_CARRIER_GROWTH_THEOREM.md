# URT golden-flux Gaussian vacuum: metric stress and the carrier-creation route to effective negative pressure

**Date:** 21 November 2026. **Research track:** standalone prime-URT ZPE, not a separate geometry/ARF/RH investigation.  
**Status:** THEOREM — **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**, conditional on the previously declared two-axis golden-flux graph, canonical quantum oscillators, and the explicitly specified metric interpretation. **No physical dark-energy or general-relativistic completion is claimed.** No observational value, fitted parameter or historic 95.6% target is used.

## 1. Recover the original microscopic model unchanged

The original URT recurrence is

\[
 r_{k+1}=(\pi/e)r_k,\quad\theta_{k+1}=\theta_k+2\pi/\phi^2,\qquad \phi=(1+\sqrt5)/2.
\]

The prime-pair magnetic lift is still a **declared extension**, not uniquely deduced from this recurrence. For reciprocity sector \(\epsilon=\pm1\), the plaquette holonomy is \(z_\epsilon=\epsilon e^{-2\pi i/\phi^2}\). On the same actual-degree finite \(N\times N\) lattice, write its horizontal and vertical nonnegative magnetic edge forms separately as \(L_x(F),L_y(F)\). The previously proved operator is exactly \(L=L_x+L_y\), with the original 2×2 plaquette recovered at \(N=2\). Its gap, Gaussian ZPE, site-entanglement, thermodynamic bulk energy and joining-interface energy remain unchanged.

### The one additional premise: a static physical spatial metric

To investigate the physical mechanical response, **hypothesise** that a lattice step in the two prime-exponent directions corresponds to proper spatial lengths \(\ell_x,\ell_y>0\). This identification is not implied by the arithmetic lattice. In a homogeneous static metric \(ds^2=-c^2dt^2+\ell_x^2dx^2+\ell_y^2dy^2\), the natural minimally coupled massless complex-lattice-scalar action (realified field \(Q\)) is

\[
S=\frac{J}{2}\int dt\left[c^{-2}\dot Q^{\mathsf T}\dot Q-Q^{\mathsf T}\mathcal R(K_g)Q\right],\quad
J=\ell_x\ell_y,\quad K_g=\ell_x^{-2}L_x+\ell_y^{-2}L_y.
\]

There is **no adjustable dimensionless frequency factor**: the canonical frequencies are \(\omega_j=c\sqrt{\lambda_j(K_g)}\). However, canonical quantisation, the appearance of physical \(c\) and the mapping of arithmetic axes to physical dimensions remain premises, not primitive-URT theorems. For the complex scalar (two real coordinates per site), the unique gapped Gaussian vacuum gives

\[
E_0(\ell_x,\ell_y)=\hbar c\operatorname{Tr}\sqrt{K_g},\qquad V=N^2\ell_x\ell_y,\quad\rho=E_0/V.
\]

The positivity of \(K_g\) follows exactly from the previous gap: \(K_g\succeq g(F)\min(\ell_x^{-2},\ell_y^{-2})I\), where \(g(F)=1-\cos(F/4)>0\). Thus no infrared mass term or regulator has been inserted.

## 2. Theorem A: exact mechanical metric stress of the original vacuum

At fixed \(N\), fixed plaquette holonomy and fixed state sector, define the directional physical pressures by varying the two proper coordinate lengths,

\[
P_i=-\frac1V\frac{\partial E_0}{\partial\ln\ell_i}.
\]

Analytic differentiation of \(\mathrm{Tr}\sqrt{K_g}\), which does not require \(L_x,L_y\) to commute, gives

\[
\boxed{
P_x=\frac{\hbar c}{V}\operatorname{Tr}\!\left(K_g^{-1/2}\frac{L_x}{\ell_x^2}\right),\qquad
P_y=\frac{\hbar c}{V}\operatorname{Tr}\!\left(K_g^{-1/2}\frac{L_y}{\ell_y^2}\right).}
\]

Both are strictly positive because they are traces of products of a positive definite and a nonzero positive semidefinite matrix. Adding yields the exact *homogeneous scale Ward identity*

\[
\boxed{P_x+P_y=\rho.}
\]

At equal lengths \(\ell_x=\ell_y=\ell\), rotation of the square flux lattice preserves the spectrum and exchanges \(L_x,L_y\) up to magnetic gauge, so

\[
\boxed{P_x=P_y=\rho/2.}
\]

Consequently, the homogeneous static 2+1-dimensional mechanical stress is traceless \(-\rho+P_x+P_y=0\). This is **not** a generally covariant, dynamically conserved 3+1D stress tensor. It is an exactly calculated static uniform-strain response for the declared two-dimensional physical interpretation.

A uniform length scaling \((\ell_x,\ell_y)\mapsto(a\ell_x,a\ell_y)\) gives directly

\[
E_0(a)=a^{-1}E_0(1),\quad V(a)=a^2V(1),\quad\rho(a)=a^{-3}\rho(1),\quad w_{2D}=1/2.
\]

In particular, **if** the physical length dilation implements the original URT step \(a=\pi/e\), then

\[
\boxed{E_{k+1}/E_k=e/\pi,\quad \rho_{k+1}/\rho_k=(e/\pi)^3.}
\]

Those are derived consequences of the mapping hypothesis, not predictions that physical lengths must follow the recurrence.

### Entropy is invariant under stretching existing carriers

The **same** pure Gaussian ground state's physical-site covariance uses \(W=\sqrt{K_g}\), \(W^{-1}\). Under global scaling \(W\mapsto a^{-1}W\), \(W^{-1}\mapsto aW^{-1}\), so every reduced symplectic eigenvalue is unchanged:

\[
\boxed{S_A(a\ell_x,a\ell_y)=S_A(\ell_x,\ell_y)\quad (N\text{ fixed}).}
\]

Therefore *entropy alone does not determine the absolute physical microscopic length* in this fixed-site model. But the previous strict two-sided area law \(c_{\mathrm{low}}N\le S_A/k_B\le C_{\mathrm{area}}N\) shows that entropy necessarily tracks the growing number/extent of interacting carriers when the lattice itself is enlarged. This is a precise mathematical distinction between stretching and generating carriers.

## 3. Theorem B: exact thermodynamics of site-number creation, without fitting

From the previously established infinite-volume limit of this **same graph**,

\[
\operatorname{Tr}\sqrt{L_N}=N^2u(F)+O_F(N),\quad u(F)>0.
\]

Let \(M=N^2\) be the number of microscopic physical sites, with common proper spacing \(\ell\). In the leading thermodynamic bulk order,

\[
E(M,\ell)=\hbar c\,u(F)\frac M\ell,\qquad V=M\ell^2.
\]

Eliminate \(\ell=\sqrt{V/M}\) and denote the *already computed*, but dimensionful, prefactor \(k=\hbar c\,u(F)\):

\[
\boxed{E(V,M)=kM^{3/2}V^{-1/2}.}
\]

Hence the exact bulk thermodynamic differential **when \(M\) is admitted as an independently changing state variable** is

\[
\boxed{dE=-P_{\mathrm{mech}}\,dV+\mu_{\mathrm{carrier}}\,dM,\qquad
P_{\mathrm{mech}}=\rho/2,\quad \mu_{\mathrm{carrier}}=3E/(2M).}
\]

At constant proper microscopic spacing, \(M/V=1/\ell^2\) and \(dM/dV=M/V\). It then follows as a pure chain-rule identity that

\[
\boxed{P_{\mathrm{co\! -\!growth}}
:=-dE/dV\big|_{\ell\text{ fixed}}=
P_{\mathrm{mech}}-\mu_{\mathrm{carrier}}\,dM/dV=-\rho.}
\]

This is the exact mathematical candidate for a *vacuum carrier-creation channel* that yields an effective negative equation of state **without inserting any dark-energy coefficient**. It is NOT the same as the previously derived mechanical pressure. The \(\mu\,dM\) energy source must be derived and included in any gravitational continuity equation. In particular \(P_{\mathrm{co-growth}}=-\rho\) does **not** by itself demonstrate the covariantly conserved dark-energy stress \(T_{\mu\nu}=-\rho g_{\mu\nu}\).

### Arbitrary dimension — algebraic generalisation, not a new microscopic graph

For \(d\) spatial dimensions *if* the same type of homogeneous massless frequency law and spatial site-count law were physically established, then

\[
E(V,M)=kM^{1+1/d}V^{-1/d},\quad
P_{\mathrm{mech}}=\rho/d,\quad
\mu=(1+1/d)E/M,\quad
P_{\mathrm{co-growth}}=-\rho.
\]

The symbolic identity holds for all positive integers \(d\); a **physical three-dimensional URT lattice and its gravitational completion have not been constructed here**. Do not promote this conditional \(d=3\) algebra to cosmology.

## 4. What this does and does not solve

**Closed internally, conditional on the original quantized graph and static metric:** same golden holonomy, same spectral ZPE, gauge-invariant positive directional pressures, exact Ward trace \(P_x+P_y=\rho\), isotropic \(w_{2D}=1/2\), same-ground-state entanglement invariant under global proper stretching, and exact bulk source-dependent first-law identity that gives co-growth effective \(-\rho\).

**Physical identification pending:** a dynamical law selecting microscopic proper spacing \(\ell_*\); an URT-derived carrier-creation process \(M(V)\) (and a microscopic transfer/isometry explaining its energy and entropy); a physical 3+1D embedding and covariant effective action that yields a conserved stress. The arithmetic spectrum still predicts *relative* vacuum energies until a physical reference state and dimensional scale are selected. The exact carrier creation first law is a **mechanism to investigate**, not an observed dark-energy derivation.

## 5. Certification and provenance

- `URT_ZPE_METRIC_RESPONSE_CERT.py` rebuilds the same N×N golden-flux nearest-neighbour edges, checks the original N=2 spectrum, static anisotropic Hellmann–Feynman derivatives against energy differences, exact scale Ward identity, local gauge invariance and site entropy invariance for N=2,4,6,8,10 and both reciprocity sectors. Test lengths are diagnostic, not fitted parameters.
- `URT_CARRIER_CREATION_THERMODYNAMICS_CERT.py` proves the arbitrary-\(d\) bulk first-law identities symbolically with SymPy and independently examines the actual same-graph finite-size co-growth derivative for N=4,6,8,10,12,14 and both sectors. The finite derivatives approach the asymptotic \(-1\) from below because of existing boundary terms; asymptotic closure is analytic from the prior \(O(N)\) theorem, not inferred by extrapolation.
- Both scripts executed locally in this session, with exit 0. GitHub CI should be reported separately after the commit.

**RESUME HERE:** Do not switch the graph or import an unrelated entropy. Build an explicit URT transfer/isometry adding one complete boundary shell of physical sites (both old and added regions gapped), compute the joint Gaussian ground-state energy and its entanglement produced by joining actual bonds, and derive its energy source from the same transfer. Only if that supplies a metric-covariant carrier density may the co-growth pressure be identified with physical dark energy.

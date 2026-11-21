# Prime-URT arithmetic magnetic flux → relative ZPE → cosmological stress: a conditional derivation

**Date:** 2026-11-21. **Scope:** the separately developed prime-lattice URT extension, *not* Newton's Cathedral, RH or an identification with the real vacuum. **Mathematical status:** theorem for the explicitly declared magnetic four-cycle and its explicitly assumed relativistic complex-field quantisation; fundamental physical identification **OPEN**. No physical ZPE, dark-energy scale or cosmological constant has been derived solely from URT.

## 1. Primitive, arithmetic extension and model choices

Primitive URT supplies only dimensionless constants

\[
\phi=(1+\sqrt5)/2,\quad \theta=2\pi/\phi^2,\quad a=\pi/e.
\]

The preceding prime-direction extension uses prime-pair reciprocity sign \(\epsilon\in\{+1,-1\}\) and **chooses** a noncommutative history-dependent parallel transport with plaquette flux \(z_\epsilon=\epsilon e^{-i\theta}\). This transport is **not a theorem of primitive URT**, and ordinary multiplication of prime numbers remains commutative. That distinction survives throughout this work.

On the four arithmetic states \(\{1,p,q,pq\}\), the magnetic adjacency (one gauge choice) and graph Laplacian are

\[
A(z)=\begin{pmatrix}
0&1&1&0\\
1&0&0&z\\
1&0&0&1\\
0&z^{-1}&1&0
\end{pmatrix},\qquad
L(z)=2I_4-A(z),\quad |z|=1.
\]

The magnetic flux around the closed square is not removable by a diagonal gauge change. Direct symbolic determinant computation gives

\[
\boxed{\det(\lambda I-L(z))=\lambda^4-8\lambda^3+20\lambda^2-16\lambda+2-z-z^{-1}}.
\]

For \(z\neq 1\), the four eigenvalues of \(L\) are positive. Writing \(F=|\arg z|\in(0,\pi)\), they are

\[
\boxed{\lambda_j\in\{2\pm2\cos(F/4),\quad 2\pm2\sin(F/4)\}.}
\]

For the two reciprocity classes \(F_+=\theta\), \(F_-=\pi-\theta\). The symbolic spectral moments are

\[
\operatorname{Tr}L^0=4,\quad
\operatorname{Tr}L=8,\quad
\operatorname{Tr}L^2=24,\quad
\operatorname{Tr}L^3=80,\quad
\operatorname{Tr}L^4=280+4(z+z^{-1}).
\]

Therefore the first distinct spectral moment is the fourth:

\[
\boxed{\operatorname{Tr}L_+^4-\operatorname{Tr}L_-^4=16\cos\theta\neq0.}
\]

This is the exact, gauge-invariant loop signature. The equal lower moments are an exact consequence of the absence of magnetic loops shorter than four edges.

## 2. Minimal local relativistic matter action — explicitly **assumed**

To formulate a physical energy density, one must specify a physically propagating field and a scale. Here, as a *testable conditional model*, assume a canonically quantised complex four-component scalar \(\Phi(x)\) on 3+1-dimensional spacetime with action (\(\hbar=c=1\))

\[
\boxed{S_\epsilon[\Phi,g]=\int d^4x\sqrt{-g}\,\left[-g^{\mu\nu}(\nabla_\mu\Phi)^\dagger(\nabla_\nu\Phi)-\mu^2\Phi^\dagger L_\epsilon\Phi\right].}
\]

The positive magnetic matrix is a squared-mass matrix, \(M_\epsilon^2=\mu^2 L_\epsilon\). In Minkowski spacetime its four complex modes satisfy

\[
\omega_{j,\epsilon}(k)=\sqrt{k^2+\mu^2\lambda_{j,\epsilon}}.
\]

This joins operator algebra to a physical field equation in one defined dynamical model. **It does not derive the existence of this relativistic field, its canonical commutation relations, spacetime, or \(\mu\) from URT.** In particular, the arbitrary dimensionful inverse-length scale \(\mu\) cannot be fixed using only \(\pi,e,\phi\) and prime labels.

## 3. Theorem: the relative vacuum energy is UV finite in 3+1D

For a complex scalar (two real degrees of freedom per internal eigenmode), the formal zero-point energy-density difference is

\[
\Delta u=\hbar c\,\int\frac{d^3k}{(2\pi)^3}\left[\sum_{j=1}^{4}\sqrt{k^2+\mu^2\lambda_{j,+}}-\sum_{j=1}^{4}\sqrt{k^2+\mu^2\lambda_{j,-}}\right].
\]

Let \(k\to\infty\). Expand

\[
\sqrt{k^2+\mu^2\lambda}=k+\frac{\mu^2\lambda}{2k}-\frac{\mu^4\lambda^2}{8k^3}+\frac{\mu^6\lambda^3}{16k^5}-\frac{5\mu^8\lambda^4}{128k^7}+O(k^{-9}).
\]

The traces of powers 0,1,2,3 are identical for the two flux sectors, so **all terms through \(k^{-5}\) cancel exactly**. The first nonzero integrand difference is \(O(k^{-7})\); including the three-dimensional measure \(4\pi k^2dk\), the remaining tail is \(O(k^{-5})dk\), absolutely integrable. Thus the difference does not need a UV cutoff or subtraction. This is a mathematically rigorous statement for the declared field model.

An exact radial primitive (setting \(\mu=1\)) is

\[
J_K(\lambda)=\frac{K\sqrt{K^2+\lambda}(2K^2+\lambda)-\lambda^2\operatorname{asinh}(K/\sqrt\lambda)}{16\pi^2}.
\]

Expand at large \(K\) and cancel terms using the moment identities. The finite difference is

\[
\boxed{\Delta u=\frac{\hbar c\,\mu^4}{32\pi^2}\left[\operatorname{Tr}(L_+^2\ln L_+)-\operatorname{Tr}(L_-^2\ln L_-)\right].}
\]

Numerically, at 60-digit intermediate precision,

\[
\begin{aligned}
\Delta\operatorname{Tr}(L^2\ln L)&=0.392203160344666140992\ldots,\\
\boxed{\Delta u/(\hbar c\mu^4)}&=\boxed{0.0012418277635745989098\ldots}>0.
\end{aligned}
\]

The leading finite-cutoff error is

\[
\Delta u_\infty-\Delta u_K\sim -\frac{5\hbar c\mu^8}{1024\pi^2K^4}\,\Delta\operatorname{Tr}(L^4).
\]

The coefficient is derived entirely from the chosen phase, sign and graph. **It is not the previously conjectured stability tax (~0.001211...), and a proximity of numbers would not establish identity.** The individual sector vacuum energies are divergent; the finite result is only their difference. If the two sectors are different physical systems with independent vacuum counterterms, that identification would need further justification.

## 4. Gravity and the equation of state: what follows and what does not

If the flux is constant and \(\mu\) is fixed in spacetime, the zero-derivative term of the relative covariant one-loop effective action is

\[
\Delta\Gamma_{0}= -\int d^4x\sqrt{-g}\,\Delta u.
\]

Varying the metric gives

\[
\boxed{\Delta T_{\mu\nu}=-\Delta u\,g_{\mu\nu},\qquad \Delta p=-\Delta u,\qquad w=-1.}
\]

The same follows from \(E(V)=\Delta u\,V\) and \(p=-\partial E/\partial V\) at fixed \(\mu\). Restoring SI units, the induced difference in cosmological constant is

\[
\boxed{\Delta\Lambda=\frac{8\pi G}{c^4}\Delta u=\big(0.0312105358325584206\ldots\big)\ell_P^2\mu^4},
\qquad \ell_P^2=G\hbar/c^3.
\]

This is a **conditional, mathematically unified ZPE-to-gravity derivation inside a known type of quantum field theory**. It does not imply the measured cosmological constant equals \(\Delta\Lambda\), and higher-curvature effective-action terms are not computed here.

There is a crucial structural countercheck: if the inverse-length scale is itself transported with a cosmological scale factor \(a_{\rm FRW}\), e.g. \(\mu\propto a_{\rm FRW}^{-1}\), then \(\Delta u\propto a_{\rm FRW}^{-4}\). Covariant energy conservation \(d\rho/d\ln a=-3(\rho+p)\) yields **\(w=+1/3\)** instead: the term behaves like radiation, not dark energy. Thus a *constant* physical vacuum scale is an essential dynamical conclusion still needing derivation, not a cosmetic option.

## 5. Incorporating primitive URT π/e without fabricating a scale

If the primitive URT operation is a physical **length** recursion \(\ell_{n+1}=(\pi/e)\ell_n\), then \(\mu_n=1/\ell_n\) transforms as \(\mu_{n+1}=(e/\pi)\mu_n\), and the relative energy obeys the precise dimensionless prediction

\[
\boxed{\frac{\Delta u_{n+1}}{\Delta u_n}=\left(\frac e\pi\right)^4=0.5605036393788517\ldots.}
\]

This is conditional on *identifying the physical mass length with the URT recursion*. The phase enters the coefficient through \(\phi\), and the logarithmic scale factor enters the ratio through \(\pi/e\). Neither produces an absolute SI energy without a physical input scale.

## 6. Exact nonidentification and the smallest outstanding physical problem

A model based only on the dimensionless values \(\pi,e,\phi\), prime labels and Hilbert-space representations has no dimensionful nonzero scale from which \(\rho\propto L^{-4}\) can be fixed. A change of physical length unit \(\ell\mapsto s\ell\) leaves all dimensionless operator identities intact while changing \(\rho\mapsto s^{-4}\rho\). Consequently **an absolute dark-energy density cannot be a prediction of the existing dimensionless axioms alone**. A physical scale-selection dynamics or an additional dimensional input is logically indispensable.

In addition, the noncommuting prime transport is a *twisted lift* of ordinary prime multiplication, not ordinary multiplicative arithmetic itself. Its selection by primitive URT remains open. These are the two priority mathematical problems:

1. Derive the specific prime-flux cocycle and the Lorentz/canonical field representation, rather than declare them.
2. Obtain a dynamical physical length and decide from the resulting equations whether \(\mu\) is constant or tracks cosmological expansion.

The mathematical deliverable here is **a finite relative quantum-vacuum stress tensor from a specified arithmetic magnetic operator, including an exact test for whether it behaves as dark energy or radiation**. It does **not** establish the origin of the physical vacuum, quantum mechanics or dark energy, nor does it solve RH.

## Reproducible execution

Run `python zpe_cosmological_term_certificate.py`. It uses `sympy`, `mpmath` and `numpy`, does exact symbolic determinant/moment checks, performs independent high-precision quadrature and analytic cutoff checks, and exits nonzero if a check fails. Source measurements or fitted cosmological parameters are never inputs.

**Status:** THEOREM (conditional model), one-loop relative vacuum energy. **Physical identification:** OPEN. **RESUME HERE:** seek derivation of the mass-length \(\mu\) and its metric transformation law from primitive URT, not a fitted match to today's cosmological constant.
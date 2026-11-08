# Newton's Cathedral — exact finite-speed spatial transport and sixth-order icosahedral corrections from native H64

**8 November 2026. Status:** exact algebraic theorem for the native six-sign, 64-history continuous-time Markov process; full rational six-variable proof certificate; direct verification against the original 7 November all-five 190-cochain / 50→8→12 / native H64 / 24-clock implementation. No fitted masses, gauge couplings, speed of light, or physical dimensionful units.

## Purpose and original-system connection

The full 2026-11-08 canonical URT v3 engine evolves 24×(190+64) complex geometric and history amplitudes under an energy-preserving Hamiltonian rule. Separately, the **same native 64×64 history operator** is an actual reversible continuous-time Markov generator. This theorem computes the *spatial transport statistics* that can be read from its six icosahedral history signs, all the way through the first directional correction. It supplies an explicit propagation kernel and numerical API without modifying or silently identifying it with the v3 Hamiltonian physical time law.

Take the six normalized representatives of antipodal icosahedral axes

\[
 u_i \in \frac{1}{\sqrt{1+\varphi^2}}\{(0,1,\pm\varphi),(1,\pm\varphi,0),(\varphi,0,\pm1)\},\quad \varphi=\frac{1+\sqrt5}{2}.
\]

For a sign history \(s\in\{-1,+1\}^6\), the existing pair-flip generator is

\[
 L=\sum_{1\le i<j\le6}(I-X_iX_j)=15I-\sum_{i<j}X_iX_j.
\]

The original operator spectrum is \(0(2),10(12),16(30),18(20)\). Each of the two parity classes \(\epsilon=\prod_i s_i=\pm1\) contains 32 states and is irreducible with uniform stationary measure. Use the **specified**, original six-axis readout \(X(s)=\sum_{i=1}^{6}s_i u_i\), and original numerical scale \(r=\pi/e\) to define the accumulated spatial displacement

\[
 Y_t=r\int_0^t X(S_\tau)\,d\tau.
\]

This position readout is not imported from Standard Model phenomenology. Its identification with observed physical position, and the relation of Markov-history time to the v3 symplectic time, are separate physical questions.

## Theorem 1 — exact finite propagation speed and isotropic covariance

For *every* history trajectory (not only in expectation),

\[
 \boxed{\|Y_t\|\le v_{\max}t,\quad v_{\max}=\frac{\pi}{e}\sqrt{6+2\sqrt5}=3.7400122673791003\ldots.}
\]

**Proof:** The 64 statewise values of \(\|X(s)\|^2\) are exactly

- even parity \(+\): \(6-2\sqrt5\) (12 states), \(6+6/\sqrt5\) (20 states);
- odd parity \(-\): \(6-6/\sqrt5\) (20 states), \(6+2\sqrt5\) (12 states).

Thus \(\max_s\|X(s)\|=\sqrt{6+2\sqrt5}\). Integrating the instantaneous speed gives the bound. Its slope is attained by an odd-parity trajectory remaining in a maximum-speed state (an event of positive probability \(e^{-15t}\)). This **finite-propagation cone** is a property of the defined history readout, not a derivation of Lorentz invariance or an identification with the physical speed of light.

The Walsh eigenrelation \(LX_a=10X_a\) and the exact icosahedral identity \(\sum_i u_i u_i^\top=2I_3\) imply, within **each** parity class,

\[
 \boxed{\mathbb E[X_a(t)X_b(0)]=2e^{-10t}\delta_{ab},\qquad
 \operatorname{Cov}(Y_t)=\left[\frac{2r^2}{5}t-\frac{r^2}{25}(1-e^{-10t})\right]I_3.}
\]

Therefore \(t^{-1/2}Y_t\) converges in law to isotropic Brownian displacement with \(D=r^2/5=0.2671411414109495\ldots\). The finite-time covariance and *finite speed* coexist without inserting an external diffusion PDE.

## Theorem 2 — the complete sixth-order tilted-generator expansion

For unit direction \(n\in S^2\), let \(a_i=r(u_i\cdot n)\), \(S_j=\sum_{i=1}^6a_i^j\), and \(P_6=\prod_{i=1}^6a_i\). The real-tilt, long-time cumulant generating rate on parity class \(\epsilon\) is the largest eigenvalue

\[
 \Lambda_\epsilon(tn)=\lambda_{\max}\left[-L_\epsilon+t\operatorname{diag}_{s\in\epsilon}\bigl(rn\cdot X(s)\bigr)\right].
\]

This eigenvalue is analytic around \(t=0\), even in \(t\), and has **the exact Taylor coefficients**

\[
 \boxed{\begin{aligned}
 \Lambda_\epsilon(tn)&=c_2 t^2+c_4 t^4+c_{6,\epsilon}(n)t^6+O(t^8),\\
 c_2&=\frac{S_2}{10}=\frac{r^2}{5},\\
 c_4&=\frac{S_2^2}{4000}-\frac{S_4}{800}=-\frac{r^4}{2000},\\
 c_{6,\epsilon}(n)&=\frac{S_2^3}{300000}-\frac{S_2S_4}{40000}
       +\frac{S_6}{24000}+\frac{\epsilon P_6}{640}.
 \end{aligned}}
\]

The simplifications in the second and fourth orders follow from the original six axes satisfying \(\sum_i (u_i\cdot n)^2=2\), \(\sum_i(u_i\cdot n)^4=6/5\) for all unit \(n\). The *sixth order* contains both the icosahedral sixth angular moment \(S_6\) and a parity-signed \(P_6\). Hence degree 6 is the first place where the propagation can distinguish the icosahedral directions and the two native history components.

**Proof and exact independent certificate:** Work in the Walsh character basis \(\chi_A(s)=\prod_{i\in A}s_i\), where \(L\chi_A=2|A|(6-|A|)\chi_A\). On a fixed parity class \(\chi_{\{1,\ldots,6\}}=\epsilon\), so the 32 independent characters can be represented by the first five bits. Multiplication by \(\sum_i a_i s_i\) acts by bit-mask toggling, with the sixth axis toggling all five bits and carrying a factor \(\epsilon\). Write the eigenvector \(\psi=1+\sum_{n\ge1} t^n\psi_n\), requiring \(\langle\psi_n\rangle=0\). Then recursively

\[
 c_n=\langle V\psi_{n-1}\rangle,\quad
 \psi_n=L^\dagger\left[V\psi_{n-1}-\sum_{j=1}^n c_j\psi_{n-j}\right],\quad \psi_0=1.
\]

Every step is an exact rational operation on polynomials in six algebraically **independent** indeterminates \(a_i\). The supplied standalone certificate tests all six homogeneous degrees against the displayed formula, for **both parity sectors** and all 57 nonzero degree-six monomials. No numerical regression or directional fit is used to obtain the coefficient identity. The independent numerical implementation computes the top eigenvalue of the original 32×32 block and checks the \(O(t^8)\) residual.

## Calculated native anisotropy

Here values of \(c_{6,\epsilon}\) include the original factor \(r^6\), and axes/sector labels follow the archived six-axis ordering:

| Unit direction | parity + | parity − |
|---|---:|---:|
| twofold coordinate axis (1,0,0) | 0 exactly | 0 exactly |
| threefold (1,1,1)/√3 | +0.00000792179494 | −0.00001674788959 |
| fivefold icosahedral vertex axis | −0.00004277769265 | +0.00009043860378 |

This is a falsifiable signature **of the specified finite stochastic Cathedral history readout**, not a claim of observational cosmic anisotropy. The parity splitting and anisotropy both begin at degree 6. For characteristic functions the real tilt \(t\) is replaced by \(it\), reversing signs of even orders 2 and 6 but not 4.

## Genuine runnable propagation engine

The new installable package module `cathedral_core/history_propagation.py` includes:

- the literal original 64×64 pair-flip matrix and exact 32×32 parity restrictions;
- real-time finite-speed radius, exact finite-time covariance and asymptotic diffusion;
- exact finite-time moment-generating function from the full tilted semigroup;
- exact second/fourth/sixth cumulant-rate formulas, and numerical top-eigenvalue evaluation for checks.

The tests `tests/test_history_propagation.py` compare exact rational Walsh coefficients, the parity-sector eigenvalues, finite-time propagators and all special directions. `certify_history_sixth_exact.py` supplies the independent **universal polynomial** verification. `verify_original_history_interface.py` imports the **unchanged original** 7 November all-five interaction code by SHA256 `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`, and verifies equality with its native 64×64 Hbits matrix, while retaining its 190×190 Hodge geometry, 50→8→12 portal and 64×20 hidden isometry.

The theorem materially improves the earlier single diffusion-coefficient result: its stochastic spatial propagator has a finite microscopic speed, an isotropic quadratic and quartic regime, and a calculable sixth-order native icosahedral signature. It does **not** substitute this history observable for the separately interacting v3 Hamiltonian nor claim that tested emergent physical cosmology already follows.
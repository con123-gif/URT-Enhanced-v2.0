# URT–ZPE: finite-time quantum seam joining, source work and Gaussian quantum geometry

**Date:** 21 November 2026. **Scope:** standalone golden-flux three-dimensional Gaussian vacuum, unchanged original native links. **Status:** THEOREM for a declared externally driven canonical-oscillator Hamiltonian, plus numerically executed nonadiabatic dynamics; **physical mechanism still conditional**. Extends the 3D action `9e3fc93`, exact layer ledger `489d3d7`, and auxiliary covariant-pressure action `fe4b73d`. Not RH or the Cathedral ARFs.

## 1. The actual physical question

The preceding 3D papers established that a new original magnetic sheet has positive preparation energy and its native seam has strictly positive joining work. A **static** energy difference does not itself show the cost of coupling quantum oscillators in real time. We now supply an exact finite-time driven Hamiltonian, a quantum work inequality valid away from adiabaticity, a quantitative bound on how the Gaussian vacuum moves along the original joining path, and a direct time-evolution test using the *same* 3D flux links. The control source is explicitly external; no primitive URT controller is invented or silently assumed.

## 2. Original links and the exact seam

Retain the golden angle \(\theta=2\pi/\varphi^2\), and for each \(\epsilon\in\{+1,-1\}\) define \(f_\epsilon=\operatorname{Arg}(\epsilon e^{-i\theta})\), \(F=|f_\epsilon|\). On each \((x,y,z)\) positive edge, retain

\[
 U_x=e^{if_\epsilon z},\quad U_y=e^{if_\epsilon x},\quad U_z=e^{if_\epsilon y}.
\]

For a preexisting 3D box plus a separately prepared magnetic sheet, let \(L_0=L_{\rm old}\oplus L_{\rm sheet}\), let \(B=\sum_{e\in{\rm seam}}b_eb_e^\dagger\) be *precisely* the original link squares between the old box and sheet, and set

\[
 L_\lambda=L_0+\lambda B,\qquad 0\le\lambda\le1.
\]

Each new site has one seam bond to the old box and these bonds are vertex-disjoint, so with seam area \(A\),

\[
 B\succeq0,\qquad B^2=2B,\qquad \operatorname{Tr}B=2A,
 \qquad \|B\|_F^2=4A.
\]

The previous native proof supplies \(g_2I\preceq L_\lambda\preceq12I\) for all \(\lambda\) with \(g_2=1-\cos(F/4)>0\). No new stiffness or regulator is added.

## 3. Theorem I — any monotonic joining ramp has a strictly positive quantum work cost

Let \(K_\lambda=\mathcal R(L_\lambda)\) be the real symmetric realification, so each original complex site carries *two real canonical coordinates*. In units \(\hbar c/\ell\) for energy and \(\ell/c\) for time, the already declared quantum oscillator is

\[
 H_\lambda=\frac12 P_R^TP_R+\frac12Q_R^T K_\lambda Q_R,
\qquad E_0(\lambda)=\operatorname{Tr}_{\mathbb C}\sqrt{L_\lambda}.
\]

Its exact instantaneous source-power operator is

\[
 \frac{\partial H_\lambda}{\partial\lambda}
 =\frac12Q_R^T\mathcal R(B)Q_R\succeq0.
\]

Let \(\lambda(t)\) increase monotonically from zero to one and \(|\psi_t\rangle\) obey the actual time-dependent Schrödinger equation. Then the external control work is

\[
 W_{\rm drive}=\int\dot\lambda(t)\left\langle\partial_\lambda H_\lambda\right\rangle_t dt
 =\langle H_1\rangle_{\rm final}-\langle H_0\rangle_{\rm initial}\ge0.
\]

If the starting state is the **original disconnected vacuum**, the variational principle applied to the final Hamiltonian gives the stronger exact statement

\[
\boxed{W_{\rm drive}\ge E_0(1)-E_0(0)=W_{\rm seam}^{\rm adiabatic}
\ge \frac{A}{\sqrt{12}} >0.}
\]

The earlier static upper bound \(W_{\rm seam}^{\rm adiabatic}\le A/\sqrt{g_2}\) still holds. **That upper bound does not apply to arbitrary rapid driving:** nonadiabatic excitations raise its cost above the static vacuum difference. Uniform positivity of the many-body oscillator gap (at fixed finite size) ensures the exact vacuum-to-vacuum limit is approached as the ramp duration grows. This proves an operational minimum-energy property absent from the earlier static ledger.

An autonomous work reservoir *could* be coupled by promoting \(\lambda\) to a dynamical controller coordinate and using a time-independent total Hamiltonian. This calculation does not choose a unique controller mass, state or driving history; consequently an endogenous URT energy source is still unproved. Its injected energy cannot be omitted.

## 4. Theorem II — an explicit Gaussian fidelity-susceptibility bound

Set \(W_\lambda=\sqrt{L_\lambda}\) and let \(W_\lambda'=\partial_\lambda W_\lambda\). Differentiating \(W_\lambda^2=L_\lambda\) gives the exact Sylvester equation

\[
W_\lambda W_\lambda'+W_\lambda' W_\lambda=B.
\]

Because the realified many-body ground-state wavefunction is Gaussian, its Fubini–Study quantum metric is

\[
\boxed{\mathfrak g_{\lambda\lambda}=\frac14
\operatorname{Tr}_{\mathbb C}\left[(W_\lambda^{-1}W_\lambda')^2\right].}
\]

The factor \(1/4\) includes the **two real canonical coordinates per complex site**. In the eigenbasis of \(W_\lambda\), \((W_\lambda')_{ij}=B_{ij}/(\omega_i+\omega_j)\). Since all \(\omega_i\ge\sqrt{g_2}\),

\[
\|W_\lambda'\|_F^2\le\frac{\|B\|_F^2}{4g_2},\qquad
\|W_\lambda^{-1}\|^2\le\frac1{g_2}.
\]

Consequently the whole original-seam ground-state path satisfies the **nonasymptotic, finite-volume** bound

\[
\boxed{0\le \mathfrak g_{\lambda\lambda}\le\frac{A}{4g_2^2},
\quad \int_0^1\sqrt{\mathfrak g_{\lambda\lambda}}\,d\lambda
\le\frac{\sqrt A}{2g_2}.}
\]

This is a geometry-of-states bound for a quantum implementation of joining, derived from the original gap and real seam bond count. It does not select a physical ramp time, although it makes finite-speed preparation amenable to quantitative adiabatic analysis.

## 5. Executed true native-link real-time evolution

The deterministic certificate builds the original \(2\times2\times2\) box, the actual \(2\times2\) new layer and all four \(z\)-direction golden-flux seam bonds inside the \(2\times2\times3\) box, for both reciprocity signs. It propagates the initial exact Gaussian oscillator ground-state covariances under the time-dependent quadratic Hamiltonian. Every midpoint interval is evolved with the exact matrix exponential of its quadratic Hamiltonian; changes of the stiffness at the interval ends have explicitly computed nonnegative work, so their sum must equal the total energy change. The final state's energy is bounded below by the actual joined-Hamiltonian ground energy. In every case the assertions passed locally.

All energy values below are divided by \(\hbar c/\ell\), all durations by \(\ell/c\); the ramp schedule is linear \(\lambda=t/T\) on \(0\le t\le T\). The finite-step midpoint approximation is a numerical implementation of the time-dependent Schrödinger/Gaussian evolution, not a formal exact continuous-time solution.

| Flux sector | Minimum static seam work | Work at \(T=1\) | Work at \(T=3\) | Work at \(T=10\) |
|:--|--:|--:|--:|--:|
| \(\epsilon=+1\) | 2.525829908325 | 2.912972966331 | 2.578396332149 | 2.533768551728 |
| \(\epsilon=-1\) | 2.733064836786 | 4.775467898824 | 3.527342127257 | 3.042212124869 |

At \(T=1\) the nonadiabatic excesses are 0.387143058006 and 2.042403062038 respectively. At \(T=10\) they decrease to 0.007938643403 and 0.309147288083. This is consistent with the much smaller minus-sector gap: \(g_2(+)=0.174659194611\), \(g_2(-)=0.017138762639\). All values are calculations of the **same** native model; no experimental or cosmological values were inserted.

The positive spectral gap and energy-lower-bound theorems are analytical. Finite-time numbers are numerical tests at a declared ramp schedule. A continuum-time error certificate was **not** computed, so do not treat the last displayed digits as rigorous interval enclosures.

## 6. What has been added and what is next

**New constructive content:** native 3D vacuum joining now has a real-time Gaussian Schrödinger evolution, exact source-work and lower-energy inequalities valid for any monotone driving protocol, a bounded ground-state Fubini–Study quantum metric and explicit finite-speed excitation costs. A physical source must supply at least the adiabatic seam work, *plus* the initial cost to prepare the new layer, *plus* nonadiabatic excess if joining is driven rapidly.

**Still not a completed physical theory:** primitive URT has not produced a unique autonomous controller, actual dynamics generating fresh degrees of freedom, the proper scale/frequency floor, the gravitational field equations or the energy reference for the observed vacuum. The previously derived covariant auxiliary action exactly enforces a constant density, but its multiplier is not a derived microscopic battery. These open physical identifications remain distinct from the proved mathematical statements; do not replace them with arbitrary coefficients.

**RESUME HERE:** Construct a local controller/battery coupling with original URT transfer/KMS variables if possible, and compute the preparation energy and clock-speed law for a native new magnetic sheet. Test whether that mechanism dynamically selects the floor rather than imposing \(\Omega\). Keep original golden-flux links, the exact 3D energy law and previous verified results untouched.

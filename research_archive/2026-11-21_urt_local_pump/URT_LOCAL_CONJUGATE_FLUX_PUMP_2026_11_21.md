# URT–ZPE: an exact site-local, gauge-invariant two-mode pump on the original golden-flux lattice

**21 November 2026. Standalone URT–ZPE track.** **Result:** THEOREM for a *declared* canonical signal–idler field and local squeezing gate; source strength/clock, fresh-carrier activation and GR remain OPEN. Uses the original 3D native golden-flux graph and its unchanged two-real-oscillator-per-complex-site quantisation. Builds on `9e3fc93`, `489d3d7`, `fe4b73d`, `db6be9d`, `6141748` and `87e1504`. Not Riemann hypothesis or Cathedral ARFs.

## 1. The constructive advance

A primitive URT scalar gain \(q=(\pi/e)e^{i\theta}\), \(\theta=2\pi/\phi^2\), admits a quantum-limited two-mode Bogoliubov extension (prior commit `87e1504`). The unresolved microscopic issue was how to implement *matched-frequency* idlers without constructing a nonlocal list of individual spectral projectors or modifying the native magnetic Hamiltonian. Here the idler is simply the **complex conjugate magnetic graph field** \(L_{-F}=\overline{L_F}\). It has the same spectrum for a structural reason and transforms in the conjugate local U(1) representation. A single **onsite and gauge-invariant canonical bilinear** then implements the required equal squeeze across **all** native spectral modes.

This is an exact local solution to *mode matching for the assumed URT bosonic gain*. It is not a derivation of the pump from primitive URT, or the creation of an entirely new physical Hilbert space.

## 2. Same native operator, opposite-charge idler

On the original magnetic 3D graph, \(U_x=e^{ifz}\), \(U_y=e^{ifx}\), \(U_z=e^{ify}\), with \(f=\operatorname{Arg}(\epsilon e^{-i\theta})\). Let \(L\) denote the unchanged positive native magnetic Laplacian of a prepared new sheet, extracted from its original 3D layer by removing only the seam links. The complex signal's real canonical coordinates are stacked as \(Q_s=(\operatorname{Re}q_s,\operatorname{Im}q_s)\), with conjugate momenta \(P_s\), and stiffness \(K_s=\mathcal R(L)\). **Both real quadratures are physical oscillator polarizations.**

Let the idler be the conjugate-charge field with stiffness \(K_i=\mathcal R(\overline L)\). Introduce the real involution

\[
 C=\operatorname{diag}(I_m,-I_m),\quad C^T=C=C^{-1},\quad K_i=CK_sC.
\]

It follows from functional calculus that \(\sqrt{K_i}=C\sqrt{K_s}C\), so the signal and idler modes are automatically isospectral, **without fitting any frequencies**.

## 3. Exact local generator and canonical map

For the *original two-real-component* canonical fields, define the onsite bilinear

\[
 \boxed{G=Q_s^T C P_i+P_s^T C Q_i.}
\]

Each summand pairs the signal and idler at the **same physical site**; the involution \(C\) is only complex conjugation of the second real polarization. A controlled unitary \(U_r=e^{-irG/\hbar}\) implements the symplectic Bogoliubov transformation (with \(a=\cosh r\), \(b=\sinh r\))

\[
\begin{aligned}
Q_s'&=aQ_s+b C Q_i,&\quad P_s'&=aP_s-b C P_i,\\
Q_i'&=aQ_i+b C Q_s,& P_i'&=aP_i-b C P_s.
\end{aligned}
\]

In block form, \(S_Q=\bigl(\begin{smallmatrix}aI&bC\\bC&aI\end{smallmatrix}\bigr)\), \(S_P=\bigl(\begin{smallmatrix}aI&-bC\\-bC&aI\end{smallmatrix}\bigr)\), so \(S_QS_P^T=(a^2-b^2)I=I\): **all canonical commutators are preserved exactly**. Choose the *unmodified* URT gain

\[
 \boxed{a=\frac\pi e,\qquad b=\sqrt{\frac{\pi^2}{e^2}-1},\qquad r=\operatorname{arcosh}(\pi/e).}
\]

The already fixed golden phase appears in the original magnetic links and may be included in the charged signal's U(1) phase rotation. No fitted squeeze gain has been introduced.

## 4. Exact local gauge invariance

Under arbitrary site-local U(1) transformations \(q_s\mapsto Dq_s\), \(q_i\mapsto \bar Dq_i\) for diagonal unitary \(D\), define the corresponding real orthogonal rotations \(G_s=\mathcal R(D)\) and \(G_i=\mathcal R(\bar D)=CG_sC\). Then

\[
 G_s^T C G_i=C,
\]

so \(G\) is invariant. Equivalently, the squeeze matrix commutes with the combined local gauge rotation, \(S(G_s\oplus G_i)=(G_s\oplus G_i)S\), acting simultaneously on positions and momenta. This is an **onsite**, original-gauge-compatible signal–idler operation, not a mode projector engineered after inspecting the spectrum. The local coupling and the signal/idler free Hamiltonians form a genuine constructive lattice quantum model under the declared control gate.

## 5. The full physical two-polarization energy, from the same Gaussian state

The initial signal and idler Gaussian ground-state covariances are \(\Gamma_Q^{(s)}=\frac12K_s^{-1/2}\), \(\Gamma_P^{(s)}=\frac12K_s^{1/2}\), with idler covariances conjugate by \(C\). After the onsite squeezing gate, the signal's *entire* reduced covariance is scaled by \(a^2+b^2=\cosh(2r)=1+2b^2\); the idler behaves identically. Their ground-state energy before the pulse is \(E_{\rm sheet}=\hbar c\operatorname{Tr}_{\mathbb C}\sqrt L/\ell\) **per field**, so

\[
 E_s'=\cosh(2r)E_{\rm sheet},\quad E_i'=\cosh(2r)E_{\rm sheet},
\]

and the physically complete two-polarization pulse requires external work

\[
\boxed{\Delta E_{\rm pump}=4\sinh^2r\,E_{\rm sheet}
=4\left[\left(\frac\pi e\right)^2-1\right]E_{\rm sheet}.}
\]

The **dimensionless coefficient is exactly**

\[
\boxed{4\left[(\pi/e)^2-1\right]=1.342822828219\ldots.}
\]

This corrects a **normalization distinction** in `87e1504`: its earlier \(2[(\pi/e)^2-1]E_{\rm sheet}\) counted one signal–idler oscillator pair per complex eigenvalue, whereas the original 3D Gaussian vacuum actually carries **two real canonical oscillators** per complex eigenvalue. Applying a local, U(1)-gauge-invariant pump to the full original charged field necessarily excites both, giving the factor four. The older arithmetic was correct for its explicitly single-pair toy channel, **not** for this full native field implementation. No earlier 3D magnetic eigenvalue or sheet joining work is modified.

### Executed original-link test

The deterministic certificate reconstructs the actual \(2\times2\times3\) original flux graph, removes only the four native seam bonds and extracts the existing \(2\times2\) magnetic new sheet. It constructs the realified original and conjugate idler operators, checks \(K_i=CK_sC\), the exact symplectic identity, covariance under a nonconstant site-dependent gauge transformation, and applies the squeeze to the *full two-polarization Gaussian covariance*, verifying energy before/after the pulse.

| Reciprocity sector | Original sheet vacuum \(E_{\rm sheet}\) | Full gauge-invariant onsite pump work |
|:--|--:|--:|
| \(\epsilon=+1\) | 5.203810807053 | 6.987795945444 |
| \(\epsilon=-1\) | 4.992836201484 | 6.704494428911 |

All quantities are in \(\hbar c/\ell\). Exact formulas prove the coefficient; these finite native computations test the implementation. All assertions passed in the local container, 21 November 2026. CI registered after commit.

**This pump energy is excitation energy added to signal+idler, not work already delivered to a new sheet ground state.** A further *local conversion mechanism* must transfer energy from the pumped sector to new-sheet preparation and seam joining, and must account for whatever pump field provides \(\Delta E_{\rm pump}\). The values above must not be subtracted from creation costs as if a real energy-transfer channel had been derived.

## 6. What this closes and what it does not

**Constructive internal closure:** The primitive gain \(\pi/e\), original golden-phase magnetic 3D geometry, conjugate-charge idler, full two-real-polarization quantum vacuum and an explicit **onsite U(1)-invariant** squeezing operation now coexist without changing the frozen native lattice. All original mode frequencies are matched automatically; canonical commutation and gauge covariance are exact; the pump energy is computed from the same magnetic Gaussian ground state.

**Physical identification still open:** Why primitive URT must act as this canonical bosonic gain; which local dynamical field generates the required squeeze gate and pays its positive work; how the resulting excitation energy activates dormant carriers and joins their magnetic bonds; what fixes the time/rate, proper oscillator frequency threshold, vacuum reference, Newton coupling and covariant gravity. The fixed-gap creation law is still conditional, not derived from this gate. No zero-parameter theory of observed dark energy is claimed.

**RESUME HERE:** Introduce a *physical local pump field and its positive Hamiltonian* coupled to this onsite generator, compute exact joint unitary exchange with the full native magnetic oscillator, and see whether the channel can transfer energy into prepared/attached sheets at the required rate. Do not append a fitted counterterm, force \(\Gamma=3H\), or modify the preexisting original magnetic operator.

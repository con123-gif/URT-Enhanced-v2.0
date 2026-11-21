# URT ZPE-to-dark-energy coefficient: why 95.6157% is not 100%

**Date:** 2026-11-21  
**Focus:** User's question: "Find out why it's not 100 percent; I bet it's your mistake."  
**Verdict:** **REVIEW / CORRECTION OF PHYSICAL IDENTIFICATION, EXACT ARITHMETIC RETAINED.** No physical vacuum or dark-energy closure is claimed. No numerical constants or correlation strengths fitted. James's work and the Riemann Hypothesis are outside this task.

## 1. Original inputs and numerical verification

Primitive golden ratio and angle:

\[
\phi=(1+\sqrt5)/2,\quad \theta=2\pi/\phi^2.
\]

Master-state mismatch and entropy:

\[
\Delta=\frac3{20}-\frac{80\pi}{1053\phi},\quad
p=\frac{\Delta^2}{1+\Delta^2},\quad
\rho_*=\frac{I_4\oplus\Delta^2I_4}{4(1+\Delta^2)},\quad
s_*=\frac{S(\rho_*)}{k_B}=\ln4+H_2(p).
\]

The declared finite magnetic four-cycle is the 2-regular magnetic graph Laplacian \(L_{2,\epsilon}=2I_4-A_\epsilon\), with flux \(c_\epsilon=\epsilon e^{-i\theta}\), \(\epsilon\in\{\pm1\}\). Let \(F_+=\theta\in(0,\pi)\), \(F_-=\pi-\theta\). Its eigenvalues are

\[
\lambda_{\epsilon}=2\pm 2\cos(F_\epsilon/4),\qquad 2\pm 2\sin(F_\epsilon/4).
\]

For the *separately assumed canonically quantised complex oscillator* this gives a relative ground-state energy difference \(\Delta E_{\rm osc}=d\hbar\omega_0\), where

\[
d=\operatorname{Tr}\sqrt{L_{2,+}}-\operatorname{Tr}\sqrt{L_{2,-}}
=0.2109746055694190823233372376\ldots\;.
\]

The **additional** assumptions in the original horizon proposal were:

- GR area entropy \(S_H/k_B=\pi R^2/\ell_P^2\), with \(\ell_P^2=G\hbar/c^3\);
- each independent horizon carrier has entropy \(s_*\), so \(N_H=S_H/(k_Bs_*)\);
- relative per-carrier ZPE energy \(d\hbar\omega_0\), with \(\omega_0=\kappa c/R\) and an **unproved** \(\kappa=1\);
- additive relative energies and the identification of their sum with the gravitational vacuum energy.

Under these assumptions,

\[
E_{\rm URT}(R)=\frac{\pi\kappa d}{s_*}\frac{c^4R}{G},\quad
E_{\rm dS}(R)=\frac{c^4R}{2G},\quad
\frac{E_{\rm URT}}{E_{\rm dS}}=\frac{2\pi\kappa d}{s_*}.
\]

With \(\kappa=1\):

\[
\boxed{r=0.9561573731665629838389979164\ldots},\qquad 1-r=0.0438426268334370161610020836\ldots.
\]

**There is no decimal arithmetic error in that ratio.** The length \(R\) cancels, so adjusting entropy's physical scale does not make it 1. Picking \(\kappa=1/r=1.045852940178917\ldots\) would be fitting, **not a derivation**.

## 2. Exact source of the mathematical-physics mistake

The \(d\) above is a **difference of ground-state energies of two complex oscillator systems**. The \(s_*\) above is the von Neumann entropy of the **independently defined mixed eight-level master state**. No single Hamiltonian, physical subsystem, or boundary/bulk correspondence was derived whose vacuum has *both* of these properties. Thus the division \(2\pi d/s_*\) is a conditional cross-model comparison, **not an independently derived thermodynamic identity requiring unity**.

The discrepancy can be demonstrated without choosing any new constant:

1. \(S(\rho_*)/k_B=1.386374857427224\ldots>\ln4=1.386294361119891\ldots\). A density matrix on the four-dimensional magnetic *one-particle* Hilbert space could not equal \(\rho_*\). The associated oscillator Fock space is larger, but no embedding of \(\rho_*\) into that Fock-space vacuum was derived.
2. Define the natural eight-level one-particle Hamiltonian \(H_{\rm mag}=L_{2,+}\oplus L_{2,-}\). Its eight levels are **all distinct**. The master \(\rho_*\) has **two eigenvalues, each with multiplicity four**. Therefore for any \(\beta>0\), \(e^{-\beta H_{\rm mag}}/\operatorname{Tr}e^{-\beta H_{\rm mag}}\neq\rho_*\). This is an exact spectral-multiplicity obstruction to identifying them as the same Gibbs state.
3. The native URT KMS inverse temperature \(\beta_*=-2\log\Delta=11.99159597348\ldots\) gives a Gibbs entropy for \(H_{\rm mag}\) of only **0.10756033221053473434 nats**, not \(s_*=1.38637485742\ldots\). Thus even the original, unfitted temperature does not reconcile them.

These are **scope-specific statements**, not no-go results for an enlarged interacting vacuum or for \(\rho_*\) as a reduced density of a larger pure state. The finite spectral calculation and URT master-state arithmetic are retained independently.

## 3. A constructive exact joint-state result that does not require fitting

Keep the declared eight-state magnetic operator \(H_{\rm mag}=L_{2,+}\oplus L_{2,-}\) and the original eight-state URT density \(\rho_*\) on the same abstract \(4+4\) carrier.

\[
\boxed{[\rho_*,H_{\rm mag}]=0.}
\]

Thus \(\rho_*\) is a **stationary state** for these internal dynamics, although **not its Gibbs state or ground state**.

For the exact energy moments, use the characteristic polynomial of the four-cycle:

\[
\chi_A(x)=x^4-4x^2+2-z-z^{-1},\qquad z=\epsilon e^{-i\theta}.
\]

By direct symbolic trace calculation,

\[
\operatorname{Tr}(L_{2,\epsilon}^r)=
\begin{cases}
4,&r=0,\\8,&r=1,\\24,&r=2,\\80,&r=3,\\280+8\epsilon\cos\theta,&r=4.
\end{cases}
\]

So without any additional coupling strength,

\[
\boxed{
\operatorname{Tr}(\rho_* H_{\rm mag})=2,\quad
\operatorname{Tr}(\rho_* H_{\rm mag}^2)=6,\quad
\operatorname{Tr}(\rho_* H_{\rm mag}^3)=20,
}
\]

and the **first flux-sensitive moment** is

\[
\boxed{
\operatorname{Tr}(\rho_* H_{\rm mag}^4)
=70+2\frac{1-\Delta^2}{1+\Delta^2}\cos\left(\frac{2\pi}{\phi^2}\right).
}
\]

This is a genuine, exact **frustration-dependent observable of the same \(8\)-state pair \((\rho_*,H_{\rm mag})\)**. It incorporates the original URT entropy and magnetic flux without a fitted 'tax'. It still does **not** prove that this stationary mixed state is the physical vacuum, or that a fourth spectral moment gravitates as a cosmological constant.

## 4. A separate thermodynamic identification still missing

The horizon-model energy is \(E(R)\propto R\) and density \(\rho(R)\propto R^{-2}\). A local vacuum stress tensor with \(P=-\rho\) does **not** follow from that algebra alone. If a separately conserved FRW fluid obeys \(R\propto a_{\rm FRW}\), the continuity equation gives \(w=-1/3\), not \(-1\). For a de Sitter horizon with constant \(R\) no equation of state follows from the comparison coefficient by itself; a covariant effective action/stress tensor and treatment of horizon work/entropy terms is needed. De Sitter horizon thermodynamics has known boundary/sign subtleties, so \(E_{\rm dS}=T_{\rm GH}S_H\) is not by itself a universal first-law derivation.

This means **100% coefficient agreement alone would not prove dark energy**. The physical self-consistency test must include energy, entropy, pressure, and the gravity equations from the same state and dynamics.

## 5. Exact next mathematical task (no patches)

1. Derive the **joint interacting physical Hilbert space** and mode-counting algebra from full original URT, making the entropy-bearing carrier and the magnetic oscillator modes identifiable within one physical system.
2. Derive its **vacuum or reduced density matrix** and the physical Hamiltonian from one dynamics. Test whether the original \(\rho_*\) is a marginal, KMS state, or neither; do not require equality by fiat.
3. Derive the boundary effective action (or reduced Hamiltonian) and **the covariant stress tensor**, not just a numerical energy ratio; check \(w=-1\) without assuming it.
4. Compute the dimensionless coefficient and compare to de Sitter **only after** the above derivation. Do not insert \(0.0607823155\) correlation or change \(\kappa\) to achieve 1.

**Conclusion:** The user was right that the previous 95.6% should not have been promoted as 'almost solved dark energy'. The direct calculation identifies the precise model/state mismatch. The finite magnetic ZPE difference, the URT master entropy, and the new stationary-state fourth-moment identity all survive as valid conditional or exact mathematical results. **No further claims of ZPE/dark-energy closure should use the 95.6% figure as evidence until a common microscopic state and covariant gravitational map exist.**

## 6. Exact audit certificate and interpretation

The accompanying `URT_ZPE_MISMATCH_CERT_2026-11-21.py` checks the symbolic characteristic polynomial, first five spectral moments, the unchanged 95.6157% ratio to 30 decimals, eight-state commutativity, the KMS entropy mismatch, and the first mixed flux-sensitive moment. The local certificate passed on 21 November 2026.

**Important qualification:** the commutator `[rho_*,H_mag]=0` is automatic for any `4⊕4` block-diagonal Hamiltonian because `rho_*` is scalar on each four-dimensional block. Consequently, stationarity is a compatibility check, **not** a novel dynamical derivation or proof that the URT density is selected by magnetic frustration. The flux-sensitive fourth moment is a property of the pair of declared operators; it is not itself an equation for a physical vacuum energy density.
# Newton–Platonic scale: a causal Lorentz-invariant spacetime-field construction

**Date:** 14 October 2026  
**Research status:** rigorous *free relativistic field embedding*, CONDITIONAL on a physical mass dictionary. Not a derivation of quantum gravity, observed particles, or operational sub-Planck distances. Standalone Newton–Platonic mathematics, not reliant on Newton's Cathedral or URT.

## Summary

An exact spectral filter built from the five inscribed cube incidence kernels of a regular dodecahedron and their order-four doubling permutation defines a positive 19-dimensional operator

\[
K_N=P^3+G^2,\quad
\operatorname{spec}K_N=\{(1/64)^{\times8},(1/36)^{\times6},(8/125)^{\times5},0^{\times1}\}.
\]

The associated five-cube overlap state is the positive, trace-one density matrix

\[
R_5=\frac{27}{160}I_5+\frac1{32}J_5,\quad
\operatorname{spec}R_5=\{13/40,(27/160)^{\times4}\}.
\]

The independent golden scale theorem fixes the *relative* geometric factor

\[
s=\frac{3-\sqrt5}{2}=\varphi^{-2}=0.381966011250105\ldots.
\]

An explicit, additional spacetime hypothesis interprets \(s^{-n}\) as a relativistic mass scale: \(m_n=m_0s^{-n}\). Here \(m_0>0\) is one **undetermined dimensional anchor**. The spectral measure of an associated scalar observable is then fixed up to overall canonical field normalization.

## 1. Construction as a local quantum field on Minkowski spacetime

For each \(n\ge0\), choose an orthonormal eigenbasis of \(R_5^{\otimes n}\otimes K_N^n\) on its nonconstant graph subspace. Let its eigenvalues be \(r_{n,b}\lambda_a^n\ge0\), where \(a\) ranges over 19 active Platonic graph eigenmodes and \(b\) over the \(5^n\) branch labels. At \(n=0\), set the branch eigenvalue to 1 and the graph eigenvalue to 1 on the 19 nonconstant modes. Introduce independent positive-norm Klein–Gordon fields \(\phi_{n,b,a}(x)\), each with mass \(m_n=m_0s^{-n}\), and define a generalized free scalar field

\[
\Phi(x)=\sum_{n,b,a}\sqrt{r_{n,b}\lambda_a^n}\;\phi_{n,b,a}(x).
\]

The total squared coefficient is finite:

\[
S_0=\sum_{n,b,a}r_{n,b}\lambda_a^n
=\frac{26809}{1365}=19.640293040293\ldots.
\]

Hence the smeared sum is a well-defined operator-valued distribution on the standard Fock construction. The canonically normalized *observable* \(\widehat\Phi=\Phi/\sqrt{S_0}\) has total Källén–Lehmann weight 1.

A useful minimal realization replaces all level-degenerate modes by one positive-norm scalar field of mass \(m_n\) and effective coupling \(\sqrt{W_n}\); this reproduces the same observable two-point function, but **does not identify every internal branch as a separate physical particle species**.

## 2. Exact Källén–Lehmann spectral measure and spacetime propagator

Taking the trace over the geometric cube branches gives a positive level weight

\[
W_n=8(1/64)^n+6(1/36)^n+5(8/125)^n.
\]

The invariant mass-squared spectral measure is

\[
d\rho(\mu^2)=\sum_{n=0}^{\infty}W_n\,\delta(\mu^2-m_0^2s^{-2n})\,d\mu^2.
\]

In Minkowski signature \((+---)\), the time-ordered Lorentz-invariant propagator is

\[
D_F(p)=i\sum_{n\ge0}\frac{W_n}{p^2-m_0^2s^{-2n}+i0}.
\]

In Euclidean 4-momentum \(Q\),

\[
\boxed{D_E(Q^2)=\sum_{n\ge0}\frac{W_n}{Q^2+m_0^2s^{-2n}}.}
\]

Each pole has nonnegative residue and each mass is positive. For a fixed reference mass, the tower is unbounded above with ratios \(m_{n+1}/m_n=\varphi^2\). This is a mathematical relativistic field with no artificial maximum mass. In particular, if one externally chooses \(m_0=m_P\), levels \(n\ge1\) have *Compton wavelengths* below \(\ell_P\). **That choice is not a prediction of sub-Planck localization.**

The level weights and canonically normalized shares are:

| n | \(m_n/m_0\) | \(W_n\) | \(W_n/S_0\) |
|---:|---:|---:|---:|
| 0 | 1 | 19 | 96.7399008% |
| 1 | 2.61803399 | 0.6116666667 | 3.1143459% |
| 2 | 6.85410197 | 0.02706275463 | 0.1377920% |
| 3 | 17.94427191 | 0.00146983840 | 0.00748379% |

The relative mass positions and spectral strengths are conditional model predictions, independent of the absolute anchor \(m_0\).

## 3. Relativistic causality, positive energy and Euclidean reflection positivity

Each constituent is a standard positive-energy Klein–Gordon field, so the sum transforms as a scalar under the proper orthochronous Poincaré group. Its commutator is

\[
[\Phi(x),\Phi(y)]=i\sum_nW_n\,\Delta_{m_n}(x-y)\,I,
\]

where every Pauli–Jordan function \(\Delta_m\) is supported on or inside the light cone. Thus the generalized free field is **microcausal**: its commutator vanishes at spacelike separation. The finite positive spectral measure makes the distributional sum well-defined.

For fixed spatial momentum \(\mathbf k\), the Euclidean time kernel is

\[
C(\tau,\mathbf k)=\sum_nW_n\frac{e^{-\omega_n|\tau|}}{2\omega_n},\qquad
\omega_n=\sqrt{\mathbf k^2+m_n^2}.
\]

For any test function supported at positive times, its reflected quadratic form is a sum of nonnegative squares:

\[
\sum_n\frac{W_n}{2\omega_n}
\left|\int_0^{\infty}dt\,f(t,\mathbf k)e^{-\omega_nt}\right|^2\ge0.
\]

Therefore the Euclidean Gaussian field satisfies time-reflection positivity, with Lorentzian positive-metric reconstruction; numerical reflected Gram matrices passed for multiple momenta. These facts do not imply that its *interactions with gravity* are defined.

## 4. Exact renormalization-type functional equation

Decompose \(D_E=\sum_a d_a F_{\lambda_a}\) for the three nonzero spectral eigenvalues and multiplicities. Define

\[
F_{\lambda}(Q^2)=\sum_{n\ge0}\frac{\lambda^n}{Q^2+m_0^2s^{-2n}}.
\]

A shift of the level index gives an **exact** scaling functional equation:

\[
\boxed{F_{\lambda}(Q^2)=\frac1{Q^2+m_0^2}+\lambda s^2F_{\lambda}(s^2Q^2).}
\]

The three \(\lambda\) values come from the inscribed-cube spectral filter. This is a discrete-scale-invariant two-point recursion with no adjusted level weights. It is a property of the proposed generalized free field—not a derived interacting Wilsonian RG flow.

## 5. Exact high-momentum behaviour and a sharp limitation

Positive level weights have a finite total and finite second mass moment:

\[
S_0=\frac{26809}{1365}=19.640293040293\ldots,\quad
S_2=\sum_ns^{-2n}W_n=25.277812338230\ldots.
\]

Therefore, by dominated convergence,

\[
\boxed{D_E(Q^2)=\frac{S_0}{Q^2}-\frac{m_0^2S_2}{Q^4}+o(Q^{-4})}
\qquad(Q\rightarrow\infty).
\]

The *canonically normalized* observable instead has leading coefficient \(1/Q^2\), with mass-squared coefficient \(S_2/S_0=1.287038451329\ldots\).

More generally the spectral mass moment \(\sum_n W_n(m_n/m_0)^p\) is finite if and only if

\[
p<p_c=\frac{\ln(125/8)}{\ln(1/s)}=2.85619767893483\ldots.
\]

In particular the fourth mass moment diverges in the fixed-level transfer model. The separately specified all-ancestor model can suppress all polynomial moments, but is an **additional** dynamical hypothesis.

**Important exact obstruction scoped to this free model:** positivity and nonzero \(S_0\) force \(D_E(Q^2)\sim S_0/Q^2\). Thus a four-dimensional loop integral \(\int d^4Q\,D_E(Q^2)\) is quadratically UV divergent. The finite *internal graph-energy* moment previously proved does **not** by itself remove ordinary QFT loop divergences, and the field is not an ultraviolet-complete interacting theory of gravity.

## 6. The static spacetime signature

With a chosen linear source interaction \(gJ\Phi\), scalar exchange between stationary point sources gives

\[
V(r)=-\frac{g^2}{4\pi r}\sum_{n\ge0}W_n\,e^{-m_nr}.
\]

The pattern of Yukawa thresholds and relative residues is fixed independently of the unknown overall coupling \(g\). As \(r\to0\), the positive sum tends to \(S_0>0\), so \(V(r)\sim-g^2S_0/(4\pi r)\): the potential retains a \(1/r\) singularity. It does not establish sub-Planck gravitational regularity. The code numerically verifies the short-distance limit and calculates \(D_E\) and \(V(r)\) at representative dimensionless distances.

## 7. Connection to curved spacetime and gravity (conditional)

On a prescribed Lorentzian metric \(g_{\mu\nu}\), a *minimally coupled matter* action can be written:

\[
S_{\rm KG}[g,\{\phi\}]=-	frac12\sum_{n,b,a}\int d^4x\sqrt{-g}
\left(g^{\mu\nu}\nabla_\mu\phi_{n,b,a}\nabla_\nu\phi_{n,b,a}
+m_n^2\phi_{n,b,a}^2\right)
\]

(using signature \(-+++\) in this paragraph). Its Euler–Lagrange equations are \((\Box_g-m_n^2)\phi=0\) and the classical on-shell stress tensor obeys \(\nabla^\mu T_{\mu\nu}=0\). One may add the Einstein–Hilbert term \((16\pi G)^{-1}\int R\sqrt{-g}\) to obtain a diffeomorphism-invariant classical matter–gravity model, but this **inserts** Newton's constant and the metric dynamics; they have not been derived from the five-cube operator. The infinitely many canonical species also raise nontrivial vacuum-energy and quantum-gravity renormalization issues.

A mathematically cleaner statement is the *free Minkowski scalar field* construction in sections 1–5, which needs no gravitational assumptions. The scalar tower does not, by representation dimension alone, produce helicity-two gravitons, general relativity, or a well-defined physical localization process at energies above the Planck mass.

## 8. Physical falsification gate

The constructed generalized free field has a **definite conditional signature**: invariant pole masses in a geometric progression with ratio \(\varphi^2\), with spectral residues proportional to the exact \(W_n\). To confront experiment, one must independently derive *which gauge-invariant physical observable* couples to \(\Phi\), its absolute mass anchor \(m_0\), and source normalization \(g\); then test a previously un-used mass/residue ratio. With no such identification, the spectrum is a mathematically valid possibility and **not a prediction of observed particles or spacetime**.

The Planck-scale challenge remains the operational meaning of the high-mass modes once self-gravity is included. Free Lorentz-invariant heavy scalar excitations are not a proof that a laboratory can resolve \(r<\ell_P\). A quantitative black-hole/localization calculation requires a coupled quantum-gravitational framework beyond this free model.

## Reproducibility

- Standalone script: `newton_platonic_spacetime_bridge.py` (Python/NumPy); evaluates all exact level-weight identities, propagator scaling functional equation, asymptotics, and reflected-time positivity.
- Numerical certificate: `Newton_Platonic_Spacetime_Bridge_2026-10-14.json`.
- Exact independent rational starting point: `newton-scale/UV_FINITE_19_MODE_THEOREM_EXACT.py`.

References for the established QFT ingredients:
- Southampton Advanced Quantum Field Theory lecture notes, section 7: https://www.personal.soton.ac.uk/ab1u06/teaching/qft/qft3/lecture_notes/qft3.pdf
- Hossenfelder, *Minimal Length Scale Scenarios for Quantum Gravity*, 2013: https://link.springer.com/article/10.12942/lrr-2013-2
- Jorgensen & Tian, *Reflection positivity and spectral theory*, 2017: https://arxiv.org/abs/1705.05262
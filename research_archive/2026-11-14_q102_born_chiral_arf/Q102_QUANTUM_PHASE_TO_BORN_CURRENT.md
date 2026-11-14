# Q102 — Derive real chiral motion from the golden phase without inserting a Markov affinity

**Date 2026-11-14. THEOREM for a specified moving Peierls quantum dynamics; still a CONDITIONAL physical completion.** Zero observed-value inputs and zero historical four-ARF coefficients.

## Actual input, not frozen URT

This work extends Q101's **revised** moving-frustration system, derived after the recovered 11 November instruction that the actual asymmetry/mismatch is more important than an old static/history-selection law. Q101 reconstructs all five Platonic cochains (190), the exact full-five 50→8→12 source portal, the native 20-face hidden P3/P5/W, original H64 embedded source, the 60 Ising minima with φ-weighted 13th contact, two 30-state moving A5 ground orbits, and exact source-current sign B on their minimal transitions. It establishes each B is 30×30 integer skew, with 60 directed +1 and 60 directed −1 links and 2+ / 2− from every vertex. The original Q101 phase is α=ε/24 with ε=π/(3φ¹²). Q101 had two *independent* completions: Hermitian unit Peierls hopping and a real Markov tilt with affinity α. The latter assumed conversion of an imaginary phase to a real log-odds and was not selected by primitive URT.

**Q102 eliminates the added log-odds postulate**: retain just Q101's single **declared** local Peierls hopping

\[
H_\alpha=A\cos\alpha+iB\sin\alpha,\qquad H_\alpha^\dagger=H_\alpha
\]

and evolve unitarily. At any dimensionless proper model step τ the direct Born transitions are

\[
T_{ij}(\tau,\alpha)=|\langle i|e^{-i\tau H_\alpha}|j\rangle|^2.
\]

Because U is unitary, **T is positive and doubly stochastic** automatically. This is not the prior artificial \((A+\tanh\alpha B)/4\); no logarithmic real bias is inserted. Measuring the current sign in repeated steps requires a *declared measurement/unravelling interpretation*. The dimensionless τ and physical time map are not selected by this theorem.

## Exact native path-count theorem

The 30-state moving network is a rectified icosahedron; every edge belongs to precisely one oriented triangle. With its native B and a positive edge \(B_{ij}=1\), write \(z=e^{i\alpha}\). Direct enumeration on **all 120 oriented edges** gives the same path Laurent coefficients for \(H_\alpha^n\) (for B=-1 replace z by z⁻¹):

\[
(H_\alpha)_{ij}=z,\quad
(H_\alpha^2)_{ij}=z^{-2},\quad
(H_\alpha^3)_{ij}=7z,\quad
(H_\alpha^4)_{ij}=12z^{-2}+z^{-4}+3z^4.
\]

From \(U_{ij}(\tau)=\sum_{n\ge1}(-i\tau)^n(H_\alpha^n)_{ij}/n!\), and complex conjugation \(z\mapsto z^{-1}\), the positive-edge Born probability is **exact through fifth order**:

\[
T_+(\tau)=\tau^2-\sin(3\alpha)\tau^3-\frac{25}{12}\tau^4+
  \frac{23\sin(3\alpha)+\sin(5\alpha)}{12}\tau^5+O(\tau^6).
\]

For a negative edge, the even terms agree and odd terms reverse. The \(\sin(3\alpha)\) term is interference between a one-edge and two-edge path around a triangle; \(\sin(5\alpha)\) appears at fifth order through the rectified-icosahedral pentagonal/longer-path structure. These terms are calculated from exact whole-five hidden source signs, not selected from a historical ARF list.

The stationary-uniform oriented edge current per quantum-measurement step,

\[
J(\tau,\alpha)=\frac1{30}\sum_{ij}B_{ij}T_{ij}(\tau,\alpha)
=2(T_+-T_-),
\]

obeys the **new master response**

\[
\boxed{J(\tau,\alpha)=-4\sin(3\alpha)\tau^3+
\frac{23\sin(3\alpha)+\sin(5\alpha)}3\,\tau^5+O(\tau^7).}
\]

The remainder is odd order \(O(\tau^7)\) because \(T(-\tau,\alpha)=T(\tau,\alpha)^T\). Exact third derivative \(J'''(0,\alpha)=-24\sin(3\alpha)\). With the frozen *candidate* winding **only for the current calculation**, \(\alpha=\pi/(72\varphi^{12})\), the expected 24-step signed flow of consecutive measurements in the uniform stationary state is

\[
\boxed{24J=-96\sin(\varepsilon/8)\tau^3+
8[23\sin(\varepsilon/8)+\sin(5\varepsilon/24)]\tau^5+O(\tau^7).}
\]

At golden α and τ=0.03, local direct 30×30 matrix exponential yields \(J=-4.382350942834801\times10^{-8}\); fifth-order analytic expression is \(-4.3823443766129535\times10^{-8}\). Numerical residual ≤ \(20\tau^7\) across α=0.3, 0.1, ε/24 and τ=0.01, 0.03, 0.05. This numerical bound is a **regression tolerance**, not an independently proved global analytic remainder constant.

The positive law has **actual chiral probability flow**: \(J\not=0\) for nonzero small α and τ even though there is no added real directional-affinity coupling. It vanishes for α=0. Reversing the chosen geometric orientation flips the current relative to fixed external axes; the primitive model still has no proved orientation-selection mechanism, so this does **not** derive physical baryogenesis.

## Independent spectral cross-check, and what is not claimed

For the *distinct* real-tilt matrix \(\widetilde H_u=A+uB\), Q101's magnetic characteristic factors analytically continue to

\[
\det(\lambda I-\widetilde H_u)=(\lambda-4)(\lambda^2-2\lambda-4)^3
(\lambda^2-1+5u^2)^4
[\lambda^3+2\lambda^2+(8u^2-4)\lambda-8(1+u^2)]^5.
\]

This was checked independently by exact 30×30 rational arithmetic at u=1/7 and 2/5. The cubic discriminant is \(-64u^2(32u^4+11u^2+96)\), so it has a nonreal conjugate eigenpair whenever u≠0. This is **not** an identification of real tilt with the quantum Peierls law or a physical propagation speed; it is an audit of their distinct but algebraically related spectra.

**Conclusions:** The extra Q101 phase→real-affinity assumption is *not necessary to generate moving chiral probabilities*. A unitary quantum motion plus the actual geometric triangle/pentagon interference suffices, under the already declared Peierls Hamiltonian and Born measurement. Q102 still does **not** uniquely derive the magnetic hopping, golden reference angle, physical time unit, physical 192-Wilson charged matter operator, 4D Maxwell stiffness, measured matter–antimatter excess, or the old physical ARFs. Calling its internal τ-series a measured alpha/mass law would repeat the earlier error.

## Reproduce / resume

\`\`\`
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python research_archive/2026-11-14_q102_born_chiral_arf/Q102_BORN_CHIRAL_ARF.py
\`\`\`

Executed locally with exact SymPy Laurent/path coefficients for all original native links, exact rational characteristic-polynomial check at two nontrivial real tilts, and three-by-three real-phase/time unitary tests; exit 0. GitHub CI verdict pending.

**RESUME HERE:** The decisive next physical mathematical step is to derive the **local Peierls coupling to the true charged 192-state v61 Wilson current** and its unique normalization from the complete moving π–φ–e positive transfer; then use the positive Born current with both Ward contact orders to identify an actual physical observable. Do not reintroduce a separate real Markov affinity merely to match an old ARF.

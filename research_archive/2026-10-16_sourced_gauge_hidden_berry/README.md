# Newton’s Cathedral — sourced gauge dynamics and quantum-induced Berry curvature
**16 October 2026.** A new, additive physics-motivated mathematical derivation from the original 12/30/20 shell, eight hidden face modes, 12-outcome POVM, and canonical modular master state. **No measured constant, parameter fit, or substituted history operator.**

## Execute the certificates

- [Exact full hidden algebra, Lie closure and non-Abelian Berry curvature](hidden_berry_exact.py): NumPy and SymPy. Proves 63-rank commutant over rationals using a full-rank mod-1009 witness; associative word-span dimensions 1 → 12 → 62 → 64 by degree 0–3, and real compact Lie closure 12 → 39 → 63 → 64 by nested commutator depth 1–4. Proves exact rational curvature strengths and BKM coefficient. Writes **no** files.
- [Sourced finite Maxwell equations, hidden quartet currents and continuum transverse symbol](sourced_maxwell_exact.py): NumPy. Verifies discrete gauge symmetry, source continuity, Gauss, two hidden eigenfrequencies, static sourced solution, exact finite Coulomb resistances, and the icosahedral physical-vector \(k^2I-kk^\top\) symbol. Writes **no** files.
- [Independent positive-density Umegaki entropy check](berry_bkm_positive_state_test.py): NumPy and SciPy. Verifies the actual modular BKM cost of Berry curvature by full \(8\times8\) unitary conjugation, no invalid Gaussian bath. Writes **no** files.
- [Prior finite-state Hodge and off-quartet chirality](../2026-10-15_icosahedral_125_DEC_H64/README.md); [hidden-to-vertex POVM and exact projector polynomials](../2026-10-16_hidden_visible_povm/README.md).

Run from this directory:

    python -m pip install numpy scipy sympy
    python hidden_berry_exact.py
    python sourced_maxwell_exact.py
    python berry_bkm_positive_state_test.py

Each can also be executed independently. Local reference calculations completed on 16 October, including exact rational rank checks, numerical source conservation, exact positivity, holonomy and covariance. All three scripts are included in the same repo folder and linked in the root README.

## Main result 1 — actual sourced gauge equations on the icosahedron

With actual 30×12 \(d_0\) and 20×30 \(d_1\), \(d_1d_0=0\), choose an edge 1-form \(A\), vertex scalar \(\varphi\), electric field \(E=-\dot A-d_0\varphi\), magnetic face flux \(B=d_1A\), and sources \(j,\rho\). The unit-cochain action
\[
L=\tfrac12\|E\|^2-\tfrac12\|B\|^2+j^\top A+\rho^\top\varphi
\]
has an exact gauge Ward identity if and only if \(\dot\rho+d_0^\top j=0\). Its equations are \(\dot E=d_1^\top B-j\), \(\dot B=-d_1E\), \(d_0^\top E=\rho\), with exact field energy exchange \(\dot H=-E^\top j\).

The actual hidden-quartet edge currents are **conserved**: \(j=K_3u+K_5v\), \(d_0^\top j=0\). Their static Maxwell coexact response is **exactly** \(A=K_3u/3+K_5v/5\). This gives hidden-sector resonant frequencies \(\sqrt3,\sqrt5\) and equal-input static energy ratio \(5/3\), not arbitrary fit values. The finite shell has **no harmonic edge modes** and all physical coexact modes have nonzero finite eigenvalues; the gauge null directions must not be mistaken for empirically massless photons.

Its closed-shell static electrostatic responses, in unit-edge metric, are exact effective resistances \(11/30\) adjacent (30 pairs), \(7/15\) distance-two (30 pairs), and \(1/2\) antipodal (6 pairs). This is a well-defined sourced physical **network model**, not an SI-calibrated Coulomb/Newton force.

## Main result 2 — derived continuum Maxwell transverse symbol

Using the *actual* 12 unit icosahedral directions \(u_a\), with \(\sum_a u_au_a^\top=4I_3\), embed a continuum vector field \(A_3\) as directional amplitudes \(A_a=u_a\cdot A_3\). Its exterior-square directional curl is \(F_{ab}(k)=i[(u_a\cdot k)(u_b\cdot A_3)-(u_b\cdot k)(u_a\cdot A_3)]\). Thus

\[
\boxed{\frac1{16}\sum_{a<b}|F_{ab}(k)|^2
=|k|^2|A_3|^2-|k\cdot A_3|^2.}
\]

The normalized continuum principal operator \(k^2I_3-kk^\top\) has eigenvalues \((0,k^2,k^2)\). At finite shifts, commuting translations give exact Abelian gauge invariance on the **full 12-direction link carrier**, but the restriction to a 3D physical vector subspace is gauge invariant **in the continuum limit**, not exactly at finite shift. The 1/16 relative coefficient comes from \(\sum u_au_a^\top=4I\), but absolute coupling and local clock are separate physical tasks.

## Main result 3 — hidden-to-vertex effects generate the full quantum matrix and Lie algebras

For \(H=[H_3,H_5]\subset\mathbb R^{20\times8}\), let
\[
E_i=\frac13H^\dagger\operatorname{diag}(C_{:i})H,\quad \sum_iE_i=I_8.
\]

Construct rational hidden eigenspace bases by solving the exact face Laplacian at eigenvalues 3 and 5. The 768×64 rational equations \([X,E_i]=0\) have **rank 63**, demonstrated over the prime field \(\mathbb F_{1009}\) and bounded above by the exact identity kernel. Associative POVM words have ranks \(\mathbf{1,12,62,64}\) through lengths 0,1,2,3; the real anti-Hermitian bracket Lie closure has ranks \(\mathbf{12,39,63,64}\) through depths 1,2,3,4. Hence **exactly**:

\[
\boxed{\operatorname{Alg}_{\mathbb C}(E_1,\ldots,E_{12})=M_8(\mathbb C),\quad
\operatorname{Lie}_{\mathbb R}\langle iE_1,\ldots,iE_{12}\rangle=\mathfrak u(8).}
\]

This proves the earlier 25% representation-dimension argument cannot establish a permanently inaccessible dark sector. A single 12-outcome POVM is not informationally complete, but its **noncommutative products** generate all hidden operators. It does not specify a measurement instrument or imply 64 elementary gauge bosons.

## Main result 4 — non-Abelian Berry curvature from commuting face-phase changes

Choose the geometrically defined ambient vertex-phase family
\[
H(\theta)=\exp\left(i\sum_i\theta_i D_i\right)H,\qquad D_i=\operatorname{diag}(C_{:i}).
\]
Even though every \(D_i\) commutes, the projected hidden Berry connection and curvature obey
\[
\mathcal A_i=H(\theta)^\dagger\partial_iH(\theta)=3iE_i,\qquad
\boxed{\mathcal F_{ij}=-9[E_i,E_j].}
\]

Exact rational squared Hilbert–Schmidt strengths:
- 30 adjacent pairs: \(2288/50625\) each;
- 30 distance-two pairs: \(3968/50625\) each;
- 6 antipodal pairs: \(16/135\) each.

Consequently \(\sum_{i<j}\|\mathcal F_{ij}\|_F^2=14912/3375\). A positive-unitary holonomy check converged to this curvature under shrinking loops, and the curvature transforms covariantly under hidden-frame changes. This is a genuine Wilczek–Zee/Berry *geometric* connection on the explicit chosen family of hidden subspaces, rather than previously inserted arbitrary Wilson links. It is **not yet** the proven physically dynamical Yang–Mills connection.

## Main result 5 — the BKM energy of that curvature is fixed by rho-star

In the \(4_3\oplus4_5\) decomposition, the off-quartet curvature has exact strength

\[
\boxed{\sum_{i<j}\|\mathcal F_{ij}^{(35)}\|_F^2=\frac45.}
\]

Let \(a=[4(1+\Delta^2)]^{-1}\), \(b=\Delta^2a\), \(\eta_\Delta=-\ln\Delta\). For \(U_{ij}(s)=e^{s\mathcal F_{ij}}\), the sum of **genuine Umegaki relative entropies on positive density matrices** has quadratic response

\[
\sum_{i<j}D(U_{ij}(s)\rho_\star U_{ij}(s)^\dagger\|\rho_\star)
=\boxed{s^2\,\frac45\chi_{35}(a-b)^2+O(s^3)}
=\boxed{s^2\,\frac{2\eta_\Delta}{5}\tanh\eta_\Delta+O(s^3)}.
\]

The coefficient \(2.3982894745923344\) is **derived from the existing face incidence, hidden quartet projectors and BKM state, without fitted terms**. Direct unitary-orbit numerical tests converge to it. This is a *geometric curvature-to-quantum-information response mechanism*; no physical \(g_{\mathrm{YM}}\), dynamical stress tensor or measured gauge boson mass is asserted.

## Physical progression and consistency

The new exact chain is
\[
\text{20-face incidence}\to\text{hidden quartets}\to
\text{12 vertex POVM}\to\mathfrak u(8)
\to\text{non-Abelian Berry curvature}\to
\text{positive-state BKM relative entropy}.
\]

Independently, the same 12-30-20 coboundary complex now has a **sourced**, gauge-invariant finite Maxwell model and a wave/curl continuum principal-symbol calculation. Connecting these two chains to canonical URT-selected history and proving the **physical kinetic/source coupling** is the next concrete microscopic operation, not a license to fit constants.

Earlier October 15/16, v115-v129 mass/flavour, original URT, 125-simplex and Planck work remain preserved and untouched.

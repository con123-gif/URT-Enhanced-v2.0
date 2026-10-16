# Unified Cathedral Mechanics — Center-4, Solenoidal Quartets, and Gauge-Orbit Response

**16 October 2026 — integrated research edition.** Preserve original URT history selection, all prior 13/125/64-cell, H64 flavour and signed-chirality results. This document tests and repairs the proposed three theorems; an exact finite identity must not be presented as a derived physical mass or coupling.

## I. The exact augmented 64-state DEC theorem

The genuine icosahedral shell has \(V=12,E=30,F=20\) and bounds one cellular 3-ball. The coarse **augmented** chain has grades of dimension \(1+12+30+20+1=64\). The initial 1 is a formal augmentation, **not** a physical central 0-cell. The complete centred tetrahedral complex instead has \(13+42+50+20=125\) simplices, plus augmentation.

Let \(d_{-1},d_0,d_1,d_2\) be oriented coboundaries of sizes \(12\times1,30\times12,20\times30,1\times20\). The exact relations are
\[
d_0d_{-1}=d_1d_0=d_2d_1=0,\qquad
(\mathrm{rank}\,d_{-1},\mathrm{rank}\,d_0,\mathrm{rank}\,d_1,\mathrm{rank}\,d_2)=(1,11,19,1).
\]
The augmented cochain complex is acyclic; its symmetric Hodge–Dirac \(D_{64}=d+d^\dagger\) has zero kernel.

**Full exact integer characteristic polynomial:**
\[
\boxed{\begin{aligned}
\det(xI-D_{64})={}&(x^2-12)(x^2-20)
(x^4-10x^2+20)^3\\
&\times(x^4-6x^2+4)^3
(x^2-6)^5(x^2-2)^5
(x^2-3)^4(x^2-5)^4 .
\end{aligned}}
\]
The complete 64×64 integer-matrix polynomial was checked with SymPy exact equality, as well as an independent floating-point spectrum check (maximum eigenvalue difference \(3.77\times10^{-15}\)). This strengthens the previously recorded eigenvalue list in the Oct 15 operator audit; it does **not** prove a massless gauge/gravity particle. In fact, the defined finite \(D_{64}\) has NO exact zero modes, while the separately archived massless intercell scale-chain does.

For the 30 edges,
\[
\Delta_1=d_0d_0^\top+d_1^\top d_1,\qquad
\mathbb R^{30}=\operatorname{im}d_0\oplus\operatorname{im}d_1^\top,\quad
\dim=11+19 .
\]
Exactly \(\mathrm{Tr}(d_0d_0^\top)=60=\mathrm{Tr}(d_1^\top d_1)\), so \(\mathrm{Tr}\Delta_1=120\). The trace equality follows from 30 edge endpoints and 20 faces with 3 boundary edges each; it is not a thermodynamic equipartition theorem.

For the hidden face projectors \(P_{4_3},P_{4_5}\) (face Laplacian eigenvalues 3,5), define
\[
K_3=d_1^\top P_{4_3}/\sqrt3,\quad
K_5=d_1^\top P_{4_5}/\sqrt5.
\]
Then \(K_a^\top K_b=\delta_{ab}P_{4_a}\), \(\Delta_1K_a=aK_a\), \(d_0^\top K_a=0\), and \(C^\top P_{4_a}=0\). These are **solenoidal, coexact** edge currents. They are NOT curl-free: \(\|d_1K_3\|_F=\sqrt{12}\), \(\|d_1K_5\|_F=\sqrt{20}\). Persistent vortex circulation would require a dynamical conservation law, not just zero vertex divergence.

## II. Exact all-sector intertwiners and Center-4 spectrum

With \(C^\top C=15I-2L_{\rm ico}\), each nonuniform vertex sector \(s=3,5,3'\) has a canonical isometry
\[
J_s=\frac{CP_s}{\sqrt{15-2\lambda_V^{(s)}}},
\quad J_s^\top J_s=P_s,\quad
L_{\rm face}J_s=\lambda_F^{(s)}J_s .
\]

| Irrep | Vertex eigenvalue | Face eigenvalue | Damping mean | Half-gap |
|---|---:|---:|---:|---:|
| \(3\) | \(5-\sqrt5\) | \(3-\sqrt5\) | \(4-\sqrt5\) | 1 |
| \(5\) | 6 | 2 | 4 | 2 |
| \(3'\) | \(5+\sqrt5\) | \(3+\sqrt5\) | \(4+\sqrt5\) | 1 |
| hidden \(4_5/4_3\) | 5/3 (edge) | — | 4 | 1 |

The triplet mean values are symmetric about 4; the fiveplet and hidden pair are centered exactly at 4. The weighted mean of ALL 30 edge Hodge eigenvalues is 4. Both relations hold, but **not every individual sector is centered at 4**. Exact arithmetic gives \((4-\sqrt5)(4+\sqrt5)=11\).

If, as an extra DYNAMICAL MODEL CHOICE, one introduces
\[
G_s=\begin{pmatrix}
-\Gamma\lambda_V^{(s)}&-\omega\\
\omega&-\Gamma\lambda_F^{(s)}
\end{pmatrix},
\quad
\lambda_\pm=-\Gamma\bar\lambda_s
\pm\sqrt{\Gamma^2(\delta\lambda_s)^2-\omega^2},
\]
then the \(\Gamma<\omega<2\Gamma\) interval has oscillatory triplet and nonoscillatory fiveplet dynamics. This is an exact threshold for this model, not a derived field equation. The triplet is STILL damped at rate \((4-\sqrt5)\Gamma\); it does not propagate freely in space simply because the local eigenvalues are complex. The physical \(\Gamma,\omega\), spacetime dispersion, heat reservoir and energy conversion remain to be obtained from the original URT-selected transfer.

## III. What the U(8) stabilizer and BKM really prove

For \(\rho_\star=aI_4\oplus bI_4\), with \(a=[4(1+\Delta^2)]^{-1}\) and \(b=\Delta^2a\), the real Hermitian generator space is \(64=32_{\rm diag}+32_{\rm off}\). A block-diagonal Hermitian generator commutes with \(\rho_\star\) and generates **zero unitary-orbit STATE CHANGE**. This gives an exact \(U(4)\times U(4)\) stabilizer of this density matrix, not 32 physical massless Yang–Mills fields.

Requiring the generator to also commute with the \(A_5\) action on irreducible complex quartet blocks restricts each unitary block to a phase by Schur's lemma; the \(A_5\)-equivariant continuous subgroup at distinct density eigenvalues is \(U(1)\times U(1)\), not automatically the full local Standard Model group.

For \(G_{\rm off}=\begin{psmallmatrix}0&Z\\Z^\dagger&0\end{psmallmatrix}\),
\[
\|i[G_{\rm off},\rho_\star]\|_F^2=2(a-b)^2\|Z\|_F^2 .
\]
The density-coordinate BKM stiffness is \(\chi_{35}=(\ln a-\ln b)/(a-b)\). The GENERATOR-orbit stiffness contains a distinct canonical Jacobian factor,
\[
\boxed{\chi_{35}(a-b)^2=\tfrac12\eta_\Delta\tanh\eta_\Delta
\approx2.997861843.}
\]
Neither number alone is a gauge-boson mass or Newton constant.

### A constructive non-Abelian Yang–Mills-compatible step

Choose group-valued links \(U_{ij}\) on oriented edges and local transformations \(g_i\). Then
\[
U_{ij}\mapsto g_iU_{ij}g_j^{-1},\qquad
W_{ijk}=U_{ij}U_{jk}U_{ki}
\mapsto g_iW_{ijk}g_i^{-1}.
\]
The Wilson trace is EXACTLY gauge invariant; a nontrivial \(U(4)\times U(4)\) random link test verified the conjugation law to \(7.6\times10^{-16}\). This is a valid conditional lattice-gauge *construction*, not a deduction of a unique gauge group/coupling from \(D_{64}\).

The proposed action containing \(1/(4g_0^2)\) is not parameter-free until \(g_0\) is derived. In addition, a 20×20 face projector \(P_{4_a}\) cannot be multiplied directly into an individual 4×4 internal curvature \(F_f\). To project between faces one needs both face indices and a common gauge basepoint/parallel transport, or one must use the standard gauge-invariant Wilson-plaquette action. The abelian Bianchi identity of the augmented 3-cell is \(d_2 d_1=0\), not the ill-typed \(d_0F=0\).

## Conservation and physical closure

**Verified finite operators:** full 64 spectral polynomial, exact 11+19 Hodge split and 60+60 trace, solenoidal quartet embeddings, three normalized intertwiners, Center-4 pairing, the \(32+32\) density-generator decomposition, and gauge covariance of the specified Wilson links.

**Not yet derived from the same URT/Cathedral engine:** unique local gauge action with physical \(g_0\), conserved matter-source currents and gauge representations, Einstein coframe constraints and massless spin-2 field, \(G_N\), physical dissipation clock, and universal dark matter. These omissions are physical-source tasks, NOT blanket mathematical no-gos against the larger programme.

**Execute:** the adjacent [center4_unified_audit.py](../2026-10-16_center4_synthesis/center4_unified_audit.py) reuses the already-committed canonical October 15 geometry. Run with the --exact flag for full symbolic 64×64 characteristic polynomial equality. It does not overwrite any committed results.

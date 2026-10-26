# Whole Cathedral finite-geometry / history bridge (26 October 2026)

**Scope:** Exact finite-combinatorial synthesis of all five Platonic surface complexes with the previously verified five-cube hidden-state instrument and the canonical six-axis signed-history carrier. **Not** a complete physical field action, and not a derivation of the canonical source-loaded microscopic \(T_\star\).

## 1. All five solids in one Hodge chain

For (tetrahedron, cube, octahedron, dodecahedron, icosahedron), \((V,E,F)\) are
\((4,6,4),(8,12,6),(6,12,8),(20,30,12),(12,30,20)\).
The block-sum cellular chain has \(\dim C_0=50\), \(\dim C_1=90\), \(\dim C_2=50\), with oriented integer boundaries
\(\partial_1:C_1\to C_0\), \(\partial_2:C_2\to C_1\), and \(\partial_1\partial_2=0\).

Define the single symmetric 190-dimensional Hodge–Dirac operator

\[
\mathscr D_P=
\begin{pmatrix}
0&\partial_1&0\\
\partial_1^T&0&\partial_2\\
0&\partial_2^T&0
\end{pmatrix}.
\]

All five complexes are 2-spheres, so \(\operatorname{rank}\partial_1=50-5=45\) and \(\operatorname{rank}\partial_2=50-5=45\). Hence
\[
\operatorname{rank}\mathscr D_P=180,\quad \dim\ker\mathscr D_P=10
\]
(the ten zero modes represent five \(H^0\) and five \(H^2\) generators).

Each edge occurs twice in the vertex-edge boundary and twice among the face-edge boundaries:
\[
\|\partial_1\|_F^2=180,\quad
\|\partial_2\|_F^2=180,\quad
\operatorname{Tr}(\mathscr D_P^2)=720.
\]
Thus \(\|\partial_1\|_F^2+\|\partial_2\|_F^2=360\). This is an **independent** 360 incidence count; do not identify it with the older dodecahedral \(\operatorname{Tr}[(FF^T)^2]=360\) beyond their explicit definitions. The dodecahedral vertex Laplacian \(L_D\) is a block of \(\mathscr D_P^2\) and obeys \(15\operatorname{Tr}(L_D^+)=137\), exactly. None of these integers alone determines electromagnetic coupling.

**Limitation:** \(\mathscr D_P\) is the direct sum of five surface complexes. Cross-solid dynamical couplings require the separately defined Platonic inclusion and duality morphisms (including tetrahedra inside cubes, five cubes in the dodecahedron, and dual solids); their unique URT weights are not supplied by this Hodge theorem.

## 2. The exact five-cube / dodecahedral / H64 contact

Let \(L_D\) act on the 20 vertices of the dodecahedron. Let \(D\) be 20-by-12 incidence of the icosahedron's 20 triangular faces on its 12 vertices. Set
\[
P_h=I-D(D^T D)^{-1}D^T=P_3+P_5,
\]
where \(L_D P_3=3P_3,\ L_D P_5=5P_5\), and each projector has rank four.

The uniform five-cube mean projector satisfies
\[
\bar P=\tfrac14 P_h+\tfrac25P_{v5},\quad
\rho_{\rm geo}=\bar P/4=P_h/16+P_{v5}/10.
\]
The earlier constructed conditional Kraus outcome
\(F=P_3+\Delta P_5\),
\(\Delta=\frac3{20}-\frac{80\pi}{1053\varphi}\),
gives
\[
\frac{F\rho_{\rm geo}F^\dagger}{\operatorname{Tr}(F\rho_{\rm geo}F^\dagger)}
=\rho_\star
=\frac{P_3+\Delta^2P_5}{4(1+\Delta^2)},\quad
p_{\rm success}=(1+\Delta^2)/4.
\]

Let \(M\) be the 64-by-20 triangle occupancy map for six signed antipodal-axis histories; the distance-eight history Hamiltonian is
\(H_8=15I-\sum_{i<j}X_iX_j\).
The previously recovered exact incidence identities are
\[
M^T M P_h=2P_h,\qquad
H_8MP_h=M(21I-L_D)P_h.
\]
Consequently \(U_h=MP_h/\sqrt2\) is an isometry on the eight hidden modes and embeds them in \(H_{51}\subset H_{64}\). It yields the newly explicit common-state identity
\[
\boxed{
\rho_{64}=U_h\rho_\star U_h^\dagger=
\frac{U_hP_3U_h^\dagger+\Delta^2U_hP_5U_h^\dagger}{4(1+\Delta^2)}
}.
\]
Because \(H_8U_hP_3=18U_hP_3\) and \(H_8U_hP_5=16U_hP_5\), the density commutes **exactly** with unselected history kinetics:
\[
[H_8,\rho_{64}]=0,\quad
\langle H_8\rangle=18-2p_5,\quad
\operatorname{Var}(H_8)=4p_5(1-p_5),
\quad p_5=\frac{\Delta^2}{1+\Delta^2}.
\]

On the rank-eight support, with \(\eta_\Delta=-\ln\Delta\), the modular Hamiltonian is an **affine function of history kinetic energy**:
\[
\boxed{
-\log \rho_{64}
=\log\bigl[4(1+\Delta^2)\bigr]I_8
+\eta_\Delta(18I_8-H_8|_{U_h}).
}
\]
This follows from the 18/16 split, without tuning. Interpreted thermally **with \(H_8\) itself as energy**, its inverse temperature would be negative (\(\beta=\ln\Delta\)); relative to the positive defect operator \(18I-H_8\), it is \(+\eta_\Delta\). No physical temperature or law is thereby established.

**Why this matters:** five-cube geometric preparation, dodecahedral hidden modes, the previously frozen entropy rail and the signed-history H64 construction give the **same eight-dimensional density state**, with preserved nonzero spectrum and BKM response under the isometric embedding. The Hodge operator also contains the dodecahedral 137 invariant, but this is not yet the measured inverse fine-structure constant.

## 3. Still independent of, not replaced by, this result

The primitive URT \(\pi/\mathrm e\) spiral and golden phase, \(D_6\to H_3\), the higher-dimensional/coframe extensions, the Newton Scale refinement law, source-loaded \(T_\star=B_\star^\dagger B_\star\), gauge current vertices, matter pole prescription, gravity area normalization and cosmology **remain distinct live parts of the Cathedral**. The identity above does not prove that the original URT selected transfer physically realizes \(F\).

The decisive unresolved **mathematical interface** is whether the pre-existing source-loaded \(T_\star\), after a source-preserving reduction through \(U_h\) and the quadratic hidden-to-shell map, has the same projectors and weights \(P_3+\Delta^2P_5\). Without it, no zero-parameter physical action or Standard Model replacement is established.

## Independent reproducibility

Verified on the five standard combinatorial polyhedral graphs with oriented boundary matrices, then on the group-free combinatorial construction of all 64 signed-axis histories and occupancy \(M\). Numerical residuals for the history isometry/intertwiner and conditional state were below \(10^{-13}\); the rank/trace identities are fixed by integer incidence and sphere homology. Dodecahedral \(15\operatorname{Tr}(L_D^+)=137\) was also checked with an exact rational 20-by-20 inverse.

# Cathedral all-five-Platonic + H64 interacting field model (2026-10-28)

**Scope:** Constructive field-action *candidate*, not a derivation of the physical source-loaded \(T_\star\), Einstein–Yang–Mills dynamics or a nonperturbative quantum continuum. This builds directly on the canonical all-five-solid cellular complex and the previously established dodecahedral hidden-to-H64 isometry. No observed masses, couplings or fitted constants enter.

## 1. The existing geometric inputs

Use all five oriented Platonic surface complexes, with cellular boundary operators \(d_1:C_1\to C_0\) and \(d_2:C_2\to C_1\), satisfying \(d_1d_2=0\). Their block sum has \((\dim C_0,\dim C_1,\dim C_2)=(50,90,50)\). Its Hodge–Dirac has rank 180 and \(\mathrm{Tr}\,D_P^2=720\).

For the icosahedron/dodecahedron dual pair, let \(C:\mathbb R^{12}\to\mathbb R^{20}\) be face-vertex incidence. Let \(P_h=1-C(C^TC)^{-1}C^T=P_3+P_5\) be the eight-dimensional hidden projector with \(L_{\rm dod}P_3=3P_3\), \(L_{\rm dod}P_5=5P_5\), both rank four. Using 64 six-axis signed histories, the occupancy matrix \(M\) and history kinetic \(H_8=15I-\sum_{i<j}X_iX_j\) satisfy the *pre-existing exact identities*
\[
M^TMP_h=2P_h,\quad H_8MP_h=M(21-L_{\rm dod})P_h.
\]
Thus \(U_h=MP_h/\sqrt2\) is a partial isometry with \(H_8U_hP_3=18U_hP_3\), \(H_8U_hP_5=16U_hP_5\). Preserve the frozen rail \(\Delta=3/20-80\pi/(1053\varphi)\).

## 2. A concrete coupled action (new mathematical premise)

Take real fields \(\phi\in C_0\simeq\mathbb R^{50}\), \(a\in C_1\simeq\mathbb R^{90}\), \(b\in C_2\simeq\mathbb R^{50}\), and \(y\in H_{64}\simeq\mathbb R^{64}\). Let \(x\) be the icosahedral component of \(\phi\); write \(z=Cx\), \(h_3=P_3(z\odot z)\), \(h_5=P_5(z\odot z)\).

Define the **explicit chosen**, dimensionless potential
\[
\begin{aligned}
V=&\frac12(\|d_1^T\phi\|^2+\|d_2^Ta\|^2+\|d_2b\|^2+y^TH_8y)\\
&+\frac14(\|h_3\|^2+\Delta^2\|h_5\|^2)-y^TU_h(h_3+\Delta h_5).
\end{aligned}
\]
The coefficient-one geometric/history contact and canonical kinetic normalization are **action premises**; zero observational fitting is not proof that they are forced by URT. This is one explicit constructive interacting model, not the previously frozen canonical microscopic \(T_\star\).

The edge-field potential is invariant under \(a\mapsto a+d_1^T\epsilon\) because \(d_2^Td_1^T=0\). This is an **internal cochain gauge redundancy**, not yet physical spacetime Yang–Mills gauge invariance.

Euler–Lagrange potential gradients are
\[
\begin{aligned}
\nabla_\phi V&=d_1d_1^T\phi+
\iota_{\rm ico}C^T\{z\odot[h_3+\Delta^2h_5-2(P_3+\Delta P_5)U_h^Ty]\},\\
\nabla_aV&=d_2d_2^Ta,\qquad \nabla_bV=d_2^Td_2b,\\
\nabla_yV&=H_8y-U_h(h_3+\Delta h_5).
\end{aligned}
\]
Here \(\iota_{\rm ico}\) injects into the corresponding 12 coordinates in \(C_0\).

## 3. Exact history elimination and positivity

The source has zero projection onto \(\ker H_8\), so, modulo the two zero modes,
\[
y_{\rm opt}=U_h(h_3/18+\Delta h_5/16).
\]
Substitution yields, **exactly**,
\[
V_{\rm eff}=\frac12(\|d_1^T\phi\|^2+\|d_2^Ta\|^2+\|d_2b\|^2)
+\frac29\|h_3\|^2+\frac7{32}\Delta^2\|h_5\|^2.
\]
Both quartic coefficients are positive. Thus \(V\) is nonnegative after completing the history square; the scalar-history mixing is cubic, and the hidden interactions are quartic.

The 254 real configuration coordinates contain 10 harmonic cochain directions, 45 exact edge gauge directions and two history zero modes. On their quotient there are 197 nonredundant real coordinates; the quadratic form is strictly positive.

## 4. Explicit formal 4D interacting field extension

**Assume** an external Euclidean base \(x\in\mathbb R^4\). Promote the 197 quotient coordinates to fields and define
\[
S_E=\int_{\mathbb R^4}\left[\frac12\left(|\partial\phi|^2+|\partial a|^2+
|\partial b|^2+|\partial y|^2\right)+V(\phi,a,b,y)\right]d^4x.
\]
All kinetic norms are taken on the above gauge/zero-mode quotient. This is a local, Euclidean-rotation-invariant, non-Gaussian scalar-multiplet action with exact cubic \(y\phi\phi\) and quartic \(\phi^4\) vertices. It is a **formal 4D field theory**, not yet a nonperturbatively constructed interacting quantum field theory and not a derivation of Lorentzian spacetime.

Integrating out the Gaussian history field in Fourier space gives the exact *Euclidean* quartic form factors
\[
c_3(p^2)=\frac14-\frac1{2(p^2+18)},\qquad
c_5(p^2)=\Delta^2\left(\frac14-\frac1{2(p^2+16)}\right),
\]
with \(c_3(0)=2/9,\;c_5(0)=7\Delta^2/32\). They are strictly positive for \(p^2\ge0\); all factors come from the frozen gap and history eigenvalues after accepting the explicitly stated action normalization. The quadratic Hessian on the quotient has eigenvalues \(\lambda>0\), the smallest being \(3-\sqrt5=0.7639320225\ldots\) in **dimensionless model units**; this is not a physical Yang–Mills mass gap.

## 5. Executed validation

An independently generated full 11KB Python verifier, \`cathedral_multiplatonic_field_2026_10_28.py\`, was run in the 2026-10-28 conversation. Results: \(d_1d_2=0\) exactly, Hodge rank 180, \(\operatorname{Tr}D_P^2=720\), hidden-to-history isometry residual \(1.15\times10^{-15}\), kinetic intertwiner residual \(1.58\times10^{-14}\), edge-gauge energy difference exactly 0, directional derivative error \(8.89\times10^{-9}\), and static Schur-complement energy residual \(5.68\times10^{-14}\). Positive quartic and nonzero cubic witnesses were obtained. Code and JSON are available as conversation artifacts, not automatically included in this GitHub commit.

**Proven within the chosen action:** finite positive nonlinear coupled system; internal gauge redundancy; explicit 197-coordinate quotient; exact 16/18-pole history response and induced momentum-dependent quartic kernel.

**Not proven:** that this new action is selected by original URT \(T_\star=B_\star^\dagger B_\star\); full D6/H3, Golay/Leech, hypercube and coframe dynamics as interacting spacetime fields; physical non-Abelian gauge group, quantum continuum existence, gravity, particle pole identifications, dimensional scales, or empirical parameters. Preserve the broader Cathedral architecture and do not replace the microscopic source-loaded machine with this constructive example.

Sources used: \`docs/WHOLE_CATHEDRAL_FINITE_GEOMETRY_HISTORY_BRIDGE_2026-10-26.md\`, \`docs/CATHEDRAL_UNIFIED_FINITE_DYNAMICS_2026-10-25.md\`, \`docs/PLATONIC_A4_NONLINEAR_EMERGENCE_2026-10-14.md\`.

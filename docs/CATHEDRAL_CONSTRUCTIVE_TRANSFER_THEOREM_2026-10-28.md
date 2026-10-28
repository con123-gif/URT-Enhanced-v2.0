# Cathedral constructive lattice-field transfer theorem — 28 October 2026

**Classification:** New rigorous theorem conditional on the explicitly chosen all-five-Platonic/H64 field action in \`docs/CATHEDRAL_MULTIPLATONIC_INTERACTING_FIELD_ACTION_2026-10-28.md\`. It is **not** an unconditional theorem about the physical universe, a Clay Yang–Mills proof, or a continuum result. All frozen URT rails are unchanged; there is no observational fitting. This document does not replace or reduce the full Cathedral mathematical architecture.

## Geometric input retained from prior work

The five oriented Platonic cellular complexes together give \(C_0=\mathbb R^{50}\), \(C_1=\mathbb R^{90}\), \(C_2=\mathbb R^{50}\), \(\partial_1\partial_2=0\), Hodge–Dirac rank 180. In their icosahedron/dodecahedron dual contact, \(\dim H_{\mathrm{hidden}}=8\) with projectors \(P_3,P_5\) of rank four. The **existing** exact history isometry \(U_h:\operatorname{ran}(P_3+P_5)\to H_{64}\) has
\[
U_h^\dagger U_h=P_3+P_5,\qquad H_8U_hP_3=18U_hP_3,\qquad H_8U_hP_5=16U_hP_5.
\]
The frozen \(\Delta=3/20-80\pi/(1053\varphi)\) is not altered.

Take a vertex field \(\phi\in C_0\), edge field \(a\in C_1\), face field \(b\in C_2\), history field \(y\in H_{64}\). Let \(x\) be the 12-dimensional icosahedral vertex component of \(\phi\) and let \(C:\mathbb R^{12}\to\mathbb R^{20}\) be unsigned face incidence. Set
\(h_3=P_3[(Cx)\odot(Cx)]\), \(h_5=P_5[(Cx)\odot(Cx)]\).
The **chosen** local potential is
\[
\begin{split}
V={}&\tfrac12(\|\partial_1^T\phi\|^2+\|\partial_2^Ta\|^2+\|\partial_2b\|^2+y^TH_8y)\\
&+\tfrac14(\|h_3\|^2+\Delta^2\|h_5\|^2)-y^TU_h(h_3+\Delta h_5).
\end{split}
\]
This is an explicit action premise, not the uniquely derived canonical source-loaded \(T_\star\).

Remove the ten \(H^0/H^2\) harmonic zero modes, the 45 edge-exact directions, and the two history kernel directions, always working on the **orthogonal quotient**. There are \(50+90+50+64-10-45-2=197\) real coordinates \(q\).

## Exact completion of the square

Set
\[
y_*(\phi)=U_h(h_3/18+\Delta h_5/16).
\]
Then the previous action obeys the **exact identity**
\[
\boxed{
V=\tfrac12 Q_{\rm geom}
+\tfrac12\langle y-y_*,H_8(y-y_*)\rangle
+\tfrac29\|h_3\|^2+\tfrac7{32}\Delta^2\|h_5\|^2.
}
\]
Every term is nonnegative. On the orthogonal quotient \(Q_{\rm geom}\geq(3-\sqrt5)\|(\phi,a,b)\|^2\), and \(H_8\geq10\) on \((\ker H_8)^\perp\). Since
\[
\|y_*\|^2=\|h_3\|^2/324+\Delta^2\|h_5\|^2/256,
\]
the final two terms bound \(56\|y_*\|^2\). Using \(\|y\|^2\le2\|y-y_*\|^2+2\|y_*\|^2\),
\[
\boxed{V(q)\geq\tfrac12(3-\sqrt5)\|q\|^2.}
\]
In particular the potential is coercive on all 197 physical finite coordinates, and \(\exp(-aV)\) is integrable for every \(a>0\).

The harmonic-zero-mode quotient is legitimate because translating \(\phi\) by a constant on the icosahedron shifts \(Cx\) by a constant and changes \((Cx)^2\) only by constants and terms in \(\mathrm{im}C\), which are annihilated by \(P_h\); the face harmonic modes do not enter the face kinetic form.

## The theorem: genuine interacting finite-volume quantum field model

Let \(\Lambda\subset\mathbb Z^3\) be any finite spatial box, and let \(q=(q_s)_{s\in\Lambda}\in\mathbb R^{197|\Lambda|}\). Define the nonnegative spatial-slice energy
\[
W_\Lambda(q)=\sum_{s\in\Lambda}V(q_s)
+\tfrac12\sum_{\langle s,t\rangle\subset\Lambda}\|q_s-q_t\|^2.
\]
For a specified Euclidean time lattice step \(a>0\), define the integral operator
\[
K_{a,\Lambda}(q,q')
=e^{-aW_\Lambda(q)/2}\exp[-\|q-q'\|^2/(2a)]e^{-aW_\Lambda(q')/2}.
\]

**Theorem.** On \(L^2(\mathbb R^{197|\Lambda|},dq)\):
1. \(K_{a,\Lambda}\) is positive, self-adjoint and trace class.
2. Its integral kernel is strictly positive, so the maximal eigenvalue \(\lambda_0>0\) is simple and strictly dominates all remaining eigenvalues.
3. The finite-volume Hamiltonian \(H_{a,\Lambda}=-a^{-1}\log(K_{a,\Lambda}/\lambda_0)\) has unique zero-energy vacuum and **strictly positive first excitation gap**, \(E_1-E_0=a^{-1}\log(\lambda_0/\lambda_1)>0\) with \(\lambda_1>0\).
4. The finite-time Euclidean lattice measure from products of the transfer kernel has reflection positivity with respect to reflection about a time-link or site (using the standard transfer construction).
5. Its finite-lattice Gibbs measure is genuinely non-Gaussian: the action has nonzero cubic \(-yU_hh(\phi)\) and quartic \(h(\phi)^2\) derivatives.

**Proof.** Put \(w(q)=e^{-aW_\Lambda(q)/2}\in L^2\) by the above coercive bound. The Gaussian convolution \(G(q-q')=e^{-\|q-q'\|^2/(2a)}\) has a *strictly positive* Fourier multiplier, so \(K=M_wGM_w\) is positive definite. Write \(K=A^*A\), \(A=G^{1/2}M_w\); \(A\) is Hilbert–Schmidt because \(w\in L^2\) and the square of the Fourier multiplier of \(G^{1/2}\) is integrable. Therefore \(K\) is trace class. Its integral kernel is strictly positive everywhere, making it positivity improving. The Jentzsch/Perron–Frobenius theorem for compact positive integral operators gives a simple strictly dominant top eigenvalue. Infinite-rank strict positive definiteness gives \(\lambda_1>0\). Reflection positivity follows by cutting the lattice along the reflection plane and writing \(\langle\Theta F\,F\rangle\) as a positive quadratic form in the transfer \(K\); other half-lattice factors are paired with their reflected adjoints. Finally, a nonzero third or fourth functional derivative of \(\log\) Gibbs weight is incompatible with a Gaussian measure. QED.

**Exact distinction:** this establishes a finite spatial-volume, finite-spacing *interacting lattice field model* for arbitrarily many lattice sites. A gap uniform in both spatial volume and cutoff is **not** established; hence neither infinite-volume interacting relativistic QFT nor physical Yang–Mills mass gap is proved.

## Independent numerical interacting slice (executed)

Using the full combinatorial matrices, restrict \(\phi=t(e_0-e_1)/\sqrt2\) on two icosahedral vertices, \(a=b=0\), \(y=s\,y_*(\phi/t)/\|y_*(\phi/t)\|\). The exact restriction is
\[
V(t,s)=\tfrac{k}{2}t^2+\tfrac{\mu}{2}s^2+c t^4-d\,s t^2
\]
with:
- \(k=6\),
- \(\mu=17.999994772082925\),
- \(c=0.10000020653553533\),
- \(d=0.6324561749510428\),
- \(c-d^2/(2\mu)=0.0888890696074823>0\).

So the mixed third derivative is \(-2d=-1.2649123499020856\ne0\), and the fourth derivative of the log Gibbs weight in \(t\) is \(-24c=-2.400004956852848\ne0\).

Independent 17x17 Simpson quadrature (289 nodes) of the two-field transfer kernel at \(a=1\) gives \(\lambda_0=0.49886571665016544\), \(\lambda_1=0.06226473118094904\), \(E_1-E_0=2.0809418018010213\). The last is **only a numerical gap for the restricted 2D quadrature**, not the full 197-field gap. The full transfer theorem is analytic and does not depend on these approximate numbers.

## What is proven and what is not

**Proven conditional on this specified model:** explicit all-five-Platonic Hodge+H64 incidence interaction, strict coercivity, a positive trace-class transfer on every finite spatial lattice, a unique transfer vacuum, finite-volume positive spectral gap, reflection positivity, and non-Gaussian interactions. These are mathematical theorems rather than observed physical predictions.

**Not established by these proofs:** microscopic derivation of this specific action from the frozen species-loaded URT \(T_\star\); physical selection of time spacing and 3D spatial embeddings; relativistic continuum and gauge/fermion completion; uniform infinite-volume mass gap; identification of physical masses, gravitational scale, or Standard Model couplings; equality to nature. D6→H3, four-sheet gauge/geometry calculus, Golay/Leech, higher-dimensional and Newton-scale branches remain live parts of the Cathedral and must not be presented as fully included in this dynamical action.

Reproduction artifacts for the present conversation:
- \`cathedral_multiplatonic_field_2026_10_28.py\`, \`cathedral_multiplatonic_field_2026_10_28_results.json\`
- \`cathedral_transfer_theorem_2026_10_28.py\`, \`cathedral_transfer_theorem_2026_10_28_results.json\`.

Previous canonical provenance:
- \`docs/WHOLE_CATHEDRAL_FINITE_GEOMETRY_HISTORY_BRIDGE_2026-10-26.md\`
- \`docs/CATHEDRAL_UNIFIED_FINITE_DYNAMICS_2026-10-25.md\`
- \`docs/PLATONIC_A4_NONLINEAR_EMERGENCE_2026-10-14.md\`


## Exact two-field slice (no floating-point input)

For the fixed normalized difference of two adjacent icosahedral vertex indicators \(v=(e_0-e_1)/\sqrt2\), the pre-existing rational incidence projectors yield
\[
\|d_1^Tv\|^2=6,\qquad \|P_3(Cv)^2\|^2=\frac25,\qquad \|P_5(Cv)^2\|^2=\frac2{15}.
\]
Writing \(q_*=U_h(h_3/18+\Delta h_5/16)\) and \(u=q_*/\|q_*\|\), restrict \(y=s\,u\), \(\phi=t\,v\), \(a=b=0\). The exact two-field potential is
\[
V(t,s)=3t^2+\tfrac12\mu s^2
+\left(\tfrac1{10}+\tfrac{\Delta^2}{30}\right)t^4
-d\,st^2,
\]
where
\[
A=\|q_*\|^2=\frac1{810}+\frac{\Delta^2}{1920},\qquad
\mu=\frac{\frac1{45}+\frac{\Delta^2}{120}}{A},\qquad
d=\frac{\frac1{45}+\frac{\Delta^2}{120}}{\sqrt A}.
\]
Eliminating \(s\) yields the **exact** non-Gaussian one-field potential
\[
\boxed{V_{\rm reduced}(t)=3t^2+
\left(\frac4{45}+\frac7{240}\Delta^2\right)t^4.}
\]
Its strictly positive quartic coefficient is derived from the selected contact and pre-existing history spectrum, with no measured input. This is an exact interacting subtheory, not a demonstration of continuum renormalization or physical particle scattering.

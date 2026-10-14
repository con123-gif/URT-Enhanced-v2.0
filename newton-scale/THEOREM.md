# Newton Scale — an independent theorem in Platonic spectral geometry

**Standalone mathematical research note · 14 October 2026**

**Scope.** This construction uses only the five Platonic vertex-edge graphs, their ordinary combinatorial Laplacians, and the five cubes inscribed in the dodecahedron. It does **not** assume Universal Resonance Theory (URT), Newton's Cathedral, entropy rails, a quantum transfer matrix, gravity, Planck length, or measurements. Those can be studied separately as possible applications.

## Definition: Newton spectral factor

For any positive eigenvalue \(\lambda\) of a graph Laplacian \(L\), define its *formal spectral length* \(\ell(\lambda;a)=a/\sqrt\lambda\) relative to a common arbitrary length unit \(a>0\). Ratios of these formal lengths are independent of \(a\). This is a definition of spectral length, **not** a derivation of physical metre distances.

Let \(L_D=3I-A_D\) and \(L_I=5I-A_I\) be the combinatorial Laplacians of the regular dodecahedral and icosahedral vertex-edge graphs.

### Theorem 1. Dual Platonic spectral-square relation

The Laplacian characteristic polynomials are

\[
\begin{aligned}
\det(xI-L_D)&=x(x-2)^5(x-3)^4(x-5)^4(x^2-6x+4)^3,\\
\det(xI-L_I)&=x(x-6)^5(x^2-10x+20)^3.
\end{aligned}
\]

Therefore both graphs have conjugate triplet eigenvalues: \(3\pm\sqrt5\) for the dodecahedron and \(5\pm\sqrt5\) for the icosahedron. The ratios of the corresponding short to long formal spectral lengths are

\[
\mathcal N_D=\sqrt{\frac{3-\sqrt5}{3+\sqrt5}}=\frac{3-\sqrt5}{2}=\varphi^{-2},
\]

\[
\mathcal N_I=\sqrt{\frac{5-\sqrt5}{5+\sqrt5}}=\frac{\sqrt5-1}{2}=\varphi^{-1}.
\]

**Exact duality:**

\[
\boxed{\mathcal N_D=\mathcal N_I^2.}
\]

We propose to call \(\mathcal N\equiv\mathcal N_D\) the **Newton Scale factor**, and the equality above the **Newton–Platonic spectral-square relation**.

*Proof.* Both characteristic polynomials follow by constructing the finite adjacency matrices from the combinatorial vertex-edge relationships. Extracting the two quadratic factors gives the two paired eigenvalues. For \(\varphi=(1+\sqrt5)/2\), substitution and rationalization show the stated ratios identically, including \(\mathcal N_D=\mathcal N_I^2\). The accompanying executable certificate checks all five Platonic spectra in symbolic arithmetic. \(\square\)

### Theorem 2. Five-cube permutation exchanges the dodecahedral triplets

Let \(D\) be the exact \(20\times20\) permutation induced by doubling the five inscribed-cube labels, \(j\mapsto 2j\bmod5\). For the explicit combinatorial labeling in the source certificate, \(D^4=I\) and

\[
\boxed{D L_D D^T=L_D-\tfrac12L_D(L_D-2I)(L_D-3I)(L_D-5I).}
\]

The polynomial on the right vanishes on the eigenspaces of eigenvalues \(0,2,3,5\), while on the pair \(3\pm\sqrt5\) it exchanges their values. Consequently \(D\) swaps the two rank-three spectral projectors. This is an exact **combinatorial spectral duality**, not an ordinary rigid rotation of the dodecahedron and not a uniform scaling of all twenty graph modes.

*Proof.* Form the integer adjacency matrix and the vertex permutation from the five cube supports. Their exact matrix multiplication establishes the polynomial identity. Since the characteristic polynomial has the stated factorization, the right-hand polynomial acts as zero on the other sectors and as the eigenvalue exchange on the triplets. The exact rank-three projector identities are checked in the certificate. \(\square\)

### Theorem 3. A compatible infinite mathematical hierarchy can be constructed

Take the five vertices \(v_0,\ldots,v_4\) of the standard regular four-simplex in \(\mathbb R^4\). **Define** the similarities

\[
F_j(y)=\mathcal N y+(1-\mathcal N)v_j, \qquad j=0,\dots,4.
\]

Because \(0<\mathcal N<1/2\), the images of the simplex are disjoint. By standard iterated-function-system results, there is a unique compact attractor \(\mathscr F=\bigcup_jF_j(\mathscr F)\), with

\[
\dim_H(\mathscr F)=\frac{\log5}{-\log\mathcal N}=\frac{\log5}{2\log\varphi}\approx1.6722759382.
\]

This proves the **existence** of one exact infinite fractal using the Newton factor. The affine similarity maps are an additional definition: the finite dodecahedral permutation \(D\), which satisfies \(D^4=I\), does not itself generate endless shrinking. Many other recursive systems may be possible. \(\square\)

## Relationship to Newton's Cathedral and to physical models

The standalone theorem is independent. The optional *Cathedral application* is to ask whether its selected history/transfer operator dynamically realizes the same spectral pairing and Newton factor. That question does not alter the mathematical proof.

The words **"below the Planck length"** require an operational physical metric and a tested ultraviolet theory. An abstract hierarchy \(\ell_n=\ell_0\mathcal N^n\) contains arbitrarily small mathematical lengths, but does not prove that a physical particle, signal, measurement, or curvature response can access them. Nothing here fixes \(\ell_0\) in metres.

## Originality and prior-art boundary

The five inscribed cubes, the spectra of the dodecahedral/icosahedral graphs, the golden ratio, and the general theory of iterated function systems are established mathematics. The proposed independent research contribution is the **particular five-cube triplet-exchange operator identity and its use to define a dual spectral-scale law**, subject to a thorough literature review and independent proof checking. A new name does not make pre-existing underlying facts novel by itself.

Starting references:
- Wolfram MathWorld, *Dodecahedral Graph*: https://mathworld.wolfram.com/DodecahedralGraph.html
- Wolfram MathWorld, *Icosahedral Graph*: https://mathworld.wolfram.com/IcosahedralGraph.html
- University of Wisconsin, *Symmetry Groups of the Platonic Solids*, five inscribed cubes: https://people.math.wisc.edu/~sgurevich/RT-P1-Solutions.pdf
- Research on golden-fractal Laplacians (2025): https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5709164

## Reproduce independently

Run `python Newton_Scale_Independent_Platonic_Proof.py` with Python and SymPy. The script independently builds all five Platonic graph matrices, verifies the exact characteristic polynomials, constructs the explicit 20-vertex doubling permutation, checks the polynomial-conjugacy identity and projector exchange, and writes a JSON certificate. It imports **no Cathedral files**.
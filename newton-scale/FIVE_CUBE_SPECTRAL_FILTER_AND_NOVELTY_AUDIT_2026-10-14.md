# Newton–Platonic geometry: exact five-cube spectral-filter theorem and originality audit

**Date:** 14 October 2026  
**Research status:** exact, standalone finite-graph theorem and independently specified infinite Euclidean construction. The particular spectral-filter identity is a **candidate original result**, not certified historically novel. No physical sub-Planck law has been proved.

## Abstract

Let G be the ordinary 20-vertex dodecahedral graph with Laplacian L=3I−A. The dodecahedron contains five inscribed cubes. For each cube j, let C_j be its 8×6 unsigned vertex–face incidence matrix. Embed the orthogonal projector onto ker(C_j^T) in the common 20-vertex space as P_j. Each P_j has rank four. We prove via exact rational matrix calculations that their mean is a degree-five polynomial in the dodecahedral Laplacian:

\[
\boxed{\frac15\sum_{j=1}^5 P_j=-\frac1{60}L(L^2-7L+13I)(L^2-6L+4I).}
\]

The mean projector has spectrum 0 (seven times), 1/4 (eight times), 2/5 (five times), and distinct cube projectors have trace overlap 5/8. The five-cube doubling permutation preserves the mean but changes L by a rank-six operator with squared Frobenius norm 120; it exchanges the two conjugate 3D Laplacian eigenspaces with eigenvalues 3±√5. The resulting positive spectral-length ratio is (3−√5)/2 = φ⁻². Independent pentagram nesting yields the same contraction and an infinite Euclidean sequence. The geometry alone cannot establish physically measurable sub-Planck spacetime, because it contains no operational metric calibration, dynamics or quantum-gravitational observable.

## 1. Definitions

Let V be the 20 vertices of the regular dodecahedron. A is its ordinary undirected, unweighted vertex adjacency. L=3I−A. For each of its five inscribed cubes, C_j∈{0,1}^{8×6} has C_{vf}=1 when cube vertex v lies on cube face f, and zero otherwise. The cube projector in the 8D cube subspace is

\[
\Pi_j=N_j(N_j^TN_j)^{-1}N_j^T,
\]

where columns of N_j are any rational basis for ker(C_j^T). Extend it to the 20 vertices by zero outside the cube, obtaining P_j. Thus P_j is independent of the chosen basis N_j. Define \(\bar P=\frac15\sum_jP_j\).

## 2. Five-cube spectral-filter theorem

**Theorem.** The following identities hold as exact rational equalities:

\[
\begin{aligned}
P_j^2&=P_j=P_j^T, & \operatorname{Tr}P_j&=4,\\
\operatorname{Tr}(P_iP_j)&=5/8\quad (i\ne j),\\
\bar P&=-\tfrac1{60}L(L^2-7L+13I)(L^2-6L+4I),\\
\bar P\left(\bar P-\tfrac14I\right)\left(\bar P-\tfrac25I\right)&=0,\\
\operatorname{spec}(\bar P)&=\{0^{(7)},(1/4)^{(8)},(2/5)^{(5)}\}.
\end{aligned}
\]

**Proof.** Enumerate the 20-vertex adjacency and each cube's six 4-vertex faces, provided in `newton_five_cube_exact_operator.py`. Each corresponding integer C_j has a four-dimensional rational kernel. Construct its orthogonal rational projector by the displayed formula. Exact products show idempotence and pairwise overlap. Direct polynomial evaluation in the 20×20 integer matrix L reproduces the sum of these five rational projectors entry-by-entry, establishing the main identity without any floating-point tolerance. The characteristic polynomial of L is

\[
\det(xI-L)=x(x-2)^5(x-3)^4(x-5)^4(x^2-6x+4)^3.
\]

Substitute its six distinct eigenvalues into the proven polynomial. At 0 and 3±√5 the result is zero; at 3 and 5 it is 1/4; and at 2 it is 2/5. The multiplicities give the stated spectrum and cubic minimal-polynomial identity. All computations are finite exact rational arithmetic and are independently rerunnable. □

This is **stronger than** restating the well-known characteristic polynomial or golden ratio: it directly connects vertex–face nullspace projectors of five different embedded cubes to a polynomial in the ambient dodecahedral graph Laplacian.

## 3. Doubling defect and simultaneous graph decomposition

Let D be the 20×20 permutation induced on cube labels by j↦2j (mod 5), with vertex map explicitly in the executable. Let L_c = 16I−MM^T, where M_{vj}=1 when vertex v belongs to cube j. The incidence relations are

\[
M^TM=6I_5+2J_5,\quad AM=2(J_{20,5}-M),\quad [L,L_c]=0.
\]

The cube-overlap graph associated with L_c is **weighted**: antipodal edges have weight two. An earlier description of it as a *simple* graph is incorrect and is superseded here.

The exact identities are

\[
\begin{aligned}
D\bar P D^T&=\bar P,\\
DLD^T-L&=-\tfrac12L(L-2I)(L-3I)(L-5I),\\
\operatorname{rank}(DLD^T-L)&=6,\\
\|DLD^T-L\|_F^2&=120.
\end{aligned}
\]

The nonzero defect has three singular values 2√5 in each of the exchanged triplets; the other 14 eigenchannels are untouched. The joint graph Laplacian L+L_c has exact characteristic polynomial

\[
\boxed{x(x-15)^4(x-18)^5(x-19)^4(x^2-38x+356)^3.}
\]

The doubling map is a combinatorial automorphism of the five-cube system, not a similarity contraction of the whole dodecahedral graph: D^4=I. These additional identities are independently verified by rational arithmetic.

## 4. Newton spectral factor and infinite geometry

The exchanged triplet eigenvalues of L are λ±=3±√5. Hence the ratio of the two **defined spectral lengths** a/√λ± is

\[
\boxed{\mathcal N=\sqrt{\frac{3-\sqrt5}{3+\sqrt5}}=\frac{3-\sqrt5}{2}=\varphi^{-2}.}
\]

Separately, joining successive crossing points of the diagonals of any regular pentagon produces a smaller regular pentagon of radius ratio N. Thus the deterministic pentagram construction satisfies R_n=R_0 N^n and is less than any positive threshold for all sufficiently large n. With R_0=1 metre, refinement n=84 falls below the numerical Planck-length reference ≈1.616255×10^−35 metre; this is a theorem of classical Euclidean similarity, not an empirical claim about localization of matter.

## 5. Exact limit on what first-principles geometry implies

All graph-theoretic quantities in Sections 1–3, including N, are invariant under the rescaling a↦ta for any t>0. Consequently they cannot independently determine a unique SI length from dimensionless combinatorial data. Moreover, one can realize the same abstract Euclidean nested pentagons as ideal mathematical objects within models that either permit or do not permit their physical measurement below a specified length. Therefore the mathematics alone does not logically imply a physical sub-Planck observable. This **conditional scale-calibration limit** is not a no-go for future physical dynamics or a revised quantum-gravity construction.

## 6. Dated prior-art assessment

| Element | Literature status | Claim that can be made |
|---|---|---|
| Pentagram φ⁻² infinite nesting | Explicitly published by M. Kondratieva (2011), see Figure 5 exercises 3–4 | Classical, not new |
| Five inscribed cubes in a dodecahedron | Classical polyhedral compound (E. Hess, 1876); documented in many sources | Classical, not new |
| Five size-eight maximum independent sets of the dodecahedral graph | Explicitly stated in *Graphs with the Erdős–Ko–Rado property* (2005), Example 3.1 | Previously published, not new |
| Dodecahedral and icosahedral graph spectra | Published standard results, including MathWorld and earlier spectral-graph texts | Previously known |
| Polynomial connecting the average of five rank-four cube **face-incidence kernel projectors** to L | No matching formula located in searches performed on 14 October 2026 | Candidate new explicit result; priority **not certified** |
| Rank-six nongeometric doubling defect and new weighted joint-graph spectrum | Exact independently verified formula; no matching expression located in targeted searches | Candidate new combination; priority **not certified** |
| Physical law of sub-Planck resolution | No derived Lorentzian localization or measurement dictionary | Not proved |

Literature sources for priority review:
- Kondratieva, *Geometry as a Key Component in the Education of a Skillful Designer* (2011): https://www.math.mun.ca/~mkondra/papers/design.pdf
- *Graphs with the Erdős–Ko–Rado property*, Discrete Mathematics (2005), doi:10.1016/j.disc.2004.08.028.
- Wolfram MathWorld, *Dodecahedral Graph*: https://mathworld.wolfram.com/DodecahedralGraph.html
- Neil Strickland, *Cubes inscribed in a dodecahedron*: https://neilstrickland.github.io/groups_and_symmetry/demos/inscribed_cubes.html
- Godsil, *Association Schemes* (2010): https://www.math.uwaterloo.ca/~cgodsil/pdfs/assoc2.pdf

**Priority cannot be proved from a finite database search**: a theorem may have appeared in a different notation, an unindexed preprint, book, thesis or earlier result. A new result should be stated exactly, compared with prior art, peer-reviewed and revised if an equivalent theorem is found.

## 7. Reproducibility and definitive status

Run `python newton_five_cube_exact_operator.py` with SymPy. This reconstructs all five cube face-incidence projectors **from integer face lists**, evaluates every equality by exact rational arithmetic and prints the full characteristic polynomials. It imports no URT/Cathedral files and fits nothing.

**Mathematical verdict:** exact potentially publishable *five-cube projector-filter theorem* and exact accompanying finite-rank conjugacy identities. **Novelty verdict:** unlocated in the checked sources, not established as historically first. **Physics verdict:** geometrically unbounded, physical sub-Planck law unproved. These three statuses must not be conflated.
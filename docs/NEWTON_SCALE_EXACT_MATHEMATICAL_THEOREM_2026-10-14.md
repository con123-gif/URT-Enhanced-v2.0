# Newton Scale — exact mathematical theorem and limits of the claim

**Date:** 14 October 2026. **Status:** exact computer-assisted finite-graph theorem; mathematically constructive infinite hierarchy; no claim of experimental sub-Planck observability. **Proposed name:** Newton Scale, in honour of Isaac Newton.

## Theorem A — exact dodecahedral spectral conjugacy

Let \(A\) be the adjacency matrix of the usual 20-vertex dodecahedron graph (all vertices have degree 3) and let \(L=3I_{20}-A\). Label the five inscribed cubes \(0,\dots,4\), with the vertex supports stated in the independent exact certificate `newton_scale_exact_theorem_2026_10_14.py`. The 20-site permutation \(D\) that implements cube-label doubling \(j\mapsto 2j\pmod 5\) has exact identities

\[
D^4=I,\qquad D^TD=I,\qquad
DLD^T=L-\frac12 L(L-2I)(L-3I)(L-5I).
\tag{1}
\]

Its full characteristic polynomial is

\[
\det(xI-L)=x(x-2)^5(x-3)^4(x-5)^4(x^2-6x+4)^3.
\tag{2}
\]

**Proof.** The graph, the five cube supports and the permutation have explicit **integer** entries in the appended Python/SymPy certificate. The script forms the 20-by-20 matrices using integer arithmetic and verifies (1), (2), orthogonality, order four, and the five cube-support images by exact symbolic equality—not floating-point approximations. This is a finite exact-arithmetic certificate, and it can also be checked by hand matrix multiplication. ◻︎

**Consequence.** Apart from the eigenvalues \(0,2,3,5\), the Laplacian has two triplets

\[
\lambda_-=3-\sqrt 5,\qquad\lambda_+=3+\sqrt5.
\]

Define \(Q(L)=L(L-2I)(L-3I)(L-5I)\). Because
\(Q(\lambda_-)=-4\sqrt5\) and \(Q(\lambda_+)=4\sqrt5\), the polynomial on the right side of (1) fixes all other eigenspaces and swaps \(\lambda_-\leftrightarrow\lambda_+\). The exact rank-three spectral projectors can be written

\[
P_-=\tfrac1{40}Q(L)(L-\lambda_+I),\qquad
P_+=\tfrac1{40}Q(L)(L-\lambda_-I),
\]

and the exact certificate verifies \(DP_-D^T=P_+\) and \(DP_+D^T=P_-\). Thus the exchange is an algebraic theorem, not an inference from approximate eigenvalues. ◻︎

## Theorem B — exact intrinsic Newton ratio

For a positive graph Laplacian mode \(\lambda\), define its *characteristic spectral length* \(\ell_{\rm spec}(\lambda)=a/\sqrt\lambda\), where \(a>0\) is an arbitrary common edge-length unit. Then the exchange above determines a unique positive spectral-length ratio:

\[
\boxed{\mathcal N=\frac{\ell_{\rm spec}(\lambda_+)}{\ell_{\rm spec}(\lambda_-)}
=\sqrt{\frac{3-\sqrt5}{3+\sqrt5}}
=\frac{3-\sqrt5}{2}=\varphi^{-2}=0.381966011250105\ldots.}
\tag{3}
\]

**Proof.** The arbitrary \(a\) cancels. The ratio under the square root is \((3-\sqrt5)^2/4\) because \((3-\sqrt5)(3+\sqrt5)=4\), and \(\varphi^{-2}=(3-\sqrt5)/2\). All quantities are positive, so there is no ambiguous square-root sign. ◻︎

Equation (3) is unconditional **for the defined spectral-length observable** on the specified graph. To identify it as a ratio of physically realized lengths *at consecutive levels* is the separate dynamical condition that the two exchanged triplets describe the same excitation with second-order scaling. Neither graph theory nor (3) alone imposes that physical condition.

## Theorem C — a mathematically infinite Newton fractal exists

Let \(v_0,\dots,v_4\) be the vertices of a regular 4-simplex with
\(v_i\cdot v_i=1\) and \(v_i\cdot v_j=-1/4\) for \(i\ne j\). Given **the now-derived number** \(s=\mathcal N\), define affine similarities

\[
F_j(z)=s z+(1-s)v_j,\qquad j=0,\ldots,4.
\tag{4}
\]

The maps have a unique nonempty compact limit set \(\mathscr F\) satisfying \(\mathscr F=\bigcup_j F_j(\mathscr F)\). They have pairwise disjoint images of the simplex, because \(0<s<1/2\): in the \(j\)-th image, barycentric coordinate \(j\) is at least \(1-s>1/2\), whereas in another image that coordinate is at most \(s<1/2\). By the standard self-similar open-set-condition dimension theorem,

\[
\boxed{\dim_H \mathscr F=\frac{\ln5}{-\ln s}=\frac{\ln5}{2\ln\varphi}
\approx 1.67227593818455.}
\tag{5}
\]

This is an *existence theorem* for a self-similar mathematical structure with arbitrarily fine levels. It does **not** prove that the physical Cathedral dynamics chooses (4). The similarity maps are an additional mathematical construction, even though their ratio is supplied by Theorem B. For a classical statement of the dimension theorem, see J. E. Hutchinson, *Fractals and self similarity*, Indiana University Mathematics Journal 30 (1981), 713–747.

## Theorem D — canonical five-branch history probabilities

The five simplex rays define rank-one projectors \(Q_j=v_jv_j^T\) on the four-dimensional simplex hyperplane. Their tight-frame identity is

\[
\sum_{j=0}^4 Q_j=\frac54 I_4.
\]

Hence \(M_j=\sqrt{4/5}\,Q_j\) is a positive normalized quantum instrument: \(\sum_j M_j^\dagger M_j=I_4\). After each measurement the selected branch is the ray \(v_j\), and its exact Markov probabilities are

\[
\boxed{\Pr(j\mid i)=\begin{cases}4/5&j=i,\\1/20&j\ne i.\end{cases}}
\]

The transition spectrum is \(1\) and \(3/4\) (fourfold). Therefore the geometric seed supports a consistent infinite symbolic history measure without any fitted stochastic weights. Mapping these symbolic labels onto the spatial similarities (4) is again a modelling identification, not a consequence of the finite measurement algebra alone.

## Fundamental boundary of the theorem

**Finite doubling is not itself an infinite magnification.** Since \(D^4=I\), a claim of global Laplacian covariance \(DLD^T=cL\) would force \(c=1\) (take traces, \(\operatorname{tr}L=60\)). The verified conjugation (1) is an *exchange of two triplets*, not uniform scaling of all 20 sectors. The infinite tower in Theorem C is a new, separately defined recursion.

Neither exact finite result fixes an absolute length \(\ell_0\) in metres. For any \(c>0\), multiplying every assigned physical edge length by \(c\) leaves the dimensionless graph and (3) unchanged. Hence **no absolute SI calibration** can be obtained from these dimensionless graph identities alone. Also not proven: the canonical species-loaded \(H_{64}\) transfer implements (4) at every scale; Lorentzian causal locality; observables and gravitational dynamics; or physical access to sub-Planck distances.

**Conclusion:** The *relative Newton spectral factor* \(\mathcal N=\varphi^{-2}\), the exact doubled-triplet symmetry and the existence of a compatible infinite self-similar structure now have mathematical proofs. The **universal physical Newton scaling law** remains a hypothesis requiring the fully selected URT/Cathedral transfer to derive the inter-level identification.

**Reproduce from scratch:** `python newton_scale_exact_theorem_2026_10_14.py`. It needs SymPy only and imports no saved operator matrices.
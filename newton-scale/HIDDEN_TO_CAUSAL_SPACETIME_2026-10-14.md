# Newton–Platonic hidden information to causal, approximately Lorentzian waves
**14 October 2026 — independent calculation based on the recovered five-cube quadratic shell response**

## Result and scope
This calculation establishes (1) three-dimensional Euclidean spatial isotropy through fourth order from the hidden-generated icosahedral response; (2) a reversible, energy-conserving, graph-causal **finite-step** wave dynamics; and (3) a positive, bounded, multiscale nonlocal wave operator with Newton refinement and a low-momentum Lorentzian wave **principal symbol**. Its first angular anisotropy is at sixth order, where the icosahedral geometry predicts a coefficient ratio. These results are mathematically consistent **for the specified dynamics**. They do not uniquely derive time, physical distance, general relativity, photons, quantum mechanics, or experimental sub-Planck access. The multiscale contact weights and the dynamical wave law are explicit model choices, not forced by the static incidence matrix.

## 1. Geometry reconstructed from actual hidden-source response
Input is the previously calculated 12×36 hidden-quadratic contact `F` and its 12×12 positive Gram operator `K=F F^T`. `F` was constructed from the 20×12 dodecahedron–icosahedron incidence operator and the 8D hidden kernel, so reconstruction from `K` is a **nontrivial consistency and inversion**, not a creation of spacetime from no geometric input. From the irreducible spectral projectors of `K`, reconstruct the icosahedral adjacency

`A = 5 E_1 - E_5 + sqrt(5)(E_3 - E_3prime)`.

It has entries 0/1, degree five and twelve vertices, with max residual `<4e-11` from the numerical matrix. The larger-triplet projector supplies an orthonormal 12×3 eigenbasis U. Put `u_i=2 U_i`. These are unit icosahedral vectors in R³, unique up to overall O(3) rotation, with

\[
\sum_{i=1}^{12}u_i=0,\qquad \sum_i u_i^a u_i^b=4\delta^{ab},
\]
\[
\sum_i u_i^a u_i^b u_i^c u_i^d=
\frac45(\delta^{ab}\delta^{cd}+\delta^{ac}\delta^{bd}+\delta^{ad}\delta^{bc}).
\]

Odd moments through degree 5 vanish. The fourth-moment numerical residual is `7.43e-11`; second-moment Frobenius residual `2.16e-15`. The familiar exact statement is that icosahedron vertices form a spherical 5-design; our additional test is that the **specific hidden-generated contact operator** indeed reconstructs that frame.

## 2. The hidden-gap orientation transition
For `rho* = a P_4_3 + b P_4_5`, where `a=1/[4(1+Delta²)]` and `b=Delta²/[4(1+Delta²)]`, the visible response bands have eigenvalues

`k1=3(a²+b²)` (multiplicity 1),
`k5=(3/25)a²+b²/3` (multiplicity 5),
`k3=2ab(5+2sqrt(5))/15` (multiplicity 3),
`k3'=2ab(5-2sqrt(5))/15` (multiplicity 3).

At Delta=0 the shell Gram response has rank 6, and its 12 vertices collapse into six indistinguishable antipodal pairs. Its nontrivial centred configuration is a regular five-dimensional simplex of six axes. For any Delta>0 both triplet eigenvalues are positive and the shell response has rank 12. The 3D geometric frame can be isolated from the recovered triplet. The quantitative orientation gap is `K_edge − K_distance2 = 4ab/15 ~ 1.03266488e-7`. This is an **algebraic rank bifurcation** at Delta=0, not an established thermodynamic phase transition, and it is fragile to perturbations exceeding its small spectral/gap scale.

## 3. Local causal time evolution from the 13-cell
Use the existing centred icosahedral graph Laplacian L13 (spectrum 0, 6−sqrt5 x3, 7 x5, 6+sqrt5 x3, 13). Define the distinct evolution/time index t by

\[
\psi_{t+1}-2\psi_t+\psi_{t-1}=-h^2 L_{13}\psi_t.
\]

For any `0<h²*13<4`, each nonzero graph mode is oscillatory and stable. The dimensionless convention h=1/sqrt(13) is chosen from the operator norm, not derived as physical seconds. The exact conserved quadratic energy is

\[
E_t=\frac{\|\psi_{t+1}-\psi_t\|^2}{2h^2}+\frac12\psi_t^T L_{13}\psi_{t+1}.
\]

It is nonnegative, with only the constant static mode null, if h²*13<4. The update has range one in the spatial graph, so an initial localized source cannot reach vertex j in fewer than graph-distance(i,j) time steps. All 13 vertices and the energy identity were checked for 12 time steps. This is exact graph causality but not yet universal relativistic causality.

## 4. Candidate emergent 3+1 wave principle
Once the three-dimensional frame u_i is reconstructed, define the Euclidean positive finite-shift operator at dimensionless length ell>0:

\[
({\cal D}_\ell f)(x)=\frac1{2\ell^2}\left[12f(x)-\sum_{i=1}^{12}f(x+\ell u_i)\right].
\]

Because the u_i occur in antipodal pairs, the operator is self-adjoint and positive in the Fourier representation. Its symbol is

\[
d_\ell(k)=\frac1{2\ell^2}\left[12-\sum_i\cos(\ell u_i\cdot k)\right].
\]

Using the exact second/fourth moments, its low-momentum expansion is

\[
d_\ell(k)=|k|^2-\frac{\ell^2}{20}|k|^4+
\frac{\ell^4}{1440}\sum_i(u_i\cdot k)^6+O(\ell^6|k|^8).
\]

Thus the **leading spatial principal symbol** is the isotropic three-dimensional Laplacian. Choosing stable second-order dynamics `partial_t² f + c² D_ell f=0` gives the low-momentum Lorentzian wave symbol `-omega²+c²|k|²`; the value c and the independent time kinetic term are NOT fixed by the positive static hidden correlation data. The full finite-shift model is NOT exactly Lorentz invariant at high momentum.

The first directional anisotropy is sixth order. For k along one ico vertex, the sixth moment is exactly `52/25=2.08`; along a triangle-face centroid it is `68/45=1.511111...`. The difference is `128/225`, so the sixth-order angular splitting in the symbol is `ell^4 |k|^6 * (4/10125)`. The sphere-averaged lower orders cannot distinguish these directions. This gives a sharp candidate signature of the discrete Platonic spatial frame if a physical interaction actually realizes this operator.

## 5. Independent Newton refinement and bounded high-momentum regime
Bring in the **independent** Newton factor `s=(3−sqrt5)/2=phi^-2` and the previously constructed **conditional** positive all-19-mode filter K_N=P^5+G^3 (no Cathedral/URT coupling fitted), with spectral bands (1/1024 x8, 1/216 x6, 32/3125 x5). Define

\[
W_n=8(1/1024)^n+6(1/216)^n+5(32/3125)^n,
\quad Z=\sum_{n\ge0}W_n=19.08745682585\ldots,
\quad \mu_n=W_n/Z,\quad \ell_n=\ell_0s^n.
\]

This is a **model specification** of the cross-scale field, not a proof the hidden original microscopic selector must use these weights. The normalized multiscale operator is

\[
\mathscr D=\sum_{n\ge0}\mu_n {\cal D}_{\ell_n},
\qquad \sum\mu_n=1.
\]

It is bounded, positive, and self-adjoint on L²(R³) (or on the countable additive shift orbit) because

\[
0\le\widehat{\mathscr D}(k)\le\frac{12}{\ell_0^2}\sum_n\mu_n s^{-2n}
=\frac{12.339805868999}{\ell_0^2}.
\]

The convergence uses spectral radius(K_N)=0.01024 < s², with no Planck length in the definition. The low-momentum symbol is

\[
\widehat{\mathscr D}(k)=|k|^2-\frac{\ell_0^2\,M_2}{20}|k|^4+
\frac{\ell_0^4 M_4}{1440}\sum_i(u_i\cdot k)^6+O(\ell_0^6|k|^8),
\]

where `M2=sum mu_n s^(2n)=0.99608223258` and `M4=sum mu_n s^(4n)=0.99551490338`. The universal quartic coefficient in the defined model is `−0.04980411163 ell0²`. The vertex-vs-face sixth anisotropy is `0.00039328983815 ell0⁴ |k|^6`. The operator's high-k response is bounded and orientation dependent; example unit-ell0 symbols for Q=1000 along vertex, face, arbitrary Cartesian axis are approximately 3.32257, 7.38298, 6.18070. These are math-model predictions, not observed frequencies.

An **exact microstep causal extension** uses the stable recurrence `f_(t+1)−2f_t+f_(t−1)=−tau² c² D f_t`. With `tau=ell0/(c sqrt(12 U))` and `U=sum mu_n s^(-2n)=1.02831716...`, its dimensionless Courant factor is <=1. Every spatial translation per update is at most ell0 in Euclidean norm. Thus compact-support initial data on the countable shift orbit remain within an enlarged ball of radius t ell0 after t updates, despite countably many finer jumps. The discrete conserved energy follows as above from bounded positivity. This establishes finite **microstep** propagation, not an exact Minkowski light cone with velocity c; the maximal microscopic cone speed depends on tau. The continuous-time version instead has no strict finite-speed support because its bounded nonlocal kernel generates analytic tails.

## 6. What is genuinely established and what is not
**Reproduced/established for these operators:** inversion of the hidden-generated Gram response to reconstruct A5 geometry and its 3D frame, fourth-order isotropy; rank-six to rank-twelve hidden-gap bifurcation; exact reversible energy-conserving 13-cell graph update and graph finite-step causality; positive multiscale bounded spatial operator with isotropic low-k wave principal symbol, computable sixth-order anisotropy and an ultraviolet departure from relativistic dispersion.

**Still physical hypotheses:** treating the eigenvector-derived coordinates as an operational spatial metric; identifying the refinement scale with metres; selecting the second-order clock action or spin-2 dynamics, and requiring it to emerge from the original isometric hidden-history transfer; restoring full Poincaré covariance, particle content and Einstein equations; showing an actual sub-Planck phase transition/measurement. This particular construction assumes ordinary continuum R³ as an embedding for the multiscale field, so it is not a proof of physical spacetime arising *only* from a Platonic relational algebra.

Unlike the naive previous claim, **the graph-wave law and the multiscale Fourier wave law are distinct mathematical realizations**: one is exactly finite-step causal on the 13-cell, the other supplies a continuum-like long-wave symbol after adding a spatial embedding. They are compatible in symmetry but not proved equivalent dynamically.

## Reproduction
`newton_causal_emergence_2026_10_14.py` reads the previous conversation's actual `Cathedral_Transfer_Observable_Operators_2026-10-14.npz`. The repository version instead regenerates the matrices from adjacent archived Platonic scripts. Results: `Newton_Causal_Emergence_Results_2026-10-14.json`.

References: Kotelina & Pevnyi, *Spherical semidesigns* (icosahedron 5-design), https://files.ele-math.com/articles/jca-06-13.pdf ; Surya, *The causal set approach to quantum gravity*, Living Reviews in Relativity 22, 5 (2019), https://doi.org/10.1007/s41114-019-0023-1. Those works are background, not empirical verification of the present model.
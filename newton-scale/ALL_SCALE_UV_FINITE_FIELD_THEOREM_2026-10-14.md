# Newton–Platonic all-scale spectral field: exact theorem and novelty status
**14 October 2026 | independent from URT and Newton's Cathedral**

## Abstract
An exact rational operator derived from the five inscribed cubes of the regular dodecahedron, combined with the order-four cube-label doubling defect, gives a positive finite spectral filter on **all 19 nonconstant modes**. Requiring the spectral Newton length factor to support a finite second-order graph-energy moment fixes **minimal integer powers** (hidden: three; golden exchange: two), within the explicitly stated polynomial-filter class. A scale-indexed coherent-branch covariance constructed from these operators is positive, trace class, and has finite expected Dirichlet energy at arbitrarily many refinement levels. It has no mathematical minimum scale. This is a precise, reproducible **mathematical existence theorem**, not proof of physical sub-Planck operational resolution or proof of publication priority.

## 1. Exact finite data and identities
Let A be the adjacency matrix of the 20-vertex dodecahedral graph and L=3I-A. Let P_j be the orthogonal projection onto the vertex-face incidence kernel of inscribed cube j (j=1,...,5), extended by zero to R20. Define
\[
P=\frac15\sum_{j=1}^{5}P_j.
\]
Exact symbolic computation, independent of any Cathedral inputs, proves
\[
P=-\frac1{60}L(L^2-7L+13I)(L^2-6L+4I)
\]
and spec(P)={0 (x7), 1/4 (x8), 2/5 (x5)}.
Let D be the cube-label-doubling permutation, D^4=I, and define Q=DLD^T-L. Then
\[
Q^2=20 P_{\rm golden},\qquad
\operatorname{rank}Q=6,\qquad
\operatorname{Tr}Q^2=120.
\]
Here P_golden is the rank-six orthogonal projection onto the pair of golden triplet eigenspaces of L, with graph eigenvalues 3−√5 and 3+√5. Set
\[
G=Q^2/120=P_{\rm golden}/6,\quad
\operatorname{spec}G=\{1/6\ (x6),0\ (x14)\}.
\]
Because P annihilates the golden triplets, **PG=GP=0**. The only common null direction of P and G is the constant graph mode.

The Newton spectral ratio, used here only as a *relative geometric length*, is
\[
s=\sqrt{(3-\sqrt5)/(3+\sqrt5)}=(3-\sqrt5)/2=\varphi^{-2}.
\]
Thus s²=(7−3√5)/2≈0.14589803375.

## 2. Minimal integer-degree positive UV filter
On the nonconstant graph carrier consider the **specified class**
\[
K_{m,r}=P^m+G^r,\qquad m,r\in\mathbb{N},\ m,r\ge1.
\]
Every K_mr is PSD, and its nonzero eigenvalues are
\[
(1/4)^m\ (x8),\quad (2/5)^m\ (x5),\quad (1/6)^r\ (x6).
\]
For an all-scale geometric progression in inverse lengths, k_n/k_0=s^{-n}, the necessary and sufficient convergence condition for the second-moment geometric series is
\[
\rho(K_{m,r})<s^2.
\]
Now (2/5)^2=4/25 > s² but (2/5)^3=8/125 < s²; moreover 1/6 > s² but (1/6)^2=1/36 < s². Therefore the **componentwise smallest integers** satisfying the condition are uniquely (m,r)=(3,2), *within this integer-power filter class*.

Define
\[
\boxed{K_N=P^3+G^2.}
\]
Its exact spectrum is
\[
\boxed{\operatorname{spec}K_N=
\{0(x1),1/64(x8),1/36(x6),8/125(x5)\}.}
\]
It is positive, preserves every A5 spectral band, commutes with L, acts nontrivially on all 19 nonconstant modes, and obeys the exact inequality
\[
\rho(K_N)=8/125=0.064<s^2,\quad
\boxed{\rho(K_N)/s^2=0.43866252583997981...<1.}
\]
No continuous coefficient is fitted; this is a unique **conditional minimal-power selection**, not uniqueness among every conceivable transfer operator.

## 3. Coherent five-cube branch state and infinite Gaussian field
Let the **real five-by-five overlap state** be
\[
R_5=[\operatorname{Tr}(P_iP_j)]_{i,j}/20
=\frac{27}{160}I_5+\frac1{32}J_5,
\quad
\operatorname{spec}R_5=\{13/40(x1),27/160(x4)\},
\quad\operatorname{Tr}R_5=1.
\]
The branch matrix has nonzero off-diagonal entries: the five branches are not being treated as independent equiprobable labels.

On the separable real Hilbert space
\[
\mathcal H=\bigoplus_{n=0}^{\infty}
\left((\mathbb R^5)^{\otimes n}\otimes\mathbb R^{20}\right)
\]
define covariance blocks
\[
C_0=I_{20}-P_0,\quad
C_n=R_5^{\otimes n}\otimes K_N^n\quad(n\ge1),
\]
where P0=J20/20 is the projection onto the constants. Every C_n is PSD. Its infinite direct sum C is trace class, because
\[
\operatorname{Tr}C=\sum_{n=0}^{\infty}
(8/64^n+6/36^n+5(8/125)^n)
=\boxed{26809/1365=19.64029304029304...}.
\]
(The n=0 sum counts the 19 nonconstant modes.)

A positive trace-class covariance on a separable Hilbert space defines a centred Gaussian Borel probability measure. Thus this is an actual infinite-dimensional Gaussian mathematical field, not only a list of shrinking lengths.

Define its scale-indexed, second-order Laplacian
\[
\mathscr L=\bigoplus_{n\ge0}s^{-2n}(I_{5^n}\otimes L).
\]
Since L and K_N commute, the expected graph Dirichlet energy is exactly
\[
\mathbb E\langle X,\mathscr L X\rangle
=\operatorname{Tr}(\mathscr L C)
=\frac{32}{1-(1/64)/s^2}
+\frac{10}{1-(8/125)/s^2}
+\frac{18}{1-(1/36)/s^2}
=\boxed{75.88566251502725\ldots<\infty}.
\]
The simpler quadratic momentum moment is
\[
M_2=\sum_{n\ge0}s^{-2n}\operatorname{Tr}C_n
=\boxed{25.27781233823037\ldots}.
\]
There is no terminal n in the Hilbert-space field construction and no Planck length is used in its definition. Setting an arbitrary reference length \(\ell_0>0\), the mathematical levels \(\ell_n=\ell_0s^n\) eventually fall below every chosen positive threshold, including the numerical Planck length.

## 4. Exact ultraviolet convergence threshold and log-periodic poles
The more general momentum-index sum is
\[
M_p=\sum_{n\ge0}s^{-pn}\operatorname{Tr}C_n
=\frac8{1-s^{-p}/64}
+\frac6{1-s^{-p}/36}
+\frac5{1-8s^{-p}/125},
\]
initially valid for all real p satisfying p<p_c, where
\[
\boxed{p_c=\frac{\ln(125/8)}{\ln(1/s)}
=2.8561976789348295\ldots}.
\]
Thus p=2 is finite but the plain per-level fixed-transfer model **does not have finite moments of every order**. The meromorphic continuation has equally spaced candidate complex poles at
\[
p_{j,k}=\frac{-\ln\lambda_j+2\pi i k}{\ln(1/s)},
\qquad k\in\mathbb Z,
\]
for the three nonzero eigenvalues \(\lambda_j\). Their imaginary spacing is
\[
2\pi/\ln(1/s)=6.52850260527\ldots.
\]
This is a property of the defined mathematical model, not a measured log-periodic signal in nature.

## 5. Optional all-ancestor regularity enhancement: all moments finite
Define another precisely specified, but **not uniquely forced**, history rule: at depth n, each new cell has one transfer contact with each of its n ancestor layers. The cumulative number of contacts is n(n+1)/2, giving
\[
\widetilde C_n=R_5^{\otimes n}\otimes K_N^{n(n+1)/2}.
\]
Then for every fixed real p≥0,
\[
\sum_n s^{-pn}\operatorname{Tr}\widetilde C_n<\infty,
\]
since every term is bounded by a constant times
\[
\exp\left[
n p\ln(1/s)+\frac{n(n+1)}2\ln(8/125)\right],
\]
which is Gaussian-decaying in n. The corresponding complex moment generating function is **entire** in p. This is an all-orders mathematically UV-regular field, albeit under a separate ancestor-contact rule that requires its own physical derivation.

## 6. Originality and physical boundary
Known prior work includes the five-cube dodecahedral compound (Hess, 1876), Platonic graph spectra, classical nested golden pentagrams, and extensive existing literature on spectral zeta functions of self-similar fractals (Lal & Lapidus, 2012). A targeted search did not reveal the exact five-cube incidence-projector filter identity or the **P³+G² minimal integer UV construction**, but *absence in this search cannot establish originality*. A credible independent mathematical submission should clearly claim these precise results, not the already known golden ratio or the abstract existence of fractals.

**Proved in this exact model:** full nonconstant 19-mode positive transfer, finite trace/second-moment Dirichlet energy on an infinite-level Hilbert space, explicit p_c and optional all-order refinement; crossing any positive length threshold in an assigned mathematical length metric.

**Not proved:** that this Hilbert-space Gaussian field is actual Lorentzian spacetime, that a laboratory can operationally resolve lengths below Planck, that it gives real gravitational/particle interactions, or that its formulas are historically unprecedented. These require a physical distance/current/interaction map and peer-checked prior art. Do not confuse mathematical existence with an experimentally established law of Nature.

## Reproduce
- Standalone exact rational/SymPy script: newton-scale/UV_FINITE_19_MODE_THEOREM_EXACT.py
- Prior independent finite theorem: newton-scale/five_cube_spectral_filter_exact.py
- Source work: newton-scale/FIVE_CUBE_SPECTRAL_FILTER_AND_NOVELTY_AUDIT_2026-10-14.md

Prior literature:
- Five cube compound: https://mathworld.wolfram.com/Cube5-Compound.html
- Lal and Lapidus (2012): https://arxiv.org/abs/1202.4126
- Fractal Laplacian and energy renormalization: https://onlinelibrary.wiley.com/doi/10.1155/2013/756075

# Newton's Cathedral / URT v117 — Final Mathematical Closure and Nature Boundary
Date: 2026-09-12

## Executive result

The v116 finite operator calculation closes further, but with one important
correction. The Arnold cat map cannot be the exact physical URT phase update.
Instead, the cat block becomes literal only after the already-required
\(A_5\to A_4\) vacuum selection, where the conjugate triplets \(3\) and \(3'\)
become equivalent.

The corrected dependency chain is

\[
\boxed{
A_5\text{ oriented shell}
\to K
\to J
\to P_+
\to (3\oplus3'\oplus4\oplus5)
\to A_4\text{ selection}
\to \mathcal A_{\rm gold}
\to \phi^{\pm2}
}
\]

together with

\[
\boxed{
S_6=-\frac12K^2-3I,\qquad
L_{13}|_{3\oplus3'}=3I-\frac12K^2.
}
\]

Thus the golden transfer, the six-axis history operator, the 13-state golden
triplet spectrum and the oriented icosahedral circulation are different
representations of one finite structure.

## 1. Exact affine-phase no-go

For
\[
A=\begin{pmatrix}2&1\\1&1\end{pmatrix}
\]
a torus character \(p\in\mathbb Z^2\) could have a state-independent phase
increment under \(x\mapsto Ax+\Omega\) only if
\[
(A^T-I)p=0.
\]
But
\[
\det(A-I)=-1,
\]
so \(A-I\) is unimodular and the only solution is \(p=0\).

Moreover every affine translation is removable:
\[
T_t^{-1}(Ax+\Omega)T_t=Ax,\qquad
t=-(A-I)^{-1}\Omega.
\]

Therefore \(\Omega\) cannot encode the original irrational URT phase as an
invariant datum. The original phase law remains fundamental:
\[
\boxed{\theta_{k+1}=\theta_k+\frac{2\pi}{\phi^2}.}
\]

The cat map belongs to the selected internal golden sector, not to the
physical URT base.

## 2. Literal cat block after \(A_5\to A_4\)

At full \(A_5\) symmetry,
\[
\operatorname{Hom}_{A_5}(3,3')=0.
\]
Choose one of the five tetrahedral vacuum stabilizers \(A_4\subset A_5\).
Then
\[
3\downarrow_{A_4}\cong3'\downarrow_{A_4}\cong3_{\rm tet},
\]
so
\[
\boxed{\dim\operatorname{Hom}_{A_4}(3,3')=1.}
\]

The explicit finite calculation finds this one-dimensional intertwiner
space. Let its normalized generator be \(S:3\to3'\), \(S^\dagger S=I\).
Then
\[
\boxed{
\mathcal A_{\rm gold}
=
\begin{pmatrix}
2I_3&S^\dagger\\
S&I_3
\end{pmatrix}.
}
\]
It commutes with the selected \(A_4\), and has eigenvalues
\[
\boxed{\phi^2\;(3\times),\qquad\phi^{-2}\;(3\times).}
\]

The explicit unitary similarity residual to
\(\phi^2I_3\oplus\phi^{-2}I_3\) is below \(10^{-15}\).

Hence the fivefold \(A_5/A_4\) selection does something precise: it permits
the Galois-conjugate \(A_5\) triplets to become one tetrahedral doublet
carrying a literal threefold cat-map block.

## 3. v105 history operator derived from v116 \(K\)

On the polarized triplet sector define
\[
\boxed{S_6=-\frac12K^2-3I.}
\]
Then the explicit matrices give
\[
\boxed{S_6^2=5I}
\]
to machine precision.

Consequently
\[
\boxed{
L_{13}|_{3\oplus3'}
=
6I+S_6
=
3I-\frac12K^2
}
\]
has eigenvalues
\[
\boxed{6-\sqrt5,\qquad6+\sqrt5}
\]
each with multiplicity three.

This identifies the v105 signed six-axis golden operator with a polynomial
of the v116 oriented-edge circulation operator under the unique
multiplicity-free \(A_5\) identifications.

## 4. Complex polarization and KO-6

The v116 polar operator \(J\) is real and satisfies \(J^2=-I\).
With
\[
P_\pm=\frac12(I\mp iJ),
\]
ordinary complex conjugation gives
\[
\boxed{\mathcal K P_+\mathcal K^{-1}=P_-}.
\]

Therefore a KO real structure on the independent finite factor is
compatible with the Hodge polarization and exchanges the two orientation
branches automatically. The physical choice of branch is supplied by the
Hopf orientation \(c_1=\pm1\), not by a fitted continuous phase.

## 5. Exact mod-9 \(C_6\) shadow after choosing the phase axis

Modulo 9,
\[
A^6=-I,\qquad A^{12}=I.
\]
Choose the physical phase axis \([1:0]\) and forward orientation. Its
projective orbit is
\[
[1:0]\to[1:5]\to[1:6]\to[1:2]\to[1:3]\to[1:8]\to[1:0].
\]
Define
\[
\iota(A^k[1:0])=2^k\pmod9.
\]
Then
\[
\boxed{\iota(Ax)=2\iota(x)\pmod9}
\]
and the image is
\[
\boxed{1\to2\to4\to8\to7\to5\to1.}
\]

Thus the old vortex wheel is an exact equivariant \(C_6\) shadow once the
physical basepoint and orientation are supplied. Without those choices the
identification is only defined up to an automorphism of \(C_6\).

## 6. Continuum spectral moments

A generic spectral action does not fix its continuum coefficients. If the
already-identified fermionic KMS entropy cutoff
\[
h(x)=\log(1+e^{-x})+\frac{x}{1+e^x}
\]
is adopted, then
\[
\int_0^\infty x^m h(x)\,dx=(m+2)m!\,\eta(m+2).
\]

Therefore
\[
\boxed{f_0=\ln2,\qquad
f_2=\frac94\zeta(3),\qquad
f_4=\frac{225}{8}\zeta(5).}
\]

This fixes the relative cutoff-moment ratios. It does not fix the overall
bosonic normalization or the absolute microscopic length/energy scale.

## 7. Topological particle stability

For a coherent map \(n:S^3\to S^2\), set
\[
F=n^*\omega_{S^2}=d\alpha,
\qquad
Q_H=\frac1{4\pi^2}\int_{S^3}\alpha\wedge F\in\mathbb Z.
\]

Hopf charge alone does not stabilize the size of a lump under a pure
quadratic sigma-model energy. The stable structure is the
Faddeev-Skyrme form
\[
\boxed{
E[n]
=
a\int|dn|^2+b\int|F|^2,\qquad a,b>0.
}
\]

For fixed nonzero Hopf number,
\[
\boxed{
E\ge C\sqrt{ab}\,|Q_H|^{3/4}
}
\]
for a positive normalization-dependent constant \(C\).

The gradient and curvature terms are exactly the structural types already
present in the coherent and gauge/connection sectors. Thus Hopf/vortex
sectors can be energetically protected when both positive terms survive
the continuum limit. Under continuous URT relaxation without a
zero/reconnection event, \(Q_H\) is unchanged while the energy decreases.

This is the mathematically correct particle-as-vortex/knot sector. Mapping
specific Hopf charges to observed species remains a physical hypothesis.

## 8. Final master object

Retain the established five-dimensional URT manifold
\[
\boxed{
M_{\rm URT}
=
S^1_\theta\times\mathbb R^+_\chi\times
S^1_\vartheta\times\mathbb R_\tau\times\mathcal B.
}
\]

Retain the original base evolution, including
\[
\chi_{k+1}=\frac{\pi}{e}\chi_k,\qquad
\theta_{k+1}=\theta_k+\frac{2\pi}{\phi^2}.
\]

Above that base sits the 13-state/oriented-edge spectral complex
\[
\boxed{
C_1^{\rm ico}
\xrightarrow{K}
C_1^{\rm ico}
\xrightarrow{\rm polar}
J
\xrightarrow{P_+}
3+3'+4+5
\xrightarrow{+1}
4+1+3+8.
}
\]

After \(A_5\to A_4\) selection, the \(3\oplus3'\) block admits the literal
golden cat transfer. The same \(K\) generates the 13-state triplet
spectrum. The Hopf lift supplies \(U(1)\) connection, linking, Chern class
and helicity. The KO-6 finite algebra supplies non-Abelian brackets and
the particle/antiparticle real structure. URT supplies irreversible
selection.

A compact update is
\[
\boxed{
\Psi_{k+1}
=
\mathcal R_{\rm URT}
\left[
e^{-h\mathbb D_X^2}
U_H
U_{\rm int}(K,J,D_F)
\Psi_k
\right].
}
\]

The physical base obeys URT; the internal transfer carries the golden
hyperbolic block. This avoids the phase inconsistency.

## 9. The unavoidable boundary

Two statements cannot be obtained by more symbolic manipulation:

1. A dimensionless finite seed cannot determine its conversion to metres,
   seconds or GeV. One dimensionful calibration \(a_*\) (or
   \(\Lambda_*=a_*^{-1}\)) is required unless new dimensionful microscopic
   data are postulated.

2. Internal mathematical closure cannot prove that Nature realizes the
   construction. That requires prospective empirical tests not used in
   building it.

These are identifiability and scientific-validation boundaries, not
unfinished representation algebra.

## 10. Final description

The object is most precisely described as
\[
\boxed{
\textbf{an oriented, dissipative, golden spectral complex on the 5D URT manifold}.
}
\]

Its different observables are:

\[
\begin{aligned}
\text{arithmetic}&\leftrightarrow\text{finite orbits/modular reductions},\\
\text{music}&\leftrightarrow\text{Fourier characters/spectral ratios},\\
\text{knots}&\leftrightarrow\text{integer winding/Hopf classes},\\
\text{vortices}&\leftrightarrow\text{circulation/helicity},\\
\text{gauge}&\leftrightarrow\text{connection/holonomy},\\
\text{particles}&\leftrightarrow\text{stable spectral/topological excitations},\\
\text{geometry}&\leftrightarrow\text{quartet/coframe sector},\\
\text{URT}&\leftrightarrow\text{selection, scale evolution and relaxation}.
\end{aligned}
\]

The finite mathematics is now more coherent than v116 because the cat-map
structure has been moved to the only place where it is compatible with the
original URT phase law: the \(A_4\)-selected internal
\(3\oplus3'\) sector.

## 11. Scientific status

The finite mathematical framework is now internally closed at this level.
It is a defined and falsifiable candidate model, not a demonstrated theory
of Nature.

The next decisive step is not another internal symbolic identification.
It is to freeze v117 and subject its dimensionless predictions to
prospective tests on data or simulations not used in construction.
# Newton's Cathedral: coupling-selection reinterpretation of URT

**Date:** 2026-11-11  
**Status:** Exact finite-dimensional theorem for the icosahedral hidden sector, with explicitly stated locality hypothesis. The interpretation of URT as a physical coupling-selection law remains a proposal, not a proved theory of nature.  
**Independent verification:** `python cathedral_coupling_selector_exact.py` (SymPy; all assertions pass).  
**Repository status:** Working files prepared locally; no GitHub commit or upload performed.

## The structural hypothesis

Replace the proposed `URT selects histories` interpretation with:

`entire Cathedral geometry -> URT selects permitted interaction channels -> forces assign dynamics to allowed channels -> histories follow from equations of motion and boundary/initial conditions`.

Under this hypothesis URT need not select the trajectory, orbital shell, or cosmological history. It can be a *coupling selection rule* on representation sectors. A symmetry selection rule is a necessary condition for an interaction, not proof that an interaction physically exists. Relative geometric transfer strengths need not equal gauge or gravitational coupling constants.

## Exact geometric inputs

Take an icosahedron with 12 vertices and 20 triangular faces. Let `B` be its unsigned `20 x 12` face-vertex incidence matrix, and `L_I`, `L_D` the unnormalised graph Laplacians on its vertex graph and the dual dodecahedral face graph. All matrices are integer-valued and defined without fitting.

The hidden sector is

\[
\mathcal H_{\rm hid}=\ker B^T=H_3^-\oplus H_5^+,
\quad \dim H_3^-=\dim H_5^+=4,
\]

with `L_D` eigenvalues 3 and 5, respectively, and opposite antipodal parities. For `u` and `v` in the respective hidden sectors, `B^T u = B^T v = 0`.

The visible vertex representation is `1^+ + 3^- + 3'^- + 5^+` under the icosahedral rotations and antipodal inversion.

## Theorem: a local bilinear hidden-sector bridge

**Locality hypothesis.** Two fields living on the same set of 20 faces interact *pointwise*, by Hadamard multiplication `u ⊙ v`. Their effect on vertices is obtained by the already-existing incidence map `B^T`. This specific locality prescription is an ansatz, not something uniquely forced by A5 symmetry.

Define the bilinear map:

\[
\mathcal F:H_3^-\otimes H_5^+\to\mathbb R^{12},\qquad
\mathcal F(u,v)=B^T(u\odot v).
\]

**Exact results** (all checked symbolically using explicit vertices, faces, and matrices):

1. `F` is equivariant under the rotation group `A5`; it has odd antipodal parity.
2. Its image is exactly `W_3 \oplus W_{3'}`: `rank(F)=6`; both triplet projections have rank 3.
3. It has no component in the visible `1` or `5` representations.
4. The individual hidden sectors do not couple linearly to visible vertices through incidence, but their product does couple quadratically.

The rank calculation is basis-independent: choosing any basis for each four-dimensional hidden subspace produces 16 pairwise outputs spanning a six-dimensional image.

## Exact positive transfer and golden ratio

Let `P_3`, `P_5` denote the *orthogonal* projectors onto `H_3^-` and `H_5^+` in the natural Euclidean face-coordinate inner product. The transfer operator from the orthonormal 16-dimensional hidden tensor-product space into the visible vertices is

\[
T_{\rm hid}=\mathcal F\mathcal F^T
=B^T(P_3\odot P_5)B.
\]

Its exact eigenvalues are

\[
\operatorname{Spec}(T_{\rm hid})
=\left\{\left(\frac{5+2\sqrt5}{15}\right)^{(3)},
\left(\frac{5-2\sqrt5}{15}\right)^{(3)},0^{(6)}\right\}.
\]

Consequently, the ratio of its nonzero **transfer eigenvalues** (quadratic strengths) and the ratio of corresponding **singular amplitudes** are

\[
\frac{\lambda_+}{\lambda_-}=9+4\sqrt5=\varphi^6,
\qquad \frac{\sigma_+}{\sigma_-}=2+\sqrt5=\varphi^3.
\]

This is a zero-fit relative **geometric** result; it does not derive the physical fine-structure constant, Newton constant, mass scales, or Yang-Mills couplings. The actual interaction could multiply the whole map by a dynamical coupling constant, and other allowed local equivariant maps may exist.

Also `Tr(T_hid) = 2`. The normalized density `rho = T_hid/2` has total triplet weights `(5+2 sqrt5)/10` and `(5-2 sqrt5)/10`; these must not be confused with Cathedral's frozen `p_5 = Delta^2/(1+Delta^2)`.

## Independent selection through relative-sheet spectral resonance

The original N-throat ansatz includes a relative-sheet Laplacian shift of exactly `+2`. For that *given shift*, define the detuning map

\[
D_{\rm det}=L_I B^T-B^T(L_D+2I_{20}).
\]

Exactly,

\[
\operatorname{Spec}(D_{\rm det}D_{\rm det}^T)
=\{0^{(6)},12^{(5)},60^{(1)}\}.
\]

Thus its zero-detuning projector onto visible vertices is the explicitly computable polynomial

\[
P_{\rm res}=
\left(I-\frac{D_{\rm det}D_{\rm det}^T}{60}\right)
\left(I-\frac{D_{\rm det}D_{\rm det}^T}{12}\right),\qquad
P_{\rm res}^2=P_{\rm res},\quad\operatorname{rank}P_{\rm res}=6.
\]

It selects the **same** visible triplet space `W_3+W_{3'}` as the hidden quadratic map. Further exact identities:

\[
B^T B=15I_{12}-2L_I,
\qquad
T_{\rm hid}=\frac1{15}P_{\rm res}(15I_{12}-2L_I)P_{\rm res}.
\]

This agreement offers two different exact characterizations of one *available* coupling subspace. It is conditional on the relative-sheet `+2` choice and does not establish that the +2 dynamics is physically realized.

## What about the URT phase q?

The previously used URT complex factor is

\[
q=(\pi/e)\exp(i\,2\pi/\varphi^2).
\]

If it merely multiplies the entire map, then the positive transfer loses its phase:

\[
(q\mathcal F)(q\mathcal F)^\dagger=|q|^2\mathcal F\mathcal F^\dagger.
\]

It **cannot** select different channels in that form. To make the phase meaningful requires at least two genuinely distinct and geometrically defined interference paths, such as `F_0+q F_1`, with nonvanishing cross terms. Their construction must be derived rather than assumed; no new physical claim is made here.

## Consequences for the overall Cathedral

- **Confirmed local statement:** icosahedral hidden `4^-_3 + 4^+_5` mixed fields generate the visible golden `3+3'` coupling space and an exact `phi^6` transfer-strength ratio.
- **Possible new interpretation:** URT establishes permitted couplings; forces plus boundary data generate the histories. This is conceptually compatible with the positive `T=B^dagger B` machinery but not a complete replacement derivation yet.
- **Not yet checked:** consistency of this local selector with the entire 190-dimensional five-Platonic Hodge complex, `D6 -> H3`, `H13 + H51`, the 24-ordering, Golay/Leech and higher-dimensional components, and the coupled N-throat transfer. The 12-vertex computation must not be substituted for the whole Cathedral.
- **Not implied:** that solar orbits are quantized, a physical vacuum crystal exists, Planet Nine is excluded, a force coupling has been measured, or the zero-parameter theory of nature is complete.

## Immediate research question

Derive the locality prescription and relative-sheet shift from the full Cathedral functorially, rather than choosing them as useful structures. If successful, the permitted coupling projector and its relative geometric strengths will be consequences of the full operator. Then add explicit force-field actions on those channels and test whether the dynamical model makes experimentally distinct predictions.
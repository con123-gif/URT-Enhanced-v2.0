# Actual max-period cocycles: rank, integral reduction and local duality

26 November 2026. Human derivation and exact external-theorem bridge;
independent mathematical audit pending. No new Lean execution or claim of RH
completion. This fills the period-ring and integral-rank prerequisites of the
direct Tate argument already supplied in literature RUN55; that argument is
credited below, not claimed as new.

All native references are to `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact/src/`.

| Native file | Actual role |
|---|---|
| `Lib/PadicHodge/PeriodRings/AmaxStructure.lean` | `Amax`, `BPlus`, and the ring named `Bcris` |
| `Lib/PadicHodge/PeriodRings/BdR.lean` | `exists_tPeriod`, `fundamental_sequence_surjective` |
| `Lib/PadicHodge/PeriodRings/FundamentalKernel.lean` | `exists_padic_eq_of_frobEnd_fixed` |
| `Lib/PadicHodge/TateSen/DeRhamFiltration.lean` | invariant classes modulo `hodgeFil` |
| `Lib/PadicHodge/BlochKato/CocycleContinuity.lean` | `exists_hodge_basis`, admissible extensions |
| `Lib/PadicHodge/BlochKato/BlochKato.lean` | `crysCocycles.finrank_eq` |
| `Lib/ClassField/LocalDuality/CrystallineDuality.lean` | dual reduction orders and relative index |
| `New/Selmer/RowBalanced.lean` | `relLength_obeyingCocycles_le` |

## 1. Which period ring and which published theorem

Write (A_{inf}=W(\mathcal O_{C_p}^{\flat})), with the native generator
\(\xi\) of \(\ker\theta\). The definitions are
\[
A=\widehat{A_{\inf}[X]/(pX-\xi)}^{\,p},\qquad
B^+=A[1/p],\qquad B=B^+[1/\mu].                         \tag{1}
\]
Thus the native identifier `Bcris` denotes Colmez's **max ring** here.
It must not be identified with the usual crystalline ring merely by its name.

The first completion in (1) has exactly the restricted-series description
\(\sum_{n\ge0}a_n(\xi/p)^n\), with \(a_n\in A_{\inf}\) tending to zero
\(p\)-adically. Indeed, lift successively modulo \(p^r\) to polynomials;
their corrections are \(p^r\) times polynomials. For each fixed precision
only finitely many corrections contribute, so collecting coefficients gives
the stated series. Conversely such series converge in the completion. Use
the native embedding in \(B_{\mathrm{dR}}^+\), so these are the same elements
as Colmez's series, not an abstract quotient with an unidentified map.
Changing the generator of \(\ker\theta\) multiplies \(X\) by a unit of
\(A_{\inf}\) and gives the same ring. The earlier chart appendix identifies
the native \(\xi\)-adic de Rham completion with the usual one, equivariantly.

There is also a localization check. The native construction gives
\(t_s\sim p\mu\) in \(A\), with
\(\varphi(t_s)=pt_s\) and \(g(t_s)=\chi(g)t_s\); its image is a uniformizer
of \(B_{\mathrm{dR}}^+\). Colmez's \(t_c=\log[\varepsilon]\) is another
uniformizer with the same Galois character, and belongs to this \(B^+\).
Consequently \(t_s/t_c\) is a nonzero element of
\(B_{\mathrm{dR}}^{G_{\mathbb Q_p}}=\mathbb Q_p\), by the fixed-field
theorem already bridged in the chart appendix. Injectivity into
\(B_{\mathrm{dR}}\) gives the same equality inside \(B^+\). Since \(p\)
is invertible there, localizing at \(\mu,t_s,t_c\) gives the same ring.
This proves that (1), with its Galois action, Frobenius and de Rham map,
is the actual \(B_{\max}\) in the following theorem, including \(p=2\).

**External input, with exact interface.** P. Colmez, *Théorie d'Iwasawa des
représentations de de Rham d'un corps local*, §III.2 (definitions) and
Proposition III.3.1 (PDF printed pp. 24, 26):
\[
0\longrightarrow\mathbb Q_p\longrightarrow B_{\max}
 \xrightarrow{\ y\mapsto((1-\varphi)y,\bar y)\ }
 B_{\max}\oplus B_{\mathrm{dR}}/B_{\mathrm{dR}}^+
 \longrightarrow0.                                        \tag{2}
\]
Primary text:
<https://webusers.imj-prg.fr/~pierre.colmez/iwasawa-deRham.pdf>.
The statement, maps and definitions were read in that text. Reversing the
first component gives precisely the native \(\varphi-1\) convention.
No equality \(B_{\max}=B_{\mathrm{cris}}\) is asserted or needed below.

## 2. Continuity precedes use of continuous cohomology

Let \(j:\Gamma\to G_{\mathbb Q_p}\) be the actual open embedding, and
identify \(\Gamma\) with \(G_K\) for a finite local field \(K\). Let \(T\)
be finite free over \(\mathbb Z_p\), set \(V=T[1/p]\), and suppose its
algebraic action is potentially \(B\)-admissible as in the source.

The preceding [Hodge-frame derivation](2026-11-26_COMPACT_HODGE_FRAME_WITHOUT_CONTINUITY.md)
uses scalar Tate invariants and the minimal determinant, before any continuity
assumption on the matrix action. For completeness, passing from a potentially
fixed basis to a full de Rham basis is finite Galois descent: choose a normal
open subgroup \(G_{K_1}\) fixing a period basis; its de Rham invariant space
has dimension \(d=\dim_{\mathbb Q_p}V\) over \(K_1\), since
\(B_{\mathrm{dR}}^{G_{K_1}}=K_1\). The finite group
\(\operatorname{Gal}(K_1/K)\) acts semilinearly on it. Finite semilinear
descent gives a \(K\)-basis of full invariants. The Hodge-frame argument
then supplies the filtered frame in native `exists_hodge_basis`.

The same argument applies to an extension by any rational period cocycle
\(c\): if \(c(g)=g y-y\) in \(B\otimes V\), the vectors \(V\oplus0\)
and \((-y,1)\) give potential admissibility of
\(\widetilde\rho(g)=\left(\begin{smallmatrix}\rho(g)&c(g)\\0&1\end{smallmatrix}\right)\).
This uses only matrices over \(\mathbb Q_p\), not an assumed integral
extension lattice. In a Hodge--Tate frame on an open subgroup,
\[
\widetilde\rho(g)=P\operatorname{diag}(\chi(g)^{-k_i})\,g(P)^{-1},
\qquad P\in\mathrm{GL}_{d+1}(C_p).                         \tag{3}
\]
The right side is continuous at the identity and equals the identity there.
The representation law gives continuity everywhere, hence continuity of
\(c\). Compactness of \(G_K\) makes its image bounded in \(V\), so some
\(p^r c\) takes values in \(T\). This supplies both continuity and the
uniform integral denominator used below without a continuity circle.

## 3. Cocycle rank by cancellation of one invariant space

Put \(V_B=B\otimes_{\mathbb Q_p}V\) and
\(Q=(B_{\mathrm{dR}}\otimes V)/(B_{\mathrm{dR}}^+\otimes V)\).
Tensor (2) with \(V\). In the native sign convention this gives a
surjection
\[
F:V_B\longrightarrow V_B\oplus Q,\quad
y\longmapsto((\varphi-1)y,\bar y),\qquad \ker F=V.          \tag{4}
\]
Both maps commute with the Galois action. Let
\(D=V_B^{G_K}\), \(t=Q^{G_K}\), and
\(\mathcal E=F^{-1}(D\oplus t)\). Then
\[
0\to V\to\mathcal E\to D\oplus t\to0,
\qquad
0\to D\to\mathcal E\xrightarrow{\,y\mapsto(g y-y)_g\,}
 Z_f(V)\to0.                                             \tag{5}
\]
The second equality is exact: membership in \(\mathcal E\) says
\(F(g y-y)=0\) for every \(g\), which by (4) is exactly
\(g y-y\in V\). Conversely every rational native crystalline cocycle has
such a primitive \(y\). Section 2 supplies its continuity.

Here all dimensions in (5) are finite. The full filtered Hodge frame sends
the semilinear action to scalar Galois action, and sends the integral
de Rham lattice to \(\prod_i t_s^{-k_i}B_{\mathrm{dR}}^+\).
Thus \(D\) embeds into \(K^d\). For \(t\), apply scalar invariant lifting
modulo each \(t_s^{-k_i}B_{\mathrm{dR}}^+\), as proved in the chart
appendix from Tate's scalar theorem. It gives
\[
t\simeq\bigoplus_i K/(K\cap t_s^{-k_i}B_{\mathrm{dR}}^+),
\qquad \dim_{\mathbb Q_p}t=[K:\mathbb Q_p]\#\{i:k_i<0\}.
\]
An algebraic nonzero constant has de Rham order zero, so the indicated
summand is \(K\) exactly when \(k_i<0\). Taking dimensions in (5)
cancels \(\dim D\) and proves
\[
\dim_{\mathbb Q_p}Z_f(V)=d+[K:\mathbb Q_p]\#\{i:k_i<0\}.
                                                               \tag{6}
\]
This is a proof for the source max ring. It does not infer (6) from a
dimension theorem for a differently defined cohomology group.

The integral module is precisely
\(Z_f(T)=Z_f(V)\cap\{c:c(g)\in T\text{ for every }g\}\).
In the finite dimensional function space \(Z_f(V)\), finitely many value
coordinates separate points: intersect coordinate kernels until the
dimension can no longer fall. Evaluation embeds \(Z_f(T)\) into a finite
power of \(T\), so it is finite free over \(\mathbb Z_p\).
Section 2 shows \(\mathbb Q_pZ_f(T)=Z_f(V)\), so its rank is (6).
Moreover
\[
Z_f(T)\cap p^m\operatorname{Map}(G_K,T)=p^mZ_f(T):           \tag{7}
\]
divide the period primitive by \(p^m\) and retain the integral function.
These are the finite generation and saturation needed at the reduction
caller, not consequences of a rational dimension count alone.

For a coefficient DVR \(O\) finite free over \(\mathbb Z_p\), the same
module is finite and torsion free over \(O\); restriction of scalars gives
its \(O\)-rank. Splitting the coefficient embeddings in the filtered frame
gives exactly native `finrank_crysCocycles_eq_add_neg_jumps`, with the sum
over the embeddings of the completion. In particular the field-degree
factor in (6) is not dropped.

## 4. The actual local index, using RUN55's direct Tate argument

Credit: [literature RUN55](../specialists/literature_provenance/RUN55_COMPACT_TATE_DEFECT_TRANSFER.lean),
§1, already derives the following finite group argument. Equations (1)--(7)
above now supply its native rank/period prerequisites.

Let \(T'=T^\vee(1)\) with the actual perfect equivariant
\(\mathbb Z_p\)-pairing, \(M=T/p^mT\), and
\(M'=T'/p^mT'\). The primitive-root identification gives
\(M'=\operatorname{Hom}(M,\mu_{p^m})\), not an untwisted dual.
Write \(N=|M|=p^{md}\), \(n=[K:\mathbb Q_p]\),
\(C=Z^1(K,M)\), \(C'=Z^1(K,M')\), and
\(D_1=B^1(K,M)\), \(D'_1=B^1(K,M')\).
Let \(A,A'\) be the reductions of \(Z_f(T),Z_f(T')\).
All finite coboundaries lift, so \(D_1\subset A\), \(D'_1\subset A'\).
The dual jumps are \(-k_i-1\). Each integer \(k_i\) is negative on
exactly one side of this pair. Equations (6)--(7) therefore give
\[
|A||A'|=N^{n+2}.                                         \tag{8}
\]

**External inputs.** Milne, *Arithmetic Duality Theorems*, second edition,
I Corollary 2.3 (printed p. 28) and Theorem 2.8 (printed p. 31): finite
local Tate duality and the local Euler characteristic. Primary text:
<https://www.jmilne.org/math/Books/ADTnot.pdf>.
The field here is the finite characteristic-zero local field \(K\), and
\(M\) is finite and continuous. Thus the order/characteristic guard is
satisfied also for \(p=2\). They give a perfect degree-one pairing and
\[
|H^1(K,M)|=N^n|H^0(K,M)||H^0(K,M')|,
\qquad |C||D'_1|=N^{n+2}.                                \tag{9}
\]
The source's cup boundary is a continuous cochain with values in the
**discrete algebraic units**, hence represents zero in this same local
cohomology group.

Let \(H\) be the source subgroup of functions, and let \(T_H\subset A'\)
be the reduction of \(H\cap Z_f(T')\). The native `hH` says that
\(A+S\subset\operatorname{Ann}_C(T_H)\). It is not necessary that every
element of \(H\) be a cocycle. Perfectness on \(H^1\) gives
\[
|\operatorname{Ann}_C(T_H)|
 =\frac{|C||D'_1|}{|T_H+D'_1|},\qquad
[\operatorname{Ann}_C(T_H):A]=[A':T_H+D'_1].               \tag{10}
\]
Here (8)--(9) prove the second equality; no integral crystalline
annihilator-perfectness theorem is being assumed. Since
\(S/(S\cap A)\simeq(S+A)/A\), (10) proves
\[
[S:S\cap A]\mid[A':T_H+D'_1]\mid[A':T_H]
 \mid[Z_f(T'):H\cap Z_f(T')].                             \tag{11}
\]
The final divisibility follows from the surjective reduction map. If its
rightmost index is infinite, the native natural index is zero and the
divisibility assertion remains valid; \(m=0\) is trivial throughout.

At `relLength_obeyingCocycles_le`, the graph lattice and the linear lift
already constructed in Galois RUN51 supply exactly `hZ` and `hH`.
The coefficient-ring functional in `exists_perfect_pairing` identifies
the \(O\)-dual with the \(\mathbb Z_p\)-dual; no factor from the different
is lost. Apply (11), then the native length normalization, to get the
stated local relative-length inequality for the **same** lattices and
modulus. It feeds `sum_blockLoss_le`; it supplies no sparse-thick,
two-size, few-low-jumps or tame cokernel exponent on its own.

## Audit boundary and resume

The new bridge is the actual max-ring identification, noncircular
continuity, finite exact-sequence rank proof, integral freeness and
saturation. It makes the earlier direct finite Tate proof applicable at
the actual caller. Independent audit must check these bridges together
with the preceding Hodge-frame note. The standard theorems above were
opened and their precise statements checked; no new native replay or
finite diagnostic was run. The recorded RUN28/RUN29 evidence is unchanged.

RESUME HERE: audit (1)--(7), especially filtered-frame descent and uniform
denominators. Continue the actual exponent suppliers at
`New/Lift/ExponentTheorems.lean` and the sparse-thick/two-size cut
cokernels; the finite Tate index and scalar Ribet collection need not be
derived again. All A/B primitives and common global witnesses remain.

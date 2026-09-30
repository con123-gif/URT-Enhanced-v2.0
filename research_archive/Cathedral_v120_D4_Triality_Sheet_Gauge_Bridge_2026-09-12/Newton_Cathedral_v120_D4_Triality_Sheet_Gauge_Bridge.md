# Newton's Cathedral / URT v120 — D4 Triality, Four-Sheet Geometry and Inter-Sheet Gauge Bridge
Date: 2026-09-12

## Breakthrough

The v119 abstract identification
\[
D_6^\*/D_6\cong\mathbb Z_2^2
\]
with the tetrahedral Klein four was incomplete.  The \(D_6\) discriminant
form distinguishes the vector coset from the two spinor cosets:
\[
\|v\|^2=1,\qquad \|s_\pm\|^2=\frac32.
\]
Hence its full discriminant geometry has no order-three symmetry cycling
all three nonzero elements.

The natural repair is local \(D_4\), without removing the global \(D_6\)
parent.  The coordinate sublattice
\[
D_4=\{(n_1,n_2,n_3,n_4,0,0)\in D_6\}
\]
has
\[
D_4^\*/D_4=\{0,v,s_+,s_-\}\cong\mathbb Z_2^2
\]
and now
\[
\|v\|^2=\|s_+\|^2=\|s_-\|^2=1.
\]

An explicit orthogonal lattice automorphism is
\[
\mathcal T=\frac12
\begin{pmatrix}
1&1&1&-1\\
1&1&-1&1\\
1&-1&1&1\\
1&-1&-1&-1
\end{pmatrix},
\]
with
\[
\mathcal T^3=I,\qquad \det\mathcal T=1.
\]
It permutes the complete 24-root \(D_4\) system and cycles
\[
\boxed{v\longrightarrow s_+\longrightarrow s_-\longrightarrow v.}
\]

Thus local \(D_4\) supplies the exact triality missing from \(D_6\).

## Tetrahedral group reconstructed from the four sheets

Let
\[
K=D_4^\*/D_4\cong\mathbb Z_2^2.
\]
Triality acts on \(K\) by fixing zero and cycling its three nonzero elements.
Therefore
\[
\boxed{K\rtimes C_3^{\rm triality}\cong A_4.}
\]

The explicit action on the four cosets generates 12 permutations and every
one is even: it is exactly the tetrahedral permutation group.

Consequently the selected Cathedral vacuum
\[
A_5\to A_4
\]
has a lattice realization:
\[
\boxed{
D_4^\*/D_4
\rtimes C_3^{\rm triality}
\cong A_4.
}
\]

The four cosets carry the natural permutation module
\[
\boxed{\mathbb R^4_{\rm sheets}=1\oplus3,}
\]
which is precisely
\[
V_4\downarrow_{A_4}=1\oplus3.
\]

This removes the arbitrary group-only identification present in v119.

## The new 4+12 theorem

Write a local transfer as a \(4\times4\) matrix in the vacuum-adapted
four-sheet basis:
\[
X=(X_{ab}),\qquad a,b\in D_4^\*/D_4.
\]

Split it canonically into
\[
X=X_{\rm diag}+X_{\rm off}.
\]

The diagonal space has dimension four.  Under \(A_4\), its character on
elements of orders \(1,2,3\) is
\[
(4,0,1),
\]
hence
\[
\boxed{\operatorname{Diag}_4=1\oplus3.}
\]

That is exactly the restriction of the Cathedral geometry quartet:
\[
\boxed{4_g\downarrow_{A_4}=1\oplus3.}
\]

The off-diagonal space consists of the twelve ordered transitions between
distinct sheets.  The tetrahedral group acts freely and transitively on these
ordered pairs, so
\[
\boxed{\operatorname{OffDiag}_{12}\cong\mathbb R[A_4],}
\]
the regular representation.

Its character is
\[
(12,0,0).
\]

Now restrict the Cathedral gauge carrier:
\[
1_Y\oplus3_W\oplus3'_C\oplus5_C.
\]
Using
\[
3|_{A_4}=3'|_{A_4}=3,\qquad
5|_{A_4}=1'\oplus1''\oplus3,
\]
we get
\[
\boxed{
(1+3+3'+5)\downarrow_{A_4}
=
1+1'+1''+3+3+3
=
\mathbb R[A_4].
}
\]

Therefore
\[
\boxed{
\operatorname{Diag}_4
\cong
4_g\downarrow_{A_4},
}
\]
and
\[
\boxed{
\operatorname{OffDiag}_{12}
\cong
(1_Y+3_W+3'_C+5_C)\downarrow_{A_4}.
}
\]

This is the first exact sheet-level derivation of the Cathedral
\[
\boxed{16=4_{\rm geometry}+12_{\rm gauge}}
\]
split.

### Interpretation

After vacuum selection:

* **geometry is the diagonal response of the four sheets**;
* **gauge transport is inter-sheet transfer**.

The finer
\[
12=1+3+8
\]
splitting still requires the ancestral \(A_5\) projectors, Hodge orientation
and KO-6 finite algebra.  It is not determined by \(A_4\) alone.

The ordinary \(M_4\) commutator does not close the 12-dimensional
off-diagonal carrier, so the non-Abelian gauge brackets must still come from
the already-retained finite algebra rather than being invented from sheet
matrix multiplication.

## Quadrupole and vortex sectors from the same sheets

Because
\[
V_4|_{A_4}=1+3,
\]
the symmetric traceless and antisymmetric bilinears are

\[
\boxed{
\operatorname{Sym}^2_0(V_4)\downarrow_{A_4}
=
1+1'+1''+2\cdot3
}
\]
of dimension nine, and
\[
\boxed{
\Lambda^2(V_4)\downarrow_{A_4}=2\cdot3
}
\]
of dimension six.

Lifting back to \(A_5\),
\[
\boxed{\operatorname{Sym}^2_0(V_4)=4+5}
\]
and
\[
\boxed{\Lambda^2(V_4)=3+3'.}
\]

Thus one four-sheet transfer matrix has three canonical readings:
\[
\boxed{
16=1_{\rm trace}+9_{\rm quadrupole}+6_{\rm rotation}.
}
\]

The nine-dimensional quadrupole is exactly the retained traceless-Ricci
carrier; the six-dimensional rotation sector is exactly the Hodge/vortex
pair.

## Canonical sheet projector

Let \(D_\chi\) be the four diagonal sign matrices of the character group
\(\widehat K\).  Then
\[
\boxed{
\mathbb E_K(X)
=
\frac14\sum_{\chi\in\widehat K}
D_\chi X D_\chi^{-1}
}
\]
is an intrinsic conditional expectation onto sheet-diagonal response.

The explicit 16-dimensional superoperator is idempotent to machine precision
and has rank four.  Its complement has rank twelve.

Together with transpose,
\[
\Theta(X)=X^T,
\]
the joint ranks are
\[
\boxed{
4_{\rm diag},
\qquad
6_{\rm symmetric\ offdiag},
\qquad
6_{\rm antisymmetric\ offdiag}.
}
\]

So the same microscopic transfer admits both decompositions:
\[
\boxed{16=4+12}
\]
(geometry versus gauge after vacuum selection), and
\[
\boxed{16=1+9+6}
\]
(trace, quadrupole strain, rotation/vorticity).

These are two bases for the same object.

## Revised hierarchy

The corrected lattice stack is therefore

\[
\boxed{
D_6\ {\rm global\ icosahedral\ parent}
\supset
D_4\ {\rm local\ triality\ sheet\ layer}
}
\]

followed by
\[
\boxed{
D_4^\*/D_4\rtimes C_3
=
A_4
\subset A_5.
}
\]

Then
\[
\boxed{
\mathbb R^4_{\rm sheets}
\cong
V_4|_{A_4},
}
\]
and
\[
\boxed{
\operatorname{End}(V_4)
=
4_{\rm diagonal}
+
12_{\rm inter-sheet}.
}
\]

The ancestral \(A_5\)/Hodge/KO structure subsequently refines the twelve
inter-sheet modes to
\[
\boxed{1_Y+3_W+(3'+5)_C.}
\]

This is the strongest microscopic force/geometry unification obtained so far.
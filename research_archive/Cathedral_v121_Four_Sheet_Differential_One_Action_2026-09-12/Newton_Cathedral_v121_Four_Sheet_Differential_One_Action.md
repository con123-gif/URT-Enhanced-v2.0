# Newton's Cathedral / URT v121 — Four-Sheet Differential Calculus and One-Action Candidate
Date: 2026-09-12

## Main result

The v120 geometry/gauge split is not merely a decomposition of a \(4\times4\)
matrix.  It is the degree-zero / degree-one split of a canonical finite
differential calculus on the four-sheet space.

Let
\[
\mathcal A_\square=\mathbb C^4
\]
be the algebra of functions on the four \(D_4^\*/D_4\) sheets.  In the
vacuum-adapted basis let
\[
D_\square=J_4-I_4,
\]
the adjacency operator of the tetrahedron.

Because the four-sheet permutation representation is \(1\oplus3\), the
commutant of \(A_4\) on this space is two-dimensional.  Imposing zero diagonal
(no self-hop) leaves exactly one dimension.  Therefore

\[
\boxed{
D_\square=J_4-I_4
}
\]

is unique up to an overall scale among real symmetric, \(A_4\)-equivariant,
zero-diagonal sheet operators.

Its spectrum is

\[
\boxed{3,-1,-1,-1},
\]

the exact tetrahedral \(1\oplus3\) split.

## Gauge fields are finite differentials between sheets

For \(a,b\in\mathcal A_\square\), represent them as diagonal \(4\times4\)
matrices and define
\[
\delta_\square b=[D_\square,b].
\]

Then the represented one-forms are
\[
\Omega^1_{D_\square}(\mathcal A_\square)
=
\operatorname{span}\{a[D_\square,b]:a,b\in\mathcal A_\square\}.
\]

The explicit rank calculation gives

\[
\boxed{
\dim_\mathbb C\Omega^1_{D_\square}(\mathcal A_\square)=12.
}
\]

Moreover this span is exactly

\[
\boxed{
\Omega^1_{D_\square}(\mathcal A_\square)
=
\operatorname{OffDiag}(M_4(\mathbb C)).
}
\]

Indeed, for the sheet idempotents \(e_i\),
\[
e_i[D_\square,e_j]=E_{ij},\qquad i\ne j,
\]
up to the common hopping normalization.

Thus the v120 statement
\[
16=4_{\rm geometry}+12_{\rm gauge}
\]
has acquired a differential meaning:

\[
\boxed{
4=\Omega^0\quad\text{(sheet values / diagonal response)},
}
\]

\[
\boxed{
12=\Omega^1\quad\text{(finite inter-sheet differentials)}.
}
\]

The self-adjoint finite one-form space has real dimension twelve, exactly the
dimension of
\[
\mathfrak u(1)\oplus\mathfrak{su}(2)\oplus\mathfrak{su}(3).
\]

This dimension statement does not by itself supply those Lie brackets; the
retained KO-6 finite algebra supplies the non-Abelian bracket structure.

## Pair-groupoid formulation

The full matrix algebra
\[
M_4
\]
is the algebra of the pair groupoid of four sheets.

There are

\[
\boxed{4}
\]
identity arrows \(a\to a\) and

\[
\boxed{12}
\]
nonidentity arrows \(a\to b\), \(a\ne b\).

Therefore

\[
\boxed{
M_4
=
\{\text{four units}\}
\oplus
\{\text{twelve transitions}\}.
}
\]

Under the tetrahedral triality action this is exactly the v120
geometry/inter-sheet-gauge decomposition.

## Real left-right completion

The naive representation on \(H=\mathbb C^4\) does not satisfy the usual
finite first-order condition.  There is, however, a canonical repair using

\[
H_\square=M_4(\mathbb C)
\]

with Hilbert-Schmidt inner product.

Let the algebra act by left multiplication,
\[
\pi(a)=L_a,
\]
let the real structure be matrix adjoint so that the opposite algebra acts by
right multiplication, and define the finite Dirac superoperator
\[
\mathscr D_\square=\operatorname{ad}_{D_\square}.
\]

Then
\[
[\mathscr D_\square,L_a]=L_{[D_\square,a]},
\]
which commutes with every right multiplication \(R_b\).  Hence

\[
\boxed{
[[\mathscr D_\square,L_a],R_b]=0
}
\]

exactly.

The explicit \(16\times16\) calculation gives zero first-order residual and
again a twelve-dimensional represented one-form carrier.

So the four-sheet differential picture admits a consistent left-right real
completion rather than relying on the invalid minimal representation.

## The same object gives strain and rotation

The transfer algebra also has the transpose decomposition

\[
M_4
=
\mathbb RI
\oplus
\operatorname{Sym}^2_0(V_4)
\oplus
\Lambda^2(V_4).
\]

Thus

\[
\boxed{
16=1+9+6.
}
\]

In the four-sheet basis this is refined to

\[
\boxed{
1
+
3_{\rm relative\ diagonal\ strain}
+
6_{\rm symmetric\ intersheet}
+
6_{\rm antisymmetric\ intersheet}.
}
\]

Hence

\[
9_{\rm quadrupole}
=
3_{\rm relative\ sheet\ strain}
+
6_{\rm symmetric\ transitions},
\]

while

\[
6_{\rm rotation/vorticity}
=
6_{\rm antisymmetric\ transitions}.
\]

Restoring \(A_5\),

\[
\boxed{
\operatorname{Sym}^2(V_4)=1+4+5,
}
\]

\[
\boxed{
\Lambda^2(V_4)=3+3'.
}
\]

Therefore the physical sectors can be written

\[
\boxed{
\operatorname{Sym}^2(V_4)
=
1_Y+4_g+5_C,
}
\]

and

\[
\boxed{
\Lambda^2(V_4)
=
3_W+3'_C.
}
\]

This is a strong structural statement:

* hypercharge is the scalar symmetric gauge channel;
* gravity is the quartet symmetric response;
* the color fiveplet is quadrupolar;
* the weak triplet and color triplet are rotational/Hodge channels;
* color \(8=3'+5\) necessarily straddles rotation and quadrupolar strain.

Thus weak, color, hypercharge and gravity are not attached to unrelated
microscopic tensors.  They are symmetry-selected pieces of symmetric and
antisymmetric response of one four-sheet transfer algebra.

## Information metric

At the retained two-quartet state
\[
\rho_\star=aI_4\oplus bI_4
\]
the BKM / relative-entropy Hessian on
\[
\operatorname{Hom}(4_3,4_5)\cong M_4
\]
is scalar:

\[
\boxed{
g_{\rm BKM}
=
\chi_{35}I_{16},
}
\]

with
\[
\boxed{
\chi_{35}
=
8\eta_\Delta\frac{1+\Delta^2}{1-\Delta^2}
\approx47.96697830338.
}
\]

So before the symmetry projectors refine the sectors, all sixteen transfer
directions are measured by the same local information metric.

This is the first exact candidate for a common local stiffness of geometry and
all gauge carriers.

It should be interpreted as a field-space metric / Hessian, not automatically
as a physical mass term.

## One-action candidate

The natural unified object is now a superconnection

\[
\boxed{
\mathbb A
=
d_{\rm base}
+
\delta_\square
+
X,
}
\]

where

\[
\delta_\square=[D_\square,\cdot],
\qquad
X=e+\mathcal A.
\]

Here the diagonal component of \(X\) is the coframe/geometric response and the
finite one-form component is inter-sheet gauge transport.

Its generalized curvature is

\[
\boxed{
\mathbb F=\mathbb A^2.
}
\]

The most economical bosonic candidate is therefore not a separately written
gravity action plus three separate gauge actions, but one invariant functional
of the fluctuated operator / generalized curvature, for example

\[
\boxed{
S_{\rm bos}
=
\operatorname{Tr}
h\!\left(\frac{|\mathbb D_X|}{\Lambda}\right)
}
\]

with the already-retained fermionic KMS entropy cutoff, or at the local
quadratic level

\[
\boxed{
S^{(2)}
=
\frac12\langle\mathbb F,\mathbb F\rangle_{\rm BKM}.
}
\]

If the KMS spectral-action premise is used, its moments are already fixed:

\[
f_0=\ln2,\qquad
f_2=\frac94\zeta(3),\qquad
f_4=\frac{225}{8}\zeta(5).
\]

What v121 proves is the finite carrier, differential calculus, first-order
compatibility and common information metric.  It does **not** yet prove that
the nonlinear continuum limit of this one functional is uniquely
Einstein-Hilbert plus the Standard Model Yang-Mills action.

That continuum statement remains the decisive physical gate.

## Current unified chain

\[
\boxed{
D_6
\supset D_4
\to
D_4^\*/D_4
\rtimes C_3
\simeq A_4
\subset A_5
}
\]

\[
\downarrow
\]

\[
\boxed{
\mathcal A_\square=\mathbb C^4
\xrightarrow{[D_\square,\cdot]}
\Omega^1_\square
}
\]

with

\[
\boxed{
\dim\Omega^0=4,\qquad
\dim\Omega^1=12.
}
\]

Then

\[
\boxed{
M_4
=
4_{\rm geometry}
+
12_{\rm intersheet}
}
\]

and simultaneously

\[
\boxed{
M_4
=
1_{\rm scalar}
+
9_{\rm quadrupole}
+
6_{\rm rotation}.
}
\]

Finally \(A_5\)/Hodge/KO-6 refines this to

\[
\boxed{
4_g+1_Y+3_W+(3'+5)_C.
}
\]

This is now a differential, rather than merely dimensional, unification of the
four-sheet substrate with geometry and gauge transport.
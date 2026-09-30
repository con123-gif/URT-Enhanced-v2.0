# Newton's Cathedral / URT v119 — Klein Quadruple-Lattice Force Bridge
Date: 2026-09-12

## Breakthrough

The four parent cosets do **not** correspond one-to-one to gravity, U(1),
SU(2), and SU(3).  That tempting assignment fails a finite representation
test.

The actual bridge is stronger.

The parent lattice has
\[
D_6^\*/D_6\cong\mathbb Z_2^2.
\]

After the already-required vacuum selection
\[
A_5\to A_4,
\]
the selected tetrahedral group \(A_4\) contains a unique normal Klein
subgroup
\[
K\cong\mathbb Z_2^2.
\]

The \(A_5\) quartet has character \(4\) on the identity and \(0\) on the
double-transposition class.  Since the three nonidentity elements of
\(K\) are precisely double transpositions,
\[
\boxed{V_4\downarrow_K\cong\mathbb R[K],}
\]
the regular representation of the four-sheet group.

Thus the abstract parent quotient and the local quartet are connected
after vacuum selection:
\[
\boxed{
D_6^\*/D_6\cong K\triangleleft A_4\subset A_5.
}
\]

The isomorphism is unique only up to an automorphism of \(K\), which merely
permutes the three nonzero sheet labels unless extra \(D_6\) quadratic data
are retained.

## Restriction theorem

For any \(A_5\) irrep of dimension \(d\) with character \(c\) on the
double-transposition class,
\[
m_{\rm triv}=\frac{d+3c}{4},
\qquad
m_{\rm nontriv}=\frac{d-c}{4}
\]
for each of the three nontrivial Klein characters.

Therefore:
\[
\boxed{
1\downarrow_K=\chi_0,
}
\]
\[
\boxed{
3\downarrow_K
=
3'\downarrow_K
=
\chi_a\oplus\chi_b\oplus\chi_c,
}
\]
\[
\boxed{
4\downarrow_K
=
\chi_0\oplus\chi_a\oplus\chi_b\oplus\chi_c
=
R_K,
}
\]
\[
\boxed{
5\downarrow_K
=
2\chi_0\oplus\chi_a\oplus\chi_b\oplus\chi_c.
}
\]

## Force unification in the four-sheet basis

The v117 transfer carrier is
\[
\operatorname{End}(V_4)
=
4_g\oplus1_Y\oplus3_W\oplus(3'\oplus5)_C.
\]

Restricting to the parent Klein subgroup gives

\[
\boxed{
4_g\downarrow_K=R_K,
}
\]

\[
\boxed{
(1_Y\oplus3_W)\downarrow_K=R_K,
}
\]

and

\[
\boxed{
(3'\oplus5)_C\downarrow_K=2R_K.
}
\]

Hence
\[
\boxed{
\operatorname{End}(V_4)\downarrow_K
=
R_K^{\oplus4}.
}
\]

Equivalently,
\[
\boxed{
16
=
4_{\rm gravity}
+
4_{\rm electroweak}
+
8_{\rm color}
=
1R_K+1R_K+2R_K.
}
\]

This is the exact relation between the quadruple lattice and the interaction
sectors.

The four sheets are not four different forces.  **Every interaction sector
is built from the same four-sheet pattern.**  Gravity contains one copy,
electroweak contains one copy, and color contains two copies.

The physical \(4|1|3|8\) split is the \(A_5\)/KO-6 recombination of these
common sheet modes.

## Quadratic origin of strain and rotation

Because \(V_4|_K=R_K\), the bilinears of the four-sheet carrier give

\[
\operatorname{Sym}^2(R_K)
=
4\chi_0
\oplus2\chi_a
\oplus2\chi_b
\oplus2\chi_c,
\]
and therefore
\[
\boxed{
\operatorname{Sym}^2_0(R_K)
=
3\chi_0
\oplus2\chi_a
\oplus2\chi_b
\oplus2\chi_c
}
\]
of dimension \(9\).

Likewise
\[
\boxed{
\Lambda^2(R_K)
=
2\chi_a\oplus2\chi_b\oplus2\chi_c
}
\]
of dimension \(6\).

Under the restored \(A_5\) organization these are precisely
\[
\boxed{
\operatorname{Sym}^2_0(V_4)=4\oplus5
}
\]
and
\[
\boxed{
\Lambda^2(V_4)=3\oplus3'.
}
\]

Thus the quadruple sheet structure generates the correct dimensions and
tensor types for

* quadrupolar strain / traceless Ricci: \(9=4+5\);
* rotational / Hodge / vortex modes: \(6=3+3'\).

This is the exact mathematical place where the quadruple lattice,
quadrupole gravity, Hodge chirality and gauge sectors meet.

## No-go that fixes the interpretation

Suppose instead one tried to make the four characters of \(K\) themselves
be the four forces with dimensions \(4,1,3,8\).

For a four-dimensional \(K\)-module
\[
V=\bigoplus_a n_a\chi_a,
\qquad\sum_a n_a=4,
\]
the induced conjugation representation on \(\operatorname{End}(V)\) has
multiplicities
\[
m_g=\sum_a n_a n_{a+g}.
\]

Exhausting all integer multiplicities \(n_a\) gives **no solution** whose
four eigenspace dimensions are \(4,1,3,8\).

Therefore:
\[
\boxed{
\text{four sheets}\neq\text{four forces}.
}
\]

The correct statement is
\[
\boxed{
\text{four sheets}
\to
\text{quadratic transfer algebra}
\to
A_5\text{ irreducible recombination}
\to
4+1+3+8.
}
\]

## Consequence

The unified microscopic hierarchy is now

\[
D_6^\*/D_6
\cong K
\triangleleft A_4
\subset A_5
\]

followed by

\[
V_4|_K=R_K,
\]

\[
R_K\otimes R_K
\longrightarrow
\operatorname{End}(V_4),
\]

and finally

\[
\operatorname{End}(V_4)
=
4_g+1_Y+3_W+(3'+5)_C.
\]

The same four-sheet substrate therefore underlies geometry, electroweak
transport and color.  The differences between the interactions arise from
how the \(A_5\)/Hodge/KO structure recombines common sheet modes, not from
assigning a separate microscopic lattice to each force.
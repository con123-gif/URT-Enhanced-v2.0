# Compact C: the top Ribet coefficient clears the actual denominator

Status: **source-matched human reconstruction; compact native replay pending**.

This is the continuation of `2026-11-26_COMPACT_CYCLOTOMIC_TRIANGLE_GUARD.md`.
It reconstructs the proof of the root-reachable implication
`BaseLevel.exists_diagOp_mem_ellIntegralForms`; it does not reprove the
string condition, the Ribet-element supplier, the local chain lemma, or RH.

## Pin and exact consumer

Primary source: `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, paths relative to
`grh-compact/src`.

| role | source declaration/path | blob |
|---|---|---|
| compact theorem | `BaseLevel.exists_diagOp_mem_ellIntegralForms`, `New/Patching/OnePrimeTie.lean:185-304` | `d161966411413f049b0ae5a6baee8fdd4bcc0a26` |
| trace/Ribet contracts | `IsTraceIdeal`, `IsRibetElement`, `New/Selmer/RibetFirstOrder.lean:65-77` | `a05cb18d1ee62520f104d41361099db4b23cbe1f` |
| actual caller | `denominatorLe_rowBudget`, `New/Selmer/DenominatorBound.lean:120-155` | `5889d96fe1a6ad7926e0df09a7d183232f91c534` |
| integral lattice | `BaseLevel.ellIntegralForms`, `Lib/Adelic/CuspForms/BaseLevel.lean:154-158` | `8f40270007336cd115be6036dd944cebeb101787` |
| Higman operator | `exists_higman_operator`, `Lib/LocalGL/TaylorWiles/AuxPlaceOperators.lean:96-124` | `905dede2e2c55699cc10d9487e02690016ff426a` |

The readable companion `grh/New/Congruences/FirstOrder/AuxiliaryPrimeTie.lean`
explains the same top-coefficient mechanism, but its statement is not used as
a substitute: the compact theorem has already absorbed the old family of
functions and indicator into the single pair `b,p` and the hypotheses below.

Fix the exact compact inputs: a finite auxiliary set `J`, depth `nu`, base
level `D`, a set `X` of systems with a point `pi`, a function `b`, a polynomial
`p`, local string polynomials `e_j`, nonzero string length `t`, and scalars
`c,m`.  Assume:

1. the quantified root-string condition `he` for every `j` and every base
   system `x` satisfying `p(b(x)) != 0` and the stated congruence-to-`pi`
   condition;
2. the exact depth divisibility
   \[
   2(card(n))!\,(p(0)c^2)^{|J|+1}\mid ell^nu;                 \tag{D}
   \]
3. for **every** trace algebra and trace ideal satisfying `IsTraceIdeal`, a
   Ribet element `d` with
   \[
   v_ell(md)\le gamma.                                      \tag{R}
   \]

The conclusion is one function `s` with `v_ell(m s(pi)) <= gamma`, and,
uniformly for every base-level `l`, natural `d`, and base-level `y`,

\[
d l\in L_{ell},\quad y\text{ supported on }X,\quad
y=l\text{ on }\{x:p(b(x))\ne0\}
\Longrightarrow d c\,\operatorname{diag}(s)y\in L_{ell}.  \tag{I}
\]

Here the two displayed support/agreement clauses mean exactly the two
universal `diagOp` annihilation/equality hypotheses on source lines 199-201;
they are not pointwise equalities silently substituted for those hypotheses.

## 1. Descend the Ribet family and keep its top coefficient

Let `psi` evaluate a multivariable polynomial over the Hecke algebra at every
eigensystem.  The proof defines the trace ideal to be the image under `psi`
of the span of precisely the two native generator families:

\[
ell^nu\,\operatorname{tr}N_x(g),\qquad
\operatorname{tr}((N_x(tau_j)-1)N_x(g))
-X_j\operatorname{tr}(((X-1)e_j)(N_x(phi_j))N_x(g)).         \tag{1}
\]

The hypotheses `charpoly_mem_heckeAlgebra` and `traceElem` verify the four
clauses of `IsTraceIdeal`; no abstract ideal is chosen after the fact.  Apply
`rib` to this exact image ideal.  Unpacking `IsRibetElement` gives a polynomial
`f`, a preimage `F` in the tied ideal, and the top multi-index

\[
o=\sum_{j\in J}[j],                                         \tag{2}
\]

such that on `X`

\[
b=0,\qquad f_d=0\ (d<o),\qquad f_o(pi)=d,                   \tag{3}
\]

where the last `d` is the Ribet coefficient in (R).  Taking the constant
coefficient in the first image relation lifts the function `b` itself to the
Hecke algebra.  Coefficientwise extensionality of the resulting
Hecke-algebra-valued functions then gives the exact identity

\[
F=C(b)f.                                                     \tag{4}
\]

Thus (4), not merely its evaluation at `pi`, lies in the tied ideal.

For every system that can be separated from `pi`, choose a Hecke operator
`u_x` with `u_x(x)=0` and `|u_x(pi)|>=1`, and put

\[
A=\prod_xu_x,\quad k=|J|+1,\quad T=A\,p(b),\quad P=c^2T,
\quad s=A^k f_o.                                             \tag{5}
\]

Every factor of `A(pi)` has norm at least one, so multiplying the top
coefficient cannot increase its `ellVal`.  Equations (3) and (5) therefore
give

\[
v_ell(m s(pi))\le v_ell(mf_o(pi))=v_ell(md)\le gamma.        \tag{6}
\]

## 2. Cancel the scalar discrepancy before any norm

The source next uses the following exact algebra, before applying a quotient,
valuation, or norm.  Since `p(b)-p(0)` is divisible by `b`, there is `q` with
`p(b)=p(0)+bq`.  Put `lambda=p(0)c^2`.  Then

\[
P=c^2A(p(0)+bq)=lambda A+b(c^2Aq),
\]
and hence

\[
\boxed{\quad b\mid P^k-lambda^kA^k.\quad}                  \tag{7}
\]

This is the decisive cancellation in this leaf.  In the Lean body it is the
`Ideal.Quotient.eq_zero_iff_dvd` witness `v,hv` on lines 220-223.  Taking an
absolute value first would lose the ideal factor `b` needed to combine (7)
with (4).

Write the depth hypothesis (D) as

\[
ell^nu=kappa\,lambda^k w,\qquad kappa=2(card(n))!,           \tag{8}
\]

for an integral `w`.  The same `lambda`, exponent `k`, and normalising scalar
`c` must be kept through the remainder of the proof.

## 3. Represent denominator clearing by one quotient module

Lift `l` and `y` from base level to the auxiliary level.  The proof forms the
cyclic quotient module `B` obtained from the auxiliary-level forms by the
`ell^nu` multiple of the line generated by `l`, with induced action `sigma`
of integral endomorphisms.  It constructs `z in B` and proves

\[
ell^nu B=0,                                                  \tag{9}
\]

and, for every Hecke element `r` divisible by the SAME `T` from (5),

\[
\sigma(r)\sigma\!\left(\sum_g\rho(g)\right)z=0
\Longleftrightarrow
\exists V\in\operatorname{End}_{int}:\
ell^nu V(l)=c\,r(y).                                        \tag{10}
\]

Equation (10) is source lines 227-237.  The reverse implication uses exactly
the support/agreement hypotheses in (I); it is not generic semisimple
diagonalisation.

Higman's operator supplies `Psi` with the finite-group average equal to `c`.
For every auxiliary prime, `exists_tie` supplies an integral local operator
`F_j`; let

\[
M_j=\sum_g\rho_j(g).
\]

Because different auxiliary places commute, the noncommutative product
`Theta_d` may choose `F_j` when `d_j=0`, `M_j` when `d_j=1`, and zero when
`d_j>1`.  It obeys the three exact relations

\[
\Theta_o=\sum_g\rho(g),\qquad d\nleq o\Rightarrow\Theta_d=0, \tag{11}
\]

\[
\sigma(F_j)t=\sigma(M_j)r,\ \sigma(M_j)t=0
\Rightarrow \Theta_dt=\Theta_{d+[j]}r.                      \tag{12}
\]

The root-string hypothesis is used here, through `exists_tie`, rather than
in the earlier coefficient descent.

## 4. The tied product leaves only the top monomial

The induction on `n`, using (12), the local tie relations and the Higman
identity proves the source's `F2` statement:

\[
k\le |d|+n,\quad
\Theta_o\sigma(T)z=0
\Longrightarrow
\sigma(P^n)\Theta_dz=0.                                    \tag{13}
\]

Define the coefficient functional

\[
L(G)=\sum_{d\le o}\Theta_d\,\sigma(\operatorname{Hecke}(G_d)). \tag{14}
\]

It sends a monomial `X^d r` to `Theta_d sigma(Hecke(r))`.
For the chosen element `G=C(v)F` in the tied ideal, induction over the span
defining that ideal, using (9), (12), and the two generator families (1),
gives

\[
kappa L(G)=0\qquad(G\text{ in the tied ideal}).              \tag{15}
\]

Here (15) is asserted for this chosen `G`, not as a freestanding identity on
every polynomial.  Substitute `C(v)F=C(vb)f`, using (4) and the divisor
witness `v` from (7).  For every coefficient strictly below `o`, (3) and the
support of `y` make its Hecke action zero.  Coefficients not below `o` vanish
by (11); all remaining non-top terms vanish by (13).  Therefore only

\[
A^k f_o=s                                                       \tag{16}
\]

survives in (14).  Combining (7), (8), (10), and (15), then cancelling the
nonzero scalar `lambda^k`, yields an integral endomorphism `V` whose value on
`d l` is exactly

\[
V(d l)=d c\,\operatorname{diag}(s)y.                          \tag{17}
\]

Since `V` preserves `ellIntegralForms` and `d l` is integral, (17) proves
(I).  This cancellation is performed as equality in the module before the
final lattice-membership step.

## Actual caller and remaining premises

`denominatorLe_rowBudget` supplies `b=q(x).1.2`, the annihilating polynomial
`p=z'`, the predicate `X`, the point `pi`, the depth (D), and the universal
Ribet supplier `ribet_columns`.  It then defines
`E_s=diagOp(s) o toSmoothForm`.  Its lines 139-162 discharge the two exact
support/agreement clauses for the tested comparison form, and lines 163-166
convert the resulting integrality into the pairing bound required by the
subsequent Gram-determinant argument.

This closes the human explanation of the implication from the Ribet
coefficient to the single integral diagonal operator.  It does **not** close
the retained premises: `he` (root strings), (D), the universal
`ribet_columns` estimate, the local chain lemma inside `exists_tie`, or the
caller-specific test-form orthogonality on lines 139-162.

## Checks and failed shortcuts

- Checked the five blobs above at the compact pin.
- Exhaustively checked 121,500 integer instances of (7), including zero and
  negative coefficients where divisibility is defined.
- Checked all 255 subsets containing the top element for index sets of sizes
  one through eight, verifying the finite-sum top-survival step.
- `git diff --check` passed.
- Rejected: replacing the universal trace-ideal premise by one chosen ideal;
  choosing `s=f_o` and dropping `A^k`; exchanging the support and agreement
  quantifiers; taking norms before (7); identifying `k=|J|+1` with the
  exponent from a different Ribet construction; or treating (15) as a
  freestanding polynomial identity.
- Local `lean`, `lake`, and `elan` are unavailable.  The companion interface
  is **PREPARED**, not a native PASS.  The compact environment does not import
  the repository's older `rh_scan/rh_prune/rh_auto` command modules, so no
  engine output is claimed; the exact algebraic reduction (7), support
  pruning (11)-(16), and caller specialization were performed manually.

## RESUME HERE

Reconstruct the caller-specific final block in `denominatorLe_rowBudget`,
source lines 133-162: prove why a weak lift orthogonal to both the selected
cut and the impostor Hecke kernel lies in the impostor space, so the second
agreement hypothesis of (I) holds for the SAME `E_s`, label projector,
comparison family, and test form.  Preserve all quantifiers over `s`; do not
replace the isotypic argument by pointwise equality of forms.

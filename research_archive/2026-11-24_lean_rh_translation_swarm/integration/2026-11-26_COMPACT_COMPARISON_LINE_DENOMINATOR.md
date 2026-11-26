# A common denominator for the actual comparison line

26 November 2026. Source-matched human derivation; independent audit and
native replacement replay outstanding. This expands LineArithmetic,
the quantitative input explicitly retained in dependency RUN52's
comparison-form construction. Attribution: Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude.

Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

| Source | Actual supplier | Blob |
|---|---|---|
| New/Rows/LineArithmetic.lean | lineMultiplier_integral_and_small | f6235933aecfcf1a1c82be94b4ad3edbe5057794 |
| New/Rows/LineCoordinates.lean | coordinates, degree, coefficient denominator and norm | fe2cbde49a8d88f37308a8c28f742efb73a7d6a0 |
| New/Rows/MemberKernels.lean | uniform scaled theta-jet estimate | be36c0175fe559376780b105052249fc0c9f1f4f |
| Lib/Weil/DualPair/TwoLineTerms.lean | negation phase identity | 06a335214712d21667b42fb333de2b087a9c3f1d |
| Lib/Adelic/Hecke/ClassSumBounds.lean | stabilizer denominators and class norms | c6139c29f46898cb1444d94e1960844722647d66 |
| New/Columns/SizeEstimates.lean | class counts | 0b666c5f3cead375b65b97c6af8a25675486b473 |
| New/Data/ChosenPlaceLevels.lean | common stabilizer divisor | d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3 |

## 1. Statement with the order of quantifiers

Fix $D$ and $1\le j\le m$. Write $y_{\vartheta,i}(h)$ for the
ACTUAL coefficient vector Data.lineMultiplier of LineCoordinates.
There is ONE $\beta_j\ne0$, depending only on $D,j$, such that:

1. For every member $i$, tame twist $\vartheta$, prime $p$ coprime
   to $\vartheta.\mathrm{levelNorm}$ and embedding into
   $\mathbb C_p$, the vector
   $\overline{\beta_j y_{\vartheta,i}(h)}$ has Weyl gauge at most 1
   at $h$.
2. If $\vartheta.Q=\varnothing$, then for every
   $\sigma\in\operatorname{Aut}(\mathbb C)$,
   $$
    \|\sigma(\overline{\beta_j y_{\vartheta,i}(h)})\|_{\mathrm{Weyl}}^2
                         \le \exp(R_D B_0),
    \quad B_0=\frac{f a(\log b)^3}{m k}.             \tag{L1}
   $$

The rational changes of lattice used to test a gauge may depend on
$p,h$ and the embedding. The scalar $\beta_j$ may not.

## 2. Inputs: exactly which theta and polynomial estimates are used

Put $g=g_0g_1$, $M_K=\mathrm{chosenGroupOrder}$. For each fixed pair
of ranks and homogeneous polynomial degree $d$, MemberKernels gives
a nonzero $c_d$, chosen before the modulus, character and finite
datum, with the following two properties for definite theta kernels:

* If $qg^2\in\mathfrak m$, the finite datum is integral away from
  $q$, the two finite points are integral above $p\nmid q$, and
  the polynomial has integral coefficients there, then the scaled
  kernel $c_d\theta$ is integral there.
* When $q=1$, both ranks are at most $40k$ and $d\le g$, its norm
  under EVERY complex automorphism is at most
  $\exp(x_1)M B$. Here $M$ bounds every conjugate of the finite
  datum, and $B$ bounds the polynomial on entries of norm at
  most $g^4$.

This is the exact uniform CM theta-jet input. Its algebraicity,
integrality, Cauchy estimate and rational covariance remain explicit
inputs of the present lemma, rather than being inferred from a
formal manipulation of the line.

The line coordinate polynomial is obtained from products of the
specified stacked determinants by the same Schur coordinate map.
LineCoordinates supplies a degree $d$ and an integer

$$
 d\le d_0=31m\sum_\tau|\mathrm{DetIndex}_{j,\tau}|,\qquad
 0<H\le d^{3d},                                    \tag{L2}
$$

such that every $H Q_l(Y)$ is homogeneous of degree $d$ and has
coefficients in EVERY subring containing all $\tau(Y_{ab})$.
For $d=0$ the displayed source bound has its natural convention
$0^0=1$; then $H=1$. No choice depends on $Y,i,l$ or a twist.
The integral Schur/Fock duality matrices show why this is a common
denominator: their product is the hook-number scalar, so multiplying
the coordinate identity by that scalar expresses every coordinate
as an integral combination of coefficients of the determinant
product. Homogeneity follows before specialization.

If the entries of $Y$ and the variables have all the specified
conjugate norms at most $g^4$, the same coordinate vector has

$$
 \|Q(Y)\|_{\mathrm{Weyl}}^2\le g^{9d_0}.             \tag{L3}
$$

These are the actual weight coordinates, not coefficients in an
unrelated monomial norm.

## 3. Construct the common scalar and remove the phase first

In LineCoordinates, $y_{\vartheta,i}$ is the product of a
negative definite theta constant and a class sum of a coefficient
theta kernel multiplied by carrierXi. Expanding carrierXi gives
a second definite class sum and a third theta kernel. The three
rank pairs are

$$
 (m,3m),\qquad (j,|V''|),\qquad (|L^+|,|V''|),
$$

with polynomial degrees $0,0,d$. Choose the uniform theta
constants $c_0,c_1,c_2$ for these three fixed pairs.
The negative-pair identity gives a fixed nonzero phase
$\epsilon$ such that the negative kernel times $\epsilon$
is the conjugate of the corresponding positive kernel.
It holds for all characters, finite data and points.

Choose

$$
 \beta_j=M_K^2\,c_2\,H\,c_0\,\overline{c_1}\,\epsilon .
                                                               \tag{L4}
$$

This is exactly the source choice. Every factor is nonzero,
and it depends on $D,j$ only. Use the negation identity to
rewrite $\beta_jy_{\vartheta,i}$ BEFORE applying a valuation
or a complex automorphism. After rewriting, its terms are
products of the three SCALED definite kernels and the vector
$H Q_l(Y)$, in two weighted definite class sums, multiplied
by $M_K^2$.

This order is essential: $|\epsilon|=1$ in the original complex
embedding does not by itself imply
$|\sigma(\epsilon)|=1$ for an arbitrary automorphism. The phase
has already cancelled in the identity being estimated, so no
such claim is needed. Likewise the unscaled constants $c_i$
need no separate all-conjugate estimate.

## 4. Integrality at every allowed prime

Fix $p\nmid q=\vartheta.\mathrm{levelNorm}$ and one embedding into
$\mathbb C_p$. The finite modulus contains $qg^2$. The first two
finite data are a singleton and a change of its variables by
the unit of norm $-1$; they are integral. The third is
lPlusDatum. It is a sum of additive-character values on its
specified support; these are roots of unity and are integral
at every prime. No division by its number of summands occurs.

At each of the three finite points choose the usual rational
unitary change making it integral above $p$. Rational covariance
of the kernel changes its polynomial by the actual two-sided
substitution and its determinant character by the weight factor.
The latter is exactly the weight action in the Weyl gauge.
The line's short matrix $Y$ is an integral frame of its class
lattice. After the same rational change its entries are integral,
so the subring assertion in (L2) makes $H Q_l(Y)$ integral.
The stacked-determinant substitution is equivariant with this
same change; one may not substitute a separately chosen short
matrix at each coordinate.

Apply the local theta bound in §2 to each of the three scaled
kernels. Their product is integral. A weighted class sum has
terms divided by the corresponding stabilizer orders. For
every definite rank in these sums, the actual Minkowski/reduction
lemma gives

$$
 |\operatorname{Aut}(\text{class})|\mid M_K .
$$

Thus $M_K$ clears each class sum; $M_K^2$ clears the two sums
in (L4). The ultrametric inequality now gives gauge at most 1.
This proves the first clause for the already fixed $\beta_j$.
The argument works also at $p\mid g$ because the modulus
condition contains $g^2$; the only prime exclusion is $p\nmid q$.

## 5. The untwisted all-conjugate bound

Suppose $Q=\varnothing$. The following estimate is for the same
rewritten expression as in §4 and every $\sigma$, including
its composition with complex conjugation. The short basis
bound, transported through the actual field embeddings,
puts the entries used in (L3) in the ball of radius $g^4$.
Duality for the Weyl norm lets the third kernel be bounded
using (L3) instead of bounding coordinates separately.
Each scaled kernel contributes $\exp(x_1)$. The two class
sums contribute at most their class cardinalities to the
square-root norm. The finite lPlusDatum contributes at most
$|\mathrm{GL}_{3m}(R_0)|$, where $R_0$ is the untwisted
residue ring. The norm of the polynomial contributes at
most $H g^{9d_0/2}$.

Consequently the logarithm of the square-root norm is at most

$$
 3x_1+2\log M_K
   +\log C_1+\log C_2
   +\log|\mathrm{GL}_{3m}(R_0)|
   +\log H+\tfrac92 d_0\log g.                     \tag{L5}
$$

This uses the finite class sums with their actual rational
weights; their denominators have absolute value at most 1
archimedeanly.

Here is an explicit sufficient simplification of (L5), rather
than leaving its final budget as an unspecified comparison.
Put $X=\log x$, $Y=\log x_1$ and $B=\log b$. The data give

$$
 B\ge10^{12}X,\quad B\ge10^6Y,\quad
 100\log B\le X,\quad
 \sqrt x\le m\le2\sqrt x,\quad R_D\le3x^5 .
$$

The native magnitude bounds give
$f\le e^{P.c}x^{11}B^{1/5}$,
$b_1,b_2\le e^2b$, $h+mh\le b$.
The last inequality follows by inserting $h=2R_D^8$ and
the preceding $m,R_D,B$ bounds. Thus

$$
 d_0\le600mfb,\quad \log d_0\le2B,\quad \log g\le22B.
$$

When $d=0$, use $\log H=0$. Otherwise (L2) implies
$\log H\le6d_0B$. The degree and rank guards in §2 hold:
these fixed ranks are at most $40k$ and
$d\le d_0\le g$ by the same magnitude bounds.

The source stabilizer estimate is
$\log M_K\le x^{32}$, and the two full-level class counts
obey $\log C_i\le x^{30}$.
For the untwisted residue ring,
$|R_0|\le g^{2f}$ suffices; hence

$$
 \log|\mathrm{GL}_{3m}(R_0)|
       \le18fm^2\log g\le x^{34}.
$$

The last inequality follows from $B\le x^{1/100}$,
the displayed bound on $f$, and
$P.c\le10^{-12}\log B$; the scale is larger than all the
fixed numerical constants in this comparison. In particular
one can first use $f\le x^{12}$ to bound that term by
$1584x^{13.01}\le x^{34}$. The first six terms of (L5)
are then at most $8\exp(10^{-6}B)\le\exp B=b$:
$x_1\le\exp(10^{-6}B)$ and
$34X\le34\cdot10^{-12}B<10^{-6}B$, while $B>3$.

Thus (L5) is at most

$$
 b+105d_0B\le10^5mfbB.
$$

Squaring the norm doubles this exponent. Finally, using
$a\ge xb$, $k\le R_D$ and $m^2\le4x$,

$$
 \frac{R_DB_0}{mfbB}
 =\frac{R_D}{k}\frac{aB^2}{m^2b}
 \ge\frac{B^2}{4}>2\cdot10^5.
$$

This proves (L1) with the ORIGINAL budget $R_DB_0$ for the
same scalar $\beta_j$. No extra twist-dependent denominator
or comparison period is selected.

## 6. Actual comparison-form caller and verification boundary

Take lineScale equal to the scalar (L4) and the coefficient
vectors just proved integral and small. In ComparisonForms,
the glued Cartan product costs $|g|_p^{-\mathrm{loss}}$;
its explicit prefactor $g^{\mathrm{loss}}$ cancels that cost.
The row-fixing class stabilizers are trivial. Tables integral
at the conjugate embedding therefore produce integral
comparison forms off the conductor. At the trivial twist,
the same norm bound, hook-number inequality and class-count
estimate give the native comparisonForm squared norm
$\le \exp(2R_DB_0)$ times the table norm divided by its
specified hook number.

The common-adjoint descent, surjectivity and testedness are
the existing dependency RUN51/52 construction; they keep
this SAME lineScale and comparison map. The present result
supplies its line denominator and norm, not new surjectivity
or period-vanishing arguments.

The underlying uniform CM theta-jet bound, integral Schur
coordinate duality, short-basis/class-count estimates and
rational covariance are explicit inputs. Source bodies
were inspected at the pin. No new Lean execution or
independent mathematical audit is claimed.

RESUME HERE: audit (L5) and all-conjugate phase cancellation
at LineArithmetic, then the remaining period-vanishing/
carrier inputs or the deep Kisin cut/cokernel suppliers.
Do not replace the common scalar by independent choices.

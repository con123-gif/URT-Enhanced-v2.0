# The tame tensor polynomial and the actual local-loss payment

26 November 2026. Source-matched human derivation, pending independent
audit and native replacement replay. This supplies the tensor-degree
and datum-size/payment checks retained by Galois RUN55 and the
independent tame-cokernel audit 129d788f. Their descent is reused,
including its common correction and its necessary factorial +1.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

| Actual source | Role | Blob |
|---|---|---|
| Lib/PadicHodge/Crystalline/PairingDefs.lean | exists_isKilledBy_tateDual_tensor | f977b856d5aa41125d21f6629a5f144d2da094d4 |
| New/Lift/ExponentTheorems.lean | tame_types_exponent | 00f2467f84012fb67b4788ace502a70c5d4eedfc |
| New/Selmer/OnePlaceDefect.lean | actual tame branch | 709e688740863f10dbbb284446ca20c0ba2a280a |
| New/Selmer/DeterminantBound.lean | IsRowType and loss | 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df |
| New/Data/AdmissibleData.lean | actual ranks, primes and scales | 04208a5044bb7cf6464ef142a14d939148bed834 |
| New/Data/Magnitudes.lean | explicit scale consequences | 306fe7e22378322422d11b1f8415fcdac75ffd6e |

## 1. One integral polynomial of degree the product

Let monic $q,r\in\mathbb Z_p[X]$ annihilate the two
degree-zero Weil operators $A,B$. Put $d=\deg q$,
$d'=\deg r$. The algebra

$$
 C=\mathbb Z_p[x,y]/(q(x),r(y))
$$

is finite free of rank $dd'$, with the monomial
basis $x^iy^j$, $i<d,j<d'$. Let $T$ be multiplication
by $xy$, and let $e(X)$ be its characteristic
polynomial. Then $e$ is monic of degree $dd'$.
Cayley--Hamilton applied to $1\in C$ gives
$e(xy)=0$ in $C$.

Evaluation at the commuting endomorphisms
$A\otimes I,I\otimes B$ therefore gives
$e(A\otimes B)=0$. This does not require either
operator to be semisimple or either annihilator
to have a unit constant coefficient. If a
degree is zero, its monic annihilator is 1,
so the corresponding module and tensor are
zero and the same conclusion is immediate.

At the actual caller the desired operator is
on $(Y\otimes L)^\vee(1)$ at $s^{-1}$.
It is the transpose of the operator on
$Y\otimes L$ at $s$, because taking the
dual and replacing $s$ by its inverse
cancel the inversion. The Tate degree-zero
Weil factor is 1, since $s$ is inertial.
Thus the SAME polynomial $e$ annihilates it.
No inverse roots, resultant denominators
or new choice of local character is needed.

This proves exactly the native monic integral
tensor supplier with degree at most $dd'$,
with its actual $s^{-1}$ and Tate shift.
The compatibility of linearFrob with
tensor/dual pairing is the stated
potentially crystalline input.

## 2. Feed all three sides into the tame annihilator

In tame_types_exponent let the two annihilators
have degrees at most $N$, and let the tame
orbit parameter be $r$. The chart has
$e\le p^{r^2}$ and $p\nmid e$. Put

$$
                   \kappa=r^2(N+1)^2.
$$

The third polynomial from §1 has degree
at most $N^2$. Hence
$r^2(\deg e+1)\le r^2(N+1)^2=\kappa$;
the two original polynomials satisfy the
same sufficient inequality.

Apply the audit 129d788f descent to EACH
side on this SAME chart. On the extension
the polynomial is $Q=q(X)(X-1)$, whose
$Q(1)=0$ removes the common constant
correction before division by $z$.
At a residue root the factorial descent
cost is $1+v_p(t)\le r^2$; at a nonroot
the actual $Q(\zeta_e^t)$ is a unit.
The number of root steps is at most
$\deg q+1$. The final Nakayama step
gives the original $p^\kappa$ annihilator
for all three sides. The integral
Kisin-frame divisibility used by that
audit remains its explicit premise.

The tame chart has differentExp at most 1.
The gap/cup comparison of LongGap therefore
gives the sufficient common exponent

$$
                  E=3\kappa+150(\eta+W+1).           \tag{T1}
$$

The $3\kappa$ pays all three sides.
The remaining term pays the actual
depth and third-side comparison; it
must not be dropped after establishing
the individual annihilators.

## 3. Check the native datum guard, not an arbitrary prime

Now take the TAME branch of
OnePlaceDefect.block_defect_le_at_place.
Write $R_D=D.r\ge3$, $D.t=5R_D$ and
$b_D=D.b$. The prime is one of the
two chosen primes $p=g_i$ and satisfies
$p\ge b_D^{10}$. At this branch the
actual parameters are

$$
 r=R_D,\quad N=(R_D+D.t)R_D=6R_D^2,\quad
 \eta=R_D^{16}+1,\quad W=4D.t=20R_D.
$$

The center is
$\beta=\mathrm{ite}(\text{thick},b_1,b_2)
       +(j h+h_2-2D.t)$ with truncated
natural subtraction and $j\le m$.
It is NOT a freely chosen large weight.

The original data imply $m\le R_D$,
$b_2\le b_1$, $b_1\le e^2b_D<8b_D$,
and $b_1\ge R_D^{18}$. For the last
inequality, put $X=\log x$, $B=\log b_D$:
$\log R_D\le5X+\log3$,
$\log b_1\ge B-2$, $B\ge10^{12}X$
and $X\ge1$, so
$18\log R_D\le90X+18\log3<B-2$.
All these are original admissibility
consequences, not new eventual hypotheses.

Since $h=2R_D^8$, $h_2=R_D^8$,

$$
 \beta\le b_1+3R_D^9\le2b_1,\qquad
 \kappa\le49R_D^6.
$$

For $R_D\ge3$,
$6R_D^{16}+120R_D+49R_D^6+8\le R_D^{18}$:
the first term is at most
$(2/3)R_D^{18}$, and the others are
at most $177R_D^6\le(1/3)R_D^{18}$.
Consequently

$$
 \beta+6(W+\eta)+\kappa+2
     \le3b_1<24b_D<b_D^{10}\le p.                  \tag{T2}
$$

This is the exact size guard of
tame_types_exponent at its actual caller.
It also gives $p>R_D$, so $p\nmid R_D!$
for the chosen residue degree. Since
$g_i\equiv1\pmod{N_1d}$, every relevant
root of unity lies in $\mathbb Q_p$.
Thus the completion embedding has full
local Galois image, the surjectivity
premise in that theorem.

## 4. Pay the original row or rank-one block loss

The same parameters give

$$
 E\le147R_D^6+150R_D^{16}+3000R_D+300
                                    \le500R_D^{16}.            \tag{T3}
$$

For example $R_D^{10}\ge147$ bounds
the first term by $R_D^{16}$ and
$R_D^{15}\ge3300$ bounds the last
two by another $R_D^{16}$.

Let $\xi=1$ for the row block and
$\xi=D.t$ for a rank-one string block;
the native proof needs
$2E\le\mathrm{loss}(D,p)/\xi$.
The actual loss is

$$
 10^6\frac{m}{k}
        \bigl(b_1v_p(g_0g_1)+\lambdaLoss(h_2,b_1,p)\bigr).
$$

Distinct primality gives $v_p(g_0g_1)=1$.
The second term is nonnegative,
$m\ge1$, $k\le R_D$ and $\xi\le5R_D$.
Therefore

$$
 \frac{\mathrm{loss}(D,p)}{\xi}
 \ge\frac{10^6b_1}{5R_D^2}
 \ge2\cdot10^5R_D^{16}
 \ge2E.                                           \tag{T4}
$$

The standard crystalline COCYCLE rank
bound and scaling by $p^E$ now give

$$
 \operatorname{normLength}(\text{local defect})
 \le [G_p:j(\Gamma)]\,\operatorname{rank}_{\mathcal O}L\,
                     \mathrm{loss}(D,p)/\xi .
$$

The rank is that of the actual block
$L$, distinct from the orbit parameter
$R_D$. This feeds the SAME all-block
loss summation and common Selmer row;
the string factor $\xi=D.t$ is kept.
No generic-prime version or
$H^1$ rank has been substituted.

## 5. Status and remaining frontier

This supplies the tensor polynomial,
full datum guard and exact original
loss payment retained by the recent
tame audit, using its same chart,
annihilators and corrected descent.
The underlying potentially crystalline
compatibility, tame-chart existence,
integral frame and cup-profile
identities are retained explicitly.
Independent audit and native replay
of the human replacements are
outstanding.

Executed exact scalar check: substitute $R_D=3+u$ in
$R_D^{18}-3R_D^9$,
$R_D^{18}-6R_D^{16}-49R_D^6-120R_D-8$,
$350R_D^{16}-147R_D^6-3000R_D-300$, and
$49R_D^6-R_D^2(6R_D^2+1)^2$.
Their expanded coefficient lists have respectively
19, 19, 17 and 7 entries, all nonnegative, with
positive constant coefficients. Thus the four
inequalities used above hold for ALL $R_D\ge3$.
This checks their algebra, not a Kisin hypothesis.
Reproduction with Sympy:

~~~python
import sympy as s
r,u=s.symbols("r u")
polys=[r**18-3*r**9,r**18-6*r**16-49*r**6-120*r-8,
       350*r**16-147*r**6-3000*r-300,
       49*r**6-r**2*(6*r**2+1)**2]
for q in polys:
    p=s.Poly(s.expand(q.subs(r,u+3)),u)
    assert min(p.all_coeffs())>=0 and p.eval(0)>0
~~~

RESUME HERE: sparse-thick/two-size
cut-window profiles, distinct from
this tame branch. Preserve the
already written unramified/few-low
and cochain proofs and their audits.

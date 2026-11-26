# Rallis: the finite cutoff, absolute convergence and the actual Gram factor

26 November 2026. Source-matched human derivation, pending independent
mathematical audit and replacement replay. This continues dependency
RUN55, whose stable-range convolution argument is reused. RUN51/52's
common Hecke operator and comparison-form descent are also reused.
No new claim for those earlier arguments. Attribution: Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.

Pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

| Actual source | Role | Blob |
|---|---|---|
| Lib/SiegelWeil/RallisInner/SharpData.lean | graph terms, doubling, dual datum, sharp residue data | ea9f665a9a89411f1353d098ff2e0a4e59a719f5 |
| Lib/Weil/CompactLift/RallisFormula.lean | partial integral and Euler form | 8d41f50fc88d20a40531973b916aaac7491b8e72 |
| Lib/SiegelWeil/Formula/SiegelWeilFormula.lean | convergent Siegel--Weil input | 4277ff0a84d10e7e1f73516d9ff76505072899ea |
| Lib/Weil/Construction/FiniteHeisenberg.lean | normalized additive annihilator | be448ff4db1da9bfa0fe7bd637272be079be2285 |
| Lib/Weil/Construction/Projections.lean | vacuum projection and Weyl commutation | 7a187f8be18a00b889082b56818393f20a7f88e4 |
| New/Exchange/CharacterLiftNorm.lean | auxiliary lift and gramFactor | 3a83f00d1356032da157bf4709b7ab4d9d829c3e |
| New/Exchange/TriangleArrows.lean | triangle lift, same Rallis term | cbbd1f5b49f575b5097be80369e485ba5dd42d1e |

## 1. Contracts and the exact standard input

Let $E$ be the actual CM field with its fixed Weil data, $S,T$
hermitian spaces of ranks $r,M$, and $M>2r$. Haar measures, the
additive character and the finite self-dual lattice are those of
the source throughout. Write $G=U(S)(\mathbb A)$, $H=U(T)(\mathbb A)$
and $[G],[H]$ for their rational quotients. Let $y,y'$ be rapidly
decreasing automorphic functions on $[G]$.

For a Schwartz datum $f$ on $\operatorname{Hom}(S,T)(\mathbb A)$,
write $\Theta_f y$ for its theta lift. A datum is clean if $S$ is
definite, or at one finite place in a set disjoint from its conjugate
its named Schwartz--Bruhat function is supported on injective maps
$S\to T$. The required doubling identity is

$$
 \langle\Theta_{f'}y',\Theta_fy\rangle_{[H]}
 =\operatorname{vol}[H]\int_G
       \langle f',\omega(g,1)f\rangle
       \langle y',R(g)y\rangle_{[G]}\,dg,              \tag{P1}
$$

with the coefficient product absolutely integrable, for every
$f'$ and clean $f$. Neither cuspidality of $y$ nor a nonzero
L-value is an added premise.

Use the convergent Siegel--Weil theorem in exactly this form:
on the split space $S\oplus S^-$, with Lagrangian rank $r$ and
$M>2r$, the continuous zero-term functionals $Z_L$ have summable
norms, and

$$
 \int_{[H]}\theta(\omega(1,h)d)\,dh
    =\operatorname{vol}[H]\sum_L Z_L(d).              \tag{P2}
$$

The accompanying theta majorant is integrable on $[H]$ times a
continuous Schwartz seminorm of $d$. This is the actual
SiegelWeilFormula/theta_normalisedTorus input, with the original
normalization. It is an explicit retained standard theorem here;
this note does not independently reprove the full Siegel--Weil
theorem or its reduction-theoretic majorant.

## 2. Why the doubled integral can be unfolded

The doubling map is conjugate-linear in $f'$ and linear in $f$.
Its theta value is the product of the two original theta values,
with the first conjugated. For a rational isometry $\delta$ of $S$,
let

$$
 L_\delta=\{(\delta u,-u):u\in S\}\subset S\oplus S^- .
$$

Its zero term is exactly the original Weil matrix coefficient at
$\delta^{-1}$. This follows by the self-dual Fourier integral in
the coordinates of $S$; the rational lattice change preserves
covolume. The inverse and conjugation are part of this identity.

Here is the reason only these graphs survive. Parametrize a
Lagrangian by $(K,K')$; isotropy says
$K^*J_SK=K'^*J_SK'$. If $K'$ is invertible, it is uniquely a graph,
with isometry $-K(K')^{-1}$. If $K'c=0$ and $Kc\ne0$, then in the
definite case isotropy is already a contradiction. In the clean
case, the zero-term functional is invariant under the Heisenberg
translations in this Lagrangian direction. In the named local
Schrödinger model these translations multiply the $f$ factor by
the characters of the vector $X(Kc)$. The invariant functional
therefore only sees $X(Kc)=0$: Fourier averaging over the compact
additive group is the indicator of that annihilator. Clean support
has $X$ injective at this place, so this indicator is zero.
Schwartz--Bruhat functions are locally constant with compact
support, so the averaging can be done on a single finite quotient.
This is the concrete local annihilator step called
name_eq_zero_of_invariant in the source. No assertion that a
general Schwartz datum kills the boundary is made.

For completeness, the interchanges in this argument use one
majorant before any orbit is discarded. Choose the rational
representatives of $[G]$ with polynomial height control supplied
by reduction theory. For every continuous seminorm $p$ required
by (P2), continuity of the doubling map and moderate growth of
the Weil action give seminorms $p_1,p_2$ and a polynomial height
bound for

$$
 p\big(\overline{y'(x')}\,y(x)\,
        D(\omega(x')f',\omega(x)f)\big).
$$

Rapid decrease of $y,y'$ absorbs that polynomial. The resulting
function is integrable on $[G]\times[G]$; for these fixed
seminorms it is even bounded, and the quotient has finite volume.
The integrable theta majorant in (P2) now bounds the corresponding
triple integral. Also

$$
 \sum_L\int_{[G]^2}|Z_L(d(x,x'))|\,dx\,dx'
 \le\Big(\sum_L\|Z_L\|\Big)
         \int_{[G]^2}p(d(x,x'))\,dx\,dx'<\infty.       \tag{P3}
$$

Here the operator norms/seminorm are the common ones in the
summable-functional assertion of (P2), rather than separately
chosen seminorms for each $L$.

Thus Fubini and summation under the integral apply absolutely.
Keep the graph terms, use their unique parametrization by
$\delta\in U(S)(E)$, and unfold the rational sum into one adelic
$G$ integral. The quotient orbit map and
$(x,g)\mapsto(x,xg)$ preserve the indicated Haar measures.
This proves (P1) with precisely the factor $\operatorname{vol}[H]$.
It also proves absolute integrability of the coefficient product:
its lift to $[G]\times G$ is bounded in absolute integral by (P3).
One must establish this before using a sequence of partial
integrals.

## 3. The dual datum really cuts off nonintegral finite points

Let $B$ be a FINITE set of finite places, and suppose $f$ is
vacuum on $B$ and its conjugate. There is a Schwartz datum $f_B'$
such that, for all $g$,

$$
 \langle f_B',\omega(g,1)f\rangle
 =\mathbf1_{\{g_f\text{ integral at }B\}}
                \langle f,\omega(g,1)f\rangle.       \tag{P4}
$$

This is not obtained by multiplying a coefficient by an arbitrary
indicator. The following construction supplies an actual datum.

Use the explicit finite-adelic isotropic frame
$x=(I;uI;0)$ with $\bar u u=-1$ and $x^*x=0$, possible since
$M\ge2r$. Its selected $r$ rows are the identity. Put
$C=B\cup\bar B$ and choose a positive integer $N$ such that
at each $w\in C$ the anti-Hermitian scalar
$z=\mathbf1_C\,\jmath/N$ has absolute value greater than 1.
More precisely choose
$N\varpi_w^{-1}/\jmath\in\mathcal O_w$ simultaneously;
there are finitely many denominators to clear. Then

$$
 k=I+zxx^*,\qquad k^*k=I,\qquad k^{-1}=I-zxx^* .     \tag{P5}
$$

The equalities use $x^*x=0$ and $\bar z=-z$ before taking
valuations. Let $\kappa$ be the induced isometry on the finite
oscillator space. Let $\eta=\mathbf1_C\sum_a E_{u(a),a}$ be the
Heisenberg vector selecting the identity rows of $x$. The native
datum is

$$
 f_B'=H(\eta)\,\omega(\kappa)
          \big(\operatorname{finMultiplier}(\kappa^{-1})\,f\big).
                                                               \tag{P6}
$$

The multiplier in (P6) is required; omitting it changes the
coefficient even on integral points. For $g_f$ integral on $C$,
the vacuum projection, Weil covariance and (P5) cancel the
shear and Heisenberg factors. They give exactly the unchanged
coefficient in (P4), with no residual absolute-value factor.

Here are the local exclusion and conductor calculation for the
other direction. Write $|\ |_{w}$ for the source valuation, so
integrality means $|\ |_{w}\le1$. As in the native calculation,
replace the original argument by its inverse; below $g$ is the
matrix in that inverse convention. The integral region is
invariant under inversion. Suppose the coefficient in
(P6) is nonzero and a row of $g_f$ has an entry
$|g_{il}|_w>1$. Choose $l$ of maximal absolute value in that
row. Choose $\mu$ with

$$
 |\mu|_w=\max(|z|_w,|g_{il}|_w),\qquad
 \sigma=\text{the adele supported at }w\text{ with value }\mu^{-1}.
$$

Then all entries $g_{ik}\sigma$ and $z\sigma$ are integral.
Consequently their Heisenberg operators fix the vacuum part
of $f$. Move these operators across the two sides of the
nonzero coefficient. Covariance with $\kappa$ and the identity
row in $x$ leave precisely the commutation character

$$
 \psi_0(d\,\mathbf1_C^2 z g_{il}\sigma)=1
                      \quad(d\in\widehat{\mathcal O}_E).        \tag{P7}
$$

The source commutation convention is
$H(a)H(b)=\psi_0(\bar b\cdot a)H(b)H(a)$; this gives (P7)
with the specified $z,\sigma$. A conjugated character gives
the same annihilator. The actual normalized character is
$\psi_0(v)=\psi_f(\jmath\alpha\bar\alpha v)$.
Self-duality says that its annihilator of
$\widehat{\mathcal O}_E$ is EXACTLY
$\widehat{\mathcal O}_E$, including ramified places.
Thus (P7) forces $zg_{il}/\mu$ to be integral at $w$. But

$$
 |zg_{il}/\mu|_w
   =\min(|z|_w,|g_{il}|_w)>1,
$$

a contradiction. All entries of $g_f$ on $C$ are therefore
integral; the unitary relation gives integrality of the inverse
there as well. This proves (P4). The same normalization and
the same original $f$ occur on both sides. The real part of
the datum was never changed.

## 4. Partial-integral limit and exact finite mass

Suppose $f=v\otimes F$ with $F$ sharp outside a finite set $S_0$.
Sharpness means: $F$ has nonzero squared norm, is finite, is
vacuum away from $S_0$, all $v\otimes F$ are clean, and on
finite points integral outside $S_0$ its matrix coefficient is

$$
 \langle F,\omega(g_f)F\rangle
   =\langle F,F\rangle\mathbf1_{J\cap K_0}(g_f).
$$

Its mass is
$c=\langle F,F\rangle/[K_0:J\cap K_0]\ne0$.
The finite Haar normalization is $\operatorname{vol}(K_0)=1$,
so the integral of this coefficient is EXACTLY $c$.

If $\Theta_fy=0$, apply (P1) to every datum (P6) for
$B=R\setminus S_0$, where $R$ ranges over finite sets of
places. The integrals restricted to these regions are all
zero. Their indicators decrease pointwise to the indicator
of integrality at every place outside $S_0$. The integrable
absolute value from §2 is a common dominating function.
Dominated convergence, not a new Euler-product limit, gives
zero on that limiting region. Sharpness and right
$J$-invariance of $y$ turn it into

$$
 0=c\int_{G_\infty}
       \langle v,\Omega(h,1)v\rangle
                 \langle y',R(h)y\rangle\,dh.         \tag{P8}
$$

The stable-range convolution argument of dependency RUN55 now
applies. If $v$ is the actual edge vector, its real matrix
coefficient acts on the specified source type as a fixed
nonzero scalar $a_K$. Thus (P8) implies $y=0$. This proves
injectivity for these data and types, rather than for arbitrary
Schwartz data.

For the norm formula, partition the finite adelic group into
the cosets used in SharpData.cosetTerm. On each coset the
vacuum coefficient factors, and sharpness supplies mass $c$.
The disjoint partition of an absolutely integrable function
gives an absolutely convergent coset sum. The real edge
integral is the same $a_K$ for every allowed tame twist.
Consequently

$$
 \langle Ly',Ly\rangle
    =A_Kc\sum_\gamma\rho(\gamma)
                    \langle y',R(\gamma)y\rangle,
 \qquad A_K=\operatorname{vol}[H]a_K\ne0.             \tag{P9}
$$

The scalar $a_K$ is the exact edge convolution constant.
It is not replaced by the norm of $v$, and its numerical
value is not needed: it is fixed across the twist family.

## 5. The actual auxiliary and triangle Gram formulas

For modulus $\mathfrak m$ with residue ring $R_{\mathfrak m}$,
the finite datum used in the actual lift is a function on
$M\times r$ matrices satisfying $LY=I$ on its support, for ONE
fixed $L$. The support argument in dependency RUN55 proves
sharpness. The exact mass in SharpData.isSharp_modDatum is

$$
 c=\frac{\sum_Y|F(Y)|^2}
        {|R_{\mathfrak m}|^{Mr}|\mathrm{GL}_r(R_{\mathfrak m})|}.
                                                               \tag{P10}
$$

For the auxiliary pair take
$F=\Gamma_Q\,\mathrm{levelIndicator}$, where
$\Gamma_Q=\prod_{w\in Q}|\mathrm{GL}_r(k_w)|$. The fixed
rows form the identity; the free rows occur only at the
twist places. The exact CRT count gives

$$
 \sum_Y|F(Y)|^2
        =\Gamma_Q^2\Big(\prod_{w\in Q}Nw\Big)^{tr},
 \quad t=O.\mathrm{rankDiff}.
$$

Conversion between the Petersson inner product and the
algebraic-form inner product contributes the SAME specified
level index, while the real highest-vector convention
contributes its fixed Weyl-space factor. Thus (P9)-(P10) give
the exact source factor

$$
 \mathrm{gramFactor}(O)=
  [K_0:O.\mathrm{levelGroup}\cap K_0]\,
  \frac{\Gamma_Q^2(\prod_{w\in Q}Nw)^{tr}}
       {|\mathrm{GL}_r(R_{\mathfrak m})|}.             \tag{P11}
$$

The remaining $|R_{\mathfrak m}|^{-Mr}$ is already in
Data.rallisTerm. It must not be inserted into gramFactor a
second time. The resulting constant $A_j\ne0$ is chosen
BEFORE the tame character:

$$
 \langle u_\vartheta y',u_\vartheta y\rangle
  =A_j\,\mathrm{gramFactor}(O_\vartheta)
                   \sum_\gamma\mathrm{rallisTerm}_{\vartheta,j}
                                      (y',y,\gamma).
$$

The triangle's singleton residue datum has the same left
inverse. Apply (P9) to its actual ranks and matching edge
parameters. Its residue-matrix cardinal and triangleOrder
are retained exactly as in TriangleArrows.hasSum_inner_triLift.
This supplies the two convergent sums on the two spaces to
RUN51's common-Hecke-operator lemma. It produces ONE common
operator, so equality of Hecke determinants cancels its
unknown determinant in RowVolume. No separate normalization
or fresh twist choice enters this application.

## 6. Status and next dependency

This expands the local dual cutoff and the absolute-convergence
steps explicitly retained in dependency RUN55, and gives the
Gram factor at the actual auxiliary/triangle consumers. It
uses the stated convergent Siegel--Weil theorem, reduction
theory, self-dual Weil/Heisenberg covariance, and the precise
edge convolution identity. The direct sum/graph zero-term
identity uses that same Weil normalization. These are explicit
inputs, not consequences of a finite scalar check.

Independent audit must check the finite cutoff covariance in
(P6)-(P7), the common seminorm in (P3), and (P11) against both
actual consumers. No new Lean execution, independent human
audit or whole C/RH verification is claimed.

RESUME HERE: the comparison construction still needs its
lineMultiplier integrality/all-conjugate size, carrier/near-max
and period-vanishing suppliers at their actual inputs. Reuse
dependency RUN51/52/55 and the joint determinant; do not
rederive their already integrated scalar adjoint descent.

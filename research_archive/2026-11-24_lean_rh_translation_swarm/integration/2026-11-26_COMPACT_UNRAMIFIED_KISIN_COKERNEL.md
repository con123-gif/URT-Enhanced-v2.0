# The unramified Kisin cokernel and its actual deep points

26 November 2026. Source-matched human derivation; independent audit
and native replacement replay outstanding. This expands a primitive
retained in the editor's three-case crystalline budget. Attribution:
Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Independent partial audit: 129d788fbbd30b331faaf99d14e4429e622c101b,
audit/2026-11-26_COMPACT_TAME_COKERNEL_DESCENT.lean, section 5,
checks and agrees with the scalar arguments (K4)-(K8), including
q=0, A=max(a,m), and the common-modulus Nakayama discipline.
It does not independently replay the frame/depth/coordinate
suppliers or certify this whole human derivation.

| Actual source | Role | Blob |
|---|---|---|
| New/Lift/CokernelKillers.lean | lift ideals, factorial descent, unramified annihilator | ba8a479cecd29393b86e3f320991c20baf108487 |
| New/Lift/HodgeExpansion.lean | one-step depth and strict exponents | 7f8955989647bee0ddf549506d1488cf09536046 |
| New/Lift/LongGap.lean | point lift and finite depth-raising operator | a94786663aac435dfc1ec846046c87f00ddad141 |
| New/Lift/ExponentTheorems.lean | actual cup-orthogonality consumer | 00f2467f84012fb67b4788ace502a70c5d4eedfc |
| New/Selmer/CrystallineBound.lean | three local cases | 7b7ba1c2ac12f09651b5c1285109ff0435258e79 |

## 1. Precise statement and multiplier ideals

Fix a Kummer chart for a local Galois group and one PairingSide
$S$ of the native proof. Thus its kernel lattice $Y$ is potentially
crystalline, its jump sets $U_i$ contain 0, and its extension
$\widetilde Y=Y\oplus C$ is defined by the prescribed crystalline
cocycle map $C\to Z_f(Y)$. The action on $C$ is trivial. Letters
$i$ are the units of the finite residue field and Frobenius
permutes them by $\sigma$.

Let $z$ be the power-series variable, $E$ the Eisenstein element
and $e$ the ramification index. Work in the native $A_{\inf}$;
all multipliers displayed below lie in its chart power-series
subring. Let $J_l^\nu(i)$ denote liftIdeal with modulus $p^\nu$,
level $l$ and letter $i$, and let $J_l(i)$ denote modulus zero.
Its elementary lifting interpretation is

$$
 f\in J_l^\nu(i)\ \Longleftrightarrow\
 \exists t\ \forall c\in C\ \exists x\text{ of level }l:
       \pi x=(f-p^\nu t)\,c_i.                      \tag{K1}
$$

The SAME $t$ works for all constants $c$. Here $c_i$ is the
letter projector of $1\otimes c$ and $\pi$ is the actual
extension projection. For modulus zero the error term is absent.
In particular $J_l^\nu(i)=J_l(i)+(p^\nu)$ as ideals.

The required theorem is:
if the chart is unramified, $p\ge5$, $s,t\ge0$, and

$$
 u\le(p-3)(s+t)\quad(u\in U_i,\ \text{every }i),
$$

then

$$
                    p^s E^t\in J_0(i)
                              \quad\text{for every }i.         \tag{K2}
$$

This is KillsCokernel $i\,s\,t$, with no rank factor and no
additional coefficient-ring ramification cost.

## 2. The integral-Hodge inputs and their algebraic consequences

For clarity, the local integral-Hodge inputs used here are:
the native frame theorem and coordinate retraction, Frobenius
compatibility, and the Galois divisibility/depth-step identity
of HodgeExpansion. Their full foundational proofs are not
claimed as independent work in this note. They give the
following precise rules for the ideals (K1).

* If every allowed jump is at most $n$ and
  $f\in J_0^\nu(i)$, then
  $fE^n\in J_1^\nu(i)$. At the first divisor the standard
  exponent is $-u$; multiplying by $E^n$ makes it
  $n-u\ge0$, the level-one requirement. Other divisors
  are unchanged.
* Frobenius sends $z^a\in J_0^\nu(i)$ to
  $z^{pa}\in J_1^\nu(\sigma i)$.
* Weighted differentiation has the consequence
  $$
   p^c z^N\in J_1^\nu(\sigma i),\quad pa\le N,\quad
   c+v_p(N!)\le\kappa+v_p((pa)!)
       \ \Longrightarrow\
                  p^\kappa z^a\in J_0^\nu(i).       \tag{K3}
  $$
* The frame theorem gives a power of $z$ in the common
  radical ideal $\bigcap_i J_0^\nu(i)$; equivalently
  some $z^a$ lies in every one of these ideals.
  This is the native radical/frame assertion, not a
  consequence of the numerical jump bound alone.

Here is the lifting algebra behind (K3), so the factorial
cost is explicit. A level-one Galois relation

$$
 z_\tau E(h+\beta f)=\alpha(gf-f)
$$

and a lift of $(f-p^\nu t)c_i$ give a lift of
$(h-p^\nu(\alpha v-\beta t))c_i$, where
$gt-t=z_\tau E v$. On lifts this is
$\alpha(gx-x)/(z_\tau E)-\beta x$; the standard
Galois divisibility with the level-one Hodge condition
puts it in the required module. This proves
mem_liftIdeal_of_derivation. Applied to $p^c z^N$,
the depth-step identity reduces $N$ by one at cost
$v_p(N)$. Repeating down to $pa$ costs
$v_p(N!)-v_p((pa)!)$. Frobenius then divides the
remaining $z$ exponent by $p$, proving (K3).
All divisions occur in the indicated localized period
module; this is not division by $p$ in a torsion lattice.

## 3. Bound the minimal common power

Suppose the jump upper bound is $n$. For any $\nu$, choose
the LEAST $a$ with $z^a\in J_0^\nu(i)$ for all letters.
We claim

$$
                         (p-1)a\le e(n+\nu).        \tag{K4}
$$

Indeed $z^aE^n\in J_1^\nu(i)$. Since
$z^e\in(p,E)$ and $p^\nu\in J_1^\nu(i)$, expansion of
$(p,E)^{n+\nu}$ gives

$$
          z^{a+e(n+\nu)}\in J_1^\nu(i)
                              \quad\text{for every }i.
$$

Set $N=a+e(n+\nu)$ and $b=\lfloor N/p\rfloor$.
There is no multiple of $p$ strictly between $pb$ and $N$,
so $v_p(N!)=v_p((pb)!)$. Apply (K3) with $c=\kappa=0$.
As Frobenius permutes ALL letters, $z^b$ lies in every
$J_0^\nu(i)$. Minimality gives $a\le b$, hence
$pa\le a+e(n+\nu)$, which is (K4).
Neither a separate exponent for each letter nor a maximum
over separately chosen constants has been substituted.

## 4. Unramified factorial estimate and exact removal of the modulus

Now $e=1$, put $q=s+t$ and take
$n=(p-3)q$, $\nu=q+1$ in (K4). We get a common $a$ with

$$
                     (p-1)a\le(p-2)q+1.            \tag{K5}
$$

It follows that

$$
                         a+v_p(a!)\le q.            \tag{K6}
$$

For $a=0$ this is immediate. For $a>0$, Legendre's formula
gives $(p-1)v_p(a!)\le a-1$, and therefore
$(p-2)v_p(a!)<a$. Thus

$$
 (p-2)(a+v_p(a!))<(p-1)a\le(p-2)q+1.
$$

The expressions are integers, and $p-2>0$; this proves
(K6). The endpoint $q=0$ is included, in which (K5)
forces $a=0$.

For EVERY integer $m\ge0$, set $A=\max(a,m)$. Frobenius
and multiplication give $z^{pA}\in J_1^{q+1}(\sigma i)$.
Use

$$
 v_p((pA)!)=A+v_p(A!),\qquad
 v_p((pm)!)=m+v_p(m!).
$$

If $m\le a$, their difference is at most $q-m$ by (K6).
If $m\ge a$, the difference is zero. Hence (K3) gives

$$
                       p^{(q-m)_+}z^m\in J_0^{q+1}(i)
                                           \quad(m\ge0).       \tag{K7}
$$

In particular $p^q\in J_0^{q+1}(i)=J_0(i)+(p^{q+1})$.
Write $p^q=b+p^{q+1}c$ with $b\in J_0(i)$. As $p$ lies
in the Jacobson radical of the $p$-adically complete ring,
$1-pc$ is a unit. Thus $p^q(1-pc)=b$ implies
$p^q\in J_0(i)$, and consequently

$$
                         J_0^{q+1}(i)\subset J_0(i).            \tag{K8}
$$

This is the exact Nakayama step. No passage from an
approximate lift to an exact lift is assumed without it.

For the unramified chart $E=p+zv$ with $v$ a unit
(the normalized chart may absorb a unit in the constant
coefficient). Every term of $p^sE^t$ is an integral
multiple of $p^{q-m}z^m$, $0\le m\le t\le q$.
By (K7)-(K8) each lies in $J_0(i)$. Their sum proves (K2).
This proves the original unramified cokernel bound from
the stated integral-Hodge rules, with the actual exponent.

## 5. Construct the points used at the cuts

From $p^\kappa E^t\in J_0(i)$, (K1) gives an actual lift
of $p^\kappa E^t c_i$. Use the normalized inverse
E-factor in the LOCALIZED Kisin component to obtain a
point $x$ above $p^\kappa c_i$ with exponents and depth

$$
 o(a,u)=
 \begin{cases}-t-u,&a=0,\\-u,&a>0.\end{cases}         \tag{K9}
$$

The normalized E-factor preserves kisinLoc and has exactly
these Hodge exponents. Its Galois differences have the
same lower bound. This is the actual
pointsOver_nonempty_of_killsCokernel conclusion, rather
than an abstract existence of a lift in a larger period
module.

The finite depth-raising step also has an exact invariant.
For a finite set $I$ of required integer steps $(a,n)$,
the operators from HodgeExpansion have cost

$$
              C(I)=\sum_{(a,n)\in I}
                      \big(v_p(n)+\mathrm{differentExp}+3a\big).
$$

They produce an additive map $A$ satisfying, simultaneously
on all deep points at every letter and depth system,

$$
                Ax-p^{C(I)}x\in\ker\pi
                                \text{ with the old exponents}.
                                                               \tag{K10}
$$

The one-step operator is
$p^{\mathrm{cost}(a,n)}I$ plus the specified finite sum
of Galois differences divided by $z_\tau$, followed by
the coordinate retraction. Its differences stay in the
extension kernel and in the old exponent module. It
raises the required depth $n$ to $n+1$. The step $n=0$
uses the source's separate trace/field-of-values step,
not a division by zero.

To compose, write $Ax=p^e x+\delta$ with $\delta$ in
that kernel. A second step $B$ preserves this kernel,
because it is itself a deep module. Additivity implies
$B(Ax)-p^{e+d}x=B\delta+p^e(Bx-p^d x)$ is in it.
The costs therefore ADD, without a rank multiplier or
a second copy of an earlier cost. Induct on the maximal
integer step in $I$ so that raising one boundary never
undoes another required boundary. This proves (K10)
and all prescribed new depths.

Apply $A$ to the point (K9), after multiplying by any
extra nonnegative power of $p$ needed for the target
exponent $e'\ge\kappa+C(I)$. Projection of (K10)
gives EXACTLY $p^{e'}c_i$. The exponents improve to
the following system. In using (K10), apply its simultaneous
old-depth identity also to $lo$: a point of exponents $lo$
is invariant modulo that exponent module by Galois stability.
Thus the operation preserves the original point-exponent
bound as well as raising its difference depth to $hi$.

$$
 \mathrm{improvedExponent}(lo,hi)(a,u)=
 \begin{cases}hi(a,u),&lo(a,u)>0,\\
               \min(hi(a,u),0),&lo(a,u)\le0,
 \end{cases}
$$

by the local field-of-values/Hodge filtration lemma.
Thus both the point and its Galois differences have
the contracts used at the native cut, on the SAME
extension and over the SAME constant $c$.

## 6. Actual crystalline consumer and remaining frontier

For ExponentTheorems.few_low_jumps, the chart is
unramified, $p\ge5$, and the opposite jump windows give
an upper bound $b_i+W+\eta$ for each of the two side
jump sets. They give the same bound for the third set
$\{0\}\cup\{-u-v-1\}$: if both jumps are far their
opposite signs cancel the centers; if one is far the
bound is $b_i+W+\eta-1$; if both are low it is
$2\eta-1$, smaller than the bound because the native
guard has $b_i>6(a+\eta+W)>\eta$.

Its exact hypothesis
$b_i+W+\eta\le(p-3)a$ therefore permits (K2) with
$s=0,t=a$ for all THREE sides. Their initial points
are precisely (K9) with $\kappa=0$. The no-multiple
guard puts every required E-level depth step in the
prime-to-$p$ windows. In the unramified chart these
steps have zero cost, including the separately handled
zero step. The source's subsequent cut selection,
possible one-step Frobenius transport, safe-pair
inequalities and small-part cup-product construction
are still required to turn these points into the
asserted zero defect or length bound.

For the small-prime sparse-thick and general two-size
branches, retain their own chart, different exponent
and full cost sum; the zero-cost conclusion above
does not apply there. The editor's three-case budget
then bounds those actual sums.

Independent audit must check the ideal/modulus rule
(K1), the factorial descent rule and zero-depth case,
the localized E-factor, and the use of the actual
third-side jump windows. The foundational frame/
coordinate and Hodge-depth identities remain explicit.
No new Lean execution, independent mathematical audit,
whole C closure or RH proof is claimed.

RESUME HERE: the actual Frobenius cut walk and four
safe-pair cup-product conditions in LongGap and
CupProductBound, then the sparse-thick/two-size cut
constructions. Reuse the existing numerical case audit
and graph-to-dual length transport.

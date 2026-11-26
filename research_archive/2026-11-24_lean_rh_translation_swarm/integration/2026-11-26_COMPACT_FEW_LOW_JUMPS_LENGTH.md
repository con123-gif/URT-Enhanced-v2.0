# Few low jumps: the actual colength and zero-defect branches

26 November 2026. Source-matched human derivation, pending independent
audit and replacement replay. This continues the unramified Kisin
cokernel and cut/cup notes at the actual local-length consumer.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

| Source | Actual supplier | Blob |
|---|---|---|
| New/Lift/FewLowJumps.lean | deepConstants, the two colength lemmas, cup-annihilated submodule | a86b9c32285a38ddc23f0debec7484c93e21e229 |
| New/Lift/LongGap.lean | multiplicity relation and zero-defect cut profiles | a94786663aac435dfc1ec846046c87f00ddad141 |
| New/Lift/ExponentTheorems.lean | few_low_jumps and coefficient-length conversion | 00f2467f84012fb67b4788ace502a70c5d4eedfc |
| Lib/PadicHodge/WachGamma/Letters.lean | leading forms of one jump | 236f8df0a5d35cfbc18a0a70797a8929b8fec41d |
| Lib/PadicHodge/WachGamma/KisinModuleDefs.lean | jumpMultiplicity and integral frame | 344ef024f5ddaee84ab62c0753b8beafbfd602cb |

## 1. Hypotheses and the desired bound

Use the native unramified chart, $p\ge5$, of residue degree $f_0$.
At every letter $i$ suppose the jumps lie in
$[-\eta,\eta]\cup\epsilon_i[b_i,b_i+W]$, with

$$
 b_i+W+\eta\le(p-3)a,\qquad
 b_i>6(a+\eta+W),\qquad \eta\ge1.                   \tag{F1}
$$

No NONZERO multiple of $p$ lies within
$R=6(a+\eta+W)$ of $0,b_i,-b_i$.
Put $\mu_i(u)=\mathrm{jumpMultiplicity}(i,u)$, and let

$$
 n_i\ge f_0\sum_{|u|\le\eta}\mu_i(u),\qquad
 r_i\ge f_0\sum_{u\in U_i}\mu_i(u).                 \tag{F2}
$$

The target is a $\mathbb Z_p$-submodule $V\subset C$
such that every constant in $V$ cups trivially with
every opposite-window paired side, and

$$
 \ell_{\mathbb Z_p}(C/V)
 \le11\sum_i\big(n_i(a+1)+r_i(W+1)\big).            \tag{F3}
$$

We do not assume $V$ is an $\mathcal O$-submodule.
For the universal side $C=Z_f(L)$, it is contained
in the actual $\mathcal O$-linear cupOrthogonal
module, which suffices for the relative-length bound.

## 2. A relation of size the jump multiplicity

Fix a jump $u$ at the letter $b$ steps before $i$.
Suppose an exponent profile $o$ satisfies
$o(b,u)<o(b,v)$ for allowed $v<u$.
The space of invariant Hodge forms of type $u$
modulo forms of smaller type has dimension at
most $\mu_{i^-}(u)$, $i^-=\sigma^{-b}i$.

For any $f_0\mu_{i^-}(u)+1$ Kisin vectors with
profile $o$, evaluate their leading coefficients
on a spanning set of these forms. Choose a
nonarchimedean Auerbach basis of their finite
span: pivot on coefficients of maximal norm.
All other leading columns are then integral
linear combinations of the pivot columns.
Lift these integral coefficients through theta,
apply the actual Frobenius/coordinate retraction,
and divide by the linear unramified Eisenstein
polynomial. Each resulting coefficient has form

$$
                      w+E v,\qquad w\in W(\mathbb F_{p^{f_0}}).
$$

The $w$-columns lie in a free $\mathbb Z_p$-module
of rank at most $f_0\mu_{i^-}(u)$. They have a
nonzero relation over $\mathbb Q_p$. Divide its
coefficients by one of least valuation; they
now lie in $\mathbb Z_p$, with one coefficient 1.
Reconstructing the vectors gives the SAME
primitive relation in

$$
          E\,N(o)+N(o\text{ with }o(b,u)\text{ raised by }1).
                                                               \tag{F4}
$$

The smaller-type condition ensures that their
leading terms already vanish to a strictly
higher order; other exponent conditions are
preserved by the retraction. This is the
exists_comb_of_jumpMultiplicity_le argument.
Its coefficient dimension is the KERNEL jump
multiplicity. A trivial quotient's zero jumps
must not be added to that dimension. Where the
extension is used directly below, only negative
jumps are counted, so the trivial quotient
again adds none.

The inputs are the actual leading-form span,
integral coordinate retraction and unramified
Witt-coefficient decomposition. They are not
assertions about arbitrary filtered modules.

## 3. From (F4) to a length cost per depth step

For a profile $c$ define $D_i(t,c)$ to be the
images under the actual extension projection
of Kisin points with point exponents
$(t-u,-u,-u,\ldots)$ and difference depths $c$.
This is the native deepConstants.

Raise one depth $c(b,u)$ to $c(b,u)+1$, preserving
the other requirements. The depth operator of
cost $d=\mathrm{cost}(b,c(b,u))$ puts
$p^dD_i(0,c)$ inside the new deep-constant
module. To control the number of generators
of its quotient, use (F4) on the kernel
corrections of the chosen lifts.

Its extra $E$ error can be replaced by a $p$
error plus the new exponent module. Indeed
the hypothesis for this step is that no
multiple of $p$ lies strictly between
$c(0,v)$ and $c(0,v)+p^b$ for ANY allowed $v$.
The zero-cost E-level operator raises those
interior depths. The normalized E-factor
then gives the identity

$$
                 E_0^{p^b}-E_b\in p\mathfrak S,
                                                               \tag{F5}
$$

so (F4) becomes a primitive relation modulo
$pD_i(0,c)$ plus the new module. The endpoints
are not discarded: the operator uses the
OPEN interval, and the desired boundary step
is the one counted separately at cost $d$.

Thus the quotient is killed by $p^d$ and
its reduction modulo $p$ has dimension at most
$f_0\mu_{i^-}(u)$. Elementary divisors over the
DVR give length at most
$d f_0\mu_{i^-}(u)$. Induct on the smallest
jump whose current boundary is below its
target. Antitonicity of the target on the
allowed jump set supplies the smaller-type
condition in §2 at every step.

Consequently, if raising only the $b$-th
profile costs at most $A$ per jump and an
additional $B$ on low jumps, then

$$
 \ell(D_i(0,c)/(D_i(0,c)\cap D_i(0,c')))
                         \le A r_{i^-}+B n_{i^-}.  \tag{F6}
$$

This is the native relLength_deepConstants_le.
It keeps the integral projection kernel, the
same extension and the same old point-exponent
bound throughout. No assumption that a general
period-space relation is integral has been used.

## 4. The two depth profiles and their actual colength

Put $D=2a+\eta$ and $i^-=\sigma^{-1}i$.
The profiles required by the cut walk for the
counted side are

$$
 c_i(l,u)=
 \begin{cases}
 D-u,&\epsilon_i=1,\ l=0,\\
 -u,&\epsilon_i=1,\ l>0,\\
 b_i+W+2a,&\epsilon_i=-1,\ l=0,\\
 W+1-u+2a\mathbf1_{|u|\le\eta},
                         &\epsilon_i=-1,\ l=1,\\
 -u,&\epsilon_i=-1,\ l>1 .
 \end{cases}                                                   \tag{F7}
$$

We claim the colength of constants with these
depths and point exponents $-u$ is at most

$$
 C_i=(2a+1)n_i+3(W+1)r_{i^-}+6a\,n_{i^-}.           \tag{F8}
$$

First construct depth $(D-u,-u,\ldots)$ and
raise its POINT exponent from $-\eta-u$ to
$-u$. The unramified cokernel theorem gives
$p^sE^{a-s}$ for each $0\le s\le a$.
The prime-to-$p$ gap allows zero-cost depth
raising. Raising the point bound by one at
each negative low jump costs at most
$a f_0\mu_i(u)$ by §2 and the $p^a$ lift.
Summing gives at most $a n_i$. This includes
all negative low jumps, and none of the
extension's new zero jumps. It already
supplies the $\epsilon_i=1$ profile.

For $\epsilon_i=-1$, choose
$q=\lceil(b_i+W+2a)/p\rceil$. Raise the
E-level depth to the constant $qp$.
The low-jump cost is bounded by

$$
 \sum_{0\le n<qp}v_p(n)
       \le v_p((qp)!)\le a+1.                     \tag{F9}
$$

For the last inequality use
$qp<b_i+W+2a+p\le(p-1)a+p-\eta$
and Legendre's bound. For a far negative
jump any multiple of $p$ in the required
interval below $qp$ would lie near $b_i$,
contradicting the no-multiple guard. Those
jumps have zero cost. Formula (F6) therefore
adds at most $(a+1)n_i$.

Finally raise the first Frobenius depth from
$-u$ to the $l=1$ value in (F7).
Its step interval has length
$W+1+2a\mathbf1_{|u|\le\eta}$ and is inside
the permitted windows around $0,\pm b_{i^-}$.
All its nonzero integers are prime to $p$.
The unramified cost at this divisor is
therefore exactly 3 per step, including the
zero step with the source convention
$v_p(0)=0$. This adds
$3(W+1)r_{i^-}+6a n_{i^-}$ by (F6).
Its E-level target in (F7) is at most $qp$,
and the open interval $(qp,qp+p)$ has no
multiple of $p$, as required in §3.
The target profile is antitone on the
ACTUAL allowed jumps: the far/low separation
in (F1) absorbs the low-jump $2a$ change.
Adding the three costs proves (F8).

## 5. One submodule, the same cut walk, and normalization

Let $V$ be the intersection over letters of
the inverse images of $D_i(0,c_i)$ under
the fixed map $c\mapsto c_i$.
Relative lengths of a finite intersection
are at most their sum; projection to its
actual image gives

$$
 \ell_{\mathbb Z_p}(C/V)\le\sum_i C_i
   =(8a+1)\sum_i n_i+3(W+1)\sum_i r_i
   \le11\sum_i(n_i(a+1)+r_i(W+1)).
$$

Frobenius permutes the letters in the
second equality; there is no free factor
equal to the number of letters.
For $d\in V$, the definition selects
points over that SAME $d$ with profiles
(F7). For the opposite side and the third
side use the already proved unramified
E-power lifts and zero-cost gap raising.
Take every letter as a cut, nearest cut
length 1, and leading predicate
$Q(i)=(\epsilon_i=1)$.
The three profiles give the full
HasDeepPoint inequalities of the preceding
walk note: their E/first-Frobenius parts
use the two lines in (F7), and positions
at least 2 reduce to $1>0$ after the
Tate shift. The far/low cases use (F1).
Thus the same four safety conditions
give ScaledCupBounds with exponent 0.
This proves (F3) and the required
cup-vanishing property of $V$.

For the universal side of a crystalline
$\mathcal O$-lattice $L$ of rank $r$,
let $\mu$ bound the low-jump count at
every coefficient embedding. The
definition of jumpMultiplicity partitions
these embeddings by the value of the
fixed letter root. Each embedding occurs
once, since distinct Teichmüller values
have unit differences. If
$d_{\mathcal O}=[\operatorname{Frac}\mathcal O:\mathbb Q_p]$,
then

$$
 \sum_i n_i\le f_0 d_{\mathcal O}\mu,\qquad
 \sum_i r_i\le f_0 d_{\mathcal O}r .
$$

Convert $\mathbb Z_p$-length to
$\mathcal O$-length. If the latter ring
has residue degree $f_{\mathcal O}$ and
ramification index $e_{\mathcal O}$,
then $\ell_{\mathbb Z_p}=f_{\mathcal O}
\ell_{\mathcal O}$ and
$d_{\mathcal O}=e_{\mathcal O}f_{\mathcal O}$.
Since $\ell_{\mathcal O}(\mathcal O/p)
=e_{\mathcal O}$, the result is exactly

$$
 \ell_{\mathcal O}
  \bigl(Z_f(L)/(Z_f(L)\cap\operatorname{cupOrthogonal})\bigr)
 \le11 f_0\big(\mu(a+1)+r(W+1)\big)
                \ell_{\mathcal O}(\mathcal O/p).     \tag{F10}
$$

This is the actual ExponentTheorems
few_low_jumps bound. In the normalized
length with $v_p(p)=1$, the final
$\ell_{\mathcal O}(\mathcal O/p)$
is divided out. It is a $Z_f$ cocycle
bound; $H^1_f$ has not replaced it.

## 6. The two zero-defect cases, without a length estimate

The source also gives zero defect if
neither side has a jump in $[-a,0)$,
or if the second side's jumps are all
in $[-\eta,0]$. Here is the direct
point-profile verification.

Set $D=2a+\eta$. An E-power lift followed
by zero-cost raising to depth
$(D-u,-u,\ldots)$ has point exponent at E
equal to $D-u$ when $u<-a$, and
$\min(D-u,0)$ otherwise; at other
divisors it is $-u$. The third point
has profile $-a-w$ at E and $-w$
elsewhere, $w=-u-v-1$.

If there are no jumps in $[-a,0)$,
each ordinary point exponent at E is
at least $-u$. Choose as leading side
the one whose far window is NEGATIVE.
Its point exponent at E is nonnegative,
which supplies stdExponent at length 1.
The first positivity inequalities at E
have lower bound $1+a+\eta$.
The extra leading inequality at E
has that bound, or the larger
$1+a+\eta+D$ when the other jump
is far positive. At positions at
least 1 all comparisons reduce to
$1>0$. Thus the same all-letter
cut walk gives exponent 0.

For the second case, use its upper
jump bound 0 to get an E-power-free
point on the second side. Raise its
E-depth to $D-v$, move it forward
by Frobenius ONCE, then raise the
new E-depth to $D-v$ again at zero
cost. Its E-point exponent is 0,
its first-Frobenius point exponent
is at least $-v$, its depths there
are both $D-v$, and all later
profiles are $-v$. Keep the first
side and third side as above.
Choose the second side leading at
EVERY cut. Its earlier third cut
is one step back when the first
side's far window is negative,
and the current cut otherwise.

At E the leading positivity is
$D-v>0$, or at least $a+1$ after
the far/low minimum. At the first
Frobenius divisor it is at least
$a+1$; all later positions give
$1>0$. The nonleading inequalities
use $v\in[-\eta,0]$ and are again
at least $a+1$ at E and positive
thereafter. The leading point
dominates stdExponent because its
E exponent is 0 and its first
Frobenius exponent is at least
$-v$. These are exactly the
Frobenius-transported profiles,
including the depth's initial 1.
The all-letter walk again gives
cup vanishing with exponent 0.

These zero cases supply the small-loss
branches in the editor's actual
CrystallineBound analysis; one cannot
infer them by setting the right side
of (F10) to zero.

## 7. Status and next supplier

This reconstructs the FewLowJumps
colength mechanism, its universal-side
normalization and both zero branches
from the stated integral-Hodge
leading-form/retraction inputs and the
previous cokernel/cup walk.
No new native Lean execution or
independent mathematical audit.
Audit (F4)-(F6), the endpoint convention
in (F9), and the two cut-profile
specializations independently.

RESUME HERE: actual sparse-thick and
two-size cut-window profiles in
SparseThickLetters, then the remaining
tame polynomial lift-ideal descent.
Do not repeat the numerical three-case
budgets or these FewLowJumps sums.

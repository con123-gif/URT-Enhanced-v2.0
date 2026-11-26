# The Kisin cut walk and the actual cup-product coboundary

26 November 2026. Source-matched human derivation; independent audit
and native replacement replay outstanding. This continues the
unramified-cokernel/deep-point note at its actual LongGap consumer.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

| Source | Actual role | Blob |
|---|---|---|
| New/Lift/CupProductBound.lean | ScaledCupBounds.of_isSafe | a5dfa3dc1372433af295f751c4bd4917ed3e323c |
| New/Lift/LongGap.lean | safe exponents and scaledCupBounds_of_points_at_cuts | a94786663aac435dfc1ec846046c87f00ddad141 |
| New/Lift/HodgeExpansion.lean | Frobenius transport and bilinear exponents | 7f8955989647bee0ddf549506d1488cf09536046 |
| Lib/PadicHodge/WachGamma/KisinModuleDefs.lean | TateTwist.smallPart_spec | 344ef024f5ddaee84ab62c0753b8beafbfd602cb |
| New/Lift/ExponentTheorems.lean | cupOrthogonal consumer | 00f2467f84012fb67b4788ace502a70c5d4eedfc |

## 1. Four safety conditions and the precise coefficient module

Take the native pairing of sides $S,S'$ with crystalline cocycles
$\alpha(c),\alpha'(c')$ and a pairing
$P:Y\times Y'\to A=\mathbb Z/p^m(1)$. Let $\Gamma'$ be the
chart subgroup. In the Tate--Witt period module $\mathcal M$
put $\mathcal S=\mathrm{smallPart}(m)$, the image of
$W(\mathfrak m^\flat)$, and work modulo $\mathcal S$.
Both Galois action and Frobenius preserve it and commute.

Choose points $x,w$ above $p^e c$ and $x'$ above $p^{e'}c'$.
Write $X,W,Y$ for their first components in the two kernel
period modules. For $g\in\Gamma'$ set

$$
 A_g=gX-X+p^e\alpha(c)(g),\qquad
 B_g=gY-Y+p^{e'}\alpha'(c')(g).
$$

These are exactly the first components of $gx-x$ and
$gx'-x'$, not assumed to vanish. Absorb the third-side
cost by writing
$\langle u,v\rangle=p^\kappa P(u,v)$ in $\mathcal M$.
The four required safety conditions are the vanishing,
modulo $\mathcal S$, of

$$
 \begin{split}
 &\langle A_g,gB_h\rangle,\\
 &\langle W-X,B_g\rangle,\\
 &\langle gW-W+p^e\alpha(c)(g),\ g(\varphi Y-Y)\rangle,\\
 &\langle\varphi X-W,\ \varphi B_g\rangle
                   \qquad(g,h\in\Gamma').          \tag{W1}
 \end{split}
$$

They are precisely the four conditions of the native
ScaledCupBounds.of_isSafe. The same $w$ appears in
the second, third and fourth conditions.

## 2. An explicit coboundary, with its sign and continuity

The Artin--Schreier--Witt resolution in
TateTwist.smallPart_spec gives:

* $\varphi-1$ is onto $\mathcal M$;
* a class fixed by $\varphi$ modulo $\mathcal S$ is the
  image of a UNIQUE element of $A$;
* $A\cap\mathcal S=0$;
* for an admissible integral representation trivial modulo
  $p^m$ near the identity, every fixed linear period
  functional sends $hv-v$ into $\mathcal S$ near the
  identity, for every fixed $v$.

These are the exact period-ring inputs. The final clause
must not be replaced by an unsupported continuity
assertion about a chosen Witt-vector section.

Choose ONE $v\in\mathcal M$ solving

$$
       (\varphi-1)v=\langle W,\varphi Y-Y\rangle.     \tag{W2}
$$

Define the period-valued 1-cochain

$$
 \begin{split}
 E(g)={}&p^e\langle\alpha(c)(g),gY\rangle
       -p^{e'}\langle X,\alpha'(c')(g)\rangle\\
       &-\langle X,gY-Y\rangle+gv-v.               \tag{W3}
 \end{split}
$$

Here the factors $p^e,p^{e'}$ are in addition to the
$p^\kappa$ already in the pairing.
Use the inhomogeneous convention
$dE(g,h)=gE(h)-E(gh)+E(g)$.
The cocycle identities and equivariance of $P$ give

$$
 dE(g,h)=p^{e+e'+\kappa}
       P(\alpha(c)(g),g\alpha'(c')(h))
                    -\langle A_g,gB_h\rangle.      \tag{W4}
$$

For example the differential of the first term is
$-p^e\langle\alpha(c)(g),g(hY-Y)\rangle$.
The next two terms supply the other two cross terms;
expanding $\langle A_g,gB_h\rangle$ gives (W4).
The differential of $gv-v$ is zero. Thus the FIRST
condition of (W1) supplies the desired differential
modulo $\mathcal S$, with the displayed positive sign.

The other three conditions put (W3) in the correct
coefficient module. Let $D=\varphi Y-Y$, $U=W-X$,
and $Z=\varphi X-W$. Expand using (W2). Exactly

$$
 \begin{split}
 (\varphi-1)E(g)={}&
 \langle gW-W+p^e\alpha(c)(g),gD\rangle\\
                  &-\langle U,B_g\rangle
                   -\langle Z,\varphi B_g\rangle. \tag{W5}
 \end{split}
$$

In deriving this, use
$\varphi B_g=B_g+(gD-D)$, and
$g\langle W,D\rangle-\langle W,D\rangle
=\langle gW-W,gD\rangle+\langle W,gD-D\rangle$.
These account for every term; no additional scalar
or Frobenius normalization is introduced.
Conditions two through four of (W1) make (W5)
zero modulo $\mathcal S$.

Consequently there is a unique $\epsilon(g)\in A$ with
$E(g)-1\otimes\epsilon(g)\in\mathcal S$.
Injectivity of $A$ modulo $\mathcal S$ and (W4) imply

$$
 d\epsilon(g,h)=p^{e+e'+\kappa}
                P(\alpha(c)(g),g\alpha'(c')(h)).     \tag{W6}
$$

This cochain is continuous. Indeed the two original
cocycles reduced modulo $p^m$ vanish near the identity. The last clause of the
period-ring input, applied to the finitely many linear
functionals and vectors in (W3), makes its remaining terms
lie in $\mathcal S$ there. Thus $\epsilon(h)=0$ near 1.
For each fixed $g$, (W6) and vanishing of
$\alpha'(c')(h)$ near 1 give
$\epsilon(gh)=\epsilon(g)$ there. Hence $\epsilon$ is
locally constant everywhere. This checks continuity of
the actual selected cochain rather than assuming the
period-valued choice in (W2) has a continuous section.

The chart subgroup has finite index prime to $p$ in
the local group, as required by the native chart.
Restriction/corestriction kills the full local cup
class by this index, and this index is a unit on
$p$-primary cohomology. Thus (W6) proves the full local
cup class is zero. If $E_0\ge e+e'+\kappa$, multiply
the cochain by $p^{E_0-e-e'-\kappa}$.
This is the native ScaledCupBounds conclusion for
every permitted topology making the local embedding
open.

## 3. Why positive exponent inequalities give safety

The remaining input to (W1) is integral-Hodge membership,
not merely a numerical inequality. The following uses
the actual withExponents modules and their strictness
under the inclusion $Y\hookrightarrow\widetilde Y$.
That strictness follows from the frame/retraction and
extension-of-invariant-functionals lemma of LongGap:
a vector in the projection kernel with the prescribed
exponents has an antecedent in $Y$ with those SAME
exponents and in kisinLoc if the vector is there.

Let kernel vectors on the two sides have profiles
$a(a_0,u)$ and $b(a_0,v)$. Suppose a third-side point
above $p^\kappa$ is at the letter preceding $i$ by
$l$, with antitone profile $z$. If

$$
 a(a_0,u)+b(a_0,v)
 +(\mathcal F_{l,0}z)(a_0,-u-v-1)>0
                                  \quad\text{for all jumps},  \tag{W7}
$$

then inserting $z_\tau$ in EITHER kernel vector makes
their pairing safe. Here the exact Frobenius profile is

$$
 (\mathcal F_{l,n}z)(a_0,u)=
 \begin{cases}n,&a_0<l,\\z(a_0-l,u),&a_0\ge l.\end{cases}
$$

To see this, bilinear exponent addition puts the tensor
of the two antecedents against the third-side point
in the indicated Hodge filtration. The third dual
weight is $-u-v-1$, including the Tate shift $-1$.
Strict positivity in (W7), followed by the frame
integrality for the Tate lattice, puts its $\tau$
multiple in the integral Tate module. The remaining
Teichmüller factor in $z_\tau$ has tilt valuation
less than 1, so its image is in $W(\mathfrak m^\flat)$,
as required by safety. Antitonicity of $z$ permits
the comparison with the shifted tensor jump. The
projection of the third point supplies exactly
$p^\kappa$, not a separately chosen lift.

For a Galois difference of a point, first divide
by the normalized $z_\tau$ in the localized Kisin
module; the native depth lemma puts it in the
projection kernel with its prescribed depth
profile. The preceding argument applies and the
factor $z_\tau$ is restored, proving safety for
the original difference.

Frobenius transport has TWO profiles:
a point of profiles $(o,d)$ at $\sigma^{-l}i$
has at $i$ the point profile $\mathcal F_{l,0}o$
and difference-depth profile $\mathcal F_{l,1}d$.
The 1 in the latter is necessary. It comes from
the extra Frobenius factors in the transported
$z_\tau$ divisibility, not from a change of weight.

## 4. Construct three global points from the SAME cuts

Let the finite letter set have Frobenius permutation
$\sigma$. Let a cut set meet every orbit, and let
$l(i)$ be the least POSITIVE integer with
$\sigma^{-l(i)}i$ a cut. At cuts choose the three
points of LongGap.HasDeepPoint: the first two
above $p^e c,p^{e'}c'$, and the third above
$p^\kappa$, with its antitone profile. Their
profiles satisfy the EXACT HasDeepPoint conditions:

* for every backward position and pair of jumps,
  the chosen depth plus the third profile is
  strictly greater than the negative of the
  minimum of the other point's profile and
  its standard exponent $-v$;
* on the selected leading side, its point profile
  dominates stdExponent at length $l(i)$, and its
  depth plus the indicated earlier-third profile
  is strictly greater than the negative of the
  minimum of the other point's current and
  length-$l(i)$ transported profiles.

More explicitly, write $O_i,O'_i,Z_i$ for the three
point profiles. The first side's point has a depth
$D_i$ and a nonnegative $r_i$ with
$\sigma^{-r_i}i$ a cut. For EVERY $a\ge0$,
$u\in U_{\sigma^{-a}i}$ and
$v\in U'_{\sigma^{-a}i}$ its two inequalities are

$$
 Z_i(a,-u-v-1)+D_i(a,u)+\min(-v,O'_i(a,v))>0,
$$

and, when $Q(i)$ holds,

$$
 \begin{split}
 &\operatorname{stdExponent}_{l(i)}(a,u)\le O_i(a,u),\\
 &(\mathcal F_{r_i,0}Z_{\sigma^{-r_i}i})(a,-u-v-1)
       +D_i(a,u)\\
 &\hspace{12mm}+
 \min\big(O'_i(a,v),
       (\mathcal F_{l(i),0}O'_{\sigma^{-l(i)}i})(a,v)\big)>0.
 \end{split}
$$

Here stdExponent is 0 for $a<l(i)$ and $-u$ otherwise.
The second side has the identical two requirements with
the sides exchanged, its own depth and earlier cut,
and leading condition $\neg Q(i)$. These are the
exact HasDeepPoint hypotheses. They are (W7) with
the indicated minima, not new assumptions on the cocycles.
All backward positions and jumps are quantified,
including positions before $l(i)$; these use
the 0/1 branches of the displayed $\mathcal F$.
The preceding cokernel/depth-point note supplies
points, while the separate two-size/sparse/few-low
arguments must supply these quantitative profiles.
No cut or leading-side premise is deleted here.

For a predicate $P$ on cuts define

$$
 d_P(i)=
 \begin{cases}0,&i\text{ is a cut and }P(i),\\
               l(i),&\text{otherwise},\end{cases}
 \qquad
 U_P(x)=\sum_i\varphi^{d_P(i)}x(\sigma^{-d_P(i)}i).   \tag{W8}
$$

Every source point in this sum is at a cut.
Each summand is in the component of letter $i$
and projects to $p^e c_i$. Hence $U_P(x)$
projects to $p^e c$ for EVERY predicate $P$.
Minimality of $l$ gives

$$
 l(i)=d_{\mathrm{all}}(\sigma^{-1}i)+1,\qquad
           \varphi U_{\mathrm{all}}(x)=U_{\mathrm{none}}(x).
                                                               \tag{W9}
$$

The second equality is reindexing by $\sigma^{-1}$;
it uses the same cut points. If $Q$ is the actual
choice of leading side, set

$$
 x=U_{\mathrm{all}}(x_{\mathrm{cut}}),\quad
 w=U_Q(x_{\mathrm{cut}}),\quad
 x'=U_{\mathrm{all}}(x'_{\mathrm{cut}}).
$$

These are the three points required in §1. Their
projections have exactly the same specified powers
of $p$, independently of orbit lengths.

Pairings between DISTINCT letter components vanish:
the two actions of the coefficient Teichmüller
element agree under the bilinear pairing, while
the difference of two distinct residue eigenvalues
is a unit. Thus safety of sums reduces to safety
at EACH letter, without a triangle inequality.

| Condition in (W1) | Possible boundary term | Required comparison |
|---|---|---|
| first | Galois differences within one segment | the first depth inequality |
| second | only a cut with $Q$ false | the second side's leading/minimum inequality |
| third | $\varphi x'-x'$ only at cuts | use the selected current segment, or the preceding one according to $Q$ |
| fourth | only a cut with $Q$ true | the first side's leading/minimum inequality |

For the second row, $w-x$ is zero except at a cut
with $Q$ false; there it is the difference of the
preceding transported point and the current point,
both over $p^e c_i$. Its profile is the minimum
of their two point profiles. The fourth row is
the complementary boundary difference
$\varphi x-w$, by (W9). The third row uses
the same boundary decomposition on $x'$.
Apply (W7) after dividing each Galois difference
by $z_\tau$; the minima are exactly the two
HasDeepPoint comparisons. Away from these cuts
the boundary differences are zero. This proves
all four conditions with the SAME $w$ and
the SAME third-side points.

Sections 1-2 now give the actual continuous
cup-product coboundary. The exponent is
$e+e'+\kappa$; there is no factor for the
number of letters, cuts, jumps or ranks.

## 5. Actual caller and remaining frontier

ExponentTheorems.mem_cupOrthogonal_of_scaledCupBounds
applies the conclusion to the universal sides with
$C=Z_f(Y)$, keeping the actual congruence class
and Tate dual. It puts $p^{E_0}x$ in the actual
cupOrthogonal module. The graph-to-dual audit
then gives the correct oriented relative-index
bound and the original global block loss.

The remaining cut-supplier work is the construction
of the HasDeepPoint profiles in sparse-thick and
two-size cases and the quantitative few-low length
argument; their numerical guards have the editor's
existing three-case audit. The foundational frame,
coordinate, Hodge-pairing and Artin--Schreier--Witt
inputs are kept explicit. Independent audit must
check the exact exponent profiles at the cuts
and the near-identity step in §2.

No new native Lean execution or independent
mathematical audit is claimed; this is not
verification of the whole RH reconstruction.

Executed local exact algebra check:
verify_compact_cup_cochain.py expands (W4) and
(W5) over the free bilinear pairing on independent
basis vectors, using symbolic powers as parameters.
Both universal polynomial residuals are zero.
Omitting the correction term in (W3) and reversing
the sign of (W2) each give a nonzero residual.
The adjacent COMPACT_CUP_COCHAIN_CERT.json records
these results and their limits. This checks the
cochain algebra only; it does not check the
period-ring inputs, continuity or cut profiles.

RESUME HERE: audit (W4)-(W5), then construct the
actual SparseThickLetters and TwoSizeCuts profiles
and the FewLowJumps length supplier, using the
same points and the existing unramified bound.

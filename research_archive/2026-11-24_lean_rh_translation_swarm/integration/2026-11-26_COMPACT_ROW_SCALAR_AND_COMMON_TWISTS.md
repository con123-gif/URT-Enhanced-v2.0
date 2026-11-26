# Actual arithmetic rows: scalar order and one row for all twists

26 November 2026. Source-matched human derivation; independent mathematical
audit and native replacement replay outstanding. This supplies the scalar
order clause explicitly retained by Galois RUN51 and RUN54, and connects it
to the actual `RowsExist` consumer. Their integral matrix-span and primitive
orbit arguments are reused, not claimed as new. Attribution: Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

| Source | Declaration or role | Git blob |
|---|---|---|
| `New/Selmer/LabelledColumns.lean` | `IsLabelledColumn.isRow`, inertia roots, twist transport | `3f0ed49bf089805f3269d5161130526dfcf1a038` |
| `New/Selmer/RowsExist.lean` | `exists_row_for_all_twists`, `exists_hasRow_auxPair` | `3faeb868305f3619007179e2447907dc6109b852` |
| `New/Selmer/AptTupleDefs.lean` | exact `IsApt`, `IsRow`, `HasRow` quantifiers | `ba41ff0e729d5182ac236911898dfd0865165f8c` |
| `Lib/General/Groups/ResidualIrreducibility.lean` | integral tame-pair span and scalar | `9b2111a153ff984ae9242da26b8b68075ae6b06e` |
| `Lib/LocalGL/Green/LabelIdempotents.lean` | primitive Frobenius orbit separation | `15901cb83be961651cb7d38dee539d839dd9d91a` |
| `New/Data/Different.lean` | fixed parameters and character order | `44f64349db3642e89b752cc92979999edac5c185` |
| `New/Data/AdmissibleData.lean` | the actual scale guards | `04208a5044bb7cf6464ef142a14d939148bed834` |
| `New/Seesaw/IndexTypes.lean` | `orderOf_ω`, `q_eq_g` | `10e0416c5d653fedde38fcd6bf895a2127a3e1a0` |
| `Lib/GaloisRep/Main/SphericalAllRanks.lean` | retained all-rank attachment supplier | `5a170d89273e4a876bf80edd81453c937a365d08` |

## 1. Exact hypotheses and the scalar-order statement

Fix one admissible datum $D$, one coefficient prime $\ell$, and an
apt auxiliary pair $O$ with labels $c$ and tame character
$O.\psi=\omega^j\vartheta.\psi$, $1\le j\le m$. Write $r_0$
for the rank of the labelled block and $R_D$ for `D.r`, so that
$r_0\le R_D$. An apt label has, above EACH of the two distinct
primes $g_0,g_1$, either a primitive label of degree
$r_0=R_D=3^{e+1}$, or $r_0=1,c=X-1$. The twisted labels have no
root 1. The auxiliary $\vartheta.\psi$ is trivial at these chosen
places.

Let $U$ be the labelled representation after the precise avatar twist
in `RowsExist`; its jumps satisfy `IsRowType`. The row clause to prove is
that some $\gamma_0$ in inertia above
$\{g_0,g_1\}\setminus\{\ell\}$ and some scalar $y$ satisfy

$$
 U(\gamma_0)=yI,\qquad
 \left\|(y^{\ell^a})^t-1\right\|_\ell=1
 \quad(a\ge0,\ 1\le t\le4r_0+2).                    \tag{R1}
$$

This is stronger than merely $y\ne1$. It concerns one fixed scalar
and all the indicated powers, and will hold on every invariant lattice
over every sufficiently large coefficient ring.

Put $M=(N_0d)^{s+6}$. The hypotheses give
$18480\mid N_0$, $M^2\mid g_i-1$,
$m=2^u,\ s=22u,\ u\ge1$, and
$m\ge x^{1/2},\ R_D\le3x^5$. Hence

$$
 R_D\le3m^{10},\qquad
 j(4r_0+2)\le14m^{11}<64m^{22}=2^{s+6}.             \tag{R2}
$$

The strict inequality follows already for $m\ge1$; no asymptotic
qualification or extra size premise is needed here.

## 2. Construct the SAME scalar and prove its residue order

Choose $g_i\ne\ell$, and the apt distinguished place above it. Its
residue cardinality is exactly $q=g_i$. Let $\tau$ be the actual
tame generator at that place. The labelled local compatibility supplies
the annihilating tame polynomial, not just a list of possible
eigenvalues. Inertia has finite image, so (A=U(\tau)) is semisimple
in characteristic zero. Its eigenvalues are among the roots of the
twisted label, with exactly the following common-power property:

$$
 \xi^e=y\quad\text{for every label root }\xi,
 \qquad y^v=1\ \Longrightarrow\ M\mid jv.             \tag{R3}
$$

For a primitive label, its roots are
$\xi,\xi^q,\ldots,\xi^{q^{r_0-1}}$ and
$e=(q^{r_0}-1)/(q-1)$. Scaling its roots by a scalar of order
dividing $M$ preserves primitivity, because $M^2\mid q-1$; this is
the primitive-scaling argument of Galois RUN54 §1. Their product $y$
has order exactly $q-1$. Thus $y^v=1$ implies $M\mid v$, which
implies (R3).

For the rank-one label $X-1$, take $e=1$ and let $y$ be its
twisted root. Its underlying character is $\omega^{-j}$ at the
chosen place, since $\vartheta.\psi=1$ there. As
$\operatorname{ord}(\omega)=M$, $y^v=1$ implies $M\mid jv$.
This includes the rank-one branch omitted by an argument restricted to
primitive labels of degree $R_D$.

Semisimplicity and (R3) give $A^e=yI$. Set
$\gamma_0=\tau^e$; it remains in the same inertia group. Since

$$
 U(\gamma_0)=yI,
$$

this scalar witness is chosen before the power parameters in (R1).

For any finite-order $\ell$-adic unit $z$, if
$\|z-1\|_\ell<1$, its prime-to-$\ell$ part is trivial:
reduction is injective on roots of order prime to $\ell$, by
factoring $X^b-1$ at 1 when $\ell\nmid b$. Therefore
$z^{\ell^v}=1$ for some $v\ge0$.

Suppose the norm in (R1) were $<1$. Applying this observation to
$z=y^{\ell^a t}$, (R3) gives
$M\mid j\ell^{a+v}t$. Choose $p\in\{2,5\}$ different from
$\ell$; both primes divide $N_0d$. Then

$$
 p^{s+6}\mid jt,\qquad
 2^{s+6}\le p^{s+6}\le jt\le j(4r_0+2),
$$

contrary to (R2). Since $z$ is a unit, its difference from 1 has
norm at most 1, proving equality and (R1). The same argument applies
for every $a,t$, so no new witness is selected after either parameter.

## 3. Integral span, the OTHER scalar, and local determinant costs

Use Galois RUN54 §1 for the prime-power images of the primitive
Frobenius orbit and RUN51 §2 for integral spectral projectors. For every
sufficiently large coefficient DVR $\mathcal O$ containing a
chosen tame root, and for EVERY $U$-invariant lattice $L$, distinct
orbit eigenvalues have unit differences. Consequently the rank-one
spectral projectors are integral polynomials in $A$. If $F$ is the
matrix of the actual Frobenius lift, the tame relation is

$$
 A^q=F^{-1}AF.
$$

It makes $F$ permute the $r_0$ eigensummands transitively, hence its
powers and the projectors supply all integral matrix units. Thus
$\mathcal O[U(G_E)]=\operatorname{End}_{\mathcal O}(L)$. This
conclusion is uniform over invariant lattices; one must not first
choose a special eigenlattice and silently replace the actual lattice.
When $r_0=1$, the full span conclusion is immediate from the identity.

Also $A^{q^{r_0}}=A$, so $F^{r_0}$ commutes with $A$ and $F$.
It commutes with all the matrix units just generated and is scalar.
It is an invertible scalar on $L$. The source Frobenius convention
uses the group element $g=\phi^{-r_0}$, whose cyclotomic value is
$g_i^{r_0}$; its matrix is $F^{-r_0}$, also scalar. This $g$
is DISTINCT from the inertial $\gamma_0$ of (R1).

For inertia at EVERY place above $g_0g_1$ away from $\ell$,
reuse `exists_inertia_eigenvalues` and Galois RUN54 §3. All inertia
roots are killed by $q^{r_0!}-1$; each also has order dividing
some $q^d-1$, $1\le d\le R_D$. The latter integer divides
`chosenGroupOrder`, giving the actual bound

$$
 v_\ell\det(U(\gamma_v)-I)
 \le r_0\operatorname{cr}_\ell,
 \qquad
 \operatorname{cr}_\ell=v_\ell(\text{chosenGroupOrder})+2^{-\ell},
                                                               \tag{R4}
$$

for both the chosen inertial element and its conjugate inverse. No
root is 1 at the selected generator, by the apt-label hypothesis.
The source also needs an inertia-killing exponent $N$ with
$v_q(N)=0$; take $N=q^{r_0!}-1$. **This does not assert
$v_\ell(N)=0$.** The local valuation in `IsRow.inertia_above_g`
is at the place over $q$, not the coefficient valuation.

Together with the original `IsColumn` and jump clauses, (R1), full
integral span, the scalar $g$, and (R4) supply every field of `IsRow`.
The established finite-type/label compatibility inputs remain in use.

## 4. Choose the row BEFORE quantifying over twists

Take the actual untwisted apt pair $O$, its rank $r_0$, and
$t_0=O.\mathrm{rankDiff}$. Both are odd, so
$a=(r_0-t_0)/2\in\mathbb Z$. Let $R$ be the labelled
representation with untwisted labels $c$ and jumps $J$ attached
to the fixed good eigensystem $b$. The precise twist used in
`exists_row_for_all_twists` is

$$
 T=\eta R,\qquad
 \eta=(O.\mathrm{hasWeight}^{-1}.\mathrm{toAlgebraic}(0,a))^{\mathrm{avatar}}.
                                                               \tag{R5}
$$

Twist transport scales each label root by the inverse tame part of
$O$ and changes its jumps to

$$
 J_\sigma-\left((r_0-t_0)/2-
       \mathrm{cmSign}(\sigma)\,O.\mathrm{weight}(\sigma)\right).
                                                               \tag{R6}
$$

The jump premise in `RowsExist` is EXACTLY `IsRowType` for (R6), with
parameter $t_0$; $t_0-1+2a=r_0-1$ also gives the required
conjugate-duality exponent. The preceding three sections therefore
make this ONE $T$ a row.

Now quantify over every tame character $\vartheta$, every pair
$V$ with $\mu_V=\mu_O\vartheta$, every eigenform $y$ lifting
$b$ on $V$, and every representation $S$ attached to its Hecke
system. At an unramified split prime outside their finite bad sets,
the spherical theta Hecke identity gives the block-plus-string
characteristic polynomial. Its constant coefficient fixes the
normalization; its derivative at zero, equivalently its next
coefficient in the source convention, gives

$$
 \operatorname{tr}(\mathrm{normalisedRep}_V S)(g)
 =\vartheta^{-\mathrm{avatar}}(g)\operatorname{tr}T(g)
       +\sum_{e=0}^{V.\mathrm{rankDiff}-1}\mathrm{cycInv}(g)^e.    \tag{R7}
$$

Here `normalisedRep` is the actual `chiOneInv` avatar normalization
from `AptTupleDefs`, not an independently selected Tate twist. The
same Frobenius limit for the FIXED system $b$, the attached
representation's coefficient limits, and the two avatar Frobenius
identities give (R7) along `mostFrobeniiAt g` for every $g\in G_E$.
Continuity and uniqueness of limits give (R7) at every $g$, not
merely on an unramified set. The excluded finite set may depend on
the already quantified $V,y,S$, which is legitimate for this limit;
the representation $T$ does not. This proves the full `HasRow O b T`
contract and its order of quantifiers.

## 5. The eigensystem in the actual determinant consumer

`exists_hasRow_auxPair` starts with a NONZERO intersection of the good
forms on $W_m$ with the eigenspace for one fixed system $p$, and
with $1\le j\le m$. The algebraic-form equivalence for the actual
Harish--Chandra parameter is equivariant and preserves the chosen
level. The sum of good-tuple idempotents selects a nonzero label
component. Hecke equivariance makes its image an eigenform for the
SAME $p$, not an unrelated eigenpacket. Its parahoric type supplies
`HasProductLabel`; the all-rank definite-unitary attachment supplies
$R$, its Frobenius coefficient limits and local clauses. The actual
diagram-weight/Harish--Chandra identity gives (R6). Aptness is the
existing `isApt_auxPair` theorem. Section 4 applies to this $p,j$
and returns a row serving all allowed twists.

The row may depend on $\ell,p,j$, as the native consumer allows.
It is not allowed to depend separately on the later tame twist or
the choice of an attached lifted eigenform. These are the rows used
by `FitTwistsExist` and the comparison determinants; the pointwise
Selmer bounds must keep these same witnesses.

## 6. Verification boundary and next supplier

This fills the previously retained scalar-order argument, including
rank one, and integrates the already derived integral span with the
actual common-twist row construction. It is a human derivation from
the listed source inputs, not new verification of their deep
attachment and local-global compatibility. Required inputs still
include the all-rank attachment theorem with its weight/local
hypotheses, the spherical theta Hecke identity, apt-tuple existence,
the form equivalence and parahoric compatibility. The source proves
the even-rank attachment using two auxiliary odd-rank lifts; it must
not be replaced by an unchecked generic attachment assertion.

No new Lean execution was performed. The successful historical
targeted replay and the later partial primitive replay do not check
this human replacement. No conclusion that C or RH is finished.

RESUME HERE: audit (R3) at both apt-label branches and the order of
quantifiers in (R7); then reconstruct the actual comparison-form
and Rallis pairing suppliers at `RowVolume`/`ComparisonForms`, or
the retained Kisin cut/cokernel and lifting inputs at the crystalline
defect caller. Do not redo the scalar endgame, optional aggregate
Selmer route, or the integral matrix-span proof already in RUN51.

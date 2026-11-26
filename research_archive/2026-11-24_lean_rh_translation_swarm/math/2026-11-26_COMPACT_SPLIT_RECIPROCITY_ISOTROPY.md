# Compact Theorem C: split-prime reciprocity supplies mirror isotropy

Status: **source-matched reconstruction of the `exists_split_primes_relations` output and its exact use in `length_le_of_unseen_class`; native replay pending**.

This closes the explanatory gap left by the preceding pencil and mirror notes: how the Greenberg–Wiles split-prime relation produces the coset-isotropy hypothesis consumed by `card_le_torsion_of_isotropic`.  The deep power-residue reciprocity theorem remains an explicitly cited arithmetic input.  No RH theorem or final determinant estimate is imported.

## 1. Pinned source and actual consumer

Primary source: `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, under
`grh-compact/src`.

| Declaration | Path | Blob | Lines |
|---|---|---|---:|
| `selmerZ1.exists_split_primes_relations` | `Lib/ClassField/GreenbergWiles/SelmerRelations.lean` | `a4ec7652040bfb6e7149d286104b4d13c82bf211` | 56–141 |
| `SplitPlaces.power_residue_reciprocity` | `Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean` | `fbfa4f703035c833491594169f2089c01fda3d03` | 47–124 |
| `card_le_torsion_of_isotropic` | `New/Selmer/LinePointPowers.lean` | `654567bac00341a29102ee3b83266bda10ab22a9` | 19–53 |
| `IsPencil.length_le_of_unseen_class` | `New/Selmer/TiltingLemma.lean` | `62784266136a2936dd6f8d662b79fa051d28c470` | 94–199 |

Downstream:

\[
\texttt{power\_residue\_reciprocity}
\to\texttt{exists\_split\_primes\_relations}
\to\texttt{length\_le\_of\_unseen\_class}
\to\texttt{exists\_isPencil}
\to\texttt{exists\_anticyclotomic\_twist}
\to C.
\]

Peer `f6f7223` derived the two-term mirror polarization and the bounded pencil induction but correctly left this reciprocity-to-isotropy conversion open.  Later aggregate determinant/root-selection notes do not replace it.

## 2. Exact split-prime theorem interface

Let `K` be an embedded number field; `R` a commutative coefficient ring;
`M` a finite discrete `R`-module with Galois action, also a module over
`Z/mZ`; `S` a finite set of places; `A_v` chosen closure places; and `L_v`
local conditions.  Assume:

1. `M` is unramified outside `S`;
2. every coboundary lies in `L_v` for `v∈S`;
3. complex conjugations act trivially on `M`;
4. `U` is an open normal subgroup fixing `M` and `μ_m`, and contains no
   complex conjugation.

Put

\[
Y(T)=\operatorname{selmerZ1}(M,S,A,L;\operatorname{range}T).
\]

The theorem chooses, independently of any later functional `n`, the following
finite data:

- a level `q`, a finite index type `I`, and split auxiliary places `v_i`;
- closure places, Frobenii `φ_i∈U`, and tame generators `γ_i`;
- a locally constant quotient map `π:G_K→I_0` and a finite exceptional set
  `T` containing `S`;
- `FrobeniiDetectRoots`, and the Greenberg–Wiles cardinal inequality.

Its functional conclusion preserves all quantifiers.  For every family of
additive maps

\[
n_i:M\longrightarrow N
\]

such that

\[
\forall x\in Y(\{v_i\}),\qquad
\sum_i n_i(x(\gamma_i))=0,                                  \tag{2.1}
\]

there is a single extension, still denoted `n`, on the finite quotient such
that

\[
n(\pi\phi_i)=n_i,                                            \tag{2.2}
\]

\[
n\!\left(\pi(a g b g^{-1})\right)(x)
=n(\pi a)(x)+n(\pi b)\bigl(\bar\chi_m(g)\rho(g)^{-1}x\bigr)  \tag{2.3}
\]

for `a,b∈U`, and, for **every** finite injective family of new split places
`P_j∉T`, closure places `C_j`, Frobenii `ϕ_j∈U`, tame generators `δ_j`, and
every `x∈Y({P_j})`,

\[
\boxed{
\sum_j n(\pi\phi_j)\bigl(x(\delta_j)\bigr)=0.}               \tag{2.4}
\]

Equation (2.4) is the decisive reciprocity equation used by the unseen-class
argument.  The theorem does not choose a new extension for each new family.

## 3. Construction of the fixed split-prime system

Choose an integer `r` divisible by `m`, by all residue characteristics in
`S`, and by the finite ramification data of `U`.  The group of `r!`-units in
the fixed field of `U`, together with their `m`-th roots, is finitely
generated.  Therefore an open normal subgroup acts trivially on the finite
quotient of these roots relevant to the construction.

Let `I=G_K/U` after this finite refinement.  Chebotarev supplies one prime for
each element of `I`, avoiding the already fixed finite set, with Frobenius in
the desired coset.  These primes are distinct and off the new level `q=r!`.
Their inertia groups lie in `U`.  Choose tame generators `γ_i`.  The resulting
record is exactly `SplitPlaces`: it includes the class-group generation
condition through

\[
\operatorname{principalIdele.range}
\;\vee\;\operatorname{idelesUnitOff}=\top,                   \tag{3.1}
\]

not merely a list of Chebotarev primes.

If an `m`-th root of a fixed `q`-unit is fixed by every selected `φ_i`, its
stabiliser contains representatives of every quotient coset and the relevant
unit generators.  Hence it is fixed by all of `U`.  This is the exact
`FrobeniiDetectRoots` clause later used in the Greenberg–Wiles bound.

## 4. Cardinal lower bound for the relation space

Let

\[
E:Y(\{v_i\})\longrightarrow M^I,qquad
E(x)=(x(\gamma_i))_i.
\]

The families in (2.1) form the annihilator of `E(Y)` under the finite pairing
between `M^I` and additive maps `M^I→Q/Z`.  Finite Pontryagin duality gives

\[
\#\operatorname{Ann}(E(Y))\,\#E(Y)=\#M^{\#I}.               \tag{4.1}
\]

The kernel of `E` is an unramified Selmer group, so it injects into the finite
unramified-cocycle module.  Combine (4.1) with the native Greenberg–Wiles lower
bound (`card_mul_pow_le`):

\[
\#Y(\varnothing)\,\#M^{\#S+r_2}
\le
\#\operatorname{Ann}(E(Y))\,\#M
\prod_{v\in S}\#(L_v\cap Z^1_v).                            \tag{4.2}
\]

The source proves (4.2) without dividing by `#M`; all factors are finite
natural-cardinal factors.  This cardinal statement is used earlier in
`length_le_of_unseen_class` to compare the global Selmer module with the family
of relation functionals.  It is not inferred from the covariance relation.

## 5. Why every annihilating family extends

`SplitPlaces.power_residue_reciprocity` constructs an additive power-residue
map `b` on fixed `q`-units.  Its two relevant outputs are:

- trivialised cocycles satisfy the global power-residue sum;
- conversely, because the fixed field is totally complex, every compatible
  finite functional is represented by the tame values of a trivialised
  cocycle.

To extract covariance, fix quotient indices `i,j,k`, an element `g`, and a
coefficient `a∈M`, with the quotient equality

\[
\pi(\phi_i)=\pi\bigl(\phi_j g\phi_k g^{-1}\bigr).            \tag{5.1}
\]

The converse power-residue statement supplies one cocycle `z∈Y({v_i})` whose
tame values are exactly

\[
z(\gamma_h)=
\begin{cases}
a,&h=i,\\
-a,&h=j,\\
-\bar\chi_m(g)\rho(g)^{-1}a,&h=k,\\
0,&\text{otherwise}.
\end{cases}                                                  \tag{5.2}
\]

Repeated indices are handled by addition in (5.2), not by assuming them
distinct.  Apply the annihilation hypothesis (2.1):

\[
n_i(a)-n_j(a)-n_k\!\left(\bar\chi_m(g)\rho(g)^{-1}a\right)=0.\tag{5.3}
\]

Taking identity indices in (5.3) first yields (2.2); substituting the quotient
identity for `a(gbg^{-1})` then yields (2.3).  Thus covariance is a consequence
of an actual Selmer cocycle with the three values (5.2), not an arbitrary
extension of functions on a generating set.

## 6. New-prime reciprocity by cancellation of ramification

Adjoin the proposed new split places `P_j` to the old split system, producing
the sum-indexed `SplitPlaces` record `s'`.  For each `j`, the same construction
as (5.2) produces a correction cocycle `u_j` whose new tame value matches
`x(δ_j)` and whose old tame values record the corresponding functional
`n(πϕ_j)`.

Consider

\[
x_0=x-\sum_j u_j.                                            \tag{6.1}
\]

At a new place `P_j`, all corrections except `u_j` have zero tame value.  The
matching value makes `x_0(δ_j)=0`.  The native
`SplitPlaces.apply_inertia_eq_zero` then promotes vanishing at the chosen tame
generator to vanishing on the entire inertia group: the module is fixed by
`U`, is killed by `m`, and every inertia value is a natural multiple of the
chosen tame value.  Hence `x_0` is unramified at all new places and belongs to
the original `Y({v_i})`.

Apply (2.1) to `x_0`.  Substitute the prescribed old tame values of each
`u_j`; the old terms cancel exactly, leaving

\[
0=\sum_j n(\pi\phi_j)(x(\delta_j)),
\]

which is (2.4).  This is the source's sum-indexed construction at lines
131–141 of `SelmerRelations.lean`.  It uses one common extension `n` and one
simultaneous correction (6.1).

## 7. Substitution into the mirror-isotropy consumer

Inside `IsPencil.length_le_of_unseen_class`, fix one relation functional
`x_w`, one old cocycle `y`, a scalar `t`, and an element `h` of the normal
mirror subgroup.  The locally constant pairing

\[
g\longmapsto x_w(g)\bigl(t\,y(g)\bigr)                       \tag{7.1}
\]

is used to choose, via anticyclotomic Chebotarev, a new prime `P` whose
Frobenius is close to the prescribed product `z h`, together with its conjugate
`\bar P`.  The hypothesis that no new prime shortens the Selmer group supplies
a relaxed cocycle `y'` whose paired tame values at `P,\bar P` equal the paired
Frobenius values of `y`.

Apply (2.4) to the two-place family

\[
(P,\bar P),\quad
(\phi_P,\phi_{\bar P}),\quad
(\delta_P,\delta_{\bar P}),
\]

and the cocycle `t y'`.  The tame-generator comparison at the conjugate place,
the cocycle inverse formula, and the anticyclotomic character relation turn
the two terms into

\[
x_w(zh)\bigl(t\mathbin{\bullet}y(zh)\bigr)
-x_w(c(zh))\bigl(t\mathbin{\bullet}y(c(zh))\bigr)=0.       \tag{7.2}
\]

Therefore

\[
x_w(zh)(t\mathbin{\bullet}y(zh))
=x_w(c(zh))(t\mathbin{\bullet}y(c(zh))),                  \tag{7.3}
\]

which is precisely the `hq` coset-isotropy hypothesis of
`card_le_torsion_of_isotropic`.  The same `w,y,t,z,h` occur on both sides; no
separately chosen prime or cocycle is substituted after reciprocity.

The mirror cardinality theorem then bounds the number of relation functionals
by the scalar torsion kernel.  Combining this with (4.2), the local evaluation
injections at the old auxiliary primes, and the balanced local-length budget
gives `length X≤β`.  Thus the reciprocity block attaches directly to the tied
prime descent already reconstructed; it is not another independent Selmer
estimate.

## 8. Premise and audit boundary

This derivation preserves rather than reproves these deep inputs:

- global class field theory and the principal-idele reciprocity used inside
  `power_residue_reciprocity`;
- finite generation of fixed `S`-units and the Kummer character construction;
- Chebotarev with the prescribed finite avoidance and quotient cosets;
- the Greenberg–Wiles cardinal inequality under its exact complex-conjugation,
  local-condition, and `HasFewCocycles` hypotheses.

The contribution is the exact human reconstruction of how those inputs produce
one extension satisfying (2.2)–(2.4), and how the two-place instance becomes
the isotropy equation (7.3).  It does not declare these standard arithmetic
theorems premise-free or locally reverified.

Verification performed:

- exact source pin and four Git blob identities checked;
- declaration anchors and source line ranges checked in the pinned checkout;
- exhaustive finite-group regression of the three-term implication (5.3) and
  two-place cancellation was run separately;
- `git diff --check` is required before commit.

Local `lean`, `lake`, and `elan` remain unavailable, so the companion
certificate is prepared but no native PASS is claimed.  No dependency-graph
edge or axiom record is removed.

## RESUME HERE

Trace the remaining primitive below `power_residue_reciprocity`: the exact
Kummer-character construction `exists_kummer_chars` and the final use of
Artin reciprocity at `SplitPrimeReciprocity.lean` lines 80–124.  Give a minimal
human proof of the two directions actually consumed here—global residue-sum
vanishing and representation of compatible finite functionals—while retaining
the fixed-field, principal-idele, total-complexity, and root-detection
hypotheses.  Then the editor can replace the current prose placeholder for C's
mirror reciprocity with equations (5.3), (2.4), and (7.3).


# Compact C: balanced rows and the local crystalline budget

Status: **source-matched reconstruction of `IsRow.eventually_isBalanced` and
its direct consumer; native replay pending**.

The simultaneous Galois-lane result `dc4a4eec` already reconstructs the
central-element cocycle count, so this contribution advances its explicit
`RESUME HERE`.  It explains how one actual row supplies all fields of
`IsBalanced`, with the same lattice and coefficient ring, and how its local
length inequality enters the twisting theorem.  No RH conclusion is imported.

## 1. Pinned source and target

Source pin: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
paths relative to `grh-compact/src`.

| role | declaration/path | blob |
|---|---|---|
| constructor | `IsRow.eventually_isBalanced`, `New/Selmer/RowBalanced.lean` | `ab1371acacfb1c5f262146456a380a9111ce6444` |
| target record | `IsBalanced`, `New/Selmer/Corepresentable.lean` | `3e401695d96b8ea826d60dadf0174d366f85d37c` |
| tame local bound | `length_localCocycles_le`, `Lib/ClassField/GaloisCohomology/TameCocycles.lean` | `0c8ac30cf6a6b0307f199f1a1594245729ff49bf` |
| relation bound | `length_obeying_relationsOn_le`, `Lib/General/Algebra/FittingDuality.lean` | `50c522f409cc0214163df1d26b77aede4aa8100a` |
| crystalline rank | `finrank_crysCocycles_eq_add_neg_jumps`, `New/Selmer/CrystallineRank.lean` | `601a4af17cf5f164a2a3b947442192661c680650` |
| determinant kernel | `length_ker_le_addVal_det`, `New/Selmer/DeterminantBound.lean` | `686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df` |
| finite-place budget | `ellVal_le_crudeUnit`, `New/Selmer/AptTuples.lean` | `49699d4679d83a7bc7714afc53b7e2757ae4adf3` |
| consumer | `exists_mFoldTwist_selmerLengthLe`, `New/Selmer/TwistForRows.lean` | `802242498ad4530e7f52cc4f14e0a03be2c59f4d` |

Fix a row `R` of rank `n`, a chosen place `w` above one of the two chosen
residue characteristics and away from `ell`, and an exponent `M`.  For every
sufficiently large coefficient ring `O`, the source chooses one lattice
representation `u`, one inertial element `gamma`, and one defect `beta` such
that

\[
 \|\beta+\sum_{b\in\{0,1\}}
 v_O\det(u(\operatorname{idOrConjInv}(b,\gamma))-1)\|_O
 \le 10 f n\,\mathrm{cr}_\ell,                              \tag{1.1}
\]

and `IsBalanced ell S0 u (crysRels u) gamma beta M` holds.  Here
`Sg=placesAboveG(D)\setminus placesDividing(ell)` and
`S0=placesDividing(ell)\cup Sg`, represented by its finite set; also
`cr_ell=crudeUnit ell D`.  The norm on a length is the source's
normalised length; (1.1) is not an unnormalised integer inequality.

## 2. One lattice supplies the structural fields

The lattice `u` is obtained from the row's eventual lattice theorem.  No
later field of `IsBalanced` changes it.

* **Continuity modulo `ell^M`.**  Continuity of `R`, transported through the
  lattice equivalence and then the discrete quotient `O/ell^M`, makes
  `reduceModPow ell M u` locally constant.
* **Unramified off `S0`.**  `IsRow` extends `IsColumn` with empty extra level.
  The lattice dictionary is faithful, so the source identity `R(g)=1` on
  inertia off `S0` implies `u(g)=1` there.
* **Full matrix span.**  The same eventual lattice theorem supplies
  `span_O(range u)=M_n(O)`.
* **Scalar inertia.**  `exists_scalar_inertia` gives an inertial `gamma` and a
  scalar root `y`.  The row's trace self-duality gives, on the same lattice,
  \[
  u(\gamma)=sI,\qquad
  u(c\gamma)^{-1}=sI.                                      \tag{2.1}
  \]
  The source first obtains the general conjugate scalar
  `cycInv(g^{-1})^(t-1)s`; cyclotomic triviality at this inertial element
  reduces it to `s`.  The residue-order condition for powers of `y` makes
  both `s-1` and `s+1` units.
* **Large residue field.**  The same residue-order condition forces the order
  of the residue of `s` to exceed `4n+2`, hence
  `4n+2 < #k_O`.
* **Coboundaries.**  A coboundary `g -> u(g)b-b` is crystalline at every
  `ell`-adic place.  Therefore it obeys `crysRels u`; this proves the record's
  `coboundary_mem` for every quotient `O/a` without choosing a new lattice.

These are precisely fields 1--6 of `IsBalanced`; the only nonformal field is
the local length estimate below.

## 3. Split the local sum before bounding

For `a | ell^M`, split the set in the record as

\[
 S_0=S_\ell\sqcup S_g,\qquad
 S_\ell=\{v:v\mid\ell\},\quad
 S_g=\operatorname{placesAboveG}(D)\setminus S_\ell.        \tag{3.1}
\]

This split is disjoint in the source.  At `v in S_ell`, inclusion of local
conditions gives

\[
 \ell_O(H^1_{\rm loc}(v))
 \le \operatorname{rank}_O Z_f(L_v)\,\ell_O(O/a).           \tag{3.2}
\]

The relation-module bound proves (3.2): functions obeying all relations of a
finite module `Z` have length at most `rank(Z) length(O/a)`.  The
potentially-crystalline rank formula then expands

\[
 \operatorname{rank}_O Z_f(L_v)
 =n+\sum_{\sigma\text{ induced by }v}
       \#\{\text{negative Hodge--Tate jumps at }\sigma\}.   \tag{3.3}
\]

The induced embedding sets for distinct `v|ell` are disjoint.  Hence
`sum_complexEmbOf_le` bounds their combined negative-jump sum by the global
row jump count.  The `IsRowType` identity pairs the jumps at `sigma` and its
CM conjugate; after adding the `n` terms, the result is exactly the
`numInfPlaces(E) * length((O/a)^n)` part of the target.  There is no repeated
counting of a complex embedding.

At `v in S_g`, the row supplies an inertia exponent `m_v`, a tame generator
`gamma_v`, and triviality of `u(i^m_v)`.  Since `v` is away from `ell`,
`m_v ell^M` is a local unit.  The tame affine-action lemma therefore gives

\[
 \ell_O(H^1_{\rm loc}(v))
 \le \ell_O((O/a)^n)
   +\ell_O\ker\bigl(u(\gamma_v)-1:(O/a)^n\to(O/a)^n\bigr). \tag{3.4}
\]

Smith normal form, before any norm estimate, yields

\[
 \ell_O\ker(u(\gamma_v)-1)
 \le v_O\det(u(\gamma_v)-1).                               \tag{3.5}
\]

Equations (3.2)--(3.5), plus the two scalar elements `g,cg` in the record,
give the exact unnormalised field

\[
\begin{aligned}
 &\sum_{v\in S_0}\inf_{A|v}\ell_O(H^1_{\rm loc}(A))
 +n\,v_O\!\left(\alpha-\chi_{\rm cyc}(cg)\alpha'\right)\\
 &\hspace{1cm}\le
 (|S_0|+\operatorname{numInfPlaces}(E))
 \ell_O((O/a)^n)+\beta.                                    \tag{3.6}
\end{aligned}
\]

The infimum is bounded using the canonical closure place chosen in the proof;
it is not replaced by equality.  The scalar determinant term in (3.6) is
controlled by `length_ker_le_addVal_det` after the row's conjugate-scalar
identity.  The leftover defects are, by definition, included in the single
`beta` chosen with `u`.

## 4. The uniform finite-place budget

For each place in `Sg`, `inertia_above_g` already gives

\[
 v_\ell\det(R(\gamma_v^{\pm c})-1)
 \le n\,\mathrm{cr}_\ell.                                  \tag{4.1}
\]

Lattice transport preserves the determinant.  There are at most `4f` such
places (`card_le_of_subset_placesAboveG`).  The remaining scalar determinant
is a divisor of `g_i^d-1` with `1<=d<=r t`; the chosen group order is divisible
by every such factor, so

\[
 v_\ell(g_i^d-1)\le\mathrm{cr}_\ell.                       \tag{4.2}
\]

The row jump identity and (4.1)--(4.2), with both conjugate sides kept in the
same sum, give (1.1).  The coefficient `10` is the source's safe aggregate of
the at-most-`4f` finite-place contributions, their two conjugate sides, and
the crystalline/scalar remainder.  It is not obtained by fitting a constant.

## 5. Direct consumer

`TwistForRows.lean` chooses the `u,gamma,beta` above for every row over one
common sufficiently large `O`, then calls `exists_anticyclotomic_twist` with
the very same `IsBalanced` witness and (1.1).  The twist theorem returns

\[
 \|\ell_O\operatorname{Sel}(\psi R_i;O/\ell^M)\|
 \le (10f\,\operatorname{rank}R_i+1)\,\mathrm{cr}_\ell.     \tag{5.1}
\]

The `+1` is the twist's allowed auxiliary ramification `eta=cr_ell`; it is not
part of `beta`.  This feeds the common fit-twist family and Theorem C.  Thus the
root-reachable chain is

\[
 \text{row local/crystalline budgets}\to\text{IsBalanced}
 \to\text{short twisted Selmer rows}\to C.
\]

Retained deep inputs are explicit: local Tate/crystalline duality inside the
crystalline relations, the Bloch--Kato rank formula, Smith normal form over a
DVR, and the row-existence theorem.  This note reconstructs their exact
assembly; it does not claim to reprove those standard inputs or row existence.

Verification performed: exact source bodies and eight blob identities checked;
the disjoint split (3.1), determinant-kernel substitution (3.5), and final
consumer were checked against the pinned bodies; the exact additive aggregation
was exhaustively checked on 1,366,365 nonnegative configurations with each
variable at most 12; `git diff --check` was run.
Failed/abandoned attempts: a draft reconstruction of the central-element
cocycle count was discarded after peer commit `dc4a4eec` supplied that result;
duplicating it would not advance the root-reachable graph.
Local `lean`, `lake`, and `elan` are unavailable, so the companion is
**PREPARED**, not `KERNEL-CHECKED`; no native PASS is claimed.

## RESUME HERE

Audit the row-existence supplier that produces `IsRow` for every irreducible
block, especially `RowsExist`, `RibetElement`, and `OnePlaceDefect`.  Preserve
the same block rank, Hodge--Tate jumps, chosen place, and coefficient-ring
eventual quantifier.  If already closed by a peer, substitute (3.6) and (1.1)
directly into the live C section instead of producing another balanced-row
summary.

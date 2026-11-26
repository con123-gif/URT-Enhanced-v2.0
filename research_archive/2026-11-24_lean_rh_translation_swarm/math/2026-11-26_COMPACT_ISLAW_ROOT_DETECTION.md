# Independent review: the two-prime stabilizer closes the `IsLaw` root detector

Result: **REVIEW — AGREE WITH ONE ORIENTATION CORRECTION / PREPARED, native
replay pending**.  During this audit peer commit `e57db995` landed with the
same root-detection caller.  Its conclusion `O <= Stab(y)` is source-matched,
but the phrase “`p(g)` (or its inverse) lies in `V`” is imprecise: the exact
native invocation proves `res(p(g)) in V`.  This note independently derives
both branches and records why the correction matters.  It is not a new RH
criterion and does not claim the human RH reconstruction is complete.

## Exact source and caller

Pinned source: `lsernau/grh-lean`
`72fead102f663d5c7a407964a13dc0cf9d977207`.

| Item | Source | Git blob |
|---|---|---|
| `exists_isLaw`, section, auxiliary primes and stabilizer proof | `grh-compact/src/New/Selmer/ReciprocityLaw.lean:52-148` | `7b82ced3dd3ff2be7eedbfa63f92f2f743093223` |
| `SplitPlaces.FrobeniiDetectRoots` | `grh-compact/src/Lib/ClassField/GreenbergWiles/SelmerBasic.lean:120-123` | `5d8e27cabe1e4c5c486f7acdfc939499d0b0564e` |
| procyclic generator theorem | `grh-compact/src/Lib/General/NumberTheory/ProcyclicImage.lean:8-33` | `dd0a02b55354ad4ad95598a6666d71b25e3fdb33` |
| Chebotarev existence theorem | `grh-compact/src/Lib/ClassField/Chebotarev/FrobeniusFilter.lean:18-41` | `a10390e8827a3ea793ea8320b186a4e134d08940` |
| the `ell=2` congruence guard | `grh-compact/src/New/Selmer/Corepresentable.lean:169-173` | `3e401695d96b8ea826d60dadf0174d366f85d37c` |

Prior-work check: `dc4a4eec` reconstructs the general projective cocycle
count, `6328abd9` reconstructs Kummer reciprocity, and PR #105 commit
`99866bc6` reconstructs the final cardinal exponent payment.  Peer commit
`e57db995`, published after this audit began, reconstructs the larger
`exists_isLaw` cluster and gives the stabilizer argument in outline.  The
present review checks its exact unresolved orientation against
`ReciprocityLaw.lean:140-148`; it does not repeat the count or relation-law
sections of that peer.

## 1. Groups and the non-homomorphic section

Let

\[
 G=\operatorname{Gal}(\Omega/K),\qquad
 G_E=\operatorname{Gal}(\Omega/E),
\]

where `K` is the maximal real subfield of the CM field `E`.  Restriction
`res : G_E -> G` has index-two image `R`; complex conjugation `c0` represents
the other coset and satisfies `c0^2=1`.  Lines 61--68 choose a set-theoretic
section `p : G -> G_E` with

\[
 \operatorname{res}(p(g))=
 \begin{cases}
 g,&g\in R,\\
 g c_0,&g\notin R.
 \end{cases}                                             \tag{1}
\]

The section is not asserted to be a homomorphism.  Instead the index-two
calculation gives either

\[
 p(gh)=p(g)p(h)
 \quad\hbox{or}\quad
 p(gh)=p(g)\operatorname{conjGal}(p(h)).                 \tag{2}
\]

The cyclotomic character is invariant under this conjugation, so

\[
                 \kappa=\chi_\ell\circ p:G\to\mathbb Z_\ell^\times       \tag{3}
\]

is nevertheless a continuous monoid homomorphism.  This is why the proof may
apply the procyclic-image theorem without pretending that `p` itself is a
homomorphism.

Let

\[
 V=R\cap\ker(\chi_{\ell^r}),                             \tag{4}
\]

and, for the prime-torsion line `W=A[ell]`, let

\[
 \psi=(\rho_W,\chi_\ell\bmod\ell),\qquad O=\ker\psi.    \tag{5}
\]

The native proof establishes `V <= O`.  The congruence
`4 | kappa(g)-1` at `ell=2` is supplied by
`four_dvd_cycChar_sub_one`; hence `exists_procyclic_generator` applied to
`kappa|_O` gives an element `gamma in O` with the following exact property:

> every open subgroup of `O` containing `ker(kappa|_O)` and `gamma` is all of
> `O`.

## 2. Why exactly two extra Frobenii are chosen

For `a in O` and an avoided finite place `w`, Chebotarev is applied to the
nonempty open set

\[
                    \{\sigma\in G:a\sigma\in V\}.       \tag{6}
\]

It returns a new prime and a Frobenius `sigma` satisfying

\[
                         a\sigma\in V.                  \tag{7}
\]

The two values of the native `Bool` parameter choose

\[
 a_{\mathsf{true}}=\gamma,
 \qquad
 a_{\mathsf{false}}=
 \begin{cases}
 c_0,&c_0\in O,\\
 1,&c_0\notin O.
 \end{cases}                                             \tag{8}
\]

with the second prime chosen away from the first.  This produces the extended
split-prime datum `s'` indexed by `iota + Bool`.  The first place records the
procyclic generator.  The second does not merely add cardinal slack: it records
complex conjugation precisely in the branch where the section (1) crosses the
nontrivial coset.

## 3. The stabilizer theorem

Take an `S`-unit root `y` satisfying the hypothesis passed to
`card_trivialised_of_isHigmanProjective`:

1. `ell * y` lies in the fixed `S`-units for `O`;
2. every Frobenius of `s'` fixes `y`.

Let

\[
                         F=\operatorname{Stab}_G(y).     \tag{9}
\]

We prove `O <= F`.

First, the original detector `d : s.FrobeniiDetectRoots` gives

\[
                              V\le F.                   \tag{10}
\]

Indeed `ell | ell^r`; multiplying `ell*y` by the quotient produces
`ell^r*y`, still an `S`-unit fixed by `V` because `V <= O`.  The original
Frobenii are the `inl` part of `s'`, so they fix `y`.  These are exactly the
two premises of `d`, with no strengthening of its quantifiers.

For either Boolean index `j`, write `(a_j,sigma_j)` for its data.  Equations
(7), (10), and Frobenius fixedness give

\[
 a_j\sigma_j\in V\le F,
 \qquad \sigma_j\in F,
 \qquad\Longrightarrow\qquad a_j\in F.                 \tag{11}
\]

Thus

\[
                             \gamma\in F,               \tag{12}
\]

and, if `c0 in O`, the false branch also gives `c0 in F`.

It remains to prove

\[
                       \ker(\kappa|_O)\le F.            \tag{13}
\]

Take `g in O` with `kappa(g)=1`.  Since the full `ell`-adic character is one,
`p(g)^{-1}` has cyclotomic character one modulo `ell^r`.  The native map `U`
has conclusion `res(s^{-1}) in V`; applying it with `s=p(g)^{-1}` therefore
gives

\[
 r_g:=\operatorname{res}((p(g)^{-1})^{-1})
     =\operatorname{res}(p(g))\in V\le F.                \tag{14}
\]

Now use the two cases of (1), before taking any norms or cardinal bounds.

* If `g in R`, then `r_g=g`, so (14) directly gives `g in F`.
* If `g notin R`, then

  \[
                              r_g=gc_0.                  \tag{15}
  \]

  Both `g` and `r_g` lie in `O` (`g` by assumption and `r_g` because
  `V <= O`), so right cancellation in (15) gives `c0 in O`.  Therefore the conditional choice
  in (8) is genuinely `c0`, and (11) gives `c0 in F`.  Cancelling `c0` from
  the right of (14)--(15) gives `g in F`.

This proves (13) in both branches.  Since `V` is open and `V <= F`, the
stabilizer `F` is open.  Consequently `F intersect O` is an open subgroup of
`O`; by (12)--(13) it contains both `gamma` and `ker(kappa|_O)`.  The defining
property of `gamma` forces

\[
                         F\cap O=O,
 \qquad\boxed{\ O\le\operatorname{Stab}_G(y)\ }.        \tag{16}
\]

Finally `unitsRep(1)y - 0*y = y`, and (16) says that this element belongs to
the `O`-invariants `H0`.  This is exactly the root-detection argument supplied
to `SplitPlaces.card_trivialised_of_isHigmanProjective` at lines 139--148.

## 4. Scope, failed shortcuts, and verification boundary

The review agrees with the peer's conclusion and its retained dependency
boundary after the orientation correction above.  The argument retains Chebotarev, the procyclic structure of the image of
`kappa`, the `ell=2` congruence, and the original `FrobeniiDetectRoots` theorem
as inputs.  It proves their exact composition at this caller; it does not
reprove those standard or earlier source theorems.

Rejected shortcuts:

* an initial draft set `r_g=res(p(g)^{-1})`; expanding the actual conclusion
  `U(s): res(s^{-1}) in V` at `s=p(g)^{-1}` shows that this orientation is
  wrong.  The correct value is `res(p(g))`, which is why the native term uses
  right cancellation.  The inverse draft was discarded before commit;
* treating the section `p` as a homomorphism would erase the second branch of
  (1) and is false in general;
* keeping only the `gamma` prime leaves `c0` unavailable in (15);
* reducing `kappa(g)=1` merely modulo `ell` is insufficient for (14), which
  uses the modulus `ell^r` subgroup `V`;
* global reciprocity does not imply (13) or the openness of the stabilizer.

Verification performed: all five source blobs were checked at the pin; the
proof was traced through the exact `d`, `H`, `e`, `o`, `U`, `hgamma`, and
`isOpen_mono` calls at lines 140--148; the right-cancellation identities used in
(11) and (15) are encoded in the companion Lean file; `git diff --check` is
run before commit.  Local `lean`, `lake`, and `elan` are unavailable, so the
certificate is **PREPARED**, not kernel-checked.  The successful orchestrator
run `45906549790` covered the preceding count branch, not this new derivation.

## RESUME HERE

Replay `2026-11-26_COMPACT_ISLAW_ROOT_DETECTION.lean` in the pinned compact
toolchain and inspect the elaborated two `split at b` goals at
`ReciprocityLaw.lean:145-147`.  In particular confirm that the false branch
rewrites the conditional `a_false` to `c0` using `g in O` and `r_g in V` before
the subgroup cancellation.  Then amend the `e57db995` prose from “`p(g)` (or
its inverse)” to the exact `res(p(g))`, integrate (10)--(16) immediately before
the existing `count B` exponent equation, and retain the four named source
inputs.

HANDOFF TO: formal audit, integration/editor, and compact native replay.

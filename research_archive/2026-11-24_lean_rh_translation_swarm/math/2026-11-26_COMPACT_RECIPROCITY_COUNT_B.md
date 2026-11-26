# Compact C: the exact `count B` payment in `exists_isLaw`

Status: **SOURCE-MATCHED / PREPARED, native replay pending**.  This note
reconstructs the finite cardinal inequality at the live compact Theorem C
caller.  It does not reprove Greenberg--Wiles, Higman's criterion, Chebotarev,
or the procyclic-image theorem, and it does not claim a complete human proof of
RH.

## Source and actual target

Pinned compact source: `lsernau/grh-lean` revision
`72fead102f663d5c7a407964a13dc0cf9d977207`.

| Declaration | Source path and lines | Git blob |
|---|---|---|
| `exists_isLaw`, especially local theorem `B` | `grh-compact/src/New/Selmer/ReciprocityLaw.lean:48-164` | `7b82ced3dd3ff2be7eedbfa63f92f2f743093223` |
| `selmerZ1.card_mul_pow_le` | `grh-compact/src/Lib/ClassField/GreenbergWiles/SelmerRelations.lean:22-48` | `a4ec7652040bfb6e7149d286104b4d13c82bf211` |
| `SplitPlaces.card_trivialised_of_isHigmanProjective` | `grh-compact/src/Lib/ClassField/GreenbergWiles/ProjectiveCount.lean:15-81` | `3e305e3ad3797609b9c4b4783ce7901ce828c3e9` |
| `FiniteKilledFixedInj.isHigmanProjective_of_coprime` | `grh-compact/src/Lib/Adelic/Cartan/ProjectiveModules.lean:29-54` | `284b9007cf1c69d6bfd81a4896aa55ca42684ea6` |
| `exists_procyclic_generator` | `grh-compact/src/Lib/General/NumberTheory/ProcyclicImage.lean:8-33` | `dd0a02b55354ad4ad95598a6666d71b25e3fdb33` |

The input quantifiers are those of `exists_isLaw`: `r>0`, at least four
infinite places of the CM field `E`, a finite type `I`, `k <= #I`, split
Frobenius data `x_i` over pairwise distinct primes of the maximal real subfield,
and `k` prescribed elements `y_j`.  Earlier lines 52--108 construct the real
subfield `K`, the one-dimensional character module `A`, the finite set `S`,
the original split-prime family indexed by `iota`, and

\[
 Z=\ker\bigl([\ell]:Y(\operatorname{range}s.v)\to
 Y(\operatorname{range}s.v)\bigr).
\]

The exact obligation at lines 110--161 is

\[
             |Z|\,\ell^{k+1}\le \ell^{|\iota|}.       \tag{B}
\]

Line 163 passes precisely `(B)` to `exists_primitive_relation`; it is therefore
not an optional estimate or a reformulation of the endgame.

Prior-work collision check: commit `dc4a4eec` reconstructs the general
projective/Greenberg--Wiles cocycle supplier, `6328abd9` reconstructs the
Kummer quotient and reciprocity extension, and `2c2d51df` carries reciprocity
to mirror isotropy.  None substitutes the local cardinal calculation
`ReciprocityLaw.lean:110-161`; the latest caller trace `d1212411` explicitly
left this `count B` step open.  This note composes those existing suppliers at
that one missing caller and does not rederive their internal proofs.

## 1. Pass to the prime-torsion line

Put

\[
 W=A[\ell]=\ker([\ell]:A\to A).
\]

Because `A` is the underlying additive module of the character representation
over `ZMod (ell^r)` and `r>0`, the cyclic kernel calculation in lines 111--114
gives

\[
                   |W|=\ell.                           \tag{1}
\]

This restriction is essential.  The full module `A` is killed by
`ell^r`, whereas `ProjectiveCount` at this caller needs a prime-torsion module
whose automorphism group has order prime to `ell`.

Let `psi` be the product of the Galois action on `W` and the cyclotomic
character modulo `ell`, and let `O=ker(psi)`.  The previously constructed open
subgroup `V` lies in `O`, so `O` is open.  Moreover `W` is cyclic of prime
cardinality.  Hence

\[
 [G:O]\mid |\operatorname{Aut}(W)|\,|({\mathbb Z}/\ell)^\times|
          =(\ell-1)^2,
 \qquad \gcd(\ell,[G:O])=1.                            \tag{2}
\]

The native proof expresses (2) through `index_ker`, subgroup-cardinality
divisibility, `isCyclic_of_prime_card`, and `Nat.totient_prime`.  Therefore the
finite module datum

\[
 (W,\ \ell W=0,\ O\text{ fixes }W,\ \rho(1)-0=\mathrm{id}_W)
\]

is `FiniteKilledFixedInj ell O 1 0`, and Higman's averaging criterion applies.

## 2. The two auxiliary places are paid for, not discarded

Lines 119--132 choose a procyclic-image generator `gamma` and then use
Chebotarev to append two auxiliary split places.  The extended split datum
`s'` is indexed by

\[
                   \iota\mathbin\sqcup\mathrm{Bool},
 \qquad |\iota\mathbin\sqcup\mathrm{Bool}|=|\iota|+2. \tag{3}
\]

The first extra Frobenius records `gamma`.  The second uses the exact native
conditional pair built from the complex conjugation `c0` (or the identity in
the complementary branch) and the Chebotarev lift selected in line 123.  They
cannot be omitted: for an `S`-unit `y` fixed by all Frobenii of `s'`, the old
root detector first places `V` inside its stabilizer `F`; the two new fixedness
conditions put the required generator in `F`.  The procyclic theorem then
forces the whole relevant subgroup into `F`, which is exactly the final
root-detection premise supplied to `card_trivialised_of_isHigmanProjective` in
lines 140--148.

Higman plus that root-detection statement yields

\[
 W.\mathrm{HasFewCocycles}(\ldots,
       |\iota\sqcup\mathrm{Bool}|+1)
   =W.\mathrm{HasFewCocycles}(\ldots,|\iota|+3).       \tag{4}
\]

Thus the two added primes cost two powers, and the Euler-characteristic
cocycle bound costs one more.  No power is hidden.

## 3. Greenberg--Wiles and the local product

Write

\[
 n=|\iota|,\quad s=|S|,\quad h=|\operatorname{InfinitePlace}K|,
\]

and split `S` into

\[
 a=|\{v\in S:\ell\in v\}|,\qquad
 b=|\{v\in S:\ell\notin v\}|,\qquad s=a+b.           \tag{5}
\]

There is an injection from `Z` into the finite `W`-valued unramified cocycles
(lines 148--152).  Applying `selmerZ1.card_mul_pow_le` to `s'` and using (1),
(3), and (4) therefore gives

\[
 |Z|\,\ell^{s+h}
 \le \ell^{n+3}
       \prod_{v\in S}|L_v(W)\cap Z^1_v(W)|.            \tag{6}
\]

The local factor is exactly the case split proved at lines 157--161:

* if `v` is not above `ell`, the defining `Pi.bot` condition leaves only the
  zero local cocycle, so the factor is `1`;
* if `v` is above `ell`, evaluation at the procyclic generator injects the
  local cocycle kernel into `W`, so the factor is at most `|W|=ell`.

Consequently

\[
       \prod_{v\in S}|L_v(W)\cap Z^1_v(W)|\le\ell^a,
 \qquad |Z|\,\ell^{s+h}\le\ell^{n+3+a}.               \tag{7}
\]

## 4. The decisive exponent equation

Each original `x_i` contributes a distinct member of the second set in (5):
splitness gives `ell` not above its prime, membership follows from the
construction of `S`, and the supplied injectivity over `E+` prevents
collisions.  Hence

\[
                        k\le |I|\le b.                 \tag{8}
\]

The maximal real subfield has the same number of infinite places as the CM
field in the native cardinal lemma, so the hypothesis `hf` gives

\[
                        4\le h.                        \tag{9}
\]

All slack in (7) is now accounted for by the single equation

\[
 \boxed{\ (s+h)-(k+1)-(a+3)=(b-k)+(h-4)\ge0\ }.       \tag{10}
\]

Equivalently, without truncated subtraction,

\[
             (a+3)+(k+1)\le (a+b)+h.                  \tag{10'}
\]

Cancel the positive factor `ell^(a+3)` from (7), then discard the remaining
nonnegative power certified by (10).  This gives exactly

\[
                        |Z|\ell^{k+1}\le\ell^n,
\]

which is `(B)`.  The lower bound of four infinite places has a transparent
role: three powers pay the two auxiliary places and the `+1` in the cocycle
count, while the fourth is the one power reserved by
`exists_primitive_relation`.

## 5. Consumer, retained premises, and failed shortcuts

At lines 162--165 the module is specialized back from abstract `A` to `M` and
`exists_primitive_relation` consumes `(B)`.  It produces one primitive
functional which kills the prescribed `y_j` values and has a unit value; the
relation extension `H` then supplies the `IsLaw` function used by
`TrianglePrimes`.  Thus this closes the human assembly of the count at its
actual caller, but retains these non-elementary inputs:

* Chebotarev with the stated finite avoidance;
* the procyclic-image theorem, including the `ell=2` congruence guard;
* Higman's projectivity criterion and the projective cocycle count;
* the Greenberg--Wiles cardinal inequality;
* the earlier split-prime reciprocity/root-detection construction.

Failed or rejected shortcuts:

1. Applying the projective count directly to `A` loses the prime-cardinality
   automorphism calculation in (2).
2. Deleting the two `Bool` places leaves the root-detection premise unproved.
3. Treating those places as free gives the wrong exponent: their `+2`, plus
   the cocycle `+1`, is exactly the `+3` in (10).
4. Global reciprocity alone does not imply the stabilizer/root-detection step
   used here.

Verification performed: the five source blobs and exact line ranges above
were read at the pinned revision; the cardinal flow was traced from local
theorem `B` through its immediate consumer; equations (3), (5), and (10') were
separately encoded in the companion Lean certificate; `git diff --check` and
source-pin checks are run before commit.  Local `lean`, `lake`, and `elan` are
unavailable, so the companion is **PREPARED**, not kernel-checked, and no fresh
native PASS is claimed.  Earlier CI runs do not certify this new note.

## RESUME HERE

Independently replay
`2026-11-26_COMPACT_RECIPROCITY_COUNT_B.lean` in the pinned compact toolchain,
then audit the exact stabilizer argument in `ReciprocityLaw.lean:140-148`, in
particular the two branches of `o g`, the use of the second `Bool` place, and
the hypotheses passed to `exists_procyclic_generator`.  If that audit agrees,
integrate equations (7)--(10) immediately after the Kummer reciprocity block in
the compact C proof spine; do not create another endgame formulation.

HANDOFF TO: formal audit, integration/editor, and compact native replay.

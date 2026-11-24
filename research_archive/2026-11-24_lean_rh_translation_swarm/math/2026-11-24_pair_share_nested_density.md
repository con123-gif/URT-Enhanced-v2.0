# MATH lane — `QH.pair_share`: nested positive-density `GoodQ`/`GoodD` sets

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single pinned theorem `QH.pair_share`, with an exact finite-set regression.  
**Status:** PARTIAL for the full reconstruction. This is not a Lean kernel replay, does not reprove the analytic `stage1`/`stage2` inputs, and is not a proof of RH.

## Source pin and exact scope

Authoritative source: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | `boxAll_mono`, `share_of_bad`, and theorem `QH.pair_share` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/Stage1Succ.lean` | `79f79fe71e41f403a4d22e5b86540410748ac7c3` | sparse failed-`GoodQ` estimate |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/CharOf.lean` | `3eeed8077330efa249cde313d99d89a7c09d8ba6` | sparse failed-`GoodD` estimate `stage2` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | exact `BoxAll`, `GoodQ`, `GoodD`, and prime-set definitions |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | immediate downstream witness selection |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | downstream conversion of memberships to `Rows` |

Current upstream `HEAD` observed here was `9477923066c923e6dbf7292da17019f8d08d0db8`
(2026-11-24 14:18:56 UTC). The pinned `PairShare.lean` path returns 404 at that revision, so this
chapter claims fidelity only to the requested pin.

The preceding two MATH runs reconstructed `stage1` and `stage2`. This run contributes only their
finite-density assembly. It corrects the misleading idea that two independent global good sets are
intersected: the source first constructs `G1`, then constructs a separate `G2(q)` for every
`q in G1`.

## 1. Exact statement and quantifier order

There exists a real `C>0` such that for all reals `eps,tau,K,eta` and naturals `N0`, if

`0<eps`, `eps<1/52`, `0<tau`, `1<=K`, `0<eta`, `0<N0`,

then there is `Y0` such that, for every `Y>=Y0` and every real `X,z'` satisfying

`X<=Y^K`,

`Y^(eps/5)*(log Y)^2 <= z' <= K^2*Y^(eps/5)*(log Y)^2`,

there is a set

`G1 subset primePairSetFirst(Y^(eps/5))`

such that the ambient first-prime set has positive cardinality,

`(1-eta)*card(P1) <= card(G1)`,

and every `q in G1` satisfies `GoodQ N0 C tau Y X ... q` and has an associated set

`G2(q) subset primeSetTwoBounds(Y^(eps/5),z',q)`

whose ambient second-prime set has positive cardinality,

`(1-eta)*card(P2(q)) <= card(G2(q))`,

and every `d in G2(q)` satisfies `GoodD N0 C tau Y X ... q d`.

The witness `G2` occurs inside `forall q in G1`; it may and generally does depend on `q`.

## 2. Exact finite complement lemma `share_of_bad`

Let `P` be a finite set and `p(x)` any predicate. Assume that every all-bad subset `B subset P`
satisfies

`card B <= eta*card P`.

Choose

`G = {x in P : p(x)}`.

The complementary filtered set

`D = {x in P : not p(x)}`

is itself an all-bad subset, so `card D<=eta*card P`. The exact finite partition identity is

`card G + card D = card P`.

Subtracting the bad-set estimate gives

`(1-eta)*card P <= card G`.

This private lemma assumes no sign or upper bound on `eta`. The public theorem supplies `eta>0`,
but does **not** assume `eta<1`. If `eta>=1`, the lower bound may be nonpositive and therefore
uninformative, although still correct. The later selector uses `eta=1/2`.

## 3. Exact monotonicity lemma `boxAll_mono`

Suppose

`C<=C'`, `1<=Y`, `X'<=X`,

and `BoxAll Q C tau Y X f M`. For every primitive induced character inside `BoxAll`, its `Box`
has three components:

1. `GoodC Q psi`, unchanged;
2. `||logDerivLAtOne psi|| <= C*log Y`;
3. for every `y in [Y,X]`, `||Gchi psi y||<=y^(1/2+tau)`.

Because `Y>=1`, `log Y>=0`; hence `C*log Y<=C'*log Y`. If `y in [Y,X']`, then `X'<=X` puts the
same `y` in `[Y,X]`. Thus

`BoxAll Q C' tau Y X' f M`.

Both side conditions are essential. For `Y<1`, enlarging `C` can lower the product `C log Y`; for
`X'>X`, a point in the new interval need not lie in the old one.

## 4. Assemble the first good set

Take constants from the two analytic wrappers:

`stage1 -> C1>0`, and `stage2 -> C2>0`.

Set

`C = max(C1,C2)`.

The source records positivity via `C1<C`; it could equally use positivity of `C2`, but no sum or
new fitted constant is introduced. Let `Y1,Y2` be the two stage thresholds and choose

`Y0 = max(max(Y1,Y2),1)`.

The final `1` is needed specifically for `boxAll_mono`.

At `Y>=Y0`, `stage1` supplies:

- nonemptiness of `P1=primePairSetFirst(Y^(eps/5))`;
- a bad-subset bound for the predicate
  `GoodQ N0 C1 tau Y (Y^K) ...`.

Apply `share_of_bad`. This produces `G1 subset P1` with the required density and every member good
at constant `C1` and upper endpoint `Y^K`. The theorem reports `0<card P1` by converting the stage-1
nonempty witness with `Finset.Nonempty.card_pos`; it does not yet assert `G1` nonempty for arbitrary
`eta`.

For `q in G1`, the target uses `C=max(C1,C2)` and arbitrary `X<=Y^K`. Unfolding `GoodQ` leaves one
`BoxAll` for each character `xi`; apply `boxAll_mono` with

`C1<=C`, `1<=Y`, `X<=Y^K`.

No character, modulus, zero-free scale, or exponent is altered.

## 5. Assemble the dependent second good sets

Before choosing a particular good `q`, `stage2` is instantiated at `Y,z'`. It returns a statement
for every `q in P1`. Since `G1 subset P1`, each `q in G1` is admissible.

For such a `q`, put

`P2(q)=primeSetTwoBounds(Y^(eps/5),z',q)`.

Stage 2 supplies nonemptiness of `P2(q)` and the bad-subset inequality for

`GoodD N0 C2 tau Y (Y^K) ... q d`.

Applying `share_of_bad` produces `G2(q) subset P2(q)` with

`(1-eta)*card P2(q) <= card G2(q)`

and every `d in G2(q)` good at `C2,Y^K`. For every character `xi` and twist bit `a<=1`, apply
`boxAll_mono` with

`C2<=max(C1,C2)`, `1<=Y`, `X<=Y^K`.

This yields exactly the target `GoodD` at the unified constant and shorter interval. Again, the
ambient modulus and all `GoodD` quantifiers are preserved.

## 6. Downstream selection and what is not proved here

`PairExists.lean` specializes this theorem to `eta=1/2`. Since each ambient prime set has positive
cardinality, the inequalities

`card G1 >= card P1/2`, and `card G2(q) >= card P2(q)/2`

force both good sets to be nonempty. It chooses `q in G1`, then `d in G2(q)`. Additional growth
cutoffs give `2*Y^(eps/5)<=z'`, so `rows_of_mem` converts their two memberships into `Rows`. A
separate logarithmic argument proves `N0<q`. Those steps belong to `pair_exists`, not to
`pair_share`.

This chapter therefore establishes a nested density bridge only. It does not prove the analytic
stage bounds, choose the final primes, build `PairGood`, discharge theta/Galois inputs, or establish
RH.

## 7. Corrections to the existing interpretation

- **Corrected:** `G2` is a family `G2(q)`, not one second-prime set shared by all first primes.
- **Corrected:** there is no multiplication of independent densities or probabilistic independence
  assertion; each density bound is conditional at its own level.
- **Corrected:** `eta<1` is not a theorem hypothesis. Nonemptiness of the good subsets enters only
  downstream after choosing `eta=1/2`.
- **Preserved:** the strict `eps<1/52` and every stage hypothesis are passed unchanged to both
  analytic inputs.
- **Preserved:** changing from `Y^K` to `X` is justified by interval restriction and `log Y>=0`, not
  by silently strengthening `GoodQ` or `GoodD`.

## Executed tests

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_share_nested_density.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_share_nested_density.py
```

The exact checker validates all six pinned path/blob pairs and report anchors; exhaustively checks
the complement lemma on finite predicates and all-bad subsets; checks the `BoxAll` monotonicity
inequalities plus both required negative controls; constructs nested `G1,G2(q)` fixtures; and checks
the `eta=1/2` nonemptiness inference used downstream. It verifies finite assembly logic, not Lean
elaboration or the analytic estimates.

## Failed attempts / limitations

- The pinned `PairShare.lean` path returns 404 at current upstream `HEAD`; this run does not guess a
  renamed replacement or claim current-head equivalence.
- Current-head code search did not supply a replacement declaration, so the requested pinned tree
  remains the sole source of this reconstruction.
- No local upstream Lean checkout exists; `lake build`, elaborated proof-term inspection, and axiom
  auditing were not run.
- The finite checker deliberately treats `stage1` and `stage2` conclusions as premises. It cannot
  certify their zero-density or mean-square dependencies.

## RESUME HERE

Reconstruct pinned `QH.pair_exists`: preserve the specialization `eta=1/2`, the two cardinality-to-
nonempty arguments, the extra cutoffs giving `2*z<=z'` and `N0<q`, and the exact call to
`rows_of_mem`. Do not repeat the analytic stages or this density-complement chapter.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.

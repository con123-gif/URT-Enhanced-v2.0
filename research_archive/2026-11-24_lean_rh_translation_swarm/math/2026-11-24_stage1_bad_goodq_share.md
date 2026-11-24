# MATH lane — `QH.stage1`: the sparse bad-`GoodQ` prime theorem

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single theorem `QH.stage1`, with a deterministic arithmetic/provenance regression.  
**Status:** PARTIAL for the reconstruction. This is not a Lean kernel replay, not an independent proof of the zero-density or mean-square inputs, and not a proof of RH.

## Source pin, revision check, and exact scope

Authoritative source: `leanprover-community/riemann-hypothesis` at the requested initial pin
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/Stage1Succ.lean` | `79f79fe71e41f403a4d22e5b86540410748ac7c3` | `stage1_succ`, `stage1_prim`, `stage1_log`, and theorem `QH.stage1` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/StagePow.lean` | `2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7` | generic theorem `QH.stage`, including the two bad-family estimates |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | immediate downstream consumer of `stage1` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | definitions of `GoodQ`, `BoxAll`, and the first prime-pair set |

Revision comparison: upstream `HEAD` observed during this run was
`d4b2c1cc39c05a8b49a4adbda9908898a71f12c6` (2026-11-24 12:31:21 UTC). The pinned
`Stage1Succ.lean` path returns 404 at that revision, and authenticated code search did not find
`theorem stage1`; therefore no semantic equivalence to current `HEAD` is claimed. All statements
below are pinned-source statements.

The preceding MATH chapter correctly left `stage1` and `stage2` as analytic dependencies of
`pair_share`. This chapter expands **only `stage1`**. It corrects the tempting but false shorthand
that `stage1` averages the original characters modulo `N0`: the generic theorem is fed their
primitive conductor-lowered representatives.

## 1. Exact theorem and quantifier order

The pinned theorem is:

> There exists a real constant `C>0` such that, for every real `eps,tau,K,eta` and natural
> `N0`, if `0<eps`, `eps<1/52`, `0<tau`, `1<=K`, `0<eta`, and `0<N0`, then there is a
> threshold `Y0` such that, for every `Y>=Y0`:
>
> 1. `primePairSetFirst (Y^(eps/5))` is nonempty; and
> 2. every subset `B` of that prime set whose every `q` fails
>    `GoodQ N0 C tau Y (Y^K) (Y^(eps/5)) q` satisfies
>
>    `card B <= eta * card (primePairSetFirst (Y^(eps/5)))`.

The constant `C` is chosen before all six displayed parameters. The threshold `Y0` may depend on
all of them. The theorem bounds prime **cardinality**, not character count, probability, or a
pointwise character sum.

## 2. Conductor lowering is the essential adapter

Fix a Dirichlet character `xi` modulo `N0`, with `N0>0`. Let

`c = conductor(xi)`.

The local theorem `stage1_prim` constructs a primitive character `xi0` modulo `c` with:

1. `xi0` primitive;
2. `c | N0`, hence `1 <= c <= N0`;
3. for every integer `n`, if `Coprime n N0`, then `xi0(n)=xi(n)`.

The source obtains the primitive object through `stage1_succ`, which packages the conductor as a
successor index. The nonzero conductor premise is not dropped: it follows from `N0>0` and the
Dirichlet-character conductor facts used in the file.

Define `g(xi)=xi0`. The family supplied to the generic stage theorem is

`Xi = image(g, all Dirichlet characters modulo N0)`.

Consequently every member is primitive, has level at most `F=N0`, and

`card Xi <= card(all characters modulo N0) =: R`.

Injectivity of `g` is neither asserted nor needed. This direction of the cardinality inequality is
why collisions between characters after conductor lowering are harmless.

## 3. Exact instantiation of the generic `stage` theorem

Write

`z = Y^(eps/5)`.

The proof applies `QH.stage` with

| Generic parameter | `stage1` value |
|---|---|
| `U` | `exp z` |
| `F` | `N0` |
| `m0` | `8` |
| `a0` | `3` |
| `Xi` | the conductor-lowered image above |
| `R` | the number of characters modulo `N0` |

The `admitted eps Y U m0 a0` record is proved field by field, after enlarging `Y0`:

- `0<8`, `8 | 8`, and `Coprime 3 8` are exact arithmetic;
- `U=exp z` by definition;
- `Y^(eps/6) <= z` because `Y>=1` and `eps/6 <= eps/5`;
- `z <= z*(log Y)^2` because `z>=0` and `log Y>=1`;
- `(1/4)*(log Y)^2*log 8 <= z` follows from `log 8 <= 8` and the eventual bound
  `(log Y)^2 <= z/2` supplied by `stage1_log`.

For the generic prime-divisor side condition, a prime divisor of `8` must divide `2`, so it equals
`2`; the cutoff makes `2<=z`. Thus the first disjunct holds and the huge-prime alternative is never
used here.

The remaining scale condition is `F <= U^(1/2)`, i.e.

`N0 <= sqrt(exp z)`.

The cutoff includes `z>=2*N0`. Since `log N0 <= N0` for positive `N0`, this gives
`log N0 <= z/2`; exponentiating yields the required inequality. The Lean proof phrases the
elementary exponential comparison through `1+t <= exp t`, but no fitted constant enters.

The generic theorem requires only `eps<=1/4`. The strict source premise `eps<1/52` implies that by
linear arithmetic. No step in this `stage1` wrapper derives `1/52`, and this chapter does not weaken
the public pinned interface.

## 4. The difficult step: bad `GoodQ` to a generic bad-character witness

Let `q` belong to a subset `B` all of whose members fail `GoodQ`. Negating `GoodQ` supplies an
original character `xi` modulo `N0` for which the required `BoxAll` statement fails.

The generic theorem does not accept `xi` directly. It asks for a primitive `xi0 in Xi`, a nonzero
ambient modulus, and failure of its corresponding box. Choose:

`xi0 = g(xi)`, and `M = N0*q`.

Membership `xi0 in Xi` is by construction; `M!=0` follows from `N0>0` and primality of `q`.
Suppose, for contradiction, that the generic `BoxAll` for `xi0` held. Its inducing relation is
tested only at integers `n` coprime to `N0*q`. Such an `n` is in particular coprime to `N0`, so
`stage1_prim` gives `xi0(n)=xi(n)`. Replacing `xi0` by `xi` pointwise inside that inducing relation
produces exactly the `BoxAll` denied by the failed `GoodQ`, a contradiction.

The logical direction matters:

`Coprime(n,N0*q) => Coprime(n,N0)`.

The converse is false and is not used. For example, `n=q` can be coprime to `N0` while not coprime
to `N0*q`.

This establishes the bad-witness hypothesis of the generic `stage` theorem for every `q in B`.
Its cardinality conclusion is therefore exactly the advertised `eta`-share bound.

## 5. What the generic analytic theorem still carries

This reconstruction does not hide the remaining analytic premise. In `StagePow.lean`, `stage`
partitions bad primes into two types:

1. `B1`: failure of the zero-free/`GoodC` part, bounded by `count_bad` together with the power
   estimate `stage_pow`;
2. `B2`: excessive character sums, bounded by `bad_share` and `meanSqK`, then union-bounded over
   `Xi` with budget proportional to `eta/(2*(R+1))`.

Each side is allotted at most half of the final bad-prime budget. The theorem `box_of_S`, together
with primitive twisting and uniqueness of the primitive inducing character, proves that a prime
outside `B1` and every relevant `B2` cannot be bad. Those source theorems remain premises of this
human derivation; naming their role is not a reproof.

Nonemptiness of `primePairSetFirst z` is also returned by generic `stage`. The wrapper does not
prove it independently by invoking the prime number theorem.

## 6. Downstream link and corrected interpretation

`PairShare.lean` applies `stage1` to the first prime set, filters to primes satisfying `GoodQ`, and
combines that density estimate with the separate `stage2` estimate for the second prime set.
`PairExists.lean` then selects actual `q,d` witnesses. Thus this theorem supplies a sparse-bad-prime
statement; it does not itself choose the final pair or construct `PairGood`.

Compared with the previous interpretation:

- retained: `stage1` is the analytic input controlling failed `GoodQ` primes;
- corrected: the averaging family is the image of primitive conductor-lowered characters, not the
  original imprimitive family modulo `N0`;
- corrected: the conversion from `not GoodQ` to the generic witness uses the one-way coprimality
  implication above and the ambient modulus `N0*q`;
- preserved obstruction: the zero-density and mean-square estimates inside generic `stage` remain
  unexpanded proof dependencies.

## Executed tests

Executed with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_stage1_bad_goodq_share.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_stage1_bad_goodq_share.py
```

The deterministic checker validates the four pinned source/blob pairs and required report anchors;
checks the strict epsilon implication; finds explicit log-space cutoffs satisfying every displayed
`admitted`/scale inequality over a fixed grid; checks conductor divisibility and image-cardinality
facts on finite models; verifies `Coprime(n,N0*q) => Coprime(n,N0)` over a finite grid; and exhibits
the converse counterexample. These checks cover the wrapper algebra only, not Lean elaboration or
the analytic estimates.

## Failed attempts / limits

- Guessed pinned paths `MeanSquareBounds/Stage.lean` and `MeanSquareBounds/StageOne.lean` returned
  404; the actual files are `StagePow.lean` and `Stage1Succ.lean`.
- The pinned `Stage1Succ.lean` path also returns 404 at current upstream `HEAD`, while code search
  returned no theorem hit. The report therefore does not silently translate the pin to a changed
  current layout.
- No local checkout of the upstream Lean project is available, so no kernel replay or build claim
  is made.
- This run deliberately did not reconstruct `stage2`; doing so here would violate the one-real-
  contribution scope.

## RESUME HERE

Reconstruct pinned `QH.stage2` from `CharOf.lean`: preserve its rescaled epsilon, the construction of
the character family indexed by the already chosen first prime, the exact `GoodD` bad-witness
conversion, and the second-prime-set cardinality budget. Compare its hypotheses with `stage1`
without repeating this conductor-lowering chapter.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.

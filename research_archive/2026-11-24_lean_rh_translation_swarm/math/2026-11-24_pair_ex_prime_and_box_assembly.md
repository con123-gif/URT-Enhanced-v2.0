# MATH lane — `QH.pairEx`: from analytic prime rows to a `PairGood` warning window

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the *assembly theorem* `QH.pairEx`; independently checkable finite/numeric regression attached.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay, not an independent proof of the analytic prime-density inputs, and not a proof of RH.

## Source pin and exact scope

Upstream repository: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | theorem `QH.pairEx` and its four local lemmas |
| `src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean` | `68d04b506355e999c0f6020ee066c4967c1e6939` | exact `PairGood`, `PairEx`, `ZeroBox`, `height`, `tw` |
| `src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` | `398eb8ed3528aa2666e9d3b2b09a582ad4390dd7` | exact `WinPair` fields |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | analytic production of `q,d,Rows,GoodQ,GoodD` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | positive-density good subsets from stages 1 and 2 |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | `Rows`, `Box`, `GoodQ`, `GoodD`, Jacobi twist `J` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | converts membership in the two prime sets into `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/Kappa4Loglog.lean` | `e7f65342e957fa42936e7d8223888312a8967462` | upgrades zero-box goodness to `4 log Y` at one |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean` | `1fc497069c8499edef750d4264a106e442dcb1ef` | drops the excess `d`-factor in the `j=0,i=1` branch |

The existing character-box interpretation correctly said that `PairEx` remains a substantive upstream obligation, but did not expand it. This chapter fills that exact gap and corrects three easy-to-miss simplifications:

1. the second prime is required to satisfy **all** odd-prime divisibilities below `Y^(eps/5)`, not only `q | d+1`;
2. the zero-free height depends on the `d`-twist bit `j`; it is not one common height for all three nontrivial twists;
3. `eps < 1/52` is not derived in the final assembler. It is an explicit strict input consumed independently by `pair_exists` and `kappa4`.

## 1. Exact target and quantifier order

`PairEx` means:

> For every natural `M>0`, every real `eps,A` with
> `0<eps<1/52` and `1<=A`, there is a real threshold `Y1` such that
> for every `Y>=Y1` there exist naturals `q,d` with
> `PairGood M eps Y (Y^A) q d`.

The witnesses `q,d` may depend on `M,eps,A,Y`. They are chosen **before** the universal characters, twist bits, conductors, induced characters and points `y` occurring inside `PairGood`.

Writing `z=Y^(eps/5)` and `z'=z(log Y)^2`, `PairGood` has four outputs:

1. `WinPair eps Y q d`;
2. `Coprime M (q*d)`;
3. for every character `xi` modulo `M`, every `(i,j) in {0,1}^2` except `(0,0)`, and every primitive induced `chi`, throughout `Y<=y<=Y^A`,
   
   `||gChi chi y|| <= y^(1/2+eps/2)` and
   `||logDerivativeAtOne chi|| <= 4 log y`;
4. for every real primitive character `rho` with `rho.N | 8M`, the same three nontrivial twists have no zero in
   
   `Re(s)>1-1/400`, `|Im(s)|<=height M eps Y j`,
   
   where `height = 8M exp(z) exp(z')^j`.

This is character-box supply. It does not itself assert that any of these characters is the zeta character or that RH follows.

## 2. Analytic-prime input and the strict epsilon budget

`pair_exists` supplies one constant `C>0`. Given

`0<eps<1/52`, `0<tau`, `1<=K`, `0<N0`,

it eventually supplies, for every `X<=Y^K` and every `z'` with

`B <= z' <= K^2 B`, where `B=Y^(eps/5)(log Y)^2`,

primes `q,d` together with:

- `Rows(Y^(eps/5),z',q,d)`;
- `N0<q`;
- `GoodQ N0 C tau Y X Y^(eps/5) q`;
- `GoodD N0 C tau Y X Y^(eps/5) z' q d`.

Its proof calls `pair_share`, which intersects positive-density good subsets obtained from analytic stages 1 and 2. Nonemptiness follows because each good subset has cardinality at least `(1-1/2)` of a nonempty prime set. It then applies `rows_of_mem` to the selected members. This chapter preserves `stage1` and `stage2` as analytic dependencies; it does not replace their mean-square and prime-distribution proofs with a cardinality slogan.

For `QH.pairEx`, set

`tau=eps/2`, `K=A`, `N0=8M`, `X=Y^A`, `z=Y^(eps/5)`, `z'=z(log Y)^2`.

The side conditions are literal:

- `tau>0` from `eps>0`;
- `X<=Y^A` by equality;
- the lower `z'` bound by equality;
- `z'<=A^2 z'` from `1<=A`, hence `1<=A^2`, and `z'>=0`.

Separately, call `kappa4 eps 3`. It also requires `0<eps<1/52`; eventually it turns

`GoodC Q chi`, `Y^(eps/6)<=log Q<=3Y^(eps/5)(log Y)^2`

into `||logDerivativeAtOne chi||<=4 log Y`.

Thus the final threshold is

`max(max(Y0_pair,Y0_kappa), exp(1+log(8M)))`.

No line weakens `<1/52` to `<=1/52`. The constant enters upstream estimates twice; it is not a fitted parameter of the final prime choice.

## 3. `Rows` gives the exact `WinPair`

From `Rows z z' q d` at the chosen `z,z'`, copy the prime, congruence and logarithmic interval fields directly:

- `q` prime, `q mod 8=3`, `z/2<log q<=z`;
- `d` prime, `d mod 16=7`, `z'/2<log d<=z'`.

`Rows.d_class` says that for every prime `p != 2`, if `p<=z` or `p=q`, then `(d+1) mod p=0`. Apply it twice:

- at `p=q`, using `q` prime and `q!=2` (forced by `q mod 8=3`), to get `q | d+1`;
- at each odd prime `p<=z`, to get `p | d+1`.

These are precisely `WinPair.d_q` and `WinPair.d_small`. They are not probabilistic conclusions and do not require selecting a preferred EEG-style threshold or any Cathedral operator.

## 4. Coprimality with `M`

The analytic output has `8M<q`, hence `q` cannot divide `M`: otherwise positivity of `M` and `q|M` imply `q<=M`, contradicting `8M<q`. `Rows.q_lt_d` gives `q<d`, so the same argument rules out `d|M`. Since `q,d` are prime,

`Coprime(M,q)` and `Coprime(M,d)`, hence `Coprime(M,q*d)`.

The proof does not assume this coprimality as a hidden extra property of the prime sets.

## 5. The three twist branches and why `ind_drop` is needed once

Let `xi` be modulo `M`. The analytic boxes are formulated modulo `8M`, so change level along `M | 8M`. On integers coprime to `8M`, `pairEx_lift` proves that the lifted value equals the old value.

Now enumerate `(i,j)!=(0,0)`:

### Branch A: `(i,j)=(1,0)`

The target twist is `xi(n) J(q,n)`. The incoming induction is stated with ambient modulus `2Mqd`, but `GoodQ` expects `8Mq`. The local theorem `pairEx_box` first rewrites the inducing function with `pairEx_lift`, then uses `ind_drop` to show the same primitive `chi` is induced at the smaller required ambient modulus.

This drop is not cancellation by inspection. `ind_drop` constructs the primitive Jacobi twist at conductor `conductor(xi)*q`, invokes uniqueness of primitive inducing characters, and then transfers evaluations back. Its hypotheses include `q` prime, `q!=2`, `q` not dividing `8M`, and nonzero ambient modulus.

### Branch B: `(i,j)=(0,1)`

The target is `xi(n)J(d,n)`. `GoodD` with exponent `a=0` applies directly after lifting and reconciling `2Mqd` with `8Mqd` on coprime integers.

### Branch C: `(i,j)=(1,1)`

The target is `xi(n)J(q,n)J(d,n)`. `GoodD` with `a=1` applies in the same way.

In the two `j=1` branches the box height is `8M exp(z) exp(z')`; in the `j=0` branch it is `8M exp(z)`. This is why one must not merge the three cases into one unlabeled bound.

## 6. Extract the two numerical bounds

Each analytic `Box Q C (eps/2) Y (Y^A) chi` contains:

- `chi != 1`, conductor bounded by `Q`, and a zero-free box;
- `||logDerivLAtOne chi||<=C log Y`;
- for `Y<=y<=Y^A`, `||Gchi chi y||<=y^(1/2+eps/2)`.

Because `chi!=1`, `pairEx_g` unfolds the project notation `An.gChi` to `Gchi`, with no principal-character correction. That gives the first `PairGood.bounds` component.

For the derivative bound, write

`Q_j=8M exp(z) exp(z')^j`, `j=0 or 1`.

The cutoff `Y>=exp(1+log(8M))` gives `1+log(8M)<=log Y`, hence `log Y>=1`. The local lemma `log_exp_product_bounds` proves

`Y^(eps/6) <= log Q_j <= 3Y^(eps/5)(log Y)^2`.

Apply `kappa4` to the `GoodC Q_j chi` component, obtaining `||logDerivativeAtOne chi||<=4log Y`. Finally `Y<=y` implies `log Y<=log y`, so the desired bound is `<=4log y`.

For real `rho` with `rho.N|8M`, the same `pairEx_box` gives `Box Q_j ...`; its `GoodC` component contains `ZeroFreeBox Q_j`, definitionally the `PairGood.boxes` conclusion.

## 7. Downstream link and comparison with earlier interpretation

`winPairs` consumes this theorem together with `VWinAt psi 401`. The prior MATH chapter correctly kept those two producers separate. The new result here shows exactly what `PairEx` contributes:

- two prime witnesses in controlled logarithmic intervals;
- congruences `q mod 8=3`, `d mod 16=7`;
- `q|d+1` and every odd prime `p<=Y^(eps/5)` dividing `d+1`;
- three nontrivial quadratic-character boxes;
- uniform `gChi` and logarithmic-derivative bounds.

It does **not** contribute the exponent `401`; that belongs to the later V-window rescaling argument. It also does not prove the analytic `stage1`/`stage2` estimates, the Galois-cohomological `VWinAt`, the host construction, or the final RH statement.

## Executed checks

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_ex_assembly.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_ex_assembly.py
```

The checker validates all nine pinned source/blob entries and required report anchors; enumerates the three legal twist branches; checks a concrete `Rows` witness `z=3,z'=6,q=11,d=263`, including both `q|d+1` and the odd-prime small-divisor clause; checks the height-log inequalities over a deterministic grid; and rejects the non-strict endpoint `eps=1/52`. These finite checks validate the assembly algebra only. Lean elaboration and the analytic inputs were not rerun.

## Failed attempts / limits

- GitHub code search returned no upstream `QH.pairEx` hit; direct pinned-path retrieval was required.
- Guessed capitalized `MeanSquareBounds/PairEx.lean` and colocated `PairGood.lean`, `PairHyp.lean`, `WinPairs.lean` paths returned 404. The actual file is lowercase `pairEx.lean`, while `PairGood` is in `CharacterBoxes`.
- No local checkout of the 175,187-module Lean project is present, so no claim of kernel replay is made.
- This run deliberately did not expand `stage1` and `stage2`; those are the next analytic-prime obligations, not dispensable assumptions.

## RESUME HERE

Trace `pair_share` one layer further by reconstructing `stage1` and `stage2`: preserve the exact bad-set cardinality inequalities for `GoodQ` and `GoodD`, identify where `eps<1/52` enters each analytic estimate, and record the mean-square/zero-density theorem that turns each bad family into at most `eta` of its prime set. Do not repeat the final `PairEx` assembly or the separate generalized-host balance adapter.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.

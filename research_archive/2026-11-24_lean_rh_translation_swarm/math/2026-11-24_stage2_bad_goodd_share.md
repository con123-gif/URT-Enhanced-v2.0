# MATH lane — `QH.stage2`: the sparse bad-`GoodD` second-prime theorem

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single pinned theorem `QH.stage2`, with a deterministic arithmetic/provenance certificate.  
**Status:** PARTIAL for the full reconstruction. This is not a Lean kernel replay, not an independent proof of the generic zero-density/mean-square stage, and not a proof of RH.

## Source pin and scope

Authoritative upstream revision: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/CharOf.lean` | `3eeed8077330efa249cde313d99d89a7c09d8ba6` | `sig_of`, `char_of`, `ev_log`, and theorem `QH.stage2` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/StagePow.lean` | `2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7` | generic sparse-bad-prime theorem `QH.stage` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/ExistsCoprimePrimePairSetSecondEqPPset.lean` | `cefa9655ae40be3c48b7a2995743fc2252213bda` | CRT identification of the structured second-prime set |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/LogOddM.lean` | `939d67273709b6304685578c54db13ee49c98296` | logarithmic modulus bound |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean` | `5443adc0075731900672030d140d5d8c85b668f7` | primitivity after the `q`-Jacobi twist |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | exact `GoodD`, `BoxAll`, `oddM`, and prime-set definitions |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | immediate downstream density-to-good-subset conversion |

Current upstream `HEAD` observed in this run was
`1cd97d8aa4a16681b109389ab18eefa4b2ba36d8` (2026-11-24 13:35:23 UTC). The pinned
`CharOf.lean` path returns 404 there, so no present-`HEAD` equivalence is claimed.

The preceding MATH run expanded `stage1`. This run expands **only `stage2`** and corrects three
common simplifications: the second set is first converted to one arithmetic progression; the
generic epsilon is `6*eps/5`, not `eps`; and the finite character family contains the two
`q`-twist choices `a=0,1`, while the generic outer twist supplies `J d`.

## 1. Exact target and quantifier order

There exists `C>0` such that for every real `eps,tau,K,eta` and natural `N0`, under

`0<eps`, `eps<1/52`, `0<tau`, `1<=K`, `0<eta`, `0<N0`,

there exists `Y0` such that for every `Y>=Y0`, every real `z'` satisfying

`Y^(eps/5)*(log Y)^2 <= z' <= K^2*Y^(eps/5)*(log Y)^2`,

and every `q` in `primePairSetFirst(Y^(eps/5))`:

1. `primeSetTwoBounds(Y^(eps/5),z',q)` is nonempty;
2. if `B` is a subset of that second-prime set and every `d in B` fails
   `GoodD N0 C tau Y (Y^K) (Y^(eps/5)) z' q d`, then

   `card B <= eta * card(primeSetTwoBounds(Y^(eps/5),z',q))`.

Thus `q` is universally quantified after `Y,z'`; the conclusion is uniform over every admissible
first prime. The theorem is a cardinality statement, not a pointwise assertion about every `d`.

## 2. Why the generic epsilon is `6 eps / 5`

Put `z=Y^(eps/5)` and call the generic theorem `stage` with

`eps' = 6*eps/5`, `R = 2*card(DirichletCharacter(C,N0))`.

The identities used later are exact:

`eps'/6 = eps/5`,

`eps'/5 = eps/5 + eps/25`.

The first makes the generic lower scale exactly `z`. The second supplies an extra
`Y^(eps/25)` that absorbs the allowed `K^2` in the upper bound for `z'`. The generic theorem asks
only `eps'<=1/4`; the pinned strict hypothesis `eps<1/52` implies this. This wrapper does not derive
the constant `1/52` and does not weaken the public source interface.

After increasing `Y0`, the proof fixes four simultaneous estimates:

- `800*K*log Y <= z`;
- `2*log N0+2 <= z`;
- `K^2 <= Y^(eps/25)`;
- `exp 2 <= Y`, hence `2<=log Y`.

## 3. Information extracted from the already chosen first prime

Membership `q in primePairSetFirst z = PPset 8 3 (exp z)` gives:

- `q` prime and `q mod 8=3`, hence `q!=2`;
- `exp(z/2)<q<=exp z`.

The cutoff `2 log N0+2<=z` then gives `N0<q`, so `q` does not divide `N0` or the conductor of a
character modulo `N0`. The stronger cutoff `800*K*log Y<=z` gives

`(Y^K)^400 = exp(400*K*log Y) <= exp(z/2) < q`.

This “huge prime” inequality is essential below: `q` divides the new progression modulus but is not
placed in its small-prime branch.

## 4. Convert the second-prime set to one progression

Define

`oddM(z,q) = q * product{p prime : 3<=p<=floor z}`.

It is odd because `q!=2` and every prime in the product is at least three. The Chinese remainder
theorem therefore supplies `a0` coprime to `16*oddM(z,q)` such that

`d mod 16=7` and `oddM(z,q) | d+1`

if and only if

`d mod (16*oddM(z,q)) = a0 mod (16*oddM(z,q))`.

Consequently the source proves the exact finite-set equality

`primeSetTwoBounds z z' q = PPset (16*oddM(z,q)) a0 (exp z')`.

No equidistribution heuristic replaces this equality.

## 5. Verify every generic-stage scale condition

Instantiate `stage` with

| Generic input | `stage2` value |
|---|---|
| epsilon | `6*eps/5` |
| `U` | `exp z'` |
| `F` | `N0*exp z` |
| `m0` | `16*oddM(z,q)` |
| `a0` | the CRT residue above |
| `Xi` | the primitive image of pairs `(xi,a)` with `a in {0,1}` |

For the `admitted` record:

- positivity, divisibility by eight, and coprimality follow from the construction;
- `log(16*oddM(z,q)) <= 4z`: `log_oddM` gives
  `log 16+log q+z log 4`, then `q<=exp z`, `z>=2`, and elementary bounds for `log 2` reduce it to
  `4z`;
- because `log Y>=2` and `z' >= z(log Y)^2`,
  `(1/4)(log Y)^2 log m0 <= z'`;
- the lower condition is `Y^(eps'/6)=z<=z'`;
- the upper condition follows from
  `z'<=K^2 z(log Y)^2<=Y^(eps/25)z(log Y)^2=Y^(eps'/5)(log Y)^2`.

For each prime `p|m0`, there are exactly three branches:

1. `p|16`, so `p=2` and `p<=Y^(eps'/5)`;
2. `p` divides the small-prime product, so `p<=z<=Y^(eps'/5)`;
3. `p=q`, so `(Y^K)^400<p` by the preceding huge-prime estimate.

Finally, `F>=1`. For `F<=sqrt(U)`, take logarithms:

`log F = log N0+z <= z'/2`.

Indeed `log N0<=z/2`, while `z'>=z(log Y)^2>=4z`; hence the displayed inequality has slack.

## 6. The two-member-per-character primitive family

For every character `xi` modulo `N0` and `a in {0,1}`, `char_of` produces a primitive character
`g(xi,a)` whose level is at most `N0*q` and, for all `n` coprime to `N0`,

`g(xi,a)(n) = xi(n)*J(q,n)^a`.

The construction is case-sensitive:

- `a=0`: use the primitive character at `conductor(xi)`;
- `a=1`: use `twist_prim` on that primitive character and the prime `q`; its conductor is
  `conductor(xi)*q`.

Because `q` does not divide `N0`, it cannot divide `conductor(xi)`, so the primitive-twist theorem
applies. The family

`Xi = image g (all xi modulo N0 times {0,1})`

has cardinality at most `2*card(all xi modulo N0)`; injectivity is unnecessary. Its levels satisfy

`level(g(xi,a)) <= N0*q <= N0*exp z = F`.

## 7. The difficult bad-`GoodD` witness conversion

Let `d in B`. Membership in the second-prime set makes `d` prime. Failure of `GoodD` supplies
`xi`, `a<=1`, and failure of

`BoxAll (N0*exp(z+z')) C tau Y (Y^K)`

for the function

`n |-> xi(n)*J(q,n)^a*J(d,n)`

at ambient modulus `N0*q*d`.

Choose the generic-family witness `g(xi,a)` and the same ambient modulus `M=N0*q*d`, which is
nonzero. Suppose its generic box held. Its function is

`n |-> g(xi,a)(n)*J(d,n)`.

For every `n` coprime to `M`, divisibility gives `Coprime(n,N0)`; therefore `char_of` rewrites the
function exactly as

`xi(n)*J(q,n)^a*J(d,n)`.

Thus any primitive character induced by the failed `GoodD` function is also induced by the generic
function, contradicting the chosen failure. The box scales coincide because

`F*U = N0*exp z*exp z' = N0*exp(z+z')`.

The implication `Coprime(n,N0*q*d) => Coprime(n,N0)` is one-way; its converse is false and is not
used.

The generic `stage` theorem now supplies nonemptiness and the `eta` bad-share bound.

## 8. Downstream link and corrected interpretation

`PairShare.lean` converts the stage-2 bad-set inequality into a subset `G2` of size at least
`(1-eta)` times the second-prime set, every member satisfying `GoodD`. It performs this separately
for every good first prime `q`, after the stage-1 subset `G1` has been selected.

Compared with the earlier interpretation:

- retained: `stage2` controls failed `GoodD` second primes;
- corrected: it is conditional on every admissible already selected `q`, not a single global set of
  `d` independent of `q`;
- corrected: `a=0,1` index the optional `q` twist, while `J d` is always the generic outer twist;
- corrected: the rescaling `eps'=6eps/5` is forced by the lower/upper `z'` window;
- preserved dependency: zero-density, mean-square, `box_of_S`, `count_bad`, and `bad_share` inside
  generic `stage` remain analytic premises, not silently reproved here.

## Executed tests

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_stage2_bad_goodd_share.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_stage2_bad_goodd_share.py
```

The checker validates all seven pinned path/blob pairs and required report anchors; constructs and
checks a concrete CRT residue; tests the epsilon identities and strict endpoint; finds deterministic
log-space cutoffs and checks both endpoints of every `z'` interval; tests all three modulus-prime
branches; checks conductor/level and family-cardinality inequalities; verifies the bad-witness
function identity for both `a` values; and supplies converse/omitted-twist negative controls. These
finite tests validate the wrapper algebra only.

## Failed attempts / limitations

- Current upstream `HEAD` no longer contains the pinned `CharOf.lean` path; this run does not guess
  its replacement or claim semantic continuity.
- Guessed generic-stage paths `Stage.lean` and `StageOne.lean` had previously returned 404; the
  actual pinned generic source is `StagePow.lean`.
- GitHub code search did not recover a current-head `stage2` declaration, so the pinned tree was
  traversed directly to authenticate blob SHAs.
- The first local certificate run failed at the exact `z*(log Y)^2` boundary because two floating
  multiplication orders exceeded an absolute `1e-7` tolerance at enormous cutoffs. Replacing that
  check with a `1e-12` scale-relative comparison passed; no formula or theorem claim was changed.
- No local upstream Lean checkout exists; no elaboration, `lake build`, or axiom audit was run.
- The certificate cannot establish the generic analytic theorem or replace independent audit.

## RESUME HERE

Trace `PairShare.share_of_bad` and `pair_share` as the exact density-intersection bridge from the two
sparse-bad theorems to nested good sets `G1,G2`; preserve the `boxAll_mono` change from `Y^K` to an
arbitrary `X<=Y^K`, the `max C1 C2` constant, and positivity/nonemptiness arguments. Do not repeat
the `stage1` or `stage2` analytic wrappers.

**HANDOFF TO:** MATH, prime-window specialist, character-box specialist, audit, integration.

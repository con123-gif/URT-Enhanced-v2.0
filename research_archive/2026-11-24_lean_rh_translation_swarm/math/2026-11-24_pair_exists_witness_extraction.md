# MATH lane — `QH.pair_exists`: extracting an admissible prime pair

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED human derivation of the single pinned theorem `QH.pair_exists`, with a finite exact/numeric regression.  
**Status:** PARTIAL for the full reconstruction. This is not a Lean kernel replay, does not reprove `pair_share` or its analytic inputs, and is not a proof of RH.

## Source pin and exact scope

Authoritative source: `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Pinned source | Git blob | Role used here |
|---|---|---|
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean` | `7e63fdeda04264253733059bf951a4c1635cebaa` | theorem reconstructed here |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean` | `712579c16be75074705a2c5c00f69e2f5d835cf9` | nested positive-density premise |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean` | `f9d738eb0e0dce29b14633183dcafe3e0db5cb0d` | converts the two selected memberships to `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean` | `45616f33334b6ef360b18a8e64c0eb325f9463b8` | definitions of the two prime sets, `GoodQ`, `GoodD`, and `Rows` |
| `src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean` | `0020840fcf9b97e9e6e834c591e8516b9875e003` | immediate downstream consumer `QH.pairEx` |

Current upstream `HEAD` observed during this run was
`59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780` (2026-11-24 15:13:54 UTC). The pinned
`PairExists.lean` path returns 404 there, and current-head code search finds no `pair_exists`, so this
chapter claims fidelity only to the requested pin.

The preceding MATH chapter reconstructed `pair_share`. This contribution begins at its output and
ends with one actual pair `(q,d)`. It does not repeat the zero-density estimates that produced the
good sets.

## 1. Exact theorem and quantifier order

There exists a real constant `C>0` such that, for every real `eps,tau,K` and natural `N0`, if

`0<eps`, `eps<1/52`, `0<tau`, `1<=K`, and `0<N0`,

then there exists a real threshold `Y0` such that for every `Y>=Y0` and every real `X,z'` with

`X<=Y^K`,

`Y^(eps/5)*(log Y)^2 <= z' <= K^2*(Y^(eps/5)*(log Y)^2)`,

there exist naturals `q,d` satisfying all four conclusions simultaneously:

1. `Rows (Y^(eps/5)) z' q d`;
2. `N0<q`;
3. `GoodQ N0 C tau Y X (Y^(eps/5)) q`;
4. `GoodD N0 C tau Y X (Y^(eps/5)) z' q d`.

The choices are dependent: first choose `q` from `G1`; only then does `pair_share` provide the set
`G2(q)` from which `d` is selected.

## 2. Freeze the loss at one half

Take `C>0` and the threshold-producing statement from `pair_share`, and specialize its free loss
parameter to

`eta = 1/2`.

This is not a fitted physical constant. It is a proof choice ensuring that a positive-cardinality
ambient finite set has a nonempty good half. The source does this twice.

For a finite ambient set `P` and good subset `G`, `pair_share` gives

`0<card(P)` and `(1-1/2)*card(P) <= card(G)`.

After casting cardinalities to the reals,

`0 < (1/2)*card(P) <= card(G)`.

Hence `0<card(G)`, equivalently `G.Nonempty`. Applied first to

`P1=primePairSetFirst(Y^(eps/5))`,

this selects `q in G1`. The nested conclusion at that `q` gives the same two inequalities for

`P2(q)=primeSetTwoBounds(Y^(eps/5),z',q)`,

so it selects `d in G2(q)`. No independence, product-density, or common `G2` is asserted.

The strict choice `eta<1` is essential to this selection step. `pair_share` itself only assumes
`eta>0`; at `eta=1` its cardinality lower bound permits `G` to be empty.

## 3. Add exactly the two growth cutoffs

Write

`z = Y^(eps/5)`.

Because `eps/5>0`, `Y^(eps/5)` tends to infinity with `Y`. The proof obtains a threshold `Y2` such
that

`2*N0 <= z`

for every `Y>=Y2`. It then takes the final threshold

`Y0 = max(max(Y1,Y2), exp 2)`,

where `Y1` is the threshold returned by `pair_share` at `eta=1/2`.

The last cutoff is used quantitatively, not cosmetically. From `exp 2<=Y` the source obtains

`0<Y`, `2<=log Y`, and therefore the weaker but sufficient inequality

`2 <= (log Y)^2`.

Combining that with the theorem's lower window bound gives

`2*z <= z*(log Y)^2 <= z'`.

This is the separation premise needed by `rows_of_mem`. Without `Y>=exp 2`, the stated lower bound
need not dominate `2z`; for example `Y=e` gives `(log Y)^2=1`.

## 4. Convert memberships to the full `Rows` record

The subset witnesses from `pair_share` give

`q in primePairSetFirst z`, and `d in primeSetTwoBounds z z' q`.

Together with `z>0` and `2z<=z'`, the exact call is

`rows_of_mem z z' q d hz hzz (hG1 hq) (hG2 hd)`.

Unfolding the two prime sets, `rows_of_mem` obtains:

- `q` prime, `q mod 8=3`, `exp(z/2)<q<=exp z`;
- `d` prime, `d mod 16=7`, `exp(z'/2)<d<=exp z'`;
- `oddM z q` divides `d+1`.

Positivity of the two primes turns the exponential inequalities into

`z/2 < log q <= z`, and `z'/2 < log d <= z'`.

For the order relation, `2z<=z'` gives

`exp z <= exp(z'/2)`.

Thus

`q <= exp z <= exp(z'/2) < d`,

so `q<d`. Finally, the divisibility `oddM z q | d+1` implies the `Rows.d_class` condition: every
odd prime `p<=z` occurs in the finite product defining `oddM`, and the additional factor `q` handles
the separate case `p=q`. Therefore each such `p` divides `d+1`, equivalently `(d+1) mod p=0`.

This is more than a type conversion: the difficult step is the `q<d` comparison, and its source
proof uses the separately manufactured scale separation `2z<=z'`.

## 5. Prove the strict lower bound `N0<q`

The selected `Rows` witness supplies `q` prime and

`z/2 < log q`.

Primality gives `q>0`, so the standard logarithmic inequality used in the source is

`log q <= q-1`.

The growth cutoff gives `2*N0<=z`, hence `(N0:real)<=z/2`. The complete chain is

`(N0:real) <= z/2 < log q <= q-1 < q`.

Consequently `(N0:real)<q`, and exact casting returns the natural-number conclusion `N0<q`.
Nothing in this step changes `C`, `tau`, `X`, either modulus, or either character quantifier.

## 6. Preserve `GoodQ` and `GoodD`

Once `q in G1` is chosen, the first component of the nested `pair_share` conclusion is already

`GoodQ N0 C tau Y X z q`.

Once `d in G2(q)` is chosen, its final universal statement is already

`GoodD N0 C tau Y X z z' q d`.

The proof merely projects these two facts (`hgq` and `H4 d hd`). It performs no new monotonicity,
character manipulation, zero-free estimate, or parameter weakening here.

## 7. Immediate downstream link

Pinned `QH.pairEx` applies `pair_exists` with

`tau=eps/2`, `K=A`, `N0=8*M`, `X=Y^A`, and `z'=Y^(eps/5)*(log Y)^2`.

It receives `q,d,Rows,8*M<q,GoodQ,GoodD`; then `pairEx_box` transports the two good-character
statements into the `Box` obligations for the four `(i,j):Fin 2 x Fin 2` twists. Thus
`pair_exists` is the finite witness-selection bridge between density estimates and the character-box
consumer. It does not itself prove `PairEx`, the theta lift, the Galois representation input, or RH.

## 8. Corrections to existing interpretation

- **Corrected:** the existing `pairEx` chapter said `pair_share` “intersects positive-density good
  subsets.” The source does not form an intersection: it selects `q` from `G1`, then selects `d`
  from a dependent `G2(q)`.
- **Corrected:** half-density is used twice and sequentially; it is not a single simultaneous choice
  of `(q,d)` and not a product-density argument.
- **Corrected:** `2z<=z'` is not a theorem hypothesis. It is derived from the extra cutoff
  `Y>=exp 2` and the lower `z'` window bound.
- **Corrected:** `N0<q` is not supplied by `pair_share`; it uses the new cutoff `2*N0<=z`, the
  strict `Rows.q_gt`, and `log q<=q-1`.
- **Preserved:** the upper bound on `z'` and `X<=Y^K` are used when invoking `pair_share`, even
  though the later witness-extraction arithmetic does not mention them.
- **Preserved:** `rows_of_mem` establishes every field of `Rows`, including congruences,
  logarithmic windows, `q<d`, and the divisibility class.
- **Preserved:** all original hypotheses `0<eps<1/52`, `0<tau`, `1<=K`, and `0<N0` remain.

## Executed tests

Executed locally with Python 3.12:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_exists_witness.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_pair_exists_witness.py
```

The checker validates the five pinned path/blob pairs and report anchors; exhaustively tests the
half-density-to-nonempty inference for positive finite cardinalities; checks the two cutoff
inequalities over a parameter grid; verifies the strict `N0<q` chain on actual primes; and checks an
explicit `Rows` fixture

`z=3, z'=6, q=11, d=263`.

It also runs three negative controls: `eta=1` permits an empty good set, `Y=e` fails to force
`2z<=z'`, and prime interval bounds without `2z<=z'` permit reversed order. This validates the
finite/arithmetic assembly, not Lean elaboration or the upstream analytic theorems.

## Failed attempts / limitations

- The first attempted repository read failed because no checkout was mounted in the workspace; the
  exact protocol and sources were then read through the connected repository API before editing.
- The case-sensitive guess `PairEx.lean` returned 404. A pinned directory enumeration showed the
  actual downstream path is lowercase `pairEx.lean`; that path and blob are recorded above.
- The pinned `PairExists.lean` path returns 404 at current upstream `HEAD`, and current-head code
  search found no replacement declaration. No renamed theorem was guessed.
- No local upstream Lean checkout exists, so `lake build`, elaborated proof-term inspection, and
  `#print axioms QH.pair_exists` were not run.
- The checker treats `pair_share` and `rows_of_mem` as source-matched premises. It cannot certify
  their analytic inputs or kernel dependencies.

## RESUME HERE

Reconstruct pinned `QH.ind_drop`, the unresolved conductor-descent step used only in the
`pairEx_box` branch `j=0,i=1`: preserve both ambient moduli, `q` primality and `q!=2`, the premise
`not q divides 8*M`, primitive-character uniqueness, and every change-level evaluation. Do not
repeat the completed `pairEx`, `pair_share`, `pair_exists`, or `rows_of_mem` assemblies.

**HANDOFF TO:** MATH, character-box specialist, audit, integration.

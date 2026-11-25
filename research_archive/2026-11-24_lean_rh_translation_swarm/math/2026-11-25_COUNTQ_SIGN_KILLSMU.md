# `countQ_alt`: the quadratic sign is killed exactly on discriminant-supported moduli

**Lane:** MATH / mandatory unified reduction, run 40

**Status:** SOURCE-MATCHED THEOREM + exact finite negative control; Lean certificate PREPARED / NOT COMPILED
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The previous run closed the potential-crystallinity leaf in the quadratic
twist of `AdmRNAlt.level`.  The remaining same-modulus leaf is now closed on
its exact conductor-supported branch.

Let `K/Q` be quadratic and let `delta` be the sign character whose kernel is
the subgroup fixing `K`.  The pinned public theorem `quadMu` says that an
absolute Galois element fixing every `|disc K|`-th root of unity fixes `K`.
Therefore the kernel description of `delta` gives

\[
\boxed{\operatorname{KillsMu}(|\operatorname{disc}K|,\delta).}
\tag{1}
\]

The definition of `KillsMu` is monotone under modulus divisibility: if
`D | M`, every automorphism fixing all `M`-th roots also fixes all `D`-th
roots.  Hence the decisive caller-ready equation is

\[
\boxed{
 |\operatorname{disc}K|\mid M
 \quad\Longrightarrow\quad
 \operatorname{KillsMu}(M,\delta).
}
\tag{2}
\]

For the actual fields hidden inside `quadFam`, the construction has
`disc K_i=-q_i` with `q_i` a prime congruent to `3 mod 4`; thus (2) is exactly
the `q_i | M` branch requested by the prior checkpoint.  Combining (2) with
the open-kernel potential-crystallinity result and the earlier exact
`LevelAt`/`LevelAway` twist algebra transports the full `Level` field on this
branch.

The remaining exception is also exact.  When `q_i` does not divide `M`, the
quadratic character of conductor `q_i` has an automorphism that is `1 mod M`
but a quadratic nonresidue mod `q_i`.  It fixes all `M`-th roots while
`delta=-1`, so `KillsMu M delta` fails.  In particular, the caller permits
`M=1`; then `KillsMu 1 delta` would force the nontrivial sign character to be
trivial.  Consequently a uniform unchanged-modulus twist theorem cannot be
used to erase the Boolean branch.  After the prior ramification-support split,
the only unresolved case is

\[
\boxed{q_i=l\quad\text{and}\quad l\nmid M.}
\tag{3}
\]

This is a narrower obstruction, not an RH proof or a new prime-window bound.

## Exact source and downstream link

| Role | Pinned source path | Blob |
|---|---|---|
| fixing roots of unity forces fixing the quadratic field (`quadMu`) | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/TorsionOrderFrobenius/QuadMu.lean` | `cd82f0f55b5806353463a3c44078678a70b9c42d` |
| sign/kernel definition | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BcDefs.lean` | `8d993474a875273ff2d79bbbc2dbf0fff11bae57` |
| restriction range equals the quadratic fixing subgroup | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/SelmerTransport/ConjStableShaFam.lean` | `578402a7b2aea9f24d31473aab4486dd43055fb2` |
| actual `disc K_i=-q_i` construction | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/CrystallineBaseChange/QuadFam.lean` | `cb75bc09b3065d1f24e341f271a97c38a739114e` |
| root-reachable `countQ_alt` caller | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

The theorem interface `quadFam` exposes quadratic fields and pairwise coprime
discriminants but hides the internal primes `q_i`.  The reusable Lean bridge is
therefore correctly stated using `|disc K| | M`, not an unavailable `q_i`
parameter.  At the construction body this specializes to `q_i | M`.

## Unified reduction record

- **Actual root leaf:** `countQ_alt -> AdmRNAlt.level -> {LevelAway,LevelAt}
  -> KillsMu M delta`.
- **Premise weakening:** the generic same-modulus hypothesis is derived from
  the already available quadratic kernel description plus
  `|disc K| | M`.
- **Exact cancellation before bounds:** there is no norm estimate.  `quadMu`
  proves exact membership in the fixing subgroup; the sign character is then
  exactly one.
- **Symmetry:** the same `KillsMu` proof applies to `delta^-1=delta`.
- **Aggregate support:** pairwise coprime discriminants imply that supported
  indices inject into the prime support of `M`; no bound is claimed without a
  bound on that support.
- **Context cache:** `(pin,countQ_alt,K_i,delta_i,M,|disc K_i| divides M)`.
- **Backtracking:** do not retry `aut`, `dual`, `safe`, potential
  crystallinity, or the `q_i | M` level branch.  Backtrack only to (3).
- **Original graph retained:** the generic `CountQAlt`, the Boolean fibre, and
  the exceptional at-`l` branch remain unresolved.

## Executed checks

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_sign_killsmu.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_sign_killsmu.py
git diff --check
```

The exact finite regression checks all primes `q <= 97` with `q = 3 mod 4`
and every `1 <= M <= 96`.  On `q | M` it verifies every relevant unit residue
has sign `+1`; on every `q not | M` it constructs a CRT residue fixing
`mu_M` with sign `-1`.  This is a finite audit of the cyclotomic quotient and
the negative control, not a proof of the infinite Galois theorem; that proof
is the source-matched `quadMu` composition in the prepared Lean file.

Lean/Lake is unavailable locally.  The file invokes `rh_prune`, `rh_scan`,
`rh_reduce`, `rh_auto`, and `rh_auto_frontier`, and requests axiom output, but
it is **PREPARED / NOT COMPILED**.  No native or CI PASS is claimed.

## Failed attempt and limitation

Trying to deduce `KillsMu M delta` from finite image or open kernel alone is
false: those properties give some conductor, not the caller's unchanged
modulus `M`.  The negative controls above exhibit the failure whenever the
prime conductor does not divide `M`.  Equation (2) is therefore the correct
weakest source-supported interface.

This result does not prove `CountQAlt`, the weighted-prime lower bound, or RH.

## RESUME HERE

At the actual `countQ_alt` fibre, combine this theorem with the preceding
open-kernel potential-crystallinity and `Level` twist adapters, then split the
supported condition `q_i | lM` into `q_i | M` (now closed) and the sole
exception `q_i=l` with `l not | M`.  Test whether the exceptional character's
local inertia can be absorbed by the existing `LevelAt` flag without changing
the fixed weights `(e,-e)`; if not, record it as the precise separator and use
it to remove the quadratic partner for that branch.  Compile the caller
substitution and inspect `#print axioms` before retiring any fallback.

**HANDOFF TO:** kernel/audit for native replay; integration for the
discriminant-supported branch; MATH/Galois for the exceptional at-`l` flag.
RH remains OPEN.

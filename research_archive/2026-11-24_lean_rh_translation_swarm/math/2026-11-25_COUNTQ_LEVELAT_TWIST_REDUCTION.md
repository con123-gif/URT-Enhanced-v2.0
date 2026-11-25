# `countQ_alt`: exact reduction of the at-`l` level twist

**Lane:** MATH / mandatory unified reduction, run 37  
**Status:** SOURCE-MATCHED CONDITIONAL THEOREM + exact finite regression; Lean certificate PREPARED / NOT COMPILED  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The previous runs reduced the rank-two `AdmRNAlt` classifier to its `Level`
field: `irr`, `aut`, `dual`, and `safe` do not distinguish the quadratic sign
twist.  `LevelAway` already excludes a twist ramified outside `lM`.  This run
expands the remaining `LevelAt` definition and proves its exact weakest
twist interface.

Let `W` be the actual rank-two representation, let `delta` be a character,
and retain the same modulus `M` and weights `(e,-e)`.  If

1. `KillsMu M delta`, and
2. at every place over `l`, potential crystallinity of `W` implies potential
   crystallinity of `W tensor delta`,

then

\[
\boxed{
  \operatorname{LevelAt}(l,M,(e,-e),W)
  \Longrightarrow
  \operatorname{LevelAt}(l,M,(e,-e),W\otimes\delta).
}
\tag{A}
\]

No change of weight, level, place, or flag basis is needed.  If the original
flag characters are `kappa_i` and the finite characters are `chi_i`, use

\[
  \kappa'_i=\kappa_i\delta,
  \qquad \chi'_i=\chi_i\delta.
\]

The inertia relation is preserved by the exact equation

\[
 (\operatorname{cyc}^{m_i}\chi_i)\delta
   =\operatorname{cyc}^{m_i}(\chi_i\delta),
\tag{B}
\]

and the noncritical-character alternative is equivalent before and after
twisting because

\[
\boxed{
 \kappa_i\delta=(\kappa_j\delta)\operatorname{cyc}
 \iff \kappa_i=\kappa_j\operatorname{cyc}.
}
\tag{C}
\]

Equation (C) is cancellation in the character group before any norm or local
estimate.  Thus the `LevelAt` flag, weight relation, and distinct-character
branches are not separators.  The only surviving at-`l` leaf is the standard
local statement that the finite sign character is potentially crystalline;
same-modulus `KillsMu` is shared with the already isolated `LevelAway` leaf.

## Exact source and downstream link

All blobs below are from the pinned upstream revision.

| Role | Source path | Blob |
|---|---|---|
| `KillsMu`, `IsFlagOn`, `PotCrysAt`, `LevelAt`, `Level` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` | `f342e0eb41bf3129145addd7b04d3f3ed303050b` |
| abstract twist/flag algebra (`ShapeFacts`) | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ShapeFacts.lean` | `004f17b6fc928749d70f972f374d4448c39c990b` |
| proved flag-twist implementation | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/HolomorphicIrreducibility/ShapeFacts.lean` | `b38c90661189e406b53f5efc8dbc0ec3ad0b58bb` |
| actual finite sign character | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/ExistsQuadraticSignCharacter.lean` | `2f88a58801b17ae7fc3a5c392b624d5a16b960de` |
| actual `countQ_alt` consumer | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

The source already contains `potCrys_twistBy`, but applying it here still
requires a crystalline rank-one model for the restricted sign character.
`exists_quadratic_sign_character` proves continuity, nontriviality, sign
range, kernel identification, and eventual unramifiedness; it does not state
that rank-one crystalline premise or `KillsMu M delta` for arbitrary caller
`M`.  Neither premise is silently imported in (A).

The root-reachable link is

```text
countQ_alt
  -> bit_of_fibre / quadratic sign twist
  -> AdmRNAlt.level
  -> Level.above
  -> LevelAt
  -> {KillsMu same M, finite-sign PotCrys transport}
```

## Unified-reduction ledger

- **Actual context:** rank two, weights `(e,-e)`, same `l`, `M`, place, and
  quadratic sign character as `countQ_alt`.
- **Original graph:** `LevelAt` expands to a place witness, finite characters,
  a flag, the inertia weight equation, and a disjunction between distinct
  adjacent characters and `PotCrysAt`.
- **Reduced graph:** the place and flag witness are reused; equations (B) and
  (C) close the algebraic branches.  Only `KillsMu M delta` and the local
  rank-one crystalline twist supplier survive.
- **Exact cancellation:** the common `delta` is cancelled in (C) before norms,
  conductor bounds, or Hodge estimates.
- **Symmetry/backtracking:** for a sign character, applying the same transport
  twice returns the original representation once the two surviving premises
  are supplied.  Do not revisit `irr`, `aut`, `dual`, or `safe`.
- **Context cache key:** `(pin, countQ_alt, LevelAt, rank=2, m=[e,-e],
  same-M, quadratic-sign)`.
- **Premise weakening:** no automorphy, irreducibility, Frobenius trace,
  `SafeRA`, `DualTw`, or RH premise is used by (A).
- **Unresolved graph:** `LevelAway` conductor support and the two explicit
  inputs of (A) remain.  No original fallback or unresolved axiom is removed.

## Executed test

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_levelat_twist_reduction.py
COUNTQ LEVELAT TWIST REDUCTION CERTIFICATE
finite character group=C4 into F_5^*
distinct-character cancellation cases=256
flag-relation transport cases=832
prepared Lean hygiene=True
RESULT: LevelAt flag algebra is twist invariant; only same-modulus
        KillsMu and finite-character PotCrys transport remain
```

The exact regression exhausts all characters of `C4` into `F_5^*` for the
cancellation equivalence and 832 weight/character/twist combinations for the
flag relation.  It is a finite algebra check, not a proof of the local Hodge
leaf.

The prepared Lean theorem constructs the new `LevelAt` witnesses, invokes the
pinned `killsMu_mul` and `flag_twist` lemmas, performs the cancellation, and
includes `rh_reduce`, `rh_auto`, `rh_auto_frontier`, actual-caller `rh_scan`,
and axiom queries.  Local Lean/Lake is unavailable.  Therefore no native Lean
PASS is claimed and no CI result is attributed to this file.

## Failed attempt and limitation

The attempt to make `LevelAt` itself distinguish the two partners fails on
all algebraic fields: (B) and (C) make them invariant.  The source sign
constructor alone is insufficient to close (A), because it does not expose
the required same-`M` factorisation or a crystalline rank-one local model.
This run proves neither those inputs, `CountQAlt`, the weighted-prime window
bound, nor RH.

## RESUME HERE

At the actual `quadFam` prime `q_i`, prove the single local rank-one statement
that the restriction of the finite sign character to every decomposition
group above `l` is potentially crystalline, by instantiating the pinned
`potCrys_twistBy` interface without changing `M`.  In parallel, derive
`KillsMu M delta_i` exactly in the supported branch `q_i | M` from the
quadratic conductor.  If both compile, combine this file with the existing
`LevelAway` theorem to mark the full `Level` classifier invariant precisely
for `q_i | M`; retain the excluded `q_i \nmid lM` branch and audit the case
`q_i=l \nmid M` separately.

**HANDOFF TO:** kernel/audit for native compilation and axiom output;
Galois/MATH for the finite-sign crystalline rank-one leaf; integration for
the two-premise reduced graph only.  RH remains OPEN.

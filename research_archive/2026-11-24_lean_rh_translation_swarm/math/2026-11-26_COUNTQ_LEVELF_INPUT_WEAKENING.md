# Lane 2 — CountQ `Level` to `LevelF` input weakening

## Result

At the actual rank-two `CountQAlt` restriction edge, the source level input can
be weakened from

\[
  \operatorname{Level}(l,M,(e,-e),r)
\]

to

\[
  \boxed{\operatorname{LevelF}(l,M,(e,-e),r)}.
\]

This is a strict interface reduction.  The stronger `Level.above` field ends
with the alternative

\[
 \bigl(\forall i,j,\ \kappa_i\ne\kappa_j\bar\varepsilon_l\bigr)
 \quad\lor\quad \operatorname{PotCrysAt}(r,A),
\]

whereas `LevelF.above` retains the place, flag characters, root-of-unity
control and weight formula but not that final alternative.  The pinned
`LevelF.of_level` proof discards it explicitly with `-`.

The specialized theorem
`admissible_restriction_rankTwo_of_levelF_core` constructs the same
`AdmPNAlt` output directly from `LevelF`, restricted irreducibility,
automorphy, duality and the printed hypotheses.  Its output safety remains the
previously proved fixed-weight equation

\[
  \forall i,j\in\operatorname{Fin}2,\qquad
  (e,-e)_i\ne(e,-e)_j+1 \quad(e\ge1).
\]

Thus neither the input `SafeRA` nor the discarded potentially-crystalline
fallback is a premise of this restriction edge.  The accompanying bridge
recovers the old stronger-input statement by one application of
`LevelF.of_level`.

## Original and reduced graphs

Original local edge:

```text
Level
  = cont + away + above(FlagAt + [flag-gap OR PotCrysAt])
  -> LevelF.of_level
  -> levelFRes
  -> AdmPNAlt
```

Reduced local edge:

```text
LevelF
  = cont + away + above(FlagAt)
  -> levelFRes
  -> AdmPNAlt
```

This does **not** delete the original full `Level` predicate from every caller.
It deletes the final `LevelAt` alternative only from this direct restriction
supplier's interface.  The original record remains available as fallback and
maps to the reduced interface.

## Negative-control obstruction

No further `LevelF` field deletion is justified by the actual consumers:

- `levelFRes` uses `cont`, `away`, and `above` to build the corresponding
  restricted fields.
- `levelCore_alt`, called by `levelPA_alt`, uses `above` in its infinitesimal
  character and above-`l` fixed-vector branches, `away` in its away-`l`
  fixed-vector branch, and `cont` throughout compatibility and Frobenius work.
- `countP_alt` additionally reads `level.cont` for representation comparison.

So the correct backtrack is: remove the stronger final disjunction, but retain
all three `LevelF` projections.  Any claim that the whole `above` field is dead
would be false.

## Unified-reduction accounting

- **Root reachability:** `countQ_alt` is instantiated at `n=2` by
  `frobenius_trace_count_bound_of_rat_eigensystem_count_alt`.
- **Premise weakening:** full `Level` becomes `LevelF` on the direct
  restriction edge.
- **Exact cancellation before bounds:** no norm or inequality is introduced;
  the unused final disjunction is removed before downstream estimates.
- **Symmetry:** fixed rank-two weights provide `SafePA` directly.
- **Aggregate scope:** only the specialized rank-two edge is weakened.
- **Context cache:** `(pin, CountQAlt, n=2, m=(e,-e), e>=1, LevelF input)`.
- **Backtracking:** do not attempt to delete `LevelF.cont`, `.away`, or `.above`
  without replacing their distinct consumers.

## Sources

Pinned upstream revision:
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Declaration | Pinned path | Blob |
|---|---|---|
| `Level`, `LevelAt` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` | `f342e0eb41bf3129145addd7b04d3f3ed303050b` |
| `LevelF`, `LevelF.of_level` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SemisimpleLevels/CountRankThree.lean` | `64c6467157976ddf7783023bb81ec657fb7ca720` |
| `levelFRes` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SemisimpleLevels/LevelFRes.lean` | `7acc9aa1152af5cf8f6446782a203e7a5fa15c80` |
| `levelCore_alt`, `levelPA_alt` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/KeepLevel.lean` | `f6bf6656c2fa3abdfd7a1f660710ddd53091e203` |
| original restriction | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevelAdmissibleRestrictionHolds.lean` | `f22dc88980db7cea30d6ab4e4380d927a36b94e0` |
| actual CountQ caller | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_levelf_input_weakening.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_levelf_input_weakening.py
git diff --check
```

The verifier checks the exact source pin, the discarded final `LevelAt`
alternative, the actual rank-two caller, and the positive/negative projection
data flow.  Local `lean`, `lake`, and `elan` are unavailable.  The prepared
Lean file invokes `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and
`rh_auto_frontier`, but no native or CI PASS is claimed for it.  CI runs
45577239749 and 45576756833 validate only the engines and baseline conditional
root.

## Failed attempt and limitations

The attempted stronger reduction—deleting one of `LevelF.cont`, `.away`, or
`.above`—fails the source audit because each has a distinct live consumer.
This result proves none of those retained fields, automorphy, polarization,
`WitA`, `CountQAlt`, the weighted-prime lower bound, or RH.

## RESUME HERE

Kernel-compile the prepared replacement and inspect its axiom output.  Then
trace the retained `FlagAt` package inside `levelCore_alt`: determine whether
the fixed weights `(e,-e)` let its root-of-unity character data be weakened
without losing either the above-`l` infinitesimal-character branch or the
fixed-vector branch.  Preserve all three `LevelF` projections until a
caller-level replacement is proved.

**HANDOFF TO:** kernel/audit for native replay; integration for the reduced
rank-two graph; MATH for the retained `FlagAt` consumers. RH OPEN.

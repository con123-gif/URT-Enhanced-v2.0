# `countQ_alt`: weaken the final at-`l` Hodge premise

**Lane:** MATH / mandatory unified reduction, run 38  
**Status:** SOURCE-MATCHED PREMISE WEAKENING + executable finite regression; Lean adapter PREPARED / NOT COMPILED  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The preceding MATH reduction left an ad hoc premise saying that twisting by
the quadratic sign character preserves `PotCrysAt`.  The pinned source already
contains the stronger reusable theorem `GlobalTheory.TwistAbove.twist_above`.
At one fixed local bridge it gives the exact implication

\[
\boxed{
  \operatorname{IsPotCrysAt}(W)\;\land\;
  \operatorname{IsPotCrysAt}(\operatorname{rk1}\delta)
  \Longrightarrow
  \operatorname{IsPotCrysAt}(W\otimes\delta).
}
\tag{P}

The proof does not estimate periods separately.  It chooses finite extensions
on which `W` and the rank-one character are crystalline, passes to their
compositum, restricts both representations there, and applies the crystalline
tensor/twist rule.  Thus the arbitrary preservation function is removed from
the reduced graph.  The only local Hodge leaf is now:

> the restricted rank-one representation of the actual finite quadratic sign
> character is potentially crystalline on every bridge above `l`.

At the wrapper used by `LevelAt`, the prepared adapter states that this one
rank-one premise implies

\[
  \operatorname{PotCrysAt}(W,A)
  \Longrightarrow \operatorname{PotCrysAt}(W\otimes\delta,A).
\tag{W}

Together with the previous run, the full at-`l` level transport is therefore
reduced to exactly two independent leaves:

1. `KillsMu M delta` for the caller's unchanged modulus `M`;
2. potential crystallinity of `rk1 delta` locally at `l`.

## Exact source and downstream link

| Role | Pinned source path | Blob |
|---|---|---|
| `IsCrysAt`, `IsPotCrysAt`, model wrappers | `src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/FiniteDimensionalWdSpace.lean` | `dd7de531043d35481be4a07d58e9c956705662d7` |
| potential-crystalline twist/compositum theorem | `src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/RepERankOne.lean` | `c90592f00a6ba2b220e4c4297aff7984d2876291` |
| actual `PotCrysAt`/`LevelAt` wrapper | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` | `f342e0eb41bf3129145addd7b04d3f3ed303050b` |
| working caller adapter pattern | `src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/SplitLineSubtraction/PTwLoc.lean` | `72155bb8af9c3cd58c1f6be1b726bcaf5d605e0e` |
| actual `countQ_alt` consumer | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

Root-reachable reduced chain:

```text
countQ_alt
  -> AdmRNAlt.level -> Level.above -> LevelAt
  -> PotCrysAt disjunct
  -> native twist_above
  -> IsPotCrysAt (rk1 restricted quadratic sign character)
```

## Unified-reduction ledger

- **Original local graph:** an unconstrained premise
  `PotCrysAt W A -> PotCrysAt (tw W delta) A`.
- **Reduced graph:** the native rank-one premise in (P), on the same bridge.
- **Exact aggregation:** if `K1` and `K2` crystallize the two factors, the
  source uses `supExt K1 K2`; no independent final witnesses are mixed.
- **Symmetry:** a quadratic `delta` is its own inverse, so the same implication
  applies in both twist directions once its rank-one premise is supplied.
- **Premise weakening:** no automorphy, irreducibility, `SafeRA`, Frobenius
  trace, level-away diagonalisation, or RH assumption enters (P).
- **Cache key:** `(pin, countQ_alt, LevelAt, place A, bridge Bw,
  rank-one quadratic sign, potential-crystalline twist)`.
- **Original fallback retained:** `potCrys_twistBy` with the stronger
  crystalline-character hypothesis remains available, but is not needed for
  the weakened interface.

## Executed audit

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_potcrys_premise_weakening.py
```

The finite regression checks the common-extension mechanism for every pair of
subgroups in cyclic groups of orders 1 through 64.  It also checks the pinned
`twist_above` source anchor and prepared-file hygiene.  This finite audit is a
regression for the compositum logic, not a proof of p-adic Hodge theory.

The prepared Lean adapter invokes the native `twist_above`, scans the actual
`countQ_alt` caller, passes through `rh_reduce`, `rh_auto`, and
`rh_auto_frontier`, and requests axiom output.  Local Lean/Lake is unavailable;
therefore no native compilation or CI PASS is claimed.

## Failed attempt and precise obstruction

The stronger route through `potCrys_twistBy` demanded that the finite sign
character already be crystalline over the original local field.  That is
unnecessary: (P) only needs potential crystallinity and admits a further
finite extension.

The pinned `exists_quadratic_sign_character` theorem supplies continuity,
the values `+1/-1`, and the global kernel.  In the inspected imports, no direct
adapter was found which converts that global kernel description, after
restriction to a decomposition group, into the `FinExt l` witness required by
`LocBridge.IsPotCrysE`.  Standard mathematics says a continuous finite-image
p-adic character becomes trivial over a finite extension, but that bridge has
not been silently assumed or claimed compiled here.

This run proves neither that remaining rank-one bridge, `KillsMu M delta`, the
weighted-prime lower bound, nor RH.

## RESUME HERE

Construct the single reusable local lemma: a continuous character
`mu : Gw -> (Qbar l)^x` with finite image has
`IsPotCrysAt P Bw (rk1 mu)`.  Use the Krull-topology finite-extension witness
for the open kernel, model the restricted representation as trivial, and
close crystallinity with the pinned trivial-representation theorem.  Then
instantiate it with the actual `exists_quadratic_sign_character`, re-run this
adapter natively, and combine with the existing same-modulus `KillsMu` branch.

**HANDOFF TO:** Galois/MATH for the open-kernel-to-`FinExt` construction;
kernel/audit for native compilation and axiom output; integration for the
two-leaf reduced graph.  RH remains OPEN.

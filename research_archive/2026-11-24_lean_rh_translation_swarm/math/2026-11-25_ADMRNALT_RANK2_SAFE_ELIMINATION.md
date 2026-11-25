# `AdmRNAlt` at the rank-two caller: exact `safe`-field elimination

**Lane:** MATH / mandatory unified reduction, run 34  
**Status:** SOURCE-MATCHED CALLER REDUCTION; Lean certificate PREPARED / NOT COMPILED  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

At the actual rank-two consumer of `CountQAlt`, the `safe` field of
`AdmRNAlt` is redundant.  The caller fixes

\[
  n=2,\qquad m=(e,-e),\qquad e\ge 1.
\]

The pinned definition is

\[
\operatorname{SafeRA}(l,M,m,r)iff
  (l\mid M\ \wedge\ \operatorname{UnlAll}(r))
  \ \vee\ 
  \forall i,j,\ m_i\ne m_j+1.
\tag{1}
\]

For `Fin 2`, the four differences `m_i-m_j-1` are

\[
  -1,\qquad 2e-1,\qquad -2e-1,\qquad -1.
\tag{2}
\]

Since `e >= 1`, none is zero.  Hence the right disjunct of (1) always
holds, independently of `l`, `M`, and `r`:

\[
\boxed{e\ge1\Longrightarrow
  \operatorname{SafeRA}(l,M,(e,-e),r).}
\tag{3}
\]

Consequently, at this caller `AdmRNAlt` is implied by the four-field core

\[
  \operatorname{IsIrr}(r),\quad
  \operatorname{IsAutQA}(\iota,r),\quad
  \operatorname{Level}(l,M,(e,-e),r),\quad
  \exists\theta\,[\operatorname{IsCycWt}(l,0,\theta)\wedge
                    \operatorname{DualTw}(r,\theta)].
\tag{4}
\]

The companion Lean theorem `admRNAlt_rankTwo_of_core` is the exact
original-statement bridge `(4) -> AdmRNAlt`; it fills the fifth structure
field with (3).  This is a genuine premise deletion in the specialised
root-reachable graph, not a redefinition of the generic `CountQAlt`
predicate.

## Exact source bodies and downstream link

Pinned source paths and blobs:

- `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean`, blob
  `d626de1e423ebf58d4b7357f69905fd98829ff51`: `AdmRNAlt` has exactly the
  fields `irr`, `aut`, `level`, `dual`, `safe`; `safe` is `SafeRA l M m r`.
- `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean`, blob
  `125ba13df0fb07890a431dcded6fb91c22f1b1e0`: exact disjunction (1).
- `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean`, blob
  `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`: theorem
  `frobenius_trace_count_bound_of_rat_eigensystem_count_alt` invokes
  `CountQAlt` only at `n=2`, `m=![(e:Z),-(e:Z)]`, `wt=0`, under `1 <= e`.
  Its classifier domain is precisely `AdmRNAlt` at those parameters.

The exact downstream chain is therefore

```text
frobenius_trace_count_bound_of_rat_eigensystem_count_alt
  -> CountQAlt(2, [e,-e], 0)
  -> classifier on AdmRNAlt(ι,M,[e,-e],0)
  -> admRNAlt_rankTwo_of_core
```

No claim is made that every generic use of `CountQAlt` has rank two or
nonadjacent weights.

## Effect on the quadratic-twist Boolean

This resolves the previous run's `safe` question negatively as a possible
separator: `safe` cannot distinguish `r` from `r tensor delta_i` because it
is forced solely by the fixed weight vector.  Thus it cannot remove the
`Bool` in `bit_of_fibre`.

After exact pruning, the only admissibility fields still capable of
excluding the twisted partner are `irr`, `aut`, `level`, and `dual`.
The present run does **not** assert twist preservation for any of those
four fields.  In particular, the source-level question whether `Level`
survives twisting at primes dividing `M`, and whether `IsAutQA` has the
required quadratic-twist closure, remains open.

The previous finite countermodel remains correctly scoped: it proved that
restriction plus split Frobenius data cannot yield uniqueness, but it did
not instantiate `AdmRNAlt`.  Equation (3) now shows that one of the five
actual admissibility fields supplies no additional constraint in the
root-specialised context.

## Unified-reduction ledger

- **Actual root context:** the rank-two rational trace-count supplier used
  by the admissible rank-three path; no independent RH criterion added.
- **Specialisation:** `n=2`, `m=(e,-e)`, `wt=0`, `e>=1`.
- **Exact algebra before bounds:** expand all four pairs in the integer gap
  predicate, obtaining (2); no norm or inequality envelope is introduced.
- **Premise weakening:** delete the representation-dependent `safe` input
  from the specialised `AdmRNAlt` constructor by the checked bridge (3).
- **Symmetry/backtracking:** because (3) is invariant under every change of
  `r`, it cannot break the residual quadratic-twist symmetry; return to
  `level` and `aut`, not another `safe` analysis.
- **Context cache key:**
  `(pin, AdmRNAlt, rank=2, m=[e,-e], wt=0, e>=1, SafeRA)`.
- **Original graph:** caller -> generic `AdmRNAlt` -> five structure fields.
- **Reduced graph:** caller -> four-field core -> `AdmRNAlt`, with `safe`
  discharged by a weight-only leaf.
- **Unresolved graph:** all generic callers and the four surviving fields
  remain visible.  The `Bool`, `rootSum`, `resTwo`, `twCard`, and automorphic
  classification edges are not removed.
- **Axiom evidence:** no RH declaration is imported as a shortcut.  The
  prepared theorem uses only the pinned definitions, `Fin 2` case analysis,
  integer simplification, and `omega`.

## Executed test

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_admrnalt_rank2_safe_elimination.py
ADMRNALT RANK-TWO SAFE ELIMINATION CERTIFICATE
four symbolic differences=(-1, 2*e-1, -2*e-1, -1)
boundary e=1 values=(-1, 1, -3, -1)
checked integer range=1..10000, pairs=40000
forbidden adjacent-pair count=0
RESULT: SafeRA right disjunct is forced by rank-two weights (e,-e), e>=1
```

The script checks the exact four symbolic forms and all 40,000 pair
instances in the stated regression range.  The all-`e` proof is equation
(2), encoded in the prepared Lean theorem.  Native Lean/Lake is absent
locally.  Therefore no Lean PASS is claimed.  The previous orchestrator run
`45636523119` for the Boolean obstruction completed **cancelled**, not PASS.

## Failed attempt and limitation

The attempted use of `SafeRA` to forbid the split quadratic twist fails:
its second disjunct is already true before `r` is examined.  This run does
not prove the remaining four-field core, `CountQAlt`, the weighted-prime
lower bound, or RH.

## RESUME HERE

Expand the exact pinned `Level` structure and its quadratic-twist lemmas at
`m=(e,-e)`.  Prove or refute the caller-specific implication

```text
Level l M [e,-e] r and ramification(delta_i) supported on M
  -> Level l M [e,-e] (tw r delta_i).
```

Preserve above-`l` flags and continuity, not only `LevelAway`.  If this
bridge holds, inspect `IsAutQA` next; if it fails, use the failing level
field to replace `bit_of_fibre` by direct uniqueness.  Do not revisit
`SafeRA` in this specialised context.

**HANDOFF TO:** kernel/audit for native compilation of the prepared bridge;
Galois/math for the exact `Level` twist test; integration/editor for the
four-field reduced frontier.  RH remains open.

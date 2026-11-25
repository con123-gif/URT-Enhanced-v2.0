# CountQ exact aggregation: remove the field-count factor and sum-of-exponents loss

**Lane:** MATH / mandatory unified reduction, run 31  
**Status:** SOURCE-MATCHED HUMAN REDUCTION; exact arithmetic regression executed; Lean bridge prepared but **not compiled**  
**Upstream source:** `leanprover-community/riemann-hypothesis` at `40e56bab026552e089d7afcfeff08d2defb9c005`  
**Source file:** `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean`  
**Pinned blob:** `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`  
**Declaration:** `UpperTheory.GalN.V.Win.N.countQ_alt`

## RESULT

The original `countQ_alt` chooses a fixed family of `n^2+2` quadratic CM fields, then injectively selects `n^2+1` fields avoiding the rational prime `p`.  For the selected field `u(i)`, `countP_alt` supplies an eigendatum `D_i` and constants `c_j,A_j`, chosen **before** `p`, with

\[
  |D_i.S|\le c_{u(i)}Y^{A_{u(i)}},\qquad Y=M(H+1)\ge1.
\]

Put

\[
  A_*:=\max_{j\in\operatorname{Fin}(n^2+2)}A_j,
  \qquad C_*:=\sum_{j\in\operatorname{Fin}(n^2+2)}c_j.
\]

Because `u` is injective and every summand is nonnegative, exact aggregation before any coarse uniform bound gives

\[
\boxed{
  \sum_i |D_i.S|
  \le \sum_i c_{u(i)}Y^{A_{u(i)}}
  \le Y^{A_*}\sum_i c_{u(i)}
  \le C_*Y^{A_*}.}
\tag{1}
\]

The native `rootSum` theorem contributes the unchanged factor `2^(n+1)`.  Therefore the source proof's cardinality conclusion can be strengthened from

\[
2^{n+1}(n^2+1)C_*Y^{\sum_j A_j}
\]

to

\[
\boxed{|D'.S|\le 2^{n+1}C_*Y^{A_*}.}
\tag{2}
\]

This simultaneously removes the factor `n^2+1` and replaces the sum of all candidate-field exponents by their maximum.  It is strictly stronger whenever `C_*>0`, `n\ge2`, and either more than one exponent is positive or the removed field-count factor matters.

## Why this is a distinct caller-level reduction

Peer commit `866504e` found the same aggregation principle inside a **specialized rank-two three-field proposal**, conditional on a new odd-self-twist bridge.  Equation (2) instead applies to the original pinned `quadFam`/`exists_avoid` construction verbatim, for every `n>=2`, and requires no replacement of the field selector or self-twist argument.  It is therefore independently usable even if that specialization fails native replay.

At the actual downstream rank-two call (`n=2`), the original source has six fixed candidate fields and five selected fields.  Equation (2) removes the explicit factor five while keeping all six candidate constants fixed before `p`, `l`, `Omega`, `iota`, and the Galois representation.

## Exact proof and retained premises

1. `M>=1` and `H+1>=1`, hence `Y>=1`.
2. For each selected `i`, `A_{u(i)}<=A_*`, so monotonicity of powers at base `Y>=1` gives `Y^(A_{u(i)})<=Y^A_*`.
3. Multiply by `c_{u(i)}>=0` and sum.
4. The source proves `u` injective (`hu`).  Thus its image is a subset of the full candidate family and
   `sum_i c(u i) <= sum_j c j`; no cardinality-times-maximum bound is needed.
5. Multiply (1) by the exact nonnegative `rootSum` factor `2^(n+1)`.

No quantifier or structural hypothesis is removed.  Retained unchanged: `n>=2`; strict anti-weight and weight symmetry; height and level bounds; primality and the place above `p`; `p` prime to `M`; pairwise-coprime quadratic discriminants; the selected unramified fields; all `countP_alt` hypotheses; residual primes `l!=2,p`; algebraic closures and embeddings; `AdmResNAlt`; `rootSum`; the `Bool` fibre bit; Frobenius, purity, integrality, and representation-isomorphism classification.  The constants remain uniform because `C_*` and `A_*` are computed from the full fixed family before the prime-dependent injection `u` is chosen.

## Root reachability and downstream link

Static pinned source path:

`Main.riemannHypothesis -> ... -> CountI -> NumberU3U_s -> KeepNumU -> frobenius_trace_count_bound_of_rat_eigensystem_count_alt -> countQ_alt -> countP_alt/rootSum`.

This reduction changes only the quantitative witness exported by `countQ_alt`; it does **not** prove `CountPAlt`, the automorphic cardinality inputs, CountI, the character-box/TopG suppliers, the window inequality, or RH.  Peer commit `e70e93e` separately reduces the individual `cardP/cardK` automorphic budget to two premises and a maximum exponent; equation (2) composes with it but does not discharge those premises.

## Unified-engine record

- **Premise weakening / exact cancellation:** aggregate the actual coefficients before replacing them by a common upper coefficient; this deletes the artificial factor `n^2+1`.
- **Symmetry / aggregate bound:** the only field-label dependence is through the injective image of `u`; nonnegative full-family aggregation absorbs the selection.
- **Backtracking:** if a native caller replay fails, retain the original `countQ_alt` witness and graph unchanged.
- **Context cache key:** `(source pin, n, full quadFam, c, A, M, H, p, selected injection u, rootSum data)`.  The maximum and full coefficient sum are reusable; the selected eigendata are not cached across primes.
- **Original/reduced graph:** original edges to `quadFam`, `exists_avoid`, every selected `countP_alt`, `rootSum`, `bit_of_fibre`, `twCard/resTwo`, and admissibility/classification remain.  The reduced graph replaces only the two coarse arithmetic edges `single_le_sum` followed by `sum_le_sum` with equation (1).
- **Native tools:** the accompanying Lean file calls `rh_reduce`, `rh_auto_frontier`, `rh_auto`, and `rh_scan` on the generic bridge and actual `countQ_alt`.  No local Lean/Lake executable was available, so those calls are prepared, not reported as run.

## Executed checks and failed attempts

- Re-fetched pinned blob `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`; inspected the complete `countQ_alt` body and its exact `rootSum` cardinality tail.
- Ran `python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_exact_aggregation.py`.  The script exhaustively checks small full families and a rank-two-shaped six-candidate/five-selected grid using exact integer arithmetic; it fails on the first violation.
- `command -v lean` and `command -v lake` returned no executable.  `2026-11-25_COUNTQ_EXACT_AGGREGATION.lean` is therefore **PREPARED / NOT COMPILED**.
- The previous lane commit's orchestrator run `45607623088` completed **cancelled**, not PASS.  It supplies no native evidence for this result.

## Limitations

Equation (2) is an exact source-matched arithmetic improvement, not a proof that any unknown `c_j,A_j` exists.  It gives no numerical value for the maximum exponent and closes no analytic or geometric frontier leaf.  A full native replacement of `countQ_alt` has not yet been elaborated, and the axiom ledger for that caller-level bridge is still pending.

## RESUME HERE

Replay the generic bridge and an exact caller-level `countQ_alt` replacement in the pinned Lean environment; derive `sum_i c(u i) <= sum_j c j` from `hu` and `A(u i)<=Finset.univ.sup A`, inspect `#print axioms`, then propagate the sharpened witness into `frobenius_trace_count_bound_of_rat_eigensystem_count_alt` without changing any classification premise.

**HANDOFF TO:** kernel/audit for native replay; Galois/integration for caller propagation; editor for the one-line quantitative replacement only.

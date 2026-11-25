# `countQ_alt`: `IsAutQA` is not a quadratic-twist separator

**Lane:** MATH / mandatory unified reduction, run 35

**Status:** SOURCE-MATCHED THEOREM + prepared Lean certificate; native Lean CI pending

**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## Result

The supported branch left by the previous run was `q_i | lM`.  Testing the next `AdmRNAlt` field gives a complete negative result: `aut : IsAutQA` cannot distinguish a representation from its quadratic sign twist.

For any continuous rank-`n` representation `r` and continuous finite-order character `delta` with open kernel, the pinned source proves

\[
\boxed{
  \operatorname{IsAutQA}_{\iota}(r)
  \;\Longrightarrow\;
  \operatorname{IsAutQA}_{\iota}(r\otimes\delta).
}
\tag{A}
\]

This is the decisive equation for this run.  The quadratic sign character constructed inside `countQ_alt` is continuous and takes only the values `1` and `-1`; hence `delta^2=1`, its kernel is open, and (A) applies.  No level modulus, conductor divisibility, Frobenius class, norm estimate, or RH premise enters (A).

The hard-looking quantifier over all quadratic CM fields is transported field by field:

1. If `(r tensor delta)|_K` is irreducible, then `r|_K` is irreducible because scalar twisting does not change invariant subspaces.
2. `IsAutQA(r)` supplies both an attached regular algebraic cusp form and `WitA` for `r|_K`.
3. Open kernel converts `delta` into an algebraic Hecke character; the pinned restriction theorem gives the same for `delta|_K`.
4. `twist_conjugate_selfDual` twists the attached cusp-form witness, and `WitA.witness_twist_algebraic_character` twists the `WitA` witness.

Thus both conjuncts in the definition of `IsAutQA` survive.  The conclusion is one-way because that is all the caller needs; applying it to `delta^{-1}=delta` also gives equivalence for the quadratic sign character.

## Exact source audit

All paths and blobs are from the pinned upstream revision.

| Role | Source path | Blob |
|---|---|---|
| definition of `IsAutQA` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/IsAutCsdA.lean` | `6922abc68f3988012a84051458a1e3b3594c5f1a` |
| algebraic finite-character construction | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TAlgCyc.lean` | `ce4f6058316dd70f33950fadd08968a0242be576` |
| algebraic-character restriction | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TAlgRes.lean` | `5f842102bb2d38f8e8914655e04b989a26107d61` |
| attached regular cusp witness under twist | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TwistConjugateSelfDual.lean` | `cdb81374bf54b67550bc264e0c415f66ad02496f` |
| `WitA` witness under algebraic twist | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/WinTop.lean` | `35eeade687947f9f3fcaf75ebe3e7bef9beffb90` |
| irreducibility under scalar twist pattern | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/KatoQuadraticCharacters/SphericalDecomposition/IrrOfTw.lean` | `b3e9563a41781ebc5fbdf672993b34c1a95bc4d3` |
| quadratic sign constructor | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/ExistsQuadraticSignCharacter.lean` | `2f88a58801b17ae7fc3a5c392b624d5a16b960de` |
| actual `countQ_alt` caller | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

The source distinction matters: `IsAutQA` is not itself a single automorphy predicate.  It is a universally quantified pair of an automorphic-attached witness and `WitA`.  Dropping either component would be an invalid proof.  The prepared theorem transports both separately.

## Unified reduction record

- **Actual root-reachable node:** `countQ_alt -> AdmRNAlt.aut : IsAutQA` in the quadratic partner branch produced by `resTwo`.
- **Original graph:** `IsAutQA(r)` expands at every quadratic CM `K` to `(regular cusp + AttC) AND WitA`; the candidate partner is `r tensor delta_i`.
- **Reduced graph:** `open ker(delta_i) -> algebraic delta_i -> algebraic delta_i|_K -> {attachment twist, WitA twist}`.  The `aut` node is therefore deleted as a possible separator, not deleted as a premise of `AdmRNAlt` globally.
- **Exact algebra before bounds:** `(delta(s) r(s))v = delta(s)(r(s)v)` proves identical invariant subspaces; no matrix norm or eigenvalue bound is used.
- **Symmetry:** for `delta^2=1`, applying (A) twice yields the reverse direction.
- **Aggregate/backtracking audit:** the fixed family has `n^2+1` fields and `twCard` permits `n^2` self-twists.  If only one family prime is supported on `lM`, all `n^2` unsupported fields may still be self-twists.  Therefore the earlier `omega(M)` counting idea cannot force a spare index uniformly.
- **Premise weakening:** the transport uses `Continuous r`, `IsAutQA r`, and finite-character algebraicity.  It uses no `Level`, `safe`, `dual`, weight, Frobenius, prime-window, or RH hypothesis.
- **Context-sensitive cache:** cache `(IsAutQA, finite sign twist) = invariant`; do not revisit automorphy as a branch separator.  Backtrack only to `LevelAt`, `safe`, or `dual`.
- **Unresolved axiom evidence:** the prepared file prints axioms for the source caller and both new declarations.  It imports no claimed RH theorem as a premise.

This is a genuine reduction of the arithmetic classifier, but it does not prove the mission's weighted-prime lower bound and does not improve the `CountQAlt` constant by itself.  RH remains open.

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_aut_twist_invariance.py
COUNTQ AUT-TWIST INVARIANCE CERTIFICATE
GL(2,F_5) involutive representations checked=32
projective lines per representation=6
twCard/support budget identities checked=63
two-component transport truth rows checked=16
prepared Lean hygiene=True
RESULT: finite sign twist preserves invariant-subspace structure;
        source transport closes both IsAutQA components
```

The finite certificate exhausts every `C2 -> GL(2,F_5)` representation and every projective line, checking that multiplication by the sign scalar preserves the invariant-line set.  It also checks the exact `n^2+1` versus `n^2` support budget and rejects `sorry`/`admit` in the prepared Lean file.

Local Lean/Lake is unavailable, so **no native Lean PASS is claimed**.  The companion `.lean` file is prepared for the pinned environment and contains direct source-level proofs, `rh_reduce`, `rh_auto`, `rh_auto_frontier`, actual-caller `rh_scan`, and axiom queries.  `rh_prune` is not reported as executed because no local elaborated proof term is available.

## Failed attempts and surviving obligations

1. **Counting unsupported fields failed:** one supported field leaves exactly the full `n^2` self-twist budget.
2. **Automorphy separation failed:** equation (A) proves the `aut` field is twist-invariant.
3. **Full `AdmRNAlt` transport is not proved:** `LevelAt` at primes over `l`, `safe`, and `dual` remain unchecked.  The earlier `LevelAway` result covers only primes away from `l` and required `KillsMu` for the same modulus.
4. **No factor-two improvement follows yet:** `bit_of_fibre` remains necessary until one surviving field actually distinguishes the partners or full admissibility transport reveals a different quotient.

## RESUME HERE

Stay in the supported branch `q_i | lM` and do not revisit `IsAutQA`.  Inspect `AdmRNAlt.dual` next: derive the exact twist formula for `DualTw (r tensor delta)`, specialize to `delta^2=1`, and test whether the same cyclotomic-weight character works without changing `wt`.  If duality is invariant, proceed to `safe`; leave `LevelAt` for last because the previous run already isolated the away-from-`l` part.  Preserve the original and reduced dependency graphs and do not claim removal of the Boolean factor until a full caller-level bridge is verified.

**HANDOFF:** kernel/audit should compile the prepared theorem and publish actual CI/axiom output; integration should mark `AdmRNAlt.aut` non-separating but retain the full `AdmRNAlt` node; arithmetic/Galois should continue with `dual`, then `safe`, then `LevelAt`.  RH remains open.

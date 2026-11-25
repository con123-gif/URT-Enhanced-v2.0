# CountQ correction: the quadratic-twist admissibility subtree is unreachable

**Lane:** MATH / mandatory unified reduction  
**Result type:** REVIEW + graph correction  
**Status:** SOURCE-MATCHED; executable source audit PASS; Lean certificate PREPARED / NOT COMPILED  
**Pinned source:** `leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The previous MATH checkpoints treated the quadratic sign `delta_i` as if the
actual `countQ_alt` caller had to prove that `tw r delta_i` was again
`AdmRNAlt`. That interpretation is wrong.

In the actual `case ex` body, the sign character is used only in `resTwo`:

\[
 \neg\operatorname{RepIso}(r,r\otimes\delta_i)
 \quad\Longrightarrow\quad
 \operatorname{IsIrr}\bigl(r|_{G_{K_i}}\bigr).
\tag{1}
\]

The very next admissibility call is literally

\[
\boxed{
 h_A(K_i,\ldots,r,\;h_r,\;
       \operatorname{IsIrr}(r|_{G_{K_i}}))
 : \operatorname{AdmPNAlt}(r|_{G_{K_i}}).
}
\tag{2}
\]

It passes the original representation `r` and its original certificate `hr`;
it does **not** pass `tw r delta_i`. Therefore none of the following is a
premise of this caller:

- `AdmRNAlt (tw r delta_i)`;
- `KillsMu M delta_i`;
- `|disc K_i| | M`;
- the exceptional local case `q_i = l` and `l` not dividing `M`;
- transport of `aut`, `dual`, `safe`, `LevelAway`, `LevelAt`, or
  potential crystallinity across the sign twist.

The exact direct bridge prepared in the accompanying Lean file is just the
definitional application

```lean
exact hA K hK n hn m wt hm M hM l hl2 Omega iota r hr hirr
```

This is the shortest correct reduction. The earlier discriminant-supported
`KillsMu` theorem remains mathematically valid, but it has no edge to this
native `CountQ` consumer and must not be counted as root progress here.

## Independent check of the peer improvement

Audit commit `a35ccf3de092c0cd1ab097f01b64f20b1488cf5f` proves a useful finite
selection theorem: the original field family can choose a non-self-twist
whose discriminant avoids both `p` and `l`. The source audit here agrees with
that theorem but corrects its suggested next use:

- the existing `AdmResNAlt` theorem has no discriminant argument;
- `Lev.levelFRes` restricts level for arbitrary `K/F`;
- `safeRes'` restricts safety for arbitrary `K/F`;
- neither declaration assumes `l` is unramified in `K`.

Thus `l`-avoidance is stronger than the current caller needs. It may support a
future weakened replacement for `hA`, but it does not simplify the body of the
present `admissible_restriction_level_n_of_printed_results` without a new
consumer theorem.

## Original and reduced dependency graphs

**Actual original graph retained**

```text
countQ_alt
  -> quadratic sign family
  -> choose a non-self-twist
  -> resTwo
  -> IsIrr (r restricted to G_K)
  -> AdmResNAlt applied to (r, hr)
  -> AdmPNAlt (r restricted to G_K)
```

**Spurious graph removed from this caller**

```text
tw r delta
  -> AdmRNAlt twist transport
  -> aut / dual / safe / LevelAway / LevelAt
  -> KillsMu M delta
```

This is proof-graph pruning, not a proof of `AdmResNAlt`: the substantive
automorphy, polarization, level restriction, witness, and safety suppliers
inside that theorem all remain.

## Unified-reduction record

- **Root-reachable obligation:** the `hA` call in `countQ_alt.case ex`.
- **Exact cancellation before bounds:** no estimate is used; specialize the
  function type of `AdmResNAlt` and beta-reduce the call.
- **Premise weakening:** delete every sign-twist admissibility premise because
  none occurs in the caller term or the type of `AdmResNAlt`.
- **Symmetry/aggregate result:** `delta_i` remains only in the aggregate
  self-twist cardinality argument and `resTwo`; do not delete it globally.
- **Context cache key:** `(pin,countQ_alt,case ex,hA,r,hr,K_i,hirr)`.
- **Backtracking:** do not revisit `KillsMu`, `LevelAt`, or the exceptional
  `q=l` branch for this caller. Backtrack only to the still-unproved
  `AdmResNAlt` supplier or its actual fields.
- **Original graph preservation:** the complete original caller and the
  generic twist lemmas remain in the repository; only the false edge is
  retired.

## Exact source paths

| Declaration | Pinned source path | Blob |
|---|---|---|
| `countQ_alt` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |
| `AdmResNAlt` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean` | `d626de1e423ebf58d4b7357f69905fd98829ff51` |
| `admissible_restriction_level_n_of_printed_results` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevelAdmissibleRestrictionHolds.lean` | `f22dc88980db7cea30d6ab4e4380d927a36b94e0` |
| `levelFRes` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SemisimpleLevels/LevelFRes.lean` | `7acc9aa1152af5cf8f6446782a203e7a5fa15c80` |
| `safeRes'` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean` | `125ba13df0fb07890a431dcded6fb91c22f1b1e0` |

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_direct_restriction_prune.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_direct_restriction_prune.py
git diff --check
```

The verifier reads the pinned source checkout, slices the actual `case ex`
body, checks that `resTwo` supplies `hirr`, checks the literal `hA ... r hr
hirr` call, checks that `tw r` is absent from that call, and checks that
`AdmResNAlt`, `levelFRes`, and `safeRes'` have no discriminant/unramified
premise. This is an independently executable source/data-flow certificate,
not kernel elaboration.

Local `lean` and `lake` executables are unavailable. The Lean file invokes
`rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier`, plus
axiom queries, but is **PREPARED / NOT COMPILED**. Prior CI runs 45577239749
and 45576756833 validate the engines only, not this file.

## Failed attempt and limitation

The attempted local-inertia analysis of `q=l`, `l` not dividing `M` was aimed
at a nonexistent caller premise. It may be meaningful for a separate generic
twist theorem, but cannot reduce this `CountQ` branch. No weighted-prime lower
bound, `CountQAlt`, `AdmResNAlt`, or RH is proved here.

## RESUME HERE

Kernel-compile `direct_admissible_restriction` and inspect `#print axioms`.
Then expand the **actual** surviving `AdmResNAlt` body exactly once and test
which of its five output fields can be weakened at this caller. Start with
`safeRes'`: at rank two weights `(e,-e)`, reuse the already proved automatic
gap branch instead of reconstructing `safeUP'_alt`; preserve the original
automorphy, polarization, `levelFRes`, and `WitA` obligations until their
consumers are independently reduced.

**HANDOFF TO:** kernel/audit for native replay; integration to delete the false
twist edge; MATH to reduce the actual direct restriction supplier. RH OPEN.


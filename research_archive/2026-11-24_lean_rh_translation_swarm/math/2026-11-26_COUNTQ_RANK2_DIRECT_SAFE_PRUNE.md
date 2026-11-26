# Rank-two direct restriction: prune `safeUP` and `safeRes`

**Lane:** MATH / mandatory unified reduction  
**Result:** source-matched premise weakening with executable audit  
**Status:** source/arithmetic PASS; Lean certificate PREPARED / NOT COMPILED  
**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## RESULT

The corrected native path applies admissible restriction directly to `r`.
Expanding that supplier shows that, at the actual final rank-two caller, its
entire safety branch is unnecessary.

For

\[
m=(e,-e),\qquad e\ge1,
\]

the four ordered differences `m_i-(m_j+1)` are

\[
-1,\quad 2e-1,\quad -2e-1,\quad -1.
\]

None vanishes. Therefore the second disjunct in the pinned definition of
`SafePA` holds for every restricted representation:

\[
\boxed{
 e\ge1\Longrightarrow
 \operatorname{SafePA}\!\left(l,M,(e,-e),r|_{G_K}\right).
}
\tag{1}
\]

Substituting (1) into
`admissible_restriction_level_n_of_printed_results` deletes the only line that
uses `hr.irr` and `hr.safe`:

```lean
safeRes' K (safeUP'_alt hP hr.irr hr.level hr.aut hr.safe)
```

The exact weakened supplier is

\[
\boxed{
\begin{gathered}
\operatorname{IsAutQA}(\iota,r),\quad
\operatorname{Level}(l,M,(e,-e),r),\\
\exists\theta\,[\operatorname{IsCycWt}(l,0,\theta)\land
                  \operatorname{DualTw}(r,\theta)],\quad
\operatorname{IsIrr}(r|_{G_K})\\
\Longrightarrow
\operatorname{AdmPNAlt}(\iota,M,(e,-e),r|_{G_K}),
\end{gathered}}
\tag{2}
\]

under the same field/algebra instances, `hP`, quadratic `K/Q`, and `e>=1`.
The proof retains the original automorphic cusp construction, polarization,
`WitA`, and `levelFRes`; it changes only the final safety witness.

Because those discarded inputs occurred only in the old safety line, (2) also
does not require `StrictAnti m`, `M>=1`, or `l!=2`. These hypotheses remain
available at the caller and may have other consumers; they are removed only
from this supplier interface.

## Root-reachable effect

The actual final trace theorem calls `CountQAlt` at

```text
n = 2,  m = [e,-e],  wt = 0,  e >= 1.
```

Thus the reduction applies to that branch. It does **not** apply to the
rank-four `VWin` weights `(e+1,e,1,0)`, which contain adjacent pairs. Audit
commit `4ec1ff214bfb602a7def10885ab55ad9d6cb0623` correctly records that
negative control.

### Original graph

```text
direct admissible restriction
  -> aut + polarization
  -> WitA
  -> levelFRes
  -> safeUP'_alt(hr.irr, hr.level, hr.aut, hr.safe)
  -> safeRes'
  -> AdmPNAlt
```

### Reduced rank-two graph

```text
direct admissible restriction
  -> aut + polarization
  -> WitA
  -> levelFRes
  -> fixed-weight SafePA gap
  -> AdmPNAlt
```

The `safeUP'_alt` and `safeRes'` subtrees are removed at this caller. Original
generic declarations and the rank-four graph remain preserved.

## Unified-reduction record

- **Invariant:** `SafePA`'s right disjunct depends only on the fixed weights,
  not on the representation or extension field.
- **Exact algebra before bounds:** enumerate the four `Fin 2` pairs; no norm,
  asymptotic estimate, or fitted constant occurs.
- **Premise weakening:** output safety no longer consumes original
  irreducibility or `SafeRA`; `hm`, `hM`, and `hl2` are also absent from the
  specialized theorem.
- **Symmetry:** the two diagonal cases coincide and the two off-diagonal cases
  are negatives around `-1`; all four are retained explicitly.
- **Aggregate scope:** only the rank-two consumer is changed. No generic
  `AdmResNAlt`, rank-four, or other caller is weakened.
- **Context cache:** `(pin,CountQAlt,n=2,m=[e,-e],e>=1,direct AdmResNAlt)`.
- **Backtracking:** do not re-enter `safeUP`, `safeRes`, or quadratic-twist
  safety for this branch. Continue with the surviving `aut`, polarization,
  `WitA`, and `levelFRes` suppliers.

## Sources

| Declaration | Pinned path | Blob |
|---|---|---|
| direct restriction theorem | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevelAdmissibleRestrictionHolds.lean` | `f22dc88980db7cea30d6ab4e4380d927a36b94e0` |
| `AdmPNAlt` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean` | `d626de1e423ebf58d4b7357f69905fd98829ff51` |
| `SafePA`, `safeRes'` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean` | `125ba13df0fb07890a431dcded6fb91c22f1b1e0` |
| rank-two final consumer | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

## Executed tests

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_rank2_direct_safe_prune.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_rank2_direct_safe_prune.py
git diff --check
```

The source audit checks that `hr.irr` and `hr.safe` each occur exactly once in
the original restriction theorem and only in its final `safeUP -> safeRes`
expression. It checks the actual rank-two `CountQAlt` instantiation and all
40,000 ordered weight-pair cases for `1<=e<=10000`. The all-`e` proof is the
four-form equation above and is encoded with `fin_cases`/`omega` in Lean.

Local `lean`, `lake`, and `elan` are unavailable. The prepared Lean file calls
`rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier`, and
requests axiom output. No native or CI PASS is claimed for this file; earlier
runs 45577239749 and 45576756833 validate only the engines/baseline root.

## Failed attempt and limitations

Applying the same shortcut at rank four is false because the actual weights
contain adjacent pairs. Removing `hP`, automorphy, polarization, `WitA`, or
`levelFRes` is also unsupported: each remains visibly used in the copied
proof body. This result proves none of those suppliers, `CountQAlt`, the
weighted-prime lower bound, or RH.

## RESUME HERE

Kernel-compile the prepared theorem and inspect its axiom output. Then reduce
the next actual surviving field, `levelFRes`, at rank two: inspect whether the
consumer needs the full `LevelF` structure or only its continuity, away-level,
and above-`l` flag projections. Preserve automorphy, polarization, and `WitA`
until their separate consumers are checked.

**HANDOFF TO:** kernel/audit for native replay; integration for the reduced
rank-two graph; MATH for the exact `levelFRes` consumer. RH OPEN.


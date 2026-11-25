# `countQ_alt`: the `AdmRNAlt.dual` field is quadratic-twist invariant

**Lane:** MATH / mandatory unified reduction, run 36

**Status:** SOURCE-MATCHED THEOREM + exact finite regression + prepared Lean certificate; native Lean replay pending

**Upstream pin:** `40e56bab026552e089d7afcfeff08d2defb9c005`

## Result

Continue the actual `countQ_alt` branch left by
`2026-11-25_COUNTQ_AUT_TWIST_INVARIANCE.md`.  Let

\[
 r:\Gamma\longrightarrow \mathrm{GL}_n(k),\qquad
 \delta:\Gamma\longrightarrow k^\times,
\]

and suppose `DualTw r theta`, meaning that one invertible matrix \(P\)
satisfies

\[
 r(s)^T P r(s)=\theta(s)P\qquad(s\in\Gamma).
\]

For the scalar twist \((r\otimes\delta)(s)=\delta(s)r(s)\), exact
bilinearity gives the decisive equation

\[
\boxed{
 (r\otimes\delta)(s)^T P(r\otimes\delta)(s)
   =\delta(s)^2\theta(s)P.
}
\tag{D}
\]

The sign character constructed in the pinned `countQ_alt` route has
\(\delta(s)\in\{1,-1\}\) for every \(s\).  Hence \(\delta^2=1\), and the
*same* matrix \(P\) and the *same* character \(\theta\) prove

\[
  \operatorname{DualTw}(r,\theta)
  \Longrightarrow
  \operatorname{DualTw}(r\otimes\delta,\theta).
\]

Consequently the original witness
`exists theta, IsCycWt l wt theta and DualTw r theta` transports without
changing `wt`, its cyclotomic character, its finite character, or its modulus.
Thus `AdmRNAlt.dual` is not a separator between an admissible representation
and its quadratic sign twist.

This is stronger than reconstructing a new `IsCycWt` witness for
`theta * delta^2`: exact cancellation of `delta^2` occurs before any conductor,
level, norm, or cardinality estimate.

## Exact source and consumer ledger

All blobs are from the pinned upstream revision.

| Role | Source path | Blob |
|---|---|---|
| `DualTw`, `IsCycWt` definitions | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/CongruenceNumberRankThree.lean` | `569159efe66ad557ddc574ce2d53053c29c21e9a` |
| scalar twist `tw`, theorem `tw_val` | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` | `f342e0eb41bf3129145addd7b04d3f3ed303050b` |
| actual `AdmRNAlt.dual` field | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean` | `d626de1e423ebf58d4b7357f69905fd98829ff51` |
| pointwise sign range | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/ExistsQuadraticSignCharacter.lean` | `2f88a58801b17ae7fc3a5c392b624d5a16b960de` |
| root-reachable `countQ_alt` caller | `src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean` | `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40` |

The root-visible use is the `AdmRNAlt` subtype in `countQ_alt`'s
`bit_of_fibre` argument.  This theorem only proves transport of the `dual`
field.  It does **not** construct a full `AdmRNAlt` instance for the twist.

## Unified reduction record

- **Original node:** `AdmRNAlt.dual` stores an existential character with an
  `IsCycWt l wt` proof and a `DualTw` bilinear-form witness.
- **Exact cancellation:** expand `tw_val`, move both scalar factors through
  matrix multiplication, combine them as `delta(s)^2`, and use the sign-square
  identity before taking any absolute values or applying level estimates.
- **Reduced node:** reuse the original `theta`, `IsCycWt` witness, and `P`.
  No new premise remains for this field.
- **Symmetry:** applying the same statement twice gives the reverse implication
  because the sign twist is involutive.
- **Context cache:** at the exact `countQ_alt` context, cache
  `(AdmRNAlt.dual, quadratic sign twist) = invariant`; do not search for a
  dual-weight separator again.
- **Backtracking:** together with scalar-twist irreducibility and the preceding
  `IsAutQA` transport, three of the five `AdmRNAlt` fields are nonseparating.
  `SafeRA` and the full `Level` condition at places over `l` remain.
- **Original/reduced graph:** the original graph retains all five structure
  fields.  The reduced classifier graph contracts only the `irr`, `aut`, and
  now `dual` comparison nodes; it does not delete those premises from other
  consumers or from the source theorem.

This is a root-reachable local reduction inside the native `VWinAt` supplier
chain.  It does not prove the weighted-prime lower bound, the same-host joint
loss estimate, or RH.

## Executed evidence

The companion exact finite certificate exhausts all invertible `2 x 2`
matrices over `F_5` for both the representation value `A` and the pairing `P`.
For every nonzero scalar `theta` satisfying `A^T P A = theta P`, it checks all
nonzero scalar twists `d` and the general identity with character
`d^2 theta`; it separately checks that `d = +/-1` preserves `theta`.

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_countq_dual_twist_invariance.py
COUNTQ DUAL-TWIST INVARIANCE CERTIFICATE
field=F_5
GL(2,F_5) matrices=480
DualTw point relations=13440
generic twist identities checked=53760
quadratic-sign invariances checked=26880
prepared Lean hygiene=True
RESULT: twisting sends theta to delta^2*theta; sign-square one
        preserves the original DualTw and IsCycWt witness
```

The prepared Lean file states the generic square-one transport, the exact
`AdmRNAlt.dual`-field bridge, reduction-engine replay attempts, actual caller
scans, and axiom queries.  Local Lean/Lake is unavailable; therefore no native
Lean PASS is claimed.  The Python regression checks finite algebra and prepared
file hygiene, not the upstream kernel proof.

`python -m py_compile` and `git diff --check` also completed with no errors.

## Failed alternatives and surviving obstruction

1. Changing the polarization weight fails as a separator: equation (D) keeps
   the original character exactly when `delta^2=1`.
2. A conductor or level estimate is unnecessary for this field and cannot
   sharpen it; the cancellation occurs pointwise.
3. The Boolean factor in `bit_of_fibre` is **not removed**.  The twist must
   still satisfy the same `SafeRA` condition and the at-`l` part of `Level` to
   show the full admissible subtype is closed under twisting.
4. No premise of the mission's same-host geometry, entropy, or local-gain
   budget is discharged by this local theorem.

## RESUME HERE

Inspect the actual definition and consumers of
`UpperTheory.V.Z.Win.A4.SafeRA` for the same quadratic sign twist.  Expand its
quantifiers and determine whether scalar twisting preserves each safety
condition, or exhibit the first concrete condition that can distinguish the
partners.  Use the source sign character and the identical `AdmRNAlt` host;
do not infer safety from finite order alone.  Leave the at-`l` `Level` field as
the final classifier.  Preserve the full original graph and do not claim the
factor two is removed without a caller-level full-structure bridge.

**HANDOFF TO:** kernel/audit for native compilation and axiom output;
integration for marking only the `dual` comparison node nonseparating; MATH
continues with `SafeRA`.  RH remains OPEN.

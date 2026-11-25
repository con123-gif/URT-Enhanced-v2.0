# NumberU3U: exact max-exponent aggregation at the CountV frontier

25 November 2026. **PARTIAL / source-matched mathematical reduction.**
Upstream source is `leanprover-community/riemann-hypothesis` at
`40e56bab026552e089d7afcfeff08d2defb9c005`. This is one compact lane-2
result, not an RH proof and not a proof of either representation-count input.

## Result

The actual root-reachable chain is

`CountV -> HostNumber_s -> hostNumberUE_alt -> NumberU3U_s ->`
`numberU3U_of_prints -> numberU3U_of_adm2A_imp_adm2B`.

In the last theorem let

\[
 Y=N(e+1)\ge1,
 \qquad |S_1|\le c_1Y^{A_1},
 \qquad |S_2|\le c_2d^{A_2}Y^{A_2},
\]

where `d = |discr K|`. The source pads both summands to exponent
`A1 + A2`, obtaining `NumberU3U_s` exponent `A1 + A2 + 1`. This padding is
unnecessary. Put

\[
 A=\max(A_1,A_2),\qquad C=c_1+c_2d^{A_2}.
\]

Since `Y >= 1`, monotonicity gives

\[
 \boxed{|S_1\sqcup S_2|
 \le c_1Y^{A_1}+c_2d^{A_2}Y^{A_2}
 \le CY^A.} \tag{NU}
\]

The subsequent native estimate is unchanged:

\[
 2e\log(\operatorname{Norm}w)+1\le5Y\log p.
\]

Multiplying this nonnegative inequality by the orbit cardinality and (NU)
therefore proves the same `NumberU3U_s` conclusion with constants

\[
 \boxed{c=5C,\qquad A_{\mathrm{NumberU}}=1+\max(A_1,A_2),} \tag{NU*}
\]

instead of `c=5C`, `A_NumberU=1+A1+A2`. Every field, place, Frobenius,
admissibility, pairwise-isomorphism, Galois-orbit and nonzero-integer premise
is identical. The original theorem follows immediately because
`max(A1,A2) <= A1+A2` and `Y >= 1`; thus this is a strengthening with an
explicit original-statement bridge, not a change of quantifiers.

This sharpens the polynomial degree entering `hostNumberUE_alt` and hence the
deep `CountV` budget. It does **not** close the frontier: the two substantive
inputs remain the uniform CM and rational eigensystem classifiers
`CountKAlt` and `CountQAlt`, together with `NewAdmAlt` and the
`Adm2A -> Adm2B` transfer. The source builds those from `Af.Hypotheses'`;
their quantitative contents have not been proved here.

## Source-body reconstruction

1. `LinkedUnlE.lean` passes
   `hostNumberUE_alt hH hE (numberU3U_of_prints hH.toClassicalTheorems)` to
   `countV_of_finiteness_duality_euler_host`.
2. `EHostNumberU.lean` turns `NumberU3U_s` constants `a,b` into
   `HostNumber_s`, choosing an inert auxiliary prime and applying the
   logarithmic norm-product inequality to two embedding fibres.
3. `KeepNumU.lean` obtains trace classifiers `D1,D2`. Its displayed
   `hcard` is exactly the sum in (NU); no later consumer needs the separate
   padded exponents.
4. `FrobeniusTraceCountBoundOfCmEigensystemCount.lean` identifies the inputs:
   `D1` comes from `CountKAlt`; `D2` comes from `CountQAlt` plus `NewAdmAlt`.
   These classifiers also carry the injective classification maps needed by
   the norm-product theorem, so cardinality alone is not a replacement.

Original local graph:

`CountKAlt(A1), CountQAlt(A2), NewAdmAlt -> A1+A2+1 -> NumberU3U_s`.

Reduced local graph:

`same inputs -> max(A1,A2)+1 -> stronger NumberU3U_s -> original caller`.

The graph is context-keyed by the pinned revision, fixed CM field `K`, its
discriminant, and both classifier constants. It is not valid to cache a
single exponent across different fields or upstream revisions.

## Exact provenance

- `.../DenseThresholdCases/LinkedUnlE.lean`, blob
  `01ff1f8cd56f56488e044a35443a8eda3d5d0e3e`: actual CountV caller.
- `.../DenseThresholdCases/EHostNumberU.lean`, blob
  `f57281a04437bd5c364ff52e68efa331d27283da`: `hostNumberUE_alt`, `key`, and
  its final polynomial conversion.
- `.../DenseThresholdCases/KeepNumU.lean`, blob
  `a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7`:
  `numberU3U_of_adm2A_imp_adm2B` and `numberU3U_of_prints`.
- `.../DenseThresholdCases/NumberU3US.lean`, blob
  `b31b9a1b9f3e84a792e915f864c681034c9eb258`: exact `NumberU3U_s` type.
- `.../DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean`,
  blob `1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40`: `CountKAlt`, `CountQAlt`
  and the two trace-classifier bridges.
- `.../DenseThresholdCases/HostNumberS.lean`, blob
  `05374a9d545e1b9e978adb1719c2572cf43b1453`: target `HostNumber_s`.

All paths are below
`src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/`
unless the displayed suffix already includes `DenseThresholdCases`.

## Checks and limitations

- Executed `python3 math/verify_numberu3u_max_exponent.py`: exhaustive exact
  integer endpoint regression, including zero constants and unequal
  exponents. This checks the arithmetic bridge, not the automorphic inputs.
- Executed Python bytecode compilation and `git diff --check`.
- Read the six exact pinned source bodies above through the GitHub connector.
- Native `lean` and `lake` are unavailable locally. No Lean compilation,
  axiom audit, `rh_prune`, `rh_scan`, `rh_reduce`, `rh_auto`, or
  `rh_auto_frontier` PASS is claimed. The replacement is ready to encode by
  changing the aggregate exponent and its two monotonicity inequalities in
  `KeepNumU.lean` while retaining the original theorem as fallback.
- Failed route avoided: collapsing the two classifiers to cardinality bounds
  alone would lose their classification/injectivity data and would not imply
  the norm-product theorem.

**RESUME HERE:** replay `numberU3U_of_adm2A_imp_adm2B` natively with
`A=max A1 A2`, prove the original `NumberU3U_s` bridge, and run the required
axiom/dependency scans. Then expand the first unresolved producers
`card_k_of_printed_results` and the rational `CountQAlt` path; do not reopen
the completed `CountV` or `HostNumber_s` assembly.

**HANDOFF TO:** kernel/audit for native replay; integration/editor for the
one-line replacement (NU*); Galois/math for the two surviving uniform
classifier inputs. RH remains OPEN.

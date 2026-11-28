# Math lane — canonical selected-record count equation

28 November 2026. **SOURCE-MATCHED CONDITIONAL REDUCTION; RH remains
open.** Compact source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

## Correction and preferred premise

The independent audit
`audit/2026-11-28_EXACT_FIBER_SELECTION_AUDIT.md` corrects the earlier
interpretation of the a.e. fiber premise.  On one actual fixed native fiber,
continuity and

\[
S(u)=C_0(A-Q(u))
\]

make the a.e. guarded condition equivalent to the whole-fiber arithmetic
bound whenever the strict-mean hypothesis supplies `min Q < e`.  Null
exceptions do not weaken that actual arithmetic problem.

The editor's `SelectedBudgetOn` is the genuine smaller sufficient interface.
For each sufficiently large required scale `x`, after `P,eps,K,C` are fixed,
it asks for one native record `D` with:

1. `D.x=x`, `log D.logB=eps*D.logX`, and
   `towerDeg D.s / D.logB ≤ #D.thick`;
2. `D.logX₁` in the native window
   `[10^6 D.logX,(10^6 D.logX)^2]`;
3. the weak signed polar inequality
   \[
   Q_D\le e^{-10^6D.\log X};
   \]
4. the arithmetic budget on this same record
   \[
   D.m\,D.\mathrm{run90Remainder}
   \le C\,D.f\,D.a\,(D.\log B)^K.
   \]

There is no auxiliary base record, no a.e. or measurable predicate, and no
strict inequality.  Exact cancellation in `finite_power_scalar` gives the
endpoint directly.  The missing mathematics is now precisely the existence
of enough such selected records, not their selection from a mean.

## Canonicalization: remove the auxiliary prime subset

Let `S_ε` be the set of **all** primes `d` for which a native `P` with
`P.d=d`, `P.N₀=18480` and fixed `eps,K,C` satisfies the sign/slack guards and
`SelectedBudgetOn` on the quartic scales.  The editor's existential
`SelectedCountBudget` is equivalent to the single canonical requirement

\[
\boxed{
  \forall\,0<\varepsilon<10^{-2},\qquad
  \#\{d\le X:d\text{ prime},\ d\in S_\varepsilon\}
  \not=O\!\left(X^{1-2\varepsilon/9}\right).
}                                                               \tag{CSRE}
\]

Proof: if the editor supplies an auxiliary set `T`, every prime of `T`
belongs to `S_ε`; prime-filtered count monotonicity transfers `CountEscape`
from `T` to `S_ε`.  Conversely choose `T=S_ε`.  No uniform `P`, constants,
or scale threshold across primes is introduced.

The earlier joint-witness condition implies this selected-record condition
by a direct record update at the common `u`: retain the native scale proof,
weaken the strict polar inequality to `≤`, and use the arithmetic bound at
that same `u`.  The converse is not asserted.  Hence (CSRE) is at least as
weak as the earlier joint-witness count equation and is the preferred
one-equation endpoint.  The preferred Lean certificate deliberately omits
that historical comparison so its root theorem does not import the
superseded strict-mean/a.e. chain.

## Downstream link and exact scope

`CanonicalSelectedCount`
→ editor `SelectedCountBudget`
→ `count_escape_grid_from_selected`
→ RUN82 finite-character density/signed Landau
→ reflection.

Source declarations:

- `specialists/proof_editor/2026-11-28_DIRECT_WEAK_SELECTED_RECORD.lean`:
  `SelectedBudgetOn`, `SelectedCountBudget`,
  `zeta_line_from_selected_count`.
- `audit/2026-11-28_EXACT_FIBER_SELECTION_AUDIT.md`: continuity correction
  and exact scalar classification.
- `math/2026-11-28_JOINT_WITNESS_COUNT_EQUATION.lean`: historical strict
  joint bridge.
- `dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean`:
  `CountEscape` and the analytic root.

The candidate certificate is
`math/2026-11-28_CANONICAL_SELECTED_RECORD_EQUATION.lean`.  It preserves all
original a.e., universal and joint graphs and every unresolved A/B/C
supplier.  It does not prove (CSRE), any selected arithmetic record, or RH.

## Executed verification

`python3 math/verify_canonical_selected_record.py` exhaustively checks finite
subset/count monotonicity on universes through eight elements, exact strict
to weak polar comparisons on rational samples, the exponent identity, and
the candidate's required anchors/forbidden-token guard.  These are logic and
algebra controls, not a Lean compile or a prime estimate.  Local Lean/lake
are unavailable; no native PASS, graph deletion, `rh_scan`, `rh_prune`,
`rh_reduce`, `rh_auto`, or `rh_auto_frontier` result is claimed.

## RESUME HERE

After the registered RUN99 finite-power/count dependencies and
`EditorSelectedRecord` receive actual receipts, compile
`2026-11-28_CANONICAL_SELECTED_RECORD_EQUATION.lean` as
`MathCanonicalSelectedRecord` in that same authenticated workspace.  Require
normal kernel checking, standard three-axiom reports and the direct supplier
guards; then compare the existential-set and canonical-set constructor graphs.
**Single next action:** native-compile this canonicalization against the
accepted editor selected-record object.  RH OPEN.


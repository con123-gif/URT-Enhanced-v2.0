# Math lane — joint-witness count equation

28 November 2026. **SOURCE-MATCHED CONDITIONAL REDUCTION; RH remains
open.** Compact source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

> **Correction, 28 November 2026.** The independent audit at
> `audit/2026-11-28_EXACT_FIBER_SELECTION_AUDIT.md` proves that, on the
> actual fixed native fiber, continuity and the exact identity
> `S(u)=C₀(A-Q(u))` make the a.e. guarded condition equivalent to the
> whole-fiber bound (under the strict-mean hypothesis).  Thus the a.e.
> formulation is not itself an arithmetic weakening of the whole-fiber
> condition.  The joint-witness implication and root bridge below remain
> valid, but the preferred strictly weaker interface is now the editor's
> direct weak selected record, which also removes the base record and replaces
> `<` by `≤`.  Its canonical equation is recorded in
> `2026-11-28_CANONICAL_SELECTED_RECORD_EQUATION.md`.  Preserve this file as
> the exact historical bridge; do not select it as the preferred live premise.

## Result

The current a.e.-fiber route asks, on one fixed admissible data fiber, that
the finite-power arithmetic bound hold at almost every strict polar-good
secondary scale.  Its endpoint proof uses that premise only once: to select
one secondary scale `u` at which the polar inequality and the arithmetic
bound hold simultaneously.  Therefore the root-reachable sufficient premise
can be weakened to the following exact joint witness.

Fix `P`, `eps`, `K`, and `C` before `x` grows.  For every sufficiently large
quartic scale `x`, require one native `D : Data P` satisfying the five
`exists_data` conclusions and one

\[
u\in[10^6\log x,(10^6\log x)^2]
\]

such that, for the same `D` and `u`,

\[
 R_{N_0}(e^u)-\frac{\operatorname{towerDeg}(D.s)}{\#D.\mathrm{thick}}
 R_1(e^u)<e^{-10^6\log x},                                      \tag{P}
\]

and for every proof `hs` of the unchanged native scale constraints, with
`E={D with logX₁ := u, scale := hs}`,

\[
 E.m\,E.\mathrm{run90Remainder}
 \le C\,E.f\,E.a\,(\log E.b)^K.                                 \tag{A}
\]

The order is

\[
(P,\varepsilon_0,K,C)\quad\text{before}\quad x\quad\text{before}\quad
D\quad\text{before}\quad u.
\]

Neither `D` nor `u` is uniform across primes or outer scales.  The same `u`
must satisfy (P) and (A); separate witnesses are insufficient.

### Exact cancellation at the endpoint

Put `S=E.m*E.run90Remainder`, `Q` equal to the left side of (P),
`H=#E.thick`, `T=towerDeg(E.s)`, `B=E.logB`, and
`F=T*phi(N₀)`.  The already prepared scalar lemma cancels `E.a`, `H`, and
`E.m` before taking any norm:

\[
\frac{S}{E.m\,E.a\,H}+Q
 \le C\,\varphi(N_0)B^{K+1}/E.m+e^{-10^6\log x}
 \le x^{8\eta-1/2}.
\]

This is exactly the occurrence in the signed remainder identity, so the
joint witness gives `EndpointGrid P.d P.N₀ eta`.  No positivity of the
remainder, absolute-value estimate, or new prime estimate is introduced.

## One decisive count equation

Let `J_ε` be the set of primes `d` for which there exist one native `P` with
`P.d=d`, `P.N₀=18480`, and fixed `eps,K,C` satisfying the sign and slack
guards, together with the joint-witness property above on all sufficiently
large quartic scales.  Then the complete remaining conditional arithmetic
criterion is

\[
\boxed{
  \forall\,0<\varepsilon<10^{-2},\qquad
  \#\{d\le X:d\text{ prime},\ d\in J_\varepsilon\}
  \not=O\!\left(X^{1-2\varepsilon/9}\right).
}                                                               \tag{JWCE}
\]

In the Lean interface this is
`CountEscape (jointGoodSet ε) (4*ε/9)`.  It feeds the existing RUN82 finite
character union, signed Landau argument, and reflection theorem unchanged.
Thus (JWCE) implies the conditional RH root; (JWCE) itself is not proved.

## Logical weakening and its corrected native interpretation

`FiberBudgetOn` implies `JointBudgetOn`: the editor's strict weighted mean
lemma intersects its polar-good event with the a.e. arithmetic event and
returns the required common `u`.  Consequently the earlier canonical
fiber-count premise implies (JWCE) by prime-filtered count monotonicity.

The converse is not valid by logic alone.  On a finite positive-measure
model with four points, take the polar predicate true at every point and the
arithmetic predicate true at exactly one point.  A joint witness exists, but
`polar -> arithmetic` fails almost everywhere.  The executable certificate
checks this countermodel and all finite truth-table implications.  This
control does not assert that such a model arises from the native arithmetic;
it only prevents silently replacing the weaker existential premise by the
stronger a.e. one.

For the actual native functions, the audit supplies additional continuity
and signed-identity structure absent from that finite control.  It therefore
recovers equivalence between the a.e. condition and the whole-fiber bound.
The genuine weakening is the direct selected-record condition, not null-set
freedom on a fixed fiber.

## Source and downstream trace

- `specialists/proof_editor/2026-11-28_AE_GUARDED_FIBER_BUDGET.lean`,
  declarations `FiberBudgetAt`, `FiberBudgetOn`,
  `eventually_primeError_on_set`, `endpoint_from_budget`.
- `integration/2026-11-28_GUARDED_FINITE_POWER_ENDPOINT.lean`, declaration
  `finite_power_scalar`; exact pre-norm cancellation retained.
- `integration/2026-11-28_CANONICAL_FIBER_COUNT_ENDPOINT.lean`, declarations
  `FiberGood`, `CanonicalFiberCount`, `count_escape_grid_from_fiber`.
- `dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean`, definitions
  `CountEscape`, `CountEscapeGrid`, and root
  `zeta_line_from_count_escape_grid`.
- Candidate certificate:
  `math/2026-11-28_JOINT_WITNESS_COUNT_EQUATION.lean`.

Reduced graph:

`JWCE -> joint endpoint -> CountEscapeGrid -> RUN82 density/signed Landau -> reflection`.

Original a.e. fiber graph, universal guarded-budget graph, all A/B/C
suppliers, and their axiom/dependency evidence remain preserved.  This run
did not execute Lean, `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, or
`rh_auto_frontier`; no native PASS or dependency deletion is claimed.

## Executed verification

`python3 math/verify_joint_witness_count.py` checks a finite positive-atom
analogue of the implication, finds countermodels to its converse, checks the
candidate's required source anchors/forbidden-token guard, and checks the exponent identity
`1-(4*ε/9)/2 = 1-2*ε/9` over exact rational samples.  This is a logical and
algebraic regression certificate, not a Lean compilation or prime estimate.

## RESUME HERE

After the registered RUN99 dependencies finish, stage
`2026-11-28_JOINT_WITNESS_COUNT_EQUATION.lean` as
`MathJointWitnessCount` in that same authenticated retained workspace.
Compile with normal kernel checking, require the standard three-axiom reports
and direct supplier guards, then export a constructor-inclusive old a.e.-root
versus new joint-root graph.  Repair the first actual diagnostic if any; do
not queue a duplicate cold build.  **Single next action:** native-compile the
candidate module against the accepted `IntegrationCanonicalFiberCount`
objects.  RH OPEN.


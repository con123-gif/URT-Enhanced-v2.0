# Compact RH lane 2: Hodge-frame kernel and column-update audit

Date: 26 November 2026  
Lane: MATH / one-equation mission lane 2  
Result: **REVIEW — AGREE, with one precision correction**  
Status: source-matched human audit; finite algebra certificate executed; native Lean probe prepared, not compiled; RH remains open

## Scope and pins

This is an independent audit of the new Hodge-frame derivation in
`integration/2026-11-26_COMPACT_HODGE_FRAME_WITHOUT_CONTINUITY.md`
(commit `9db13f38a968c3f34c93aa8b6a6b325e1cf1ce49`).  It does not repeat the
already integrated determinant contraction, fixed-coefficient theorem,
crystalline radius, balanced-row estimate, reciprocity bridge, or Ribet
payment.

- Cathedral parent after continuity refresh: `403556a7cf74a3ac65edb8fb2b34b0d48a877580`.
- Lean source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`.
- `grh-compact/src/Lib/PadicHodge/WachKisin/HodgeFrame.lean`, blob
  `158f4df424f222f593b6f2baee57a294ab221f03`, declaration
  `exists_hodge_frame`, lines 327–355.
- `grh-compact/src/Lib/PadicHodge/TateSen/NearOne.lean`, blob
  `90cdd38ccf750df2458c39e947f56ffb1b0cdcf5`, declarations
  `tate_eq_zero_of_chi_twist`, `le_of_echelon`, and
  `le_of_hodgeTate_stable`.
- Downstream: `CrystallinePeriodMatrix.lean:50–54` uses the frame and
  `hasJumps_of_rows`; then `PeriodMatrixBasis -> PeriodMatrixFrame ->
  FrameTheorem -> CrystallineBound -> ribet_columns ->
  denominatorLe_rowBudget`.

The original graph and all transitive premises remain live.  The reduced
audit graph expands only the kernel action and determinant-decreasing
column update inside `exists_hodge_frame`.

## 1. The inverse weight is forced

Write `P` for the reduction of the integral matrix over
`B_dR^+`, `D_g=diag(chi(g)^{k_i})`, and `gP` for the entrywise Galois
transform.  Reducing the source frame equation gives

\[
        N_g\,(gP)\,D_g=P.                                      \tag{1}
\]

For `a in ker P`, apply (1) to `D_g^{-1}g(a)`.  Semilinearity gives the
exact cancellation

\[
 P\bigl(D_g^{-1}g(a)\bigr)
 =N_g(gP)D_gD_g^{-1}g(a)
 =N_g\,g(Pa)=0.                                                \tag{2}
\]

Thus the stable action is

\[
        a_i\longmapsto \chi(g)^{-k_i}g(a_i),                   \tag{3}
\]

exactly as in the Lean abbreviation `IsHodgeTateFrame`.  The minus sign
is not conventional bookkeeping: it is the inverse diagonal needed for
the middle cancellation in (2).  The prepared Lean lemma
`inverseWeightKernelTransport` states precisely this abstract argument.

Applying `le_of_hodgeTate_stable` to `ker P` now yields an integral
algebraic vector `a`, a coordinate `nu`, and the simultaneous facts

\[
 a_\nu=1,\qquad a_i\ne0\Rightarrow k_i=k_\nu,\qquad
 g(a_i)=a_i\ \text{eventually}.                               \tag{4}
\]

The first two clauses come respectively from maximal-coordinate
normalization and Tate vanishing for unequal twists.  The last clause is
still filter-local; it is not silently strengthened to a statement for
all Galois elements.  Finiteness of the index set permits one common
eventual set for the entries.

## 2. The update commutes for exactly the retained reason

Let `E` be the identity with column `nu` replaced by `a`.  Expansion in
that column gives

\[
        \det E=a_\nu=1.                                       \tag{5}
\]

For `i != nu` the two products with `diag(t^{k_i})` agree because the
column is unchanged.  In the changed column, (4) gives term by term

\[
 t^{k_i}a_i=a_i t^{k_\nu};                                    \tag{6}
\]

zero entries are harmless and nonzero entries have equal exponents.
Consequently

\[
        \operatorname{diag}(t^k)E=E\operatorname{diag}(t^k).   \tag{7}
\]

Both `E` and `E^{-1}=adj(E)` have algebraic-integral entries, and the
eventual fixedness in (4) makes `E` an admissible update on the same
filter after a finite intersection.

Since `Pa` reduces to zero, the changed column of `PE` is divisible by
the uniformizer `t`.  Divide only that column, obtaining `P'`, and replace
`k_nu` by `k_nu+1`.  Equations (5)–(7) give the decisive identity

\[
 A(YE)=P'\operatorname{diag}(t^{k+e_\nu}),\qquad
        t\det P'=\det P.                                      \tag{8}
\]

No norm, fitted constant, division of another column, or continuity of
the matrix representation occurs.  Because `det P` is nonzero, (8)
strictly lowers its discrete-valuation order.

## 3. Precision correction to the existing interpretation

The earlier note describes the choice as minimizing
`ord_t(det P)`.  That is mathematically equivalent here because
`B_dR^+` is a discrete valuation ring, but the actual Lean proof does
not introduce a numerical valuation.  It minimizes `det P` under the
well-founded relation `dvdNotUnit` and contradicts minimality using the
irreducibility of `t` and (8).  The manuscript should retain that source
form, with the valuation sentence only as its DVR interpretation.

Apart from this precision correction, the audit agrees with the minus
sign, filter quantifiers, determinant-one normalization, equal-weight
support, and one-column division in the existing derivation.

## 4. Executed certificate and failed weakenings

Executed locally:

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_hodge_frame_column_update.py
```

The exact-integer/finite-field certificate checks:

- all 483 bounded equal-weight normalized column updates in dimensions
  two and three;
- 104 exact integral determinant drops `p det(P')=det(P)`;
- 5,700 exhaustive inverse-weight kernel cases over `F_3` satisfying
  `NPD=P`;
- three negative controls.

The negative controls show the actual proof cannot drop:

1. equal-weight support (the update need not commute with the diagonal);
2. `a_nu=1` (the update need not have determinant one);
3. uniformizer divisibility of `Pa` (the improved column need not be
   integral).

Failed attempt recorded: the first certificate execution stopped on
incorrect hand-counted ledger totals (`423/3544/3104`).  No algebraic
assertion failed.  The exhaustive loops printed the actual totals
`483/104/5700`; those values were frozen as assertions and the complete
certificate was rerun successfully.  The mistaken counts are not used as
evidence.

These finite checks audit only identities (2), (5)–(8); they do not
model `C_p`, the period rings, Tate's theorem, or the root proof.  The
companion Lean file imports the actual source and prepares the abstract
kernel-transport and equal-weight scalar lemmas.  Local `lean`, `lake`,
and `elan` are unavailable, so it is **PREPARED, NOT A LEAN PASS**.

## 5. Remaining obligations and axiom boundary

This review does not independently prove the classical scalar
Tate/Ax–Sen inputs, the native `nearOne` transport, the initial
crystalline basis, or any period-ring comparison.  It also does not
kernel-check the compact source's transitive axioms.  No original node is
retired and no claimed RH theorem is imported.

The local Hodge-frame update is source-matched and audit-agreed.  Its
downstream use is still conditional on the independently listed
crystalline and period-ring suppliers and on caller integration with the
same frame and height `H=2a`.

## RESUME HERE

Audit the two scalar-theorem applications inside
`le_of_hodgeTate_stable` at the compact pin—especially the passage from
the mapped `nearOne` filter to one open subgroup and the algebraicity of
the equal-weight coordinates—and then check the exact
`hasJumps_of_rows` sign at `CrystallinePeriodMatrix.lean:50–54`.  Do not
redo the column update, determinant contraction, coefficient
approximation, reciprocity, or Ribet budget.

**HANDOFF TO:** formal audit/kernel for the prepared Lean probe;
integration/editor for the `dvdNotUnit` precision correction; MATH for
the scalar-invariant and jump-sign caller audit.

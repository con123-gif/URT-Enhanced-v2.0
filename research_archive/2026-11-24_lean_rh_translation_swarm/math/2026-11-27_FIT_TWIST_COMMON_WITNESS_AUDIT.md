# Compact C: exact common-twist and rowwise-scalar witness audit

27 November 2026. **SOURCE-MATCHED HUMAN QUANTIFIER AUDIT plus executable
source certificate; no Lean replay.** This follows the actual chain

\[
\texttt{exists\_mFoldTwist\_selmerLengthLe}
\longrightarrow\texttt{denominatorLe\_rowBudget}
\longrightarrow\texttt{exists\_isFitFamily}.
\]

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`. Credit Levent Alpöge, Luke
Sernau, Anthropic collaborators and Claude.

## Result

For each prime/p-adic isomorphism
\(\kappa=(\ell,\iota)\), `FitTwistsExist.lean` lines 25–37 first chooses
two **fixed families of rows**:

1. `R,F` for every good-lift eigensystem index;
2. `R',F'` for every rank-one pair.

The `HasRow` statement is uniform in the tame character: `RowsExist.lean`
lines 24–36 constructs one row which serves every twist. These row families
may depend on \(\kappa\), and different indices normally have different rows,
but no row is reselected after the twist is chosen.

The single choice

```lean
choose τ H using fun κ : PrimePadicIso ↦
  exists_mFoldTwist_selmerLengthLe ...
    ⌊D.r * rowBudget D κ.1⌋₊.succ
```

has the exact quantifier form

\[
\exists\tau_\kappa\;\forall j\in D.\mathrm{LiftIndex},
\quad A_{\kappa j}\ \land\ S_{\kappa j}\ \land\ R_{\kappa j},             \tag{1}
\]

where, writing \(\vartheta_{\kappa j}=\tau_\kappa^j\),

- \(A_{\kappa j}\) is one `IsAuxTwist` statement for
  \(\vartheta_{\kappa j}\), hence one auxiliary set \(Q_{\kappa j}\);
- \(S_{\kappa j}\) is
  \(\forall i\;\exists\gamma_i,y_i,\mathrm{SelmerLengthLe}\) for the fixed
  row indexed by `i`, with the common twist, common \(Q_{\kappa j}\), and
  common modulus
  \[
  M_\kappa=\lfloor D.r\,\mathrm{rowBudget}(D,\ell)\rfloor+1;             \tag{2}
  \]
- \(R_{\kappa j}\) is the ratio bound for all ramified pairs.

Thus one `MFoldTwist` simultaneously supplies all powers \(1\le j\le D.m\),
and one modulus (2) simultaneously supplies every row at fixed \(\kappa\).

## The two denominator consumers

At `FitTwistsExist.lean` lines 55–65, the good-lift and rank-one conclusions
make two calls to `denominatorLe_rowBudget`. Both calls pass

\[
(H\ \kappa\ j).1=A_{\kappa j}.                         \tag{3}
\]

The good-lift span obtains its rowwise Selmer premise only from

```lean
(H κ j).2.1 (.inl good_index)
```

and the rank-one line obtains its premise only from

```lean
(H κ j).2.1 (.inr rank_one_index).
```

Consequently they use the same \(\vartheta_{\kappa j}\), the same
\(Q_{\kappa j}\), the same modulus \(M_\kappa\), and the row families fixed
before (1). The final height statement uses exactly `(H κ j).2.2`, so it also
belongs to this same m-fold twist.

`Data.IsFitFamily.denominator_le` asks for one prime-indexed budget `γ` whose
two denominator clauses hold. The implementation takes
\(\gamma(\ell)=\mathrm{rowBudget}(D,\ell)\); the already proved finite-prime
sum inequality `s` pays it. Hence the two denominator conclusions also have
the same numeric budget, not merely comparable budgets.

## Important correction: scalars and internal triangles are rowwise

The shared-witness claim must stop at the exact quantifiers above.
`S_{κj}` contains

\[
\forall i\ \exists\gamma_i,y_i,
\]

not one \(\exists\gamma,y\ \forall i\). The good-lift and rank-one rows may
therefore use different scalar elements and scalar values. This is required
by `denominatorLe_rowBudget`, whose span premise asks each generating row to
carry some `SelmerLengthLe` witness. It never assumes a common scalar across
distinct rows.

Likewise the two invocations of `denominatorLe_rowBudget` separately choose
their base level, cyclic element, prime triangle, normalizer and Ribet
coefficient internally. Those objects are local proof witnesses, not fields
of `IsFitFamily`, and the final theorem does not require them to agree. What
is genuinely common is exactly the twist power, its auxiliary set, the
modulus, the prechosen row family and the final budget.

This corrects the last math-lane checkpoint's over-broad phrase that no
scalar witness is reselected. The valid statement is: no **row family,
twist, auxiliary set, modulus or budget** is reselected; scalar witnesses
are intentionally rowwise.

## Dependency and consumer check

`denominatorLe_rowBudget` consumes the common data only through its explicit
`hq : IsAuxTwist` and span hypothesis. Inside the span proof,
`Data.range_goodLift_le` reduces all good lifts to fixed eigensystem/tuple
generators, while the rank-one clause uses the fixed `trivialLift`. Their
`HasRow` witnesses `F` and `F'` connect these generators to the same indexed
row family used in (1). No averaging of `SelmerLengthLe` occurs: each
generator receives its own pointwise witness from `S_{κj}`.

Downstream, `IsFitFamily` retains only the two `DenominatorLe` statements and
the ratio height. Therefore unifying the local triangles or scalars would
add a hypothesis that no consumer needs; it would not shorten the actual RH
frontier.

## Verification and limits

`math/certificates/fit_twist_common_witness_audit.py` authenticates seven
pinned Git blobs and checks the exact choice count and projection structure:
one `choose τ H`, two `denominatorLe_rowBudget` calls, one `.inl` Selmer
projection, one `.inr` projection, and the shared ratio projection. It also
checks that no second twist choice occurs in the packaging block.

No local Lean/lake/elan executable is available. Thus no elaboration,
`rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, `rh_auto_frontier`, axiom audit
or kernel PASS is claimed. The original and reduced global graphs are
unchanged. This audit discharges the quantifier/same-witness bookkeeping; it
does not prove the row-existence, RowBalanced, local crystalline, odd-Sha,
triangle, trace-ideal or first-order Fitting inputs, and it does not prove RH.

**RESUME HERE:** move one level upstream to the genuinely shared primitive:
audit `exists_mFoldTwist_selmerLengthLe` lines 20–59 at the map from each
`IsRow.eventually_isBalanced` witness into the pointwise
`SelmerLengthLe`. Prove the inclusion of local cocycle relations after
coefficient-ring extension, keeping the row index and modulus uniform; do
not attempt to force a common scalar across rows.

**HANDOFF TO:** integration, audit, Galois arithmetic and editor.

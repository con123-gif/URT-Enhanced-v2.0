# Compact C: exact `hs`/`hq`/`hS`/`l` witness audit

27 November 2026. **SOURCE-MATCHED HUMAN DERIVATION plus executable
source/arithmetic certificate; no Lean kernel replay.** This is a new audit of
the actual rewrite witnesses in `ribet_columns`, not another replacement for
the already sufficient final row budget.

Primary source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`. Credit Levent Alpöge, Luke
Sernau, Anthropic collaborators and Claude.

## Result: four similarly named facts are not interchangeable

At `New/Selmer/RibetElement.lean`, blob
`188eeb68d437bfa58bcc30042d4eee66c2111e18`, the terminal proof uses four
different bounds:

| Lean name at the caller | Exact source | Mathematical content | Use |
|---|---|---|---|
| `hs` | `tri.detect`, `Corepresentable.lean` blob `3e4016…`, lines 155–156 | \((j+s_0)Hh\le H^{22}h\), plus detection property | cardinality/selector cost |
| `hq.2` | third conjunct of `IsAuxTwist`, same blob, lines 164–167 | \(\sum_{Q}v_\ell(\psi(\sigma)-1)\le c\) | the two conjugate-inverse Q copies |
| `hS` | the selected pointwise `SelmerLengthLe`, `AptTupleDefs.lean` blob `ba41ff…`, lines 29–38 | normalized row Selmer length \(\le(10fr+1)c\) | first-order row module |
| `l` | `sum_blockLoss_le`, `RibetElement.lean` lines 80–114 | \(L_0+\sum_eL_e\le4rfL\), uniformly in the actual moduli | row/string crystalline losses |

The source itself confirms the roles. Line 134 obtains `⟨s,hs,hr⟩` from
`tri.detect` and retains `hq` from `IsAuxTwist`. Lines 143–147 select one
coefficient ring satisfying both the uniform block-loss theorem and every
pointwise `SelmerLengthLe`; this selection produces `l` and `hS` separately.
Line 211 casts `hs`; line 214 simplifies `hs` and `hq`; lines 215–218 rewrite
with `hS`, `hq.2`, the g-place cardinality, `hs`, and the height bounds; only
at lines 219–223 is `l` added. Thus the final proof does not silently use the
triangle bound as a Selmer bound, or the Selmer bound as a block-loss bound.

## Complete micro-term payment

Write

\[
H=D.h_2,\quad f=D.f,\quad r=\#\text{row},\quad t=V.\mathrm{rankDiff},
\quad c=\mathrm{crudeUnit}_\ell,
\]

and put `m=v_ℓ(M)`, `q=Hh`, `u=Σ_Q v_ℓ(ψ(σ)-1)`, and
`g=#(placesAboveG\placesDividing ℓ)`. The retained hypotheses are

\[
m\le c,\quad h\le m,\quad u\le c,\quad g\le4f,
\quad (j+s_0)q\le H^{22}h.                            \tag{1}
\]

The actual detector is
`s=s₀∪image(withConjInv τ) univ`, so

\[
|s|\le s_0+2j\le2(s_0+j).                            \tag{2}
\]

No division by `h` is made. From (1)–(2), including `h=0`,

\[
2|s|q\le4H^{22}h\le4H^{22}c,
\qquad (j+1)q\le(H^{22}+H)c.                         \tag{3}
\]

The complete first-order right side, after adding `M³`, is bounded term by
term as follows:

\[
\begin{array}{rcl}
3v_\ell(M)&\le&3c,\\
b_0+\sum_e b_e&\le&(10fr+1)c+4rfL+ta,\\
t\sum_vv_\ell(o_v(1))&\le&t(2+8f)c,\\
2t|s|q+(j+1)q&\le&[4tH^{22}+H^{22}+H]c.
\end{array}                                           \tag{4}
\]

Here the Q term in the third line is exactly `2u`; the g term is exactly
`2g m`. The two factors are the Boolean conjugate-inverse copies visible in
`sum_prod_type`, not new independent choices. Adding (4) yields the decisive
audited envelope

\[
\boxed{
v_\ell(M^3d)\le
[4+10fr+t(2+8f+4H^{22})+H^{22}+H]c+ta+4rfL.}          \tag{5}
\]

This is the direct integration envelope. The separate native factoring

\[
4+t(2+10f+6H^{22})+H^{22}+H                         \tag{6}
\]

is an inner coefficient after multiplying by `r`; it need not dominate the
coefficient in (5) pointwise. Both valid rank-weighted comparisons were
proved in the preceding math-lane correction. This audit identifies exactly
which source witness pays each term.

## Same witnesses and quantifier scope

Only one `tri.detect` witness `s₀` occurs. Its detection predicate is passed
to every character block through `hr` at lines 204–208, while its cardinality
component `hs` pays (3). Only one auxiliary-twist witness `(σ,hq)` occurs;
`N : IsNewPlaces` combines its `hq.1` with the g-place tame generators, and
the same `hq.2` pays both Boolean Q copies. Only one sufficiently large
coefficient ring `O'` is selected after intersecting all eventual conditions;
the pointwise `SelmerLengthLe` witness and uniform block-loss inequality live
in that same ring. This is the exact local same-witness statement; it does
not yet audit the earlier global choice of the common twist in
`FitTwistsExist.lean`.

## Verification, failed route, and limits

Certificate:
`math/certificates/ribet_rewrite_witness_audit.py`. With `--source-root` it
checks the four exact pinned Git blob hashes and the caller/definition
snippets above. It also checks the full micro-term payment, including `h=0`,
random admissible cardinalities, both rank-weighted coefficient routes, and
the `H²⁷` payment.

Failed route retained: reading `hS` as `sum_blockLoss_le` is wrong. The
`choose` pattern puts the block theorem in `l`; `hS` comes from the final
components of the pointwise `SelmerLengthLe` witness. That name collision was
the source of the earlier ambiguous prose, now corrected here.

No Lean/lake/elan executable is available locally. Therefore no elaboration,
`rh_prune`, `rh_scan`, `rh_reduce`, `rh_auto`, `rh_auto_frontier`, axiom audit,
or kernel PASS is claimed. The original/reduced global dependency graphs are
unchanged. Row existence, normalized local/crystalline length, odd-Sha,
triangle existence, trace ideal and first-order Fitting remain genuine
upstream premises. Equation (5) is a caller audit, not RH.

**RESUME HERE:** audit the earlier global same-witness chain
`exists_mFoldTwist_selmerLengthLe -> denominatorLe_rowBudget ->
exists_isFitFamily`: identify the exact `H κ` projections consumed by the
good-lift and rank-one callers and prove that neither call reselects a twist,
row, modulus, or scalar witness. Do not repeat the coefficient collection.

**HANDOFF TO:** integration, formal audit, Galois arithmetic and editor.

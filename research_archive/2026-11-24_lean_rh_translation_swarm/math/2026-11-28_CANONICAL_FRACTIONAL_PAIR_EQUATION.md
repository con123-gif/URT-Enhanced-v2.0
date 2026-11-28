# Math lane — canonical fractional pair-packing equation

28 November 2026. **SOURCE-MATCHED CONDITIONAL REDUCTION; RH remains open.**
Compact source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

## Result: canonicalize the arbitrary graph family

RUN84 gives a valid paired alternative to the singleton selected-record
criterion.  Its graph version asks for pair-cost edges `E_X`, maximum degree
`D_X`, and unbounded

\[
  \frac{|E_X|}{D_X X^{1-2\varepsilon/9}}.
\]

The graph is auxiliary.  The invariant quantity is instead the **fractional
matching mass** of the canonical graph whose vertices are admissible primes
and whose edges are *all* pairs satisfying the fixed-pair quartic cost from
RUN101.  Orient each unordered edge by `d<e` only to remove duplication.  For
a cutoff `X`, assign finitely many positive weights `w_{d,e}` subject to

\[
  \sum_{e:\,d\in e} w_e\le 1\qquad\text{for every prime }d.
\]

The shortest direct witness form of the new sufficient equation is

\[
\boxed{
 \begin{gathered}
 \forall\,0<\varepsilon<10^{-2},\ \forall C>0,\ \forall X_0,\
 \exists X\ge X_0,\ \exists (w_e):\\
 e\text{ is a canonical RUN101 pair-cost edge with endpoints}\le X,\\
 \sum_{e\ni d}w_e\le1,\qquad
 \sum_e w_e>CX^{1-2\varepsilon/9}.
 \end{gathered}}
 \tag{CFPE}
\]

Equivalently, the fractional matching number of the canonical pair graph is
not `O(X^(1-2*epsilon/9))`.  The direct formulation avoids formalizing a
real supremum and has exactly the same mathematical content.

## Exact finite selection argument

Fix a hypothetical zero `rho`, choose `epsilon` so that
`beta=1/2+8 epsilon < Re rho`, and put `eta=4 epsilon/9`.  At the fixed height
`|Im rho|`, the native quadratic-twist density estimate and finite-character
union bound give, eventually,

\[
 |B_X|\le C_0X^{1-\eta/2}=C_0X^{1-2\varepsilon/9},
\]

where `B_X` is the set of primes whose twist has a zero in the required
rectangle.  Apply (CFPE) with a constant larger than `C_0`.  If every
positive-weight pair met `B_X`, interchange the two finite sums:

\[
 \sum_e w_e
 \le \sum_{d\in B_X}\sum_{e\ni d}w_e
 \le |B_X|,
\]

contradicting the chosen mass.  Hence one fixed pair has both endpoints
outside `B_X`.  RUN101 transports that pair's joint signed native cost to
the eventual mean prime-error bound; RUN84 transports the mean through the
polar identity and signed Landau argument.  Both twist-order terms vanish
at `rho`, while the untwisted order is positive, so the mean residue cannot
be zero.  The contradiction gives the same right-half-strip conclusion and
the existing reflection consumer.

The finite sum inequality is encoded by
`exists_unhit_of_bad_card_lt_mass`, reusing RUN84's
`weighted_hit_bound`; `pair_exists_outside_bad` specializes it to the
canonical pair relation.  The zero-density-to-root assembly remains a human
source-matched implication pending native replay of RUN84, RUN100 and RUN101.

## Exact comparison with the prior graph criterion

- Any RUN84 graph witness embeds into (CFPE) by assigning every edge weight
  `1/D_X`.  Vertex load is at most one and the mass is exactly `|E_X|/D_X`.
- Conversely, choose a maximal matching `M` in the positive support of any
  fractional packing.  Every support edge touches the `2|M|` endpoints of
  `M`; applying the same weighted hitting inequality to that endpoint set
  gives `sum w_e <= 2|M|`.  The matching itself is a RUN84 graph with maximum
  degree one.  Therefore (CFPE) and the *optimized* RUN84 graph-family
  criterion are equivalent at the stated exponent, up to a factor two.
- Nonuniform weights can still improve the ratio of a fixed unoptimized
  graph.  On the four-vertex path, full-graph uniform `1/Delta` has mass
  `3/2`, while weights `1,0,1` have mass `2`; RUN84 can recover the latter by
  choosing the two end edges as a matching.  This is why no strict arithmetic
  premise weakening is claimed.
- The canonical singleton selected-record equation implies (CFPE) by pairing
  selected primes disjointly with weight one.  The converse is not asserted:
  a pair mean allows exact cancellation and need not bound either endpoint.

This is aggregation and symmetry reduction to a canonical invariant, not a
new arithmetic premise weakening.  It does not establish a new prime
estimate, a pair-cost edge, or RH.  Original and reduced graphs and every
unresolved arithmetic supplier remain preserved.

## Executed verification

`python3 math/verify_canonical_fractional_pair.py` performs exact rational
finite regressions of the weighted hitting inequality, exhaustive uniform
degree embeddings, maximal-matching rounding, the nonuniform path example,
exponent identities, and source/forbidden-token guards.  The first invocation
failed only at a line-wrapped documentation anchor; that brittle anchor was
repaired and the entire suite rerun.  These are combinatorial and algebraic
controls, not prime data or a Lean compile.  Local Lean/lake are unavailable;
no native `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, `rh_auto_frontier`,
axiom, dependency-graph or RH PASS is claimed.

## RESUME HERE

Stage `2026-11-28_CANONICAL_FRACTIONAL_PAIR_EQUATION.lean` as
`MathCanonicalPair` after RUN84 and RUN101 have accepted native receipts.
Compile the two finite selection declarations with the normal kernel,
standard-three-axiom audit and direct-supplier guards.  Then connect (CFPE)
to the actual zero-density finite bad set without rebuilding the already
prepared pair-polar or pair-cost modules.

**Single next action:** native-compile the finite canonical packing bridge in
the authenticated pair-mean workspace.  RH OPEN.  HANDOFF TO dependency,
prime, integration and audit.

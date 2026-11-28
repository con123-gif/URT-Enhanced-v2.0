# Compact RH math: the canonical count-escape equation

Date: 28 November 2026  
Lane: MATH / mission lane 2  
Status: **HUMAN PROOF + PREPARED LEAN ADAPTER; finite combinatorial certificate executed; native Lean replay pending; RH remains open**

## Source and current frontier

- Branch head read: `c87d736324f841644dd83ea7bbc3050b64596f4d`.
- Compact pin: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
- Native density source: `grh-compact/src/Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean`, blob `1d873bd3fef2c4ba301ce38e0469cc1817e6aa11`.
- Direct count selector: `dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean`, blob `edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9`, PREPARED.
- Finite-power junction: `specialists/prime_window/COMPACT_RUN98_COUNT_ESCAPE_BUDGET.lean`, blob `b1572949fc9032a7b5de11f8ee8c451bc2a70bb6`, PREPARED.
- Prior math reduction: commit `3198fbc2efd0f3964208bfcf40cb4f4447f8d5b0`.

RUN82 has already prepared the exact Big-O selection lemma, and RUN98 has already joined it to the guarded finite-log-power endpoint. Recompiling or restating those results would duplicate peer work. The remaining simplification here removes RUN98's arbitrary subset `S` exactly.

## One canonical predicate

For fixed analytic `epsilon` and a prime `d`, let `G_epsilon(d)` mean that there are native data

\[
 P,\ \epsilon_0>0,\ K\in\mathbb N,\ C\ge0
\]

with all RUN98 guards retained:

1. `P.d=d` and `P.N0=18480`;
2. `epsilon0<1/100` and `(K+1)epsilon0<=epsilon/2`;
3. on every quartic scale and every adjusted record in `GuardedBudgetOn`,
   \[
   mR\le C f a(\log b)^K.                                             \tag{1}
   \]

No field, quantifier, threshold, or native record guard is dropped. Define the canonical set

\[
 \mathcal G_\varepsilon=\{d\text{ prime}:G_\varepsilon(d)\}.
\]

## Exact equivalence and decisive equation

RUN98 asks for some set `S_epsilon` whose prime count escapes the exceptional exponent and for which every prime in `S_epsilon` has `G_epsilon`. This is equivalent to asking the full canonical good set to escape:

\[
 \boxed{\quad
  \forall C>0\ \forall X_0\ \exists X\ge X_0:\qquad
  \#\{d\le X:d\in\mathcal G_\varepsilon\}
     > C X^{1-2\varepsilon/9}.
 \quad}                                                               \tag{2}
\]

Proof. If RUN98 supplies `S_epsilon`, then on primes

\[
 S_\varepsilon\subseteq\mathcal G_\varepsilon.
\]

Therefore its counting function is pointwise at most the canonical one. If the canonical count were `O(X^(1-2epsilon/9))`, the same bound would hold for `S_epsilon`, contradicting count escape. Conversely, if (2) holds, choose `S_epsilon=G_epsilon`; each member carries exactly the witness in the definition. This proves both implications without choice uniformity, measurability, logarithmic weights, or an additional analytic estimate.

The Lean adapter uses the actual RUN82 definition

`CountEscape S eta := not (card (goodPrimes S x) =O x^(1-eta/2))`.

Its monotonicity lemma assumes inclusion only on primes. This matters: `S` may contain arbitrary composites, but `goodPrimes` filters them before counting. The prepared canonical set deliberately contains every composite by a vacuous implication; its filtered count is exactly the count of budget-good primes. Proof irrelevance makes the prime witness in `Primes` immaterial.

## Original and reduced root graph

Original current candidate:

`exists S -> CountEscape S -> every d in S has a finite-power native budget -> EndpointGrid -> zero-density selector -> signed Landau -> reflection`.

Reduced candidate:

`canonical equation (2) -> same finite-power endpoint -> same zero-density selector -> same signed Landau -> reflection`.

The reduction removes only an auxiliary set witness. It does not prove (1) or (2), compile RUN82/RUN98, remove any native density/Landau dependency, or discharge A/B/C. All original graphs and axiom frontiers are retained.

## Executed verification and boundary

Executed:

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_canonical_count_escape.py
```

The fail-on-error certificate exhausts all admissible pairs `(S,G)` on the universe `1..12` and every cutoff, checking prime-filtered pointwise count domination and equality of the canonical/composite-padded count with the genuine good-prime count. Its negative control confirms that raw counting without the prime filter would invalidate the proof interface.

The companion Lean file is PREPARED, not compiled. Local `lean`, `lake`, and `elan` remain unavailable. No native `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, or `rh_auto_frontier` run and no CI PASS are claimed. The module imports the prepared RUN98 stage, proves the exact equivalence, supplies direct dependency/axiom guards, and imports neither `Main` nor the claimed RH theorem.

Failed/avoided routes:

- Recompiling RUN82 now would duplicate the active dependency/kernel replay frontier.
- Keeping an existential `S` adds no mathematical flexibility: the union of all budget-good primes is always at least as large.
- Replacing the prime-filtered count by a raw set count is false because composites can dominate it.

## RESULT

**THEOREM (exact premise normalization):** RUN98's existential `CountEscapeBudget` is logically equivalent to the single canonical count equation (2). This is a simplification, not a new proof of the missing arithmetic bound or RH.

## RESUME HERE

After RUN82 and RUN98 obtain actual compiler receipts, stage `2026-11-28_CANONICAL_COUNT_ESCAPE_EQUATION.lean` in the same authenticated workspace and compile it. Require standard axioms and strict constructor-inclusive comparison; then make equation (2), not an existential subset formulation, the sole lane-2 arithmetic frontier. Do not rebuild signed Landau, endpoint transfer, or A/B/C.

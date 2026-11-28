# Compact RH math: weighted dyadic-window form of count escape

Date: 28 November 2026

Lane: MATH / mission lane 2

Status: **rigorous human reduction; prepared scalar Lean certificate; executable finite regression passed locally; native compact replay pending; RH remains open**

## Exact live input and nonduplication

- Branch head read before the derivation: `fcdc42affc33a64cb5d63eb21985eac4b284848f`.
- Compact source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
- Direct count selector: `dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean`; its actual RUN99 replay failed compilation and its RUN86 diagnostic repair is prepared, not replayed.
- Current endpoint: `specialists/prime_window/COMPACT_RUN98_COUNT_ESCAPE_BUDGET.lean`.
- Canonical-set normalization: `math/2026-11-28_CANONICAL_COUNT_ESCAPE_EQUATION.{md,lean}`.
- Latest prime repair read: `f700db289fd7714b0b7a89f17bdf5c6694e71505`; it deletes one redundant exponential conversion and reuses the count-selector diagnostic repair. No RUN102 receipt existed on `cathedral-research-state` when checked.

The archive already proves that RUN98 is equivalent to count escape for the full set of budget-good primes. It also proves that divergent logarithmic mass is stronger than count escape. The search found no derivation identifying count escape itself with the following local weighted multiplicative-window equation. This note makes that exact conversion and does not repeat the zero-density selector or endpoint bridge.

## 1. Canonical set and exponent

Fix `epsilon` with

\[
0<\varepsilon/6,\qquad \varepsilon<1/100.
\]

Let `G_epsilon` be the canonical set of primes carrying every witness retained in RUN98: one native `P` with `P.d=d`, `P.N0=18480`, and one guarded finite-log-power budget on all quartic scales. Put

\[
 \delta=\frac{2\varepsilon}{9},\qquad
 \alpha=1-\delta.
\]

Then `0<alpha<1`, and the remaining RUN82/RUN98 counting premise is exactly

\[
 N_\varepsilon(X):=\#\{d\le X:d\in G_\varepsilon\}
 \ne O(X^\alpha).                                                     \tag{CE}
\]

This is the native `CountEscape (canonicalGoodSet epsilon) (4*epsilon/9)`, since `1-(4 epsilon/9)/2=alpha`.

## 2. One weighted multiplicative-window equation

For every integer `k>=1`, define the dyadic weighted prime mass

\[
 W_\varepsilon(k)=
 \sum_{\substack{2^k<d\le2^{k+1}\\d\in G_\varepsilon}}
       \frac{\log d}{d}.                                             \tag{1}
\]

The exact replacement for (CE) is

\[
 \boxed{
 \forall A>0\ \forall K\ \exists k\ge\max(K,1):\quad
 W_\varepsilon(k)>
 A\,k\log 2\;2^{-2\varepsilon k/9}.}
                                                                         \tag{DW}
\]

Equivalently,

\[
 \limsup_{k\to\infty}
 \frac{2^{2\varepsilon k/9}}{k\log2}\,W_\varepsilon(k)=+\infty.       \tag{2}
\]

Thus the remaining global count condition is neither stronger nor weaker than a weighted prime lower bound on arbitrarily distant fixed-width multiplicative windows: it is the same condition, up to absolute factors between `1/2` and `2`.

## 3. Exact cancellation before asymptotics

Let

\[
 A_\varepsilon(k)=
 \#\{d\in G_\varepsilon:2^k<d\le2^{k+1}\}.
\]

For every term in (1),

\[
 \frac{k\log2}{2^{k+1}}
 <\frac{\log d}{d}
 \le\frac{(k+1)\log2}{2^k}.
\]

Summing the nonnegative terms and cancelling `k log 2` before any norm or limit gives

\[
 \frac12\frac{A_\varepsilon(k)}{2^{\alpha k}}
 \le
 \frac{2^{\delta k}}{k\log2}W_\varepsilon(k)
 \le
 \frac{k+1}{k}\frac{A_\varepsilon(k)}{2^{\alpha k}}
 \le2\frac{A_\varepsilon(k)}{2^{\alpha k}}.                          \tag{3}
\]

Consequently the normalized weighted masses in (2) are unbounded if and only if the normalized dyadic shell counts `A_epsilon(k)/2^(alpha k)` are unbounded. No prime-number theorem, partial summation, summability adapter, or uniformity in another parameter is used here.

It remains to compare dyadic shells with the native cumulative count. If the shell ratios were eventually bounded by `B`, then for `m>K0`,

\[
 N_\varepsilon(2^m)
 \le N_\varepsilon(2^{K_0})
      +B\sum_{k=K_0}^{m-1}2^{\alpha k}
 \le C_0+C_1 2^{\alpha m}.                                          \tag{4}
\]

Because `alpha>0`, the geometric denominator `2^alpha-1` is positive. For arbitrary natural `X`, choose `m` with `2^(m-1)<X<=2^m`; monotonicity changes (4) only by the fixed factor `2^alpha`. Hence `N_epsilon(X)=O(X^alpha)`, contradicting (CE). Conversely, a cumulative `O(X^alpha)` bound immediately gives

\[
 A_\varepsilon(k)\le N_\varepsilon(2^{k+1})
 \le C2^{\alpha(k+1)},
\]

so the shell ratios are bounded. Combining this with (3) proves

\[
 \boxed{\text{(CE)}\iff\text{(DW)}.}                                 \tag{5}
\]

The finite omission of the prime `2` from windows with `k>=1` is absorbed into `C0`; it cannot affect Big-O or unboundedness.

## 4. Simpler sufficient criterion

A sometimes easier but stronger target is: for each admissible `epsilon`, there is a constant `c_epsilon>0` and arbitrarily large `k` such that

\[
 W_\varepsilon(k)\ge c_\varepsilon.                                 \tag{6}
\]

Indeed `k 2^{-delta k}->0` for `delta>0`, so for every fixed `A`, the right side of (DW) is eventually smaller than `c_epsilon`. Therefore (6) implies (DW), hence the canonical RUN98 premise. This justifies the user's original weighted-window target as a sufficient criterion while (DW) records the exact weakest dyadic normalization supplied by the current zero-density exponent.

Neither (6) nor (DW) is proved for the native budget-good primes. In particular, Chebyshev or the PNT for all primes does not show that enough primes carry the RUN98 arithmetic witnesses.

## 5. Root graph and verification boundary

Original current candidate:

`canonical cumulative count escape -> RUN98 finite-power endpoint -> RUN82 zero-density selector -> signed Landau -> reflection`.

Reduced candidate:

`weighted dyadic equation (DW) -> exact shell/count equivalence -> same RUN98/RUN82 consumers`.

The conversion removes no arithmetic premise and no source theorem. It only replaces a cumulative non-Big-O condition by an exactly equivalent local weighted window condition. All endpoint guards, quantifier order, signed residues, density theorem, original/reduced graphs, failed RUN99 logs, and axiom evidence remain intact.

Executed locally:

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_dyadic_weighted_count_escape.py
```

The fail-on-error script checks the pointwise logarithmic sandwich on 5,396 exhaustive finite subsets of small dyadic integer windows, runs 726 synthetic/geometric/decay checks, and checks the native exponent identity at nine exact admissible epsilon values. These finite tests are regression evidence for constants and directions, not a proof about all primes.

The companion Lean file proves the abstract factor-2 unboundedness transport used in (3). It is PREPARED and was not compiled because `lean`, `lake`, and `elan` are absent locally. No native `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, or `rh_auto_frontier` execution and no CI PASS is claimed. The mathematical proof of (4) is given above; an exact native bridge to `CountEscape` awaits the repaired RUN82/RUN98 replay.

## RESULT

**THEOREM (exact weighted-window normal form):** for every admissible `epsilon`, the canonical RUN98 count-escape premise is equivalent to the single weighted dyadic-window equation (DW). A fixed positive lower bound for the same weighted mass on arbitrarily distant dyadic windows is a rigorously justified stronger sufficient criterion. RH remains open because no current supplier proves either condition for the budget-good primes.

## RESUME HERE

After RUN102 compiles the repaired RUN82/RUN98 stack, formalize (3) for the actual `goodPrimes (canonicalGoodSet epsilon)` finsets and the dyadic geometric lemma (4), then compile the equivalence `CanonicalCountEscapeBudget <-> DyadicWeightedEscapeBudget` in that authenticated workspace. Require standard axioms and constructor-inclusive reachability. The next mathematical action is not another endpoint reformulation: prove (DW), or its stronger fixed-positive-mass form (6), from an actual native arithmetic supplier while preserving every RUN98 witness.

# Lane 2 — a one-sided dyadic drawdown criterion

## Result

Pinned upstream revision:
`40e56bab026552e089d7afcfeff08d2defb9c005`.  Put

\[
 \vartheta(u)=\sum_{p\le u}\log p,\qquad E(u)=\vartheta(u)-u,
 \qquad \alpha=\tfrac12+\varepsilon,
\]

and retain the mission's prime shell

\[
 P(x)=\sum_{x/2<p\le x}\left(2-\frac{x}{p}\right)\log p,
 \qquad c=1-\log2.
\]

For every real \(x\ge2\), Tonelli's theorem for the finite nonnegative sum
gives the exact layer-cake identity

\[
 \boxed{
 P(x)=\int_{x/2}^{x}\frac{x}{t^2}
       \bigl(\vartheta(x)-\vartheta(t)\bigr)\,dt . }
 \tag{1}
\]

Indeed, for each prime in the shell,

\[
 2-\frac{x}{p}=\int_{x/2}^{p}\frac{x}{t^2}\,dt,
\]

and interchanging the finite sum and integral yields (1).  Also

\[
 \int_{x/2}^{x}\frac{x}{t^2}(x-t)\,dt=cx,
 \qquad
 \int_{x/2}^{x}\frac{x}{t^2}\,dt=1.                 \tag{2}
\]

Subtracting (1) from (2) gives the decisive exact equation

\[
 \boxed{
 cx-P(x)=\int_{x/2}^{x}\frac{x}{t^2}
              \bigl(E(t)-E(x)\bigr)\,dt . }
 \tag{3}
\]

Consequently the following one-sided condition is sufficient for the mission
bound at the same \(x\) and with no loss of constant:

\[
 \boxed{
 \max_{x/2\le t\le x}\bigl(E(t)-E(x)\bigr)
       \le C_\varepsilon x^{1/2+\varepsilon}. }
 \tag{4}
\]

The kernel in (3) is nonnegative and has total mass one, so (4) immediately
implies

\[
 P(x)\ge cx-C_\varepsilon x^{1/2+\varepsilon}.       \tag{5}
\]

Thus it is enough, for every \(0<\varepsilon<1/2\), to find
\(C_\varepsilon,\delta_\varepsilon>0\) and arbitrarily large \(Y\) such that
(4) holds for every \(x\in[Y,Y^{1+\delta_\varepsilon}]\).  The earlier
outer-shell/Landau bridge then supplies the conditional half-strip root.  No
control outside the dyadic predecessor interval of each such \(x\) is used.

This is a strictly simpler sufficient interface, not a proof of (4).

## Prime-node reduction

For fixed \(x\), the function \(E(t)-E(x)\) has slope \(-1\) between primes
and jumps upward by \(\log p\) at a prime \(p\).  Therefore its maximum on
\([x/2,x]\) occurs at the left endpoint, at a right-continuous prime node, or
at \(x\).  Condition (4) is exactly the finite check

\[
 \max\left\{0,\ E(x/2)-E(x),\
       \max_{x/2<p\le x}\bigl(E(p)-E(x)\bigr)\right\}
 \le C_\varepsilon x^{1/2+\varepsilon}.              \tag{6}
\]

The open arithmetic leaf is therefore a **maximum dyadic drawdown of the
Chebyshev error at prime nodes**, not a two-sided pointwise error estimate and
not a new weighted sum.

## Why this is weaker than the usual absolute Chebyshev estimate

The standard sufficient estimate

\[
 |E(u)|\le A u^{1/2+\varepsilon}
\]

on \([x/2,x]\) implies (4) with constant \(2A\).  The converse is false even
for monotone counting-function models.  For
\(\Theta(u)=u+u^\beta\), where
\(1/2+\varepsilon<\beta<1\), its error \(u^\beta\) is increasing, so every
drawdown in (4) is nonpositive and (4) holds with \(C_\varepsilon=0\), while
\(|\Theta(u)-u|/u^{1/2+\varepsilon}\to\infty\).  Hence (4) ignores arbitrary
common upward drift and controls only the negative oscillation actually seen
by the one-sided shell.

This model is a logical separation, not a model of the primes and not evidence
for RH.

## Root-reachable provenance and reduction record

The source defines the centered von Mangoldt ramp in
`DedekindLFunctions/CharFamily.lean`.  The existing outer-shell reduction uses
`DedekindLFunctions/LandauTheorems/landauWindow.lean` and
`ZeroFreeOfRpowWindow.lean`.  The previous lane result
`2026-11-26_PRIME_SHELL_EQUIVALENCE.md` proves that higher prime powers and the
integer baseline cost only \(O(\sqrt{x}\log x)\), so (5) feeds that same
root-reachable consumer.

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |

- **Exact cancellation before norms:** equation (3) subtracts the main term
  inside the integral before applying the one-sided maximum.
- **Weakest new interface:** only negative dyadic drawdown is bounded; upward
  bias and absolute error are discarded.
- **Symmetry/aggregation:** the normalized kernel is a probability measure,
  so all endpoint intervals aggregate with total coefficient exactly one.
- **Prime-node compression:** the continuum supremum reduces exactly to (6).
- **Context cache:** source pin, principal character, \(r=2\), the same
  \(x\)-window, and exponent \(1/2+\varepsilon\).
- **Backtracking:** no separate Vaughan/hyperbola component is estimated;
  RUN46 proves their artificial poles cancel only jointly.

The original graph and centered-shell fallback remain intact.  The reduced
candidate edge is

```text
dyadic theta drawdown (4)/(6)
  -> weighted prime shell (5)
  -> centered von Mangoldt shell
  -> singleton Landau half-strip adapter.
```

## Executed checks

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_dyadic_theta_drawdown.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_dyadic_theta_drawdown.py
git diff --check
```

The certificate uses actual primes, verifies (1), (3), the prime-node maximum
and the implication `shell deficit <= maximum drawdown` on deterministic real
samples.  It also checks the increasing-bias negative control.  Finite prime
data only checks the implementation; the derivation above is the general
proof.

The companion Lean file records the normalized positive-weight aggregation,
the drawdown-to-shell scalar bridge and the monotone-bias negative control. It
invokes `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and
`rh_auto_frontier`.  Local Lean/Lake/Elan are unavailable, so it is
**PREPARED / NOT COMPILED**.  Historical CI runs 45577239749 and 45576756833
validate the engines and earlier conditional root only; no new CI PASS is
claimed.

## Failed attempts and limitation

1. Bounding only \(E(x)\) from below is insufficient because (3) also sees
   earlier positive peaks of \(E(t)\).
2. Bounding only the dyadic mean of \(E\) without the exact kernel changes the
   consumer and does not imply (3).
3. Taking absolute values before subtracting \(E(x)\) restores the stronger
   two-sided Chebyshev problem and discards the useful common drift.
4. Equation (4) is still an RH-scale arithmetic estimate on arbitrarily
   distant windows.  It has not been proved for the true primes.  RH remains
   open.

## RESUME HERE

Attack the prime-node form (6) directly: determine whether the exact native
character/geometry supplier controls the maximum downward excursion
`max(E(p)-E(x))` on the same host windows, rather than bounding `E(p)` and
`E(x)` separately.  Preserve the common endpoint term and the same witness.
If no such correlated supplier exists, audit whether a known one-sided
short-interval theorem has the required uniform `x`-window quantifiers.

**HANDOFF TO:** prime-window, Landau, integration/editor, kernel and audit.
RH OPEN.

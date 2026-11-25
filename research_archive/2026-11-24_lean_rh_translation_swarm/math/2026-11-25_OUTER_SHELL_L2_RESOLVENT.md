# Lane 2 — outer-shell L2 resolvent

25 November 2026. **THEOREM / narrowed obstruction, not RH.** This is one
source-matched mathematical contribution. It shows that the mission's weighted
prime shell is an invertible filter in weighted `L2`: shell smoothing cannot
supply the missing cancellation.

## Provenance and root status

- Pinned source: `40e56bab026552e089d7afcfeff08d2defb9c005`.
- `LandauZeroFreeCriterion.lean`, blob
  `54fd0de979e0dad6ac7709ad8ecbec8a29e21872` (`WindowHypU`, `PoleData`).
- `LandauTheorems/landauWindow.lean`, blob
  `7915058f10b33a52652290cd887cbccdc00e676a` (`landau_window`).
- Fresh upstream checked separately: `75e2012dcc6f3093e223ef8d327b88395ff7d27c`.

The reduced path is `Main.riemannHypothesis` -> `rh_of_right` -> principal
zeta nonvanishing -> singleton Landau window -> the mission's prime-only
outer-shell target. Only the first specialization/strip adapter has native Lean
evidence. The final prime-only implication is a human, source-matched reduction
from earlier lanes, not a kernel-verified replacement of the original graph.

This does not duplicate `596dc680` (pointwise contraction/nonvanishing),
`e7c5909` (prime-node transfer), `003dfd8` (counterexample to a proposed
mean-square supplier), or `8bfe5c6` (short-gap pair budget). It computes the
sharp weighted `L2` multiplier bound and its finite-window boundary term.

## The calculation

Let

\[
 \vartheta(x)=\sum_{p\le x}\log p,\quad E(x)=\vartheta(x)-x,
\]
\[
 W(x)=\sum_{x/2<p\le x}\left(2-\frac{x}{p}\right)\log p,\quad
 D(x)=(1-\log2)x-W(x).
\]

Stieltjes integration by parts gives, exactly and without a prime estimate,

\[
 D(x)=-E(x)+x\int_{x/2}^{x}\frac{E(t)}{t^2}\,dt. \tag{1}
\]

For `0<alpha<1`, put `L=log 2`,
`f(u)=e^(-alpha u)E(e^u)`, and `h(u)=e^(-alpha u)D(e^u)`. Then

\[
 h=-(I-T_\alpha)f,\qquad
 T_\alpha f(u)=\int_0^L e^{(1-\alpha)s}f(u-s)\,ds. \tag{2}
\]

Its kernel mass is

\[
 q_\alpha=\frac{2^{1-\alpha}-1}{1-\alpha}<1,
\]

because it is the integral of `e^((1-alpha)s)<e^s` on `(0,log 2)`.
Therefore the one decisive multiplier equation is

\[
 \boxed{\widehat h(\xi)=
 \left[-1+\frac{2^{1-\alpha-i\xi}-1}{1-\alpha-i\xi}\right]\widehat f(\xi),
 \qquad |m_\alpha(\xi)|\ge 1-q_\alpha>0.} \tag{3}
\]

The inequality follows from `|1-z| >= 1-|z|` and
`|T_hat_alpha(xi)| <= ||kernel||_1=q_alpha`. Equality holds at `xi=0`, so
the constant is sharp. Plancherel now gives

\[
 (1-q_\alpha)\|f\|_2\le\|h\|_2\le(1+q_\alpha)\|f\|_2,\qquad
 \|(I-T_\alpha)^{-1}\|_{2\to2}\le(1-q_\alpha)^{-1}. \tag{4}
\]

For a finite logarithmic window `I=[U,V]`, the incoming shell
`B=[U-log 2,U]` cannot be deleted. The exact local bounds are

\[
 (1-q_\alpha)\|f\|_{L^2(I)}
 \le\|h\|_{L^2(I)}+q_\alpha\|f\|_{L^2(B)}, \tag{5}
\]
\[
 \|h\|_{L^2(I)}\le(1+q_\alpha)\|f\|_{L^2(I)}
 +q_\alpha\|f\|_{L^2(B)}. \tag{6}
\]

These follow by applying Young's inequality to (2) on `B union I` before
restriction. In `x` coordinates the squared norm is
`integral |E(x)|^2 x^(-2 alpha-1) dx`, and similarly for `D`.

## What this settles

The outer shell has no logarithmic-frequency blind spot and no `L2` smoothing
gain. Replacing the Chebyshev discrepancy by the shell deficit, or conversely,
cannot manufacture an RH-scale mean-square estimate. The signed far-pair
remainder `R_H` isolated in peer `8bfe5c6` remains the actual arithmetic leaf.
This is not an impossibility theorem for mean-square methods and proves no
prime lower bound by itself.

## Certificate and failed attempt

`verify_outer_shell_l2_resolvent.py` checks (1) on exact prime pieces, (3) by
independent quadrature, (4)--(6) on deterministic packets, and a collar-only
negative control. Executed:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_outer_shell_l2_resolvent.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_outer_shell_l2_resolvent.py
```

```text
outer-shell L2 resolvent: OK; primes=17984, identity_checks=8, identity_residual=4.473e-10, multiplier_checks=35, quadrature_residual=2.404e-10, min_multiplier_margin=0.000e+00, norm_checks=9, min_norm_slack=1.790e-01, local_checks=8, min_local_slack=2.072e-01, collar_leak=0.378922
```

The first run used 20,000 midpoint cells and failed the fixed `2e-9`
quadrature tolerance with residual `6.009791286245034e-09`. Increasing to
100,000 cells reduced it to `2.404e-10`; the tolerance was not relaxed.
Numerics audit the formulas only. No Lean replay was run. The floor-quotient
mean-square route was not retried because `003dfd8` already disproved its
coverage claim. URT was not used.

## RESUME HERE

Attack the exact signed far-pair `R_H` after cubic centering with one genuine
dispersion/large-sieve estimate. Preserve its sign and full multiplicative
window quantifiers; record the exact power of `X` lost and the responsible
term. Do not replace it by another equivalent shell norm.

**HANDOFF TO:** prime-window, Landau, audit, integration, mathematics.
**RH remains OPEN.**

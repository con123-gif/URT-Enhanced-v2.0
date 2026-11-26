# Lane 2 — exact prime/shell equivalence at the RH exponent

## Result

Let

\[
 w_x(n)=\left(2-\frac{x}{n}\right)\mathbf 1_{x/2<n\le x},
 \qquad c=1-\log 2,
\]

and, for real \(x\ge2\), define

\[
 P(x)=\sum_p w_x(p)\log p,
 \quad Q(x)=\sum_{k\ge2}\sum_p w_x(p^k)\log p,
 \quad S_0(x)=\sum_n w_x(n).
\]

The centered dyadic von Mangoldt shell from the existing Landau reduction is

\[
 \boxed{B_2(x)=P(x)+Q(x)-S_0(x).} \tag{1}
\]

The new exact quantitative bridge is

\[
 |S_0(x)-cx|\le1,
 \qquad 0\le Q(x)\le \sqrt{x}\log x. \tag{2}
\]

Consequently, for every \(0<\varepsilon<1/2\), a lower bound

\[
 P(x)\ge cx-Cx^{1/2+\varepsilon} \tag{3}
\]

implies

\[
 B_2(x)\ge-Cx^{1/2+\varepsilon}-1. \tag{4}
\]

Conversely, (4) with its constant absorbed into \(C\) implies

\[
 P(x)\ge cx-
 \left(C+1+\frac1{e\varepsilon}\right)x^{1/2+\varepsilon}. \tag{5}
\]

Thus the prime-only lower bound and the centered \(r=2\) von Mangoldt-shell
lower bound are equivalent on the same arbitrarily distant multiplicative
windows, at every exponent \(1/2+\varepsilon\). Constants and window lengths
may depend on \(\varepsilon\), exactly as in the mission target.

This closes the prime-power transfer itself. It does **not** prove either hard
lower bound.

## Proof of (2)

Extend \(w_x(t)\) to the clipped increasing function on \([0,\infty)\): it is
zero up to \(x/2\), equals \(2-x/t\) on \((x/2,x]\), and equals one after
\(x\). Its total variation is one. With \(N=\lfloor x\rfloor\), the monotone
right-sum bound gives

\[
 0\le \sum_{n=1}^{N}w_x(n)-\int_0^Nw_x(t)\,dt\le1.
\]

Also \(0\le\int_N^xw_x(t)dt\le x-N<1\). Since

\[
 \int_0^xw_x(t)dt
 =\int_{x/2}^x\left(2-\frac{x}{t}\right)dt
 =(1-\log2)x,
\]

subtraction yields \(|S_0(x)-cx|\le1\).

For the higher prime powers, group by their base prime. All shell weights lie
in \([0,1]\). For a fixed \(p\le\sqrt{x}\), the whole tower contributes at
most

\[
 \#\{k\ge2:p^k\le x\}\log p
 \le \left\lfloor\frac{\log x}{\log p}\right\rfloor\log p
 \le\log x.
\]

There are at most \(\lfloor\sqrt{x}\rfloor\) possible base primes, proving
\(Q(x)\le\sqrt{x}\log x\). This uses no PNT, Chebyshev estimate, RH, or
fitted constant. Finally

\[
 \log x\le\frac{x^\varepsilon}{e\varepsilon}
\]

follows by maximizing \((\log x)/x^\varepsilon\), which proves (5).

## Relation to the pinned proof

The source defines the native centered von Mangoldt ramp in
`DedekindLFunctions/CharFamily.lean`. The prior outer-shell adaptation uses
`DedekindLFunctions/LandauTheorems/landauWindow.lean` and the nonvanishing
dyadic multiplier to show that a one-sided \(B_2\) bound on arbitrarily distant
windows suffices for the RH half-strip. Equation (1) now proves that the
prime-only mission equation is neither stronger nor weaker at the allowed
\(1/2+\varepsilon\) scale: it is the same obstruction up to explicit
elementary errors.

Pinned upstream revision:
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |

## Unified reduction record

- **Exact cancellation first:** (1) separates primes, higher prime powers and
  the deterministic integer baseline before any norm.
- **Symmetry/aggregation:** all powers of one prime are grouped once; each
  entire tower costs at most \(\log x\).
- **Weakest sufficient consumer:** the existing one-sided \(B_2\) Landau
  window condition is retained unchanged.
- **Backtracking:** the `FlagAt` package from the prior CountQ branch cannot be
  reduced: its character, root-of-unity, flag and weight-formula components
  all have distinct consumers. This run therefore returns to lane 2's direct
  arithmetic frontier.
- **Context cache:** `(pin, principal character, r=2, same x-window,
  theta=1/2+epsilon)`.
- **Open leaf:** prove either (3) or (4) uniformly on arbitrarily distant
  multiplicative windows. No reformulation removes that cancellation.

## Executed checks

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_equivalence.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_equivalence.py
git diff --check
```

The regression uses actual primes and prime powers for 199,993 real \(x\)
samples through 50,000 and checks (1), (2), and nonnegativity. It is only an
implementation check. The proof above is uniform and analytic.

The Lean file prepares the scalar cancellation, reverse transfer and grouped
correction theorem and calls `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and
`rh_auto_frontier`. Local Lean/Lake/Elan are unavailable, so it is
**PREPARED / NOT COMPILED**. Historical CI runs 45577239749 and 45576756833
validate only the engines/baseline root; no new CI PASS is claimed.

## Failed attempt and limitation

Trying to prune the remaining `FlagAt` data failed because every component is
used by `jumps_above_of_printed_results`, `unlGap`, or `flagPol/fixedSs`.
Equation (1) also does not estimate the signed prime discrepancy; it isolates
it exactly. RH remains open.

## RESUME HERE

Insert (1)--(5) into the single living proof spine, replacing any appeal to a
Chebyshev prime-power estimate in this transfer. Then attack (3) directly on
the same multiplicative windows; preserve the sign and do not separately
bound artificial hyperbola terms whose poles cancel only jointly.

**HANDOFF TO:** prime-window and Landau for independent audit; integration and
human editor for the one-equation spine; kernel for native replay. RH OPEN.

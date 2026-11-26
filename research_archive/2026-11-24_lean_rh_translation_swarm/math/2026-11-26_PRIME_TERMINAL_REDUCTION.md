# Lane 2 — reduce the continuum shell window to prime terminals

## Result

This run removes the continuous endpoint variable from the surviving
one-sided Chebyshev-drawdown leaf.  It does not prove that leaf.

Fix

\[
 c=1-\log 2,
 \qquad \alpha=\tfrac12+\varepsilon\in(\tfrac12,1),
\]

and write

\[
 P(x)=\sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q,
 \qquad D(x)=cx-P(x).
\tag{1}
\]

For a prime terminal \(p\), let

\[
 \vartheta_{<}(p)=\sum_{q<p}\log q,
 \qquad E_{<}(p)=\vartheta_{<}(p)-p,
\]

and define the terminal drawdown (a supremum over the half-open interval)

\[
 \mathcal M(p)=
 \sup_{p/2\le t<p}\bigl(\vartheta(t)-t-E_{<}(p)\bigr).
\tag{2}
\]

Let \(Z=Y^{1+\delta}\), and let \(p^+(Z)\) denote the least prime strictly
greater than \(Z\).  The following is sufficient for the mission shell on the
whole real interval \([Y,Z]\):

\[
 \boxed{
 \mathcal M(p)\le C p^\alpha
 \quad\text{for every prime }Y<p\le p^+(Z),
 }
\tag{3}
\]

provided

\[
 Y^{1-\alpha}\ge\frac{2C\alpha}{c}.
\tag{4}
\]

Under (3)--(4), every real \(x\in[Y,Z]\) satisfies

\[
 \boxed{P(x)\ge cx-Cx^\alpha.}
\tag{5}
\]

Thus the mission no longer needs a continuum family of endpoint estimates.
It needs one finite correlated suffix maximum at each prime terminal in an
expanded prime interval.  This is a sufficient reduction, not an assertion
that (3) holds for the true primes on arbitrarily distant windows.

## Exact cancellation at a terminal

Define the left-limit shell

\[
 P_-(p)=\sum_{p/2<q<p}\left(2-\frac{p}{q}\right)\log q,
 \qquad D_-(p)=cp-P_-(p).
\]

The same finite layer-cake interchange used in the preceding lane result now
gives

\[
 \boxed{
 D_-(p)=\int_{p/2}^{p}\frac{p}{t^2}
       \bigl(\vartheta(t)-t-E_{<}(p)\bigr)\,dt.}
\tag{6}
\]

The kernel is nonnegative and has total mass one.  Hence

\[
 D_-(p)\le\mathcal M(p).
\tag{7}
\]

No separate norm is placed on \(\vartheta(t)-t\) or on \(E_{<}(p)\): the
common terminal error is cancelled inside the integral first.

The supremum in (2) is exactly the following finite maximum.  Between primes,
\(\vartheta(t)-t\) has slope \(-1\), so only the left endpoint,
right-continuous prime nodes, and the terminal left limit can attain its
supremum.  The terminal left limit contributes zero.  Therefore

\[
\boxed{
\begin{aligned}
\mathcal M(p)=\max\Bigl\{&0,
  \vartheta(p/2)-p/2-E_{<}(p),\\
 &\max_{p/2<q<p}
   \left(p-q-\sum_{q<r<p}\log r\right)\Bigr\}.
\end{aligned}}
\tag{8}
\]

The inner expression is the exact terminal-excluded gap/log suffix:

\[
 p-q-\sum_{q<r<p}\log r
 =\bigl(\vartheta(q)-q\bigr)-E_{<}(p).
\tag{9}
\]

Equation (8), rather than an individual gap bound, is the remaining arithmetic
leaf.  The previous logarithmic-gap countermodel shows why the summands may
not be bounded independently.

## Why prime terminals control every real endpoint

Away from prime arrivals and the harmless exit points \(x=2q\), direct
differentiation of (1) gives

\[
 D'(x)=c+\sum_{x/2<q<x}\frac{\log q}{q}\ge c.
\tag{10}
\]

At \(x=2q\), the exiting summand has weight zero, so \(D\) is continuous.
At a prime \(p\), the new summand enters with weight one, so

\[
 D(p)=D_-(p)-\log p.
\tag{11}
\]

Thus \(D\) increases between prime arrivals and jumps downward at primes.
For \(Y\le x<y\) before the next prime, concavity of \(u^\alpha\) and (4)
give

\[
\begin{aligned}
 C(y^\alpha-x^\alpha)
 &\le C\alpha x^{\alpha-1}(y-x)\\
 &\le \frac c2(y-x),
\end{aligned}
\]

whereas (10) gives \(D(y)-D(x)\ge c(y-x)\).  Consequently

\[
 x\longmapsto D(x)-Cx^\alpha
\]

is increasing on every interval between consecutive prime arrivals.  Its
largest value there is the left limit at the next prime.  Equations (3), (7)
and (11) therefore imply (5).  Checking through \(p^+(Z)\) covers the final
partial interval ending at \(Z\).

Condition (4) is eventually automatic for fixed \(C\) and \(\alpha<1\), so it
does not change the mission's arbitrarily-large-window quantifiers.

## Unified reduction record

- **Actual consumer:** the principal weighted prime shell that feeds the
  centered von Mangoldt shell and singleton Landau half-strip adapter.
- **Original frontier:** a drawdown bound for every real endpoint \(x\) and
  every predecessor \(t\in[x/2,x]\).
- **Reduced frontier:** the finite prime-terminal maximum (8), for terminals
  in \((Y,p^+(Y^{1+\delta})]\), plus the elementary eventual threshold (4).
- **Exact cancellation:** equation (6) retains the shared terminal error
  before aggregation; equation (9) telescopes the prime weights exactly.
- **Symmetry/aggregation:** the kernel in (6) has total mass one.
- **Context key:** pinned source, principal character, shell ratio two,
  terminal prime \(p\), exponent \(\alpha\), and the same target window.
- **Backtracking:** individual-gap routes remain rejected by
  `2026-11-26_LOG_GAP_NO_GO.md`; no gap estimate is imported here.
- **Original graph retained:** no Landau, character-family, or higher-prime-
  power premise is deleted.  This contribution replaces only the real-endpoint
  arithmetic interface by a proved sufficient discrete one.

The reduced edge is

```text
prime-terminal suffix maximum (8)
  -> left-limit shell by (6)-(7)
  -> all real endpoints by (10)-(11)
  -> centered von Mangoldt shell
  -> singleton Landau half-strip adapter.
```

## Source and status

Pinned upstream source:
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |

The analytic implication (3)--(5) is a human mathematical proof.  The
companion Lean file records the exact suffix cancellation, normalized
aggregation, and generic monotone-terminal transfer, and invokes `rh_scan`,
`rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier`.  Local
Lean/Lake/Elan are unavailable, so it is **PREPARED / NOT COMPILED**.
Historical CI runs 45577239749 and 45576756833 are reduction-engine baselines
only; no new CI pass is claimed.

## Executed finite audit

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_terminal_reduction.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_terminal_reduction.py
git diff --check
```

The script generated every prime through 250,000 and reported:

```text
PASS: 22043 prime-terminal finite maxima
PASS: 20001 real-x transfer samples
minimum terminal-max minus deficit margin = 0.42601513196
maximum layer-cake residual = 5.60832802421e-09
finite audit alpha = 0.75
finite audit C = 0.0826085699438
monotonicity threshold X0 = 0.0265916312832 (< Y=50000)
minimum certified inter-prime slope = 0.302709543421
minimum sampled shell slack = 145.533449056
```

These calculations audit the formulas and implementation only.  They are not
finite-to-infinite evidence for (3), RH, or an asymptotic prime estimate.

## Failed attempt and remaining obstruction

Trying to transfer a bound stated only at the right-continuous values
\(D(p)\) loses the downward jump \(\log p\).  The correct controlling value is
the left limit \(D_-(p)\), or equivalently the terminal-excluded maximum (8).
This correction is essential but costs only an explicit endpoint convention,
not an asymptotic error.

The unresolved premise is now exactly (8) at RH scale on arbitrarily distant
multiplicative windows.  No known estimate has been imported to prove it.

## RESUME HERE

Attack the true-prime finite sequence in (8).  Search for a signed maximal or
mean-square theorem that controls all terminal-excluded suffix sums

`p - q - sum_{q < r < p} log r`

uniformly for every terminal prime in one arbitrarily distant multiplicative
window.  Preserve the shared terminal and do not replace the suffix by
individual gap bounds.  If using an averaged theorem, prove the maximal
upgrade with the exact window quantifiers before passing it to (8).

**HANDOFF TO:** prime-window, Landau, audit, kernel, integration/editor.
RH OPEN.

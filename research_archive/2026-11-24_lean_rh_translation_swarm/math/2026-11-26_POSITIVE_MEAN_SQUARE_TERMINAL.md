# Lane 2 — positive mean-square terminal criterion

## Result

The prime-terminal maximum from the preceding lane result is stronger than
the weighted shell actually consumes.  It can be replaced by a one-sided
mean-square quantity that retains negative cancellation and discounts narrow
positive spikes.

Fix

\[
 c=1-\log2,
 \qquad \alpha=\tfrac12+\varepsilon\in(\tfrac12,1),
 \qquad C>0,
 \qquad E(t)=\vartheta(t)-t.
\]

For a prime terminal \(p\), put

\[
 E_{<}(p)=\sum_{q<p}\log q-p,
 \qquad f_p(t)=E(t)-E_{<}(p),
\]

and define

\[
 \boxed{
 V_+(p)=\int_{p/2}^{p}\frac{p}{t^2}
              \bigl(f_p(t)_+\bigr)^2\,dt,
 \qquad u_+=\max(u,0).}
\tag{1}
\]

Let \(Y\ge2\), \(Z=Y^{1+\delta}\), and let \(p^+(Z)\) be the least prime strictly
greater than \(Z\).  It is sufficient to prove

\[
 \boxed{
 V_+(p)\le C^2p^{2\alpha}
 \quad\text{for every prime }Y<p\le p^+(Z),}
\tag{2}
\]

together with the eventual elementary threshold

\[
 Y^{1-\alpha}\ge\frac{2C\alpha}{c}.
\tag{3}
\]

Then every real \(x\in[Y,Z]\) satisfies the mission inequality

\[
 \boxed{
 \sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q
 \ge cx-Cx^\alpha.}
\tag{4}
\]

This is a proved sufficient reduction.  Estimate (2) has not been proved for
the true primes on arbitrarily distant windows.

## One-line proof at each prime terminal

For

\[
 D_-(p)=cp-
 \sum_{p/2<q<p}\left(2-\frac{p}{q}\right)\log q,
\]

the exact terminal layer-cake identity is

\[
 D_-(p)=\int_{p/2}^{p}\frac{p}{t^2}f_p(t)\,dt.
\tag{5}
\]

The kernel is a probability measure because

\[
 \int_{p/2}^{p}\frac{p}{t^2}\,dt=1.
\]

Discard only the helpful negative part and apply Cauchy--Schwarz:

\[
 \boxed{
 D_-(p)
 \le\int_{p/2}^{p}\frac{p}{t^2}f_p(t)_+\,dt
 \le\sqrt{V_+(p)}.}
\tag{6}
\]

Equation (2) therefore gives \(D_-(p)\le Cp^\alpha\).  The already proved
prime-terminal transfer applies unchanged: between prime arrivals the shell
deficit has derivative at least \(c\), while concavity and (3) give derivative
at most \(c/2\) for \(Cx^\alpha\); at each prime the deficit jumps downward by
\(\log p\).  Hence (4) follows for every real endpoint.

The decisive reduced equation is (2), not a maximum and not an absolute
Chebyshev estimate.

## Why this is genuinely weaker than the maximum criterion

Let

\[
 \mathcal M(p)=\sup_{p/2\le t<p}f_p(t).
\]

Because the kernel has mass one,

\[
 \sqrt{V_+(p)}\le\max(\mathcal M(p),0).
\tag{7}
\]

For a general admissible terminal profile that equals \(H>0\) on kernel mass
\(\eta\) and is nonpositive elsewhere, the maximum cost is \(H\), whereas
the new cost is \(H\sqrt\eta\).  Taking \(\eta\to0\) gives an arbitrarily
large separation.  This is a logical separation of the two sufficient
interfaces; it is not a claim that the actual Chebyshev error realizes such a
profile.

The one-sided square is also weaker than a two-sided variance:

\[
 \int\frac p{t^2}(f_p)_+^2
 \le \int\frac p{t^2}f_p^2.
\]

Thus negative terminal excursions are not charged at all.

## Exact finite form

The integral (1) is an explicitly finite prime calculation.  Partition
\([p/2,p]\) into prime-free intervals \([a_j,b_j]\).  On one such interval
\(\vartheta(t)=\Theta_j\), so set

\[
 A_j=\Theta_j-E_{<}(p),
 \qquad u_j=\min(b_j,A_j).
\]

Only intervals with \(u_j>a_j\) contribute, and exact integration gives

\[
 \boxed{
 V_+(p)=p\sum_{u_j>a_j}
 \left[
 A_j^2\left(\frac1{a_j}-\frac1{u_j}\right)
 -2A_j\log\frac{u_j}{a_j}
 +(u_j-a_j)
 \right].}
\tag{8}
\]

This gives a deterministic executable certificate without numerical
quadrature.  It does not turn finite evaluation into an asymptotic theorem.

## Unified reduction record

- **Actual consumer:** the principal weighted prime shell feeding the centered
  von Mangoldt shell and singleton Landau half-strip adapter.
- **Previous reduced interface:** a uniform terminal supremum
  \(\mathcal M(p)\le Cp^\alpha\).
- **New weaker interface:** only the positive kernel-weighted mean square (2).
- **Exact cancellation:** the shared terminal \(E_{<}(p)\) remains inside
  \(f_p\) before the positive part or square is taken.
- **One-sidedness:** negative values of \(f_p\) lower the signed shell deficit
  and are discarded only after the signed identity (5).
- **Aggregation:** Cauchy--Schwarz uses the exact unit kernel mass; no factor
  depending on the number of primes appears.
- **Context key:** pinned source, principal character, ratio-two shell, the
  same terminal prime, exponent and target window.
- **Backtracking:** individual-gap estimates and unweighted averages remain
  insufficient.  A theorem averaged over terminal primes cannot replace (2)
  without a separate exceptional-set or maximal upgrade.
- **Original graph retained:** the Landau and higher-prime-power bridges are
  unchanged, and (2) is recorded as an open supplier rather than assumed.

The reduced graph is

```text
positive terminal L2 bound (2)
  -> left-limit shell by (5)-(6)
  -> all real endpoints by terminal monotonicity
  -> centered von Mangoldt shell
  -> singleton Landau half-strip adapter.
```

## Source and verification status

Pinned upstream source:
`40e56bab026552e089d7afcfeff08d2defb9c005`.

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |

The implication (2)--(4) is a human mathematical proof.  The companion Lean
file records positive-part domination, weighted two-cell mean-square control,
and the scalar terminal chain, invoking `rh_scan`, `rh_prune`, `rh_reduce`,
`rh_auto`, and `rh_auto_frontier`.  Local Lean/Lake/Elan are unavailable, so
it is **PREPARED / NOT COMPILED**.  CI runs 45577239749 and 45576756833 remain
historical engine baselines only; no new CI pass is claimed.

## Executed finite audit

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_positive_mean_square_terminal.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_positive_mean_square_terminal.py
git diff --check
```

For all 925 terminal primes in the complete finite interval used by the
certificate, the exact interval formula (8), signed layer-cake identity,
Cauchy bound, maximum comparison and real-endpoint transfer were checked:

```text
PASS: 925 complete prime-terminal positive-L2 checks
PASS: 20001 real-x transfer samples
maximum signed layer-cake residual = 1.46339829143e-09
minimum positive-L2 minus deficit margin = 7.63458013318
finite audit C_L2 = 0.0383309661806
finite audit C_max = 0.0699174235307
C_L2/C_max = 0.548231960575
monotonicity threshold X0 = 0.00123266092556 (< Y=50000)
minimum certified inter-prime slope = 0.304930309789
minimum sampled shell slack = 8.30028503077
```

The smaller finite \(C_{L2}\) confirms the intended weakening on this bounded
sample only.  It is not evidence for the required asymptotic bound.

## Failed shortcut and remaining obstruction

A global or average-in-\(p\) second-moment estimate does not by itself give
(2) for every terminal prime in one complete multiplicative window.  Markov's
inequality permits exceptional terminals, and a single exceptional terminal
can control a real interval immediately to its left.  An exceptional-set
avoidance argument must therefore construct a whole terminal-prime block, not
merely one good endpoint.

## RESUME HERE

Search the true-prime literature or native arithmetic suppliers for a
one-sided local second-moment bound matching (1), with control for every prime
terminal in one arbitrarily distant multiplicative window.  If only an
average over terminals is available, prove an explicit bad-block exclusion or
maximal inequality before importing it.  Preserve the terminal subtraction
inside the positive part.

**HANDOFF TO:** prime-window, literature, Landau, audit, kernel,
integration/editor.  RH OPEN.

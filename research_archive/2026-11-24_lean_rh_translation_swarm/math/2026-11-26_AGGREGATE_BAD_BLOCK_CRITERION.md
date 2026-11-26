# Lane 2 — aggregate bad-terminal block criterion

## Result

The positive mean-square estimate need not hold at every prime terminal of a
large source interval.  A uniformly bounded number of failures is enough to
extract a complete smaller multiplicative window on which every terminal is
good.

Fix

\[
 \alpha=\tfrac12+\varepsilon\in(\tfrac12,1),
 \qquad C>0,
 \qquad A>1,
 \qquad M\in\mathbb N,
\]

and retain the positive terminal variance

\[
 V_+(p)=\int_{p/2}^{p}\frac{p}{t^2}
 \left(\vartheta(t)-t-left(\sum_{q<p}\log q-p\right)\right)_+^2dt.
\tag{1}
\]

It is sufficient that there be arbitrarily large \(X\) satisfying the single
aggregate exception bound

\[
 \boxed{
 \#\left\{p:\ X<p\le X^A,
        \ V_+(p)>C^2p^{2\alpha}\right\}\le M.}
\tag{2}
\]

Under (2), put

\[
 \boxed{
 \delta=\frac{A-1}{2A(M+1)}>0.}
\tag{3}
\]

Then there are arbitrarily large \(Y\) for which every real
\(x\in[Y,Y^{1+\delta}]\) obeys

\[
 \boxed{
 \sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q
 \ge(1-\log2)x-Cx^\alpha.}
\tag{4}
\]

Equations (2)--(3) therefore give a rigorously weaker sufficient interface
than requiring the positive mean-square bound at every terminal of the whole
source interval.  Bound (2) itself remains unproved asymptotically.

## Bad-block extraction

For one \(X\) satisfying (2), list its bad terminals as

\[
 X<b_1<\cdots<b_m\le X^A,
 \qquad m\le M,
\]

and append \(b_0=X\), \(b_{m+1}=X^A\).  The logarithmic gaps telescope:

\[
 \sum_{j=0}^{m}\log\frac{b_{j+1}}{b_j}
 =(A-1)\log X.
\]

Hence some consecutive pair \(Y=b_j<R=b_{j+1}\) satisfies

\[
 \log\frac RY
 \ge\frac{A-1}{m+1}\log X
 \ge\frac{A-1}{M+1}\log X.
\tag{5}
\]

Because \(Y\le X^A\), equation (5) yields

\[
 \log R-\log Y
 \ge\frac{A-1}{A(M+1)}\log Y
 =2\delta\log Y,
\]

so

\[
 R\ge Y^{1+2\delta}.
\tag{6}
\]

There is no bad terminal strictly between \(Y\) and \(R\).  For sufficiently
large \(X\), hence sufficiently large \(Y\), we also have \(Y^\delta>3\).
Writing \(Z=Y^{1+\delta}\), equation (6) gives

\[
 3Z<Y^{1+2\delta}\le R.
\tag{7}
\]

Apply Bertrand's theorem to \(n=\lceil Z\rceil\).  It supplies a prime
\(n<q<2n\), and for \(Z\ge2\),

\[
 p^+(Z)\le q<2\lceil Z\rceil<3Z<R.
\tag{8}
\]

Thus every prime terminal in

\[
 Y<p\le p^+(Y^{1+\delta})
\]

is good.  The positive mean-square terminal criterion from the preceding lane
result then gives (4), once the eventual elementary condition

\[
 Y^{1-\alpha}\ge
 \frac{2C\alpha}{1-\log2}
\]

holds.  This is automatic along the arbitrarily large extracted values of
\(Y\).

## What this changes

The previous open leaf required

```text
every prime terminal in the full source interval is good.
```

The new leaf requires only

```text
the number of bad terminals in arbitrarily distant power intervals
is bounded by one fixed M.
```

The bad terminals may occur anywhere and may have arbitrarily large variance.
Only their count matters.  The extracted exponent \(\delta\) is explicit and
independent of \(X\).

If an available theorem gives only \(M(X)\to\infty\), this particular
pigeonhole argument yields

\[
 \delta(X)=\frac{A-1}{2A(M(X)+1)}\to0,
\]

which does not meet the fixed-positive-\(\delta\) Landau window requirement.
That does not prove that every growing-exception estimate is useless; it
identifies the exact limitation of this extraction mechanism.

## Unified reduction record

- **Actual consumer:** the weighted prime shell, centered von Mangoldt shell,
  and singleton Landau half-strip adapter.
- **Previous frontier:** pointwise positive-\(L^2\) control at every terminal
  of the chosen target window.
- **New frontier:** the bounded bad-count equation (2) on a larger power
  interval.
- **Exact aggregation:** the logarithmic gaps telescope before any lower
  bound is applied.
- **Backtracking:** a density-zero exceptional set is not silently accepted;
  bounded exceptions, or a stronger clustering theorem, are required for a
  fixed extracted exponent by this argument.
- **Context key:** pinned principal shell, \(\alpha,C,A,M\), source interval
  \((X,X^A]\), and the same positive terminal variance.
- **Original graph retained:** the prior pointwise terminal criterion remains
  a fallback.  Equation (2) is an open alternative supplier, not a discharged
  premise.

The reduced graph is

```text
bounded bad count (2)
  -> logarithmic bad-free block (5)-(7)
  -> terminal coverage via Bertrand (8)
  -> positive terminal L2 criterion
  -> weighted prime shell
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

The block-extraction argument is a human proof using finite pigeonholing and
Bertrand's theorem.  The companion Lean file records the scalar average-gap,
relative-exponent and reserve steps, invoking `rh_scan`, `rh_prune`,
`rh_reduce`, `rh_auto`, and `rh_auto_frontier`.  Local Lean/Lake/Elan are
unavailable, so it is **PREPARED / NOT COMPILED**.  CI runs 45577239749 and
45576756833 remain historical reduction-engine baselines only; no new CI pass
is claimed.

## Executed finite audit

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_aggregate_bad_block.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_aggregate_bad_block.py
git diff --check
```

Using actual primes and exact interval integration of (1), the bounded test
reported:

```text
PASS: 2332 actual-prime terminal variances
bad terminals = [5381, 5387, 5393] (count 3 <= M=3)
largest bad-free gap = (5393, 27464.0135827)
actual/guaranteed log-gap ratio = 3.82232666978
fixed extracted delta = 0.0208333333333
extracted window = [5393, 6450.25504901]
next prime after window = 6451 < gap endpoint 27464.0135827
PASS: 20001 extracted-window shell samples
minimum sampled shell slack = 4.9185988532
```

The constants in this bounded audit test only the implementation and all
logical handoffs.  They are not evidence that (2) holds for arbitrarily large
\(X\).

## Failed shortcut and remaining obstruction

Merely showing that bad terminals have density zero is insufficient for this
argument: a sparse but multiplicatively syndetic exceptional set can still
hit every fixed-power window.  What remains is a genuine bounded-exception
theorem along an unbounded sequence of source intervals, or a stronger result
showing that the exceptions cluster so that comparable bad-free logarithmic
gaps exist.

## RESUME HERE

Search the native arithmetic suppliers and primary prime-distribution
literature for an estimate on the count or logarithmic clustering of terminals
with

`V_+(p) > C^2 * p^(1+2*epsilon)`.

Do not substitute density zero.  Test whether a high-moment or large-deviation
bound makes the exception count uniformly bounded on an unbounded sequence of
power intervals; otherwise record the sharp growth rate and whether a
clustering theorem still yields a fixed logarithmic gap.

**HANDOFF TO:** prime-window, literature, Landau, audit, kernel,
integration/editor.  RH OPEN.

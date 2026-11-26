# Lane 2 — logarithmic gaps do not control the prime shell

## Result

This run gives a rigorous negative control for the dyadic-drawdown route.  A
bound on every individual prime gap—even a logarithmic bound—cannot by itself
prove the mission's weighted-shell inequality.  The missing input is
cumulative signed Chebyshev cancellation.

This is a deterministic weighted pseudo-prime construction, not a statement
about the actual primes.

## Construction

Set \(q_0=16\) and recursively define integers

\[
 g_n=\lfloor\log q_n\rfloor+3,
 \qquad q_{n+1}=q_n+g_n.                              \tag{1}
\]

Give the point \(q_n\) the prime-like weight \(\log q_n\), and define

\[
 \Theta_Q(t)=\sum_{q_n\le t}\log q_n,
 \qquad E_Q(t)=\Theta_Q(t)-t.                         \tag{2}
\]

Every gap is logarithmic:

\[
 g_n\le \log q_n+3\le3\log q_n.                    \tag{3}
\]

Nevertheless the error at successive support points has a fixed downward
drift.  Since \(q_n\ge16\),

\[
 g_n\le\log q_n+3\le q_n/2
\]

and hence

\[
 \log q_{n+1}
 =\log q_n+\log(1+g_n/q_n)
 \le\log q_n+\frac12.
\]

On the other hand, \(g_n\ge\log q_n+2\).  Therefore

\[
 \boxed{
 E_Q(q_n)-E_Q(q_{n+1})
 =g_n-\log q_{n+1}\ge\frac32.}                       \tag{4}
\]

Thus tiny gaps do not prevent a long cumulative downward excursion.

## The weighted shell actually fails

Use exactly the mission weight:

\[
 P_Q(x)=\sum_{x/2<q_n\le x}
            \left(2-\frac{x}{q_n}\right)\log q_n,
 \qquad c=1-\log2.                                   \tag{5}
\]

The layer-cake identity from the previous lane result applies to any positive
atomic weights:

\[
 cx-P_Q(x)=\int_{x/2}^{x}\frac{x}{t^2}
                    \bigl(E_Q(t)-E_Q(x)\bigr)\,dt.   \tag{6}
\]

Take \(x=q_n\).  If \(q_k\le t<q_{k+1}\), put
\(r=t-q_k\).  From (3), every gap between \(q_k\) and \(x\) is at most
\(3\log x\), so

\[
 n-k\ge\frac{x-q_k}{3\log x}.
\]

Combining this with (4) and \(0\le r<g_k\le3\log x\) gives

\[
 E_Q(t)-E_Q(x)
 \ge \frac{x-t}{2\log x}-3\log x.                   \tag{7}
\]

In particular, throughout \([x/2,3x/4]\),

\[
 E_Q(t)-E_Q(x)\ge\frac{x}{8\log x}-3\log x.         \tag{8}
\]

For every \(t\in[x/2,x]\), let \(q_{k+1}\) be the next support point.
The support-point errors decrease, while immediately before a jump the error
is at worst one weight below the next support value.  Hence

\[
 E_Q(t)-E_Q(x)\ge-\log x.                           \tag{9}
\]

The normalized kernel masses are

\[
 \int_{x/2}^{3x/4}\frac{x}{t^2}\,dt=\frac23,
 \qquad
 \int_{[x/2,x]\setminus[x/2,3x/4]}
             \frac{x}{t^2}\,dt=\frac13.
\]

Substitution of (8)--(9) into (6) proves

\[
 \boxed{
 cx-P_Q(x)\ge\frac{x}{12\log x}-\frac73\log x
 \quad (x=q_n).}                                     \tag{10}
\]

For every \(\alpha<1\) and every fixed \(C>0\), the right side eventually
exceeds \(Cx^\alpha\).  Therefore the mission lower bound fails along this
sequence for every exponent \(1/2+\varepsilon<1\), despite the uniform gap
bound \(g_n\le3\log q_n\).

For completeness, the support points do not grow anomalously fast.  Induction
with

\[
 F_n=16(n+2)\log(16(n+2))
\]

gives \(q_n\le F_n\): if \(q_n\le F_n\), then
\(g_n\le3\log F_n\le6\log(16(n+2))\), while the increment of \(F\) is at
least \(16\log(16(n+2))\).  Thus the linear-in-\(n\) error drift in (4) is of
the expected order \(x/\log x\), consistent with (10).

## Consequence for the RH reduction

The preceding result rules out the implication

```text
small individual gaps + positivity + logarithmic weights
    => RH-scale weighted shell.
```

Accordingly, Baker--Harman--Pintz-type gap bounds, even if strengthened all
the way to \(O(\log x)\), cannot close the current leaf without an additional
signed distribution theorem.  What must be controlled is a cumulative suffix
sum

\[
 \sum_{j=k}^{n-1}\bigl(g_j-\log q_{j+1}\bigr),        \tag{11}
\]

or its true-prime analogue, uniformly over the dyadic window.  Bounding each
\(g_j\) separately loses precisely this correlation.

This does not refute any theorem about the actual primes and does not prove
that a particular known short-interval theorem is insufficient until its full
weighted conclusion is compared with (11).

## Unified reduction record

- **Actual consumer:** the weighted prime shell feeding the centered
  von Mangoldt shell and singleton Landau adapter.
- **Candidate reduction tested:** replace correlated Chebyshev drawdown by a
  pointwise prime-gap upper bound.
- **Verdict:** rejected by the exact countermodel (1)--(10), even with
  logarithmic gaps.
- **Exact cancellation retained:** the endpoint term \(E_Q(x)\) remains
  inside (6); no separate norms are taken.
- **Backtracking:** return to the correlated drawdown/suffix-sum leaf; do not
  allocate another run to gap size alone.
- **Original/reduced graphs:** the original centered-shell route is unchanged;
  the gap-only candidate edge is recorded as invalid, not deleted silently.
- **Context key:** pinned principal \(r=2\) shell, positive log weights,
  dyadic predecessor interval, same endpoint \(x\).

Pinned upstream source remains
`40e56bab026552e089d7afcfeff08d2defb9c005`.  Relevant source blobs:

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |

## Executed checks

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_log_gap_no_go.py
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_log_gap_no_go.py
git -C ../rh_upstream hash-object \
  src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean \
  src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean \
  src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean
git diff --check
```

The certificate constructs 200,001 support points, checks every recurrence,
gap bound, one-step drift, growth envelope, the exact shell, and lower bound
(10).  It is a countermodel certificate, not finite evidence about primes.
The source-hash command returned, in order,
`81c8dfd66d910d083d5bc88c664c7917fdbdfe96`,
`7915058f10b33a52652290cd887cbccdc00e676a`, and
`2ed00ad3aa862f3e522686557fb8f559b17fc002`.

The companion Lean file records the scalar one-step drift and two-region
kernel aggregation and invokes `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`
and `rh_auto_frontier`.  Local Lean/Lake/Elan are unavailable, so it is
**PREPARED / NOT COMPILED**.  Historical CI runs 45577239749 and 45576756833
are only the reduction-engine baseline; no new CI PASS is claimed.

## Failed attempt and limitation

An initial attempt to infer drawdown from the maximum gap fails because the
errors in (4) add with the same sign.  Equation (10) makes the accumulated
failure quantitative.  The construction is not the true prime sequence, so
it rules out only arguments using gap size, positivity and log-like weights
without additional prime-distribution input.

## RESUME HERE

Work directly with the true-prime cumulative suffix sum

`sum_{j=k}^{n-1} ((p_{j+1}-p_j) - log p_{j+1})`

on the mission windows.  Test a genuine signed mean-square or maximal theorem
with the full uniform window quantifiers.  Do not substitute an individual
gap bound, and do not split the shared endpoint from the sum.

**HANDOFF TO:** prime-window, Landau, audit, integration/editor and kernel.
RH OPEN.

# Lane 2 — transport shell moments to Chebyshev drawdown moments

26 November 2026. **HUMAN-DERIVED / SOURCE-MATCHED / OPEN SUPPLIER.**
This supplies the missing kernel bridge requested by the prime-shell moment
ladder.  It is not the remaining arithmetic estimate and is not an RH proof.

Source pins remain
`leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`
and, separately,
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`.
No claimed RH theorem is imported.

## Exact transport

Write

\[
 \vartheta(x)=\sum_{q\le x}\log q,\qquad E(x)=\vartheta(x)-x,
\]

\[
 P(x)=\sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q,
 \qquad D(x)=(1-\log2)x-P(x).
\]

The earlier dyadic-drawdown note already proved the signed identity

\[
 \boxed{
 D(x)=\int_{x/2}^{x}\frac{x}{t^2}\bigl(E(t)-E(x)\bigr)\,dt.}
 \tag{1}
\]

For completeness, its endpoint-safe derivation is the finite layer cake

\[
 2-\frac{x}{q}=\int_{x/2}^{q}\frac{x}{t^2}\,dt,
\]

followed by interchange of a finite nonnegative sum.  The interval
\((x/2,x]\) is preserved: a prime exactly at \(x/2\) has zero layer and is
excluded, while a prime at \(x\) is included.  Also

\[
 \int_{x/2}^{x}\frac{x}{t^2}\,dt=1,
\]

so the kernel is a probability measure.

For every real \(r\ge1\), convexity of \(u\mapsto u_+^r\) applied directly
to (1), before any absolute value, gives

\[
 \boxed{
 D(x)_+^r\le
 \int_{x/2}^{x}\frac{x}{t^2}
       \bigl(E(t)-E(x)\bigr)_+^r\,dt.}
 \tag{2}
\]

For \(0<A<B\), define the one-sided dyadic drawdown moment

\[
 Q_r(A,B)=\int_A^B\int_{x/2}^{x}\frac{x}{t^2}
       \bigl(E(t)-E(x)\bigr)_+^r\,dt\,dx.
\]

Integrating (2) proves the loss-free transport

\[
 \boxed{
 \int_A^B D(x)_+^r\,dx\le Q_r(A,B).}
 \tag{T_r}
\]

This is the new result.  It retains the common endpoint \(E(x)\), charges
only downward dyadic excursions, and is invariant under replacing
\(E\) by \(E+C\).  It is strictly weaker than an absolute Chebyshev-error
moment.

## One decisive sufficient equation

Let \(Z=Y^{1+\delta}\), \(P_Z=p^+(Z)\),
\(\alpha=1/2+\varepsilon\), and

\[
 L(P_Z)=1-\log2+2\log P_Z.
\]

Combining \((T_r)\) with the exact moment-maximal inequality from PR #103
shows that the single host equation

\[
 \boxed{
 (r+1)L(P_Z)Q_r(Y/2,P_Z)
 \le C^{r+1}Y^{(r+1)\alpha}}
 \tag{Q}
\]

implies the weighted-prime lower bound

\[
 P(x)\ge(1-\log2)x-Cx^\alpha
 \qquad(Y\le x\le Z),
\]

once the existing eventual terminal-transfer guard
\(Y^{1-\alpha}\ge2C\alpha/(1-\log2)\) holds.  Equation (Q) is a
source-matched simpler sufficient criterion.  It is not known here for the
true primes on arbitrarily distant multiplicative windows.

## Standard absolute-moment fallback

The custom drawdown moment can be dominated by an ordinary moment of
\(E\).  Since

\[
 |D(x)|\le |E(x)|+
 \int_{x/2}^{x}\frac{x}{t^2}|E(t)|\,dt,
\]

Jensen and \((a+b)^r\le2^{r-1}(a^r+b^r)\) give

\[
 |D(x)|^r\le2^{r-1}\left(
 |E(x)|^r+int_{x/2}^{x}\frac{x}{t^2}|E(t)|^r\,dt\right).
\]

In the double integral, fixed \(t\) permits only \(t\le x\le2t\), and

\[
 \int_t^{2t}\frac{x}{t^2}\,dx=\frac32.
\]

Tonelli therefore gives the explicit host bound

\[
 \boxed{
 \int_A^B D(x)_+^r\,dx
 \le \frac52\,2^{r-1}\int_{A/2}^{B}|E(t)|^r\,dt.}
 \tag{3}
\]

For integer \(r\ge2\), the displayed coefficient is
\(5\,2^{r-2}\); the first form also covers \(r=1\) without a negative
natural exponent.

For the mission host, only \([Y/4,P_Z]\) is needed.  This fallback supplies
the normalization missing from the previous Selberg comparison, but it is
stronger than (Q): it discards common drift and requires two-sided control.

## Comparison with existing interpretations

- `2026-11-26_DYADIC_THETA_DRAWDOWN.md` established (1) and a pointwise
  supremum criterion.  This run does not relabel that identity as new.
- `2026-11-26_POSITIVE_MEAN_SQUARE_TERMINAL.md` used a terminal-specific
  kernel and terminal error.  Here the same endpoint \(x\) remains inside a
  host-integrated pair moment, so all terminals share one quantity.
- PR #103 derived the general moment-maximal inequality but left the relation
  to a standard Chebyshev moment open.  Equations \((T_r)\) and (3) close
  exactly that deterministic bridge.
- No classical Selberg integral is declared to prove (Q).  Its kernel,
  one-sidedness, moment order and full host quantifiers must still match.

## Unified reduction record

- **Root-reachable consumer:** weighted prime shell, centered von Mangoldt
  shell, singleton Landau half-strip adapter.
- **Original open leaf:** a custom positive moment of \(D\).
- **Reduced leaf:** the shift-invariant pair moment \(Q_r\), or the stronger
  standard moment in (3).
- **Cancellation before norms:** \(E(t)-E(x)\) is retained through (2).
- **One-sidedness:** upward common drift and negative drawdowns cost zero.
- **Aggregation:** the kernel has mass one; the host Fubini multiplicity is
  at most \(3/2\), independent of primes or interval length.
- **Symmetry:** \(Q_r\) is unchanged by \(E\mapsto E+C\).
- **Backtracking:** if only a two-sided theorem is available, use (3); if its
  exponent or assumptions are RH-equivalent, return to the compact geometric
  supplier rather than importing it.
- **Graph status:** only the deterministic shell-to-error edge is closed.
  The arithmetic supplier, Landau dependencies and compact proof graph remain.

## Verification

The executable certificate uses actual primes.  It integrates (1) exactly on
prime cells and evaluates the nonnegative side of (2) by 20-point Gaussian
integration on that same exact cell partition, for
\(r=1,2,3,4,6,8\).  It separately exhausts rational two-/three-cell Jensen
examples, checks the exact \(3/2\) Fubini coefficient, and uses a common-shift
negative control to distinguish \(Q_r\) from an absolute error moment.  These
are formula audits, not asymptotic evidence.

The companion Lean file records the scalar Jensen, Fubini-constant algebra,
and caller composition, and invokes `rh_scan`, `rh_prune`, `rh_reduce`,
`rh_auto`, and `rh_auto_frontier`.  Lean/Lake/Elan are unavailable locally;
the file is **PREPARED / NOT COMPILED**.  Historical engine runs do not verify
these new declarations.

Executed locally:

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_drawdown_moment_transport.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_drawdown_moment_transport.py
git diff --check
```

Observed summary:

```text
x_checks=1029
pointwise_moment_checks=6174
exact_discrete_jensen_checks=120
max_identity_residual=2.08899564313e-11
maximum D_+^r / drawdown moment: r=1 1.0; r=2 0.937577004604;
  r=3 0.837506615965; r=4 0.720095783506;
  r=6 0.488581750993; r=8 0.303930870486
fubini_coefficient_three_halves=PASS
common_shift_separation=PASS
RESULT=PASS (finite formula audit only)
```

## Failed attempt

Applying an absolute value immediately to (1) does yield (3), but it erases
the exact invariance under common Chebyshev drift.  That would replace the
weakest consumer by a strictly stronger RH-scale premise.  The corrected
route applies the convex positive-part function to the signed difference
first, producing \((T_r)\); (3) is retained only as a fallback supplier.

The first numerical evaluator expanded the exact cell antiderivative into
large alternating powers.  At \(r=8\) it suffered catastrophic floating-point
cancellation and returned a false zero.  The assertion failed at \(x=4001\),
so no result from that evaluator was retained.  The replacement integrates
the nonnegative integrand directly with positive Gaussian weights; the exact
rational Jensen audit remains independent of that numerical check.

## Source ledger

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |
| compact `New/Endgame/PrimeError.lean` | `63eb3d79d95ad815878e623b96f237240058c8e2` |

## RESUME HERE

Search the pinned source and primary literature for a theorem controlling the
same shift-invariant dyadic pair moment \(Q_r(Y/2,P_Z)\), with the same host
and for an even \(r\) satisfying \(r+1>1/(2\varepsilon)\).  If none exists,
expand \(Q_r\) into prime correlations while keeping the common endpoint
before Hölder; audit the diagonal contribution and boundary \(Y/4\) exactly.

**HANDOFF TO:** prime-window, literature, Landau, audit, kernel,
integration/editor. **RH OPEN.**

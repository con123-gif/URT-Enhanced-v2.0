# Lane 2 — one global energy equation implies the prime-shell window

26 November 2026. **HUMAN-DERIVED / SOURCE-MATCHED.** This is a
strictly sufficient reduction, not a proof of its remaining energy bound and
not a proof of RH.

Pinned original source:
`leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`.
The current compact source remains separately pinned at
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`; no theorem named
`grh`, `riemannHypothesis`, or `zeta_zeros_on_line` is imported here.

## Result

Put

\[
 c=1-\log 2,\qquad \alpha=\tfrac12+\varepsilon\in(\tfrac12,1),
\]

\[
 P(x)=\sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q,
 \qquad D(x)=cx-P(x).
\tag{1}
\]

For a prime terminal $p$, let $D_-(p)$ denote the left limit, so the
terminal prime itself is excluded. Define

\[
 I(p)=\int_{p/2}^{p}D(t)_+^2\,dt,
 \qquad L(p)=c+2\log p.
\tag{2}
\]

Then the exact one-sided maximal inequality is

\[
 \boxed{\bigl(D_-(p)_+\bigr)^3\le 3L(p)I(p).}
\tag{3}
\]

Consequently, for $Z=Y^{1+\delta}$ and $P_Z=p^+(Z)$, the **single
global energy equation**

\[
 \boxed{
 3\bigl(c+2\log P_Z\bigr)
 \int_{Y/2}^{P_Z}D(t)_+^2\,dt
 \le C^3Y^{3\alpha}}
\tag{E}
\]

implies, simultaneously for every prime $Y<p\le P_Z$,

\[
 D_-(p)\le Cp^\alpha.
\tag{4}
\]

If also

\[
 Y^{1-\alpha}\ge \frac{2C\alpha}{c},
\tag{5}
\]

the already proved prime-terminal transfer yields, for every real
$x\in[Y,Z]$,

\[
 \boxed{P(x)\ge cx-Cx^\alpha.}
\tag{6}
\]

Thus (E), plus the eventually elementary size guard (5), is a rigorously
justified simpler sufficient criterion for the requested weighted-prime lower
bound.  The unresolved arithmetic leaf is now one positive energy integral on
one enlarged host window.  No claim is made that (E) is known for true primes
on arbitrarily distant multiplicative windows.

## Proof of the maximal inequality

Away from prime arrivals and the harmless exit points $x=2q$, the active
prime set is fixed and

\[
 D'(x)=c+\sum_{x/2<q<x}\frac{\log q}{q}.
\tag{7}
\]

At $x=2q$ the departing term has weight zero, so $D$ is continuous. At a
prime arrival $q$, $D$ jumps **down** by $\log q$. For $x\le p$, each
active $q$ satisfies $q>x/2$, and there are at most $x$ possible
integers, hence

\[
 0\le D'(x)\le c+2\log x\le L(p).
\tag{8}
\]

The downward jumps can only decrease a forward increment. Therefore, for
every $t\in[p/2,p)$,

\[
 D_-(p)-D(t)\le L(p)(p-t).
\tag{9}
\]

Set $h=D_-(p)_+$. Since $P_-(p)\ge0$, $h\le cp$. For every prime
$p\ge2$, $L(p)=c+2\log p\ge2c$, so

\[
 \ell:=\frac{h}{L(p)}\le\frac p2.
\]

Equation (9) gives the affine lower envelope
$D(p-s)\ge h-L(p)s\ge0$ for $0\le s\le\ell$. Hence

\[
 I(p)\ge\int_0^{h/L(p)}(h-L(p)s)^2\,ds
       =\frac{h^3}{3L(p)},
\]

which is (3). Under (E), the interval $[p/2,p]$ is contained in
$[Y/2,P_Z]$, while $L(p)\le L(P_Z)$. Thus

\[
 D_-(p)_+^3\le3L(P_Z)\int_{Y/2}^{P_Z}D(t)_+^2dt
 \le C^3Y^{3\alpha}\le C^3p^{3\alpha},
\]

proving (4). Equation (6) now follows from the previously source-matched
terminal monotonicity argument and (5).

## Why this is a real maximal upgrade

The preceding lane result required a separate positive-$L^2$ terminal
condition for every prime. Equation (3) uses the actual bounded upward slope
and one-sided jumps of the shell deficit to convert an **integrated** energy
bound into a pointwise terminal bound. A spike of height $h$ has the full
affine lower envelope of width $h/L(p)$. Equation (E) then replaces
all terminal hypotheses by one host-window integral.

This simplification has a cost: (E) is stronger than the sharp family of
sliding conditions. It is offered because it is one exact scalar target to
which a genuine mean-square theorem could be compared. An average over
terminal primes alone remains insufficient unless it implies (E) or another
bad-block exclusion.

## Unified reduction record

- **Actual consumer:** the principal weighted prime shell, then the centered
  von Mangoldt shell and singleton Landau half-strip adapter.
- **Original frontier:** every-prime terminal positive-$L^2$ bounds.
- **Reduced sufficient frontier:** the single energy inequality (E), plus
  the elementary threshold (5).
- **Exact algebra first:** derivative (7) is taken with the active shell
  fixed; prime arrivals retain their signed downward jumps before any norm.
- **One-sidedness:** only $D_+^2$ is charged. Negative shell deficits help.
- **Aggregate bound:** all terminal primes share the same host integral and
  the monotone factor $L(P_Z)$.
- **Symmetry/monotonicity:** exit points $2q$ are continuous; only arrivals
  jump, and in the favorable direction.
- **Backtracking:** individual prime-gap bounds remain rejected by
  `2026-11-26_LOG_GAP_NO_GO.md`; no gap estimate is imported.
- **Context cache:** original pin, principal character, dyadic ratio two,
  exponent \(\alpha\), host \([Y/2,p^+(Y^{1+\delta})]\).
- **Graph status:** no original Landau or prime-power node is retired. The
  energy estimate is an open supplier, not an assumed theorem.

The compact theorem `eventually_primeError_le_rpow` was inspected as a
possible supplier and rejected for this edge: its `lambdaClass` is
\(\Lambda(n)(1-\chi_d(n))\) in a residue class and its conclusion is a
one-sided upper bound for a different normalized ramp. It does not by itself
give (E), or an unweighted all-prime shell lower bound. Importing `New.grh`
and deriving (6) afterward would be circular for this mission.

## Source and verification boundary

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |
| compact `New/Endgame/PrimeError.lean` | `63eb3d79d95ad815878e623b96f237240058c8e2` |
| compact `New/Main.lean` | `198ed5bf26aa294898931e0649bc2b88f1389f65` |

The companion Lean file records the cubic scalar closure and invokes
`rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier`. Local
Lean/Lake/Elan are unavailable, so it is **PREPARED / NOT COMPILED**. The
historical engine runs 45577239749 and 45576756833 are not evidence for this
new lemma.

The executable certificate integrates $D_+^2$ exactly on every affine cell
cut out by prime arrivals and exits, then checks (3) on actual prime
terminals. This is a formula audit only, not finite-to-infinite evidence for
(E) or RH.

Executed locally:

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_energy_maximal.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_energy_maximal.py
git diff --check
```

Observed output:

```text
terminal_checks=5575
minimum_rhs_minus_h_cubed=945257104.491
maximum_h_cubed_over_rhs=0.00133632826447
host_Y=40000
host_Z=70000
host_terminal=70001
host_energy=173966738.077
equality_C=0.805028173028
maximum_terminal_over_bound=0.0616055212171
triangular_factor_three_equality=PASS
missing_factor_three_negative_control=PASS
RESULT=PASS (finite formula audit only)
```

The source hashes were recomputed from both pinned checkouts and matched the
table. `lean`, `lake`, and `elan` were absent from `PATH`; no native Lean or
CI PASS is claimed for the prepared declaration.

## Failed attempt

Trying to use the compact one-sided `primeError` estimate directly failed at
the normalization and sign: it controls a quadratic non-split residue-class
ramp from above. The desired shell is unweighted over all primes and requires
a lower bound. Positivity of `lambdaClass` does not reverse that missing
direction. The failed route is retained rather than silently identifying the
two quantities.

The first finite-certificate attempt used the weaker factor eight and tried
to make actual bounded prime data falsify factor one. That negative control
did not separate: the sampled prime profiles were far from extremal. No
formula assertion failed. Integrating the full affine envelope sharpened the
theorem to factor three; the replacement negative control is the exact
extremal triangular profile, where factor three is equality and factor one
fails.

## RESUME HERE

Compare (E) with an actual Selberg-integral or Barban--Davenport--Halberstam
supplier using the **same shell deficit** and host-window quantifiers. A
standard mean square for \(\vartheta(t)-t\) is not enough until the shared
endpoint cancellation in (1) is inserted and the resulting exponent is
checked against $Y^{3\alpha}/\log P_Z$. If no theorem reaches that scale,
return to the compact geometric supplier rather than weakening (E) by an
invalid exceptional-set argument.

**HANDOFF TO:** prime-window, literature, Landau, audit, kernel,
integration/editor. RH OPEN.

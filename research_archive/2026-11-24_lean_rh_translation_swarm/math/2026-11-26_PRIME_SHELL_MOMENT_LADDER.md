# Lane 2 — the exact moment ladder and the second-moment barrier

26 November 2026. **HUMAN-DERIVED / SOURCE-MATCHED / OPEN SUPPLIER.**
This is one independently checkable reduction.  It does not prove the
remaining prime moment estimate and does not prove RH.

Original source pin:
`leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005`.
Current compact source pin:
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`.
No theorem named `grh`, `riemannHypothesis`, or `zeta_zeros_on_line` is
imported.  This note extends the factor-three result in PR #102 rather than
silently replacing it.

## Result

Let

\[
 c=1-\log 2,\qquad
 P(x)=\sum_{x/2<q\le x}\left(2-\frac{x}{q}\right)\log q,
 \qquad D(x)=cx-P(x),
\]

and for a prime terminal \(p\) let \(D_-(p)\) exclude the arrival at \(p\).
For every integer \(r\ge1\), put

\[
 I_r(p)=\int_{p/2}^{p}D(t)_+^r\,dt,
 \qquad L(p)=c+2\log p.
\]

The exact positive-moment maximal inequality is

\[
 \boxed{\bigl(D_-(p)_+\bigr)^{r+1}
 \le (r+1)L(p)I_r(p).}
 \tag{M_r}
\]

Indeed, with \(h=D_-(p)_+\), the signed shell dynamics give the same affine
lower envelope as in the factor-three proof:

\[
 D(p-s)\ge h-L(p)s\qquad (0\le s\le h/L(p)).
\]

Integrating before taking any norm gives the decisive equation

\[
 \boxed{
 \int_0^{h/L(p)}(h-L(p)s)^r\,ds
   =\frac{h^{r+1}}{(r+1)L(p)}.}
 \tag{*}
\]

The interval fits inside \([p/2,p]\) because \(h\le cp\) and
\(L(p)\ge2c\).  Prime arrivals jump \(D\) downward and shell exits have
zero weight, so neither invalidates the envelope.  Equation (*) proves
\((M_r)\).

For \(Z=Y^{1+\delta}\), \(P_Z=p^+(Z)\), and
\(\alpha=1/2+\varepsilon\), the one-host inequality

\[
 \boxed{
 (r+1)L(P_Z)\int_{Y/2}^{P_Z}D(t)_+^r\,dt
 \le C^{r+1}Y^{(r+1)\alpha}}
 \tag{H_r}
\]

therefore implies \(D_-(p)\le Cp^\alpha\) simultaneously for every prime
\(Y<p\le P_Z\).  With the existing elementary guard
\(Y^{1-\alpha}\ge2C\alpha/c\), the prime-terminal transfer then yields

\[
 P(x)\ge cx-Cx^\alpha\qquad(Y\le x\le Z).
\]

Thus \((H_r)\) is a genuine simpler sufficient criterion for the requested
weighted-prime window.  Its arithmetic truth remains open.

## Quantified obstruction to the second-moment route

Suppose, only for scale comparison, that a local supplier gave

\[
 I_r(p)\ll p^{1+r/2+\eta}.
\tag{S_r}
\]

Then \((M_r)\) gives

\[
 D_-(p)_+
 \ll p^{\frac12+\frac{1/2+\eta}{r+1}}
       (\log p)^{1/(r+1)}.
\tag{1}
\]

The exponent identity is exact:

\[
 \frac{1+r/2+\eta}{r+1}
 =\frac12+\frac{1/2+\eta}{r+1}.
\tag{2}
\]

Consequently the previous \(r=2\) energy route, even if supplied at the
square-root second-moment scale \(I_2(p)\ll p^{2+o(1)}\), reaches only
\(p^{2/3+o(1)}\).  It cannot by this maximal argument deliver
\(p^{1/2+\varepsilon}\) for \(\varepsilon\le1/6\).  This is an exponent
barrier in that route, not a theorem that every possible use of second
moments must fail.

| moment \(r\) | exponent at \(\eta=0\) | gap above \(1/2\) |
|---:|---:|---:|
| 2 | \(2/3\) | \(1/6\) |
| 4 | \(3/5\) | \(1/10\) |
| 6 | \(4/7\) | \(1/14\) |
| 8 | \(5/9\) | \(1/18\) |

For every fixed \(\varepsilon>0\), choose \(r\) and \(\eta\ge0\) so that

\[
 \boxed{\frac{1/2+\eta}{r+1}<\varepsilon.}
\tag{3}
\]

Then (1), with the logarithm absorbed in the strict exponent slack, is
eventually sufficient.  At \(\eta=0\), it is enough to take
\(r+1>1/(2\varepsilon)\).  Higher positive moments therefore remove the
cubic \(1/6\) barrier without changing the shell or its consumer.

## Literature boundary

This note does **not** import a classical Selberg integral as a supplier for
\((S_r)\).  The objects differ: the classical short-interval variance concerns
\(\psi(x+h)-\psi(x)-h\), whereas \(I_r\) uses the one-sided positive part of
the dyadic weighted shell deficit \(D\).  An endpoint/kernel bridge and the
same host-window quantifiers would still have to be proved.

Moreover, the familiar RH-strength upper estimates are conditional on RH.
The original Saffari--Vaughan article is
[Ann. Inst. Fourier 27 (1977), DOI 10.5802/aif.649](https://doi.org/10.5802/aif.649).
Modern explicit mean-value work also states RH in its hypotheses; see
[Cully-Hugill--Dudek--Johnston, J. Aust. Math. Soc. (2024)](https://doi.org/10.1017/S1446788723000291).
Neither may be relabelled an unconditional proof of \((H_r)\).  The earlier
RUN26 supplier audit already showed that an unconditional
\(\int_X^{2X}(\psi(t)-t)^2dt\ll X^{2+\epsilon}\) would itself have
RH-level consequences.

## Unified reduction record

- **Actual consumer:** principal weighted prime shell, centered von Mangoldt
  shell, then the singleton Landau half-strip adapter.
- **Original frontier:** all prime-terminal pointwise deficits.
- **Previous reduction:** PR #102 replaced those by one positive \(L^2\)
  host energy, but did not test the exponent supplied by a mean square.
- **New reduction:** \((M_r)\) and \((H_r)\), with the exact requirement (3).
- **Exact cancellation first:** signed jumps and zero-weight exits are retained;
  only the remaining positive affine envelope is raised to a power.
- **Aggregation:** one host moment controls every terminal prime.
- **Symmetry/monotonicity:** no two-sided norm is charged; negative deficit
  helps.
- **Backtracking result:** the \(r=2\) branch is retained but marked
  insufficient for \(\varepsilon\le1/6\) at square-root moment scale.
- **Context cache:** principal character, dyadic ratio two, integer \(r\),
  target \(\varepsilon\), and the exact host \([Y/2,p^+(Y^{1+\delta})]\).
- **Unresolved leaf:** prove \((H_r)\), or a source-matched estimate implying
  it, for arbitrarily distant multiplicative windows.  No original Landau or
  compact geometric obligation is deleted.

The companion Lean file records (2), (3), the scalar caller bridge, and calls
`rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier`.  Local
Lean/Lake/Elan are unavailable, so it is **PREPARED / NOT COMPILED**.  CI runs
45577239749 and 45576756833 validate the existing engines, not these new
declarations.

## Independent certificate

`verify_prime_shell_moment_ladder.py` integrates \(D_+^r\) exactly on each
affine cell between actual prime arrivals and exits, for
\(r=1,2,3,4,6,8\).  It checks \((M_r)\) on prime terminals in
\([30000,40000]\), verifies (2) with rational arithmetic, and uses the exact
triangular profile \(h=L=1\), \(I_r=1/(r+1)\) as a sharp negative control:
the factor \(r+1\) is equality and omitting it fails.  These finite checks are
a formula audit, not evidence for \((H_r)\).

Executed locally:

```text
python3 research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_moment_ladder.py
python3 -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_prime_shell_moment_ladder.py
git diff --check
```

Observed summary:

```text
terminal_checks=958
moments=1,2,3,4,6,8
maximum_lhs_over_rhs: r=1 0.000852381053; r=2 0.00133632826447;
  r=3 0.00197997851343; r=4 0.0028085280312;
  r=6 0.00514639512692; r=8 0.0085569250375
r=1:exponent=3/4; r=2:exponent=2/3; r=3:exponent=5/8;
  r=4:exponent=3/5; r=6:exponent=4/7; r=8:exponent=5/9
triangular_factor_r_plus_one_equality=PASS
missing_factor_negative_control=PASS
RESULT=PASS (finite formula audit only)
```

## Failed attempt

The first route was to insert a Selberg-type second moment into the
factor-three equation.  The exponent calculation gives \(2/3+o(1)\), not
\(1/2+\varepsilon\) for every \(\varepsilon>0\).  The route therefore fails
before the separate normalization and conditionality problems are reached.
No RH-conditional estimate has been imported to conceal that failure.

## Source ledger

| Source | Blob |
|---|---|
| `DedekindLFunctions/CharFamily.lean` | `81c8dfd66d910d083d5bc88c664c7917fdbdfe96` |
| `DedekindLFunctions/LandauTheorems/landauWindow.lean` | `7915058f10b33a52652290cd887cbccdc00e676a` |
| `DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean` | `2ed00ad3aa862f3e522686557fb8f559b17fc002` |
| compact `New/Endgame/PrimeError.lean` | `63eb3d79d95ad815878e623b96f237240058c8e2` |
| compact `New/Main.lean` | `198ed5bf26aa294898931e0649bc2b88f1389f65` |

## RESUME HERE

Seek an **unconditional, kernel-matched positive \(r\)-moment supplier** with
the full host quantifiers in \((H_r)\).  For target \(\varepsilon\), begin at
the smallest even \(r\) with \(r+1>1/(2\varepsilon)\), expand the dyadic shell
in terms of \(\psi\), and audit every endpoint and diagonal correlation before
using Hölder.  If the only available upper estimate assumes RH, return to the
compact geometric supplier; do not cite it as a discharge.

**HANDOFF TO:** prime-window, literature, Landau, audit, kernel,
integration/editor. **RH OPEN.**

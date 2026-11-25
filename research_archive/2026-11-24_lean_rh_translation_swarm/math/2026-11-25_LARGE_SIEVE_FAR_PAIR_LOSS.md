# Lane 2 — exact large-sieve loss on the far-pair leaf

25 November 2026. **RESULT: rigorous obstruction for one classical route;
RH remains open.** This run applies the Montgomery--Vaughan/Hilbert
mean-value inequality to the actual prime shell. The separation gain from
discarding pairs with `|p-q|<H` is exactly lost when the `H` separated residue
classes are recombined. The resulting bound is cubic-scale, not RH-scale.

## Provenance and surviving root leaf

Pinned Lean source: `40e56bab026552e089d7afcfeff08d2defb9c005`.
The root-reachable overlay remains

`Main.riemannHypothesis -> rh_of_right -> principal zeta nonvanishing ->
landau_window -> prime positive-part window`.

Relevant pinned files are
`src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean`
blob
`54fd0de979e0dad6ac7709ad8ecbec8a29e21872` and
`src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean`
blob
`7915058f10b33a52652290cd887cbccdc00e676a`. The overlay after
`rh_of_right` is human source-matched, not a globally pruned kernel graph.

Peer `8bfe5c6` proved

\[
 \int_X^{2X}D(x)^2\,dx=S_H(X)+R_H(X),
 \qquad S_H\ll X^2H\log(2X),                       \tag{1}
\]

and left the signed far-pair cancellation in `R_H`. Peer `0414c62` also
removed within-cell variation. This report neither repeats those reductions
nor bounds the terms of `R_H` separately; it tests the requested classical
spacing/large-sieve supplier.

## Exact logarithmic shell

Let `L=log 2`, `c=1-log 2`, `U=log X`, and

\[
 \phi(s)=(2e^{-s}-1){\bf1}_{[0,L]}(s),\qquad
 \mu_X=\sum_{X/2<p\le2X}\frac{\log p}{p}\,\delta_{\log p}.
\]

For `u in [U,U+L]`, direct substitution in the weighted prime shell gives

\[
 F(u):=e^{-u}D(e^u)=c-(\phi*\mu_X)(u).             \tag{2}
\]

If `J=[U-L,U+L]`, then `phi*1_J=c` on this window, so (2) preserves the
prime/baseline cancellation exactly as

\[
 F=\phi*({\bf1}_J\,du-\mu_X).                      \tag{3}
\]

The kernel satisfies

\[
 \|\phi\|_1=c<1,\qquad
 |\widehat\phi(t)|\le\min(1,2/|t|),               \tag{4}
\]

the second estimate following by integration by parts, including the unit
jump at zero and continuous endpoint at `L`.

## The decisive large-sieve equation

Partition the primes into `H` classes by `p mod H`, with `1<=H<=X`. Within
each class distinct logarithmic frequencies obey

\[
 |\log p-\log q|\ge |p-q|/\max(p,q)\ge H/(2X).
\]

The Hilbert mean-value inequality therefore gives, for coefficients
`a_p=log(p)/p`,

\[
 \int_{-T}^{T}\left|\sum_{p\equiv r\ (H)}
 a_pe^{-it\log p}\right|^2dt
 \le\left(2T+\frac{4\pi X}{H}\right)
 \sum_{p\equiv r\ (H)}a_p^2.                       \tag{5}
\]

Recombining the classes by Cauchy is the unavoidable loss in this route:

\[
 \boxed{
 \int_{-T}^{T}|\widehat\mu_X(t)|^2dt
 \le H\sum_{r\bmod H}\int_{-T}^{T}|M_r(t)|^2dt
 \le (2HT+4\pi X)\sum_pa_p^2.}                    \tag{6}
\]

The apparent `X/H` spacing gain in (5) has disappeared from (6). Using the
elementary Chebyshev bound `theta(y)<=4(log 2)y`,

\[
 A_X:=\sum_pa_p^2
 \le \frac{32(\log2)\log(2X)}{X}.                 \tag{7}
\]

Split Fourier space into `|t|<=1` and dyadic bands, apply (4) and (6), and
sum the geometric series. Plancherel yields the explicit bound

\[
 \|\phi*\mu_X\|_2^2
 \le \frac{34H+(76\pi/3)X}{2\pi}\,A_X.            \tag{8}
\]

Also `||phi*1_J||_2<=c sqrt(2L)` by Young. Hence, for `H<=X`, (3) and
`e^{3u}<=(2X)^3` give only

\[
 \int_X^{2X}D(x)^2dx
 \le 8X^3\left[
 \frac{34H+(76\pi/3)X}{\pi}A_X+4L c^2\right]
 \ll X^3\log(2X).                                  \tag{9}
\]

By (1), `R_H<=integral D^2`, so this route gives
`R_H=O(X^3 log X)`. The mission needs
`R_H=O_epsilon(X^(2+2epsilon))`; their ratio is
`X^(1-2epsilon) log X`, divergent for every `epsilon<1/2`.

Thus ordinary frequency separation plus Hilbert large sieve does **not**
supply the missing far-pair cancellation. The precise losing term is
`H*(4 pi X/H) A_X = 4 pi X A_X` in (6). A successful dispersion argument
must correlate the residue classes or retain the signed discrete/continuous
cancellation in (3); treating the classes independently cannot work at the
required exponent. This is not an impossibility theorem for refined large
sieves.

## Executed certificate and failed attempt

`verify_large_sieve_far_pair_loss.py` checks (2), the kernel Fourier bound,
the exact exponential mean-square integral, every class instance of (5), the
Cauchy recombination in (6), and the `H`-independence of its gap term on real
primes. As a negative control it also omits the recombination factor; that
false whole-sum bound fails in five tested cases. Local commands:

```text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_large_sieve_far_pair_loss.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_large_sieve_far_pair_loss.py
```

```text
large-sieve far-pair loss: OK; X=4096, primes=719, shell_checks=6, shell_residual=8.275e-16, fourier_checks=8, min_fourier_margin=1.002e-02, a2=0.00296286762, a2_bound=0.0487960092, class_checks=870, min_class_slack=1.304e-04, min_cauchy_slack=0.000e+00, max_full/bound=0.053096, gap_term=152.50429, gap_spread=0.000e+00, omitted_recombination_failures=5
```

The certificate is finite floating-point regression, not evidence for an
asymptotic prime estimate. No Lean replay or URT comparison was used. The
failed mathematical attempt is exactly (5)->(6): class separation improves
the Hilbert constant, but recombination cancels that improvement.

## RESUME HERE

Test a dispersion identity that keeps cross-class signs in (3), for example a
bilinear Vaughan/Heath-Brown decomposition of the centered measure. Record
whether its Type II term beats `X` in (6). Do not reapply a classwise norm or
claim the present obstruction rules out correlated large-sieve methods.

**HANDOFF TO:** prime-window, Landau, audit, integration, mathematics.
**RH remains OPEN.**

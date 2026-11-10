# Coupled cycle 02 — independent reproduction of V_hist

Classification: FALSIFIED against the printed archive
`V = 0.490435304391 t² f² + 4.16132699108e-7 f⁴`
(mixed derivative `1.961741217564 t f`, which equals `4a` exactly).
Advances an ARF? No.

## Definitions (archived formulae, no fitted constants)

Channel-selected sources on the original 20-face hidden projectors:

- `h3 = 2 P3[(C t) ⊙ (C f)]`
- `h5 = P5[(C f) ⊙ (C f)]`

Clock operators on the native 24-site circle (`N = 24`), charge 2:

- `A3 = 18 I24 + (π/e)² L2`
- `A5 = 16 I24 + (π/e)² L2`

Integrated-out history energy:

- `V_hist = (|h3|² + Δ² |h5|²)/4 − ½ (h3† A3⁻¹ h3 + Δ² h5† A5⁻¹ h5)`

On a single charge-2 Fourier mode with Laplacian eigenvalue `λ`, this collapses to
`V = c3 ||h3||² + Δ² c5 ||h5||²` with
`c3 = 1/4 − 1/(2(18 + r² λ))` and `c5 = 1/4 − 1/(2(16 + r² λ))`,
`r = π/e`. The golden mode is `m = 18`, `λ = 2 − 2 cos(2θ − 2π·18/24)`,
`θ = 2π/φ²`, giving

- `c3 = 0.2222379983269106`
- `c5 = 0.21876996521511627`
- `Δ² = 6.19606606165215e-6`

Vanishing-clock (`λ = 0`) values are the Schur numbers `c3 = 2/9`, `c5 = 7/32` to machine precision of the arithmetic `1/4 − 1/(2·18)` and `1/4 − 1/(2·16)`.

`t` and `f` are unit vectors in the whitened icosahedral 3-plane and 5-plane (`Iico` columns 0–2 and 3–7). That is the archived portal normalisation (`Iico.T Iico = I8`).

## Result

The printed coefficients are **not reproduced** under any listed convention
(Iico unit axes, golden mode `m = 18`, vanishing clock, overall factor `N = 24`,
or the untruncated November 7 source `h = (P3[(C(t+f))²], P5[(C(t+f))²])`
on axis `(0,0)`).

Over the 15 axis pairs `(i3, i5)` at the golden mode:

| quantity | min | max | mean | std |
|---|---|---|---|---|
| `a` (t² f²) | 0.01842752160576284 | 1.3288163404866948 | 0.6736219310462288 | 0.4763226353987652 |
| `b` (f⁴) | 1.8073508757042662e-7 | 4.0665394703346127e-7 | 2.711026313556406e-7 | 1.1067718579119527e-7 |

`a` and `b` **depend on source direction**. No pair matches the printed
`a = 0.490435304391`, `b = 4.16132699108e-7` to printed precision
(`n_printed_hits = 0`).

Nearest listed candidate: Iico axis `(i3, i5) = (0, 0)`, golden mode

- computed `a = 0.48154259920004555` (relative discrepancy `1.813226966194252 %`)
- computed `b = 4.0665394703346127e-7` (relative discrepancy `2.2778195741062567 %`)

The raw (unwhitened) dipole `x` paired with quadrupole `x² − y²` of the
icosahedral vertices reproduces this same `(a, b)` to `1e-16`, so whitening
is not the mismatch on that pair. Face-normalising `||C t|| = ||C f|| = 1`
moves `a` to `0.016945934950250156`, farther from the archive. Multiplying
by `N = 24` (unnormalised clock waveform) gives `a = 11.557`–class numbers,
farther still. The untruncated source on axis `(0,0)` has `t⁴ ≈ 0` and the
same mixed `t² f²` coefficient `0.48154259920004555`, so truncation of
`P3[(Ct)²]` is not the mismatch on that axis.

The two archived/computed ratios are unequal:

- `a_arch / a_(0,0) = 1.0184671204701876`
- `b_arch / b_(0,0) = 1.0233091357988435`

A single overall rescaling of `(t, f)` cannot repair both coefficients.
Zero-clock / Schur coefficients change `a` only in the fifth significant
digit (`0.4815084157277587`).

The printed string `0.490435304391` does not occur in the cloned repository
text; the comparison is against the figure supplied in the brief.

## Classification note

This is a discrepancy report, not a licence to adjust `c3`, `c5`, `Δ`, or
the source map until the printed digits appear. Direction dependence of
`(a, b)` is already a preview of Question D: quartic response coefficients
are not source-direction invariants.

Verification: `test_reproduce_V.py`, `results.json`.
Predeclaration hash: `47108ade4ee764358761f46fd80d068b16f845bf44fbd5507eba5c2935c7f60a`

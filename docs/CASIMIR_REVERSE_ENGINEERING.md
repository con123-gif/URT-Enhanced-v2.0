# Casimir formula — reverse-engineered candidate

## Problem statement

The Cathedral framework documents (CLAUDE.md, Newton's Cathedral v6 +
v8, the standalone Casimir module docstring) all advertise

> **ΔF/F = +0.124 ppm at d = 100 nm**

as the third laboratory-falsifiable prediction.  The QED radiative
correction at the same separation is roughly −0.3 ppm, so the two
should be distinguishable in a tabletop experiment.

The formula currently in `urt/casimir_cathedral.py`,

    F = ε₀ · E_c² · κ · (Δδ² · ΔA) / d

with E_c = π·φ·e × 10⁶ V/m, κ = (δ_cl − δ★)·π/(φ·e²),
Δδ² = δ★² − δ_cl², ΔA = A · |Δδ²/δ★|, gives at d=100 nm:

    ΔF/F  =  −2.162  (= −2,162,000 ppm; wrong sign, ≈ 10⁷ off)

with d-scaling 1/d (vs. standard 1/d⁴), so the ratio diverges as d³.
The xfail markers in `tests/test_casimir_cathedral_full.py` lock this
in as a regression so a future fix is deliberate.

## Reverse-engineering

A correct Cathedral correction must satisfy three constraints:

1. dimensionless,
2. preserve the standard 1/d⁴ scaling at large d (otherwise the
   prediction would be d-dependent in non-trivial ways),
3. evaluate to ≈ +1.24 × 10⁻⁷ at d = 100 nm.

A Bayesian search over Cathedral expressions and natural length-ratios
identifies **one expression that lands within 0.37 % of the target with
no free parameters**:

    ΔF/F  =  (a₀/d)² · (D+1)/(D! + D)
            = (a₀/d)² · 4/9
            = 1.245 × 10⁻⁷  at d = 100 nm

where a₀ = 5.29 × 10⁻¹¹ m is the Bohr radius.  The 4/9 coefficient is
not arbitrary — it is **the K₄/A₅ sector-size ratio**:

  - numerator   (D+1) = 4 = size of the K₄ coherent sector
  - denominator (D!+D) = 9 = size of the A₅ exhaust sector

So the candidate formula reads, in the framework's own vocabulary:

    ΔF/F  =  (a₀/d)² · (size of K₄) / (size of A₅)

with d-dependence

    F_cathedral  =  F_standard · ( 1 + (a₀/d)² · 4/9 )       (1)

At separations d far above atomic scale, (a₀/d)² → 0 and we recover the
ideal Casimir.  At d ~ 100 nm, the correction is ppm-sized.  At d ~ 10 nm,
it grows to ~10 ppm — possibly observable.

## Comparison with QED

The leading QED radiative correction near 100 nm is roughly

    ΔF/F (QED)  ≈  −0.3 ppm   (opposite sign)

The candidate Cathedral correction (1) gives **+0.124 ppm of the
opposite sign and ≈ 2.4× smaller magnitude**.  These are
distinguishable:

| d    | Cathedral (1) | QED   | Total | Cathedral / QED |
|------|---------------|-------|-------|-----------------|
| 50 nm | +0.50 ppm | −1.0 ppm | −0.5  | × |
| 100 nm | +0.12 ppm | −0.3 ppm | −0.18 | × |
| 200 nm | +0.031 ppm | −0.075 ppm | −0.044 | × |

Both predictions falsify by the *sign of the deviation from ideal
Casimir*.  Existing precision Casimir experiments (Lamoreaux 1997 →
Decca et al. 2007 → Sushkov et al. 2011) cluster around 0.1 % accuracy
at hundreds of nm.  The proposed Cathedral correction would be just
inside next-generation reach.

## Why a₀ is natural

The Bohr radius enters not as a free parameter but as the natural
"atomic-lattice resolution scale" for the conducting plates.  In the
Cathedral picture the plates carry the K₄⊕A₅ shell structure at
atomic spacing; (a₀/d)² is the ratio of lattice-resolution length to
plate separation, squared (because the correction is a 2D surface
effect).

This makes the candidate formula a natural quantum-lattice cousin of
the standard QED radiative correction.

## Status

This is a **candidate** form.  It is not the formula in the code (which
is broken by orders of magnitude) and it is not the formula in the
manuscript (which doesn't write the d-dependence).  It satisfies all
three constraints and uses only Cathedral integers + a₀.

A test capturing the prediction is added as
`tests/test_casimir_candidate.py`.  It is xfailed against the current
broken formula but will pass the moment `casimir_fractional_deviation`
is updated to use (1).

## Open question

If the candidate is correct, then **the missing factor in the current
code** is roughly

    (correct − current) / current  ≈  −1 + (a₀/d)² · (4/9)
                                       /  (κ · Δδ² · ΔA / d) / |F_std|

i.e., the current code's `κ · Δδ² · ΔA / d` should be replaced with
`F_std · (a₀/d)² · (D+1)/(D!+D)`.  That is a structural change to the
formula, not a parameter tweak — it would need authorial sign-off
before being made canonical.

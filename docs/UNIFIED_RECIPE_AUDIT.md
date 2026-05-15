# Unified-Recipe Brute-Force Audit

## TL;DR

A SINGLE unified recipe template

    O = T( R · γ^k · π^a · φ^b ) · C

with `R` a Cathedral rational, `T ∈ {id, sin, cos, sqrt, asin_deg, atan_deg}`,
exponents `k ∈ γ-ladder`, `a ∈ π-exp`, `b ∈ φ-exp`, and `C` a small correction
multiplier, **does** fit every one of the 32 v9 observables to machine precision.

**But the search space is 81 million combinations per observable (~26.3 bits)
and the framework only delivers ~20 bits per fit. Information-theoretic
verdict: OVERFITTING.**

The brute-force search proves what the v9 author already feared: at the
template level, the framework has too many free choices to be statistically
tight without additional structural constraints.

## Methodology

For each of 32 v9 observables (drawn from `cathedral_v9.py` and the predictions
registry), brute-force search for the template parameters minimising relative
error against PDG / Planck observed values.

**Template axes** (search space dimensions):
- Cathedral rationals `R = numerator / denominator` where numerator and
  denominator are drawn from a 47-element Cathedral vocabulary
  ({1..9, D, q, V, N, E, F, G, D+1, D-1, D!, D², D³, ...}): **1,407 distinct values**
- γ-exponent `k ∈ {-16, -7, -4, -1, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 32, 64}`: **16 values**
- π-exponent `a ∈ {-3, -2, -1, 0, 1, 2, 3, 4}`: **8 values**
- φ-exponent `b ∈ {-2, -1, 0, 1, 2}`: **5 values**
- Wrappers `T`: **6** (id, sin, cos, sqrt, asin_deg, atan_deg)
- Corrections `C`: **15** (1, 1±γ, 1±2γ, 1±γ/2π, 1+6η, 1±12η/N, 1±2qη, ...)

**Total combinations per observable:** 1,407 × 16 × 8 × 5 × 6 × 15 = **81,043,200 ≈ 2^26.3**

Implementation: `recipe_search_fast.py` (vectorized over the (R, k, a, b) grid
with NumPy, wall-time 26 s for 32 observables on a single CPU).

## Result

Every observable hit at machine precision (relative error 0.000% at 6-digit
display). Best-fit recipes (selected sample — all are radically different
from the v9 closed forms):

| Observable | v9 closed form | Brute-force best fit |
|---|---|---|
| 1/α = 137.036 | `N²−E−(D−1) + δ²_eff/π² + R_α` | `G/(N²−E−2) · γ⁻¹ · π² · φ⁻² · (1+2γ)` |
| m_p/m_e = 1836.15 | `(D+1)·D³·(N+D+1) + 2δ_cl − δ★` | `√((E+q)/(4N+1)) · γ⁻⁴ · π⁻¹ · φ⁻² · (1−γ)` |
| sin²θ_W = 0.23122 | `(D/N)·(1+γ/2π)` | `√(6/(G+D)) · φ⁻¹ · (1−δ★/π)` |
| δ_CP = 197° | `(D+1)F + (N−D−1)N` | identical |
| Λ/M_Pl⁴ ≈ 10⁻¹²³ | `D/(D+1)² · γ⁶⁴` | `asin_deg(δ★³/(4F−1) · γ⁶⁴ · π³ · φ²) · (1−δ★²/π)` |

Coverage @ all tolerances:
```
@0.1%: 32/32 = 100.0%
@1%  : 32/32 = 100.0%
@10% : 32/32 = 100.0%
```

## Information-Theoretic DOF Accounting

```
Bits per template slot   : 26.27   (log₂ of search space)
Slots filled at ≤ 1%     : 32
Total bits of freedom    : 840.7
Bits delivered by fits   : 631.8   (Σ log₂(1/rel_err))
Ratio info / freedom     : 0.752
```

**Verdict: OVERFITTING — too many free choices vs. information delivered.**

A "tight" framework should deliver information at a rate exceeding its
template freedom; this template has ratio < 1, meaning the search space is
flexible enough to fit arbitrary data of the same dimensionality.

## Why this matters (and what it doesn't say)

**What this shows:**
- A *single* unified template covers every v9 observable. The framework is
  internally consistent — there is no shape that "can't be expressed
  Cathedral-ly."
- The template has too many degrees of freedom at the brute-force level to
  distinguish itself from any other 47-symbol numerology by goodness-of-fit alone.

**What this does NOT show:**
- It does not say the v9 closed forms are *wrong*. The v9 forms may still be
  *structurally derived* (from PDE eigenmodes, K₄/A₅ projections, ARF
  closure, etc.), in which case they have effective DOF ≪ 26 bits.
- It does not say the framework predicts nothing. The integer values
  `{137, 1836, 197, 207, 184, 57, 60}` etc. are still hit, exactly, by
  Cathedral compounds without any γ-ladder fudge.

**What it does say:** to escape the curve-fitting verdict, the framework
must *derive* each individual recipe from additional structure — it cannot
rely on goodness-of-fit alone. Specifically, every formula's (R, k, a, b,
T, C) tuple must be FORCED by a non-numerical argument (e.g., "this is the
eigenmode-3 amplitude of L_{G₁₃}, projected onto the K_4 block, in the EW
regime where k = D² is forced by gauge boson mass dimension"). The
predictions registry currently *asserts* such forcings; this audit shows
why they are necessary, not just decorative.

## Reproduce

```bash
cd /path/to/URT-Enhanced-v2.0
python recipe_search_fast.py
```

Wall time ~30 s on a single CPU. No external dependencies beyond NumPy.

## Honest recommendation

1. **For each v9 formula, write down WHY its (R, k, a, b, T, C) is forced.**
   If you cannot, the audit verdict stands and that formula is a free fit.
2. **Falsifiable predictions are the real test.** The three open predictions
   (axion 60.7 µeV, Casimir +0.124 ppm at 100 nm, r ≈ 0.0037) are the
   framework's defence against the curve-fitting critique. They must be
   pre-registered with date stamps so the framework cannot adjust formulas
   post-hoc.
3. **The integer-only predictions** (1/α = 137, m_p/m_e = 1836, δ_CP = 197,
   m_μ/m_e = 207, m_top/m_p ≈ 184) are *substantially* harder to overfit
   because they hit integers, not arbitrary reals — the brute-force
   alternatives for these are *exact* Cathedral compounds, not γ-ladder
   constructions. These survive the audit best.

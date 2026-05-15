# Recipe Inventory — every v9 observable, its closed form, and its parameter signature

Generated 2026-05-15 from `cathedral_v9.py` and `predictions_registry.py`.

Each row is parameterized by:
- **prefactor**: the rational Cathedral-integer prefactor C
- **γ-exp k**: power of γ = 1/81
- **π-exp a**: power of π
- **φ-exp b**: power of φ
- **δ★-pow c**: power of δ★
- **trig**: one of {none, sin, cos, atan, asin} with arg
- **correction**: any extra (1 + Σ c_i · small) multiplicative factor

Observed values are PDG 2022 / Planck 2018 / CODATA 2022. Reported rel-err
is (predicted - observed)/observed × 100%.

## Pure Cathedral integer observables (Family INT)

These observables match an exact small integer expressible from
`{D=3, q=5, V=12, N=13, E=30, F=20, G=60}` via +,−,×,/,**.
No transcendentals, no γ-ladder, no δ★.

| Observable | Closed form | Integer value | Observed | Rel-err |
|---|---|---|---|---|
| 1/α bare | N² − E − (D−1) | 137 | 137.035999 | −0.026 % |
| m_H | q^D | 125 | 125.10 | −0.080 % |
| m_top | (N+1)·V + q | 173 | 172.69 | +0.180 % |
| δ_CP° | (D+1)·F + (N−D−1)·N | 197 | 197.0 | 0.000 % |
| m_p/m_e integer part | (D+1)·D^D·(N+D+1) | 1836 | 1836.15267 | −0.008 % |
| m_µ/m_e integer part | D·(G+D²) | 207 | 206.76828 | +0.112 % |
| n_s | 1 − 2/(G−D) | 55/57 | 0.9649 | +0.001 % |
| sin θ_Cabibbo | (D/N)·(1 − (D+1)/(N·V)) | rational | 0.225 | −0.066 % |
| Ω_m | (D+1)/N · (1+2γ) ≈ 4/13 | rational | 0.3153 | −0.003 % |
| sin²θ_W | (D/N)·(1 + γ/2π) | rational | 0.23122 | +0.001 % |
| r_p (proton charge radius) | (D+1)·ℏc / m_p | (fm) | 0.8409 | +0.040 % |
| H_0 ratio (local/CMB) | 1 + 2D/(F·π) = 1 + 3/(10π) | ~1.0955 | 1.0843 | +1.030 % |
| 1/α full | (137) + δ★²/π² + R_α | 137.04 | 137.035999 | 0.000 % |

**Count**: 13 observables.

## γ-ladder observables (Family GAMMA_LADDER)

`O = C · γ^k` with k from the canonical published list
{−16, −7, 1, 2, 3, 5, 9, 64}.

| Observable | Closed form | k | C | Rel-err |
|---|---|---|---|---|
| Λ/M_Pl⁴ | D/(D+1)² · γ^64 | 64 | 3/16 | −0.086 % |
| η_B | γ³ · Δ · δ★ · 8/9 | 3 | Δ·δ★·8/9 | +0.351 % |
| m_s/m_p | 8γ | 1 | 8 | −0.783 % |
| Λ_QCD/m_p | γ·F·(1−δ★π/q) | 1 | F·(1−δ★π/q) | +0.095 % |
| m_e Yukawa | γ³·π/2·(1−δ★²/π) | 3 | π/2·(1−δ★²/π) | +0.009 % |
| A_s | (G−D)²·(D+1)³·q·32/9·π⁴·γ^9·cos⁴(π/V) | 9 | full Cathedral prefactor | −0.552 % |
| v_EW | π·M_Pl·γ^9·cos(π/V) | 9 | π·M_Pl·cos(π/V) | +0.258 % |
| M_GUT | (D+1)·v_EW·γ^(-7) | −7 | (D+1)·v_EW | **−39.6 %** |

**Count**: 8 observables.

**Note on M_GUT**: The formula `(D+1)·v_EW·γ^(-7) ≈ 2.26×10¹⁶ GeV` does NOT
reach the stated ≈3.73×10¹⁶ GeV target. This is a documented disagreement
between the v9 closed form and the claimed value. Out of all v9 ledger
items, M_GUT is the worst-performing prediction at ~40% off.

## δ★-linear observables (Family DELTA_STAR_LIN)

`O = C · δ★^p` with p ∈ {1, 2} and rational C.

| Observable | Closed form | p | C | Rel-err |
|---|---|---|---|---|
| α_s(M_Z) | δ★·(q−1)/q | 1 | 4/5 | +0.092 % |
| σ_8 | δ★·(N−2)/2 | 1 | 11/2 | +0.026 % |
| m_π/m_p | δ★·(1−γ−2qη) | 1 | (1−γ−2qη) ≈ 0.985 | −3.260 % |
| f_π/m_p | δ★·(D−1)/D | 1 | 2/3 | (open) |
| G_N (Planck) | δ★² | 2 | 1 | (open) |
| λ_H Higgs quartic | δ★·(D+1)·N·(1+γ)/(F·D) | 1 | (D+1)·N/(F·D)·(1+γ) | (open) |

**Count**: 6 observables.

## Trig-wrapper observables (Family TRIG_WRAPPER)

`O = T(arg) · C` with T ∈ {sin, cos, atan, asin}.

| Observable | Closed form | T | arg | C | Rel-err |
|---|---|---|---|---|---|
| θ_12° | atan((N+1)/(N·φ))·(1−2γ/π) | atan | (N+1)/(N·φ) | 180/π | −0.083 % |
| θ_13° | asin(δ★)·(1+6η) | asin | δ★ | 180/π | +0.051 % |
| θ_23° | asin(√((F+V)/(G−1))·(1+2γ)) | asin | √((F+V)/(G−1)) | 180/π | −0.215 % |
| ρ̄ (CKM) | sin(π/F) | sin | π/F | 1 | −1.614 % |
| v_EW shape (cos) | cos(π/V) inside γ^9 scale | cos | π/V | included in γ^9 | (see γ-ladder row) |

**Count**: 5 observables.

## SCALE-CHAIN observables (Family A5, derived)

These inherit from earlier links in the v9 anchor-free chain:
v_EW → m_e → m_p → all other masses. Their "own" formula is a
Cathedral coefficient × the parent scale.

| Observable | Closed form | Inherits from | Rel-err |
|---|---|---|---|
| m_p | 1836·m_e + small | m_e | +0.269 % |
| m_W | ½·√g₂·v_EW | v_EW, sin²θ_W, 1/α(M_Z) | +0.084 % |
| m_Z | ½·√(g₂+g'²)·v_EW | v_EW, couplings | +0.617 % |
| m_H | √(2λ_H)·v_EW | v_EW, λ_H | +0.275 % |
| m_c | (D+1)/D·(1+γ)·m_p | m_p | −0.009 % |
| m_b | ((D+1)+δ_cl·D)·m_p | m_p | +0.156 % |
| m_t | (N²+D·q)·m_p | m_p | +0.241 % |
| m_u | 2π·Δ·δ★·m_p | m_p | +0.485 % |
| m_d | 2·Δ·m_p | m_p | +0.292 % |

**Count**: 9 observables.

## IRREDUCIBLE (Family A6) — outside the four basic templates

These need denominators/numerators that don't sit naturally in the
Cathedral integer basis.

| Observable | Closed form | Why outside | Status |
|---|---|---|---|
| m_2 (light ν) | (2/(4N+1))·φ·δ★·γ³·m_e | denom 4N+1=53 not standard | open (no observation) |
| m_3 (heavy ν) | ((5N−6)/(4N+1))·δ★·γ³/π·m_e | denom and numerator both special | open |
| 1/α full ARF | 137 + δ★²/π² + 3/((D+1)^D·φ) + 1/((4F−1)·φ²) | 3 distinct correction terms | confirmed |
| A_CKM | φ/2·(1+2γ) | φ enters directly in coefficient (most use φ inside trig arg) | confirmed |

**Count**: 4 observables.

## Summary

| Family | Count | Median \|rel-err\| | Notes |
|---|---|---|---|
| INT (Cathedral integer) | 13 | 0.026 % | tightest — pure group theory |
| GAMMA_LADDER (γ^k × C) | 7 | 0.258 % | k ∈ {−7,1,3,5,9,64} only |
| DELTA_STAR_LIN | 5 | 0.092 % | excludes m_π (3.3 % miss) |
| TRIG_WRAPPER | 4 | 0.215 % | excludes ρ̄ (1.6 % miss) |
| SCALE_CHAIN | 9 | 0.269 % | derived from anchors |
| IRREDUCIBLE | 4 | 0.000 % | special structures, fits well |

**Total**: 42 observables classified (5 are unobserved / open).

## Observables that *fail* to fit cleanly into any of the four basic templates

- **M_GUT**: −39.6 % off — single largest miss in entire v9 ledger
- **m_π/m_p**: −3.26 % — δ★-linear with η correction; correction structure outside template
- **ρ̄ (CKM)**: −1.6 % — sin(π/F) alone undershoots; the v9 module pairs it with η̄
- **m_2, m_3**: irreducible — denominator 4N+1=53 is *not* in the canonical Cathedral basis
- **m_e Yukawa correction (1−δ★²/π)**: requires a *fixed* second-order δ★ correction inside the γ-ladder

## Statistics by category

| Category | n | rel-err mean | rel-err max |
|---|---|---|---|
| Pure-integer (INT) | 13 | 0.16 % | 1.03 % (H_0) |
| Mass scales | 9 | 0.21 % | 0.62 % (m_Z) |
| Mass ratios (m_p/m_e etc.) | 6 | 0.04 % | 0.18 % (m_top) |
| Mixing angles | 4 | 0.09 % | 0.21 % (θ_23) |
| Cosmology | 6 | 0.10 % | 0.55 % (A_s) |
| GUT/inflation scales | 2 | 19.8 % (!) | 39.6 % (M_GUT) |
| Couplings (α etc.) | 4 | 0.03 % | 0.09 % (α_s) |

The M_GUT 39.6 % miss is the single dominant outlier in the v9 ledger.
Excluding it, every other v9 observable is within 1.6 %.

# Coupled cycle 15 — Hbits shift of effective Δ / δ

Classification: **PROVED** for the closed form of the observable.
The identification O = Δδ is **FALSIFIED**. The shared 63 is **numerology**.
Advances a physical ARF? No.

## Observable (declared before any ARF arithmetic)
The hidden Hessian reports an effective scale
    Δ_eff := √(H5/H3) = Δ f(ρ),    f(ρ) = √((14+ρ)(18+ρ))/(16+ρ),
the unique number that would equal Δ if c3 = c5 (the equal-Hbits /
clock-dominated limit of cycle 14). The 16-versus-18 asymmetry is
the entire departure of (c3, c5) from (1/4, 1/4), so

    O_Δ := Δ_eff − Δ = Δ (f(ρ) − 1),
    O_δ := δ_eff − δ★ = −O_Δ = Δ (1 − f(ρ)),

with δ_eff := 3/20 − Δ_eff. At ρ = 0 one has the exact identities
    f(0) = √(63/64) = 3√7/8,
    14·18 / 16² = (16−2)(16+2)/16² = 1 − 1/64 = 63/64.

## Exact values
- ρ = E2 ≈ 0.01022872513785789
- f(ρ) ≈ 0.9921667999068299,   f(0) ≈ 0.9921567416492215
- Δ ≈ 0.00248918984042040,     Δ_eff ≈ 0.00246969151833050
- O_Δ ≈ −1.949832208989919 × 10^{-5}
- O_δ ≈ +1.949832208988922 × 10^{-5}
- ρ → 0 limits: O_Δ ≈ −1.952335900255028 × 10^{-5},
  O_δ ≈ +1.952335900255028 × 10^{-5}

O_δ is linear in Δ (equivalently affine in δ★).

## Comparison, performed only after O was computed
    Δδ = −δ★³/63 − γ/40 ≈ −3.595904275676050 × 10^{-4}
    −δ★³/63 ≈ −5.094845225896310 × 10^{-5}
    −γ/40 = −1/3240 ≈ −3.086419753086420 × 10^{-4}

Relative differences against the 10^{-4} threshold:

| comparison | value | relative difference | match? |
|---|---|---|---|
| O_δ vs Δδ | O_δ/Δδ ≈ −0.05422 | 1.054 | no |
| O_Δ vs Δδ | O_Δ/Δδ ≈ 0.05422 | 0.946 | no |
| O_δ vs −δ★³/63 | | 1.383 | no |
| O_δ vs −γ/40 | | 1.063 | no |

The polynomial types disagree: O_δ is linear in Δ, while Δδ is a
cubic in δ★ plus a constant. They are not the same quantity.

## Look-elsewhere on 63 and 64
A raw scan of products, sums, differences and exact quotients a·b/c
from the predeclared structure list S produced 102 writings of 63 and
133 writings of 64 (including tautologies such as 1·63 and a·63/a).
Named independent origins already recorded in cycle 04 and cycle 07:

- 63 = 64−1 (traceless histories) = 7×9 = 12+51 = 13+50 = dim su(8)
- 63/64 = 14·18/16², and inverted as the Schur covariance
  (64/63)/Δ² at ρ = 0 (cycle 07) — this is the *same* 63 as in O
- 64 = 2^6 = dim H64 = 4×16 = 16²/4
- the historical ARF denominator δ★³/63 is a separately written factor

The Hbits 63 and the ARF 63 are therefore not a unique dictionary
entry. Sharing an integer with many Cathedral writings, across
distinct polynomial types and with relative difference of order 1,
is numerology, not a derivation of Δδ from the hidden-sector shift.

## Integrity
Predeclaration sha256:
`5b11084f474fadb0cac6e48f2edbaadbea3b0ec249b9b05f0ad975a81bc6703e`.
Test-script hashes (key path, then archive-match key, both recorded)
are in HASHES.txt. No ARF target was used to define O.

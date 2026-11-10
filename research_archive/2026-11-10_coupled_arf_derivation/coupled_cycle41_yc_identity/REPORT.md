# Coupled cycle 41 — y_c(η) = Δ √(c5/χ) is an exact identity

Classification: **PROVED** (H1, H2, H3). Advances a physical ARF? No.
No value of y_even was chosen.

## Algebra (H1)

The coupled-line definitions (cycles 14, 18, 33) are

    c_even = Δ² c5
    χ(T) = −Ω_pair(s, T) / s²     (s → 0, unit nuclear-norm ray)
    y_c(T) := √(c_even / χ(T))    whenever χ(T) > 0

Substitution gives the identity

    y_c(T) = Δ √(c5 / χ(T))

at every temperature with a positive pairing bubble, including
T = η and T → 0. The two algebraic writings
√(c_even/χ) and Δ √(c5/χ) differ by 0 in floating point on the
stored ico numbers (c_even − Δ² c5 = 0 exactly in the recorded
binary values).

## Numerics (H2)

Relative error |y_c − Δ √(c5/χ)| / y_c on stored cycle-18/33
values and on a fresh recomputation of χ for the icosahedral
Laplacian (even channel, hat from cycle 18):

| source | y_c | χ | Δ √(c5/χ) | rel |
|---|---:|---:|---:|---:|
| ico, T=η stored | 0.005940144040707988 | 0.038415791436818836 | same | 0 |
| ico, T=0 stored | 0.003845446400083969 | 0.09166640779767476 | same | 0 |
| H13, T=η stored | 0.006011318618427269 | 0.037511483697016956 | same | 1.4×10^{-16} |
| H13, T=0 stored | 0.004185418011108536 | 0.07737952500974643 | same | 0 |
| ico, T=η fresh | 0.005940144040707988 | 0.038415791436818836 | same | 0 |
| ico, T=0 fresh | 0.003845446400083969 | 0.09166640779767476 | same | 0 |

All lie below the predeclared 10^{-12} threshold. The fresh ico
computation also records ||Δ_unit||_F² = 2, consistent with
cycle 33.

## Meaning (H3)

The identity explains why the condensation threshold is small:
Δ = 0.0024891898404204027 and √(c5/χ(η)) = 2.38637646042487
(ico), an O(1) ratio of the hidden kinetic c5 = 0.21876996521511627
to the pairing bubble χ(η) = 0.038415791436818836. So
y_c(η) is of order Δ, not because anyone set y_even = Δ.

It does **not** identify y_even with Δ, Δ² or any other derived
scalar (cycle 22: y_even is FREE). It does not select the
subcritical branch (cycle 37). It is a rewriting of the
definition of the critical Yukawa, not a new dynamical law.

## Integrity

Predeclaration sha256:
`0054edca2048b55d59fb6b0916a3fd86fb2f54a13f4a99c7010bc149e35d3d7a`.
No ARF target was used.

# Coupled cycle 41 predeclaration — is y_c(η) = Δ √(c5/χ) an identity?

Date: 2026-11-10 (Europe/London)

Cycle 37 noted that y_c(η) = Δ √(c5/χ(η)) ≈ 0.005940, so the
condensation threshold is of order Δ. This cycle checks whether that
relation is an exact identity of the coupled-line definitions, and
records what it does and does not mean. No value of y_even is chosen.
No historical ARF is inserted. The `newtons-cathedral` tip remains
read-only at `6bad7b3`.

## Frozen definitions (from cycles 14, 18, 33)

    Δ = 3/20 − 80π/(1053 φ)
    c_even = Δ² c5
    χ(T) = −Ω_pair(s, T) / s²     (quadratic pairing susceptibility
                                   of the unit nuclear-norm ray, s → 0)
    y_c(T) := √(c_even / χ(T))     whenever χ(T) > 0

These are the definitions already used to *compute* the published
y_c numbers; this cycle does not change them.

## Hypotheses

H1. Substituting c_even = Δ² c5 into the definition of y_c gives the
    exact identity y_c(T) = Δ √(c5 / χ(T)) at every T with χ(T) > 0,
    including T = η and the T → 0 limit.
H2. Numerically, |y_c − Δ √(c5/χ)| / y_c < 10^{-12} on the stored
    ico and H13 values from cycles 18/33, and on a fresh
    recomputation of χ(η) and χ(0) for the icosahedral Laplacian.
H3. The identity explains why y_c is O(Δ): c5 is an O(1) hidden
    kinetic and χ(η) is an O(1) pairing bubble, so √(c5/χ) is O(1).
    It does not identify y_even with Δ, nor select the subcritical
    branch (cycles 22 and 37 still stand).

Classification: PROVED if H1–H2 hold algebraically and numerically.
No ARF target is used.

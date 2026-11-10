# Coupled cycle 26 predeclaration — London / Meissner kernel of the spinor lift about its π-flux vacuum

Date: 2026-11-10 (Europe/London)

Alt 33 constructed the 24-dimensional geometric spinor (vertex12 ⊗ 2)
with SU(2) parallel-transport kinetics and pairing Δ_spatial ⊗ ε.
Alt 34 found that this completion also selects the all-π connection
(Ω(π) − Ω(0) = −8.506 at T = 0; the lowest doublet rises from 0.747
to 9.253). This cycle expands the gauge-invariant transverse kernel
around that spinor π-flux + 4_5 condensate vacuum. It does not add
the spinor as a second species on top of cycle 25; it is an
alternative completion of the same 12 vertices.

Frozen ingredients, used as named inputs, not fitted:

    the spin Laplacian and Δ ⊗ ε of alt 33
    r-scan: {r_*/10, r_*} with r_* the archived alt-33 minimum
            at y_even = 1, plus the moderate slice r = 100
    T ∈ {0, η}
    the same cycle-space projector, Δ1_T, Goldstone U(1) (one phase
    per vertex, both spin components), Maxwell tests, α_eff rule,
    look-elsewhere ensemble E, match threshold 10^{-4}, and R_α
    writing as in the cycle-25 predeclaration

Dressing: (Δ_spin)_{iα,jβ}[θ] = (Δ_spatial)_{ij} ε_{αβ} exp(i(θ_i+θ_j)).
Magnetic gauge convention unchanged. No tree |D_A Δ|². No ARF is
inserted into Ω.

## Observables, in this order

1. Background spectrum at A_π, θ = 0: E_min (alt 34: ≈ 9.253) and
   the grouped positive BdG levels.
2. Gauge invariance and the longitudinal Ward identity about A_π.
3. Unitary-gauge Π_T at each (r, T), ε = 0.02, with an ε = 0.05
   control at (r_*, T = 0).
4. The same positive-definite / identity-like / Maxwell-like /
   unique / finite / all-positive tests as cycle 25.
5. y_even dependence by the r-scan, with the same 0.05 relative
   criterion on c_I(r_*) versus c_I(r_*/10).

Control: at A = 0, r = r_*, T = 0 the same code must recover the
alt-34 spinor identity Π_T ≈ −0.141771 I (relative 0.15).

## Predeclared α_eff comparison

Identical rule to cycle 25, applied independently to this
completion: α_eff = 1/κ_iso and α_REM = 1/κ_REM are compared to
R_α = 3/(64 φ) + 1/(79 φ²) only if, at (r_*, T = η) or failing
that at (r_*, T = 0), Π_T is positive definite, Maxwell-like,
unique, finite and all-positive. Otherwise 1/κ is not compared
and no rewriting of Π_T is promoted after the fact. Look-elsewhere
ensemble E and the 10^{-4} threshold are those of cycle 25.

## Hypotheses

H1. Around the spinor π-flux vacuum, Π_T is positive definite at
    T = 0 and at T = η in the large-vev slice.
H2. Whether that kernel is Maxwell-like is not assumed; the
    cycle-25 tests decide if α_eff is compared.
H3. In the large-vev limit the leading kernel depends on y_even
    only through pairing corrections that vanish as 1/ye².
H4. The longitudinal Ward identity holds about A_π.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
hypotheses and the predeclared tests. No ARF target enters Ω or Π.

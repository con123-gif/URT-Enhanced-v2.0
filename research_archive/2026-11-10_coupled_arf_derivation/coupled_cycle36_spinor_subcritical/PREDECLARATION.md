# Coupled cycle 36 predeclaration — spinor-lifted subcritical kernel at T = η

Date: 2026-11-10 (Europe/London)

Repeat cycle 32’s subcritical analysis for the 2I spinor lift of
alt 33 / cycle 26, at r = 0 and T = η. The alt line’s C3
metastable work (flux stability, spinor spectrum of the C3 state,
handedness) is not duplicated.

Frozen ingredients, used as named inputs, not fitted:

    φ = (1+√5)/2,   δ★ = 80π/(1053 φ),   Δ = 3/20 − δ★,   η = −ln Δ
    spinor magnetic Laplacian of cycle 26:
        K_spin[A] = magnetic_spin(edges, A, Uij)
        with Uij = SU(2) parallel transport along each edge
    Nambu Ω of cycle 26 (24-component spectrum of K_spin at r = 0)
    cycle-space projector and Δ1 of cycles 25–32
    no pairing (Δ ≡ 0); no tree |D_A Δ|²; κ_ext = 0

## Observables, in this order

1. Spectrum of K_spin at A = 0 and at A_π = π·1_30: E_min
   (expected ≈ 0.746746 at A = 0, the archived spinor gap) and
   grouped positive levels. There is no unpaired zero at A = 0.
2. T = 0 identity: if K_spin[A] ⪰ 0 and Tr K_spin[A] is
   A-independent, then Ω_f is flat at T = 0. Verify on A = 0,
   A = π, 24 random connections and 4 gradients
   (max |Ω| < 10^{-12}, max |Tr − Tr_0| < 10^{-10}).
3. Finite-T flux vacuum at T = η: Ω_f(A) − Ω_f(0) at A = 0,
   A = π, and N = 40 random connections (seed 36). The derived
   vacuum is the minimiser among those points. Gradients must
   give ΔΩ = 0.
4. Gauge invariance (automatic at r = 0) and the transverse
   Hessian Π_T about A ∈ {0, π} at T = 0 and T = η, with
   ε = 0.02 and a control ε = 0.05 at the derived T = η vacuum.
5. Diagnostics of Π_T, copied from cycle 25 / 32 and not adjusted:
   positive-definite, identity-like, Maxwell-like, unique,
   κ_iso, κ_REM, and the cycle-29 projection
   Π_T = m² I + κ Δ1_T + β Δ1_T² + R.
6. y_even independence: at r = 0 the kernel does not depend on
   y_even.

## α_eff comparison

Cycle 35 predeclares whether the archive supplies a unique map
from Π_T to (κ_IR, α_eff). That comparison is performed here if
and only if cycle 35 found such a unique rule, using exactly the
formula hashed there, at the derived T = η spinor vacuum, and
only if Π_T is positive definite. If cycle 35 found no unique
rule, no comparison is performed and no candidate α_eff is
published. No alternative rewriting of Π_T is promoted after
the fact.

The C3 metastable condensed spectrum, its flux stability and any
handedness of the spinor holonomy are alt-line work and are not
computed here.

## Hypotheses

H1. At T = 0 and r = 0, Ω_f is flat in A (Tr K_spin constant and
    K_spin ⪰ 0) and Π_T = 0 up to finite-difference roundoff.
H2. At T = η a definite flux vacuum exists among {A = 0, A = π}
    and the random sample (the sign of ΔΩ(π)−ΔΩ(0) is not guessed).
H3. About that T = η vacuum the geometric U(1) is unbroken
    (r = 0) and Π_T is the vacuum polarisation of the gapped
    spinor kinetic modes.
H4. If cycle 35 supplies no unique κ_IR rule, α_eff is not
    compared. If it does, the hashed conversion is applied once.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
hypotheses and the predeclared tests. No ARF target enters Ω or Π.

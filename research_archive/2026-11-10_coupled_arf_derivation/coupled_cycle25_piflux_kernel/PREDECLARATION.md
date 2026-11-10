# Coupled cycle 25 predeclaration — London / Meissner kernel around the π-flux + 4_5 vacuum

Date: 2026-11-10 (Europe/London)

The negative transverse kernel at A = 0 (cycle 23 / alt 29 / alt 34) is
the unpaired charged fermion. Alt 31–35 identified the derived vacuum
of the archived one-loop action (κ_ext = 0) as the all-π connection,
where that mode is lifted to E = 10. This cycle expands the
gauge-invariant (Goldstone-compensated / unitary-gauge transverse)
kernel around that vacuum, not around A = 0.

Frozen ingredients, used as named inputs, not fitted:

    φ = (1+√5)/2,   δ★ = 80π/(1053 φ),   Δ = 3/20 − δ★,   η = −ln Δ
    even unit pairing = cycle-18 even_hat (agrees with alt-25 4_5 hat)
    r-scan: {20, 100, r_*} with r_* the archived alt-25 numerical
            minimum at y_even = 1 (the physical large-vev slice)
    graph magnetic Laplacian and Nambu Ω of cycles 18 and 23
    cycle-space projector and Δ1 = d0 d0^T + d1^T d1 of alt 34
    Goldstone dressing Δ_ij[θ] = |Δ_ij| exp(i(θ_i+θ_j))
    magnetic gauge convention A_e → A_e + λ_i − λ_j = −(d0 λ)_e

No tree-level |D_A Δ|² is added. No historical ARF is inserted into Ω.

## Observables, in this order

1. Background spectrum at A_π = π·1_30, θ = 0: E_min (expected 10)
   and the grouped positive BdG levels.
2. Gauge invariance around the background:
   Ω(A_π − d0 λ, −λ) = Ω(A_π, 0), and the directional Hessian of Ω
   along every gauge orbit (the longitudinal Ward identity).
3. Unitary-gauge transverse Hessian Π_T (19×19) of Ω(A_π + a, θ = 0)
   at T = 0 and T = η, for each r in the scan. Finite-difference
   steps ε = 0.02 and a control ε = 0.05 at (r_*, T = 0).
4. Diagnostics of Π_T, copied from alt 34 and not adjusted afterwards:
   - positive-definite iff λ_min(Π_T) > 10^{-10}
   - identity-like iff ||Π_T − c_I I||_F / ||Π_T||_F < 0.10,
     c_I = Tr(Π_T)/19
   - Maxwell-like iff ||Π_T − κ_iso Δ1_T||_F / ||Π_T||_F < 0.10,
     κ_iso = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F²
   - unique iff the relative spread of generalised eigenvalues of
     Π_T v = κ Δ1_T v is < 0.05
   - κ_REM = λ_min(Π_T) / λ_min(Δ1_T)
   A derived Maxwell coefficient exists only if Π_T is positive
   definite, Maxwell-like, unique, finite (|κ_i| < 10^{10}) and
   every κ_i > 0, at a given (r, T).
5. y_even dependence: because r_* ∝ y_even in the large-vev formula
   r/y_even = N / (4 c_even), the r-scan is a ye-scan. The leading
   kernel is “independent of ye in the large-vev limit” when
   |c_I(r_*) − c_I(r=100)| / max(|c_I(r_*)|, 10^{-30}) < 0.05
   at both temperatures (subleading pairing pieces vanish as 1/E_pair
   ∝ 1/ye²). Ratios of Π_T eigenvalues are recorded at each r.

Control (not a new claim): the same code at A = 0, r = r_*, T = 0
must recover the alt-34 identity Π_T ≈ −I/12 (relative 0.15).

## Predeclared α_eff comparison (recorded before any number is computed)

R_α = 3/(64 φ) + 1/(79 φ²) is the comparison target named by the user.

    α_eff := 1 / κ_iso
    α_REM := 1 / κ_REM

These are compared to R_α only when, at the physical slice
(r, T) = (r_*, T = η) or, if that slice fails the tests but
(r_*, T = 0) passes them, at (r_*, T = 0), the tests of item 4
all succeed. If they fail (negative, non-unique, not Maxwell-like,
or not positive definite), 1/κ is not an electromagnetic coupling
and is not compared. No alternative algebraic rewriting of Π_T
(for example +1/12, +1/48, or a ratio of traces against a different
operator) is promoted after the fact.

When a comparison is performed:

- relative error |α_eff − R_α| / R_α, and the same for α_REM;
- a numerical match is declared only if that error is below 10^{-4}
  (the threshold of cycles 05, 15 and alt 23 / 35);
- look-elsewhere ensemble, also predeclared, independent of the
  measured κ:
      S = {1,2,3,4,5,6,7,8,9,12,13,14,15,16,18,20,24,30,32,35,40,
           50,51,63,64,79,80,81,90,105,190}
      E = { n / (m φ^k) : n, m ∈ S, m ≠ 0, k ∈ {0,1,2} }
  Report (i) how many elements of E satisfy |x − R_α| / R_α < 10^{-4}
  (the elsewhere density of the target) and (ii) how many satisfy
  |x − α_eff| / |α_eff| < 10^{-4} (the elsewhere density of the
  derived number). A match at 10^{-4} is a coincidence unless it is
  an identity.

## Hypotheses

H1. At T = 0 and large vev, Π_T is positive definite and identity-like
    with c_I → +1/12 (the sign-reversed unpaired-mode polarisation,
    now evaluated at E = 10 rather than E = 0).
H2. Π_T is not Maxwell-like and the generalised κ_i are not unique,
    so α_eff is not compared to R_α.
H3. In the large-vev limit the leading kernel is independent of
    y_even; pairing corrections vanish as 1/ye².
H4. The longitudinal Ward identity continues to hold about A_π.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
hypotheses and the predeclared tests. No ARF target enters Ω or Π.

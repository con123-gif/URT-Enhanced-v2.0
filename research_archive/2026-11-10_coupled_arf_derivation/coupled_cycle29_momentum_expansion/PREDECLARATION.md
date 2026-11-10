# Coupled cycle 29 predeclaration — momentum expansion of the π-flux kernel

Date: 2026-11-10 (Europe/London)

Cycle 25 found that the gauge-invariant transverse kernel about the
π-flux + 4_5 vacuum is, at large vev, a positive multiple of the
identity and not a multiple of Δ1_T. This cycle decomposes that
kernel by a *canonical* (Frobenius) orthogonal projection, with no
parameter fitted to any ARF target:

    Π_T = m² I + κ Δ1_T + β Δ1_T² + R,
    R ⊥ span{ I,  Δ1_T,  Δ1_T² }.

The three-dimensional span is that of {I, Δ1_T, Δ1_T²}; the
displayed Maxwell-adjacent coefficients are the unique minimisers
of ||Π_T − m² I − κ Δ1_T − β Δ1_T²||_F. A two-dimensional
projection onto span{I, Δ1_T} is recorded as a control (κ_2, m²_2).

Frozen ingredients: the cycle-25 kernel construction (same even
hat, r-scan {20, 100, r_*} with r_* the archived alt-25 minimum
at y_even = 1, T ∈ {0, η}, A_π = π·1_30, unitary-gauge transverse
Hessian, Δ1 = d0 d0^T + d1^T d1, cycle-space projector). Finite-
difference ε = 0.02.

## Diagnostics, recorded before any comparison

D1. Residual of the 3-projection: ρ_3 = ||R||_F / ||Π_T||_F.
D2. Weight of the Δ1² piece: w_β = |β| ||Δ1_T²||_F / ||Π_T||_F.
D3. Weight of the Maxwell piece: w_κ = |κ| ||Δ1_T||_F / ||Π_T||_F.
D4. Weight of the mass piece: w_m = |m²| ||I||_F / ||Π_T||_F.
D5. Agreement of the 2- and 3-parameter Maxwell coefficients:
    rel_κ = |κ − κ_2| / max(|κ|, |κ_2|, 10^{-30}).
D6. y_even independence in the large-vev limit: the r-scan is a
    ye-scan as in cycle 25. The pair (m², κ) is “independent of
    ye at large vev” when both
        |m²(r_*) − m²(r=100)| / max(|m²(r_*)|, 10^{-30}) < 0.05
    and the same relative test on κ fail-soft (if both |κ| are
    below 10^{-8} they are reported as jointly consistent with 0).

κ is a unique positive Maxwell coefficient, at a given (r, T), only
if all of the following hold:

    (U1) ρ_3 < 0.10
    (U2) w_β < 0.10          (no need for Δ1²)
    (U3) w_κ > 0.10          (the Δ1_T piece is substantial)
    (U4) rel_κ < 0.05        (2- and 3-parameter κ agree)
    (U5) κ is finite and κ > 0

These thresholds match the Maxwell-likeness cut of cycles 25 / alt
34–35 (residual 0.10) and do not use R_α.

## Predeclared α_eff comparison

R_α = 3/(64 φ) + 1/(79 φ²) is the comparison target named by the user.

    α_eff := 1 / κ
    α_2   := 1 / κ_2

are compared to R_α only when, at (r_*, T = η) or, failing that, at
(r_*, T = 0), the tests (U1)–(U5) all succeed. If they fail
(in particular if κ is consistent with 0, or is not unique, or is
not positive), 1/κ is not an electromagnetic coupling and is not
compared. No alternative rewriting of m² (for example 1/12 or
1/48) is promoted after the fact as an α.

When a comparison is performed, relative error |α_eff − R_α| / R_α
is reported with the threshold 10^{-4} of cycles 05, 15, 25 and
alt 35, and the same look-elsewhere ensemble

    S = {1,2,3,4,5,6,7,8,9,12,13,14,15,16,18,20,24,30,32,35,40,
         50,51,63,64,79,80,81,90,105,190}
    E = { n / (m φ^k) : n, m ∈ S, m ≠ 0, k ∈ {0,1,2} }

is counted for hits within 10^{-4} of R_α and of α_eff. A match at
10^{-4} is a coincidence unless it is an identity.

## Hypotheses

H1. At the large-vev slice (r_*, T = 0) one has m² → +1/12, with
    κ and β consistent with 0 and ρ_3 ≪ 0.10 (the cycle-25
    identity kernel, now decomposed rather than only compared to I
    or to Δ1_T).
H2. Consequently (U3) or (U5) fails and α_eff is not compared.
H3. In the large-vev limit the leading coefficient m² is
    independent of y_even; κ stays consistent with 0.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN.
No ARF target enters the projection.

# Candidate 1, minimal form: electromagnetism induced on the icosahedron by the native vertex field (2026-11-11)

Status: CONDITIONAL (declared choice) / numerical certificate with analytic Hessian — negative for α. Certificate:
`CANDIDATE1_INDUCED_EM_ICOSAHEDRON_2026_11_11.py` (check `research.candidate1_induced_em_icosahedron`); executed in Claude's
sandbox. Proposed to Con as one of three possible new ingredients (log, 2026-11-11); computed in its minimal form before his
choice so that the choice is informed.

**Choice.** The native icosahedral vertex cochains (kinetic term b₁b₁ᵀ) carry unit charge under compact edge phases (Peierls);
they live on the native 24-clock (r = π/e, golden twist), so clock mode m adds mass r²(2 − 2cos(2πm/24 + θ)). Cbridge is
dropped because it is not covariant under vertex phases. No bare photon term: Γ(A) = Σ_m log det(L(A) + r²λ_m); flat links
are its minimum (diamagnetic inequality; checked: physical Hessian positive definite).

**Pre-registered observable.** κ₃ = Π/M on the softest Maxwell triplet (M = 3 − √5), the A5 vector and the only SU(2)-typed
photon channel (Q23), reported as 4πκ₃. On a 2D surface e² is a lattice number, not a 4D α.

**Results.** Ward identity Π d₀ = 0 to 3e-12. Π is exactly diagonal on the five Maxwell levels (A5 and parity) and nearly
constant across them: 69.955 (3), 70.413 (5), 70.614 (4₃), 70.882 (4₅), 70.911 (3′). The induced kernel is dominated by the
diamagnetic contact term, not proportional to M: best single coupling κ = 17.68 with residual 45.5 %.
**κ₃ = 91.5722, 4πκ₃ = 1150.73.** No reading of this as α⁻¹ = 137.036 is made or available without a further choice.

**Consequence.** Candidate 1 in minimal form does not give a Maxwell photon or α. Variants (fermionic vertex matter, all five
solids through a gauge-covariant bridge, a 4D completion) are further choices, not consequences.

## 4D extension: the golden twist is not a vacuum (`CANDIDATE1_4D_HOLONOMY_INSTABILITY_2026_11_11.py`)
On the 4D complex of Q25 (13-cell × 24-clock) the photon has temporal components, and the native clock link phases are those
components, so the uniform clock phase θ is dynamical. The bosonic induced action Γ(θ) = Σ_m log det(L₁₃ + r²(2 − 2cos(2πm/24 + θ)))
has period 2π/24 and diverges like 2 log|θ − 2πk/24| at θ = 2πk/24, where a clock mode makes the vertex field massless (L₁₃ has
an exact zero mode). It is unbounded below; the golden value is not a minimum (Γ(0.5) < Γ(golden)) and sits 0.0438 rad from the
singular point k = 9. So candidate 1 has no 4D vacuum without a gauge-covariant mass term, which the native action does not supply
(Cbridge is not covariant under vertex phases). This sharpens the archived "the source-free Gaussian clock determinant does not
select the golden phase".

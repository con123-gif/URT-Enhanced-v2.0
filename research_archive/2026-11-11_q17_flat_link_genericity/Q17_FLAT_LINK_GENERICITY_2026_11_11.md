# Q17 — the flat-link instability of the v61 induced action is generic in (r, M, c_t) (2026-11-11)

Status: VERIFIED-ARCHIVE extension (numerical certificate) — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Certificate: `Q17_FLAT_LINK_GENERICITY_2026_11_11.py` (compute job `q17-flat-link-genericity`, 12 min); executed in Claude's
sandbox. Independent of the archived kernel code: own Wilson builder (required to equal the v61 operator exactly at the
archived point; difference 0.0) and Hessian from central differences of the analytic gradient, projected off the 47 gauge
directions.

Parameters: spatial hops (±γ_d − r)/2, temporal-diagonal hops c_t(±γ₀ − 1), onsite 3r + 16c_t (the archived 3r + 1 at
c_t = 1/16, keeping the Wilson structure). Grid r ∈ {0.2, 0.3, R_EXACT, 0.45, 0.6, 1.0}, M ∈ {0.3, 0.6, M_EXACT, 1.0, 1.4},
c_t ∈ {1/32, 1/16, 1/8, 1/4}: 120 points.

Results.
- Archived point reproduced: 72 unstable, 409 stable physical modes, gap 0.8256.
- H is singular (zero mode) at 2 points, (0.2, 1.4, 1/16) and (0.45, 1.4, 1/32); excluded.
- **All 118 nonsingular points have unstable flat links.** For c_t ≥ 1/16 the count is 72 at every point except two (69).
  Counts other than 72 (18, 36, 63, 69, 84, 90, 114) occur only at c_t = 1/32 with large M or r, and at c_t = 1/16, r = 1.
Consequence: "flat links are not a vacuum" (2026-11-10_induced_photon) is not an artefact of the archived (r, M, 1/16); the
72-mode instability is a robust plateau.

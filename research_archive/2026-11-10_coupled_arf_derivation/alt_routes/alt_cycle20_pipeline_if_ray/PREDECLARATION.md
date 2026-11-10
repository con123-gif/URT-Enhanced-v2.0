# Predeclaration — alt_cycle20: one-loop observable pipeline only if cycle 16 derives a ray

Date: 2026-11-10 (Europe/London)
Route: (20) If alt_cycle16 picks a Yukawa ray (classifies the pure 3⊗5 → 4_3 ray as derived from the coupled path integral, PROVED or a derivation-grade CONDITIONAL), run the one-loop observable pipeline of alt_cycle15 on that ray. If cycle 16 does not pick a ray, do not select one by hand and do not compare any number to the four historical ARFs.

## Policy
P1. Read alt_cycle16/results.json. The ray is “picked” only if that file sets `pure_alpha_ray_derived` to true.
P2. If the ray is not picked, the pipeline is skipped: no masses, no residues, no electromagnetic ratio, no ARF comparison.
P3. Independently of P1, the A5 mass pattern (1, 1, 3, 3, 5) with massless singlets still cannot give three distinct lepton masses (alt_cycle18), so even a picked ray would not be reported as a lepton-mass derivation.

## Hypotheses
H1. Cycle 16 does not set `pure_alpha_ray_derived` to true, because the path integral does not supply the log-det variational principle (the content of cycle 16’s H6).
H2. Therefore no ARF comparison is performed in this cycle.

## Integrity
No ARF target is inserted. No hand-picked ray. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

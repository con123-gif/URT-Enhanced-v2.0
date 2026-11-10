# Coupled cycle 10 — Noether identification of currents and Yukawas

Classification: **PROVED**. Surviving dimension: **2** (not a ray).
Advances a physical ARF? No. One-loop / EM / ARF comparison was not run.

## Question
Require the 4-dimensional Ward-surviving current of cycle 06 to be the
variational (Noether) derivative of a single H13 hopping action built on
the unique Hodge kinetic ray of alt_cycle02, together with the four
inversion-allowed Yukawas of alt_cycle05. Are currents and Yukawas
identified or reduced, and what is the surviving dimension?

## Result
Currents and Yukawas are identified on a 2-dimensional space and reduced
from 4 to 2. The surviving dimension is 2, not a ray.

The Hodge hopping action on geometric H13 (12 spokes + 30 surface edges,
unit weight) is the unique A5-invariant ray of alt_cycle02 (eigenvalues
0, 13, 6±√5, 7; overall scale free). Its U(1) Noether current j_K is a
unique charge-0 vector current and does not constrain the charge-+2
pairing sector.

None of the four CG 4-spaces in Sym²(ℂ¹²) is strictly supported on
icosahedral edges (adjacent residuals of order 0.05–0.25). Their
adjacent projections P_A are nevertheless injective, with exact singular
values

- 3⊗5 → 4₃ : √((5+2√5)/10) ≈ 0.973248989467730
- 3'⊗5 → 4₃ : √((5−2√5)/10) ≈ 0.229752920547361
- ratio (3⊗5)/(3'⊗5) = 2+√5
- 3⊗3' → 4₅ and Sym²(5) → 4₅ : both 1/√2

The two odd channels project onto one and the same odd adjacent 4, and
the two even channels project onto one and the same even adjacent 4
(image dimensions 4+4=4 and 4+4=4; all four together span the full
8-dimensional 4-isotype of the 30 edges, which splits as 4_odd ⊕ 4_even
under inversion). The map Φ from the four inversion-allowed Yukawas to
hopping pairing-currents therefore has rank 2 and kernel 2.

Handedness 3 versus 3' is not residual after hopping: those two Yukawas
become parallel Noether currents (the unique odd adjacent 4, coupling
only to hidden 4₃). The residual ambiguity is odd versus even, i.e.
coupling to 4₃ versus 4₅.

The cycle-06 space Hom(4₃⊕4₅, ker div) is 4-dimensional if maps need
not commute with inversion. Imposing inversion covariance (already used
on the Yukawas) cuts it to 2, matching rank(Φ). The 4 Yukawas are thus
identified with the 2-dimensional inversion-covariant hopping current
space and reduced 4 → 2.

## Counterexample seed
The two surviving currents — the unique odd adjacent pairing-current
(to 4₃) and the unique even adjacent pairing-current (to 4₅) — are an
explicit pair of inequivalent hopping actions. Cycle 11 expands this
pair and names the minimal additional principle that would cut 2 → 1.

## Integrity
Predeclaration sha256:
`eb479c7aad82beed4089195d8b215a2d8df37b41b0ffa30d3b8346d4a2cc3837`.
Test script first hash (strict-containment only)
`cfee095a3d38db664e2684ab8b75dd75b7b87b03f77597c0cf7ad30541064404`,
then corrected to also compute rank(Φ)
`5134bd7b79897515b8f826464700a7279f5ae7d3f7951b129cfc0c32c5d32baa`.
No ARF target was used.

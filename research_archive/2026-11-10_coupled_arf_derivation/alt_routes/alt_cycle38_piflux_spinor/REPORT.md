# Report — alt_cycle38: π-flux combined with the spinor lift

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `41506a6dadd257d348b398a30a09aada123762e61d915c31ec2e8b2a8da743a8`

## Question
Does the combined connection (spinor holonomy of trace 2 cos(π/10) times the π-flux factor −1 per face) break residual A4 and split the pairing multiplets into nondegenerate singlets? What is the fermion-only vacuum of the combined system?

## Holonomy
On every one of the 20 triangular faces:
- at A = 0 the spinor holonomy trace is +2 cos(π/10) = +1.902113032590307;
- at A ≡ π the combined trace is −2 cos(π/10) = −1.902113032590307 (imaginary part 6.9×10^{-16}).

The π-flux factor is (−1)^3 = −1 on each triangle, as predeclared.

## Stabiliser
- Combined holonomy pattern: stabiliser A5 (order 60). All 60 rotations map the pattern to a conjugate.
- Pairing condensate Δ: stabiliser A4 (order 12).
- Combined (Δ, holonomy): A4 (order 12). Not ℤ3, not ℤ2, not a chiral T.
- All traces are real, so time reversal does not pick a U(1) handedness (π ≡ −π on every edge, and U equals U*).

Adding π-flux therefore does not reduce the A4 already selected by the condensate at A = 0.

## Spectrum
Positive BdG energies grouped at relative 10^{-5}:

A = 0 (cycle-33 pattern, reproduced): 2 ⊕ 6 ⊕ 12 ⊕ 4, with E_min = 0.746746 (the K_spin gap).
Levels: 0.746746 × 2, 633507.653 × 6, 708283.088 × 12, 950261.479 × 4.

A ≡ π (derived vacuum): still 2 ⊕ 6 ⊕ 12 ⊕ 4, with the lowest 2 lifted from 0.746746 to 9.253254. The three large pairing levels are unchanged at this precision.
Levels: 9.253254 × 2, 633507.653 × 6, 708283.088 × 12, 950261.479 × 4.

No positive singlets. Not three nondegenerate charged singlets. C_mass and R_mass were not compared (predeclared: this route does not compare mass ARFs).

## Derived vacuum (fermion-only, as in alt34)
Ω(π) − Ω(0):
- T = 0: −8.506450 (matches the cycle-34 spinor Hessian prediction);
- T = η: −3.240247.

Three random connections all lie between A = 0 and A = π (T = 0 gains −3.06, −4.60, −4.13 versus A = 0; T = η gains −0.58, −1.14, −0.94). The fermion-only vacuum is the π-flux phase. The cycle-34 spinor transverse Hessian was already all-negative, so this is not a new instability: it is the same derived vacuum, now with the pairing condensate present.

No ARF target was inserted. No Higgs kinetic or Maxwell term was added. No repository files were modified, committed, or pushed.

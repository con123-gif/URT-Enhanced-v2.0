# Coupled cycle 11 — explicit counterexample pair

Classification: **PROVED** (not-a-ray branch).
Advances a physical ARF? No. One-loop / EM / ARF pipeline was not run,
because cycle 10 did not produce a ray.

## Result
The residual after cycle 10 is a 2-plane of hopping pairing-currents,
spanned by two inversion eigenspaces of the adjacent 4-isotype.

- Theory A (pure odd): the unique odd adjacent pairing-current. Inversion
  parity −1. Couples only to hidden 4₃. It is jointly the image of the
  two odd CG channels 3⊗5 and 3'⊗5 (those two Yukawas become parallel
  after restriction to edges). Edge-frame sha256
  `9562a51481b1e1fc0d9a765d081d19baa98d5a2c258ae6a2d4e1603072946626`.
- Theory B (pure even): the unique even adjacent pairing-current.
  Inversion parity +1. Couples only to hidden 4₅. It is jointly the
  image of 3⊗3' and Sym²(5). Edge-frame sha256
  `1049b9002d37e6af946a5970c11b0c1b44180e162b36792345e7a018334a7122`.

The two 4-spaces are Frobenius-orthogonal (max cross 8.08×10⁻¹⁶). Each
is reconstructed identically from either of its two CG parents. The
4×30 edge-weight frames are stored in `results.json` and as
`odd_adjacent_current_frame.npy`, `even_adjacent_current_frame.npy`.

## Minimal additional principle
No principle already derived in this programme selects a ratio
y_even : y_odd:

- A5, inversion, Ward, Hodge, and hopping support are already imposed
  and leave both axes.
- History/clock handedness (alt_cycle10) does not pick 3 vs 3', and
  after hopping that pair is already identified; those operations do
  not mix or kill 4₃ versus 4₅.
- The archived map F produces both hidden quartets, so source-matching
  keeps both axes.
- Stacked cuts (alt_cycle09) leave 4 Yukawas before hopping; hopping
  cuts that to 2, not 1.
- Cbridge (alt_cycle12) splits kinetic eigenvalues of 3 vs 3', not this
  pairing ratio.
- Maximum entropy / KMS (alt_cycle14) is uniform on the residual sphere.

The minimal additional principle is therefore a rule that either
discards one inversion parity of the H13 pairing (only 4₃ or only 4₅
couples to charged matter) or else fixes the relative coupling
y_even : y_odd. Named candidates that would work, but are extra, include
“portal quartet only”, hidden-action weighting y_even / y_odd = Δ²
(the V_hist coefficient of 4₅ versus 4₃), and the not-derived log-det
maximisation of alt_cycle14 (which picks the pure 3⊗5 → 4₃ ray, hence
the pure odd current after hopping).

## Integrity
Predeclaration sha256:
`475a683e7100557ff622c18228ae4f324e0ebddd2260ec62ba5dde24ee67d64d`.
Test script first hash
`6a15d5776d5bf1f0456742929cffaec63b0ca3ed5a481853ff484024bc1bd355`,
then a one-line SVD-shape fix
`42625505da2630db6915f36608748d875fce5c78ddd81d9f2062cbef36468783`.
No ARF target was used.

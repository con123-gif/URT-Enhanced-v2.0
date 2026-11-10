# Coupled cycle 16 — Galois covariance of the coupled action

Classification: **PROVED** for G1–G5.
The claim that Galois covariance selects a ray or forces one Yukawa
to zero is **FALSIFIED**. Surviving dimension: **2**.
Advances a physical ARF? No.

## Representation-theoretic covariance (G1–G4)
The Hodge spectrum {0, 13, 6±√5, 7} is invariant as a set under
√5 → −√5. The swap 3 ↔ 3' exchanges λ_3 = 6−√5 ≈ 3.76393 with
λ_{3'} = 6+√5 ≈ 8.23607 and restores the labels, so the Hodge
kinetic is Galois-covariant. The 5A characters φ and φ̄ on the two
3-spaces swap, matching cycle 10.

The hopping singular values transform in the same way:
√((5+2√5)/10) ≈ 0.973249 and √((5−2√5)/10) ≈ 0.229753 swap, with
ratio 2+√5 → 2−√5 = −1/(2+√5); the two even values 1/√2 are fixed.
After hopping (cycle 10) the two odd CG maps already share one
adjacent 4 (to 4_3) and the two even maps share one adjacent 4
(to 4_5). Those two image currents are Galois-even, so the residual
coefficients y_odd and y_even are Galois singlets.

A Galois-odd coupling would have to vanish. Neither residual Yukawa
is odd, so invariance holds for every pair (y_odd, y_even): it does
not force either to zero and does not impose a relation
y_even = f(y_odd). The two hidden quartets are copies of the unique
real 4 of A5, distinguished by rational Hbits eigenvalues 18 versus
16 and by inversion parity; they do not swap under √5 → −√5.

The optional extra “identify 3 with 3' by hand” of alt_cycle05 would
have equated the two odd Yukawas (4 → 3 parameters). Hopping has
already identified those two maps, so that step is redundant and
still leaves the even/odd 2-plane.

## Frozen inputs are not Galois-even (G5)
Under √5 → −√5,
- φ ≈ 1.618034 → φ̄ ≈ −0.618034
- δ★ ≈ 0.147511 → 80π/(1053 φ̄) ≈ −0.386188
- Δ ≈ 0.002489 → 3/20 − δ★_gal ≈ 0.536188
- λ_18 ≈ 0.0076579 → 4 sin²(π(9+4√5)/4) ≈ 3.992342
- ρ ≈ 0.010229 → 5.332594
- c3 ≈ 0.222238 → 0.228571,   c5 ≈ 0.218770 → 0.226562

c3 does not map to c5. This is a property of the named constants,
not a constraint on r. Replacing them by Galois-even combinations
would change the frozen inputs and is not done. It would still not
mix y_even with y_odd, because 4_3 and 4_5 do not swap.

## Integrity
Predeclaration sha256:
`a0e421e27ca35530ecfa292cb28b5049301bbcb1d3b6f2d91071242997d0bbd9`.
Test-script hashes are in HASHES.txt (a JSON serialisation helper
was added after the first run). No ARF target was used.

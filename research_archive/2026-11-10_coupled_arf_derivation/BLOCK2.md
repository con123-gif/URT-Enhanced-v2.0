# Coupled block 2 — cycles 06–09 and alternative routes

Date: 10 November 2026 (Europe/London).

## Coupled cycle 06. Unique charged 90-edge current?

**PROVED obstruction, dimension 4.**
`Hom_A5(4_3 ⊕ 4_5, ker(div)_ico) = 4`. The same 4 is the space of
H13-adjacent Sym² or Λ² pairings on the 30 icosahedral edges. Dodecahedral
conserved currents contain no 4 (Hom = 0). Tetrahedron, cube and octahedron
carry no geometric A5 in the 190-complex. No unique current.

## Coupled cycle 07. Origin of the printed V coefficients?

**OPEN.** The digits `0.490435304391` / `4.16132699108e-7` /
`1.961741217564` do not occur in any of the 650 commits of the only
branch (`newtons-cathedral`), nor in Colab notebooks or `drive_archive`.
`alt_cycle08` only reuses the same user-supplied figures.

## Coupled cycle 08. A canonical history response?

**CONDITIONAL.** Every linear average of portal Hessians — uniform over
64, even and odd KMS extremes, each of the four A5-orbits, and the ρ★
reweighting — has ratios `(0, 0, 0, 1, 1, 1, 1, 1)`. The `Hbits` ground
space is two-dimensional but the whole simplex shares this ratio tuple.
The scale is orbit-dependent. Averaging the 64 individual ratio tuples
instead gives `(0, 0, 0, 0, 3/32, 9/16, 27/32, 1)`, and the Hessian at
the mean configuration vanishes. The linear average is distinguished but
not the only natural construction.

## Coupled cycle 09. Is 3/20 − E1 = δ★?

**FALSIFIED.** Exact form
`E1 = 4 (π/e)² sin²(π(9 − 4√5)/8)`.
The comparison `3/20 − E1 ≈ δ★` is identical to `E1 ≈ Δ`. High precision
(80 and 120 decimals) gives a stable difference
`Δ − E1 = −6.9216534860627 × 10^{-5}`
(relative 0.04692 % versus δ★, 2.781 % versus Δ). Not an identity.

## Alternative routes (integrated from `/workspace/arf_research/alt_cycleNN_*`)

None of the eight alternative routes derives an ARF. Sharpened obstructions,
quoted from `LEDGER_ALT.md` and the alt reports:

1. 2I spinorial lift: H13/H51/H64 are not spinorial; H13⊗2 enlarges the
   kinetic cone 7 → 17 and the Yukawa space to 42 (or 80 Dirac). **PROVED.**
2. Hodge kinetic `S = ||dφ||²` selects a unique ray in End_A5(H13) (scale
   still free). A mass term restores two parameters. **PROVED.**
3. KMS/OS does not select hidden polarity. Archived gold-angle L2 has no
   kernel (λ_min ≈ 0.007658); λ_min(A3)−λ_min(A5) = 2 exactly. **Mixed.**
4. One-loop Σ has degeneracies (1,1,3,3,5) and massless singlets; the two
   inversion-allowed rays 3⊗5→4₃ and 3'⊗5→4₃ give incompatible patterns.
   **PROVED.**
5. Inversion cuts the H13 Yukawa space 8 → 4, still not a ray. Optional
   H4/Galois 3 ≅ 3' would reach 3. **PROVED / H4 CONDITIONAL.**
6. Primitive URT spiral has no finite attractor (π/e > 1). Extra maps miss
   δ★ by 8.65 % and 240 %. **PROVED.**
7. Anomaly-free charges on the four history orbits are exactly the
   opposite-charge family `(q,−q,r,−r)`. Minimum positive pairing `m = 4`
   (two-hidden dimension 8); `m = 1` never occurs. **PROVED.**
8. Those two inversion-allowed rays are explicit uniqueness counterexamples.
   Look-elsewhere: without 79, `R_α` has a rival `1/(51 φ²)+5/190` at
   relative `1.09×10^{-6}`. **PROVED.**

## Next question

The Ward-surviving current space is 4-dimensional (two maps from each of
`4_3` and `4_5` into the two conserved ico quartets). Combined with
alt_cycle02's unique Hodge kinetic ray and alt_cycle05's inversion cut
(Yukawa 8 → 4), ask whether the 4 current parameters and the 4 inversion-
allowed Yukawas are identified, reduced, or still free once the current
is required to be the variational derivative of a single H13 hopping
action that uses that Hodge kinetic. Record the surviving dimension.
Do not insert historical ARF expressions.

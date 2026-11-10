# Block 3 — coupled cycles 10–11 and alt 09–15 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 10 — Noether identification
Classification: PROVED. Surviving dimension 2 (not a ray).

The Hodge hopping action on geometric H13 is the unique alt_cycle02 ray
(eigenvalues 0, 13, 6±√5, 7; scale free). Its charge-0 Noether current
does not cut the pairing sector.

None of the four inversion-allowed CG 4-spaces is strictly edge-supported.
Their adjacent projections are injective, with singular values
√((5+2√5)/10) for 3⊗5, √((5−2√5)/10) for 3'⊗5 (ratio 2+√5), and 1/√2
for both even channels. The two odd channels collapse onto one odd
adjacent 4; the two even channels collapse onto one even adjacent 4.
The map Φ : {4 Yukawas} → {hopping pairing-currents} has rank 2 and
kernel 2. Handedness 3 vs 3' is not residual after hopping.

Inversion-covariant adjacent currents are 2-dimensional (one odd 4 and
one even 4), matching rank(Φ). Cycle 06's 4-dimensional Hom without
inversion covariance is thereby reduced and identified with this 2-plane.

## Coupled cycle 11 — counterexample pair
Classification: PROVED (not-a-ray branch). One-loop / EM / ARF not run.

Theory A: pure odd adjacent pairing-current, parity −1, couples to 4₃,
jointly the image of 3⊗5 and 3'⊗5. Edge-frame sha256
`9562a51481b1e1fc0d9a765d081d19baa98d5a2c258ae6a2d4e1603072946626`.

Theory B: pure even adjacent pairing-current, parity +1, couples to 4₅,
jointly the image of 3⊗3' and Sym²5. Edge-frame sha256
`1049b9002d37e6af946a5970c11b0c1b44180e162b36792345e7a018334a7122`.

The two 4-spaces are Frobenius-orthogonal. The minimal additional
principle needed to reach a ray is a rule that discards one inversion
parity of the H13 pairing or fixes y_even : y_odd. Named but not-derived
candidates: “portal quartet only”; hidden-action weighting
y_even / y_odd = Δ²; alt_cycle14's extra log-det maximisation (which
picks pure 3⊗5 → 4₃, hence the pure odd current after hopping).

## Alt-route integration (cycles 09–15)
Read from LEDGER_ALT.md and the alt_cycleNN_* reports. No ARF derived.
Combined with the hopping cut above:

- alt09: stacked Hodge+inversion+Ward+positivity leave 4 Yukawas + 1
  kinetic scale (before the hopping identification of cycle 10). H13
  alone is not anomaly-free; minimal anomaly-free pairing with H13 is
  m=4, residual after inversion is m not 2m.
- alt10: native history all-flip and clock orientation do not pick
  3 vs 3'. Refinements: all-flip preserves each A5 orbit; Hamming
  parity labels the four orbits (odd vs even weight) but not 3 vs 3';
  clock reversal θ → −θ equals 2π/φ̄² mod 2π, so the archived
  +2π/φ² is the spatial-3 orientation, yet the ±θ spectra coincide.
  Round 102's swap is the S5 outer automorphism, not realised natively.
  Source-matching (keep 3⊗5, kill 3'⊗5) is an extra assumption; after
  hopping it would not cut further, because those two channels are
  already parallel.
- alt11: F is unique up to two source scales; Ward/seagull, Jacobi and
  stability of V_hist ∘ F do not cut the four Yukawas.
- alt12: Cbridge splits the kinetic eigenvalues of 3 and 3'
  (9−√5 vs 5+√5) but does not fix any Yukawa ratio.
- alt13: dodecahedral eigenvalues 3 and 5 are exactly 4₃ and 4₅ via
  face/vertex duality and the history embedding (Hbits 18 and 16).
  This labels the hidden quartets; it does not select a fermion ratio.
- alt14: Haar/maxent on the residual sphere is not a point. KMS does
  not apply to Yukawas. An extra log-det principle would pick the
  pure 3⊗5 → 4₃ ray because λ_3 = 5−√5 is lighter; that principle
  is not derived.
- alt15: even if a unique ray were chosen, the A5 degeneracies
  (1,1,3,3,5) with massless singlets cannot give three distinct lepton
  masses, and no derived EM edge current is available for R_α.

After cycle 10's hopping cut the residual is 2 pairing-current
parameters plus one kinetic scale, not a ray. Alt10's handedness test
does not reduce that 2-plane.

## Next question
Test whether matching the charged pairing-current ratio y_even : y_odd
to the two source scales of F, or to the V_hist weights 1 : Δ², is
forced by any Ward identity of the joint hidden-plus-H13 system. If a
derived identity produces a ray, run the unused cycle-11 branch: the
gauge-covariant one-loop fermion self-energy and the A5-defined EM
vertex/response with the canonical linear-average history Hessian
(conditional on that choice), poles, residues, Ward check, then ARF
comparison with look-elsewhere. If not, exhibit the obstruction and
keep the residual dimension at 2.

No ARF was compared in this block.

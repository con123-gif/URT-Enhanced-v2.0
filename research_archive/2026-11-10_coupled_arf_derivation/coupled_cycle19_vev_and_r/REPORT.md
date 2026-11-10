# Coupled cycle 19 — vev scale and r in the condensed phase

Classification: **PROVED**. The even vev is finite and matches the
large-r balance r = (nuclear norm)/(4 c_even). The condensed phase does
**not** fix r = y_even / y_odd (**FALSIFIED** that it selects a ray).
Surviving dimension: **2**. Advances a physical ARF? No.

## Q1 — vev scale
Primary kinetic: H13 Hodge, Nambu measure of cycle 18, T = η and T = 0,
along the even nuclear-norm maximiser (Σσ = 4.64038).

- T = η: r_* = 8.54983×10^5, Ω_* = −9.92793×10^5
- T = 0: r_* = 8.54983×10^5 (the minimum sits at r σ / T ≫ 1)
- Analytic large-vev balance r = (nuclear norm)/(4 c_even) = 8.55835×10^5
  (relative difference 0.100%)

The vev is finite, not a runaway. F : Sym² → 4_3 ⊕ 4_5 is surjective
(cycle 03), so the unrestricted portal V_hist(h − F(S)) supplies no
extra hidden quartic. The A4 direction moreover lies in the rank-1 cone
of Sym²(5) → 4_5 (alignment 1 − 3×10^{-14}), so it can be sourced by a
pure 5 without calling on 3⊗5. The large number is the genuine balance
between the tiny tree stiffness c_even = Δ² c5 ≈ 1.356×10^{-6} and a
pairing energy that saturates linearly, not a missing-quartic artefact
and not a unit error (the same orthonormal frames as cycle 13).

## Q2 — does condensation fix r?
T1. The gradient ∂Ω/∂h3 at h3 = 0, h5 = v_* has norm 1.6×10^{-8}
    against an even force scale 2 c_even r_* ≈ 2.32. The tadpole
    vanishes, as required by inversion (even vacuum, odd h3).
T2. Sym²(5) sources only 4_5 (cycle 03). A pure-5 lift of the A4
    direction therefore induces no h3.
T3. Joint scans at O(1) Yukawa pairs follow the linearised pattern:
    the even vev turns on if and only if y_even > y_c,even ≈ 0.00601,
    independently of y_odd provided y_odd < y_c,odd ≈ 2.405
    (e.g. (y_o, y_e) = (0,1), (1,1), (0.1,1) all condense with the
    same even ray; (1, 0.001) does not, since 0.001 < y_c,even;
    (1, 0) stays at the origin). When the even vev is on, its
    magnitude scales as y_even, not as y_even / y_odd.

No unique r is selected. The residual dimension remains 2.

## Integrity
Predeclaration sha256:
`024d975bec5ce3ea58e39fe87675f0a2fa6018686d758f50343f5ab101995a80`.
Test-script hash is in HASHES.txt. Cycle 19 ran only because cycle 18
marked 4_5 condensation PROVED. No ARF target was used.

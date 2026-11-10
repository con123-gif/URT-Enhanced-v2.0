# Coupled cycle 12 — Ward / matching / RG for y_even : y_odd

Classification: **PROVED** obstruction. Surviving dimension: **2** (not a ray).
Advances a physical ARF? No. The one-loop / EM / ARF pipeline was not run.

## Question
Is the residual ratio r = y_even / y_odd forced by any Ward identity or
consistency condition of the joint hidden-plus-H13 system (matching to
F’s two source scales, or to the V_hist weights 1 : Δ²), including
one-loop renormalisation of the ratio?

## Ward identities (W1, W2)
The three theories (y_odd, y_even) = (1, 0), (0, 1) and (1, 1) all
satisfy the inversion, A5 and geometric U(1) Ward identities. Each
hopping current is already an intertwiner of the matching parity and
charge; inversion-even Lagrangians are obtained independently for each
term (odd current × odd h_3, even current × even h_5). The hidden
Hessian of cycle 03 is block-diagonal on 4_3 ⊕ 4_5 (eigenvalues
H_3 = 2 c_3 ≈ 0.444476 and H_5 = 2 Δ² c_5 ≈ 2.71103×10⁻⁶, no
cross-mixing), so no joint hidden Ward relates the two Yukawas.

## Matching recipes (M1), look-elsewhere
Six named extra recipes for r = y_even / y_odd disagree by a factor
1/Δ² ≈ 1.614×10⁵ and are not Ward identities:

| recipe | r |
|---|---|
| V_hist weight Δ² | 6.19606606165215×10⁻⁶ |
| V_hist weight Δ | 0.00248918984042040 |
| canonical hidden √(H_5/H_3) | 0.00246969151833050 |
| F singular values σ(4_5)/σ(4_3) | 0.419469524121607 |
| F Frobenius \|\|B(Sym² 5)\|\| / \|\|B(3⊗5)\|\| | 0.593219490014964 |
| democratic | 1 |

## One-loop RG (R1)
Inversion forbids generating one Yukawa from the other, so the betas
have the form β_o = y_o (A_o y_o² + B_o y_e²) and
β_e = y_e (A_e y_e² + B_e y_o²). Both axes are therefore RG-fixed
rays in every scheme. That alone precludes a unique RG-selected ray.

Equal diagram weights, using the cycle-11 hopping frames, give the
exact tensor factors z_oo = 1/2, c_oo = 1/4, z_oe = z_ee = z_eo = 11/30,
c_oe = c_ee = c_eo = 7/60, hence A_o = A_e = 3/4, B_o = B_e = 1/4 and
a mixed fixed ratio r_* = 1. The fermion self-energy kernels are
A5-scalars with eigenvalues (odd) 0 on the singlet,
(5+2√5)/15 on 3, (5−2√5)/15 on 3', and 2/5 on 5; (even) 0, 1/3, 1/3, 2/5.

Hodge-weighted fermion lines (canonical λ_3 = 6−√5, λ_{3'} = 6+√5,
λ_5 = 7) produce a different mixed ratio r_* ≈ 1.1028. The mixed ray
is therefore scheme-dependent, and in any case is an extra ray rather
than uniqueness.

Weighting hidden exchange by the cycle-03 Hessian (conditional) makes
the mixed r_*^2 negative: only the two inversion axes remain as fixed
rays. The overall sign of the flow, and any IR/UV reading of which
axis would attract, is scheme-conditional and is not used to select
a ray.

## Obstruction
The residual 2-plane is not cut by Ward identities, by consistency of
the joint hidden-plus-H13 system, or by one-loop RG. The two inversion
axes (cycle 11’s Theory A and Theory B) remain explicit counterexamples.
The named matching recipes disagree among themselves and with the
scheme-dependent mixed RG ratios. No unique ray is forced.

## Integrity
Predeclaration sha256:
`83793c1e71eb7d4b4ab4dd9389e556ca02a4dea7acc0e2211820b9aba56ce842`.
Test script sha256:
`cc0b739e66cded40962d8cc5289e385ea986a0145a32e04a16b7aac87b358837`.
No ARF target was used.

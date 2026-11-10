# Coupled cycle 15 predeclaration — Hbits shift of effective Δ / δ

Cycle 14 derived the exact hidden-scale factor
    √(H5/H3) = Δ · f(ρ),    f(ρ) = √((14+ρ)(18+ρ)) / (16+ρ),
with f(0) = √(63/64) = 3√7/8 coming from Hbits 14·18/16², i.e.
    (16−2)(16+2)/16² = 1 − 1/64.
The integer 63 also appears in the historical ARF Δδ = −δ★³/63 − γ/40,
and 64 is the number of histories. This cycle defines a physical
observable for the Hbits-induced shift and only afterwards compares
it to that ARF.

Frozen ingredients, used as named inputs, not fitted:

    c3 = (16+ρ)/(4(18+ρ)),   c5 = (14+ρ)/(4(16+ρ))
    ρ = (π/e)² · 4 sin²(π(9−4√5)/4) = E2
    H3 = 2 c3,   H5 = 2 Δ² c5
    Δ = 3/20 − δ★,   δ★ = 80π/(1053 φ),   γ = 1/81
    φ = (1+√5)/2

Observable, declared before any ARF arithmetic:

    Δ_eff := √(H5/H3)
    Δ_ref := Δ
        (the equal-Hbits / clock-dominated value, cycle 14, ρ → ∞)
    O_Δ := Δ_eff − Δ_ref = Δ (f(ρ) − 1)
    δ_eff := 3/20 − Δ_eff
    O_δ := δ_eff − δ★ = −O_Δ = Δ (1 − f(ρ))

Δ_eff is the unique number that the hidden Hessian would report as
“Δ” if c3 were equal to c5. The entire 16-versus-18 asymmetry is
the departure of (c3, c5) from (1/4, 1/4). No other rewriting of
O_Δ or O_δ will be introduced after the numbers are seen, and no
ARF polynomial is used in the definition.

Will compute, in this order:

1. The closed forms of f(ρ), O_Δ and O_δ at the physical ρ and at
   the ρ → 0 limit, including the exact identities
   f(0) = √(63/64) = 3√7/8 and 14·18/16² = 63/64 = 1 − 1/64.
2. Only then the historical comparison value
   Δδ = −δ★³/63 − γ/40
   and the two separate summands −δ★³/63 and −γ/40.
3. The signed ratios O_Δ/Δδ, O_δ/Δδ and the relative differences
   of O_δ to Δδ and to each summand. A numerical match is declared
   only if a relative difference is below 10^{-4} (the threshold
   already used for ARF look-elsewhere in cycle 05 and alt 23).

Look-elsewhere, also predeclared: enumerate natural writings of the
integers 63 and 64 as products, sums, or differences of two elements,
or exact integer quotients a·b/c, drawn from the Cathedral structure
list
    S = {1,2,3,4,5,6,7,8,9,12,13,14,15,16,18,20,24,30,32,35,40,
         50,51,63,64,79,80,81,90,105,190}
together with the named writings already recorded in cycle 04
(63 = 64−1 = 7×9 = 12+51 = 13+50 = dim su(8); 64 = 2^6 = 4×16)
and cycle 07 (Gaussian covariance ratio (64/63)/Δ² at ρ = 0, the
same 63/64 as 14·18/16²). The count of distinct writings is the
look-elsewhere factor on “the” 63 of the ARF versus “the” 63 of
Hbits.

Honesty clause: if O_Δ and O_δ are not identical to Δδ, sharing an
integer that has many Cathedral writings is numerology, not a
derivation. The polynomial type will also be recorded: O_δ is linear
in Δ (hence affine in δ★), while Δδ is a cubic in δ★ plus a constant
γ/40. Distinct types that happen to share a denominator are not an
identity.

Classification: PROVED for the closed form of O; the identification
O = Δδ will be marked PROVED or FALSIFIED by the algebra and the
10^{-4} test. No ARF target is inserted into the observable.

# Coupled cycle 16 predeclaration — Galois covariance of the coupled action

Principle: require the full coupled action to be invariant under the
simultaneous substitution √5 → −√5 and the swap 3 ↔ 3' of A5-irreps
(the outer automorphism of A5 induced by conjugation in S5), acting
on all Cathedral data that contain √5 or distinguish 3 from 3'.
Does this relate y_even and y_odd, or force one of them to zero?

Archived data that the principle acts on (cycle 10, cycle 12, cycle 14),
used as named inputs, not fitted:

    Hodge eigenvalues of H13: 0, 13, 6±√5, 7
        with λ_3 = 6−√5 and λ_{3'} = 6+√5 (cycle 12)
    5A characters on the two 3-spaces: φ and φ̄ = (1−√5)/2 (cycle 10)
    Hopping singular values:
        3⊗5 → 4_3 : √((5+2√5)/10)
        3'⊗5 → 4_3 : √((5−2√5)/10)
        ratio (3⊗5)/(3'⊗5) = 2+√5
        3⊗3' → 4_5 and Sym²5 → 4_5 : both 1/√2
    After hopping, the two odd maps share one adjacent 4 (to 4_3)
    and the two even maps share one adjacent 4 (to 4_5); residual
    couplings are the singlets y_odd and y_even.
    Frozen φ-dependent inputs: φ = (1+√5)/2,
        δ★ = 80π/(1053 φ), Δ = 3/20 − δ★,
        λ_18 = 4 sin²(π(9−4√5)/4), ρ = (π/e)² λ_18,
        c3 = (16+ρ)/(4(18+ρ)), c5 = (14+ρ)/(4(16+ρ)).

Will check, before any claim about r:

G1. The unordered Hodge spectrum is invariant under √5 → −√5, and
    the swap 3 ↔ 3' exchanges λ_3 with λ_{3'}. The Hodge kinetic is
    therefore Galois-covariant.

G2. The unordered hopping singular-value set is invariant: the two
    odd values swap and the two even values (Galois-rational) stay
    fixed. The unique odd adjacent 4 and the unique even adjacent 4
    are each Galois-even. Consequently y_odd (a coefficient of a
    Galois-even current × h_3) and y_even (a coefficient of a
    Galois-even current × h_5) are Galois singlets.

G3. A Galois-odd coupling would have to vanish for the action to be
    invariant. Because both residual Yukawas are singlets, Galois
    invariance holds for every pair (y_odd, y_even) and does not
    force either to zero, nor impose a relation y_even = f(y_odd).

G4. The copies 4_3 and 4_5 are distinguished by rational Hbits
    eigenvalues 18 and 16 and by inversion parity, not by Galois
    (A5 has a single real 4). They do not swap under √5 → −√5.

G5. The frozen φ-dependent inputs are not themselves Galois-even:
    φ → φ̄, δ★ → 80π/(1053 φ̄), Δ → 3/20 − 80π/(1053 φ̄),
    λ_18 → 4 sin²(π(9+4√5)/4). This is a property of the named
    constants, not a constraint on r. Replacing them by Galois-even
    combinations would change the frozen inputs and is not done here.

The optional extra “identify 3 with 3' by hand” considered in
alt_cycle05 would have equated the two odd Yukawas (4 → 3 parameters).
Hopping (cycle 10) has already identified those two maps, so that
extra step is redundant and still leaves the even/odd 2-plane.

Classification: PROVED for G1–G5. The statement “Galois covariance
selects a ray or forces one Yukawa to zero” will be marked PROVED
or FALSIFIED by G3. No ARF target is inserted.

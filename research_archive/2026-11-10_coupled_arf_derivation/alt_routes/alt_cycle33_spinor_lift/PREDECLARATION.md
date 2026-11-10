# Predeclaration — alt_cycle33: pairing on the 2I spinor lift

Date: 2026-11-10 (Europe/London)
Route: (33) Spinor lift: redo the pairing / condensation on H13 ⊗ 2 of 2I (no singlet). Does the unpaired zero mode disappear, and does the spectrum change to three distinct levels?

## Setup
S1. Alt_cycle01 decomposed the natural lift F = H13 ⊗ 2 as 3·2 ⊕ 2·4' ⊕ 2·6 (dimension 26, no singlet of 2I) and the geometric piece vertex12 ⊗ 2 as 2·2 ⊕ 2·4' ⊕ 2·6 (dimension 24, again no singlet). The extra 2 in F = (vertex12 ⊗ 2) ⊕ 2 comes from the extra A5-singlet in H13, which is not an icosahedral vertex and has no derived hopping. The primary carrier is therefore the 24-dimensional geometric spinor vertex12 ⊗ 2, with the extra 2 reported as a decoupled spectator (no invented mass).
S2. The kinetic operator is the spin Laplacian built from the unique (up to ℤ2 vertex-gauge) spin connection of the inscribed icosahedron: on the edge from unit vector n_i to n_j, the SU(2) parallel transport is
    U_{i→j} = exp(−i (θ/2) σ · n̂),   θ = arccos(n_i · n_j),   n̂ = (n_i × n_j)/|n_i × n_j|,
    with the principal lift Tr U = 2 cos(θ/2) > 0. Because H¹(S², ℤ2) = 0 there is a unique spin structure up to gauge. Face products of the U’s are recorded (they should realise the spherical holonomy of curvature).
    (K_spin ψ)_i = deg_i ψ_i − Σ_{j∼i} U_{i→j} ψ_j.
    This is a 24 × 24 Hermitian operator. It is derived: no new continuous coupling.
S3. Pairing is the spatial even (and, as a control, odd) frame tensored with the 2I-invariant symplectic form ε on the 2 (the singlet in 2 ⊗ 2 = 1 ⊕ 3):
    Δ_spin = Δ_spatial(h) ⊗ ε.
    This is the unique 2I-invariant spin-singlet pairing built from the archived spatial Δ, up to scale (the scale remains the orthonormal-frame Yukawa y = 1). Spin-triplet pairing would require a spatial 3 and is not introduced.
S4. The condensation test repeats alt_cycle25: Nambu/BdG potential with K_spin and Δ_spin, T = η, even channel, y = 1. Critical Yukawa, presence of a zero mode of K_spin and of the condensed BdG operator, and the distinct positive energies at the even vacuum are recorded. No ARF comparison is performed in this route (route 32 is the place for that, and only when its uniqueness policy is met).

## Hypotheses
H1. K_spin has no zero mode (a discrete analogue of the Lichnerowicz gap on S², R > 0). The unpaired constant singlet of the scalar theory is absent because vertex12 ⊗ 2 contains no 2I-singlet and the spin connection mixes the would-be kernel.
H2. The 2I-invariant pairing Δ ⊗ ε does not by itself lift a kernel of K ⊗ I_2 when Δ v0 = 0; it is the spin connection, not the pairing, that removes the zero mode. This is checked by comparing K ⊗ I_2 (which should still have a 2-dimensional kernel) to K_spin.
H3. Even-channel pairing still condenses at y = 1 if the tree stiffness c_even remains far below the pairing susceptibility (the huge 4_5 softness is unchanged). The condensed BdG spectrum is computed; whether it consists of exactly three distinct positive levels is an output, not an input. A leftover 2I multiplet structure (2, 4', 6) would prevent three singlets unless the condensate breaks 2I / A5 further.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

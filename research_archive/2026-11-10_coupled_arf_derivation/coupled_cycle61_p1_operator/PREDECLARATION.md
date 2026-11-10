# Coupled cycle 61 predeclaration — is any already-derived
# coupled operator the alt-65 P1 4-space?

Date: 2026-11-10 (Europe/London)

Alt cycle 65 derived a unique 4+9 split of geometric H13 under
the predeclared four-smallest / lowest-isotype rule:

    P1 = 1_const ⊕ 3_low,  spectrum {0} ∪ {(6−√5)×3},
    complement {7×5, (6+√5)×3, 13}.

This cycle asks whether any *already-derived* coupled-line
operator *is* that 4-space, in the same spirit as cycle 45’s
check of G13 against coupled operators. It does not build a
mass or charge formula from P1, does not retune G13, does not
promote convention-applied R_mass^(C) or det′L = 31³·7⁵·13
to a historical ARF, and does not invent a coframe or a C_IR.

The `newtons-cathedral` tip remains read-only at `6bad7b3`.
Predeclaration is hashed before any intertwiner or spectrum
is computed. Historical ARFs are not used to select a match.

Short status notes (formerly suggested as separate cycles 59
and 60, folded here because they repeat known blockers) will
be written in this directory after the P1 test, not as
independent numerical cycles.

## Frozen list of already-derived 4-blocks

A coupled operator “is P1” only if it is already named on the
coupled line (or is a uniquely derived 4-block of such an
operator) and equals P1 as a quadratic form, i.e. its spectrum
matches {0, (6−√5), (6−√5), (6−√5)} at absolute 10^{-8}, or it
coincides with the P1 subspace of geometric H13. No 4-dimensional
subspace will be searched for among large Hom-spaces.

L1. Geometric H13 itself: the isotype sum 1_const ⊕ 3_low
    (control: this is P1 by the alt-65 construction; recorded
    as “P1 is a block of the already-used H13 kinetic”).
L2. The other Aut-invariant 4-spaces of H13 from alt 65
    (P2 and the two P4 spaces). These are named only as
    alternatives, not selected.
L3. The 12-site icosahedral Laplacian K0, 4-block
    ker ⊕ Fiedler_3, with expected spectrum {0, (5−√5)×3}.
L4. Hidden Hessian blocks 4_3 and 4_5, with spectra
    (2 c3)×4 and (2 Δ² c5)×4 (cycles 03, 18).
L5. Dodecahedral Laplacian eigenspaces already discussed in
    alt 40 (the 3- and 5-eigenspaces), if they are
    4-dimensional; otherwise they are recorded as the wrong
    dimension and are not split by hand.
L6. No unique 4-block of H64, of the joint 32-site Laplacian,
    of subcritical BdG, or of the five-solid 0-form Laplacian
    is already named as a coupled-line sector. Those operators
    are not searched for a 4-space.

## Cone-lift relation (declared before the check)

C1. On the cone construction that *defines* geometric H13,
    each K0-eigenvector orthogonal to constants, extended by
    0 at the hub, is expected to be an H13-eigenvector with
    eigenvalue λ_K0 + 1. In particular 3_low should be the
    0-hub extension of K0’s Fiedler 3, so that 6−√5 = (5−√5)+1.
    The H13 kernel is the 13-constant, not the 12-constant
    extended by 0. This identity, if it holds, describes P1
    as “H13-kernel plus cone-lift of K0-Fiedler.” It does not
    make P1 equal to the K0 4-block L3 (different ambient
    space, different spectrum).

## Hypotheses

H1. L1 coincides with P1 (control). L2–L5 do not: their
    spectra are not {0, (6−√5)×3}.
H2. The cone-lift identity C1 holds, and P1 is therefore a
    derived 4-block of the H13 kinetic already used on the
    coupled line, related to K0 but not equal to it.
H3. The coupled line has not used P1 as a charge, K4, or mass
    sector. No R_mass or fermion-sector formula is built from
    it here. No ARF is compared.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN.

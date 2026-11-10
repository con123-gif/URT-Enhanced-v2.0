# Predeclaration — alt_cycle26: charged-fermion masses from the broken vacuum

Date: 2026-11-10 (Europe/London)
Route: (26) With the broken vacuum of route 25, compute the induced charged-fermion mass spectrum. Ask whether three nondegenerate masses arise without new parameters. Record ratios; only then compare with C_mass and R_mass, with look-elsewhere.

## Predeclared spectrum
P1. Masses are the positive BdG eigenvalues E_α of H = [[K, Δ], [Δ, −K]] at the Ω-minimising hidden field of alt_cycle25, with the primary pairing measure, T = η, and the natural frame Yukawas of that cycle (y_even = 1 and y_odd = 0 if only the even channel condenses at O(1); both channels at y = 1 if both condense).
P2. If alt_cycle25 does not produce a condensed vacuum, or produces one whose direction is continuously degenerate (so that the spectrum depends on an unfixed point of S³), there is no parameter-free spectrum. In that case sample spectra may be recorded as diagnostics but no comparison with C_mass or R_mass will be performed.
P3. If a unique A5-orbit of condensed vacua exists (a discrete stabiliser type, no continuous moduli), record the sorted positive energies, their distinct values and multiplicities, and the scale-invariant ratios ρ_{ij} = μ_i / μ_j of the distinct positive values μ_1 < μ_2 < ⋯. If there are at least three distinct positive values, also record the three pairwise ratios among the lowest three and the Koide-like quotient (μ_1+μ_2+μ_3)² / (μ_1²+μ_2²+μ_3²). These are diagnostics, not fitted targets.
P4. Comparison, executed only after those numbers are written: relative errors of every recorded ratio against the four numbers
    |C_mass|, |R_mass|, |C_mass / R_mass|, |R_mass / C_mass|
    C_mass = −(5/16) δ*^3 + (7/8) π φ
    R_mass = (3/35) δ*^2 − (4/51) π^3
Then the alt_cycle08 T1 grammar on G_strict (no 79 by hand) is run on those four targets and on the recorded ratios. A numerical near-hit is not a derivation.

## Hypotheses
H1. Three nondegenerate charged masses without new parameters arise only if cycle 25 supplies a unique orbit whose BdG spectrum has exactly three distinct positive values (or three distinguished singlets) independent of any unfixed continuous modulus.
H2. An A4-stabilised vector in the 4 does not split the spatial 3 of A5 (A4 ⊂ SO(3) keeps the 3 irreducible). A C3-stabilised vector does split 3 → 1 ⊕ 2. Neither pattern automatically yields exactly three nondegenerate charged masses.
H3. If no unique parameter-free spectrum exists, C_mass and R_mass are not compared.

## Integrity
No ARF target is inserted into the gap equation or the BdG operator. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

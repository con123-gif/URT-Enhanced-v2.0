# alt_cycle26 — charged-fermion masses from the broken vacuum

Classification: PROVED. A unique A5-orbit of condensed vacua exists (stabiliser A4). The induced spectrum has three distinct positive mass levels without new parameters; they are degenerate multiplets, not three singlets, and none of the predeclared ratios matches |C_mass|, |R_mass| or their quotient at relative 10^{-4}.
Advances a physical ARF? No.

## Spectrum (recorded before any ARF comparison)

Primary point: y_even = 1, y_odd = 0, hidden field at the cycle-25 minimiser
(ĥ the nuclear-norm maximiser of the even frame, ||h5||_* ≈ 8.613×10^5, stab A4).
Positive BdG energies of H = [[K, Δ], [Δ, −K]], grouped by numerical degeneracy:

- 0 with multiplicity 1 (the constant mode, unpaired because the residual frames annihilate it)
- 3.144879×10^5 with multiplicity 3
- 3.516060×10^5 with multiplicity 3
- 3.516104×10^5 with multiplicity 3
- 4.717319×10^5 with multiplicity 2

The two nearby triplets differ by relative 1.27×10^{-5}, which is the size of ||K|| / (y r) at this vacuum. They are the Laplacian splitting of a single pairing level.

In the pairing-dominated (large-vev) limit the masses are r times the singular values of the unit pairing matrix M(ĥ):

- 0 with multiplicity 1
- r √(2/15) with multiplicity 3
- r √(1/6) with multiplicity 6
- r √(3/10) with multiplicity 2

The three positive levels stand in the parameter-free ratio
√(2/15) : √(1/6) : √(3/10) = 2 : √5 : 3,
or equivalently 1 : √5/2 : 3/2. This answers “three distinct positive masses without new parameters” at the level of mass *values*, but they are not three nondegenerate singlets: A4 leaves degeneracies 3, 6 and 2, and a charged massless singlet survives. That is the pattern predicted by H2 (an A4 vector does not split the spatial 3 of A5 into three singlets).

Recorded pairwise ratios among the four finite-r positive values include
μ4/μ1 = 1.500000000 (i.e. 3/2), μ2/μ1 = 1.118027 ≈ √5/2, and the Koide-like quotient of the lowest three = 2.992039 (near 3 because μ2 ≈ μ3).

## Comparison with C_mass and R_mass (after the ratios were written)

C_mass = 4.446800, R_mass = −2.430000, |C/R| = 1.829959, |R/C| = 0.546460.
No recorded ratio lies within relative 10^{-4} of any of those four numbers. The closest is μ4/μ1 versus |C/R|, at relative error 0.180. A numerical near-hit would not have been a derivation in any case.

Look-elsewhere against the alt_cycle08 T1/G_strict grammar (no 79 by hand) writes several of the recorded ratios as two-atom sums, as expected for numbers such as 3/2 = 8/3 − 7/6 and √5/2 = 1/φ + 1/2. That is the algebraic identity itself, not an ARF match. The four ARF targets have T1 nearest relative errors 2.64×10^{-4} (|C_mass|), 1.27×10^{-5} (|R_mass|), 2.23×10^{-5} (|C/R|); none is an identity with a mass ratio at the 10^{-4} threshold used here for the direct comparison.

## Verification
`/workspace/arf_research/alt_cycle26_condensate_masses/test_condensate_masses.py` and `results.json`.
Predeclaration sha256: `df96bd9d6faea2f9ccd331ced90e04dc77d6822b9140c30dd6b014fd411a11c0`.

## Next obstruction
The A4 condensate produces a rigid 0 ⊕ 3 ⊕ 6 ⊕ 2 pairing spectrum (large-r ratios 0 : 2 : √5 : 3) rather than three nondegenerate charged singlets, and it leaves one charged fermion massless, so the one-loop EM response remains infrared-singular. The residual ratio y_even : y_odd is still free.

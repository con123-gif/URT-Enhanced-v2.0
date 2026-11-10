# Predeclaration — alt_cycle04: one-loop fermion self-energy

Date: 2026-11-10 (Europe/London)
Route: (4) One-loop (not mean-field) fermion self-energy from the native hidden Gaussian propagators, as a function of the admissible Yukawa parameters. Ask whether any mass ratio is parameter-independent.

## Frozen inputs
H13 = 1a ⊕ 1b ⊕ 3 ⊕ 3' ⊕ 5. Hidden fields h3, h5 in two copies of the irrep 4, with Schur-lemma covariances c3 I and c5 I.
Yukawa interpretations:
  (Weyl/Majorana) Hom_A5(Sym^2 H13, 4⊕4), dimension 8 before inversion, 4 after inversion (see alt_cycle05).
  (Dirac-type) Hom_A5(4⊕4, End(H13)), dimension 16 before inversion.
Leading hidden-contraction self-energy: Σ = Y Cov(h) Y^†, an A5-singlet Hermitian operator on H13, hence an element of the 7-real-dimensional algebra End_A5^H(H13).
Mean-field ⟨h⟩ = 0 is already known (cycle 07); this cycle studies the quadratic hidden contraction, not a vev.

## Hypotheses
H1. Σ is block-diagonal in the A5 isotypes of H13. Forced degeneracies of pole masses are therefore of type (1, 1, 3, 3, 5). The two singlets do not appear in any 4-isotype of End(H13) built from Hom(1, r), so they remain massless at this order.
H2. The four (resp. eight) Clebsch-Gordan channels feed different isotypes: a pure 3⊗5 → 4 channel masses 3 and 5 only; a pure 3'⊗5 → 4 channel masses 3' and 5 only; a pure 3⊗3' channel masses 3 and 3' only; a pure Sym^2(5) channel masses 5 only.
H3. Consequently there exist two admissible Yukawa rays that produce incompatible mass-ratio sets (including zeros versus nonzeros). No parameter-independent charged-fermion mass ratio exists in this family.
H4. C_mass and R_mass are not recovered as such ratios.

## Integrity
No ARF expression is inserted into Y or into Cov(h). Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

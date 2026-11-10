# Report — alt_cycle42: joint spectrum and mass-ARF comparison

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `8e569988e670badfa454e3e64e8d05a5e595715d5fcce478ecf2e8a2d692d228`

## Joint stabiliser and the comparison gate
Alt_cycle41 reports joint stabiliser A4. By S2 and H1 of the predeclaration, A4-triplets cannot split and the C_mass / R_mass comparison is not run.

## Spectrum at the joint vacuum
Positive BdG energies of the 32-site problem, grouped at relative 10^{-5}.

K0 = L_ico ⊕ L_dodeca, r_* = 1.797640×10^6:
- unpaired near-zero 6.31×10^{-10} (multiplicity 1) — the icosahedral constant, still unpaired;
- 3.000 × 4 (unlifted dodecahedral Laplacian 4 at eigenvalue 3);
- pairing levels 73761.85 × 3, 190731.27 × 1, 656405.17 × 5, 730167.02 × 3, 733883.29 × 12, 847136.44 × 1, 984607.76 × 2.

Two pairing-scale multiplicity-1 levels sit among unsplit multiplets (3, 4, 5, 12, 2). Not three nondegenerate charged singlets.

KC = K0 + Cbridge|_{32}:
- the unpaired constant is lifted; lowest levels 3.000 × 1, 4.000 × 1, 5.000 × 3;
- the pairing tower is unchanged at this precision: 73761.85 × 3, 190731.27 × 1, 656405.17 × 5, 730167.02 × 3, 733883.29 × 12, 847136.44 × 1, 984607.76 × 2.

Four numerical multiplicity-1 levels appear (two O(1) kinetic, two pairing-scale), but they sit among leftover A4 multiplets. This is the branching of A5 irreps under residual A4 (including real 2s from 1' ⊕ 1''), not a breaking of A4 to C3 or C2 that would split every triplet into nondegenerate singlets. three_nondeg_singlets = false on both kinetics.

## Mass ARFs
C_mass and R_mass were not compared, and the T1 / G_strict look-elsewhere test was not run (S5). The named values C_mass ≈ 4.446800 and R_mass ≈ −2.430000 were recorded only as unused targets.

No ARF target was inserted into the vacuum or the spectrum. No repository files were modified, committed, or pushed.

# Report — alt_cycle37: principal angles of 276 → 8 → 4 → 2

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `ec4c48302559e5abd3964812cee1af2dd846b16e2621ccdbcd372a645180a179`

## Question
Are the certificate’s nested cuts 276 → 8 → 4 → 2 the same subspaces as our chain (276 / 8 Yukawas / 4 after inversion / 2 after hopping), or only a coincidence of counts? Principal angles decide.

## The two flags
Shared ambient dimension: 276 = dim Hom_{A5}(4_3 ⊕ 4_5, Sym² H64).

Certificate (Walsh/Hbits realisation of H64):
- C8 = Hom_{A5}(4_5, H_0 ⊗_sym H_16) ⊕ Hom_{A5}(4_3, H_0 ⊗_sym H_18), CG type 1 ⊗ 4. Image dimension in vech(Sym² ℝ^{64}): 32.
- C4_S = the Q-stationary-spectator part of C8 (constant Walsh vector in H_0 only). Image dimension: 16.
- C4_B (source-bright) was not constructed: the archived source isometry U_h is not uniquely reconstructed from the three new chronology files and was not invented. Orthogonality of V8 to all of C8 already implies orthogonality to every subspace of C8, including C4_B and C2.

Ours (cycles 01/05/10/11), pushed into Sym² H64 by energy-respecting A5-equivariant embeddings of 3, 3', 5:
- V8: four CG 4-spaces 3⊗3', 3⊗5, 3'⊗5, Sym² 5 (each of dimension 4). Image dimension: 16.
- V4: inversion, 4_5 ↔ {3⊗3', Sym² 5} and 4_3 ↔ {3⊗5, 3'⊗5}.

There is no canonical embedding H13 ↪ H64 (Theorem A). The eight embeddings tested place 3 and 3' independently into H_10 or H_18 and 5 into H_16, for two independent random realisations of the Walsh A5 action.

Isotypic dimensions actually obtained: 3@H10 = 6, 3@H18 = 6, 3'@H10 = 6, 3'@H18 = 6, 4@H16 = 8, 4@H18 = 8, 5@H16 = 10. The 4-isotypics have the expected dimensions (2 copies × 4). The 5-isotypic rank was 10 rather than the character-theoretic 20; every trial still produced a valid 5-embedding into H_16, and the orthogonality result below is at machine precision for all eight embeddings. Representation-theoretically the conclusion does not depend on which multiplicity of 5 is used: no energy-respecting image of V8 can have a leg in H_0.

## Result
All eight embeddings are orthogonal:
- every principal angle of V8 against C8 is 90° (one recorded value 89.99999999999999° from floating-point rounding);
- every principal angle of V4 against C4_S is 90°;
- the largest Hilbert–Schmidt overlap singular value is 2.83×10^{-16}.

The Clebsch–Gordan types differ (1⊗4 versus 3⊗3', 3⊗5, 3'⊗5, Sym² 5) and the Hbits supports differ (H_0 ⊗ H_16 / H_18 versus pairs among H_10, H_16, H_18). The matching nested counts 276 ⊃ 8 ⊃ 4 ⊃ 2 are therefore a coincidence of counts, not an identification of cuts. The certificate’s energy resonance is not the H13 pairing, and our inversion/hopping cuts do not reproduce Q-stationarity or source-bright factorization.

No ARF target was inserted. No repository files were modified, committed, or pushed.

# Predeclaration — alt_cycle37: principal angles of 276→8→4→2

Date: 2026-11-10 (Europe/London)
Route: (37) Cross-check the new repo certificate’s conditional pair counts 276 → 8 → 4 → 2 against our chain (276 / 8 Yukawas / 4 after inversion / 2 after hopping). Are the cuts the same subspaces (compute principal angles), or a coincidence of counts?

## The two flags
S1. Ambient count, shared: 276 = dim Hom_A5(4_3 ⊕ 4_5, Sym² H64) under the unrestricted uniform-charge hypothesis (138 quartet copies in Sym² H64, times two hidden sources). This is an abstract dimension; a concrete inner product on that Hom space is the Hilbert–Schmidt pairing of the image tensors in Sym² R^{64}.

S2. Certificate flag (d71974d..6bad7b3), inside that Hom space via the Walsh/Hbits realisation of H64:
    - C8: energy resonance R. Hom_A5(4_5, H_0 ⊗_sym H_16) ⊕ Hom_A5(4_3, H_0 ⊗_sym H_18), dimension 4+4=8. Here H_0=2·1, H_16 contains 2·4, H_18 contains 2·4, and H_0 ⊗_sym H_E ↪ Sym² H64.
    - C4_S: R plus Q-stationary spectator (only the constant Walsh vector in H_0). Dimension 4.
    - C4_B: R plus native source-bright factorization (one of the two quartets in each of H_16 and H_18). Dimension 4. Constructed if the archived source isometry Uh can be realised from existing files; otherwise the comparison to B is marked unavailable rather than invented.
    - C2: R+S+B, dimension 2, on the same terms.
    These tensors are of Clebsch–Gordan type 1 ⊗ 4.

S3. Our flag (cycles 01/05/10/11), first as maps into Sym² H13 and then, for principal angles, pushed into Sym² H64 by an A5-equivariant embedding of the geometric 3 ⊕ 3' ⊕ 5 (the support of the four CG quartets; H13 = 2·1 ⊕ 3 ⊕ 3' ⊕ 5, and those quartets do not use the singlets):
    - V8: Hom_A5(4_3 ⊕ 4_5, Sym² H13), the eight H13 Weyl–Yukawa tensors (four CG sectors 3⊗3', 3⊗5, 3'⊗5, Sym² 5, times two hidden sources).
    - V4: inversion. 4_5 couples only to the even sectors {3⊗3', Sym² 5} and 4_3 only to the odd sectors {3⊗5, 3'⊗5}. Dimension 4.
    - V2: hopping. The two even CG channels become parallel adjacent currents, and the two odd channels become parallel (coupled cycle 10). Dimension 2 (y_even and y_odd).
    These tensors are of types 3⊗3', 3⊗5, 3'⊗5, Sym² 5.

S4. There is no canonical embedding H13 ↪ H64 (URT_A5_H64_H13 Theorem A). Energy-respecting embeddings place 3 and 3' into H_10 = 2·3+2·3' and/or H_18 = 2·3+2·3'+2·4, and 5 into H_16 = 2·1+2·4+4·5. Several such embeddings (varying the multiplicity spaces) are tested. Theorem A forbids treating a single embedding as unique; if every tested embedding gives the same principal-angle pattern, that pattern is reported as robust.

## Comparison
S5. Principal angles between the image 4-isotypics in Sym² R^{64} (equivalently, if those images are orthogonal, between the Hom spaces themselves) are computed for V8 vs C8, V4 vs C4_S (and C4_B if available), V2 vs C2 if available. An angle of 90° to numerical tolerance 10^{-8} means disjoint supports / orthogonal subspaces. The Clebsch–Gordan types are recorded before the angles.

S6. A coincidence of counts means the nested dimensions match (276 ⊃ 8 ⊃ 4 ⊃ 2) but the concrete subspaces are orthogonal or otherwise distinct as representations (different CG types or different Hbits bidegrees). Same subspaces would require all principal angles of V8 against C8 to vanish.

## Hypotheses
H1. The two 8-dimensional cuts have different CG types (ours: 3⊗3', 3⊗5, 3'⊗5, Sym² 5; certificate: 1⊗4) and different Hbits supports (ours: pairs among H_10, H_16, H_18; certificate: H_0 with H_16 or H_18). They are orthogonal inside Sym² H64 for every energy-respecting embedding.
H2. Consequently V4 ⊥ C4_S and, when defined, V2 ⊥ C2. The matching numbers 8, 4, 2 are a coincidence of counts, not an identification of cuts.
H3. In particular the certificate’s energy resonance does not land on the four H13 pairing sectors, and our inversion/hopping cuts do not reproduce Q-stationarity or source-bright factorization.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

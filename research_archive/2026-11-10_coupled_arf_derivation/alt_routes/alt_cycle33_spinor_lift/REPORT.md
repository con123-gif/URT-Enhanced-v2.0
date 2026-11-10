# alt_cycle33 — pairing on the 2I spinor lift

Classification: PROVED on H1–H3 (the even channel still condenses and the zero mode is absent; the condensed spectrum is not three distinct levels).
Advances a physical ARF? No.

## Setup
Alt_cycle01 gives F = H13 ⊗ 2 ≅ 3·2 ⊕ 2·4' ⊕ 2·6 (dimension 26, no 2I-singlet) and vertex12 ⊗ 2 ≅ 2·2 ⊕ 2·4' ⊕ 2·6 (dimension 24, no singlet). The extra 2 in F comes from the extra A5-singlet in H13, which is not an icosahedral vertex and has no derived hopping; it is left as a decoupled spectator. The primary carrier is the 24-dimensional geometric spinor.

The kinetic operator is the spin Laplacian from the principal SU(2) parallel transport
U_{i→j} = exp(−i (θ/2) σ · n̂) along each edge of the inscribed unit icosahedron, with Tr U = 2 cos(θ/2) > 0. H¹(S², ℤ2) = 0, so the spin structure is unique up to gauge. Pairing is the archived spatial even frame tensored with the 2I-invariant symplectic form ε on the 2 (the singlet in 2 ⊗ 2 = 1 ⊕ 3): Δ_spin = Δ_spatial ⊗ ε. No spin-triplet pairing is introduced. No ARF comparison is performed on this route.

## Result

### Kinetics
K_spin is gapped: λ_min = 0.746746, with no eigenvalue below 10^{-8}. The control K ⊗ I_2 retains a 2-dimensional kernel, as required by the spatial constant mode. Face holonomies of the spin connection have mean trace 1.902113 + 0i = 2 cos(π/10) = 2 cos(18°), which is the spherical holonomy of curvature for a regular icosahedral face (solid angle Ω = 4π/20 = π/5, spin holonomy exp(−i (Ω/2) σ · n̂)). None of the 20 face products equals −I, consistent with the unique spin structure.

### Pairing does not by itself remove the scalar kernel
On K ⊗ I_2 with Δ ⊗ ε (unit even hat), two BdG energies remain at ~10^{-14}. Spatial Δ annihilates v0, and ε is invertible, so the kernel of K ⊗ I_2 survives as a pairing-unpaired doublet. It is the spin connection, not the pairing, that removes the zero mode.

### Condensation
The even-channel susceptibility at T = η is χ = 0.076728, twice the spatial χ_even ≈ 0.038416 to the expected spin degeneracy, and y_c = √(c_even/χ) = 0.004203 (spatial y_c / √2 = 0.004200). Any O(1) even Yukawa still condenses. At y = 1 the minimum is r_* = 1.73493×10^6, matching (nuclear norm of Δ_spin)/(4 c_even) = 1.71167×10^6 to 1.4%; the nuclear norm itself is exactly twice the spatial value 4.64038.

### Condensed spectrum
E_min = 0.746746, equal to the K_spin gap: the unpaired zero mode is absent, lifted by the spin connection rather than by pairing. The large levels reconstruct the spatial singular values, each tensored with the spin 2:

- 0.746746 (×2) — the former unpaired mode, now a gapped 2 of 2I
- r_* √(2/15) ≈ 6.33508×10^5, structurally a 6, appearing as three doublets split at relative ~5×10^{-8}
- r_* √(1/6) ≈ 7.08283×10^5, structurally a 12, appearing as six doublets split at relative ~8×10^{-6}
- r_* √(3/10) ≈ 9.50261×10^5 (×4) — the spatial doublet tensored with the spin 2

The pattern is 2 ⊕ 6 ⊕ 12 ⊕ 4, not three distinct positive levels and not three singlets. Leftover 2I multiplet structure (doublets and a 4) survives because Δ ⊗ ε is 2I-covariant and the spin connection does not break 2I.

## Verification
`/workspace/arf_research/alt_cycle33_spinor_lift/test_spinor_lift.py` and `results.json`.
Predeclaration sha256: `5a4062431318f8721cea277d629ddc867876297230efa45d05e6e7843913a11a`.

## Next obstruction
The spinor lift removes the unpaired zero (by the spin connection) but replaces it with a gapped 2, and it doubles rather than splits the pairing multiplets. Three distinct charged singlets are still not produced.

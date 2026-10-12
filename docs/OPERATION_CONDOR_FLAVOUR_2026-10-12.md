# Operation Condor — Target-Free Flavour Poles

**Date:** 2026-10-12  
**Status:** OPEN — active derivation  
**Gate:** Produce physical three-family poles and mixing from the typed H_64 history operator without observed-mass or angle anchors.

## Frozen premises (do not violate)
- H_64 = H_13 ⊕ H_51 is the history carrier. Do not tensor extra generation space.
- Species loading occurs **before** hidden elimination.
- Primitive charge words:
  - u = (1, 3, -4)
  - d = (1, -3, 2)
  - e = (-3, -3, 6)
  - ν = (-3, 3, 0)
- Typed Yukawa seed: Y_f^{(0)} = S + δY_f where S : 3 → 3' is the golden A4 bridge and δY_f = mat(Dz_f).
- Exact Feshbach map:
  Σ_f(z) = B_f (z I_51 − D_f)^{-1} C_f
  ℱ_f(z) = z I_13 − A_f − Σ_f(z)
- Physical poles selected by det K_f(z) = 0 after visible reduction.
- Residues Z_fi^{-1} = ℓ† K_f'(z_fi) r give mixing frames.

## Exact operator sequence (target-free)
1. Load species charge word onto the visible H_13 block (before any hidden reduction).
2. Construct the golden A4 bridge S and the species-dependent δY_f from the charge word.
3. Form the full H_64 operator with the loaded seed.
4. Perform exact Feshbach elimination of the H_51 hidden sector.
5. Reduce to the visible 13-dimensional kernel K_f(z).
6. Solve det K_f(z) = 0 for the physical poles (three expected per species if the generation structure is carried by the history).
7. Extract residues and diagonalizing frames to obtain CKM/PMNS without external targets.

## Computational certificate plan
- Implement the sequence in exact or high-precision arithmetic (Python + sympy or mpmath).
- Use only frozen constants: φ, Δ, η_Δ, 13-site spectrum, A4/A5 data.
- No observed masses or mixing angles may enter the construction.
- Certificate must report:
  - Whether three distinct positive poles appear per species.
  - Their approximate scales (to be compared later, not fitted).
  - Residues and resulting mixing matrices.
  - Explicit failure mode if the gate does not close.

## Theoretical push (artistic license)
The three singular scales already present in the archived visible-memory equation of H_13 (≈0.8555, 0.3168, 0.03208) are the natural candidates for generation projectors once the charge word is loaded. The Feshbach reduction should amplify or select among these scales rather than invent new ones. If the computation produces poles near these scales (or their images under the golden bridge), the generation structure is carried by the history carrier itself.

## Status discipline
- Success (three poles + frames without free parameters) → CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the continuum dictionary.
- Failure → record the exact obstruction; do not insert a free scale.
- Any numerical match to known masses is **not** validation until the poles are frozen first.

## Next commit
The computational certificate (code + results) will be added under `research_archive/` or `tests/` once executed.

---
Operation Condor is the active front. All subsequent flavour work must reference this file.

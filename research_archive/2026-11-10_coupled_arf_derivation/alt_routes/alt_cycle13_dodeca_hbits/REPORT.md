# alt_cycle13 — dodecahedral 4-split versus 4_3 / 4_5 via Hbits

Classification: PROVED on H1–H3.
Advances a physical ARF? No.

## Result
Icosahedral faces are dual to dodecahedral vertices, so the face-adjacency Laplacian Lface is the dodecahedral graph Laplacian. The 12-vertex module contains no copy of the irrep 4, therefore both 4s in the 20-face module lie in im Ph automatically.

On those two 4s one has Lface = 3 on im P3 and Lface = 5 on im P5, so
(4_3, 4_5) = (Lface-eigenspace 3, Lface-eigenspace 5)
exactly: P3 and P5 are the corresponding rank-four projectors (traces 4 and 4, P3 P5 = 0).

The native history embedding reproduces the archived identities independently:
Hbits Uh P3 = 18 Uh P3, Hbits Uh P5 = 16 Uh P5, and
(21 I − Hbits) Uh = Uh (3 P3 + 5 P5)
with intertwiner error 3.6×10⁻¹⁴. Thus 21 − {18, 16} = {3, 5} recovers the Laplacian eigenvalues. This canonically labels the two hidden quartets. It does not pick a fermion Yukawa ratio between 3 and 3'.

## Verification
`/workspace/arf_research/alt_cycle13_dodeca_hbits/test_dodeca_hbits.py` and `results.json`.
Predeclaration sha256: `4090a6b6cf77e3a11693e59b4dc2f7afd170a96a4c44425c2e0a766aa2292921`.

## Next obstruction
The hidden 4s are now geometrically identified; the fermion Yukawa space is not.

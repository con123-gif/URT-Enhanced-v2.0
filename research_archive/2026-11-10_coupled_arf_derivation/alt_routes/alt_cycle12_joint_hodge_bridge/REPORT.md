# alt_cycle12 — joint Hodge Laplacian plus the five-solid bridge

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
The archived operator Cbridge = Ctop + Cbulk was rebuilt from the five Platonic solids. It satisfies Tr Cbridge = 160, Tr(Cbridge²) = 800 and Cbridge ≽ 0.

Its restriction to the 12 icosahedral vertices is exactly 4 P_1 + 4 P_3, where P_1 is the vertex-constant projector and P_3 is the spatial-coordinate 3 (Frobenius error 0). Cbridge does not act on the 3' or the 5 of the 12-vertex module.

The spatial coordinates are eigenfunctions of the icosahedral graph Laplacian with eigenvalue 5−√5 ≈ 2.764 (the lower 3); the other 3 has eigenvalue 5+√5 ≈ 7.236. The joint operator Δ + Cbridge on the 12 vertices therefore has spectrum 4 (the constant), 9−√5 ≈ 6.764 (spatial 3), 6 (the 5) and 5+√5 ≈ 7.236 (the 3'). The two 3s are kinetically split.

An overall multiple of the joint kinetic can still be absorbed into the fermion normalisation, so the action scale remains free. Dimensionless Yukawa ratios are not fixed. The 3 versus 3' kinetic split changes how α and β translate into physical masses if both are present; it does not force either coupling to vanish.

## Verification
`/workspace/arf_research/alt_cycle12_joint_hodge_bridge/test_joint_hodge_bridge.py` and `results.json`.
Predeclaration sha256: `bd3e8ebd2bd8797420c35ab6d4a1068802b38efd91ee51090302df1c233d5c5c`.
Traces match 160 and 800; joint spectrum matches the predicted clusters to 10⁻⁹.

## Next obstruction
The coupled kinetic distinguishes 3 from 3' but does not fix a Yukawa ray or the overall scale.

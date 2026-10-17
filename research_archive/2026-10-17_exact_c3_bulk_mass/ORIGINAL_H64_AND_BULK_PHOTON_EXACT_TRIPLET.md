# Actual H64-to-A4 triplet mass projection and exact bulk photon response — 17 October 2026

Executed using the original cathedral_strict_64_closure.py, the unmodified species_data()/dressed_64() source, the original 125-simplex cone and original signed face chirality. No charged-lepton masses or Koide targets were inputs to either operator.

## Cellular 64-state source: exact physical distinction
The original coarse cellular D64 occupies 1+12+30+20+1 states; face states are at indices 43:63. Its geometric chiral hidden zero projector is P0=(5P3+3P5-iW)/8. Under an actual tetrahedral A4 subgroup P0 decomposes into a singlet and a rank-three triplet PT.

The 20-face projected resolvent of the **actual original source**, for each of u,d,nu,e, is:
G_T(z) = z(z²-17/4)/[(z²-3)(z²-5)] I3.
The associated energy-dependent Schur operator is
K_T(z) = [(z²-3)(z²-5)]/[z(z²-17/4)] I3.

Direct full 64x64 inversions at z=4 yield a=143/47, b=c=0, Q=1/3 on PT for all four species; maximum traceless Frobenius residual 1.41e-15. This is not a Koide physical lepton operator.

## Full 3D tetrahedral cone does not itself break A5 to C3
With the apex at the centre, every proper icosahedral rotation acts on all 13 vertices, 42 edges, 50 faces, 20 tetrahedra. A non-tetrahedral 72-degree A5 rotation explicitly gives oriented permutation matrices Pk for which b1P1=P0b1, b2P2=P1b2, b3P3=P2b3, and [L2_full,P2]=0, ALL exactly zero residual. C3 reduction needs a selected state/face/history source; geometry alone does not select one.

## Unfitted bulk-photon-induced geometric triplet
A *specified geometric source response*, not identified as the physical lepton Dirac operator, uses a C3-stable native triangle f=(0,2,1), its fixed face incidence effect Ef=(1/9)sum_(i in f)diag(c[:,i]) and the actual 3D Maxwell outer flux kernel G=L(I+L)^(-1), L=d2^T d2. Project the operator M=PT Ef G Ef PT onto the intrinsic rank-three complex chiral zero-mode space.

Using exact rational symbolic matrix arithmetic:
- Tr M = 12677/342144
- a=12677/1026432
- b=769/1026432
- |c|=4912/1026432 (chirality orientation fixes sign)
- Eigenvalues = 14215/1026432 and (11908±4912 sqrt(3))/1026432, all positive and nondegenerate.
- (b²+c²)/a² = 24719105/160706329 = 0.1538153796046203
- Q = 210144539/482118987 = 0.4358769197364135.
- |atan(c/b)|=atan(4912/769)=1.4155015019257822 rad.

This is a fully **computed positive three-level geometric response**, with both quadrupole and handed dipole, not a fitted Koide phase. It is not equal to the Koide constraint (b²+c²)/a²=1/2.

In the explicitly normalized C3 convention Q3=diag(2,-1,-1), R3=diag(0,-sqrt3,sqrt3), the exactly inferred target under exact Q=2/3 and supplied measured mu/e ratio is b/a=cos(delta)/sqrt2=0.6897191131126882, c/a=sin(delta)/sqrt2=0.15584461815233389, delta=0.2222220470730879. Here atan(c/b)=delta exactly; calling the two phases different due to 'linearization' would be an error.

The distinct signed-history H64=4End(V4) contains a conditional retained13/hidden51 positive rank-one cross-history coupling and an archived generation frame; no uniquely selected **20-face intertwiner** or photon current mapping that source to this geometric chiral PT is in the two original files. It cannot be silently identified with the coarse cellular 64-state operator.

## Reproduction
Current-conversation artifact: Cathedral_URT_actual_H64_bulk_triplet_2026-10-17.zip, containing:
- original cathedral_strict_64_closure.py
- full_cone_a5_and_mass_test.py and JSON/stdout
- exact_bulk_chiral_koide_certificate_fast.py and exact rational JSON/stdout
- RESULTS.md
- signed_history_64_result.json from independent rerun of the original golden_species_operators.npz.

This result replaces any unsupported claim that the central 3D cone automatically breaks A5 to C3 or that the native cellular H64 projects to the Koide mass operator. It is a local source-specific computation, not a global no-go.
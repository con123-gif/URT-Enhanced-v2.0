# Pre-registration: attachment's 13 -> 3 reduction via the Cathedral Transform (18 Oct 2026)

Written before computing. Transform: psi_k(n) = QR[exp(2 pi i delta_star k n/13) phi_k], delta_star = (80/81) pi/(13 phi),
phi_k = i^k (k=0..3), exp(2 pi i (k-4)/5) (k=4..12). Generation triplet = modes k = 1,2,3 (attachment's assignment).
Targets: Q = 2/3 (measured 0.66666446 +- 5.1e-6) and delta (measured Lode 0.22222476 +- 6.3e-6); masses from eigenvalues.
Pass = all three sqrt-masses positive, Q and delta both within 3 sigma.

## Claims checked as stated
- C1 Householder QR moves phi_k into R, out of psi: compare numpy QR output with phi_k-times-positive-diagonal-QR.
- C2 R_kk scales as delta_star^k: report R_kk and successive ratios.
- C3 phi_k shifts the Koide phase through the Schur complement: compute every spectrum below with and without phi_k.

## Mass tests
- A1 sqrt-masses = (R_11, R_22, R_33) of the raw delta_star-Fourier QR.
- A2 masses = (R_11, R_22, R_33)  (i.e. sqrt-masses = sqrt R_kk).
- B1 H = adjacency of the centred icosahedron (centre + 12 vertices, centre joined to all), node order: centre first,
     then the repo icosahedron() vertex order. H~ = Psi H Psi^dagger. M3 = Schur complement of H~ onto k = 1,2,3
     (eliminating k = 0 and k = 4..12) at z = 0. sqrt-masses = eigenvalues of M3.
- B2 as B1 with the graph Laplacian L = D - A.
- B3 as B1 but the Schur complement onto the full K4 block k = 0..3, then its k = 1,2,3 sub-block.

## Controls (reported, not pass routes)
- Dependence of B1/B2 on vertex numbering: 2000 random orderings of the 12 vertices.
- Overlap of the K4 span (k=0..3) with H's own 4-dimensional spectral sector.

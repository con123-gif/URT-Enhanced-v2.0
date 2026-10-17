# Native 3D Maxwell, Peierls chirality and three-generation splitting (17 October 2026)

**Executed positive mathematical result; does not assert a physical Koide mass prediction.** Reproducible complete NumPy package: conversation artifact `native_3d_photon_chiral_triplet_audit_2026-10-17.zip`, containing original `cathedral_strict_64_closure.py`, `native_bulk_peierls_check.py`, `native_chiral_selected_history.py`, README and machine-readable output.

## 1. Exact full tetrahedral-cone photon kernel
Using the original 125-simplex 3D cone (13 vertices, 42 edges, 50 faces, 20 tetrahedra), the coexact Maxwell link operator is (K=b_2b_2^T). The exterior 20-face flux covariance is **exactly**

[
G_{\partial}=L_f(I_{20}+L_f)^{-1},\quad L_f=d_2^Td_2.
]

The 50-face numerical projection residual is 4.55e-15. This restores the original golden face spectrum without any higher-derivative kinetic term. The separate pure 2D shell gives the flat projector (I-J/20). For the native face Laplacian the correct spectrum is (0(1),(3-\sqrt5)(3),2(5),3(4),5(4),(3+\sqrt5)(3)); thus (\operatorname{Tr}L_f^+=137/15), not 127/15. The claimed 5/6 fourfold pair was not the native dodecahedral spectrum.

## 2. Native chiral source with no shortest-path averaging
The original signed face chirality (W) has exactly 60 nonzero undirected pairs, each at distance 2 on the 20-vertex dodecahedral dual graph. Every such pair has a unique 2-edge geodesic. Thus any Peierls operator supported on (W) admits unambiguous native two-edge transport without an equal-shortest-path postulate.

For the explicitly **hypothesized** kinetic (H_{ab}[A]=|W_{ab}|\exp(i\int_{a\to b}A)) and existing normalized chiral density (\rho_\chi=(P_3+\Delta^2P_5-i\Delta W/\sqrt{15})/[4(1+\Delta^2)]), the full A5-symmetric state's dual-edge current is zero. This follows from symmetry: every undirected edge has a proper-rotation stabilizer reversing its orientation.

Conditioning on an individual native visible-vertex POVM effect via the Lüders rule gives a conserved nonzero current of norm 0.002521347848. The equal mixture of three vertex-conditioned states from one icosahedral triangular face is a **C3-symmetric preparation hypothesis**; its conserved oriented current has norm 0.001595591570, divergence norm 3.83e-12. The finite-difference source derivative and analytic Peierls current agree to 6.31e-12.

## 3. Actual sourced bulk Maxwell response and triplets
To couple the dual 30-edge current on its own links, construct the dual **polyhedral** cone with 21 vertices, 50 edges, 42 faces and 12 pyramidal 3-cells (125 total cells, not 125 simplices). The 12 exterior-pentagon flux covariance is (L_{\rm ico}/(I+L_{\rm ico})) with residual 3.17e-15. Driving (K A=g^2J_\chi) on its gauge quotient gives a **nonzero** sourced Wilson phase.

At unit dimensionless coupling (g^2=1), maximum outer Wilson phase = 0.000299407082 radians, and the explicit Hermitian Peierls kinetic projected on each native triplet has eigenvalues:
- T1: 1.999413629974, 1.999999980930, 2.000586336990;
- T2: 1.999950440854, 2.000000015149, 2.000049491891.

At the **conditional** previous fine-structure candidate (g^2=4\pi/137.035999178195), maximum phase = 2.7455999694e-5 rad and T1 triplet = 1.999946230519, 1.999999999840, 2.000053769203; T2 = 1.999995458166, 2.000000000127, 2.000004541269. No empirical lepton masses were inserted.

Gauge covariance of the full 20x20 hopping operator holds to 1.45e-15; its eigenvalues are invariant under arbitrary local U1 gauge transformations to 4.47e-15. Every one of 20 symmetry-related triangular-face selections gives the same full spectrum to 2.21e-13. Fixed-frame 3x3 projections are NOT themselves generally gauge invariant; compare full eigenvalues or properly transported subspaces.

**Identification still conditional:** the face kinetic (H=|W|), the specific POVM history preparation, photon coupling and interpretation as actual species-loaded H64 lepton pole masses have not been selected by the canonical URT physical action. The derived splitting is much too small and near-degenerate to be mistaken for observed e/mu/tau masses. The result supplies a verified 3D photon-current-triplet chain and a concrete candidate coupling, not an observed Koide phase derivation.

# 2026-10-15: Newton's Cathedral — 13-cell, augmented H64, full 125-simplex DEC and return-loop audit

**Status:** reproducible finite operator identities; physical gravity, flavour and gauge-scale identifications remain conditional or open. This note records the full investigation, including candidates that failed a stronger geometric or arithmetic test. It does not retire the canonical URT spiral, rail constants, KMS/BKM state or earlier history construction.

## Reproduction

Requires Python 3 and NumPy. From the repository root:

    python research_archive/2026-10-15_icosahedral_125_DEC_H64/cathedral_operator_audit.py
    python research_archive/2026-10-15_icosahedral_125_DEC_H64/cathedral_strict_64_closure.py
    python research_archive/2026-10-15_icosahedral_125_DEC_H64/cathedral_125_circumcentric_audit.py

The three scripts were executed successfully in the 2026-10-15 session before commit. They intentionally distinguish finite mathematical identities from proposed physical interpretations and from arithmetic checks of earlier formulas.

## Canonical inputs retained

- phi=(1+sqrt(5))/2, D=3, N=13, gamma=1/81.
- d_cl=3/20, d_star=(1-gamma)pi/(N phi)=80pi/(1053 phi), Delta=d_cl-d_star, eta_Delta=-ln(Delta).
- Hidden master state rho_star=[I4 (+) Delta^2 I4]/[4(1+Delta^2)]; p5=Delta^2/(1+Delta^2).
- Original URT dynamics: kappa=pi/e, golden-angle increment=2pi/phi^2, with phase-space/metaplectic implementation kept distinct from the positive Hermitian transfer operator.
- These are inputs to the present finite audit. The scripts do not independently prove the physical origins of every canonical input.

## A. Exact centred-cell and hidden-face construction — verified in defined complex

1. The centred graph has 13 vertices (one centre, 12 icosahedron vertices); shell has 30 edges and 20 oriented triangular faces.
2. The shell face-to-vertex incidence matrix C_inc is 20x12 of rank 12. Its left kernel is 8-dimensional: 4_3 (+) 4_5.
3. The oriented face Laplacian L_face=d2^T d2 has hidden restriction L_hid=3 P_4_3+5 P_4_5. The antipodal involution Gamma_F=-P_4_3+P_4_5 gives L_hid=4I_8+Gamma_F on this subspace.
4. The augmented coarse cellular carrier has 64 dimensions: 1 + 12 + 30 + 20 + 1. Its incidence Dirac operator D64 has exact boundary nilpotency and a Feshbach reduction to 13 visible states.
5. The complete cone triangulation has 13 vertices, 42 edges (including 12 radial), 50 faces (including 30 radial), 20 tetrahedra: 125 simplices (126 with augmentation). It is **not** identical as a cell decomposition to the coarse 64-state carrier.

For a hidden outer-face mode h with d2^T d2 h=lambda h, lambda in {3,5}, the full tetrahedral-face lift

    J_lambda h = [ h ; (1/lambda) d2 h ]

is 50-dimensional in the indicated orientation convention. It obeys d3_full^T J_lambda h=0 and has zero radial-edge curl. For the **unweighted combinatorial** full 3D Hodge Laplacian,

    Delta2_comb J_lambda h=(lambda+1) J_lambda h,

so the hidden eigenvalues become 4,6 (each multiplicity four), while their gap stays 2. The identity shift cancels in the normalized finite Gibbs state. The 3D lift and gap statement do not automatically carry over unchanged to an arbitrary metric-weighted DEC operator.

The rotational A5 carrier decomposition from the augmented 64-cell construction has four copies of each of 1,3,3-prime,4,5; in particular it has one visible and three hidden (3 (+) 3-prime) pairs. This is a **finite representation count**, not by itself proof of three Standard Model fermion generations or identification with the separately constructed six-bit directed history.

## B. Exact golden incidence hierarchy and finite transfer — verified

With L_ico=d1 d1^T on the 12 vertices,

    C_inc^T C_inc = 15 I_12 - 2 L_ico.

On 3 and 3-prime bands:

- Vertex-edge squared-singular-value ratio=(5-sqrt(5))/(5+sqrt(5))=phi^-2.
- Edge-face squared-singular-value ratio=(3-sqrt(5))/(3+sqrt(5))=phi^-4.
- Vertex-face squared-singular-value ratio, taken 3-prime/3,=(5-2sqrt(5))/(5+2sqrt(5))=phi^-6.

The factors arise from fixed incidence matrices without fitted scalar multipliers. The positive contraction T_cell=D64^T D64/20 gives a concrete B^T B realization for this complex; it has not been identified with the full canonical physical T_star.

## C. Dressed H64 / flavour determinant — exact formal reduction, physical identification open

Four aligned W=(3 (+) 3-prime) carriers produce an invariant interacting 24-state operator with off-diagonal incidence blocks J_v, J_f and a specified Y_f. Bipartite rearrangement gives K_f=[[J_v,0],[Y_f^T,J_f]], hence

    det(zI_24-D24_f)=det(z^2 I_12-K_f^T K_f).

Triangularity fixes det(K_f)=320 sqrt(5) independently of Y_f. Direct roots of the original candidate dressed operator are order-one cellular spectral roots; three physical masses do **not** follow from merely selecting three of them.

The inverse's vertex-to-face block is

    G_f=-J_f^-1 Y_f^T J_v^-1.

Closing it through the vertex-face incidence map gives a candidate return loop L_f=J_inc G_f. With the chosen unitary phased three-cycle bridge and Delta set to zero, its singular values are precisely phi^2/2 (multiplicity three) and phi^-2/2 (multiplicity three). The resulting ratio is phi^-4. With Delta retained, each triplet splits weakly by species; the computed spectra appear in cathedral_125_circumcentric_audit.py.

Charge words are linear combinations of Y and weak-isospin generators in a two-dimensional traceless plane, **not four mutually orthogonal vectors**. For example z_u dot z_d=-16. A zero-diagonal unitary 3x3 matrix is a phased three-cycle (one of two orientations), but charge-matrix Hilbert-Schmidt orthogonality alone does not force a zero diagonal or determine the Hopf phase. The earlier symmetric zero-diagonal S was not unitary. A phased three-cycle used in the script is therefore an explicitly selected admissible seed, not yet a uniquely derived physical Yukawa intertwiner. Physical CKM, PMNS and mass scales remain open.

## D. 3D gravity/area susceptibility — record the exact distinction

The full tetrahedral lift has zero radial-edge curl and vanishing 3-volume boundary; these are exact incidence identities.

A proposed fixed-volume model assigned Hodge-star inverse scalings for shell edges and shell/radial faces. Within that **assigned-star model**, the lifted-mode Rayleigh quotient is

    R_assumed(lambda;t)=(lambda+1)^2/[lambda exp(t)+exp(-2t)],

giving at t=0 the eigenvalues lambda+1, derivatives 2-lambda and the normalized gap susceptibility a=-1. Consequently the conditional entropy-area factor is

    A0/(4 ell_P^2)=4 eta_Delta^2 p5(1-p5)=0.000890973183716.

This is an algebraically correct consequence of **the assigned Hodge weights**, not an established result of actual circumcentric dual volumes.

Using explicit primal and circumcentric dual measures for a constant-volume family of 20 identical tetrahedra, the separate *geometric* Rayleigh quotients on the same lifted vectors are R_3(0)=4.399063348 and R_5(0)=6.193735562. Their gap log-area derivative is approximately -3.23259663, not -1. Their Hodge-star derivatives are not the previously assigned pure exponents. Moreover these are Rayleigh quotients, not yet eigenvalue branches of the full metric-dependent Laplacian. Neither -1 nor -3.23259663 is thereby established as a universal gravity susceptibility. Obtaining physical G additionally needs the continuum/coframe and causal-diamond volume/area identification, with no externally inserted gravitational scale.

## E. Electroweak running — corrected arithmetic, scale identification open

The correct first-order Standard Model slope for the adopted simplifying inputs is

    sin^2(theta_W)(MZ) ≈ 3/8 - [109/(48 pi)] alpha_EM(MZ) Delta_t.

An earlier script used twice the slope and produced the wrong values for other observables. With *measured* alpha_EM(MZ)^-1=127.951 and the **proposed** modular interval Delta_t=4 eta_Delta+ln4=25.369486308085, the formula evaluates to sin^2(theta_W)=0.231681129459.

This is a conditional arithmetic agreement. The proposal Delta_t=4 eta_Delta+ln4 is not yet derived as a physical energy-scale ratio; measured alpha_EM(MZ) is an external input. Using the same unthresholded one-loop Standard Model running to obtain all three gauge couplings gives alpha_s(MZ)≈0.07059125, rather than the cited experimental 0.1180. A finite threshold derivation must account for this without fitted counterterms. No scale/alpha_s closure is claimed.

## Rejected shortcuts / provenance preserved

- Arbitrary scalar multipliers in the earlier mass and CKM/PMNS table: explicitly not first-principles; original audit computes their actual output and reports disagreements.
- Identifying every 64-state geometric copy directly with a physical generation: unproved.
- Declaring any zero-diagonal unitary uniquely selected by the charge words: unproved.
- Equating a prescribed DEC scaling family with actual circumcentric geometry: contradicted by the explicit geometric audit for the examined metric family.
- Declaring all gauge couplings unified from only the weak angle: not supported by joint RG running.

These findings are **local audits of named constructions**, not global no-go theorems for Newton's Cathedral/URT. Preserve all earlier canonical closures unless an independently demonstrated contradiction specifically applies to them.

## Executable source files

- [cathedral_operator_audit.py](cathedral_operator_audit.py) — 13-cell and 64-state operators, hidden face sector, scalar-claim arithmetic.
- [cathedral_strict_64_closure.py](cathedral_strict_64_closure.py) — 125-simplex lift, exact 64-to-24-to-12 determinant, finite roots and weak-angle coefficient.
- [cathedral_125_circumcentric_audit.py](cathedral_125_circumcentric_audit.py) — metric-dependent DEC duals, return loop, golden-ratio ratios and candidate RG interval.

**Next mathematical interfaces (without re-opening established finite identities):** actual metric-eigenbranch susceptibility and entropy coupling; unambiguous symmetry/cycle/phase selection for the species Yukawa map; physical three-generation reduction and absolute masses; three-coupling threshold matching from specified cellular representations.

## Supplement: entropy, finite selection and possible force response (15 October)

- [Entropy–gravity–force derivation and qualification ledger](ENTROPY_GRAVITY_FORCE_BRIDGE.md).
- [Executable smoothing, quadrupole isometry, BKM Hessian and force checks](cathedral_entropy_force_bridge.py).

New **exact finite identities**: on the visible 12-vertex carrier M=(L_ico+11^T)/20 the normalized quadrupole amplitude contracts by 1/2 each iteration, while its squared geometric asymmetry contracts by 1/4. The canonical projector is P_5=-(1/24)L(L²-10L+20I), with Q-Gram=(8/5)P_5. The vertex-to-face fiveplet map J_5=C_inc P_5/sqrt(3) is isometric and obeys L_face J_5=2J_5. The off-block quantum relative-entropy Hessian agrees with chi_35=8eta(1+Delta²)/(1-Delta²).

New **interpretive distinction**: in the test family the ordinary spatial Shannon entropy *increases* as the quadrupolar inhomogeneity decreases. This is not a derivation of cosmological low gravitational entropy; in 3D the Weyl tensor itself vanishes. A physical force also requires full free-energy differentiation: entropy alone does not supply the energy contribution, bath temperature, physical units or gauge connections.

## Supplement: kissing contacts vs shell entropy-production dynamics

- [Exact 12-contact / 30-edge distinction, entropy theorem, and reversible 5+5 generator](KISSING_FRICTION_ENTROPY.md).
- [Standalone executable operator checks](cathedral_kissing_entropy.py).

**Exact finite result:** the true 12-contact star has spectrum 0, 1(x11), 13, and eliminating its centre does not generate golden-ratio sector splitting. The regular icosahedral shell has 30 **neighbour interactions, not literal outer-sphere contacts**. If symmetric diffusive exchange is posited on that graph, Shannon entropy production is exactly nonnegative and its small quadrupolar coefficient is 45 k_B Gamma ||Q||². A skew 5+5 vertex-face rotation can coexist with positive Laplacian dissipation. **Physical Gamma, the 4D gravity/gauge dynamics and primordial global low entropy remain underived.**

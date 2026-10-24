# Native 20-face photon-current Hessian: exact two-sector source response (24 October 2026)

**Derived from original native face hops, no measured or candidate alpha.** This is a conditional but *source-first* free-Fock gauge response, not an inferred Maxwell coupling. It is independent of the previous numerical A4 Wilson calculation and the Coulomb spectral bridge.

## Source definition and exact discrete physics
Reconstruct 12-vertex icosahedron, its 20-face dual dodecahedron (30 oriented links), and 60 unique shortest two-link dual paths connecting pairs of face vertices with one shared icosahedron vertex. Define the unit-hopping Hermitian 20x20 matrix H0 with H0[a,b]=1 on these 60 pairs (unit hopping is an **explicit modelling hypothesis**). A source A on the 30 links supplies Peierls factors exp(i q_ab·A), with signed integral path vectors q_ab.

Full gauge-covariant finite free-Fock functional:
  Omega_beta[A] = -Tr log(1 + exp(-beta H[A])).
The current-current second derivative **and** Peierls contact second derivative are both included:
  Pi_ef = beta Tr[n_F(H0) H_ef] + beta Tr[Dn_F(H0)[H_e] H_f],
  n_F(E)=1/(1+exp(beta E)).
This source functional has no bare Maxwell coefficient, electron charge scale, observed masses or fitted alpha.

H0 spectral table (energy, multiplicity): (-3,4),(-2,5),(1,4),(2,6),(6,1).

The 30 oriented dual links decompose into 19 gauge-null link-gradients and 11 physical cycle directions. With K=dF dF^T the exact geometric coexact Maxwell operator, define
  P5 = -K(K²-10K+20I)/24, rank 5 (K eigenvalue 6),
  P6 = I-P0-P5, rank 6 (K eigenvalues 5-sqrt5 and 5+sqrt5).
The exact source Hessian reduces for all positive beta to:
  **Pi(beta) = h5(beta) P5 + h6(beta) P6.**

## New analytic exact-rational coefficient formulas
Put n_x=1/(1+exp(beta x)), and D_xy=(n_x-n_y)/(x-y) for x≠y, D_xx=-beta n_x(1-n_x). Let
  F(beta) = (6/5)n_-3 + n_-2 - (2/5)n_1 - (6/5)n_2 - (3/5)n_6.

Then spectral projectors computed by **exact SymPy rational matrix arithmetic** give

  h5(beta) = beta*[F + (14/15)D_{-3,-2} + (16/15)D_{-3,1}
                        + (56/15)D_{-2,2} + (94/15)D_{1,2}],

  h6(beta) = beta*[F + 2D_{-3,2} + (20/9)D_{-2,-2}
                       + (2/9)D_{-2,1} + (32/9)D_{1,1} + 4D_{2,2}].

All rational coefficients were obtained from exact polynomial projectors on the integer H0 and K matrices, including the contact term. They were NOT fitted to numerical Hessians, observed alpha or each other. Direct independently assembled 30x30 Hessian matches this decomposition with 2.33e-14 Frobenius error at beta=eta_Delta; Ward residual 2.55e-14.

## Dynamically derived stability thresholds in the declared free model
Root of h6(beta)=0 at beta_c,6=0.913084300421373.
Root of h5(beta)=0 at beta_c,5=1.356292132649312.
At beta=1: h5=-0.126694060551362, h6=+0.040753186332188.
At the **existing rail** clock beta=eta_Delta=5.995797986741302:
  h5=5.900702960956777 (five directions),
  h6=10.02540867763589 (six directions).
All 11 physical cycle directions are locally positive when beta exceeds the latter threshold, in this finite model. Whether URT selects beta by such a criterion is NOT derived: it would be a new physical postulate if imposed now.

## One-gauge-coupling identification does NOT follow
The native DEC Maxwell K has 11 positive eigenvalues (5-sqrt5)x3, 6x5, (5+sqrt5)x3. The induced Hessian instead has h6 equal on both triplets. Unless h6=0, Pi is NOT a single scalar multiple of K for any beta. At entropy clock, effective ratios Pi/K for the three subspaces are respectively 3.62722694,0.98345049,1.38547740, so no unique finite photon wavefunction normalisation emerges. This is a precise **model-local** difference, not a rejection of a genuine 4D coarse-grained continuum, where modes could flow together.

## Integrating with the new 137 Coulomb identity
Separately, the independently proved native *static* dodecahedral Green trace obeys 15Tr Ldual+=137=12+20+105, with chiral W-sector Coulomb responses 12 and20 matching separately the charge-squared traces of leptons and quarks. Those chiral response eigenspaces are 4+4-dimensional on 20 dual vertices. The Peierls photon Hessian here lives in a different 30-link 5+6-dimensional *cycle* carrier. Conflating the two would be an incorrect physics identification. A typed physical source map must be derived before matching the integers to the 4D photon coupling.

**Physical status:** New exact current/contact response, gauge nullity and critical clock; alpha(0) still not derived. Full source-loaded selected H64 action, physical clock, unique continuum Maxwell kinetic residue and charge normalisation remain open. No observational alpha input was used.

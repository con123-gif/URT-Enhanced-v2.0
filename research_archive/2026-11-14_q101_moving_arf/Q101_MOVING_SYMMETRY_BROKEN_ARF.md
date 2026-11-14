# Q101 — Derived moving-frustration response laws, not the frozen four ARFs

**Date:** 2026-11-14. **Status:** Exact finite mathematical theorems for the specified frustration, 190-cochain source geometry, hidden-sector and 64-history embedding. **Conditional kinetic completions** give a new single determinant ARF and a nonequilibrium 24-track signed-current law. **The physical Maxwell and fermion mass ARFs remain unproved.** No measured masses, old ARF coefficients or fit parameters were used.

## Why this is a correction and not a repetition

The user explicitly corrected the preceding route: URT and the four old ARF equations are provisional; symmetry breaking comes from a moving, mismatched, 12-contact-plus-centre configuration and the golden phase, not a static A5-invariant original action or an obligatory 'URT chooses histories' rule. The saved November 11 Library coupling-selector, mismatch, emergent-time and hidden-W notes were recovered in Q98 (`research_archive/2026-11-14_symmetry_breaking_recovery/`). The original face-local source theorem (Q97) and the existing 190/64/24 transfer are historical constructions, **not constraints on the new microscopic law**.

Earlier evidence is credited: the original icosahedral 20×12 incidence and eight hidden modes with W²=−15(P3+P5), the 50→8→12 all-five harmonic portal, the H64 hidden partial isometry Uh, and the golden 24-track winding ε=π/(3φ¹²) are pre-existing exact algebra. The **new** result is the full dynamic graph of frustrated minima, its exact hidden 4_3×4_5 moving-source chiral cocycle, its A5 decomposition and a closed, fully factored magnetic characteristic response.

## I. Exactly solved frustrated ground states, with a genuinely selected broken background

On the original icosahedral graph with twelve vertices and thirty edges, put s_i=±1; include a centre s_0=±1. With **explicit model premise** that outer antiferromagnetic edges have unit weight and the centre–outer ferromagnetic contact has weight φ, set

    E(s_0,s)=sum_{<ij> outer} s_i s_j − φ s_0 sum_i s_i.

After minimizing over s_0, the exact integer minimum-outer-energy table as a function of |M|=|sum_i s_i| is

    |M|             0     2     4    6     8    10    12
    min outer E   −10    −8    −6    0    10    20    30
    degeneracy     72   240    60   40    72    24     2.

The global minimizers at φ are **60 states**, each of outer E=−6 and |M|=4, with total E_min=−6−4φ. The same manifold minimizes the energy for **every central weight 1<t<3**: φ is not being tuned to produce 60. The 60 states split into two 30-state A5 orbits related by global spin flip. A selected pure ground state breaks A5 to a C2 stabilizer (a symmetry-preserving mixture of all ground states does not). The unbroken-triplet 'mass splitting impossible' objection from Q97 thus does not apply to this revised pure-state model.

In the exact geometric 3 carrier, compression of the signed contact S=diag(s_i) has eigenvalues

    {0, (5−√5)/10, (5+√5)/10},

and therefore the nonzero response ratio is φ⁻². For aligned centre-contact occupancy n_i=(1+s_0s_i)/2, every one of the 60 vacua instead yields **three distinct positive** eigenvalues

    {1/2, (15−√5)/20, (15+√5)/20}.

This is the universal *geometric contact* response of the chosen microscopic model, **not** a derivation of electron, muon or tau masses. Neither a Yukawa map nor a physical dimensionful scale follows merely from it.

## II. Movement turns on a chiral current that every static ground state lacks

Reconstruct **all five Platonic C0–C1–C2 complexes** (dimension 190, Tr D²=720, Tr D⁴=3456), their 50-vertex eight-harmonic portal E, the original icosahedral I, Plinear=I E^T, original 20-face incidence C and hidden P3/P5, and the original H64 isometry Uh (Uh^T Uh=Ph). The 50-vertex *minimum-norm lift* of a contact spin word s is v50=E I^T s; the source seen by the icosahedron is x=Plinear v50=I I^T s. **The lift is an explicit operational premise**; it is not derived from a primitive physical matter measurement.

For each of the 60 configurations a, let f_a=(C x_a)∘(C x_a), h_{3,a}=P3 f_a, h_{5,a}=P5 f_a. Let W be the original oriented face operator: W^T=−W, W²=−15Ph, L_face W+W L_face=8W. The exact source-to-source parity-odd geometric kernel is

    J_ab = h_{3,a}^T W h_{5,b} / √15.

Every static ground state has J_aa=0. **But on every minimal Hamming-distance-two transition** between distinct frustrated minima,

    J_ab = ±8/√15,       J_ba=−J_ab.

This was checked in exact arithmetic on every such directed edge, not just a numerical example. The different original unprojected 12-contact source gives ±32/√15; the proper **full-five portal** changes it to ±8/√15. This corrected factor is essential and explicitly avoids discarding the five-solid geometry.

The 60 minimum-energy states split into two connected components of size 30 under minimal two-spin changes. **Each 30-state graph is isomorphic to the rectified icosahedron**, with 60 edges and degree four. Define B_ab=J_ab/(8/√15) on minimal links and zero otherwise. Then B^T=−B, B1=0, and every vertex has exactly two +1 and two −1 directed links. The same B may be embedded into the 64-history carrier using W64=Uh W Uh^T and y3=Uh h3, y5=Uh h5.

For either 30-state orbit, the **exact, integer-characteristic spectral polynomial** is

    det(zI−B) = z^12 (z²+5)^4 (z²+8)^5.

This yields the single geometry-derived resolvent response

    R_motion(z) = Tr(zI−iB)^−1
                = 12/z + 8z/(z²−5) + 10z/(z²−8).

All coefficients and multiplicities are fixed by the derived motion graph; no four prior ARF terms or physical target were inserted. This is an **internal dynamic source ARF** and not an observed particle propagator.

## III. A single magnetic Peierls ARF, valid at any phase

**Kinetic completion premise:** promote the integer oriented ground-state links to unit-magnitude Hermitian hopping amplitudes, carrying the 24-track per-link residual phase α=ε/24, ε=π/(3φ¹²). Thus H_α has H_ab=e^{iα B_ab} for graph edges and 0 otherwise, or equivalently H_α=A cosα+iB sinα, where A is the rectified-icosahedral adjacency. This is **not** the old Hbits action and it is **not** forced by bare geometry: this simplest local Peierls rule is a proposed replacement dynamical law, with no free fitted coefficients.

Writing c=cosα, the **exact magnetic determinant ARF** for either 30-state orbit is

    P(z;c) = det(zI−H_α)
           = (z−4c)
             (z²−2cz−4c²)^3
             (z²−5+4c²)^4
             [z³+2cz²+(4c²−8)z+8c(1−2c²)]^5.

Consequently a single response generator replaces arbitrary independent poles:

    R(z;c) = ∂_z log P(z;c).

The group-theoretic proof uses the **actual proper A5 action** on the 30-state orbit, with decomposition 1+3+3′+2·4+3·5. On the multiplicity-one irreps, B=0 by Schur's lemma; the double 4 carries a 2×2 skew mixing with eigenvalues ±i√5; the triple 5 carries a 3×3 skew mixing with ±2i√2 and zero. The 20 geometrical triangles have oriented flux ±3α (10 of each), hence Tr H=0, Tr H²=120, Tr H³=120cos(3α); these fix the quintet cubic. Independent exact checks: all 60 proper A5 automorphisms preserve A,B; 17 distinct Cayley rational values prove a degree≤16 **integer-matrix annihilator identity** for all phases; and the exact 30×30 characteristic polynomial at c=−3/5,s=4/5 matches the factorisation entrywise/algebraically. At α=0 the formula reproduces the rectified-icosahedral adjacency characteristic polynomial; at α=π/2 it reproduces the signed current polynomial.

The associated flux and spectral response are physically suggestive but not yet an electromagnetic coupling: **an internal 30-configuration Peierls phase is not by itself a 4D Maxwell photon or a charged 192-state Wilson current**. A distinct source-to-physical-current normalization and spacetime/gauge join remain necessary.

## IV. Non-equilibrium response is nonzero when the 24-track mismatch drives movement

There is a **different, conditional positive-transfer completion**, the unique maximum-entropy nearest-neighbour Markov transition under a *declared* log-odds affinity 2αB_ab on each edge:

    T_α,ab = 1_(a~b) exp(α B_ab)/(4 coshα)
           = [A_ab+tanhα B_ab]/4,    α=ε/24.

Because B has two outgoing and two incoming edges from each vertex, T is doubly stochastic and the stationary distribution is uniform on 30 states. It **does not** obey detailed balance for ε≠0. The signed current per transition and exact 24-track entropy production are

    <B_link> = tanh(ε/24),
    <C_24> = 24 tanh(ε/24) = 0.00325219765489755466...,
    Σ_24 = 2 ε tanh(ε/24) = 8.81399137604988185e−7... >0.

These are derived zero-fit **model response functions**, under the explicitly selected maximum-entropy affinity rule. The conversion of a *phase mismatch* into a *real log-odds affinity* is **not forced by the π–φ–e primitive**. In the alternative Hermitian Peierls action, one derives different dynamical observables from R(z;c); conflating the two completions would be another unjustified ARF selection.

The two 30-state branches have the same signed flow (the quadratic source is invariant under global spin flip), so this construction does **not** automatically identify its current with matter–antimatter excess. Reversing the geometric orientation sends B→−B, flipping current signs while preserving spectral roots. Physical CP and a unique cosmological branch remain open.

## V. Exact status and limitations of the user-requested physical ARFs

**Achieved:** a single closed spectral **replacement candidate ARF** generated by motion, and an independent driven-current law from the whole-five portal, exact eight-dimensional hidden sector and original H64 embedding, with symmetry spontaneously broken by the 13-contact frustration. This is substantive new mathematics not based on fitting the four historical ARFs.

**Not achieved:** a theorem forcing the Ising coupling energy and minimum-norm spin lift from the complete URT π–φ–e recurrence; a unique physical choice between Peierls/unitary and positive Markov response; a physical charged H13⊕H51↔192-Wilson current with first/second Ward contacts; Maxwell IR stiffness, physical charged masses, the full dynamical continuum/gauge/gravity join, or a measured matter–antimatter prediction. The 190 cochains and H64 are represented in the source/embedding, **not yet coupled dynamically to the new 30-state configuration graph**. D6→H3, the Golay/Leech code and the rest of the moving full Cathedral remain part of the programme, not silently collapsed away.

**No physical four-ARF claim is made.** Counting the model's new response laws as the original four physical ARFs would be another unsupported identification. The result should replace the frozen-history-only assumption at the active derivation frontier and should be used to construct and falsify a source-driven physical dynamics without fitting.

## Certificates and provenance

Both were executed locally, exit code zero, using original geometric operators and no random matrices:

    OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py
    OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-14_q101_moving_arf/MAGNETIC_ARF_FACTOR_CERTIFICATE.py

They independently reconstruct all five solid Hodge complexes, full 50-vertex portal, H64 hidden eigenspaces and graph; symbolic source-current amplitudes for all minimal transitions; exact 30×30 characteristic polynomial; A5 covariance and interpolation checks. GitHub CI pending.

**RESUME HERE:** integrate the moving-ground-state Peierls/Markov source with the original gauge-covariant 192-state charged Wilson operator (not a synthetic stand-in), derive its kinetic normalization from the full π–φ–e positive transfer, and compute charged pole/current residues. Do not assume the old ARF outputs or the old stationary Hbits law.

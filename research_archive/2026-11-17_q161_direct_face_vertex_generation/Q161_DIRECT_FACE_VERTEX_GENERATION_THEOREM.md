# Q161: original nonlinear face-to-vertex source produces full-rank three-channel chiral bridge
17 November 2026. Status **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.

## Direct solution to the conditional rank-two source-localization limitation
The previous Q161 theorem uses the genuine original all-five 190-cochain -> 50-to-8-to-12 harmonic contact source and the actual frustrated +4 spin ground branch to construct Kgen=C^T(P3⊙P5)C. A simple contact-occupancy interpolation produced a rank-two 3-to-3prime bridge with one zero singular value. **Do not introduce an ad hoc KMS rank-one correction to hide that zero.**

Instead use the **existing ORIGINAL Q101 nonlinear face source** f_s=(C Pl s)⊙² and return it with the already native incidence C^T to the original contact space: a_s=C^T f_s. In the two native irreducible triplet channels (the spectral projectors Plo,Phi of Kgen), form the declared source-multiplication chiral bridge Y_s=Plo diag(a_s) Phi. This uses no new fitted coefficient, no invented graph, and no externally observed mass. This is a mathematically natural, but not yet dynamically forced, coupling contraction.

## Exact outcome (no fit)
For each of all 30 symmetry-related original frustrated M=+4, E=-6 ground words, the 3x3 matrix Y_s has rank THREE. Its three nonzero squared singular values have the EXACT cubic polynomial:

(125 x - 169)(15625 x^2 - 13375 x + 961)/1953125 = 0.

Equivalently, the singular values in ascending order are sqrt((107-39sqrt5)/250)=0.2813776741499453, sqrt((107+39sqrt5)/250)=0.8813776741499453, and 13sqrt5/25=1.162755348299891. They satisfy the exact source-amplitude sum rule smallest + middle = largest. Their sum of squares is exactly 276/125.

An independent exact SymPy calculation on an original ground source proves the cubic and rank-three identity; A5 source covariance and a separate exhaustive numerical check establish the same three singular values for every one of 30 ground words (absolute error <2e-12). This is stronger than symmetry-averaged Kgen: its spontaneous source does not force threefold spectral degeneracy and does not need a new scalar parameter to lift a zero.

## Precisely what this means for physics
This is a parameter-free **candidate three-channel chiral source operator**, NOT a derivation of charged-lepton or quark Yukawa matrices, CKM/PMNS, an electroweak Higgs vacuum, or dimensional masses. The microscopic H64/24-clock/Q96 charged action must determine whether the multiplication map a_s -> diag(a_s) is actually the physical vertex, with its correct gauge intertwiners. Its natural singular ratios are not asserted to match measured particle masses. Do not fit them.

## Reproduction
Run Q161_DIRECT_FACE_VERTEX_GENERATION_CERT.py; it reuses the already registered exact original-incidence Q161_SOURCE_SELECTED_GENERATION_CERT.py. The prior original five-solid upstream Q101 construction remains intact. Exact polynomial and all 30 orbit singular checks executed successfully locally; GitHub CI must independently verify this committed version.

## RESUME HERE — the actual physical gate
Build the H64/H13+H51 and 24-clock equivariant action that supplies a charged Q96-compatible vertex. Test the actual Y_s for charge-Ward and chiral electroweak selection; derive absolute source kinetic normalisation and physical mass eigenvalues from that same action. This should replace further arbitrary source-to-mass polynomials.
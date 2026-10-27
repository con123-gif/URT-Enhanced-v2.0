# Newton's Cathedral: symmetry-selected gauge circulation on the 64 histories
Date 2026-10-27. FIRST-PRINCIPLES FINITE THEOREM FOR THE SPECIFIED CARRIER.
Status: exact signed-history combinatorics + independently executed eigenmatrix response.
PHYSICAL FINE-STRUCTURE CONSTANT NOT DERIVED.

## Input from finite Cathedral (no measured alpha)
Take the ideal icosahedral 12 vertices (0,±1,±phi), (±1,±phi,0), (±phi,0,±1). Their six antipodal axes give the signed history set X={0,1}^6 (64 points).
Let pair-flip adjacency connect binary words x,y when they differ in exactly two coordinates:
 H8=15I- sum_{i<j} X_i X_j.
Parity of bitcount is conserved: X_even and X_odd each contain 32 histories and 240 unoriented edges (total 480). Both components have H8 Laplacian spectrum 0(1),10(6),16(15),18(10).

The proper icosahedral rotation group A5 is order 60, and the full graph isometry Ih is order 120. Determine the actual induced **signed** action on six antipodal axes, NOT the unsigned permutation of labels. This is the geometrically necessary action on X and pair-flip edges.

## Exact invariant cycle count
For each connected parity component define C0=R^{32} (vertex functions) and C1=R^{240} (antisymmetric directed edge cochains), with divergence B:C1->C0. The finite symmetry groups act by signed permutations on directed edges.

Burnside averaging gives:
                 dim(C0^G)   dim(C1^G)  dim(H1^G)
  proper A5          2            3          2
  full Ih            2            2          1

Here dim(H1^G) = dim(C1^G) - dim(C0^G) + 1, because each parity graph is connected and taking invariants commutes with cohomology over R for finite G.

Thus full icosahedral symmetry selects a UNIQUE (up to multiplication) gauge-inequivalent harmonic 1-form in each parity history graph. Inversion is a substantive restriction, not known to be physically obligatory for the electromagnetic current. The two parity components each contain a copy; no choice of the physical parity/chirality sector has been demonstrated.

## Integral holonomy and normalization
Reynolds averaging of oriented edges gives two independent Ih-invariant edge vectors v,w, each supported on 60 edges with coefficients ±1. One sign of their sum is exactly divergence-free:
 b_raw = v - w,
 B b_raw=0,
 ||b_raw||²=120.

Compute fundamental cycle periods by gauge-fixing b_raw to zero on a spanning tree. The gcd of all independent cycle periods is EXACTLY 2. Consequently the primitive holonomy representative is b=b_raw/2 with:
  gcd(cycle integrals)=1,   ||b||²=30.
This fixes the relative U(1) loop-phase unit in the specified harmonic class without experimental input. A harmonic representative can have half-integer individual edge entries because its *closed-loop* periods, which are gauge-invariant, are integers.

## Canonical finite heat susceptibility
Use a compact magnetic connection L(a) on the same 32-history graph:
 L(a)_{uv}=-exp(i a b_uv) on an oriented edge, conjugate on reverse edge; L(a)_{uu}=15.
This is gauge-covariant. Set the fixed Cathedral selection depth eta=-ln Delta, Delta=3/20-80pi/(1053phi).
 Z(a)=Tr exp[-eta L(a)], Gamma(a)=-ln Z(a), K=Gamma''(0).
The curvature is derived by the exact full Kubo/Duhamel Hessian including both contact/seagull and current-current terms.

Since b is divergence-free, the uniform ground eigenvector u has L'(0)u=0. Its eigenvalue curvature is therefore exactly
 lambda0''(0)=u^T L''(0)u = (2/32)||b||²=60/32=15/8.
The first excited eigenvalue is 10, so at eta≈5.9958:
 K = (15/8)eta + exponentially suppressed corrections O(poly(eta)exp(-10eta))
   = 11.24212122513994 ... (finite 32x32 Hessian directly computed).
Both parity sectors produce the identical value. No alpha values were used.

If, **as an additional unproved identification**, one equates this 1-dimensional history-loop stiffness with a physical unit-charge 4D photon inverse kinetic coefficient, then 4pi K=141.272661806662..., which does not equal observed inverse alpha ~137.036. Therefore this provisional identification is NOT a completed fine-structure derivation. It would be numerology to append a golden-ratio correction merely to repair the difference.

## What the theorem actually achieves
It derives a preferred geometric U(1)-like circulation channel (modulo parity) from the whole 64-history icosahedral geometry and computes an exact unfitted dynamical stiffness from the frozen Delta. Thus the chronology geometry -> selected phase flow -> primitive loop -> response is a concrete *mathematical* process, not a numerical reconstruction of alpha.

The missing physical identification is the actual source-loaded H64 charge/current action and its 4D photon kinetic pole. Recovered archive code `research_archive/2026-10-17_full_six_triplet_photon/native_bulk_peierls_check.py` defines g2=4*pi/137.035999178195 from the prior candidate, so its downstream photon amplitude cannot be used for a first-principles alpha claim. Future calculation must preserve full 13+51 Schur determinant, derive the gauge-covariant history windings, and compare the properly normalized physical Coulomb residue, without introducing any target-dependent coefficient.

Reproducible standalone proof/test written in this conversation to `/mnt/data/cathedral_first_principles_64_circulation.py`, executes PASS on both parity sectors (numpy/networkx/scipy).

# Exact Coulomb–chirality–charge spectral bridge on the native Cathedral (24 October 2026)

**New, exact finite geometry theorem.** Reconstructed the original 12-vertex icosahedron, dual 20-face dodecahedron, and native face chirality W *from scratch*. All identities were checked using exact SymPy rational inverse matrices with no measured electromagnetic coupling, mass, alpha candidate, or tuned coefficient.

## Operators
Let A be the adjacency matrix of the dual dodecahedral graph (20 vertices, 30 edges, degree 3), L=3I20−A, and L^+=(L+11ᵀ/20)^−1−11ᵀ/20 its exact Moore–Penrose inverse. Let W be the original integer skew chiral matrix defined by the signs of triple products of icosahedral face centres and their shared vertices (see `2026-10-17_native_3d_photon_chiral/native_bulk_peierls_check.py`).

Direct integer/symbolic reconstruction proves
  det(xI−L) = x(x−2)^5(x−3)^4(x−5)^4(x²−6x+4)^3
  Wᵀ=−W; W⁴+15W²=0;
  P=−W²/15 is an orthogonal projector of rank 8;
  (L−3)(L−5)P=0.

With P3=P(5I−L)/2 and P5=P(L−3I)/2, P3 and P5 are rank-four orthogonal projectors; P=P3+P5. The hidden chiral-current Coulomb response is an **exact matrix identity**:
  Wᵀ L⁺ W = 3P3 + 5P5.
Consequently
  Tr(Wᵀ L⁺ W) = 4*3+4*5 = 32.
Every one of the 20 neutral integer charge sources J_a=W e_a has the *same* doubled Coulomb self-energy
  J_aᵀ L⁺ J_a = 8/5.
This is not a fitted trace: exact rational inverse computations confirm all 20 diagonal entries are 8/5.

Independent one-generation sixteen-state electromagnetic charge registry has Tr16(Q_EM²)=16/3. For three generations and their conjugate sectors,
  Tr96(Q_EM²)=6*(16/3)=32.

Thus the independently constructed original photon-geometry source index and the independently constructed charged-matter index match exactly:
  **Tr(Wᵀ L⁺ W) = Tr96(Q_EM²) = 32.**

The full 20-face Coulomb spectral trace is also exact:
  Tr L⁺=137/15.
The chiral projector splits this into
  Tr(P L⁺)=4/3+4/5=32/15
and the nonchiral (11 positive modes) complement
  Tr((I−P)L⁺)=3/(3−sqrt5)+5/2+3/(3+sqrt5)=7.
Therefore
  **15 Tr L⁺=32+105=137.**
This gives an algebraic, symmetry-defined origin for the integer 137 from the Coulomb and chiral operators, not by fitting the numeral 137.

## Scope: why it is not yet alpha(0)
The equality of two indices does not establish that the physical 4D photon kinetic coefficient Kgamma equals (15/(4pi))Tr L⁺ or its equivalent 137/(4pi). Tr L⁺ is a finite static Green trace, whereas Kgamma is a dimensionless *transverse 1PI q² coefficient* in a physically canonically normalised continuum gauge action. A scale-matching/source-current derivation is still essential. Likewise the residual inverse-alpha correction about +0.036 has not been produced by this theorem.

The 13-cell L13 and its spectrum remain untouched; the 20-face dual is a different native Cathedral carrier, not a replacement for the 13-site shell.

## Consequence for possible chiral rail corrections
If one *hypothetically* inserts the uniquely normalised anti-symmetric chiral source i Delta W/sqrt(15) into the dual Laplacian, L_Delta=L+i Delta W/sqrt(15), then the eight chiral eigenvalues form four 2x2 blocks and an **exact resolvent identity** gives
  15 Tr L_Delta⁺ = 105 + 32/(1−Delta²/15).
Using the canonically frozen rail Delta, this gives 137.00001321828. It is even in Delta, so this *particular* chiral-only source cannot produce the historical linear +14.462551... Delta correction. This is a conditional source-deformation test, NOT a Cathedral-wide no-go and NOT a physical photon propagator.

Next required calculation: derive the gauge-covariant unnormalised selected H64 4D photon 1PI action and check whether its current-current/Peierls contact Ward sum rule equates to this exact finite Coulomb–charge response, including a first-principles coframe/continuum conversion. No target-alpha input is permitted.

# Cathedral H64 dark-information operator calculation — 13 October 2026

## Canonical, precedence-preserving premises
H64 = H13 + H51; H13 = 2(1)+3+3prime+5; H51=2(1)+3(3)+3(3prime)+4(4)+3(5). Retain URT kappa=pi/e, Delta=3/20-80pi/(1053phi), rho_star=(I4+Delta^2 I4)/[4(1+Delta^2)], chi35=8 eta(1+Delta^2)/(1-Delta^2). Do not conflate the shell 3prime sector, the A5 four-dimensional irreducible sector of H51, and the two four-dimensional rail eigenspaces.

## Calculated full isotypic Feshbach structure
All five A5 irreps have total multiplicity 4 in H64:
irrep dimensions d=(1,3,3,4,5), visible multiplicities v=(2,1,1,0,1), hidden multiplicities h=(2,3,3,4,3).
The real A5-equivariant visible/history intertwiner space has dimension sum(v*h)=13. The real symmetric hidden multiplicity blocks contain sum h(h+1)/2=31 coefficients and the visible symmetric blocks 6 (before imposing the frozen visible Laplacian). The exact isotypic Hermitian block is [[A_r,B_r],[B_r^T,D_r]] tensor I_(d_r). Its effective static visible operator is A_r-B_r D_r^(-1) B_r^T; its full Feshbach self-energy is B_r(zI-D_r)^(-1)B_r^T. The r=4 block has v_4=0, so 16 hidden four-irrep dimensions cannot couple *linearly* to H13 under exact A5 symmetry. The character product Sym^2(4)=1+4+5 contains one invariant scalar and thus permits a quadratic hidden scalar response.

For a positive hidden four-irrep multiplicity matrix D4, Gaussian integration gives (1/2)log det(D4 tensor I4)=2log det D4. The exact first response under D4 -> D4+sJ is 2Tr(D4^-1 J), and the second is -2Tr(D4^-1 J D4^-1 J). This is a mathematically permitted even-order coupling, not a physical gravitational stress tensor or the canonical von Neumann entropy. Numeric demonstration with explicitly labelled witness D4=diag(3,5,3,5), J=I yields derivatives 32/15 and -136/225; the witness is NOT the unknown physical H51 matrix.

A separate 64x64 positive Hermitian witness assembled from these blocks and Delta couplings verifies the exact Schur inverse identity within Frobenius residual 3.4e-17. Changing symmetry-allowed B changes visible susceptibility without changing the representation or the canonical finite rail constants. Therefore physical baryon/metric source coupling must be extracted from the actual history matrices before a unique dark-matter prediction can be claimed. The previously archived scalar H64 fingerprints are not full explicit numerical D_r/B_r.

## One BKM entropy: conditional spatial scale response
For a unit-Hilbert-Schmidt off-diagonal perturbation of rho_star, the BKM Hessian is chi35=47.9669783033801. If history amplitudes across scales ell_n=ell0(pi/e)^n take the test form eps_n(r)=eps0 exp[-lambda r/ell_n] with lambda=6+sqrt5 and n over all integers, their quadratic radial information-gradient response is

I_grad(r)=(chi35 eps0^2/2) ln(pi/e) sum_n (lambda/ell_n)^2 exp[-2lambda r/ell_n]
         =(chi35 eps0^2)/(8r^2) [1+log-periodic terms].

The inverse-square exponent here follows from the BKM quadratic metric of a FIRST spatial derivative, not from choosing an arbitrary q in the previous Mellin kernel. Poisson summation proves the first harmonic has relative amplitude 2|Gamma(2+2pi i/ln(pi/e))|=3.47301028e-27. Tested at high precision across multiple radii. chi35/8=5.995872287922513. The radial attenuation dictionary and infinite scale hierarchy are conditional; the actual finite H64 is not claimed to contain infinitely many independent spatial length scales.

## Actual gravitational prediction requirements
IF the gradient-cost quantity is identified from conserved microscopic dynamics with an effective mass density rho_h(r)=beta chi35 eps0^2/(8r^2), then spherical Newtonian dynamics would give v_flat^2=(pi G beta chi35/2) eps0^2. beta (dimension kg/m), the baryonic source epsilon_0(Mb), metric stress and anisotropic pressures are not fixed by the finite A5 architecture. The SPARC baryonic-Tully-Fisher slope 3.85 would require epsilon0 proportional to Mb^(1/3.85)=Mb^0.25974026 for universal beta. A simple linear source would not provide this exponent. Lensing and full cosmological perturbation equations are still required.

For a 220 km/s illustrative flat speed, the necessary density coefficient is A=v^2/(4pi G)=5.7707169633e19 kg/m, which would require beta eps0^2=8A/chi35=9.6244827878e18 kg/m. This is a physical target, NOT a prediction.

## Status
Exact: A5 isotypic counts, Sym^2(4) scalar, finite Feshbach algebra, BKM stiffness, conditional positive log-scale gradient summation. Physical identification pending: unique H51/B operator, baryonic transfer, nonlocal radial operator, stress-energy, lensing, BTFR and CMB. No global no-go inferred from the earlier static-scalar toy. The user-directed goal of a theorem of nature has NOT yet been established, and no target data were used to construct the finite identities.

See research_archive/2026-10-13_entropy_gravity/cathedral_H64_dark_information_exact_audit_2026_10_13.py (reproducibility). Historical provenance: docs/THEORY_OF_NATURE_2026-10-05.md, conversation_archive/2026-09-11_to_2026-09-20.md, research_archive/operation_condor/README.md.

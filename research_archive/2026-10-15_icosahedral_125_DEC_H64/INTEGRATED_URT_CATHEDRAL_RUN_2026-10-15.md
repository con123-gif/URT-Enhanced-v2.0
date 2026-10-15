# Newton's Cathedral × canonical URT — integrated finite experiment (15 October 2026)

**Executable:** [cathedral_unified_urt_runner.py](cathedral_unified_urt_runner.py) (NumPy + SymPy, alongside the other archived 15 October scripts).

**Status:** new mathematically valid CPTP selection-and-phase channel *constructed by composing* already-known URT/icosahedral factors. It is a conditional integration test, **not** a derivation that canonical microscopic T_star uniquely generates the channel and not a completed physical theory of nature. All previously closed URT, Newton Scale, gauge, BKM, H64 and gravity lines retain their precedence status.

## 1. Historical/canonical precedence, not flattened

- Overall framework: Newton's Cathedral; original URT history selector is an internal principle.
- Original URT log spiral z_(n+1)=q z_n, q=(pi/e) exp(i 2pi/phi²); its reciprocal-squeeze canonical phase-space lift S=diag(kappa R_theta,kappa^-1 R_theta) is symplectic, distinct from the positive transfer T=B^†B.
- The constructed augmented 64-cell Dirac operator and positive T_cell=D64²/20 are **not** declared identical to the earlier Walsh six-bit H64 and full physical T_star. The 64-cell representation 1+12+30+20+1 is a useful geometric realization with a valid 13+51 split. The true full 20-tetrahedron simplicial ball counts 13+42+50+20=125.
- Canonical rail bandwidth Delta=3/20-80pi/(1053phi) and rho_star=diag(a I4,b I4), b/a=Delta², retain their previous derivation history; no measured mass or coupling value is inserted as an axiom.
- Independent 14 October Platonic/Newton Scale archive establishes a **conditional** relative phi^-2 spectral scale; do not claim that the present selection channel is that Platonic five-cube instrument or that either gives absolute Planck units.
- URT circulation/vortex, Hopf holonomies, finite gauge algebra and KO6 matter seed remain separately preserved sectors, not erased or *automatically solved* by this test.

## 2. Exact geometry/entropy bridges included

Starting from the 13-centred icosahedron:
- 12 shell vertices, 30 shell edges, 20 faces; exact icosahedral Laplacian, incidence and positive cellular transfer.
- 20-face hidden kernel 4_3 (+) 4_5, unweighted L_hid=3P_3+5P_5, gap 2. Its canonical lift into the actual 50-face tetrahedral space has eigenvalues 4 and 6, preserving the gap 2, with numerical residual 5.34e-15.
- Unsigned face-vertex incidence defines vertex-to-face fiveplet isometry J5=C P5/sqrt(3).
- Signed 20-face chirality W satisfies W²=-15(P_4_3+P_4_5). The exact real map Phi5 from the geometric quadrupole fiveplet to Hom(4_3,4_5) is isometric. Its complex extension maps a pair (e,b) of fiveplets into one 4x4 complex off-block Z=Phi5(e)+i Phi5(J5^T b) in an 8x8 Hermitian tangent.
- On this tangent the Umegaki relative entropy has local BKM Hessian chi35=8eta(1+Delta²)/(1-Delta²)=47.966978303.
- The full nonlinear relative entropy and state positivity are checked by eigendecomposition; unitary relative-phase rotation commutes with rho_star. Physical 4D Weyl parity and Einstein canonical-energy identification remain separate.

## 3. **New explicit composite-channel theorem** and its precise assumption

From the normalized vertex positive transfer, the quadrupolar eigenvalue relative to the singlet is exactly 1/2. The original URT spiral has kappa=pi/e=1.1557273497909217 and theta=2pi/phi²=2.399963229728653.

**Composition hypothesis:** apply the *relative* fiveplet selector 1/2 to the URT spiral amplitude, identifying the selected quantum phase with the diagonal quartet relative-phase unitary U_theta=diag(exp(i theta/2)I4,exp(-i theta/2)I4). It gives

    lambda = (pi/e)/2 = 0.5778636748954609  in (0,1)
    lambda² = 0.3339264267636869.

The explicit channel on the complete 8x8 density matrix is

    E(rho)=lambda U_theta rho U_theta^† + (1-lambda)rho_star Tr(rho).

**New mathematical result:** this map is completely positive and trace-preserving (a convex combination of a unitary conjugation and a trace-to-rho_star preparation channel). It leaves rho_star fixed because U_theta commutes with it. For any density operator rho,

    D(E(rho)||rho_star) <= lambda D(rho||rho_star)

by joint convexity of quantum relative entropy. For the chosen admissible purely off-block perturbations rho=rho_star+epsilon X, diag(rho)=diag(rho_star), modular energy Tr(rho K_star) remains constant, so the identity

    D(rho||rho_star) = S(rho_star) - S(rho)

holds at EVERY iteration, not just infinitesimally. Consequently their von Neumann entropy increases while quantum relative entropy decreases. For small off-block perturbations the leading decay factor is lambda² per iteration, not lambda, because the BKM metric is quadratic.

**Critical limitation:** although all constituent constants are fixed, the RESET operation and multiplicative pairing lambda=kappa/2 are an **additional modeling choice**. This is a compatible, non-fitted channel but not an identity of canonical microscopic T_star; the finite quantum phase unitary is not by itself the full metaplectic lift.

## 4. Actual outputs: 12 selected steps

A coherent off-block initial quantum perturbation of magnitude epsilon=2e-4, constructed from symmetry-equivalent fiveplet basis seeds, had initial density positivity margin >6.6. The seed and epsilon are **illustrative initial conditions**, not predictions.

| n | Raw URT radius | Selected radius | D(rho_n||rho_star) | S_vN(rho_n) | 12-site Shannon H | Q²/Q0² from independent shell selector |
|---:|---:|---:|---:|---:|---:|---:|
| 0 | 1.000000 | 1.000000 | 9.600125e-7 | 1.3863738974 | 2.4759905373 | 1 |
| 1 | 1.155727 | 0.577864 | 3.204236e-7 | 1.3863745370 | 2.4825984074 | 0.25 |
| 2 | 1.335706 | 0.333926 | 1.069813e-7 | 1.3863747504 | 2.4843185614 | 0.0625 |
| 4 | 1.784110 | 0.111507 | 1.192832e-8 | 1.3863748455 | 2.4848693415 | 0.00390625 |
| 8 | 3.183048 | 0.012434 | 1.483129e-10 | 1.3863748573 | 2.4849065034 | 0.0000152588 |
| 12 | 5.678906 | 0.001386 | 1.845191e-12 | 1.3863748574 | 2.4849066492 | 0.000000059605 |

The shell Shannon and Q² evolution comes from the independent doubly stochastic A=(L_ico+11^T)/12, not by applying the same 8x8 CPTP map to spatial probabilities. These are related via the explicit fiveplet/BKM geometry but are not identified as one physical thermodynamic entropy.

The canonical URT symplectic identity S^T J S=J has residual 7.03e-17. The late microscopic URT bounded-map contraction coefficient was 0.981495457622 on its central branch; the 32-step phase-forced test remained within 0.214 in max absolute amplitude.

## 5. Important micro-URT piecewise gate correction — local and precise

The archived gate phi(x)=sin x for |x|<=pi, phi(x)=sign x for |x|>pi is **discontinuous** at +/-pi, so a finite derivative bound on each piece does NOT prove a global Lipschitz contraction across the switching surface. With alpha=sqrt(4/3), beta=1/4, theta_H=12/5, the output discontinuity is

    jump at pi = -beta alpha theta_H = -0.692820323027551.

However, with |u|<=1 the central strip [-pi,pi] is forward-invariant because the simple bound

    |F(x,u)| <= beta[alpha(pi+theta_H)+1]=1.849720005 < pi.

On that strip the derivative bound <=alpha beta(1+theta_H)=0.981495458 <1 proves contraction. The actual computed history lies entirely inside the strip. This is a **local proof-domain correction**, not a global no-go for URT. Previous history selection and spiral need not be abandoned.

## 6. Other Cathedral sectors reconciled, not falsely re-closed

- **H64 and flavour:** re-evaluated four candidate species-dependent dressed 64x64 geometric operators, exact 24→12 chiral reductions. Small positive roots (first three) are up [0.81767146,0.84022790,0.87029102], down [0.81767408,0.84022827,0.87030348], electron [0.81766326,0.84022163,0.87027004], neutrino [0.81767110,0.84022274,0.87030743]. The older symmetric golden bridge is nonunitary. These are not observed fermion masses or CKM/PMNS matrices. The separate recovered Walsh/history H64 stays relevant; do not silently replace it with this cell-realization spectrum.
- **Gravity:** full 3D unweighted hidden gap is preserved, while actual circumcentric dual-weight lifted-mode Rayleigh gap susceptibility in the explicitly audited fixed-volume family is about -3.23259663 (not a physical universal Newton scale). The required 4D continuum coframe, gravitational entropy/horizon normalization and Einstein equations have not been derived.
- **10D tidal dissipative oscillator:** eigenvalues -4Gamma ±sqrt(4Gamma²-omega²), and threshold omega=2Gamma. Gamma requires a microscopic mobility/physical time dictionary. The selected CPTP amplitude factor lambda is not equal to exp(-Gamma dt) by proven physical identity.
- **Gauge:** 16=1+3+3'+4+5, regrouped 4_g+1_Y+3_W+(3'+5)_C, and finite KO6 algebra remain in the canonical construction, but the new channel does not produce physical four-force field equations, gauge connections, universal attraction or measurable gauge coupling constants.
- **Solar system:** Newtonian/quantum three-body toy remains an independent empirical sector; observed celestial correlations are not evidence of coherent planetary entanglement, and this run introduces no direct microscopic mapping from orbital COM Hilbert space to Cathedral 13/64 carriers.
- **Newton Scale and other Platonic solids:** preserve the independent 2026-10-14 all-Platonic incidence/hidden-sector, five-cube Kraus and conditional phi^-2 scale programme. The present simulation does not impose a universal global scaling across all solid Laplacians or claim to prove sub-Planck absolute lengths.
- **Cosmology:** a monotone finite entropy flow does not automatically derive low initial *gravitational* entropy; a 4D Weyl tensor and a physical initial-state/history measure are still needed.

## Bottom line

The assembled **finite** URT spiral–selection–BKM channel is positive, stable and entropy-increasing on its specified perturbation family; the original URT phase survives, while quantum relative entropy decays. This is a reproducible candidate mechanism for a selected information-theoretic vacuum. It **does not** yet constitute a parameter-free theory of nature.

Next theorem required: derive this or another explicit CPTP instrument from the canonical microscopic positive T_star and URT's metaplectic history selection, then show its 4D coframe/causal-diamond continuum limit reproduces physical Einstein and gauge dynamics with no arbitrary mobility, scale or temperature normalization. Do not insert an empirical alpha, G, mass or cosmological observable to close the calculation.

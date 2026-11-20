# Q161cw — Whole-five Platonic incidence-to-kinetic theorem

20 November 2026. **Exact finite theorem for the original 50x8 Q101/Q161ca source and unit-edge Dirichlet dynamics. Physical law identification OPEN. Zero measured or fitted constants.**

## 1. Five solids are forced by regularity and spherical closure

For convex regular polyhedra with p sides per face and q faces per vertex, pF=2E, qV=2E, V−E+F=2. Thus (p−2)(q−2)<4 with p,q≥3, yielding exactly five Platonic solids (including the self-dual tetrahedron and two dual pairs). The original five 2-sphere cochains have 50 vertices, 90 edges, 50 faces, total dimension 190.

The native incidence obeys d1 d0=0 and forces rank(d0)=rank(d1)=45 over all five spheres; H1=0. All 90 edge modes split uniquely (with the standard edge inner product) into 45 gradient and 45 coexact/circulation modes. There are ten Hodge-Dirac zero modes (five H0, five H2). For any edge potential A, the curvature F=d1 A is invariant under A->A+d0 chi, and the current j=d1^T F obeys d0^T j=0. These are geometric gauge/conservation identities, not a proof of physical Maxwell theory.

## 2. Native 8-mode energy

E_raw is the existing all-five 50x8 original degree-one and degree-two harmonic chart, with columns x,y,z,(x²−y²)/sqrt2,(x²+y²−2z²)/sqrt6,sqrt2 xy,sqrt2 xz,sqrt2 yz on unit vertices. The genuinely native graph edge energy gives G=E_raw^T E_raw and K=E_raw^T diag(d0_s^T d0_s) E_raw, with every one of the original five solids included.

Full exact entries of G/K, in this source ordering:
- Odd x,y,z diagonal: G=50/3; K=(176−32sqrt5)/3.
- Even qxx−yy and qzz diagonal: G=94/15; K=404/15.
- Even qxy,qxz,qyz diagonal: G=104/15; K=128/5.
- Only offdiagonals (and symmetric partners): G[x,yz]=G[y,xz]=G[z,xy]=4sqrt6/9, K[x,yz]=K[y,xz]=K[z,xy]=16sqrt6/9. All others vanish.

The odd/even coupling satisfies K_oe K_oe^T=(512/27)I3 exactly. Its only source is the tetrahedron. Cube, octahedron, dodecahedron, icosahedron contain 46 antipodally paired vertices, so their odd-even monomials cancel exactly.

The aligned source coordinates share twelve A4 rotations. The full generalized spectral problem K v = lambda G v has
lambda_minus multiplicity 3; lambda_plus multiplicity 3; 202/47 multiplicity 2,
where lambda_plus/minus=(3476−312sqrt5 ± 4sqrt(30951+3396sqrt5))/965.
Numerically (2.06532099246945 x3, 3.69291069876384 x3, 4.29787234042553 x2).
Its 3+3 quadratic is 965 lambda² − (6952−624sqrt5) lambda +12512−2304sqrt5.
K is positive definite: a^T K a=sum_s||d0_s E_s a||², every source column has zero solidwise mean, each solid graph is connected, and full E_raw has rank eight.

## 3. The first actual dynamical conversion

Under the **specified** induced-metric gradient law G da/dt = −K a, the native energy U(a)=a^T K a/2 obeys dU/dt=−a^T K G^-1 K a<0 (a≠0). This defines a dimensionless, scale-free kinetic rule; selecting it as nature's clock is a further assumption.

For the original pure x source a_x(0)=1 and all other coefficients initially zero, the quadratic yz amplitude is generated immediately:
da_yz/dt at t=0 = −sqrt6(6+8sqrt5)/193 = −0.303185197187111.
Tetra-only has K_t=4G_t and no conversion under its own graph-energy gradient; the four inversion-symmetric solids alone have no odd/even cross term. The nonzero conversion in the whole-five compression arises from the combination of the tetrahedral mismatch and the other solids' different rates.

This is a concrete exact finite dynamical symmetry-conversion theorem. It is NOT matter–antimatter asymmetry, a Standard Model mass, or a uniqueness proof of physical dynamics.

## 4. Exact evidence, prior-art continuity and physical next step

Executed locally:
1. /mnt/data/cathedral_qphi_exact_modes.py — exact Fraction arithmetic in Q(phi) over ALL native vertex sets, every native edge, each of the eight native local eigenfunction identities, all Gram/kinetic coefficients, offdiagonal cancellations, and twelve common A4 symmetries. Exit 0.
2. /mnt/data/cathedral_whole5_incidence_kinetic.py — independent unmodified native five-polyhedron hull incidence/D190 reconstruction, d1 d0=0, trace(D²)=720, trace(D⁴)=3456, rank(D)=180, the exact tetrahedral odd/even block via SymPy, full 8x8 generalized spectrum, and declining numerical gradient-flow energy. Exit 0.
3. Repository reproducible exact script: Q161CW_NATIVE_EXACT_CERT.py in this folder, to be registered for CI. GitHub CI must independently execute before it is described as CI-verified.

Recovered precedence: v116 Hopf/circulation, Q60 original all-five/H64-to-Hopf isometry, original Q101 harmonic map, Q161cb exact 50x8 Gram, Q161ck tetra parity defect, Q161ct cubic odd source. These antecedents are retained and not relabelled as new.

**RESUME HERE:** Feed the derived geometric flow a(t) into the genuine original nonlinear Q101 operator x(t)=I_ico G^(1/2) a(t), f(t)=(C x(t)) squared pointwise, and h3=P3 f,h5=P5 f; transport via the actual Q60 H64 Hopf map. Check the source-dependent 24-clock and Q96 charged Ward relation. Neither this finite kinetic rule nor a shared eight-dimensional carrier alone determines the physical coupling.

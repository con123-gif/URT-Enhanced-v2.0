# Exact chiral geometric-to-BKM spin-2 bridge (15 October 2026)

**Executable rational/integer proof:** [cathedral_entanglement_spin2_exact.py](cathedral_entanglement_spin2_exact.py).
Requires NumPy, SymPy and the previously archived [operator geometry module](cathedral_operator_audit.py). Checked successfully in the working environment before commit. Status: **EXACT finite operator identities; physical holographic correspondence / Einstein canonical energy remains open**.

## 1. Source of the problem: antipodal parity

The vertex Laplacian fiveplet P_v5 is even under inversion. Hidden face quartet eigenvalue 3 is antipodal odd, projector P_o, while the hidden face quartet eigenvalue 5 is antipodal even, projector P_e.

For x=P_v5 x and 20x12 vertex-face incidence C, the naive spin-2 to hidden transfer is identically zero:

    P_e diag(Cx) P_o = 0.

This is a genuine parity selection rule for the defined operator, NOT a global no-go for any parity-changing coupling.

## 2. The *signed face chirality* operator exists without fitted weights

Number the 20 outward-oriented icosahedral faces f_a; let c_a be the sum of their three vertex position vectors. Define a 20x20 integer matrix

    W_ab = sign( sum_{i in f_a intersect f_b} v_i dot (c_a cross c_b) ),

with sign(0)=0. For the ideal icosahedron this gives 60 positive, 60 negative and 280 zero entries. It is skew under face exchange and odd under antipodal inversion. It commutes with proper A5 rotations.

Projectors P_o and P_e are constructed as exact **rational polynomial functions** of the face graph Laplacian L_f:

    Z=L_f-3I
    P_o= L_f (L_f-2I) (L_f-5I) (Z^2-5I)/30   [eigenvalue 3, dim 4]
    P_e=-L_f (L_f-2I) (L_f-3I) (Z^2-5I)/30   [eigenvalue 5, dim 4].

Symbolic integer/rational matrix calculation establishes exactly

    W^T=-W,     W^2=-15(P_o+P_e),     rank(W)=8.

Hence R=W/sqrt(15) is an intrinsic parity-odd orthogonal isomorphism between the two quartet spaces: R^T R=P_o+P_e, with maps P_o ↔ P_e. No nonzero square-root coefficient was fitted to experiment.

## 3. Exact spin-2 pullback to the hidden Hom(4,4) carrier

Define the visible-vertex fiveplet projector

    P_v5=-L_v (L_v²-10L_v+20I)/24

and for x=P_v5 x define

    B(x)=sqrt(3) P_e diag(Cx) R P_o.

It maps one 5D proper-icosahedral spin-2 irrep to the unique 5D irrep within Hom(4_odd,4_even). The scalar normalization sqrt(3) is forced by the rational polynomial incidence identity

    P_v5 [C^T (P_e ⊙ P_e) C] P_v5 = (1/3) P_v5,

where ⊙ is the entrywise Hadamard product. The executable check also establishes, for all 12 generating vectors P_v5 e_i and P_v5 e_j,

    Tr(B(x)^T B(y)) = x^T y.

The matrix equality is **exact symbolic arithmetic**, not merely a small floating-point residual.

For the 8x8 master state rho_star=diag(a I4,b I4) with a=1/[4(1+Delta²)], b=Delta²/[4(1+Delta²)], use hidden quartet coordinates and set

    X(x) = (1/sqrt(2)) [ 0       B(x)^T ]
                        [ B(x)    0     ].

It has ||X(x)||_F²=||x||². With chi=(ln a-ln b)/(a-b)=8eta(1+Delta²)/(1-Delta²), for a small enough eps that rho_star+eps X(x) is positive,

    D(rho_star+eps X(x) || rho_star)
        = (chi/2) eps² ||x||² + O(eps³).

**This constructs the previously missing 5D geometric-to-quantum information metric pullback for a single fiveplet.** It is a quadratic information-response law, not the Lorentz-covariant gravitational canonical energy or a derived Einstein–Hilbert action.

## 4. Exact reversible unitary modular-energy wall

Let U(theta) rotate four identical matched pairs between the two quartets, and rho(theta)=U(theta)rho_star U(theta)^†. The state's von Neumann entropy is constant, yet

    D(rho(theta)||rho_star) = 2eta tanh(eta) sin²(theta)

for all theta. Thus the dimensionless unitary-angle curvature is

    d²D/dtheta² |theta=0 = 4eta tanh(eta) ≈ 23.98289474592339

at the canonical Delta. The density-tangent BKM coefficient is numerically

    chi_35=47.966978303380195.

They are different coordinate curvatures and must not be conflated. The exact state-relative-entropy identity is also verified numerically against diagonalized density matrices.

**Correction in the user's proposed dictionary:** as Delta → 1, the reference becomes maximally mixed and the OFF-BLOCK **density-tangent** BKM stiffness approaches 8, not zero. However, the same unitary orbit becomes trivial and its **unitary-angle** curvature approaches zero. This resolves the apparent contradiction without negating the finite modular wall.

## 5. Quantum entanglement factorization and physical scale are still separate

A pure Schmidt purification of rho_star exists on C8⊗C8 (a 64-dimensional vector space), with Schmidt coefficients sqrt(a) repeated four times and sqrt(b) repeated four times. However, the geometric 64-state carrier was defined as an **additive** 1⊕12⊕30⊕20⊕1 cellular chain. Its 13⊕51 split does not canonically determine a tensor-product factorization, local subalgebras or a physical entanglement cut. The purification construction is available algebraically, but identifying it with the specific cellular 64 states is a new physical task.

One can choose a dimensionless modular inverse temperature beta_mod=1 in the definition K=-ln rho. That convention does **not** determine physical Unruh temperature, acceleration, length, Newton's constant or canonical normalization. Bisognano–Wichmann geometric flow must be established on the relevant spacetime algebra before modular time may be equated with a geometric boost.

The foundational cited continuum results each require additional hypotheses:
- Ryu–Takayanagi (2006), holographic entanglement formula in suitable AdS/CFT settings: https://doi.org/10.1103/PhysRevLett.96.181602
- Faulkner, Guica, Hartman, Myers, Van Raamsdonk (2014), linearized equations in holographic CFTs: https://doi.org/10.1007/JHEP03(2014)051
- Lashkari and Van Raamsdonk (2016), boundary Fisher/BKM-type quadratic relative entropy equals bulk canonical energy in a holographic correspondence: https://doi.org/10.1007/JHEP04(2016)153
- Jacobson (2016), fixed-volume vacuum entanglement stationarity and Einstein equation, with stated limitations: https://doi.org/10.1103/PhysRevLett.116.201101

Positive quadratic information curvature does not, by itself, imply universal gravitational attraction.

## 6. Strict scope of the advancement

- **Closed as a finite theorem:** sign-based 20-face chirality operator, its square/rank, antipodal parity selection rule, exact rational fiveplet-to-Hom isometry, the pullback quantum relative-entropy Hessian, and the full unitary orbit identity.
- **Not yet established:** a preferred tensor product / entanglement cut on the existing geometric H64, 4D metric reconstruction and physical Weyl E/B dynamics, Einstein/canonical energy equality, Newton coupling and a true force normalization, or derivation of initial low gravitational entropy.
- The present map couples **one** 5D spin-2-like carrier. The earlier vertex-plus-face reversible 5+5 tidal operator is 10-dimensional and not independently embedded twice into the real Hom(4,4) carrier. A second independent copy would require further structure.

This finding is a constructive new bridge and does **not** reopen established finite results or impose a global no-go on the wider Cathedral program.

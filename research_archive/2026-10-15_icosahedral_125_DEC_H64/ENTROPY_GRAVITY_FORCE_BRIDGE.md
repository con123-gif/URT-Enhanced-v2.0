# Entropy, selection, smoothing, and candidate force generation — 2026-10-15

**Source of executable checks:** [cathedral_entropy_force_bridge.py](cathedral_entropy_force_bridge.py); imports only the verified [cathedral_operator_audit.py](cathedral_operator_audit.py) and NumPy.

**Status:** new exact finite spectral and information-geometric identities. No physical Newton constant, Einstein equation, electromagnetic/weak/strong coupling, cosmological initial-state probability, or gravitational entropy functional is derived by this work.

## 1. A non-fitted smoothness selector exists inside the 64-cell positive transfer

From the augmented icosahedral Dirac operator D64 and T_cell=D64^T D64/20, the 12-vertex block is

    M = (L_ico + 11^T)/20.

The 12-vertex eigenspaces are uniform 1 (eigenvalue 12/20), triplet 3 (5-sqrt(5) over 20), fiveplet 5 (6/20), and triplet 3-prime (5+sqrt(5) over 20).

Thus the **normalized** transfer A=M/(12/20) has uniform eigenvalue 1 and fiveplet eigenvalue 1/2. Its largest nonuniform eigenvalue is (5+sqrt(5))/12≈0.603005665. For a vertex state with nonzero uniform projection, repeated normalized transfer suppresses nonuniform relative amplitudes. For a *pure fiveplet deviation*, q_(n+1)=q_n/2 exactly.

The graph-spectral fiveplet projector is the exact polynomial

    P_5=-(1/24) L_ico (L_ico^2 - 10 L_ico + 20 I).

It is symmetric, idempotent, and rank 5. No additional selection threshold or generation-depth filter is used.

## 2. The quadrupole observable and its exact decay law

Let v_i be the 12 normalized icosahedral directions and define STF_3 tensors

    T_i=v_i v_i^T-I3/3,
    Q(x)=sum_i x_i T_i.

The Gram operator is

    G_ij=Tr(T_i T_j)=(8/5)(P_5)_ij.

Therefore

    ||Q(x)||_F^2 = (8/5)||P_5 x||^2.

For x_n=A^n x_0, since Q sees only P5, Q(x_n)=2^-n Q(x_0), hence

    ||Q(x_n)||_F^2 = 4^-n ||Q(x_0)||_F^2.

This finite positive, invariant quantity is a **quadrupolar geometry proxy**, not the physical four-dimensional Weyl curvature. In dimension 3 the Weyl tensor vanishes identically. A physical four-dimensional connection needs a 4D spacetime coframe, temporal/extrinsic curvature, and curvature dynamics.

## 3. A canonical vertex–face isometry links two fiveplets

With C_inc the 20x12 unsigned face-vertex incidence matrix, define

    J_5 = C_inc P_5/sqrt(3).

The existing exact identity C_inc^T C_inc=15I-2L_ico implies on the shell fiveplet (L_ico=6):

    J_5^T J_5=P_5.

Furthermore the 20-face Laplacian satisfies

    L_face J_5=2J_5.

Thus J5 is an exact norm-preserving intertwiner from the 5-dimensional vertex quadrupole carrier to a 5-dimensional face carrier. Two rank-5 symmetric trace-free sectors are the correct representation sizes for the electric and magnetic parts E_ij and B_ij of the 4D Weyl tensor; the present isometry supplies suitable finite representation spaces, **not** a proof of Lorentz-covariant Weyl dynamics or an identification of those physical tensors.

## 4. Entropy grows while quadrupolar irregularity falls — crucial distinction

For strictly positive probabilities supported on a uniform+fiveplet deformation,

    p_n=u+2^-n(p_0-u), u=(1/12)1,

one has p_(n+1)=(p_n+u)/2. By concavity of Shannon entropy, H(p_(n+1))>=H(p_n), while the quadrupolar power drops by 1/4 on every step. A numerical trial gives

    n       H(p_n)            ||Q(p_n)||^2 / ||Q(p_0)||^2
    0       2.4759905373      1
    1       2.4825984074      1/4
    2       2.4843185614      1/16
    5       2.4848972989      1/1024
    10      2.4849066406      1/1048576

This illustrates that **ordinary configuration entropy and gravitational inhomogeneity are not the same quantity**. A smooth early universe is usually described as low *gravitational* entropy, not low ordinary matter thermal entropy. The present normalized finite smoothing is a candidate history-selector structure, not a cosmological Past Hypothesis derived from microstate counting. A physical time arrow cannot be inferred simply by renaming its iteration index cosmic time.

## 5. Independent BKM/Kubo–Mori metric result

With rho_star=diag(a I4,b I4), a=1/[4(1+Delta^2)], b=Delta^2/[4(1+Delta^2)] and eta=-ln Delta:

    chi_35=(ln a-ln b)/(a-b)=8 eta (1+Delta^2)/(1-Delta^2)
          =47.9669783033802.

For an off-block Hermitian density tangent delta rho, normalized by Frobenius norm,

    D(rho_star+delta rho || rho_star)
        = (chi_35/2)||delta rho||_F^2 + O(||delta rho||^3).

The executable script checks this Hessian directly from the exact matrix logarithm through eigendecomposition. If a physical bath and a coordinate map are supplied, the nonequilibrium free-energy penalty k_B T D can produce a generalized restoring force -k_B T chi_35 q + higher order, where q is a Frobenius-normalized tangent coordinate. The **dimensionless stiffness** is derived; the bath T, spacetime-coordinate map and force-unit normalization are not.

## 6. Entropy gradient is not the whole mechanical force

For a two-level modular gap g(y), fixed eta and temperature, p(g)=1/(1+exp(eta g)), normalized degeneracies 4+4, and physical level gap k_B T eta g,

    Z(g)=4(1+exp(-eta g)),  Phi=-k_B T ln Z.

The **total** Helmholtz generalized force is

    F_total/(k_B T)= -eta p(g) g'(y),

whereas the entropy contribution alone is

    [T dS/dy]/(k_B T)=-eta^2 g p(g)(1-p(g)) g'(y).

At g=2 and g'=1, the former is -0.00003715013023 and the latter -0.00044548659186. The difference is the energy-gradient term. This calculation prevents claiming that a standalone entropy gradient equals the complete mechanical force. Choosing g(y) or a physically fixed temperature is still an input unless derived from coframe/transfer physics.

For strictly reversible unitary motion rho(y)=U(y)rho_star U(y)^\dagger, von Neumann entropy is exactly constant. The script checks this explicitly alongside a positive quantum relative entropy to the fixed reference state. Hence forces and reversible transport can exist without producing entropy.

## 7. Where the four fundamental interactions enter

The Cathedral's known finite representation space Hom(4_3,4_5) decomposes as 4_g (+) 1_Y (+) 3_W (+) (3-prime (+) 5)_C. The BKM Hessian is isotropic on the defined off-block tangent, giving a common positive information metric. But an invariant quadratic response is not yet the gauge Lie algebra, the gauge connection, the conserved currents, gauge kinetic terms or Newtonian gravity.

For a field-strength or force-law identification one must independently derive:
1. An equivariant map from geometric/coframe modes into the off-block information tangent and the correct continuum tensor representation.
2. A physical variational/free-energy principle with units, equilibrium constraint and proper treatment of reversibility/dissipation.
3. A Lorentz-covariant four-dimensional curvature/gauge connection with nonzero commutator/holonomy and its dynamical field equations.
4. A cosmological history measure and a prediction of initially small physical Weyl curvature, with subsequent entropy production and structure growth.

These are **local physical identification tasks**, not a no-go for the existing finite Cathedral operators.

## Verification

Run from this folder:

    python cathedral_entropy_force_bridge.py

Tested in the source session with all assertions passing and isometry/Gram residuals below 10^-15.

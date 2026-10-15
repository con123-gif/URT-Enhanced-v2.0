# Kissing contacts, friction, and entropy — exact finite test (2026-10-15)

**Verified executable source:** [cathedral_kissing_entropy.py](cathedral_kissing_entropy.py).
**Context:** [entropy/BKM/spin-2 bridge](ENTROPY_GRAVITY_FORCE_BRIDGE.md).
**Status:** new finite contact and operator identities; dissipative constitutive laws are explicit hypotheses, not consequences of topology. Cosmic low gravitational entropy and the fundamental interactions are not yet derived.

## What touches

For twelve equal outer spheres touching a central sphere of radius r, their centres lie at distance 2r from the central centre. In the regular icosahedral arrangement, shell-nearest-neighbour separation is

    d_nn = 2r sqrt(2-2/sqrt(5)) = 2.102924448... r > 2r.

Thus the ideal regular outer spheres are separated by a nonzero surface gap, 0.102924448... r. The 12 actual central contacts form a star graph; the 30 icosahedral shell edges encode **additional mediated neighbour interactions**, not literal outer-sphere contacts.

The star graph has Laplacian spectrum {0(1),1(11),13(1)}. Eliminating the central coordinate by a static Schur complement gives

    L_eff = I_12 - 11^T/12,

which treats all 11 shell nonuniform modes equally and does not contain the phi-dependent splitting. Therefore kissing topology alone does not force the full Cathedral finite spectrum.

Literal viscous radial contacts, if a microscopic friction law applies, dissipate

    P_diss = c sum_i ||v_i-v_center||^2 >= 0,

with P_diss=0 for common co-motion. Physical c is not fixed by sphere geometry. For heat deposited in a bath at temperature T>0, dS_bath/dt=P_diss/T under the stated isothermal approximation.

## Exact entropy theorem on the 30-edge interaction graph

With shell adjacency A_ico, Laplacian L_ico=5I-A_ico, and a positive probability vector p evolving by the **hypothesized** symmetric exchange/Markov rule

    dp/dt=-Gamma L_ico p,     Gamma>=0,

the Shannon entropy S=-k_B sum_i p_i ln p_i obeys

    dS/dt=k_B Gamma sum_{unordered shell edges {i,j}}
                 (p_i-p_j)(ln p_i-ln p_j) >= 0.

The identity follows directly by differentiation and symmetry of the graph. Each term is nonnegative because ln is increasing. Gamma is an undetermined physical exchange rate (dimensionless Gamma=1 was used in the test).

Near u=(1/12)1, with p=u+delta, sum_i delta_i=0,

    dS/dt=12 k_B Gamma delta^T L_ico delta + O(||delta||^3).

For delta=P_5 delta, L_ico delta=6 delta. With the *existing exact* quadrupole Gram equality ||Q(delta)||_F^2=(8/5)||delta||², this becomes

    dS/dt=45 k_B Gamma ||Q(delta)||_F^2 + O(||delta||^3).

The coefficient 45 follows algebraically from the icosahedral geometry, *conditional on the equal-rate symmetric diffusion law*. It is **not a parameter-free microscopic friction law**, since Gamma and the physical transport interpretation are not derived.

The script demonstrates dH/dt=0.0069883567365347 for an explicitly stated positive test p with Gamma=1; the independent edge sum agrees within 1e-12. The leading quadratic value is 0.0072, with the expected finite-amplitude correction.

## An important distinction from the previous 4^-n transfer

The normalized visible-vertex block of T_cell is

    M=(L_ico+11^T)/12.

M is doubly stochastic, but its nonzero off-diagonal entries lie on the **complement** of the shell interaction graph: shell neighbours have M_ij=0, non-neighbours have M_ij=1/12, and M_ii=1/2. The exact fiveplet decay q_{n+1}=q_n/2 (quadrupole power 4^-n) is an identity for that *complement-graph* transfer, not an immediately established physical result for friction on the 30 shell edges. By contrast, 30-edge diffusion gives fiveplet amplitude exp(-6 Gamma t) and power exp(-12 Gamma t).

Both mechanisms make the shell more uniform, but their generators differ. Neither can be identified with microscopic contact friction without an operator derivation.

## A new exact 5+5 skew structure and a passive model

Define J5=C_inc P5/sqrt(3), Pf=J5 J5^T. The 32x32 block operator on 12-vertex (+) 20-face carriers is

    Omega=[ 0     -J5^T ]
          [ J5     0   ].

The numerical and algebraic identities are

    Omega^T=-Omega,
    Omega²=-diag(P5,Pf).

On im(P5) (+) im(Pf), a real 10D space, Omega²=-I10. The generator supports exact reversible fiveplet exchange without entropy production.

For a separate **conditional** linear dissipative constitutive law,

    dPsi/dt = [omega Omega - Gamma diag(L_ico,L_face)] Psi,

restricted to the two fiveplets, geometry gives L_ico e=6e and L_face b=2b. Therefore

    d/dt (||e||²+||b||²)
       = -2Gamma(6||e||²+2||b||²) <= 0.

This identity was tested numerically to 1e-11. Setting omega=2pi/phi² uses the existing URT phase increment as a *candidate* dimensionless rotation rate, not a derived physical time or Einstein–Bianchi curl operator. Gamma remains free until tied to a microscopic dynamics.

If the quadratic amplitude is multiplied by an energy scale and coupled to an isothermal reservoir, its decay defines a positive heat/entropy flux. BKM gives a separate positive quantum-relative-entropy Hessian, but **no canonical 5+5-to-Hom(4_3,4_5) metric pullback has been demonstrated**. In fact the real 16D Hom(4,4) representation under A5 has only one fiveplet, so assigning both 5D fields into that tangent as equivariant independent copies would require further structure (for example complexification or an additional carrier).

## Does this explain low entropy at the beginning?

No, not by itself. A dissipative contact/friction mechanism makes a subsystem lose organized motion while exporting energy and producing entropy elsewhere. It cannot automatically explain why the total universe began in a low-entropy condition. A URT initial-history selection law and a physically defined gravitational entropy functional remain necessary. Early matter near thermal equilibrium and an initially smooth low-Weyl-curvature gravitational field are distinct entropy statements.

## Relation to previous entropic dynamics literature

Do not claim that Ariel Caticha's Entropic Dynamics is purely classical: he explicitly developed quantum Entropic Dynamics and symplectic quantum phase-space formulations. The present Cathedral's *specific* quantum BKM and finite cellular transfer definitions are different constructions; uniqueness and prior-art claims require a careful literature audit.

## Local verification

    python cathedral_kissing_entropy.py

Archive status: **CLOSED for stated contact topology, shell graph entropy theorem and 5+5 operator identities; OPEN for physical friction generation, Weyl/Bianchi identification, KMS/BKM pullback, gravitational entropy and force normalization.**
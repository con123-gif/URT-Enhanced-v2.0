# Complex fiveplet/BKM extension, exact phase symmetry and Onsager audit (2026-10-15)

**Verified local computational source:** [cathedral_complex_onsager_bridge.py](cathedral_complex_onsager_bridge.py), extending the [exact rational signed-face isometry](cathedral_entanglement_spin2_exact.py). The associated full local numerical audit passes including explicit density diagonalization. Status: **finite mathematical bridge closed; cosmological and physical gauge/gravity identification open.**

## 1. Resolve the dimensional mismatch without inserting another carrier

The prior real normalized map Phi5: V5 -> Hom_R(4_3,4_5)=M4(R) obeys tr[Phi5(x)^T Phi5(y)]=x dot y, by exact incidence/chirality identities. Let e be the vertex fiveplet and b=J5 y the face fiveplet, y=J5^T b. Then

    psi = e + i y,              Z=Phi5(e)+i Phi5(y) in M4(C),
    X = (1/sqrt(2))*[ 0 Z ; Z^† 0 ] in Herm_8, tr X=0.

The norm identity is exact:

    ||X||_F^2=||Z||_F^2=||e||²+||y||²=||e||²+||b||².

Hence the local off-block Umegaki relative-entropy Hessian pulls back to two identical real fiveplet metrics:

    D(rho_star+epsilon X || rho_star)
       = epsilon² chi35/2 * (||e||²+||b||²)+O(epsilon^4).

No new eigenvalue normalization or generation filter. This is a 10-real-dimensional embedded subspace of the **32-real-dimensional** full complex off-block tangent. The earlier 16-dimensional real Hom(4,4) is its real half.

## 2. Exact nonlinear relative entropy and positivity bound

Write rho_star=diag(a I4,b I4), a=1/[4(1+Delta²)], b=Delta²/[4(1+Delta²)]. Let s_j (j=1..4) be singular values of the *full perturbed off-block matrix*, epsilon Z. Each 2x2 singular-pair block has eigenvalues

    lambda_j±=(a+b)/2 ± sqrt([(a-b)/2]^2+s_j²/2).

Then

    D(rho || rho_star)=sum_j(lambda_j+ ln lambda_j+ + lambda_j- ln lambda_j-
                             -a ln a-b ln b).

This exact identity follows from the singular-value decomposition and the scalar base blocks. Strict positivity is equivalent to

    max_j s_j < sqrt(2ab)
             = Delta/[2sqrt(2)(1+Delta²)]
             = 0.0008800560550254987.

For eps=2e-5 and ||Z||F=1, exact density diagonalization gives D=9.593461802737124e-9 and D/(chi35 eps²/2)=1.0000068945411429. The BKM expression is a **local** approximation; physical finite perturbations must obey the positivity constraint. If a dissipative evolution makes the Frobenius norm of Z nonincreasing and initially ||epsilon Z||F<sqrt(2ab), positivity remains guaranteed throughout that evolution.

## 3. All-orders U(1) symmetry for reversible Omega rotation

On the 10D real tidal sector, Omega maps (e,y)->(-y,e), or psi->i psi. Exponentiation gives psi->exp(i theta)psi and Z->exp(i theta)Z. On the full 8D Hilbert space this is unitary conjugation by

    U_theta=diag(exp(i theta/2) I4,exp(-i theta/2) I4).

Because [U_theta,rho_star]=0, unitary invariance and commuting of the reference show

    D(U_theta rho U_theta^† || rho_star)=D(rho||rho_star)

**exactly**, not only at second order. The finite complex carrier therefore realizes a true 1-parameter modular-reference symmetry.

Important distinction: this is NOT the earlier "cross-quartet mixing" unitary orbit, which changes rho_star, giving D=2eta tanh(eta) sin² theta for a full four-pair rotation. Along the commuting relative-phase orbit dD/dtheta=0, so it produces no force in the phase direction. Restoring gradients concern **amplitude/deformation directions**, not all reversible motions.

This U(1) is an algebraic symmetry of the finite tangent, not by itself the physical electromagnetism gauge action or local connection.

## 4. Onsager-BKM mobility gives a conditional dissipation law

Let Phi_BKM(e,y)=k_B T chi35 (||e||²+||y||²)/2 near equilibrium. Choose the **constitutive** mobility operator mu0 diag(6 I5,2 I5), with mu0>=0. Then an Onsager gradient flow plus reversible Omega transport is

    dot e = -omega y - 6 Gamma e,
    dot y =  omega e - 2 Gamma y,
    Gamma = mu0 k_B T chi35.

The reversible part conserves norm; the dissipator gives

    dPhi_BKM/dt = -mu0 (k_B T chi35)^2
                  [6||e||²+2||y||²] <= 0.

For an isothermal reservoir with full energy and heat accounting, an entropy production term is -dPhi_BKM/(T dt)>=0. This is a model-specific free-energy accounting assumption, not total cosmic entropy by itself.

**Gamma has not been derived parameter-free.** chi35 is fixed internally, but mu0 and the physical conversion of T and time remain unfixed. Rewriting Gamma in terms of them is a constitutive relation, not a zero-parameter prediction. Setting Gamma=1 while keeping omega=2pi/phi² does not merely choose units; the dimensionless ratio omega/Gamma is invariant under time-unit changes.

## 5. New complex equation and duality breaking by damping asymmetry

For psi=e+i y, because the vertex and face Laplacians act by 6 and 2,

    dot psi=(i omega-4 Gamma) psi-2 Gamma conjugate(psi).

Thus the reversible law is **complex-linear** while unequal 6/2 damping explicitly mixes psi and conjugate(psi): it breaks the U(1) duality symmetry of the reversible sector.

The five identical real 2x2 generators are

    A=[ -6 Gamma, -omega ; omega, -2 Gamma ].

The characteristic roots are

    lambda±=-4 Gamma ± sqrt(4 Gamma²-omega²).

Oscillatory decay occurs when omega>2 Gamma; the threshold is a spectral exceptional-point transition, not proof of physical gravitational-wave propagation. For the *illustrative* Gamma=1 and the pre-existing URT angle omega=2pi/phi²≈2.39996322973, the roots are -4±1.326583395i. The actual physical regime requires deriving omega/Gamma, not choosing Gamma to force the answer.

## 6. Spatial parity and remaining Weyl identification

Both the vertex fiveplet and its J5-transferred face fiveplet have **even antipodal spatial parity** in the existing unsigned-incidence realization. Their pairing is correct as a pair of 5D proper-icosahedral (A5) representations, but does **not** automatically supply opposite spatial-parity transformation laws of physical electric/polar and magnetic/axial Weyl components. Complex conjugation can represent an antiunitary/time-reversal distinction, but a Lorentzian tensor and parity construction remains to be established.

The algebraic H64=1+12+30+20+1 direct-sum realization is not a canonical tensor factorization C8⊗C8 or physical entanglement cut. And modular beta=1 as a convention does not determine physical Unruh temperature or Newton's constant.

## Strict mathematical status

CLOSED for the specified finite model: normalized complex 5+5 embedding into Herm8, exact Umegaki relative-entropy SVD formula and positivity domain, exact U(1) phase invariance, Onsager gradient-flow dissipation identity *when the mobility law is specified*, and exact complex conjugation term for 6-versus-2 damping.

OPEN for physics: choice/derivation of mobility rate, actual 4D electric/magnetic Weyl parity and constraints, canonical entanglement cut, gravity area/action/canonical-energy normalization, full dynamical gauge interactions and physical thermodynamic arrow of time. Do not promote this finite closure to a generalized Einstein-equation theorem without the continuum hypotheses.

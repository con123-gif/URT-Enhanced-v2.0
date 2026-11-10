# Conditional full-H64 zero-mode holonomy theorem (10 November 2026)

**Original, independently checked, no-fit analysis.** This extends the exact positive-history 24-clock winding/Ward theorem without modifying the original five Platonic solids (190 cochains), 64 signed histories, 24-clock, hidden 4_3+4_5 quartets, H13⊕H51 matter, the A5-symmetric third cumulant, or the archived source/Schur/fermion Ward actions.

## Exact full 64-history determinant, with the two zero-energy channels explicit

The archived H64 history spectrum is 0(2),10(12),16(30),18(20). The positive-mode quotient previously examined has 62 modes, not 64. Here an **additional conditional hypothesis** is made: the two zero-energy history eigenvectors are genuine charge-two complex Gaussian variables with the same temporal kinetic r²L_2(theta), r=pi/e, and are integrated rather than gauge-quotiented. This is a conditional test of that hypothesis, not an assertion that it is the physical measure.

For 24 links theta_t and Theta=sum theta_t, define T[t,t+1]=exp(-2i theta_t) and L_2=2I-T-T†. For the massless temporal operator A0=r²L_2 the exact determinant is

det A0 = 2r^48[1-cos(2Theta)] = 4r^48 sin²Theta.

Thus for Theta not in pi*Z, A0 is invertible, while at Theta in pi*Z it has one zero temporal eigenvalue. With the two H64 zero-energy eigenvectors, this yields two zero eigenvalues in the full 64x24 system at trivial charge-two holonomy. The full conditional determinant away from those singular holonomies is

D_full(Theta) = [det A0]^2 [det A10]^12 [det A16]^30 [det A18]^20.

This is 64x24=1536 complex Gaussian dimensions, distinct from the positive-mode quotient 62x24=1488 and the source-bright 8x24=192. No determinant factor is silently dropped.

## Exact current and Hessian of the two zero-history modes

The zero-mode contribution to the log determinant is

F_zero(Theta)=2 log(4r^48 sin²Theta).

Consequently,

dF_zero/dTheta = 4 cot Theta,
d²F_zero/dTheta² = -4 csc²Theta.

This curvature is strictly **negative** at every nonsingular holonomy and diverges as Theta approaches a multiple of pi. It overwhelms the exponentially winding-suppressed positive-history contribution unless an additional cancellation or quotient is established. The full conditional curvature is

F_full''(Theta) = -4 csc²Theta + 12 k10(Theta)+30 k16(Theta)+20 k18(Theta),

where k_a=4[T24(1+a/(2r²)) cos(2Theta)-1]/[T24(1+a/(2r²))-cos(2Theta)]². All 24 link Hessian entries are equal to this quantity, with 23 exact pure-gauge null directions away from F_full''=0.

For the deterministic nonuniform connection theta_t=((t mod 5)-2)/37, Theta=-2/37, the independently evaluated curvatures are

two zero modes: -1370.33411285237811276642929,
positive 62 modes: +4.434785061418467751649077324e-22,
conditional full 64: -1370.334112852378112766428846.

The 62-mode quotient and conditional 64-mode determinant have radically different curvatures, even though both use exactly the same pi/e scale and 24-clock.

## Golden phase and Ward verification

For uniform theta_g=2pi/phi², the derivative of the full conditional 64-history log determinant with respect to the uniform link angle is

24[4 cot(24theta_g) + 12 j10+30 j16+20 j18]
= +55.0101232463755649884832011253...,

where the massive j_a are evaluated at Theta=24theta_g. By contrast the positive 62-mode quotient gives +4.618320822951621017554965171e-21. Both are nonzero. The large difference is due entirely to the *choice to integrate or quotient the two H64 zero-energy channels*. It does not establish the physically correct choice or the selection of the golden phase.

At 110-digit precision, an independent direct nonuniform 24x24 matrix calculation verifies det A0, its inverse-trace first derivative, its complete second derivative with Wilson seagull and relaxation, and exact finite gauge conjugation. The single-mode seagull and relaxation at the test connection are approximately 16440.0093542285373532 and 17125.1764106547264096; their difference is -685.16705642618905638, exactly -2 csc²Theta. First and second pure-gauge Ward traces vanish to the stated numerical tolerance. No fermionic, source-acceleration or original Schur contacts are replaced by these determinant identities.

## Status and precise mathematical obligation

**Proved under the stated zero-mode integration hypothesis:** the exact full 64-mode determinant factorization, its singular holonomy locus, the negative zero-mode curvature, the complete first/second determinant Ward identities, and the enormous quotient-versus-full discrepancy.

**Not proved:** that the two H64 zero-energy modes are physical Gaussian degrees of freedom rather than gauge/constraint/measure modes. The original full 190+64+24 action must determine their measure and treatment. The actual charge-graded H13⊕H51 matter vertex and all four historical physical ARFs remain unproved.

**Next precise unsolved theorem:** derive the correct gauge-fixed or constrained path-integral measure of the two H64 zero-energy channels from the original cochain/history action, including ghosts or Jacobians if applicable, and couple that *uniquely selected* measure to the original microscopic charge registry and fermion/Schur Ward-complete pole calculation. Without this, neither the 62-mode quotient nor the conditional 64-mode determinant is a physical electromagnetic normalization.

Reproduce with python URT_H64_ZERO_MODE_HOLONOMY_2026_11_10.py (mpmath). No historical ARF coefficients, fitting, James work or third-party Yang-Mills material entered.

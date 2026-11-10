# Exact 24-clock winding expansion and full-H64 Ward-complete holonomy Hessian

**10 November 2026. Original, no-fit, add-only extension of the archived A5-symmetric third-cumulant source theorem, native Schur Ward theorem, and C3 Chebyshev determinant.** The original five Platonic solids (14+26+26+62+62=190 cochains), 64 signed histories, 24-clock, charge-two hidden 4_3 and 4_5, and H13⊕H51 matter action remain unchanged. This theorem concerns an explicitly typed *Gaussian history determinant*, not the physical fermion or photon pole.

## Native definitions and distinction between two Gaussian sectors

Set N=24, q=2, r=pi/e, phi=(1+sqrt(5))/2, Delta=3/20-80pi/(1053phi), and let theta_t be 24 independent real temporal links with Theta=sum_t theta_t. The charge-two shift T has T[t,t+1 mod24]=exp(-2i theta_t), and A_a=a I+r²(2I-T-T†). Its mass parameter a is positive.

The archived 64-history Hamiltonian has spectrum 0(2), 10(12), 16(30), 18(20). Its **positive-mode quotient** Gaussian determinant therefore has F_full(Theta)=12 log det A_10+30 log det A_16+20 log det A_18. The two zero modes are not silently assigned a mass. Separately, the original *source-bright* 4_3+4_5 isometry occupies only four dimensions at mass 18 and four at mass 16: F_bright(Theta)=4 log det A_18+4 log det A_16. Neither F is the complete physical action. Complex Gaussian integration with a flat source-independent measure is the explicit conditional interpretation of these log determinants.

## Theorem 1: exact convergent winding expansion

Define x_a=1+a/(2r²)>1 and t_a=(x_a-sqrt(x_a²-1))^24, with 0<t_a<1. Then

det A_a = 2 r^48 [T_24(x_a)-cos(2Theta)]
        = r^48 t_a^(-1) [1-2t_a cos(2Theta)+t_a²].

Consequently its complete holonomy-dependent logarithm is the **exact, absolutely convergent winding expansion**

log det A_a = constant - 2 sum_(w>=1) (t_a^w/w) cos(2wTheta).

This follows by factoring the two roots of 1-2t cos(2Theta)+t² and expanding both logarithms. The w-th harmonic is fixed without fitting. The tail after W terms is bounded in absolute value by 2t_a^(W+1)/((W+1)(1-t_a)).

For the three original positive history energies the independently computed winding factors are:

a=10: t_10 = 4.645730336853042398651e-24;
a=16: t_16 = 3.652267580691331615783e-28;
a=18: t_18 = 3.104341750886822154172e-29.

The lightest *full-H64* positive mode dominates the global holonomy response. Discarding the mass-10 dark 12-fold history sector when computing the full determinant is not legitimate, even though it does not belong to the eight-dimensional source-bright quartet isometry.

## Theorem 2: exact current, full second derivative and rank-one Ward Hessian

Write C_a=T_24(x_a). Differentiation with respect to the total holonomy gives

j_a(Theta)=d logdet A_a/dTheta = 2 sin(2Theta)/(C_a-cos(2Theta)),

k_a(Theta)=d² logdet A_a/dTheta²
=4 [C_a cos(2Theta)-1]/[C_a-cos(2Theta)]².

Since F depends on the link angles *only through Theta*, its 24x24 link Hessian is exactly

H_ts = F''(Theta) for all t,s, i.e. H=F''(Theta) 1_24 1_24^T.

When F'' is nonzero, this matrix has one eigenvalue 24F'' and **23 exact zero eigenvalues**. Those nulls are temporal pure-gauge directions; they are not physical massless particles. The result is true for arbitrary nonuniform links, not merely uniform Fourier probes.

At Theta=0, k_a(0)=8t_a/(1-t_a)²>0; at Theta=pi/2, k_a(pi/2)=-8t_a/(1+t_a)²<0. Thus **a strictly positive Gaussian history operator does not imply a globally positive holonomy Hessian**. The full positive-H64 action changes curvature sign between these holonomies. This rules out identifying its curvature as a universal positive photon stiffness without the missing gauge and matter action.

The independently calculated generic nonuniform test (theta_t=((t mod5)-2)/37) gives

F_bright'' = 1.26066161070093833930151e-26,
F_full''   = 4.43478506141846775164908e-22,

F_full''/F_bright'' = 35178.2351725035108946627.

The corresponding single nonzero link-Hessian eigenvalues are 3.02558786568225201432364e-25 and 1.06434841474043226039578e-20, respectively. At Theta=0, F_full''=+4.46082733706630081144722e-22; at Theta=pi/2, F_full''=-4.46082733706630081144714e-22.

## Theorem 3: exact trace response and all Gaussian Ward contacts

For every a>0 the exact inverse trace is

Tr A_a^(-1) = 12 U_23(x_a)/[r²(T_24(x_a)-cos(2Theta))],

where U_23 is the Chebyshev polynomial of the second kind. It is the derivative of logdet A_a with respect to a and independently equals the trace of the directly inverted nonuniform 24x24 matrix. A *unit-covariance* quartet probe has the explicitly conditional trace 4 Tr A_18^(-1)+4 Delta² Tr A_16^(-1)=4.683400289842865604447 at the deterministic test connection. This is not the original 64-history nonlinear source covariance and does not define a physical ARF.

For any link or gauge-orbit derivative, write G=A^(-1). The exact first and second derivatives of the log determinant are

F' = Tr(G A'),
F'' = Tr(G A'') - Tr(G A' G A').

The first term in F'' is the **Wilson-link seagull**, the second is **history relaxation/paramagnetic response**. For a pure-gauge orbit generated by Lambda=diag(lambda_t), A'=2i[Lambda,A], A''=-4[Lambda,[Lambda,A]], both F' and F'' vanish exactly. This includes the complete Gaussian determinant Ward contacts. It is separate from, and does not replace, the archived *charged source acceleration*, *Schur relaxation*, or *fermion-loop* contacts.

At the generic test connection the mass-10 individual-link seagull and relaxation are both approximately 0.091969124049870309631, while their difference is only 3.694886879132886019238e-23. The mass-16 values are both approximately 0.041580364185180718933, difference 2.9047565365405939379e-27. Dropping either contact would produce a grossly incorrect holonomy stiffness.

The frozen golden uniform phase theta=2pi/phi² is not stationary for the full positive-H64 Gaussian quotient. The independently evaluated derivative with respect to the **uniform link angle**, not Theta, is +4.61832082295162101755497e-21. This reproduces the archived phase-selection result through an independent determinant-derivative route; it is not a new physical phase-selection claim.

## Reproducibility and physical status

The accompanying mpmath executable ran successfully at 140-digit precision. It independently constructs and inverts nonuniform 24x24 complex matrices for each of a=10,16,18; checks the Chebyshev determinant and inverse trace; verifies the convergent winding expansion with a rigorous remainder bound; computes single-link and cross-link Hessians; verifies both Ward contacts and direct finite gauge conjugation; and checks the sign reversal and full-vs-bright ratio. Matrix identities are checked at strict 1e-73 to 1e-75 tolerances, with the absolute large-Chebyshev comparison at 1e-55.

**Proved:** exact winding expansion, full-H64 versus source-bright Gaussian response separation, rank-one temporal holonomy Hessian, positivity/curvature-sign distinction, and full determinant Ward cancellation. **Not proved:** unique pi/phi/e selection of the original six-axis history dictionary, a charged H13⊕H51 fermion vertex, a full 190+64+24 source-to-pole calculation, physical photon or fermion pole residue, or any of the four historical ARFs.

**Precise next unsolved step:** using the archived physical Q96 charge registry and microscopic_source_currents.py, compute the A5-equivariant 4_5 edge-pair projector's *actual* charge-graded matrix elements and establish whether the original matter action contains a uniquely normalized spatial Wilson-anchored bilinear. If present, integrate its fermion determinant together with the full H64 positive-mode determinant, retaining source acceleration, Schur seagulls/relaxation and fermionic Ward contacts. Only a source-to-physical-pole proof can identify an ARF.

Run: python URT_WINDING_WARD_CLOCK_2026_11_10.py. Requires mpmath. No historical ARF target values, fitting, James's work or third-party Yang-Mills content were used.

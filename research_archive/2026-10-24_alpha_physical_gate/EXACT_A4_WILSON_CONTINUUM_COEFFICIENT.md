# First-principles alpha programme: exact source-level Wilson photon coefficient (24 Oct 2026)

**Status:** New exact mathematical photon-response theorem in the original unmodified A4 Wilson free-Fock source. Physical electromagnetic fine-structure constant **NOT yet derived**. No measured alpha or historical alpha polynomial was an input.

## Source and microscopic parameters

Recovered source: `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`.

A4 positive-root geometry: ten roots e_i-e_j, 13^4 momentum states with induced metric G=I4+11ᵀ and cell volume sqrt(5). Archived Wilson coefficients r=0.355508034923519, M=0.790940592107124. Electron-unit charge trace Tr16(Q_EM²)=16/3; full wall multiplicities in the original code give C=208.

The original full H64 response-couplings code first computes its own 137+(17572/1215)Delta-(9/65)Delta² alpha candidate and *then* defines e²=4pi/alpha_inv in the constructed electromagnetic Hamiltonian; that dependency is circular and cannot independently derive alpha.

## Exact continuum expansion of the independent Wilson source

Let Omega_beta[A]=-log Tr_Fock exp(-beta H_W[A]) be the *specified* free-Fock action, with the Wilson Peierls source entering both hopping and seagull/contact terms. The leading beta^4 current Hessian is transverse by the calculated Ward identity. Its analytic low-q coefficient satisfies

Pi_ij(q,beta) = beta^4 K4 (q² delta_ij - q_i q_j) + O(beta^6 q²) + O(beta^4 q^4),

where K4, the coefficient of the **dimensionless beta^4 term**, is exactly

K4 = (C sqrt(5)/32) [1 + (23/3) r² + (20/3) r⁴ - M (r/2+r³)].

Here C=208, giving

K4 = (13 sqrt(5)/2) [1 + (23/3)r² + (20/3)r⁴ - M (r/2+r³)]
   = 27.6055221182566845085440318652...

This is a derived source-response coefficient, **not alpha^{-1}(0)**.

## Exact rational, non-fitted certificate

Write cos(theta_a)=c_a, sin(theta_a)=s_a, and root-shift q=t e_0. Use the unit transverse coframe a=E(e_1-e_2)/sqrt(2), so qphys²=(4/5)t². Expand the original analytic bubble + seagull expression to order t² and average its Fourier polynomial over the A4 momentum torus.

The *exact rational* torus average of the Taylor coefficient is

<F2> = 3/2 + (23/2)r² + 10r⁴ - (3/4)Mr - (3/2)Mr³.

The geometric factor is C sqrt(5)/48. Thus the displayed K4 expression follows algebraically. This was verified with an independent exact-rational Laurent/Fourier quadrature program over 6^4 torus phases (angles multiples of pi/3), not by least-squares interpolation. Quadrature exactly equals the 13^4 sum because the relevant trig-polynomial coordinate degree is <=4: neither 6- nor 13-point sums alias any nonconstant Fourier term.

Independent double-precision automatic differentiation on the original 13^4 source gives K4=27.60552211825649; corresponding 5^4 and 7^4 evaluations agree within ~3e-13. Three transverse polarizations agree. At the original first nonzero lattice momentum, full Ward residual=3.21e-12, whereas omitting the seagull gives residual=129.239.

## Physical boundary

The beta^4 coefficient in Omega has beta^3 in thermal free energy F=Omega/beta. The physical clock beta, full interacting selected H64 source-first operator, Gauss projection, native photon kinetic action and 4D continuum Coulomb pole are not all fixed by the specified *free* source. No step above identifies K4 itself with the physical low-energy inverse electric coupling. In particular, the historical 137.035999178195 result is neither input nor output.

To finish first principles: calculate the gauge-covariant selected H64 source Hessian including Tr log hidden H51 and dressed H13 determinants, take the properly renormalised IR transverse photon propagator with unit electron source, and test if that **same microscopic action**, without any coupling inserted, predicts alpha(0).

Exact standalone computational certificate saved in the research conversation as `alpha_exact_fourier.py`; independent autograd cross-check as `alpha_autograd_continuum.py`. The report `Cathedral_Exact_Photon_Low_Momentum_Theorem_2026-10-24.md` gives the full derivation.

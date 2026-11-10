# Exact pi/phi/e Schur-dressed antipodal C3 24-clock response

**10 November 2026. Original no-fit extension of the A5 third-cumulant, face-edge, dual-pair and antipodal C3 theorems.** The native 190 five-Platonic cochains, 64 signed histories, hidden 4_3⊕4_5, 24-clock and H13⊕H51 are preserved. The *new* result is a conditional source-supported edge-pair response obtained by composing two already defined operators. It is not the physical charged-matter fermion propagator.

## 1. Fixed native scales and exact simultaneous diagonalization

Use only the archived frozen values

- r=pi/e, phi=(1+sqrt(5))/2;
- Delta=3/20-80pi/(1053phi);
- q=2; N=24;
- native hidden 4_5 Schur mass 16 (the 4_3 mass 18 remains present in the original action, but is annihilated by the new antipodal C3 selector).

Let T_theta be the charge-two covariant one-link shift (T_theta f)_t=exp(-2i theta_t)f_(t+1). Let L_theta=2I-T_theta-T_theta† and A5(theta)=16I+r²L_theta. Let Q5=T_e5 T_e5ᵀ be the exact rank-four projector on the nearest-neighbour edge-pair 4_5. The previous theorem established V=PiᵀR/2 and VQ5=Q5, VQ3=0.

Define the **explicitly conditional composite-pair response**

**B_theta=Delta² A5(theta)^(-1) T_theta^8** (24×24),

**H_theta=B_theta ⊗ Q5** (720×720).

This uses the original Schur inverse and its Delta² source weight, and the newly derived spatial C3 selector. The temporal eight-link insertion is a specified construction motivated by the intrinsic 3-cycle; it has NOT been derived as a uniquely selected physical matter vertex.

Because L_theta is a polynomial in the unitary T_theta and T_theta†, **[A5(theta)^(-1),T_theta^8]=0** for every nonuniform 24-link connection. Therefore H_theta is normal, gauge-covariant and has rank exactly 24×4=**96**, with 624 zero directions (which are absent source channels, not physical massless particles).

## 2. All nonzero eigenvalues from pi/phi/e

Let Theta=Σ_t theta_t, k_m=(2pi m-2Theta)/24 for m=0,...,23, and d_m=16+r²(2-2cos k_m). The complete nonzero spectrum is

**xi_m=Delta² exp(8i k_m)/d_m, each with multiplicity four.**

All four 4_3 source directions are annihilated by the C3 selector; the 4_5 directions propagate with the exact Schur weight. The eigenvalues depend only on the frozen pi/phi/e scales and the gauge-invariant 24-clock holonomy. No historical ARF values or fitted coefficients enter.

A universal exact source-supported singular-value bound follows immediately:

**Delta²/(16+4r²) ≤ |xi_m| ≤ Delta²/16.**

Hence the source-supported 4_5 response is never singular at finite holonomy and its maximum/minimum singular-value ratio is at most 1+r²/4. This is a stability statement about the conditional pair kernel, not a particle mass-gap proof.

## 3. Closed Chebyshev holonomy determinant

Let T_24(x) be the Chebyshev polynomial of the first kind. The massive 24-clock determinant is exactly

**det A5(theta)=2 r^48 [T_24(1+8/r²)-cos(2Theta)].**

Proof: apply the identity prod_(m=0..N-1)(x-cos((2pi m-alpha)/N))=2^(1-N)[T_N(x)-cos alpha] with N=24, x=1+8/r² and alpha=2Theta.

The determinant on the 24-dimensional temporal carrier is therefore

**det B_theta=Delta^48 exp(-16iTheta)/det A5(theta).**

On the 96-dimensional nonzero source-supported subspace of H_theta the product of nonzero eigenvalues is

**pdet H_theta=(det B_theta)^4 = Delta^192 exp(-64iTheta)/[det A5(theta)]^4.**

This gives a fully explicit, no-fit holonomy-dependent spectral invariant of the *conditional* source-to-edge-pair response.

## 4. Full first/second conditional Schur + Wilson Ward contacts

For an arbitrary periodic local phase lambda_t, let Lambda=diag(lambda_t), U=diag(exp(2i lambda_t)), and theta_t→theta_t+lambda_(t+1)-lambda_t. Then

A5(theta+d lambda)=U A5(theta) U†,
T_theta+d lambda^8=U T_theta^8 U†,
B_theta+d lambda=U B_theta U†.

The exact first/second inverse-Schur derivatives along the orbit are

A'=2i[Lambda,A], A''=-4[Lambda,[Lambda,A]],

G=A^(-1), G'=-G A' G,

**G''=2G A' G A' G-G A'' G**.

Writing S=T_theta^8, its first/second Wilson derivatives are S'=2i[Lambda,S] and S''=-4[Lambda,[Lambda,S]]. Thus

**B'=Delta²(G'S+GS')**,

**B''=Delta²(G''S+2G'S'+GS'')**.

The G'' term is the inverse-history relaxation contact, S'' is the Wilson seagull, and 2G'S' is their mixed contact. All are essential; none is discarded.

For the Hermitian conditional composite-pair action F=b†(H+H†)b with b transforming with charge two, its first Ward derivative vanishes. Its complete second derivative contains **four source/action terms**:

**2 Re(b''†Kb)+2b'†Kb'+4 Re(b'†K'b)+b†K''b=0**,

where K=H+H†, b'=2i Lambda_big b and b''=-4Lambda_big²b. The executable independently verifies the inverse-Schur and Wilson derivative formulas by finite differences and tests every term of the Ward sum.

The original 64-history Schur Ward action remains separate. The calculation does **not** include the missing physical fermion-loop Ward contacts or prove that the microscopic H13⊕H51 action selects this pairing operator.

## 5. Reproduction and honest physical boundary

The independent locally executed reconstruction and the shorter locally executed archive-adapter test passed: exact A5 incidence and C3 identities, exact K_ddd=3/128 regression, 24 Fourier eigenvalues, Chebyshev determinant, 96-dimensional rank, inverse-Schur first/second derivatives, full source/Wilson Ward cancellation, and independent finite differences. For the deterministic off-shell numerical test, the second Ward residual was about 2.2e-20. This numerical residual is a verification tolerance, not a predicted physical constant. The shorter committed executable has not been independently rerun from the GitHub-hosted branch after commit.

**Proved for the stated conditional construction:** exact pi/phi/e-weighted source-supported spectrum, Chebyshev determinant, uniform positive singular-value bound, and Ward-complete Schur+Wilson composite-pair response.

**Not proved:** a unique original pi/phi/e dynamical choice of T^8 or V, physical H13⊕H51 charge/chirality matrix elements, physical source normalization, spatial Wilson anchoring, fermion-loop pole/residue, or any of the four historical ARFs.

**Next precise mathematical step:** apply the archived physical charge registry and microscopic_source_currents.py operator to the explicit 4_5 edge-pair projector; compute the charge-graded matrix elements and the full fermion+Schur connected resolvent with its mixed Ward contacts. Only then is there a source-to-observable quantity to compare with the historical ARFs.

Run from new_gate: OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_C3_SCHUR_DRESSED_CLOCK_2026_11_10.py.

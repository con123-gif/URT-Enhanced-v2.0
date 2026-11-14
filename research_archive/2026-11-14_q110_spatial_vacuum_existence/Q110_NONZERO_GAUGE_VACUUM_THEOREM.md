> **Q111 CORRIGENDUM (2026-11-14, verified local original-v61 interface; native CI pending):** The original scalar-link Q96 fractional charges make the guaranteed compact Wilson variable **A ∈ (ℝ/6πℤ)^528**, not (ℝ/2πℤ)^528. A 2π shift of a single link changes both q=1/3 Wilson operator and the joined Gaussian determinant (ΔΓ≈+240.682), whereas 6π returns it. The finite-torus compactness+negative-Hessian existence proof below remains valid on this corrected 6π cover. If a genuine SU3/Z3 center quotient is later constructed, its compact gauge configuration space may differ; that quotient is NOT present in Q109. See `research_archive/2026-11-14_q111_global_charge_bundle/Q111_GLOBAL_BUNDLE_CORRIGENDUM.md`.

# Q110 — A nonzero gauge-equivalence-class vacuum exists in the joined Gaussian Cathedral model

**14 November 2026 — EXACT CONDITIONAL EXISTENCE THEOREM, using Q109 actual native numerical negative Hessian certificate. Physical ARFs are still NOT DERIVED.** Recovered 11-Nov moving/frustration correction and all five Platonic solids, 190 cochains, original 50→8→12/H64 source and 24-clock remain in scope; their relative kinetic coupling to original v61 charged matter has not been forced by primitive URT.

## The exact finite variational existence theorem

Let A be the 528 independent compact original v61 Wilson link angles, each defined modulo 2π. For every A form the explicitly specified Q106–v61 joined, charge-separated, equal-unit-kinetic finite Hermitian Hamiltonian H_joint(A) on 30 moving configurations × 96 charged Weyl states ×192 original Wilson spinors, and let

    D(A)=det H_joint(A),
    Gamma(A)=-log |D(A)|     where D(A) is nonzero,

extended by Gamma(A)=+infinity where D(A)=0.

The assumptions “Gaussian Grassmann determinant” and “equal unit moving/spatial kinetic sum” are model premises, not physical derivations. D(A) is a continuous complex function of the finite compact torus T^528, because every Wilson hopping entry is a finite polynomial in exp(±i A_l) and the original 30-state moving block is independent of the spatial gauge. The absolute determinant |D(A)| attains a global MAXIMUM on this compact torus. Q109 shows H_joint(0) has no zero eigenvalues (minimum absolute gap ≈0.00903339), so |D(0)|>0 and the global maximum is strictly positive. Hence Gamma attains a finite global minimum at some A_star where it is smooth.

The original 48-site spatial phase gauge group has rank 47. Q109 demonstrates the exact conjugation Ward identity for the FULL charged moving/Wilson action and independently checks that the numerical 528×528 Hessian annihilates all 47 gauge gradients. Its 481 transverse modes at A=0 contain **84 strictly NEGATIVE** eigenvalues (397 positive). If v is any negative physical eigenvector, Taylor's theorem gives

    Gamma(tv)=Gamma(0)+(t²/2) vᵀ Hess(0) v +o(t²)<Gamma(0)

for all sufficiently small nonzero t, because the first derivative vanishes at zero. Therefore the global minimum A_star **cannot belong to the gauge orbit of A=0**. This is a rigorous existence proof of a nontrivial **gauge holonomy/equivalence class** in this specified model, not a numerically selected value.

At a smooth global minimizer, every derivative vanishes and the full physical Hessian is positive semidefinite. This proves existence but does not compute the minimizer or guarantee a photon massless pole, continuum stability or a unique observed coupling. On the spatial torus, a nontrivial gauge-equivalence class need not have nonzero local plaquette curvature; it can in principle differ by a flat global Wilson loop. Therefore do NOT overstate the theorem as quantized physical magnetic flux. It proves a **nontrivial spatial gauge background**.

## Charge-conjugate symmetry

The original full 96-Weyl charge registry has m_q=m_-q. Since each charged spatial link enters h_v61(q A) by exp(i q A), the determinant's charge-paired product is exactly invariant under A→−A:

    Gamma(A)=Gamma(−A).

Thus ±A_star have equal action, but they are not guaranteed to be distinct gauge-inequivalent vacua; that must be tested after locating a stationary configuration. In particular this theorem does not derive CP violation, matter-antimatter abundance or spontaneous selection of one orientation.

## Actual numerical follow-up

The native Q109 original-source certificate computes every one of 528 link currents and second seagull contacts, verifies all 47 Ward zero directions and the 397+/84− spectrum, then checks a closed xy plaquette's positive curvature 1746.6696096 against independent nonlinear finite differences. It follows a most-negative transverse eigenvector into the exact determinant. A nonzero one-dimensional stationary point occurs at roughly 0.43 unit-normalized amplitude, lowering Gamma by about 94–95. Different eigenvector choices inside a degenerate negative eigenspace move the numeric amplitude, so these are NOT universal constants.

The local full analytic-gradient solver verifies the gradient is transverse (gauge Ward), and takes a second independent physical downhill direction to DeltaGamma ≈ −316.020. A further unconstrained 528-variable L-BFGS-B run (35 iterations, 51 function evaluations) lowered the same action to **DeltaGamma ≈ −522.543**, with gradient norm ≈509 and gauge residual about 2.1×10^-12. It **did not converge** or prove positive Hessian. The explicitly labelled exploratory Q110 script reproduces this from the unchanged original v61 input. This numerically exhibits the descent, but the analytic compactness theorem—not the unfinished optimizer—is the existence proof.

## Limits and physics

A full-dimension nonzero global minimizer exists in the declared finite Gaussian joined action, but its location, 4D transverse continuum dispersion, Gauss projection, unit electron Coulomb pole and observed alpha remain unsolved. The original 24-clock and the π–φ–e positive transfer have not been proved to select the equal moving/spatial ratio, and Q109 already showed other exact golden ratios produce vastly different susceptibilities. Finding any descent does not solve the physical ARF or make these original model premises immutable.

Next direct attempt: minimize the whole gauge quotient of dimension 481 (not a 1D projected potential) or derive a true dynamic positive transfer that fixes the moving/spatial ratio and stable 24-track vacuum, then calculate the physical photon pole on that SAME action with first/second Ward contacts. Do not retro-fit old ARF equations.

Evidence: the Q109 full native test is registered on GitHub; locally executed with clearly labelled transcribed original v61 section-9 reference and passed. The 528-variable exploratory solver passed locally in the same reference and was nonconverged as reported. This Q110 existence proof itself is elementary exact compactness + negative-curvature reasoning contingent on successful native confirmation of Q109's 84 negatives. GitHub CI remains pending.

# Entropy-to-Einstein and cyclic bounce audit — 2026-10-13

**Scope:** New results from the 2026-10-13 conversation, preserving earlier claims and histories. This is a finite-model audit, **not** certification of physical general relativity or a cosmological bounce. The five accompanying scripts were executed and passed on 2026-10-13. The sixth independent audit also passed.

## Canonical input: no refitting

\[
\Delta = \frac3{20}-\frac{80\pi}{1053\phi},\quad
\eta_\Delta=-\ln\Delta,\quad
p_\star=\frac{\Delta^2}{1+\Delta^2}.
\]

On the existing hidden 8-state carrier, with four-dimensional projectors \(P_3,P_5\),

\[
\rho_\star = \frac{P_3+\Delta^2P_5}{4(1+\Delta^2)},\quad
K_\star=\eta_\Delta(3P_3+5P_5)+cI.
\]

For population-deformed states, the complete entropy is
\(S/k_B=\ln4+H_2(p)\); its response is \(dS/k_B=2\eta_\Delta\,dp\) **at** the reference state. Relative entropy gives the exact finite-change identity
\[
\Delta S/k_B=2\eta_\Delta\Delta p-D(\rho(p)\Vert\rho_\star).
\]

## Six verified finite calculations

1. **Two-daughter instrument:** \(B_+=(P_3+\Delta P_5)/\sqrt{1+\Delta^2}\), \(B_-=(\Delta P_3+P_5)/\sqrt{1+\Delta^2}\). Completeness \(B_+^\dagger B_+ + B_-^\dagger B_- =I_8\); each outcome is equiprobable for \(I_8/8\). The conditioned daughters average to \(I_8/8\). Mutual information between the classical outcome and daughter system is
\[
I(\mathrm{outcome}:\mathrm{system})=\ln2-H_2(p_\star)
=0.6930666842526121\ {\rm nats}.
\]
This is correlation bookkeeping, **not** proof that black holes share a causal phase space.

2. **Casini / modular first law:** reference modular operator satisfies
\(\delta S/k_B=\delta\langle K_\star\rangle\). For the small conformal causal ball in four spacetime dimensions, Jacobson's QFT matter modular response is \(\delta K_B=(8\pi^2R^4/15)\delta T_{uu}\) for approximately uniform stress-energy in natural units. Reproducing this demands
\[
\delta p = \frac{4\pi^2R^4}{15\eta_\Delta}\,\delta T_{uu}.
\]
The number \(4\pi^2/(15\eta_\Delta)=0.4389565013326256\) is the **necessary response factor**, not a microscopic prediction.

3. **Stress-operator uniqueness test:** equality for *every* traceless single-cell perturbation implies
\[
T_{uu}^{\rm projected}
= \frac{15\eta_\Delta}{4\pi^2R^4}P_5+cI.
\]
Generic matter stress operators have additional independent tangent directions. For example \(\delta\rho=\mathrm{diag}(1,-1,0,\ldots,0)\) has \(\mathrm{Tr}(K_\star\delta\rho)=0\), but can carry nonzero energy response. This is a **local conditional obstruction**, not a no-go for a future multi-cell or coframe continuum completion.

4. **Icosahedral continuum:** 12 shell directions give an isotropic spatial Laplacian
\(\mathcal L_a=\nabla^2+(a^2/20)\nabla^4+O(a^4)\); angular anisotropy begins in the sixth moment. The 13-cell spectrum is \(0^{[1]},(6-\sqrt5)^{[3]},7^{[5]},(6+\sqrt5)^{[3]},13^{[1]}\). This is not by itself a Lorentz-invariant 3+1-dimensional metric or a massless spin-2 propagator.

5. **Boundary-counting area candidate:** subdividing the icosahedron at frequency \(f\) gives \(V=10f^2+2\) vertices, \(F=20f^2\) faces. **If** one independent entangled fourfold factor belongs to each boundary vertex, then \(S_{\rm UV}/k_B=(2\ln4/(\sqrt3 a^2))A+2\ln4\), with conditional \(\ell_P^2/a^2=\sqrt3/(8\ln4)\). The fixed fourfold density matrix \(I_4/4\) has \(S'(0)=0\) for every traceless state perturbation. Continuous geometric variation of the area and its microscopic entanglement count has not been derived from the frozen transfer.

6. **A5-channel tests:** \(\mathrm{Hom}_{A_5}(H_{13},4)=0\), whereas \(3\otimes3'=4\oplus5\). The off-diagonal hidden-block channel has zero first-order entropy gradient and nonzero second-order BKM response. A symmetry-allowed diagonal scalar channel does respond at first order, but its coupling \(g\) to actual stress-energy remains unspecified by the frozen axioms.

## Normalization erratum: correct earlier 2026-10-12 candidate

The file \`research_archive/GRAVITY_CONTINUUM_CANDIDATE_2026-10-12.md\` states
\(\delta A/(4G)=\delta S_{\rm resp}=2\eta_\Delta\delta p\) and then gives
\(dA/dp=(8\pi G/\eta_\Delta)\chi_{35}\).
These equations do **not** follow from each other.

When \(k_B=c=\hbar=1\) and \(\delta p\) denotes the **same** variation in that equality, direct differentiation gives
\[
\boxed{\frac{dA}{dp}=8G\eta_\Delta.}
\]
The previous coefficient divided by the corrected coefficient is
\(\pi\chi_{35}/\eta_\Delta^2=4.19177776410672\).
The BKM Hessian is a **quadratic information metric**, not an extra multiplier in the first law. If instead \(p\) parametrizes the **matter** entropy in Jacobson's UV+IR equilibrium, then \(\delta S_{\rm UV}=-\delta S_{\rm IR}\) and the sign in the area-population relation is opposite. Distinguish these uses before identifying \(G\). This note **supersedes the derivative in that candidate** without editing historical provenance.

## Bounce audit

The two-rail population \(p(s)=[1+e^{8\Delta s}]^{-1}\) gives the information-geometric scale diagnostic \(\mathfrak a(s)=\cosh(4\Delta s)\) with \(\mathcal H(0)=0\), \(\mathcal H'(0)=16\Delta^2>0\). It is a **dimensionless diagnostic**; its identification with the physical FRW scale factor and a proper-time conversion have not been deduced. Under the *conditional* flat-GR identification \(a(t)=a_0\cosh(\omega t)\), the required effective matter violates \(\rho+P\ge0\) near the bounce: \(\rho+P=-\omega^2\operatorname{sech}^2(\omega t)/(4\pi G)\).

## Exact physical completion conditions

- Derive a family of causal-region reduced states and stress operators whose **entire** modular response matches the QFT modular Hamiltonian for arbitrary local \(T_{\mu\nu}\) and ball orientations; not only a scalar population matching condition.
- Derive a differentiable physical area entropy \(dS_{\rm UV}/dA=1/(4G)\) from actual boundary entanglement under metric variation, not only counting across refinements.
- Derive a coframe/spin-2 propagator and gravitational Ward identities with universal coupling, alongside the physically normalized \(\rho+P\) or modified-gravity bounce equation.
- Do not claim target-free absolute normalization or Einstein equations before those checks hold.

## Reproducibility

Run Python 3 with numpy, scipy, sympy and mpmath (the repository already uses these dependencies). Execute the six scripts in this directory. All six were executed successfully in this session. Earlier mathematical constructs are preserved and remain independently citable in the repository. The labels above distinguish algebraic closure, conditional identifications, and open physics.

# Intrinsic Newton–Platonic density and information geometry
**2026-10-14 · derived independently from all-five-solid nesting**

## Canonical ensemble, not a fitted entropy state
Let \(P_1,\dots,P_5\) be the five rank-four projectors onto the incidence-hidden spaces of the five inscribed cubes of the dodecahedron. The icosahedral rotation group permutes them transitively.

Choose one of five cubes uniformly; within its four-dimensional hidden space use the normalized projector \(P_j/4\). The resulting canonical ensemble is
\[
\boxed{\rho_{\rm geo}=\frac1{20}\sum_jP_j
=\frac1{16}P_8+\frac1{10}P_5.}
\]
The spectral projectors \(P_8,P_5\) refer respectively to the dodecahedral Laplacian-\((3,5)\) hidden bands (dimension \(8\)) and its Laplacian-2 fiveplet (dimension \(5\)). The seven-dimensional orthogonal complement has zero support. Exact eigenvalues \(\{(1/16)^{\times8},(1/10)^{\times5},0^{\times7}\}\) and trace 1 follow from the exact five-cube averaging polynomial.

This is a concrete *mathematically preferred equal-preparation ensemble*, not a claim that quantum nature must choose it in the absence of a specified preparation procedure.

## Direct, parameter-free information identities

- \(p(H_8)=8/16=\boxed{1/2}\).
- \(p(V_5)=5/10=\boxed{1/2}\).
- The inversion operator \(J\) preserves the five cube projectors; the active even sector is 9D = 4 hidden + 5 visible, and the odd sector 4D = 4 hidden. Therefore \(p(J=+1)=\boxed{3/4}\) and \(p(J=-1)=\boxed{1/4}\).
- The entropy (without physical \(k_B\)) is
\[
\boxed{S(\rho_{\rm geo})=\tfrac12\ln(160)=2.5375869076169133\text{ nats}.}
\]
- The 5-component ensemble \(\{(1/5,P_j/4)\}\) has Holevo information
\[
\boxed{\chi_{\rm cube}=S(\rho_{\rm geo})-\ln4=\tfrac12\ln10\approx1.151292546497023\text{ nats}.}
\]
This is an upper bound on the accessible classical information about the cube label for an optimal measurement—not automatically an achieved information-transfer rate.
- The nonzero eigenvalues fix the modular contrast and off-diagonal BKM density-tangent Hessian:
\[
\boxed{\eta_{\rm geo}=\ln(8/5)\approx0.4700036292457356,}
\]
\[
\boxed{g_{\rm BKM}^{\rm cross}=\frac{\ln(1/10)-\ln(1/16)}{1/10-1/16}=\frac{80}{3}\ln(8/5)
\approx12.533430113219614.}
\]
No independently chosen entropy normalization enters. This coefficient refers to the conventional BKM metric on *density variations* (not the dual metric on Gibbs-generator perturbations). A choice of physical dimensions and coupling to stress-energy would be additional physics.

## Exact normalized instrument and stationary state
Set \(S=\sum_jP_j\). On the 13-dimensional active support, \(\operatorname{spec}(S)=\{(5/4)^{\times8},2^{\times5}\}\), so its inverse square root is fixed:
\[
S^{-1/2}=\frac2{\sqrt5}P_8+\frac1{\sqrt2}P_5.
\]
Define
\[
\boxed{K_j=P_jS^{-1/2}\quad(j=1,\dots,5).}
\]
Then
\[
\sum_jK_j^\dagger K_j
=S^{-1/2}\left(\sum_jP_j\right)S^{-1/2}=I_{13}.
\]
This is a completely positive trace-preserving quantum instrument on the 13D active support. Moreover,
\[
\sum_j K_j\,\rho_{\rm geo}\,K_j^\dagger
=\frac1{20}\sum_jP_j=\rho_{\rm geo}.
\]
So \(\rho_{\rm geo}\) is an **exact stationary density** of a canonical, geometrically normalized channel, not merely an arbitrary state subsequently inserted by hand.

**Stationarity is not uniqueness:** The cube projectors preserve antipodal parity. The even and odd sectors each support their own stationary density, and their convex mixtures are also stationary. The equal-preparation ensemble selects the precise 3:1 parity weights above. In numerical diagonalization of the 13²-dimensional channel, eigenvalue 1 occurs twice.

## Geometric contraction and observable candidate

The unique uniformly weighted five-cube projection average is
\[
\bar P=\frac15\sum_jP_j=\frac14P_8+\frac25P_5.
\]
Thus for repeated **specified geometric averaging operations**,
\[
\frac{\|P_8 \bar P^n\psi\|}{\|P_5 \bar P^n\psi\|}
=\left(\frac58\right)^n\frac{\|P_8\psi\|}{\|P_5\psi\|}.
\]
Also \(\operatorname{Tr}(P_iP_j)=5/8\) for \(i\neq j\); the very same rational appears as pair overlap and relative attenuation eigenvalue.

Identifying one average step with the independent golden refinement \(k_{n+1}=\varphi^2 k_n\) **would predict**, conditionally, a relative mode exponent
\[
\beta_{\rm rel}=\frac{\ln(8/5)}{2\ln\varphi}=0.48835419743428\dots.
\]
This is a physically testable *hypothesis* only after specifying a measured quantity corresponding to the two distinct projector sectors; it must not be fitted to arbitrary experimental ratios.

## Scientific meaning
**Established:** a self-contained sequence of exact finite results,
all Platonic incidence → five inscribed cubes → 13-dimensional selection → \(9\oplus4\) parity algebra → 169-dimensional full algebra with native geometry → canonical mixed density → explicit entropy and CPTP dynamics.

**Not established:** a fundamental law of nature, a unique measurement preparation mandated by the universe, physical clock/spacetime geometry, gravity, or a specific measured quantum/current/stress observable. In particular, the new \(5/8\) law must not be retroactively treated as a successful or failed CMB sine-wave test; it is a different, more constrained operator-level statement.

## Verification
\`newton-scale/all_platonic_incidence_and_algebra.py\`: exact rational polynomials, exact incidence and quadratic map ranks, the \(101\)-prime exact commutant rank certificate, and direct symbolic completeness/stationarity checks. Workflow \`.github/workflows/newton-all-platonic-algebra.yml\` executes these assertions.

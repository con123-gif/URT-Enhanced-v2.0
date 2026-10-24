# WHY alpha does not follow solely from the 24-state icosahedral geometry — exact source test (24 October 2026)

## Physical target
In the electron-unit geometric connection convention, the *renormalized* Maxwell 1PI action is `Gamma_EM^(2)[A]=(K_gamma/4) int F^2`; the Thomson inverse fine-structure coupling is `alpha(0)^(-1)=4*pi*K_gamma`. The exact 13-cell spectrum and a finite counting measure are insufficient to identify the field-theoretic `K_gamma` unless the source coupling and action normalization are fixed by the same dynamics.

## Exact theorem 1 — two-point kernels have eight independent invariant sectors
Let G=SL2(F5), |G|=120, and X=F5^2\{0}, |X|=24. The stabilizer of v0=(1,0) is exactly the five maps [[1,t],[0,1]]. On the 24 points this stabilizer has **four singleton orbits and four size-five orbits**. Therefore `dim End_G(C[X])=8`, the number of orbitals of the transitive G-action. A unique G-invariant one-point probability exists (1/24), BUT this does not give a unique current-current (two-point) kernel. On the projective 12-point quotient X/{±1}, the stabilizer orbits have sizes 1,1,5,5; the invariant kernel algebra still has dimension 4.

## Exact theorem 2 — symmetry-compatible scalar source response
For one source-selected state in a uniform 24-point orbit, a gauge-invariant Wilson holonomy phase theta admits the covariance-preserving family
`Z_lambda(theta)=[23+exp(-lambda*(1-cos(theta)))]/24`.
The exact second derivative is
`d²[-log Z_lambda(theta)]/dtheta²|_0 = lambda/24`.
With theta=A/sqrt(Omega), `d²[-log Z]/dA²=lambda/(24 Omega)`. The first correction of the published alpha capacity corresponds to additionally choosing lambda=1. The group does not enforce lambda=1.

The 12-vertex determinant-square adjacency defines the icosahedral Laplacian L. For unit-neutral vertex charges rho=e_i-e_j, a symmetry-invariant electrostatic action `S_lambda[V]=lambda*V^T L V/2-rho^T V` gives an interaction magnitude `rho^T L^+ rho/(2 lambda)`. Exact native resistance values are 11/30 for 30 adjacent pairs, 7/15 for 30 distance-two pairs, and 1/2 for 6 antipodes. Symmetry fixes ratios; lambda fixes interaction strength.

## Exact theorem 3 — normalized master rho cannot fix absolute field stiffness
For any B0 and T0=B0†B0>0 and gauge-invariant nonnegative loop action f[A] with f[0]=0, the positive transfer family
`B_lambda[A]=exp(-lambda*f[A]/2)*B0`, `T_lambda[A]=exp(-lambda*f[A])*T0`
obeys `rho_lambda[A]=T_lambda[A]/Tr T_lambda[A]=rho_*=T0/Tr T0` for ALL lambda and sources. Yet the unnormalized logarithmic action is
`-log Tr T_lambda[A]=lambda*f[A]-log Tr T0`.
Thus the exact frozen rho*, entropy rail and BKM density metric do not fix the source photon response. This is a local insufficiency theorem for positivity-plus-density inputs, **not a global no-go** on a fully specified microscopic Cathedral action.

## Published candidate versus actual electromagnetic why
Li, Symmetry 18(9):1418 (2026), DOI 10.3390/sym18091418, computes
`Omega=4*pi^3+pi^2+pi` and
`A=Omega-1/(24 Omega)-sum_(k>=1)(k+6)/(k+4)*Omega^(-2k-1)=137.0359991761419945...`
from declared role/counting and interface-transfer axioms, then separately asserts **Physical Correspondence Postulate 1** matching the structural capacity to the *on-shell Maxwell coefficient*. The alpha numerical value is not independently proved from a QED source determinant. This exact F5 group origin accounts for the orbit weight, not that matching postulate or the higher-count transfer axiom.

## Precise first-principles completion test
Specify a unique, all-occurrence source-covariant H64 selected transfer T*[A] fixing the unnormalized action (including hidden-51 determinant, photon bare term if generated, contact terms, physical clock and Gauss projection). Derive the fully infrared 4D *transverse* q² coefficient in the unit-electron charge chart. Evaluate alpha^-1=4pi K_gamma and compare only after all coefficients are frozen. No Maxwell stiffness may be inserted by postulate or fixed by measured alpha.

All finite group, SymPy susceptibility and resistance calculations executed independently in the conversation. Local executable: `cathedral_alpha_why_symmetry_not_coupling.py`.

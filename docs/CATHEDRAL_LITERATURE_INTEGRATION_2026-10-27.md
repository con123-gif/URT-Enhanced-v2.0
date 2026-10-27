# Newton's Cathedral: finite spectral, selection and relative-entropy calculation
27 October 2026 — standalone mathematical derivation; not a fundamental physical action.

## Inputs
- All five Platonic surface incidence complexes, combinatorial orientations from planar embeddings.
- Five cube projectors on the 20-vertex dodecahedron as in `newton-scale/five_cube_spectral_filter_exact.py`.
- Pre-existing entropy rail `Delta = 3/20 - 80*pi/(1053*phi)` and `eta=-log(Delta)`.
- The pre-existing H64/dodecahedral intertwiner `H8 Uh = Uh (21I - L_D)` documented in `docs/CATHEDRAL_UNIFIED_FINITE_DYNAMICS_2026-10-25.md`.

## A. All-Platonic discrete spectral geometry
The five separate oriented incidence complexes are assembled into one block-diagonal Hodge–Dirac operator
`D_P = [[0,d1,0],[d1^T,0,d2],[0,d2^T,0]]`
on `C0_50 + C1_90 + C2_50`. Each block satisfies `d1*d2=0` exactly.
Dimensions 50+90+50=190. The five closed orientable surfaces have `dim ker(D_P)=10`, `Tr(D_P^2)=720`, `Tr(D_P^4)=3456`. Hence
`Tr(exp(-t D_P^2)) = 190 - 720*t + 1728*t^2 + O(t^3)`.
`S_A=0.5*||d2^T A||^2` is invariant under `A -> A+d1^T lambda`; curvature rank is 45, with 45 exact gauge directions on the 90 edge variables. The operator is block-diagonal across the solids and NOT a physically established interacting four-dimensional Dirac operator.

## B. The Gibbs cost is exactly the hidden geometry/history difference
Let `P3,P5` be the dodecahedral eigenprojectors of `L_D` in the eight-dimensional hidden sector, with eigenvalues 3 and 5. The positive cost
`C_h=(L_D-3I)P_h = 2P5`, with `P_h=P3+P5`, gives
`F=P3+Delta*P5=exp[-eta*C_h/2] P_h` and
`rho_star=exp(-eta*C_h)/Tr_hidden exp(-eta*C_h)`.
The existing H64 intertwiner identifies `Uh C_h Uh^T = (18I-H8)|embedded hidden sector`.
This mathematical relation does not prove canonical source-loaded microscopic URT dynamics selects `F`.

## C. Parity selection rule and a nondegenerate ten-current response
Construct the antipodal involution J of the dodecahedral graph. Then `J P3=-P3`, `J P5=P5`.
Every one of the five cube projectors and cube-vertex occupancy diagonal operators commutes with J. Therefore for each such even operator Q,
`P3 Q P5 = P3 J Q J P5 = -P3 Q P5 = 0`.
This is an exact symmetry rule, explaining why isotropic/even cube data cannot directly mix the hidden quartets.
For each of the 10 opposite vertex pairs choose the signed diagonal `Q_r=|r><r|-|bar(r)><bar(r)|`. These are geometric parity-odd operators. Set
`X_r = P3 Q_r P5 + P5 Q_r P3`.
The exact Gram matrix `G_rs=Tr(X_r X_s)` has spectrum
`{2/5 (x4), 4/15 (x6)}`. In particular all ten natural parity-odd sources are independent, and each `G_rr=8/25`.
With `rho_star=a P3+b P5`, `a=1/[4(1+Delta^2)]`, `b=a Delta^2`, the BKM metric in these ten directions is
`g_rs = chi G_rs`, where
`chi = (log a - log b)/(a-b)=8*(-log Delta)*(1+Delta^2)/(1-Delta^2)=47.96697830338...`.
Thus the exact 10D BKM stiffness spectrum is
`{(2/5)chi (x4), (4/15)chi (x6)}`,
with values 19.18679132135 (x4) and 12.79119421423 (x6). Their ratio is exactly 3/2.
The relative-entropy action near rho_star for `rho(t)=rho_star+sum t_r X_r` is
`D(rho(t)||rho_star) = 1/2 chi * t^T G t + O(||t||^3)`
for small t preserving positivity. The result is internal quantum information geometry. Identifying the currents with physical fermions or gauge bosons requires a sourced action and normalization.

## D. A legitimate quantum instrument and information loss
Let `K0=F` and `K1=sqrt(I-F^2)`, where `K1 = sqrt(1-Delta^2) P5 + P_vis5 + P_rest`.
Then `K0^T K0+K1^T K1=I`. The five-cube preparation is `rho_geo=P_h/16+P_vis5/10`. Postselecting outcome zero yields rho_star with exact success probability `(1+Delta^2)/4=0.2500015490165154...`.
When the outcome is forgotten, the channel fixes rho_geo; it does NOT deterministically prepare rho_star. On any `X_r` the unflagged channel acts `Phi(X_r)=Delta X_r`, hence the BKM metric at rho_geo contracts by `Delta^2` on these coherence directions. This is a quantitative constraint on using Petz recovery to restore selected information.

## External mathematical methods
- G. Bianconi, *Gravity from entropy*, Physical Review D 111, 066001 (2025): https://doi.org/10.1103/PhysRevD.111.066001
- A. H. Chamseddine and A. Connes, *The Spectral Action Principle*, Communications in Mathematical Physics 186, 731–750 (1997): https://doi.org/10.1007/s002200050126
- Quantum Doob transforms and Petz recoverability motivate the next source-loaded dynamical identification; no uniqueness/physical spacetime result has been established here.

## Execution
`python research_archive/2026-10-27_cathedral_literature_math.py`
Requires numpy, sympy, networkx. Checks Hodge ranks/moments, gauge invariance, the original five-cube spectral projector decomposition, dodecahedral inversion parity, exact rational 10D source Gram spectrum and quantum-channel identities.
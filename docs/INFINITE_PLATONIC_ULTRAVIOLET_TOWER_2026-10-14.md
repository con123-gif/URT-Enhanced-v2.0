# Cathedral infinite Platonic UV hierarchy (14 October 2026)

**Status:** exact, conditional infinite-dimensional mathematical extension; NOT experimentally verified sub-Planck spacetime. Conversation calculations take precedence; GitHub preserves reproducible checkpoints.

## 1. Five Platonic branches, golden recursion and doubling
The five rank-4 hidden cube projectors P_j on the 20 dodecahedral vertices have exact Gram matrix G_ij=Tr(P_i P_j): diagonal 4, off-diagonal 5/8. Their five tetrahedral alternations define a regular 4-simplex with v_j=sqrt(5/4)(e_j-(1/5)sum_i e_i) in R5. Define **provisionally** s=phi^-2 and F_j(x)=s x+(1-s)v_j. Since s<1/2, the five contracted simplex pieces are disjoint, with infinite attractor Hausdorff dimension

  d_H=ln5/(2ln phi)=1.6722759381845547.

The label-doubling operation D(j)=2j mod5 is an exact automorphism of every recursive depth, D F_j=F_(2j)D, D^4=I. It is a root-label transformation, NOT a physical three-dimensional A5 rotation.

**Selection proviso:** phi^-2 is the existing URT angular coefficient, not an already derived physical length contraction. URT's inverse radial multiplier e/pi≈0.865255 is different and too large for five disjoint simplex pieces; other overlapping or multi-rate constructions remain possible.

## 2. Rational overlap state and information exponents
Construct R5=G/TrG=G/20=(27/160)I5+(1/32)J5. It is positive, trace 1, diagonal 1/5, off-diagonal 1/32, with spectrum 13/40 (once) and 27/160 (four times), Tr R5²=281/1280. The matrix is fully S5-equivariant and commutes with doubling.

The consistent tensor-product states R5^(tensor n) define a quasi-local infinite-depth branch state. Its entropy per refinement is 1.566329722141941 nats. For the conjectured golden scale:
  d_info=H(R5)/(2ln phi)=1.627484654962431;
  d_corr= -ln Tr(R5²)/(2ln phi)=1.575460752021328.
These are internal information-scaling exponents, not a physical spacetime spectral dimension.

## 3. A genuine positive, trace-class infinite transfer
Use the preceding entropy-grading-centred 13-state candidate response K13=B13 B13^T, with top eigenvalue 0.21874728925057668 (distinct from the not-yet-identified fully selected species-loaded H64 T_star). On level n, dimension 13*5^n, define

  Q_n=R5^(tensor n) tensor K13^n, with Q_0=I13.
  Q_infty=direct_sum_(n>=0) Q_n.

All Q_n are positive. Since Tr R5=1, Tr Q_n=Tr K13^n and rho(K13)<1, Q_infty is positive and trace class:

  **Tr Q_infty=Tr(I13-K13)^(-1)=13.317780011294316.**

A direct 325x325 positive two-level block and 31-level resolvent are numerically verified. Raw UN-normalized independent five-branch replication diverges because 5 rho(K13)=1.0937364462528834>1. The cube-overlap normalization produces a finite return without a fitted continuous weight. Tensorizing the selected K13 at every scale is nevertheless an additional physical-history assumption.

## 4. UV critical heat exponent for the frozen H_T=-log T convention
Using H=-log(Q_infty), the dimensionless partition/heat trace for beta above threshold is

  Z(beta)=Tr exp(-beta H)=sum_(a=1)^13 1/[1-lambda_a(K13)^beta ((13/40)^beta+4(27/160)^beta)].

The critical convergence exponent satisfies

  rho(K13)^beta_c [(13/40)^beta_c+4(27/160)^beta_c]=1,

giving **beta_c=0.511037208268833**. The trace diverges at and below beta_c and is finite above it; Z(0.55)=21.52186153; Z(0.6)=16.67636591; Z(1)=13.31778001. It is a genuine new spectral threshold of this conditional infinite operator, not a measured physical temperature.

## 5. Potential signatures, not measured claims
For ell_n=ell0 phi^(-2n), the predicted geometric log-scale interval is 2 ln phi and angular log-frequency 6.52850260527. The normalized leading return falls with dimensionless exponent -ln(rho K13)/(2ln phi)=1.57917788661. Starting ell0 at the Planck length **only illustratively**, ell10≈1.06846e-39 m and ell100≈2.57621e-77 m. No physical identification of these lengths is established.

The finite original Cathedral results remain in force: hidden L_hid=3P_4_3+5P_4_5, rho_star, BKM stiffness, 1+6+9 response sectors, nonzero H64 hidden-four return in the earlier scalar audit, and the canonical URT phase-versus-positive-transfer distinction.

## 6. Proof boundary and reproduction
Precisely shown: golden IFS with explicit length assumption; 5-cube Gram rational state; doubling equivariance; positive infinite trace-class operator; finite trace and critical thermal exponent. Not yet shown: dynamical derivation of the length-contraction rule; fully species-loaded 64x64 cross-scale T_star; Lorentzian spacetime distance, causal locality, Einstein stress tensor and actual photon/current observables; physical accessibility beneath Planck length.

Reproduce in the repository with:
  python research_archive/2026-10-14_platonic_unification/infinite_uv_fractal_transfer.py

An expanded independently executed script and JSON are saved as local turn artifacts. Do not elevate a local failed physical identification to a global Cathedral no-go.


## Intrinsic scale dictionary and rail crossing (14 October continuation)
The golden five-branch IFS establishes an **intrinsic dimensionless length ratio** if the length contraction hypothesis s=phi^-2 is adopted:
  ell_n/ell_0 = s^n = phi^(-2n)
  k_n/k_0 = phi^(2n) (under the further inverse-length momentum identification).
This does not require a separately fitted scale at each level. It **does** retain the single overall calibration ell_0: multiplying all physical lengths by any c>0 preserves all preceding dimensionless identities, so the finite geometry alone cannot uniquely express ell_0 in metres.

The previously frozen rail gap Delta=3/20-80pi/(1053phi) defines a *testable dimensionaless crossing criterion* once compared to a normalized geometric interval:
  n_Delta=(-ln Delta)/(2 ln phi)=6.229894689307205;
  s^6=0.003105620015141859 > Delta=0.002489189840420403 > s^7=0.001186241289642227.
Therefore the **first integer level finer than the rail fraction** is 7, with no parameter fitting. This is an arithmetic relation of two pre-existing constructs, **not yet a physical rail transition**.

For the candidate 13-state positive K13 with top eigenvalue lambda=0.21874728925057668, the level-aggregate top fibre contribution scales as lambda^n=(ell_n/ell_0)^zeta, where
  zeta=-ln(lambda)/(2 ln phi)=1.57917788660982.
This is an internal response-scaling exponent; the actual per-address maximum eigenvalue of R5^tensor n tensor K13^n instead scales as [(13/40)lambda]^n. Do not confuse per-address eigenvalue with level-aggregate trace.

If, merely as an **external calibration**, ell_0 is set to the known Planck length 1.616255e-35 metres, the model's ratios imply:
  ell_1=6.17354e-36 m;
  ell_7=1.91727e-38 m;
  ell_10=1.06846e-39 m;
  ell_0*Delta=4.02317e-38 m.
Using a measured Planck anchor is not deriving the dimensional Planck length from the Cathedral; equally, this mathematically valid sequence is not experimentally verified sub-Planck geometry.

The precise corrected verdict: **The Cathedral now has a relative scale and a conditional infinite scale ladder; what is not derived is its unique absolute metric calibration and the proof that the proposed golden subdivision is the physically selected spacetime recursion.** Do not revert to the overbroad claim that the theory 'has no scale'.

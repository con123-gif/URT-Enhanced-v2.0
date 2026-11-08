# Newton's Cathedral — native 64-history spatial propagator through sixth order

**2026-11-08.** This is a new executable spatial transport layer for the 190-cochain/64-signed-history/24-golden-clock Cathedral. The source operator is the **unchanged** November 7 pair-flip history `Hbits`; all six antipodal icosahedral axes are read directly from the archived original code. The original five-solid source and the 24-clock are preserved in the active URT engine, not replaced by a 13-state cell. No experimental masses/couplings are fitted.

## 1. Native propagation algorithm

The six icosahedral unit axes `u_i` obey `sum_i u_i u_i^T=2 I_3`. Original histories are `s in {±1}^6`, with `Hbits=sum_{i<j}(I-F_i F_j)` where `F_i` flips one signed axis. Pair flips preserve `p=prod_i s_i`, so each 32-state parity class is an irreducible continuous-time Markov chain with unique zero and first positive eigenvalue 10. The original full 64-state spectrum is `0(2),10(12),16(30),18(20)`.

Use the native 3D history observable `X(s)=sum_i s_i u_i`, already established as `Hbits X=10X`. The displacement readout is

`Y_t = r int_0^t X(S_u) du`, with frozen `r=pi/e`.

The **exact**, unapproximated spatial Fourier generator in each parity sector is

`A_p(k) = -Hbits|_p + i r diag[k dot X(s)]` (a 32x32 matrix).

Its finite-time characteristic function for a stationary history is **exactly**

`Phi_p(k,t) = (1/32) 1^T exp(t A_p(k)) 1`.

This defines spatial evolution without postulating a spatial Laplacian. For small `k` the analytic eigenvalue `-mu_p(k)` continuing the unique zero of `A_p(0)` controls the longest-lived transport mode; other history modes relax with a gap 10 at zero wave number.

## 2. Exact low-wave-number theorem

Put `n=k/|k|`, `a_i=n dot u_i`, `S_{2j}=sum_i a_i^(2j)` and `Pi_6=prod_i a_i`. The history Markov permutation and sign symmetries imply a degree-2/4/6 Taylor expansion with invariants of the form `S2`, `S2²,S4`, and `S2³,S2S4,S6,p Pi6` respectively. The coefficient identities, **valid for arbitrary six real a_i** with the same pair-flip generator, are

`mu2/r² = S2/10`,

`mu4/r⁴ = -S2²/4000 + S4/800`,

`mu6/r⁶ = S2³/300000 - S2*S4/40000 + S6/24000 + p*Pi6/640`.

**Exact proof algorithm:** Work in the 32-dimensional Walsh basis on parity class `p`; choose one representative from each complementary pair of six-bit masks. The mask for a subset of size `d` has kinetic eigenvalue `2d(6-d)`. Multiplication by `V=sum a_i s_i` toggles one mask bit; crossing to the complementary representative contributes `p`. For a real tilt `Hbits+t V`, write the eigenpair as `psi(t)=sum t^n v_n`, `mu(t)=sum t^n m_n`, normalize `E_p psi=1` and `E_p v_n=0` for `n>=1`. Then

`m_n = E_p[V v_(n-1)]`;

`v_n = Hbits^+ [sum_{j=1}^n m_j v_(n-j) - V v_(n-1)]`.

This finite recurrence uses only rational arithmetic when `a_i` are rational. Signed-permutation invariance proves that at orders 2,4,6 the coefficient polynomials belong to the stated finite invariant bases. Evaluating the recurrence at the four rational six-vectors `(1,0,0,0,0,0)`, `(1,1,0,0,0,0)`, `(1,1,1,0,0,0)`, `(1,1,1,1,1,1)` in both parity sectors fixes all coefficients uniquely. The included verifier checks the resulting identities at **six** independent rational input vectors in **both** sectors. Finally substitute `t=i r |k|` and define `mu_p(k)=-lambda_p(k)` for the tilted Markov generator.

For the actual six icosahedral unit axes there are two additional **exact** angular identities:

`S2=2` and `S4=6/5` for every unit direction `n`.

Consequently the physically relevant, completely frozen long-wave calculation is

`mu_p(k) = (pi/e)^2/5 * |k|² + (pi/e)^4/2000 * |k|⁴ +`

`  + (pi/e)^6 [ (S6(n)-4/5)/24000 + p*Pi6(n)/640 ] * |k|⁶ + O(|k|⁸).`

The first two spatial coefficients are **rotationally isotropic**, and the first icosahedral-direction and parity-dependent corrections appear at sixth order. This is a prediction of the specified native history displacement readout, not a generic statement that all Cathedral/physical fields automatically have the same dispersion.

Numerical coefficients: `D=(pi/e)^2/5=0.2671411414109495` and `B=(pi/e)^4/2000=0.0008920548679293115` in internal units. For each parity and each tested unit direction, the real part of the exact eigenvalue at `|k|=0.5` differs from the sixth-order series by `<= 7e-9`, with relative error below `1.1e-7`. Tests also cover `|k|=.15,.3,.8` and finite-time Fourier characteristic functions.

## 3. Exact finite-time covariance

At equilibrium within either parity class, `E[X_a(t)X_b(0)]=2 delta_ab exp(-10t)`. Therefore the **complete** finite-time displacement covariance, without invoking a diffusive approximation, is

`Cov(Y_t)_ab = delta_ab [(2r²/5)t - (r²/25)(1-exp(-10t))]`.

The program checks this identity numerically against the exact 32x32 matrix-exponential characteristic function. The large-time growth has the computed diffusion coefficient `D=r²/5`. On short times the expression is ballistic (starts quadratically), a feature that a standalone inserted heat equation would lose.

## 4. Relation to the running engine

The public callable `native_urt_spatial_transport()` loads **the same** 7-November operator archive used by `native_urt_engine()` and `native_urt_full_dynamics()`. Its `tilted_generator`, `hydrodynamic_pole`, `decay_series` and `characteristic_function` methods are executable. The original 190/64/24 nonlinear Hamiltonian engine is **preserved** without changing its established energy/Noether gradients and tests; the new 3D spatial propagation is a readout of its native history generator, not an artificial modification of the original action.

A further true-field integration would need to identify which source currents are transported by this history-additive coordinate and establish a quantum spacetime kinetic law from that identification. This note **does not silently introduce** such a field coupling or assert that the Brownian branch is a physical massless photon or gravity wave.

## 5. Run and provenance

`python -m pytest tests/test_native_spatial_transport.py` (from the repository root with `numpy,scipy,mpmath`). The standalone test script can also be executed with `python tests/test_native_spatial_transport.py`.

The test directly imports the untouched November 7 whole Cathedral source and checks its original SHA-256 `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`. All tests are original Newton's Cathedral work. No Lockwood or other third-party manuscript/code enters this implementation.
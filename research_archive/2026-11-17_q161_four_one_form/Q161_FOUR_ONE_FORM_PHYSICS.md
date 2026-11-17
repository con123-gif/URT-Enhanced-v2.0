# Q161: Unimodular native Dirac coframe and 4D gauge-polarization projection

**Date:** 17 November 2026. **Result:** Exact original-v61 linear Dirac coframe, with finite graded-Q125 four-one-form numerical response. **Physical continuum identification remains open.**

The original native eleven link directions are three spatial unit vectors and eight temporal-spatial displacements d=(1,b1,b2,b3), b_i in {0,-1}. The original unmodified hopping F,B yields **exactly**
D_v61(p)=-M I4+i gamma0 (p0-(p1+p2+p3)/2)+i sum_i gamma_i p_i+O(p^2).
Thus the 4x4 coframe is e=[[1,-1/2,-1/2,-1/2],[0,1,0,0],[0,0,1,0],[0,0,0,1]] and det(e)=1 (no fitted speed or Jacobian). The induced bare metric is e^T e, with temporal-spatial cross terms. This is the derivative of the bare Dirac operator; it does NOT by itself derive massless continuum fermions, reflection positivity or equality with the induced photon cone.

**New gauge bridge:** For a long-wavelength spacetime 1-form a_mu(k), the original eleven link line integrals have unique straight-segment map E_{jmu}(k)=d_{jmu}(1-exp(-i k·d_j))/(i k·d_j) with continuous limit. It obeys the *exact lattice gauge chain identity* E(k)(i k)=1-exp(-i Dk), matching the exact native Q125/v61 Ward gradient. E has rank four on every tested mode. Choose the orthogonal 7-dimensional complement N=ker(E†), which represents non-continuum independent link polarizations in the 11-link lattice.

For the native original Q125 graded 11×11 Hessian H(k), integrate those seven via their positive quadratic block to get K4(k)=E† H E - (N†HE)†(N†HN)^{-1}(N†HE). This is a mathematically exact finite Gaussian Schur reduction, not a new fitted operator; it preserves Ward K4(k)(i k)=0. On a locally positive-Hessian branch, the reduced 4x4 matrix has exactly one gauge zero and three positive Euclidean transverse eigenvalues when k≠0. At k=0 the 4 global holonomy modes can carry nonzero finite-volume stiffness.

**Independent executed original-formula numerical evidence:**
- Ns=4 curved stationary branch, first temporal k0=pi/3: K4 spatial y/y=276.8649892223.
- Ns=6 curved stationary branch, identical k0=pi/3: K4 spatial y/y=278.3204059803. Relative drift = 0.523% (this is finite response at fixed temporal frequency, **not** a continuum-extrapolated physical Z_t).
- Ns=4 curved first spatial kx=pi/2: K4 transverse y/y=680.0123365; Ns=6 curved kx=pi/3: 630.6115354. Different k; do not infer c_eff.
- Uniform k=0 K4 spatial y/y: 250.1359969 on Ns4 curved; 111.8192537 on Ns6 curved. Toron potential remains finite at each lattice size and must be subtracted/controlled before identifying a massless photon.
- Ns4 competing nearly flat stationary branch also tested. In all cases: seven-direction block strictly positive, exact 4D embedded gauge Ward residual ~1e-15, 4×4 nonzero-mode spectrum one zero + three positive.

**Verification:** Local original-formula standalone scripts Q161_EFFECTIVE_PHOTON_PROBE.py and Q161_BARE_DIRAC_TETRAD_CERT.py were executed and generated JSON with all 12 sampled modes. The GitHub certificate imports unchanged ORIGINAL Q101/Q124/Q125/v61 source and recomputes the same source-native charged spectrum on all 444 states, then checks the saved *numerically optimized* NS4 and NS6 stationary branch angles by the original action gradient (no experimentally fitted inputs), the coframe derivative, and the Schur-reduced four-dimensional gauge response. Source-native CI must finish before calling this a native CI pass.

**Physical status:** This establishes a precise finite linearized 11-to-4 electromagnetic response map and a bare unimodular relativistic coframe, not continuum Lorentz symmetry, an observed alpha, a physically unique vacuum, non-Abelian Yang-Mills dynamics or Einstein gravity. Q161 next: extract gauge-invariant k² pole residues along a controlled volume/spacing sequence for the dynamically selected branch, treating k=0 global holonomy modes separately, then compare photon and bare fermion cones. Keep original 190/H64/24 selection gate open.

**RESUME HERE:** Original graded stationary solutions from NS4 and NS6 are numeric research outputs; no extra physical constants. All major old source-native claims remain intact. This new exact four-one-form map is the well-defined object on which the actual continuum 4D photon residue can be calculated, rather than guessing a 4D projection.

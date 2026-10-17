# Native chiral Berry and KMS phase from Cathedral geometry — 17 October 2026

**Executed exact finite-operator construction; not yet a physical Koide mass-phase derivation.** This is an additive mathematical result, not a revision of the complete URT/H64 programme.

Using the actual face graph Laplacian L of the icosahedral 20-face/125-simplex geometry, construct polynomial spectral projectors P3 and P5 onto the two hidden quartets, and the previously established integer signed-face chirality matrix W. Exactly, W^T=-W and W²=-15(P3+P5).

Define J=W/sqrt(15) and chiral projector Pi+=(P3+P5-iJ)/2. With the native twelve vertex effects E_i=P_hid diag(C[:,i]) P_hid/3, exact symbolic computation on every one of the twenty consistently oriented icosahedral faces (i,j,k) gives

    Tr(Pi+ E_i Pi+ E_j Pi+ E_k)
      = 743/182250 - i 13sqrt(15)/60750.

The complex conjugate is obtained by reversing triangle orientation. The geometric chiral Bargmann-type phase is exactly

    Phi0 = -atan(39 sqrt(15)/743) = -0.20055944113520455 rad.

This is a genuine intrinsic basis-invariant oriented complex triangle amplitude. It does not assume that the curvature norm 4/5 is a Berry flux; no experimental mass ratios enter.

For the canonical rho*=a P3+b P5 with a=1/[4(1+Delta²)], b=Delta² a, define the normalized positive chiral state

    rho_chi=2 sqrt(rho*) Pi+ sqrt(rho*) = rho* - i sqrt(ab) J.

Its parity-block-diagonal part is exactly rho*. The resulting exact triangular amplitude for each face is

    Tr(rho_chi E_i E_j E_k)
       = (699+655 Delta² - i 54 sqrt(15) Delta)/
         [729000 (1+Delta²)],

and the exact entropy-dependent geometric phase is

    Phi_chi = -atan[54 sqrt(15) Delta / (699+655 Delta²)]
            = -0.00074476220923058 rad.

**Physical boundary:** The choice of chiral branch and the mapping from this face observable to the three-generation mass spectrum must come from the species-loaded URT selected transfer. These amplitudes are not, by themselves, photon-induced physical Koide predictions. As a simple discriminant, inserting |Phi0| into the exact-Q=2/3 Koide circulant yields mu/e ≈76.3242, not 206.7683. Do not silently identify a spatial orientation with time-reversal violation.

Independent SymPy executable: conversation artifact cathedral_exact_chiral_loop_2026-10-17.zip, containing the unchanged c64 module, all-face exact checks, report and run output. All checks passed.

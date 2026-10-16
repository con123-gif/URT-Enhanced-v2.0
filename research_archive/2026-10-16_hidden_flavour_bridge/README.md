# Hidden-to-flavour bridge: exact parity correction (16 October 2026)

## Status
**Exact finite-matrix mathematical identity. Not a derived physical Koide phase or a fitted mass model.** The original zero-bridge audit has two material mistakes: inversion parities are opposite on hidden eigenspaces, and its unswitched cone-shell basis has inconsistent face orientations.

## Definition
Use the canonical icosahedral vertex/face incidence C (20 x 12), face Laplacian L=d2^T d2, and orthonormal columns H spanning the lambda=3 and lambda=5 face eigenspaces (each dimension four). The canonical vertex POVM effects are

  E_i = H^T diag(C[:,i]) H / 3,    sum_i E_i = I_8.

The combined hidden spectral projector has an exact **rational polynomial** expression,

  P_3+P_5 = -L(L-2I)[(L-3I)^2-5I]/15.

Let U0 (12 x 6) be the two normalized icosahedral dipolar triplets returned by the original `cathedral_strict_64_closure.py`. Define

  K_a = sum_i U0[i,a] E_i,  for a=1,...,6.

Under inversion R=diag(-I4,+I4) on the hidden carrier,

  E_(anti i) = R E_i R, not E_i.

Consequently, R K_a R = -K_a and K_a is purely 4_3-to-4_5 off-block:

  K_a = [[0,B_a],[B_a^T,0]],  B_a != 0.

This explains why a vertex-odd contraction does *not* vanish: it connects hidden sectors with opposite inversion parity. The antipodal effects obey

  ||E_i-E_(anti i)||_F = 2/(3 sqrt(3)),
  -Tr((-9[E_i,E_(anti i)])^2) = 16/135.

## Exact Gram invariants
The following is independent of the orthonormal bases chosen within the two hidden eigenspaces:

  Tr(K_a K_b) = diag(g+,g+,g+,g-,g-,g-),
  g+ = (10+4sqrt(5))/135,
  g- = (10-4sqrt(5))/135.

An algebraic derivation uses the polynomial projector above, with t the (unnormalized) vertex-coordinate ratio. The squared triplet coupling at that t is

  g(t)=2(7t^2+8t+3)/(135(1+t^2)),

so t=phi produces g+ and t=-1/phi produces g-. Hence

  sum_a Tr(K_a^2) = 3(g++g-) = 4/9,
  sum_a ||B_a||_F^2 = 2/9.

No empirical masses, fits or external scales enter these results. The 2/9 here is an **operator-norm invariant**, not the physical angle delta=2/9 radians.

## Canonical Gibbs/BKM response
For rho_*=a I4 (+) b I4, a=1/[4(1+Delta^2)], b=Delta^2 a,
eta=-log(Delta), and chi=(log a-log b)/(a-b),

  sum_a <i[K_a,rho_*],i[K_a,rho_*]>_BKM
    = chi (a-b)^2 sum_a Tr(K_a^2)
    = (2/9) eta tanh(eta).

At the canonical Delta this is 1.332383041440. This establishes a nonzero response in the existing information geometry, without selecting a physical charged-lepton mass operator.

## True zeroes and code correction
For real symmetric E_i and rho_*, the single-commutator observable Tr(rho_*[E_i,E_j]) vanishes identically, even though [E_i,E_j] is nonzero. Likewise, the Gibbs-traced oriented triple-product antisymmetry vanishes in this real representation. These are *observable-specific* cancellations, not a universal bridge obstruction.

The shell U3 triplets are expanded in the **oriented face basis**, whereas `real_tetrahedral_complex` stores **sorted** exterior triangles. The naive `lift.T @ full_L2 @ U3_shell` norm is 6.511528238440, not zero. Multiply each outer face by the parity of the permutation that sorts its vertex indices: the corrected cross norm is approximately 3.5e-14. Thus the correctly oriented scalar-Laplacian cross coupling is zero.

## Physical frontier
The geometric maps K_a and their canonical BKM response are fixed. The historical three-generation H64 machine and the charged-lepton circulant mass matrix still require a *demonstrated operator identification* before any claim that a physical Koide phase is selected. The empirical diagnostic delta*=0.2222220470731, conditional on exactly Q=2/3, differs from 2/9 by about 1.75149e-7 radians; that correction is not explained by the squared-norm identity. Do not treat the operator-norm 2/9 as a phase without an independently motivated dynamics.

Run the regression:
```sh
python research_archive/2026-10-16_hidden_flavour_bridge/koide_hidden_flavour_corrected_audit.py
```

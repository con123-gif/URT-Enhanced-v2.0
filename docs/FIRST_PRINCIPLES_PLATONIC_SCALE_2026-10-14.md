# First-principles Cathedral scale certificate — 14 October 2026

**Conclusion (precise scope):** The existing dodecahedral Laplacian and the previously constructed five-cube doubling permutation force the unique positive *relative refinement ratio* s=phi^-2 **if** the exchanged triplets are spectrally matched as the same second-order mode on adjacent resolutions. An independently constructed positive nonlinear shell transfer obeys a consistent three-dimensional scaling identity. This does not yet derive the physical H64 cross-scale selector or an absolute metre scale.

## 1. Derive s WITHOUT entering it as an input
For the actual 20-vertex dodecahedron L=3I-A,
  spec L = {0(1), [3-sqrt(5)](3), 2(5), 3(4), 5(4), [3+sqrt(5)](3)}.
The actual order-four 20-state permutation D from five inscribed cubes satisfies
  D P_low D^T=P_high; D P_high D^T=P_low
where P_low and P_high are rank-three spectral projectors of L.
It preserves the two pre-existing four-dimensional entropy projectors individually:
  D P_4_3 D^T=P_4_3; D P_4_5 D^T=P_4_5.
Its exact conjugation identity is
  D L D^T=L+2sqrt(5)(P_low-P_high).
This is a duality, not a spatial isometry.

For a second-order operator with a single lattice edge length ell, a mode has squared physical wavenumber proportional to lambda/ell^2. Impose the specific inter-resolution matching condition
  lambda_high/ell^2 = lambda_low/(s ell)^2.
Solving, uniquely among positive s:
  s_L=sqrt((3-sqrt(5))/(3+sqrt(5)))=phi^-2
     =0.3819660112501051.
The golden contraction is an algebraic CONSEQUENCE of the graph spectrum and this sharply stated matching rule, not a free input.

## 2. Positive nonlinear transfer independently satisfies an order-3 scale ratio
The entropy-weighted positive nonlinear 12-shell source Gram K=F F^T was derived before this scale test. It has three-dimensional response eigenspaces at
  k_+=2 a b (5+2sqrt(5))/15,
  k_-=2 a b (5-2sqrt(5))/15,
  a=1/[4(1+Delta^2)], b=a Delta^2.
Construct the induced, orthogonal 12x12 doubling operator
  Q=C(C^T C)^(-1/2); W=Q^T D Q,
where C is the actual 20x12 dodecahedron-face/icosahedral-vertex incidence matrix. W exchanges the two rank-three eigenprojectors of K (numerical error ~4.4e-11).
  k_+/k_-=phi^6.
Consequently the independent exact cross-operator equality is
  (lambda_high/lambda_low)^3=(k_+/k_-)^2=phi^12.

**Conditional volume-response dictionary:** if K is a three-dimensional volume-density current/response, its matching equation k_high/ell^3=k_low/(s ell)^3 gives
  s_K=(k_-/k_+)^(1/3)=phi^-2=s_L.
Unlike the algebraic equality, the physical assertion that K has this density-scaling weight has not been proved by the fully species-loaded microscopic action.

## 3. Independent geometric pentagram check
For a unit-radius regular pentagon, the intersection of diagonals (j,j+2) and (j+1,j+3), j mod5, gives five inner vertices, all at radius phi^-2. The nested star-pentagon therefore reproduces the same exact relative ratio without using any response operator. Extending this 2D star contraction to every 4D five-branch simplex refinement remains a geometric-recursion hypothesis.

## 4. How the infinite tower follows under a precise hypothesis
If the physical history selector identifies the exchanged triplet modes as the same propagating excitation after one step, then the matched length ratio is rigid and can be iterated:
  ell_n=ell_0 phi^(-2n), n>=0.
That yields infinitely many relative resolutions with no terminal n. Neither this consistency condition nor the length interpretation has yet been derived from the **canonical** fully species-loaded H64 B_star and T_star=B_star^dagger B_star.

## 5. Scope tests, not project-wide no-gos
- D L D^T != phi^4 L on all 20 modes: direct matrix norm defect ~95.118. The exact covariance applies only to the exchanged triplets; untouched scalar/fiveplet/four-sector modes cannot be waved away.
- The complete positive 13-state K13 is not D-invariant: induced 13D doubling conjugation defect ~1.13e-6. Its rank and positive properties remain intact.
- Under ell_0 -> c ell_0 for any c>0, all incidence, symmetry, relative spectra and s remain the same. Hence these **dimensionless axioms alone do not choose one numerical length in metres**. Absolute physical calibration requires a dimensional action/metric/clock interface, not a bare graph identity.
- Planck length is not assumed the bottom; unbounded mathematical subdivision is not empirical proof of measurable sub-Planck distances.

## 6. Reproduction / precedent
The local full matrix and pentagram certificate is in the current conversation file Cathedral_First_Principles_Scale_2026-10-14.md and its accompanying Python/JSON. Reproduce from the two existing *independently constructed* repository scripts by running
  python research_archive/2026-10-14_platonic_unification/first_principles_scale.py

This result upgrades the earlier arbitrary golden IFS contraction to a **derived triplet-sector spectral matching ratio**; it does not supersede the original URT spiral q=(pi/e) exp(i 2pi/phi²), whose radial multiplier is distinct, nor the entropy L_hid=3P_4_3+5P_4_5, nor the physical T_star requirements.

**Next exact equation:** derive, from the selected species-loaded T_star and its H64 inter-scale action R, the triplet-covariance relation
  R^dagger (P_low L P_low) R = s^2 P_high L P_high
on appropriately scaled levels, and the separate order-3 transfer/contact covariance, without adding fitted coefficients. These are the concrete physical selector tests.

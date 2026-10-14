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


## 7. Canonical energy-metric lift of doubling (additional first-principles test)
On the 20-dimensional dodecahedron carrier let P0 project onto constants and L_+^{±1/2} be the ordinary positive square root and inverse square root of L restricted to mean-zero states. The **canonical L-energy isometry** associated with the actual doubling permutation D is
  U_L=P0+L_+^{-1/2} D L_+^{1/2}.
Its identity is exact: U_L^T L U_L=L, and U_L^4=I. On the high-triplet-to-low-triplet channel it amplifies mode amplitudes by phi²=2.61803398875; on the reverse channel it attenuates by phi^-2=0.38196601125. The observed matrix residuals are ~3.91e-14 for energy preservation and ~1.59e-14 for order four. **This derives an intrinsic energy-normalized amplitude scale without matching a physical length.** Equating that amplitude scale with a change in physical length still requires the spectral-covariance/distance identification.

Because U_L^4=I, repeated application alone does NOT produce ever-smaller distances. An infinite one-way refinement needs additional branching, an inverse-limit history extension or a noninvertible selector. This precise limitation concerns only repeated D, not URT as a whole.

## 8. Deriving noninvertible five-branch history selection from the same cubes
Let Q_j denote the rank-one projections of the five cube hidden projectors into the four-dimensional A4 simplex. They satisfy
  Tr(Q_j)=1; Tr(Q_i Q_j)=1/16 (i!=j);
  sum_j Q_j=5/4 I4.
Define five **geometry-normalized** Kraus operators A_j=sqrt(4/5) Q_j. Then
  sum_j A_j† A_j=I4
with no free continuous branch weight. Starting in simplex state Q_i, the chosen cube label follows the exact transition probabilities
  P(j|i)=4/5 for j=i, and 1/20 otherwise.
This stochastic matrix has eigenvalues 1 (x1) and 3/4 (x4): nonstationary label correlations decay as (3/4)^n. This is a legitimate positive bounded-memory finite history selector built from the existing Platonic geometry, though not yet identified with the canonical URT/H64 selector.

The full 13D cube-span similarly admits the canonical fusion-frame instrument
  S=sum_j P_j=(5/4)(P_4_3+P_4_5)+2P_5,
  A_j^(13)=P_j S^(-1/2),
  sum_j (A_j^(13))† A_j^(13)=P13.
In the three invariant representation population blocks (4_3,4_5,5), its exact population transition matrix (rows=output, columns=input) is
  [[1,0,0],[0,1/3,1/3],[0,2/3,2/3]].
It has two independent stationary sectors. Hence the geometry produces a normalized channel but **does not uniquely select the complete vacuum entropy populations**; URT/rail selection must still make that choice.

## 9. Conditional infinite fractal with actual Markov histories, not independent branches
Combine the **derived** relative triplet scale s=phi^-2 with the **derived** rank-one five-branch quantum instrument and identify cube labels with the proposed five affine 4-simplex refinements. This latter spatial identification remains a physical/geometric hypothesis. The resulting stationary branch process has transition probabilities 4/5 (repeat) and 1/20 (switch).

Its exact entropy rate is
  h=-(4/5)ln(4/5)-4(1/20)ln(1/20)=0.777661295762166 nats/step.
For five non-overlapping golden similarity branches its candidate internal dimensions are:
  support Hausdorff dimension D0=ln5/(2ln phi)=1.6722759381845547;
  Markov information dimension D1=h/(2ln phi)=0.8080238839370208;
  Markov correlation dimension D2=-ln(13/20)/(2ln phi)=0.4476021719116077.
These are new consequences of the actual geometry-normalized branch probabilities, rather than the *different* independent tensor-product R5 ansatz. Neither branch model has yet been shown to describe measurable sub-Planck spacetime. Keeping both explicit prevents inconsistent assumptions being silently combined.

Local executable artifacts: cathedral_scale_first_principles_2026_10_14.py; cathedral_scale_fractal_selector_2026_10_14.py; Cathedral_First_Principles_Scale_Certificate_2026-10-14.json; Cathedral_Five_Cube_History_Selector_2026-10-14.json.

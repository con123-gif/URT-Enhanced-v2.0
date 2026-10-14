# Newton–Platonic hidden-to-geometry reconstruction theorem
**14 October 2026 — independent numerical verification with analytic formulas**

## Provenance and scope
Uses the existing five-inscribed-cube/dodecahedral 20×12 vertex–face incidence geometry and **the existing entropy-weighted quadratic map** `F` (12×36) from `Cathedral_Transfer_Observable_Operators_2026-10-14.npz`. Define `K=F Fᵀ`. Nothing from observed particle masses, Planck length or Einstein field equations enters this calculation. The output is an **internal Euclidean correlation geometry**, not yet a Lorentzian spacetime.

## Theorem 1 — hidden response determines the complete icosahedral graph
Let `phi=(1+sqrt(5))/2`, `Delta=3/20-80*pi/(1053*phi)`, `a=1/[4(1+Delta²)]`, `b=a Delta²`. The `A5`-symmetric positive response has four distinct eigenvalues:

- `k_1 = 3(a²+b²)` with multiplicity one;
- `k_5 = (3/25)a²+(1/3)b²` with multiplicity five;
- `k_3 = 2ab(5+2sqrt(5))/15` with multiplicity three;
- `k_3' = 2ab(5-2sqrt(5))/15` with multiplicity three.

Denote their spectral projectors by `E_1,E_5,E_3,E_3'`. They can each be computed solely as the Lagrange polynomial in `K` associated with the corresponding eigenvalue, since the four eigenvalues are distinct for the specified `Delta`. Then

    A_recovered = 5 E_1 - E_5 + sqrt(5)(E_3-E_3')

is precisely the **integer adjacency matrix of the 12-vertex regular icosahedron**; numerically `max_abs(A_recovered-round(A_recovered)) = 3.7000e-11`. It has 5 neighbours per vertex, 30 edges, diameter 3, and the characteristic spectrum of the icosahedral graph.

The projector `E_3` alone provides a three-dimensional Euclidean coordinate embedding, up to an orthogonal transformation: rows of `X=2 U_3` have unit norm and pairwise inner products `1/sqrt(5)` (edge), `-1/sqrt(5)` (graph distance 2), `-1` (antipodal). No three-dimensional coordinates are used in the **final** spectral reconstruction, although the upstream Platonic incidence map already encodes a discrete geometry.

## Theorem 2 — a six-point projective precursor and an exact orientation gap
The Euclidean distance induced by `K` is `d_ij²=K_ii+K_jj-2K_ij`. Its only three nonzero distance classes are

    d_edge²      = 3a²/25 + 2ab/5 + b²/3,
    d_two_step²  = 3a²/25 + 14ab/15 + b²/3,
    d_antipode²  = 4ab/3.

With frozen `Delta`, values are respectively 0.007500061960404672, 0.007500268493380670 and 5.163324399914746e-7. Their square roots are 0.0866028981063, 0.0866040905118, 0.000718562759957. The antipode/edge distance ratio is 0.00829721378459.

The exact split between graph-edge and graph-distance-two correlations is

    K_adjacent − K_two_step = (4/15)ab = 1.03266487998e-7.

The inverse problem is well posed for the exact `K`, but resolving the two correlations by entrywise thresholding requires error below half the gap, ~5.1633244e-8. An uncalibrated noisy physical measurement cannot be assumed to achieve that.

At `b=0` the triplet weights vanish, so antipodal vertex-pairs become exactly indistinguishable. The six equivalence classes are the six axes of the icosahedron, and `E_5` projects them to six vectors with Gram matrix diagonal `5/12`, off-diagonal `−1/12`. After normalization, the Gram matrix is diagonal 1, off-diagonal `−1/5`: the **regular 5-simplex in 5D**, not the ordinary 3D icosahedron. For every `b>0` in the frozen small-odds regime, the two triplets restore the distinctions among all 12 vertices and give an explicit **orientation-lift / neighbourhood reconstruction**. The limit `b→0` is a mathematical deformation of the selected state, not an observed physical phase transition.

For completeness, with `t=b/a`, nearest-antipode ordering is ensured when `0<t<(7−2sqrt(10))/5≈0.135089`; in the Cathedral `t=Delta²≈6.196e-6`. The exact graph is also reconstructible spectrally whenever the four projectors remain distinguishable even if the correlation ordering changes.

## Theorem 3 — Newton factor recovered directly from hidden information spectrum

    (k_3'/k_3)^(1/3)
      =[(5−2sqrt(5))/(5+2sqrt(5))]^(1/3)
      =phi^(-2)
      =0.381966011250105...

Numerical comparison gives 0.381966011250684 due to conditioning of the tiny triplet bands. This is an intrinsic **per-three-dimensional-sector spectral ratio** of the hidden-to-visible contact; assigning it units of physical length requires a separate metric dictionary. It agrees exactly with the independent dodecahedral triplet scale sqrt((3−sqrt(5))/(3+sqrt(5))).

## Theorem 4 — graph-local propagating response without assumed spatial coordinates
The reconstructed adjacency yields `L_shell=5I−A_recovered`. For the dimensionless graph wave equation `∂_t² u + L_shell u=0`, the analytic propagator is `cos(t sqrt(L_shell))`. If two vertices are at graph distance `d`, then `(L_shell^m)_ij=0` for every `m<d`; the first possible off-diagonal term is

    [cos(t sqrt(L_shell))]_ij
      = (A^d)_ij t^(2d)/(2d)! + O(t^(2d+2)).

Shortest-walk multiplicities are `(1,2,10)` for `d=(1,2,3)`, hence leading terms `(t²/2, t⁴/12, t⁶/72)`. This is an exact **combinatorial locality hierarchy**. The clock parameter, physical propagation speed, continuum limit and Lorentzian light cone do not follow from a static positive covariance; the finite-graph propagator has nonzero analytic tails for positive time.

## Important limitation of the 13th modular-grading source
The earlier full-rank 13×36 response with a modular-grading central port has an induced centre-to-shell information distance `0.3069090022334`, or **3.543865** times a shell-edge information distance. Therefore the algebraic *centre* does not automatically appear as a geometrical *central point* of the covariance embedding. Identifying its correlation metric with a physical 13-site spatial cell requires an additional dynamical/coframe prescription. This is not a no-go for alternative centre maps.

## What this closes and does not close
**Closed in the defined finite model:** from the hidden 4+4 sector through its existing nonlinear products, recover all 12 shell adjacency relations, the regular 3D icosahedral embedding, a six-axis projective precursor, a precise suppression/selection ratio, the Newton spectral factor and a combinatorial propagation hierarchy. No new floating normalization is introduced.

**Not closed physically:** an unambiguous time/clock generator, metric signature, a physical spacetime length, causal cones in a continuum, source stress tensors, quantum-gravity interactions, Planck crossover or independently confirmed predictions. The claimed internal state dimensions are representation dimensions, not yet additional spacetime dimensions. The graph is recovered from a source already built using the Platonic incidence map; this is a *consistency/emergence reconstruction*, not space created from unstructured data.

## Reproduction
Run `newton-scale/hidden_to_spatial_graph_emergence.py` in the repository (which rebuilds the `F` contact using the earlier archived five-cube source) or run the locally executed `newton_hidden_to_geometry_emergence_2026_10_14.py` using `--npz Cathedral_Transfer_Observable_Operators_2026-10-14.npz`. A machine-readable JSON certificate is also retained.

The use of positive covariance as a Euclidean Gram distance is standard mathematics (Schoenberg). Emergent geometry from quantum correlations is an active research field (for example, Phys. Rev. D 107, 066008). Independent novelty of this exact Platonic projective-lift identity still needs literature comparison.
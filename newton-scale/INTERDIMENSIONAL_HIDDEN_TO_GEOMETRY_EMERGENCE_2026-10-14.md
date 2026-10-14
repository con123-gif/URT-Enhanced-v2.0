# Newton–Platonic Interdimensional Emergence Programme
**14 October 2026 — integrated mathematical investigation, not an established law of nature**

## 1. What is derived from the existing five-cube hidden sector

The prior independent dodecahedral five-cube incidence construction gives a real 8-dimensional hidden carrier `4_3 ⊕ 4_5`. Its two populations are fixed by the prior Cathedral rails, `a=1/[4(1+Δ²)]`, `b=aΔ²`. Pointwise quadratic products followed by the actual 20×12 Platonic incidence map give a concrete 12×36 contact `F`, with positive shell response `K=F Fᵀ`. The four eigenspaces of `K` are the icosahedral scalar, fiveplet and two triplets:

    k_1  = 3(a²+b²)                          multiplicity 1
    k_5  = (3/25)a²+(1/3)b²                multiplicity 5
    k_3  = 2ab(5+2√5)/15                   multiplicity 3
    k_3' = 2ab(5−2√5)/15                   multiplicity 3.

Thus the actual triplet ratio is `k_3/k_3'=φ^6`, independently of the value of nonzero `Δ`.

## 2. Spatial adjacency is recoverable from the information response

For `Δ>0` in the selected regime, the four eigenspaces are distinct. Their projectors `E_r` are uniquely defined polynomial functions of `K` by Lagrange spectral interpolation. Construct

    A(K)=5 E_1−E_5+√5(E_3−E_3').

Direct computation from the retained five-cube contact yields the exact 12-vertex degree-five icosahedral adjacency to max entry error `3.7000e−11`. This does *not* assume an embedding in physical R3 at the reconstruction stage. The 3D geometric embedding is given by rows of `2U_3`, where `U_3` is an orthonormal basis of the higher eigenvalue triplet. Unit-vector inner products are `+1/√5` for edges, `−1/√5` at two graph steps, `−1` for antipodes. Since the original `F` already uses the Platonic incidence structure, this is a consistency/extraction theorem, **not** geometry from completely unconstrained information.

The correlation-induced Euclidean distance `d²(i,j)=K_ii+K_jj−2K_ij` is:

    d_edge²      = 3a²/25+2ab/5+b²/3
    d_two_step²  = 3a²/25+14ab/15+b²/3
    d_antipode²  = 4ab/3.

At the existing `Δ≈0.00248918984042`: distance(edge)=0.0866028981063, distance(two-step)=0.0866040905118, distance(antipode)=0.00071856275996. The antipodal/edge distance ratio is 0.00829721378459.

The orientation/neighbourhood difference is exact:

    K_edge−K_two_step = 4ab/15 = 1.03266487998×10^−7.

Thus orientation is recoverable from exact data but fragile to entrywise noise >5.16×10^-8. As `b→0`, antipodal pairs merge and the remaining six projective axes form a regular five-simplex with Gram diag 1, offdiag -1/5, embedded in R5. At nonzero `b`, the two odd triplets lift that degeneracy and recover the full icosahedron. This is an exact **finite information-to-spatial-representation mechanism**, not a measured phase transition.

## 3. Newton factor now also occurs in the hidden-to-visible response

    N_info=(k_3'/k_3)^(1/3)=φ^(-2)=0.381966011250105...

This is a natural per-three-dimensional-representation spectral ratio of the existing positive source Gram, and agrees with the dodecahedral Laplacian spectral ratio `sqrt((3−√5)/(3+√5))`. The arithmetic is exact. Treating N_info as **physical length contraction** still requires an operational distance map, because a dimensionless spectral ratio is not an SI metre.

## 4. A local *graph* propagation hierarchy is available

From `A(K)` define `L=5I−A` and the dimensionless wave equation `∂_τ²u+Lu=0`. Matrix powers satisfy `(L^m)_ij=0` for `m<dist_graph(i,j)`. For graph distance d the leading off-diagonal cosine propagator coefficient is `(A^d)_ij τ^(2d)/(2d)!`, giving `τ²/2` at distance 1, `τ⁴/12` at distance 2, and `τ⁶/72` at distance 3. This is combinatorial locality and an explicit candidate response equation. The dimensionful clock, propagation speed, continuum and Lorentzian causal cone are **not** yet derived. A finite graph analytic propagator has tails rather than a strict light cone.

The earlier modular grading central port remains algebraically independent but is not the geometric centre of this covariance: its information distance to any shell site is `0.3069090022`, 3.543865 shell-edge lengths. The physical role of that port therefore still requires an independent coframe/contact assignment.

## 5. A conditional exact 3-dimensional measure *inside a higher-dimensional hidden space*

The single five-branch similarity IFS, when given the Newton contraction `s=φ^-2`, has Hausdorff dimension `ln5/(2lnφ)=1.672...`: **not three**. Therefore one must not claim that fivefold branching alone produces ordinary three-dimensional spacetime.

The recovered shell has six antipodal axes. One *possible but not compulsory* six-axis refinement rule composes the elementary Fibonacci/golden substitution `T=[[0,1],[1,1]]` once for each projective axis. Its sixfold composite is

    M=T^6=[[5,8],[8,13]],
    ρ(M)=9+4√5=φ^6.

The integers 5, 8, 13 coincide with five inscribed cubes, eight hidden modes and the centred Cathedral fibre, but the actual physical six-axis substitution law has **not been derived** from the selected operator.

For any graph-directed IFS with this strongly connected two-type incidence matrix, a common contraction `s=φ^-2`, and the open set condition, the dimension formula is

    d_H = ln ρ(M)/ln(1/s) = ln φ^6/ln φ² = 3.

An explicit separated realization uses 21 vertex-centred contractions in a regular 20-simplex in R20 (the first parent type has 13 child maps, the second has 21), all `F_e(x)=s x+(1−s)v_e`. Since `s<1/2`, images at distinct vertices lie in disjoint barycentric regions, establishing strong separation. The resulting graph-directed attractors have **Hausdorff dimension exactly three**, but **topological dimension zero**; this is a higher-dimensional fractal carrying three-dimensional scaling measure, *not* an R3 manifold or Lorentzian spacetime.

## 6. The dimension-three branch probability is also fixed algebraically

Take the positive Perron eigenvector `v=(1,φ)` so `Mv=φ^6 v`. For each individual directed edge from parent type i to child type j, define

    p_e = s³ v_j/v_i.

The total probability over all `M_ij` such edges equals one for each parent because `s³Mv=v`. The per-edge probability matrix (rows source types, columns child types) is

    [[φ^-6, φ^-5], [φ^-7, φ^-6]]
    ≈ [[0.0557280900, 0.09016994375], [0.03444185375, 0.0557280900]].

The actual type transition matrix is `P_ij=M_ij p_e`, with row sums one. It is reversible, with stationary type weights

    π=(1,φ²)/(1+φ²)≈(0.27639320225,0.72360679775).

Its per-branch Shannon entropy rate is exactly

    h=−3 ln s=6 ln φ≈2.88727095036 nats/step,

because the endpoint log-v corrections cancel in the stationary average. The resulting information dimension is `h/ln(1/s)=3`. Thus both the **Hausdorff and canonical probability-information dimensions equal three**, with no fitted continuous branch weights once the two-type substitution law is chosen.

Keeping distinct edge record states yields a coherent isometric dilation `V|i> = sum_(e:i→j) sqrt(p_e)|e>⊗|j>`, satisfying `V†V=I_2`. This is a normalized quantum information history on *the two type labels*, not a proof it coincides with the full 8D hidden `A5` dynamics or supplies an ontology deeper than Hilbert-space quantum mechanics.

## 7. What would count as actual emergence of spacetime and sub-Planck physics

This establishes two mathematical bridges: (a) an explicit hidden information metric whose spectral projectors recover the icosahedral spatial graph and a 3D geometry; (b) a well-defined multitype golden recursive fractal with exactly dimension-three Hausdorff and information measures in higher-dimensional ambient space. It does **not** establish an ordinary 3D manifold, a smooth coframe, a physical signature (3,1), light cones, Einstein dynamics, a measured crossover, or particles below Planck.

The precise unselected physical ingredient is a **single law which requires the six-axis substitution and picks an observable time/causal generator** from the already-existing coherent hidden transfer. Neither its existence nor its uniqueness is guaranteed by the exact static spectral identities. No blanket impossibility is inferred; this is the correct domain of the open physical identification.

## Reproducibility

- `newton_hidden_to_geometry_emergence_2026_10_14.py` tests the exact response classes and reconstructs the full 12-site graph from the preserved 12×36 quadratic contact.
- `newton_graph_directed_dimension_2026_10_14.py` verifies `T^6`, `ρ(M)=φ^6`, dimension closure, unique Perron branch normalization and information-dimension closure.
- The corresponding numerical certificates are JSON files saved with these calculations.

Established mathematical background: Schoenberg Euclidean distance/Gram correspondence; Mauldin–Williams graph-directed Hausdorff dimension theorem (Trans. AMS 309, 1988); and existing Penrose/icosahedral inflation literature. The two-type Fibonacci matrix is elementary and should not be claimed novel on its own.
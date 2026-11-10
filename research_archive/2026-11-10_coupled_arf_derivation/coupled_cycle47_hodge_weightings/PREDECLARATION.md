# Coupled cycle 47 predeclaration — A5-invariant Hodge inner products
# and the residual spread

Date: 2026-11-10 (Europe/London)

Cycle 44 found that combinatorial κ_iso on the frequency-n
refinements appears to approach a finite value, while the
generalised-eigenvalue spread of (Π_T, Δ1_T) stays ≈ 0.26 and
the kernel is not unique Maxwell. This cycle asks whether a
*unique derived* Hodge inner product, or dual-volume weighting,
on that same refined 2-complex removes the spread. The full set
of A5-invariant lumped (diagonal) weightings is predeclared
below. No member of the set will be selected after seeing
spreads, and no historical ARF is used to pick a weighting or a
residue. The `newtons-cathedral` tip remains read-only at
`6bad7b3`. Predeclaration is hashed before any weighted kernel
is computed.

## The family (frozen)

The frequency-n 2-complex, n ∈ {1, 2, 3}, is that of cycle 44.
A5 acts by the 60 rotations of the original Euclidean
icosahedron (coupled cycle 10). That action permutes refined
vertices, edges and faces by its permutation of the 12 original
vertices (barycentric labels are pushed forward). Orbits are the
orbits of this action. They will be counted by the test; the
family is defined for whatever those counts are.

A lumped A5-invariant Hodge metric is a triple of positive
diagonal inner products

    *0 on C⁰,   *1 on C¹,   *2 on C²,

constant on each A5-orbit and with no off-diagonal simplex-basis
entries. The set of all such metrics is the open cone

    (ℝ>0)^{N0+N1+N2},

where Nk is the number of orbits of k-simplices. A general
(non-lumped) A5-invariant inner product, i.e. an arbitrary
positive element of End_A5(C^k), is not a Hodge star of a local
metric and is not introduced.

The coboundaries d0, d1 are the unweighted incidence maps of
cycle 43. The Hodge adjoints and Laplacians are

    δ0 = *0^{-1} d0ᵀ *1,     δ1 = *1^{-1} d1ᵀ *2,
    Δ0 = δ0 d0,              Δ1 = d0 δ0 + δ1 d1.

The Gauss projector is the *1-orthogonal projector onto
ker δ0 = ker(d0ᵀ *1). It depends on the edge weights, and
reduces to the cycle-43 projector when *1 is a global multiple
of the identity. The discrete q² operator is Δ1 restricted to
that coexact space.

Primary coupling (one machine): fermion hopping weights equal
the edge weights *1. The magnetic Laplacian on an edge e = (i,j)
of weight w_e uses hop w_e and diagonal degree Σ w. T = η is
frozen and is not retuned with the weights. A control in which
only the gauge Hodge metric is reweighted, and the fermions stay
combinatorial, is computed at the named points below and is not
used to select a residue.

Overall scale: a global multiple of *1 together with frozen T
is a change of hopping units. For orbit scans, the geometric
mean of the edge-orbit weights is fixed to 1. Named geometric
points use the embedding of the original 12 vertices, rescaled
so that the circumradius is 1 (the archive’s overall scale is
free; this is a convention, not a fit).

## Named points and scans (frozen; all will be reported)

Named points, each at n = 1, 2, 3, primary (coupled) and
gauge-only control:

1. G_comb. All weights 1 (cycle 44).
2. G_sph_dec. Lumped DEC Hodge star of the spherical mesh:
   refined vertices are barycentric combinations of the radius-1
   original points, then radially projected onto the circum-
   sphere. *0_v = barycentric dual area at v, *1_e = ℓ*_e/ℓ_e,
   *2_f = 1/A_f, with lengths and areas taken intrinsically in
   the spherical (or, equivalently for these small faces, the
   chordal) metric of the embedded triangles; dual vertices are
   barycentres, ℓ* is the distance between the two adjacent
   dual vertices, every edge having two faces on the closed
   surface.
3. G_euc_dec. The same DEC star, but with refined vertices left
   at barycentric combinations in ℝ³ (no spherical projection)
   and with lengths and areas from the Euclidean embedding.
4. G_sph_len / G_euc_len. *1_e = ℓ_e (spherical / Euclidean),
   *0 = *2 = 1.
5. G_sph_inv / G_euc_inv. *1_e = 1/ℓ_e, *0 = *2 = 1.
6. G_sph_circ / G_euc_circ. Circumcentric dual in place of the
   barycentric dual in (2) and (3). If any triangle is non-acute,
   or any dual length is non-positive, that named point is
   undefined at that n and is not replaced by another dual.

Axis scans (primary coupling only), frozen ratios
r ∈ {1/4, 1/2, 1, 2, 4}: starting from G_comb, one orbit’s
weight is set to r and the others stay 1, then edge weights
are renormalised to geometric mean 1. Every vertex, edge and
face orbit is scanned. No search for a spread-minimising point
in the product cone is performed, and no interpolating fit is
used to invent a preferred ratio.

## Spread test and what would count as a derived resolution

The same thresholds as cycles 43–44:

    unique iff spread < 0.05,
    Maxwell-like iff resid_M < 0.10,
    positive iff min κ_i > 0 and λ_min(Π_T) > 10^{-10}.

A unique derived weighting *resolves* the spread if and only if
one of the following holds, without reference to the numerical
spreads of the other points:

(A) The cone collapses to a single ray by A5 and the
    combinatorics of the 2-complex alone (only one orbit of each
    degree, or all orbits forced to a single ratio), and that
    ray is unique Maxwell; or
(B) A single named geometric construction is the unique Hodge
    star forced by the derived Euclidean 12-point set, with no
    remaining choice among spherical/Euclidean or
    barycentric/circumcentric or length/DEC conventions, and
    that unique construction is unique Maxwell at n = 3.

If uniqueness of Maxwell holds only on a proper subset of the
named points or of the axis scans, that subset is reported and
is not selected as “the” weighting. If the cone has more than
one ray (N0+N1+N2 > 1 after overall scale), (A) fails. If more
than one of the named geometric conventions is well-defined and
they are not forced to coincide, (B) fails.

No identification with K_γ, and no comparison with R_α or with
1/137.036, is performed in this cycle. Diagnostic κ_iso and
spreads are not rewritten as an electromagnetic coupling. The
coframe conversion is cycle 48.

## Hypotheses

H1. At n = 1 there is a single orbit of vertices, of edges and
    of faces, so the lumped A5 family is three positive scales.
    On coexact forms a global rescaling of *1 and *2 only
    rescales Δ1_T; gauge-only spread is therefore invariant.
    Coupled hops of a single edge orbit are a free kinetic
    scale versus frozen T = η; that scale is not chosen to
    minimise spread.
H2. At n ≥ 2 there is more than one orbit in at least one
    degree, so no unique A5-invariant lumped weighting exists
    from combinatorics alone. The named geometric constructions
    are inequivalent conventions, not a unique derived star.
H3. Whether spread < 0.05 holds at every named point, at none,
    or only on a proper subset, is computed, not assumed.
H4. Unless (A) or (B) holds, this cycle does not resolve the
    cycle-44 spread by a unique derived inner product, and it
    does not supply K_γ.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
orbit census and the computation. No ARF target is used to
select a weighting.

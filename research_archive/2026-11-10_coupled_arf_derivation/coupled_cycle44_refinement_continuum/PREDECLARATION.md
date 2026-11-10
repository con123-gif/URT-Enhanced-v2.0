# Coupled cycle 44 predeclaration — derived refinement and continuum test

Date: 2026-11-10 (Europe/London)

Cycle 35 and cycle 40 left the continuum q → 0 residue K_γ unobtained
on a fixed finite shell. This cycle asks whether a *derived*
refinement sequence of that shell makes K_γ, or failing that the
combinatorial isotropic coefficient κ_iso, converge to a finite
limit.

No historical ARF is inserted. The `newtons-cathedral` tip remains
read-only at `6bad7b3`. Predeclaration is hashed before any refined
kernel is computed. This cycle does not stipulate a clock sequence
C_N for N = 12, 48, 96: those cardinalities are not forced by the
SL(2, F_5) orbit (only N = 24 is a named cardinality, already used
in cycle 40) and are not used here. Internal structure of the
archived G_{13} graph is left to the alt line.

## Derived refinement sequence (frozen)

The icosahedral 2-complex is a derived object (coupled cycle 01,
alt cycle 02). Its unique A5-equivariant simplicial refinements
are the frequency-n subdivisions of each of the 20 triangular
faces into n² triangles, with vertices at barycentric coordinates
(i, j, k)/n, i+j+k = n, i, j, k ≥ 0, and with opposite-edge
identifications inherited from the original complex. Vertex,
edge and face counts are the geodesic-polyhedron numbers

    V = 10 n² + 2,    E = 30 n²,    F = 20 n²,    χ = 2.

The sequence run is n ∈ {1, 2, 3}. (n = 1 reproduces the cycle-32
shell: 12 vertices, 30 edges, 19 coexact modes.) This sequence
uses only the already-derived 2-complex and its A5 action. No new
solid, no new coupling, and no new hopping weight are introduced:
every refined edge has combinatorial weight 1, the same convention
as n = 1. The overall scale remains free, as in alt cycle 02; it
is not retuned with n.

The archive lists a coframe / continuum conversion as a missing
input (cycle 39). The present sequence therefore tests the
*combinatorial* kernels, not a metrically converted continuum
action. A finite limit of κ_iso, if one appears, is not identified
with the archive’s K_γ unless a unique derived conversion is also
in hand (it is not).

Fermions occupy all V vertices of the refined 1-skeleton. The
action is the same subcritical Ω as cycle 32: magnetic graph
Laplacian K[A] with unit Peierls hops, r = 0, background A = 0,
temperature T = η in combinatorial hopping units. T is not
rescaled with n (no factor of λ_min(Δ0) or of 1/n is introduced
after the fact). The ratio T / λ_min(Δ0) is reported as a
structural diagnostic of this frozen convention.

The Hodge Gauss projector of cycle 43 is used on each refined
complex: P_T is the unique coexact projector (dim = F − 1 =
20 n² − 1), Δ1_T = P_T Δ1 P_T, and b₁ remains 0.

## Observables at each n (frozen)

    κ_iso(n)  = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F²
    spread(n) = (max κ_i − min κ_i) / max(|mean κ_i|, 10^{-12})
    resid_M(n), Maxwell-like iff resid_M < 0.10
    unique(n) iff spread < 0.05
    positive(n) iff min κ_i > 0 and λ_min(Π_T) > 10^{-10}
    m², w_m, w_β, w_κ from the cycle-29 Frobenius projection
    λ_min(Δ0), λ_min(Δ1_T), T / λ_min(Δ0)

Π_T is computed from the exact trace-derivative formula for
Ω = Σ_k f(λ_k(K[A])), cross-checked at n = 1 against the
finite-difference kernel of cycle 32 / cycle 43 (relative 10^{-4}
or absolute 10^{-8} on κ_iso and spread).

## What would count as a finite limit, and as K_γ

With only three frequencies, a continuum limit cannot be proved
in the sense of a Cauchy sequence of all n. The following
predeclared readings will be used, and no other interpolation
will be selected after seeing numbers:

1. The combinatorial sequence κ_iso(n) is said to *appear to
   approach a finite nonzero limit* if κ_iso is of the same sign
   for all three n, is bounded away from 0 in the sense
   |κ_iso(3)| > ½ |κ_iso(1)|, and the last step is smaller than
   the first:
       |κ_iso(3) − κ_iso(2)| < |κ_iso(2) − κ_iso(1)|.
   Otherwise it is reported as running, changing sign, or not
   Cauchy on this window, as the numbers decide.
2. The kernel is said to *approach unique Maxwell* if unique(n)
   and Maxwell-like(n) and positive(n) all hold at n = 3, and
   spread(n) is nonincreasing. If spread does not fall, the
   non-uniqueness of cycle 32 is not being removed by refinement.
3. K_γ is identified with lim κ_iso only if (a) a finite nonzero
   limit appears in the sense of (1), (b) unique Maxwell holds
   at n = 3 in the sense of (2), and (c) a unique derived
   coframe conversion from combinatorial units to the archive’s
   continuum Γ_EM = (K_γ/4) ∫ F² is in hand. Clause (c) is already
   known to fail (cycles 35, 39). It is not assumed to start
   holding merely because a combinatorial sequence looks stable.

The conversion α_eff^{-1} = 4π K_γ, and any comparison to R_α or
to 1/137.036, is applied only if (1)–(3) all succeed. If they do
not, diagnostic κ_iso(n) and spreads are reported and are not
rewritten as an electromagnetic coupling. Look-elsewhere is not
run in that case.

Scaling is reported by the three raw values and by the two
successive differences. No fitted power law (a + b/n^p) is used
to invent a limit that the three raw values do not already
support under (1).

## Hypotheses

H1. The frequency-n A5-equivariant subdivision is a derived
    refinement sequence of the coupled-line 2-complex; the dyadic
    clock list N = 12, 24, 48, 96 is not, and is not run.
H2. Combinatorial κ_iso(n) and spread(n) are computed at n = 1, 2, 3
    with frozen T = η and unit hops; whether a finite nonzero
    limit appears, and whether uniqueness improves, is not assumed.
H3. Because the coframe conversion remains a missing input,
    this cycle does not by itself supply the archive’s K_γ,
    even if a combinatorial limit appears. No α_eff comparison
    is performed unless clause (3c) is unexpectedly satisfied
    by a unique derived conversion found in the construction
    itself (it is not expected).

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
construction and the computation. No ARF target is used to select
a sequence, a scale, or a residue.

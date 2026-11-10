# Coupled cycle 40 predeclaration — clock-direction momentum and the q² residue

Date: 2026-11-10 (Europe/London)

Cycle 35 named the blocker: α(0)^{-1} = 4π K_γ needs a transverse q²
residue, and the finite icosahedral shell has no q → 0 mode
(λ_min(Δ1_T) = 3−√5 > 0; 16 October finite-shell warning). This cycle
builds a periodic direction from inside the system and asks whether
that direction supplies a unique, positive K_γ.

No historical ARF is inserted into the action. The original
`newtons-cathedral` tip remains read-only at `6bad7b3`. Predeclaration
is hashed before any product-graph Hessian is computed.

## Construction (frozen before compute)

Spatial complex: the icosahedral 1-skeleton (12 vertices, 30 edges),
as in cycles 25–36.

Clock: the Cartesian product with the cycle graph C_N, N = 24. The
integer 24 is the cardinality of the SL(2,F_5) orbit
X = F_5² \ {0} (WHY_24, theorem 1). This uses the unique (up to
reflection) circulant nearest-neighbour graph on 24 vertices. It is
*not* claimed that the G-action contains a 24-cycle: 2I ≅ SL(2,5)
has element orders in {1,2,3,4,5,6} only. The cyclic order is the
standard discrete circle on that cardinality.

Clock edges have combinatorial weight 1, equal to a spatial edge of
the unit product complex G □ C_24. Fermions occupy the product
graph at the already-derived temperature T = η, with r = 0 (no
pairing) and spatial background A = 0 (the cycle-32/36 subcritical
vacuum). Clock-component connections A_τ remain zero; the probe is
a spatial connection modulated along the clock.

This treats the 24-clock as an *extra* periodic direction. It does
not identify the clock with KMS imaginary time (that would reuse η
twice: once as circumference and once as the Gibbs temperature).
The archive lists a "physical clock" as a missing input (WHY_24
completion test; EXACT_A4_WILSON; NATIVE_PEIERLS). The product
above is therefore an attack on the missing-q blocker that uses
only derived ingredients plus the circulant order on 24 vertices;
it is not a claim that the archive has already selected this clock
as Euclidean time.

KMS cross-check, recorded but not used to select a residue: the
hidden-sector KMS period is 1/η. A different product with
circumference 1/η, lattice spacing 1/(N η) and no extra thermal
trace would be a thermal Euclidean construction. That construction
is not run as the primary kernel, because it would change the
hopping normalisation after seeing numbers if used as an alternative
conversion. The primary q² is the combinatorial
    s²(q) := 4 sin²(q/2),   q = 2π n / N,   n = 0,1,2,...,N/2.

Product spatial magnetic Laplacian (nV = 12, dim = 12 N):
degree((v,t)) = deg_ico(v) + 2; spatial hops at slice t carry the
Peierls phase of A(t); clock hops equal −1. Spinor lift: the same
product with cycle-26 `magnetic_spin` on each slice (dim = 24 N)
and clock hops equal to −I_2 on the spinor fibre.

Fourier probe, Parseval-normalised:
    A_e(t) = â_e · σ_n(t)
    σ_0(t) = 1/√N
    σ_{N/2}(t) = (−1)^t / √N
    σ_n(t) = √(2/N) cos(q_n t)   (0 < n < N/2)

â lives in the 19-dimensional spatial cycle space (right singular
vectors of the incidence matrix; rank 11, nT = 19). Π_T(q) is the
19×19 transverse Hessian of the one-loop fermion free energy
Ω = fermion_omega(spec(K_product[A(·)]), spec(K_product[0]), T=η)
with respect to â, at â = 0. Finite-difference step ε = 0.02, the
same step used in cycle 32.

Modes computed: n ∈ {0, 1, 2, 3, 6, 12} (spatial and spinor).

## What would count as the archive's K_γ

The archive (TWO_INDEPENDENT constructive gate) defines
    K_EM = lim_{q→0} (1/((d−1) q²)) Tr[P_T(q) Π(q)]
in the electron Q = −1 chart, then α^{-1} = 4π K_EM.

On this product, P_T is the 19-dimensional spatial coexact projector
and q is clock momentum. Two objects will be distinguished *before*
numbers are seen:

(A) The literal archive combination
    K_lit(q) := Tr[Π_T(q)] / (nT · s²(q))
    The q → 0 limit exists and is finite only if Π_T(0) = 0.
    If Π_T(0) ≠ 0 the limit diverges and is not K_EM.

(B) The dynamical residue
    R(q) := (Π_T(q) − Π_T(0)) / s²(q)     (q ≠ 0)
    K_i(q) := eigenvalues of R(q)
    K_iso(q) := Tr[Π_T(q) − Π_T(0)] / (nT · s²(q))
    spread(q) := (max K_i − min K_i) / max(|mean K_i|, 10^{-12})
    unique(q) iff spread(q) < 0.05
    positive(q) iff min K_i(q) > 0
    identity-like iff ||R(q) − K_iso(q) I||_F / ||R(q)||_F < 0.10

R(q) being a multiple of the identity would mean the added electric-like
F_{iτ} stiffness is independent of which spatial transverse mode is
excited. That is a structural statement. It is not, by itself, the
archive's K_EM, which is a residue of Π, not of Π − Π(0), and which
averages over the d−1 polarizations of a single continuum plane wave
(not over 19 distinct spatial harmonics of the shell).

## Conversion and comparison protocol (frozen)

The conversion α_eff^{-1} = 4π K_γ, with
    R_α = 3/(64 φ) + 1/(79 φ²)
    α_PDG := 1/137.036     (final check only)
    look-elsewhere ensemble S, E as in cycle 25,
    match iff |α_eff − target| / target < 10^{-4},
is applied if and only if *all* of the following hold, for both
the spatial product and (separately) the spinor product:

1. The literal limit (A) exists and is finite, i.e. Π_T(0) = 0
   up to the roundoff threshold 10^{-10} already used for kernels.
2. The dynamical residue (B) at the smallest positive q (n = 1) is
   unique and positive in the sense above.
3. K_iso(n=1) and K_iso(n=2) agree to relative 5% (a discrete
   stand-in for a q → 0 limit of R).

Then K_γ is identified with K_iso(n=1) in combinatorial product
units (s² = 4 sin²(q/2)), and α_eff^{-1} = 4π K_γ.

If any of (1)–(3) fails, no unique archive K_γ is defined by this
construction and no comparison with R_α or 1/137.036 is performed.
The value and spread of R(q) are still reported as structural data
and are not rewritten as an electromagnetic coupling.

Inequivalent normalisations that will NOT be selected among after
seeing numbers: replacing s² by q²; rescaling by the KMS factor
(N η)^{-2}; inserting 16/3, 1/16, 1/24, or a coframe Jacobian;
taking κ_REM, κ_iso of Π_T(0), or λ_min(Π_T(0)) as K_γ.

## Hypotheses

H1. Π_T(0) is not zero: the product does not create a spatially
    harmonic coexact mode, so the literal archive limit (A) diverges.
H2. The dynamical residue R(q) may or may not be unique and positive;
    this is computed, not assumed.
H3. Because of H1 (and, independently, if H2 fails uniqueness), the
    construction does not supply the archive's K_γ, and no α_eff
    comparison is performed.

H1 and the comparison gate are classified after the Hessian is
computed. No ARF target is used to select a rule.

# Coupled cycle 40 — clock-direction momentum and the q² residue

Classification: **PROVED** (H1, H2 as computed, H3). Advances a
physical ARF? No. No α_eff comparison was performed.

The product of the icosahedral 1-skeleton with the 24-clock does
not supply the archive’s K_γ. The literal q → 0 limit diverges
because Π_T(0) ≠ 0, and the dynamical residue
R(q) = (Π_T(q) − Π_T(0)) / [4 sin²(q/2)] is neither unique across
transverse modes nor positive.

## Construction checks

Cartesian product G □ C_24, unit clock hops, fermions at T = η,
r = 0, spatial background A = 0. Spectrum at vanishing connection
matches the tensor sum λ_ico + 4 sin²(π k/24) (spatial residual
below 10^{-10}, spinor below 10^{-9}). Spatial Tr K = 2016 = 84×24.
Modes n ∈ {0,1,2,3,6,12}; Hessian step ε = 0.02.

The cyclic order on 24 vertices is the circulant nearest-neighbour
graph on the cardinality of the SL(2,F_5) orbit; 2I has no element
of order 24. The clock is treated as an extra periodic direction,
not as KMS imaginary time (the archive lists a physical clock as
missing; cycle 39).

## H1. The literal archive limit diverges

Π_T(0) is positive definite and of the same order as the single-copy
subcritical kernel, not zero.

| sector | Tr Π_T(0) | λ_min | λ_max | Maxwell resid | κ_iso | spread |
|---|---:|---:|---:|---:|---:|---:|
| spatial | 0.142505 | 0.00161103 | 0.0127562 | 0.02484 | 0.00240411 | 0.141 |
| spinor | 0.274510 | 0.00328915 | 0.0243873 | 0.01668 | 0.00461092 | 0.078 |

Both kernels are Maxwell-like (residual < 0.10) with a near-zero
London piece (spatial m² = −1.76×10^{-4}, w_m = 0.021; spinor
m² = −9.08×10^{-5}, w_m = 0.006) and are not unique. The product
does not create a spatially harmonic coexact mode
(λ_min(Δ1_T) = 3−√5 still). Consequently

    K_lit(q) := Tr[Π_T(q)] / (19 · 4 sin²(q/2))

grows as 1/s² when q → 0 (spatial: 0.110 at n=1, 0.0280 at n=2,
0.0128 at n=3, 0.00374 at n=6, 0.00186 at n=12). The archive
formula K_EM = lim_{q→0} Tr[P_T Π] / ((d−1) q²) does not exist
as a finite number on this product.

## H2. The dynamical residue is not unique and not positive

R(q) = (Π_T(q) − Π_T(0)) / [4 sin²(q/2)] at the smallest positive
mode n = 1:

| sector | K_iso | K_min | K_max | spread | unique? | positive? | ||R−K I||_F/||R||_F |
|---|---:|---:|---:|---:|:---:|:---:|---:|
| spatial | −1.349×10^{-5} | −4.702×10^{-5} | +1.302×10^{-5} | 4.451 | no | no | 0.849 |
| spinor | −2.845×10^{-5} | −9.074×10^{-5} | +2.188×10^{-5} | 3.958 | no | no | 0.819 |

The mean K_iso is stable between n=1 and n=2 to better than 5%
(spatial −1.349×10^{-5} vs −1.340×10^{-5}; spinor −2.845×10^{-5}
vs −2.829×10^{-5}), so a q → 0 limit of the *average* residue
exists and is a small negative number. That average is not a
multiple of the identity: the 19 eigenvalues of R spread over
both signs with relative width ~4. Adding clock momentum slightly
*softens* the spatial B² stiffness on average; it does not add a
mode-independent electric F_{iτ} term proportional to q² I.

The same pattern holds at n = 3, 6, 12 (K_iso remains ~ −1.3×10^{-5}
spatial and ~ −2.7×10^{-5} spinor; spreads stay between 4 and 4.8).

## H3. No comparison

The predeclared conversion gate required (i) a finite literal
limit, (ii) a unique positive R at n=1, and (iii) 5% agreement of
K_iso between n=1 and n=2. Condition (iii) holds; (i) and (ii)
fail, independently, in both sectors. No K_γ was identified, and
α_eff was not compared to R_α or to 1/137.036. Look-elsewhere
was not run. No rewriting of κ_iso(0), of K_iso(R), or of K_lit
was promoted as an electromagnetic coupling.

Why, exactly: a periodic direction built from the 24-point
cardinality supplies a genuine discrete momentum, but every
spatially coexact probe still sees the shell’s Δ1_T > 0. The
archive’s residue is a coefficient of Π(q) ~ K q² for a
continuum plane wave, which this finite product does not
possess. The object that does exist, (Π(q)−Π(0))/s², is a small,
mode-dependent, not-positive correction and is not the archive’s
K_EM.

## Integrity

Predeclaration sha256:
`f74f1ddc8386a63b365ce39163b1e05c74a60622694901943af20dd018bfefce`.
No ARF target was used to select a rule.

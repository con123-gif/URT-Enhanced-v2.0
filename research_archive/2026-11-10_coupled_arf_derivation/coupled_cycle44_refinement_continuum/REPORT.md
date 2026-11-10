# Coupled cycle 44 — derived refinement and continuum test

Classification: **PROVED** (H1, H2 as computed, H3). A three-point
combinatorial sequence of κ_iso appears to approach a finite
nonzero value under the predeclared Cauchy test, but the kernel
does not approach unique Maxwell (spread stays ≈ 0.26) and the
coframe conversion remains missing, so the archive’s K_γ is not
identified. α_eff was not compared. Advances a physical ARF? No.

The `newtons-cathedral` tip remains read-only at `6bad7b3`. No
historical ARF was used to select a sequence, a scale, or a
residue. The dyadic clock list N = 12, 24, 48, 96 was not run.

## H1. The derived sequence

The unique A5-equivariant simplicial refinements of the
icosahedral 2-complex are the frequency-n face subdivisions,
with V = 10n²+2, E = 30n², F = 20n². The sequence n ∈ {1, 2, 3}
reproduces those counts exactly (12/30/19, 42/120/79, 92/270/179
vertices, edges and coexact modes). Each refined complex remains
a sphere, (b₀, b₁, b₂) = (1, 0, 1), and the cycle-43 Hodge Gauss
projector is used throughout. Edge weights stay at the
combinatorial unit of n = 1; T = η is not rescaled with n.

## H2. Combinatorial kernels at n = 1, 2, 3

The n = 1 kernel reproduces cycle 43’s exact formula
(κ_iso = 0.002061944, spread = 0.305737, resid_M = 0.060157).

| n | κ_iso | spread | resid_M | m² | λ_min(Δ0) | T/λ_min(Δ0) |
|---|---:|---:|---:|---:|---:|---:|
| 1 | 0.002061944 | 0.305737 | 0.060157 | −1.713×10^{-4} | 2.763932 | 2.169 |
| 2 | 0.002246307 | 0.263370 | 0.042077 | −1.044×10^{-4} | 0.968880 | 6.188 |
| 3 | 0.002276376 | 0.266068 | 0.040216 | −9.683×10^{-5} | 0.459501 | 13.048 |

All three kernels are positive definite and Maxwell-like
(resid_M < 0.10). None is unique (spreads 0.26–0.31 ≱ 0.05).
The London weight shrinks slightly (w_m = 0.0233, 0.0133, 0.0122)
and w_β remains O(0.1) (0.210, 0.148, 0.137). Successive
differences of κ_iso are 1.844×10^{-4} then 3.007×10^{-5}.

Under the predeclared three-point test, a finite nonzero
combinatorial limit *appears*: the three values have the same
sign, |κ_iso(3)| > ½|κ_iso(1)|, and the last step is smaller
than the first. No power-law fit was used to invent a limit
beyond that test. Spread falls from n = 1 to n = 2 and then
rises slightly (0.26337 → 0.26607), so it is not nonincreasing
and the kernel does not “approach unique Maxwell” at n = 3.
In this frozen convention T/λ_min(Δ0) grows like the shrinking
IR gap, as recorded in the predeclaration; T was not retuned.

## H3. No K_γ, no comparison

Identifying a limit of κ_iso with the archive’s K_γ required
(a) the finite-limit test, (b) unique Maxwell at n = 3, and
(c) a unique derived coframe conversion from combinatorial
units to Γ_EM = (K_γ/4)∫F². Clause (a) holds on this window;
(b) fails; (c) fails independently (cycles 35, 39: the coframe
conversion is a missing input and is not supplied by subdivision
with unit combinatorial weights). No K_γ is identified, and
α_eff was not compared to R_α or to 1/137.036. Look-elsewhere
was not run. The three κ_iso values, and the apparent
stabilisation near 0.00228, are structural diagnostics and are
not rewritten as an electromagnetic coupling.

Why, exactly: a derived spatial refinement exists and makes the
isotropic coefficient look stable, but it does not collapse the
30% (then 26%) spread of generalised Maxwell eigenvalues, and
it does not create the missing continuum conversion. Refinement
of the finite shell, in combinatorial units, does not by itself
produce the archive’s unique positive q² residue.

## Integrity

Predeclaration sha256:
`6143b4e05af532f1b71ff63617e01534fe33b4a34b7197edb5626e1267ce62d2`.
No ARF target was used to select a sequence, a scale, or a residue.

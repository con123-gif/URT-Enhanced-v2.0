# Coupled cycle 18 — Nambu path-integral measure

Classification: **PROVED** for the path-integral identity and the sign.
Cycle 13’s +y²π as the measure of the coupled pairing theory is **FALSIFIED**
(it is the particle-hole / Dirac channel, misapplied).
Alt25’s BCS attraction **is** the measure of the coupled pairing theory:
**PROVED**. 4_5 condensation at a natural O(1) Yukawa y_even = 1 is **PROVED**.
Advances a physical ARF? No.

## Path integral
Cycle 10 placed the residual Yukawas in the charge-+2 pairing sector of
Sym²(ℂ¹²). A symmetric Grassmann bilinear ψ^T Δ ψ vanishes identically,
so an extra antisymmetric flavor ε_{ab} (standard s-wave BCS) is required
for those CG maps to couple. The quadratic action in the Nambu spinor
Ψ = (ψ_1, ψ̄_2) is exactly Ψ̄ H_BdG Ψ with
    H_BdG = [[K, Δ], [Δ, −K]]
and no extra ½. The Euclidean Matsubara integral then gives
    Ω_f(T) = −T Σ_α log(2 cosh(E_α/2T)) + T Σ_i log(2 cosh(|ξ_i|/2T)),
    Ω_f(0) = −½ Σ_α E_α + ½ Σ_i |ξ_i|,
which is alt25’s measure. Particle-hole symmetry of H_BdG holds to
1.4×10^{-14}. Because Ω_f is minus a convex increasing function of the
positive BdG energies, the quadratic term is attractive:
    Ω_f = −χ (y r)² + O(r⁴),   χ > 0.

The cycle-13 / alt16 formula Z_f = det(K + Δ) is the charge-0
particle-hole channel. Its quadratic piece is the positive stiffness
+½ y² π ρ². Charge counting: ψ̄ M ψ has charge 0; ψ^T Δ ψ has charge +2.

## Numbers (primary kinetic: H13 Hodge)
Geometric H13 (centre + 12 vertices, 12 spokes + 30 surface edges) has
the alt02 spectrum 0, 13, 6±√5, 7. Pairing lives on the 30 surface
edges (cycle-11 frames); the centre row of Δ vanishes.

| channel | χ(T=η) | y_c(η) | χ(T=0) | y_c(0) | Dirac π_D | condenses at y=1? |
|---|---|---|---|---|---|---|
| even / 4_5 | 0.037511 | 0.006011 | 0.077380 | 0.004185 | +0.05267 | yes |
| odd / 4_3 | 0.038433 | 2.405 | 0.091462 | 1.559 | +0.07373 | no |

A 1D scan of V_hist + Ω_f along the even nuclear-norm maximiser
(Σσ = 4.64038, the same direction as alt25) finds a deep minimum at
r_* ∼ 8×10^5, Ω_* ∼ −9.9×10^5. The odd scan stays at the origin
(y_c,odd > 1).

Controls: the 12-vertex Laplacian of alt25 gives y_c,even(η) = 0.005940
and χ_even = 0.038416, reproducing alt25’s 0.005940 and 0.03842.
Cycle 13’s Hodge-weighted Λ (eigenvalues 1, 6±√5, 7) gives χ_even = 0.037511,
essentially the H13 value (the 3, 3', 5 sectors coincide; the unpaired
singlet does not contribute to χ). In every kinetic the pairing
quadratic is attractive and the Dirac quadratic stiffens. The two must
not be added: they are alternative evaluations of different operators
on the same residual frames.

## Integrity
Predeclaration sha256:
`5a18553d288be1e6526d5f37da133e0c58fb90c9396032c91068ac4b866f3b37`.
Test-script hashes are in HASHES.txt (the det(H_BdG) identity was
replaced by particle-hole symmetry after det() proved inaccurate on
the near-singular kernel). No ARF target was used.

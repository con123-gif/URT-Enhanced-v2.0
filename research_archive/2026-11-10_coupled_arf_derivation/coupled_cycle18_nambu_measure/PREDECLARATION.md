# Coupled cycle 18 predeclaration — Nambu path-integral measure

Decisive question: cycle 10 placed the residual Yukawas in the charge-+2
pairing sector of Sym²(ℂ¹²). Cycle 13 / alt16 integrated H13 fermions
with the Dirac/particle-hole formula det(K + Y·h), obtaining a positive
stiffness +½ y² π ρ². Alt25 integrated a Nambu / BdG pairing grand
potential and obtained attraction −χ y² r², hence 4_5 condensation.
This cycle derives the Grassmann path integral of the actual coupled
action in Nambu basis and decides which sign the theory dictates.

## Coupled action (no new couplings)
Euclidean action, used as named input:

    S = V_hist(h) + Σ_{a=1,2} ψ̄_a K ψ_a
      + ½ ε_{ab} [ ψ_a^T Δ(h) ψ_b + ψ̄_a^T Δ(h) ψ̄_b ]

- Flavor ε_{ab} is required for a symmetric (Sym²) pairing matrix to
  be a nonzero Grassmann bilinear; this is the standard s-wave BCS
  structure compatible with cycle 10’s CG maps in Sym²(ℂ¹²).
- Δ(h) = y_o Σ_k (h3)_k F_odd^{(k)} + y_e Σ_k (h5)_k F_even^{(k)},
  with F the orthonormal adjacent 4×30 frames of cycle 11, assembled
  on the 30 icosahedral edges in the same order as alt25 / cycle 11.
- V_hist = c3 ||h3||² + Δ_geom² c5 ||h5||², golden-mode constants
  of cycle 03 (equivalently ½ H3 ||h3||² + ½ H5 ||h5||²).
- K is the fermion kinetic. Primary choice, matching the brief’s
  “H13 Hodge kinetic”: the unit-weight graph Laplacian on geometric
  H13 (centre + 12 vertices, 12 spokes + 30 surface edges), whose
  eigenvalues must be 0, 13, 6−√5, 6+√5, 7 (alt02). Pairing has no
  spoke components, so Δ is block-diagonal: the cycle-11 12×12 block
  on the surface vertices and zero on the centre.
  Controls, predeclared: (i) the 12-vertex icosahedral Laplacian of
  alt25 (eigenvalues 0, 5−√5, 6, 5+√5); (ii) cycle 13’s Hodge-weighted
  12-vertex operator Λ with eigenvalues 1, 6−√5, 6+√5, 7.

A single-species Grassmann bilinear ψ^T Δ ψ vanishes identically when
Δ is symmetric, so the Dirac substitution K ↦ K + Δ is not a rewriting
of the pairing term. Charge counting: ψ̄ M ψ is charge 0 (particle-hole);
ψ^T Δ ψ is charge +2 (pairing). Cycle 10’s residual couplings are the
latter.

## Path-integral identities (derived before numerics)
Nambu spinor Ψ = (ψ_1, ψ̄_2). The quadratic action is exactly
    S_f = Ψ̄ H_BdG Ψ,    H_BdG = [[K, Δ], [Δ, −K]]
(for real symmetric Δ and K = K^T), with no extra 1/2. The Euclidean
Matsubara integral at temperature T with antiperiodic frequencies is
    log Z_f = Σ_n log det(iω_n + H_BdG)
            = Σ_{E_α > 0} log(2 cosh(E_α / 2T)) + (E-independent const).
Hence the relative fermion grand potential (subtracting Δ = 0) is
    Ω_f(T) = −T Σ_α log(2 cosh(E_α / 2T)) + T Σ_i log(2 cosh(|ξ_i| / 2T)),
    Ω_f(0) = −½ Σ_α E_α + ½ Σ_i |ξ_i|,
where ξ_i are the eigenvalues of K and E_α the positive eigenvalues of
H_BdG. This is alt25’s measure. Because each E_α is nondecreasing in
the pairing scale at quadratic order (and Ω_f is minus a convex
increasing function of the E_α), the quadratic term is attractive:
    Ω_f = −χ (y r)² + O(r⁴),    χ > 0.

The cycle-13 / alt16 formula instead uses Z_f = det(K + Δ) (or the
gapped reduction of that determinant). Its quadratic piece is
    −log det(K + s T) = const + ½ s² ||K^{-1/2} T K^{-1/2}||_F² + …
when Tr(K^{-1} T) = 0, i.e. the positive stiffness +½ y² π ρ².
That is the particle-hole channel, not the pairing term written above.

Will compute, in this order:

1. Verify K_H13 has the alt02 spectrum, and |det H_BdG| = (∏_{E>0} E)².
2. Finite-difference χ = −Ω_f(s)/s² and the Dirac curvature
   π_D = 2[−log det_red(K+sT) + log det_red(K)]/s² (gapped, as in
   alt25’s Dirac control) on both residual frames, at T = η and T = 0,
   for each of the three kinetics. Record signs.
3. Critical Yukawas y_c = √(c / χ) in each channel (undefined if χ ≤ 0).
   Condensation of 4_5 at a natural O(1) Yukawa y_even = 1 is declared
   if and only if χ_even > 0 and y_c,even < 1 for the primary kinetic,
   confirmed by a 1D minimisation of V_hist + Ω_f along a pairing ray.
4. Compare χ and cycle 13’s archived π_o ≈ 0.036866, π_e ≈ 0.026333
   (they are not required to match: different traces). No ARF is used.

Classification: PROVED for the path-integral identity and the sign.
“Cycle 13’s +y²π is the measure of the coupled pairing theory” will be
marked FALSIFIED if Ω_f is attractive. “Alt25’s BCS attraction is the
measure of the coupled pairing theory” will be marked PROVED or
FALSIFIED accordingly. 4_5 condensation (A5 → A4 at y_even = 1) will
be marked PROVED or FALSIFIED from step 3 on the primary kinetic.

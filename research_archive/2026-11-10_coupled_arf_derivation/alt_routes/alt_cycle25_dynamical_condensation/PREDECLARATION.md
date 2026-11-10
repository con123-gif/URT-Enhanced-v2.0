# Predeclaration — alt_cycle25: dynamical condensation from the soft 4_5

Date: 2026-11-10 (Europe/London)
Route: (25) Self-consistent BCS / Hartree–Fock gap equation for H13 fermion pairing condensates that source the hidden 4_3 / 4_5 through the residual 2-plane couplings, at the KMS temperature η where that identification is used. Find the critical coupling in each channel; ask whether the 4_5 channel condenses for any O(1) Yukawa (so the vacuum is not the origin). If it does, find the stabiliser of the condensate direction among vectors in the 4, and whether condensation makes r = y_even / y_odd dynamically irrelevant or fixed.

## Predeclared setup
S1. Residual couplings are the orthonormal adjacent pairing-current frames of coupled cycle 11 (odd → 4_3, even → 4_5), reconstructed on the same icosahedral edges as that cycle. A hidden vector h and a Yukawa y produce the real symmetric pairing matrix
    Δ(h, y) = y Σ_{k=1}^4 h_k F[k]
supported on the 30 edges (F the odd or even 4 × 30 frame). Natural O(1) normalisation is the orthonormal frame itself; y = 1 is an O(1) Yukawa.
S2. Single-particle kinetic operator K is the icosahedral graph Laplacian (the Hodge vertex kinetic). Chemical potential μ = 0 (no extra parameter).
S3. Pairing (Nambu / BdG) Hamiltonian H = [[K, Δ], [Δ, −K]]. Positive energies E_α are the positive eigenvalues of H. The relative grand potential at temperature T is
    Ω = V_hist(h) − T Σ_α log(2 cosh(E_α / 2T)) + T Σ_i log(2 cosh(|ξ_i| / 2T))
    V_hist = c3 ||h3||² + Δ² c5 ||h5||²
    with the golden-mode c3, c5 of coupled cycle 03. Primary temperature: T = η = −ln Δ_hidden (KMS identification, fermions in equilibrium with the hidden KMS temperature). Control: T → 0.
S4. Control with the opposite, cycle-16 Dirac-like measure Γ = V_hist − log det(K + Δ) is reported only as a sign check; it is not the pairing theory asked for here.
S5. Linearised critical coupling: write Ω = (c − χ y²) r² + O(r⁴) along a ray h = r ĥ. Then y_c = sqrt(c / χ) when χ > 0, and there is no finite critical coupling if χ ≤ 0. The two channels use c = c3 (odd / 4_3) and c = Δ² c5 (even / 4_5).
S6. If a channel condenses at y = 1, the condensate direction is the minimiser of Ω over ĥ ∈ S³ (equivalently, in the large-vev regime expected from the tiny 4_5 stiffness, the maximiser of the nuclear norm Σ σ_α(Δ(ĥ, 1))). Its stabiliser in A5 is computed from the 60 icosahedral rotations acting on the pairing matrix: g · Δ = P_g Δ P_g^T, keeping those g with g · Δ = Δ (vector) or ±Δ (ray).

## Hypotheses
H1. The T = 0 theory is infrared-singular because K has a zero mode (linear attraction −½|Δ_0|), so y_c(T=0) = 0 in both channels. At T = η the susceptibility is finite.
H2. At T = η, y_c for the even / 4_5 channel is much smaller than 1 (because c = Δ² c5 ≈ 6.2×10^{-6}), so any O(1) y_even produces a nonzero even condensate and the vacuum is not the origin. The odd / 4_3 channel has c = c3 ≈ 0.222 and an O(1) critical Yukawa.
H3. The cycle-16 Dirac-like sign does not condense (positive curvature), so condensation, if it occurs, is a property of the pairing (Nambu) measure, not of every fermion determinant.
H4. If the even channel condenses, the direction of the condensate (and hence its A5-stabiliser) is selected by minimising Ω, not put in by hand. Possible stabilisers of a nonzero vector in a 4 of A5 are among {A4, C3, C2×C2, C2, 1}, never C5 or D5.
H5. Condensation does not fix the coupling ratio r = y_even / y_odd to a unique number. If y_c,even ≪ 1 ≤ y_c,odd, then for generic O(1) pairs (y_odd, y_even) only the even channel condenses, which makes r qualitatively irrelevant except in a small neighbourhood of the pure-odd axis.

## Integrity
No ARF target is inserted. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.

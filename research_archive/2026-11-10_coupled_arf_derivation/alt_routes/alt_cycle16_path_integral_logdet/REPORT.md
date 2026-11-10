# alt_cycle16 — path-integral status of log det(K+Σ)

Classification: PROVED on H1–H6.
The pure 3⊗5 → 4_3 ray remains CONDITIONAL on an extra variational principle; it is not promoted to PROVED.
Advances a physical ARF? No.

## Result
The Euclidean fermion integral at fixed hidden field h is det(K + Y·h), so the fermions contribute −Tr log(K + Y·h) to the effective action for h. That is a functional of the hidden field, not of the Yukawa direction at fixed ||Y|| = 1 after the substitution Σ = Y Cov(h) Y†.

Integrating a centered Gaussian hidden sector exactly produces a four-fermion theory, not det(K+Σ). A two-channel analog with the Hodge eigenvalues λ3 = 5−√5 and λ3' = 5+√5 shows that ⟨det(K+M)⟩ and det(K+Σ) differ by 26–45% on the unit circle. The quadratic expansions have opposite leading Yukawa dependence:
- ⟨log det(K+M)⟩ = log det K − ½ ⟨Tr((K^{-1}M)²)⟩ + O(Y⁴)
- log det(K+Σ) = log det K + Tr(K^{-1} Σ) + O(Y⁴)

so the cycle-14 proxy prefers the lighter spatial 3 (pure α), while the actual quadratic average prefers the heavier 3' (pure β). This is the same comparison as Jensen’s inequality for the concave function log det.

Yukawa couplings are parameters in the archived model, not integration variables, so the path integral supplies no stationary principle over the Yukawa sphere.

The genuine one-loop correction obtained by integrating fermions first adds +½ h Π h to the hidden Hessian, with
Π/α² = 8/(λ3 λ5) ≈ 0.482, Π/β² ≈ 0.184, Π/γ² = 0.400, Π/δ² = 1/9.
Π is positive on every inversion-allowed channel and largest for α; it stiffens hidden modes and does not pick a unique ray.

Therefore the pure 3⊗5 → 4_3 maximiser of log det(K+Σ) is not the one-loop effective action of the coupled path integral. The ray stays CONDITIONAL, not PROVED.

## Verification
`/workspace/arf_research/alt_cycle16_path_integral_logdet/test_path_integral_logdet.py` and `results.json`.
Predeclaration sha256: `28f9483b82bd7faa8d873539939e8203a7c8e28365842d321392c73f6a5b7ac3`.

## Next obstruction
A source-to-charged-matter coupling that would both select a unique ray and break the A5 mass degeneracies is still missing.

# alt_cycle14 — maxent / KMS weighting on the residual Yukawa space

Classification: H1, H2, H4 PROVED; H3 CONDITIONAL.
Advances a physical ARF? No.

## Result
The maximum-entropy distribution on the unit sphere S³ ⊂ R⁴, given only the scale constraint, is Haar measure. That is not a Dirac mass and does not pick a point or a ray. After the optional Galois-even constraint α = β one still has an S², again not a point.

KMS stationarity does not apply to Yukawa couplings as parameters: they are not dynamical fields with a Hamiltonian in the archived model.

If one extra principle is added — maximising the one-loop fermion quantity log det(K + Σ) on the unit sphere, with K the Hodge kinetic on the 12 vertices and Σ built from isometric Clebsch–Gordan partial traces — the functional is not Galois-symmetric, because λ3 = 5−√5 < λ3' = 5+√5. Multi-start projected-gradient maximisation finds a unique maximiser up to signs: the pure 3⊗5 → 4_3 ray (α, β, γ, δ) = (±1, 0, 0, 0), with value 19.7528. The pure 3'⊗5 ray gives 19.0792; the pure Sym²(5) ray is the smallest of the four axis values at 18.5718. This extra principle is not derived from KMS or from maximum entropy, so it is not treated as selecting a physical ray.

## Verification
`/workspace/arf_research/alt_cycle14_maxent_kms/test_maxent_kms.py` and `results.json`.
Predeclaration sha256: `f2d365b994810aa88af5b630eceb64f50048590f14bcd1ee60a1d075674f0f82`.

## Next obstruction
Without an extra variational principle the residual 4-space remains uniformly unstructured. The log-det maximiser, if adopted, would pick the spatial-3 odd channel, but that step is not derived.

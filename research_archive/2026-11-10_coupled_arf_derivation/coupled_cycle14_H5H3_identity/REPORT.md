# Coupled cycle 14 — analytic origin of √(H5/H3) ≈ Δ

Classification: **PROVED** for the closed form.
The identity √(H5/H3) = Δ is **FALSIFIED**.
Advances a physical ARF? No.

## Closed form
From the archived single-mode V_hist,
c3 = (16+ρ)/(4(18+ρ)), c5 = (14+ρ)/(4(16+ρ)),
H3 = 2 c3, H5 = 2 Δ² c5, with
ρ = (π/e)² λ_18 and
λ_18 = 4 sin²(π(9−4√5)/4) = 4 sin²(π·18/24 − 2π/φ²)
the charge-2 gold-angle eigenvalue of the 24-clock at Fourier mode 18
(equal to cycle 03’s lam_gold and to E2 / (π/e)²).

Therefore, exactly,
H5/H3 = Δ² (14+ρ)(18+ρ) / (16+ρ)²,
√(H5/H3) = Δ √((14+ρ)(18+ρ)) / (16+ρ).

Numerically ρ ≈ 0.01022872513786 = E2,
√(H5/H3) ≈ 0.00246969151833050,
Δ ≈ 0.00248918984042040,
structural factor ≈ 0.992166799906830,
relative difference (Δ − √(H5/H3))/Δ ≈ 0.783320%.

These match cycle 03 (c3, c5, H3, H5) and cycle 12’s canonical-hidden
recipe to relative error < 10^{-12}.

## Limits
- ρ → 0: √(H5/H3) = Δ √(63/64) = (3√7 / 8) Δ, relative difference
  1 − 3√7/8 ≈ 0.784326%. The physical ρ shifts this by only 0.001%.
- ρ → ∞: c3 = c5 = 1/4 and √(H5/H3) = Δ exactly (clock dominates
  the Hbits eigenvalues 18 and 16).

The identification √(H5/H3) = Δ is therefore an identity only in the
infinite-clock limit, not at the archived ρ. The 0.78% is the
structural factor 1 − √((14+ρ)(18+ρ))/(16+ρ) forced by Hbits 16 vs 18,
not an independent coincidence and not the result of scanning
Cathedral targets.

## Integrity
Predeclaration sha256:
`81950b0b2a53fadf62710a76504dbeef5f7df81953593ce1394b77869dc14cd4`.
Test script first hash used a Laplacian whose global minimum was not
the archived mode-18 gap; it was replaced by the closed form
4 sin²(π(9−4√5)/4). Both hashes are in HASHES.txt. No ARF target was used.

# Coupled cycle 17 — clock periodicity / modular invariance of Z

Classification: **PROVED** for the spectra and the r-independence
statements. The claim that modular invariance or clock-periodicity
selects r is **FALSIFIED**. Surviving dimension: **2**.
Advances a physical ARF? No.

## Histories (M1)
Hbits, the Laplacian of the Hamming-distance-2 graph on (ℤ₂)⁶, has
the closed integer spectrum
    0 (×2), 10 (×12), 16 (×30), 18 (×20),
verified by diagonalising the 64×64 matrix. The kernel multiplicity 2
matches cycle 08. Hence
    Z_hist(β) = 2 + 12 e^{−10β} + 30 e^{−16β} + 20 e^{−18β}.
Integer eigenvalues imply T-invariance: Z_hist(τ+1) = Z_hist(τ).

Functional S-invariance fails: Z_hist(0) = 64 while Z_hist(∞) = 2.
At an auxiliary point β = 1/2, Z_hist ≈ 2.09339 versus
Z_hist(4π²/β) = 2, relative difference 0.0446. At the physical
τ_* = i η/(2π) with η ≈ 5.995798 both η and 4π²/η lie well above
the gap 10, so Z and Z∘S both saturate to dim(ker) = 2; that
near-equality is spectral saturation, not modular invariance.
Free-boson automorphy factors y^{32} and y^{12} miss by relative
3.47 and 0.75. Z_hist does not depend on r.

## Clock (M2)
The gold-phased 24-clock with
    λ_k = 4 sin²(π k/24 − 2π/φ²)
has λ_18 matching cycle 14 / E2 (relative error 7×10^{-13}).
The 24 energies (π/e)² λ_k are not integers, so Z_clock is not
T-invariant. At τ_*, Z_clock(η) ≈ 2.41174 versus
Z_clock(4π²/η) ≈ 2.29972 (relative 0.0464); automorphy factors
miss by 0.67 and 3.27. Z_clock does not depend on r.

The shared integer 24 (clock length versus the weight of the
Ramanujan discriminant η(τ)^{24}) does not identify Z_clock with
that modular form: Z_clock is a sum of 24 gold-phased exponentials.

## Coupled hidden Gaussian (M4)
The only derived r-dependent partition function at the V_hist
origin (cycle 13) is the hidden Gaussian
    Z_hid(β; y_o, y_e) = [2π/(β μ3)]² [2π/(β μ5)]²,
    μ3 = H3 + y_o² π_o,   μ5 = H5 + y_e² π_e.
Clock-periodicity fails: Z_hid(β+24)/Z_hid(β) = (β/(β+24))⁴
≈ 0.001596 at β = η, independently of (y_o, y_e). The modular
ratio Z_hid(β)/Z_hid(1/β) = β^{−8} ≈ 5.987×10^{-7} at β = η is
likewise independent of (μ3, μ5) and hence of r. S-invariance
would require η = 1; the physical η ≈ 5.995798 is not 1.

## Conclusion
Free Z_hist and Z_clock cannot constrain r because they do not
depend on it. The coupled Z_hid depends on the Yukawas, but every
modular or periodicity ratio of that Gaussian cancels the masses.
No condition on r appears.

## Integrity
Predeclaration sha256:
`be421004b294022f6215b4011785966b9248d7a14ccb27fb61dd4a8bcc1974c6`.
Test-script hashes are in HASHES.txt (the physical-point S test was
split into saturation versus functional S-invariance after the first
assert, and a JSON serialisation helper was added). No ARF target
was used.

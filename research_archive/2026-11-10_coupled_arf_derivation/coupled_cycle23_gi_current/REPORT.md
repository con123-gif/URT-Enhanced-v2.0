# Coupled cycle 23 — gauge-invariant current response

Classification: **PROVED** for gauge invariance and the longitudinal
Ward identity. Meissner positivity of the archived one-loop action
remains **FALSIFIED** (alt29 H3 stands). Advances a physical ARF? No.

## Setup
On the 12-vertex icosahedral graph, A enters the magnetic hopping
Laplacian and the real even condensate is dressed by local pairing
phases, Δ_ij[θ] = |Δ_ij| exp(i(θ_i+θ_j)). The 12 phases θ_i
parametrise the gauge orbit of the real vacuum; they are not a new
Higgs field. The one-loop action Ω(A, θ) is the cycle-18 Nambu
potential on (K[A], Δ[θ]), which already contains the full
Nambu–Gor’kov series. There is still no tree-level |D_A Δ|².
Convention matching the magnetic Laplacian: A_e → A_e + λ_i − λ_j
together with θ → θ − λ.

## Control: alt29 truncation
Hessian of Ω(A, θ=0) on the 19-dimensional cycle space, r = 20:

- T = η: eigenvalues in [−0.0015488, +0.0066481], 4 negative and 15
  positive (alt29: [−0.00155, +0.00665], 4 / 15).
- T = 0: all 19 negative, in [−0.09526, −0.07076]
  (alt29: [−0.0953, −0.0708]).

The sign structure, and the numbers themselves, reproduce alt29.

## Gauge invariance and longitudinal WI
For random vertex functions λ, Ω(A + dλ, θ − λ) = Ω(A, θ) to
∼ 10^{-14}. The directional Hessian of Ω along every gauge orbit
(A, θ) = (dλ, −λ) is at most 4×10^{-8} in absolute value; the
directional gradient vanishes to numerical zero. The longitudinal
Ward identity therefore holds exactly once the Goldstone orbit is
included.

Frozen real Δ, by contrast, gives a strictly negative curvature along
exact A = dλ (mean −0.021 at r = 20, T = η and −0.43 at T = 0). That
is the gauge artefact in alt29’s scans of unit exact A. Compensating
with θ = −λ cancels it to ∼ 10^{-9}.

## Transverse / superfluid kernel
In unitary gauge (θ = 0) the physical photons are the cycle modes.
That Hessian is not positive definite at any of the four tested
points (r, T) ∈ {20, 100} × {η, 0}:

- r = 100, T = η: all 19 negative, in [−0.00901, −0.00033]
- r = 100, T = 0: all 19 negative, in [−0.0924, −0.0837],
  approaching the unpaired-mode value −1/12 ≈ −0.0833 (alt34).

A Meissner mass is not established.

## Reconciliation with alt29
Alt29 was not missing Nambu–Gor’kov vertices (they sit inside the BdG
determinant) and was not missing the Goldstone in the *transverse*
sector (the Goldstone is a gauge orbit, eaten in unitary gauge). What
it was missing is Goldstone compensation along *exact* A = dλ, which
is why those scans lowered Ω. The non-positive transverse kernel is
the genuine one-loop result of the archived action (no tree |DΔ|²;
the unpaired charged fermion survives at A = 0). R_α was not compared.

## Integrity
Predeclaration sha256:
`5cf25d9603ef57dd580f80eb8e4f2dd398ce8d5fde6f6a3ed18dd85d82bfdefb`.
Test-script hashes (original and the dλ-sign convention patch) are in
HASHES.txt. No ARF target was used.

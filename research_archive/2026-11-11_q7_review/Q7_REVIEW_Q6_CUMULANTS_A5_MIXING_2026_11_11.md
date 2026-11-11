# Q7 — independent review of Theorems 1–2 of URT_Q6_CUMULANTS_AND_A5_MIXING_THEOREMS_2026_11_10 (2026-11-11)

Reviewer: Claude. Verdict: **AGREE** (both theorems). Status: REVIEW, executed. Certificate:
`Q7_REVIEW_Q6_CUMULANTS_A5_MIXING_2026_11_11.py` (check `research.q7_review_q6_cumulants`), exact Fraction arithmetic; imports
none of the reviewed scripts; executed in Claude's sandbox (1.3 s).

## Theorem 1 (finite inverse and all-order cumulant recursion) — AGREE
Re-derivation. Q is doubly stochastic (column sums 1), so PQ = QP = P; six steps replace all six bits, so Q⁶ = P. On centred
vectors Q is therefore nilpotent of index ≤ 6 and (I − Q)⁻¹ = I + Q + … + Q⁵ exactly. Differentiating T(t)r(t) = λ(t)r(t)
n times, separating the k = 0 term and applying P (with P r₀ = 1, P rₙ = 0) gives λₙ = P Aₙ; the remainder is centred, so the
finite inverse gives the unique centred rₙ. Kₙ follows from λ = exp(log λ) by the standard recurrence. The tilted operator
diag(e^{tg})Q is the Feynman–Kac transfer of S_n = Σ g(X_i), so Kₙ are the cumulant rates.
Executed: Q⁶ = P and the finite inverse exactly; the recursion, implemented from the statement, equals κ_j(S_{n+1}) − κ_j(S_n)
from exact finite-time generating functions for four non-i.i.d. six-bit sources (Rademacher bit: K₂ = 1, K₄ = −2, K₆ = 16;
popcount: K₂ = 9, K₄ = −162; a product source and an asymmetric three-bit source).

## Theorem 2 (A5 vacuum mixing is not ergodic) — AGREE
Re-derivation. For zero-mean components the mixture has m₄ = E_I[κ₄,ᵢ + 3σᵢ⁴] and m₂ = E_I[σᵢ²], so
κ₄,mix = mean κ₄,ᵢ + 3 Var_I(σᵢ²). Finite memory makes σᵢ² = n vᵢ + cᵢ exactly for large n and κ₄,ᵢ = O(n), so the n²
coefficient is 3 Var₅(v). With v = (67/48, 33/16, 25/24, 33/16, 5/6): μ = 71/48, Var₅ = 1493/5760, 3 Var₅ = 1493/1920 (exact).
The annealed limit is max_i fᵢ(t), whose second derivative at 0 is max vᵢ = 33/16 from both sides.
Executed: on five exactly computable chain sources, the mixture's own κ₄ (from averaged moments) equals the law exactly, and
its second difference in n equals 6 Var_I(K₂) exactly.

## Scope
Theorem 2's coefficient is conditional on the archived K₂ values, which were independently reconstructed by GPT (Q8,
`research.independent_native_five_k2`, CI). Theorem 3 of the same note (native K₄ values) was not part of Q7; its A5 mean is
CI-verified under Q1.

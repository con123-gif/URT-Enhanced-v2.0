# Q59 — No unique symplectic/Berry term or conservative time generator from the primitive data

Date: 2026-11-12 (Claude, scheduled `[derive]` session). Gate A.
Status: **OBSTRUCTION (scoped non-uniqueness) + THEOREM (structure of the primitive data) — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
Certificate: `Q59_TIME_GENERATOR_CERTIFICATE.py` (check `research.q59_time_generator`).

## Question (Queue Q59) and how it was read

Starting from the primitive URT complex recurrence and the original positive H64/24 transfer, does a
*unique* antisymmetric symplectic/Berry term and a conservative real-time generator follow **without an
added time postulate**? The three primitive objects were taken literally:

- **R** the recurrence `z ↦ λz`, `λ = (π/e)·e^{2πi/φ²}` (`docs/CLOSURE_LEDGER.md`, primitive URT definition);
- **H** the original 64-history two-successor transfer `Q = Q2/2`, `Q2[h,2h] = Q2[h,2h+1] = 1` (mod 64), `Q⁶ = J/64`;
- **C** the 24-clock direction of the original 7 Nov all-five 190/64/24 action
  (`2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py`, imported unmodified):
  hidden kernels `18 + r²L₂₄^(2)` on 4₃ and `16 + r²L₂₄^(2)` on 4₅, geometry kernel `D190² + C_bridge + r²L₂₄^(1)` on all five solids.

## Prior-work ledger (continuity preflight)

| Existing result | Source | Scope / status | Executed? |
|---|---|---|---|
| Cotangent symplectic/metaplectic lift of the URT spiral, distinct from positive T | `docs/RELATIVE_HISTORY_GAUGE_FIRST_PRINCIPLES_2026-10-27.md`; `docs/CLOSURE_LEDGER.md` (reciprocal squeeze symplectic) | construction, conditional | 2026-10 runs |
| Canonical complex Hamiltonian law `ż = −i∇S` declared a *model premise* | `docs/NATIVE_URT_FULL_COUPLED_HAMILTONIAN_DYNAMICS_2026_11_08.md` | conservative completion, not derived | yes (2026-11-08) |
| Static action cannot choose Hamiltonian vs gradient flow; conditional two-mode clock | Q57, `2026-11-12_q57_geometric_clock/` | THEOREM + CONDITIONAL | CI |
| Modular flow of ρ* = unitary Hbits flow with t = ηs on the hidden 8; Q⁶U_h = 0 so Q is not modular time on the hidden carrier | `2026-11-12_native_emergent_time/RESULT.md` | THEOREM / OBSTRUCTION on hidden carrier | GPT local |
| Any constant skew clock circulation leaves exp(−ηS) stationary | original 7 Nov script, lines 462–475 | identity | yes |
| Chebyshev closed form of the 24-clock log-determinant with `arccosh(1+E/2r²)` | original 7 Nov script, `logdet_chebyshev` | identity | yes |

New here: R1–R3 (conformal factor, ℤ-branch family, indefiniteness of every lifted generator), H1–H4 on the
whole 64-dimensional space (partial isometry, no logarithm, the 2³² permutation lifts with distinct cycle types,
rank 42 of Q − Qᵀ), and C1–C4 (the clock's antisymmetric part is pure holonomy; the transfer-matrix reading of the
archived Chebyshev identity; inequivalence of two conservative readings on the native hidden carrier).

## Statements

### R. The primitive recurrence

Let `M = (π/e)R(θ)` be `z ↦ λz` on `C = R²`, `θ = 2π/φ²`.

- **R1.** `MᵀΩM = det(M)·Ω` for every antisymmetric Ω on R², and `det M = (π/e)² ≠ 1` (π ≠ e). So **no
  symplectic (area) form on the base is preserved**; the recurrence is conformally symplectic with factor (π/e)².
- **R2.** Since `θ/π = 2/φ²` is irrational, the eigenvalues `(π/e)e^{±iθ}` are non-real and distinct, and the real
  logarithms of M are exactly `L_n = ln(π/e)·I + (θ + 2πn)·J`, `n ∈ Z`. Every `L_n` has trace `2 ln(π/e) ≠ 0`, so
  **no interpolating flow `e^{tL_n}` is area-preserving**, and the flow itself is fixed only up to the branch `n`
  (the half-step maps of n = 0 and n = 1 differ). The principal branch n = 0 is the minimal-norm logarithm
  (|θ| < π). Choosing it, or the "unwrapped" coordinate of the ledger, is a declaration and is not derived.
- **R3.** The cotangent lift `M̂ = M ⊕ M^{−T}` on T*R² is symplectic (the archived lift), with Hamiltonian generators
  `H_n(x,p) = p·L_n x = ln(π/e)(x·p) + (θ+2πn)(x₁p₂ − x₂p₁)`. Every `H_n` is **indefinite** (`H_n(x,±x) = ±ln(π/e)|x|²`),
  and `H_n − H_0 = 2πn·(x₁p₂ − x₂p₁)`. So the symplectic implementation exists, but it needs the extra momentum
  variable, its conserved generator is not unique, and none of them is a positive energy.

### H. The 64-history transfer

- **H1.** `QQᵀQ = Q` exactly: Q is a **partial isometry** of rank 32 (singular values 1³², 0³²), with
  `QᵀQ = ½(I + Y)` (Y: k ↔ k⊕1) and `QQᵀ = ½(I + X)` (X: h ↔ h+32). The departing top bit is exactly what Q forgets.
- **H2.** `QJ = JQ = J` and `Q⁶ = J/64`, so spec Q = {1, 0⁶³}, and Q and every power Q^k are singular. As
  `det e^L = e^{tr L} ≠ 0`, **no matrix L (real or complex, conservative or dissipative) satisfies e^L = Q^k**: the
  history transfer has no continuous-time generator of any kind. (This extends the hidden-carrier statement
  Q⁶U_h = 0 of `2026-11-12_native_emergent_time/` to all 64 histories and all generators.)
- **H3.** The conservative (unitary) dilations of Q, the unitaries equal to Q on its initial space, form a
  **U(32)-torsor** (O(32) over R). Among them, the support-respecting permutations `σ(h) ∈ {2h, 2h+1}` are exactly
  `σ_β(h) = 2h + (h₅ ⊕ β(h mod 32))` for `β ∈ {0,1}³²`: **2³² lifts**, each with `Q = ½(P_σβ + P_σβ̄)`. They are
  inequivalent reversible histories: β = 0 is the 6-bit cyclic rotation (14 necklace cycles, order 6); β ≡ 1 gives
  cycle type 4·12⁵; β = parity gives 1·7⁹; β = low bit gives 1·63. Choosing one is choosing the bit that enters
  from the past: a time postulate.
- **H4.** The canonical antisymmetric part `Q − Qᵀ` (for the stationary uniform measure) has exact rank **42 < 64**,
  so it is **not a symplectic form** on R⁶⁴, and Q does not preserve it (`Qᵀ(Q−Qᵀ)Q ≠ Q−Qᵀ`).

### C. The positive 24-clock transfer of the original action (quadratic part)

- **C1.** For both clock charges q = 1, 2 the antisymmetric part of `L₂₄^(q)(θ)` is `i sin(qθ)(Sᵀ − S)` (purely
  imaginary), and the non-periodic gauge `α_j = jqθ` moves it entirely onto the closing link as the holonomy
  `e^{i·24qθ}`. The **only gauge-invariant antisymmetric datum of the clock direction is this holonomy**; it is unique.
- **C2 (reading A: 24 = Euclidean time).** For every spatial mass M ≥ 0 of the original operators (18, 16 hidden; the
  Hodge–bridge eigenvalues, including the two zero modes, for the five solids) and every cycle length n ≥ 3,
  `det(M + r²L_n^(q)) = 2r^{2n}(cosh nω − cos nqθ)`, `cosh ω = 1 + M/2r²` (checked n = 3…12, 24). Equivalently
  `1/det = c^n·Tr_Fock[e^{−nω(N₊+N₋)} e^{inqθ(N₊−N₋)}]`: the transfer is two oscillators of frequency ω per complex mode,
  and the Wilson twist is a **conserved-charge phase (imaginary chemical potential) that commutes with the
  transfer Hamiltonian** `H_A = Σ ω(N₊+N₋)`. On the hidden carrier `ω₃ = arccosh(1 + 9e²/π²) = 2.735090250017087`
  and `ω₅ = arccosh(1 + 8e²/π²) = 2.632376432256414`. The unique Berry-type term therefore generates no dynamics.
- **C3 (reading B: 24 = space, `ż = −i∇S`).** The Hamiltonian-postulate law of 2026-11-08 / Q57 has hidden
  single-particle frequencies `18 + r²ℓ_k`, `16 + r²ℓ_k`, `ℓ_k = 2 − 2cos(2θ − 2πk/24)`: **48 distinct values**.
- **C4 (non-uniqueness).** A change of time unit and energy origin preserves the number of distinct single-particle
  frequencies. Reading A has 2 on the hidden 4₃⊕4₅, reading B has 48. So the **same positive native action carries
  at least two conservative real-time generators that no choice of units relates**, and the action does not say
  which one is time. (Both are conservative; reading A additionally uses reflection positivity / Wick rotation,
  reading B uses the complex structure ω = Im⟨·,·⟩.)

### Conclusion

Under every reading checked, no unique conservative real-time generator follows from R, H and C. The one canonical
antisymmetric object is the clock holonomy e^{i·24qθ}, and it acts as a commuting charge phase. The primitive
recurrence is conformally symplectic but not symplectic, with ℤ-many interpolating flows. The history transfer has no generator
at all, and its conservative extensions form a U(32)-torsor, or 2³² inequivalent permutation lifts. Each route to
real time adds one choice: a logarithm branch, a past bit, a Wick rotation, or a complex structure. That choice is
the time postulate. The five solids and the hidden 4+4 source enter through the native kernels in C (all five via
the Hodge–bridge spectrum, both hidden quartets via 18 and 16). Their nonlinear source terms vanish at the quadratic
order used here, as the 2026-11-08 linearisation theorem states.

## Scope and what remains open

- C is certified for the **quadratic part** (the complete Hessian at zero field). A transfer-matrix Hamiltonian for
  the full nonlinear action plausibly exists, since the on-site entropy term is real, but it was not constructed.
- This does not show that the time postulate cannot be derived. It shows that R, H and the positive clock transfer
  do not fix one. A further native principle could still select one branch, lift or reading. Candidates that would
  escape these hypotheses: the inverse-limit (bi-infinite) history completion, which makes the shift invertible
  without a finite-window choice; a reflection-positivity requirement that also covers the 64-history direction; or
  a Lorentzian signature argument.
- Executed in Claude's cloud sandbox. Parts R and H are self-contained. Part C imported a scratch copy of the original
  7 Nov script with only its 90-digit mpmath assertion disabled, because mpmath is absent in the sandbox. CI runs
  the unmodified original.

## RESUME HERE

Next precise question (Q61 [derive]): does the inverse-limit completion of the URT history, the natural extension
of F(x) = 2x + φ⁻² mod 1 on {0,1}^Z restricted to the original 6-bit window with its A5 dictionary, select one of the
2³² permutation lifts σ_β (or a canonical U(32) dilation) without extra data? If not, which A5 × ⟨I,R,S⟩-invariant
subset of lifts remains?

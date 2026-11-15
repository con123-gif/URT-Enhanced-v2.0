# Q104: the joint action does not force a history transport along clock steps; three native transports, three laws (ACTIVE PROBLEM A, attempt A3)

Date: 2026-11-15 (Claude, scheduled session). Gate A.
Status: **THEOREM + OBSTRUCTION (non-uniqueness). CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**
- Part 1 is a general proof, with float64 checks on the full 24×64 kernel.
- Part 2 is exact integer arithmetic on all 8 orbit-1 classes.
- Part 3 gives closed forms, checked in float64 against direct 64×64 inverses at all 24 native modes on all 8 classes.
- Part 4 is float64 on D₀.

Gate A stays open. No ARF is derived.

Certificate: `Q104_CLOCK_TRANSPORT.py` (check `research.q104_clock_transport`). Executed in Claude's cloud sandbox: exit 0, 808 checks, about 35 s wall. About half of that re-runs the Q82 certificate for the quartet projectors.

## Task
Q92 derived the history law K(ψ) under a stated reading: one clock step carries one URT step, written y_{t+1} − e^{2iθ}Q y_t. Q104 asks whether the joint 190/64/24 action **forces** such a transport y_{t+1} − e^{2iθ}T y_t with a native T, given three requirements:
- clock-gauge covariance, including the large gauge D²;
- the Q56 vacuum;
- 24-periodicity.

If the transport is forced, derive it. If it is not, give the exact non-uniqueness and the clock-mode-summed source traces in closed form.

Reading adopted (nobody to ask): "native T" means a map on C⁶⁴ built only from archived history operators. The archive offers four candidates:
- I, the original action, which has no transport;
- Q;
- the selected lift P_σ₁;
- the Q72 bridge B_{D₀}.

The form is A5-averaged through the dictionary, exactly as in Q86/Q91/Q92.

## Part 1 (THEOREM): the three requirements admit every linear T
Replace the clock term ½r²Σ_t‖y_{t+1} − e^{2iθ_t}y_t‖² of the 2026-11-07 action by ½r²Σ_t‖y_{t+1} − e^{2iθ_t}T_t y_t‖², where each T_t is any C-linear map. T_t may depend on t.

**(a) Gauge covariance.** Put y_t → e^{2iα_t}y_t and θ_t → θ_t + α_{t+1} − α_t. Then (Dy)_t → e^{2iα_{t+1}}(Dy)_t, because a linear T_t commutes with a scalar phase. This holds for small and for large gauge transformations alike. The rest of the action is unchanged from the original.

**(b) Q56 vacuum.** The history kernel is K_T = 1₂₄⊗H + r²D_T^*D_T ⪰ 1₂₄⊗H.
- The carrier source b = (h₃ + Δh₅)U_hᵀ lies in range(1⊗H). It sits on the H = 18 eigenspace (P3) and the H = 16 eigenspace (P5).
- The variational formula ⟨b, K⁻¹b⟩ = sup_x (2Re⟨b,x⟩ − ⟨x,Kx⟩) gives ⟨b, K_T⁻¹b⟩ ≤ ⟨b,(1⊗H)⁺b⟩ = ‖h₃‖²/18 + Δ²‖h₅‖²/16.
- So the Schur term V₄ = ¼‖b‖² − ½⟨b,K_T⁻¹b⟩ still satisfies V₄ ≥ (2/9)‖h₃‖² + (7/32)Δ²‖h₅‖². These are exactly Q56's constants.
- K_T does not depend on z, so V₄ stays quartic-homogeneous.
- Q56's radial argument then applies word for word: z = 0 is the unique stationary cochain, and y* = 0 with all currents zero, **for every T**.

**(c) 24-periodicity.** For t-independent T and uniform θ, the Fourier modes y_t = e^{2πimt/24}f decouple exactly. Mode m contributes ‖f − e^{iψ_m}Tf‖², with ψ_m = 2θ − 2πm/24. The fact Q⁶ = J/64 imposes nothing.

Float64 checks were run for T = I, Q, P_σ₁ and B_{D₀}, pulled into code coordinates, not averaged, on the full 1536-dimensional kernel:
- invariance under a small gauge and under the winding-one large gauge;
- K_T − 1⊗H ⪰ 0;
- (1⊗H)⁺ − K_T⁻¹ ⪰ 0 on the carrier;
- exact mode decoupling.

## Part 2 (exact): three native transports give three different laws on V
The averaged form is M̄_T(ψ) = I + G_T − cosψ·O_T − i sinψ·W_T, with G_T = Reynolds[TᵀT], O_T = Reynolds[T+Tᵀ] and W_T = Reynolds[T−Tᵀ]. Each pole below has multiplicity 4. The source weights are (4, 2, 2, 0) in all three laws.

| T | P5 (Walsh 2) | P3 pair (Walsh 3) | dark (Walsh 4) | parity w₆₃ |
|---|---|---|---|---|
| I (original) | 16 + r²(2 − 2cosψ) | 18 + r²(2 − 2cosψ), double | 16 + r²(2 − 2cosψ) | r²(2 − 2cosψ) |
| Q (Q92) | 16 + r²(5 − cosψ)/3 | 18 + r²[3/2 ∓ √(9+16sin²ψ)/20] | 16 + r²(8 + cosψ)/6 | r² |
| P_σ₁ | 16 + r²(2 − cosψ/2) | 18 + r²(2 ∓ sinψ/2) | 16 + r²(2 + cosψ/2) | r²(2 + 2cosψ) |

The P_σ₁ entries rest on these exact facts, each checked on all 8 classes:
- G = I.
- O = ½, 0, −½ on the Walsh-2/3/4 quartets.
- W = E₃WE₃ and W² = −¼E₃.
- tr(G₃W) = 0, so the P3 source splits 2 + 2.
- O w₆₃ = −2w₆₃.

The P_σ₁ P3 splitting is linear in sin ψ. It is odd under ψ → −ψ, so it carries the clock orientation, whereas Q's splitting depends on sin²ψ. The only thing the three laws share is the weights.

**Continuous non-uniqueness.** On the URT segment T_λ = (1−λ)Q + λP_σ₁, λ ∈ [0,1], each T_λ is doubly stochastic on the URT graph and lies in Q68's [0,1]³² family. Exactly, m₆₃ = r²(1 + 2λcosψ + λ²). This was checked at λ = 0, 1/3, 1/2, 2/3, 1. The reason: Q and Qᵀ annihilate w₆₃, while P_σ₁ and P_σ₁ᵀ map it to −w₆₃.

**Holonomy.** Exactly:
- σ₁⁶ = complement (central inversion) and σ₁¹² = id, so P_σ₁²⁴ = I. The history transport round the 24-clock is trivial, and the total holonomy is just e^{48iθ}.
- By contrast (2Q)⁶ = J, so Q²⁴ = J/64 has rank 1.

## Part 3: closed-form clock-mode sums
Define F_N(A, x) = Σ_{m=0}^{N−1} 1/(A − cos(x − 2πm/N)) = N sinh(Nβ)/(sinhβ (cosh Nβ − cos Nx)), with cosh β = A > 1. Let S_s(T) = Σ_{m=0}^{23} tr(G_s K_T(ψ_m)⁻¹), where G_s = U_hP_sU_hᵀ.

| T | S₅ | S₃ |
|---|---|---|
| I | (2/r²) F₂₄(1 + 8/r², 2θ) | (2/r²) F₂₄(1 + 9/r², 2θ) |
| Q | (12/r²) F₂₄(5 + 48/r², 2θ) | (400a/r⁴) F₁₂(50a²/r⁴ − 17/8, 4θ + π), a = 18 + 3r²/2 |
| P_σ₁ | (8/r²) F₂₄(4 + 32/r², 2θ) | (64a′/r⁴) F₁₂(8a′²/r⁴ − 1, 4θ + π), a′ = 18 + 2r² |

Derivation of the P3 sums: a branch pair a ∓ s gives 2·2a/(a² − s²), and s² is affine in cos 2ψ. The 24 modes then cover the 12 values of 2ψ_m twice.

Every sum depends on θ only through cos 48θ = −0.505622355137, the gauge-invariant holonomy. At r = π/e and θ = 2π/φ², in internal units:

| T | S₅ | S₃ |
|---|---|---|
| I | 5.194997131665 | 4.683368101297 |
| Q | 5.268722061562 | 4.800055699296 |
| P_σ₁ | 5.144842464826 | 4.646520752595 |

## Part 4 (float64, D₀): the bridge is a fourth law
B_{D₀} (Q72) gives:
- S₅ = 5.252459545605 and S₃ = 4.778378730188;
- parity Rayleigh quotient 1.2045·r² at m = 0.

These differ from all three laws above. w₆₃ is not an eigenvector of the bridge form, because the 32 values of 2t_x − 1 differ.

## What this establishes, and what it does not
- **Established.**
  - Gauge covariance (including large gauge), the Q56 vacuum and 24-periodicity hold for every linear transport. None of them selects T, so **Q92's reading is not forced by them**.
  - The original action (T = I) is itself admissible.
  - The native candidates Q, P_σ₁ and B_{D₀} give four pairwise different history laws once I is included. The URT segment gives a continuum of laws.
  - The weights (4,2,2,0) are the same in all three exact laws. The poles, the parity mass and the mode sums are not.
- **Not established.**
  - Any principle that selects T.
  - Whether the clock term should contain a history transport at all.
  - Any physical pole, residue or ARF.

Historical ARFs were not used.

## Next concrete attempt (A3, Q127 [derive])
The requirements tested here are blind to T. The next premise to test is the one a gauge theorist would add: the clock covariant difference is a **connection**, so T is unitary, as e^{2iθ} is unitary in U(1).
- On the URT graph, a doubly stochastic orthogonal matrix is a permutation matrix. So within Q68's family [0,1]³² that premise leaves exactly the 2³² reversible lifts. Q and B are excluded; they are strict contractions on w₆₃.
- Q127 must decide whether the premise is native. It must also decide whether trivial history holonomy round the 24-clock (P_σ²⁴ = I, true for σ₁ by Part 2) together with A5 averaging singles out σ₁ among the lifts, without importing Q64/Q72's likelihood selection.
- If σ₁ is singled out, the P_σ₁ row above is the derived law and replaces K_c and the Q92 family.

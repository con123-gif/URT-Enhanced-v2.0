# Q86: no listed original operator fixes the parity-history energy, and H_bits is a native two-step chronology form (ACTIVE PROBLEM A, attempt A3 coefficient)

Date: 2026-11-14 (Claude, scheduled session). Gate A.
Status: **OBSTRUCTION (scoped) + THEOREM.** Everything is exact integer or rational arithmetic, except Part 2c, a
float64 cross-check that executes the original 2026-11-07 function. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION
PENDING. **c is not derived.** Gate A stays open.
Certificate: `Q86_PARITY_HISTORY_ENERGY.py` (check `research.q86_parity_history_energy`). It ran in Claude's cloud
sandbox: exit 0, 227 checks, about 19 s.

## Task and reading
Q85 showed that on orbit 1, gap(K_c) = c for 0 < c ≤ 48 in K_c = H + c·Abar. Here c is the mass of the six-bit
parity history w₆₃(h) = (−1)^{popcount h}, measured in two-flip units. Q86 asks whether some original operator gives
w₆₃ an energy relative to H_bits, which would fix c. The Queue lists four candidates, and each is decided below:

1. the H64 zero-mode pair (the original 190/64/24 action);
2. Q2's action on w₆₃;
3. the conditional 24-clock determinant;
4. Q85's candidate (b): matching a multi-step Q2 generator to H on the hidden quartets.

Notation:
- Q = Q2/2.
- Reynolds = the A5 average over the 60 code rotations, after pulling a kernel back through a signed dictionary
  (Q3/Q64).
- X_i flips bit i, and N = Σᵢ X_i.
- w₀ is the constant history.

## Part 1 (THEOREM): H_bits is a native chronology form
For **every** signed dictionary (checked on all 768 classes, which covers all 46,080):

  **H_bits = 60 · Reynolds[Qᵀ(I − QᵀQ)Q] = 60 · (G₁ − G₂)**, with G_n = Reynolds[(Qⁿ)ᵀQⁿ], and also **G₁ = (I + N/6)/2**.

Proof:
- QᵀQ = (I + X₀)/2 and (Q²)ᵀQ² = (I + X₀)(I + X₁)/4 hold exactly. The second follows because Qⁿ forgets the top n
  bits.
- A dictionary sends history bits 0 and 1 to two distinct code axes.
- A5 acts 2-transitively on the six axes. So the twirl turns X_a into N/6 and X_aX_b into Σ_{i<j}X_iX_j/15
  = (15 − H)/15.
- Subtracting the two twirls gives G₁ − G₂ = H/60. ∎

In integer form, the certificate checks 4T₁ − T₂ = 16·H_bits and T₁ = 20(N + 6I) on every class.

Meaning: ‖Qf‖² − ‖Q²f‖² is the norm that a history function loses in the URT chain's second step. Its A5 average is
exactly H/60. The first-step loss ‖f‖² − ‖Qf‖² averages to d₀ = (6 − N)/12, which is k/6 on Walsh weight k.
On orbit 1 (all 8 classes), the losses d_n = G_n − G_{n+1} are Walsh-diagonal, nonnegative, and sum to I − P₀ (because
Q⁶ = J/64). They also give:
- **w₆₃: d₀ = 1 and d_n = 0 for n ≥ 1.** The parity history loses its whole norm in the first step and nothing after.
- H = 60·d₁ gives w₆₃ zero, because w₆₃ has nothing left to lose in the second step.
- d₂ is the first loss that depends on the dictionary. On Walsh 3 it takes the values 1/10 and 1/5, because A5 is not
  3-transitive on the axes. G₃ differs between the two orbit-1 chronologies.

This identity appears to be new: no archive file states H_bits through Q. It puts H and Abar in one unit system, because
both are Reynolds averages of quadratic forms in Q.

## Part 2 (OBSTRUCTION): the original action gives w₆₃ exactly the constant's energy
Let τ be the orthogonal reflection that exchanges w₀/8 and w₆₃/8 and fixes their orthogonal complement. Exactly:
- τ commutes with H_bits. Both modes span its zero eigenspace, the 0(2) of spec H_bits.
- P8 w₀ = P8 w₆₃ = 0, so τ fixes im U_h pointwise.

In the 2026-11-07 action (`cathedral_constructed_joint_dynamics_2026_11_07.py`, `direct_history_energy`), y enters only
through three terms:
- ½⟨y, H_bits y⟩;
- the clock term ½r²‖y_{t+1} − e^{2iθ_t} y_t‖², which acts on the clock index alone;
- −Re⟨y, b⟩ with b = (h3 + Δh5)U_hᵀ ∈ im U_h.

So S(z, τy) = S(z, y) for every configuration. Part 2c executes the original function, unmodified, at a deterministic
nonuniform configuration and gets equality. A control reflection, which swaps w₆₃ with a Walsh-2 mode, changes the
value, so the test can fail.

**Consequence.** The original action gives w₆₃ energy 0, the same as the constant, and no source coupling.
Abar breaks τ (Abar w₀ = 0, Abar w₆₃ = w₆₃). So the c-term is not part of the original action, and nothing in that
action can set its size. This decides candidate 1: the "H64 zero-mode pair" is a τ-doublet, and the original data treat
its two members identically.

## Part 3 (OBSTRUCTION): Q2 never sees w₆₃, so its chronologies give it their own unit
- Qⁿw₆₃ = 0 = (Qⁿ)ᵀw₆₃ for n = 1…6.
- Every dictionary and every code rotation sends w₆₃ to ±w₆₃.
- Hence every twirled n-step Dirichlet form Abar⁽ⁿ⁾ = Reynolds[(I − Qⁿ)ᵀ(I − Qⁿ)] gives w₆₃ energy **exactly 1**.
  This is checked on all 768 classes for n = 1, and on orbit 1 for n = 1…6.

On orbit 1, every Abar⁽ⁿ⁾ commutes with H. So w₆₃'s chronology energy is just the chronology's normalisation. It carries
no information about H. This decides candidate 2.

## Part 4 (OBSTRUCTION): matching a multi-step generator to H on the quartets fixes no c
On the quartet isotypic V, take an n-step form Abar⁽ⁿ⁾. If it lay in span{P_V, H P_V, Abar⁽¹⁾P_V}, one would get a
native c (as the ratio of the Abar⁽¹⁾ and H coefficients). The data are identical on all 8 orbit-1 classes:

| n | P5 (Walsh 2) | dark (Walsh 4) | Walsh-3 split² | in span{I, H, Abar⁽¹⁾} on V |
|---|---|---|---|---|
| 1 | 4/3 | 3/2 | 9/100 | (reference, Q82) |
| 2 | 11/10 | 14/15 | 0 | no |
| 3 | 19/15 | 1 | 1/20 | no |
| 4 | 14/15 | 1 | 0 | no |
| 5, 6 | 1 | 1 | 0 | equals P_V, so it carries no H and no c |

For n = 2, 3 and 4, span membership would need (b₂ − b₄)²·δ₁² = (a₂ − a₄)²·δ_n². That equation fails exactly.
This decides candidate 4. Separately, the global Part 1 identity matches H to the two-step *Gram defect* with the fixed
coefficient 60. That is the native form of "the two-step generator matches H", and it contains no c.

## Part 5 (OBSTRUCTION, one-line proof): the clock inherits the mass and never selects it
A history mode of energy a has clock determinant 2r⁴⁸[T₂₄(1 + a/2r²) − cos 2Θ] (archived, Q59 C). With x = 1 + a/2r² ≥ 1,
T₂₄(x) = cosh(24 arccosh x) is strictly increasing. So the log-determinant is strictly increasing in a ≥ 0 at every Θ:
- there is no stationary mass;
- a = 0 gives 4r⁴⁸ sin²Θ, the conditional zero-mode determinant, which is singular at Θ ∈ πZ;
- every a > 0 removes that singularity equally well.

So the clock cannot fix c. This decides candidate 3.

## What this establishes, and what it does not
- **Established:**
  - None of the four listed original operators gives w₆₃ a native energy relative to H.
  - The original action is exactly τ-symmetric, so its value is zero.
  - Every Q-chronology gives w₆₃ energy 1 in its own unit.
  - The clock only inherits the mass.
  - Multi-step forms on V are not in the K_c span.
  - H_bits = 60·Reynolds[Qᵀ(I − QᵀQ)Q] for every signed dictionary.
- **Therefore,** c/60 is exactly the relative weight of the one-step Dirichlet form Reynolds[(I − Q)ᵀ(I − Q)] against
  the second-step variance loss Reynolds[Qᵀ(I − QᵀQ)Q]. Both are native forms in Q, and no listed operator weights one
  against the other.
- **Not established:**
  - any value of c, and no claim is made here for 40/3, 48 or 60;
  - that no *other* native operator fixes the weight, for example the Q72 bridge's own variance-loss sequence, or a
    Schur complement of the full action onto histories once the zero-mode measure is derived;
  - any pole or ARF.

## Next
Q91 [derive] asks for one native principle that weights the first-step Dirichlet form against the second-step loss, in
the variance-loss sequence where H/60 = d₁ now sits. Test the selected Q72 uniform-marginal bridge B_{D₀}:
- compute its loss sequence d_n^B = Reynolds[(Bⁿ)ᵀBⁿ − (Bⁿ⁺¹)ᵀBⁿ⁺¹];
- decide whether one quadratic form of B reproduces H + c·Abar on V for a single c (exact on V, float64 elsewhere);
- otherwise state the exact mismatch.

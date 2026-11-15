# Q127: the unitary-connection premise does not single out σ₁

Date: 2026-11-15 (Claude, scheduled `[derive]` session). Gate A, ACTIVE PROBLEM A, attempt A3 after Q104.
Status: **OBSTRUCTION (non-uniqueness) + THEOREM. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Gate A open.
Certificate: `Q127_UNITARY_CONNECTION.py` (check `research.q127_unitary_connection`, native, gating). It uses integer
arithmetic throughout. Executed in Claude's cloud sandbox: exit 0, 185 checks, about 2 s.

## Question and the reading adopted

Q104 showed that the clock covariant difference y_{t+1} − e^{2iθ}T y_t is not fixed by gauge covariance, the Q56
vacuum or 24-periodicity. Q127 tests a stronger premise. Since e^{2iθ} is a U(1) connection along the clock, read
T as a connection on the history bundle as well, so T is unitary. T may move a history only to a URT successor,
which means T[h,k] ≠ 0 only for k ∈ {2h, 2h+1} mod 64. Two further requirements are added:

- **(H)** trivial history holonomy round the 24-clock, T²⁴ = I;
- **(A)** A5 compatibility through the dictionary: the largest subgroup of ρ_D(A5) commuting with T.

Q127 asks whether these single out σ₁ without the Q64/Q72 likelihoods. No one was available to ask, so two
readings of "a transport compatible with the URT kernel Q" are both treated:

- **(S)** T is doubly stochastic, i.e. entrywise ≥ 0;
- **(B)** T is Born-compatible, |T[h,k]|² = Q[h,k].

## Prior-work ledger

| Existing result | Source | Status | Executed |
|---|---|---|---|
| 2³² permutation lifts σ_β; U(32)-torsor of dilations; no logarithm of Q | Q59 | THEOREM | CI |
| No lift commutes with ρ_D(A5); a C3 fixes β = 0 or β ≡ 1 on 6 of 96 Q24 orbits | Q61 S2 | THEOREM | CI |
| Lifts miss H13⊕H51 and im U_h; only σ₀/σ₁ are signed bit permutations | Q62 | THEOREM | CI |
| Q64 likelihood picks orbit 1 with σ₁ | Q64/Q65/Q72 | candidate principle | CI |
| Gauge, vacuum and periodicity are blind to T; four laws for I, Q, P_σ₁, B_D₀ | Q104 | OBSTRUCTION | CI (43669582732 PASS) |

New here: Parts 1, 2 and 4, and the combination of (H) with (A) in Part 3. Part 3's C3 census is an independent
re-execution of Q61 S2 through `cathedral_engine`, and it agrees.

## Results

**Part 1 (THEOREM: structure).** The predecessors of 2x and 2x+1 are exactly x and x+32. So the URT support is
32 disjoint 2×2 blocks, U_x (rows x, x+32 → columns 2x, 2x+1), and T is unitary iff every U_x ∈ U(2). The unitary
URT transports therefore form U(2)³², a 128-dimensional real manifold.

- (S): a nonnegative unitary 2×2 block is 1 or the swap. So (S) gives exactly the 2³² lifts σ_β, with β(x)
  selecting the block.
- (B): every |entry|² = ½. Each block is then a coin e^{iα}diag(1,e^{iγ})·H·diag(1,e^{iδ}), a 3-torus per block.
  Exactly 8 blocks per site are real.
- No permutation is Born-compatible, so readings (S) and (B) are disjoint. Q itself is not unitary (rank 32).

**Part 2 (THEOREM: holonomy).**

- σ₀ (β = 0) has order 6 and σ₁ (β ≡ 1) has order 12, so both satisfy (H).
- The uniform Walsh–Hadamard coin T_H = M_H/√2 is Born-compatible, and M_H¹² = 64·I holds exactly, so T_H has
  order 12 and also satisfies (H).
- Of the 8 uniform real coins, 4 have order 12 and 4 have order exactly 24.
- Census of the 2¹⁶ complement-symmetric lifts (Fix I, β(x) = β(x ⊕ 31)): 1046 have order dividing 24. Of these,
  1 has order 6, 2 have order 8, 66 have order 12 and 977 have order exactly 24.

(H) therefore removes most lifts but keeps many, σ₀ and σ₁ among them. The stronger reading "the history closes
only after the full 24-clock" (order exactly 24) **excludes both σ₀ and σ₁**.

**Part 3 (THEOREM: A5 on all 768 classes, reading S).** The commutant of σ₀ or σ₁ in ρ_D(A5) is trivial or a C3.

- The C3 occurs for σ₀ on 24 classes and for σ₁ on 24 classes, and these sets are disjoint.
- Each set is 3 whole Q24 orbits: indices 1, 42, 61 for σ₀ and 5, 57, 82 for σ₁, in `Hs.q24_orbits()` order.
- The selected "orbit 1" of Q64 is index 5, a σ₁ orbit.

Adding (H) changes nothing, because both lifts pass it. {unitary, (S), (H), maximal A5 commutant} therefore leaves
6 orbits and two lifts. It picks σ₁ only once the dictionary orbit has been chosen, and the Q64/Q72 likelihoods
are what choose it. T_H commutes with no nontrivial ρ_D(a) on any of the 768 classes.

**Part 4 (THEOREM: the laws differ).** For every lift, w₆₃ᵀP_βw₆₃ = 64 − 4|β|, where |β| is the popcount, and the
A5 twirl preserves this Rayleigh quotient. Since G = Reynolds[TᵀT] = I for every unitary T, the parity mass in the
Q104 kernel is:

- for the lift σ_β: r²[2 − 2cosψ·(1 − |β|/16)], which gives r²(2 − 2cosψ) for σ₀ and r²(2 + 2cosψ) for σ₁;
- for T_H: r²(2 + √2·cosψ), because w₆₃ᵀM_Hw₆₃ = −64.

So transports with trivial holonomy give different history laws, and the premise leaves the law open.

## Conclusion

The connection premise is consistent, and it cuts the transport down from all linear maps (Q104) to U(2)³².
Neither the trivial-holonomy condition nor A5 compatibility then singles out σ₁.

- Under (S) with (H) and (A), the result is Q61's conditional selection unchanged: σ₀ on three Q24 orbits, σ₁ on
  three.
- Under (B), no lift is admissible at all. Coins such as T_H satisfy (H) and give yet another parity law.
- Under the stronger order-exactly-24 holonomy, σ₁ is excluded.

The Q104 P_σ₁ law therefore does **not** replace K_c or the Q92 family on these premises. Selecting it still
requires the Q64/Q72 dictionary selection.

**Dead ends (do not retry):** using unitarity, trivial 24-holonomy or the maximal A5 commutant, alone or together,
to select σ₁ without a dictionary selection.

## Scope and what remains open

- The holonomy census covers the 2¹⁶ complement-symmetric lifts, not all 2³².
- For reading (B), only the 8 uniform real coins and T_H's A5 commutant were examined. The C3-commuting coins on
  the exceptional orbits were not classified.
- No physical identification is made. No historical ARF value is used.

## RESUME HERE

Next question (Q128 [derive] (A)): reading (B). On the 6 exceptional Q24 orbits, classify the real Born coins
T = ⊕U_x (8 choices per block) that commute with that orbit's C3 ⊂ ρ_D(A5) and satisfy T²⁴ = I. Decide whether
the C3 fixes a unique coin, as it fixes a unique lift. Decide whether that coin differs between the σ₀ and σ₁
orbits. If the coin is unique, compute its Q104 law on V.

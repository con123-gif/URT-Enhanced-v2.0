# Q45: which unsigned orders have a zero middle-flip coset

**Agent:** Claude, 2026-11-12 (scheduled). **Gate:** A.
**Result:** THEOREM (native invariance and an exact criterion) + OBSTRUCTION (no single native orbit). Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
**Scope:** the original Git-blob-pinned Q3/Q28 A5 action on 64 codes, the primitive Q2 (h → 2h, 2h+1 mod 64), and Q43/Q44's defect E_o(s) = Σ_O (c_O(o,s) − c_O(o,s⊕12))². No physical history, chronology or ARF is selected.

**How the Queue item was read.** Q45 asked for a criterion on the order o that does not use a census, or else a proof that the six exceptional orders are not related by any native order map. Both parts are answered. (1) Every native order map is found, and the six are shown to form three orbits, not one. (2) A combinatorial criterion stated on o alone is given. The criterion is exact on all 12 classes, but it was **checked**, not derived: the vanishing is still read off one representative per orbit.

## 1. Native order maps (proved; each lemma is checked on its full finite domain)
**L1 (code side).** Of the 46,080 signed axis maps, exactly 240 permute the 80 A5 orbitals. They form N = N_{B6}(A5), and N/A5 = {1, C, τ, Cτ}, where C is central inversion. For g ∈ N, g∘code_{o,s} = code_{g·o, s⊕F_g}, and the orbital counts are relabelled, so E_{g·o}(s⊕F_g) = E_o(s). C fixes every order. τ acts on the 12 classes as six transpositions.
**L2 (history side).** The digit permutations π for which Q2 transported by π, up to any head and tail translations, is Q2 or Q2ᵀ are exactly the identity (giving Q2) and the reversal R: i ↦ 5−i (giving Q2ᵀ). Reversal transposes X, which maps orbitals O ↦ Oᵀ. Because rev(12) = 12, E_{o∘R}(s) = E_o(rev s).
So the native order-map group is G = ⟨τ, R⟩, and E is G-invariant (checked on all 12 × 64 values).

## 2. Obstruction
G has 5 orbits on the 12 classes:

| G-orbit | exceptional | min E |
|---|---|---|
| (0,1,2,3,4,5), (0,1,4,5,3,2) | yes | 0 |
| (0,1,2,3,5,4), (0,1,4,5,2,3) | yes | 0 |
| (0,1,2,5,3,4), (0,1,4,2,5,3) | yes | 0 |
| (0,1,2,4,3,5), (0,1,2,5,4,3), (0,1,4,2,3,5), (0,1,4,3,5,2) | no | 168 |
| (0,1,2,4,5,3), (0,1,4,3,2,5) | no | 192 |

The six exceptional orders are **three** G-orbits, so no native order map explains all six. The digit-{4,5} swap that Q44 noticed is not native, and it does not preserve exceptionality: (0,1,2,5,3,4) is exceptional but (0,1,2,5,4,3) is not. Even where both orders are exceptional, the swap is not an isometry of E, since (0,1,2,3,4,5) and (0,1,2,3,5,4) have different value sets.

## 3. Criterion (exact on all 12 classes; checked, not derived)
A5 acting on the 15 synthemes (pairings of the 6 axes into 3 pairs) has orbits of sizes 5 and 10. The 5-orbit T is a *total*: its 5 synthemes partition the 15 pairs. N preserves T. Pull T back to digits through o (digit i ↔ axis o_i) to obtain the total T_o. Then:
- every T_o contains exactly two even–odd synthemes, meaning each of their pairs joins an even digit to an odd digit;
- **o is exceptional ⟺ T_o contains one of P₁ = 01|23|45, P₃ = 03|25|41, P₅ = 05|21|43.** These are the matchings {i, i+d mod 6} with i even and d odd. When T_o contains one of them, it contains exactly two.

Equivalently, write an even–odd syntheme as a bijection 2k ↦ 2σ(k)+1. P₁, P₃ and P₅ are the three even σ. A total is exceptional exactly when both of its even–odd synthemes are even.

**Why six.** Each syntheme lies in exactly 2 of the 6 totals. P₁, P₃ and P₅ lie in exactly 3 totals, and each pair of those totals shares one of them. Each total pulls back from exactly 2 order classes, namely a τ-pair. Hence 3 × 2 = 6 orders are exceptional. All of these counts are checked in the certificate.

## What remains open
- The criterion is an exact finite equivalence, not a mechanism. No proof is given that T_o ∋ P_d forces S_{o,s} = S_{o,s⊕12} on a V-coset. The pairs of P₁ are the Q2 digit pairs (2k, 2k+1), and the A5-stabiliser of a syntheme in T is an A4. That is the natural place to look (Q46).
- The cyclic description {i, i+d mod 6} is only a way of naming the three matchings. Q2 is not cyclic in its digits.

## Evidence
`q45_zero_coset_orders.py`, registered as check `research.q45_zero_coset_orders`. It imports the unaltered Q28 (and hence Q3) source by Git blob (6e22cb76…, bc67d3ba…). It does not import the Q42, Q43 or Q44 scripts. It checks L1 over all 46,080 signed maps and L2 over all 720 digit permutations with all 4,096 translation pairs, verifies E-invariance directly, and checks the orbit table, the criterion and the counting. It was executed in Claude's cloud sandbox (Python 3, NumPy), exit 0, about 5.4 s. Exact integers throughout; nothing is fitted. Gates A–F remain open.

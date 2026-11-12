# Q46: the zero middle-flip coset comes from one rotation in A5

**Agent:** Claude, 2026-11-12 (scheduled). **Gate:** A.
**Result:** THEOREM. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
**Scope:** the original Git-blob-pinned Q3/Q28 A5 action on 64 codes, the primitive Q2 (h → 2h, 2h+1 mod 64), and the defect E_o(s) = Σ_O (c_O(o,s) − c_O(o,s⊕12))² of Q43–Q45. No physical history, chronology or ARF is selected.

**How the Queue item was read.** Q46 asked whether S_{o,s} = S_{o,s⊕12} on the zero coset follows from the A4 that stabilises the P-syntheme of T_o. It does. The proof needs only a smaller group: the C3 = A4 ∩ A4′ that stabilises **both** P-synthemes of T_o. The Klein four-group part of A4 plays no role.

## Notation
- Digit i is carried by code axis o_i, and code_{o,s}(h) = ⊕_i (h_i ⊕ s_i) e_{o_i}.
- The Q2 edges are E_0 = {(h, Lh ⊕ c)}, where L is the digit shift i → i+1 (h ↦ 2h mod 64) and c ∈ F₂.
- ρ is the digit rotation i ↦ i+2 (mod 6), and Z is the cyclic shift i ↦ i+1 (mod 6).
- D(t) = t ⊕ Lt with digit 0 cleared, so that E_0 ⊕ (t,t) = E_{D(t)} := {(h, Lh ⊕ D(t) ⊕ c)}. The middle flip changes D by D(12) = 20 = e₂ + e₄.

## Proof
**L1 (realisation).** Some g ∈ A5 acts on digits through o as ρ^{±1} (with digit signs ε_o) ⟺ o is exceptional. When it exists, these g form one C3.
- ⇒: ρ fixes exactly three synthemes, P₁ = 01|23|45, P₃ = 03|25|41 and P₅ = 05|21|43. A5 acts on the total T as on 5 points, so an element of order 3 fixes exactly two synthemes of T. Hence T_o contains two P's, which is the Q45 criterion.
- ⇐: the two P's of T_o have a common stabiliser C3 in A5. P_a ∪ P_b is a hexagon with 2-coloured edges, and its only order-3 symmetries are ρ^{±1}.
- So Q45's criterion is now derived as "A5 contains the rotation by two digits".

**L2 (frame).** ε_o lies in Im(1+ρ), the vectors with even parity on the digits {0,2,4} and on {1,3,5}. Choose t₀ with t₀ ⊕ ρt₀ = ε_o. Then g(code_{o,t₀}(h)) = code_{o,t₀}(ρh): in this frame g *is* ρ. Moreover X_{o,s} = code_{o,t₀}(E_D) and X_{o,s⊕12} = code_{o,t₀}(E_{D⊕20}), where D = D(s⊕t₀).

**L3 (moving cut).** ρ^j E_D = {(k, Zk ⊕ y) : y ∈ {ρ^jD, ρ^jD ⊕ e_{2j}}}. Q2 is the cyclic shift Z with one link cut, 5→0. Rotating by ρ moves the cut to 1→2 and then to 3→4. The map (k,y) ↦ (k, Zk⊕y) is injective, so the ⟨ρ⟩-symmetrised edge multiset of E_D depends on D only through the multiset of ρ-orbits {[D], [D⊕e₀]}.

**L4 (solution).** {[D],[D⊕e₀]} = {[D⊕20],[D⊕e₀⊕20]} ⟺ D ∈ {4, 16, 46, 58}.
- The crossed match would need (1+ρ^k)D = 21. That is impossible, because 21 has odd parity on the even digits.
- The straight match needs the odd part of D to lie in {0, 42}. On digits (0,2,4), the even part x must solve either (1+ρ)x = 20 and (1+ρ²)x = 5, or (1+ρ²)x = 20 and (1+ρ)x = 17. With x₀ = 0 the solutions are e₂ and e₄.

**THEOREM.** For each exceptional o, every s with D(s⊕t₀) ∈ {4,16,46,58} has equal ⟨g⟩-orbital counts for X_{o,s} and X_{o,s⊕12}. A5 orbitals are unions of ⟨g⟩-orbitals, so c(o,s) = c(o,s⊕12), and by the Q40 lemma S_{o,s} = S_{o,s⊕12}. These are exactly 8 masks (D is 2-to-1), and they coincide with the census zero set of Q42–Q45.

| order o | ε_o | t₀ | zero masks (derived = census) |
|---|---|---|---|
| (0,1,2,3,4,5) | 34 | 10 | 5, 9, 16, 28, 35, 47, 54, 58 |
| (0,1,2,3,5,4) | 30 | 6 | 5, 9, 16, 28, 35, 47, 54, 58 |
| (0,1,2,5,3,4) | 57 | 13 | 2, 14, 23, 27, 36, 40, 49, 61 |
| (0,1,4,2,5,3) | 54 | 14 | 1, 13, 20, 24, 39, 43, 50, 62 |
| (0,1,4,5,2,3) | 40 | 8 | 7, 11, 18, 30, 33, 45, 52, 56 |
| (0,1,4,5,3,2) | 20 | 4 | 7, 11, 18, 30, 33, 45, 52, 56 |

## Also checked, by finite census and not derived
- **A4 refinement.** The A4-orbital identity, which Q46 asked about, holds on exactly these 8 masks for both A4 = Stab(P) with P ∈ T_o. It holds on no mask for the other three A4's of T_o.
- **Other subgroups.** No V4, no C2, no C5 and no other C3 of A5 gives the identity on any mask.
- **Converse.** A5-orbital equality ⇒ ⟨g⟩-orbital equality is checked by census, not derived.
- **Non-exceptional orders.** Six orders have no zero coset (min E = 168 or 192). This is still a census fact: L1 shows that they have no rotation, but not that some other mechanism cannot cancel.

## What remains open
- A non-census proof that the six non-exceptional orders have E_o > 0 for every s (Q47).
- Any physical meaning. The rotation by two digits is the square of the cyclic Q2 shift with its cut removed, but no chronology or ARF is inferred.

## Evidence
`q46_rotation_mechanism.py`, registered as check `research.q46_rotation_mechanism`. It imports the unaltered Q28 (and hence Q3) source by Git blob (6e22cb76…, bc67d3ba…). It does not import the Q42–Q45 scripts. It checks L1 on all 12 classes and all 60 elements, L2 on all 64 masks, L3 for all 64 D and all j, L4 over all D, and the theorem's predicted set against the census. It also checks the A4, V4 and 31-cyclic-subgroup statements. It was executed in Claude's cloud sandbox (Python 3, NumPy), exit 0, about 1.7 s. Exact integers throughout; nothing is fitted. Gates A–F remain open.

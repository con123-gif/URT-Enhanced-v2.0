# Q44 — The Q43 eight-character support is forced by three native symmetries

**Agent:** Claude, 2026-11-11 (scheduled). **Gate:** A.
**Result:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Also an independent cross-check (AGREE) of Q43's numbers.
**Scope:** the original Git-blob-pinned Q3/Q28 geometric A5 action on 64 six-bit codes and the primitive Q2 (h → 2h, 2h+1 mod 64). No physical history, chronology or ARF is selected.

**Reading of the Queue item.** Q44 asked which A5 representation blocks of the middle-odd Walsh coefficient vectors force the Q43 defect coefficients outside ⟨15,17,34⟩ to vanish. The answer below is that no representation decomposition is needed: the vanishing is forced by a three-generator group of sign-mask symmetries of the defect. The decomposition into irreducible blocks was not computed.

## Setting (as in Q42/Q43)
Unsigned order o, sign mask s ∈ F₂⁶ (bit i = digit i), code_{o,s}(h) = ⊕ᵢ (hᵢ ⊕ sᵢ)·2^{oᵢ}. X_{o,s} is the 128-edge transport of Q2, c_O(o,s) its edge count in each of the 80 A5 orbitals O, and
E_o(s) = Σ_O (c_O(o,s) − c_O(o,s⊕12))²  (Q43's middle-flip defect; E_o(s)=0 ⟺ S_{o,s} = S_{o,s⊕12}).
Write T_o(m) = ⊕ᵢ mᵢ·2^{oᵢ}, so code_{o,s⊕m} = code_{o,s} ⊕ T_o(m), and T_o(63) = 63 for every o.

## Lemmas
**A (Q2 symmetries).** Q2 is the shift: digit i of the successor is digit i−1 of the head (digit 0 free). Hence translating heads by the digit mask 21 = {0,2,4} and tails by 42 = {1,3,5} maps Q2 edges to Q2 edges, as does translating both by 63.
**B (central inversion).** C: x ↦ x⊕63 commutes with every one of the 60 original A5 code permutations (they are signed axis permutations). Hence (u,v) ↦ (u, Cv) and (u,v) ↦ (Cu, Cv) induce permutations π_{1C}, π_{CC} of the 80 orbitals.
**C (transport).** Re-indexing the Q2 edges by Lemma A,
X_{o,s⊕21} = {(x ⊕ T_o(21), y ⊕ T_o(21))} = {(x', y' ⊕ T_o(21) ⊕ T_o(42))} = (1×C)·X_{o,s},
and likewise X_{o,s⊕63} = (C×C)·X_{o,s}. Therefore c(o,s⊕21) = c(o,s)∘π_{1C} and c(o,s⊕63) = c(o,s)∘π_{CC} for every o and s. (Lemma C is the orbital form of Q32's S_{S(D)} = S_D·C.)

## Theorem
For every unsigned order o, E_o(s⊕v) = E_o(s) for all v in
V = ⟨12, 21, 63⟩ = {0, 12, 21, 25, 38, 42, 51, 63}.
Proof: 12 because E_o is symmetric in (s, s⊕12) by definition; 21 and 63 because by Lemma C the same orbital permutation acts on both c(o,s) and c(o,s⊕12), and a sum of squares over all 80 orbitals is permutation-invariant. ∎

**Corollaries.** (i) The Walsh support of E_o lies in the annihilator V^⊥ = ⟨15,17,34⟩ = {0,15,17,30,34,45,51,60}, which is exactly Q43's H; so E_o depends only on (χ₁₅, χ₁₇, χ₃₄)(s), and the "common kernel" Q43 found is V itself. (ii) The zero set of E_o is a union of V-cosets, which is Q43's affine three-flat; each coset is two {s, s⊕12, s⊕63, s⊕51} quartets. (iii) The vanishing of odd-weight coefficients in Q43 is the 63-symmetry alone.

**Sharpness (computed).** For all 12 orders the support of E_o spans H, so the exact stabiliser of E_o in F₂⁶ is V: no further mask symmetry exists.

## What this does not explain
Which orders have a zero V-coset (six of twelve) is not derived here; it is still read off the eight coset values. Observation, not proof: the exceptional orders pair up by swapping the last two entries, (0,1,2,3,4,5)/(0,1,2,3,5,4) and (0,1,4,5,2,3)/(0,1,4,5,3,2), with identical seeds; (0,1,2,5,3,4) and (0,1,4,2,5,3) are unpaired in that sense.

## Evidence
`q44_middle_flip_symmetry.py` (check `research.q44_middle_flip_symmetry`). Imports the unaltered Q28 (hence Q3) source, blobs 6e22cb76… and bc67d3ba…; does not import GPT's Q42/Q43 scripts. It checks Lemma A on all 64×64 entries, Lemma B on all 60 permutations, the orbital maps on all 4096 pairs, and Lemma C on all 12×64 signed dictionaries. As cross-checks only (not used by the proof), it recomputes E_o by direct census and confirms: V-invariance, support ⊆ H spanning H, Q43's canonical expansion 388 + 52χ₁₇ + 156χ₃₀ − 52χ₃₄ − 116χ₄₅ + 12χ₅₁, Q43's six exceptional orders and seeds, and the minima 168/192 for the others. Executed in Claude's cloud sandbox (Python 3, NumPy), exit 0, about 1.2 s. Exact integers throughout; nothing is fitted. Gates A–F remain open.

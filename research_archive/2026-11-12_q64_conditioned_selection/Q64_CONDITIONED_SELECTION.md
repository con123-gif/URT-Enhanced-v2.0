# Q64: a unique reversible history from the native chronology

Date: 2026-11-12 (Claude, user-directed session). Gate A, ACTIVE PROBLEM attempt A1.
Status: **THEOREM (exact finite optimisation) under one stated principle. CLOSED INTERNALLY / PHYSICAL
IDENTIFICATION PENDING.** The principle is stated, not yet derived from the recurrence; deriving it is the next attempt.
Certificate: `Q64_CONDITIONED_SELECTION_CERTIFICATE.py` (check `research.q64_conditioned_selection`). Exact
Fractions. Executed in Claude's cloud sandbox: exit 0 in 7 s.

## The problem

Gate A needs one history dictionary (axis order and signs) and one chronology, derived and not chosen.
Q12–Q61 showed what *cannot* do it. Symmetric statistics cannot remove A5 × ⟨I,R,S⟩ (Q24), and the inverse
limit selects no lift (Q61). A C3 fixes a lift only on 6 of the 96 orbits, and that lift misses the hidden
carrier (Q62). This attempt asks for an answer instead of another no-go: **which reversible history does the
native chronology itself make most probable?**

## The principle (stated)

For a dictionary D, the original Q3 twirl S_D of the primitive two-successor Q2 gives the A5-covariant chronology
K_D = S_D/120. The URT recurrence allows only the successors h → {2h, 2h+1}. Conditioning K_D on that rule gives

  p_D(h → k) = S_D[h,k] / (S_D[h,2h] + S_D[h,2h+1]),  k ∈ {2h, 2h+1}.

A reversible history is a lift σ of Q, so it picks one successor per history bijectively. Its likelihood is
L(D,σ) = ∏_h p_D(h → σ(h)). Maximise over all 46,080 dictionaries and all 2³² lifts. Each bit β_x fixes only
σ(x) and σ(x+32), so the maximum over lifts is exact bit by bit, with no search.

## Result

- The maximum L* = 42391158275216203514294433201 / 6758214190822850560000000000000000000000 ≈ 6.2725×10⁻¹² is
  attained on **exactly one Q24 orbit (8 of the 768 A5 classes)**. Every class in that orbit has **one maximising
  lift with no tied bit: σ₁** (β ≡ 1, cycle type 4·12⁵).
- The maximiser is covariant under I, R and S. A5 × ⟨I,R,S⟩ is the exact symmetry group of the native action
  (Q24), and it maps the 8 maximising pairs (D, σ₁) onto each other. So **the dictionary and the reversible history
  are unique up to the symmetry of the action**, which is the most any invariant principle can deliver.
- The runner-up is another exceptional orbit, also with σ₁, at a factor **4.5445** below.
- **Three independent routes now meet on the same orbit and the same lift:**
  1. the C3 ⊂ A5 commuting selection (Q61) gives σ₁ there;
  2. this is the only exceptional orbit where σ₁ preserves the 40-word support of im U_h (Q62 C3);
  3. the conditioned likelihood (this note) is maximal there.

  The maximising classes are (0,2,4,6,10,9), (0,2,7,5,9,10), (0,2,9,10,4,6), (0,2,10,9,7,5),
  (0,3,4,7,10,8), (0,3,7,4,9,11), (0,3,9,11,4,7), (0,3,10,8,7,4), which is Q62's orbit 1.

## Why the conditioning matters (and the two objectives that fail)

- **Linear overlap Tr(S_D X_σᵀ) without conditioning.** Its maximum, 568, is on a different orbit (Q62 orbit 5),
  with lifts that are not C3-invariant. A sum of transition weights is not the probability of a history.
- **Raw likelihood ∏ S_D[h,σ(h)] without conditioning.** It ties orbits 3 and 5. σ₁ sees identical weights on
  every one of its cycles in both, although S_D on the two orbits are not isomorphic as weighted digraphs. The raw
  likelihood counts the mass K_D puts on transitions the recurrence forbids. Conditioning on the URT successor rule
  removes that mass, and it removes the tie with a margin of 4.5.

## What this does and does not establish

- It selects one dictionary orbit and one reversible history from original operators, under the stated
  maximum-likelihood principle. Nothing is fitted.
- **Not yet derived:** why this likelihood is the right functional. That is the next attempt (A2). It is a
  postulate until then.
- **Not yet done:** using the selected (D, σ₁) to derive the rest of Gate A, namely the chronology coefficient and
  the source weights (4,2,2,0) (attempt A3).
- σ₁ still does not preserve the P8 values, ‖P P8 Pᵀ − P8‖² = 8 (Q62 C3), so the hidden-carrier step remains
  separate.

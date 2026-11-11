# Q40 review + Q41 — the 12 residual collisions are operator equalities; the twirl has 372 operators

**2026-11-11 · Claude · REVIEW (AGREE) of GPT's Q40 + THEOREM/OBSTRUCTION answering Q41 ·
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

Claude took Q40 in the same window as GPT (`research_archive/2026-11-11_q40_cross_orbit_q2/`), with its
own code that imports the original Q28 source rather than GPT's script. On rebase GPT's result was
already on the branch, so per protocol this is recorded as an independent REVIEW: **AGREE** on every
number (108 → 96 split, 12 residual in orbit pairs (2,58), (6,62), (41,81), 372 four-component
signatures, both witnesses). Items 2–4 below go beyond GPT's statement and settle Q41.
Exact finite mathematics for the original Q3/Q28 geometric A5 twirl of the primitive 64-history
two-successor chronology. Not a chronology selector and not an ARF derivation.

## Operators and reading

Unchanged Q3 (`bc67d3ba…`) and Q28 (`6e22cb76…`) Git blobs. As in Q39, "Q2" is the primitive
two-successor matrix `Q2[h,2h] = Q2[h,2h+1] = 1` (mod 64) — the variable `Q` in the code — and Q2^k
its matrix powers. For a signed dictionary D, X_D = D Q2 D⁻¹ in canonical codes and
S_D[i,j] = Σ_{g∈A5} X_D[g(i), g(j)] (unnormalised). The 384 inversion classes are the pairs {d, I(d)}
inside Q28's 96 eight-orbits; S_{I(d)} = S_d exactly (Q39). Reading taken for Q40: "Tr(S_D Q2³)" and
"Tr(S_D² Q2)" mean Tr(S_D·Q2³) and Tr(S_D²·Q2) with Q2 primitive, matching Q39's conventions.

## Results

1. **Refinement (Q40 as asked; agrees with GPT).** Of Q39's 108 cross-orbit equal-(Tr S Q2, Tr S Q2²) pairs,
   Tr(S Q2³) splits 73, Tr(S² Q2) splits 93, and the pair jointly splits **96**; **12 survive**.
   First split: D = (10,9,6,5,2,1) (orbit 0) vs E = (8,7,10,4,2,1) (orbit 80), signature
   (280, 488, 1008, 28504) vs (280, 488, 944, 28536).
2. **The 12 survivors are full operator equalities.** For each, S_D = S_E as 64×64 integer matrices,
   with D and E in different Q24/Q28 eight-orbits and E = D with the signs at digits 2 and 3 flipped
   (up to inversion). They make up three orbit pairs, four inversion classes each:
   {2, 58}, {6, 62}, {41, 81} (Q28 numbering). Witness: D = (0,2,4,6,9,10), E = (0,2,5,7,9,10),
   common signature (172, 344, 912, 28728). **Obstruction, all orders:** no invariant built from
   S_D and the fixed primitive Q2 (any word in S, Sᵀ, Q2, Q2ᵀ, any spectral or intertwiner test)
   separates these 12 pairs. The twirl is not injective on the Q24 orbits: it forgets the distinction
   between orbits 2 and 58, 6 and 62, 41 and 81. **Q41 is answered:** its (Tr S Q2⁴, Tr S² Q2²)
   agree on all 12 (certificate computes them), as does every higher word.
3. **Orbital lemma (proof of what S sees).** Since (g(i), g(j)) runs over the A5 orbital O_ij of (i,j),
   each element |Stab| = 60/|O_ij| times, S_D[i,j] = (60/|O_ij|)·#{(u,v) ∈ O_ij : X_D[u,v] = 1}. So
   S_D is exactly the vector of edge counts of the 128 primitive edges of X_D in the 80 A5 orbitals of
   ordered code pairs, and S_D = S_E iff those 80-vectors agree. The certificate checks the identity
   entrywise and checks equality of the count vectors for all 12 survivors.
4. **Completeness.** Across all 46,080 signed dictionaries (S is A5-transport invariant) there are
   exactly **372 distinct twirled operators** on 384 inversion classes, and the four traces
   (Tr S Q2, Tr S Q2², Tr S Q2³, Tr S² Q2) take exactly 372 values, one per operator. So the
   length-≤4 primitive-Q2 signature is a complete invariant of S_D; nothing further in this
   twirled-chronology line can separate any more classes.

## Proof and execution

Items 1, 2 and 4 are exhaustive exact integer enumerations over the 384 classes (int64 bounds:
Tr(S Q2³) ≤ 64·120·8, Tr(S²Q2) ≤ 64·120²·2). Item 3 is the two-line orbit-counting proof above,
plus an entrywise check. Run from the repository root:
`python -u research_archive/2026-11-11_q40_review_operator_equality/q40_review_operator_equality.py`.
Executed in Claude's sandbox (Python 3, NumPy) 2026-11-11, exit 0, 1.4 s. CI verdict: see the log.

## Scope and what remains open

- The coincidences are a property of the twirled chronology only. Q15/Q24 record the 96 orbits as
  having distinct native K₂–I₃ signatures (not re-run here); so the twirl loses information the native
  Q6 cumulants keep. Neither fact selects a chronology, a dictionary or an ARF.
- Open: a conceptual reason why exactly the digit-{2,3} sign flip, and exactly these three orbit
  pairs, preserve the 80 orbital edge counts (queued as Q42).

# Q40 — cross-orbit primitive-Q2 mixed-trace refinement

**2026-11-11 · GPT · THEOREM + OBSTRUCTION · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** This is an exact finite calculation on the original 64-history two-successor Q2 and icosahedral A5 twirl. It does not select a physical history or derive any ARF.

## Native definitions and provenance

Reconstruct the native Q3 icosahedral A5 action from its twelve vertices, antipodal six-axis dictionary and proper graph automorphisms, and Q28's 96 lexicographic eight-orbit representatives. The original source Git blob hashes are `bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984` (Q3) and `6e22cb7654176c6499ee138737f4f85240619ec7` (Q28); the executable independently rebuilds the same operators and checks the original source hashes when those files are present. For each dictionary D, S_D is the sum of the 60 A5 conjugates of the dictionary-transported primitive Q2. Global inversion gives the same S matrix exactly; choose one dictionary per inversion pair.

Q39's old signature is (Tr(S_D Q), Tr(S_D Q²)), with Q the native two-successor operator. Q40 extends it by (Tr(S_D Q³), Tr(S_D² Q)). All traces are exact nonnegative integer walk counts. Row sums give the overflow bounds Tr(SQ³) ≤ 64·120·8 = 61440 and Tr(S²Q) ≤ 64·120²·2 = 1843200, both far below 2⁶³.

## Exact exhaustive result

Among the 384 inversion classes from the 96 eight-orbits, the old two-component signature has 297 distinct values and 108 cross-orbit collision pairs, reproducing Q39. The two new components split **96 of 108 pairs**, leaving **12 pairs** and **372 distinct four-component signatures**. All 12 remaining pairs occur in three pairs of eight-orbits, four per pair: (2,58), (6,62), (41,81), using zero-based Q28 lexicographic orbit indexing. No inversion pair is treated as distinguishable.

An exact split witness is D=(10,9,6,5,2,1), E=(8,7,10,4,2,1): the old signature is (280,488) for both, while the new components are (1008,28504) and (944,28536), respectively. A surviving witness is D=(0,2,4,6,9,10), E=(0,2,5,7,9,10), with common old (172,344) and new (912,28728).

## Certificate and scope

Run `python -u research_archive/2026-11-11_q40_cross_orbit_q2/q40_cross_orbit_q2.py` from the repository root. GPT locally executed the standalone independent native reconstruction in Python 3.13.5 / NumPy 2.3.5 / NetworkX 3.6.1 on 2026-11-11 16:13 UTC, exit 0, 1.211 seconds. The script checks all 384 inversion classes, all 108 old collisions, full inversion matrix equality, two direct matrix-product trace witnesses, and exact int64 bounds. GitHub CI verdict must be recorded separately. All physical gates remain open.

## Next question

**Q41 [compute]**: On the 12 residual cross-orbit collision pairs, calculate the exact native (Tr(S_D Q⁴), Tr(S_D² Q²)) signatures; count remaining pairs and exhibit a split witness or bounded obstruction, without inferring physical selection.

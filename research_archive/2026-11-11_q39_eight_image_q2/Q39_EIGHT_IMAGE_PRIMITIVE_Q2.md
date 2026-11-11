# Q39 — primitive-Q2 mixed traces on all 96 history-symmetry eight-orbits

**2026-11-11 · GPT · THEOREM + OBSTRUCTION · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** This is exact finite mathematics for the original Q3/Q28 geometric A5 twirl of the primitive 64-history two-successor Q2, not a physical chronology selector or an ARF derivation.

## Operators and scope

Import unchanged Q3 (`bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984`) and Q28 (`6e22cb7654176c6499ee138737f4f85240619ec7`) Git blobs. Q2 has `Q2[h,2h mod 64]=Q2[h,(2h+1) mod 64]=1`; Q28 supplies the 60 proper icosahedral rotations, the 96 lexicographically selected A5 x <I,R,S> orbit representatives, and the eight dictionary images. For each signed dictionary D, `S_D = sum_{g in A5} P_g (D Q2 D^{-1}) P_g^T` is the original unnormalised Q3 twirl. Compute the exact integer pair `F(D)=(Tr(S_D Q2), Tr(S_D Q2^2))` in fixed canonical coordinates. The 96 representatives are the same as Q28; no synthetic operators, measurements or fitted values are introduced.

## Exact result

For **every one of the 96 eight-orbits**, the eight images have **exactly four distinct F signatures, each occurring twice**: partition `(2,2,2,2)`. All 96 canonical representatives differ from both their reversal R and alternating flip S at this two-component signature; none differs from global inversion I. Thus 768 images contain 384 inversion pairs, with **297 distinct global signatures**. Their multiplicities measured in inversion pairs are 227 signatures of multiplicity 1, 57 of multiplicity 2, 9 of multiplicity 3 and 4 of multiplicity 4. There are **108 equal-signature pairs between distinct eight-orbits**, or 87 inversion pairs in excess of the 297 distinct values.

Exact witness: `D=(0,2,4,6,8,10)` has `F(D)=(260,520)`, `F(S(D))=(148,360)` for `S(D)=(0,3,4,7,8,11)`, and `F(R(D))=(448,648)` for `R(D)=(10,8,6,4,2,0)`. Global inversion `I(D)=(1,3,5,7,9,11)` gives `F(I(D))=(260,520)`.

## Proof and execution

The bitwise complement C on the 64 history codes commutes with the two-successor Q2: complement swaps the two successors of each state. Every proper icosahedral code permutation also commutes with C. Hence `S_{I(D)}=S_D` **as full matrices**, not just in their first two traces. No mixed-word invariant built solely from S_D and the fixed Q2 can separate I-partners. The executable certificate checks this full operator equality for all 768 images.

The remaining finite claims are exhaustive integer enumerations of the 96 Q28 representatives and their eight images, using the original SHA-pinned source. Each S has row and column sum 120; Q2 and Q2^2 have row sums 2 and 4. Thus `Tr(S Q2^j) <= 64*120*2^j` for j=1,2, well within signed 64-bit arithmetic. Entrywise integer contractions are independently compared to direct matrix multiplication. Three complete 60-element A5 orbit checks confirm the twirl's covariance.

Run from repository root: `python -u research_archive/2026-11-11_q39_eight_image_q2/q39_eight_image_q2.py`. Local Python 3.13.5 / NumPy 2.3.5 / NetworkX 3.6.1, **exit 0, 5.408 s** on 2026-11-11 15:15 UTC; GitHub Actions verification must be reported separately. A passing finite certificate does not close Gate A.

## Next exact question

**Q40 [compute]:** Among the 108 cross-orbit collisions of Q39's two-component signature on the 384 inversion classes, compute `Tr(S_D Q2^3)` and `Tr(S_D^2 Q2)` using the same native operators; count how many distinct eight-orbit classes these length-four mixed traces separate, with a witness or bounded obstruction. Inversion cannot be separated by any such word.

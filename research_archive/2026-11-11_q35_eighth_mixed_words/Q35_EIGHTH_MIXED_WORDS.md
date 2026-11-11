# Q35 — Exact eighth-order mixed-word chronology obstruction

**2026-11-11 · GPT · Gate A · OBSTRUCTION · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** This is finite mathematics for the named native Q3/Q28/Q34 chronology operators, not a physical history selector or an ARF derivation.

## Native construction and scope

Let `Q2[h,2h mod 64] = Q2[h,(2h+1) mod 64] = 1` be the primitive six-bit history shift. For a signed six-axis dictionary `D`, let `X_D = D Q2 D^{-1}` in the geometric icosahedral 64-code basis. The original Q3 icosahedral proper-rotation action provides the 60 permutations `P_g`. Define the unnormalised native A5 twirl

`S_D = sum_{g in A5} P_g X_D P_g^T`.

This certificate imports the **original Q34** source (which imports original Q28 and Q3); no substitute matrices or external physical inputs occur. Q34 re-identifies the 20 pairs `(D, alt(D))` that survive the Q30 non-permutation and all mixed-word tests through length seven. The local copies of original Q3, Q28 and Q34 source used for the standalone execution have Git blob SHA-1 `bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984`, `6e22cb7654176c6499ee138737f4f85240619ec7`, `e78e6bb74550bbc34c04e91cad2b60e849430326`, matching the branch originals exactly.

## Exact arithmetic certificate

Every `S_D` is a nonnegative 64×64 integer matrix with all row and column sums 120. Consequently for any length-eight word `w` in `S_D` and `S_D^T`, its trace `T_w` satisfies

`0 <= T_w <= 64*120^8 = 2751882854400000000`.

Compute each matrix word separately modulo the **coprime** integers `p = 2147483647` and `q = 2147483646`. They need not both be prime. Their product is `4611686011984936962`, strictly greater than the trace bound. Every modular intermediate entry is `< p`, while each next-factor column sums to 120, so every unreduced integer matrix-multiplication entry is at most `120*(p-1) = 257698037520 < 2^63`. Thus the signed-int64 modular calculations cannot overflow. Because `p = q+1`, reconstruct the unique integer trace as

`T_w = r_p + p * ((r_q - r_p) mod q)`.

Each reconstructed value is checked against both residues and the global trace bound. As an independent arithmetic cross-check, the first pair's `Tr(S_D^8)` is computed with NumPy **Python-object integers**, yielding `42999397810897920`, equal to the CRT result.

## Result

For **each of the 20 surviving non-permutation pairs**, all **256** binary words `w` of length eight have identical exact traces:

`Tr w(S_D,S_D^T) = Tr w(S_alt(D),S_alt(D)^T)`.

The certificate evaluates **10,240** exact traces (20 pairs × 2 matrices × 256 words), with **0/20** pairs separated. All 20 dictionaries are printed in the JSON result. This is a bounded order-eight obstruction, **not** an all-order equality, an orthogonal-similarity certificate, a physical chronology choice or a derived ARF.

## Execution evidence

`python -u research_archive/2026-11-11_q35_eighth_mixed_words/q35_eighth_mixed_words.py` executed in the GPT local container (Python 3.13.5, NumPy 2.3.5, NetworkX 3.6.1) on 2026-11-11 at 11:16 UTC; **exit 0, wall 16.56 s** (`elapsed_seconds` field 15.65 s). The local original Q3/Q28/Q34 copies were checked byte-for-byte via Git blob hashes against the repository. GitHub CI must re-execute the committed original-source import; no CI verdict is assumed in this note.

## Next exact question (Q36)

For the same 20 pairs, solve the rational simultaneous intertwiner equations `X S_D = S_alt(D) X` and `X S_D^T = S_alt(D)^T X`. Does their solution space contain an invertible rational `X`? If yes, its polar factor gives an orthogonal similarity; if no, give an exact obstruction. This can decide a structural question that merely extending trace-word length does not.

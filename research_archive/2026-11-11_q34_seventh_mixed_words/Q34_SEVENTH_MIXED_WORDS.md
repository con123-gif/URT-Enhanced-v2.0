# Q34 — Exact seventh-order mixed-word chronology obstruction

Date: 2026-11-11. Agent: GPT. Status: **OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. No physical ARF or unique chronology is derived.

## Original operators and scope

Use the original Q3 primitive six-bit adjacency \(Q_2\), with \((Q_2)_{h,2h\bmod64}=(Q_2)_{h,(2h+1)\bmod64}=1\), and the 60 proper icosahedral \(A_5\) code permutations from `research_archive/2026-11-11_q3_twirled_chronology_classes/Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py`. Use the original Q28 enumeration of 96 orbits on 46,080 signed dictionaries from `research_archive/2026-11-11_q28_twirled_third_trace/q28_twirled_third_trace.py`. For signed dictionary \(D\), the native integer twirl is
\[
S_D=\sum_{g\in A_5}P_g(DQ_2D^{-1})P_g^T.
\]
Here \(D\) is its induced 64-history permutation, not a fitted parameter. Let \(a(D)\) flip the odd-indexed dictionary signs. This calculation does not replace or edit the native operators.

## Exact result

Among 96 eight-partner orbits, 48 satisfy the earlier third-trace collision. Their pairs \(S_D,S_{a(D)}\) classify as 4 permutation-conjugate, 18 conjugate to transpose only, and 26 neither, by exact weighted directed-graph isomorphism. Six of the 26 are separated by \(\operatorname{Tr}(S^2S^T)\); the remaining **20** have matching traces for every mixed word of length 2 through 6.

**For every one of those 20 pairs and every one of the 128 words \(w\in\{S,S^T\}^7\),**
\[
\boxed{\operatorname{Tr}w(S_D,S_D^T)=
\operatorname{Tr}w(S_{a(D)},S_{a(D)}^T).}
\]
Thus the exact number separated at seventh order is **0/20**. The executable certificate evaluates 20 × 2 × 128 = **5120** integer traces, with explicit assertions for the Q30 classification and all earlier mixed words.

## Arithmetic proof and execution

Each \(S_D\) and \(S_D^T\) is a nonnegative integer 64×64 matrix whose row sums are 120 (60 proper rotations times the two successors of \(Q_2\)). Consequently every product of \(L\) such matrices has nonnegative entries and row sums \(120^L\), so \(0\le\operatorname{Tr}w\le64\cdot120^L\). At \(L=7\), this is exactly **22,932,357,120,000,000**, below \(2^{63}\). NumPy int64 multiplication therefore has no intermediate overflow. The script checks row sums for every seventh-order word and exits nonzero if any asserted equality fails.

Local execution: 2026-11-11 10:15 UTC, Python 3.11, NumPy 2.3.5, NetworkX 3.6.1; **exit 0, 5.69 seconds**. The local source tree contained the exact Q3 geometric A5 and Q28 dictionary/orbit definitions transcribed from inspected repository source. The committed certificate uses `runpy` to load the original Q28 module, which in turn imports Q3. GitHub CI execution must be checked separately.

## Boundary and next question

This is **not** an all-order mixed-word equivalence, orthogonal similarity, physical chronology selection, or an ARF derivation. Q35: evaluate the 256 length-eight mixed words on these 20 pairs with an exact arbitrary-precision or CRT implementation and determine whether any split.

# Q42 — Exact middle-digit sign-flip fibres of the native A5 chronology

**Status:** THEOREM + OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.  
**Agent:** GPT, 2026-11-11. **Gate:** A.  
**Scope:** The original Q3 geometric A5 action on the 64 six-bit codes, Q28's signed dictionaries, and the primitive two-successor Q2. This is not a physical history selector or an ARF derivation.

## Exact theorem

Let \(D=(2o_i+s_i)_{i=0}^5\), where \(o\) is a permutation of six axes and \(s_i\in\{0,1\}\). Write \(c_D(h)\) for the corresponding bijection from six-bit histories to canonical icosahedral codes. Let \(Q_2\) have the 128 directed edges \(h\to 2h+b\pmod {64}\), \(b=0,1\). For the 60 original geometric A5 code permutations \(g\), define

\[
S_D=\sum_{g\in A_5}P_g(DQ_2D^{-1})P_g^{\mathsf T}.
\]

There are **80 A5 orbitals** \(\mathcal O\) on ordered pairs of 64 codes. Set
\[
c_{\mathcal O}(D)=\sum_{h=0}^{63}\sum_{b=0}^{1}
 {\bf1}_{\mathcal O}\big(c_D(h),c_D(2h+b\bmod64)\big).
\]
The exact orbital lemma is
\[
(S_D)_{uv}=\frac{60}{|\mathcal O(u,v)|}c_{\mathcal O(u,v)}(D).
\]
Thus \(S_D=S_E\) if and only if their **80 integer orbital edge counts** agree. This is a complete, finite operator criterion, not a comparison of selected traces.

The proper A5 action on the 720 unsigned six-axis orders is free, giving 12 representatives. Exhausting all 64 sign masks for each yields:

| Unsigned A5 order classes | Fibres of identical \(S_D\) within each class |
|---|---|
| 6 classes | 32 inversion pairs |
| 6 classes | 28 inversion pairs and 2 quartets |

There are **no operator collisions between different unsigned-order classes**. Consequently the 768 signed representatives have exactly \(6(32)+6(30)=372\) distinct operators, independently recovering Q40's 372.

Among unordered pairs of sign masks producing the *same* operator, the XOR-mask counts are **63: 384 pairs; 12: 24 pairs; 51: 24 pairs**. Mask 63 is global inversion, mask 12 flips *exactly* digits 2 and 3 (zero-based), and mask 51 is its global-inversion complement. **No other sign mask, and no other two-digit pair, produces an equality** in this fixed-unsigned-order comparison.

The six exceptional unsigned-order representatives and the two seed sign masks in each are:

| Order \(o_0,\ldots,o_5\) | Seed masks |
|---|---|
| (0,1,2,3,4,5) | 5, 16 |
| (0,1,2,3,5,4) | 5, 16 |
| (0,1,2,5,3,4) | 2, 23 |
| (0,1,4,2,5,3) | 1, 20 |
| (0,1,4,5,2,3) | 7, 18 |
| (0,1,4,5,3,2) | 7, 18 |

Each seed \(s\) denotes one quartet \(\{s,s\oplus12,s\oplus63,s\oplus51\}\); all other masks form inversion pairs. The six exceptional order classes and their quartets account for the 12 extra operator coincidences between Q40's eight-orbit classes.

## Why this is *not* a permutation of orbitals

Flipping digits 2 and 3 conjugates the primitive edge set by the canonical-code translation \(\tau_t:c\mapsto c\oplus t\), with \(t=2^{o_2}+2^{o_3}\). **This translation does not permute the 80 A5 orbitals.** For every one of the six exceptional unsigned orders, it splits all 80 orbitals into multiple orbital labels. The suggested orbital-permutation explanation in Q42 is therefore false for the named operators.

Instead the coincidence is a **cancellation of edge counts** under this translation. For the concrete native witness \(o=(0,1,2,3,4,5)\), sign masks 16 and 28, **108 of the 128 individual primitive edges change orbital label**, yet the resulting 80-component orbital-count vectors are exactly equal. The orbital lemma then forces equality of every one of the 4,096 entries of the twirled matrices. The exhaustive 12-by-64 census proves that this cancellation occurs only for the listed masks/orders.

The lemma follows from orbit-stabilizer: each pair in an orbital \(\mathcal O\) occurs exactly \(60/|\mathcal O|\) times in the sum over \(g\). The census is a finite exact proof of the remaining classification; it does not yet give a non-enumerative character-theoretic formula for the exceptional sign patterns.

## Executable evidence

Certificate: \`research_archive/2026-11-11_q42_middle_flip/q42_mask_orbitals.py\`. It imports the **unaltered** original Q3 and Q28 source files and asserts their Git blob SHA-1 values (\`bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984\` and \`6e22cb7654176c6499ee138737f4f85240619ec7\`). It builds the original Q2, all 80 orbitals, 12 unsigned A5 classes, and all 768 sign assignments; every comparison is exact integer arithmetic. It asserts the full fibre census, the XOR-mask counts, the 372 distinct operators, the splitting of all 80 orbitals in each exceptional order, the 108-edge cancellation, and the direct 64-by-64 native-twirl equality.

**Local execution:** Python 3.13.5, NumPy 2.3.5, NetworkX 3.6.1; standalone command \`python research_archive/2026-11-11_q42_middle_flip/q42_mask_orbitals.py\`; exit 0, wall 3.36 s, in GPT's container. The exact committed script blob was locally hash-matched and rerun. CI is not claimed until the new GitHub Actions verdict.

**Next concrete question (Q43 [derive]):** Derive a closed-form A5 orbital/character criterion for the six exceptional unsigned orders and their two seed masks, without enumerating all 64 sign masks; identify the exact cancellation identity on the 128 primitive edges.

**Physical status:** All gates A–F remain open; no fitted constants, measured values, historical ARFs, or physical identifications enter this calculation.

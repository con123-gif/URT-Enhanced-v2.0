# Q24 — K5 for the Q20 pair, and the exact symmetries behind every signed-dictionary collision (2026-11-11)

**Result:** THEOREM + OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Scope: the native Q11 icosahedral hidden-5 quartic face source, its five A4 singlet lines, and the
fixed 64-history chain Q(h → 2h, 2h+1 mod 64). Exact arithmetic in Q(√5); no fitted, measured or
random inputs.

## Setting

A signed dictionary D = (x₀,…,x₅) sends history bit i to axis x_i//2 with sign x_i & 1; the
observable for A4 vacuum t is g_{D,t}(h) = ⟨t, S(index_D(h))⟩. The history bits are a sliding window
of an i.i.d. fair bit stream ε: bit i of h_n is ε_{n−i}. K_n is the n-th stationary cumulant rate of
Σ_n g(h_n); the scale/sign-free invariants are I₂ = K₂/r₂, I₃ = K₃²/r₂³, I₄ = K₄/r₂², I₅ = K₅²/r₂⁵.

## 1. K5 does not separate the Q20 pair (the Queue question)

For D = (0,2,4,6,8,10) and E = (0,2,8,10,7,4) the joint five-vacuum multisets of (I₂, I₃, I₄, I₅)
are identical. The I₅ values, listed with their I₂:

| I₂ | I₅ = K₅²/r₂⁵ |
|---|---|
| 5/6 | 2088113790929/196608000 + (260949866221/55296000)√5 |
| 25/24 | 5305392812087/589824000 + (1776260085613/442368000)√5 |
| 67/48 | 8484905158967/589824000 + (1611852576803/442368000)√5 |
| 33/16 | 24450465761387/98304000 + (3562339699853/32768000)√5 |
| 33/16 | 33935189501987/98304000 + (4612493714453/32768000)√5 |

The K₄ values reproduce Q20 exactly. Each K₅ is checked independently as k₅(S₂₅) − k₅(S₂₄) from
exact finite-time moments (10/10).

## 2. Why: three exact symmetries of the history process

**Lemma 1 (evenness).** Every native vacuum line is even under complementing all six axis bits:
S_t(ȳ) = S_t(y) for all 64 words. (Its Walsh support has weights 2 and 4 only.) Hence the dictionary
inversion I(D) = (x_i ⊕ 1) gives g_{I(D),t} = g_{D,t} pointwise.

**Lemma 2 (reversal).** With rev the 6-bit reversal, rev(succ h) = pred(rev h), i.e. rev Q rev = Qᵀ.
Equivalently g ∘ rev evaluated on the window of ε is g evaluated on the window of the reversed stream
ε'_k = ε_{−k}, which is again i.i.d. So (g(rev h_n))_{n=1..N} is the time reversal of a copy of
(g(h_n))_{n=1..N}, and S_N has **the same law for every N**. Dictionary form: R(D) = (x₅,…,x₀).

**Lemma 3 (alternation).** The stream flip ε'_k = ε_k ⊕ [k odd] is i.i.d. On windows it acts by
h ↦ h ⊕ 101010 at even n and h ↦ h ⊕ 010101 at odd n (these two masks alternate under Q:
succ(h ⊕ 101010) = succ(h) ⊕ 010101 and vice versa). Since 101010 ⊕ 010101 = 111111 and g is even
(Lemma 1), g(h_n ⊕ 101010) = g(h'_n) for every n, so again S_N has the same law for every N.
Dictionary form: S(D) = (x_i ⊕ [i odd]).

These act on history positions, A5 acts on axes (Q11: g_{a·D, a·t} = c · g_{D,t} pointwise, c a
rational normalisation constant), so they commute. ⟨I, R, S⟩ is dihedral of order 8
(RSR = IS, (RS)² = I).

**Theorem.** (i) For every dictionary D and every γ ∈ A5 × ⟨I, R, S⟩ (order 480), the five-vacuum
multiset of finite-N laws of S_N (up to each vacuum's sign/scale) is the same for D and γD. In
particular every joint invariant I_n, every finite-time cumulant and the whole scaled CGF agree.
(ii) The group acts freely on the 46,080 signed dictionaries: exactly **96 orbits of size 480**.
(iii) The joint (I₂, I₃) signature takes 96 distinct values on the orbit representatives
(computed with independent code). Hence the Q15 partition into 96 signature classes **is** the
orbit partition: the K₂–I₃ signature is already a complete invariant, and every one of Q15's 576
non-parity collision pairs persists at every cumulant order and in the exact finite-N law.

**The Q20 pair:** E = a · S(R(D)) for an explicit proper rotation a ∈ A5 (index 37 in the sorted
list), and E is not in the A5 × ⟨I⟩ orbit of D (Q15's non-parity condition).

**Obstruction (consequence).** No statistic of the sum process S_N, at any order and any finite N,
can separate the 96 × 8 = 768 proper-A5 classes beyond 96 classes: the factor 8 = |⟨I,R,S⟩| is
invisible to the history-sum observable. Selecting a dictionary inside an orbit needs an observable
that is not a function of the law of Σ g (e.g. one that sees time orientation, which R exchanges, or
the parity of time, which S uses). The 96-fold residual is what the K₂–I₃ data already separate.

## 3. Execution

`q24_k5_and_history_symmetries.py` (registered `research.q24_history_symmetries`) checks every
statement above exactly and exits non-zero on any failure: native K₂ multiset; K₅ and the finite-time
check; Lemmas 1–3 on all 64 histories; pointwise identities g_{I(D)} = g, g_{R(D)} = g∘rev,
g_{S(D)} = g∘(⊕101010) = g∘(⊕010101); equality of exact finite moments to order 5 at N = 7 under
R, S, RS; the A5 witness for E; the orbit census (96 × 480, closure checked); 96 distinct K₂–I₃
signatures; and an invariance spot check under ⟨I,R,S⟩ and A5 on four orbits.

The source is rebuilt sympy-free in `native_source_nosympy.py`, step for step from Q11. When sympy is
importable (GitHub CI) the certificate also asserts entry-by-entry equality with the original Q11
`vacua`. Executed in Claude's sandbox (Python 3, no sympy, so the Q11 cross-check was skipped
there; 41 s, exit 0). CI pending at commit time.

## What this does not do

It does not select a dictionary, a chronology, or any ARF. It does not say the 96 classes are
physically distinct; it says exactly which freedom any history-sum observable cannot remove.
The earlier exploration of shift-cohomology (Walsh coefficients summed over translates) also
gives all-order equalities but was not needed: the three symmetries above are exact and pointwise.

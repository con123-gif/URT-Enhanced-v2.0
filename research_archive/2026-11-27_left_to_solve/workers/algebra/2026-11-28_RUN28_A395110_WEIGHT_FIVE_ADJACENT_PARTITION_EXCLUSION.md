# Algebra RUN28 — A395110 weight-five adjacent-partition exclusion

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6;
exact serving variant not exposed).  
Status: **one complete dimension-independent exclusion theorem inside the exact RUN25 reduction;
weight five is reduced to one remaining noncanonical partition; no Lean certificate, official
submission, accepted-count change or originality claim.**

## Current preflight and coordination

The live `join.txt` (223 lines), current official `GuillaumeBAUD-coder/open-math-agents/tools/oma.sh`
(Git blob `0e9d771e692b971de2ac36ee450e814655ed5f3b`), repository instructions, current campaign ledger,
`VERIFIED_PROOFS.json`, and all A395110 checkpoints through
`HOURLY_0424_A395110_RIM_THREE_AND_SATURATION.md` were read before acting.  The preflight Cathedral
head was `110d74de060c707ae37f85634e78b0cc3ce67568`.

The latest campaign reconciliation records a new foreign full PR 19800 for A372561.  The archived own
certificate remains valid, but an own duplicate must not be submitted.  The authoritative totals
remain **37** complete archived certificates, **5** upstream checker acceptances, **4** merged and
GitHub-credited full proofs, **1** accepted full proof awaiting merge, and **0** ledger-certified
genuinely-open accepted original discoveries.

The concurrent min-bilinear theorem constructs the expected `2^k` family.  RUN26 proved conditional
boundary rigidity at weight three; RUN27 proved it at weight four.  This note takes the next
nonduplicate mathematical step at weight five.

## Exact binary self-adjoint setup

Under the two still-unproved A395110 structural hypotheses (dihedral symmetry and binary directional
curvatures), RUN25 gives a binary `k x k` matrix `X` with

\[
 HX=X^T H,\qquad H_{ij}=\min(i,j).                           \tag{1}
\]

Write `x^(j)=Xe_j`, let `w=x^(k)`, and put

\[
 z_j=\sum_{r=1}^k r x^{(j)}_r=(HX)_{kj},\qquad z_0=0.       \tag{2}
\]

The first-row and last-row identities in (1) are

\[
 |x^{(j)}|=\sum_{r=1}^k\min(r,j)x^{(1)}_r,                 \tag{3}
\]

and

\[
 z_j=\sum_{r=1}^k\min(j,r)w_r,qquad
 2z_j-z_{j-1}-z_{j+1}=w_j\in\{0,1\}                       \tag{4}
\]

for `1<=j<k`.  In particular, if `B=|w|`, then

\[
 B=\sum_{r=1}^k r x^{(1)}_r.                               \tag{5}
\]

## New theorem

> **Theorem (weight-five adjacent partition is impossible).** If `|w|=5`, the first-column support
> cannot be `{2,3}`.  Consequently a noncanonical weight-five extension, if one exists, must start
> with the sole remaining distinct partition `{1,4}`.  Equivalently, the three possible supports in
> (5) reduce from `{5}`, `{1,4}`, `{2,3}` to `{5}`, `{1,4}`.

### Proof

Assume for contradiction that

\[
 x^{(1)}=e_2+e_3.                                          \tag{6}
\]

Equation (3) yields

\[
 |x^{(1)}|=2,\qquad |x^{(2)}|=4,\qquad |x^{(j)}|=5
 \quad(j\ge3).                                             \tag{7}
\]

Also `z_1=5`.  Relation (4) makes `z_2` either `9` or `10`.  Four distinct positive indices have sum
at least `1+2+3+4=10`, so equality is forced:

\[
 x^{(2)}=e_1+e_2+e_3+e_4,qquad z_2=10.                    \tag{8}
\]

The same argument one step later gives `z_3` equal to `14` or `15`; five distinct positive indices
sum to at least `1+2+3+4+5=15`.  Therefore

\[
 x^{(3)}=e_1+e_2+e_3+e_4+e_5,qquad z_3=15.                \tag{9}
\]

We now prove inductively that for every `3<=j<=k-2`,

\[
 x^{(j)}=e_{j-2}+e_{j-1}+e_j+e_{j+1}+e_{j+2},
 \qquad z_j=5j.                                            \tag{10}
\]

The base is (9).  Suppose (10) holds through column `j`, with `j<=k-3`, and consider
`y=x^(j+1)`.  Pairing `y` with column `j-1` in (1) gives

\[
 (Hy)_{j-1}=(Hx^{(j-1)})_{j+1}=z_{j-1}=5(j-1).             \tag{11}
\]

The vector `y` has five binary ones by (7), and every summand in its left side is at most `j-1`.
Equality in (11) therefore forces all five support indices of `y` to be at least `j-1`.

Meanwhile (4), applied to `z_(j-1)=5(j-1)` and `z_j=5j`, says

\[
 z_{j+1}\in\{5(j+1)-1,\ 5(j+1)\}.                         \tag{12}
\]

But the minimum sum of five distinct indices at least `j-1` is

\[
 (j-1)+j+(j+1)+(j+2)+(j+3)=5(j+1).                         \tag{13}
\]

Thus equality holds in (12)--(13), uniquely forcing the consecutive support in (10) with `j`
replaced by `j+1`.  This proves the induction.

At the boundary, (10) gives `z_(k-2)=5(k-2)` and `z_(k-3)=5(k-3)`.  Relation (4) would therefore
require

\[
 z_{k-1}\in\{5(k-1)-1,\ 5(k-1)\}.                         \tag{14}
\]

However `x^(k-1)` contains five distinct indices chosen from `1,...,k`, so

\[
 z_{k-1}\le k+(k-1)+(k-2)+(k-3)+(k-4)
            =5k-10=5(k-1)-5,                               \tag{15}
\]

contradicting (14).  The smallest possible dimension is `k=5`; there (9) is already the last main
column needed, and (14)--(15) give the same contradiction directly.  Hence (6) is impossible. QED.

## Independent exact challenge

The independently saved certificate
`workers/algebra/A395110_weight5_adjacent_partition_run28.py` (SHA-256
`ae2f444429a6a8266bae5d5481b72667c3f0044b769736c0eead0e6e936a4f0d`) was run for every
`5<=k<=9`.  It generated only binary columns, enforced every already-determined entry of
`HX=X^TH`, and enforced each curvature value in (4).  The first execution correctly failed because
the script's test mistakenly demanded a main column at index `k-1`, the very column the theorem says
cannot exist.  After correcting the assertion boundary from `j<=k-2` to `j<=k-3` (zero-based loop
index), the unchanged mathematical enumeration actually exited `0` and printed:

```text
k=5: prefix counts [1, 1, 1, 0, 0]; final extensions=0
k=6: prefix counts [1, 1, 1, 1, 0, 0]; final extensions=0
k=7: prefix counts [1, 1, 1, 1, 1, 0, 0]; final extensions=0
k=8: prefix counts [1, 1, 1, 1, 1, 1, 0, 0]; final extensions=0
k=9: prefix counts [1, 1, 1, 1, 1, 1, 1, 0, 0]; final extensions=0
```

It found the unique consecutive-five propagation (10), followed by zero admissible penultimate
columns.  This execution challenges edge cases; the proof above is general and does not rely on the
finite range.

## Scope and remaining obstruction

This is a complete exclusion of one of the two noncanonical distinct partitions of five.  It does
not exclude `{1,4}`.  Exact exploration shows that `{1,4}` has a finite traveling-defect state system,
rather than the single consecutive block above; presenting finite calculations as a general proof
would be invalid.  Weight-five boundary rigidity, interior extension uniqueness, dihedral symmetry,
and binary directional curvature therefore remain unresolved.  A395110 is not solved and no formal
campaign count changes.

## RESUME HERE

Prove the `{1,4}` exclusion using its translation-invariant finite state system.  The correct next
certificate is parametric, not another dimension scan: bootstrap the exact reachable prefix states,
prove their normalized transition table is closed under translation, and show every state is killed
by the final two-column boundary.  Only after that symbolic transition proof may weight-five boundary
rigidity be claimed.

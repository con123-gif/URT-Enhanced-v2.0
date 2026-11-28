# Algebra RUN27 — A395110 weight-four boundary rigidity

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6;
exact serving variant not exposed).  
Status: **one new dimension-independent theorem inside the exact RUN25 reduction; no whole-source
Lean certificate, official submission, accepted-count change or originality claim.**

## Current preflight and nonduplication gate

The current `join.txt` (223 lines), official `GuillaumeBAUD-coder/open-math-agents` reference client
`tools/oma.sh` (Git blob `0e9d771e692b971de2ac36ee450e814655ed5f3b`), repository `AGENTS.md`,
current campaign ledger, `VERIFIED_PROOFS.json`, and the latest Algebra checkpoints were read before
acting.  The preflight Cathedral head was
`5aafbc0a9389ec3c0bfee8c652f1a2ef2fa9a2e2`.

The immediately preceding concurrent result
`HOURLY_0324_A395110_MIN_BILINEAR_ENVELOPE.md` constructs an explicit admissible array for every
binary central word and proves the full `2^k` lower bound.  It explicitly leaves the comparison or
upper-bound theorem open.  The argument below addresses that frontier: it eliminates the next
nontrivial boundary partition in *any* binary self-adjoint extension.  It does not duplicate the
construction theorem and does not prove extension uniqueness.

The authoritative formal totals remain **37** complete archived certificates, **5** actual upstream
checker acceptances, **4** merged/GitHub-credited full proofs, **1** accepted full proof awaiting
merge, and **0** ledger-certified genuinely-open accepted original discoveries.

## Exact setup inherited from RUN25

Continue under the two still-unproved structural hypotheses for A395110: dihedral symmetry of the
array and binary directional curvatures.  On the `k x k` half-grid, RUN25 reduced the problem exactly
to a binary matrix `X` satisfying

\[
 HX=X^T H,\qquad H_{ij}=\min(i,j),                            \tag{1}
\]

with central word `w=Xe_k`.  Put `x^(j)=Xe_j`.  The first row of `H` and the last row of `H` give

\[
 |x^{(j)}|=\sum_{r=1}^k\min(r,j)x^{(1)}_r,                   \tag{2}
\]

and, on defining

\[
 z_j:=\sum_{r=1}^k r x^{(j)}_r=(HX)_{kj},\qquad z_0:=0,
\]

symmetry in (1) gives

\[
 z_j=(HX)_{jk}=\sum_{r=1}^k\min(j,r)w_r,
 \quad 2z_j-z_{j-1}-z_{j+1}=w_j\in\{0,1\}                 \tag{3}
\]

for `1<=j<k`.  If `B=|w|`, then (2) at `j=k` says

\[
 B=\sum_{r=1}^k r x^{(1)}_r.                                \tag{4}
\]

RUN26 proved directly that `B=3` forces `x^(1)=e_3`.  We now settle the next ambiguous weight.

## New theorem

> **Theorem (weight-four boundary rigidity).** If `|w|=4`, then `x^(1)=e_4`.  Consequently the
> half-edge is `f(1,j)=min(4,j)`.  Under the assumed reflections, every full outer edge is
> `1,2,3,4,...,4,3,2,1`; its corners are `1` and its rim maximum is `4`.

### Proof

Because `x^(1)` is binary, (4) expresses `4` as a sum of distinct positive integers.  Its support is
therefore either `{4}` or `{1,3}`.  Suppose for contradiction that

\[
 x^{(1)}=e_1+e_3.                                           \tag{5}
\]

Equation (2) then gives

\[
 |x^{(1)}|=2,\qquad |x^{(2)}|=3,\qquad |x^{(j)}|=4\ (j\ge3), \tag{6}
\]

while `z_1=4`.  By (3), `z_2` is either `7` or `8`.  The three-element subsets of the positive
integers with either of these sums are exactly

\[
 \{1,2,4\},\qquad \{1,2,5\},\qquad \{1,3,4\}.              \tag{7}
\]

(A set using an index greater than `k` is simply unavailable.)  If the support of `x^(2)` were one
of the first two sets, then

\[
 (Hx^{(2)})_3=6.
\]

Symmetry of `HX` would force `(Hx^(3))_2=6`.  But `x^(3)` has four distinct binary ones by (6), and
the minimum of `sum_r min(2,r)x^(3)_r` is `1+2+2+2=7`.  Hence only the last set in (7) is possible:

\[
 x^{(2)}=e_1+e_3+e_4,\qquad z_2=8.                          \tag{8}
\]

We claim inductively that, whenever `2<=j<=k-2`,

\[
 x^{(j)}=M_j:=e_{j-2}+e_{j-1}+e_{j+1}+e_{j+2},
 \qquad z_j=4j,                                             \tag{9}
\]

where the displayed formula for `j=2` is interpreted as the already proved special case (8).

Assume the main pattern has been proved through column `j-1`, with `j>=3`.  Pairing column `j` with
columns up to `j-2` in (1) shows

\[
 (Hx^{(j)})_{j-2}=4(j-2).
\]

Since `x^(j)` has four ones and every summand is at most `j-2`, all four support indices are at least
`j-2`.  Pairing with `M_(j-1)` gives

\[
 (Hx^{(j)})_{j-1}=(HM_{j-1})_j=4j-5,
\]

so exactly one support index is `j-2`.  Finally (3), together with
`z_(j-2)=4(j-2)` and `z_(j-1)=4(j-1)`, says that `z_j` is `4j-1` or `4j`.
There are therefore only three possibilities:

\[
\begin{aligned}
 B_j&=\{j-2,j-1,j,j+2\}       &&(z_j=4j-1),\\
 F_j&=\{j-2,j-1,j,j+3\}       &&(z_j=4j),\\
 M_j&=\{j-2,j-1,j+1,j+2\}     &&(z_j=4j).                 \tag{10}
\end{aligned}
\]

If `j<=k-2`, column `x^(j+1)` exists.  Pairing it with the earlier main columns first forces all four
of its support indices to be at least `j-1`.  Thus

\[
 (Hx^{(j+1)})_j\ge (j-1)+j+j+j=4j-1.                       \tag{11}
\]

For either `B_j` or `F_j`, however, clipping its last support index at `j+1` gives

\[
 (HB_j)_{j+1}=(HF_j)_{j+1}=4j-2.
\]

This contradicts (1) and (11).  Hence only `M_j` extends, completing the induction.

It remains to observe that the induction cannot reach the boundary.  After `z_(k-2)=4(k-2)`, the
binary curvature relation (3) demands

\[
 z_{k-1}\in\{4(k-1)-1,\ 4(k-1)\}.                          \tag{12}
\]

Yet `x^(k-1)` has four distinct ones in a vector of length `k`, so its weighted index sum is at most

\[
 k+(k-1)+(k-2)+(k-3)=4k-6=4(k-1)-2,                        \tag{13}
\]

strictly below both values in (12).  This contradiction also covers the smallest case `k=4`, where
(8) is the induction base and (12)--(13) apply immediately.  Thus (5) is impossible and
`x^(1)=e_4`.

Equation (2) now gives `|x^(j)|=min(4,j)`, which is the asserted half-edge.  The full edge statement
follows from the still-explicitly-assumed reflections.  QED.

## Independent executable edge-case challenge

After the derivation, the unchanged RUN25 exhaustive certificate was replayed:

```text
python3 research_archive/2026-11-27_left_to_solve/workers/algebra/A395110_h_selfadjoint_certificate_run25.py
```

It actually exited `0` in 2.89 seconds and enumerated exactly `2^k` binary `H`-self-adjoint
extensions for every `1<=k<=7`, one per last-column word, with zero reconstructed nonbinary `C`
matrices.  In particular no weight-four extension had the excluded `{1,3}` first-column support.
This is a regression/edge-case check only; the dimension-independent argument above is the proof.

## Scope and comparison with existing work

This theorem eliminates the only nontrivial distinct-part partition of the boundary weight four.
Together with RUN26 it proves boundary rigidity for `B<=4` inside the exact binary
`H`-self-adjoint reduction.  It is consistent with, but logically distinct from, the concurrent
min-bilinear construction: that construction supplies an admissible tent-boundary solution for every
word, whereas this result proves that no alternative boundary partition can occur at weight four in
any extension satisfying (1).

It does **not** prove uniqueness of the interior extension, the general `B` support-rigidity theorem,
dihedral symmetry, or binary directional curvature for arbitrary source arrays.  It therefore does
not solve A395110 and does not change any formal or accepted-problem count.

## RESUME HERE

Generalize the traveling-support argument.  For a nontrivial distinct partition of general
`B=sum r*x^(1)_r`, use the binary curvature of the weighted column sums `z_j` to propagate its
rightmost defect.  The weight-four proof shows the useful invariant: after the main columns force
`z_j=Bj`, every alternative support loses at least two units under the next clipping equation, while
the following binary column can lose at most one.  A successful general version, combined with the
min-bilinear construction, would settle boundary rigidity for every rim maximum; interior extension
uniqueness and the two unconditional structural hypotheses would still remain.

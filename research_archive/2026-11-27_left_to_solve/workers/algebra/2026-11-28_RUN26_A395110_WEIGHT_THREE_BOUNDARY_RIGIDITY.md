# Algebra RUN26 — A395110 weight-three boundary rigidity

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6;
exact serving variant not exposed).  
Status: **one new general theorem inside the exact RUN25 reduction; one official full-proof merge
reconciled; no new whole-source Lean certificate or originality claim.**

## Current preflight and official state

The complete current `join.txt`, official `tools/oma.sh`, `AGENTS.md`, current ledger,
`VERIFIED_PROOFS.json`, source audits and Algebra resume records were read before acting.  The live
`join.txt` SHA-256 was `b51ebcb7b38c38770727c0bc3f200f08e698065facb09b8ef0dc93c379eca174`
(245 lines); the official client remained
`3d22a8b0b90f4f09113b9952a2329aeb1ee7e33ba4b06920746f7547116df7a6` (356 lines).
The Cathedral preflight head was `174e50d3ed3473d2bf8d32f0b70aee1c772c218e`.

A329813 full disproof PR 13332 actually merged at `2026-11-28T02:12:52Z`, merge commit
`0a02f00c3f1333fee90981edaa191f70a21393ce`, with the official main proof present.  Therefore the
authoritative formal totals are now **37** complete archived certificates, **5** own full-proof/disproof
PRs, **5** actual upstream checker acceptances, **4** merged/GitHub-credited full proofs, and **0**
ledger-certified genuinely-open accepted original discoveries.  Public-site leaderboard refresh is
separate and was not inferred.

Fresh campaign records also show foreign full PRs after the corresponding statement merges for
A181674/16995, A372556/17012 and MO430643/17716; own duplicates remain withheld.  A372561 remains the
clean observed exact-target lane, but fixture commit `dad8786dc7d4bb9cf7ec37a74f1bd23897170caa`
still has no actual Actions run or combined status.  No repeated push, workflow edit, imported PASS,
lease or official proof PR was invented.

## Setup from RUN25

Assume the two still-unproved structural assertions for the upper-Laplacian-2 square problem:

1. full dihedral symmetry of the integer solution `f`;
2. binary vertical and horizontal directional curvatures.

On the upper-left `k x k` quadrant, RUN25 proved the exact conjugation

\[
 X=U^{-1}CU,\qquad C=UXU^{-1},\qquad HX=X^TH,                 \tag{1}
\]

where `U_ij=1` for `i<=j`, `H=U^TU` and `H_ij=min(i,j)`.  The curvature matrix `X` is binary.  If
`w=Xe_k` is its last column, then

\[
 \lambda=C\mathbf 1=Uw,
 \qquad \lambda_i=\sum_{r=i}^k w_r.                           \tag{2}
\]

Write `x^(j)=Xe_j` for column `j` of `X`, and `|x|` for its number of ones.  Since the first row of
`H` is all ones, the `(1,j)` entry of `HX=X^TH` gives

\[
 |x^{(j)}|=\sum_{r=1}^k \min(r,j)x^{(1)}_r.                  \tag{3}
\]

The quadrant top-edge values are exactly the left side of (3):
`f(1,j)=R_1(j)=|x^(j)|`.

## New theorem: weight-three forces the tent boundary

> **Theorem.** Suppose `|w|=3`.  Then `x^(1)=e_3`.  Consequently
> `f(1,j)=min(3,j)` on the half-edge.  After the assumed reflections, every full outer edge is
> `1,2,3,...,3,2,1`; in particular every rim corner is `1` and the rim maximum is `3`.

### Proof

Putting `j=k` in (3) gives

\[
 3=|w|=\sum_{r=1}^k r x^{(1)}_r.                             \tag{4}
\]

Because `x^(1)` is binary, its support is either `{3}` or `{1,2}`.  It remains to rule out `{1,2}`.

Assume for contradiction that `x^(1)=e_1+e_2`.  Equation (3) then says

\[
 |x^{(1)}|=2,\qquad |x^{(j)}|=3\quad(j\ge2).                 \tag{5}
\]

The `(2,k)` entry of (1) reads

\[
 \sum_r r x^{(2)}_r
 =\sum_r\min(2,r)w_r=6-w_1.                                 \tag{6}

\]

Column `x^(2)` has three distinct binary ones, so its weighted sum is at least `1+2+3=6`.
Equation (6) therefore forces `w_1=0` and equality throughout, hence

\[
 x^{(2)}=e_1+e_2+e_3.                                      \tag{7}

\]

We now prove inductively that, for `2<=t<=k-1`,

\[
 x^{(t)}=e_{t-1}+e_t+e_{t+1},
 \qquad w_1=\cdots=w_{t-1}=0.                               \tag{8}

\]

The base `t=2` is (7) together with `w_1=0`.  Suppose (8) holds at `t`, with `t<=k-2`.
For `t=2`, direct subtraction of (7) and the assumed first column gives
`C e_2=U(x^(2)-x^(1))=Ue_3`, so column 2 of `C` has ones exactly in rows `1,2,3`.
For `t>2`, the induction formulas at `t-1,t` give

\[
 C e_t=U(x^{(t)}-x^{(t-1)})
      =U(-e_{t-2}+e_{t+1}),                                 \tag{9}

\]

which has ones exactly in rows `t-1,t,t+1`.  Since `C` is symmetric, row `t` has the same
three-one pattern.  For every `j`,

\[
 C_{tj}=\sum_{r\ge t}(x^{(j)}_r-x^{(j-1)}_r).               \tag{10}

\]

All columns numbered at least 2 have weight 3 by (5).  Thus (10) says that, at `j=t+1`, the number
of ones of `x^(j)` in positions below `t` drops by one, while for all later `j` it stays fixed.  At
column `t`, (8) has exactly one such one, at `t-1`.  Hence

\[
 x^{(j)}_1=\cdots=x^{(j)}_{t-1}=0\quad(j\ge t+1).            \tag{11}

\]

In particular the last column has `w_1=...=w_{t-1}=0`.  The `(t+1,k)` entry of (1) now gives

\[
 \sum_r r x^{(t+1)}_r
 =\sum_r\min(t+1,r)w_r=3(t+1)-w_t.                          \tag{12}

\]

By (11), the three ones of `x^(t+1)` occur at indices at least `t`; their weighted sum is therefore
at least `t+(t+1)+(t+2)=3(t+1)`.  Equation (12) forces `w_t=0` and equality, so
`x^(t+1)=e_t+e_(t+1)+e_(t+2)`.  This closes the induction.

At `t=k-1`, the induction invariant (8) itself says `w_1=...=w_(k-2)=0` (including the small case
`k=3`, where this is already the base case).  But `w` is binary and has three ones, while only
positions `k-1,k` remain—a contradiction.  Therefore the support
`{1,2}` in (4) is impossible, and `x^(1)=e_3`.

Finally (3) gives `f(1,j)=|x^(j)|=min(3,j)`.  Dihedral reflection produces the stated full-edge
tent.  QED.

The proof also covers the small-dimension boundary automatically: a word of weight 3 requires
`k>=3`.

## Significance and exact limitations

This theorem explains, without finite extrapolation, the rim-3 profile observed in every exact square
enumeration: `1,2,3,...,3,2,1`.  It upgrades the RUN25 equation by eliminating the only non-tent
partition of the weighted corner total `3`.  The argument is genuinely dimension-independent.

It does **not** prove the full binary `H`-self-adjoint extension theorem, does not count the
weight-three interiors, and does not establish the two structural hypotheses unconditionally.
Therefore it is not a solution of A395110 and adds no certificate or accepted-problem count.

## RESUME HERE

1. Generalize the weighted-support induction: for general `B=|w|`, prove that the first-column
   support is `{B}` rather than a nontrivial distinct-part partition of `B`.  The weight-three proof
   handles the first genuinely ambiguous partition.
2. Then prove uniqueness of the remaining binary extension with prescribed last column, or isolate a
   smaller induction invariant using the tridiagonal inverse of `H`.
3. Preserve the unconditional obligations: dihedral symmetry and binary directional curvature.
4. Continue read-only monitoring of the A372561 exact imported fixture; no official proof submission
   without an actual strict imported-target execution and fresh race/coordination gates.

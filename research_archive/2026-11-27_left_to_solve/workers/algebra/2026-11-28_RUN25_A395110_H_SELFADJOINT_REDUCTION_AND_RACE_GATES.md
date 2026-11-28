# Algebra bot RUN25 — A395110 binary self-adjoint extension equation and fresh race gates

Date: 2026-11-28 UTC  
Owner/credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (base model GPT-6; exact serving variant not exposed).  
Status: **one exact general algebraic reduction and one corrected exhaustive challenge; two new duplicate-withhold gates; no certificate or accepted-count change.**

## Current preflight and official state

The complete current `join.txt`, official `tools/oma.sh`, repository instructions, campaign ledger,
verified-proof registry and Algebra resume records were read before acting.  At preflight the Cathedral
head was `b1af15146d35caa84ed4662b87fc762f7f578169`; `join.txt` SHA-256 was
`2e1363ddb7f27877753cfabe851128d825e4891e5106006711a5ac5d10530f21` and the official client
SHA-256 was `3d22a8b0b90f4f09113b9952a2329aeb1ee7e33ba4b06920746f7547116df7a6`.
The authoritative totals remain **37** complete archived certificates, **5** own full-proof/disproof
PRs, **5** actual upstream checker acceptances, **3** merged/publicly credited full proofs, and **0**
ledger-certified original accepted discoveries.

Fresh metadata established two new registration merges and two new foreign full-proof races:

- A372556 registration PR 12938 merged at `2026-11-28T01:22:37Z`; foreign full PR 17012 was then
  created at `01:31:44Z`.  Withhold an own duplicate.
- A181674 registration PR 12808 had already merged at `01:03:13Z`; foreign full PR 16995 was created
  at `01:30:35Z`.  Withhold an own duplicate.
- A372561 registration PR 12868 remains the clean observed full-proof-stage target.  Its exact imported
  fixture commit `dad8786dc7d4bb9cf7ec37a74f1bd23897170caa` still had **zero** Actions runs.  The two earlier
  MO513259 commits likewise still had zero runs.  No extra retrigger, workflow modification, lease,
  imported PASS, or full-proof PR was fabricated.
- Own full PRs 10139/MO198816 and 13332/A329813 remain open and unmerged.  The formal acceptance and
  public-credit counts therefore do not change.

## A395110: the exact conjugation missed by the previous reduction

Continue under the two still-unproved structural hypotheses from RUN24: dihedral symmetry of `f` and
binary directional curvatures.  On the `k x k` quadrant let

\[
 C_{ij}=f(i,j)-f(i-1,j)-f(i,j-1)+f(i-1,j-1),\qquad
 R_i(j)=\sum_{b\le j}C_{ib}.
\]

The curvature hypotheses say that the **prefix-gap matrix**

\[
 X_{ij}=\begin{cases}R_i(j)-R_{i+1}(j),&i<k,\\R_k(j),&i=k\end{cases}
\]

is binary.  Let `U` be the upper-triangular all-ones matrix,
`U_ij = 1` when `i<=j`.  Prefix summation and downward differencing are inverse operations, hence

\[
 R=CU,\qquad X=U^{-1}CU,\qquad C=UXU^{-1}.                 \tag{1}
\]

This is exact over the integers; **it does not assume that `C` is binary**.  Since transpose symmetry
of `f` gives `C=C^T`, multiplying the equality
`UXU^{-1}=(U^{-1})^T X^T U^T` on the left by `U^T` and on the right by `U` yields the decisive equation

\[
 \boxed{\ H X=X^T H,\qquad H=U^TU,\quad H_{ij}=\min(i,j).\ }       \tag{2}
\]

Conversely, every binary `X` satisfying (2) reconstructs through (1) an integer symmetric `C` with
exactly the required binary prefix gaps.  Thus (1)--(2) are an equivalence, not a premise weakening.

The central curvature word is literally the last column:

\[
 w=Xe_k.
\]

Also `U^{-1} 1=e_k`, so the row-sum vector of `C` is forced without a separate argument:

\[
 \boxed{\ \lambda=C1=UXe_k=Uw,\qquad
          \lambda_i=\sum_{r=i}^k w_r.\ }                         \tag{3}
\]

Therefore the conditional uniqueness obligation is now the following clean binary extension theorem:

> For each `w in {0,1}^k`, there is at most one binary matrix `X` with last column `w` satisfying
> `H X = X^T H`, where `H_ij=min(i,j)`.

This corrects an important scope mismatch in RUN24.  Its finite script enumerated only binary matrices
`C`, while the stated reduction allowed integer `C`.  Binary `C` is neither assumed nor needed in the
correct formulation: binary **X** is what the curvature hypotheses supply.  Whether (2) forces the
reconstructed `C` itself to be binary in every dimension remains a consequence to prove, not an input.

The exact backtracking certificate
`A395110_h_selfadjoint_certificate_run25.py` enumerates every binary column of `X`, reconstructs each
column of `C=UXU^{-1}`, and prunes only by already-fixed symmetry entries.  It actually exited zero and
found, for every `1<=k<=7`, exactly `2^k` symmetric extensions, one for each last-column word, with no
nonbinary reconstructed `C`.  This validates the corrected model and the conjectured extension theorem
in those dimensions.  It is deliberately not presented as the missing general proof.

The classical fixed-margin binary-matrix literature was also checked for a ready-made theorem.  In
particular, Richard A. Brualdi's survey *Matrices of Zeros and Ones with Fixed Row and Column Sum
Vectors* (Linear Algebra Appl. 33 (1980), 159--231) constructs canonical matrices and studies monotone
partial row-sum vectors.  Its quoted results do not directly prove the binary `H`-self-adjoint extension
statement above, so no literature theorem was silently substituted.

## Remaining exact obligations and RESUME HERE

1. Prove or refute the binary extension theorem `HX=X^TH`, `Xe_k=w`.  A larger finite enumeration is
   not a substitute.  A promising route is induction using the tridiagonal inverse of the Brownian
   covariance matrix `H`; preserve the binary constraints at the induction boundary.
2. Even after that theorem, the original A395110 upper-2 square conjecture still needs unconditional
   proofs of dihedral symmetry and binary directional curvature.  Preserve both obligations.
3. Read-only monitor A372561's exact imported fixture.  Submit only after an actual strict imported
   checker pass, a fresh all-state proof race, and valid current coordination.  Do not duplicate foreign
   full PRs 16995/17012 or the previously recorded races.

No new Lean certificate, official full-proof acceptance, public merge credit, or originality count is
claimed here.

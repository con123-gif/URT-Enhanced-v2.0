# MO310296 — candidate affirmative solution by semidefinite duality

> **KNOWN PRIOR RESULT — no new open-problem count.** A complete general affirmative solution already appears in LDJAI's manuscript linked from [statement PR1832](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/1832), created 27 November2026 at02:35:02UTC. [Exact TeX at71185716](https://github.com/LDJAI/open-math-agents/blob/71185716f56c94bf427e8dc9475406ac3267c7d6/lyapunov-trace.tex) (commit time00:06:15UTC) proves the full real-Hurwitz/PSD-Q/PD-P equality, with a minimax and invariant-range argument. Independent source and full-manuscript review confirmed exact scope. No foreign full Lean acceptance was observed; its Lean file explicitly verifies components. Our SDP derivation below is an independent proof of this already-solved question. It remains unformalized, unsubmitted and excluded from genuinely new resolutions. The original candidate text is retained as a transparent work record. A fresh all-state PR/manuscript gate should have preceded this derivation.

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not exposed), 27 November 2026.

STATUS: COMPLETE CANDIDATE INFORMAL ARGUMENT; independent mathematical/source/prior review in progress. NOT Lean verified, NOT an official submission, NOT an accepted problem, and no novelty or priority certificate. Original source: https://mathoverflow.net/questions/310296 . The cached full question has zero answers and six comments; fresh catalogue/submission/literature gates are still required.

## Exact question and interpretation

For a real Hurwitz-stable n by n matrix A, n>=1, can one choose Q>=0 so that its unique Lyapunov solution P>0 to AP+PA^T=-Q satisfies

    -2 trace(A) = trace(Q)/lambda_max(P) ?

The source uses transpose and the real symmetric positive-(semi)definite interpretation. This field interpretation must be checked before a formal statement. We do not claim an answer for a different complex/transposed convention.

Write L(P)=-AP-PA^T on the real symmetric matrices and C=-2 trace(A)>0. The standard Hurwitz/Lyapunov theorem gives a positive definite H with L(H)=I. Choose epsilon>0 small enough that 0<epsilon H<I; this is a strict feasible point below.

## The primal and dual programs

Consider the finite-dimensional semidefinite program

    p* = max trace(L(P))
         subject to P>=0, I-P>=0, L(P)>=0.

Its feasible set is compact, so its maximum is attained. It is strictly feasible by epsilon H.

With the trace inner product, L*(R)=-A^T R-RA. A dual program is

    d* = min trace(X)
         subject to Y>=0, X>=0, X-L*(I+Y)>=0.

Indeed, adding nonnegative multipliers gives

    trace(L(P))+trace(Y L(P))+trace(X(I-P))
      = trace(X)+trace((L*(I+Y)-X)P),

which is at most trace(X) under the stated dual inequalities. The PSD constraint on P yields the last inequality. Equivalently, a third PSD multiplier Z satisfies X=L*(I+Y)+Z.

This dual is also strictly feasible: take Y=I and X=tI for t sufficiently large. Standard semidefinite strong duality under strict feasibility therefore gives p*=d*. A primary statement of this theorem is being checked; it is not a new axiom or a claimed Lean result.

## Matching trace bounds

For any positive definite primal-feasible P, put Q=L(P). Cyclicity of trace gives

    trace(P^(-1)Q) = C.

Since 0<P<=I, P^(-1)>=I. With Q>=0, this implies trace(Q)<=C. For a possibly singular feasible P, mix it with the strictly feasible point, apply this bound, and pass to the limit. Thus p*<=C.

For a dual-feasible pair put R=I+Y>=I and S=L*(R). Then 0<R^(-1)<=I and cyclicity gives

    trace(R^(-1)S)=C.

Because X-S>=0 and X>=0,

    C <= trace(R^(-1)X) <= trace(X).

Thus d*>=C. Strong duality now forces

    p*=d*=C.

This step proves the value of the program; it is not merely a reformulation of the original open question.

## Why an optimizer is positive definite

Let P maximize the primal and Q=L(P), so trace(Q)=C. Suppose P is singular. If P=0, trace(Q)=0<C, a contradiction.

Otherwise choose an orthogonal basis with P=diag(P1,0), P1>0. The lower diagonal block of Q is zero. Positivity of Q forces its cross blocks to be zero; because P1 is invertible, this forces the lower-left block of A to be zero. Thus

    A = [[A1,A12],[0,A2]],
    Q = diag(-A1 P1-P1 A1^T,0).

Both A1 and the nonempty A2 are Hurwitz, since their spectra comprise that of A. In particular trace(A2)<0. Applying the same trace bound on the range of P gives

    trace(Q) <= -2 trace(A1)
             < -2 trace(A1)-2 trace(A2)=C,

contradiction. Therefore every optimizer with value C is positive definite.

Finally, for this optimizer, lambda_max(P)<=1 and trace(Q)=C. The original trace inequality implies C>=C/lambda_max(P), so lambda_max(P)>=1. Hence lambda_max(P)=1 and the desired equality holds.

## Required challenge and next steps

1. Independently check the dual signs, strong-duality hypotheses, approximation of singular feasible points, and invariant-range argument.
2. Refresh the exact source, all comments/revisions, current catalogue status, all-state official PRs and relevant primary literature. Do not assert worldwide novelty.
3. Inspect available Lean support for matrix positivity, Hurwitz/Lyapunov solvability and finite-dimensional semidefinite strong duality. A certificate cannot assume these as unproved custom axioms.
4. Construct and execute a full exact-target Lean certificate before counting or official submission. This note adds ZERO to accepted or kernel-checked totals.

Independent AI reviewers Number and Combinatorics have received this entire argument for challenge. No correspondence to the source author or official claim has been made.

# Complete disproof of the nonnegative rank decomposition question

Original question: Turbo, MathOverflow 290383, January 10, 2018,
https://mathoverflow.net/questions/290383/what-is-this-matrix-decomposition-called-and-does-it-exist-always-ii .
Source text is CC BY-SA 3.0. Research credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (model disclosure supplied by submitting session).

## Exact source audit

The complete source consists of two paragraphs. The mathematical question is whether every entrywise nonnegative rational n-by-n matrix of rank 2r can be expressed as M=P-Q, where P and Q are entrywise nonnegative rational matrices with ordinary rank at most r. The second paragraph links an earlier unrestricted-matrix variant and explicitly says its old counterexample does not work for a nonnegative input.

Current StackExchange API retrieval in this session reports answer_count=0 and is_answered=false. The source comments and answers endpoints returned empty item arrays. GitHub search for `repo:GuillaumeBAUD-coder/open-math-agents mo-290383` returned no submissions. These are current retrieval results, not an exhaustive mathematical literature novelty proof. No new-conjecture or priority claim is made.

The exact formalization quantifies every natural n,r and every matrix M over Q, including r=0. Nonnegative means entrywise nonnegative. Matrix.rank is the usual rank over Q, not nonnegative factorization rank.

## Complete mathematical disproof

Take n=2,r=1,M=I_2. This matrix is nonnegative rational and has rank2. Suppose M=P-Q with the requested rank and positivity conditions. Then P=I_2+Q. Since P and Q are two-by-two matrices of rank at most1, det(P)=det(Q)=0. Direct determinant expansion gives

    det(I_2+Q)-det(Q)=1+Q_00+Q_11.

The left side is zero, while the right side is at least1 because Q is entrywise nonnegative. This contradiction disproves the entire universal statement. Nonnegativity of P is unnecessary for the contradiction, so the counterexample satisfies an even stronger obstruction.

## Independent exact check and Lean status

Python/SymPy expanded a symbolic two-by-two matrix and verified the determinant identity exactly, with an assertion that exits on failure. This is a mathematical certificate, not a Lean kernel check.

The statement is `scout_work/mo290383_statement.lean`; the separate complete disproof is `scout_work/mo290383_disproof.lean`. They have no proof holes except the one mandatory statement placeholder. Kernel verification is pending. The proof uses only the source definitions, rank_of_det_ne_zero, the two-by-two determinant formula, entrywise equality and rational arithmetic. It never imports the source theorem as a premise.

## Official coordination

A live official lease was obtained via curl under con123-gif, agent=codex, role=lead, task=formalize, with no other current agents. The lease token is stored privately and must not be committed. A PLAN note was posted explaining the full counterexample and the statement-first then proof-after-merge pipeline. Parent session handles checker execution and upstream submissions. No acceptance is claimed in this note.

RESUME HERE: compile the statement and complete disproof against the exact pinned formal-conjectures/Mathlib checker; submit the statement, then submit the unchanged checked exact-target disproof after statement merge under a live proof lease.

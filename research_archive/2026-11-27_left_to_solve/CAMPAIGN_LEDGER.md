# Left to Solve campaign ledger

Owner: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (Codex, GPT-6.2).
Date: 27 November 2026. Status: WORK IN PROGRESS; no completion claim.

## Confirmed total

**0 / 20 accepted distinct proof or disproof submissions confirmed for this owner.**
No new proof PR submitted in this interactive session as of this checkpoint.
Statements, research notes, reductions, and other contributors' results do not count.
The live public solved feed was retrieved and filtered for `con123-gif`: no entries.
The hourly Left to Solve bot remains enabled on its existing schedule; RH workers
and their schedules are unchanged. Independent lanes must check this record and
live desk/team notes before claiming the same target.

## Existing official contributions and current verdicts

| Problem | Exact task | Official record | Current evidence | Counts |
|---|---|---|---|---|
| opg-inequality-for-square-summable-complex-series | State Retkes's inequality for square-summable complex sequences, with positive input indexing | [PR 6725](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/6725) | REJECTED by lint: theorem binders must be inside the statement after the colon; also another statement is now on main. Previously published 2013 proof is acknowledged. | No |
| oeis-a401895 | For all natural n > 3, n times its decimal reversal has more than one distinct digit | [desk note 33408 / workflow](https://github.com/con123-gif/open-math-agents/actions/runs/46008655704) | Research note acknowledged; partial carry certificate, no full Lean proof | No |
| opg-distribution-and-upper-bound-of-mimic-numbers | Exact histogram recursion and classification of first hitting times for radix M >= 2, 0 < D <= M | [PR 6800](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/6800) | ACCEPTED STATEMENT, authored by @rleshner, merged 1814ed2772d3e98896bbf8e1aba95342c6658b79 | No; third party, statement only |

## Active substantive work

| Problem | Exact mathematics | Result | Verification | Submission / obstruction |
|---|---|---|---|---|
| oeis-a134799 | b(0)=1/3; b(n+1)=(3/2)b(n)(1-b(n)^2). Show reduced denominator den(b(n)) = 3 * 3^((3^n-1)/2), for every natural n | Complete informal induction and Lean candidate. Put t=(3^n-1)/2; represent b=p/3^(t+1), 3 does not divide p. For D=3^(t+1), p(D^2-p^2)=2r with 3 not dividing r, so b(next)=r/3^(3t+2); t(next)=3t+1. | Exact rational checks n=0..7 executed locally by number-theory lane. Lean candidate not yet compiled at this checkpoint. Exact pinned remote check queued from fork commit b5cf1a83eaa011f54a4da372f1de8f5cca4e571e. | Statement PR 6724 merged, credited @senamakel. No duplicate proof found at initial check. Live brief still temporarily said formalize; do not submit a replacement statement. |
| oeis-a401895 | Remaining Round 10 candidates: decimal length L=33k, k>=7, endpoints 7/8, n*rev(n)=(2/3)(10^(2L)-1) | Independently replayed prior certificate, then proved stronger necessary condition k mod 9 in {0,2,5,8}. | Python exact certificate executed. Since n=rev(n) mod9 and 3 divides n, product mod81 is in {0,9,36,63}. Repdigit C_L=6(10^(2L)-1)/9 satisfies C_L=66L+27L(L-1) mod81. With L=3s this is 36s, giving L mod27 in {0,3,12,21}. | Partial result only; remaining infinite cases open. No Lean claim or accepted solution. |

## Infrastructure and source integrity

Read live join.txt, reference tools/oma.sh, tools/lint.py and tools/check.sh.
Public reads and the official curl desk route work in this environment. Python
urllib returned HTTP 403; it was not used for desk mutations. A curl claim attempt
for A037250 returned HTTP 409 already_solved, with no lease issued; no duplicate PR.

An isolated fork verifier is now running on branch `oma-campaign-20261127`.
[Warm-up run 46012323274](https://github.com/con123-gif/open-math-agents/actions/runs/46012323274)
completed successfully, downloading the official environment; it checked no theorem.
Pin: formal-conjectures 9097e2f90e66d2f6244209cb1c07f7120d17ec53,
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Do not mistake infrastructure success for proof acceptance.

The odd-length carry-free theorem in Round 10 has prior literature:
Ezerman, Meyer and Sole, *On Polynomial Pairs of Integers*,
Journal of Integer Sequences 18 (2015), Article 15.3.5, Proposition 14.
The independent lane recovered https://cs.uwaterloo.ca/journals/JIS/VOL18/Ezerman/eze3.pdf.
Its general carry-free Conjecture 11 would imply the remaining decimal question,
but it is not a theorem in that paper. Do not claim the odd-length argument novel.

## Duplicate and source-resolution exclusions

Skipped known pending/accepted proof targets A010845 (6442), A037250 (6655),
A051960 (6444), A057015 (7050), A126674 (6675), A155559 (6999),
A158623 (7108), A341254 (6795/6818), MSE4452078 (6640),
MO184507 (6605), MO204379 (6364), and other targets identified by lanes.
Source audits found MO151738 and MO247291 answered in source comments/answers;
MO291544 has the determinant-lemma solution in comments; OEIS A195507 was
resolved in 2011. A low-scoring answer or absent accepted answer is not evidence
of a genuinely unsolved problem. No novelty or campaign credit is claimed for these.

## RESUME HERE

1. Read exact pinned checker output for A134799 on fork branch above; repair and
   rerun until kernel and axiom audit actually pass.
2. Recheck competing submissions and live target, obtain one valid proof lease,
   post PLAN, submit exactly one new proofs/oeis-a134799.lean file if still eligible.
3. Monitor actual upstream verdict. Update this ledger with proof commit, run,
   PR, accepted merge, public attribution and precise count; then continue.
4. Preserve and publish the A401895 independent review as a research note only.

No background execution beyond real scheduled bot runs or observed workflow runs
is promised. Work proceeds within each available session budget.

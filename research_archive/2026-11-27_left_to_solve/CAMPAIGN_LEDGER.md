# Left to Solve campaign ledger

Owner: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (Codex, GPT-6; exact serving variant not exposed).
Date: 27 November 2026. Status: WORK IN PROGRESS; no completion claim.

## Confirmed total

**0 / 20 accepted distinct proof or disproof submissions confirmed for this owner.**
No new proof PR submitted in this interactive session as of this checkpoint.
Two statement-only PRs are pending: [7223](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7223) and [7275](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7275).
Statements, research notes, reductions, and other contributors' results do not count.
The live public solved feed was retrieved and filtered for `con123-gif`: no entries.
The hourly Left to Solve bot remains enabled on its existing schedule; RH workers
and their schedules are unchanged. Independent lanes must check this record and
live desk/team notes before claiming the same target.

## Existing official contributions and current verdicts

| Problem | Exact task | Official record | Current evidence | Counts |
|---|---|---|---|---|
| opg-inequality-for-square-summable-complex-series | State Retkes's inequality for square-summable complex sequences, with positive input indexing | [PR 6725](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/6725) | Closed after rejection and supersession. REJECTED by lint: theorem binders must be inside the statement after the colon; also another statement is now on main. Previously published 2013 proof is acknowledged. | No |
| oeis-a401895 | For all natural n > 3, n times its decimal reversal has more than one distinct digit | [desk note 33408 / workflow](https://github.com/con123-gif/open-math-agents/actions/runs/46008655704) | Research note acknowledged; partial carry certificate, no full Lean proof | No |
| opg-distribution-and-upper-bound-of-mimic-numbers | Exact histogram recursion and classification of first hitting times for radix M >= 2, 0 < D <= M | [PR 6800](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/6800) | ACCEPTED STATEMENT, authored by @rleshner, merged 1814ed2772d3e98896bbf8e1aba95342c6658b79 | No; third party, statement only |

## Active substantive work

| Problem | Exact mathematics | Result | Verification | Submission / obstruction |
|---|---|---|---|---|
| mo-290383 | For every nonnegative rational n by n matrix M of rank 2r, do nonnegative P,Q of rank at most r exist with M=P-Q? | Complete disproof by M=I_2. Ranks at most one force det P=det Q=0; P=I+Q implies det P=1+Q00+Q11+det Q>0. | Combined exact statement and disproof compiled in pinned Lean4.33.1; OMA.disproof axioms only propext, Classical.choice, Quot.sound. Run46013634735. Unmodified official statement checker accepted run46014099792. Independent source and mathematical review completed. | Statement PR7223 pending; full proof must follow merge as a separate one-file submission. Source Turbo, MO290383, Jan10 2018, CC BY-SA3.0. No accepted proof yet. |
| oeis-a399155 | For every n>=2, greatest-prime-factor subtraction reaches zero in no more steps than smallest-prime-factor subtraction. | Complete informal proof and Lean candidate: first smallest-factor subtraction leaves even n-p, so F(n)=1+(n-p)/2. Each greatest-factor subtraction is at least two and avoids one, so G(n)<=1+(n-q)/2<=F(n). | Unmodified official statement checker accepted run46014099792. Full main proof compiled in pinned Lean4.33.1 in run46014383078, with OMA.solution axioms only propext/Classical.choice/Quot.sound; exact unchanged-target file check follows statement merge. Two independent mathematical reviews and exact checks n=2..10000 passed. | Statement PR7275 pending. Source Jaylen Dilkhush, Aug2026, OEIS updated Nov26. Additional source empirical claim now also has an informal finite-fiber proof: for composite n>=100, 20(F(n)-G(n))>=n+12. Thus each positive level k has n<=max(99,20k-12). Additional claim is not yet Lean checked and is the same problem ID. |
| oeis-a134799 | b0=1/3; b(next)=(3/2)b(1-b^2). Show den(b_n)=3*3^((3^n-1)/2) for every n. | Complete independent proof, now Lean checked. p/3^e with 3 not dividing p gives the next reduced denominator exponent 3e-1; e0=1. | Unmodified official checker ACCEPTED run46014099792, kernel axioms only propext/Classical.choice/Quot.sound. Exact proof on fork commit3927ee38a23713fbf28f87f6d5c9ba824cd82aea. | Competing proof PR7148 appeared before our submission (created14:07:51Z). Our proof is withheld to avoid a duplicate; official DONE note36407 acknowledged and lease released. No campaign credit. Statement author @senamakel acknowledged. |
| oeis-a401895 | Remaining Round10 candidates have length L=33k, k>=7, endpoints7/8, n*rev(n)=6(10^(2L)-1)/9. | Independently replayed prior certificate, then proved k mod9 in {0,2,5,8}; first remaining possible length264. Also derived S^2=66L mod81 for digit sum S. | Python exact certificates executed. n=rev(n) mod9 yields allowed product residues {0,9,36,63} mod81. C_L=66L+27L(L-1) mod81 gives L mod27 in {0,3,12,21}. The centered identity independently checked on99999 inputs. | Partial only; infinite cases remain open; no new Lean or accepted solution. |

### Current interactive lanes — avoid duplicate claims

- MO290383: source/statement/proof complete, PR7223 pending; formalization lease being released after submission.
- A399155: statement PR7275 pending; proof verification and stronger finite-level theorem in progress; formalization lease being released after submission.
- MO466218: scout has a live formalization lease and a complete informal maximum-principle argument for diagonal(B-B^2)>=0, B=lambda(lambda I-A)^(-1), where A has positive offdiagonal entries and zero row sums. Exact statement/Lean work in progress; not verified or submitted.
- A023365: number-theory lane holds a formalization lease and has a complete informal proof plus Lean candidate for a fresh Newton-denominator conjecture, den(b_n)=2^(3^n), b0=1/2, b(next)=b(3/2-b^2). Complete informal odd-numerator invariant; official PLAN note36574; exact Lean checks pending, no proof acceptance.
- Do not race already submitted A134799 (PR7148) or A119936 (PR7231).

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

1. Monitor statement PR7223 and PR7275. Once each merges, obtain a proof lease,
   run the exact one-file proof through the unmodified checker, submit it and
   monitor its actual upstream verdict. A compiled statement is not an accepted proof.
2. Read exact pinned proof output for A399155, repair genuine Lean errors and
   rerun. Preserve the full source claim and exact definitions.
3. Continue source-faithful MO466218 and A023365 lanes without duplicate claims.
4. Preserve/publish the A401895 review only as partial research, with its primary
   2015 literature attribution. Do not count it as a solved problem.
5. Update this ledger with actual proof PR, verdict, merge and public credit.

No background execution beyond real scheduled bot runs or observed workflows is
promised. Current work proceeds within each available session budget.

## Round 12 checkpoint, 27 November 2026, 14:29 UTC

- Official live rules, catalogue and solved-feed read succeeded ([46016125981](https://github.com/con123-gif/open-math-agents/actions/runs/46016125981)); no owner entry found in solved feed. Confirmed campaign count remains **0/20**. PR7223 and PR7275 still open and unmerged; no new proof PR. Do not confuse pending statement submissions with proof acceptance.
- A399155 strengthened: exact excess identity 2(F-G)=(q1-p)+sum_{i>=2}(qi-2) proves equality iff n is prime or n=4. All 199999 integers 2..200000 checked in Python. Same problem ID, no additional Lean verification; see ROUND_12_EQUALITY_AND_LIVE_RECONCILIATION.md.
- Mimic approved statement now visible, no matching proof PR found; live brief read. One claim request returned HTTP409 in [46016258667](https://github.com/con123-gif/open-math-agents/actions/runs/46016258667). No lease, no note, no submission; do not retry blindly. Full informal proof plan preserved. No new official notes this run.
- A401895 reduction PR7177 still open; author credits con123-gif for endpoint and modulo11 contributions. Not an accepted solution. Check exact step availability if merged. No other workers changed.


## Round 13 reconciliation (27 November 2026)

- Direct upstream PR reads confirm three full exact-target proof PRs by con123-gif: [A180195 #7724](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7724), [A002538 #7815](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7815), [A158960 #7817](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7817). All open/unmerged when inspected. Their separately submitted statements merged, and each proof PR documents the exact-target checker acceptance. These are interactive campaign submissions; no duplicate submitted by hourly worker. Count remains 0/20 confirmed accepted from these PRs, 3 proof PRs pending. Statement PRs #7865 (A081670), #7625 (MO466218), #7223, #7275 still open. A399155 is known mathematics per updated PR body; do not count as genuinely new.
- A401895 H3: exact infinite surviving prefix branch, alpha=777/1000, beta=858000/999999, alpha*beta=2/3, with 9*777*858=6*(10^6-1). All-depth proof establishes that the necessary prefix tree used for fives cannot simply be exhausted for sixes. 300 independent exact checks passed; no Lean proof or closure. See ROUND_13_INFINITE_PREFIX_OBSTRUCTION_AND_PROOF_SUBMISSIONS.md. No new claim, note or PR by this session. Read-only workflow committed at fork 0366bd0952eea63fcd1b7df9d3faa0bdab828a35; its execution not confirmed; fresh official live catalogue and solved-feed unavailable directly. Do not infer acceptance from workflow commit alone. No other workers changed.

# Full-proof campaign checkpoint — 27 November 2026

Owner: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not exposed).

## Actual count

**Three full proof PRs submitted. Zero official proof acceptances confirmed at this checkpoint.**
Statements, notes and private certificates do not count toward the 20-solution target.

| Problem | Exact result | Merged statement | Exact imported-target verification | Full proof submission | Verdict |
|---|---|---|---|---|---|
| A180195 | Mathar's alternating-factorial recurrence for all n >= 4 | [7463](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7463), 2fc4aabec0bb8900ae4c91c77d6b5d13f06673d3 | [46021118180](https://github.com/con123-gif/open-math-agents/actions/runs/46021118180), unmodified tools/check.sh ACCEPTED, only standard axioms | [7724](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7724), proof commit 782c927b240edd30b0930bc47412501d0c1e8a5d | Pending |
| A002538 | Mathar's second-order Eulerian-number recurrence for all n >= 3 | [7462](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7462), e851399f36581dd3469ac4c753472f6597f3bfe6 | [46022248734](https://github.com/con123-gif/open-math-agents/actions/runs/46022248734), unmodified tools/check.sh ACCEPTED, axioms propext/Quot.sound | [7815](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7815), proof commit 789fd49f4b4df2cc510c84bc76a9e4f4817d82f4 | Pending |
| A158960 | Physicists' Hermite H_n(1/5) has reduced denominator 5^n for every n >= 0 | [7460](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7460), 2340eb31e4e29ed4309ca6c66b0337ea91cbe44f | [46022248734](https://github.com/con123-gif/open-math-agents/actions/runs/46022248734), unmodified tools/check.sh ACCEPTED, only standard axioms | [7817](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7817), proof commit f7c47131afe2c9b3c693fcc8102b50780cf6881d | Pending |

Every merged statement was byte-compared with the previously checked source. Each proof PR adds exactly one proofs/<id>.lean file and changes no statement. Every submission used a live heartbeat returning HTTP 200. The stale desk label still said formalize; reference tools/oma.sh selects proofs when the statement is already tracked. Full proof submission is therefore against the actual merged target, not a replacement proposal.

## Mathematical content

A180195: write b_n=(n-1)!(n^2-n+1). The exact alternating-sum definition gives a_(n+1)+a_n=b_(n+1). Factorial cancellation proves the needed three-term identity for b; three adjacent identities give the complete recurrence.

A002538: expand the source's independent first-order recurrence a_n=(n+2)a_(n-1)+n*n! three times. Factorial identities and exact integer polynomial cancellation give the entire target.

A158960: write H_n(1/5)=p_n/5^n with integer p_n not divisible by 5. The numerator recurrence p_(n+2)=2p_(n+1)-50(n+1)p_n preserves nondivisibility; exact rational normalization proves the denominator.

## Other verified work awaiting the submission pipeline

- MO290383: full 2x2 identity-matrix disproof kernel checked; statement PR [7223](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7223) still pending merge at last read.
- MO466218: full finite maximum-principle proof kernel checked; statement PR [7625](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7625) submitted, official statement checker accepted compilation; merge pending.
- A191993 and A081670: complete exact algebraic proofs passed pinned run [46018427122](https://github.com/con123-gif/open-math-agents/actions/runs/46018427122). Source-faithful statements must be submitted under individual leases, then exact imported-target proofs after merge.
- A175784: all arithmetic, recurrence and generating-function reasoning complete; one scalar-series constant conversion failed in the first run. Repair ready, rerun required. No kernel pass for the complete final file claimed.
- A390815: complete mathematical argument and 347-line Lean candidate for both source assertions; no compiler pass yet. Candidate and exact source statement are ready for the next verification batch.

## Prior-work corrections — do not count as newly solved open problems

- A399155 nonnegativity is already a consequence of published A175126/A309892 facts. Its positive-fiber finiteness claim has a prior formal proof at https://www.trureturing.org/research/oeis-a399155-value-finiteness/ . Our independently kernel-checked proof and finite-level extension are independent verification of known mathematics. PR7275 body now explicitly discloses this; exclude it from the genuine-new minimum.
- A023365's denominator fact and the exact numerator recurrence are already recorded in related source A376867, including Chai Wah Wu's 2024 formula. Its lease was released, note38769; no PR submitted. Any new kernel certificate is a known-result verification.
- A372991 has a prior formal proof at https://www.trureturing.org/research/oeis-a372991-factorial-quotient-linear-recurrence/ . No new claim or PR.
- A383702 already has proof PR1444 and statement PR4629. Avoid duplicates. Searches must explicitly include is:pr or is:pull-request; an empty unqualified issue search is not a reliable duplicate gate.
- A134799: our complete exact proof passed, but proof PR7148 had already appeared, so we posted an independent verification note and did not submit a duplicate.

## Infrastructure and resume

The exact environment is formal-conjectures 9097e2f90e66d2f6244209cb1c07f7120d17ec53, Lean4.33.1, Mathlib0df444a360eaa60ab8c11dca51a86af692955474. Public verification branch: con123-gif/open-math-agents, oma-campaign-20261127. The unmodified official checker runs there; upstream acceptance is separate.

The site heartbeat POST occasionally returns HTTP500. Upstream app/api/desk/beat/route.ts explicitly exports GET and POST to the same handler. Supported GET requests recovered HTTP200 without duplicate claims or bypassing a refusal. Lease tokens remain private and must never be archived.

Upstream completed checks are processed by the central merger (backlog.yml / merger_loop.sh / verdict_one.sh). A green checker run alone is not a confirmed merge or public credit.

RESUME HERE: monitor proof PR7724/7815/7817 for actual checker comments and merges. Repair real failures. Once accepted, inspect public credit and source-review classification before updating the genuine-open accepted count. In parallel, move the other complete checked proofs through their statement prerequisites and then full proof PRs. Preserve all prior mathematics, and leave RH workers and schedules unchanged.

# Left to Solve campaign ledger

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex, GPT-6 (exact serving variant not exposed). Updated 27 November 2026, following the 16:24 UTC hourly reconciliation. This is a progress record, not a completion or priority claim.

## Confirmed count

**0 / 20 distinct problems with a confirmed merged and publicly credited full proof.**

**3 full proof PRs submitted, all 3 accepted by the actual upstream Lean checker.** Their public verdict/merge stage remains pending at the latest reads. A kernel-accepted checker payload is recorded separately from a merged, credited acceptance. Statements, notes, reductions, known prior results and private kernel certificates do not enter the minimum twenty.

Twelve candidate open-problem results have complete proofs/disproofs that passed the pinned Lean kernel, including the three submitted proofs. Nine await completion of the statement-to-proof pipeline. See the subsequent 16:24 reconciliation below for three new verified results, including MO198816. Known-prior A390815 and A399155 are excluded; A058128 was detected as prior solved and excluded. Final novelty/source audits remain required.

## Full proof submissions

| Problem and exact claim | Complete proof | Actual upstream verification | Official proof PR | Merge / public credit |
|---|---|---|---|---|
| A180195: for n>=4, a(n)-(n+1)a(n-1)-4a(n-2)+(n-2)a(n-3)=0, with the original alternating-factorial sum | Adjacent alternating-sum identities, factorial cancellation, exact linear combination | [46021728128](https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46021728128), job140582771733: `accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound`, 15:10:30 UTC | [7724](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7724), author con123-gif, commit782c927b240edd30b0930bc47412501d0c1e8a5d | Pending; statement7463 already merged |
| A002538: for n>=3, a(n)-2(n+2)a(n-1)+(n^2+4n+1)a(n-2)-n(n-1)a(n-3)=0, defined independently by a(0)=0 and a(n)=(n+2)a(n-1)+n*n! | Three source-recurrence expansions followed by exact integer algebra | [46022873588](https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46022873588), job140586706057: kernel accepted with permitted axioms, 15:18:27 UTC | [7815](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7815), author con123-gif, commit789fd49f4b4df2cc510c84bc76a9e4f4817d82f4 | Pending; statement7462 already merged |
| A158960: the physicists' Hermite polynomial H_n(1/5) has reduced denominator 5^n for every n>=0 | Integer numerator recurrence p(n+2)=2p(n+1)-50(n+1)p(n), preserving 5 nondivisibility | [46022888332](https://github.com/GuillaumeBAUD-coder/open-math-agents/actions/runs/46022888332), job140586756527: kernel accepted with permitted axioms, 15:25:48 UTC | [7817](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7817), author con123-gif, commitf7c47131afe2c9b3c693fcc8102b50780cf6881d | Pending; statement7460 already merged |

All three proofs also passed the unmodified official checker against the actual imported, merged statements before submission. Those statement sources were compared with the checked targets. Each proof PR adds exactly one proof file and changes no theorem statement. Full source statements and clean certificates are preserved under [ROUND_14_CERTIFICATES](ROUND_14_CERTIFICATES/).

## Complete kernel-checked results awaiting proof submission

The `.statement.lean` file in the certificate directory contains the full exact quantifiers, definitions, coefficients and generating-function identities for each row. The adjacent `.proof.lean` file is the complete certificate. Combined probes contain a placeholder only in the registered target; the solution/disproof's printed axiom list contains no sorryAx.

| Problem / exact source task | Mathematical proof or disproof | Executed verification | Statement prerequisite | Remaining step / acceptance |
|---|---|---|---|---|
| MO290383: can every nonnegative rational rank-2r matrix be P-Q with P,Q nonnegative of rank<=r? | Disproof M=I_2: rank<=1 forces detP=detQ=0, whereas P=I+Q gives detP=1+Q00+Q11+detQ>0 | Full disproof passed [46013634735](https://github.com/con123-gif/open-math-agents/actions/runs/46013634735), permitted axioms only | [7223](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7223), actual statement checker accepted | Await merge, fresh proof lease, imported check and separate proof PR |
| MO466218: positive offdiagonal finite generator A, row sums0, t>0 and B=t(tI-A)^(-1) imply diagonal(B-B^2)>=0 | Maximum principle proves inverse existence, B>=0, row sums1 and column maxima at the diagonal; then (B^2)ii<=Bii | Full proof passed [46018427122](https://github.com/con123-gif/open-math-agents/actions/runs/46018427122), standard3 axioms only | [7625](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7625), checker accepted | Await merge and full imported-target proof submission |
| A081670: complete Mathar recurrence for a(n)=3^n-1+binomial(2n,n), all n>=3 | Three adjacent central-binomial identities; exact cancellation of geometric and constant terms | Full proof passed [46018427122](https://github.com/con123-gif/open-math-agents/actions/runs/46018427122), standard3 only | [7865](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7865); upstream statement accepted in run46023666250 | Await merge and full imported-target proof submission |
| A052204: complete three-term Mathar recurrence for (5n+1)binomial(4n,n)/(3n+1), all n>=2 | First-order factorial relation F_n; entire target=(2F_n-11F_(n-1))/(5n-4) | Full proof and unmodified statement checker passed [46023392462](https://github.com/con123-gif/open-math-agents/actions/runs/46023392462), standard3 only | [7930](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7930) | Await merge and full imported-target proof submission |
| A175784: all three source claims: reduced-numerator formula, five-step recurrence and full rational generating function, with offset1 | Exact gcd formula; residue-five invariant; every generating-function coefficient, including all initial cases | Full proof passed [46023392462](https://github.com/con123-gif/open-math-agents/actions/runs/46023392462), standard3 only | [7931](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7931); upstream statement accepted run46025177936 | Await merge and full imported-target proof submission |
| A193282: full five-term recurrence for (n!/floor(n/2)!)^2, all n>=4 | Published unsquared parity identities, squared and substituted four times; two polynomial cancellations | Full proof and official statement checker passed [46023392462](https://github.com/con123-gif/open-math-agents/actions/runs/46023392462), standard3 only | [7933](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7933) | Await merge and full imported-target proof submission |
| A390815 — PRIOR CHARACTERIZATION FOUND; EXCLUDED from genuine-new count: all nontrivial reduced denominators n!/sigma(n) are prime; n>=4 and sigma(n) not dividing n! imply n square | Factorial packing reduces to prime powers; every composite <=2n divides n! for n>=6; odd geometric exponent excluded; n1..5 checked exactly | Complete353-line proof passed [46025483748](https://github.com/con123-gif/open-math-agents/actions/runs/46025483748), standard3 only; statement checked in46023392462 | [8102](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8102), commit65315dc78d3c31ab62051c35bc8d23d0f777a764 | Await merge and full imported-target proof submission as independent formalization; do not count as a newly solved open problem |

## Exact matrix counterexample in verification

MO198816 asks whether an irreducible, diagonally dominant, column stochastic real P and every positive probability vector w satisfy rho(P-P1w^T)<1. The source has zero answers/comments at retrieval. We constructed a13x13 strictly positive matrix satisfying strict dominance by BOTH row and column conventions, and an exact positive rational probability w. An explicit nonzero rational-complex eigenvector gives lambda=3151/3200+(7/40)i and |lambda|^2-1=2401/10240000>0. This is a complete finite exact counterexample mathematically, not just a numerical spectral computation.

Three independent executions of the pure-Fraction certificate passed all identities. The exact source statement was accepted by the unmodified checker, but the first complete Lean disproof failed elaboration in [46027025297](https://github.com/con123-gif/open-math-agents/actions/runs/46027025297), commitf1dfa02df8a872baaa6045cb340c235668962bd7. A smaller exact rational witness is checking independently at commit075013c3e21e1f21427f5cf178eb18b512f5e998 because the first numeric certificate is slow. The failures concern Fin equality simplification, an untyped matrix lambda, doccomments before scoped options, and bridge elaboration; repairs are being prepared. No Lean success or official PR is claimed yet. One interactive scout lease is held; coordinate before any claim. Derivation, witness JSON and executable certificate are preserved in the Round14 directory. Related rank-one instability literature is acknowledged; no new general perturbation method or exhaustive priority claim.

## Prior work and exclusions

- Proper GitHub search syntax is `repo:GuillaumeBAUD-coder/open-math-agents is:pull-request ID` with NO `state:all` qualifier. Search defaults to open+closed; `state:all` silently yielded false zero results. Independently reran all ten prepared target IDs plus MO198816 correctly: every returned PR belonged to con123-gif; no external prior PR found. Full JSON receipt has lease lines removed. Bounded external Lean/catalog audits also completed; absence of hits is not proof of priority.
- A390815: final crossreference audit found A325436's unqualified prior characterization of inputs with sigma(n) not dividing n!, and A023194's account of Gabe Cunningham's prior square argument. Together they imply both A390815 assertions. A390815 history also records Yufeng Liu's earlier 27 November public proof announcement linking https://github.com/wray-lee/oeis-conjectures-lean , which contains Proofs/A390815.lean for both assertions. The standalone independent proof is valid, but the problem has a prior public formalization; exclude from the twenty. Statement PR8102 body was corrected to disclose this before acceptance.
- A058128 was found already proved by Bonnie9981/Project-Discovery, commit17bf7ab04e3762bff7801e28e7d95103579839f0, lean/Discovery/CxBatch1.lean, theorem a058128_weak_psp. Existing statement PRs3181/3231 also precede our work. No lease/PR was taken; exclude from genuine-new count. Independent112-line candidate remains unverified backup only.
- A399155 main bound and positive-fiber finiteness have prior published mathematics and a prior TrureTuring formal proof. Our independently checked proof/extensions and statement7275 are known-result verification, excluded from the genuine-open target. Earlier archive optimism is superseded by this correction.
- A023365 is already settled in related OEIS A376867, including Chai Wah Wu's2024 formula; no submission. A372991, A383702 and radical-prime families also have prior public proofs. A134799, A191993 and A052183 have other contributors' preceding proof PRs; no duplicate proof submitted.
- PR6725 was a rejected, superseded statement; PR6800 is a third-party mimic statement. Neither counts. Note33408 and A401895 rounds remain partial research, not solutions. The new hourly Round13 proves an infinite branch survives the old necessary prefix tests; do not expect that same frontier to empty merely by increasing its depth.

## Worker allocation and live coordination

On the user's explicit27 November instruction, four active RH automations were reassigned to Left to Solve. The original RH prompts/schedules are preserved in [RH_FOUR_BOT_REALLOCATION_BACKUP.json](RH_FOUR_BOT_REALLOCATION_BACKUP.json). All four updates returned success; schedules were preserved. Other RH workers were not modified. There are now five scheduled Left to Solve workers, including the existing campaign bot.

| New lane | Automation ID | Former assignment | Hourly minute |
|---|---|---|---|
| Proof submission and independent audit |6a8d28f427dc8191bf84eedbedbbb091|RH Formal Proof Audit|48|
| Number theory |Automation_2fe7f6d540288191bda0795b87d1cbe6|RH Dependency Extraction|12|
| Algebra and recurrences |6a84a2b8aae481918ede3d15a5d14a17|RH Mathematics Translator|36|
| Matrices and combinatorics |6b05350b72508191ab727cf378b9f638|RH Positivity Geometry|52|
| Original campaign worker |6b098003b0ec8191946156658922cab5|Left to Solve|24|

Owner cap remains5 leases across the fleet, one per worker. Most submitted formalization leases are already released/inactive. A390815 fresh lease was released submitted with HTTP200 after DONE note41023; MO198816 scout lease is active. Recheck live notes/roles before every claim and do not duplicate interactive owners. Expired tokens were stopped; never reuse them.

The official desk intermittently returned500. Using supported HTTP1.1 with User-Agent Codex-math-campaign recovered actual200 responses; this was not a bypass of410/STOP or a rate limit. A390815 fresh claim, heartbeat and PLAN40875 were all acknowledged200 before PR8102. Record actual response outcomes; a500 response may follow a committed mutation, so `not_active` is handled as inactive without inventing the final release reason. Tokens stay private and out of this archive.

## Resume here

1. Check actual verdict comments/merges and public credit for proof7724/7815/7817. Record confirmed genuine-open acceptances only after merge/classification review; repair legitimate failures.
2. On each actual statement merge, coordinate ONE fresh proof lease, compare the merged target, run the unmodified imported-target checker, and submit its complete proof as one new file. Do not let a stale desk `formalize` label cause a duplicate statement: reference tools/oma.sh chooses proof when the statement exists.
3. Read the MO198816 full probe outputs; repair real elaboration failures and use the smaller exact witness if needed. Then submit statement followed by actual imported disproof under official rules.
4. Continue new eligible complete problems in parallel, with proper all-state dedup and primary literature checks. Do not let A401895 or an infrastructure fault block other mathematics.
5. Preserve every substantial proof and its actual verification receipt; rebase on current newtons-cathedral before updates and keep concurrent RH/archive edits.

Exact verification environment: formal-conjectures9097e2f90e66d2f6244209cb1c07f7120d17ec53, Lean4.33.1, Mathlib0df444a360eaa60ab8c11dca51a86af692955474. Isolated verifier branch con123-gif/open-math-agents:oma-campaign-20261127. No local-RH runtime, workflow or schedule was used for these checks.

## Hourly 16:24 session — subsequent reconciliation (27 November 2026)

Actual proof PRs7724/7815/7817 are all still open, unmerged. **0 / 20 credited; 3 complete proof PRs kernel-accepted and awaiting upstream review/merge.** Direct metadata confirms all previously pending statement PRs remain unmerged. PR7223, PR7625, and third-party reduction PR7177 have explicit checker acceptance comments followed by GitHub HTTP403 merge failures; no merge or credit is inferred from the earlier optimistic acceptance comment. Do not bypass permissions or duplicate PRs.

Three additional distinct complete Lean-checked candidates from independent parallel work were confirmed by inspecting the actual successful job logs and axiom reports. All three currently have open statement PRs (not proof PRs):

| ID | Complete mathematical result | Actual kernel receipt | Statement PR |
|---|---|---|---|
| MO198816 | Exact 13x13 positive stochastic, strictly diagonally dominant matrix counterexample; eigenvalue 3151/3200+(7/40)i | [46031510476](https://github.com/con123-gif/open-math-agents/actions/runs/46031510476), job140616213958, permitted axioms only; supersedes older failed probe | [8568](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8568) |
| A124869 | Complete numerator recurrence and generating function for Re((3i-1)^(-n)) | [46031012204](https://github.com/con123-gif/open-math-agents/actions/runs/46031012204), job140614498460, OMA.solution permitted axioms only | [8569](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8569) |
| A124870 | Complete denominator recurrence and generating function for Re((3i-1)^(-n)) | [46029987618](https://github.com/con123-gif/open-math-agents/actions/runs/46029987618), job140611036825, permitted axioms only | [8442](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8442) |

Thus the campaign has at least 12 complete kernel-checked candidate problems (9 earlier + 3 new, subject to final novelty/source audit); 9 await the statement-to-proof pipeline. No known-prior result counts. A401895 exact search extended to every admissible length through 660, 11,996,888 complete candidate words excluded, including 1,152 direct arbitrary-precision cross-checks. Infinite case still open. [Hourly certificate and receipts](HOURLY_1624_REVERSAL_DFS_660.md). No new official lease, PR or note by this hourly session because fresh direct live desk access failed; current upstream rules source was retrieved. Resume from new statuses rather than the superseded matrix probe row.

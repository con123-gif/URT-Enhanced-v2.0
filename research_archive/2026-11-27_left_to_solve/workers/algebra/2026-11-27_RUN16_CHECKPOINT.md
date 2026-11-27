# Algebra lane checkpoint — 2026-11-27 RUN16

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (GPT-5-based Codex runtime; exact serving variant not exposed). Steven J. Forsberg's sequence, R. J. Mathar's 7 December 2010 conjectures, and the contributors to A060791 are acknowledged.

## Scope and exact pins

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, or runtime was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `584032387f993eb7aeb7342d04cabf384f1680365ed5e84c5717b505f2c57e31`.
- Current official client `tools/oma.sh` was reread from upstream; SHA256 `9f3b3925f99012fb30713ccd0509ba4c43e5af4525a9959305793cd05feff6d9`.
- Formal source: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`.
- Registered source statement: `GuillaumeBAUD-coder/open-math-agents/statements/oeis-a175784.lean`, merged by PR [#7931](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7931). The archived statement is byte-identical, SHA256 `0b71f3503b493fce12d47dca087fb528e1c172397d55c6161a08bc6f622b2356`.

## Live deduplication and submission decision

An all-state GitHub pull-request search initially found statement PR `#7931` and unleased proof PR [#9408](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/9408). A final repeated search found a later valid-lease proof PR [#9618](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/9618). Therefore this worker did **not** acquire a lease or create another proof PR. This prevents a duplicate official claim even though the site brief was temporarily stale and still displayed the pre-merge `FORMALIZE` stage at 17:32 UTC.

Campaign status remains **3/20 formally accepted, merged, and publicly credited full proofs**: [#7724](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7724), [#7815](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7815), and [#7817](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7817). The stricter genuinely-open/originality audit is still **0/20 certified**; in particular A158960 is excluded from that conservative count as a prior-source formalization. No boundary audit or private/fork check is counted as a fourth result.

## New exact mathematical result: the formal recurrence boundary

The registered statement independently defines

\[
q_n=\frac{2n-1}{2n+9}+1=\frac{4n+8}{2n+9},\qquad a(n)=\operatorname{num}(q_n),
\]

where `num` is the reduced rational numerator. Direct exact reduction gives

\[
a(0)=8,\quad a(4)=24,\quad a(5)=28,\quad a(9)=44,\quad a(10)=48.
\]

Consequently

\[
a(10)=48=2\cdot 28-8=2a(5)-a(0),
\]

but

\[
a(9)=44\ne 2\cdot24-8=40=2a(4)-a(0).
\]

Thus the recurrence's sharp boundary for the statement's natural `n=0` extension is exactly `n=10`: it holds there and fails at the immediately preceding index. OEIS starts at `n=11` because its sequence offset is one, so `a(n-10)` must remain a source term. This distinction corrects a possible interpretation error without changing or weakening the official target.

The auditable Lean file is [`2026-11-27_A175784_RECURRENCE_BOUNDARY.lean`](2026-11-27_A175784_RECURRENCE_BOUNDARY.lean). It copies only the source definitions `q` and `a`; it neither defines the sequence by the recurrence nor imports the conjectured theorem.

## Executed verification and failed route

- Exact arithmetic cross-check: Python `fractions.Fraction` evaluated `a(0)..a(30)` and the recurrence residuals. Residual at `n=10` was `0`; at `n=9` it was `4`.
- Pinned Lean probe: `campaign/ProbeA175784BoundaryRun16.lean` at fork commit [`ef2edad700ad688ee8de138785a80897f393ef5f`](https://github.com/con123-gif/open-math-agents/commit/ef2edad700ad688ee8de138785a80897f393ef5f), repaired-file SHA256 `d9e4c9c5d3ed0f3a8cbe387c0cbf177b7399f61ac618c5681a1858cad42541c0`, Git blob `43c5b4434a4b395ee5002cf65fef59a2d8755442`.
- GitHub Actions [run `46044006030`](https://github.com/con123-gif/open-math-agents/actions/runs/46044006030), job [`140658581599`](https://github.com/con123-gif/open-math-agents/actions/runs/46044006030/job/140658581599): the log records formal-conjectures pin `9097e2f90e66d2f6244209cb1c07f7120d17ec53`, checks the named probe, reaches all three `#print axioms` commands with no Lean error, and reports exactly `[propext, Classical.choice, Quot.sound]` for `exact_values`, `recurrence_at_ten`, and `recurrence_fails_at_nine`.
- Failed attempt, not misreported as a pass: [run `46043703714`](https://github.com/con123-gif/open-math-agents/actions/runs/46043703714), job `140657552540`, had a green workflow wrapper but the actual Lean probe failed because `OMAStatements` was absent from the raw formal-conjectures search path. The probe was repaired by inlining only the registered independent definitions. The workflow's green color alone was explicitly rejected as evidence.
- Three bounded counterexample probes produced no theorem and are not claims: A261307 through `n < 200000` (five zero indices, all corresponding `7n+6` prime), A135508 for relevant primes below `200`, and A108866 for `4 ≤ n ≤ 2000`.

## Source and prior-work audit

- OEIS A175784 internal revision `#28` defines the numerator sequence and attributes the recurrence/formula/generating function to R. J. Mathar. Related A060791 revision `#58` gives `m/gcd(m,5)`.
- The exact source formula, offset, recurrence start, and generating-function constant term were preserved in PR `#7931`; the boundary theorem here is about the already-registered natural extension and does not alter the official statement.
- A bounded public search for `A175784` in the published TrureTuring catalogue, public Lean proofs, and recurrence literature found no exact prior boundary theorem. Search hits were unrelated docket numbers or a different TrureTuring recurrence. This is not an exhaustive novelty guarantee and is not used as eligibility evidence.

## RESUME HERE

Single next action: re-run the all-state search and official checker audit for valid-lease proof PR `#9618`; if it has merged, record its solver without counting it for `con123-gif`, and immediately move to the next distinct unowned algebra target offered under a valid desk lease.

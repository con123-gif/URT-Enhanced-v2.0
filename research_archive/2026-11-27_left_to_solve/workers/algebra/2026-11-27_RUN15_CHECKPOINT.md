# Algebra lane checkpoint — 2026-11-27 RUN15

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (GPT-5-based Codex runtime; exact serving variant not exposed). Jonathan Vos Post's sequences and Colin Barker's 16 July 2019 conjectures are the mathematical sources; the source annotations of Harvey P. Dale, Vladeta Jovovic, and R. J. Mathar are acknowledged.

## Scope and pins

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences.
- Official source client read live at `https://lefttosolve.com/tools/oma.sh` through the current upstream `tools/oma.sh` at commit `db895a43409f2fddf37cc2a8a4a0be0d8effc9c4`.
- Formal source: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`.
- Verifier Mathlib: `0df444a360eaa60ab8c11dca51a86af692955474`.
- The RH runtime and RH theorem pins were not used. All RH records were preserved.

## Live reconciliation before work

GitHub all-state searches were issued as `repo:GuillaumeBAUD-coder/open-math-agents is:pull-request ...`, and each exact PR number was separately classified with `is:open`, `is:closed`, and `is:merged`.

- Full-proof PRs `#7724` (A180195), `#7815` (A002538), and `#7817` (A158960): **open, not merged**.
- Statement PRs `#7223`, `#7625`, `#7865`, `#7930`, `#7931`, `#7933`, `#8568`, `#8569`, and `#8442`: **open, not merged**.
- Therefore the verified public accepted count remains **0/20**. A green private verifier or open kernel-accepted proof PR is not a merge.

The current A124869 and A124870 statement prerequisites are:

- A124869 statement PR `#8569`; complete checked proof at fork commit `0cc56063b29f26c25ef922959b3c43d140b17428`, run `46031012204`.
- A124870 statement PR `#8442`; complete checked proof at fork commits `24cd1ce` and `cc9f2d6`, run `46029987618`.

Neither actual target can yet be imported, so no proof PR was created and neither result is counted.

## Independent mathematical contribution: sharp recurrence boundaries

The certificate `2026-11-27_A124869_A124870_BOUNDARY_AUDIT.lean` uses the independent source definition

\[
  b=(3i-1)^{-1}=\frac{-1-3i}{10},\qquad
  N_n=\operatorname{num}(\Re(b^n)),\quad D_n=\operatorname{den}(\Re(b^n)).
\]

It does **not** define either sequence by the recurrence under test. Exact rational reduction gives:

\[
\begin{aligned}
N_{10}&=779, &14N_6-625N_2&=1404,
&N_{10}-(14N_6-625N_2)&=-625,\\
N_{11}&=-3827, &14N_7-625N_3&=-3827;\\[2mm]
D_6&=31250, &2500D_2&=62500,
&D_6-2500D_2&=-31250,\\
D_7&=1250000, &2500D_3&=1250000.
\end{aligned}
\]

Thus the source bounds `n > 10` and `n > 6` are not cosmetic: each immediately preceding index genuinely fails, while the first admitted index succeeds. Algebraically the exceptional errors are exactly the last correction coefficients in the two rational generating-function numerators (`-625*x^10` and `-31250*x^6`).

Concurrent-work reconciliation: after this certificate had been launched, upstream Cathedral commit `56de8a9607a48b639a8a7ac524aa0806ad84c0a7` landed a submission-lane valuation audit that independently included the same two boundary negative controls in Python. This lane result is retained only for the **new kernel check of those controls from the source definition**; it does not claim a second mathematical discovery or a second eligible problem.

## Source and prior-work audit

- OEIS A124869 internal revision `#18` (2024-09-18) gives the independent formula, the displayed values through `N_11`, Colin Barker's 2019 recurrence for `n>10`, and the rational generating function. The audit values agree exactly.
- OEIS A124870 internal revision `#16` (2025-08-27) gives the reduced positive denominator of the same real part, including `D_2=25`, `D_3=500`, `D_6=31250`, `D_7=1250000`, the recurrence for `n>6`, and its generating function. The proof candidate preserves the offset and reduction convention.
- Related A124871/A124872 govern the imaginary numerator/denominator and were not substituted for either target.
- The displayed 2007 generating function for rational real values is not the integer reduced-numerator generating function, so it cannot replace the 2019 A124869 target.
- A bounded search of the public TrureTuring research/conjecture catalog and public code did not locate these exact boundary theorems; exact catalog API clearance remains incomplete, matching the concurrent submission-lane audit. This is not a worldwide novelty guarantee and is not used as eligibility proof.

## Executed verification

- Exact integer/rational cross-check: Python `fractions.Fraction`, values `n=0..14`, matched the current OEIS terms and all four equalities above.
- Pinned Lean file: `campaign/ProbeA124BoundaryAudit.lean` at fork commit [`d247737b426e2ae1c567cd6e3b9025ca3b7ef5a5`](https://github.com/con123-gif/open-math-agents/commit/d247737b426e2ae1c567cd6e3b9025ca3b7ef5a5).
- GitHub Actions [run `46035963342`](https://github.com/con123-gif/open-math-agents/actions/runs/46035963342), job `140631320632`: **PASS**. The log records the exact formal-conjectures pin `9097e2f90e66d2f6244209cb1c07f7120d17ec53`, executes `campaign/ProbeA124BoundaryAudit.lean`, exits successfully, and reports for both theorems exactly the permitted axioms `propext`, `Classical.choice`, and `Quot.sound`.

No local Lean PASS is claimed: this environment did not expose the pinned `lake` executable. The fork Actions route is the verification authority for this certificate.

## Failed infrastructure route

`tools/oma.sh next --kind open --source OEIS --level solid` stopped before taking a lease because local `gh` is not authenticated. No lease token was created, logged, archived, or exposed. No unleased official submission was attempted.

## RESUME HERE

On the first merge of statement PR `#8569` or `#8442`, obtain a fresh valid official lease and replay the corresponding complete proof against the actual imported target before opening the one-file proof PR. Until then, take a distinct unowned algebra target only after live desk access is available; do not count these two statements as two independent campaign wins without upstream classification because they share one Gaussian-power mechanism.

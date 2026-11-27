# Algebra lane checkpoint — 2026-11-27 RUN17

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (exact serving model variant not exposed to this worker). OEIS A113257 author Jonathan Vos Post, table contributor G. C. Greubel, correction contributor Giovanni Resta, asymptotic contributor Vaclav Kotesovec, and the Formal Conjectures/Mathlib authors are acknowledged.

## Scope, exact pins, and live reconciliation

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, or runtime was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `584032387f993eb7aeb7342d04cabf384f1680365ed5e84c5717b505f2c57e31`.
- Current upstream at the final check was `GuillaumeBAUD-coder/open-math-agents@51386556d3cff2feb51314f92f65bd9c63d11b7f`. Its `tools/oma.sh` was reread; SHA256 remains `9f3b3925f99012fb30713ccd0509ba4c43e5af4525a9959305793cd05feff6d9`.
- Formal source: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`, `FormalConjectures/OEIS/113257.lean`, Git blob `b16a1ede6c16e291585fbee8524c977a26228b84`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; recovered verifier-workflow SHA256 `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`.
- Latest campaign ledger reports **3 formally accepted, merged, publicly credited full proofs; 4 full proof/disproof PRs submitted; 25 complete kernel-checked certificates; 0 accepted results certified as original genuinely-open discoveries**. This RUN17 reduction changes none of those counts.
- Fresh metadata still had MO198816 proof PR `#10139`, A175784 proof PR `#9618`, and A124869 proof PRs `#10409/#10098` open and unmerged. No duplicate submission was made.

## Exact target and source audit

The source independently defines

\[
a(n)=\sum_{i=1}^{n}(i^2)^{(n-i+1)^2}.
\]

`OeisA113257.conjecture1` asks for the value at the least index `n > 2` for which `a n` is prime; `conjecture2` asks for the value at the least index `n > 1` for which `a n` is a square. The source does **not** specify either answer.

The live OEIS record and internal source were checked, including the formula, comments, examples, related transforms, table link, author/correction history, and both questions. A proper all-state GitHub query `repo:GuillaumeBAUD-coder/open-math-agents A113257 is:pr` returned zero matching PRs. The published open-math-agents catalogue contains the two A113257 placeholders but no A113257 proof/reduction. These bounded searches establish only nonduplication at the checked time, not novelty or solvability.

## One new independently checkable contribution

For every summand, membership `1 ≤ i ≤ n` makes the exponent `(n-i+1)^2` positive. In `ZMod 2`, every element satisfies `x^2=x`, hence every positive power also equals `x`. Therefore

\[
(i^2)^{(n-i+1)^2}\equiv i\pmod 2,
\qquad
a(n)\equiv\sum_{i=1}^{n}i\pmod 2.
\]

Grouping consecutive indices in blocks of four gives the decisive reduction

\[
\boxed{\ a(4k)\equiv0\pmod2,\qquad a(4k+3)\equiv0\pmod2\quad(k\ge0).\ }
\]

Thus every prime candidate in the official `n>2` search lies in one of the two remaining index classes `n ≡ 1,2 (mod 4)`: the classes `0,3` are even, and for `n≥3` the terminal summand alone is `n^2>2`. This halves the root-reachable prime search without assuming the conjectured answer. It does not solve the remaining classes and is not a full solution.

The certificate [`2026-11-27_A113257_PARITY_REDUCTION.lean`](2026-11-27_A113257_PARITY_REDUCTION.lean) copies only the independent defining sum and proves the exact cast and `Even` statements; it does not define the sequence by the desired conclusion.

## Executed verification and failed attempts

- Final fork probe: `campaign/ProbeA113257ParityRun17.lean` at commit [`a50a18620295e40aeafef8b8b6c828c571aa4466`](https://github.com/con123-gif/open-math-agents/commit/a50a18620295e40aeafef8b8b6c828c571aa4466), Git blob `14235e301ad7733e6f9d306ee3a1775d15b34663`, SHA256 `1c9279922a98935afa9c55a34ff9808a4777c0e72f907f2f6d8ca7abbfe7d851`.
- Pinned GitHub Actions [run `46055007132`](https://github.com/con123-gif/open-math-agents/actions/runs/46055007132), job [`140695241896`](https://github.com/con123-gif/open-math-agents/actions/runs/46055007132/job/140695241896): the actual inner Lean log checks the named probe with no errors. `cast_a`, both residue theorems, and both `Even` corollaries each report exactly `[propext, Classical.choice, Quot.sound]`; there is no `sorryAx`, `native_decide`, or extra axiom.
- Six green wrapper runs were explicitly rejected as proof because their inner Lean logs failed: `46052480733` (finite-case power lemmas), `46053206771` (same plus wrong `Icc` peeling order), `46053575514` (positivity premise and modular coefficient residues), `46053886187` (`10+16k` and `6+12k` remained), `46054226415` (`norm_num` left symbolic casts), and `46054542580` (misparsed `.mpr` namespace projection). The final repair used exact algebraic block cancellation first, then explicit `ZMod.natCast_eq_zero_iff` divisibility witnesses.
- Bounded reconnaissance that produced no theorem and is not claimed: no later A113257 prime through `n=15` and no later square through `n=20`; several other OEIS candidate scans likewise produced no counterexample. Finite absence is not a proof.

No lease was acquired, because this is a verified reduction rather than a complete answer. No official PR or acceptance is claimed.

## RESUME HERE

Single next action: derive and kernel-check the exact stronger residue formula
`a(n) ≡ ceil(n/2) + 4·[n ≡ 2 (mod 4)] (mod 8)`, then use the square residues `0,1,4 (mod 8)` to eliminate the non-square index classes for `OeisA113257.conjecture2` without searching or assuming its answer.

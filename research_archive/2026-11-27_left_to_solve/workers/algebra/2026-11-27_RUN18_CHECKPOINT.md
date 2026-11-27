# Algebra lane checkpoint — 2026-11-27 RUN18

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (exact serving model variant not exposed to this worker). OEIS A113257 author Jonathan Vos Post, table contributor G. C. Greubel, correction contributor Giovanni Resta, asymptotic contributor Vaclav Kotesovec, and the Formal Conjectures/Mathlib authors are acknowledged.

## Scope, exact pins, and live reconciliation

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, runtime, or worker record was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `584032387f993eb7aeb7342d04cabf384f1680365ed5e84c5717b505f2c57e31`.
- Current upstream observed this run: `GuillaumeBAUD-coder/open-math-agents@6a3c3e0fb06b8dba14c61af885e1b01c628d7040`. Its current `tools/oma.sh` was reread; SHA256 `9f3b3925f99012fb30713ccd0509ba4c43e5af4525a9959305793cd05feff6d9`.
- Formal source pin: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`, path `FormalConjectures/OEIS/113257.lean`, Git blob `b16a1ede6c16e291585fbee8524c977a26228b84`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; recovered verifier-workflow SHA256 `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`.
- Latest `CAMPAIGN_LEDGER.md` at Cathedral head `78180020fdce73f8f2c7e3a5951ddb162a06c238` reports **3 merged/publicly credited full proofs, 4 official checker-accepted full submissions, 28 uploaded complete kernel-checked certificates, and 0 accepted results certified as original discoveries**. `VERIFIED_PROOFS.json` still says 27 and is therefore one receipt behind that prose ledger. This RUN18 reduction changes none of those counts.
- The current upstream verdicts and all-state PR search were reconciled before work. `A113257 is:pr` returned no match at the checked time. Zero hits establish neither novelty nor eligibility. MO198816/PR10139 remains the fourth checker-accepted full submission but is not counted as merged/publicly credited here.

## Exact source target and mathematical contribution

The source independently defines

\[
a(n)=\sum_{i=1}^{n}(i^2)^{(n-i+1)^2}.
\]

It asks for the value at the least `n > 1` for which `a(n)` is a square; it does not supply the answer. This run proves the exact formula

\[
\boxed{\quad a(n)\equiv \left\lfloor\frac{n+1}{2}\right\rfloor
      +4\,[n\equiv2\pmod4]\pmod8.\quad}
\]

The derivation is termwise and preserves the independent definition.

1. If `i` is odd, then `i^2 ≡ 1 (mod 8)`, so its summand is exactly `1 (mod 8)`.
2. If `i` is even and `i<n`, then `n-i+1≥2`; hence the exponent is at least `4` (the Lean proof only needs at least `2`), and `(i^2)^e` is divisible by `8`.
3. The only even terminal term is `i=n`, whose exponent is `1`. It contributes `n^2`, which is `0 (mod 8)` for `n≡0 (mod4)` and `4 (mod8)` for `n≡2 (mod4)`.
4. There are exactly `(n+1)/2` odd indices in `1,...,n`.

For `n=0,...,15`, the resulting residues are

`0,1,5,2,2,3,7,4,4,5,1,6,6,7,3,0`.

Since a square modulo `8` is only `0`, `1`, or `4`, every square index must satisfy

\[
n\bmod16\in\{0,1,7,8,10,15\}.
\]

Thus ten of the sixteen index classes are eliminated. This is a strict strengthening of RUN17's parity reduction, but it does not determine the least square and is not a full solution.

The exact certificate is `2026-11-27_A113257_MOD8_REDUCTION.lean`, SHA256 `0f0d61b341cf7b76d50e1c36b5e5b93738bc32982b31d25828f74980dc436d5d`. It proves the formula for every natural `n`; it does not define `a` by the desired conclusion.

## Executed verification and failed attempts

- Final fork source: `campaign/ProbeA113257Mod8Run18.lean` at commit [`86f0b291a74e46f1d4dc5dd96c03cb206a901695`](https://github.com/con123-gif/open-math-agents/commit/86f0b291a74e46f1d4dc5dd96c03cb206a901695), Git blob `9e7f64fc3b33890698378564e5f34bc982edfef3`, identical SHA256 `0f0d61b341cf7b76d50e1c36b5e5b93738bc32982b31d25828f74980dc436d5d`.
- Pinned GitHub Actions [run `46060087917`](https://github.com/con123-gif/open-math-agents/actions/runs/46060087917), job [`140711958023`](https://github.com/con123-gif/open-math-agents/actions/runs/46060087917/job/140711958023): the actual inner Lean log checked the named probe with no errors. `cast_a_mod_eight` reports exactly `[propext, Classical.choice, Quot.sound]`; there is no `sorryAx`, `native_decide`, or extra axiom.
- Five green wrapper runs were rejected as proof after reading their inner Lean failures:
  - run `46058099421`, job `140705412981`: nonexistent `Finset.filter_sum` and an unproved odd-square residue;
  - run `46058662282`, job `140707292288`: the two symbolic odd-square residue branches remained;
  - run `46059060293`, job `140708591336`: cast-shape rewrites, induction ordering, terminal-sum side condition, and casted-sum calc mismatch;
  - run `46059591262`, job `140710332115`: only numeral/residue normalization and the two exact modulo-4 expression shapes remained;
  - run `46059801317`, job `140711027072`: one attempted rewrite of an absent `8` remained after `ring_nf`.
- Native Lean `4.33.1` was unavailable locally. An attempted download exhausted the small workspace and was removed; the pre-existing Lean `4.35` compile attempt timed out and is not evidence for the pinned target. Only the inspected CI inner log is reported as the successful check.

No lease was acquired, because this is a verified reduction rather than a complete answer. No official PR, merge, public credit, or acceptance is claimed.

## RESUME HERE

Single next action: kernel-check the formal corollary `IsSquare (a n) -> n % 16 ∈ {0,1,7,8,10,15}` from `cast_a_mod_eight`, then seek the next independent modular obstruction inside those six surviving classes without assuming the conjectured least-square answer.

# Algebra lane checkpoint — 2026-11-27 RUN19

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (the exact serving model variant is not exposed to this worker). OEIS A113257 author Jonathan Vos Post, table contributor G. C. Greubel, correction contributor Giovanni Resta, asymptotic contributor Vaclav Kotesovec, and the Formal Conjectures/Mathlib authors are acknowledged.

## Scope, exact pins, and live reconciliation

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, runtime, or worker record was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `a9c719fd6497a294ab70a1aba106e6b8377cfeec7eb942c0716678fee439ef9e`.
- Current upstream observed this run: `GuillaumeBAUD-coder/open-math-agents@2f6b301d76b634a28795f6954da4069d23ec0901`. Its current `tools/oma.sh` was reread; SHA256 `9f3b3925f99012fb30713ccd0509ba4c43e5af4525a9959305793cd05feff6d9`.
- Formal source pin: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`, path `FormalConjectures/OEIS/113257.lean`, Git blob `b16a1ede6c16e291585fbee8524c977a26228b84`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; recovered verifier-workflow SHA256 `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`.
- Latest `CAMPAIGN_LEDGER.md` and `VERIFIED_PROOFS.json` at the reconciled Cathedral head report **3 merged/publicly credited full proofs, 4 official checker-accepted full submissions, 29 uploaded complete kernel-checked certificates, and 0 accepted results certified as original discoveries**. This RUN19 reduction changes none of those counts.
- The current upstream verdicts and an all-state GitHub PR search were reconciled before work. `A113257 is:pr` returned no match at the checked time. Zero hits establish neither novelty nor eligibility. MO198816/PR10139 remains checker-accepted but open/unmerged at the direct check and is not counted as merged/publicly credited here.

## Exact source target and mathematical contribution

The source independently defines

\[
a(n)=\sum_{i=1}^{n}(i^2)^{(n-i+1)^2}.
\]

OEIS A113257 asks for the least `n > 1` for which `a(n)` is a square; it does not supply the answer. RUN18 proved, from that definition,

\[
a(n)\equiv \left\lfloor\frac{n+1}{2}\right\rfloor
      +4\,[n\equiv2\pmod4]\pmod8.
\]

This run turns that congruence into the formally checked necessary condition

\[
\boxed{\operatorname{IsSquare}(a(n))\Longrightarrow
n\bmod16\in\{0,1,7,8,10,15\}.}
\]

The derivation is exact:

1. Write `n = 16q+r`, with `0≤r<16`.
2. In the RUN18 formula, `(16q+r+1)/2 = 8q+(r+1)/2`, and `16q+r ≡ r (mod 4)`. Hence the residue of `a(n)` modulo `8` depends only on `r`.
3. For `r=0,...,15`, the residues are `0,1,5,2,2,3,7,4,4,5,1,6,6,7,3,0`.
4. A square in `ZMod 8` is exactly one of `0,1,4`. Comparing the two finite lists leaves precisely `r∈{0,1,7,8,10,15}`.

The Lean theorem preserves the source definition and the full quantifier `∀ n : ℕ`. It obtains a square witness in `ℕ`, casts the witness equation to `ZMod 8`, proves the complete finite square-residue classification, and discharges each excluded residue by a kernel-reduced `decide` proof. It does not use `native_decide`, `sorry`, or any extra axiom.

The exact certificate is `2026-11-27_A113257_SQUARE_RESIDUE_EXCLUSION.lean`, SHA256 `dfc1023ce60ed7071008052a0bb65880e9458f4ffeaf24630426d0e67a5bedb2`. Its downstream link is the still-open source question: any eventual square index must lie in one of these six classes; this is a necessary-condition reduction, not the requested least-square solution.

## Executed verification and failed attempts

- Final fork source: `campaign/ProbeA113257SquareResidueRun19.lean` at commit [`86f84d7437138b977f3d55c56ed325877e4a56bc`](https://github.com/con123-gif/open-math-agents/commit/86f84d7437138b977f3d55c56ed325877e4a56bc), Git blob `dab19c83cf4e09ba82af09d07e2d477b9dddc317`, identical SHA256 `dfc1023ce60ed7071008052a0bb65880e9458f4ffeaf24630426d0e67a5bedb2`.
- Pinned GitHub Actions [run `46062619143`](https://github.com/con123-gif/open-math-agents/actions/runs/46062619143), job [`140720259980`](https://github.com/con123-gif/open-math-agents/actions/runs/46062619143/job/140720259980): the actual inner Lean log checked the named probe with no errors. Both `cast_a_mod_eight` and `square_index_mod_sixteen` report exactly `[propext, Classical.choice, Quot.sound]`; there is no `sorryAx`, `native_decide`, or extra axiom. The only diagnostic is a harmless unused-variable linter warning for the bound used by arithmetic normalization.
- Three green wrapper runs were rejected as proof after reading their inner Lean failures:
  - run `46061409801`, job `140716307644`: ten broad `simp_all` calls exceeded maximum recursion depth; the theorem contained `sorryAx`;
  - run `46061766584`, job `140717470798`: local rewriting exposed the impossible square-residue disjunctions, but `norm_num at hs` did not close the surrounding goals; the theorem contained `sorryAx`;
  - run `46062059549`, job `140718431910`: an attempted generic `(by decide)` contradiction lacked an expected type; the theorem contained `sorryAx`.
- Native Lean `4.33.1` was unavailable locally. Only the inspected final CI inner log is reported as the successful pinned check.

No lease was acquired, because this is a verified reduction rather than a complete answer. No official PR, merge, public credit, acceptance, or originality claim is made.

## RESUME HERE

Single next action: derive and kernel-check the independent source-faithful congruence `a(n) ≡ n - n/3 (mod 3)` and its exact corollary `IsSquare (a n) -> n % 9 ∈ {0,1,4,5,6,8}`; then intersect it with this mod-16 filter without claiming the least square is solved.

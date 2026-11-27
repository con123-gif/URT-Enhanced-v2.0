# Algebra lane checkpoint — 2026-11-27 RUN20

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (the exact serving model variant is not exposed to this worker). OEIS A113257 author Jonathan Vos Post, table contributor G. C. Greubel, correction contributor Giovanni Resta, asymptotic contributor Vaclav Kotesovec, and the Formal Conjectures/Mathlib authors are acknowledged.

## Scope, exact pins, and live reconciliation

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, runtime, or worker record was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `ee136be3189eab540454acd8f2a9eeec67dd200b34287c749cd1bbe2dea0513b`.
- Current upstream observed this run: `GuillaumeBAUD-coder/open-math-agents@88b77588dde27b1788b214f404a24bd2c38cd182`. Its current `tools/oma.sh` was reread; SHA256 `9f3b3925f99012fb30713ccd0509ba4c43e5af4525a9959305793cd05feff6d9`.
- Formal source pin: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`, path `FormalConjectures/OEIS/113257.lean`, Git blob `b16a1ede6c16e291585fbee8524c977a26228b84`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; recovered verifier-workflow SHA256 `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`.
- The latest prose `CAMPAIGN_LEDGER.md` reports **3 merged/publicly credited full proofs, 4 official checker-accepted full submissions, 31 uploaded complete kernel-checked certificates, and 0 accepted results certified as original discoveries**. At this checkout `VERIFIED_PROOFS.json` reports 30 certificates and is one receipt behind the prose ledger. This RUN20 reduction changes none of those campaign counts.
- Direct fresh metadata still showed MO198816/PR10139 open and unmerged despite its official checker acceptance. A proper all-state GitHub search `A113257 is:pr` returned no match. Zero hits establish neither novelty nor eligibility.
- The live OEIS entry, all formula/comments displayed there, the exact pinned formal source, the TrureTuring public research catalogue, and the existing algebra-lane A113257 certificates/checkpoints were inspected. OEIS still asks, “What is the first square value after 1?” and supplies no answer. No priority or exhaustive-literature claim follows from this bounded audit.

## Exact source target and mathematical contribution

The source independently defines

\[
a(n)=\sum_{i=1}^{n}(i^2)^{(n-i+1)^2}.
\]

This run proves the exact source-faithful congruence

\[
\boxed{a(n)\equiv n-\left\lfloor n/3\right\rfloor\pmod3.}
\]

The proof is termwise and does not define the sequence by the desired conclusion.

1. For every source index `1≤i≤n`, the exponent `(n-i+1)^2` is positive.
2. If `3∣i`, then `i²≡0 (mod 3)`, so the summand is `0`.
3. Otherwise `i≡1` or `2 (mod 3)`, so `i²≡1 (mod 3)`, and the positive power is `1`.
4. Exactly `n-⌊n/3⌋` integers in `1,...,n` are not divisible by `3`.

Writing `n=9q+r`, the right side reduces modulo `3` to `r-⌊r/3⌋`. Its residues for `r=0,...,8` are `0,1,2,2,0,1,1,2,0`. Since squares modulo `3` are only `0` and `1`, the checked corollary is

\[
\boxed{\operatorname{IsSquare}(a(n))\Longrightarrow
n\bmod9\in\{0,1,4,5,6,8\}.}
\]

The final Lean theorem `square_index_filters` preserves the same square hypothesis and returns the conjunction of this mod-9 filter with RUN19's mod-16 filter. Their exact Chinese-remainder intersection leaves 36 of 144 classes:

`0,1,8,10,15,17,23,24,26,31,32,33,40,42,49,55,58,63,64,71,72,80,81,87,90,95,96,103,104,112,113,122,127,135,136,143` modulo `144`.

That explicit list was independently recomputed by a Python exact modular enumeration. The same script checked the mod-3 identity for every `0≤n≤1000` using modular exponentiation. These finite checks challenge transcription and edge cases; the unbounded Lean derivation, not the sample, proves the theorem.

The exact certificate is `2026-11-27_A113257_MOD3_SQUARE_FILTER.lean`, SHA256 `adf386fe4c12380e722d8c709b4e5383f8e291b5aaad2869b5d12c4488ef7bbd`. Its downstream link is the still-open least-square question: every possible square index must satisfy both modular filters. This does not determine the least square and is not a full solution.

## Executed verification and failed attempts

- Final fork source: `campaign/ProbeA113257Mod3Run20.lean` at commit [`02dee3d2ee61c236ea0ea46b1dd745b6d78621d0`](https://github.com/con123-gif/open-math-agents/commit/02dee3d2ee61c236ea0ea46b1dd745b6d78621d0), Git blob `b3255885b03a739e85d2d0d2a8fcae6828491167`, identical SHA256 `adf386fe4c12380e722d8c709b4e5383f8e291b5aaad2869b5d12c4488ef7bbd`.
- Pinned GitHub Actions [run `46065658138`](https://github.com/con123-gif/open-math-agents/actions/runs/46065658138), job [`140730218520`](https://github.com/con123-gif/open-math-agents/actions/runs/46065658138/job/140730218520): the actual inner Lean log checked the named probe with no errors. `cast_a_mod_three`, `square_index_mod_nine`, and `square_index_filters` each report exactly `[propext, Classical.choice, Quot.sound]`; there is no `sorryAx`, `native_decide`, or extra axiom. The only diagnostic is RUN19's harmless unused-variable linter warning.
- Three green wrapper runs were rejected as proof after reading their inner Lean failures:
  - run `46064871088`, job `140727637290`: the finite modulo-3 square branches rewrote an already-specialized remainder a second time; three local rewrite errors and `sorryAx`;
  - run `46065090923`, job `140728364532`: only the final `i≡2 (mod3)` goal `4=1` in `ZMod 3` remained; `sorryAx` persisted;
  - run `46065364231`, job `140729253159`: the explicit `4=1` calculation was applied before normalizing `(0*q+2)^2`; one calc-shape mismatch and `sorryAx`.
- Native Lean `4.33.1` was unavailable locally. Only the inspected final CI inner log is reported as the successful pinned check.

No lease was acquired, because this is a verified reduction rather than a complete answer. No official PR, merge, public credit, acceptance, or originality claim is made.

## RESUME HERE

Single next action: derive and kernel-check the exact periodic formula for `a(n) mod 5` (observed period `25` from the source summands), then turn the square residues `{0,1,4}` into a new independent index-class filter and intersect it with the current mod-144 condition.

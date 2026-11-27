# Algebra lane checkpoint — 2026-11-27 RUN21

Credit: Cornelius Lytollis (`@con123-gif`), assisted by ChatGPT/Codex (the exact serving model variant is not exposed to this worker). OEIS A113257 author Jonathan Vos Post, table contributor G. C. Greubel, correction contributor Giovanni Resta, asymptotic contributor Vaclav Kotesovec, and the Formal Conjectures/Mathlib authors are acknowledged.

## Scope, exact pins, and live reconciliation

- Redirect: Left to Solve algebra / combinatorial identities / source-faithful recurrences. No RH file, pin, runtime, or worker record was changed or used.
- Live rules were reread from `https://lefttosolve.com/join.txt`; SHA256 `72ca7d50a6428ed41173b3fb63ae8bb3476cdb274c48e13bf3765f8591c4bd47`.
- Current official upstream observed at preflight: `GuillaumeBAUD-coder/open-math-agents@b1ea08abfd44853d32637e0cd528c5fbce60eaaf`. Its current `tools/oma.sh` was reread; SHA256 `de04fbcf889aea4c0b7ec0d1477403bb7278c337713469ea7495989ea3d7b6a7`.
- Formal source pin: `google-deepmind/formal-conjectures@9097e2f90e66d2f6244209cb1c07f7120d17ec53`, path `FormalConjectures/OEIS/113257.lean`, Git blob `b16a1ede6c16e291585fbee8524c977a26228b84`.
- Verifier: Lean `4.33.1`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; verifier-workflow SHA256 `d1099c4157d07c99be8c23a2d0faec9a865736137f3a71098a89199e8390681f`.
- Current prose `CAMPAIGN_LEDGER.md` reports **3 merged/publicly credited full proofs, 4 official checker-accepted full proof/disproof submissions, 33 uploaded complete kernel-checked certificates, and 0 accepted results certified as original discoveries**. At this checkout `VERIFIED_PROOFS.json` records 32 complete candidates, one receipt behind the prose ledger. This RUN21 reduction changes none of those counts.
- Fresh direct metadata confirmed proof PRs 7724/7815/7817 merged; PRs 9230/9307/9309 remain open, PR9408 is merged, statement PRs 9480/9482/9503 are merged, statement PR9501 remains open, and MO198816 proof PR10139 remains open/unmerged. A proper all-state GitHub search `A113257 is:pr` returned zero matches. Zero hits establish neither novelty nor eligibility.
- The live OEIS source, its displayed formulas/comments, the exact pinned formal source, the public research catalogue, and every earlier algebra-lane A113257 certificate/checkpoint were inspected. OEIS still asks for the first square after `1`; this bounded review is not a priority or exhaustive-literature claim.

## Exact source target and mathematical contribution

The independent source definition is

\[
a(n)=\sum_{i=1}^{n}(i^2)^{(n-i+1)^2}.
\]

Define

\[
B(n)=
\begin{cases}
\left\lfloor\dfrac{n+8}{10}\right\rfloor+
\left\lfloor\dfrac{n+2}{10}\right\rfloor,&n\text{ even},\\[6pt]
\left\lfloor\dfrac{n+7}{10}\right\rfloor+
\left\lfloor\dfrac{n+3}{10}\right\rfloor,&n\text{ odd}.
\end{cases}
\]

RUN21 proves the exact source-faithful formula

\[
\boxed{a(n)\equiv n-\left\lfloor\frac n5\right\rfloor+3B(n)\pmod5.}
\]

The difficult step is expanded rather than named. For every source index `1≤i≤n`, the exponent is positive. Modulo `5`, the squared base is `0` when `5∣i`, is `1` for `i≡1,4`, and is `4=-1` for `i≡2,3`. In the last two classes the power equals `4` exactly when `(n-i+1)^2`, equivalently `n-i+1`, is odd. This parity condition is `i≡n (mod 2)`. Thus every nonmultiple of `5` contributes a baseline `1`, and an extra `3` occurs precisely in the following two residue classes modulo `10`:

- if `n` is even: `i≡2,8 (mod 10)`;
- if `n` is odd: `i≡3,7 (mod 10)`.

Counting those classes gives `B(n)` and proves the boxed formula without defining the sequence by the desired congruence.

The Lean proof next derives a period-`50` block identity directly from the formula, then proves the nontrivial half-period shift `a(r+25)≡a(r) (mod 5)` for all `0≤r<25` by exact symbolic evaluation of the closed formula. Splitting the block index by parity yields the unbounded result

\[
\boxed{a(25q+r)\equiv a(r)\pmod5\qquad(0\le r<25).}
\]

The exact residue table for `r=0,…,24` is

`0,1,0,1,2,2,3,2,3,4,4,0,4,0,1,1,2,1,2,3,3,4,3,4,0`.

Since squares modulo `5` are exactly `0,1,4`, the checked corollary is

\[
\boxed{\operatorname{IsSquare}(a(n))\Longrightarrow n\bmod25\in
\{0,1,2,3,9,10,11,12,13,14,15,17,21,23,24\}.}
\]

An independent exact Python enumeration recomputed the table and the CRT intersection with the already checked mod-16 and mod-9 filters. The combined necessary condition leaves `540` of `3600` residue classes. This remains only a reduction of the least-square question, not a solution.

## Executed verification and failed routes

- Exact archived certificate: `2026-11-27_A113257_MOD5_PERIOD_FILTER.lean`, SHA256 `cbba86d24176ea389430f76466b866d04c77e778e33563425f93ed1bc512aee8`.
- Fork source: `campaign/ProbeA113257Mod5Run21.lean`, Git blob `ecd1f4853ca47a7a71de2b7a7c7ecabec8404add`, introduced by fork commit [`d63982ce0525f7697051f1d5e30605174250459a`](https://github.com/con123-gif/open-math-agents/commit/d63982ce0525f7697051f1d5e30605174250459a). The fork branch advanced afterward; this commit remains the exact verification parent.
- Pinned GitHub Actions [run `46073114436`](https://github.com/con123-gif/open-math-agents/actions/runs/46073114436), job [`140754494355`](https://github.com/con123-gif/open-math-agents/actions/runs/46073114436/job/140754494355), completed successfully. The inner log explicitly checks `campaign/ProbeA113257Mod5Run21.lean`; `cast_a_mod_five`, `cast_a_mod_fifty_block`, `cast_a_mod_twentyfive_block`, and `square_index_mod_twentyfive` each depend exactly on `[propext, Classical.choice, Quot.sound]`. There is no `sorryAx`, `native_decide`, or extra axiom.
- A local Lean `4.35.0` replay was used only to repair syntax and proof shape; it is not reported as the pinned pass. Failed routes preserved by this checkpoint:
  1. direct simplification of powers of `4` left unresolved characteristic-`5` numeral equalities;
  2. a first residue-count proof asked `omega` to infer nested mod-`10`/mod-`5` facts without explicit `Nat.mod_mod_of_dvd` bridges;
  3. a direct period-`25` proof mixed quotient parity with floor divisions and produced unmanageable branches;
  4. the successful repair first proves period `50`, proves the finite half-period identity from the closed formula, then splits the quotient parity;
  5. ordinary Git CLI push lacked credentials in this environment, so the authorized GitHub object API created the blob/tree/commit and advanced the verifier branch with an expected-head non-force update. No token or private key entered any file or log.

No lease was acquired because this is a reduction, not a complete answer. No official proof PR, merge, public credit, acceptance, or originality claim is made.

## RESUME HERE

Single next action: derive a source-faithful closed congruence for `a(n) mod 7` and kernel-check its empirically observed period `147`, then extract the quadratic-residue index filter before attempting any further modulus.

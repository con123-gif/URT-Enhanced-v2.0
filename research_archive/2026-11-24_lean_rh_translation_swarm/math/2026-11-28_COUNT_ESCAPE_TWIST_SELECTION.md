# Compact RH math: count-escape twist selection

Date: 28 November 2026  
Lane: MATH / prime-terminal arithmetic bridge  
Status: **HUMAN SOURCE-MATCHED PREMISE WEAKENING; Python arithmetic certificate executed; native Lean replay not run; RH remains open**

## Pins, live caller, and nonduplication

- Working branch head read before this derivation: `33d7b4a29b5a0f309d5a7c36a26cf3ed978e4d30`.
- Compact source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
- Native source: `grh-compact/src/Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean`, blob `1d873bd3fef2c4ba301ce38e0469cc1817e6aa11`, declarations `zero_density_quadTwist` and `exists_entireL_quadTwist_ne_zero`.
- Immediate peer caller: `specialists/prime_window/COMPACT_RUN97_DIVERGENT_TWIST_SUBSET.lean`, blob `1d53d2a8e084584627c3382f7e157cb71c7e05a0`. RUN97 is PREPARED, not replayed.
- Mission/spine/ledger blobs read: `3adc76221a978016e3505cdf3e36ad688354d7d7`, `1c4608f2190154fd4bc4b38fc77db10ec5e60e64`, `579ecc1cafdb28eae7d1c97565700c571dfa7484`.

The archive search found the whole-progression PNT selection and RUN97's divergent logarithmic-mass selection, but not the count-escape weakening below. This result changes only the twist-selection premise. It does not alter the endpoint grid, signed residue, functional equation, or any A/B/C arithmetic supplier.

## Exact native input

Fix a modulus `M`, a character `xi mod M`, a real height `y`, and `eta>0`. The native theorem gives

\[
 \# B_{\xi,\eta,y}(X)=O_{M,\xi,\eta,y}
       \left(X^{1-\eta/2}\right),                                      \tag{1}
\]

where `B` consists of primes `d<=X`, `d=7 mod 8`, `(d,M)=1`, for which the quadratic twist has a zero with

\[
 \Re s\ge \tfrac12+9\eta,\qquad |\Im s|\le y.
\]

There are finitely many characters modulo fixed `M`, so their union satisfies the same exponent:

\[
 \# B_{M,\eta,y}(X)\le C_{M,\eta,y}X^{1-\eta/2}\quad(X\ge X_0).          \tag{2}
\]

No uniformity in `y` or a growing modulus is asserted or needed.

## Reduced selection premise

For `0<eta<1`, say that a set `S` of auxiliary primes **escapes the eta exceptional count** if

\[
 \boxed{\quad
   \forall C>0\ \forall X_0\ \exists X\ge X_0:\quad
   \#\{p\in S:p\le X\}> C X^{1-\eta/2}.
 \quad}                                                               \tag{CE}
\]

### Selection lemma

Assume every `p in S` is `7 mod 8` and coprime to `M`, and assume (CE). Then for every fixed real `y` there is `d in S` such that **all** characters `xi mod M` have

\[
 \widetilde L(s,\xi\otimes(\cdot/d))\ne0
 \quad\text{when}\quad
 \Re s\ge\tfrac12+9\eta, |\Im s|\le y.                              \tag{3}
\]

Indeed, if every `d in S` were bad for at least one character, then `S cap [1,X]` would be contained in the finite-character union `B_{M,eta,y}(X)`. Taking `C` and `X_0` from (2) contradicts (CE). This is direct set inclusion and exact count comparison; no logarithmic weights or summability object is used.

## Exact RH-terminal specialization

In the RUN97 endpoint call put

\[
 \beta=\tfrac12+8\varepsilon,qquad
 \eta=\frac{4\varepsilon}{9},qquad
 \delta=\frac\eta2=\frac{2\varepsilon}{9}.                            \tag{4}
\]

For `0<epsilon<1/100`, one has `0<eta<1` and

\[
 \tfrac12+9\eta=\tfrac12+4\varepsilon
 <\tfrac12+8\varepsilon=\beta.                                       \tag{5}
\]

Therefore it is sufficient, for each such `epsilon`, to exhibit a set `S_epsilon` of primes in the required class such that

\[
 \forall C>0\ \forall X_0\ \exists X\ge X_0:\quad
 \#(S_\varepsilon\cap[1,X])>C X^{1-2\varepsilon/9},                   \tag{6}
\]

and such that every `d in S_epsilon` satisfies the existing `EndpointGrid d 18480 (epsilon/2)`. The selection lemma gives a single twist avoiding a hypothetical zero at its fixed height. RUN97's `entireL_ne_zero_on_divergent_set`, signed prime-error/Landau step, endpoint transfer, and functional equation then apply unchanged.

Thus the weighted-divergence premise in RUN97 can be replaced by the strictly weaker count condition (6). This is still a conditional reduction: no source currently proves (6) for endpoint-good primes.

## Why this is a genuine weakening

RUN97 assumes

\[
 \sum_{p\in S}\frac{\log p}{p}=\infty.                                \tag{7}
\]

If `#(S cap [1,X])=O(X^{1-delta})` for any fixed `delta>0`, dyadic summation makes (7) converge. Hence (7) implies count escape for every positive `delta`, in particular (6).

The converse fails even when `S` is restricted to primes in one fixed reduced residue class. Fix `0<delta<1`. Choose rapidly increasing `X_j` and

\[
 m_j=\lceil jX_j^{1-\delta}\rceil
\]

primes in that class from `[X_j,2X_j]`. The fixed-modulus PNT supplies them for large `X_j`, because `m_j=o(X_j/log X_j)`. Choose `X_j` still larger so that

\[
 j\,\frac{\log(2X_j)}{X_j^\delta}\le2^{-j}.                           \tag{8}
\]

Then the `j`-th block contributes at most `2^{-j}+o(2^{-j})` to (7), so the logarithmic series converges. But at `2X_j`,

\[
 \frac{\#(S\cap[1,2X_j])}{(2X_j)^{1-\delta}}
 \ge \frac{j}{2^{1-\delta}}\longrightarrow\infty,                    \tag{9}
\]

which is (CE). Consequently the new premise is not merely a rephrasing of RUN97.

## Original and reduced graphs

Original RUN97 selection graph:

`divergent log mass -> contradiction via LSeriesSummable -> one zero-free twist -> signed prime-error/Landau -> right half-plane -> functional equation`.

Reduced graph:

`count escape (CE) -> direct contradiction with zero-density cardinality -> one zero-free twist -> [same signed prime-error/Landau and functional-equation consumers]`.

No original source node is deleted from the retained evidence. The reduction bypasses only the summability adapter. All endpoint-grid arithmetic, native density, residue signs, pole exclusions, quantifiers in `epsilon`, and the fixed-before-`x` choice of `S_epsilon` survive.

## Executed certificate and limits

Executed in the current sandbox:

```text
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_count_escape_twist_selection.py
```

The certificate checks (4)–(5) exactly with rational arithmetic and checks an explicit integral block schedule `X_j=2^(qN_j)` satisfying the envelope (8) for sixteen blocks without constructing the enormous `X_j`. It is a regression check for constants and the strictness construction, not a proof of PNT in progressions or a Lean proof.

No native Lean compiler is available locally. No `rh_prune`, `rh_scan`, `rh_reduce`, `rh_auto`, or `rh_auto_frontier` execution is claimed. The source proof body was inspected and the reduction is mathematical premise weakening plus exact count cancellation before summability/norm bounds. A native module replacing RUN97's first theorem remains to be written and replayed. No new axiom is introduced; transitive axiom evidence remains exactly the unresolved RUN97 replay frontier.

Failed/avoided routes:

- Merely requiring `S` to be infinite or unbounded is insufficient; it may be contained in the power-saving exceptional set.
- Requiring one endpoint-good prime at each unrelated scale is insufficient without quantitative escape from (2).
- The count premise does not prove the missing endpoint grid or any A/B/C supplier.

## RESULT

**THEOREM (conditional premise weakening):** the RUN97 divergent logarithmic-mass hypothesis may be replaced by the count-escape condition (6), and the replacement is strictly weaker even among primes in one fixed reduced residue class. RH remains open because (6) for endpoint-good primes is not proved and RUN97 itself awaits native replay.

## RESUME HERE

Prepare and compile one compact Lean replacement for `exists_twist_on_divergent_set` using (CE) and the actual `zero_density_quadTwist` Big-O witness; compare its exact downstream statement with RUN97 and audit standard axioms plus constructor-inclusive roots. Do not reprove the signed Landau caller or the endpoint grid.

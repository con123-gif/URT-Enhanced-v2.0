# MO430643 bounded primary literature review

Verdict: **no exact settlement located in the primary papers and sections reviewed**. This is a bounded negative finding, not a claim of novelty or priority.

The exact target is Spiga’s [2022 MathOverflow question](https://mathoverflow.net/questions/430643/an-arithmetic-inequality): for distinct primes and all exponents at least two, the product of `p_i^(a_i^2/4)` is bounded by `r^(log_2(r)/4+1-ell)`, outside `36,72,900`. Scout owns the full source history, current comments/answers and eligibility gate.

## Pablo Spiga, 2022-10-06

[An explicit upper bound on the number of subgroups of a finite group](https://arxiv.org/abs/2210.02972)

Read: Sections 2–4; all arithmetic statements and final bound. Theorem 1.1 bounds subgroup counts by 7.3722*r^(log_2(r)/4+1.5315). The per-prime arithmetic uses S(p,a); the explicit remaining exponent and constants prevent identifying this theorem with the source arithmetic inequality.

## Marco Fusari and Pablo Spiga, 2023-04-27; v2 2023-09-14

[On the maximum number of subgroups of a finite group](https://arxiv.org/abs/2304.14200)

Read: Sections 2, 4; proofs in Sections 7.2–7.4; remaining statements scanned. Theorem 1.1 is the sharp subgroup bound c(2)*r^(log_2(r)/4). Arithmetic reductions in Lemmas 4.1–4.3 concern a different function involving S(p,a), c(p) and normalizer factors; their reductions assume p_1=2, a_1>=2, ell>=3. No exact full source implication was identified.

## Lorenzo Guerra, Fabio Mastrogiacomo and Pablo Spiga, 2025-05-01

[Counting subgroups of a finite group containing a prescribed subgroup](https://arxiv.org/abs/2505.00413)

Read: Section 3 arithmetic observations and final assembly; theorem statements. Theorem 1.1 bounds intervals by 7.3722*[R:T]^(log_2([R:T])/4+1.8919). Lemmas 3.3–3.4 and Proposition 3.5 reuse per-prime S(p,c) estimates. No exact source inequality or its exception set was located.

## Sebastien Palcoux and Pablo Spiga, 2026-09-09

[Sharp bounds for intervals in finite subgroup lattices](https://arxiv.org/abs/2609.10343)

Read: Theorems 1.1/1.3, Corollary 1.2 and weighted packing consequences Sections 2–4. The sharp interval bound uses a least prime divisor, weighted generating-tuple packing and a discrete Gaussian sum. It does not state the source prime-power product inequality or the exceptions 36,72,900; no full source implication was identified.

## Exact comparison with the closest arithmetic reduction

Put `g = log(r)/(4 log(2)) - sum_i a_i^2 log(p_i)/(4 log(r)) - (ell-1)`. The source inequality is `g >= 0`. The auxiliary `f_bar` in Fusari–Spiga (2023), equation (4.6), differs by

`f_bar - g = [log c(2) - sum_i log c(p_i) + (ell-2)log(2)]/log(r)`.

Their monotonicity reductions establish different good-number conditions under additional hypotheses. The resulting subgroup theorem is not the exact source inequality. No complete implication covering all eligible source integers was identified in this bounded review. These close methods and results should be acknowledged in any resulting proof.

Exact-formula, title, source-ID and exception-set searches were checked with both search engines. They located the source and unrelated hits, without an additional exact resolution. No assertion of exhaustive literature coverage is made.

Full third-party PDFs/text remain in the local reading cache and must not be bundled into a public checkpoint. `AUDIT.json` records original URLs and SHA256s. This review claims no Lean pass, submission, acceptance or priority.

Audit: ChatGPT/Codex (GPT-6; exact serving variant not exposed).

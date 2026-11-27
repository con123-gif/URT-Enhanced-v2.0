# MO513259: source, eligibility and prior audit

This is a bounded source/prior audit, not an assertion of exhaustive novelty or first priority. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex and independent AI research lanes. Exact serving model variant is not exposed.

## Primary question and scope

[MO513259](https://mathoverflow.net/questions/513259) asks two explicit conjectures for simple-graph adjacency matrices: inverse permanent 1 modulo 8, and 2 per(A)+per(A^-1)-3 zero modulo 24, under the respective modular invertibility assumptions. Its final sentence tentatively suggests arbitrary symmetric even diagonal. The canonical statement retains both graph conjectures, all finite sizes, symmetry, zero diagonal and 0/1 entries. The two tentative extensions are separately refuted by small exact witnesses in the same proof file; they are not substituted for the graph claims or counted as extra targets.

The entire primary body was read, including all answers and comments. Fresh StackExchange API reads at 21:28 UTC on November 27, 2026 returned the unchanged body, zero answers and zero comments, with has_more=false. The primary body SHA-256 is df1ddd83f5ea21e245a67c32c71ddebb817dd1ae18ee5dc6ff79258c559c5d25. The related MO513095 question, its one answer and all comments were read: its known modulo-four background does not state this modulo-eight inverse-permanent closure.

The live agent brief generated at 21:38 UTC still identified MO513259 as unformalized, with zero agents and the exact same original question. Preclaim live API at 21:40:04 UTC returned HTTP 200, unformalized, zero live agents and no solution. Proper upstream all-state searches `is:pr 513259` and `is:pr "mo-513259"` returned zero preceding PRs immediately before the authorized claim. The later official PR #12514 is ours, not a pre-existing competing submission.

## Prior mathematics explicitly credited

- Anna Knezevic, Greg Cohen and Marina Domanskaya, [arXiv:1710.01783](https://arxiv.org/abs/1710.01783), *Some Facts on Permanents in Finite Characteristics* (2017). The full primary PDF was retrieved, and the relevant theorem section was read. Page 21, Lemma II.2.5.1 and its immediate specialization give the characteristic-three inverse-permanent identity. That theorem is known background, independently formalized here, and earns no separate new-solution count. The correct author name is Greg Cohen.
- Darij Grinberg's comments to [MSE2688219](https://math.stackexchange.com/questions/2688219/about-the-determinant-of-a-symmetric-matrix-with-even-diagonal) (2018). The complete primary page and all six comments were read. They give the even symmetric perturbation determinant congruence used as one helper. They do not state the inverse-permanent congruence in the inspected material.
- Standard determinant identities, symmetric Schur elimination, characteristic-two alternating forms and the Chinese remainder theorem are acknowledged as prior mathematics. Block permanent and simultaneous reindex proofs adapt actual Mathlib determinant proofs, retaining their source attribution.

Bounded web and repository searches considered the target ID and inverse-permanent/congruence descriptions, rather than treating absence of a target-ID mention as a complete literature audit. A fresh Trure repository search had eight literal numeric matches, all embedded in unrelated larger decimal numbers; exact bounded-ID mentions were zero. Potentially relevant permanent/inverse blueprints inspected there concerned other real inverse-M or complex Cauchy inequalities. No exact earlier closure of these two graph conjectures was located in the bounded audit. No exhaustive search, human peer review or priority conclusion is asserted.

## Exact verified result and integrity

The canonical proof SHA-256 is 50565c78756547a97d545bdc8474329ffed77ba0de4d221c92b61db9814fbf47; statement SHA-256 is 236cc7849d274d12067daf1290bb8ff29656797468a5c07235fdc6ae5a2d2980. Full-source pinned run 46070716771/job 140746737115 at b902c7b397bbdb7db4c14def003e952afbe3811b has actual artifact compiler exit 0, no errors in any form and OMA.solution using only propext, Classical.choice and Quot.sound. An independent whole-source audit byte-matched the public probe and reconstructed the exact statement plus entire proof body.

Earlier partial checks were corrected after an artifact-exit audit caught a tagged compiler error in an unused simp argument. Historical failures are retained, and no solve/acceptance was counted from them. The final full-source second probe uses the repaired source and observed exit 0. Finite screens are not used as an infinite proof.

## Actual contribution route

A single authorized documented claim returned HTTP 200 at 21:40:37 UTC, for con123-gif/codex-combinatorics-mo513259, role lead, no teammates or earlier notes. The assignment was held privately with mode 0600. PLAN note #51252 returned HTTP 200; fresh heartbeat returned HTTP 200 at 21:41:40 and showed only our PLAN. Official statement PR #12514 was then created, author con123-gif, head 1dd44e31a8f5a043ae04e21cebd1f581765ac2cd, exactly one added 37-line statement. DONE note #51482 returned HTTP 200 at 21:43:35; submitted release returned HTTP 200, ok true at 21:43:42. No lease remains held, and no token is included in this audit.

[PR #12514](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/12514) awaits official checking and human statement review. It is not an accepted full-proof submission. Both source conjectures constitute one target; known background and optional-extension witnesses are not separate solves. Public attribution and campaign acceptance must follow the eventual official full-proof verdict and merge.

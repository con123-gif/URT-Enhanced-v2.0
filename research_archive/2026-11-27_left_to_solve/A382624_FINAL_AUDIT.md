# A382624: final independent source/proof audit and claim handoff

27 November2026. Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6; exact serving variant not exposed. This is one full conjecture, not an extra count for its complementary formulation A382623.

The complete current primary [A382624](https://oeis.org/A382624/internal), [A382621](https://oeis.org/A382621/internal), and [A382623](https://oeis.org/A382623/internal) records were fetched with HTTP200 and fully read. A382624 revision12 still conjectures that its defining set is the sorted range of A382621. A382621 revision24 defines the lexicographically earliest stream of distinct positive integers such that each even digit has a larger previous digit. A382623 revision9 asserts the equivalent missing-number conjecture.

The exact formal statement and the entire clean proof were independently read. The adjacent pair(d,e) has condition e even implies e<d. Positivity is required, but internal zeros are allowed:10 and20 are source terms. Seed9 imposes no restriction on the first positive candidate, so the minimum is1, matching the source. The first/last digit defaults for zero do not add a forbidden zero term because admissibility requires positivity.

Full mathematical proof: repdigits of j+1 nines are admissible, distinct universal connectors. Their first digit9 is odd, so they follow every predecessor. Their last digit9 exceeds every possible even first digit of a target, so they precede every admissible target. A finite used set leaves a fresh connector, proving genuine infinite extendibility before any coverage assertion. Fresh selection proves injectivity. Omission of any fixed connector would bound the whole injective sequence by that connector. Omission of any valid target would bound the infinitely many distinct connector successors by the target. Both are impossible bounded injections. This proves the entire source range iff, including all original boundary cases. No source or mathematical gap was found.

Prior work is documented in `DIGIT_VARIANTS_PRIOR_AUDIT.md`. The actual Karlsson/Sloane documents concern the distinct A342042 concrete rule, with the earlier fairness method explicitly credited. The actual inspected Savitt documents supply no parameterized theorem for this target; the A383250 Overleaf body remains an explicit inaccessible-document scope limit. No exact earlier settlement was located in the completed bounded primary/code checks. This is not a universal novelty assertion.

Proper default-all-state upstream REST PR searches, with `is:pull-request` and no state qualifier, returned0/incomplete=false for target382624 at17:42:31 and base382621/complement382623 at17:43:42. The newest100 upstream pull titles/bodies had no matching target/base/complement at17:42:31. The live problem API returned actual HTTP200 at17:42:35, kind=unformalized, liveAgents=0, solution=null.

The actual pinned full-proof log was independently fetched: run46043313956, job140656233200, commitb126414547b3c05d712d741a6e93fbca3c3f4335, Lean4.33.1 and formal-conjectures pin9097e2f90e66d2f6244209cb1c07f7120d17ec53. At17:39:05 the complete OMA.solution reports exactly propext, Classical.choice and Quot.sound. The expected statement-main sorry warning is separate; the complete solution has no sorry dependency. The canonical-import proof must be replayed after the statement actually merges.

Canonical statement: `reversal_work/fresh/a382624_statement.lean`, SHA256 `28881a7296da5822211f5a8b1e10ce3388f33e19f5f83f9947521f8d3ce14de2`.

Canonical complete clean proof: `reversal_work/fresh/oeis-a382624_proof.lean`, SHA256 `0cb93324f45152504c99de470979671a78f998d088c7f00d4275fcccff44ab95`.

Frozen complete probe: `reversal_work/fresh/ProbeA382624.lean`, SHA256 `4e037f4fb6c86c6acb016fb9dcba7f0d9bede5c421aeb5c0eb6b40be4bed18b1`, uploaded as campaign/ProbeA382624Pred.lean. A separate independently downloaded source copy and actual log segment are preserved beside this audit.

Exactly one local claim was attempted, supported POST with unique agent `codex-algebra-a382624`. It returned actual HTTP500/non-JSON at17:43:47 UTC. The failed private0600 response contains no usable lease; no PLAN, heartbeat, official PR or successful release is inferred. The root explicitly instructed STOP further local claims so its secure Actions operator can recover one lease atomically. That stop was followed. All subsequent actions in this audit lane are local artifacts or read-only research. The prepared PLAN body is `A382624-plan.txt`, ready only after an actual recovered lease is supplied.

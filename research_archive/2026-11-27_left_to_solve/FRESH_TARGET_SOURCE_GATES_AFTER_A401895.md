# Fresh target source gates after the A401895 partial checkpoint

Campaign: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2 Astra).
Date: 2026-11-27 UTC. This is an AI research/source audit, without a claim of human review.

**No completed new problem, Lean certificate, official submission or acceptance is asserted by this document. No new count is added.** No lease was acquired during this scouting round. The mathematical search programs below are bounded screening, not infinite proofs. Existing statement or open catalogue labels were not treated as evidence that a problem remains unsolved.

## Decisive existing full resolutions

| Catalogue target | Actual inspected resolution | Scope and disposition |
|---|---|---|
| mo-505955 | [Accepted MSE answer 5115734](https://math.stackexchange.com/a/5115734), linked from the original MO discussion | The cyclic-group Zariski-closure argument finds an LU power for a nonzero exponent; inversion and order reversal handle a negative exponent. This proves the original permutation-conjugated positive-power statement. Excluded before Lean. The independently noticed stronger fixed-permutation variant is not a new solution of this original problem. |
| mo-508592 | [Actual counterexample text](https://pastebin.com/raw/6WBWjsHn), linked from the [original source](https://mathoverflow.net/questions/508592) comments | Fully read. Its 4-by-4 matrices are invertible, have no common eigenvector, and every centralizer-product characteristic polynomial has a repeated root. Exact symbolic identities checked. The source comment's uncertainty about AI provenance does not invalidate the displayed mathematics. Excluded. |
| mo-462193 | [Actual answer 514262](https://mathoverflow.net/a/514262) | Fully read. A lazy directed 23-cycle at k=37 gives an exact trace-average deficit. The older partial answers do not replace this newer complete counterexample. Excluded. |
| mo-499788 | [Full proof PR 10258](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/10258) | Already a foreign full proof submission, using deletion of a separating tree edge and the matrix-absolute-value Frobenius inequality. Do not duplicate it. PR 8916 is the earlier merged statement. No new checker or merge verdict is inferred here. |
| mo-496666 | [Actual full answer 499110](https://mathoverflow.net/a/499110), also acknowledged by [OEIS A014307](https://oeis.org/A014307) | Full recurrence derivation and generating-function ODE read. It includes the general m-parameter assertion, not only m=2. Excluded. |
| mo-495545 and mo-491242 | [Bowles, two requested recurrence proofs, 2026-10-19](https://sulayman-bowles.dev/research/mathematics/two-requested-recurrence-proofs) | The inspected primary author page supplies complete arguments for both exact requests. No certification of worldwide priority or human peer review. They are not fresh targets for this campaign. |
| mo-483753 | [TrureTuring DyadicPochhammerCoefficient source](https://github.com/the-omega-institute/trureturing/blob/0c5e234a3f0db8c532cb0d2e22af3491c92077f8/Blueprint/D5/S1/Recurrence/Parity/DyadicPochhammerCoefficient.md) | The full blueprint was read. The literal coordinate correspondence already gives the whole signed factorial-basis identity after changing the polynomial variable's sign. Exact MO-URL search returning zero does not override this semantic match. Excluded. |
| mo-500240 | [Original source comments](https://mathoverflow.net/questions/500240) | Ilya Bogdanov already gives a four-point counterexample using a triangle and an interior point near an opposite circumcircle point. All source comments were read. Excluded. |

The following are **withheld**, not falsely certified as prior proofs: mo-508893 has an author comment stating that an approximately eleven-page complete proof was found for a forthcoming paper, but that manuscript has not been inspected. No research priority or completion is claimed. The MO478520 comments identify the standard permutation-matrix-span result and its skew-symmetric analogue; these are not fresh conjectures to repackage without a full scope audit.

## Complete source reads and bounded searches without a result

### MO498823: balanced perfect matchings with doubled edges

The complete current question, comments and answers were obtained through the official Stack Exchange API. The linked predecessor [MO496317](https://mathoverflow.net/questions/496317) and its actual accepted counterexample were also read. That older undoubled K4,4 counterexample is explicitly not a counterexample after the new source's edge doubling.

An exact integer-program model was tested on 172 bounded instances: complete bipartite sizes 5, 6 and 7 and two circulant families, seed 20261127. All were feasible, and every returned integer solution was rechecked against the exact incidence and ordered-pair inequalities. This proves only feasibility of those instances. No infeasibility or general theorem resulted. The numerical range was not increased indefinitely.

Local reproducible files: `mo498823/search.py` and `mo498823/search_results.json`.

### MO514243 and its exact MSE4815847 alias: Pascal-triangle line cuts

Both current source posts and all available comments/answers were read. The exact alias already has merged statement PR6521 and open reduction PR10353. The full 212-line reduction was read: its finite direction normalization leaves an unbounded remainder. Extending a finite search or repeating that reduction would not solve the source problem. No full proof or counterexample was obtained.

### MO511211: Toeplitz pseudospectral barrier monotonicity

The complete current original question was read; its current API answers/comments were empty. Proper all-state exact-ID PR search and exact global source-URL search returned zero. A meaningful Toeplitz-plus-pseudospectral search in TrureTuring also returned zero. These are bounded search results, not proof of worldwide absence.

The bounded floating-point screen compared 1,100 adjacent-size barrier values (n through 22 and 55 sampled parameters). It found no violation. This is **not** exact verification, a proof, or a submitted certificate.

Local files: `mo511211/search.py`, `mo511211/search_results.json`.

### MO469696: sparse movement of a Cauchy-kernel frequency

The complete current question and its actual two comments were read; no answer was returned. A 16,000-case floating-point screen of positive perturbations and matrix sizes 3 through 10 found no violation. This does not prove monotonicity; no attempt was made to exploit the source's implicit positivity convention by choosing a negative perturbation.

Local file: `mo469696_search.json`.

### MO338936: operator norm under a rectangular entry cover

The complete current original question, its sole posted answer 338942, and all three comments on that answer were read. The answer's cancellation argument is invalid, as the asker explicitly points out; it was not counted as a valid prior proof. The deleted MSE predecessor could not be independently read. Exact-ID all-state PR search and exact global source-URL search returned zero. The broader semantic literature audit remains incomplete.

A bounded numerical optimization screened 280 small real-matrix/rectangle-cover instances, plus the fixed three-principal-rectangle cover on complex 3-by-3 matrices. No violation was found. These are exploratory floating-point searches only, with no exhaustive claim, exact witness or general proof.

Local files: `mo338936_search.py`, `mo338936_search_results.json`.

## Candidate under a separate literal prior audit

MO480589's current original source has no answers or comments in the inspected API response; proper all-state PR, exact source-URL and meaningful A069999 TrureTuring searches returned zero. Its polynomial recurrence appears to enumerate positive compositions with exponent equal to the sum of binomial(part,2). The affine map e to 2e+n identifies its support with partition-square-sum values, the explicit alternative definition in OEIS A069999 revision 91.

This is only an informal candidate at this checkpoint. Closely related prior primary work is being inspected, especially Aurzada–Raschel (2025), *Persistence probabilities for MA(1) sequences with uniform innovations*, Corollary 2, and Brouder–Keith–Mestre (2015), *Several graph sequences as solutions of a double recurrence*, Theorem 2. Neither an unread abstract nor a different weighted composition sum is automatically a clearance of the exact original claim. No novelty, completed certificate, claim, or publication is asserted.

## Audit limits

Single-question API queries were used to check answer/comment counts after a batched response unexpectedly omitted existing answers; web primary-source reads independently caught this. Numeric code-search hits can be internal certificate digits. No statement of complete global Lean absence is made for searches whose individual numeric hits were not read and cleared. Raw PR bodies and assignment files are excluded from this public checkpoint.

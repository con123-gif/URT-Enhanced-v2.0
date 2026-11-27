# A381423: exact source, prior scope, and attribution

27 November 2026. No lease or official contribution has been made for this target at this stage. Full certification is still being checked.

The current primary OEIS JSON was retrieved HTTP200: A381423 revision8, author Mike Sheppard, defining the signed-coefficient maximizer of the physicists Hermite polynomial at every natural order including zero. The H5 example and both source programs distinguish signed maximization from absolute values. Its full conjecture includes the1/−3 differences,4/5 difference blocks, informal spacing and square-root growth. Live catalogue and all-state PR checks at18:02:33 UTC found unformalized status, zero agents, no solution and zero exact-ID PRs. A final fresh race check is required before any eventual claim/submission.

## Positive prior result: already-known difference clause

The primary public TrureTuring dossier explicitly marks only the independent1/−3 clause proved, and explicitly leaves signed uniqueness, fine blocks, spacing and growth unresolved/outside its claim:

<https://www.trureturing.org/research/oeis-a381423-hermite-differences/>

The ACTUAL complete Lean source was fetched and read, not just its dossier:

<https://github.com/the-omega-institute/trureturing/blob/1b672a9b9ddf56469cac348e77e27f078420eb6f/D5/S3/Analytic/Polynomial/HermiteSignedMode.lean>

It is294 lines. Its coefficient formula, polynomial extraction, quartic threshold, maximality selector and mode-step argument culminate in a conjunction of the exact signed-selector certificate and the1/−3 difference law. The file expressly assumes/concludes no uniqueness and contains no triangular/square-root cutoff, full fine-block parameterization, E/K spacing laws or growth theorem. The entire existing assertion is therefore prior work and must not be counted again as a new solution.

The new candidate retains those known facts and proves the source's complete finer characterization. The key simplification of the existing quartic ratio is P4(j)+4=(j²−3j+1)²+3, yielding an exact triangular threshold, unique signed maximum, a closed mode formula and all block/spacing/growth assertions. Those results are stronger than merely reprinting the earlier independent difference clause. The full faithful theorem retains the actual signed Hermite polynomial maximizer and proves its agreement with the formula; it does not define away the source problem.

The published source coefficient/selector helpers have been adapted with explicit TrureTuring attribution; their public Apache2.0 license was fetched and preserved in full in the certificate comments. The project and DLMF classical coefficient formula are acknowledged as prior mathematics. No new-method or historical-priority claim is made for the reused helpers or the already-proved difference clause.

## Literature and bounded absence findings

Primary DLMF18.5.13 supplies the physicists coefficient formula. The exact primary source and current related absolute-mode/tie records were read to prevent a normalization or tie-convention substitution.

Strong web searches for the exact target, signed maximal Hermite coefficients, the8n+17 formula and triangular cutoffs found the OEIS record, the acknowledged TrureTuring partial result and related absolute-mode/tie results. No earlier exact full signed-mode/block theorem was located in those bounded checks. TrureTuring issue25634's current public comment endpoint returned an empty list; no uninspected comment was treated as proof.

The primary paper Bonneux–Dunning–Stevens, *Coefficients of Wronskian Hermite polynomials*, arXiv1909.03874v2, was actually downloaded as PDF and text extracted successfully. Its abstract/introduction and normalization were read, and its complete extracted text was searched for maximal/largest/mode/unimodality and related coefficient terminology. Its basic normalization is monic probabilists Hermite, and the inspected discussion concerns Wronskian coefficient formulas, core/quotient partitions and zeros. No matching signed physicists-mode/fine-block assertion was found in that inspected scope. This is not represented as an exhaustive reading of all41 pages or a priority certificate. Broad full-text literature searches produced unrelated Hermite-expansion approximation results rather than an exact matching theorem.

These are bounded prior checks. They do not certify global historical novelty, and source conjectural wording alone does not do so either. The positive prior difference theorem is explicitly preserved and excluded from new-solution counting.

## Independent challenge and actual checking status

The fresh-algebra lane independently read and challenged the ENTIRE new hand argument and reported mathematical PASS: ratio/cutoff, low-order cases, Euclidean/Nat remainders, every E_q+4r jump, endpoint gaps, period8 spacing and sqrt bounds. The reviewer then read ALL294 lines of the actual earlier source and confirmed its exact prior scope. The complete quartic-threshold selector algorithm and its source certificate are existing mathematics, not merely a naked difference conclusion, and are fully credited. No hidden triangular Q, signed uniqueness, E/K full jump set, period8 law or growth theorem was found in that module. This independently supports the stated scope distinction, while not certifying global novelty outside the inspected sources.

The original source's79 terms match exact signed-coefficient calculations. A separate fixed finite certificate checks all signed coefficients, unique maxima, exact mode formula, every jump and4/5 block, spacing identities and sqrt bounds through transitions0..500, using orders0..501. It is an error check, not an infinite proof.

Both official static linters pass for the complete source statement and clean canonical proof. Actual selector development run46049255576 checked the new source-to-closed-form theorem but had one ordered-multiplication API error, which was repaired. The first full run46050067989 found finite initial-case reduction and a small choose-value proof issue; both were repaired without changing the statement. The ENTIRE complete certificate then passed actual Lean4.33.1 at formal-conjectures pin9097e2f90e66d2f6244209cb1c07f7120d17ec53: run46050735604/job140681094261, commit00e8488018183316ee9f0cb1a32767b4e332595a. Its OMA.solution depends only on propext, Classical.choice and Quot.sound; no errors/sorryAx, exit0. Exact immutable statement/proof/probe files were independently fetched and byte-matched locally. This is a full combined certificate pass; canonical-import checking after human statement merge and official proof acceptance are separate, still-pending stages. One direct formalization claim failed500 without a token, and further claims were stopped for secure recovery.

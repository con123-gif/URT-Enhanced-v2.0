# Remaining predecessor-rule digit variants: bounded prior audit

27 November 2026. No leases or site mutations were performed for these targets by this audit lane.

| Exact target | Greedy source | Literal defining set | Source domain |
|---|---|---|---|
| A382465 | A382462 | every internal even digit has an immediately preceding smaller digit | positive integers |
| A382624 | A382621 | every internal even digit has an immediately preceding larger digit | positive integers |
| A383062 | A383059 | every internal odd digit has an immediately preceding smaller digit | nonnegative integers |

All six current primary pages were fetched and read in full. Each range-identification claim is still labelled a conjecture, with no exact proof link. TrureTuring catalogue and actual repository exact-ID searches returned zero for every target and base sequence. Global Lean exact-ID searches returned zero for all three targets, complete results. The complete previously downloaded Eppie/oeis-proofs archive was searched for all three IDs and had no match. Strong web searches found only primary records, computational mirrors, and the distinct related claims discussed below. These are bounded absence findings, not global priority assertions.

The precise domains matter. A382624 permits zero digits internally: 10 is a source term. A383062 includes the number zero. A382465's rule automatically forbids internal zero because no digit is smaller than zero. The proposed connectors are mathematically valid in both directions: repunits of digit 1 for A382465; repunits of digit 9 for A382624; numbers 2·10^(j+1) for A383062. In the last case the leading and internal connector digits are all even, and the final zero precedes every admissible positive odd leading digit.

## Actual earlier document scope

Karlsson's A342042 PDF and Sloane's alternative TXT were previously downloaded and read in full. They state concrete theorems for the distinct even-digit/next-larger rule, not a theorem parameterized by arbitrary digit relations. Sloane's broad fairness/least-missing-term method is prior mathematics and must be credited in any new implementation.

The actual Savitt A383250 Overleaf document remains inaccessible: both public web open and direct curl yielded the site's error page, with no project body or PDF. Its underlying theorem scope has not been certified.

The accessible [Savitt A383500 document](https://oeis.org/A383500/a383500_1.pdf) was downloaded and read completely as `A383500-Savitt-proof.pdf` and extracted TXT. Its theorem is only the concrete A383500/A382935 complement claim; it contains no parameterized connector theorem. Moreover, its displayed argument is not a valid greedy-coverage proof:

* It defines the set called A382935 directly by the local digit condition, then identifies that set with the greedy sequence without proving coverage.
* Its definition of the alleged complement uses a universal condition where the source requires an existential violating digit. Under the literal definitions, the positive integer 2 belongs to both sets because every odd-digit condition is vacuous, contradicting its disjointness lemma.
* Its completeness section switches to the different followed-by-smaller/not-ending-in-one condition.

Thus the OEIS record's claimed theorem should not be treated as an independently validated general proof. This criticism is based on the actual document, with a concrete counterexample to its intermediate definitions; it does not claim the source's final complement statement is false.

No actual inspected document states any of the three exact target claims or a parameterized theorem encompassing them. The inaccessible A383250 underlying document remains the named limit of this conclusion.

# A158960: accepted formalization, mathematical priority not established

27 November2026. Independent audit for Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6. Recommendation: retain the correct accepted Lean proof, but exclude this target from a conservative minimum of genuinely new mathematical resolutions. A source's lingering conjecture label and a site's successful proof merge do not establish historical novelty.

## Verified status and earlier primary evidence

Official proof [PR7817](https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7817), author con123-gif, is merged; the REST record gives merged_at=2026-11-27T17:13:23Z and head=f7c47131afe2c9b3c693fcc8102b50780cf6881d. The exact accepted proof was independently fetched from that frozen head and read. It proves the full denominator statement by constructing the scaled integer numerator and showing that5 never divides it. This audit finds no mathematical or source-normalization defect in that proof.

The full current [OEIS record](https://oeis.org/A158960/internal) and all28 revisions on the three pages of its [primary history](https://oeis.org/history?seq=A158960) were fetched with HTTP200 and read. The current denominator comment still calls the result conjectural. Nevertheless, revision21,9June2018, already adds Greubel's unqualified identity

\[
 a(n)=5^n H_n(1/5),
\]

where the entry defines a(n) to be the reduced numerator. The same block gives the consistent exponential generating function exp(2x−25x²). Revision25,6February2021, changes the numerator recurrence from conjectural wording to a D-finite recurrence with a DLMF reference. This is evidence of an earlier exact-equivalent assertion, not an actually located standalone historical proof of the denominator claim. No such proof date is invented here.

There is also a genuine transcription error in the2018 block: its final displayed sum equals H_n(1/5), not the integer numerator. At n=1 that sum is2/5, whereas a(1)=2. That error means the whole block is not a self-contained correct proof; it does not erase the earlier correct first identity or generating function.

## Exact equivalence of the earlier identity

Write H_n(1/5)=A/B in lowest terms, with B>0. Greubel's stated identity is A=5^n A/B. Nonvanishing gives B=5^n immediately.

Nonvanishing requires no new Hermite theorem: classical physicists' Hermite polynomials belong to Z[x] and have leading coefficient2^n. The rational-root theorem says that the denominator of a rational root divides the leading coefficient. Since5 does not divide2^n,1/5 is not a root. The existing Mathlib file RingTheory/Polynomial/RationalRoot.lean contains the general theorem den_dvd_of_is_root. Thus the accepted denominator claim follows from the earlier source identity and a standard classical fact.

## General denominator result and its elementary derivation

More generally, let f∈Z[x] have degree n and leading coefficient c. If p/q is reduced, q>0, and gcd(c,q)=1, set N=q^n f(p/q). Then N is an integer and

\[
 N \equiv c p^n \pmod q.
\]

Consequently gcd(N,q)=1 and gcd(N,q^n)=1, so the reduced denominator of f(p/q) is exactly q^n. This is an explicit mathematical deduction from standard polynomial arithmetic, not a claim to have located a separately published theorem with that exact wording.

Apply it to the physicists' H_n, for which c=2^n. For every reduced p/q with q odd, the exact reduced denominator of H_n(p/q) is q^n. In particular p=1,q=5 gives A158960. The classical facts used here follow directly from [DLMF18.9, Table18.9.1](https://dlmf.nist.gov/18.9.T1): H_0=1,H_1=2x,H_(n+1)=2xH_n−2nH_(n−1). The independently fetched [DLMF18.5.13 explicit expansion](https://dlmf.nist.gov/18.5.E13) gives the same leading term and integer coefficients. No special-function irreducibility result or new valuation method is needed. Mathlib's own Hermite polynomials use the other normalization; the accepted file correctly uses the source's physicists' recurrence.

## Honest classification

The contribution is a valid accepted independent formalization of the exact source denominator statement using standard algebra. Its existing PR body already acknowledges Greubel2018 and disclaims new-method or first-publication priority. We found a prior exact-equivalent source identity and an immediate general classical denominator argument, but did not locate an earlier standalone proof specifically labeled as resolving Hasler's conjecture. Accordingly, neither first-ever mathematical resolution nor a precise prior-proof publication date should be claimed. For the user's stricter genuinely-open minimum, exclude this case conservatively rather than treating acceptance as evidence of novelty.

No lease was claimed, no external message was posted, and the accepted proof files were not modified during this audit. Source/accepted-proof hashes are preserved separately.

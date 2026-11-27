# A385478: a complete finite counterexample

2026-11-27. Cornelius Lytollis (@con123-gif), assisted by ChatGPT. Source conjecture: Felix Huber (2025). This note records an exact informal disproof; a Lean compiler pass and official acceptance are separate requirements.

## Literal source and target

The official OEIS mirror, sequence A385478 revision 7 (2025-07-06), defines a(n) as the smallest divisor of sigma(n) absent from the union of divisor sets of sigma(k), for all 1 <= k < n; it is zero when no new divisor exists. Its sole conjecture says every newly appearing divisor is a multiple of a(n).

Primary: https://oeis.org/A385478 . Official source mirror: https://github.com/oeis/oeisdata/blob/main/seq/A385/A385478.seq . The complete source is preserved locally as A385478_SOURCE.seq. The source's Maple and PARI code were read in full. A385467 revision 11 states the exact set-difference formula, and A385479 revision 11 states the union convention. Both complete entries were read. A027750 and A062068 were also read to check the standard divisor and sigma conventions.

The frozen Lean statement uses sigma(n) = sum of all positive divisors of n, filters divisors of sigma(n) against every earlier positive index, and applies the source's minimum-or-zero convention. It retains the full universal claim, not a weakened finite version or a separate supplementary assertion.

## Counterexample and exact finite verification

At n=1787,

    sigma(1787) = 1788 = 12 * 149.

Its positive divisors are

    1, 2, 3, 4, 6, 12, 149, 298, 447, 596, 894, 1788.

The first indices k for which each divides sigma(k) are respectively

    1, 3, 2, 3, 5, 6, 1489, 1489, 1787, 1787, 1787, 1787.

Therefore the exact newly appearing set is {447,596,894,1788}; its least element is 447, and 596 = 447 + 149 is not a multiple of 447. This refutes the universal conjecture by one finite witness.

Two independent exact algorithms agree: the Number lane used an integer sigma sieve plus divisor factorization, while the Combinatorics lane enumerated divisor pairs for every k. The reproducible sieve is A385478_counterexample_screen.py and its result is A385478_COUNTEREXAMPLE_SCREEN.json. These computations establish this finite counterexample; no unbounded conclusion is inferred from merely searching a range.

## Smaller kernel-certificate route

Only one finite classifier is needed: for every 1 <= k < 1787, if 149 divides sigma(k), then k=1489. Direct evaluation gives sigma(1489)=1490=10*149, so neither 447=3*149 nor 596=4*149 divides any earlier sigma(k). Both divide sigma(1787), hence are new.

If the conjecture held, a(1787) would divide both 447 and 596, hence their gcd 149, and consequently sigma(1489)=1490. But the minimum of a nonempty new-divisor set is itself new, so it cannot divide an earlier sigma. This contradiction avoids evaluating the full minimum or all new divisors inside the final Lean proof. It preserves exactly the original conjecture.

## Bounded prior and eligibility audit

Proper default-all-state upstream PR search for the exact ID returned zero; exact-ID searches of the actual TrureTuring repository and global Lean files also returned zero, all with incomplete_results=false. Exact-ID and numeric-counterexample web searches in both engines found no prior resolution in the inspected scope. The complete related entries above contain no settlement. This is a bounded audit, not a global priority assertion.

Direct current OEIS HTML/history/b-file and Left to Solve live/brief GETs returned 403 from this execution host. The official mirror is available and supplies the complete revision-7 statement. All seven interactive OEIS revision discussions have not been read; that access limitation is explicit. No claim operation has been attempted on the basis of the read-endpoint failure. Current site eligibility and participation gates must be independently refreshed through the established authorized route before a lease or submission.

## Actual complete certificate

The complete source-faithful Lean disproof now passed the pinned compiler in run 46082195225, job 140783468333, immutable commit 90b32d612c887aea4424179a0a684ef4e1baf576. Its selected compiler exit is 0, no errors occur in any form, and OMA.disproof uses only propext, Classical.choice and Quot.sound. The generic sigma product formula and the entire finite 149-classifier independently have the same permitted axiom list. The unmodified official statement checker accepted the prototype with errors[]. This fork preflight is not an upstream full-proof acceptance.

The downloaded artifact 15237388112 ZIP has SHA-256 2f74cf02042236ac11a4ff7672fb432d0df09fed7d7e2fdb2c8acdd3cf10c8e7, exactly matching GitHub's artifact digest. Final source SHA-256: 5e741baa5db69b540e94bde20caf6264d0c0dd7eff4646f45e02f1859f351da3. Final complete proof SHA-256: 32b97984398a70169f210f0af9fe73358704f941518d3f2dc5238f8b0fabd0b1. Public combined probe SHA-256: a91c7ad2bd3f8ee7b771581ee13c9e4429b9338be19b68c5934d271f500064a9. Both the entire source prefix and the whole proof body were independently byte-compared with the public checked probe.

The finite classifier evaluates sigma through Mathlib's generic exact prime-factor geometric-product identity, proved equal to the literal source divisor sum for every positive input. The classical implementation of the finite freshness predicate does not change its mathematical definition. The final proof does not use any external numerical assertion. Earlier interrupted or erroneous versions are not counted as certificates.

Formal statement registration and the subsequent imported-target proof stage remain distinct. No upstream full-proof acceptance or historical priority is claimed here. Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex; model GPT-6 (exact serving variant not exposed by this runtime).

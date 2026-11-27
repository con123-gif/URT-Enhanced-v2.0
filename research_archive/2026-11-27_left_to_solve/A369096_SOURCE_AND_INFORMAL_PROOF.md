# A369096: primes have relative density zero

27 November2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex and collaborating AI proof/review agents. The COMPLETE source-faithful proof passed the actual pinned Lean kernel in run46076524016/job140765412897, compiler exit0 and only propext/Classical.choice/Quot.sound. The unmodified official statement checker accepted the translation for human review in run46076706645/job140766009187. No official full-proof acceptance is asserted.

## Exact target and bounded source audit

The entire current primary OEIS entry A369096, revision19, was read, including its counting table, examples and both programs. For k>=2 define membership by omega(k) dividing T(k)+T(k+1), where omega counts DISTINCT prime divisors and T(k)=k(k+1)/2. Let C(N) count such k with2<=k<=N. The conjecture means pi(N)/C(N)->0 with the SAME inclusive value cutoff; its table confirms this interpretation. It does not ask merely for the known zero density of primes among all integers. Every prime is a member, so pi(N) is also exactly the numerator of the source's proportion.

All19 recorded history changes and all their discussion were read across the newest10 and older9 changes. The conjecture is present from revision2. The changes add data, compact the table, correct a reference and offset, and fix a parenthesis. No historical proof or withdrawal was found. The direct related entries A090777, A356410, A369093 and A369097 were retrieved/read; they do not contain a proof of the selected claim. A001221 and A000217 were retrieved to confirm distinct-prime and triangular conventions; those foundational sequences' every unrelated research reference is not claimed to have been exhaustively reviewed. A369096 itself has no linked research paper, only its b-file/data and cross references.

Initial proper default-all-state upstream PR search returned0; direct current catalogue returnedHTTP200, unformalized, zero agents and no solution. Exact-ID repository code search of the actual `the-omega-institute/trureturing` repository returned0. Global Lean search returned one tiny-bayes `U99.lean` hit; the actual complete file was fetched, and the occurrence at line196 is inside a long hex literal, with no target statement. The complete cached Eppie archive's62 textual source/report files were searched and had no exact-ID hit; a separate API search reported incomplete_results and was NOT treated as a complete absence result. Both web engines were used for exact-ID and structural searches. No earlier target-specific published settlement was found in this bounded scope. All these findings need a final current race check before a future claim.

## Prior mathematics and honest scope

The result is a routine consequence of classical Landau semiprime counting, not a new semiprime asymptotic. The primary Crisan–Erban2021 paper *On the counting function of semiprimes*, INTEGERS21,A122, was opened and its relevant introduction, counting lemma and Theorem1/proof read. It records Landau's classical pi_2(X)~XloglogX/logX. A001358/A006881 also record these known semiprime asymptotics. Removing even semiprimes and prime squares preserves that leading asymptotic; all remaining odd distinct semiprimes belong to the selected sequence. Together with the classical prime number theorem this immediately gives the source's ratio limit. We explicitly credit these prior facts and make no new-asymptotic, new-method or historical-priority claim. No exact earlier publication of this target-specific predicate/limit was found in the bounded searches; this is not a worldwide novelty certificate.

The Lean route below proves enough directly from Chebyshev's bounds and Euler's divergent sum of prime reciprocals, avoiding use of Landau/PNT as unproved hypotheses or replacing the source predicate by a semiprime-only count.

## Complete informal proof

Every product pq of distinct odd primes qualifies: omega(pq)=2, pq is odd, and T(pq)+T(pq+1)=(pq+1)^2 is divisible by2.

Fix a finite set P of odd primes and choose B>=2 containing their values below B. For each p in P count primes q with B<q<=N/p. The products pq are distinct both within and across these families: in a product the factor<=B is uniquely p and the factor>B is uniquely q, by unique factorization. Consequently

    sum_(p in P) pi(floor(N/p)) <= C(N)+|P| pi(B).

Chebyshev's classical estimates give a uniform numerical constant, here32, such that for each fixed positive integer p and every sufficiently large N,

    pi(N) <=32 p pi(floor(N/p)).

For clarity one can use the elementary eventual bounds pi(N)<=4N/logN and pi(t)>=t/(4logt), plus floor(N/p)>=N/(2p) and log(floor(N/p))<=logN. The latter lower bound holds already for t>=100 by Chebyshev's explicit lower estimate and log(t+1)<=t/4. Since P is finite all its eventual bounds hold at once. Write H(P)=sum_(p in P)1/p. Summing gives

    H(P) pi(N) <=32 C(N)+32 |P| pi(B).

Euler's divergence of the prime-reciprocal series, unaffected by deleting2, makes H(P) arbitrarily large. Also pi(N)->infinity. Given epsilon>0 choose P so H(P)>64/epsilon. For all sufficiently large N the fixed additive term32|P|pi(B) is at most (H(P)/2)pi(N), so

    (H(P)/2)pi(N) <=32 C(N),
    0<=pi(N)/C(N)<=64/H(P)<epsilon.

C(N)>0 for N>=2 because2 belongs. This proves the full stated ratio limit for every cutoff, not just a subsequence. No computational evidence is used as an infinite proof.

The frozen statement preserves the literal triangular sum, the positive source domain and actual distinct-prime function. Independent combinatorics, runtime and root reviews confirmed its fidelity and the complete informal argument. Classical background is credited in both statement and proof metadata. Actual artifact15236015244 was downloaded: ZIP SHA2563fb86dc09a5110f7df70c723f93ff2bd80101cc8e5bf0827b902776f66110032 exactly matches GitHub, and the selected full-probe .exit is0, with no plain or tagged compiler errors and no sorryAx in OMA.solution. Public immutable probe d0c78fe59ba23949bb42d286319f7aa519b80e9d/campaign/ProbeA369096FullSecond.lean is byte-identical to the frozen local probe. Its statement prefix and the ENTIRE canonical proof body match. The separate MO430 probe in that artifact failed independently and is not represented as our result.

The exact statement/proof files pass the official static linters. The standalone unmodified tools/check.sh statement verdict is accepted with errors[], independently archived in artifact15235566581, ZIP SHA256d4eab76e7224ed042c06b5e29906acda1966c70d83e31867467f814b71d7ce2b. The statement's main placeholder deliberately remains sorry until separate proof submission, and is not a premise used by the full proof. Fresh eligibility/lease, official statement registration/review/merge, exact imported-target proof checking and official proof acceptance are separate remaining stages. No kernel rerun or official acceptance is invented.

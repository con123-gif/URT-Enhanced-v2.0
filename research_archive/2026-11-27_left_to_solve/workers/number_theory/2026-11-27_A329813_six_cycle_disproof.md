# Number theory lane — A329813 / A329654 six-cycle disproof
2026-11-27. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. Source conjecture: Andres Cicuttin (OEIS A329813 and A329654, same claim, count at most once). No new-method or worldwide priority claim.

## Exact source and audit
Approved source fetched from oeis/oeisdata seq/A329/A329813.seq (revision 29, Jan 1 2026) and A329654.seq (revision 40, Jan 1 2026). https://oeis.org/A329813 and https://oeis.org/A329654. For arbitrary nonzero real x,y, B(0)=x, B(1)=y, B(n)=n B(n-1)/B(n-2) for n>1. The source conjectures that all six limits B(6n+i)/(6n+i) exist and are pairwise distinct (1<=i<j<=6). Its scaling formula is already given; the universal distinctness assertion is false, including for positive seeds. Generic-seed distinctness is not disproved. The two source entries repeat the identical conjecture. Explicit all-state GitHub is:pr searches on each ID gave no results; indexed searches of the published TrureTuring catalogue and exact IDs found no matching resolution, but this is NOT a complete priority check. Related A145102/A145103 are not the same recurrence. Live OEIS proposed-edit histories and official eligibility remain unconfirmed. Direct join.txt and problem agent.txt were unavailable via web/local DNS; public join HTML and actual upstream tools/oma.sh were inspected. No live lease, no submission, no eligibility or novelty claim.

## Exact mathematical disproof
All B(n) are nonzero by induction. Six substitutions yield
B(m+6)=B(m)(m+5)(m+6)/((m+2)(m+3)).
Thus by multiplying the recurrence and the gamma-ratio asymptotic, for i=1,...,6,
L_i = lim B(6n+i)/(6n+i)
= B(i)/6 * Gamma((i+2)/6) Gamma((i+3)/6) / (Gamma((i+5)/6) Gamma((i+6)/6)).
The power of n in the product is exactly one. All limits are finite nonzero, and positive for positive seeds.
Let U denote the unit-seed recurrence and C_i its positive limits. For any nonzero t the six-periodic factors s_j=(t,1,t^-1,t^-1,1,t) for j=0,...,5 satisfy s_(j+2)s_j=s_(j+1) (indices modulo 6). Hence s_n U(n) obeys the original recurrence with seeds (t,1). Taking t=C_2/C_1 gives L_1=C_1=L_2. Exact positive seed, approximate t=1.426348255625319. This disproves the full universal claim; it does not deny the existence of limits.

Shorter formal disproof needs no asymptotic theorem. Assume the universal claim. Apply it to U to get pairwise distinct limits C_i. At most one is zero. If C_1,C_2 both nonzero, t=C_2/C_1 gives equal first and second limits for scaled recurrence. Otherwise C_4,C_5 both nonzero, t=C_4/C_5 gives equal fourth and fifth limits. Uniqueness of limits contradicts the universal claim. No weakened hypothesis, no reliance on numerical evidence.

Executed Python Fraction regression: 194 exact six-step identities; 800 exact scaled-recurrence identities (4 seeds 3/7,-2/9,11,1 and 200 indices). These are tests, not the unbounded proof. Numerical gamma limits for unit seed: 0.43118492653829826, 0.6150198678198331, 1.4263482556253189, 2.3191905339278573, 1.6259637327569139, 0.7010910526627272.

## Certificate
Full Lean candidate (no sorry/custom axiom/native_decide) at con123-gif/open-math-agents:oma-campaign-20261127, campaign/ProbeNumberTheoryA329813.lean, commit 7f21abc8adb4f435d075b9831e7ab41a428644fd. Actual Actions run https://github.com/con123-gif/open-math-agents/actions/runs/46032391205, job 140619179021. Latest read: in_progress, cache step, probe not yet executed. No kernel PASS claimed. Reused exact existing verifier workflow; no workflow changes. Local Lean unavailable.

## Coordination and prior-target review
Read AGENTS.md, CAMPAIGN_LEDGER.md blob 86b35889094f96efab3a32fc68d2c519590660d5, A390815 full proof and prior provenance, A058128 exact unverified proof. A390815 factorial packing proof is mathematically coherent (prime-power sum bound, coprime-factor packing except 2,3, composites <=2n divide n! for n>=6, odd exponent factors). Exclude: Sloane A325436 2019 characterization, Cunningham A023194 prior argument, Liu public proof announcement 27 Nov 13:17 UTC; no duplicate lease. A058128 modular proof uses n even, N=n-1, weighted-sum Q with N^2 Q+1=n^N; Q=1 mod N, a=nQ=1 mod N, n^N=1 mod Q and gcd(n,Q)=1, hence n^a=n mod a. Prior formalization Bonnie9981/Project-Discovery 17bf7ab04e3762bff7801e28e7d95103579839f0, theorem a058128_weak_psp; excluded, no duplicate claim. MO198816 interactive owner's work untouched.

Fresh PR metadata: #7724,7815,7817,7223,7625,7865,7930,7931,7933,8102 all open and merged=false. Earlier actual upstream kernel verdicts on full proofs #7724 run46021728128, #7815 run46022873588, #7817 run46022888332 remain distinct from merge. New bot comments #7223 and #7625 explicitly identify upstream merge 403 Resource not accessible by integration, automatic retries (https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7223#issuecomment-7222601666 and https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/7625#issuecomment-7222787927). Despite earlier “Merged now” comments, actual PR metadata says not merged. Confirmed count 0/20. No changes to existing PRs or other workers.

## RESUME HERE
Read actual probe job 140619179021 log, exit code and printed axioms for A329813.disproof; repair any real elaboration failure. Then verify live eligibility, full source history and prior literature/catalog before any claim. Do not treat the duplicate A329654 as a second problem, do not bypass API lease rules.

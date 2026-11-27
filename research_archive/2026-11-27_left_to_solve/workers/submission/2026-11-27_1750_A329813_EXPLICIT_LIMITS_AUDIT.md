# Independent submission audit — A329813 / A329654 explicit all-seed limits

27 November 2026, 17:50 UTC run. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Credit Andres Cicuttin (original conjecture, 2019), Robert Israel (OEIS sequence tables), prior campaign number-theory worker (periodic scaling disproof), and standard Gamma asymptotics. No claim of new mathematical priority.

## Preflight and stage
Read current AGENTS.md (blob 8db0201da965541e0487d6dd1271e010bdaa0972), CAMPAIGN_LEDGER.md (blob c89c9600917cb03a777dd173eef021e922f3f7a7), VERIFIED_PROOFS.json, and prior round checkpoint 56de8a9607a48b639a8a7ac524aa0806ad84c0a7. Current official tools/oma.sh was read at https://raw.githubusercontent.com/GuillaumeBAUD-coder/open-math-agents/main/tools/oma.sh. Direct live join.txt and desk brief failed (web inaccessible, container DNS unavailable); no live lease or API action attempted. No local Lean or gh executable. Do not claim a new check or bypass an official lease. Last ledger's live rules receipt is run 46041558445, not a fresh rules fetch by this worker.

Source target: https://oeis.org/A329813 and https://oeis.org/A329654 (both search-retrieved this session after direct HTTP403). The identical 2019 arbitrary-nonzero-real-seed conjecture combines existence and pairwise distinctness of six normalized limits. Source already states the six-periodic seed scaling, hence that scaling and its elementary consequences are not certified novel. Crossreferences A145102 and A145103 concern floor/ceiling versions, not this exact real recurrence. Bounded TrureTuring research/catalog and exact-ID web queries found no matching result; not a complete catalog/history or primary-literature exclusion. All-state GitHub is:pr exact-ID searches for both aliases returned the same statement PR9501; no new claim. Source history review relies partly on the previous campaign audit; no full fresh history retrieved.

Archive canonical statement blob ece44c696ff7c6a16926563bacde6a36ea462e76; canonical proof blob 9a4d420b3f89e23e0ca149066e95680712aefabe. PR9501 patch inspected: preserves all real nonzero seeds and indices i=1..6, rather than just the unit seed. Existing proof uses type_of% @OMA.S_oeis_a329813.main and no source theorem body. Existing actual run 46039599862/job 140643653986 logs retrieved: CHECKING_PROBE campaign/ProbeA329813Canonical.lean at 17:11:10 UTC; OMA.disproof depends on [propext, Classical.choice, Quot.sound] at 17:11:13 UTC. The statement compiled but is not merged. This is an existing inline-target check, not this session's imported-target verification.

## Stronger independent human proof: actual positive seed collapses all six limits
Let B_0=u and B_1=v be any nonzero reals, and B_{n+2}=(n+2)B_{n+1}/B_n. Induction gives B_n != 0 for every n. Starting with x=B_n,y=B_{n+1}, successive terms are
(n+2)y/x, (n+3)(n+2)/x, (n+4)(n+3)/y, (n+5)(n+4)x/((n+2)y), (n+6)(n+5)x/((n+2)(n+3)).
Thus for n>=0,
$$B_{n+6}=\frac{(n+6)(n+5)}{(n+2)(n+3)}B_n.$$
For n>=1 set a_n=B_n/n. Exactly,
$$a_{n+6}=\left(1-\frac{6}{(n+2)(n+3)}\right)a_n.$$
Every factor is positive and at least 1/2. Its deviation from 1 is summable on each residue class (even summable over all n>=1). Since -log(1-x)<=2x for 0<=x<=1/2, the residue products converge to strictly positive constants. Consequently every nonzero real seed has six finite **nonzero** normalized limits, even if some are negative. This proves the existence clause independently, unlike the prior conditional scaling argument.

For r=0,1,...,5, iteration also yields
$$B_{6k+r}=B_r\frac{((r+6)/6)_k\,((r+5)/6)_k}{((r+2)/6)_k\,((r+3)/6)_k}.$$
All Pochhammer arguments are positive. By the standard gamma-ratio asymptotic (NIST DLMF 5.11.12, https://dlmf.nist.gov/5.11.E12), numerator minus denominator exponents sum to 1. Hence
$$L_r=\lim_{k\to\infty}B_{6k+r}/(6k+r)=\frac{B_r}{6}\frac{\Gamma((r+2)/6)\Gamma((r+3)/6)}{\Gamma((r+6)/6)\Gamma((r+5)/6)}.$$
For r=0 the limit starts at k>=1; the product formula for B itself includes k=0. Source i=6 is the shifted r=0 limit.

Choose exactly
$$u=\frac{6\Gamma(5/6)}{\Gamma(1/3)\Gamma(1/2)},\quad v=\frac{6\Gamma(7/6)}{\Gamma(1/2)\Gamma(2/3)}.$$
Both positive. Then L_0=L_1=1. Taking limits in the exact normalized relation
$$a_{n+2}=\frac{n+1}{n}\frac{a_{n+1}}{a_n}\quad(n\ge1)$$
gives L_{r+2}=L_{r+1}/L_r (indices modulo 6), because all limits are nonzero. Thus L_0=...=L_5=1. In fact B_n/n tends to 1 along the entire sequence. The universal distinctness claim is false even for positive initial values. The seed is unique among nonzero real pairs giving these six unit limits since L_0 and L_1 are nonzero scalar multiples of u and v. No reliance on rounded OEIS constants, and no division at n=0 in the normalized argument.

The six-step ratio, exact all-seed limit formula, and all-six collision are an independent stronger hand result; not a new problem count or a newly kernel-verified extension. The original checked disproof remains the best official submission candidate; do not replace it with uncompiled analytic code. A new Lean formalization of the stronger existence/Gamma claim is not required for the original disproof. No unsupported originality claim.

## Executed arithmetic challenge
Actual local Python Fraction run (not Lean) gave 196 ordered nonzero rational seed pairs, 26,068 exact assertions: 8,624 six-step, 8,232 product, 9,212 normalized-recurrence. Negative seed signs included; n=0 tested only for B recurrence, not normalized. Reproduce:

~~~python
from fractions import Fraction as F
from math import gamma
seeds=sorted(set(F(i,j) for i in (-3,-2,-1,1,2,3) for j in (1,2,3)))
counts=[0,0,0]
for u in seeds:
 for v in seeds:
  b=[u,v]
  for n in range(2,50): b.append(n*b[-1]/b[-2])
  for n in range(44):
   assert b[n+6]*(n+2)*(n+3)==b[n]*(n+5)*(n+6); counts[0]+=1
  for r in range(6):
   x=b[r]
   for k in range(1,8):
    x*=F((r+6*k)*(r+6*k-1),(r+6*k-4)*(r+6*k-3))
    assert x==b[r+6*k]; counts[1]+=1
  for n in range(1,48):
   assert b[n+2]/(n+2)==F(n+1,n)*(b[n+1]/(n+1))/(b[n]/n); counts[2]+=1
print(len(seeds),len(seeds)**2,counts,sum(counts))
u=6*gamma(5/6)/(gamma(1/3)*gamma(1/2))
v=6*gamma(7/6)/(gamma(1/2)*gamma(2/3))
print(u,v)
b=[u,v]
for n in range(2,7): b.append(n*b[-1]/b[-2])
print([b[r]/6*gamma((r+2)/6)*gamma((r+3)/6)/(gamma((r+6)/6)*gamma((r+5)/6)) for r in range(6)])
~~~

Observed u=1.4263482556253195, v=2.3191905339278573; approximate L values [1.0, 0.9999999999999999, 0.9999999999999996, 0.9999999999999997, 1.0, 0.9999999999999998]. Floating-point numbers are illustrations only; exact proof above.

## Direct GitHub PR reconciliation
7724 (A180195), 7815 (A002538), 7817 (A158960) merged at 17:05:50, 17:13:14, 17:13:23 UTC respectively, by con123-gif. Merge SHAs 4c3981b3cba7fe5345bfb5343dfe75056789d645, 9963fed42849f09dd6436b4ffcee9c78e4da06c2, 9ad85ef3d436cdf76bb297e88d9897aaea50f93e. Public credit confirmed in preceding ledger live-feed check; not a fresh live site credit read in this run. 0/20 certified genuinely new; three formal merges; 23 previously checked canonical certificates per ledger, no count increment.

Direct metadata shows statement PRs 7223,7625,8442,8569,8568,8847,8859,9126,9480,9482,9501,9503 all open and not merged. Third-party competing proof PRs 9230,9307,9309,9408 all open; do not duplicate. Current desk status not established. No new official PR or lease submitted.

## RESUME HERE
Recheck actual registered statement PR9501 merge and all-state is:pr alias search. If merged and no teammate/competitor owns the proof stage, obtain one valid fresh lease through current official route and run unmodified checker on the existing canonical imported-target disproof before submission. Keep this stronger hand proof as independent explanatory evidence, not a replacement for the checked certificate. Preserve all other lanes, RH files and campaign counts.
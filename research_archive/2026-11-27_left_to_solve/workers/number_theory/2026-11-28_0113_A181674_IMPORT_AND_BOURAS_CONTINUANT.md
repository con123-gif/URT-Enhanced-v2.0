# Number theory — 28 November 2026, 01:13 UTC

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); Mohammed Bouras for the continued fractions; Benoit Cloitre, Antonio Gracia Llorente and the TrureTuring contributors for prior denominator/prime-occurrence work. No priority claim. 

## Official reconciliation and actual upload
Read AGENTS.md, CAMPAIGN_LEDGER.md (1537e7cf3ad62ce61cc962d2c25681e8b3606a50), VERIFIED_PROOFS.json (379caca5d953a3f0a1eff550262059bdf98e0285), latest number checkpoint 664ad8c9 and peer submission checkpoint 0048. Main head cf80e55a6ea783e7d309dbe255efccbb72fe4528 observed before this write. join.txt direct inaccessible, local DNS fails; read live upstream tools/oma.sh and lib/join.ts (6de9cd1b15df28419fcdda160e5f3abea64659dc) including cap10, manual selection and fallback. No actual desk claim/lease or official proof PR created.

Fresh official metadata: 10139/13332 open/unmerged; previous 3 credited proofs and 5 accepted checker verdicts unchanged per ledger. Statements actually merged 12465 A068991 00:14:25, 12514 MO513259 00:21:13, 12591 A396949 00:33:54, 12717 MO487180 00:52:51, 12808 A181674 01:03:13, 12868 A372561 01:12:45 UTC. Actual all-state is:pr search_prs reveals foreign full PR16269 A068991 romechenko 00:42:09, 16199 A396949 romechenko 00:38:16, 16447 MO487180 Solfanbtc 00:53:58, all open/unmerged. Read their diff/import headers; withhold duplicates; no foreign checker acceptance asserted. MO513259 peer fixture exists; do not race. A372561 exact registered source matches canonical blob 804c4fae0501a67e1182b334649e2fb8ada54d01; its canonical proof blob 804b4309f0c329665ede7e6a272658740f8c44ae; no main proof or preceding full PR found at gate; leave to root/reversal lane.

A181674 exact upstream statement byte-identical to archive, blob a5230ab9cae45d4da99872c64217eb4f80335a45; no main proof and two fresh exact-ID searches found only registration12808. Uploaded UNMODIFIED full canonical proof to campaign/proofs/oeis-a181674.lean via Contents create_file, commit 6fcf39fbcb805042e52bae854c8be977f217f9e8, blob 282d58ef205a046074fae9971f66b3ef08e231e0, immutable readback identical. This is a checker fixture, not official proof submission. Current unchanged verifier workflow blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c was read. GET /actions/runs?head_sha=... returned total_count=0 for this fixture, prior A068991 imported fixture 4ba16ec4, and Bouras stepwise repair da5ddf21. Branch-level run list last actual run46085414165 at f76ab795 23:59 UTC. No explanation for missing push runs asserted. No actual new kernel check/exit or axiom audit available. Do not count or submit on the strength of this upload alone. Local Lean and gh absent. No workflow alteration/force or blind reruns.

## Bouras: compact exact factorial certificate independent of large rational normalization

Prior source: Bouras arXiv:2509.09745v1, A356247, A363347; TrureTuring https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html item7 explicitly leaves supplementary A363347 gcd identity open there. DOI 10.5281/zenodo.23506866 still inaccessible, direct OEIS 403. Factorial cancellation formula is already published (not novel); the following independent elementary derivation is a shorter certificate route for the previously found supplementary counterexamples.

For integer k>=1 and n>=3 set F_n=-k, F_i=i-(i+1)/F_(i+1) for i=n-1,...,2. All intermediate divisors are nonzero: F_(n-1)>n-1 when n>=4; descending induction for i>=3 gives F_i>i-2 since F_(i+1)>i-1 >=(i+1)/2. When n=3 the tail is directly nonzero. Thus each step is represented by the projective integer matrix M_i=[[i,-(i+1)],[1,0]].

Write M_2 ... M_(n-1)=[[A,B],[C,D]]. By induction the top row after M_j is [j,-(j+1)(j-1)]: base j=2 is [2,-3]; right multiplication by M_(j+1) yields [j(j+1)-(j+1)(j-1),-j(j+2)]=[j+1,-j(j+2)]. Hence A=n-1, B=-n(n-2). Acting on (-k,1) gives U=-Q, V=-kC+D, where Q=n²+(k-2)n-k>0. The rational F_2=U/V and its reciprocal has positive reduced denominator Q/gcd(Q,V). The projective denominator V is nonzero because each intermediate F_i for i>=3 is nonzero. Determinant multiplication gives AD-BC=3*4*...*n=n!/2. Then A V-C U=n!/2, and gcd(A,Q)=1 since Q=(n-1)(n-1+k)-1. Taking gcd with Q yields
    gcd(Q,V)=gcd(Q,A V)=gcd(Q,n!/2).
Thus den(1/F_2)=Q/gcd(Q,n!/2). This eliminates the need to evaluate 501 large rational steps in a future Lean proof (not yet formalized).

Exact witnesses: k=1 n=62 Q=19*199; n=138 Q=95*199. k=4 n=116 Q=44*311; n=193 Q=121*311. For each index n, the cofactor divides n!/2, while the prime p>n does not. Consequently literal denominators are 199,199,311,311. gcd(3781,18905)=3781≠199 and gcd(13684,37631)=3421≠311. These refute the two supplementary equalities. The standard factorization/denominator identity itself is prior mathematics.

Executed independent Python 3 integer matrix and Fraction evaluation (6 cases, four witnesses and n=3 edge cases):
```python
from fractions import Fraction
from math import gcd,factorial
for k,n in [(1,62),(1,138),(4,116),(4,193),(1,3),(4,3)]:
    a,b,c,d=1,0,0,1
    for i in range(2,n):
        a,b,c,d=a*i+b,-a*(i+1),c*i+d,-c*(i+1)
    U,V=-k*a+b,-k*c+d
    Q=n*n+(k-2)*n-k
    assert U==-Q and a==n-1 and a*d-b*c==factorial(n)//2
    assert a*V-c*U==factorial(n)//2 and gcd(Q,a)==1
    f=Fraction(-k)
    for i in range(n-1,1,-1):
        assert f!=0
        f=i-Fraction(i+1)/f
    assert f==Fraction(U,V)
    assert (1/f).denominator==Q//gcd(Q,factorial(n)//2)
    print(k,n,Q,gcd(Q,V),(1/f).denominator)
```
Actual output:
```
1 62 3781 19 199
1 138 18905 95 199
4 116 13684 44 311
4 193 37631 121 311
1 3 5 1 5
4 3 11 1 11
```
These finite checks are supporting evidence; the determinant proof is universal for k>=1,n>=3. No new Lean verification or source eligibility/priority conclusion. Do not treat the existing published factorial formula as a new discovery.

## RESUME HERE
First check GET /actions/runs?head_sha=6fcf39fbcb805042e52bae854c8be977f217f9e8 and actual A181674 proof race, then verify exact imported target and fresh official coordination before full PR. If missing workflow event persists, use only authorized isolated verifier route and preserve peer files; never mark a missing run PASS. Recheck da5ddf21 actual per-probe exits and complete axiom lists; use determinant bridge if rational repair genuinely fails. A068991/A396949/MO487180 now have foreign full PRs: withhold duplicate. Current counts remain 37 archived certificates, 5 own accepted full checker verdicts, 3 merged credited, 0/20 certified genuinely new accepted discoveries. No RH/schedule changes.

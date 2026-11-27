# 2026-11-27 19:18 UTC — Number theory: A363482 complete hand argument, prior-source hold

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source conjecture and continued-fraction identity: Mohammed Bouras; factorial-cancellation context: Antonio Gracia Llorente and TrureTuring. No first-priority assertion.

## Current campaign reconciliation
Read current AGENTS.md, CAMPAIGN_LEDGER.md and VERIFIED_PROOFS.json. Ledger's latest dated entry confirms 27 complete archived certificates; JSON snapshot still reports 26, so use the dated ledger's explicit public read-back for the 27th, A372556 (run 46055072139). Direct GitHub PR reads confirm 7724, 7815, 7817 merged; 10139, 10398, 9501, 10062 still open. Statement PRs 9480, 9482, 9503 actually merged at 18:49:59, 18:50:45, 18:51:52 UTC, respectively; these are registrations, not proof acceptances. All-state is:pr searches for those three exact IDs returned only their registration PRs at inspection. Existing owners should proceed; no duplicate claim. No lease acquired by this worker. Strict genuinely-new accepted count remains 0/20, 3 formal proof merges, 4 full proof PRs.

Official tools/oma.sh read from upstream main via web. join.txt could not be fetched (web and local DNS failures). Local lean/lake/gh unavailable; network DNS unavailable. Recovered exact campaign-verify.yml from authorized fork oma-campaign-20261127; no unauthorized workflow modifications. No API claim attempted while current eligibility/team/lease and primary source were unresolved.

## Exact source and literature
https://oeis.org/A363482 (including indexed internal version, last revision 2025-07-13): for n>=3 take positive reduced denominator a(n) of 1/(2-3/(3-4/(...-(n)/(-5)))); conjecture every term other than 49 is 1 or prime. Source formula a(n)=Q/gcd(Q,5 A051403(n-3)+n A051403(n-4)), Q=n²+3n-5. Source says the conjecture checked to 10000. Related A356247, A363102, A362086, A363347 and A051403. Bouras arXiv:2509.09745v1 section 3 theorem 1 and section 4.1 table 1 explicitly include the k=5 sequence. https://arxiv.org/html/2509.09745v1 .
All-state GitHub search repo:GuillaumeBAUD-coder/open-math-agents is:pr oeis-a363482 returned zero; this does NOT establish eligibility or novelty.
TrureTuring published family dossier https://the-omega-institute.github.io/trureturing-mdbook/Problems/bouras.html gives the general factorial determinant/cancellation identity and explicitly cites Antonio Gracia Llorente, Factorial Cancellation in Polynomial Continued Fractions, 2026-10-20, DOI 10.5281/zenodo.23506866. It addresses neighboring tails and prior prime-value results. The full Zenodo paper and exact catalog lookup were inaccessible, so the exact k=5 classification may already be present there. HOLD as prior-risk, no official submission or genuine-open count. A028342's congruences were also rejected as known: OEIS explicitly links Kallat arXiv:2607.18313.

## Complete hand proof of source conjecture (not kernel checked)
Let Q=n²+3n-5 and L_j=sum_{i=0}^{j-1} i!. From the source formula and A051403(j)=(j+2)L_(j+1)/2, for n>=4 its gcd argument F satisfies
2F=Q L_(n-3)+5(n-1)(n-3)!.
Q is odd, and gcd(Q,n-1)=1 (Q evaluated at n=1 equals -1); hence gcd(Q,F)=gcd(Q,5(n-3)!). This equals gcd(Q,n!). Indeed any prime other than 5 dividing Q divides none of n,n-1,n-2, since Q mod n is -5 and mod n-2 is 5. For p=5 dividing Q, n mod 5 is 0 or 2. Write e=v5(n(n-2))>=1. If e=1, n! and 5(n-3)! have equal 5-valuation. If e>=2, then n≡0 or 2 mod 25 and Q≡-5 or 5 mod 25, so v5(Q)=1 and both gcds have valuation 1. n=3 is direct: 5/13. Therefore a(n)=Q/gcd(Q,n!) for all n>=3. This agrees with the published family determinant identity and is not claimed novel.

For n>=100 write g=gcd(Q,n!), D=Q/g. Q is odd and not divisible by 3 (Q≡n²+1 mod3); every prime p|D is therefore >=5. Suppose p<=n/2. Let k=floor(n/p)>=2. The k distinct multiples p,2p,...,kp in n! imply v_p(n!)>=k. Since p remains after gcd cancellation, v_p(Q)>v_p(n!), hence p^(k+1)<=Q. Contradiction as follows:
- k=2: n<3p and n>=100 imply p>=34. Therefore Q<(n+2)^2<(4p)^2<p³.
- k>=3: induction gives p^(k-1)>=(k+2)^2: base 5²=25; the induction step follows from 5(k+2)^2>=(k+3)^2. Since n<(k+1)p, n+2<(k+2)p (p>=5), hence Q<(n+2)^2<(k+2)^2 p²<=p^(k+1).
Thus every surviving prime p>n/2.

Suppose D is composite, choose its least prime factor p and q=D/p>=p. If p<=n, p divides g since it divides both Q and n!. Then Q=g p q>=p²q>=p³>(n/2)^3>(n+2)^2 for n>=100, contradiction. If p>n and q>p, Q>=pq>=(n+1)(n+2)>Q, contradiction. If p>n and q=p, then g>=2 would give Q>=2(n+1)^2>Q; thus g=1 and Q=p². But (n+1)^2<Q<(n+2)^2 for n>=100, impossible. Therefore D is 1 or prime for n>=100.

The finite base n=3..99 was actually checked using exact rational nested continued fractions, independent gcd expressions and trial division. All 97 cases meet the conjecture; sole composite exception n=6, a=49. Further 1901 exact factorial-filter challenges at n=100..2000 pass. This is a bounded computational check of the base cases and a challenge of the unbounded proof, not an actual Lean certificate.

Reproduction:
```python
from fractions import Fraction
from math import factorial,gcd,isqrt
def prime(n): return n>=2 and all(n%d for d in range(2,isqrt(n)+1))
def cf(n):
    x=Fraction(-5)
    for k in range(n-1,1,-1): x=k-Fraction(k+1)/x
    return 1/x
exceptions=[]
for n in range(3,100):
    Q=n*n+3*n-5
    a=cf(n).denominator
    assert a==Q//gcd(Q,5*(n-1)*factorial(n-3))==Q//gcd(Q,factorial(n))
    assert a==1 or prime(a) or a==49
    if a!=1 and not prime(a): exceptions.append((n,a))
assert exceptions==[(6,49)]
f=factorial(99)
for n in range(100,2001):
    f*=n
    Q=n*n+3*n-5
    a=Q//gcd(Q,f)
    assert a==1 or prime(a)
```

## RESUME HERE
Single next action for this candidate: recover and inspect Gracia Llorente's exact 2026-10-20 paper, especially its k=5 prime-value classification, before any official claim or expensive Lean replay. If it already proves the target, mark known-prior and move to a distinct number-theory problem. If still eligible, formalize the exact source and factorial cancellation, then use the isolated pinned checker (Lean 4.33.1, FC 9097e2f90e66d2f6244209cb1c07f7120d17ec53, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474). Pinned Mathlib has Nat.factorization_factorial_mul, Nat.factorization_gcd/div and Nat.minFac_le_div for the main proof. No kernel execution yet; no count increment. Monitor A329813 statement PR9501 before repeating it. Preserve RH files and other workers.

# Submission lane — two new residue-class results for Corneth's A389000 question

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Credit Arjun Maneesh Agarwal (sequence), David A. Corneth (ratio question, 25 September 2025), Chai Wah Wu (other formula), the OEIS contributors and the classical decimal digit-sum congruence. This is human mathematics, **not** a whole Lean-certified problem or an official claim. No priority assertion.

## Current coordination and submission gate

Read current AGENTS.md (blob 8db0201da965541e0487d6dd1271e010bdaa0972), CAMPAIGN_LEDGER.md (blob 391f7c0f650638f67731707bb59f358e397c72c0), and VERIFIED_PROOFS.json on newtons-cathedral. Latest ledger checkpoint 22:44 records 35 complete checked archived certificates, 5 submitted full PRs, 4 actual upstream accepted checks, 3 public merges, 0 certified original discoveries. No new count increment from this lane. Read upstream README.md (blob bc4587a4fd5119e5c22b42b5a1e2b241cae52e7f) and current public tools/oma.sh (184 lines, fetched from main). Live join.txt access failed via web and local curl (DNS failure); no new assignment or publication attempted without the current rules/eligibility gate. Local Lean/lake not found by command -v. Did not change shared verifier branch or any schedule.

All-state exact-ID search (is:pr, state=all) and actual direct PR reads:
- 7724, 7815, 7817: closed/merged true; author con123-gif; actual merged times 17:05:50, 17:13:14, 17:13:23 UTC respectively. Originality remains separate, A158960 known prior.
- MO198816 / 10139: open, merged=false, author con123-gif. Re-read actual upstream job 140671608373 of run 46047885906: at 19:10:39.3670774Z the executed output was "accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound". No merge or new credit.
- A329813 / 13332: actual open full PR, author con123-gif, head 07f5d92e51a514cdf0c195debb7ddd67e3fe7f30; upstream check run 46076886744 queued at both reads. Not a fifth official checker acceptance yet.
- 7223, 7625, 10062, 10398, 12465, 12514, 12591, 12717, 12808, 12868, 12938, 13431, 13174 all actually open/unmerged. 7223/7625 have explicit prior accepted statement and subsequent 403 merger refusal, not proof errors. No clean new imported-target submission opening. A124870 withheld according to latest ledger (13325/13377/13401 preceding foreign full PRs); no duplicate. MO430643 and MO309485 are being handled by root/peers. No lease taken. No private PR bodies or tokens archived.

## Independent source question (not Wu's already proved conjecture)

https://oeis.org/A389000/internal revision #70, source definition: a(n) is the least positive k with n dividing both s(k) and s(k^2), s decimal digit sum; -1 if no such k. Corneth asks whether s(a(n))/n depends only on n mod 9. All positive n have witnesses: k=10^n-1, s(k)=s(k^2)=9n, by the decimal borrow identity. Thus the sentinel never occurs.

The nearby Wu conjecture for n=9m+5 is already completely proved by TrureTuring:
https://the-omega-institute.github.io/trureturing-mdbook/Problems/oeis-a389000-digit-sum-square-least-witness.html
and https://the-omega-institute.github.io/trureturing-mdbook/Blueprint/D5/S1/Digit/Admissibility/DigitSumSquareLeastWitness.html .
Fetched its Lean module at 0a99bee767c789d783e418d453dfa82e906d2410, blob 74b87ae08ba1bfe69091f22b31d7165c0af86559, 192 lines; declaration inventory includes wu_conjecture and witness/minimality lemmas for that residue, not Corneth's general ratio. Do not re-count Wu as open. OEIS itself gives formulas for residues 0 and 1. Related A389004 only minimizes the square digit sum condition, a different question. Exact A389000 all-state upstream PR search found no hits; TrureTuring search found five files for Wu's target. This does not certify novelty, and the live OEIS history/b-file and site agent brief could not be retrieved. No claim or formalization submitted. The source question has not been shown to be currently eligible. Other initial scan leads A177117/A103311/A278070 have existing published proofs; A394410 triple-squares exclusion is explicitly stated in the source and elementary mod8, not an eligible new conjecture.

## New result (complete human proof for two residue classes)

For every positive n:
- n=2 (mod 9) implies s(a(n))=n.
- n=7 (mod 9) implies s(a(n))=2n.

Let X=10^t. For 0<b<X, s(X-b)=9t-s(b-1) (digitwise complement). For ordinary base-X blocks each less than X, decimal digit sums add, including leading zero padding.

### Class 2

For t>=3, n=9t+11, choose K=13X^2-2X+9. This covers all n=2 (mod9) with n>=38. Its base-X blocks from high to low are [12,X-2,9]. Hence s(K)=3+(9t-1)+9=9t+11=n.

K^2=169X^4-52X^3+238X^2-36X+81.
The nonnegative blocks are [168,X-52,237,X-36,81], all valid because X>=1000.
Therefore s(K^2)=15+(9t-6)+12+(9t-8)+9=18t+22=2n.
K is an admissible witness and K<13X^2. For every 0<j<=K, the quotient floor(j/X^2) is at most 12 with digit sum at most 9; remaining two blocks contribute at most 18t. Consequently s(j)<=18t+9<2n. In particular 0<s(a(n))<2n, and n divides s(a(n)), forcing s(a(n))=n.

The remaining n=2,11,20,29 use explicit admissible witnesses 2,74,767,16697 respectively. Their digit sums are n and their square digit sums are 2n. For n=2, check j=1,2 directly; for the other three, digit-count bounds 18,27,45 are strictly below 2n. This avoids reliance on the published claim of minimality for those witnesses.

### Class 7

For t>=1 let n=9t-2, K=2X^2-5X-1. K>0 and K<2X^2.
For t>=2 the nonnegative base-X blocks of K are [1,X-6,X-1], giving s(K)=1+(9t-5)+9t=18t-4=2n.
K^2=4X^4-20X^3+21X^2+10X+1 has blocks [3,X-20,21,10,1]. Thus s(K^2)=3+(9t-10)+3+1+1=9t-2=n.
For t=1, K=149 and K^2=22201, whose sums are 14 and 7, so the same identities hold.

For any 0<j<=K, s(j)<=18t+1<3n (quotient at most1). Thus the least witness has s(a(n)) in {n,2n}. If s(j)=n and n divides s(j^2), write s(j^2)=dn, d>0. Decimal digit sum modulo9 gives dn congruent to n^2 modulo9, so d congruent to 7 modulo9 and d>=7. But j^2<4X^4 has at most 4t+1 digits, so s(j^2)<=36t+9<7n because 27t>23. Contradiction. Hence s(a(n))=2n for all n=7 modulo9.

Neither result assumes a bound on a(n) not derived from a valid witness; all initial cases and positive quantifiers covered. Combining only with the known source classes 0,1 and the published Wu theorem gives five of nine classes; remaining 3,4,6,8 not proved here. No source problem counted as solved.

## Executed checks (local Python and SymPy)

The following exact assertions executed successfully: 5000 finite assertions and two symbolic expansions. They challenge the human proof; they do not constitute the infinite proof or a Lean kernel verification.

```python
s=lambda z:sum(map(int,str(z)))
checks=0
for t in range(3,501):
    x=10**t;n=9*t+11;k=13*x*x-2*x+9
    assert s(k)==n;assert s(k*k)==2*n;assert k<13*x*x;assert 18*t+9<2*n;checks+=4
for t in range(1,501):
    x=10**t;n=9*t-2;k=2*x*x-5*x-1
    assert s(k)==2*n;assert s(k*k)==n;assert k<2*x*x;assert 18*t+1<3*n;assert k*k<4*x**4;assert 36*t+9<7*n;checks+=6
for n,k in [(2,2),(11,74),(20,767),(29,16697)]:
    assert s(k)==n and s(k*k)%n==0;checks+=1
    if n==2:assert all(s(j)<2*n for j in range(1,k+1));checks+=1
    else:assert 9*len(str(k))<2*n;checks+=1
assert checks==5000
import sympy as sp
X=sp.symbols('X')
assert sp.expand((13*X**2-2*X+9)**2)==169*X**4-52*X**3+238*X**2-36*X+81
assert sp.expand((2*X**2-5*X-1)**2)==4*X**4-20*X**3+21*X**2+10*X+1
```

Discovery used seeded random search over integer polynomial coefficients in [-19,19], leading positive, degree up to 2l or 3l for l<=5. Digit-sum slope/intercept computed by signed-block borrows; squared coefficient convolution checked exact. Failed to find full coverage of residues 3,4,6,8 in this bounded family. This does not prove such families do not exist. A prospective improvement is rational-block polynomials or variable-gap constructions.

## RESUME HERE

First check actual official PR 13332 checker run 46076886744 and pending registration merges; on a clean authorized full-proof opening, complete exact registered-target check/submission rather than stop at a handoff. Otherwise continue the four unresolved Corneth residue classes, only after confirming current source, catalogue eligibility and prior work. Preserve this partial proof; do not count it as a complete independently accepted solution.

Verdict: PARTIAL (new unbounded human results for two residue classes, no new accepted proof, no Lean verification, no priority claim).

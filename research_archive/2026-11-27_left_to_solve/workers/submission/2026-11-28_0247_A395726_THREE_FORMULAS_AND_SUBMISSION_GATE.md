# A395726: three exact conjectures from a single generating function; submission gate

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). A complete human mathematical proof of all three named source conjectures, using classical Stirling identities. No new Lean certificate, no official submission, no novelty or priority claim. Keep out of the confirmed genuinely-open count until source eligibility and prior work are independently cleared.

## Source and audit

Mikhail Kurkov, OEIS A395726, revision 21 (16 June 2026), approved mirror blob bd78888e336cf0a2136f1e79d35d4baf132fc407, https://github.com/oeis/oeisdata/blob/main/seq/A395/A395726.seq. Read entire source. Coordinate definitions A002024 and A002260: the former is the block number r, the latter position s, where k=r(r-1)/2+s, 1<=s<=r. Their relevant explicit definitions read in mirror blobs 537ff7dea4a055c6e61cf1bc0297696c6c9a36a1 and 75c5fb8d7025763d51b6fd057f254194dc394e63. Classical reference NIST DLMF §26.8.5, .6, .11 (https://dlmf.nist.gov/26.8), and Comtet 1974 pp206–213 for Stirling numbers. These are standard consequences of the familiar Stirling product, not new general Stirling identities. All-state is:pr exact-ID upstream search returned no oeis-a395726 records; current statements/oeis-a395726.lean GET returned 404. Live brief, OEIS interactive page and exact Trure API lookup inaccessible; indexed source and Trure catalog searched, no exact prior settlement observed. Two mirror history commits located (bc0d5f7c3d4abf31c68064f215a3597126de6c55 and ded9cca5535773c6d0f304ff1260bb74a3b08b9a); history not fully read. No claim, lease or registration. The short proof follows routine known mathematics, so conservative status is unconfirmed originality/eligibility, not genuine-new solve.

## Exact proof

Write T_r=r(r+1)/2, f(k)=r and b(k)=s where T_(r-1)<k<=T_r, k=T_(r-1)+s. For n>=0, k>=0 use the literal recurrence A(0,k)=1, A(n,0)=0 for n>0 and A(n,k)=A(n,k-r)+r*A(n-1,k) for n,k>0. The boundary uses 0^0=1. Define F_k(x)=sum_(n>=0) A(n,k)x^n over Q[[x]], P_r(x)=prod_(j=1)^r (1-jx), P_0=1. Then F_0=1 and (1-rx)F_k=F_(k-r) by summing the literal recurrence and its equal constant terms.

The exact common identity for k>0 is

    F_k(x) = (1-(r-s)x)/P_r(x).

Proof by induction on k: for s=1, k-r=T_(r-2) when r>=2; its generating function is 1/P_(r-2), so division by 1-rx gives (1-(r-1)x)/P_r. For s>=2, k-r=T_(r-2)+(s-1), so the induction hypothesis gives numerator 1-((r-1)-(s-1))x over P_(r-1); divide by 1-rx. For r=1, k=1, F_1=1/(1-x). This exhausts all k>0.

Conjecture 1 (all k>0, n>=0): partial fractions of the common identity in Q(x) are sum_(j=1)^r C_j/(1-jx), with

    C_j = (j-r+s)*j^(r-2)*(-1)^(r-j) / ((j-1)!*(r-j)!).

Indeed multiply by 1-jx and substitute x=1/j; the product of the other denominators there is (-1)^(r-j)*(j-1)!*(r-j)!/j^(r-1). The numerator degree is less than r, so there is no polynomial part (for r=1 the numerator is 1). Taking coefficients gives

    A(n,k) = sum_(j=1)^r binom(r-1,j-1)*(r-s-j)*j^(n+r-2)*(-1)^(r+j+1)/(r-1)!,

the exact source sign and formula. For r=1,n=0 the exponent is -1 but the sole base is 1, hence well-defined in Q; equivalently separate k=1.

Conjecture 2 (k>=0): write k+1=T_(u-1)+v, 1<=v<=u. The factors j+[v>u-j] for j=0,...,u-1 are exactly {0,...,u} with u-v+1 omitted, each once. The source reciprocal product is therefore (1-(u-v+1)x)/P_u. If v>=2, k=T_(u-1)+(v-1) and this is the common identity. If v=1, k=T_(u-1), so it reduces to 1/P_(u-1), including k=0. Thus the literal product formula holds.

Conjecture 3 (n>0): for k>0, F_k-F_(k-1)=x/P_r. For s>=2 this is numerator subtraction, and for s=1 use F_(k-1)=1/P_(r-1)=(1-rx)/P_r, including k=1. The classical ordinary Stirling generating function 1/P_r=sum_(m>=0) S(m+r,r)x^m follows by iterating the Stirling recurrence, or DLMF 26.8.5/11. Thus A(n,k)-A(n,k-1)=S(n+r-1,r). Telescope from A(n,0)=0 to obtain exactly A(n,k)=sum_(j=1)^k S(n+f(j)-1,f(j)), for all n>0, k>=0.

Additional source issue: the unlabelled FORMULA line A(n,binomial(k,2))=S(n+k,k) is literally false at n=1,k=2: A(1,1)=1 versus S(3,2)=3. The corrected triangular formula is A(n,T_r)=S(n+r,r) for r>=0, n>=0, immediately from the common identity. Do not silently substitute it for the literal unlabelled assertion. This is one source problem, three named conjectures, no additional distinct count.

## Executed exact check (local Python, not Lean)

The following reproduced all 122041 assertions and the negative control. Finite corroboration only, the universal proof is above.

```python
from math import comb,factorial,isqrt
from fractions import Fraction
N=40;K=1000
r=lambda k:(isqrt(8*k-7)+1)//2
s=lambda k:k-r(k)*(r(k)-1)//2
S=[[0]*(r(K)+2) for _ in range(N+r(K)+3)];S[0][0]=1
for m in range(1,len(S)):
 for j in range(1,len(S[0])): S[m][j]=S[m-1][j-1]+j*S[m-1][j]
A=[[1]*(K+1)]+[[0]*(K+1) for _ in range(N)]
checks=0
for n in range(1,N+1):
 for k in range(1,K+1):
  t=r(k); A[n][k]=A[n][k-t]+t*A[n-1][k]
for k in range(K+1):
 u=r(k+1);v=s(k+1);factors=[j+int(v>u-j) for j in range(u)]
 c=[1]+[0]*N
 for j in factors:
  for n in range(1,N+1): c[n]+=j*c[n-1]
 for n in range(N+1):
  assert c[n]==A[n][k];checks+=1
 if k:
  t=r(k);v=s(k)
  for n in range(N+1):
   z=sum(Fraction(comb(t-1,j-1)*(t-v-j)*(-1)**(t+j+1))*Fraction(j)**(n+t-2) for j in range(1,t+1))/factorial(t-1)
   assert z==A[n][k];checks+=1
  for n in range(1,N+1):
   assert A[n][k]-A[n][k-1]==S[n+t-1][t];checks+=1
assert A[1][1]==1 and S[3][2]==3
assert checks==122041
```

## Submission pipeline reconciliation

Read AGENTS.md, current campaign ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a, manifest d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b and 0224 resume note; main head observed c070db0b23c317efa3537fa3160be8e8baca3e04. Manifest contains 37 records, 37 complete certificates, 5 actual checker-accepted own full PRs, 4 merged. Live join.txt inaccessible through web and DNS; read current upstream source lib/join.ts blob 6de9cd1b15df28419fcdda160e5f3abea64659dc, tools/oma.sh blob 0e9d771e692b971de2ac36ee450e814655ed5f3b and CONTRIBUTING_AGENTS.md. No alteration to protocol/schedules.

Independently confirmed A329813 PR13332 actual merge on 28 Nov 02:12:52 UTC, commit 0a02f00c3f1333fee90981edaa191f70a21393ce, upstream main proof blob 9a4d420b3f89e23e0ca149066e95680712aefabe and bot acceptance/credit comment 7232209171. Public profile refresh still inaccessible, and bot statement verification/novelty remains separate. MO198816 PR10139 remains open. Thus 5 checker acceptances / 4 merged / 0 independently confirmed genuine-original accepted; no increment to previous 0224 ledger.

Fresh exact all-state is:pr search and full-proof files confirmed two preceding competitors:
- MO513259 full PR16854, cjchaffin, created 01:21:47, open, proof imports OMAStatements.S_mo_513259 and pins entire main via OMA.solution. File blob c56081b984430ae3521fed0e7b88d2e0345e2396. No full checker verdict inferred.
- MO487180 full PR16447, Solfanbtc, created 00:53:58, open, proof imports OMAStatements.S_mo_487180 and pins entire negated main via OMA.disproof. File blob 839c203cf3316649e4ab8783d2619dc65facb9b2. No full checker verdict inferred.
Withhold both duplicates, no copying claim. Registrations 12514 and 12717 actually merged. MO430643 prior competitor 17716 already recorded by 0224. A372561 registration 12868 merged; exact all-state search returns only registration. Its registered statement matches canonical bytes (blob 804c4fae0501a67e1182b334649e2fb8ada54d01), and prior imported fixture matches canonical proof bytes (804b4309f0c329665ede7e6a272658740f8c44ae at dad8786dc7d4bb9cf7ec37a74f1bd23897170caa). Unlike the PR-only workflow helper, the generic REST /actions/runs?head_sha=... query covers push runs and actually returned total_count=0. Read unchanged campaign workflow blob fb85dd8b2d8c10cfacec33d3b6788191ba509b4c, push-only trigger. No local lean or gh executable, sandbox cannot resolve Github or desk. No dispatch capability observed; no additional blind push or workflow changes. The original whole checked proof does NOT substitute for missing exact imported check. No claim/heartbeat/official PR or kernel check this run. Other registration PRs 13431,14443,14393,7223,7625,10062,10398 still open.

## Resume here

A372561: obtain actual unmodified imported-target checker execution by an authorized runtime that can trigger Actions; then recheck current competitor/team/desk, submit exact one-file proof if eligible. Do not claim a check from fixture existence. A395726: full human proof established, but standard Stirling consequences and incomplete prior/eligibility gates require conservative exclusion from new-discovery tally; only consider formalization after prior review. No other worker or schedule changes.
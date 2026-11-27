# Matrix lane — MO198816 official target and independent simple-rational disproof
27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Acknowledgement: vansy (original MathOverflow question, 2 March 2015, CC BY-SA), interactive scout and combinatorics collaborators who developed the prior 13x13 certificate. This is a second mathematical witness for the SAME problem, not an additional campaign discovery or claim.

## Official reconciliation
Read AGENTS.md, current CAMPAIGN_LEDGER.md, VERIFIED_PROOFS.json, ROUND_14_VERIFIED_PROOFS_AND_FOUR_WORKER_REDIRECT.md, HOURLY_1724_MIMIC_UNIFORM_DENSITY_AND_MERGES.md, ROUND_09_MODULAR_AND_MATRIX_ENUMERATION.md, latest matrix lane checkpoint and current upstream tools/oma.sh and lib/join.ts (direct join.txt web unavailable). Three fullproof merges confirmed via actual PR metadata: 7724 (17:05:50 UTC), 7815 (17:13:14), 7817 (17:13:23), con123-gif. Ledger's actual public feed recheck run46041558445 reports same three, outcome pending; 23 complete checked certificates overall; conservative genuinely-new accepted count 0/20 pending originality review. A158960 excluded (prior identity); other two unconfirmed. MO290383 #7223 and MO466218 #7625 remain open. #9480/9482/9501/9503/9686/9702/9703/9704 open on direct read. NEW: MO198816 statement PR8568 actually merged at 17:53:21 UTC, https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8568. Explicit all-state is:pr searches for MO198816, MO290383, MO466218 and MO311744 returned only the existing statement PRs (none for MO311744). No live claim taken, no duplicate interactive PR, no lease/token accessed. Interactive team should coordinate actual submission.

Read exact newly registered upstream statement; byte-for-byte identical to archived PROOFS_READY/mo-198816.statement.lean (blob 0698d6c0abd1302ad3542d32ea4c0a25ce239a24). Recovered exact existing fork workflow campaign-verify.yml before reuse. Submitted existing clean imported-target certificate unchanged (blob f8c1c4a5e270bff287998b3f720acd01d34aa26d) to authorized fork campaign/proofs/mo-198816.lean, commit 7ce0e4c6fe2ba97c815415de43436c25f2eb6174. This is a verification-only push, NOT an official proof PR. Actual checker run https://github.com/con123-gif/open-math-agents/actions/runs/46045839791 job 140664770573 running at last read. No result inferred. Exact target has irreducibility, column stochasticity, row diagonal dominance, strictly positive normalized w, complexified spectral radius. Previous combined inline certificate passed run46031510476. MO311744 repair run46036906147 job140634502717 actually failed (three unsolved goals, two linarith errors, sorryAx); freely chosen basis interpretation prior known, so not a new problem and excluded.

## Independent simpler rational witness (complete human disproof + executed integer certificate)
Source https://mathoverflow.net/questions/198816/spectral-radius-of-a-column-stochastic-matrix-perturbed-by-a-rank-1-matrix : no answers displayed in retrieved source, asker explicitly notes doubly stochastic case solved. Exact source reviewed again. Related primary literature Berkhout/Heidergott/Van Dooren 2024 DOI 10.1137/22M1489162 concerns rank-one perturbations preserving stochasticity, not this exact subtractive conjecture. TrureTuring research/conjectures and targeted search checked, no matching result located; not exhaustive, priority not claimed.

Use indices 0..12. Let P_ij=(1+130000 [i=j]+129987 [i=min(j+1,12)])/260000, as in the earlier exact certificate. Replace the large rational w by the simple w=(880,1,1,1,1,1,1,1,1,1,1,1,109)/1000. P is strictly positive, hence irreducible, each column sums to 1, every row and column has strict diagonal dominance margin at least 2/260000; w strictly positive, sums to 1. Set M=P-(P 1)w^T. Then M1=0. Exact certificate below proves rho(M)>1 without approximate eigenvalues or constructing an eigenvector.

Schur reduction proof for real polynomial p(z)=a0 z^d+...+ad, leading nonzero. Assume all complex roots r_j satisfy |r_j|<=1. Necessary |ad|<=|a0| by root product. Define p*(z)=z^d p(1/z). If |ad|<|a0|, polynomial q(z)=(a0 p(z)-ad p*(z))/z has degree d-1, leading a0^2-ad^2>0. For |z|>1, |z-r|^2-|1-conj(r) z|^2=(|z|^2-1)(1-|r|^2)>=0. Roots of real p closed under conjugation, so |p*(z)|<=|p(z)|. Since p(z) nonzero outside unit disk and |ad|<|a0|, reverse triangle inequality implies q(z) nonzero there. Thus all roots of q lie in the closed unit disk. Iterate, using gcd rescaling (preserves roots). Exact integer recurrence from degree 13 down to 3 meets strict prerequisite at every step; at degree 2, 10001 |a0| < 10000 |a2| < 10002 |a0|. Contradiction to product of roots. Therefore rho(M)>1. No floating-point values used for the proof. This independently refutes the full source, even with strict row AND column dominance and small-denominator weights. It is not another distinct problem.

Executed Python code (integer Faddeev-LeVerrier recurrence and independent SymPy characteristic polynomial comparison; no Lean verification for this alternative):
```python
from math import gcd
from functools import reduce
n=13; D=260000000
P=[[1+130000*(i==j)+129987*(i==min(j+1,n-1)) for j in range(n)] for i in range(n)]
w=[880]+[1]*11+[109]; assert sum(w)==1000
assert all(sum(P[i][j] for i in range(n))==260000 for j in range(n))
assert min(P[i][i]-sum(P[i][j] for j in range(n) if j!=i) for i in range(n))==2
assert min(P[j][j]-sum(P[i][j] for i in range(n) if i!=j) for j in range(n))==2
N=[[1000*P[i][j]-sum(P[i])*w[j] for j in range(n)] for i in range(n)]
def mul(A,B):return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
B=[[int(i==j) for j in range(n)] for i in range(n)]; c=[1]
for k in range(1,n+1):
 B=mul(N,B); t=-sum(B[i][i] for i in range(n)); assert t%k==0; ck=t//k;c.append(ck)
 for i in range(n): B[i][i]+=ck
assert all(x==0 for row in B for x in row)
import sympy as s
assert c==list(map(int,s.Matrix(N).charpoly().all_coeffs()))
a=[c[i]*D**(n-i) for i in range(n+1)]; g=reduce(gcd,a);a=[v//g for v in a]
assert a[-1]==0
for degree in range(n,2,-1):
 assert len(a)==degree+1 and abs(a[-1])<abs(a[0])
 b=[a[0]*a[i]-a[-1]*a[-1-i] for i in range(degree)];g=reduce(gcd,b);a=[x//g for x in b]
assert len(a)==3 and 10001*abs(a[0])<10000*abs(a[-1])<10002*abs(a[0])
```
Actual output: strict row/column margin 2/260000; exact charpoly cross-check passed; degree 2 strict violation 1.0001 < |constant/lead| < 1.0002. Exact computation completed in sandbox. Prior eigenvector Lean certificate is preferred for official submission, not this new Schur recursion.

Other screening: MO431996, trace inequality, 80,000 random PSD triples across dimensions 2,3,4,8, each at s=.1,.5,.9; no violation; largest sampled ratio .7224593321. This is NOT a proof; no claim. MO338936 has a flawed public attempted proof and is not yet audited for eligibility; no claim. No new problem lease.

RESUME HERE: inspect actual official-imported checker JSON/log for run46045839791/job140664770573, relay result to interactive owner, and check all-state MO198816 PRs before any claim. Do not duplicate interactive scout submission. 

# MO239178: exact positive-stability counterexample — 27 November 2026

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); source author Gary and Federico Poloni's numerical-testing suggestion acknowledged. Standard weighted maximum-norm spectral estimate and intermediate value theorem are classical. No priority claim.

STATUS: complete informal disproof, independently executed exact integer arithmetic in this session (pure Python signed permutation determinant and SymPy Berkowitz). Not Lean verified, not officially claimed/submitted, not a counted resolution.

## Source and coordination
Source https://mathoverflow.net/questions/239178/showing-positive-stability-of-a-matrix-constructed-from-a-positive-matrix (18 May 2016), question: for real entrywise positive nonsingular A and s>rho(A), must B=(A^T A)^(-1)(sI-A^T) have all eigenvalues with positive real part? The visible question, its own n=2 analysis, and visible comments were read; page has no answer and two collapsed comments not recovered. Current upstream all-state exact-ID search with is:pr returned zero results, not proof of novelty. TrureTuring research/conjectures catalogue landing pages read and exact-ID site search gave no matching result; full catalogue/source-primary review not completed. Live lefttosolve.com/join.txt and /p/mo-239178 inaccessible via web; no valid claim or team-state check, no desk bypass. Current official tools/oma.sh read. Do not submit until gates clear. Other lane reservations unchanged.

Preflight repository head b0b05efc35d4838684e59ad2571abdb4707e88cc, AGENTS.md, current CAMPAIGN_LEDGER.md and VERIFIED_PROOFS.json (35 complete archived, 5 full PRs, 4 upstream accepted, 3 merged, 0 confirmed genuine-new), previous MO235344 native repair note. Root exclusion of MO235344 (prior full 6x6 byrohan 4a3de5ff) and failure of own repair run46073211016 respected; no further work on duplicate. Direct upstream PR metadata reconfirmed merged7724/7815/7817, open unmerged10139 and13332. No count change here.

## Exact witness and proof
Take
```
A = [[1,1,1,6000,1],
     [6000,1,17000,1,1],
     [1,1,1,1,1],
     [1,1,2,1,1],
     [1,1,20000,12000,2]]
s = 1100
w = (10,100,1,1,40)^T
```
Every entry is strictly positive. det A = -35988001, hence nonsingular. The entrywise slack sw-Aw=(4849,32859,948,947,11810)^T is strictly positive. For any complex eigenpair Av=lambda v with v !=0, choose i maximizing |v_i|/w_i>0. Then
|lambda| |v_i| <= sum_j A_ij |v_j| <= (Aw)_i |v_i|/w_i < s |v_i|.
Thus |lambda|<s for every eigenvalue, hence rho(A)<s in finite dimension. No approximate eigenvalues used.

Set M=sI-A^T and H=A^T A. Exact determinant evaluations:
det M=1477012919376901 > 0,
det H=1295136215976001 > 0,
det(20000 M+H)=-25440507942060306272593377615362043999 < 0.

The real polynomial f(t)=det(M+tH) is continuous. Since f(0)>0 and f(1/20000)=det(20000 M+H)/20000^5<0, the IVT yields t in (0,1/20000) with det(M+tH)=0. As H is invertible, B+tI=H^(-1)(M+tH) is singular; hence -t is an actual strictly negative real eigenvalue of B. This refutes the full universal assertion, with all source premises. In particular the issue is not just a complex eigenvalue near the imaginary axis.

## Actual independent execution
The original larger positive witness was discovered by a seeded differential evolution search over positive stochastic matrices conjugated by positive diagonal matrices, followed by integer rounding; an exact greedy entry reduction retained determinant signs and positive spectral slack. Numerical search is not the proof. The simplified witness was checked first by Python signed permutation expansion and then separately by SymPy Berkowitz, with the exact results above. Reproducer (no dependency for first determinant method):
```python
from itertools import permutations
from math import prod
A=[[1,1,1,6000,1],[6000,1,17000,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,20000,12000,2]]
w=[10,100,1,1,40]; n=5; s=1100
def det(X):
    return sum((-1)**sum(p[i]>p[j] for i in range(n) for j in range(i+1,n))*prod(X[i][p[i]] for i in range(n)) for p in permutations(range(n)))
M=[[s*(i==j)-A[j][i] for j in range(n)] for i in range(n)]
H=[[sum(A[k][i]*A[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
K=[[20000*M[i][j]+H[i][j] for j in range(n)] for i in range(n)]
assert all(a>0 for row in A for a in row)
assert [s*w[i]-sum(A[i][j]*w[j] for j in range(n)) for i in range(n)]==[4849,32859,948,947,11810]
assert det(A)==-35988001
assert det(M)==1477012919376901
assert det(H)==1295136215976001
assert det(K)==-25440507942060306272593377615362043999
import sympy as S
for X in (A,M,H,K):
    assert S.Matrix(X).det(method="berkowitz")==det(X)
```
For n=1, original conjecture is true directly (s-a)/a^2>0; n=2 discussed by source. This witness does not claim minimum dimension. Positivity is strict, not merely nonnegative; spectral bound strict, not equality; no diagonalizability assumption used.

## RESUME HERE
Complete missing source comments/revisions, current live eligibility/team and TrureTuring full catalogue/primary review for MO239178. Build exact Lean certificate using explicit Fin 5 matrices, weighted maximum modulus bound, integer determinant sign certificates and intermediate value theorem; alternatively use determinant sign as a necessary consequence of positive stability via real characteristic polynomial factorization. Execute on the actual campaign pins with own coordinated verifier slot, check actual exit0/full logs/selected theorem axioms, upload canonical proof then register faithful source only if no prior resolution/competing PR and official coordination allows. This is not a request to reclaim any old lease. No shared verifier branch overwritten or other worker changed.

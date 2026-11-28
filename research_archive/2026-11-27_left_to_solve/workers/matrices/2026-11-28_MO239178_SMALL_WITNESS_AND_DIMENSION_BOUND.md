# MO239178 — smaller exact witness and low-dimensional obstruction (2026-11-28)
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); source Gary, numerical-testing suggestion Federico Poloni, classical weighted maximum norm, Schur triangularization, determinant derivative and intermediate value theorem. No priority claim.
Status: exact mathematical result, executed integer checks; not Lean-verified, not a new officially accepted problem. Follow-up to 015633a555e2e98806b1b55b3b742892b7aeff24.

## Current preflight
Read AGENTS.md, campaign ledger blob 1537e7cf3ad62ce61cc962d2c25681e8b3606a50 (latest entry 23:54 UTC, 37 archived complete certificates / 5 accepted full PRs / 3 merged), VERIFIED_PROOFS.json blob 379caca5d953a3f0a1eff550262059bdf98e0285 (older internal count 36, use later ledger), previous lane checkpoint. Direct PR metadata reconfirmed 7724/7815/7817 merged, 10139/13332 open, and 14443/7223/7625 open; no new accepted count. Current upstream main README, lib/join.ts blob 6de9cd1b15df28419fcdda160e5f3abea64659dc, app/join.txt/route.ts and tools/oma.sh blob 0e9d771e692b971de2ac36ee450e814655ed5f3b read. Direct live join.txt and problem brief inaccessible; read-only failure not a desk 503 or denial. Upstream exact-ID is:pr all-state search (MO239178 OR 239178) returned no hits, and statements/mo-239178.lean and proofs/mo-239178.lean both returned 404. Catalog fetch returned empty content, so live eligibility/team state is not verified. No claim or submission. TrureTuring site search found no exact positive-stability entry; full catalog audit not completed. No shared branch or peer slot modified.
Source https://mathoverflow.net/questions/239178/showing-positive-stability-of-a-matrix-constructed-from-a-positive-matrix and all three revisions https://mathoverflow.net/posts/239178/revisions read. Original first revision was for positive stochastic matrices; the second explicitly removed stochastic. Current source is therefore exactly the general entrywise positive nonsingular real matrix question. No answer displayed. Five comments visible, two collapsed comments remain unread (attempted expanded link returned same page). No exclusive priority claim.

## Complete smaller exact counterexample
A = [[1,1,1,500,1],[600,1,1300,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1300,1000,2]]
s = 95, w = (13,112,2,2,51)^T, M=sI-A^T, H=A^T A.
All entries positive. det A=-298901. sw-Aw=(57,75,10,8,18)^T strictly positive. The weighted max-coordinate argument in the previous note proves rho(A)<95 for every complex eigenvalue, not just a numerical radius estimate. An independent spectral check: charpoly A=z^5-6z^4-4692z^3-298001z^2+499z+298901; at 95 the leading term minus sum of absolute other terms is 536496794>0; division by |z|^5 shows no roots at |z|>=95.
det M=537189406 >0; det H=89341807801>0; det(2048M+H)=-16090924238205789944767303 <0.
Thus det(M+tH) changes sign on [0,1/2048], yielding a strictly negative real eigenvalue -t of H^{-1}M. Maximum integer entry is 1300 instead of 20000. The eigenvalue interval is different from the previous witness. No claim of minimum size/dimension.
Exact computation executed in container: independent signed permutation expansion and SymPy Berkowitz agreed for all four determinants; integer slack checked. Reproducer:
```python
from itertools import permutations
from math import prod
import sympy as S
A=S.Matrix([[1,1,1,500,1],[600,1,1300,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1300,1000,2]])
s=95; w=S.Matrix([13,112,2,2,51]); M=s*S.eye(5)-A.T; H=A.T*A; K=2048*M+H
assert all(a>0 for a in A)
assert list(s*w-A*w)==[57,75,10,8,18]
def det(X):
    return sum((-1)**sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))*prod(int(X[i,p[i]]) for i in range(5)) for p in permutations(range(5)))
for X,d in zip([A,M,H,K],[-298901,537189406,89341807801,-16090924238205789944767303]):
    assert det(X)==X.det(method='berkowitz')==d
p=A.charpoly().all_coeffs()
assert p==[1,-6,-4692,-298001,499,298901]
assert s**5-sum(abs(p[i])*s**(5-i) for i in range(1,6))==536496794
```

## General structural result: negative real eigenvalues impossible for n<=3
For any n>=1 under exactly the current source hypotheses, put f(t)=det(M+tH). Then:
* constant coefficient det M >0 (real eigenvalues of A give positive factors s-lambda, conjugate pairs give squared moduli);
* coefficient of t is det M tr(M^{-1}H)>0. Indeed M^{-1}=s^{-1} sum_{k>=0}(A^T/s)^k by the convergent Neumann series, so M^{-1} is entrywise strictly positive, and H is entrywise strictly positive;
* leading coefficient det H=(det A)^2>0;
* coefficient of t^{n-1} is det H tr(H^{-1}M)>0. In fact H^{-1}M=s A^{-1}A^{-T}-A^{-1}, so its trace is s||A^{-1}||_F^2-tr(A^{-1}). Complex Schur triangularization gives ||A^{-1}||_F^2 >= sum_j |lambda_j(A)|^{-2}. Since s>|lambda_j(A)|>0, s sum_j |lambda_j|^{-2} > sum_j |lambda_j|^{-1} >= tr(A^{-1}), which is real. This proves strict positivity.
The coefficient identities follow by expanding det(I+tC) to first order at zero, and by reversing the polynomial. For n=1,2,3 these four coefficient positions cover every coefficient, so f(t)>0 for t>=0 and B has no nonpositive real eigenvalue. This does NOT exclude conjugate nonreal eigenvalues with negative real part in dimension 3. For n=2 it implies full positive stability: if eigenvalues are nonreal conjugates, their common real part is tr(B)/2>0. For dimension >=4 the interior coefficients are not controlled by this argument. For the specific negative-real-root mechanism, dimension at least 4 is necessary. Numerical bounded searches for 3x3 and 4x4 did not establish a universal claim and are not a minimum-dimension proof.

## RESUME HERE
Recover actual current brief/team/eligibility and the two missing comments, then finish bounded prior review; if clean, verify a source-faithful exact Lean certificate using the smaller witness and either weighted norm or charpoly bound, determinant signs and IVT. No native Lean available in this container. Use coordinated official campaign verifier only after current gate, actual full-file exit 0/errors/axiom audit; do not report a pass before execution. No new official submission, no change to counts.
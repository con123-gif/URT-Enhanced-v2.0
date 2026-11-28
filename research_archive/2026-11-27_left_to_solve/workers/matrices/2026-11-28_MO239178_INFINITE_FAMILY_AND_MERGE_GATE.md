# Matrix lane: MO239178 infinite family; actual merge and duplicate gates (28 Nov 2026)

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); Gary (original MO239178 question, 18 May 2016), Federico Poloni (numerical test suggestion), standard weighted maximum norm and IVT. No priority or Lean pass claim.

## Actual new mathematical result
The earlier single 5x5 counterexample extends to a rigorous infinite family for **every real r >= 14**. Set k=r^3, s=4r^2 and
```
A = [[1,1,1,5*k,1],
     [6*k,1,13*k,1,1],
     [1,1,1,1,1],
     [1,1,2,1,1],
     [1,1,13*k,10*k,2]]
w = [3*r,5*r^2,2,2,2*r^2]^T.
```
A is strictly entrywise positive and det(A)=-(5*r^3-1)*(6*r^3-1) != 0. The five entries of s*w-A*w are, exactly,
```
2*r^3-7*r^2-3*r-2
2*r^4-26*r^3-7*r^2-2
r^2-3*r-4
r^2-3*r-6
8*r^4-46*r^3-9*r^2-3*r
```
After substituting r=u+14, the minimum coefficient in each polynomial is respectively 2,2,1,1,8. Thus all are strictly positive for u>=0. The weighted maximum coordinate argument in the preceding note proves rho(A)<s for every r>=14, including complex eigenvalues. Consequently det(M)>0 for M=sI-A^T (real eigenvalue factors strictly positive and conjugate factors pair to squared moduli).

Let H=A^T A and K=3*r^4*M+H. The determinant polynomial p(r)=det(K) has degree 31 and its descending coefficients, including zeros, are
```
[-21902400,95739408,-6320592,-2660688,-11629224,42282,8793036,46350792,671679,-2025072,-23598882,-128493,77994,5705895,10854,-16650,-818253,-2196,7146,83712,279,-867,-6660,-9,48,433,0,-3,-22,0,0,1]
```
The sum of the strictly positive nonleading coefficients is 157483559. Hence for all r>=14,
p(r) <= r^30*(-21902400*r+157483559) < 0,
since 21902400*14=306633600. This is a uniform proof by a coefficient bound, not a finite sample or asymptotic inference. By the IVT, det(M+tH) has a root in (0,1/(3*r^4)); H is invertible, so B=H^{-1}M has a negative real eigenvalue in (-1/(3*r^4),0). In particular for all integer r>=14 we obtain strictly positive integer matrices satisfying all source premises and disproving the same assertion. This adds zero distinct problem counts.

## Executed independent exact symbolic check
SymPy domain-ge determinant and direct signed permutation expansion were actually executed and agreed as polynomials. No native Lean is installed. Reproducer:
```python
import sympy as S
from itertools import permutations
from math import prod
r=S.symbols('r'); k=r**3
A=S.Matrix([[1,1,1,5*k,1],[6*k,1,13*k,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,13*k,10*k,2]])
s=4*r**2; w=S.Matrix([3*r,5*r**2,2,2,2*r**2])
M=s*S.eye(5)-A.T; H=A.T*A; K=3*r**4*M+H
p=S.Poly(K.det(method='domain-ge'),r)
q=S.Poly(sum((-1)**sum(v[i]>v[j] for i in range(5) for j in range(i+1,5))*prod(K[i,v[i]] for i in range(5)) for v in permutations(range(5))),r)
assert p==q
assert p.degree()==31 and p.LC()==-21902400
assert sum(c for c in p.all_coeffs()[1:] if c>0)==157483559
assert 14*(-p.LC())==306633600
assert [min(S.Poly(e.subs(r,r+14),r).all_coeffs()) for e in s*w-A*w]==[2,2,1,1,8]
assert S.expand(A.det()+(5*r**3-1)*(6*r**3-1))==0
```
Additional exploratory optimization for dimensions 3 and 4 produced near-singular floating-point artifacts, not valid counterexamples. No improved dimension claim. Earlier n<=3 negative-real-eigenvalue exclusion still stands, not a full n=3 stability proof.

## Current gates / official updates (fresh public metadata)
Read current campaign ledger, VERIFIED_PROOFS.json (37 actual records although stale field says36), preceding lane notes, AGENTS.md, current upstream main b3d07a39e4fecfd60168b711a3b3187b1873ea98, official tools/oma.sh and lib/join.ts. Archive branch head observed f572ac507f550674cd17c0f4da4bb90616c69789 before this write. Direct site join.txt and MO239178 brief failed via web; local DNS failed for site and StackExchange API. Exact current source question read, still five displayed comments/two collapsed inaccessible. All-state is:pr exact-ID search empty. No official statements/proofs/mo-239178.lean exist; readable catalog.json, extra.json, extra2.json, stackexchange.json and status_overrides.json contain no 239178. Packed extra3.json.gz and generated cards unavailable through text connector; cannot determine live eligibility. TrureTuring exact search no result, not a complete catalogue audit. No claim or public PR; this is NOT an observed desk 503, and no permission denial bypass.

**Actual registration MO513259 PR12514 merged 2026-11-28 00:21:13 UTC.** Fresh all-state exact-ID search found **foreign full-proof PR16854**, cjchaffin, created 01:21:47 UTC, currently open, one added proofs/mo-513259.lean. No foreign kernel acceptance asserted. Withhold duplicate official submission and preserve our earlier complete independent certificate and timestamp. https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/16854

**Actual registration MO430643 PR13174 merged 2026-11-28 01:53:27 UTC.** Fetched actual statements/mo-430643.lean and byte-for-byte compared against TARGET_VARIANTS/mo-430643-pr13174/statement.lean: both 841 characters, exact equality. Fresh is:pr exact-ID search returned only registration13174; no proofs/mo-430643.lean on main at observation. The adapter proof8badfe72 is the correct one. This is root/scout arithmetic lane; immediate coordination handoff here, not a duplicate matrix claim. No imported-target run started here, no new full PR/acceptance. https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/13174

Actual 7724/7815/7817 merged; 10139 and13332 still open, accepted per existing independently verified ledger. MO2903837223, MO4662187625, MO30948514443 and A38547814393 still open. Current conservative totals remain 37 archived whole Lean certificates, 5 actual own full checker acceptances, 3 merged public proofs, 0 certified original accepted discoveries out of20. Registrations and competitor proofs do not increase own totals.

## RESUME HERE
Root/scout: advance MO430643 now that exact registered statement has merged; fresh race and ownership gate, actual imported-target check with proof8badfe72, current valid coordination then authorized separate full PR if clean. MO513259: record competitor16854 and do not duplicate. Matrix: do not invest further in witness variants for MO239178 until actual eligibility and remaining comments/primary gate are resolved; move to a fresh live eligible matrix problem. No changes to any other worker, schedule, verifier branch or RH research.

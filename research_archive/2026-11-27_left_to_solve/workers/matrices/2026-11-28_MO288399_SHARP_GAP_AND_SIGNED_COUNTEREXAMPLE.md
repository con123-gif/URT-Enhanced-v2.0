# MO288399: sharp all-column gap bound, exact signed counterexample, and duplicate gate
28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Credit source author Saurabh Agrawal, related MSE 2562425, classical Rayleigh variational principle and Schur complement, and Hengzhi He (@hehz2020) for earlier official statement PR19124 and linked complete candidate for the false stronger Euclidean claim. No originality or Lean verification claim.

## Source and coordination
Current source https://mathoverflow.net/questions/288399, 0 displayed answers/comments; revision page https://mathoverflow.net/posts/288399/revisions inspected (4 revisions, current and comparison text available); related MSE https://math.stackexchange.com/questions/2562425/bounds-on-gap-between-least-eigenvalues-of-correlation-matrix-and-its-principal inspected. The source asks for a bound on Delta = min_i (lambda_min(Sigma deleting i)-lambda_min(Sigma)) for real correlation matrices, explicitly requests its last weaker Euclidean bound for ALL columns, and suggests several additional empirical claims. Current official statement/proof main paths return 404. Exact all-state REST GitHub search repo:GuillaumeBAUD-coder/open-math-agents is:pr "mo-288399" found PR19124 (hehz2020, 03:39:51 UTC, open, only statements/mo-288399.lean). Its statement targets ONLY the false Euclidean denominator n-1 inequality. Its body links https://github.com/hehz2020/open-math-agents/blob/e41d4773b775f66b4ded914dd10bfadc22796261/proofs/mo-288399.lean, full file read, blob beff012a47cb82ff7e1236d5b69c328455737286. The linked complete mathematical counterexample is the source's own 3x3 negative equicorrelation matrix, with gap 1/2 and Euclidean bound sqrt(1/2)/2 < 1/2. No foreign Lean run or merge inferred. Do not duplicate or reinterpret the pending registered target. The extra affirmative and negative source observations below are independent hand results, not another official problem. Live agent brief inaccessible; direct local DNS unavailable. Bounded exact TrureTuring/prior web queries did not recover additional direct results, not an exhaustive literature audit.

## All-column bound and equality (complete hand proof)
For n>=2, real symmetric PSD Sigma with diagonal 1, let lambda=lambda_min(Sigma), H=Sigma-lambda I, d=1-lambda. Then H is PSD singular with constant diagonal d>=0. Let Delta=min_i lambda_min(H_{-i}), using principal deletions. All these eigenvalues are nonnegative. Claim:
  0 <= Delta <= d/(n-1) <= 1/(n-1),
  for every j, Delta <= ||C_j||_2^2/d (when d>0),
  and hence for every j, Delta <= ||C_j||_2/sqrt(n-1).
If d=0, trace forces Sigma=I and all statements with nonzero denominators removed give Delta=0; if Delta=0 the bounds are immediate. Otherwise let v be a unit null vector of H. For each i, w=v with coordinate i set to zero. By Hv=0, w^T H w = d v_i^2, and ||w||^2=1-v_i^2. Choose i of minimum squared component, v_i^2<=1/n. Rayleigh gives Delta*(1-v_i^2)<=d v_i^2 and thus Delta<=d/(n-1). This also proves source observation 3.

For every j, partition H into diagonal d, off-diagonal column c=C_j, and Q=H_{-j}. Since Delta>0, Q>=Delta I is invertible. Block elimination det H=det Q*(d-c^T Q^{-1}c)=0, so d=c^T Q^{-1}c<=||c||_2^2/Delta by spectral theorem. This gives the squared-column bound; combining with d>=(n-1)Delta yields the desired sharp all-column Euclidean denominator sqrt(n-1), answering the author's explicit final request. No sampling is used in the derivation.

Equality classification: if Delta>0 and Delta=d/(n-1), each Rayleigh inequality for w forces v_i^2>=1/n, hence all equal 1/n. Every deleted vector achieves the smallest possible Rayleigh quotient Delta, so for all distinct i,j, -H_ji*v_i=Delta*v_j. With s_i=sign(v_i), H=(d+Delta)I-Delta*s*s^T and therefore Sigma has off-diagonal entries -Delta*s_i*s_j, i.e. a signed negative equicorrelation matrix. Conversely that form, with 0<Delta<=1/(n-1), has lambda=1-(n-1)Delta and every deletion has smallest eigenvalue lambda+Delta. Equality in the all-column Euclidean bound for any column and Delta>0 forces d=(n-1)Delta from the chain, hence exactly the same classification. The source's upper bound 1/(n-1) is achieved iff the form has Delta=1/(n-1), lambda=0; the two described sign patterns are precisely its sign-conjugacy class. The stronger Euclidean denominator n-1 is false for every n>2, as observed independently in PR19124; no duplicate submission.

## Strictly positive definite counterexample to BOTH signed claims
Let a=56/75, b=9/10. Let H be the 5x5 matrix with unit diagonal, every off-diagonal entry among the first four indices a, and last row/column off-diagonal -b. Set Sigma=(I+H)/2. In the three-dimensional zero-sum subspace of the first four coordinates, H acts by 1-a=19/75. In the span of the normalized first-four ones vector and e_5 the matrix is [[1+3a,-2b],[-2b,1]], with determinant zero because 1+3a=4b^2, trace 106/25 positive. Hence Sigma is SPD, its least eigenvalue 1/2 is simple, with strictly positive eigenvector (1,1,1,1,18/5). Every principal deletion of H is positive definite: any zero of its nonnegative quadratic form would extend to a multiple of the sole null vector of H with one zero coordinate, impossible. Thus Delta>0. The first four signed off-diagonal column sums of Sigma are 67/100, the fifth -9/5, and the global off-diagonal signed mean is 11/250>0. Both signed upper bounds proposed in source are strictly negative and therefore false, even for SPD correlation matrices with simple positive least eigenvector.

Independent exact check executed in local Python/SymPy: H eigenvalues 106/25,19/75 (multiplicity3),0; Sigma eigenvalues 131/50,47/75 (multiplicity3),1/2. First deletion minimum 103/75-sqrt(67219)/300 > 1/2; last deletion minimum 47/75 > 1/2. All five Schur complements exactly 1 and all 20 Sylvester leading minors positive. Ten exact sharp signed-equicorrelation examples n=2..11 also passed. Reproducer:
```python
import sympy as s
n=5; a=s.Rational(56,75); b=s.Rational(9,10); H=s.eye(n)
for i in range(4):
 for j in range(i+1,4): H[i,j]=H[j,i]=a
 H[i,4]=H[4,i]=-b
A=(s.eye(5)+H)/2; v=s.Matrix([1,1,1,1,4*b])
assert H*v==s.zeros(5,1)
assert H.eigenvals()=={s.Rational(106,25):1,s.Rational(19,75):3,0:1}
assert [sum(A[i,j] for j in range(5) if j!=i) for i in range(5)]==[s.Rational(67,100)]*4+[-s.Rational(9,5)]
assert sum(A[i,j] for i in range(5) for j in range(5) if j!=i)/20==s.Rational(11,250)
for j in range(n):
 I=[i for i in range(n) if i!=j];Q=H.extract(I,I);c=H.extract(I,[j])
 assert all(Q[:k,:k].det()>0 for k in range(1,n))
 assert (c.T*Q.inv()*c)[0]==1
for n in range(2,12):
 H=(n*s.eye(n)-s.ones(n))/(n-1);Q=H[:n-1,:n-1]
 assert H*s.ones(n,1)==s.zeros(n,1)
 assert Q*s.ones(n-1,1)==s.ones(n-1,1)/(n-1)
 assert sum(H[i,0]**2 for i in range(1,n))==s.Rational(1,n-1)
```
The remaining absolute L1/mean empirical bound is not established here; finite exploratory optimization found no counterexample, not a proof. This does not affect the exact all-column Euclidean theorem or either signed disproof.

## Fresh campaign gates and RESUME HERE
Read current join.txt and exact tools/oma.sh blob 0e9d771e692b971de2ac36ee450e814655ed5f3b, AGENTS.md, ledger 2add1e4339932afa79bd58cea1a7d927925c4c8a and VERIFIED_PROOFS.json d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b; campaign head f59f79f422223cb0cac119b20d52ef0c8f4e401e observed. 37 whole certificates per ledger, 5 official full checker acceptances, 4 own mergers (fresh metadata 7724/7815/7817/13332); 10139 remains open. Zero ledger-certified original accepted discoveries out of20. Native Lean absent. 7223/7625/14443 still open; no proof-stage advancement authorized for these unmerged registrations. Further competing full PRs now explicitly verified via REST search and one-file metadata: A372561/19800 KoaOkano (created 04:20:46), A068991/16269 romechenko, MO487180/16447 Solfanbtc, A396949/16199 romechenko; registrations 12868/12465/12717/12591 actually merged. Withhold duplicate proof submissions; no competitor checker outcome asserted. A372561 older imported-target fixture dad8786dc7d4bb9cf7ec37a74f1bd23897170caa still shows zero Actions runs by SHA; not an executed check. Current MO288399 official lane occupied by PR19124 narrow false claim. Preserve this supplementary hand proof, do not count it or create another registration. Next: select a fresh exact source with clean live race and eligibility gates; no shared verifier mutation or claim made this run. All RH work, schedules and peer files untouched.

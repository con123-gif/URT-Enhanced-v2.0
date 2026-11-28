# MO289475: complete elementary proof, sharp general block-size bound (28 November 2026)

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2); source authors Hans (MO) and Ethan (linked MSE), classical Schur complement/inverse compression (Hansen–Pedersen operator Jensen, 2003, DOI 10.1112/S0024609303002200, arXiv:math/0204049). No first-ever priority claim, no Lean or official acceptance.

## Source / prior / coordination

MO https://mathoverflow.net/questions/289475/a-minimal-eigenvalue-inequality asks whether for every real symmetric positive definite A of size n>=2, lambda_min(P A)<=lambda_min(B A), P=diag(A)^(-1), B=(n-1)^(-1) sum of embedded inverse principal 2x2 submatrices. Both products have positive real eigenvalues by similarity to symmetric positive definite matrices. MO has no displayed answer. Five visible comments read; ten collapsed comments unavailable despite following link and StackExchange API. Revision page https://mathoverflow.net/posts/289475/revisions lists 11 revisions; newest changed text and revision summaries read, older full bodies not all available. Linked https://math.stackexchange.com/questions/2582112/minimal-eigenvalue-inequality read with all visible comments and its single answer, which treats n=2 and block diagonal cases rather than the general theorem. It is the same question, not another campaign target.

Fresh all-state GitHub is:pr searches for "mo-289475" and "2582112" returned no results. Main statements/mo-289475.lean and proofs/mo-289475.lean both return 404; live problem page and agent brief unavailable. Bounded exact TrureTuring search found no match; catalogue not exhaustively audited. The solution below is a direct application of classical inverse compression / operator Jensen, so conservatively no genuinely new count; do not spend verification slot or claim until eligibility, source coverage and novelty classification are settled. The original mathematical question is answered fully, independent of any formalization.

## Proof, including a sharp strengthening

Let D=diag(A), C=D^(-1/2) A D^(-1/2), lambda=lambda_min(C)=lambda_min(PA), so 0<lambda<=1 because tr C=n. For 1<=k<=n, let S run over k-element index subsets, E_S be the matrix restricting coordinates to S, A_S=E_S A E_S^T, m=binom(n-1,k-1), and define B_k=m^(-1) sum_S E_S^T A_S^(-1) E_S. Every A_S is positive definite. B_1=P and B_2=B from the original question. Put t=(k-1)/(n-1).

Claim (Loewner order): B_k >= H^(-1), H=(1-t)D+tA.

Proof: for each S the block matrix [[A_S^(-1), I_k],[I_k,A_S]] is positive semidefinite, since its quadratic form on (u,v) equals (u+A_S v)^T A_S^(-1)(u+A_S v). Embed each block by E_S, sum and divide by m. The upper-left block is B_k, the off-diagonal is I_n (each coordinate occurs m times), and the lower-right is H: each diagonal occurs m times and each off-diagonal occurs binom(n-2,k-2) times for k>=2; the ratio is t. For k=1 off-diagonals occur zero times. Evaluating the resulting positive-semidefinite form at (x,-H^(-1)x) yields x^T(B_k-H^(-1))x>=0, proving the claim. This is elementary inverse compression, a special case of operator Jensen for f(x)=1/x.

Congruence by D^(1/2) gives D^(1/2) B_k D^(1/2) >= [(1-t) I+t C]^(-1). Further congruence by C^(1/2) gives C^(1/2) D^(1/2) B_k D^(1/2) C^(1/2) >= C[(1-t) I+t C]^(-1). The left matrix is similar to B_k A (first conjugate B_k A by D^(1/2), then by C^(1/2)). The right matrix is a spectral function of C, with eigenvalues f_t(mu)=mu/(1-t+t mu), increasing on positive mu for t<1, constant 1 when t=1. Rayleigh's principle now proves

    lambda_min(B_k A) >= lambda/(1-t+t lambda) >= lambda.

The source's exact inequality follows at k=2. For every n>=2 and non-diagonal A, lambda<1, so the comparison with Jacobi is strictly improved whenever k>=2. For diagonal A both products are I. Thus equality in the original inequality holds exactly for diagonal A, including n=2.

Sharpness for every n,k and every prescribed 0<lambda<=1: choose A=C=(1-rho)I+rho J, rho=(lambda-1)/(n-1). Eigenvalues are lambda on the all-ones line and 1-rho>=1 on its orthogonal complement; A is SPD. Every A_S has eigenvalue 1+(k-1)rho on its all-ones line. Thus B_k A times the global all-ones vector is lambda/(1+(k-1)rho) times that vector, exactly the bound. The already proved lower bound ensures this is the minimum. No asymptotic qualification. Both the sharp bound and equality characterization are hand proofs, not machine-verified results.

## Executed independent challenge

30000 random SPD normalized matrices per n=3,...,12 were screened numerically, no counterexample found. More importantly, 81 exact rational Loewner tests using *all* principal minors and 44 exact sharp equality tests succeeded in local Python/SymPy. Finite tests are not the proof. Reproducer for the exact tests:

```python
from itertools import combinations
import random,sympy as s
rng=random.Random(289475); total=0
for n in range(2,8):
 for trial in range(3):
  X=s.Matrix(n,n,[rng.randrange(-3,4) for _ in range(n*n)])
  A=X.T*X+s.eye(n); D=s.diag(*A.diagonal())
  for k in range(1,n+1):
   m=s.binomial(n-1,k-1); t=s.Rational(k-1,n-1); B=s.zeros(n)
   for S in combinations(range(n),k):
    L=A.extract(S,S).inv()
    for i,a in enumerate(S):
     for j,b in enumerate(S): B[a,b]+=L[i,j]/m
   Q=B-((1-t)*D+t*A).inv()
   assert all(Q.extract(S,S).det()>=0 for l in range(1,n+1) for S in combinations(range(n),l))
   total+=1
assert total==81
for n in range(2,10):
 A=s.eye(n)-s.Rational(1,2*(n-1))*(s.ones(n)-s.eye(n))
 v=s.ones(n,1); l=s.Rational(1,2)
 for k in range(1,n+1):
  B=s.zeros(n); m=s.binomial(n-1,k-1); t=s.Rational(k-1,n-1)
  for S in combinations(range(n),k):
   L=A.extract(S,S).inv()
   for i,a in enumerate(S):
    for j,b in enumerate(S): B[a,b]+=L[i,j]/m
  assert B*A*v==l/(1+t*(l-1))*v
print('81 exact PSD tests; 44 sharp equality tests')
```

## Campaign and resume

Read current join.txt/tools/oma.sh, AGENTS.md, ledger 2add1e4339932afa79bd58cea1a7d927925c4c8a, VERIFIED_PROOFS.json d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b (37 records, canonical complete certificates field 37, older candidate field 36), previous matrix checkpoint 310e74e569f80f4c347e194197e8ed7832d37284. Fresh campaign head 0b3a057c35e4ec9d8ccc0fe8e9f39b34ead03af7 and upstream 2c51b93c40315f0d44015065a3363a1ce9b3503f observed. Current actual merged own PRs 7724,7815,7817,13332; 10139 still open. 7223,7625,14443 open; 12868 merged but other worker's imported check was outstanding in ledger. Counts 37 whole archived Lean certificates, 5 official full checker acceptances (ledger), 4 confirmed own mergers, 0 certified genuine-original accepted out of20. No claim or formal submission performed here. Direct shell DNS failed for both GitHub and official site; no Lean binary present. This is not an actual desk refusal or 503. No verifier fixture touched. Previously screened MO515594 original positivity is already refuted in TrureTuring (its separately appended r>1 question not settled by that certificate); MO512655 affine support lower bound already appears in TrureTuring; MO509601 already answered by Peter Mueller. No duplicate work on these closed claims.

RESUME HERE: treat MO289475 as a complete classical-consequence hand proof, not an original accepted discovery. Search a fresh live eligible target; monitor MO198816 and matrix registrations. No changes to RH research, worker schedules or shared workflow.

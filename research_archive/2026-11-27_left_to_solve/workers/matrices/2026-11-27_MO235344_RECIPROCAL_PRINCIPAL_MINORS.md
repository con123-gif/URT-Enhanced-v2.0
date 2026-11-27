# Matrix lane — MO235344 reciprocal principal minors (27 Nov 2026)

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source: Jiro, MathOverflow 235344, April 5 2016. Acknowledge byrohan's preceding formalization PR3755; Hartfiel–Loewy (1984), Loewy's rank criterion, and the more general cut-transpose literature.

## Result: complete exact hand disproof; standalone Lean probe pending
The original conjecture is that every invertible irreducible real matrix with the same corresponding principal minors as its inverse is diagonally similar to its inverse, possibly after transposition. For n=6 use the integer matrices below (indices 0..5):
```
A = [[0,1,0,0,0,0],[1,0,2,2,2,2],[2,0,1,2,2,2],
     [2,0,2,3,4,4],[2,0,2,2,3,4],[2,0,2,2,2,3]]
C = [[0,1,2,-2,2,-2],[1,0,0,0,0,0],[0,2,1,-2,2,-2],
     [0,-2,-2,3,-4,4],[0,2,2,-2,3,-4],[0,-2,-2,2,-2,3]]
```
Both products AC and CA are I. Every nonempty proper subset has an outgoing nonzero entry: every index other than 0 has an edge to 0; 0 has an edge to 1; 1 has an edge to every other index. Thus A is irreducible, with no reliance on a numerical test.

For every subset S, the two principal determinants coincide. This finite universal claim was explicitly evaluated for all 64 subsets in two independent implementations (SymPy and integer Leibniz permutation sum below). Lexicographic-order values grouped by subset size:
0: [1]
1: [0,0,1,3,3,3]
2: [-1,0,0,0,0,0,0,0,0,-1,-1,-1,1,1,1]
3: [3,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,3]
4: [1,1,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1]
5: [3,3,3,1,0,0]
6: [1]
In particular det A=1.

If AD=DC with D=diag(d), entry (0,2) gives 0=2d0, violating d0 ≠ 0. If A^T D=DC, entries (2,3),(3,4),(4,2) give 2d3=-2d2, 2d4=-4d3, 2d2=2d4. Hence d3=-d2, d4=2d2 and d2=d4, forcing d2=0. Equivalently the two directed cycle products are 8 and 16. This excludes both alternatives over R, not just rational diagonal matrices.

Construction: use Cayley transform A=(I+B)(I-B)^(-1), with B the skew triangle 0→1→2→0 (reverse weights -1) and directed 4-cycle 2→3→4→5→2 (weight +1), sharing vertex 2. All odd principal minors of B vanish: a nonzero permutation cover uses only 2-,3-,4-cycles, and the two orientations of the triangle cancel. This explains why B and -B have equal principal minors, and the reciprocal Cayley property follows by expanding det(A+diag(x)) and det(C+diag(x)) as multiaffine polynomials. The direct finite certificate above does not require that general argument.

## Reproducible exact check (actually executed)
```python
from itertools import combinations, permutations
from math import prod
A=[[0,1,0,0,0,0],[1,0,2,2,2,2],[2,0,1,2,2,2],[2,0,2,3,4,4],[2,0,2,2,3,4],[2,0,2,2,2,3]]
C=[[0,1,2,-2,2,-2],[1,0,0,0,0,0],[0,2,1,-2,2,-2],[0,-2,-2,3,-4,4],[0,2,2,-2,3,-4],[0,-2,-2,2,-2,3]]
N=range(6)
def det(M,S):
    return sum((-1)**sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p)))*prod(M[a][b] for a,b in zip(S,p)) for p in permutations(S))
for X,Y in [(A,C),(C,A)]:
    assert all(sum(X[i][k]*Y[k][j] for k in N)==int(i==j) for i in N for j in N)
for k in range(7):
    S=list(combinations(N,k)); v=[det(A,s) for s in S]
    assert v==[det(C,s) for s in S]; print(k,v)
for k in range(1,6):
    for S in combinations(N,k):
        assert any(A[i][j] for i in S for j in N if j not in S)
assert A[0][2]==0 and C[0][2]==2
assert A[3][2]*A[4][3]*A[2][4]==8 and C[2][3]*C[3][4]*C[4][2]==16
print('64 principal minors; 62 proper nonempty support cuts; both inverse products; two obstructions: verified by integer arithmetic')
```
Actual output matched the table; no numerical rounding. SymPy independently computed the inverse, determinant 1 and all 64 equalities.

## Eligibility and prior audit
- https://mathoverflow.net/questions/235344/conjecture-on-matrix-with-reciprocal-principal-minors (source statement, visible comments, no answers; two collapsed comments not retrieved). Related source https://mathoverflow.net/questions/221337/example-for-reciprocal-principal-minors concerns a distinct example.
- https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/3755 is a preceding statement-only PR (byrohan), open, no merge; checker comment confirms statement compiles, pending human fidelity review. Patch inspected: IsUnit det, irreducible-support, all Finset principal minors, both alternatives. All-state explicitly is:pr full-ID and title search returned this preceding statement only; no proof PR found in that bounded search. Do not duplicate the statement.
- Prior literature includes https://doi.org/10.1016/0024-3795(84)90209-x and https://arxiv.org/abs/1606.09081, plus 2025 general cut-transpose characterization https://www.cse.iitb.ac.in/~rgurjar/papers/PMESTOC25.pdf. General principal-minor equivalence is established; no direct exact reciprocal counterexample found in bounded web searches, not exhaustive. TrureTuring research catalog inspected, exact MO ID search returned no matching resolution. No historical originality claim. Further primary-literature and hidden-comment check required before claiming.
- Read AGENTS, current campaign ledger and VERIFIED_PROOFS (19:40 snapshot: 28 complete checked certificates, 4 upstream checker acceptances, 3 merged proofs, 0 confirmed genuine-open resolutions); current GitHub metadata independently confirmed merges 7724/7815/7817, 10139 open, 9503 merged statement, 7223/7625/10398/9501 open. MO487192 all-state is:pr search returned statement only, previous secure desk claim HTTP500 documented by peers. No new claim attempted because worker/owner lease count cannot be verified locally and direct site DNS unavailable. join.txt direct fetch unavailable; current full protocol read from https://lefttosolve.com/join and official tools/oma.sh from upstream main.
- MO235344 standalone complete exact-target Lean probe uploaded to existing pinned campaign verification branch, commit 9f6e2f7da60148a67ec0e28f9e6a15b8d5fcd689, file campaign/ProbeMO235344ReciprocalMatrix20261127.lean, blob 65f5128af82f00dd5d7873cbaddde7ab6bf23186. Exact readback identical. Recovered workflow campaign-verify.yml before reuse; it runs changed Probe files in pinned FC environment. No local Lean; actual native output not yet observed. No claim of kernel verification or official acceptance. Do not add to canonical PROOFS_READY until complete kernel pass and source audit.

## RESUME HERE
Read actual verifier job output for commit 9f6e2f7d (not mere workflow conclusion). Repair first failing determinant/orderEmbOfFin simplification using explicitly generated increasing index maps and Laplace expansion if needed. Once the full exact theorem passes, archive verified certificate and coordinate with the owner; do not submit until registration actually merged, imported target checked, novelty/eligibility audited and fresh valid lease established.

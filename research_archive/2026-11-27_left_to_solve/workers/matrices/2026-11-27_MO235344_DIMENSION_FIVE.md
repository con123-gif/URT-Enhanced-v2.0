# Matrix lane — MO235344 smaller exact witness (27 Nov 2026, after 20:51 UTC)

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Original problem Jiro (2016), existing formalization by byrohan (PR3755); acknowledge prior Hartfiel–Loewy and principal-minor-equivalence work. This is a new dimension-five witness for the SAME problem, not a second solve or a novelty-certified discovery.

## Mathematical result
Let A=X/3 and C=Y/3, with
```
X=[[1,2,-2,-2,0],[-4,1,2,2,0],[2,-2,-1,-4,0],[0,0,0,0,3],[-2,2,-2,1,0]]
Y=[[1,-2,-2,0,-2],[4,1,-2,0,-2],[2,2,-1,0,-4],[-2,-2,-2,0,1],[0,0,0,3,0]]
```
XY=YX=9I and det X=243, so C=A^-1 and det A=1. Every vertex reaches 0 (3 via 4), and 0 reaches every vertex (4 via 3), hence A irreducible. All 32 principal minors of X and Y coincide, hence those of A and C coincide after division by 3^|S|. Exact integer list, by cardinality and lexicographic subset order:
0 [1]
1 [1,1,-1,0,0]
2 [9,3,0,0,3,0,0,0,0,-3]
3 [-9,0,0,0,0,9,0,0,9,27]
4 [0,0,-27,27,27]
5 [243]

If AD=DC, the (0,4) entry gives 0=(-2/3)d0, impossible. If A^T D=DC, entries (0,1), (1,2), (2,0) give d0=2d1, d2=d1, d0=-d2, so d0=0. Equivalently cycle products -16/27 and 8/27 differ. All source hypotheses preserved, and the contradictions cover every real nonsingular diagonal D.

Discovery: a deterministic seeded search of zero-diagonal five-dimensional {-1,0,1} Cayley preimages (seed 7125, candidate iteration 19716) gave B=[[0,0,0,-1,1],[-1,0,0,0,0],[0,-1,0,-1,1],[0,0,1,0,1],[0,0,-1,-1,0]]. Its odd minors vanish (all ten triple minors and det B=0), det(I-B)=6. A=(I+B)(I-B)^-1. The direct integer witness needs no search assumptions. An exhaustive restricted 4-dimensional search over the 3^12 sign/zero off-diagonal preimages found none with the prescribed conditions; this is NOT a dimension-four impossibility theorem and does not cover arbitrary reals or Cayley singularities.

## Independent actual verification
SymPy independently derived A,C from B, verified det A=1, all principal minors and all support cuts. Separate executed pure Python integer Leibniz determinant certificate:
```python
from itertools import combinations, permutations
from math import prod
X=[[1,2,-2,-2,0],[-4,1,2,2,0],[2,-2,-1,-4,0],[0,0,0,0,3],[-2,2,-2,1,0]]
Y=[[1,-2,-2,0,-2],[4,1,-2,0,-2],[2,2,-1,0,-4],[-2,-2,-2,0,1],[0,0,0,3,0]]
N=range(5)
for M,P in [(X,Y),(Y,X)]:
    assert all(sum(M[i][k]*P[k][j] for k in N)==9*(i==j) for i in N for j in N)
def det(M,S):
    return sum((-1)**sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p)))*prod(M[a][b] for a,b in zip(S,p)) for p in permutations(S))
for k in range(6):
    S=list(combinations(N,k));v=[det(X,s) for s in S]
    assert v==[det(Y,s) for s in S];print(k,v)
for k in range(1,5):
    for S in combinations(N,k):
        assert any(X[i][j] for i in S for j in N if j not in S)
assert det(X,tuple(N))==243
assert X[0][4]==0 and Y[0][4]!=0
assert X[1][0]*X[2][1]*X[0][2]==-16
assert Y[0][1]*Y[1][2]*Y[2][0]==8
```
Actual output matched all six tables above; 32 equal principal minors, 30 support cuts, both inverse products and both obstructions passed.

## Source and workflow status
Read AGENTS.md, latest CAMPAIGN_LEDGER.md through A181674 final handoff, VERIFIED_PROOFS.json (blob acac7ec1f4a12e3268a49b26ef2b00469a8ef57c: 31 records, lagging numeric field30), previous matrix-lane checkpoint at326da5bfd73c1bdaeeb6d74b7b2a98972771bbb5 and its complete six-dimensional probe. Current upstream tools/oma.sh was read; join.txt and /join were inaccessible from web, local DNS unavailable. Read MO235344 actual source; no answers, 5 visible comments, 2 hidden comments not retrievable by the attempted StackExchange API. Bounded literature and TrureTuring searches did not establish a preceding exact result; originality remains unconfirmed. All-state is:pr search connector returned zero for known IDs and is demonstrably incomplete; direct PR3755 confirms the prior statement, open/unmerged. Do not claim on these gates. Direct GitHub metadata confirms 7724/7815/7817 merged, 10139 open/unmerged, 7223/7625 open, 9503 merged statement. Ledger confirms 31 full checked archive certificates, 4 official full proof submissions/checker acceptances, 3 merged credited formal proofs, 0 conservative confirmed genuinely new accepted results. No count increment for this smaller witness. No new lease requested, no official PR opened, no duplicate claim.

Previous six-dimensional verification commit9f6e2f7da60148a67ec0e28f9e6a15b8d5fcd689: push run ID unavailable via connector (commit workflow endpoint filters PR runs; empty; combined status empty). No Lean installed locally and DNS unavailable. No new PASS inferred. Recovered exact existing fork campaign-verify.yml before reusing. Uploaded dimension-five standalone exact-target probe campaign/ProbeMO235344Five20261127.lean on oma-campaign-20261127, commit a4f48608d9e43b2de8efed27259f39f87d0915a5, blob8e409b04565a041b9d800c68a0b98d76a8129c1e; immutable readback identical. Uses rational determinant kernel computation (decide, not native_decide), transfer to real determinants via Rat.castHom and RingHom.map_det, actual support and real diagonal obstructions. Both original and alternate Lean probes remain unverified in this run. Pinned mathlib source confirms names Matrix.inv_eq_right_inv, Matrix.isUnit_det_of_right_inverse, RingHom.map_det and Finset.orderEmbOfFin_unique. Potential elaboration repair if needed: unfold minorQ in the simpa cast step, or use explicit increasing index maps and finite Laplace expansions in lieu of orderEmb evaluation.

## RESUME HERE
Retrieve actual push-job logs for either of the two immutable probe commits (prioritize the dimension-five witness a4f48608d); read first failing obligation, repair and check actual kernel exit/axioms before adding a canonical certificate. No official submission until registration has merged, exact target imported, eligibility/current PRs and valid lease checked. Do not repeat the dimension-six calculation or claim that dimension five is minimal.

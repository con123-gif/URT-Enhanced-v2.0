# Left to Solve round 3 — affine antipodal geodesics, 2026-11-27

Credit: con123-gif (URT/Newton's Cathedral research), assisted by ChatGPT (GPT-6.2).
Continuation of ROUND_02_RECURSIVE_PROOFS.md. Separate mathematics track; no physics gate or RH task changes. Exact human-readable proofs below, computational matrix enumeration actually executed in sandbox. No Lean verification, external submission, or originality claim. Recursive phase reduction is URT-inspired; the original golden-angle controller was not executed.

## Problem and context
https://www.openproblemgarden.org/op/edge_antipodal_colorings_of_cubes
https://mathworld.wolfram.com/NorinesAntipodal-ColoringConjecture.html
The ordinary antipodal path theorem is reported proven (Wu and Yang, https://arxiv.org/abs/2607.19276; Djaljapayan, https://arxiv.org/abs/2611.16243). The stronger geodesic version is distinct and remains open in general. Published computations already cover arbitrary colorings through n=8; the finite tests here check our reduction, not a new dimension record.

An affine edge coloring of Q_n is c_i(x)=(Ax)_i+b_i in F2, where A is n x n over F2, A_ii=0 and A 1=1 (odd row sums). These conditions are equivalent to the coloring being well-defined on undirected edges and flipping color at the antipode. For any order p of coordinate flips, h_i(p)=sum_{j preceding i} A_ij. Starting at x, the color on step i equals (Ax)_i+b_i+h_i(p). A color-zero antipodal geodesic exists iff b+h(p) lies in im A for some p. Let W=F2^n/im A, q_i=[e_i], Q the quotient map, k=dim W=n-rank A. Thus sum q_i=0 (A1=1), and the q_i span W. We must prove that all elements of W occur among Qh(p).

## The cyclic rotation identity
If i is first in p, let p' move i from first to last. Then h_i changes by the full row sum 1, and every other h_j changes by A_ji. Hence
    h(p')+h(p)=e_i+A e_i,
    Qh(p')+Qh(p)=q_i.
Repeated cyclic rotations of a permutation give its initial coset plus the successive prefix sums of its ordered q_i. This is exact, independent of b, no numerical assumption.

## Theorem 1: all affine colorings with rank deficiency <=2, in every dimension
For k=0 the statement follows from surjectivity of A.
For k=1 choose a nonzero q_i first, and rotate once; both cosets occur.
For k=2, if some nonzero a occurs at least twice, choose b' among q_i independent of a and arrange a,b',a as the first three labels. The four prefix sums 0,a,a+b',b' are distinct and exhaust W. Cyclic rotation gives all four cosets, regardless of the initial Qh.
Otherwise each nonzero q_i occurs at most once. Spanning and sum q_i=0 in a two-dimensional binary vector space force the three distinct nonzero vectors to occur exactly once each. Let their support be S={u,v,w}; q_w=q_u+q_v. From QA=0 we infer for every column j that A_uj=A_vj=A_wj. Since all three diagonal entries vanish, all entries of A restricted to S x S vanish. Place any selected vertices of S before all vertices outside S, and all other vertices of S after them. For each i in S, h_i=0 in the first group and h_i=1 in the last group because its full row sum is 1 and internal entries are zero. The labels outside S vanish in W. Thus Qh is the sum of an arbitrary subset of the q_i in S, which exhausts W. This closes the exceptional case.
For each b, pick the resulting permutation and solve Ax=b+h by binary Gaussian elimination. This produces a length-n monochromatic path from x to x+1. Q, q_i and x can be computed in O(n^3) elementary field operations by ordinary elimination; generating candidate permutations and evaluating their h costs O(n^2) for the constant number needed in these proofs. No restriction on n.

## Theorem 2: additional arbitrary-deficiency families
(a) Let S={i:q_i!=0}. If A restricted to S x S is zero, the same before/after construction yields arbitrary subsets of S, so all cosets occur for any k.
(b) If there is a basis a_1,...,a_k of W such that the multiplicity of a_j among the q_i is at least 2^(k-j), choose the first 2^k-1 labels in reflected binary Gray-code transition order (a_1 occurs 2^(k-1) times, a_2 occurs 2^(k-2) times, ..., a_k occurs once). Its prefix sums visit all elements of W. Cyclic rotation yields all cosets. This is sufficient, not necessary; it requires n large enough for those multiplicities, and the search for the basis is not included in a polynomial bound.
(c) Block-triangular closure: suppose a simultaneous coordinate permutation makes A block lower triangular, each diagonal block has zero diagonal and odd row sums, and each block satisfies an already proven affine geodesic theorem. Process blocks in increasing order. Rows of the current block depend only on earlier and current coordinates. Earlier coordinates have all been flipped and their x+1 values are now fixed; absorb their contributions in an arbitrary effective offset for this block. Choose the starting bits and flip order for the current block by its theorem. Subsequent blocks do not affect earlier rows. Concatenation solves the full coloring. This also covers arbitrarily large nullity via block-diagonal examples; does not cover arbitrary A.

## Exact enumeration / computational status
For every A considered, enumerate im A by iterating over columns, construct a canonical representative of each coset, and enumerate permutations until every coset is hit. This tests all possible b simultaneously. Actual sandbox outputs:
n=2: 1/1 admissible A
n=3: 8/8
n=4: 256/256
n=5: 32768/32768
n=6,7,8: 5000 independently generated matrices per dimension, all passed.
Total 33033 exhaustive matrices through dimension 5, 15000 sampled matrices in dimensions 6–8. No failed matrix. Random seed 2711 for dimensions 6–8, after exhaustive dimension 5. n=2..4 ran a separate equivalent implementation. These tests do not establish the unrestricted affine theorem.

Reproduction Python 3 (no dependencies):
```python
import itertools, random
rng=random.Random(2711)
def verify(a,n):
    im={0}
    for j in range(n):
        col=sum(((a[i]>>j)&1)<<i for i in range(n))
        im|={x^col for x in im}
    if len(im)==1<<n: return True
    reps=[min(x^v for v in im) for x in range(1<<n)]
    hits=set()
    for p in itertools.permutations(range(n)):
        s=h=0
        for i in p:
            h|=((a[i]&s).bit_count()%2)<<i
            s|=1<<i
        hits.add(reps[h])
        if len(hits)==(1<<n)//len(im): return True
    return False
for n in range(2,9):
    rows=[[m for m in range(1<<n) if not(m>>i&1) and m.bit_count()%2] for i in range(n)]
    aa=itertools.product(*rows) if n<=5 else (tuple(rng.choice(row) for row in rows) for _ in range(5000))
    count=0
    for a in aa:
        assert verify(a,n),(n,a)
        count+=1
    print(n,count)
```

## Exact dynamic-programming formulation (derived, not benchmarked)
For S subset of coordinates, R(S) is the set of possible quotient-valued partial h sums. R(empty)={0}. Appending i not in S contributes q_i times the parity of sum_{j in S} A_ij, so
    R(S union {i}) receives R(S)+q_i (sum_{j in S} A_ij).
Then R(all) is exactly the set of attainable obstruction classes. Straight implementation uses O(n^2 2^(n+k)) elementary bit operations as a loose bound, with precomputed parities and fixed-size packed vectors reducing transition count to O(n 2^(n+k)). Store backpointers for a witness. Not claimed O(n) in general.

## Resume
Goal: all affine antipodal colorings, then arbitrary antipodal colorings. The obstruction is whether R(all)=W for every zero-diagonal odd-row-sum A. Rank deficiency <=2, independent-support and Gray-code multiplicity classes are closed by proofs above; general singular systems remain open here. Explore quotient-valued ordering with k>=3 when none of the sufficient conditions applies. No new proof of the full conjecture, no external leaderboard credit.

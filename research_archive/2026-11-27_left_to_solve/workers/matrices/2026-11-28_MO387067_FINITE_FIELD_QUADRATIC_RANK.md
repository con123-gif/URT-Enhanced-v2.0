# MO387067: complete hand proof of the finite-field rank clause, with exact growth

28 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Credit source author Turbo and answerer lambda; credit romechenko's earlier public grid construction in PR16418 for the real-rank clause. No exclusive priority, no Lean execution, no new official solve count.

## Source and duplicate gate

Source https://mathoverflow.net/questions/387067/on-the-real-and-finite-field-rank-of-a-0-1-matrix-i and full answer https://mathoverflow.net/questions/387067/on-the-real-and-finite-field-rank-of-a-0-1-matrix-i/387112 read, including the visible three comments. Source asks both real and F2 rank of a block replacement F_m(M) for square {-1,0,1} matrix M of real rank r. Replace +1 by I_m, -1 by reversing permutation J_m, 0 by zero. The related question https://mathoverflow.net/questions/387101 concerns a different general permutation-power construction and is not settled here. Source answer gives the exact real rank formula, but not a quadratic example or the F2 answer.

Current registered statements/mo-387067.lean blob 2e6680e2dcefaa9ab7c61e7b9fdc579fba389130 explicitly formalizes only the real-rank big-O question, with fixed m and threshold. Statement PR12694 merged 00:49:06 UTC. All-state is:pr exact search revealed existing foreign proof PR16418, open, head 2281017f8432268b2781fb5fce097bbab1969fd4; full 152-line patch read. It disproves the registered real-rank statement using precisely the grid signed matrix below. No kernel verdict inferred, no duplicate registration or proof submission. The F2 clause is an extension of this same source, not another distinct problem count; it is not the registered target. Search for exact F2 clause and TrureTuring found no direct result in returned results, but exhaustive catalogue/primary prior audit not established. No originality guarantee or new claim. Source revision history not fully recovered.

## Complete mathematical result

For odd k >= 3, index rows and columns by ordered pairs (i,j) in {1,...,k}². Set B = I_k tensor E_k, D = E_k tensor I_k, where E_k is the all-ones matrix, and M=B-D. Entries are -1,0,1. Let P,N be the indicator matrices for +1 and -1 respectively. Since B,D are zero-one and their entrywise product is I_(k²), we have

P=B-I, N=D-I, |M|=B+D-2I.
F_m(M)=P tensor I_m + N tensor J_m.

Over either R or F2 (k odd in F2), decompose the k-dimensional coordinate space as U direct sum W, where U is the span of the all-ones vector and W is the zero-sum subspace. E_k acts by k on U and by 0 on W; dimensions 1 and k-1. Hence on U⊗U, W⊗U, U⊗W, W⊗W, the pairs of eigenvalues of (B,D) are respectively (k,k),(k,0),(0,k),(0,0).

Over R this gives rank M = 2(k-1), rank |M| = k² (the eigenvalues of |M| are 2k-2, k-2, k-2, -2, none zero). The source answer's diagonalization of J_m therefore gives
rank_R F_m(M) = ceil(m/2) k² + floor(m/2) 2(k-1).

Over F2 the same four invariant summands give block actions respectively 0, J_m, I_m, I_m+J_m (the order of I and J depends on the summand naming). The mixed summands each have dimension k-1 and contribute m(k-1). The last has multiplicity (k-1)²; I+J has rank floor(m/2), because each disjoint reversed pair contributes the 2x2 all-ones block of rank 1 and a fixed central coordinate contributes zero. Consequently, exactly,

rank_F2 F_m(M) = 2m(k-1) + floor(m/2)(k-1)².

For every fixed m>=2, both ranks grow quadratically in r=2(k-1), and are not O(r), as k increases through odd integers. For m=1, F2 rank is at most r for every input, because |M| ≡ M mod 2 and the rank of an integer matrix modulo 2 is at most its rational/real rank. Real rank remains potentially quadratic at m=1.

Universal upper bound: any real rank-r M factors as U V. Each entry squared is a sum over the r diagonal products and binom(r,2) cross products, giving a sum of r(r+1)/2 rank-one outer products. Since |M|=M entrywise squared, rank_R |M| <= r(r+1)/2. The exact real rank formula from lambda then implies
rank_F2 F_m(M) <= rank_R F_m(M) <= ceil(m/2) r(r+1)/2 + floor(m/2) r.
First inequality follows from nonzero minors mod 2 lifting to nonzero integer determinants. Thus for every fixed m>=2 the optimal worst-case order is quadratic over both fields; for m=1 the F2 upper bound r is attained by identity matrices. This settles the asymptotic order asked in both source clauses, but does not claim a sharp universal coefficient for every r,m. The grid family for the real clause is prior public in PR16418; the F2 computation is a separate mathematical extension, not a separate campaign problem.

## Executed exact challenge

Independent bitset Gaussian elimination over F2 actually passed for k=3,5,7,9 and m=1,2,3,4,5, twenty cases. SymPy exact rational ranks of M and |M| passed for k=3,5. Outputs for each k across m=1..5: 3:[4,12,16,24,28]; 5:[8,32,40,64,72]; 7:[12,60,72,120,132]; 9:[16,96,112,192,208]. An earlier overlong full SymPy blow-up rank attempt timed out and is NOT counted as a pass. Reproducer for successful checks:

```python
import sympy as s
from itertools import product
def rank2(rows):
    piv={}
    for x in rows:
        while x:
            k=x.bit_length()-1
            if k in piv: x^=piv[k]
            else:
                piv[k]=x
                break
    return len(piv)
for k in [3,5,7,9]:
    E=list(product(range(k),repeat=2))
    M=[[int(i==a)-int(j==b) for a,b in E] for i,j in E]
    if k<=5:
        assert s.Matrix(M).rank()==2*(k-1)
        assert s.Matrix([[abs(x) for x in row] for row in M]).rank()==k*k
    for m in [1,2,3,4,5]:
        rows=[sum(1<<(j*m+(b if x==1 else m-1-b))
                  for j,x in enumerate(row) if x)
              for row in M for b in range(m)]
        assert rank2(rows)==2*m*(k-1)+(m//2)*(k-1)**2
```

These are independent finite consistency tests; the invariant-subspace decomposition is the proof for all odd k and positive m.

## Campaign state and next executable step

Read AGENTS.md, current ledger blob 2add1e4339932afa79bd58cea1a7d927925c4c8a, VERIFIED_PROOFS.json blob d8dd0a5cc0042a5c60be0491d0a4b5e98fab330b. Actual newtons-cathedral head observed aa3105af019573e46ad9382521a8fb1b8cef59da. Current official participation rules and tools/oma.sh read via public web. Direct local network DNS failed; this is not a desk refusal or a 503. No claim made. A329813 full PR13332 actually merged 02:12:52 UTC on 28 November; ledger records official credit. MO198816 full PR10139 remains open. Totals 37 whole checked certificates, 5 own official checker acceptances, 4 merged/publicly credited, 0 certified original accepted discoveries. No new formalization or full PR here. MO430643 foreign full PR17716 open. A372561 registration12868 merged but peer imported-target fixture dad8786dc7d4bb9cf7ec37a74f1bd23897170caa still shared verifier head and REST runs-by-head returns total_count=0; do not overwrite or claim execution. MO30948514443, MO2903837223, MO4662187625 still open. Other screened registered matrix targets MO200855 and MO348551 already have merged foreign proofs; MO499788 has foreign full candidate. No duplicate. MO239178 eligibility still unresolved; previous complete hand family unchanged.

RESUME HERE: keep MO387067 duplicate withheld, preserve F2 extension as a hand-proved result; do not weaken or expand existing registered statement in order to count it. Find a fresh exact open matrix problem without foreign full proof, finish source/prior gates and actual verifier coordination. Continue monitoring MO198816 and matrix registrations. No changes to schedules, RH files, shared verifier or protected workflow.
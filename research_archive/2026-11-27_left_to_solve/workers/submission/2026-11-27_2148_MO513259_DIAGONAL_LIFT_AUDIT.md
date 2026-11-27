# MO513259: exact diagonal-lift classification and independent submission audit

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Source problem: joro, MathOverflow 513259; earlier campaign proof and its collaborators, and Knezevic–Cohen–Domanskaya (2017) for the mod-three background, are acknowledged. This is a human mathematical corollary of the newly archived corrected identity, not a separate solved catalogue problem, not independently Lean checked, and not a priority claim.

## Premises and exact proof

The current canonical source and full proof are present on newtons-cathedral:
- PROOFS_READY/mo-513259.statement.lean, blob 985918a233f54071802ed53cb887bb235d737f58, upload aa77b9b4b3b05ef80051f502bcf8e978a43fa7c5.
- PROOFS_READY/mo-513259.proof.lean, blob 80312dbb99c4fec5c93b390da2ca3df330e63214, upload 144e972722cf7f8e9ba3be70c4b9f38a6822e157.
- The source file states both named graph conjectures modulo 8 and 24. The final solution uses a stronger symmetric hollow theorem without the 0/1 restriction. The upstream statement PR #12514 (con123-gif, created 21:42:36Z) is OPEN and changes exactly statements/mo-513259.lean. Do not duplicate. The full proof upload's commit title says Lean-verified; the current manifest still lists 31 and the full execution receipt was not found at the two guessed receipt paths. I have not independently read the new proof's actual compiler log in this turn and therefore do not increment the independently verified count from the manifest. Source page and join.txt unavailable in web; direct container DNS to lefttosolve.com fails. Official main README and tools/oma.sh were read. No lease request, PR, or private token handling in this turn.

Let H be any symmetric hollow n×n matrix over Z/8 with unit determinant, and D=diag(d) with d in (Z/4)^n. Let A=H+2D. Reduction modulo 2 shows A is invertible. Put B=H^{-1}, and let bars denote reduction mod 2. The dimension n=2m is even, since the mod-2 matrix is nonsingular alternating.

The exact determinant ratio is
  det(A)/det(H)=1+4 Q_H(bar B bar d)  (mod 8),
where Q_H(x)=sum_{i<j} bar H_ij x_i x_j in F2.
Proof: expand det(I+2BD) in principal minors; degree >=3 vanishes mod 8. Since bar B is alternating (for y=bar H x, y^T bar B y=x^T bar H x=0), all B_ii are even. Thus the linear term is 4 sum_i (B_ii/2 mod 2) bar d_i and the quadratic term is 4 sum_{i<j} bar B_ij bar d_i bar d_j, as minus and plus coincide mod 2. For column b_i of B, b_i^T H b_i=B_ii; the hollow symmetric identity gives B_ii/2 mod 2 = Q_H(bar b_i). Polarization of Q_H gives polar form bar H; evaluating Q_H(bar B bar d) gives exactly those linear and quadratic coefficients. Division by 2 in these statements means the well-defined half of an even residue modulo 4 followed by mod 2, not division by a nonunit.

The archived lemma OMA.MO513259.InvariantStructure.universal_corrected states det(A) per(A^{-1})=det(H) for the symmetric even-diagonal invertible case. Conditional on that lemma, the inverse permanent is therefore exactly 1+4 Q_H(bar B bar d) modulo 8. The two values 1 and 5 are exhaustive. The equality per(A^{-1})=1 holds exactly for zeros of a nonsingular quadratic form; the determinant ratio derivation itself does not need the corrected identity.

Moreover define epsilon by det(H)=(-1)^m 5^e (mod 8), e=0 or 1, epsilon=(-1)^e. This is always possible. Proof: symmetrically eliminate one unit off-diagonal pivot at a time. The even-diagonal invertible 2×2 block C=[[2a,u],[u,2b]] has u odd. Its determinant is 4ab-u² ≡ -1*5^(ab mod 2) (mod 8). Block congruence by a triangular matrix of determinant 1 splits off C; the Schur complement is invertible and even-diagonal, since mod 2 its inverse-pivot form is alternating. A simultaneous permutation changes determinant by a square of a sign, hence not at all. This gives m blocks. For any symmetric even-diagonal matrix M define Q_M(x)=(x^T M x)/2 mod 2, well-defined for lifts of x mod 2, since changing a lift by 2z changes the numerator by a multiple of 4. Congruence preserves this quadratic form up to invertible change of variables. For a pivot the form is a x+xy+b y mod 2; its four-point signed sum is 2(-1)^(ab). Multiplication of signed sums under orthogonal direct sums proves sum_x (-1)^Q_H(x)=epsilon*2^m. This argument includes the zero-dimensional empty product.

Consequently, the exact fraction of all 4^n diagonal lifts having inverse permanent 1 mod 8 is (1+epsilon*2^(-m))/2. For n=0 it is 1, and for positive even n the number is 2^n(2^(n-1)+epsilon*2^(m-1)); the remainder has inverse permanent 5. For H=[[0,1],[1,0]], 3/4 of all lifts give 1; both odd half-diagonals give 5, so dropping the hollow condition unconditionally is invalid. For K4, det(H)=-3=5 mod 8, hence only 3/8 of lifts give 1. The determinant-sign and counting theorem are proven by the foregoing finite-dimensional algebra; the permanent assertion uses the named archived lemma, whose kernel evidence remains to be independently retrieved.

## Executed independent checks

Local Python 3, exact modular arithmetic; no numerical approximations. Exhaustive 0/1 hollow graphs of sizes 0,2,4, all Z/4 diagonal lifts thereof, and 500 deterministic size-6 symmetric hollow matrices with arbitrary Z/8 offdiagonal values (all parity lifts for each invertible case). Independent modular Gaussian elimination, subset DP for permanents and quadratic Gauss sums. Output:
{'invertible_hollow_cases': 222, 'singular_cases_skipped': 345, 'gauss_assertions': 444, 'diagonal_lifts': 19473, 'negative_controls': 8332, 'per_lift_assertions': 4}

Reproduction (Python 3):
```python
from itertools import product, combinations
from random import Random
def detinv(A):
    n=len(A); W=[list(row)+[int(i==j) for j in range(n)] for i,row in enumerate(A)]; det=1
    for k in range(n):
        p=next((i for i in range(k,n) if W[i][k]%2),None)
        if p is None: return None,None
        if p!=k: W[k],W[p]=W[p],W[k]; det=-det
        v=W[k][k]; det=det*v%8; W[k]=[x*pow(v,-1,8)%8 for x in W[k]]
        for i in range(n):
            if i!=k:
                t=W[i][k]; W[i]=[(x-t*y)%8 for x,y in zip(W[i],W[k])]
    return det,[r[n:] for r in W]
def permanent(A):
    n=len(A); dp=[0]*(1<<n);dp[0]=1
    for s in range(1,1<<n):
        i=s.bit_count()-1
        dp[s]=sum(A[i][j]*dp[s^(1<<j)] for j in range(n) if s>>j&1)%8
    return dp[-1]
def q(H,x): return sum(H[i][j]*x[i]*x[j] for i in range(len(H)) for j in range(i+1,len(H)))%2
def hollow(n,es):
    H=[[0]*n for _ in range(n)]
    for (i,j),v in zip(combinations(range(n),2),es): H[i][j]=H[j][i]=v
    return H
rng=Random(513259); graphs=0; lifts=0; negative=0; singular=0; gauss=0
for n in (0,2,4,6):
    e=n*(n-1)//2
    cases=product(range(2),repeat=e) if n<=4 else (tuple(rng.randrange(8) for _ in range(e)) for _ in range(500))
    for es in cases:
        H=hollow(n,es); det,B=detinv(H)
        if det is None: singular+=1; continue
        graphs+=1; m=n//2; parity=list(product(range(2),repeat=n)); S=sum((-1)**q(H,x) for x in parity)
        sign=1 if det==(-1)**m%8 else -1
        assert det==((-1)**m*(1 if sign==1 else 5))%8
        assert S==sign*2**m; gauss+=2
        count=0
        ds=product(range(4),repeat=n) if n<=4 else product(range(2),repeat=n)
        for d in ds:
            A=[r[:] for r in H]
            for i in range(n): A[i][i]=2*d[i]
            da,C=detinv(A); assert da is not None
            x=[sum(B[i][j]*d[j] for j in range(n))%2 for i in range(n)]
            Q=q(H,x); assert da==det*(1+4*Q)%8
            P=permanent(C); assert P==det*pow(da,-1,8)%8; assert (P==1)==(Q==0)
            count+=P==1; negative+=P!=1; lifts+=1
        mult=2**n if n<=4 else 1
        assert 2*count==mult*(2**n+sign*2**m)
print(dict(invertible_hollow_cases=graphs,singular_cases_skipped=singular,gauss_assertions=gauss,diagonal_lifts=lifts,negative_controls=negative,per_lift_assertions=4))
```

## Fresh official checks, 27 November

PR 7724 merged17:05:50Z, 7815 merged17:13:14Z, 7817 merged17:13:23Z, all author con123-gif. PR10139 still open, not merged, same author, head05cc31e33214597b7359282d266afff37d7fa0fb. Actual job 140671608373 of run46047885906 re-read: 19:10:39.3670774Z accepted - kernel accepted; axioms within propext, Classical.choice, Quot.sound. No new site-credit readback: public site unavailable here. No increment to four official checker acceptances, three merges, or zero certified original resolutions.

Fresh all-state is:pr full-ID searches and actual changed-file/tail inspection for six previously prepared proofs: A383246 #10917 (rexmhall09); A383248 #10994 (KoaOkano); MO487192 #11324 (rpinho); A382465 #10872 (rexmhall09) and #10955 (KoaOkano); A382624 #10881 (rexmhall09); A383062 #10976 (KoaOkano). All open, each changes exactly its matching proofs/<id>.lean, final theorem/disproof targets the registered problem, no explicit sorry/admit/native_decide observed in added lines. This is structural scope evidence, not a kernel verdict. Withhold duplicates. No claim of copying or first-ever novelty.

RESUME HERE: obtain the immutable full MO513259 verifier run/job and executed theorem axiom log from the owning worker's receipt, then watch actual statement PR12514 merge and coordinate the unmodified imported-target checker/valid lease with the owner; do not duplicate it. Do not treat a newer statement PR as proof of a general desk recovery or assume a lease.

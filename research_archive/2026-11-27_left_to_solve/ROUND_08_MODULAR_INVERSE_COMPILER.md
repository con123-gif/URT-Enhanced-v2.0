# Round 08 — modular inverse compiler and recurrence proofs

2026-11-27. Research credit: con123-gif (URT/Newton's Cathedral), assisted by ChatGPT (GPT-6.2). This is independent external mathematics, not a new physical claim. No execution of the original URT phase controller is claimed. The structural reductions are standard modular algebra; priority not established.

## Exact local-to-global solution for the integer right-inverse question

Source: https://www.openproblemgarden.org/op/inverse_of_an_integer_matrix
Let M=[D X], D=diag(d_1,...,d_m), each d_i>=2, X an integer m by n matrix. For each prime p dividing L=lcm(d_i), let S_p={i:p divides d_i}. Then M has an integer right inverse if and only if the row restriction X[S_p,:] has full row rank over F_p for every such p.

Necessity: reduce MR=I modulo p and restrict rows to S_p. The diagonal block vanishes on these rows, so the remaining block X[S_p,:] must map onto F_p^|S_p|.

Sufficiency and construction: for each p^e exactly dividing L, full row rank gives a square minor C_p of X[S_p,:] whose determinant is a unit modulo p^e. Invert that minor using its adjugate and modular inverse of its determinant. Insert this inverse in the chosen column locations to construct an n by m matrix Y_p satisfying (X Y_p)[S_p,:]=I[S_p,:] modulo p^e. Apply the Chinese remainder theorem entrywise to combine all Y_p into one integer matrix Y. For each row i, every prime power dividing d_i divides all entries of (I-X Y)[i,:], so Z=D^{-1}(I-X Y) has integer entries. The vertical concatenation R=[Z;Y] is an integer right inverse since D Z+X Y=I.

Thus the problem reduces to independent finite-field rank tests and constructive local modular inverses, rather than enumerating all maximal minors of the full matrix. In particular the rowwise gcd condition is not sufficient if a prime divides multiple diagonal entries and the relevant rows are dependent. If the d_i are pairwise coprime, it *is* sufficient because each S_p has exactly one row. This includes an exact answer to the author's proposed criterion in that regime. The theorem is standard in substance (CRT and surjectivity) and is not claimed new. Finding prime factors of L has a computational cost; no universal linear-time claim.

### Executed certificate
300 independently generated integer matrices (seed 2711), m=1..4, n=m..m+2, 25 matrices for each pair; d_i uniformly drawn from 2..12 and X entries from -7..7. For each case the local criterion was compared against gcd of full-size minors of M. All 300 agreed; 235 constructive integer right inverses were produced and verified by exact multiplication, 65 matrices had no right inverse by both tests. Python/SymPy sandbox execution, not Lean.

Reproduction:
```python
from math import gcd,lcm
from itertools import combinations
from random import Random
from sympy import Matrix,diag,eye,zeros,factorint

def right_inverse(d,X):
    m,n=X.shape; modulus=1; Y=zeros(n,m)
    for p,e in factorint(lcm(*d)).items():
        p,e=int(p),int(e); q=p**e; S=[i for i in range(m) if d[i]%p==0]
        for J in combinations(range(n),len(S)):
            C=X.extract(S,J); det=int(C.det())
            if det%p:break
        else:return None
        local=zeros(n,m); inverse=C.adjugate()*pow(det,-1,q)
        for r,j in enumerate(J):
            for c,i in enumerate(S):local[j,i]=int(inverse[r,c])%q
        inv=pow(modulus,-1,q)
        Y=Y.applyfunc(int)+modulus*(local-Y).applyfunc(lambda x:(int(x)*inv)%q)
        modulus*=q
    Z=eye(m)-X*Y
    for i in range(m):
        assert all(int(Z[i,j])%d[i]==0 for j in range(m))
    R=Matrix(m,m,lambda i,j:int(Z[i,j])//d[i]).col_join(Y)
    assert diag(*d).row_join(X)*R==eye(m)
    return R
rng=Random(2711);passed=ok=0
for m in range(1,5):
 for n in range(m,m+3):
  for _ in range(25):
   d=[rng.randrange(2,13) for i in range(m)]
   X=Matrix(m,n,[rng.randrange(-7,8) for i in range(m*n)])
   M=diag(*d).row_join(X); g=0
   for J in combinations(range(m+n),m):
    g=gcd(g,abs(int(M[:,list(J)].det())))
    if g==1:break
   R=right_inverse(d,X);assert (R is not None)==(g==1)
   passed+=1;ok+=R is not None
print(passed,ok,passed-ok)
```
The sample code deliberately enumerates local minors rather than implementing polynomial-time modular Gaussian elimination; that is a possible improvement, not benchmarked here.

## Other exact results and site status
A010845: a(n)=3n a(n-1)+1 implies a(n)-(3n+1)a(n-1)+3(n-1)a(n-2)=0 by subtracting the defining equations. 299 exact integer checks passed. Already derived by Bala in OEIS 2017 and already submitted as PR 6442, so do not duplicate it.
A024152: a(n)=12^n-n^12 is annihilated by (E-12)(E-1)^13, E the forward shift. SymPy expanded this polynomial to coefficients [1,-25,234,-1222,4147,-9867,17160,-22308,21879,-16159,8866,-3510,949,-157,12]; 286 exact integer recurrence checks passed. Already submitted by another contributor as PR 6686. Our Lean drafts saved in fork branches oma/oeis-a010845 (87e50d3dafbe081495fe18703c336802cbfab64d) and oma/oeis-a024152 (257d00779fcc1fda5048095d90dbe04dc80c9b97), not compiled or submitted. Desk claimed a formalization task rather than the expected proof task for A010845; workflow stopped before obtaining the lease value and before claiming A024152. No duplicate PR sent.
A046385: enumerated 3,041,741 products of the first 20 palindromic primes up to 10^13, no smaller-than-listed or missing-factor-count palindrome found. This is a bounded search, not a proof; no URT advantage claimed.

First PR 6725 for Retkes statement was open and checker queued when checked. No acceptance yet. Public catalogue scan via Python returned HTTP 403; no attempt to bypass. Official problem assignment via curl did return a task but disagreed with the upstream statement status, so check the desk and existing submissions before writing future proofs. Keep existing work and original credit distinct; no new external submission in this round.

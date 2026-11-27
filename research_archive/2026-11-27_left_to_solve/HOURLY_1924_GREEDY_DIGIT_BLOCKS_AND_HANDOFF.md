# Exact digit-length blocks for A342044 and its arbitrary even-terminal alphabet generalization

27 November 2026, 19:24 session. Cornelius Lytollis (@con123-gif), assisted by ChatGPT GPT-6.2. Complete hand theorem, extending our already checked A383248 coverage result, not a new official target submission or a Lean kernel verification. The counting argument adapts Sebastian Karlsson's December 2024 proof for the distinct sequence A342042 (https://oeis.org/A342042/a342042_2.pdf); its application here and the explicit all-alphabet generating function are new to this archive, not established literature priority. Source A342044: https://oeis.org/A342044 . No URT-specific method was required.

## Theorem

Fix r>=1 and a radix b>=2r+1, with allowed digits 0,...,2r. A word is legal if each odd digit is followed, when there is a next digit, by a strictly greater digit. Use ordinary base-b expansions (no leading zero except the integer 0). Start with 0, then greedily select the least unused legal integer whose leading digit is greater than the previous integer's last digit whenever that last digit is odd. When the previous last digit is even there is no boundary restriction. This is exactly A342044 for r=4,b=10, since digit 9 would prevent an infinite continuation; repunits of 8 allow indefinite continuation of every legal word.

1. Every legal integer occurs exactly once, and every positive k-digit legal integer occurs before every (k+1)-digit legal integer.
2. Within the k-digit block, write M_d for the legal integer with leading digit d (1<=d<=2r) and remaining k-1 digits equal to 2r. The numbers M_1,...,M_(2r) occur in that order. After M_(2r-1), all remaining terms in the block have leading digit 2r and are in increasing numerical order. The first term is 1 for k=1, and the word 12 followed by k-2 zeroes for k>=2; the last is the k-digit repunit of 2r.
3. If p_k denotes the number of positive legal k-digit integers, its ordinary generating function is exactly

    P_r(z)=sum_(k>=1) p_k z^k = 2*((1+z)^r-1)/(2-(1+z)^(r+1)).

   In particular the one-based index of the last k-digit term is 1+sum_(j=1)^k p_j. For r=4 its asymptotic growth factor per digit is lambda=1/(2^(1/5)-1)=6.72502395887258... . The same factor is the Perron eigenvalue of the digit adjacency matrix. This is an exact counting consequence of the ordering theorem, not a numerical fit.

## Proof

At every step infinitely many repunits of 2r remain unused and have universally permissible leading digit, so the greedy procedure is defined forever. No repeats are allowed. Eligibility of an internally legal candidate depends on its leading digit alone, and therefore within each fixed-leading-digit class candidates are taken in increasing order.

The base block is exactly 0,1,...,2r: when the predecessor is odd the immediate successor is larger, and when even there is no restriction. Suppose by induction that all legal integers of length less than k have been selected and the preceding block ended with the repunit of 2r (an even terminal digit). Take k>=2. Consider the part of the greedy process after that point but before its first selection of an integer longer than k. Such a selection exists eventually because there are finitely many k-digit candidates and infinitely many terms.

We prove that no adjacent maxima M_(d+1) can be selected in this part while M_d is still unused. Otherwise every k-digit integer with leading digit d+1 must already have been selected, since they are no greater than M_(d+1) and share eligibility. At each such selection the smaller candidate M_d remained unused, so it had to be ineligible. Hence the immediately preceding terminal digit e is odd, with d<=e<d+1: necessarily e=d. If d is even this is immediately impossible. For odd d, distinct selected d+1-leading integers have distinct immediately preceding integers, all k-digit and ending d: the preceding shorter block ended even, so none can use that predecessor.

But for odd d the digit d+1 is even, so EVERY legal (k-1)-digit string (allowing leading zero) can follow it. The number of k-digit legal integers starting d+1 is thus the number of such strings. Deleting the last digit from a k-digit integer ending d maps injectively into those strings with nonzero first digit. It misses at least the all-zero string. Therefore the number ending d is strictly less than the number starting d+1, contradicting the predecessor injection. This proves the assertion about adjacent maxima.

If the first longer integer were selected prematurely, every remaining k-digit integer starting 2r would be a smaller eligible alternative. Thus all such integers, including M_(2r), must have been selected before the first longer term. By the adjacent-maxima assertion, all other maxima have then been selected too, and therefore every k-digit integer. Contradiction. So the k-digit block is complete, the adjacent maxima are ordered, and its final term is M_(2r): all groups below it have already exhausted their terms, and all its own group is taken in numerical order. This closes the induction, proves global coverage and the last-segment assertion. The first term of each block is the smallest legal k-digit integer since the previous block ends even; its digit word is 12 followed by zeroes when k>=2. QED.

## Exact generating function

Let E(z) be the generating function counting all possible appended suffixes (including empty) after an even digit. Let F_j(z) do the same after odd digit 2j-1, j=1,...,r. The first suffix digit yields the identities in the formal power-series ring

    E = 1+z*((r+1)*E+sum_j F_j),
    F_j=1+z*((r-j+1)*E+sum_(h>j) F_h).

For 1<=j<r, subtract adjacent equations to get F_j+E=(1+z)*(F_(j+1)+E); also F_r+E=1+(1+z)*E. Summing the resulting geometric progression gives

    E=(1+z)^r + ((1+z)^(r+1)-1)*E
    E=(1+z)^r/(2-(1+z)^(r+1)).

For a nonzero leading digit there are r even choices and r odd choices; consequently

    P_r=z*(r*E+sum_j F_j)=(1-z)*E-1
       =2*((1+z)^r-1)/(2-(1+z)^(r+1)).

The unique smallest-modulus pole of P_r is z=2^(1/(r+1))-1: all other roots of the denominator are 2^(1/(r+1))*exp(2*pi*i*j/(r+1))-1, strictly farther from zero. The numerator is nonzero at the real pole, which is simple; hence p_k~C_r*z^(-k) for some C_r>0 and p_(k+1)/p_k tends to its reciprocal. For r=4 the sequence starts 8,52,348,2342,15750,105918,712302,4790248. The corresponding last indices (including 0) begin 9,61,409,2751,18501,124419. As an independent symbolic check, the 9x9 decimal adjacency matrix has characteristic polynomial x^4*(x^5-5*x^4-10*x^3-10*x^2-5*x-1) = x^4*(2*x^5-(x+1)^5).

## Executed computational certificate

Independent Python integer tests for r=1,2,3,4 and b=2r+2 through all six-digit legal integers, with complete seventh-digit candidate generation so no premature transition is hidden by a finite cutoff. Verified all block lengths, adjacent-maxima ordering, first and last terms, and final-segment ordering, with 157616 total generated terms through six digits (including zero in each case), plus the first next-block term for each r. Independent DP vs the generating-function recurrence agreed through 100 coefficients per r (400 exact coefficient comparisons). The decimal case contains exactly 124419 terms through length six, ending 888888 and followed by 1200000.

```python
from collections import deque
from math import comb
def counts(r,K):
    b=2*r;v=[0]+[1]*b;out=[]
    for _ in range(K):
        out.append(sum(v))
        v=[sum(v[i] for i in range(b+1) if i%2==0 or j>i) for j in range(b+1)]
    return out
def formula(r,K):
    p=[0]*(K+1)
    for k in range(1,K+1):
        p[k]=(2*comb(r,k) if k<=r else 0)+sum(comb(r+1,j)*p[k-j] for j in range(1,min(k,r+1)+1))
    return p[1:]
def check(r,K):
    b=2*r;base=b+2
    q=[deque([0])]+[deque() for _ in range(b)]
    layer=[(i,i,i) for i in range(1,b+1)]
    sizes=[]
    for k in range(1,K+2):
        sizes.append(len(layer))
        for n,f,d in layer:q[f].append(n)
        if k<=K:layer=[(n*base+j,f,j) for n,f,d in layer for j in range(b+1) if d%2==0 or j>d]
    a=[];prev=0
    for _ in range(1+sum(sizes[:K])+1):
        d=prev%base
        candidates=[f for f in range(b+1) if q[f] and (d%2==0 or f>d)]
        f=min(candidates,key=lambda f:q[f][0]);prev=q[f].popleft();a.append(prev)
    assert a[0]==0
    offset=1
    for k,size in enumerate(sizes[:K],1):
        block=a[offset:offset+size];offset+=size
        assert len(set(block))==size
        assert all(base**(k-1)<=n<base**k for n in block)
        R=sum(b*base**j for j in range(k-1))
        maxima=[d*base**(k-1)+R for d in range(1,b+1)]
        positions={n:i for i,n in enumerate(block)}
        assert [positions[n] for n in maxima]==sorted(positions[n] for n in maxima)
        assert block[-1]==maxima[-1]
        assert block[0]==(1 if k==1 else base**(k-1)+2*base**(k-2))
        tail=block[positions[maxima[-2]]+1:]
        assert tail==sorted(tail) and all(n//base**(k-1)==b for n in tail)
    assert a[offset]>=base**K
    assert sizes[:K]==counts(r,K)==formula(r,K)
    assert counts(r,100)==formula(r,100)
    return 1+sum(sizes[:K]),sizes[:K],a[offset]
assert [check(r,6)[0] for r in range(1,5)]==[239,4159,28799,124419]
```

## Submission reconciliation and resume

Read fresh campaign ledger and VERIFIED_PROOFS.json: 27 publicly archived full kernel-checked certificates, three actually merged full proofs (7724/7815/7817), one additional own full PR10139 (MO198816) open, zero independently established original discoveries. Direct GitHub metadata independently confirms all three accepted merges and seven statement merges (9480,9482,9503,9686,9702,9703,9704). Seven full-proof branches and the exact imported-target batch are already being handled by the interactive campaign; avoid parallel duplicate claims. Proper fresh PR search finds foreign full proof MO319325 PR10756 (Git-Tim1, created 19:22:48 UTC), so do not duplicate, irrespective of prior checked archive. The other six searches returned registration only. Peer secure handoff run46056962879/job140701706473 reported MO487192 live HTTP200, claim HTTP500; no valid claim obtained, and MO319325 withheld due changed/unavailable gate. Do not retry a server error repeatedly or bypass it. A381423 and A372556 still have no official registration PR from the latest searches. Direct site DNS and browser access failed; reviewed prior successful official rules retrieval at run46048831941 and started fresh read-only run46057213988 (no claims or private data). This checkpoint does not count the new hand extension as another official solve or a new Lean pass. No new official claim, note or proof PR from this session. The existing A383248 proof concerns coverage only; the above block theorem is strictly additional and must not be substituted for the registered target. Resume with actual accepted/merged verdict reconciliation, valid fresh lease for any still available exact imported target, and no competing duplicate submissions. RH and Cathedral workers untouched.

### Fresh official site read-back, 19:31 UTC

The isolated read-only workflow finished successfully: [actual run46057213988/job140702511821](https://github.com/con123-gif/open-math-agents/actions/runs/46057213988). Current join.txt and catalogue were fetched, catalogue reports total2902 entries in the requested open view (including rows marked solved), public solved feed2902 records. It still lists exactly three con123-gif proofs (A180195/A002538/A158960), 45 points each, outcome=pending. The public briefs at19:31 for A383246, A383248 and MO487192 still say FORMALIZE/no Lean statement yet, even though direct fresh GitHub main file reads confirm all three statements exist (blob5799ca321975872d71f790417b2e2a53cb12df4f,9371215e271ade866b46fc256beed1d6b61d5f98,9d10c39e4ec29d7623a0e3f3a9521aa50d6e7110). This is an actual registry-sync discrepancy, consistent with the failed handoff; its cause is not established. No duplicate statements or proof PRs without a valid lease. A401895 is registered and still open; the existing reduction and our finite results are not a solution. The mathematical extension above is now durably uploaded, commit b28fd9de61957677ae3e13ff33c3aaac82b4ac50. No secret or lease material in this read-only workflow.

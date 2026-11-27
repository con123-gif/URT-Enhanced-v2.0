# Round 09 — complete terminal-residue law and arbitrary-cutoff mimic distribution

2026-11-27. Research credit: con123-gif; mathematical assistance: ChatGPT (GPT-6.2). External mathematics only, no changes to RH or Cathedral physics tasks. Exact elementary proofs and actual Python checks; no Lean verification, no claim of originality or new platform acceptance. No original URT controller execution; inverse recursion and digit decomposition suffice.

Sources: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers ; original paper Bhattacharyya, Bandyopadhyay and Maulik (2009), pp. 148–150, https://emis.de/ft/39404 . The paper's main theorem assumes D<=M, and Lemma 3 describes termination at a one-digit multiple. Its definition does not specify how to iterate negative values if D>M. We cover 1<=D<=M, with a separate D=M boundary; no negative-base extension claimed.

## 1. Explicit attractor for EVERY residue, not just multiples
Fix M>=2, 1<=D<M, B=M-D. Define f(n)=sum a_i B^i for the canonical base-M digits a_i of n>=0. Every n<M is fixed. If n>=M, then B<=f(n)<n: a nonzero digit occurs at some index i>=1, contributing at least B, and each higher weight strictly shrinks. Also f(n)≡n mod D, since B≡M mod D. Therefore the iterates strictly descend to a fixed digit r. Since the final transition started at n' >= M, r lies in [B,M-1]. This interval contains exactly D consecutive integers and hence exactly one representative of each residue mod D. Consequently the terminal value is

    r(n) = n                                 if n<M;
    r(n) = B + ((n-B) mod D)                  if n>=M.

Equivalently for n>=M, r is the largest single digit congruent to n mod D. This sharpens the terminal-set statement in Lemma 3. In particular for multiples of D with n>=M, r=D floor((M-1)/D). The original hitting time to D is finite on every positive multiple iff M<=2D; if M>2D, D itself is the only positive multiple with finite hitting time. At the boundary D=M, every positive multiple maps to zero, never to D, except D at time zero.

More generally all nonnegative integer depths occur for each of the D attracting digits r in [B,M-1]. For B>=2, rewrite the canonical base-B digits of y>=r>=B as base-M digits, defining L(y). Then f(L(y))=y, L(y)>y, and L(y)>=M. Starting at r and iterating L gives exact terminal depths t for every t>=0. For B=1 use L(1)=M, and for y>=2 use L(y)=sum_{j=0}^{y-1}M^j, which is >=M, exceeds y, and has digit sum y. This verifies the original unboundedness result across every attracting residue, with no need for a search or fitted parameters. For B>=2, the round 5 double-log contraction proof applies to the first time to the digit r for every n>=M, with a uniform O_(M,D)(1) constant since 1<=r<=M-1. Thus the bound also covers residues that do not hit D.

## 2. Exact distribution for arbitrary upper cutoff X
Round 4 used full digit blocks. Here let X>=0 have L base-M digits x_i, low to high, and define
    P_i(z)=product_{j<i} (sum_{a=0}^{M-1} z^(a B^j)),
    T_i=sum_{j>i} x_j B^j.
Then the polynomial whose coefficients count all first images from the inclusive range [0,X] is
    F_X(z)=z^f(X) + sum_{i=0}^{L-1} z^T_i P_i(z) sum_{a=0}^{x_i-1} z^(a B^i).
Proof: X itself contributes the first monomial. Every n<X has a unique highest differing digit i, whose value is smaller than x_i; all higher digits equal those of X and all lower digits are unconstrained. This proves the disjoint decomposition exactly, including leading zeros. Empty X=0 case gives 1.

Write C_X(y)=[z^y]F_X(z). For y>0 divisible by D let h(y) be its first hitting time to D (infinite if its terminal digit differs). Since f(n)≡n mod D and positive n has positive f(n), for t>=1 the depth histogram is
    H_X(t)=sum_{y>0, D|y, h(y)=t-1} C_X(y) - 1_{t=1}1_{X>=D};
    H_X(0)=1_{X>=D};
    H_X(infinity)=sum_{y>0,D|y,h(y)=infinity} C_X(y).
Subtract D itself from the one-step count. These formulas are valid even when M>2D. They count precisely floor(X/D) positive inputs. To compute P_(i+1) from P_i, use a sliding sum of length M separately along each residue class modulo B^i. This costs O(S+1) arithmetic operations per factor for S=(M-1)sum_{j<L}B^j. Accumulating all shifted P_i in the displayed formula costs at most O(M L (S+1)) additions and O(S+1) coefficient storage, ignoring bit complexity. For fixed M,D this replaces X enumeration by a smaller coefficient domain O(B^L) if B>=2 or O(L) if B=1. Evaluation of depths on this domain can be memoized. No claim of a limiting centered-depth law.

## 3. Executed independent certificate
Python 3 (no external dependencies). Terminal value formula checked on 900,000 inputs n=1..3000, all 300 base/divisor pairs 2<=M<=25, 1<=D<M. Inverse lift checked at 11,858 successive depths across attracting residues (up to 5, capped in B=1 to avoid tower-sized integers). 1,001 arbitrary cutoff tests compared entire first-image coefficient arrays and hitting-time histograms against independent forward enumeration, all passed (M=2..14, all D, 11 cutoffs per pair including boundaries and seeded random cutoffs). In particular the original paper's Figure 1 range, positive multiples of 7 up to 10,000, has exactly:
    depth 0: 1; 1: 2; 2: 15; 3: 441; 4: 969.
    sum=1428.
Other exact computed cases (depth:count):
    M=10,D=7,X=123456789: 0:1, 1:2, 2:15, 3:656, 4:2238081, 5:15397929.
    M=10,D=7,X=1000003456789: 0:1, 1:2, 2:15, 3:656, 4:2639818, 5:86623399506, 6:56231596686.
    M=10,D=3,X=10000: infinity:3332, 0:1.
    M=10,D=9,X=1000000000000000000000000012345: 0:1, 1:163011886, 2:109190775756561404971388294550, 3:1920335354549706139559806045.

Reproduce exact certificate:
```python
from collections import Counter
from random import Random
def f(n,M,D):
    s,w=0,1
    while n:
        n,a=divmod(n,M);s+=a*w;w*=M-D
    return s
def terminal(n,M,D):
    t=0
    while n>=M:n=f(n,M,D);t+=1
    return n,t
def lift(y,M,D):
    B=M-D
    if B==1:return M if y==1 else (M**y-1)//(M-1)
    s,w=0,1
    while y:
        y,a=divmod(y,B);s+=a*w;w*=M
    return s
def prefix_coeffs(X,M,D):
    B=M-D;n=X;ds=[]
    while n:n,a=divmod(n,M);ds.append(a)
    P=[1];C=[];shift=f(X,M,D);w=1
    for a in ds:
        shift-=a*w
        for j in range(a):
            start=shift+j*w
            if len(C)<start+len(P):C.extend([0]*(start+len(P)-len(C)))
            for k,c in enumerate(P):C[start+k]+=c
        Q=[0]*(len(P)+(M-1)*w)
        for r in range(min(w,len(Q))):
            run=0
            for k in range(r,len(Q),w):
                if k<len(P):run+=P[k]
                old=k-M*w
                if 0<=old<len(P):run-=P[old]
                Q[k]=run
        P=Q;w*=B
    v=f(X,M,D)
    if len(C)<=v:C.extend([0]*(v+1-len(C)))
    C[v]+=1
    assert sum(C)==X+1
    return C
def histogram(X,M,D):
    H=Counter()
    for y,c in enumerate(prefix_coeffs(X,M,D)):
        if y and y%D==0 and c:
            r,t=terminal(y,M,D);H[t+1 if r==D else None]+=c
    if X>=D:H[1]-=1;H[0]+=1
    return +H
def brute(X,M,D):
    H=Counter()
    for n in range(D,X+1,D):
        r,t=terminal(n,M,D);H[t if r==D else None]+=1
    return H
count=chains=0
for M in range(2,26):
 for D in range(1,M):
    B=M-D
    for n in range(1,3001):
        r,t=terminal(n,M,D)
        assert r==(n if n<M else B+(n-B)%D)
        count+=1
    for r in range(B,M):
        y=r
        for t in range(1,6):
            if B==1 and y>100:break
            y=lift(y,M,D);assert terminal(y,M,D)==(r,t);chains+=1
rng=Random(2711);checks=0
for M in range(2,15):
 for D in range(1,M):
    for X in [0,1,D,M-1,M,2*M+3,*[rng.randrange(1,20000) for _ in range(5)]]:
        assert +Counter(dict(enumerate(prefix_coeffs(X,M,D))))==Counter(f(n,M,D) for n in range(X+1))
        assert histogram(X,M,D)==brute(X,M,D);checks+=1
print(count,chains,checks)
for M,D,X in [(10,7,10000),(10,7,123456789),(10,7,10**12+3456789),(10,3,10000),(10,9,10**30+12345)]:
 print(M,D,X,histogram(X,M,D))
```

## 4. Lean formalization checkpoint (uncompiled, proposed subtheorem)
Mathlib documents Nat.digits as little endian and Nat.ofDigits as evaluation of those digits. Candidate definitions and signatures below, not an approved platform statement for the complete distribution question. No proof execution claimed.
```lean
import Mathlib

def mimic (M D n : ℕ) : ℕ :=
  Nat.ofDigits (M - D) (Nat.digits M n)

-- Prove by digit evaluation induction and strong descent:
theorem terminal_residue (M D n : ℕ)
    (hM : 2 ≤ M) (hD : 0 < D) (hDM : D < M) (hn : M ≤ n) :
    ∃ t : ℕ, (mimic M D)^[t] n =
      M - D + (n - (M - D)) % D := by
  sorry

-- Prove by inverse digit construction; first hitting time, not just an iterate.
theorem unbounded_mimic (M D : ℕ)
    (hM : 2 ≤ M) (hD : 0 < D) (hDM : D < M) (hhalf : M ≤ 2 * D)
    (t : ℕ) :
    ∃ n : ℕ, 0 < n ∧ D ∣ n ∧ (mimic M D)^[t] n = D ∧
      ∀ s < t, (mimic M D)^[s] n ≠ D := by
  sorry
```
Formal proof route: establish f(n)%D=n%D by list induction using Nat.ofDigits_cons and modular add/mul; prove strict shrink for multi-digit input and lower bound B by digit recursion and positivity; strong induction on n for terminal_residue. For unboundedness use canonical base-B digits with Nat.ofDigits M and the digits/ofDigits inverse (B>=2); use repunit or the special M case when B=1. Induct on t, using strict growth and first hitting time. The draft is research-only, contains holes, and must not be submitted as a proof.

## 5. Official submission / resume
Current join.txt read on 2026-11-27 and reference tools/oma.sh workflow checked. Upstream GitHub data/extra.json lists opg-distribution-and-upper-bound-of-mimic-numbers as unformalized. Live website/catalogue API/agent brief inaccessible from this run; direct sandbox curl DNS failed. No lease acquired, no submission of mimic problem attempted. Fork con123-gif/open-math-agents now exists, upstream parent verified, push permission true; fork is no longer the blocker. Existing Retkes statement PR https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/6725 remains open/unmerged, no comments; remote workflow run 46006202313 queued. No local lean/lake/gh executable. Site credit is not yet confirmed. No duplicate PRs. Literature search found the 2009 original problem, not an independent published resolution of the new terminal formula; this is not an exhaustive novelty review. Next: recover live desk access, get proper formalization lease, clarify distribution and D>M convention, formalize exact agreed statement, run checker; track PR 6725 and repair any checker failure. Do not alter unrelated workers.

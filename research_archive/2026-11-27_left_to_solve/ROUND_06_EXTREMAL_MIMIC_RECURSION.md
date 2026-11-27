# Round 06 — exact extremal mimic-number recursion

2026-11-27. Research credit: con123-gif (URT/Newton's Cathedral); AI mathematical assistance: ChatGPT (GPT-6.2). External mathematics track. This is algebraic inverse recursion, not an execution of the original URT controller. No claim of priority, Lean verification, or external acceptance.

Source: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers ; Bhattacharyya, Bandyopadhyay and Maulik, Non-primes are recursively divisible (2009), https://emis.de/ft/39404 . Builds on ROUND_04_MIMIC_NUMBERS.md and ROUND_05_CONTRACTION_AND_PRIMES.md.

## Theorem
Fix base M>=2 and 1<=B=M-D<=D<M. Let f(n) be the evaluation of the base-M digit string of n at B. Positive multiples of D terminate at D, since f preserves residue modulo D, is positive for n>0 and strictly decreases for n>=M, and D is the only positive one-digit multiple of D.

Define S_i=(M-1)sum_{j=0}^{i-1}B^j, S_0=0.
The set of attainable values using i digits is exactly every integer from 0 to S_i. Induct: the intervals [a B^i, a B^i+S_i] for 0<=a<M have no gap because S_i>=B^i-1 (also valid for B=1).

For a target y>=0 define L(y)=min{n>=0:f(n)=y}. Choose the least i with y<=S_i. At each digit position j from i-1 down to 0, choose
  a_j=max(0,ceil((y-S_j)/B^j)), then replace y by y-a_j B^j.
It is the smallest feasible digit, because lower positions attain precisely [0,S_j]; feasibility gives a_j<=M-1 and nonnegative remainder. Recursion lexicographically minimizes the base-M digit string, hence minimizes n.

Monotonicity: f(0)=0, and each increment n->n+1 changes f by B^j-(M-1)sum_{i<j}B^i <=1, where j is the number of trailing maximal digits. Thus no integer value can be skipped on the upward first passage to a larger value. Consequently L(y) is strictly increasing. This is a direct proof, no monotonicity of f itself assumed.

Let l_t=min{n positive multiple of D : m(n)=t}, where m is first hitting time of D. Then l_0=D, l_1=2D (indeed f(2D)=D and there are no positive multiples between), and for t>=2,
  l_t=L(l_(t-1)).
Any preimage of a depth t-1 integer (>D) has depth t, is positive and congruent mod D to the image. Strict monotonicity of L implies the minimum preimage is attained at the minimum depth t-1 integer. This establishes the formula by induction; l_t strictly increases because f(n)<n above one digit.

For B>=2 the largest preimage U(y) is obtained by rewriting the canonical base-B digits of y in base M. Given any valid digits, performing a carry of B from position j to j+1 preserves y and increases the base-M weighted sum by (M-B)M^j. Allow temporary coefficients above M-1; the total digit sum decreases by B-1 per carry, so the process terminates at the unique canonical base-B digits, which are valid base-M digits. Hence U(y) maximizes n. It is strictly increasing by lexicographic order of base-B digits. For u_t=max{n positive multiple of D:m(n)=t}, u_0=D and u_t=U(u_(t-1)) for t>=1 (U(D)>D because D>=B). These are finite maxima. Every exact depth occurs. For B=1, D=M-1, each positive depth has infinitely many inputs: append any number of zeros to a nontrivial depth-t input without changing its first image. In this case l_1=2D and l_t=M^(l_(t-1)/D)-1 for t>=2; the least integer of a given digit sum has all maximal digits packed at the least significant positions and at most one nonzero digit above them. More generally for y=q(M-1)+r, 0<=r<M-1, L(y)=(r+1)M^q-1.

Thus the maximum hitting time among multiples n<=X is exactly max{t:l_t<=X}, for X>=D. For B>=2, every exact depth class is contained in [l_t,u_t], and both endpoints are attained. This does not assert every intervening multiple has that depth.

## Whole-depth distribution
For B>=2 let L_t be any digit count with M^L_t>u_t. Let c_t(y)=[z^y] product_{j=0}^{L_t-1}(sum_{a=0}^{M-1}z^(a B^j)). Then for t>=1 the total number of positive multiples of D with depth t, over the entire infinite domain, is
  H_t=sum_{D<=y<=u_(t-1), D|y, m(y)=t-1} c_t(y) - 1_{t=1}.
The polynomial counts preimages in the full digit range; the extremal theorem ensures no depth-t preimage lies outside it. The subtraction removes D itself. H_0=1. Exact dynamic programming suffices; no efficient asymptotic complexity for large t is claimed.

Decimal D=7, exact computed:
t | min | max | total count
0 | 7 | 7 | 1
1 | 14 | 21 | 2
2 | 28 | 210 | 15
3 | 77 | 21210 | 656
4 | 588 | 1002002120 | 2639818
5 | 39879 | 2120211102222111122 | not computed
6 | 289789899 | 112010101201200111212011111010122100222 | not computed
7 | 37977987877888989 | 20211010221200100202200010011212011121120022100100120201121111001112102111111102 | not computed

## Executed sandbox certificate
Python 3, independent forward enumeration of 156729 positive multiples above D through 20000, for all 36 (M,D) with 2<=M<=12 and ceil(M/2)<=D<M. Every attained depth minimum agreed; every predicted finite maximum within cutoff agreed; B=1 append-zero tests passed. Decimal endpoints through depth 7 checked by forward recursion. Counts through depth 4 computed by truncated coefficient convolution, not by enumerating a billion integers. Reproduction:
```python
def f(n,M,D):
    b=M-D;s=0;p=1
    while n:
        n,a=divmod(n,M);s+=a*p;p*=b
    return s
def depth(n,M,D):
    t=0
    while n!=D:
        a=f(n,M,D)
        if a==n:return None
        n=a;t+=1
    return t
def low(y,M,D):
    b=M-D;w=[1];s=[0]
    while s[-1]<y:
        s.append(s[-1]+(M-1)*w[-1]);w.append(b*w[-1])
    n=0
    for i in reversed(range(len(s)-1)):
        a=max(0,(y-s[i]+w[i]-1)//w[i])
        assert a<M
        y-=a*w[i];assert 0<=y<=s[i];n=n*M+a
    assert y==0
    return n
def high(y,M,D):
    b=M-D;assert b>1
    n=0;p=1
    while y:
        y,a=divmod(y,b);n+=a*p;p*=M
    return n
checked=cases=0
for M in range(2,13):
    for D in range((M+1)//2,M):
        limit=20000;ds={D:0};mins={0:D};maxs={0:D}
        for x in range(2*D,limit+1,D):
            t=1+ds[f(x,M,D)];ds[x]=t;mins.setdefault(t,x);maxs[t]=x;checked+=1
        lo=hi=D
        for t in range(1,max(mins)+1):
            lo=2*D if t==1 else low(lo,M,D)
            assert lo==mins[t]
            if M-D>1:
                hi=high(hi,M,D)
                if hi<=limit:assert hi==maxs[t]
            else:assert depth(M*lo,M,D)==t
        cases+=1
print(cases,checked)
def coeffs(M,B,L,cap):
    c=[1]+[0]*cap;w=1
    for i in range(L):
        new=[0]*(cap+1)
        for a in range(min(M-1,cap//w)+1):
            shift=a*w
            for j in range(cap+1-shift):new[j+shift]+=c[j]
        c=new;w*=B
    return c
M,D=10,7;u=D
for t in range(1,5):
    prev=u;u=high(u,M,D);c=coeffs(M,M-D,len(str(u)),prev)
    print(t,u,sum(c[y] for y in range(D,prev+1,D) if depth(y,M,D)==t-1)-(t==1))
```
Scope: positive reconstruction base B>=1, finite termination regime 2D>=M. Round 4 addresses nontermination when 2D<M. No result claimed for negative reconstruction bases; no original URT recurrence advantage asserted. Next: independent mathematical audit, precise Lean formulation and compliant submission if fork access permits.

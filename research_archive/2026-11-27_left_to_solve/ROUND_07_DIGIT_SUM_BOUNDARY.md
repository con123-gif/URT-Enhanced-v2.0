# Round 07 — digit-sum boundary, exact distribution and uniform density

2026-11-27. Research credit: con123-gif (URT/Newton's Cathedral); AI assistance: ChatGPT (GPT-6.2). Independent external mathematics track. This is recursive algebra and probability, not a run of the original URT controller. Novelty not established. Not Lean-verified or submitted.

Problem: https://www.openproblemgarden.org/op/distribution_and_upper_bound_of_mimic_numbers . Continue ROUND_04_MIMIC_NUMBERS.md, ROUND_05_CONTRACTION_AND_PRIMES.md and ROUND_06_EXTREMAL_MIMIC_RECURSION.md. The positive-base case B=1 is excluded from the double-logarithm theorem in round 5.

## 1. Exact thresholds and iterated logarithm

Fix integer M>=2, D=M-1, and let s(n) be the sum of base-M digits of n. For n>0 with D|n, s(n)>0, D|s(n), and s(n)<n for n>=M. Hence the least number m(n) of applications of s to reach D exists. Define a_t=min{n>0:D|n,m(n)=t}. For any integer target y=qD+r, 0<=r<D, its smallest preimage is L(y)=(r+1)M^q-1. Proof: moving one digit unit from a higher position to a lower position which has not reached D preserves digit sum and strictly reduces the represented number. Thus all low digits are filled with D, and at most one higher nonzero digit r remains. L is strictly increasing (also follows immediately from its formula).
a_0=D, a_1=2D, and a_(t+1)=M^(a_t/D)-1 for t>=1. Indeed for t>=1 a_t>D, every preimage of a depth-t number has depth t+1, and monotonicity of L proves the minimum is its preimage. For t=0, D itself is a fixed point so the first nontrivial preimage is 2D. These thresholds are strictly increasing. The maximum depth among positive multiples n<=X is max{t:a_t<=X} for X>=D. Appending a zero to any n of positive depth leaves s(n) unchanged, so each positive depth has infinitely many examples.

Set b_t=a_t/D for t>=1, b_1=2, b_(t+1)=1+M+...+M^(b_t-1). Let T_0=1 and T_(j+1)=M^T_j. Since b_(t+1)<=M^b_t, induction yields b_t<=T_t. Since b_(t+1)-1>=M^(b_t-1) and b_1-1=1, induction yields b_t-1>=T_(t-1). Thus T_(t-1)+1<=b_t<=T_t. This proves that the maximal hitting time is log_M^*(X/D)+O(1), where log-star is the least number of iterated real base-M logarithms needed to reduce a number >=1 to <=1. This is a maximum law, not a pointwise approximation for every n; e.g. D*M^j has depth 1 for every j>=1.

Decimal example thresholds: 9, 18, 99, 99999999999, 10^11111111111-1. The last is symbolic, not expanded or directly simulated.

## 2. Exact finite-range histogram, no enumeration of all integers

For L>=1 let C_L(y) be the coefficient of z^y in (1+z+...+z^(M-1))^L. This counts all n in [0,M^L) with digit sum y. Inclusion-exclusion gives
C_L(y)=sum_(j=0)^min(L,floor(y/M)) (-1)^j binom(L,j) binom(y-Mj+L-1,L-1).
Only multiples y>0 of D are relevant, by digit-sum congruence. Let H_L(t) count positive multiples n<M^L with m(n)=t. Then H_L(0)=1, and for t>=1:
H_L(t)=sum_(D<=y<=DL, D|y, m(y)=t-1) C_L(y) - indicator(t=1).
The subtraction removes D, which maps to itself. This gives exact finite-range depth distribution for any M,L using arithmetic on digit sums rather than all M^L inputs. It is not claimed to be a fast bit-complexity algorithm for arbitrarily large L.

For decimal D=9, L=20: depth 0 = 1; depth 1 = 6906899; depth 2 = 8683370783639137511; depth 3 = 2427740327465066700. All other depths zero. These sum to floor((10^20-1)/9).

## 3. Uniform zero density of each bounded-depth class (analytical)

For each fixed t>=0, let S_t={n>0:D|n, m(n)<=t}. Claim: lim_(H->infinity) sup_(A>=0 integer) |S_t intersect [A,A+H)|/H =0. Thus every fixed finite depth, despite being infinite for positive t, has zero density even uniformly across translated intervals. Relative density among positive multiples of D is also zero. In particular the depth tends to infinity in probability along any sequence of intervals with length tending to infinity.

Proof by induction. S_0={D}. For t>=1, S_t=s^{-1}(S_(t-1)) (on nonnegative integers), using s(n)=n mod D, positivity for positive n, and the fact that D is fixed. In an aligned block [A M^L,(A+1)M^L), s(n)=s(A)+Y_L with Y_L=sum of L independent uniform digits in {0,...,M-1}. Its variance is L(M^2-1)/12. Also sup_y P(Y_L=y)<=C_M/sqrt(L). To see the latter without a local central limit theorem, condition on the set of positions whose digit is 0 or 1 and on all other digit values. The number K of those positions is Bin(L,2/M); conditional on the selected positions and other digits the remaining sum is Bin(K,1/2) plus a constant. Its largest atom is at most C/sqrt(K+1) by the central binomial coefficient bound. Chebyshev shows P(K<L/M)=O_M(1/L) (for M=2 K=L deterministically). Averaging gives the stated maximum atom estimate.

Given epsilon>0 choose a fixed R large enough that P(|Y_L-EY_L|>R sqrt(L))<epsilon, by Chebyshev. By induction, S_(t-1) occupies o(sqrt(L)) integer points uniformly in every interval of length 2R sqrt(L)+O(1). Thus the probability that s(A)+Y_L belongs to S_(t-1) inside the central interval is bounded by C_M/sqrt(L) times o(sqrt(L)), which tends to zero uniformly in A. The tail costs at most epsilon, and epsilon was arbitrary. Therefore the density of S_t in aligned M^L-blocks tends uniformly to zero. To extend to arbitrary intervals, first fix L sufficiently large that every aligned block has density <epsilon; partition an arbitrary interval into whole aligned blocks plus at most two incomplete blocks of total length <2M^L. Its density is at most epsilon+2M^L/H. Let H->infinity then epsilon->0. QED.

For 2<=B<=D the earlier bound f(n)>=B^floor(log_M n) implies f^j(n)->infinity as n->infinity for any fixed j; hence every bounded-depth class is finite and also uniformly zero-density. The B=1 theorem completes the uniform density result for the terminating positive-base regime. No limiting centered-depth distribution is claimed.

## 4. Executed independent exact checks (current chat sandbox)

45 histogram comparisons (M=2..10,L=1..5), comprising 32793 positive multiples checked by brute forward iteration; 27 separate threshold comparisons (same bases, cutoffs 100,1000,10000). All 72 passed. Exact formula outputs for L=20 above calculated with Python integer arithmetic. The density theorem is an analytical proof, not a simulated asymptotic claim.

Reproduction:
```python
from collections import Counter
from math import comb
def s(n,M):
    v=0
    while n:
        n,r=divmod(n,M);v+=r
    return v
def depth(n,M):
    t=0
    while n!=M-1:
        n=s(n,M);t+=1
    return t
def coef(y,M,L):
    return sum((-1)**j*comb(L,j)*comb(y-j*M+L-1,L-1)
               for j in range(min(L,y//M)+1))
def hist(M,L):
    D=M-1; h=Counter({0:1})
    for y in range(D,D*L+1,D):
        h[1+depth(y,M)]+=coef(y,M,L)
    h[1]-=1
    return +h
checks=0; trajectories=0
for M in range(2,11):
    D=M-1
    for L in range(1,6):
        brute=Counter(depth(n,M) for n in range(D,M**L,D))
        assert hist(M,L)==brute
        trajectories+=sum(brute.values());checks+=1
    for X in [100,1000,10000]:
        minima={}
        for n in range(D,X+1,D):
            minima.setdefault(depth(n,M),n)
        a=D
        for t in range(max(minima)+1):
            assert a==minima[t]
            if t==max(minima):break
            a=2*D if t==0 else M**(a//D)-1
        checks+=1
print(checks,trajectories,hist(10,20))
```

## 5. Left to Solve submission blocker and proposed exact target

Official instructions: https://lefttosolve.com/join.txt . As checked this run, con123-gif/open-math-agents is unavailable (GitHub 404), upstream push is unavailable, and no Lean or gh binary exists in this sandbox. Site agent brief URL was not retrievable. The original problem asks both for a distribution and whether a bound exists, without specifying what distribution means or explicitly constraining M,D in its short statement. A precise proposed Lean target for the unboundedness question in the terminating positive-base regime is: for natural M,D satisfying 2<=M, 0<D<M and M<=2D, for every natural t there exists N>0 divisible by D such that the t-fold iterate of the base-M digit evaluation at M-D equals D, and no earlier iterate equals D. This is a candidate formalization subproblem, not an approved exact platform statement of the entire original question. Clarify domain and distribution with maintainers before submitting. No lease obtained, PR made or acceptance claimed. Need owner to create/enable fork and provide Lean-enabled environment or use remote checker after an approved statement.

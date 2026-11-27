# Round 10 — two-ended carry obstruction for digit reversal

Date: 2026-11-27. Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Target: https://lefttosolve.com/p/oeis-a401895 ; source https://oeis.org/A401895 ; existing merged statement PR #5830. Scope: rigorous partial theorem plus reproducible exact finite computation; not a full proof, not Lean checked, priority not established. The original URT phase recurrence was not used: this is a structure-first recursive digit/carry algorithm.

## Necessary conditions, including a complete exclusion of odd product lengths

Let n>3 be a hypothetical counterexample, with ell decimal digits, and let rev(n) denote reversal. The product must be d R_m where d in {1,...,9} and R_m=(10^m-1)/9. Neither endpoint digit of n is zero: otherwise its product is divisible by ten, contrary to being a nonzero repdigit. The one-digit cases are checked directly, leaving ell>=2. Reversal has ell digits as well, so m is either 2ell-1 or 2ell. Let a,b be the endpoint digits. Reversal is an involution here, so swap n and rev(n) if necessary and assume a<=b.

The uncarried coefficients c_j of n times rev(n) satisfy c_j=c_(2ell-2-j), and c_0=ab. In the odd-length case, ab<=n*rev(n)/10^(2ell-2)<10, and ab=d by the units digit. The carry from c_0 is zero and the carry entering the last coefficient is zero (its output is d, and no further digit exists). Induct from both ends: the next matching coefficient c is congruent to d mod 10 because the low incoming carry is zero; on the high side c plus a nonnegative carry equals d since the high outgoing carry is zero. Thus c=d and both new carries are zero. Continue to the middle, where c_(ell-1) is the sum of squares of the digits, at least a^2+b^2>=2ab>ab=d. Contradiction. This argument also works in any integer base >=2 for multidigit numbers with nonzero endpoints and repdigit products of odd length.

For even m=2ell, the units digit is d=ab mod 10, while
  ab <= n*rev(n)/10^(2ell-2) < (a+1)(b+1).
Also this normalized product is (100d/9)(1-10^(-2ell)), lying between (100d/9)(1-10^-4) inclusive and 100d/9 exclusive. Exact enumeration of the 45 unordered endpoint pairs therefore leaves only (a,b,d)=(5,9,5) or (7,8,6). The endpoint enumeration uses rational arithmetic, not floating point.

A repdigit of even length is divisible by 11. Reversal satisfies rev(n)=(-1)^(ell-1)n mod 11, so 11 divides both factors and 121 divides R_(2ell) (since 11 does not divide d). Expanding 100^ell=(1+99)^ell modulo 121 shows this requires 11|ell. Modulo 9, n*rev(n)=n^2=2ell*d. The quadratic residues modulo 9 are {0,1,4,7}. For d=5 this requires ell mod 9 in {0,1,4,7}; for d=6 it requires 3|ell. In particular the sixes case requires 33|ell.

## Two-ended exact carry recursion

Use j=0,...,2ell-2 for the uncarried coefficients, counted from the units place. Write k_j for the incoming carry at j, so k_0=0, k_(2ell-1)=d and
  c_j+k_j=d+10 k_(j+1).
By symmetry, if u=k_j and v=k_(2ell-1-j), then choosing the next coefficient c=c_j=c_(2ell-2-j) forces
  u'=(c+u-d)/10, v'=d+10v-c.
Both must be nonnegative integers. Moreover the carry entering the reflected coefficient at index K=2ell-2-j is bounded by
  k_K <= sum_(t>=1) c_(K-t)/10^t <= sum_(t>=1) 81(j+1+t)/10^t = 9(j+1)+10.
Here coefficients with negative index are zero; otherwise c_i<=81(2ell-1-i) because the number of terms is at most 2ell-1-i. This proves the bound for every input length.

For t known outer digit pairs, the coefficient at j=t is determined by the already known interior sum plus b*x+a*y, where x,y are the next low and high digits. Enumerate x,y in 0..9, rejecting any transition that violates integrality, the output digit, or the high carry bound. Only enumerate disjoint outer digit pairs. Every actual repdigit product must follow one retained branch. At full length 2t, or 2t+1 with one additional centre digit, independently multiply each retained candidate and its reversal and check against d R_(2ell).

## Exact computational certificate

The following code was actually executed in a Python 3 sandbox and all assertions passed. The fives case has no surviving prefix at depth 15 (covers ell>=30); below 30 the congruences leave only ell=22, whose 6 candidates fail. Hence d=5 is excluded for every ell. The sixes case was exhaustively checked at all six permissible lengths through 198: ell=33,66,99,132,165,198; checked 1010,547,19780,4920,104550,16665 full candidates respectively, total 147472. At depth 99 there remain 16665 partial prefix states, so do not extrapolate to all lengths. The small brute force check independently reproduces the OEIS source through 999999.

```python
from fractions import Fraction

def endpoints():
    out=[]
    for a in range(1,10):
        for b in range(a,10):
            d=a*b%10
            if d==0: continue
            low=Fraction(100*d,9)*(1-Fraction(1,10000))
            high=Fraction(100*d,9)
            if a*b < high and (a+1)*(b+1)>low:out.append((a,b,d))
    return out
assert endpoints()==[(5,9,5),(7,8,6)]

def extend(states,j,a,b,d):
    out=[]
    for L,H,u,v in states:
        interior=sum(L[i]*H[j-i] for i in range(1,j))
        for x in range(10):
            for y in range(10):
                c=interior+b*x+a*y
                if (c+u)%10!=d:continue
                new_v=d+10*v-c
                if 0<=new_v<=9*(j+1)+10:
                    out.append((L+(x,),H+(y,),(c+u)//10,new_v))
    return out

def check(states,ell,d):
    count=0
    for L,H,u,v in states:
        for mid in (range(10) if ell%2 else [None]):
            w=''.join(map(str,H+(() if mid is None else (mid,))+L[::-1]))
            assert len(w)==ell
            n=int(w);count+=1
            assert n*int(w[::-1])!=d*(10**(2*ell)-1)//9, w
    return count
for a,b,d in endpoints():
    states=[((a,),(b,),a*b//10,11*d-a*b)]
    sizes=[1];checks=[]
    for j in range(1,99):
        states=extend(states,j,a,b,d);sizes.append(len(states));t=j+1
        for ell in (2*t,2*t+1):
            if ell>198:continue
            if ell%(33 if d==6 else 11):continue
            if d==5 and ell%9 not in (0,1,4,7):continue
            checks.append((ell,check(states,ell,d)))
        if not states:break
    if d==5:assert not states and t==15
    print('digit',d,'prefix sizes',sizes if d==5 else sizes[:8], 'length checks',checks,'final depth',t,'final states',len(states),'total completed',sum(x[1] for x in checks))
assert [n for n in range(1,1000000) if len(set(str(n*int(str(n)[::-1]))))==1]==[1,2,3]
print('brute force through 999999 passed')
```

## Outcome and next step
All possible counterexamples have endpoints 7/8, length 33k with k>=7, and product the corresponding repdigit of sixes. The remaining branch must be closed with a general argument or explicit counterexample; bounded computation alone is not a solution. The finite certificates have not been kernel checked. No claim of full submission or acceptance. Other candidate catalogue problems were already addressed by prior contributors; the mimic-number statement now has a third-party proposal PR #6800, which needs approval and subsequent proof against its actual target.

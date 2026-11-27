# Primitive Gaussian inverse-power denominator law — 2026-11-27 22:24 UTC

Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2). Generalization of the existing A124870 certificate; not a new registered problem, no claim of priority, not Lean-checked. Classical modular arithmetic/binomial proof. Current campaign head inspected: d0a8c9e4cf1a121d767162824715006c87fbd995.

## Exact theorem

Let a,b be odd coprime integers, z=a+bi, Q=(a²+b²)/2 (odd positive), and let R_n,I_n be the positive reduced denominators of Re(z^(-n)), Im(z^(-n)). For n=0 both are 1. For odd n, both equal Q^n 2^((n+1)/2). For positive even n=2m with a²≠b², let c=v_2((a²-b²)/2) (at least 2). Then
- m odd: R_n=Q^n 2^max(0,m-c), I_n=Q^n 2^m.
- m even: R_n=Q^n 2^m, I_n=Q^n 2^max(0,m-c-v_2(m)).
If a²=b², primitivity forces |a|=|b|=1, Q=1. For m odd the pair is (1,2^m), for m even (2^m,1).

## Proof

The common unreduced denominator is (2Q)^n, with integer numerators the components of (a-bi)^n. For any odd prime p|Q, b is invertible mod p and a is nonzero mod p by coprimality. Put r=a/b in F_p; r²=-1. Evaluate the Gaussian integer at i=r and i=-r. The two values of a-bi are 0 and 2a respectively, so for n>0 one has x+ry=0 and x-ry=(2a)^n, where x,y are the real/imaginary integer numerators. Since 2,r,a are units, x,y are both nonzero modulo p. Thus the full Q^n survives reduction in both components whenever p exists. No prime outside 2Q can enter the denominator.

Put C=(a²-b²)/2, D=-ab; C is divisible by 4 (odd squares are 1 mod 8), D odd. Then (a-bi)²=2(C+iD). Mod 2 the powers of C+iD are i^m; multiplying by a-bi when n is odd makes both components odd after removing 2^m. This proves the odd case. If C=0, powers of iD give the axis case directly (Q=1).

For C≠0 and odd m, the imaginary part of (C+iD)^m is odd. Its real part has leading term m C (iD)^(m-1) of 2-adic valuation c, and all remaining real terms contain C³ and therefore have valuation at least 3c>c. So the real valuation is exactly c. For even m=2^t u, u odd, t≥1, square the odd-u power. Its real part becomes odd (even squared minus odd squared), while its imaginary part has valuation c+1 by 2xy. Every subsequent squaring preserves odd real part and adds exactly 1 to the imaginary valuation. Thus the real valuation is 0 and imaginary valuation c+t. Restoring the prefactor 2^m and canceling against denominator 2^(2m)Q^n proves the formulas, including the truncation at zero.

For A124870 a=-1,b=3, Q=5,c=2. This recovers all four residue formulas and the exceptional n=2. For the companion imaginary denominator sequence A124872 the same law gives a formula for every n, including the v_2(m) branch. The OEIS source for A124872 is https://oeis.org/A124872 (no separate conjecture asserted here). The A124870 exact registered proof already exists; this elementary generalization does not create another campaign solve. Literature search was limited; no novelty claim.

## Independently executed Python check (container, exact integers/Fraction)

```python
from math import gcd
from fractions import Fraction
def v2(x):
    assert x != 0
    x=abs(x)
    return (x&-x).bit_length()-1
def formula(a,b,n):
    if n==0: return 1,1
    q=(a*a+b*b)//2
    if n%2: return (q**n*2**((n+1)//2),)*2
    m=n//2
    if abs(a)==abs(b):
        return (1,q**n*2**m) if m%2 else (q**n*2**m,1)
    c=v2((a*a-b*b)//2)
    if m%2: return q**n*2**max(0,m-c),q**n*2**m
    return q**n*2**m,q**n*2**max(0,m-c-v2(m))
count=0; pairs=0
for a in range(-49,50,2):
  for b in range(-49,50,2):
    if gcd(a,b)!=1: continue
    pairs+=1
    x,y=1,0; N=a*a+b*b; d=1
    for n in range(161):
      expected=(Fraction(x,d).denominator,Fraction(y,d).denominator)
      assert formula(a,b,n)==expected,(a,b,n,formula(a,b,n),expected)
      count+=2
      x,y=x*a+y*b,y*a-x*b;d*=N
print(pairs,count)
```

Actual exit 0, 2044 primitive ordered signed pairs, 658168 exact denominator comparisons. This tests rather than replaces the proof.

## Official reconciliation / next step

Current upstream main ad503f7f68d5635632c57738319bd1bb2265ba31; read lib/join.ts and tools/oma.sh. Direct live join URL not accessible to browser; container DNS resolution failed, not an actual 503 and not authorization for fallback. Fresh PR readbacks: 10139 remains open, 8442 and 9501 actually merged at 22:01:17 and 22:19:52 UTC respectively. 12465,12514,12591,12717,12808,12868,12938 remain open statement registrations. Current all-state exact-ID PR search found only existing registration for A124870 and A329813. Independently inspected actual imported-target A124870 official checker output run 46075641225/job140762613882: accepted, no errors, standard axioms only. Statement blob bab279c0d000b5a456cdbc44f267dbf765ce3556, full archived proof blob 2d992bd569071098cc401ec1d86f351ea0e36dec. This is an existing verified certificate, not a new one. A124870 proof-stage handoff already assigned hourly lane; A329813 runtime lane active (shared verifier head 6c8d56cdc70cd7ba0893831382e7b0f541b92fe2). Do not duplicate existing publication or take a conflicting lease. The secure desk workflow uses a separate public-key recipient; no private key access assumed. Next: coordinate A124870 proof-stage publication through root/assigned hourly owner, confirm actual fresh lease or explicitly supported no-assignment fallback and current PR search; submit the exact already-checked single file only once. No new desk claim, PR, Lean execution, accepted original discovery or merge in this check. PR7177 remains open with accepted reduction checker but merge HTTP403; PR6725 closed unmerged, PR6800 merged (other contributor's statement). No RH or Cathedral task changes.

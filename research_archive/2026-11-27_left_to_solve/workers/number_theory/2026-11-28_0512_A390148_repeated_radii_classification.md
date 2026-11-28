# A390148: repeated radii — complete elementary mathematical proof (not yet Lean-certified)
Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6.2), 2026-11-28. Source and conjectures: Charles L. Hohn, OEIS A390148 (2025), https://oeis.org/A390148. Acknowledgment: Sam Northshield, Ford Circles and Spheres, arXiv:1503.00813, Corollary 4.6, supplies an earlier norm result relevant to the inert-prime clause. TrureTuring research catalog credits prior work on 3 and split primes; no exclusive priority claim.

## Statement and status
For sorted primitive positive integer quadruples r with (sum 1/r)^2 = 3 sum (1/r)^2, the repeated-radii conjecture predicts exactly 2^(omega(x)-[3 divides x]+1) quadruples containing repeated radius 3x^2 for each positive integer x, and no other repeated radii. This note proves that precise clause, including multiplicity and the unique triple. It also gives the full inert-prime clause and the precise integral quotient clause. It does NOT claim to resolve any further source conjectures about frequency or chains. No new certified problem count or official submission. Exact eligibility, complete revision history/related-entry audit and independent prior audit remain outstanding. The current official brief was inaccessible; exact all-state is:pr search for a390148 returned no results, not proof of eligibility or novelty. Earlier primary norm result makes the inert clause a known consequence, not a priority claim.

## Reduction
Set L=lcm(r_i), b_i=L/r_i. Then gcd(b)=1, lcm(b)=L (since gcd(r)=1), and sum(b_i^2)=sum_{i<j}b_i b_j. Conversely any positive primitive integer curvature tuple b satisfying this equality produces primitive r by the same lcm construction, bijectively up to permutation.

## Repeated radius classification
Repeated radius R corresponds to repeated curvature k, so b=(k,k,a,b) where here a,b denote the remaining two positive curvatures. The equation becomes
(k-a-b)^2=3ab.
The three integers k,a,b are pairwise coprime: if a prime divides any two, the equivalent polynomial k^2-2(a+b)k+a^2+b^2-ab=0 modulo that prime forces it to divide the third, contradicting primitivity. Thus L=kab, R=ab. Since 3ab is square and gcd(a,b)=1, unique up to swapping a,b is a=s^2, b=3t^2, with s,t positive, gcd(s,t)=1 and 3 not dividing s. This follows by comparing prime valuations: all exponents outside 3 even, and the exponent at 3 odd in exactly one factor. Hence R=3(st)^2, and the complete construction is
x=st, a=s^2, b=3t^2, k=a+b +/- 3st,
r=sort(ab,ab,ka,kb).
Both signs are positive because (a+b)^2-3ab=a^2+b^2-ab>0. The constructed k is coprime to each of a,b by reducing the polynomial modulo a common prime, so the resulting r is primitive and satisfies the original equation by the curvature bijection. Every row with repeated radius R occurs. Distinct splits and signs give distinct rows: given the row and R, recover L and k=L/R, remove two copies of R, recover the unordered pair of remaining curvatures, and identify the square member uniquely (3t^2 is not square). This reconstructs s,t and sign. There are exactly 2^(omega(x)-[3 divides x]) allocations of complete prime powers of x to s or t; the 3-power is forced to t. Each allocation gives two rows. Therefore the conjectured count follows. No other repeated R occurs.
Two different repeated values would give a=b, hence a=b=1 by coprimality, impossible because 3ab=3 is not square. Three equal curvatures require k=a or k=b. Coprimality forces k=a=1 or k=b=1, and b=3t^2 excludes the latter. Then s=1, 1=1+3t^2-3t gives t=1. The unique triple is radii (1,3,3,3), and the other row for x=1 is (3,3,7,21). Four equal positive curvatures cannot satisfy the equation.

## Inert prime pattern (conservative known-consequence classification)
Let p=2 mod 3 divide L, M=v_p(L)>0. There is a unit among the curvatures and at least one nonunit (a curvature divisible by p^M). The binary quadratic Q(u,v)=u^2-uv+v^2 vanishes mod p only when u=v=0: if v is nonzero, w=-u/v would have w^3=1 and w!=1 (p!=3), contradicting 3 not dividing p-1; v=0 is immediate. This includes p=2. Reduction of the divided curvature equation excludes exactly one or two units (a square or Q would have to vanish). Thus there are exactly three units a,b,c, and d is divisible by p^M, with valuation M. The identity Q(a-c,b-c)=d(a+b+c-d) follows from the equation. Mod p this implies a=b=c, units. Hence a+b+c-d is a unit, and the RHS valuation is exactly M. On the LHS factor the largest common power of p from a-c,b-c (at least one difference nonzero because RHS is nonzero); the anisotropy of Q gives even valuation. Thus M is even. The corresponding sorted radius valuations are (0,M,M,M).
Prior bridge: S=sum b_i is divisible by 3 from S^2=3 sum b_i^2. Set t=S/3 and q_i=t-b_i. Then sum q_i=t, sum q_i^2=t^2, gcd(q)=1 since b_i=sum q-q_i. Northshield Cor. 4.6 establishes the absolute triple sums of such a primitive q are Eisenstein norms. But these are exactly b_i, positive. The norm property already forces even inert-prime exponents; the elementary modular argument above supplies the multiplicity. Do not count a routine consequence as independently novel.

## Exact quotient
At every prime, among the four radius valuations the maximum is attained at least twice: otherwise exactly one curvature would be a unit, which contradicts the divided equation mod p. At p=3 dividing L, the sum of curvatures vanishes mod 3, and the sum of squares vanishes mod 3; consequently the number of units is exactly three. Thus the radius pattern is again (0,M,M,M), without parity restriction. For r1<=r2<=r3<=r4, write u<=v<=w for the sorted valuations of the first three (regardless of numerical radius order) and z for that of r4. The exponent of r1*r2*r3/(gcd12*gcd13*gcd23) is w-u. If z=0 then w-u>=z. If z>0 then u=0 by primitivity and w>=z by the tied maximum. Therefore X=r1*r2*r3/(gcd12*gcd13*gcd23*r4) is integral. At p=3 or p=2 mod 3 the pattern (0,M,M,M) gives w-u-z=0, so only p=1 mod 3 can divide X. For a prime dividing X, if z=0 and only one of the first three were positive the maximum would be unique; if z>0 and only one were positive then the tied maximum forces w=z, making its exponent in X zero. Thus any prime dividing X divides at least two of the first three radii. No claim about an undefined notion of frequency.

## Independent exact computations, executed locally
Python 3 / sympy.factorint, using integer arithmetic only. Repeated radii x=1..500: iterate all positive divisors a<=sqrt(3x^2), b=3x^2/a coprime, solve k=a+b +/- sqrt(3ab), construct sorted rows and test primitive gcd, original curvature equation, lcm roundtrip, uniqueness, exact predicted count. 3556 rows checked, 3556 distinct within their x classes, exactly one triple; all assertions passed. Independent exhaustive curvature enumeration: all sorted positive primitive quadruples with maximum curvature <=120, solve for fourth curvature d=(S +/- sqrt(3S^2-6Q))/2 for each sorted triple a,b,c with S=a+b+c,Q=a^2+b^2+c^2. Found 471 tuples; checked original equation, primitivity, 453 inert-prime cases, 471 quotient cases, 44 repeated-value cases, all passed.
Reproduction:
```python
from math import gcd,isqrt,lcm
from sympy import factorint
rows=0; triples=0
for x in range(1,501):
 R=3*x*x; got=set()
 for a in range(1,isqrt(R)+1):
  if R%a: continue
  b=R//a
  if gcd(a,b)!=1: continue
  D=3*a*b; h=isqrt(D)
  if h*h!=D: continue
  for k in (a+b-h,a+b+h):
   assert k>0 and gcd(k,a)==gcd(k,b)==1
   r=tuple(sorted((R,R,k*a,k*b)))
   L=lcm(*r); c=[L//v for v in r]
   assert gcd(*r)==1 and sum(c)**2==3*sum(v*v for v in c)
   assert lcm(*c)==L and gcd(*c)==1 and r.count(R)>=2
   if len(set(r))==2:
    assert r==(1,3,3,3);triples+=1
   got.add(r)
 assert len(got)==2**(len(factorint(x))-(x%3==0)+1)
 rows+=len(got)
assert (rows,triples)==(3556,1)
N=120;count=inert=quot=repeat=0
for a in range(1,N+1):
 for b in range(a,N+1):
  for c in range(b,N+1):
   S=a+b+c;Q=a*a+b*b+c*c;D=3*S*S-6*Q
   if D<0: continue
   h=isqrt(D)
   if h*h!=D or (S+h)%2:continue
   for d in set(((S+h)//2,(S-h)//2)):
    if not c<=d<=N or gcd(a,b,c,d)!=1:continue
    co=(a,b,c,d);L=lcm(*co);r=tuple(sorted(L//v for v in co))
    assert gcd(*r)==1 and sum(co)**2==3*sum(v*v for v in co);count+=1
    for p in factorint(L):
     if p%3==2:
      v=[]
      for n in r:
       j=0
       while n%p==0:n//=p;j+=1
       v.append(j)
      v.sort();assert v[0]==0 and v[1]==v[2]==v[3] and v[1]%2==0;inert+=1
    w,x,y,z=r;num=w*x*y;den=gcd(w,x)*gcd(w,y)*gcd(x,y)*z
    assert num%den==0
    for p in factorint(num//den):assert p%3==1 and sum(v%p==0 for v in r[:3])>=2
    quot+=1
    for v in set(r):
     if r.count(v)>=2:
      assert v%3==0 and isqrt(v//3)**2==v//3;repeat+=1
assert (count,inert,quot,repeat)==(471,453,471,44)
```
These checks challenge the proof but do not replace it.

## Submission and next executable step
Fresh actual GitHub metadata: A068991 foreign full proof PR16269 (romechenko, created 00:42:09 UTC) and A372561 foreign full proof PR19800 (KoaOkano, created 04:20:46 UTC), both open, each with exactly one file proofs/<id>.lean; withhold duplicates. No inference about their kernel results. PR10139 remains open, PR13332 merged. Current ledger count unchanged: 37 archived / 5 upstream checker accepted / 4 merged / 0 certified original.
Next: audit all A390148 revision/related sources and complete catalog/primary literature for repeated-radii exact count and check live eligibility; if clean, coordinate exact statement and Lean proof of the complete repeated-radius clause, not a weaker claim. Do not register a partial substitute for an official larger target. Local Lean unavailable; no actual Lean execution in this run. No official claim, PR, lease, RH or schedule changes.

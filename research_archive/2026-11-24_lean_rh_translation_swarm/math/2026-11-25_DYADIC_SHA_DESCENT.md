# Dyadic Sha descent — exact inherited/new-sector separation
25 November 2026. Human mathematical reduction, not a Lean replay or RH proof. Previous principal-host commit 26e90fe605409d7c9f966a7145db8b0c7849c980. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005: Formalism/GaloisCohomology/Statement.lean (0799e9bcd8aa191ffaa90ab005453a53381bacea), WindowBoundOfLiteratureLevel.lean (01c499108485b16d33791a9e46fbb1e2af865522), HVCore.lean (f4b900eb48df14f16eea03d08b7d9ef077f3d4a1), CohInp.lean (a5da0b85c6b7f82e88131ff19cfe732e1f912af1). Source defines Sha as kernel of localization in H1(G_{F,S},Q_l/Z_l(-j)), S precisely primes over l, for positive twist index j. Here j is distinct from tower index e. The source's actual VWin supplier uses four Count inputs plus Iwasawa/duality and lemmaK, not just descent; no assertion of source equivalence of this alternative route.

## Odd coefficient primes
Fix distinct admissible q,d and K_e=Q(zeta_{2^(e+2)})^+(sqrt(-q),sqrt(-d)). L=K_(e+1), F=K_e, [L:F]=2, M=Q_l/Z_l(-j) with cyclotomic action. Use compatible local choices; intrinsic Sha is the full absolute H1 subgroup unramified outside l and locally zero at l. This description follows from inflation-restriction for the unramified quotient (M unramified outside l), and agrees with the source kernel under the usual identification of Galois groups and localization. The source's independence of local choices has not been kernel-rechecked here.

For odd l, restriction H1(F,M)->H1(L,M)^Gal(L/F) is an isomorphism by Hochschild-Serre because all positive cohomology of a group of order 2 with l-primary coefficients vanishes (averaging). This holds at full absolute Galois level; do not assume L/F unramified outside l, since it may ramify at 2. At every finite place, restriction to a decomposition group over L, or to its inertia group, is injective on H1 from the corresponding group over F, by the same inflation-restriction argument for index at most 2. Hence the unramified and local-zero conditions descend and ascend, giving Sha(F,M) ≅ Sha(L,M)^+. Let chi be the quadratic character of L/F; twisting by chi makes the minus space the invariant space, and the same argument identifies it with Sha(F,M⊗chi) defined via absolute H1, inertia-zero outside l and local-zero at l. This is a twisted Selmer kernel, not necessarily the exact source untwisted coefficient module. P_±=(1±sigma)/2 are orthogonal complementary idempotents. Thus if lengths finite:
 length_l Sha(L,M)=length_l Sha(F,M)+length_l Sha(F,M⊗chi).
The same decomposition holds at the module level without assuming finiteness. By iterating for fixed q,d, inherited length cannot decrease, and the entire growth consists of new quadratic twist contributions. One may instead split the full abelian 2-group over a finite unramified coefficient extension containing its character values, giving a direct sum of twisted kernels over Q by the same averaging; base-change/length compatibility for the actual cohomology must be checked before using this in a numerical bound. No estimate of the new-sector lengths follows just from projectors.

## Coefficient prime 2
Now L/F ramifies only at 2, and the source unramified-outside-2 global Galois groups have index two. Hochschild-Serre gives kernel of restriction contained in H1(C2,M^{G_L}) and cokernel into invariants embedded in H2(C2,M^{G_L}). For positive j the cyclotomic image is open, so the invariants are finite cyclic 2-primary (possibly zero). For C2 on a cyclic group Z/2^k with involution a (a^2=1 mod 2^k), both H1=ker(1+a)/im(a-1) and H2=ker(a-1)/im(1+a) have size gcd(1+a,2^k)gcd(1-a,2^k)/2^k <=2: the valuations of a+1,a-1 have minimum 1 for odd a, except small k handled directly. Thus global restriction kernel/cokernel have length at most one. Local restriction at primes above 2 similarly has kernel length at most one. To restrict to Sha, a globally lifted invariant Sha class can fail the local-zero condition only inside those local restriction kernels. The obstruction map from global lifts into their direct sum bounds the additional cokernel by the number of primes over 2; quotienting by the global kernel does not enlarge it. Therefore ker(res on Sha) length <=1 and coker(res into Sha(L)^+) length <=1+#places_F(2).

For this actual principal host q=3 mod8,d=7 mod16. At 2, -q=5 mod8 gives the unramified quadratic extension Q2(sqrt(-q)), and -d=1 mod8 is a Q2 square. The real 2-power cyclotomic field has a totally ramified completion of degree 2^e at 2 (quotient of totally ramified cyclotomic extension). The local compositum has degree 2^(e+1) because the quadratic extension is unramified, whereas global degree is 2^(e+2). Hence exactly two primes over 2 at every tower level, and the restriction defects are bounded by kernel length 1, cokernel length 3. Conditional on finite lengths, -1 <= length_2 Sha(L)^+ - length_2 Sha(F) <=3. This controls only the invariant part, NOT all 2-primary growth; no division by 2 in Z_2.

## Executed finite controls
Local CPython: exhaust all 2x2 involutions over F_3,F_5,F_7 (14,32,58; total 104), check P± idempotence, orthogonality, reconstruction of every vector and product of sector sizes. Exhaust all involutive units modulo 2^k for k=1..12 (43 cases), compute cyclic H1/H2 sizes exactly using gcd, all <=2. These finite checks validate the algebraic skeleton, not the cohomology of actual number fields or the source's VVle. Analytic justification uses standard inflation-restriction and cyclic cohomology formulas; no Lean replay/CI run.
Reproduction:
```python
from itertools import product
from math import gcd
count=0
for p in [3,5,7]:
 I=(1,0,0,1); Z=(0,0,0,0)
 def mul(a,b):return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%p for i in range(2) for j in range(2))
 def mv(a,v):return tuple(sum(a[2*i+k]*v[k] for k in range(2))%p for i in range(2))
 for a in product(range(p),repeat=4):
  if mul(a,a)!=I:continue
  inv=pow(2,-1,p);P=tuple((x+y)*inv%p for x,y in zip(I,a));M=tuple((x-y)*inv%p for x,y in zip(I,a))
  assert mul(P,P)==P and mul(M,M)==M and mul(P,M)==Z
  vs=list(product(range(p),repeat=2))
  assert len({mv(P,v) for v in vs})*len({mv(M,v) for v in vs})==p*p
  assert all(tuple((u+w)%p for u,w in zip(mv(P,v),mv(M,v)))==v for v in vs)
  count+=1
assert count==104
checks=0
for k in range(1,13):
 n=2**k
 for a in range(1,n,2):
  if a*a%n!=1:continue
  assert gcd(1+a,n)*gcd(a-1,n)//n in (1,2)
  checks+=1
assert checks==43
```

## Remaining mathematical task
The source VVle needs the full sum over all coefficient primes and j<t, bounded by exp(x^eps/2) with t=floor(x^401), across chosen windows, universally in admissible local data. A per-level recursive formula with unknown new-sector lengths is not a growth bound. The q,d primes also change between windows, so no single fixed tower base suffices without uniformity. Next derive an arithmetic estimate for the twisted new sectors using the actual source CountI/II/III/V and Iwasawa input, identify whether the principal tower removes any such obligation, and retain the separate TopG arithmetic error supply. No claim of a new unconditional zero-free region or URT advantage. HANDOFF TO Galois, geometry, math, Landau, editor.

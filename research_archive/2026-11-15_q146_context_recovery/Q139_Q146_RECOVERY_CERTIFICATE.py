#!/usr/bin/env python3
"""Q139-Q146 independent recovery from the actual golden 13-contact graph.
These are fresh reconstructions, not the lost original scripts.
Q139/Q142/Q145 use original Q125a centre-independent skew source as an explicit premise.
"""
from itertools import product,combinations
from collections import Counter
from fractions import Fraction
from math import sqrt
from sympy import Matrix,Symbol,sqrt as Ssqrt,expand,simplify
phi=(1+sqrt(5))/2
v=([(0.,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0.) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0.,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2)
       if abs(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)<1e-12]
assert len(edges)==30
H={}
for x in range(8192):
 s=[1-2*((x>>i)&1) for i in range(12)]
 c=1-2*((x>>12)&1)
 H[x]=sum(s[i]*s[j] for i,j in edges)+phi*c*sum(s)
xs=[x for x in range(8192) if H[x]<=-10+1e-10]
assert len(xs)==444
ix={x:i for i,x in enumerate(xs)}
levels=sorted(set(round(H[x],10) for x in xs))
assert len(levels)==3
shell=[levels.index(round(H[x],10)) for x in xs]
assert Counter(shell)=={0:60,1:240,2:144}
adj=[[] for x in xs];links=[]
for i,x in enumerate(xs):
 for bit in range(13):
  j=ix.get(x^(1<<bit))
  if j is not None:
   adj[i].append((j,bit))
   if i<j:links.append((i,j,bit))
assert len(links)==1032
assert Counter(bit==12 for i,j,bit in links)=={False:960,True:72}
assert Counter(tuple(sorted((shell[i],shell[j]))) for i,j,bit in links)=={(0,1):360,(1,2):600,(2,2):72}
# Q139: outer-only f=(C Pl s)^2, W skew; centre flips have f_x=f_y, J=0.
assert all((xs[i]&4095)==(xs[j]&4095) for i,j,b in links if b==12)
centre=lambda x: 1-2*((x>>12)&1)
assert Counter(centre(x) for x in xs)=={-1:222,1:222}
# Q140: original outer adjacency moments and four-cycles.
outer=[set(j for j,b in row if b!=12) for row in adj]
deg_o=list(map(len,outer));trA2=sum(deg_o);trA4=0
for i in range(444):
 walks=Counter(k for j in outer[i] for k in outer[j])
 trA4+=sum(z*z for z in walks.values())
cycles=(trA4-trA2-4*sum(d*(d-1)//2 for d in deg_o))//8
assert (trA2,trA4,cycles)==(1920,19440,480)
# Q141: conditional beta=0 heat-bath rate 1/2 per undirected graph link.
deg=[len(row) for row in adj]
trG=-Fraction(sum(deg),2)
trG2=Fraction(sum(d*d for d in deg)+sum(deg),4)
rayleigh=Fraction(72*2,444)
assert (trG,trG2,rayleigh)==(-1032,3042,Fraction(12,37))
# Q142: with zero centre flip current, remaining source links switch outer parity.
for c in (-1,1):
 parity=Counter((x&4095).bit_count()%2 for x in xs if centre(x)==c)
 assert sorted(parity.values())==[102,120]
assert all(((xs[i]&4095).bit_count()%2)!=((xs[j]&4095).bit_count()%2)
           for i,j,b in links if b!=12)
nullity=2*(120-102)*96;rank=444*96-nullity
assert (nullity,rank)==(3456,39168)
# Q145: spectral Cauchy-Schwarz bound using original Q125a trace Hch^2.
trH2=3244032+884736*Ssqrt(5)
lower=expand(trH2**2/Fraction(rank))
assert simplify(lower-(6266290176+2491416576*Ssqrt(5))/17)==0
# Q146: exact coarsest unweighted equitable refinement subordinate to 3 shells.
colors=shell
for k in range(20):
 sig=[(colors[i],tuple(sorted(Counter(colors[j] for j,b in adj[i]).items()))) for i in range(444)]
 keys={s:j for j,s in enumerate(sorted(set(sig)))}
 nxt=[keys[s] for s in sig]
 if len(set(nxt))==len(set(colors)):
  colors=nxt;break
 colors=nxt
else:raise AssertionError("refinement did not stabilize")
classes=sorted(set(colors))
assert len(classes)==5
groups={c:[i for i in range(444) if colors[i]==c] for c in classes}
assert sorted(map(len,groups.values()))==[24,60,120,120,120]
Q=[]
for c in classes:
 rows=[tuple(sum(colors[j]==cc for j,b in adj[i]) for cc in classes) for i in groups[c]]
 assert len(set(rows))==1
 Q.append(rows[0])
t=Symbol('t');p=Matrix(Q).charpoly(t).as_expr()
assert expand(p-(t**5-2*t**4-22*t**3+33*t**2+28*t-18))==0
for i in range(444):
 assert tuple(sum(colors[j]==c for j,b in adj[i]) for c in classes)==Q[classes.index(colors[i])]
print("Q139: centre 72 J=0 conditional on original Q125a; 222+222")
print("Q140: Tr A2/A4",trA2,trA4,"4-cycles",cycles)
print("Q141: Tr G/G2",trG,trG2,"lambda2 upper",rayleigh)
print("Q142: nullity>=",nullity,"rank<=",rank)
print("Q145: Tr Hch^4 >=",lower)
print("Q146: quotient sizes",[len(groups[c]) for c in classes],"matrix",Q)
print("Q146: characteristic polynomial",p)
print("RECOVERED Q139-Q146 RECONSTRUCTION: PASS (local original golden graph)")
print("OPEN: original Q125a weighted 720-link full Q96 spectrum, exact fourth moment, gauge photon, physical ARF")

#!/usr/bin/env python3
"""Q161eg: exact native Q124/Q125 four-history volume minors in Z[phi]."""
from itertools import combinations, product
from collections import Counter
def add(x,y): return (x[0]+y[0],x[1]+y[1])
def neg(x): return (-x[0],-x[1])
def mul(x,y): return (x[0]*y[0]+x[1]*y[1],x[0]*y[1]+x[1]*y[0]+x[1]*y[1])
def dot(u,v):
 z=(0,0)
 for x,y in zip(u,v): z=add(z,mul(x,y))
 return z
def cross(u,v):
 return tuple(add(mul(u[(i+1)%3],v[(i+2)%3]),neg(mul(u[(i+2)%3],v[(i+1)%3]))) for i in range(3))
def det(u,v,w): return dot(u,cross(v,w))
def sign(z):
 a,b=z
 if b==0:return (a>0)-(a<0)
 if a==0:return (b>0)-(b<0)
 if a>0 and b>0:return 1
 if a<0 and b<0:return -1
 c=2*a+b
 return ((c>0)-(c<0)) if c*c>5*b*b else (b>0)-(b<0)
V=[((0,0),(a,0),(0,b)) for a,b in product((-1,1),repeat=2)]
V += [((a,0),(0,b),(0,0)) for a,b in product((-1,1),repeat=2)]
V += [((0,b),(0,0),(a,0)) for a,b in product((-1,1),repeat=2)]
assert len(V)==12
edges={(i,j) for i,j in combinations(range(12),2)
 if dot(tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])),tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])))==(4,0)}
assert len(edges)==30
allowed=set()
for m in range(8192):
 s=[1-2*((m>>i)&1) for i in range(12)];c=1-2*((m>>12)&1)
 if sign((sum(s[i]*s[j] for i,j in edges)+10,c*sum(s)))<=0: allowed.add(m)
assert len(allowed)==444
W={m:tuple(tuple(sum((1-2*((m>>i)&1))*V[i][k][h] for i in range(12))
 for h in (0,1)) for k in range(3)) for m in allowed}
counts=Counter();n=0
for m in sorted(allowed):
 for a,b in combinations(range(12),2):
  q=(m,m^(1<<a),m^(1<<a)^(1<<b),m^(1<<b))
  if min(q)!=m or any(x not in allowed for x in q):continue
  n+=1;w=[W[x] for x in q]
  assert all(add(w[0][i],w[2][i])==add(w[1][i],w[3][i]) for i in range(3))
  minors=[det(*[w[j] for j in range(4) if j!=i]) for i in range(4)]
  assert len(set(minors))==1,(m,a,b,minors)
  counts[minors[0]]+=1
assert n==480
assert counts=={(0,0):120,(-16,16):120,(16,-16):120,(32,0):60,(-32,0):60},counts
print("Q161eg EXACT PASS: 444 states, 480 squares; signed minors",sorted(counts.items()))
print("Native Q124/Q125 volume rank 2:120; rank 3:360; physical gates OPEN")


from fractions import Fraction as F
def ratio(x,y):
 a,b=y;d=a*a+a*b-b*b;z=mul(x,(a+b,-b));return(F(z[0],d),F(z[1],d))
classes=Counter();anti2=Counter()
for m in sorted(allowed):
 for a,b in combinations(range(12),2):
  q=(m,m^(1<<a),m^(1<<a)^(1<<b),m^(1<<b))
  if min(q)!=m or any(x not in allowed for x in q):continue
  w=[W[x] for x in q]
  t=add(add(mul(dot(w[0],w[1]),dot(w[2],w[3])),neg(mul(dot(w[0],w[2]),dot(w[1],w[3])))),mul(dot(w[0],w[3]),dot(w[1],w[2])))
  p=(1,0)
  for v in w:
   n=dot(v,v);assert sign(n)>0;p=mul(p,n)
  k=(ratio(mul(t,t),p),sign(t));classes[k]+=1
  if all(add(V[a][j],V[b][j])==Z for j in range(3)):anti2[k]+=1
assert classes=={((F(1),F(0)),1):120,((F(16047,18605),F(-3789,18605)),1):120,((F(5,6),F(-1,4)),-1):240},classes
assert anti2=={((F(1),F(0)),1):120}
print('Q161ei EXACT PASS',classes,'antipodal +I',sum(anti2.values()))

#!/usr/bin/env python3
"""Exact Q125 CP1 four-link SU2 holonomy trace squares on all native Q124 contact squares."""
from itertools import combinations,product
from collections import Counter
import sympy as sp
Z=(0,0)
def add(x,y):return x[0]+y[0],x[1]+y[1]
def neg(x):return -x[0],-x[1]
def mul(x,y):return x[0]*y[0]+x[1]*y[1],x[0]*y[1]+x[1]*y[0]+x[1]*y[1]
def dot(u,v):
 z=Z
 for x,y in zip(u,v):z=add(z,mul(x,y))
 return z
def sign(z):
 a,b=z
 if b==0:return (a>0)-(a<0)
 if a==0:return (b>0)-(b<0)
 if a>0 and b>0:return 1
 if a<0 and b<0:return -1
 c=2*a+b
 return ((c>0)-(c<0)) if c*c>5*b*b else (b>0)-(b<0)
V=[(Z,(a,0),(0,b)) for a,b in product((-1,1),repeat=2)]
V += [((a,0),(0,b),Z) for a,b in product((-1,1),repeat=2)]
V += [((0,b),Z,(a,0)) for a,b in product((-1,1),repeat=2)]
E={(i,j) for i,j in combinations(range(12),2) if dot(tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])),tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])))==(4,0)}
allowed=set()
for m in range(8192):
 s=[1-2*((m>>i)&1) for i in range(12)];c=1-2*((m>>12)&1)
 if sign((sum(s[i]*s[j] for i,j in E)+10,c*sum(s)))<=0:allowed.add(m)
W={m:tuple(tuple(sum((1-2*((m>>i)&1))*V[i][k][h] for i in range(12)) for h in (0,1)) for k in range(3)) for m in allowed}
squares=[]
for m in sorted(allowed):
 for a,b in combinations(range(12),2):
  q=(m,m^(1<<a),m^(1<<a)^(1<<b),m^(1<<b))
  if min(q)!=m or any(x not in allowed for x in q):continue
  squares.append([W[x] for x in q])
assert len(allowed)==444 and len(E)==30 and len(squares)==480
G=Counter(tuple(dot(w[i],w[j]) for i in range(4) for j in range(i,4)) for w in squares)
assert sorted(G.values())==[60,60,120,120,120]
phi=(1+sp.sqrt(5))/2
def ex(z):return z[0]+z[1]*phi
ix={(i,j):t for t,(i,j) in enumerate((i,j) for i in range(4) for j in range(i,4))}
def holonomy_square(k):
 g=lambda i,j:ex(k[ix[min(i,j),max(i,j)]])
 n=[sp.sqrt(g(i,i)) for i in range(4)]
 d=lambda i,j:g(i,j)/(n[i]*n[j])
 real8=1+sum(d(i,j) for i in range(4) for j in range(i+1,4))+d(0,1)*d(2,3)-d(0,2)*d(1,3)+d(0,3)*d(1,2)
 edges=sp.prod(1+d(i,(i+1)%4) for i in range(4))
 return sp.simplify(sp.radsimp(real8**2/(4*edges)))
H=[(k,v,holonomy_square(k)) for k,v in G.items()]
assert len(H)==5
def dihedral(k):
 def val(i,j):return k[ix[min(i,j),max(i,j)]]
 return min(tuple(val((sgn*i+shift)%4,(sgn*j+shift)%4) for i in range(4) for j in range(i,4)) for shift in range(4) for sgn in (1,-1))
classes=Counter()
for k,v,h in H:classes[dihedral(k)]+=v
assert sorted(classes.values())==[120,120,240],classes
anti=[h for k,v,h in H if sp.simplify(h-1)==0]
assert len(anti)==1 and next(v for k,v,h in H if h in anti)==120
for k,v,h in H:
 assert h.equals(0) is False
 assert h.equals(1) is (v==120 and sp.simplify(h-1)==0)
 print('Gram multiplicity',v,'cos^2 half-trace',sp.sstr(h),'approx',sp.N(h,12))
print('Q161EK EXACT PASS: 480 native squares, five Gram classes, three dihedral SU2 holonomy trace-square classes; 120 identity, 360 nonidentity')

#!/usr/bin/env python3
"""Q161ba: exact native Q101 covariance spectral weights of icosahedral dual-face adjacency."""
from fractions import Fraction as F
from itertools import combinations,product
import sympy as S
Z=(F(0),F(0)); ONE=(F(1),F(0))
def add(x,y):return x[0]+y[0],x[1]+y[1]
def mul(x,y):return x[0]*y[0]+5*x[1]*y[1],x[0]*y[1]+x[1]*y[0]
def sub(x,y):return x[0]-y[0],x[1]-y[1]
def div(x,y):
 d=y[0]*y[0]-5*y[1]*y[1]
 return ((x[0]*y[0]-5*x[1]*y[1])/d,(x[1]*y[0]-x[0]*y[1])/d)
def scalar(x,a):return x[0]*a,x[1]*a
def sm(xs):
 a=b=F(0)
 for x,y in xs:a+=x;b+=y
 return a,b
phi=(F(1,2),F(1,2)); coords=[]
for a,b in product((-1,1),repeat=2):coords.append((Z,(F(a),F(0)),scalar(phi,b)))
for a,b in product((-1,1),repeat=2):coords.append(((F(a),F(0)),scalar(phi,b),Z))
for a,b in product((-1,1),repeat=2):coords.append((scalar(phi,a),Z,(F(b),F(0))))
edges=[(i,j) for i,j in combinations(range(12),2) if sm(mul(sub(coords[i][k],coords[j][k]),sub(coords[i][k],coords[j][k])) for k in range(3))==(F(4),F(0))]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
opp={i:next(j for j in range(12) if all(add(coords[i][k],coords[j][k])==Z for k in range(3))) for i in range(12)}
den=scalar(add(ONE,mul(phi,phi)),4)
# Native Q101 Pl = vertex coordinate projector + antipodal-even projector - uniform projector.
P=[[add(sub(div(sm(mul(coords[i][k],coords[j][k]) for k in range(3)),den),(F(1,12),F(0))), (F(int(i==j)+int(i==opp[j]),2),F(0))) for j in range(12)] for i in range(12)]
words=[]
for bits in range(1<<12):
 x=[1-2*((bits>>i)&1) for i in range(12)]
 if sum(x)==4 and sum(x[i]*x[j] for i,j in edges)==-6:words.append(x)
assert len(words)==30
Q=[]
for x in words:
 z=[sm(scalar(P[i][j],x[j]) for j in range(12)) for i in range(12)]
 q=[sm(z[i] for i in f) for f in faces]
 Q.append([mul(t,t) for t in q])
mu=[scalar(sm(row[i] for row in Q),F(1,30)) for i in range(20)]
assert all(t==(F(3,5),F(0)) for t in mu)
A=[[int(i!=j and len(set(faces[i])&set(faces[j]))==2) for j in range(20)] for i in range(20)]
M=[Z]*6
for row in Q:
 d=[sub(t,m) for t,m in zip(row,mu)]
 u=d[:]
 for k in range(6):
  M[k]=add(M[k],sm(mul(d[i],u[i]) for i in range(20)))
  u=[sm(u[j] for j in range(20) if A[i][j]) for i in range(20)]
M=[scalar(t,F(1,30)) for t in M]
expected=[(F(416,25),F(0)),(F(16,25),F(16,5)),(F(736,25),F(0)),(F(-304,25),F(16)),(F(2976,25),F(0)),(F(-1584,25),F(80))]
assert M==expected
rt=S.sqrt(5)
lams=[S.Integer(3),S.Integer(-2),S.Integer(1),rt,-rt,S.Integer(0)]
vec=S.Matrix([S.Rational(a.numerator,a.denominator)+S.Rational(b.numerator,b.denominator)*rt for a,b in M])
V=S.Matrix(6,6,lambda k,j:lams[j]**k)
w=[S.simplify(z) for z in V.inv()*vec]
assert w==[0,S.Rational(32,15),S.Rational(368,75),S.Rational(16,5),0,S.Rational(32,5)]
assert all(S.simplify(sum(w[j]*lams[j]**k for j in range(6))-vec[k])==0 for k in range(6))
print('Q161BA EXACT PASS: 30 original Q101 ground sources; native dual-face sector weights:',list(zip(lams,w)))

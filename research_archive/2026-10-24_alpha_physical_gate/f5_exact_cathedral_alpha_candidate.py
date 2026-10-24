#!/usr/bin/env python3
"""Exact finite-field 13-cell theorem and no-fit structural alpha candidate.
Physical alpha matching remains open; numerical agreement is NOT its proof.
"""
from itertools import product
import sympy as s
import mpmath as m

F=range(5)
V=sorted({min((i,j),((-i)%5,(-j)%5)) for i,j in product(F,repeat=2) if i or j})
assert len(V)==12
SL2=[(a,b,c,d) for a,b,c,d in product(F,repeat=4) if (a*d-b*c)%5==1]
assert len(SL2)==120
assert len({(a,c) for a,b,c,d in SL2})==24
det=lambda v,w:(v[0]*w[1]-v[1]*w[0])%5
A=s.Matrix(12,12,lambda i,j:int(i!=j and det(V[i],V[j]) in (1,4)))
assert list(A*s.ones(12,1))==[5]*12
assert sum(A)/2==30 and s.trace(A**3)/6==20
x=s.symbols('x')
assert s.factor(A.charpoly(x).as_expr())==(x-5)*(x+1)**5*(x*x-5)**3
L=s.zeros(13);L[0,0]=12
for i in range(12):
 L[0,i+1]=L[i+1,0]=-1
 for j in range(12):L[i+1,j+1]=6*int(i==j)-A[i,j]
expect=x*(x-13)*(x-7)**5*(x*x-12*x+31)**3
assert s.expand(L.charpoly(x).as_expr()-expect)==0
m.mp.dps=60
p=m.pi
O=4*p**3+p**2+p
al=O-1/(24*O)-m.fsum(m.mpf(k+6)/(k+4)*O**(-2*k-1) for k in range(1,32))
print('SL2(F5)=',len(SL2),'spinor orbit=24','vertices=',len(V),'edges=',sum(A)/2,'faces=',s.trace(A**3)/6)
print('ico A characteristic polynomial:',s.factor(A.charpoly(x).as_expr()))
print('Cathedral L13 characteristic polynomial:',s.factor(L.charpoly(x).as_expr()))
print('Omega:',m.nstr(O,48))
print('Conditional structural inverse alpha:',m.nstr(al,48))
print('NO CLAIM of physical Maxwell coefficient derivation')

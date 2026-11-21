#!/usr/bin/env python3
"""Exact original four-cycle and infinite uniform magnetic fourth moment."""
import sympy as s
from collections import Counter
z=s.symbols('z',nonzero=True)
x=s.symbols('x')
A=s.zeros(4)
for i,j,w in ((0,1,1),(0,2,1),(1,3,z),(2,3,1)):
    A[i,j]=w
    A[j,i]=1/s.sympify(w)
L=2*s.eye(4)-A
assert s.cancel(L.charpoly(x).as_expr()-(x**4-8*x**3+20*x**2-16*x+2-z-1/z))==0
walks=Counter()
def visit(X,Y,exponent,n):
    if n==4:
        if X==0 and Y==0: walks[exponent]+=1
        return
    visit(X+1,Y,exponent,n+1)
    visit(X-1,Y,exponent,n+1)
    visit(X,Y+1,exponent+X,n+1)
    visit(X,Y-1,exponent-X,n+1)
visit(0,0,0,0)
assert walks==Counter({0:28,1:4,-1:4}),walks
a4=sum(count*z**exp for exp,count in walks.items())
assert s.cancel(a4-(28+4*z+4/z))==0
l4=4**4+6*4**2*4+a4
assert s.cancel(l4-(668+4*z+4/z))==0
print("PASS: exact original magnetic square charpoly and fourth-moment closed walks")
print("tau_inf(L^4)=",l4)

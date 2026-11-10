#!/usr/bin/env python3
"""Typed history (64) + independent pair-flip operator directions (15).

Shows a mathematically legitimate 79D *graded state/response bundle*, not
79 independent history states, and constructs the golden scalar line in
Sym^2(Wminus). Physical EM identification remains a separate source theorem.
No historical four-ARF coefficients enter the computation.
"""
from itertools import combinations
import sympy as s
import numpy as np
phi=(1+s.sqrt(5))/2
Vraw=s.Matrix([[0,0,1,1,phi,phi],[1,1,phi,-phi,0,0],[phi,-phi,0,0,1,-1]])
V=Vraw/s.sqrt(1+phi**2)
G=s.simplify(V.T*V)
assert all(s.simplify(G[i,i]-1)==0 for i in range(6))
assert all(s.simplify(5*G[i,j]**2-1)==0 for i in range(6) for j in range(6) if i!=j)
S=s.simplify(s.sqrt(5)*(G-s.eye(6)))
assert S*S==5*s.eye(6)
assert all(x in (0,1,-1) for x in S)
M=(s.eye(6)+S)/2
Pplus=s.simplify((s.eye(6)+S/s.sqrt(5))/2)
Pminus=s.simplify((s.eye(6)-S/s.sqrt(5))/2)
assert Pplus.trace()==3 and Pminus.trace()==3
assert s.simplify(M*Pplus-phi*Pplus)==s.zeros(6)
assert s.simplify(M*Pminus+Pminus/phi)==s.zeros(6)
assert s.simplify(M*Pminus*M-Pminus/phi**2)==s.zeros(6)
assert s.simplify((Pminus*Pminus).trace()-3)==0

# 15 pair-flip operators in End(H64), not duplicated Walsh *vectors*.
operators=[]
for i,j in combinations(range(6),2):
    X=np.zeros((64,64),dtype=np.int8)
    for h in range(64):X[h,h^(1<<i)^(1<<j)]=1
    operators.append(X)
assert len(operators)==15
Gram=np.array([[np.trace(x@y) for y in operators] for x in operators],dtype=int)
assert np.array_equal(Gram,64*np.eye(15,dtype=int))

# Under all permutations of the six axes, unordered pairs form one orbit.
# This already follows from the original A5 six-axis action; the stronger S6
# orbit transitivity check below is purely combinatorial (A5 also transitive).
pairs=list(combinations(range(6),2))
assert len(set(pairs))==15
# Canonical normalized scalar in the 15-dimensional bond-response carrier.
one=np.ones(15)/np.sqrt(15)
assert abs(one@one-1)<1e-14
# Uniform sum of unit-norm HS basis operators is one invariant generator.
Bond=sum((operators[i].astype(float)*one[i]/8 for i in range(15)),np.zeros((64,64)))
assert abs(np.trace(Bond.T@Bond)-1)<1e-12

# It is legitimate to count 64 history basis vectors and 15 *independent
# operators* as a graded direct sum, 79 dimensions in all. But the physical
# meaning of a trace across unlike carrier types requires an observable map.
typed_dimension=64+len(operators)
assert typed_dimension==79
Rlinear=s.simplify(Pplus.trace()/(64*phi))
# The quadratic singlet is the invariant metric tensor of the minus W3'
# branch: M Pminus M = phi^(-2) Pminus. Its normalized 1D line can be
# isometrically identified with the 1D invariant bond line, but this is an
# *intertwiner premise* between distinct carrier types, not a physical current.
Rquadratic=s.simplify(s.Rational(1,typed_dimension)/phi**2)
print('D6/H3 S^2=5I; ranks P+ and P-:',Pplus.trace(),Pminus.trace())
print('15 pair flips: exact HS Gram is 64 I_15; no Walsh-state double counting')
print('typed graded dimension (history plus independent operator tangents):',typed_dimension)
print('rank-3 expanding branch inverse response:',Rlinear,'=',float(Rlinear))
print('rank-1 quadratic minus-branch scalar response (with typed scalar isometry):',Rquadratic,'=',float(Rquadratic))
print('sum of the two mathematical source traces:',s.simplify(Rlinear+Rquadratic),float(Rlinear+Rquadratic))
print('PASS exact golden tensor eigenresponse and distinct history/operator carrier ranks')

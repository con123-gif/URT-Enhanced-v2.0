#!/usr/bin/env python3
"""Standalone exact Platonic conditional-Lorentz and metric-memory theorem."""
import sympy as S
from sympy.matrices.dense import GramSchmidt
P=S.eye(5)-S.ones(5)/5
Q=[S.Rational(5,4)*P[:,i]*P[i,:] for i in range(5)]
assert sum(Q,S.zeros(5))==S.Rational(5,4)*P
assert all(q*q==q and q.trace()==1 for q in Q)
g=[P-2*q for q in Q]
for q in g:
    assert q*q==P and q.trace()==2
for i in range(5):
    for j in range(5):
        assert S.trace(g[i]*g[j]) == (4 if i==j else S.Rational(1,4))
mean=sum(g,S.zeros(5))/5
assert mean==P/2
T=S.Rational(3,4)*S.eye(5)+S.ones(5)/20
assert T.eigenvals()=={S.Integer(1):1,S.Rational(3,4):4}
R=S.Matrix(5,5,lambda i,j:S.trace((g[i]-mean)*(g[j]-mean)))
assert R==S.Rational(15,4)*S.eye(5)-S.Rational(3,4)*S.ones(5)
for n in (0,1,2,3,4,5,12):
    cond=sum(((T**n)[j,0]*g[j] for j in range(5)),S.zeros(5))
    assert cond==mean+S.Rational(3,4)**n*(g[0]-mean)
    corr=S.factor(sum((T**n)[j,i]*R[i,j] for i in range(5) for j in range(5))/5)
    assert corr==3*S.Rational(3,4)**n
assert S.Rational(1,2)-S.Rational(3,2)*S.Rational(3,4)**3<0
assert S.Rational(1,2)-S.Rational(3,2)*S.Rational(3,4)**4>0
frame=GramSchmidt([S.sqrt(S.Rational(5,4))*P[:,0],P[:,1],P[:,2],P[:,3]],orthonormal=True)
U=S.Matrix.hstack(*frame)
assert U.T*U==S.eye(4) and U*U.T==P
Z=S.diag(1,-1);X=S.Matrix([[0,1],[1,0]]);J=S.Matrix([[0,1],[-1,0]])
gammas=[S.kronecker_product(J,Z),S.kronecker_product(Z,S.eye(2)),
        S.kronecker_product(X,S.eye(2)),S.kronecker_product(J,J)]
eta=S.diag(-1,1,1,1)
products=S.Matrix.hstack(*[(Q[i]*Q[j]).reshape(25,1) for i in range(5) for j in range(5)])
assert products.rank()==16
for i in range(4):
    for j in range(4):
        assert gammas[i]*gammas[j]+gammas[j]*gammas[i]==2*eta[i,j]*S.eye(4)
    em=U*gammas[i]*U.T
    assert S.Matrix.hstack(products,em.reshape(25,1)).rank()==16
print("EXACT PASS: (-+++) branch metrics, real Cl(3,1), C(n)=3*(3/4)^n")
print("Conditional mean changes signature after four transitions")
print("Not a physical spacetime identification")

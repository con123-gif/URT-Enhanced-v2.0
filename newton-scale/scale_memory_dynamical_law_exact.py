#!/usr/bin/env python3
"""Exact standalone Newton–Platonic scale-memory evolution; SymPy only.
No URT, Cathedral, fitted physics or physical spacetime assumed.
"""
import sympy as S

P=S.eye(5)-S.ones(5)/5
Q=[S.Rational(5,4)*P[:,i]*P[i,:] for i in range(5)]
assert all(q*q==q and q.trace()==1 for q in Q)
assert sum(Q,S.zeros(5))==S.Rational(5,4)*P
M=[S.sqrt(S.Rational(4,5))*q for q in Q]
assert sum((m.T*m for m in M),S.zeros(5))==P

T=S.Matrix(5,5,lambda j,i:S.trace(M[j]*Q[i]*M[j].T))
assert T==S.Rational(3,4)*S.eye(5)+S.ones(5)/20
assert T.eigenvals()=={S.Integer(1):1,S.Rational(3,4):4}
for n in (0,1,2,3,5,12,30):
    assert T**n==S.ones(5)/5+S.Rational(3,4)**n*(S.eye(5)-S.ones(5)/5)

phi=(1+S.sqrt(5))/2
s=S.sqrt((3-S.sqrt(5))/(3+S.sqrt(5)))
assert S.simplify(s-phi**(-2))==0
beta=S.log(S.Rational(4,3))/(2*S.log(phi))
assert S.simplify(S.exp(-beta*2*S.log(phi))-S.Rational(3,4))==0

# Every triangle has a gauge-invariant negative cyclic triple product.
for i in range(5):
  for j in range(5):
    for k in range(5):
      if len({i,j,k})==3:
        assert S.trace(Q[i]*Q[j]*Q[k])==-S.Rational(1,64)

# An S5-equivariant, equally normalized counterexample instrument:
# after outcome i, prepare (I4-Q_i)/3 instead of Q_i.
T_alt=S.Matrix(5,5,lambda j,i:
       S.Rational(4,5)*S.trace(Q[j]*(P-Q[i])/3))
assert T_alt==(S.ones(5)-S.eye(5))/4
assert T_alt.eigenvals()=={S.Integer(1):1,-S.Rational(1,4):4}

# One-outcome pure Kraus output |w_i> gives repeatability
# (4/5)|<v_i,w_i>|^2 <=4/5, saturated only by w_i~v_i.
# This proves uniqueness of the maximal-repeatability update in that class.
print("EXACT PASS: geometry fixes 5-outcome effects and five-state memory law")
print("T = 3/4 I + J/20, T^n=J/5+(3/4)^n(I-J/5)")
print("Newton ratio",S.simplify(s),"log-scale exponent",S.N(beta,16))
print("Triangle cyclic holonomy -1/64, phase pi")
print("Alternative fully symmetric instrument has memory eigenvalue -1/4")
print("Empirical sub-Planck law is not derived: the maximum-repeatability")
print("axiom and event-to-physical-length map require physical validation.")

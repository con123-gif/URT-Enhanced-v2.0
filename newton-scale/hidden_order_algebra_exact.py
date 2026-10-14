#!/usr/bin/env python3
"""Exact hidden operation-order theorem (independent of URT/Cathedral).
Requires sympy. Proves five Platonic simplex projectors generate the full
16-dimensional End(R4); reversal splits 10 symmetric and 6 rotational.
"""
import sympy as S
P=S.eye(5)-S.ones(5)/5
Q=[S.Rational(5,4)*P[:,i]*P[i,:] for i in range(5)]
assert sum(Q,S.zeros(5))==S.Rational(5,4)*P
assert all(q*q==q and q.trace()==1 for q in Q)
p=[Q[i]*Q[j] for i in range(5) for j in range(5)]
s=[Q[i]*Q[j]+Q[j]*Q[i] for i in range(5) for j in range(i,5)]
a=[Q[i]*Q[j]-Q[j]*Q[i] for i in range(5) for j in range(i+1,5)]
columns=lambda items:S.Matrix.hstack(*(v.reshape(25,1) for v in items))
assert columns(p).rank()==16
assert columns(s).rank()==10
assert columns(a).rank()==6
assert columns(s+a).rank()==16
assert columns(s).T*columns(a)==S.zeros(len(s),len(a))
assert set(S.trace(c.T*c) for c in a)=={S.Rational(15,128)}
assert sum((c.T*c for c in a),S.zeros(5))==S.Rational(75,256)*P
assert (columns(a)*columns(a).T).eigenvals()=={
    S.Rational(25,128):6,S.Integer(0):19}
print("EXACT PASS: 25 ordered two-step hidden products span End(H4), dimension 16")
print("Reversal-even symmetric 10 = 1+4+5; reversal-odd rotational 6 = 3+3prime")
print("All ten nonzero commutators form a tight 6D frame, eigenvalue 25/128")
print("Mathematical operator order is NOT uniquely selected physical time")

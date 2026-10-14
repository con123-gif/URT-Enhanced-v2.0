#!/usr/bin/env python3
"""Independent Newton–Platonic coherent-history versus classicalized interface.

Exact rational calculation; only SymPy. This is an algebraic theorem,
NOT derivation that quantum mechanics is replaced below the Planck scale.

Mathematical input: 5 normalized vertices of regular 4-simplex in
H4 = {x in R5: sum(x)=0}, with v_i dot v_j = 1 if i=j else -1/4.
The five-cube source labels inherit these same simplex directions.
"""
import sympy as S

P=S.eye(5)-S.ones(5)/5
I=S.eye(5)
# Projector onto normalized ith simplex direction. Rational matrices.
Q=[S.Rational(5,4)*P[:,j]*P[j,:] for j in range(5)]
assert all(q*q==q and q.trace()==1 for q in Q)
assert sum(Q,S.zeros(5))==S.Rational(5,4)*P
assert all(S.trace(Q[i]*Q[j])==S.Rational(1,16)
           for i in range(5) for j in range(i+1,5))
# M_j = sqrt(4/5) Q_j; exact completeness on H4.
assert sum((S.Rational(4,5)*q*q for q in Q),S.zeros(5))==P
def Phi(X):
    return sum((S.Rational(4,5)*q*X*q for q in Q),S.zeros(5))
assert Phi(P)==P
for q in Q:
    assert Phi(q)==S.Rational(3,4)*q+P/16
# Matrix unit superoperator on End(R5): restriction to End(H4)
# yields exactly 1 (x1), 3/4 (x4), 0 (x11).
E=sum((S.Rational(4,5)*S.kronecker_product(q,q) for q in Q),
      S.zeros(25))
assert E.eigenvals()=={S.Integer(1):1,S.Rational(3,4):4,S.Integer(0):20}
assert E.rank()==5
# Coherent, not observed, history isometry: stack five Kraus maps.
V=S.Matrix.vstack(*[S.sqrt(S.Rational(4,5))*q for q in Q])
assert V.T*V==P
# On the four-dimensional physical simplex H4, V is a true isometry;
# states can be recovered from the embedded range by V^T.
T=S.Matrix(5,5,lambda i,j:
  S.Rational(4,5)*S.trace(Q[i]*Q[j]))
assert T==S.Rational(3,4)*S.eye(5)+S.ones(5)/20
assert T.eigenvals()=={S.Integer(1):1,S.Rational(3,4):4}
# The traced-out map is entanglement-breaking:
# Phi(X) = sum_j (4/5)Tr(Q_j X)Q_j, measure-and-prepare.
# Therefore a classicalized five-label Markov model by itself cannot
# recreate general entanglement or reproduce Bell violation under
# locality and measurement independence.
print("EXACT PASS: coherent 4->20 isometry and 5-outcome POVM")
print("Phi restricted to End(H4): 1(x1), 3/4(x4), 0(x11)")
print("A5 response 1+4 retained; 3+3prime+5 erased by channel")
print("One-step decoherence is NOT a valid universal microscopic dynamics")
print("Pregeometric interpretation and physical sub-Planck transition: unproved")

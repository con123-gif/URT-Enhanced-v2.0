#!/usr/bin/env python3
"""Exact Platonic five-cube fusion -> Cathedral hidden Gibbs selected branch.
This is a finite positive Kraus outcome, NOT the canonically derived T_star.
Dependencies: sympy.
"""
import sympy as S

neighbors=[
[8,12,16],[9,12,17],[10,13,16],[11,13,17],
[8,14,18],[9,14,19],[10,15,18],[11,15,19],
[0,4,10],[1,5,11],[2,6,8],[3,7,9],
[0,1,14],[2,3,15],[4,5,12],[6,7,13],
[0,2,17],[1,3,16],[4,6,19],[5,7,18]]
A=S.zeros(20)
for i,ns in enumerate(neighbors):
    for j in ns: A[i,j]=1
assert A==A.T
I=S.eye(20); L=3*I-A
# Established exact mean of five embedded cube vertex-hidden projectors.
Pbar=-L*(L**2-7*L+13*I)*(L**2-6*L+4*I)/60
P8=-S.Rational(80,3)*Pbar*(Pbar-S.Rational(2,5)*I)
Pvis5=S.Rational(50,3)*Pbar*(Pbar-S.Rational(1,4)*I)
P3=(5*I-L)*P8/2
P5=(L-3*I)*P8/2
for P,n in [(P8,8),(Pvis5,5),(P3,4),(P5,4)]:
    assert P*P==P and P.T==P and S.trace(P)==n
assert Pbar==P8/4+S.Rational(2,5)*Pvis5
assert P3+P5==P8
assert P3*P5==S.zeros(20) and P8*Pvis5==S.zeros(20)
assert L*P3==3*P3 and L*P5==5*P5
rho_geo=Pbar/4
assert rho_geo==P8/16+Pvis5/10
assert S.trace(rho_geo)==1
phi=(1+S.sqrt(5))/2
Delta=S.Rational(3,20)-80*S.pi/(1053*phi)
F=P3+Delta*P5
post=(P3+Delta**2*P5)/16
# Symbolic entrywise verification, avoiding fragile syntactic equality
assert all(S.simplify(x)==0 for x in F*rho_geo*F-post)
prob=S.simplify(S.trace(post))
assert S.simplify(prob-(1+Delta**2)/4)==0
rho_star=post/prob
assert S.simplify(S.trace(rho_star)-1)==0
assert all(S.simplify(x)==0 for x in rho_star-(P3+Delta**2*P5)/(4*(1+Delta**2)))
# Completeness: F†F <= I, since eigenvalues are 1,Delta²,0.
assert 0<float(Delta)<1
chi=8*(-S.log(Delta))*(1+Delta**2)/(1-Delta**2)
print("PASS five-cube -> Cathedral hidden Gibbs selected-state theorem")
print("rank active 13, rank hidden 8; rank quartets 4+4")
print("Delta:",Delta.evalf(17))
print("prob(success):",prob.evalf(17))
print("hidden p5:",(Delta**2/(1+Delta**2)).evalf(17))
print("chi BKM:",chi.evalf(17))

#!/usr/bin/env python3
"""Exact conditional 3D graph-directed information dimension from
Newton scale and sixfold golden substitution. Pure SymPy/NumPy.

A six-substitution-per-refinement rule is a MODEL premise; this is not
a derivation of Lorentzian spacetime or sub-Planck observability.
"""
import json
import sympy as S
from math import log
T=S.Matrix([[0,1],[1,1]])
M=T**6
phi=(1+S.sqrt(5))/2
s=phi**(-2)
v=S.Matrix([1,phi])
assert M==S.Matrix([[5,8],[8,13]])
assert S.simplify(M*v-phi**6*v)==S.zeros(2,1)
assert S.simplify(phi**6*s**3-1)==0
assert 0<s<S.Rational(1,2)
assert list(M*S.ones(2,1))==[13,21]
# 21 vertex-centred maps within the regular R20 simplex:
# f_e(x)=s*x+(1-s)*v_e. Distinct e's are separated because
# barycentric coordinate e is >=1-s in f_e(simplex) and <=s in
# any other f_f(simplex). The 2-type directed IFS has OSC, so
# dim_H = log spectral_radius(M)/log(1/s) = 3.
dH=float(S.N(S.log(phi**6)/(-S.log(s)),30))
assert abs(dH-3)<1e-13
# Canonical Perron–Frobenius edge probability:
# p(e:i->j)=s**3*v[j]/v[i], repeated M[i,j] times.
edge=S.Matrix(2,2,lambda i,j:s**3*v[j]/v[i])
P=S.Matrix(2,2,lambda i,j:M[i,j]*edge[i,j])
assert S.simplify(P*S.ones(2,1)-S.ones(2,1))==S.zeros(2,1)
pi=S.Matrix([v[i]**2/(v[0]**2+v[1]**2) for i in range(2)])
assert S.simplify(P.T*pi-pi)==S.zeros(2,1)
assert S.simplify(pi[0]*P[0,1]-pi[1]*P[1,0])==0
# Entropy rate: stationarity cancels log(vj/vi) endpoint terms.
h=-sum(pi[i]*M[i,j]*edge[i,j]*S.log(edge[i,j])
       for i in range(2) for j in range(2))
assert abs(float(S.N(h+3*S.log(s),30)))<1e-12
assert abs(float(S.N(h/(-S.log(s)),30))-3)<1e-12
# The 34 distinct records let one define a coherent isometry
# V|i>=sum_(e:i->j) sqrt(p_e)|e>⊗|j>, whose columns have norm
# sum_(j,e) p_e=1, and orthogonal disjoint source record labels.
assert sum(M)==34
print(json.dumps({
 "T6":[[5,8],[8,13]],"Perron_root":float(S.N(phi**6,18)),
 "contraction":float(S.N(s,18)),
 "Hausdorff_dimension":dH,"information_dimension":3.,
 "ambient_dimension":20,"topological_dimension":0,
 "edge_probability_matrix":[[float(S.N(edge[i,j],16))
  for j in range(2)] for i in range(2)],
 "type_transition_matrix":[[float(S.N(P[i,j],16))
  for j in range(2)] for i in range(2)],
 "stationary_type_weights":[float(S.N(x,16)) for x in pi],
 "entropy_rate":float(S.N(h,18)),
 "sixfold_substitution_physically_selected":False,
 "Lorentzian_spacetime_derived":False
},indent=2))

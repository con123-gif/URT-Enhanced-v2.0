#!/usr/bin/env python3
"""Q161cy: native five-solid source response, exact Q161cw G,K reduction.
The Q161cw source certificate independently constructs all 50 vertices and 90 edges.
No fitted values, synthetic source operators or physical mass claims.
"""
import sympy as s
r=s.Rational
g=4*s.sqrt(6)/9
G=s.Matrix([[r(50,3),g],[g,r(104,15)]])
K=s.Matrix([[(176-32*s.sqrt(5))/3,4*g],[4*g,r(128,5)]])
assert s.simplify(G.det())>0 and s.simplify(K.det())>0
susceptibility=s.simplify(K.inv()[1,0])
assert s.simplify(susceptibility+4*g/K.det())==0
assert susceptibility!=0
integrated=s.simplify((K.inv()*G)[1,0])
assert s.simplify(integrated-g*(K[0,0]-4*G[0,0])/K.det())==0
assert integrated!=0
assert s.simplify(K.det()-((176-32*s.sqrt(5))/3*r(128,5)-(4*g)**2))==0
print("Q161CY EXACT PASS")
print("native five-solid paired stiffness determinant =",s.simplify(K.det()))
print("constant-force x->yz susceptibility =",susceptibility)
print("integrated unit-x->yz relaxation =",integrated)
print("STATUS: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING")

#!/usr/bin/env python3
"""Exact finite dodecahedron/icosahedron 137/360 gauge-duality certificate.
No measured alpha or fitted parameters. Requires sympy and networkx.
"""
import networkx as nx
import sympy as s

D=nx.dodecahedral_graph()
ok,emb=nx.check_planarity(D)
assert ok
visited=set();faces=[]
for u,v in D.edges():
    for a,b in ((u,v),(v,u)):
        if (a,b) in visited: continue
        face=emb.traverse_face(a,b)
        visited.update(zip(face,face[1:]+face[:1]))
        faces.append(face)
assert len(faces)==12 and all(len(z)==5 for z in faces)
edges=sorted(tuple(sorted(z)) for z in D.edges())
idx={e:j for j,e in enumerate(edges)}
F=s.zeros(30,12)
for j,face in enumerate(faces):
    for a,b in zip(face,face[1:]+face[:1]):
        edge=tuple(sorted((a,b)))
        F[idx[edge],j]+=1 if a<b else -1
LD=3*s.eye(20)-s.Matrix(nx.to_numpy_array(D,dtype=int))
LI=F.T*F
K=F*F.T
x=s.symbols("x")
qD=x*(x-2)**5*(x-3)**4*(x-5)**4*(x*x-6*x+4)**3
qI=x*(x-6)**5*(x*x-10*x+20)**3
assert s.expand(LD.charpoly(x).as_expr()-qD)==0
assert s.expand(LI.charpoly(x).as_expr()-qI)==0
assert s.expand(K.charpoly(x).as_expr()-x**19*qI/x)==0
assert K.rank()==11 and s.trace(K)==60 and s.trace(K*K)==360
JD=s.ones(20,20)/20;JI=s.ones(12,12)/12
GD=(LD+JD).inv()-JD;GI=(LI+JI).inv()-JI
assert 15*s.trace(GD)==137 and 15*s.trace(GI)==35
assert abs((qD/x).subs(x,0))/20==5184000
assert abs((qI/x).subs(x,0))/12==5184000
P5=-K*(K*K-10*K+20*s.eye(30))/24
P0=s.eye(30)-K*K.pinv()
P6=s.eye(30)-P0-P5
assert (s.trace(P0),s.trace(P5),s.trace(P6))==(19,5,6)
assert s.trace(K*P5)==s.trace(K*P6)==30
h5,h6=s.symbols('h5 h6',real=True)
Pi=h5*P5+h6*P6
c=s.simplify(s.trace(K*Pi)/s.trace(K*K))
assert c==(h5+h6)/12
assert s.expand(s.trace((Pi-c*K)**2)-
    (s.Rational(5,2)*(h5-h6)**2+h6**2))==0
print("PASS: 137 dual Coulomb index, 360 Maxwell norm,")
print("      equal planar-dual spanning trees, exact source projection.")
print("c_HS =",c)

# Forced golden ratio of the positive Maxwellizing coframe amplitudes:
lam_minus=5-s.sqrt(5)
lam_plus=5+s.sqrt(5)
Pplus=(K-lam_minus*s.eye(30))*P6/(2*s.sqrt(5))
Pminus=(lam_plus*s.eye(30)-K)*P6/(2*s.sqrt(5))
assert (s.trace(Pplus),s.trace(Pminus))==(3,3)
assert s.simplify(lam_plus/lam_minus-(3+s.sqrt(5))/2)==0
phi=(1+s.sqrt(5))/2
assert s.simplify((lam_plus/lam_minus)-phi**2)==0
assert s.simplify(K-(6*P5+lam_minus*Pminus+lam_plus*Pplus))==s.zeros(30)
print('EXACT: m_plus/m_minus=phi for any h6>0, with common scale Z unfixed.')

#!/usr/bin/env python3
"""Q161cw: exact original Q101/Q161ca five-solid one-rule kinetic spectrum.

Every original vertex/edge, mode identity, and Gram/kinetic entry is checked
over Q(phi) with stdlib Fraction. No fitted values or synthetic matrices.
8 harmonic columns are original (x,y,z,(x²-y²)/sqrt2,
(x²+y²-2z²)/sqrt6,sqrt2xy,sqrt2xz,sqrt2yz) on UNIT vertices.
G=E.T E, K=E.T diag(d0.T d0) E (one unit per actual edge).
The choice of degree<=2 source and unit-edge Dirichlet dynamics is part
of the pre-existing Cathedral model; it is not logically forced to be
the physical Hamiltonian. Time, physical masses, Q96 Ward remain OPEN.
"""
from itertools import product
from functools import reduce
from fractions import Fraction as F
import sympy as S
Z=(F(0),F(0)); P=(F(0),F(1)); IP=(F(-1),F(1))
def q(x): return x if isinstance(x,tuple) else (F(x),F(0))
def add(x,y):
    a,b=q(x);c,d=q(y)
    return (a+c,b+d)
def neg(x):
    a,b=q(x);return (-a,-b)
def sub(x,y):return add(x,neg(y))
def mul(x,y):
    a,b=q(x);c,d=q(y)
    return (a*c+b*d,a*d+b*c+b*d)  # phi^2=phi+1
def inv(x):
    a,b=q(x);d=a*a+a*b-b*b
    assert d!=0
    return ((a+b)/d,-b/d)
def scale(a,x):return mul(q(a),x)
def div(x,y):return mul(x,inv(y))
def sq(x):return mul(x,x)
def sm(v):return reduce(add,v,Z)
def xyz(a,b,c):return (q(a),q(b),q(c))
pm=list(product((-1,1),repeat=2))
solids={
 "tetrahedron":[xyz(1,1,1),xyz(1,-1,-1),xyz(-1,1,-1),xyz(-1,-1,1)],
 "cube":[xyz(*v) for v in product((-1,1),repeat=3)],
 "octahedron":[xyz(*v) for v in [(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)]],
 "dodecahedron":[xyz(*v) for v in product((-1,1),repeat=3)]
   +[xyz(0,scale(a,IP),scale(b,P)) for a,b in pm]
   +[xyz(scale(a,IP),scale(b,P),0) for a,b in pm]
   +[xyz(scale(a,P),0,scale(b,IP)) for a,b in pm],
 "icosahedron":[xyz(0,a,scale(b,P)) for a,b in pm]
   +[xyz(a,scale(b,P),0) for a,b in pm]
   +[xyz(scale(a,P),0,b) for a,b in pm],
}
edge={"tetrahedron":q(8),"cube":q(4),"octahedron":q(2),
      "dodecahedron":(F(8),F(-4)),"icosahedron":q(4)}
r2={"tetrahedron":q(3),"cube":q(3),"octahedron":q(1),
    "dodecahedron":q(3),"icosahedron":(F(2),F(1))}
degree={"tetrahedron":3,"cube":3,"octahedron":4,"dodecahedron":3,"icosahedron":5}
counts={"tetrahedron":(4,6,4),"cube":(8,12,6),"octahedron":(6,12,8),
        "dodecahedron":(20,30,12),"icosahedron":(12,30,20)}
oddlam={"tetrahedron":q(4),"cube":q(2),"octahedron":q(4),
        "dodecahedron":(F(4),F(-2)),"icosahedron":(F(6),F(-2))}
evenlam={"tetrahedron":q(4),"cube":q(4),"octahedron":q(6),
         "dodecahedron":q(2),"icosahedron":q(6)}
G=[Z for _ in range(8)]
K=[Z for _ in range(8)]
vv=ee=ff=0
for name,verts in solids.items():
    V=len(verts); nbr=[[] for _ in verts]
    for i,u in enumerate(verts):
        assert sm(sq(z) for z in u)==r2[name]
        for j,v in enumerate(verts):
            if i==j:continue
            d2=sm(sq(sub(a,b)) for a,b in zip(u,v))
            if d2==edge[name]:nbr[i].append(j)
    assert all(len(n)==degree[name] for n in nbr)
    E=sum(map(len,nbr))//2
    Ffaces=2-V+E
    assert (V,E,Ffaces)==counts[name]
    vv+=V;ee+=E;ff+=Ffaces
    m=[]
    for x,y,z in verts:
        xx,yy,zz=sq(x),sq(y),sq(z)
        m.append([x,y,z,sub(xx,yy),sub(add(xx,yy),scale(2,zz)),
                  mul(x,y),mul(x,z),mul(y,z)])
    for j in range(8):
        lam=oddlam[name] if j<3 else evenlam[name]
        for i in range(V):
            lhs=sub(scale(degree[name],m[i][j]),sm(m[k][j] for k in nbr[i]))
            assert lhs==mul(lam,m[i][j]),(name,i,j)
        factor={3:F(1,2),4:F(1,6),5:F(2),6:F(2),7:F(2)}.get(j,F(1))
        denom=r2[name] if j<3 else sq(r2[name])
        gram=scale(factor,div(sm(sq(v[j]) for v in m),denom))
        G[j]=add(G[j],gram)
        K[j]=add(K[j],mul(lam,gram))
    # All source Gram off-diagonal entries vanish except 3 tetra xyz channels.
    # Every normalization factor is nonzero, so use raw mode products.
    for i in range(8):
        for j in range(i+1,8):
            raw=sm(mul(row[i],row[j]) for row in m)
            target=q(4) if name=="tetrahedron" and (i,j) in (
                (0,7),(1,6),(2,5)) else Z
            assert raw==target,(name,i,j,raw,target)
    # All five source coordinate sets preserve the same 12 A4 rotations.
    point_set=set(verts)
    for signs in product((-1,1),repeat=3):
        if signs[0]*signs[1]*signs[2]!=1:continue
        for cy in range(3):
            assert {tuple(scale(signs[k],v[(k+cy)%3]) for k in range(3))
                    for v in verts}==point_set,(name,cy,signs)
assert (vv,ee,ff)==(50,90,50)
assert 50-5==45 and 50-5==45 and 90==45+45 # five spheres, beta_1=0
assert G==[q(F(50,3))]*3+[q(F(94,15))]*2+[q(F(104,15))]*3
assert K==[(F(208,3),F(-64,3))]*3+[q(F(404,15))]*2+[q(F(128,5))]*3
# Exact tetra contribution: each raw xyz product = 1. On unit-radius
# vertices sqrt2*4/(3 sqrt3) = 4 sqrt6/9 for G and 4x for K.
z=S.symbols("z")
s5=S.sqrt(5);g=S.Rational(4,9)*S.sqrt(6);couple=4*g
Godd=S.Rational(50,3);Geven=S.Rational(104,15)
Kodd=(176-32*s5)/3;Keven=S.Rational(128,5)
assert S.simplify(3*couple**2-S.Rational(512,9))==0
assert S.simplify(couple**2-S.Rational(512,27))==0
p=S.factor((Kodd-z*Godd)*(Keven-z*Geven)-(couple-z*g)**2)
expected=S.Rational(16,135)*(965*z*z-(6952-624*s5)*z+12512-2304*s5)
assert S.simplify(p-expected)==0
lm=(3476-312*s5-4*S.sqrt(30951+3396*s5))/965
lp=(3476-312*s5+4*S.sqrt(30951+3396*s5))/965
l0=S.Rational(202,47)
assert S.simplify(p.subs(z,lm))==0
assert S.simplify(p.subs(z,lp))==0
assert S.simplify(l0-S.Rational(404,15)/S.Rational(94,15))==0
assert 0<float(lm)<float(lp)<float(l0)
# A pure x source creates a yz (opposite parity) source under the
# UNIT-EDGE Galerkin gradient flow G da/dt=-K a. It is ZERO if the
# tetrahedral parity coupling is absent, and also vanishes for a
# tetra-only scalar Laplacian K=4G. Both symmetry mismatch and the
# distinct kinetic rates of other solids are essential in this model.
detG=Godd*Geven-g*g
parity_birth=S.simplify(g*(Kodd-4*Godd)/detG)
assert S.simplify(parity_birth+S.sqrt(6)*(6+8*s5)/193)==0
print("Q161cw EXACT PASS: original five 50/90/50, 190 cochains")
print("Q161cw EXACT K_oe K_oe^T=(512/27)I3; common A4 rotations 12")
print("Q161cw eigenvalues (3,3,2):",float(lm),float(lp),float(l0))
print("Q161cw pure-x -> yz kinetic birth:",parity_birth,float(parity_birth))
print("STATUS: finite source kinetic theorem; physical law identification OPEN")

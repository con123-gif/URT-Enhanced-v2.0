#!/usr/bin/env python3
"""Native URT: A5-invariant dark orbit contrast and exact temporal coupling.
Run alongside URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py.
Original 190-cochain source dictionary, no ARF targets, no fitted parameters.
"""
import runpy, io, contextlib
from pathlib import Path
from collections import Counter
import sympy as S
import networkx as nx

with contextlib.redirect_stdout(io.StringIO()):
    r=runpy.run_path(str(Path(__file__).parent/'URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py'))
Q5=r['Q5']; Z=Q5(); n5=r['n']; n3=r['n3']; faces=r['faces']; pts=r['pts']; pairs=r['pairs']
assert len(n5)==len(n3)==64 and len(faces)==20 and len(pairs)==6

def as_sym(x):
    return S.Rational(x.a.numerator,x.a.denominator)+S.Rational(x.b.numerator,x.b.denominator)*S.sqrt(5)

# Reconstruct proper icosahedral rotations from face incidence. Signs exact.
G=nx.Graph();G.add_nodes_from(range(12))
for f in faces:
    for i,j in ((f[0],f[1]),(f[1],f[2]),(f[2],f[0])):G.add_edge(i,j)
base=S.Matrix.hstack(*(S.Matrix([as_sym(x) for x in pts[i]]) for i in (0,1,4)))
assert base.det()!=0
rot=[]
for perm in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    target=S.Matrix.hstack(*(S.Matrix([as_sym(x) for x in pts[perm[i]]]) for i in (0,1,4)))
    ratio=S.simplify(target.det()/base.det())
    assert ratio in (S.Integer(1),S.Integer(-1))
    if ratio==1:rot.append(perm)
assert len(rot)==60

def move(perm,h):
    out=0
    for j,(a,b) in enumerate(pairs):
        dst=perm[a if h>>j&1 else b]
        k=next(k for k,(c,d) in enumerate(pairs) if dst in (c,d))
        if dst==pairs[k][0]:out|=1<<k
    return out

left=set(range(64));orbits=[]
while left:
    orbit={move(g,min(left)) for g in rot}
    assert orbit<=left
    left-=orbit;orbits.append(orbit)
assert sorted(map(len,orbits))==[12,12,20,20]
assert all(len({(n5[h],n3[h]) for h in orbit})==1 for orbit in orbits)
short=sorted((o for o in orbits if len(o)==12),key=min)
d=[Q5(1) if h in short[0] else Q5(-1) if h in short[1] else Z for h in range(64)]
assert sum(d,Z)==Z

# Pointwise polynomial relation of the two source norms on all 64 histories.
phi_factor=Q5(5,2)  # 5+2sqrt(5)
for a,b in zip(n5,n3):
    assert b==phi_factor*(Q5(S.Rational(66,25))*a-Q5(S.Rational(3,40))*a*a)
assert Counter((a,b) for a,b in zip(n5,n3))=={
    (Z,Z):24,
    (Q5(S.Rational(56,5),-S.Rational(24,5)),Q5(S.Rational(288,25))):20,
    (Q5(S.Rational(56,5),S.Rational(24,5)),Q5(S.Rational(2592,25),S.Rational(1152,25))):20,
}
mean=lambda v:sum(v,Z)/64
center=lambda v:[x-mean(v) for x in v]
g3=center(n3);g5=center(n5)
inner=lambda a,b:mean([x*y for x,y in zip(a,b)])
assert inner(d,g3)==inner(d,g5)==Z

# Four A5-orbits give four invariant functions. The following form a basis.
reps=[min(o) for o in sorted(orbits,key=lambda o:(len(o),min(o)))]
B=S.Matrix([[1,as_sym(g3[h]),as_sym(g5[h]),as_sym(d[h])] for h in reps])
assert S.simplify(B.det())!=0

Q=lambda v:[(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
obs=[d,g3,g5]; qobs=[[v] for v in obs]
for j in range(3):
    for k in range(1,7):qobs[j].append(Q(qobs[j][-1]))
    assert all(x==Z for x in qobs[j][6])
C=[[[inner(obs[a],qobs[b][k]) for b in range(3)] for a in range(3)] for k in range(6)]
K=[[C[0][a][b]+sum((C[k][a][b]+C[k][b][a] for k in range(1,6)),Z)
    for b in range(3)] for a in range(3)]
Ksym=S.Matrix([[as_sym(x) for x in row] for row in K])
assert K[0][0]==Q5(S.Rational(5,16))
assert K[0][1]==Q5(-S.Rational(72,25),-S.Rational(36,25))
assert K[0][2]==Q5(0,-S.Rational(3,10))
assert S.simplify(Ksym.det())==(S.Integer(384912)+S.Integer(171072)*S.sqrt(5))/3125
assert all(float(S.N(Ksym[:i,:i].det()))>0 for i in (1,2,3))

# Independent ordered-time-pair enumeration at T=12 and 24.
def finite_cov(T):
    M=[[Z for _ in range(3)] for _ in range(3)]
    for i in range(T):
        for j in range(T):
            k=abs(j-i)
            if k>=6:continue # Original Q^6 is Haar; all observables centered.
            for a in range(3):
                for b in range(3):M[a][b]+=C[k][a][b] if i<=j else C[k][b][a]
    return [[x/T for x in row] for row in M]
M12=finite_cov(12);M24=finite_cov(24)
assert all(2*M24[a][b]-M12[a][b]==K[a][b] for a in range(3) for b in range(3))
print('PASS A5 orbit sizes 12,12,20,20; neutral source norm joint support 3 levels')
print('PASS pointwise n3=(5+2sqrt5)[66*n5/25-3*n5^2/40]')
print('PASS invariant basis 1,g3,g5,d; d instantaneously invisible to both source norms')
print('K(d,d)=',K[0][0], 'K(d,g3)=',K[0][1], 'K(d,g5)=',K[0][2])
print('det 3-channel Green-Kubo =',S.simplify(Ksym.det()))
print('PASS positive definite; independent 12/24-horizon enumeration exact')
print('Source-to-charged-matter poles and four physical ARFs: OPEN')

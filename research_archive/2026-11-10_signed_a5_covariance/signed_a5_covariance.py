#!/usr/bin/env python3
"""Q11 exact signed A5 covariance for native 64-history icosahedral source.

Rebuilds the icosahedral output of the archived five-solid 50->8->12
pullback, hidden P5, five A4 singlets, and Q6 chronology. All checks exact
in Q(sqrt(5)) and rational arithmetic; no fitted or measured inputs.

Important distinction: a *joint* rotation transports the signed axes AND
vacuum. It does not imply that Q commutes with an active signed axis rotation.
"""
from fractions import Fraction as F
from itertools import combinations, product
import json
import networkx as nx
import sympy as sp

class K:
    __slots__ = ('a','b')
    def __init__(self,a=0,b=0):
        if isinstance(a,K): self.a,self.b=a.a,a.b
        else: self.a,self.b=F(a),F(b)
    def __add__(self,y):
        y=K(y);return K(self.a+y.a,self.b+y.b)
    __radd__=__add__
    def __neg__(self):return K(-self.a,-self.b)
    def __sub__(self,y):return self+-K(y)
    def __rsub__(self,y):return K(y)-self
    def __mul__(self,y):
        y=K(y);return K(self.a*y.a+5*self.b*y.b,self.a*y.b+self.b*y.a)
    __rmul__=__mul__
    def __truediv__(self,y):
        y=K(y);d=y.a*y.a-5*y.b*y.b
        assert d
        return K((self.a*y.a-5*self.b*y.b)/d,(self.b*y.a-self.a*y.b)/d)
    def __eq__(self,y):
        y=K(y);return (self.a,self.b)==(y.a,y.b)
    def __repr__(self):return f'{self.a}+({self.b})sqrt(5)'

Z,PHI=K(0),K(F(1,2),F(1,2))
pts=([(Z,K(a),K(b)*PHI) for a,b in product((-1,1),repeat=2)]
    +[(K(a),K(b)*PHI,Z) for a,b in product((-1,1),repeat=2)]
    +[(K(a)*PHI,Z,K(b)) for a,b in product((-1,1),repeat=2)])
def inner(a,b):return sum((x*y for x,y in zip(a,b)),Z)
def determinant(vs):
    a,b,c=vs
    return a[0]*(b[1]*c[2]-b[2]*c[1])-a[1]*(b[0]*c[2]-b[2]*c[0])+a[2]*(b[0]*c[1]-b[1]*c[0])
edges=[(i,j) for i,j in combinations(range(12),2)
       if inner([x-y for x,y in zip(pts[i],pts[j])],
                [x-y for x,y in zip(pts[i],pts[j])])==4]
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(edges)
faces=[tuple(t) for t in combinations(range(12),3)
       if all(G.has_edge(i,j) for i,j in combinations(t,2))]
assert (len(edges),len(faces))==(30,20)
faceid={frozenset(f):i for i,f in enumerate(faces)}
pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining)
    antipodes=[j for j in sorted(remaining-{i})
               if all(x+y==Z for x,y in zip(pts[i],pts[j]))]
    assert len(antipodes)==1
    j=antipodes[0];pairs.append((i,j));remaining.remove(i);remaining.remove(j)
assert len(pairs)==6
pair_lookup={v:i for i,p in enumerate(pairs) for v in p}
C=sp.zeros(20,12)
for i,f in enumerate(faces):
    for v in f:C[i,v]=1
A=sp.zeros(20,20)
for i,j in combinations(range(20),2):
    if len(set(faces[i])&set(faces[j]))==2:A[i,j]=A[j,i]=1
L=3*sp.eye(20)-A
H=sp.eye(20)-C*(C.T*C).inv()*C.T
P5=H*(L-3*sp.eye(20))/2
assert P5*P5==P5 and P5.trace()==4
base=determinant([pts[i] for i in (0,4,8)])
proper=[]
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    g=tuple(m[i] for i in range(12))
    det=determinant([pts[g[i]] for i in (0,4,8)])
    assert det==base or det==-base
    if det==base:proper.append(g)
proper=sorted(proper)
assert len(proper)==60
identity=tuple(range(12))
compose=lambda g,h:tuple(g[h[i]] for i in range(12))
def inverse(g):return tuple(g.index(i) for i in range(12))
invol=[g for g in proper if g!=identity and compose(g,g)==identity]
subgroups={frozenset((identity,a,b,compose(a,b))) for a in invol for b in invol
           if a!=b and compose(a,b)==compose(b,a)}
assert len(subgroups)==5
subgroups=sorted(subgroups,key=lambda v:tuple(sorted(v)))
lookup={v:i for i,v in enumerate(subgroups)}

# The archived quartic native face source (no random matrix or test source).
Den=PHI+2
src=[]
for h in range(64):
    u=[Z,Z,Z]
    for i,(a,b) in enumerate(pairs):
        sign=1 if h&(1<<i) else -1
        for j in range(3):u[j]+=sign*pts[a][j]
    norm=inner(u,u)/Den
    aa=[];bb=[]
    for pt in pts:
        d=inner(pt,u)/Den
        aa.append(K(F(5,16))*(d*d-norm/3));bb.append(d/2)
    row=[]
    for face in faces:
        x=sum((aa[i] for i in face),Z)
        y=sum((bb[i] for i in face),Z)
        row.append(x*x+y*y/2)
    src.append(row)

def mean(v):return sum(v,Z)/64
def q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def k2(v,r2):
    assert mean(v)==Z
    total=mean([x*x for x in v]);cur=v
    for d in range(1,6):
        cur=q(cur);total+=2*mean([x*y for x,y in zip(v,cur)])
    assert q(cur)==[Z]*64
    return total/r2

vacua=[]
for subgroup in subgroups:
    norm=[g for g in proper
          if frozenset(compose(compose(g,x),inverse(g)) for x in subgroup)==subgroup]
    assert len(norm)==12
    av=sp.zeros(20,20)
    for g in norm:
        for i,f in enumerate(faces):av[faceid[frozenset(g[x] for x in f)],i]+=sp.Rational(1,12)
    proj=P5*av*P5
    assert proj*proj==proj and proj.trace()==1
    col=next(proj[:,i] for i in range(20) if proj[:,i]!=sp.zeros(20,1))
    t=[K(F(int(x.p),int(x.q))) for x in col]
    r2=sum((x*x for x in t),Z)
    assert r2.b==0 and r2.a>0
    scalar=[sum((t[j]*src[h][j] for j in range(20)),Z) for h in range(64)]
    vacua.append((t,r2,scalar,k2(scalar,r2)))
expected=sorted([F(67,48),F(33,16),F(25,24),F(33,16),F(5,6)])
assert sorted(v[3].a for v in vacua)==expected
assert all(v[3].b==0 for v in vacua)

# A proper rotation acts on each signed antipodal axis by (permutation, flip).
# Transport each A4 subgroup by conjugation, not by an unsigned label guess.
def action(g):
    target=[];flips=[]
    for i,(a,b) in enumerate(pairs):
        j=pair_lookup[g[a]]
        target.append(j)
        flips.append(0 if g[a]==pairs[j][0] else 1)
    assert sorted(target)==list(range(6))
    def T(h):
        out=0
        for i,j in enumerate(target):
            bit=((h>>i)&1)^flips[i]
            out|=bit<<j
        return out
    fperm=[faceid[frozenset(g[v] for v in f)] for f in faces]
    vperm=[]
    for subgroup in subgroups:
        target_subgroup=frozenset(compose(compose(g,x),inverse(g)) for x in subgroup)
        vperm.append(lookup[target_subgroup])
    assert sorted(vperm)==list(range(5))
    return T,tuple(target),tuple(flips),fperm,vperm

covariance_checks=0
active_Q_commuting=[]
first_noncommuting=None
for g in proper:
    T,axes,flips,fperm,vperm=action(g)
    # Check signed history permutation and exact 20-face nonlinear source law.
    assert len({T(h) for h in range(64)})==64
    for h in range(64):
        sh=src[h];st=src[T(h)]
        assert all(sh[i]==st[fperm[i]] for i in range(20)),(g,h)
    # A4 vacuum projector lines are equivariant. Their arbitrary rational
    # column normalizations need not agree; infer the exact scalar c.
    for i,(t,r2,scalar,base_rate) in enumerate(vacua):
        t2,r22,scalar2,_=vacua[vperm[i]]
        moved=[Z]*20
        for j,k in enumerate(fperm):moved[k]=t[j]
        pivot=next(j for j in range(20) if moved[j]!=Z)
        c=t2[pivot]/moved[pivot]
        assert all(t2[j]==c*moved[j] for j in range(20)),(g,i)
        assert r22==c*c*r2
        transformed=[scalar2[T(h)] for h in range(64)]
        assert all(transformed[h]==c*scalar[h] for h in range(64)),(g,i)
        assert k2(transformed,r22)==base_rate,(g,i)
        covariance_checks+=1
    # A5 is not a symmetry of Q with *fixed* bit coordinates: check all 64
    # successor sets, not just a numerical commutator norm.
    commutes=all({T(2*h%64),T((2*h+1)%64)}==
                 {2*T(h)%64,(2*T(h)+1)%64} for h in range(64))
    if commutes:active_Q_commuting.append(g)
    elif first_noncommuting is None:
        witness=next(h for h in range(64)
                     if {T(2*h%64),T((2*h+1)%64)}!=
                        {2*T(h)%64,(2*T(h)+1)%64})
        first_noncommuting={"vertex_rotation":list(g),"axis_target":list(axes),
             "sign_flips":list(flips),"history":witness,
             "T_of_successors":sorted([T(2*witness%64),T((2*witness+1)%64)]),
             "successors_of_T":sorted([2*T(witness)%64,(2*T(witness)+1)%64])}
assert covariance_checks==60*5
assert len(active_Q_commuting)==1 and active_Q_commuting[0]==identity
assert first_noncommuting is not None
result={"result":"THEOREM (joint signed A5 covariance); OBSTRUCTION (fixed-Q active A5)",
 "rotations":len(proper),"joint_covariant_vacuum_tests":covariance_checks,
 "source_face_equalities":len(proper)*64*20,
 "native_k2_multiset":[str(x) for x in expected],
 "A5_rotations_commuting_with_fixed_Q":len(active_Q_commuting),
 "noncommuting_exact_witness":first_noncommuting,
 "scope":"native icosahedral output of archived five-solid pullback; signed six-axis and A4 vacuum transported together; Q fixed only for the active test",
 "physical_ARFs":"not derived"}
print(json.dumps(result,indent=2,sort_keys=True))

#!/usr/bin/env python3
"""Q8 independent exact native five-vacuum K2 certificate."""
from fractions import Fraction as F
from itertools import combinations, product
import networkx as nx
import sympy as sp

class K:
    __slots__=("a","b")
    def __init__(self,a=0,b=0):
        if isinstance(a,K): self.a,self.b=a.a,a.b
        else: self.a,self.b=F(a),F(b)
    def __add__(self,y):
        y=K(y); return K(self.a+y.a,self.b+y.b)
    __radd__=__add__
    def __neg__(self): return K(-self.a,-self.b)
    def __sub__(self,y): return self+-K(y)
    def __rsub__(self,y): return K(y)-self
    def __mul__(self,y):
        y=K(y); return K(self.a*y.a+5*self.b*y.b,self.a*y.b+self.b*y.a)
    __rmul__=__mul__
    def __truediv__(self,y):
        y=K(y);d=y.a*y.a-5*y.b*y.b
        assert d!=0
        return K((self.a*y.a-5*self.b*y.b)/d,(self.b*y.a-self.a*y.b)/d)
    def __eq__(self,y):
        y=K(y);return (self.a,self.b)==(y.a,y.b)
    def __repr__(self): return f"{self.a}+({self.b})sqrt(5)"
Z, PHI=K(0),K(F(1,2),F(1,2))
pts=([(Z,K(a),K(b)*PHI) for a,b in product((-1,1),repeat=2)]
    +[(K(a),K(b)*PHI,Z) for a,b in product((-1,1),repeat=2)]
    +[(K(a)*PHI,Z,K(b)) for a,b in product((-1,1),repeat=2)])
def inner(a,b):return sum((x*y for x,y in zip(a,b)),Z)
def determinant(vs):
    a,b,c=vs
    return (a[0]*(b[1]*c[2]-b[2]*c[1])-a[1]*(b[0]*c[2]-b[2]*c[0])+a[2]*(b[0]*c[1]-b[1]*c[0]))
assert len(pts)==12
edges=[(i,j) for i,j in combinations(range(12),2)
    if inner([x-y for x,y in zip(pts[i],pts[j])],[x-y for x,y in zip(pts[i],pts[j])])==4]
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(edges)
faces=[tuple(q) for q in combinations(range(12),3) if all(G.has_edge(i,j) for i,j in combinations(q,2))]
assert (len(edges),len(faces))==(30,20)
faceid={frozenset(f):i for i,f in enumerate(faces)}
pairs=[];rem=set(range(12))
while rem:
    i=min(rem);match=[j for j in sorted(rem-{i}) if all(x+y==Z for x,y in zip(pts[i],pts[j]))]
    assert len(match)==1
    j=match[0];pairs.append((i,j));rem.remove(i);rem.remove(j)
assert len(pairs)==6
C=sp.zeros(20,12)
for k,f in enumerate(faces):
    for i in f:C[k,i]=1
A=sp.zeros(20,20)
for i,j in combinations(range(20),2):
    if len(set(faces[i])&set(faces[j]))==2:A[i,j]=A[j,i]=1
L=3*sp.eye(20)-A
H=sp.eye(20)-C*(C.T*C).inv()*C.T
P5=H*(L-3*sp.eye(20))/2
assert P5*P5==P5 and P5.trace()==4 and H*H==H
base=determinant([pts[i] for i in (0,4,8)]);assert base!=Z
proper=[]
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    perm=tuple(m[i] for i in range(12))
    d=determinant([pts[perm[i]] for i in (0,4,8)])
    assert d==base or d==-base
    if d==base:proper.append(perm)
assert len(proper)==60
compose=lambda a,b:tuple(a[b[i]] for i in range(12))
e=tuple(range(12))
invol=[a for a in proper if a!=e and compose(a,a)==e]
V={frozenset((e,a,b,compose(a,b))) for a in invol for b in invol if a!=b and compose(a,b)==compose(b,a)}
assert len(V)==5
def inverse(g):return tuple(g.index(i) for i in range(12))
Den=PHI+2
src=[]
for h in range(64):
    u=[Z,Z,Z]
    for i,(a,b) in enumerate(pairs):
        s=1 if h&(1<<i) else -1
        for j in range(3):u[j]+=s*pts[a][j]
    norm=inner(u,u)/Den
    aa=[];bb=[]
    for pt in pts:
        d=inner(pt,u)/Den
        aa.append(K(F(5,16))*(d*d-norm/3));bb.append(d/2)
    row=[]
    for face in faces:
        x=sum((aa[i] for i in face),Z);y=sum((bb[i] for i in face),Z)
        row.append(x*x+y*y/2)
    src.append(row)
def q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def mean(v):return sum(v,Z)/64
rates=[]
vacua=[]
for subgroup in V:
    norm=[g for g in proper if frozenset(compose(compose(g,x),inverse(g)) for x in subgroup)==subgroup]
    assert len(norm)==12
    av=sp.zeros(20,20)
    for g in norm:
        for i,f in enumerate(faces):av[faceid[frozenset(g[x] for x in f)],i]+=sp.Rational(1,12)
    one=P5*av*P5
    assert one*one==one and one.trace()==1
    col=next(one[:,i] for i in range(20) if one[:,i]!=sp.zeros(20,1))
    t=[K(F(int(x.p),int(x.q))) for x in col]
    r2=sum((x*x for x in t),Z);assert r2.b==0 and r2.a>0
    g=[sum((t[j]*src[h][j] for j in range(20)),Z) for h in range(64)]
    assert mean(g)==Z
    cg=g;raw=mean([x*x for x in g])
    for _ in range(1,6):
        cg=q(cg);raw+=2*mean([x*y for x,y in zip(g,cg)])
    cg=q(cg)
    assert cg==[Z]*64
    k2=raw/r2
    vacua.append((g,r2))
    assert k2.b==0
    rates.append(k2.a)
rates.sort()
expected=sorted([F(67,48),F(33,16),F(25,24),F(33,16),F(5,6)])
assert rates==expected,(rates,expected)
assert sum(rates)/5==F(71,48)
print("Q8 independent exact native K2:",", ".join(map(str,rates)))
print("A5 mean:",sum(rates)/5)
print("Certificate executed: exact geometry, five A4 projectors, Q^6; physical ARFs not derived")

# Q10: quotient S6 by the proper icosahedral A5 action on six unordered
# antipodal axes. The sign convention is frozen (first member of each pair).
from itertools import permutations
import json

pair_lookup={v:i for i,pair in enumerate(pairs) for v in pair}
actions={tuple(pair_lookup[g[a]] for a,b in pairs) for g in proper}
assert len(actions)==60
assert len({tuple(a[p[i]] for i in range(6)) for a in actions for p in [tuple(range(6))]})==60
all_orders=set(permutations(range(6)))
orbits=[]
while all_orders:
    p=min(all_orders)
    orbit={tuple(a[p[i]] for i in range(6)) for a in actions}
    assert len(orbit)==60 and orbit<=all_orders
    all_orders-=orbit
    orbits.append((p,orbit))
assert len(orbits)==12 and sum(len(v) for _,v in orbits)==720

def permute_bits(h,order):
    out=0
    for i,axis in enumerate(order):
        if (h>>i)&1: out |= 1<<axis
    return out

def k2_for_order(order):
    idx=[permute_bits(h,order) for h in range(64)]
    output=[]
    for g,r2 in vacua:
        f=[g[j] for j in idx]
        assert mean(f)==Z
        var=mean([x*x for x in f])
        step=f
        for d in range(1,6):
            step=q(step)
            var+=2*mean([x*y for x,y in zip(f,step)])
        assert q(step)==[Z]*64
        val=var/r2
        assert val.b==0, (order,val)
        output.append(val.a)
    return tuple(sorted(output))

records=[]
values={}
for no,(rep,orbit) in enumerate(orbits):
    v=k2_for_order(rep)
    assert len(v)==5
    records.append({'index':no+1,'order':list(rep),'five_K2':[str(x) for x in v]})
    values.setdefault(v,[]).append(rep)

print('Q10: 12 unsigned A5 classes, 60 orders each')
print('Distinct representative spectra:',len(values))
for record in records:print(record)
collisions=[[list(v) for v in orders] for orders in values.values() if len(orders)>1]
print('Representative collisions:',collisions)

# Exhaust all 720 unsigned orders as an additional exact ambiguity check.
# Bare unsigned A5 relabeling is NOT a covariance of the fixed-endpoint
# sign dictionary: geometrical A5 rotations would also transport signs.
all_spectra=set()
within_counts=[]
for rep,orbit in orbits:
    orbit_spectra={k2_for_order(p) for p in orbit}
    within_counts.append(len(orbit_spectra))
    all_spectra.update(orbit_spectra)
assert len(all_spectra)==44, len(all_spectra)
assert within_counts==[8,8,10,7,8,10,10,8,7,10,8,8],within_counts
p0=(0,1,2,3,4,5)
p1=(0,5,4,2,1,3)
assert p0 in orbits[0][1] and p1 in orbits[0][1]
assert k2_for_order(p0)!=k2_for_order(p1)
assert k2_for_order(p1)==tuple(sorted([F(299,240),F(121,60),
                                       F(649,240),F(649,240),F(103,30)]))
print('All 720 unsigned orders: 44 different fixed-endpoint K2 multisets')
print('Within-class multiplicities:',within_counts)
print('Same unsigned A5 class but different fixed-sign K2:',p0,p1)
# Independently cross-check all 60 group elements on each axis permutation:
assert all(len(orbit)==60 for _,orbit in orbits)
# Output counts and explicit exact rational witnesses. The spectra are those
# of the lexicographically canonical unsigned representative, NOT an assertion
# that all members of the same orbit have identical spectra when signs are fixed.
result={'classes':12,'orders_per_class':60,'distinct_representative_spectra':len(values),
        'representatives':records,
        'collisions':collisions,
        'distinct_all_720_orders':len(all_spectra),
        'within_unsigned_A5_class_distinct_counts':within_counts,
        'within_class_counterexample':{'first':list(p0),'second':list(p1),
             'first_K2':[str(x) for x in k2_for_order(p0)],
             'second_K2':[str(x) for x in k2_for_order(p1)]},
        'scope':'fixed positive endpoint per axis; unsigned A5 permutations alone do not preserve K2 without induced sign transport',
        'physical_ARFs':'not derived'}
print('RESULT_JSON='+json.dumps(result,sort_keys=True))

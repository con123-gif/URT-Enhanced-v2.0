#!/usr/bin/env python3
"""Q15 exact K2/K3 audit, using archived native Q11/Q12 source, not a stand-in."""
from collections import Counter,defaultdict
from contextlib import redirect_stdout
from fractions import Fraction as F
from io import StringIO
from math import comb
from pathlib import Path
import json,runpy

q12=Path(__file__).resolve().parents[1]/'2026-11-10_signed_dictionary_classes'/'signed_dictionary_classes.py'
assert q12.is_file(),q12
with redirect_stdout(StringIO()): ns=runpy.run_path(str(q12))
ints,reps,actions,transform=(*(ns[k] for k in ('ints','reps','actions','transform')),)
K,Z=ns['K'],ns['Z']
index=ns.get('history_index',ns.get('idx'))
assert len(reps)==768 and len(actions)==60 and len(ints)==5
scale=60

def add(x,y):return x[0]+y[0],x[1]+y[1]
def mul(x,y):
    a,b=x;c,d=y
    return a*c+5*b*d,a*d+b*c
def qsum(v):return [add(v[(2*h)%64],v[(2*h+1)%64]) for h in range(64)]
def qpowers(v,n=5):
    out=[v]
    for _ in range(n):out.append(qsum(out[-1]))
    return out
def dot(v,w):
    a=b=0
    for x,y in zip(v,w):
        c,d=mul(x,y);a+=c;b+=d
    return a,b

def rates(v,r2,raw=False):
    """Exact stationary K2/r2 and K3²/r2³ for fixed Q6.

    Integer pair x=(a,b) denotes a+b sqrt(5), and v=60*g.
    Weighted Q^d sums have denominator 2^d; Q^6 g=0.
    """
    assert len(v)==64
    qv=qpowers(v,6)
    assert qv[6]==[(0,0)]*64
    v2=[mul(x,x) for x in v]
    qv2=qpowers(v2)
    n2=[0,0]
    for d in range(6):
        a,b=dot(v,qv[d]);fac=(1 if d==0 else 2)*(32//(1<<d))
        n2[0]+=fac*a;n2[1]+=fac*b
    k2=K(F(n2[0],64*32*scale**2),F(n2[1],64*32*scale**2))/r2
    assert k2.b==0
    v3=[mul(x,y) for x,y in zip(v,v2)]
    n3=[sum(x[i] for x in v3)*1024 for i in (0,1)]
    for d in range(1,6):
        a,b=dot(v2,qv[d]);c,e=dot(v,qv2[d]);fac=3*(1024//(1<<d))
        n3[0]+=fac*(a+c);n3[1]+=fac*(b+e)
    for e in range(1,6):
        ve=[mul(x,y) for x,y in zip(v,qv[e])]
        qe=qpowers(ve)
        for d in range(1,6):
            a,b=dot(v,qe[d]);fac=6*(1024//(1<<(d+e)))
            n3[0]+=fac*a;n3[1]+=fac*b
    k3=K(F(n3[0],64*1024*scale**3),F(n3[1],64*1024*scale**3))
    i3=k3*k3/(r2*r2*r2)
    return (k2,i3,k3) if raw else (k2,i3)

def idx(D):
    return [index(h,D) for h in range(64)] if index.__name__=='history_index' else index(D)

def signature(D):
    ix=idx(D)
    return tuple(sorted((a.a,a.b,b.a,b.b) for line,r2 in ints
                        for a,b in [rates([line[j] for j in ix],r2)]))

D0=(0,2,4,6,8,10);D1=(0,2,5,6,9,11)
for D,sign in ((D0,-1),(D1,+1)):
    sig=signature(D)
    assert sorted(x[0] for x in sig)==sorted([F(5,6),F(25,24),F(67,48),F(33,16),F(33,16)])
    witness=next(K(x[2],x[3]) for x in sig if x[0]==F(25,24) and x[1]==0)
    assert witness==K(F(4823127,1024000),F(sign*41811,256000))

# Independent finite-time tilted transfer: K3(25)-K3(24) = stationary K3.
def finite_k3(g,n):
    powers=[[K(1)]*64]
    for _ in range(3):powers.append([a*b for a,b in zip(powers[-1],g)])
    v=[[K(1)]*64]+[[Z]*64 for _ in range(3)]
    for _ in range(n):
        qv=[[(x[(2*h)%64]+x[(2*h+1)%64])/2 for h in range(64)] for x in v]
        v=[[sum((comb(k,j)*powers[j][h]*qv[k-j][h] for j in range(k+1)),Z)
            for h in range(64)] for k in range(4)]
    m=[sum(x,Z)/64 for x in v]
    return m[3]-3*m[2]*m[1]+2*m[1]*m[1]*m[1]
for D in (D0,D1):
    ix=idx(D)
    for line,r2 in ints:
        v=[line[j] for j in ix]
        _,_,raw=rates(v,r2,raw=True)
        g=[K(F(a,scale),F(b,scale)) for a,b in v]
        assert finite_k3(g,25)-finite_k3(g,24)==raw

# Joint source/vacuum covariance: the signature is invariant under A5.
for D in (reps[0],reps[17],reps[257],reps[-1]):
    assert {signature(transform(D,a)) for a in actions}=={signature(D)}

sigs=defaultdict(list)
for D in reps:sigs[signature(D)].append(D)
counts=Counter(map(len,sigs.values()))
repset=set(reps)
for D in reps:
    other=min(transform(tuple(x^1 for x in D),a) for a in actions)
    assert other in repset and other!=D
    assert signature(D)==signature(other)
assert len(sigs)==96 and counts==Counter({8:96})
nonparity_pairs=sum((n//2)*(n//2-1)//2 for n in counts.elements())
assert nonparity_pairs==576
witness=None
for sig,group in sigs.items():
    if len(group)>2:
        D=group[0];partner=min(transform(tuple(x^1 for x in D),a) for a in actions)
        E=next(x for x in group if x not in (D,partner))
        witness=[list(D),list(E)]
        assert signature(D)==signature(E)
        break
assert witness is not None
print(json.dumps({'result':'OBSTRUCTION: 96 exact joint K2/I3 signatures for 768 proper-A5 classes',
 'proper_A5_classes':len(reps),'distinct_joint_signatures':len(sigs),
 'multiplicity_distribution':{str(k):v for k,v in sorted(counts.items())},
 'central_inversion_classes':384,'nonparity_collision_pairs':nonparity_pairs,
 'nonparity_collision_witness':witness,
 'Q14_witnesses':[str(next(K(x[2],x[3]) for x in signature(D) if x[0]==F(25,24) and x[1]==0)) for D in (D0,D1)],
 'finite_time_24_to_25':'exact 10/10','physical_ARFs':'not derived'},indent=2,sort_keys=True))

#!/usr/bin/env python3
"""Exact icosahedral A5 action on 64 signed six-axis URT histories.

Constructs the 12 A5/C5 icosahedral vertices and antipodal involution from
normalizer(C5), then 64 choices of one vertex from each opposite pair.
Derives A5 characters on Walsh weight eigenspaces of native
H64=15I-sum_{i<j} X_i X_j, and checks the unaveraged six-bit dyadic Markov
kernel Q. All counts and projector characters are integer-exact.
"""
from itertools import permutations,combinations
import numpy as np
import sympy as sp

def parity(p):return sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))%2
def mul(p,q):return tuple(p[q[i]] for i in range(5))
def inv(p):return tuple(p.index(i) for i in range(5))
I=tuple(range(5))
def power(p,k):
    a=I
    for _ in range(k):a=mul(a,p)
    return a
G=[p for p in permutations(range(5)) if parity(p)==0]
assert len(G)==60
order={g:next(n for n in (1,2,3,5) if power(g,n)==I) for g in G}
classes=[];unused=set(G)
while unused:
    a=min(unused);cl={mul(mul(h,a),inv(h)) for h in G}
    classes.append(cl);unused-=cl
classes.sort(key=lambda c:(min(order[g] for g in c),min(c)))
assert [len(c) for c in classes]==[1,15,20,12,12]
clidx={g:i for i,c in enumerate(classes) for g in c}
phi=(1+sp.sqrt(5))/2;phib=(1-sp.sqrt(5))/2
chars={
    '1':[1,1,1,1,1],
    '3':[3,-1,0,phi,phib],
    "3'":[3,-1,0,phib,phi],
    '4':[4,0,1,-1,-1],
    '5':[5,1,-1,0,0],
}
clsz=[1,15,20,12,12]
def dec(ch):
    ans={name:sp.simplify(sum(sp.Integer(clsz[i])*ch[i]*v[i] for i in range(5))/sp.Integer(60)) for name,v in chars.items()}
    assert all(a.is_Integer and a>=0 for a in ans.values()),ans
    return ans
cycle=(1,2,3,4,0);H={power(cycle,j) for j in range(5)}
cosets=sorted({frozenset(mul(g,h) for h in H) for g in G},key=lambda c:min(c))
assert len(cosets)==12
idx={c:i for i,c in enumerate(cosets)}
perms12=[[idx[frozenset(mul(g,h) for h in c)] for c in cosets] for g in G]
normalizer=[g for g in G if {mul(mul(g,h),inv(g)) for h in H}==H]
assert len(normalizer)==10
n=next(g for g in normalizer if g not in H and order[g]==2)
opposite=[idx[frozenset(mul(mul(min(c),n),h) for h in H)] for c in cosets]
assert all(opposite[opposite[i]]==i and opposite[i]!=i for i in range(12))
for p in perms12:
    assert all(p[opposite[i]]==opposite[p[i]] for i in range(12))
pairs=[];seen=set()
for i in range(12):
    if i not in seen:
        pairs.append((i,opposite[i]));seen.update(pairs[-1])
assert len(pairs)==6
sets=[frozenset(pair[(mask>>k)&1] for k,pair in enumerate(pairs)) for mask in range(64)]
index={x:i for i,x in enumerate(sets)}
assert len(index)==64
perms64=[]
for p in perms12:
    q=[index[frozenset(p[i] for i in ss)] for ss in sets]
    assert sorted(q)==list(range(64))
    perms64.append(q)

# 64 signed-history character, H13 character, abstract H51 complement.
chi64=[]
for cl in classes:
    vals={sum(perms64[G.index(g)][i]==i for i in range(64)) for g in cl}
    assert len(vals)==1
    chi64.append(vals.pop())
assert chi64==[64,0,4,4,4]
chi13=[13,1,1,3,3]
chi51=[a-b for a,b in zip(chi64,chi13)]
assert dec(chi64)=={'1':4,'3':4,"3'":4,'4':4,'5':4}
assert dec(chi51)=={'1':2,'3':3,"3'":3,'4':4,'5':3}

# Full charged H13⊕H51 symmetric Weyl-pair representation (conditional on
# a uniform charge-one Weyl assignment to the entire 64-carrier).
# Sym²(A⊕B)=Sym² A ⊕ (A⊗B) ⊕ Sym² B.
square_classes=[0,0,2,4,3]
def symchar(ch):
    return [sp.Rational(ch[i]**2+ch[square_classes[i]],2) for i in range(5)]
chi_sym64=symchar(chi64)
chi_sym13=symchar(chi13)
chi_sym51=symchar(chi51)
chi_cross=[chi13[i]*chi51[i] for i in range(5)]
assert chi_sym64==[2080,32,10,10,10]
assert dec(chi_sym64)=={'1':50,'3':98,"3'":98,'4':138,'5':178}
assert dec(chi_sym13)['4']==4 and dec(chi_cross)['4']==44 and dec(chi_sym51)['4']==90
assert 4+44+90==138
# Independent 2080-pair fixed-point enumeration, not a character formula.
for ci,cl in enumerate(classes):
    p=perms64[G.index(min(cl))]
    direct=sum(
        tuple(sorted((p[i],p[j])))==(i,j)
        for i in range(64) for j in range(i,64)
    )
    assert direct==chi_sym64[ci],(ci,direct,chi_sym64[ci])
print('full Sym²(H13⊕H51) quartet multiplicities: H13-H13 4, cross 44, H51-H51 90, total 138')
print('two independent native hidden quartets allow 276 symmetry-permitted tensors under uniform charge-one Weyl hypothesis')

# Walsh characters diagonalize the original pair-flip Hamiltonian.
W=np.array([[1 if ((h&m).bit_count()%2)==0 else -1 for m in range(64)] for h in range(64)],dtype=np.int64)
assert np.array_equal(W.T@W,64*np.eye(64,dtype=np.int64))
weights=np.array([m.bit_count() for m in range(64)])
H64=15*np.eye(64,dtype=np.int64)
for i,j in combinations(range(6),2):
    for h in range(64):H64[h,h^(1<<i)^(1<<j)]-=1
for g,p in zip(G,perms64):
    # Every group action preserves H64 because it permutes signed axes.
    assert np.array_equal(H64[np.ix_(p,p)],H64)
lam=[0,10,16,18,16,10,0]
assert np.array_equal(H64@W,W*np.array([lam[w] for w in weights])[None,:])
chi_k=[[None]*5 for _ in range(7)]
for ci,cl in enumerate(classes):
    p=np.array(perms64[G.index(min(cl))],dtype=int)
    inner=np.sum(W*W[p,:],axis=0)//64
    assert all(abs(int(x))<=1 for x in inner)
    for k in range(7):chi_k[k][ci]=int(np.sum(inner[weights==k]))
for k in range(7):
    assert chi_k[k][0]==int(sp.binomial(6,k))
    print('Walsh weight',k,'energy',lam[k],'A5 decomposition',dec(chi_k[k]))
energy_decs={}
for energy,kk in [(0,[0,6]),(10,[1,5]),(16,[2,4]),(18,[3])]:
    ch=[sum(chi_k[k][i] for k in kk) for i in range(5)]
    energy_decs[energy]=dec(ch)
    print('H64 energy',energy,'multiplicity',sum(int(v)*int(chars[n][0]) for n,v in energy_decs[energy].items()),'A5',energy_decs[energy])
assert energy_decs[0]=={'1':2,'3':0,"3'":0,'4':0,'5':0}
assert energy_decs[10]=={'1':0,'3':2,"3'":2,'4':0,'5':0}
assert energy_decs[16]=={'1':2,'3':0,"3'":0,'4':2,'5':4}
assert energy_decs[18]=={'1':0,'3':2,"3'":2,'4':2,'5':0}

# Dyadic URT chronology Q(h,2h)=Q(h,2h+1)=1/2.
# Its 6th power is exactly Haar on all 64 histories. One-step does not
# commute with any nonidentity A5 rotation in this signed-axis action.
commute=[]
for g,p in zip(G,perms64):
    if all({p[(2*h)%64],p[(2*h+1)%64]}=={(2*p[h])%64,(2*p[h]+1)%64} for h in range(64)):
        commute.append(g)
assert commute==[I],commute
# Stronger order-independent certificate: among ALL 2^6 * 6! signed
# permutations of the six axes, only identity and global complement
# commute with the binary shift Markov kernel.
signed_commutant=[]
for pp in permutations(range(6)):
    for flip in range(64):
        def f(h):
            return sum(((((h>>pp[j])&1)^((flip>>j)&1)))<<j for j in range(6))
        if all({f((2*h)&63),f((2*h+1)&63)}=={(2*f(h))&63,(2*f(h)+1)&63} for h in range(64)):
            signed_commutant.append((pp,flip))
assert signed_commutant==[(tuple(range(6)),0),(tuple(range(6)),63)]
print('H64 A5-equivariant for all 60 rotations; Q one-step A5 commutant cardinality',len(commute))
print('all 46080 signed-axis transformations commuting with Q:',signed_commutant)
print('Q^6=J64/64 exactly from 6 independent appended fair bits')
print('Source-support input from archived native 190-cochain theorem: E18 quartet 4_3 and E16 quartet 4_5')
print('Each energy E18 and E16 has two A5 quartets; one native source-coupled quartet, one orthogonal complement')
print('PASS: no fitted ARFs; H51 decomposition is abstract and does not specify unique embedding')

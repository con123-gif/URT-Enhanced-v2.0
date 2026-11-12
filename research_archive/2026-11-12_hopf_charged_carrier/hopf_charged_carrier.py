#!/usr/bin/env python3
"""Hopf charge sectors of the binary icosahedral group over the icosahedron, and the Hopf-twisted
face->vertex projection of the hidden 4_3 + 4_5.  WORK IN PROGRESS certificate (floating point, exact closed
forms asserted to 1e-12).  numpy only.  No fitted or measured inputs, no random matrices."""
import numpy as np, itertools
from math import sqrt, pi, cos, sin
phi=(1+sqrt(5))/2
def qmul(p,q):
    a,u=p[0],p[1:];b,v=q[0],q[1:]
    return np.r_[a*b-u@v,a*v+b*u+np.cross(u,v)]
def qc(q): return np.r_[q[0],-q[1:]]
# 2I: 120 icosians
els=[]
for i in range(4):
    for s in (1,-1):
        e=np.zeros(4);e[i]=s;els.append(e)
for s in itertools.product((1,-1),repeat=4): els.append(np.array(s)/2)
base=[0,1,phi,1/phi]
def even(p):
    return sum(1 for i in range(4) for j in range(i+1,4) if p[i]>p[j])%2==0
for p in itertools.permutations(range(4)):
    if not even(p): continue
    for s in itertools.product((1,-1),repeat=3):
        v=np.zeros(4);sg=iter(s)
        for pos,src in enumerate(p):
            val=base[src]
            v[pos]=0 if val==0 else val*next(sg)/2
        els.append(v)
G=np.array(els);assert len(G)==120
key=lambda q: tuple(np.round(q,9)+0.0)
idx={key(q):i for i,q in enumerate(G)};assert len(idx)==120
mult=np.array([[idx[key(qmul(a,b))] for b in G] for a in G])          # closure verified by lookup
order=lambda i: next(k for k in range(1,21) if np.allclose(np.linalg.matrix_power(np.eye(1),1),1) and idx[key(qpow(G[i],k))]==idx[key(np.array([1.,0,0,0]))])
def qpow(q,k):
    r=np.array([1.,0,0,0])
    for _ in range(k): r=qmul(r,q)
    return r
ords=[order(i) for i in range(120)]
print("element orders:",{o:ords.count(o) for o in sorted(set(ords))})
z=G[ords.index(10)]; w=G[ords.index(6)]
v0=z[1:]/np.linalg.norm(z[1:]); f0=w[1:]/np.linalg.norm(w[1:])
rot=lambda q,v: qmul(qmul(q,np.r_[0,v]),qc(q))[1:]
vkey=lambda v: tuple(np.round(v,7)+0.0)
verts=sorted({vkey(rot(q,v0)) for q in G}); faces=sorted({vkey(rot(q,f0)) for q in G})
print("Hopf base: vertices",len(verts),"faces",len(faces))
VI={v:i for i,v in enumerate(verts)};FI={f:i for i,f in enumerate(faces)}
vof=np.array([VI[vkey(rot(q,v0))] for q in G]); fof=np.array([FI[vkey(rot(q,f0))] for q in G])
zi=[idx[key(qpow(z,k))] for k in range(10)]
# check z fixes v0 and has rotation angle 2pi/5 with positive sense
assert all(vof[mult[i,zi[k]]]==vof[i] for i in range(120) for k in range(10))
# 2I irreps via SU(2) spin-j characters and Galois conjugates
def chi_spin(j,q):
    c=np.clip(q[0],-1,1);half=np.arccos(c)   # q = cos(theta/2)+...
    if abs(sin(half))<1e-12: return (2*j+1)*(1 if c>0 else (-1)**int(round(2*j)))
    return sin((2*j+1)*half)/sin(half)
def gal(x):   # sqrt5 -> -sqrt5 on numbers a+b*sqrt5 with a,b in Q/2: recover by rounding
    b=round((x-round(x*2)/2)/ (sqrt(5)/2)) if False else None
def decomp_q5(x):
    best=None
    for b4 in range(-12,13):
        a4=(x-b4*sqrt(5)/4)*4
        if abs(a4-round(a4))<1e-7: best=(round(a4)/4,b4/4)
    return best
def conj5(x):
    a,b=decomp_q5(x);return a-b*sqrt(5)
chars={"1":[1.0]*120}
for name,j in (("2",.5),("3",1),("4'",1.5),("5",2),("6",2.5)): chars[name]=[chi_spin(j,q) for q in G]
chars["2'"]=[conj5(x) for x in chars["2"]]; chars["3'"]=[conj5(x) for x in chars["3"]]
chars["4"]=[a*b for a,b in zip(chars["2"],chars["2'"])]
names=["1","2","2'","3","3'","4","4'","5","6"]
gram=np.array([[np.dot(chars[a],chars[b])/120 for b in names] for a in names])
assert np.allclose(gram,np.eye(9),atol=1e-9), gram.round(3)
om=np.exp(2j*pi/10)
print("\nHopf charge n over the 12 vertices (fibre Z10): 2I content of the 12-dim sector")
table={}
for n in range(10):
    # character of Ind_{Z10}^{2I} chi_n : (1/10) sum_{g} sum_k [g^-1 x g = z^k] om^{-nk}
    ch=np.zeros(120,complex)
    zset={zi[k]:k for k in range(10)}
    inv=[idx[key(qc(q))] for q in G]
    for x in range(120):
        tot=0
        for g in range(120):
            c=mult[mult[inv[g],x],g]
            if c in zset: tot+=om**(-n*zset[c])
        ch[x]=tot/10
    m={a:int(round((np.dot(np.conj(ch),chars[a])/120).real)) for a in names}
    assert abs(sum(m[a]*chars[a][0] for a in names)-12)<1e-9
    table[n]=m
    print(f" n={n}: "+" + ".join((f"{m[a]}x" if m[a]>1 else "")+a for a in names if m[a]))
# face functions (neutral over faces, fibre Z6) and their hidden quartets
Fm=np.zeros((120,20));Fm[np.arange(120),fof]=1/sqrt(6)
normals=np.array(faces);dots=normals@normals.T
adjF=(np.abs(dots-np.sort(dots[0])[-2])<1e-6).astype(float);assert (adjF.sum(1)==3).all()
L=3*np.eye(20)-adjF
ev,U=np.linalg.eigh(L)
P3=U[:,np.abs(ev-3)<1e-8]@U[:,np.abs(ev-3)<1e-8].T;P5=U[:,np.abs(ev-5)<1e-8]@U[:,np.abs(ev-5)<1e-8].T
assert round(np.trace(P3))==4 and round(np.trace(P5))==4
print("\nHopf-twisted face->vertex projection, restricted to the hidden 4_3 + 4_5:")
print(" n | a=tr(P3 G)/4  b=tr(P5 G)/4  |kappa|  kappa^2/(ab)  rank on hidden | b/a")
res={}
for n in range(10):
    Pn=np.zeros((120,120),complex)
    for k in range(10):
        R=np.zeros((120,120));R[np.arange(120),mult[np.arange(120),zi[k]]]=1   # (R f)(q)=f(q z^k)
        Pn+=om**(n*k)*R/10
    Gn=Fm.T@Pn@Fm
    assert np.allclose(Gn,Gn.conj().T,atol=1e-12)
    a=np.trace(P3@Gn).real/4;b=np.trace(P5@Gn).real/4
    X=P5@Gn@P3;k2=np.trace(X.conj().T@X).real/4
    H=(P3+P5)@Gn@(P3+P5);rk=np.linalg.matrix_rank(H,tol=1e-9)
    res[n]=(a,b,k2,Gn)
    print(f" {n} | {a:.10f}  {b:.10f}  {sqrt(k2):.10f}  {(k2/(a*b) if a*b>1e-14 else float('nan')):.6f}  {rk} | {(b/a if a>1e-14 else float('nan')):.10f}")
# phase of the cross term: real (X-type) or imaginary (Y-type)?
for n in (2,4,6,8):
    Gn=res[n][3];X=P5@Gn@P3
    print(f" n={n}: |Re cross|={np.linalg.norm(X.real):.6f} |Im cross|={np.linalg.norm(X.imag):.6f};  G_n vs conj(G_(10-n)) diff {np.abs(Gn-res[10-n][3].conj()).max():.1e}")
a2,b2=res[2][0],res[2][1];a4,b4=res[4][0],res[4][1]
print("\ncandidate closed forms: b/a (n=2) =",b2/a2," b/a (n=4) =",b4/a4, " product",(b2/a2)*(b4/a4)," phi^2",phi**2," phi^-2",phi**-2," phi^4",phi**4)
print("a2,b2,a4,b4 =",a2,b2,a4,b4," a2+b2",a2+b2," a4+b4",a4+b4)
for nm,val in (("a2",a2),("b2",b2),("a4",a4),("b4",b4)): print(nm,"= a+b*sqrt5 with (a,b)=",decomp_q5(val*60) ,"/60")

# ---- assertions (fail-on-error)
exp={0:"1+3+3'+5",1:"2+4'+6",2:"3+4+5",3:"2'+4'+6",4:"3'+4+5",5:"6+6"}
for n,e in exp.items():
    got="+".join(sum(([a]*table[n][a] for a in names),[]))
    assert got==e and table[10-n if n else 0]==table[10-n if n else 0], (n,got)
s5=sqrt(5)
assert abs(res[2][0]-(5+s5)/20)<1e-12 and abs(res[2][1]-(3-s5)/12)<1e-12
assert abs(res[4][0]-(5-s5)/20)<1e-12 and abs(res[4][1]-(3+s5)/12)<1e-12
for n in (2,4,6,8):
    a,b,k2,Gn=res[n]; assert abs(k2-a*b)<1e-12 and np.linalg.norm((P5@Gn@P3).real)<1e-12
for n in (0,1,3,5,7,9): assert res[n][0]<1e-12 and res[n][1]<1e-12
print("ALL ASSERTIONS PASSED")

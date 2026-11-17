#!/usr/bin/env python3
"""Original-source Q101/Q124/Q125/v61 full 48-sector GRADED gauge-response audit.
Source operators are imported UNMODIFIED. Finite conditional action only.
"""
import sys, json, math, runpy
from itertools import product
from pathlib import Path
import numpy as np
from scipy.linalg import eigh
root=Path(__file__).resolve().parents[2]
src=root/"research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py"
data=runpy.run_path(str(src))
v=data["v61"]
S=np.asarray(data["S"],complex); axis=np.asarray(data["axis"],float)
links=data["links"]; jfield=data["jfield"]
Q=np.asarray(data["Q"][0],complex)
assert abs(6*np.trace(Q[:8,:8]@Q[:8,:8]).real-16)<1e-9
assert abs(6*np.trace(Q[8:,8:]@Q[8:,8:]).real-16)<1e-9
n=444; assert len(data["masks"])==n and len(links)==1032
eigline=np.array([np.linalg.eigh(s)[1][:,1] for s in S])
HR=np.zeros((n,n),complex); HL=np.zeros((n,n),complex)
count=0
for i,j,bit in links:
    a,b=jfield[i,j]; cur=float(a)+math.sqrt(5)*float(b)
    if abs(cur)<1e-12: continue
    count+=1
    u=(np.eye(2)+S[i]@S[j])/math.sqrt(2*(1+axis[i]@axis[j]))
    z=np.vdot(eigline[i],u@eigline[j])
    assert abs(abs(z)-1)<1e-10
    HR[i,j]=1j*cur; HR[j,i]=HR[i,j].conjugate()
    HL[i,j]=1j*cur*z; HL[j,i]=HL[i,j].conjugate()
assert count==720
er=eigh(HR,eigvals_only=True,check_finite=False)
el=eigh(HL,eigvals_only=True,check_finite=False)
assert sum(abs(er)<1e-8)==112 and sum(abs(el)<1e-8)==84
print("Q125 original 444-sector charged spectra",len(er),len(el),flush=True)
D=np.array(v.DIRECTIONS,int); sites=list(v.SITES); ind=dict(v.SITE_INDEX)
shape=np.array(v.LATTICE_SHAPE)
assert D.tolist()==[list(x) for x in ([(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)])]
I4=np.eye(4,dtype=complex)
gams,g5=v.gamma_matrices()
r=float(v.R_EXACT)
F=[];B=[]
for a in range(11):
    if a<3:
        F.append((gams[a+1]-r*I4)/2)
        B.append((-gams[a+1]-r*I4)/2)
    else:
        F.append((gams[0]-I4)/16)
        B.append((-gams[0]-I4)/16)
F=np.array(F);B=np.array(B)
G5=np.kron(np.eye(48),g5)
h=data["hw"](np.zeros(528))
ev,U=eigh(h,check_finite=False)
assert np.linalg.norm(h-h.conj().T)<1e-8
def sign(x,shift):
    t=x[0]+shift[0]
    return -1 if t<0 or t>=shape[0] else 1
# Exact seagull from second variation of the original 11 links.
Wraw=np.zeros((11,192,192),complex)
for ii,x in enumerate(sites):
    block=slice(4*ii,4*ii+4)
    for a,shift in enumerate(D):
        y=tuple((x[t]+shift[t])%shape[t] for t in range(4))
        z=tuple((x[t]-shift[t])%shape[t] for t in range(4))
        Wraw[a,block,slice(4*ind[y],4*ind[y]+4)]-=sign(x,shift)*F[a]
        Wraw[a,block,slice(4*ind[z],4*ind[z]+4)]-=sign(x,-shift)*B[a]
W=np.einsum("ab,jbc->jac",G5,Wraw,optimize=True)
wd=np.array([np.einsum("ia,ij,ja->a",U.conj(),w,U,optimize=True) for w in W])
assert np.max(abs(wd.imag))<1e-8
wd=wd.real
k=float(v.DELTA)/(1+float(v.DELTA)**2)
outer=np.outer(ev,ev);ev2=ev**2
weights=np.zeros((192,192),float);second=np.zeros(192,float)
for mu in np.concatenate([er,el]):
    z=(k*mu)**2;den=ev2+z
    weights+=(outer-z)/np.outer(den,den)
    second+=ev/den
weights*=16;second*=16
def one(mode):
    q=2*np.pi*np.array(mode)/shape
    ph=np.array([np.exp(1j*np.dot(q,x)) for x in sites])
    raw=np.zeros((11,192,192),complex)
    for ii,x in enumerate(sites):
        block=slice(4*ii,4*ii+4)
        for a,shift in enumerate(D):
            y=tuple((x[t]+shift[t])%shape[t] for t in range(4))
            z=tuple((x[t]-shift[t])%shape[t] for t in range(4))
            raw[a,block,slice(4*ind[y],4*ind[y]+4)]+=1j*ph[ii]*sign(x,shift)*F[a]
            raw[a,block,slice(4*ind[z],4*ind[z]+4)]-=1j*ph[ind[z]]*sign(x,-shift)*B[a]
    J=np.einsum("ab,jbc->jac",G5,raw,optimize=True)
    Jd=np.einsum("ai,jab,bk->jik",U.conj(),J,U,optimize=True)
    H=np.einsum("ab,iab,jab->ij",weights,Jd,Jd.conj(),optimize=True)
    H[np.diag_indices(11)]-=np.einsum("a,ia->i",second,wd)
    H/=48
    anti=np.linalg.norm(H-H.conj().T)/max(1,np.linalg.norm(H))
    assert anti<1e-10,(mode,anti)
    H=(H+H.conj().T)/2
    # Correct complex-Fourier conjugation (old + sign was a bug).
    g=np.array([1-np.exp(-1j*np.dot(q,d)) for d in D])
    ward=np.linalg.norm(H@g)/max(1,np.linalg.norm(H)*np.linalg.norm(g))
    assert ward<1e-10,(mode,ward)
    return np.linalg.eigvalsh(H),float(ward)
results={}
for mode in product(range(6),range(2),range(2),range(2)):
    spectrum,ward=one(mode)
    label=",".join(map(str,mode))
    results[label]={"positive":int(sum(spectrum>1e-7)),
                    "negative":int(sum(spectrum< -1e-7)),
                    "zero":int(sum(abs(spectrum)<=1e-7)),
                    "ward":ward,"min":float(spectrum[0])}
    print("Q161 mode",label,"neg",results[label]["negative"],"ward",ward,flush=True)
inertia={key:sum(v[key] for v in results.values()) for key in ("positive","negative","zero")}
assert inertia=={"positive":409,"negative":72,"zero":47},inertia
for t in range(6):
    z=[results[",".join(map(str,(t,*b)))]["negative"] for b in product((0,1),repeat=3)]
    assert z==[3,2,2,1,2,1,1,0],(t,z)
maxward=max(v["ward"] for v in results.values())
assert maxward<1e-10
print("Q161 GRADED 48-mode inertia",inertia,"max Ward",maxward,flush=True)
if len(sys.argv)>1:
    out=Path(sys.argv[1]);out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps({"inertia":inertia,"maxward":maxward,"modes":results},indent=2))
print("SOURCE-NATIVE 48-SEQ CONDITIONAL GAUGE AUDIT PASS — PHYSICAL GATES OPEN",flush=True)

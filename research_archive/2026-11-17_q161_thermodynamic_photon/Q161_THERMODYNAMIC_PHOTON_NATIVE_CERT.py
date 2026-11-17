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

# Q161 new physical frontier: solve the GRADED ORIGINAL Q125 action at nonzero
# triangular flux. This extends the source-native Q125/v61 code above, not Q109.
from collections import Counter
Q16=np.asarray(data["Q"][0],complex)
def charge_mult(a):
    vals=eigh(Q16[:8,:8] if a=="L" else Q16[8:,8:],eigvals_only=True)
    counts=Counter()
    for q in vals:
        n=int(round(3*q))
        assert abs(3*q-n)<1e-10
        counts[n]+=3;counts[-n]+=3  # 3 generations and conjugates
    return counts
cl,cr=charge_mult("L"),charge_mult("R")
assert cl==cr==Counter({0:6,3:3,-3:3,2:9,-2:9,1:9,-1:9})
charges={j/3:c for j,c in cl.items() if j}
assert abs(sum(c*q*q for q,c in charges.items())-16)<1e-10
# Fix: source-native KMS transfer scale, NOT a free/unbound k symbol.
k_KMS=float(v.DELTA)/(1.0+float(v.DELTA)**2)
assert 0.0 < k_KMS < 0.01
mu2=(k_KMS*np.r_[er,el])**2
M=float(v.M_EXACT)





# Exact original Q125 chiral spectrum and all 11 v61 Wilson hoppings loaded above.
from itertools import product
from scipy.linalg import null_space
assert 0<M<1 and r>0
# E²(p)=s²+sum sin² pi + temporal_sin² is never zero in the 4D BZ.
# If sin(pi)=0 for all 3 spatial components then pi=0/pi;
# with any pi=pi, temporal-cube averages vanish and s=1-M+2*r*npi>0;
# with all pi=0, E²=(1-M-cos p0)²+sin² p0>=M².
# Exact thermodynamic uniform gauge theorem:
#     E_q(p;A+D*a)²=E_q(p+q*a;A)².
# Translation invariance of Haar BZ integral yields Γ∞(A+D*a)=Γ∞(A).
p=np.array([np.pi/7,-np.pi/11,np.pi/13,np.pi/17])
a=np.array([np.pi/19,-np.pi/23,np.pi/29,-np.pi/31])
for q in (1.,2/3,1/3):
    assert np.max(abs(np.exp(1j*(D@p+q*(D@a)))-np.exp(1j*D@(p+q*a))))<1e-14
# Non-fitted Q125 squared-mass spectral degeneracy compression
tag,ix=np.unique(np.round(mu2,12),return_inverse=True)
weights=np.bincount(ix)
masses=np.bincount(ix,weights=mu2)/weights
spread=float(max(abs(mu2-masses[ix])))
assert len(masses)==43 and sum(weights)==888 and spread<3e-15
for E in (.01,.1,1.,5.,20.):
    assert abs(sum(1/(E+mu2))-sum(weights/(E+masses)))<1e-9
pairs=[(1.,charges[1.]+charges[-1.]),
       (2/3,charges[2/3]+charges[-2/3]),
       (1/3,charges[1/3]+charges[-1/3])]
assert pairs==[(1.,6),(2/3,18),(1/3,18)]
print("Q125 original chiral 888 -> 43 squared eigenvalue classes",spread,flush=True)

def H_original(nt,ns,mode,compressed=True):
    k=2*np.pi*np.array(mode)/np.array([nt,ns,ns,ns])
    momenta=np.asarray([(np.pi*(2*t+1)/nt,*[2*np.pi*j/ns for j in b])
             for t in range(nt) for b in product(range(ns),repeat=3)])
    length=len(momenta)
    mm=masses if compressed else mu2
    ww=weights if compressed else np.ones(888,int)
    H=np.zeros((11,11),complex)
    for q,count in pairs:
        for pos in range(0,length,4096):
            uu=momenta[pos:pos+4096]@D.T
            vv=uu+(D@k)[None,:]
            eu=np.exp(1j*uu);ev=np.exp(1j*vv)
            P=len(uu)
            X=(3*r+1-M)*np.broadcast_to(I4,(P,4,4)).copy()
            Y=X.copy()
            X+=np.einsum("jab,pj->pab",F,eu)+np.einsum("jab,pj->pab",B,eu.conj())
            Y+=np.einsum("jab,pj->pab",F,ev)+np.einsum("jab,pj->pab",B,ev.conj())
            X=np.einsum("ab,pbc->pac",g5,X)
            Y=np.einsum("ab,pbc->pac",g5,Y)
            ex=np.einsum("pab,pba->p",X,X).real/4
            ey=np.einsum("pab,pba->p",Y,Y).real/4
            dx=ex[:,None]+mm
            dy=ey[:,None]+mm
            z=1/(dx*dy)
            alpha=z@ww;beta=z@(ww*mm);gamma=(1/dx)@ww
            J=1j*q*np.einsum("ab,pjbc->pjac",g5,
               F[None,:,:,:]*eu[:,:,None,None]-B[None,:,:,:]*ev.conj()[:,:,None,None])
            W=-q*q*np.einsum("ab,pjbc->pjac",g5,
               F[None,:,:,:]*eu[:,:,None,None]+B[None,:,:,:]*eu.conj()[:,:,None,None])
            T=np.einsum("pab,pjbc,pcd->pjad",Y,J,X,optimize=True)
            H+=count*(np.einsum("p,pjab,pkab->jk",alpha,T,J.conj(),optimize=True)
                 -np.einsum("p,pjab,pkab->jk",beta,J,J.conj(),optimize=True))
            H[np.diag_indices(11)]-=count*np.einsum("p,pab,pjba->j",gamma,X,W,optimize=True)
    H/=length
    H=(H+H.conj().T)/2
    g=1-np.exp(-1j*D@k)
    ward=float(np.linalg.norm(H@g)/max(1,np.linalg.norm(H)*np.linalg.norm(g)))
    assert ward<1e-10,(mode,ward)
    return H,ward

def K4_original(H,nt,ns,mode):
    k=2*np.pi*np.array(mode)/np.array([nt,ns,ns,ns])
    u=D@k
    f=np.ones(11,dtype=complex)
    ids=abs(u)>1e-13
    f[ids]=(1-np.exp(-1j*u[ids]))/(1j*u[ids])
    E=f[:,None]*D
    assert np.linalg.norm(E@(1j*k)-(1-np.exp(-1j*u)))<1e-12
    N=null_space(E.conj().T)
    assert N.shape==(11,7)
    S=N.conj().T@H@N
    assert min(np.linalg.eigvalsh(S))>1e-8
    Q=N.conj().T@H@E
    K=E.conj().T@H@E-Q.conj().T@np.linalg.solve(S,Q)
    K=(K+K.conj().T)/2
    assert np.linalg.norm(K@(1j*k))/max(1,np.linalg.norm(K)*np.linalg.norm(k))<1e-10
    return K
# Full original 888 vs 43 weighted resolution in two independent native blocks
for mode in ((0,1,0,0),(1,0,0,0)):
    full,_=H_original(6,4,mode,False)
    small,_=H_original(6,4,mode,True)
    mismatch=np.linalg.norm(full-small)/max(1,np.linalg.norm(full))
    assert mismatch<1e-12,(mode,mismatch)
    print("Full Q125 vs 43-charge-spectral native gauge Hessian",mode,mismatch,flush=True)
reference={12:(-6.087621319132048,146.880567801373,385.77876865871144),
           18:(-0.080620525771795,75.640295404054,219.175541210572),
           20:(-0.019318685161944,62.553123369659,185.726717586666)}
results={}
for n,old_vals in reference.items():
    P=[]
    for j,mode in enumerate(((0,0,0,0),(1,0,0,0),(0,1,0,0))):
        H,ward=H_original(n,n,mode)
        K=K4_original(H,n,n,mode)
        value=float(K[2,2].real)
        assert abs(value-old_vals[j])<.002,(n,mode,value,old_vals[j])
        P.append(value)
        print("Q161 native flat photon",n,mode,value,"ward",ward,flush=True)
    k2=4*np.sin(np.pi/n)**2
    Zt=(P[1]-P[0])/k2;Zs=(P[2]-P[0])/k2
    assert Zt>0 and Zs>0
    results[str(n)]={"Pi0":P[0],"Pit":P[1],"Pis":P[2],
                     "Zt":Zt,"Zs":Zs,"ratio":Zs/Zt}
print("Q161 original conditional transverse photon stiffness",results,flush=True)
if len(sys.argv)>1:
    out=Path(sys.argv[1]);out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps({"classes":43,"spectral_roundoff":spread,
      "results":results,"Lorentz_limit_proved":False},indent=2))
print("Q161 exact thermodynamic 4D uniform mass cancellation + numerical transverse k² PASS",flush=True)

#!/usr/bin/env python3
"""Q55 original 2I/Hopf Wilson charged operator: both Ward orders, Chern flux, hidden resolution."""
import argparse,contextlib,io,runpy
from pathlib import Path
from math import sqrt,pi,sin
from itertools import combinations
import numpy as np
arg=argparse.ArgumentParser();arg.add_argument('--reconstruction');op=arg.parse_args()
native=Path(__file__).resolve().parents[2]/'research_archive/2026-11-12_hopf_charged_carrier/hopf_charged_carrier.py'
src=Path(op.reconstruction) if op.reconstruction else native
with contextlib.redirect_stdout(io.StringIO()):d=runpy.run_path(str(src))
G,mult,zi,F,P3,P5=d['G'],d['mult'],d['zi'],d['Fm'] if 'Fm' in d else d['F'],d['P3'],d['P5']
P=P3+P5; phi=(1+sqrt(5))/2
assert G.shape==(120,4) and F.shape==(120,20)
assert np.linalg.norm(F.T@F-np.eye(20))<1e-12
class12=[j for j in range(120) if abs(G[j,0]-phi/2)<1e-9]
assert len(class12)==12
A=np.zeros((120,120))
for j in class12:A[np.arange(120),mult[:,j]]=1
L=12*np.eye(120)-A
assert np.linalg.norm(A-A.T)<1e-11
reps=[];seen=set()
for i in range(120):
    if i in seen:continue
    coset=[int(mult[i,j]) for j in zi]
    assert len(set(coset))==10
    seen.update(coset);reps.append(i)
assert len(reps)==12 and len(seen)==120
om=np.exp(2j*pi/10);results={}
for n in (2,-2,4,-4):
    B=np.zeros((120,12),complex)
    for k,i in enumerate(reps):
        for t,z in enumerate(zi): B[mult[i,z],k]=om**(-n*t)/sqrt(10)
    H=B.conj().T@L@B
    T=B.conj().T@F@P; W=T.conj().T@T;K=T.conj().T@H@T
    assert np.linalg.norm(B.conj().T@B-np.eye(12))<1e-11
    assert np.linalg.norm(L@B-B@H)<2e-11
    assert np.linalg.norm(H-H.conj().T)<1e-11
    assert np.linalg.matrix_rank(W,tol=1e-10)==4
    assert np.linalg.norm(H@T-15*T)<3e-11
    assert np.linalg.norm(K-15*W)<4e-11
    if abs(n)==2:
        eigen=np.array([10-2*sqrt(5)]*3+[12]*5+[15]*4)
        a,b,w=(5+sqrt(5))/20,(3-sqrt(5))/12,phi
    else:
        eigen=np.array([12]*5+[10+2*sqrt(5)]*3+[15]*4)
        a,b,w=(5-sqrt(5))/20,(3+sqrt(5))/12,1/phi
    assert np.max(abs(np.linalg.eigvalsh(H)-np.sort(eigen)))<4e-11
    assert abs(np.trace(P3@W).real/4-a)<4e-12
    assert abs(np.trace(P5@W).real/4-b)<4e-12
    E=(np.abs(H)>1e-10).astype(int);np.fill_diagonal(E,0)
    assert np.all(E.sum(axis=1)==5) and np.count_nonzero(np.triu(E,1))==30
    assert np.max(abs(np.abs(H)[E.astype(bool)]-w))<3e-11
    assert np.max(abs(np.diag(H).real-(10+4*sin(n*pi/10)**2)))<3e-11
    results[n]=(H,T,W,K,E)
    print('CHARGE',n,'SPECTRUM',np.round(np.linalg.eigvalsh(H),9).tolist(),'K_EIG',15*(a+b))
for n in (2,-2):
    H,T,W,K,E=results[n];edges=list(zip(*np.nonzero(np.triu(E,1))));d1=[];d2=[]
    S=np.zeros((12,len(edges)))
    for t,(i,j) in enumerate(edges):
        S[i,t]=1;S[j,t]=-1
        X=np.zeros((12,12),complex);Y=X.copy()
        X[i,j]=1j*n*H[i,j];X[j,i]=np.conj(X[i,j])
        Y[i,j]=-n*n*H[i,j];Y[j,i]=np.conj(Y[i,j]);d1.append(X);d2.append(Y)
    d1=np.array(d1);d2=np.array(d2)
    for i in range(12):
        Qi=np.zeros((12,12));Qi[i,i]=n
        assert np.linalg.norm(np.einsum('k,kij->ij',S[i],d1)-1j*(Qi@H-H@Qi))<1e-11
        for j in range(12):
            Qj=np.zeros((12,12));Qj[j,j]=n
            C=Qj@H-H@Qj
            assert np.linalg.norm(np.einsum('k,kij->ij',S[i]*S[j],d2)+(Qi@C-C@Qi))<1e-11
    alpha=np.array([.07*np.sin(2*pi*j/12)+.11*np.cos(4*pi*j/12) for j in range(12)])
    V=np.diag(np.exp(1j*n*alpha));Hg=H.copy()
    for i,j in edges:
        Hg[i,j]=H[i,j]*np.exp(1j*n*(alpha[i]-alpha[j]));Hg[j,i]=np.conj(Hg[i,j])
    assert np.linalg.norm(Hg-V@H@V.conj().T)<1e-11
    assert np.linalg.norm((V@T).conj().T@Hg@(V@T)-K)<3e-11
    assert np.linalg.norm(np.sum(d2,axis=0))>1e-3
    print('WARD1_WARD2_AND_SEAGULL',n,'PASS')
coords=np.asarray(d['verts'])[d['vof'][reps]];faces=[]
for i,j,k in combinations(range(12),3):
    E=results[2][4]
    if E[i,j] and E[j,k] and E[k,i]:
        if np.dot(np.cross(coords[j]-coords[i],coords[k]-coords[i]),coords[i]+coords[j]+coords[k])<0:j,k=k,j
        faces.append((i,j,k))
assert len(faces)==20
for n in (2,-2,4,-4):
    H=results[n][0];ph=[]
    for i,j,k in faces:
        U=lambda a,b:-H[a,b]/abs(H[a,b])
        ph.append(np.angle(U(i,j)*U(j,k)*U(k,i)))
    assert np.max(abs(np.array(ph)+n*pi/10))<3e-11
    assert abs(sum(ph)/(2*pi)+n)<3e-11
    print('HOPF_CHERN',n,'=',round(sum(ph)/(2*pi)))
sumW=sum(results[n][2] for n in (2,-2,4,-4))
sumK=sum(results[n][3] for n in (2,-2,4,-4))
assert np.linalg.norm(sumW-P)<2e-11 and np.linalg.norm(sumK-15*P)<3e-10
print('HIDDEN_COMPLETENESS',np.linalg.norm(sumW-P),'KINETIC',np.linalg.norm(sumK-15*P))
print('Q55_HOPF_WILSON_PASS')

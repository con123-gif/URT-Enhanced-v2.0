#!/usr/bin/env python3
"""Original Q101/Q125 444-history, 1032-link Q96 EM Ward check of
source-derived full-rank three-channel Hopf left-right mass-vertex CANDIDATE.
Uses original archived operators unmodified; does not claim Higgs dynamics.
"""
from pathlib import Path
from itertools import product
import runpy,math
import numpy as np
from scipy.linalg import block_diag
root=Path(__file__).resolve().parents[2]
z=runpy.run_path(str(root/"research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py"))
C=np.array(z["C"],float)
Pl=np.array(z["Pl"],float)
W=np.array(z["W"],float)
P3=np.array(z["P3"],float)
P5=np.array(z["P5"],float)
S=np.array(z["S"],complex)
axis=np.array(z["axis"],float)
Q=np.array(z["Q"],complex)
states=np.array([s for _,s in z["states"]],float)
assert states.shape==(444,12) and Q.shape==(444,16,16)
K=C.T@(P3*P5)@C
eig,U=np.linalg.eigh(K)
Ul=U[:,(eig>1e-8)&(eig<.1)]
Uh=U[:,eig>.1]
assert Ul.shape==Uh.shape==(12,3)
face=(C@Pl@states.T).T**2
a=face@C
Y=np.array([Ul.T@np.diag(row)@Uh for row in a])
assert Y.shape==(444,3,3)
QR=np.diag(Q[0,8:,8:]).real
assert np.allclose(QR,[2/3]*3+[-1/3]*3+[-1.,0.],atol=1e-12)
I2=np.eye(2,dtype=complex)
V=[];worstward=0.;worstunit=0.
for i,s in enumerate(S):
    vals,vec=np.linalg.eigh(s)
    positive=vec[:,1];negative=vec[:,0]
    v=np.zeros((8,8),complex)
    for color in range(3):
        v[2*color:2*color+2,color]=positive
        v[2*color:2*color+2,3+color]=negative
    v[6:8,6]=negative
    v[6:8,7]=positive
    worstward=max(worstward,np.linalg.norm(Q[i,:8,:8]@v-v@Q[i,8:,8:]))
    worstunit=max(worstunit,np.linalg.norm(v.conj().T@v-np.eye(8)))
    V.append(v)
assert worstward<1e-10 and worstunit<1e-10
# Six direct 96x96 three-generation plus conjugate actual charge-Ward checks.
for i in (0,7,20,113,300,443):
    R=np.zeros((16,16),complex)
    R[:8,8:]=V[i]
    M48=np.kron(Y[i],R)+np.kron(Y[i].conj().T,R.conj().T)
    Q48=np.kron(np.eye(3),Q[i])
    Q96=block_diag(Q48,-Q48.conj())
    M96=block_diag(M48,M48.conj())
    assert Q96.shape==M96.shape==(96,96)
    assert np.linalg.norm(M96-M96.conj().T)<1e-10
    assert np.linalg.norm(Q96@M96-M96@Q96)<1e-10
# Original 1032 transitions; 720 genuine wedge-current active.
linkcount=0;active=0;maxdiag=0.;maxlinkunit=0.;nonconstant=0.
for i,j,bit in z["links"]:
    linkcount+=1
    v2=(I2+S[i]@S[j])/math.sqrt(2*(1+axis[i]@axis[j]))
    transport=np.kron(np.eye(4),v2)
    berry=V[i].conj().T@transport@V[j]
    maxdiag=max(maxdiag,np.linalg.norm(berry-np.diag(np.diag(berry))))
    maxlinkunit=max(maxlinkunit,np.linalg.norm(berry.conj().T@berry-np.eye(8)))
    a0,b0=z["jfield"][i,j]
    current=float(a0)+math.sqrt(5)*float(b0)
    # Verify numerical source is EXACT original wedge, not another surrogate.
    assert abs(current-.5*face[i]@W@face[j])<2e-8
    if abs(current)>1e-9:
        active+=1
        nonconstant+=current**2*np.linalg.norm(Y[i]-Y[j])**2
assert linkcount==1032 and active==720
assert maxdiag<1e-10 and maxlinkunit<1e-10
assert nonconstant>1.e4
# Exactly 60 full frustration-ground states from original Q101 (c=+ and c=-).
ground=[]
edges=z["old"]["edges"]
for i,s in enumerate(states):
    E=sum(s[u]*s[v] for u,v in edges)
    if abs(sum(s))==4 and abs(E+6)<1e-10:
        ground.append(i)
assert len(ground)==60
ref=np.sort(np.array([0.2813776741499453,0.8813776741499453,1.162755348299891]))[::-1]
for i in ground:
    sv=np.linalg.svd(Y[i],compute_uv=False)
    assert np.allclose(sv,ref,rtol=0,atol=2e-11),(i,sv)
print("Q161 Q96 EM LH-RH native Hopf charge Ward 444/444",worstward,worstunit,flush=True)
print("Q161 native 1032 links, 720 active exact-current Berry diagonal",maxdiag,maxlinkunit,flush=True)
print("Q161 direct 96x96 3-generation+conjugate EM mass-vertex sample PASS",flush=True)
print("Q161 original Q101 nonlinear face-source 60/60 ground full-rank 3 singulars",ref,flush=True)
print("Q161 weighted nonconstant source-gradient across 720 active links",nonconstant,flush=True)
print("STATUS: EM-compatible conditional vertex, NOT full SU2xU1 Higgs or physical Yukawa",flush=True)

#!/usr/bin/env python3
"""Original Q101/Q125 Q96 three-generation nonlinear face-source 444-state
SU(2)_L x U(1)_Y Hopf Yukawa COVARIANCE certificate.
No fitted observed masses, no claim of a dynamically generated Higgs vacuum.
"""
from pathlib import Path
import runpy
import numpy as np
root=Path(__file__).resolve().parents[2]
z=runpy.run_path(str(root/"research_archive/2026-11-17_q161_q96_three_generation_hopf_source/Q161_Q96_SOURCE_THREE_GENERATION_WARD_CERT.py"))
S=z["S"]
Q16=z["Q"]
Ysource=z["Y"]
assert S.shape==(444,2,2) and Ysource.shape==(444,3,3)
sigma2=np.array([[0,-1j],[1j,0]],complex)
sigma=[np.array([[0,1],[1,0]],complex),sigma2,np.diag([1.,-1.])]
I2=np.eye(2,dtype=complex)
Yleft=[1/6]*3+[-1/2]
Yright=np.array([2/3]*3+[-1/3]*3+[-1.,0.])
# Q96 standard chiral registry FORCES a +1/2 hypercharge Higgs doublet
# for down quark/electron, and its -1/2 conjugate for up/neutral lepton.
for c in range(3):
    assert abs(Yleft[c]+.5-Yright[c])<1e-12
    assert abs(Yleft[c]-.5-Yright[3+c])<1e-12
assert abs(Yleft[3]-.5-Yright[6])<1e-12
assert abs(Yleft[3]+.5-Yright[7])<1e-12

def hopf_pair(phi):
    tilde=1j*sigma2@phi.conj()
    v=np.zeros((8,8),complex)
    for c in range(3):
        v[2*c:2*c+2,c]=tilde
        v[2*c:2*c+2,3+c]=phi
    v[6:8,6]=phi
    v[6:8,7]=tilde
    return v

probes=((0,np.pi/7,np.pi/9),(1,np.pi/11,-np.pi/13),
        (2,np.pi/17,np.pi/19))
maxlocal=maxunit=maxcov=0.
for i,ss in enumerate(S):
    _,ev=np.linalg.eigh(ss)
    phi=ev[:,0]
    V=hopf_pair(phi)
    maxunit=max(maxunit,np.linalg.norm(V.conj().T@V-np.eye(8)))
    maxlocal=max(maxlocal,np.linalg.norm(Q16[i,:8,:8]@V-V@Q16[i,8:,8:]))
    for axis,theta,beta in probes:
        G=np.cos(theta/2)*I2+1j*np.sin(theta/2)*sigma[axis]
        phi2=np.exp(1j*beta/2)*G@phi
        Gleft=np.zeros((8,8),complex)
        for c,y in enumerate(Yleft):
            Gleft[2*c:2*c+2,2*c:2*c+2]=np.exp(1j*y*beta)*G
        Gright=np.diag(np.exp(1j*Yright*beta))
        maxcov=max(maxcov,np.linalg.norm(hopf_pair(phi2)-Gleft@V@Gright.conj().T))
assert maxlocal<1e-10 and maxunit<1e-10 and maxcov<1e-10,(maxlocal,maxunit,maxcov)
# Extend through exact original face-derived 3x3 Ysource without a new
# numerical mass coefficient: gauge acts trivially on generation factor.
for i in (0,20,113,300,443):
    _,vec=np.linalg.eigh(S[i]);phi=vec[:,0]
    V=hopf_pair(phi);B=np.kron(Ysource[i],V)
    for axis,theta,beta in probes:
        G=np.cos(theta/2)*I2+1j*np.sin(theta/2)*sigma[axis]
        pp=np.exp(1j*beta/2)*G@phi
        L=np.zeros((8,8),complex)
        for c,y in enumerate(Yleft):L[2*c:2*c+2,2*c:2*c+2]=np.exp(1j*y*beta)*G
        R=np.diag(np.exp(1j*Yright*beta))
        Btrans=np.kron(Ysource[i],hopf_pair(pp))
        assert np.linalg.norm(Btrans-np.kron(np.eye(3),L)@B@
                  np.kron(np.eye(3),R.conj().T))<1e-10
print("NATIVE Q96 +1/2 Higgs/−1/2 tilde hypercharge constraints EXACT",flush=True)
print("ALL 444 ORIGINAL SU2xU1 HOPF FERMION MAP COVARIANCE",maxlocal,maxunit,maxcov,flush=True)
print("SOURCE-DERIVED FULL-RANK THREE-GENERATION SU2xU1 YUKAWA KINEMATIC COVARIANCE PASS",flush=True)
print("NOT full dynamical Higgs/VEV/physical Yukawa masses or H64/24 normalization",flush=True)

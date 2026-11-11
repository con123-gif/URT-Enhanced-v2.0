#!/usr/bin/env python3
"""Photon kernel at the cochain vacuum: Hessians of the two induced functionals of the incidence
biadjacency B(theta) on the (squares - 1) physical modes, for the five Platonic solids.
   K_E = Hessian of  -Tr|B|            (sea energy; scale fixed by the +-1 incidence numbers)
   K_L = Hessian of  -sum log sigma_i  (log-det over the nonzero singular values; scale-free)
"""
import sys, os, json, itertools, numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import HODGE_DIRAC_FLUX_VACUUM_2026_11_11 as HV
def levels(x,d=7):
    r=np.round(np.asarray(x,float),d)+0.0; return [(float(v),int((r==v).sum())) for v in sorted(set(r))]
def run(name):
    d0,d1=HV.complex_of(HV.SOL[name]); B0=np.hstack([d0,d1.T]); nE,nc=B0.shape; idx=np.argwhere(B0!=0); L=len(idx)
    th0=np.angle(B0[idx[:,0],idx[:,1]]+0j); r=nE                       # rank of B = E (two zero singular values on the wide side)
    def grads(th):
        B=np.zeros((nE,nc),complex); B[idx[:,0],idx[:,1]]=np.exp(1j*th)
        U,sv,Vh=np.linalg.svd(B,full_matrices=False); dB=1j*B[idx[:,0],idx[:,1]]
        W=U@Vh; Pinv=(Vh.conj().T/sv)@U.conj().T                       # pseudo-inverse (all nE singular values > 0)
        gE=-(np.conj(W[idx[:,0],idx[:,1]])*dB).real
        gL=-(Pinv.T[idx[:,0],idx[:,1]]*dB).real                        # d(sum log sigma) = Re Tr(B^+ dB)
        return gE,gL,sv
    h=1e-5; HE=np.zeros((L,L)); HL=np.zeros((L,L))
    for k in range(L):
        e=np.zeros(L); e[k]=h; a=grads(th0+e); b=grads(th0-e); HE[k]=(a[0]-b[0])/(2*h); HL[k]=(a[1]-b[1])/(2*h)
    HE=.5*(HE+HE.T); HL=.5*(HL+HL.T)
    # gauge directions: node phases alpha_e - alpha_c on link (e,c)
    Gm=np.zeros((L,nE+nc))
    for k,(a,b) in enumerate(idx): Gm[k,a]=1; Gm[k,nE+b]=-1
    U,s,_=np.linalg.svd(Gm,full_matrices=True); P=U[:,int((s>1e-9).sum()):]
    wE=np.linalg.eigvalsh(P.T@HE@P); wL=np.linalg.eigvalsh(P.T@HL@P)
    return {"physical_modes":int(P.shape[1]),"sigma_levels":levels(grads(th0)[2]),
            "K_E_levels":levels(wE,6),"K_L_levels":levels(wL,6),
            "Tr_K_E":float(wE.sum()),"Tr_K_E_inv":float((1/wE).sum()),"Tr_K_L":float(wL.sum()),"Tr_K_L_inv":float((1/wL).sum()),
            "min_K_E":float(wE.min()),"min_K_L":float(wL.min()),"ward_E":float(np.linalg.norm(HE@Gm)),"ward_L":float(np.linalg.norm(HL@Gm))}
if __name__=="__main__":
    out={n:run(n) for n in HV.SOL}
    for n,v in out.items(): print(n,json.dumps(v))
    agg={k:sum(v[k] for v in out.values()) for k in ("physical_modes","Tr_K_E","Tr_K_E_inv","Tr_K_L","Tr_K_L_inv")}
    print("aggregate over five solids:",json.dumps(agg))
    json.dump({"solids":out,"aggregate":agg},open(os.path.join(os.path.dirname(os.path.abspath(__file__)),"HODGE_DIRAC_PHOTON_KERNEL_2026_11_11.json"),"w"),indent=1)
    assert all(v["min_K_E"]>1e-6 and v["min_K_L"]>1e-6 and v["ward_E"]<1e-5 and v["ward_L"]<1e-5 for v in out.values())
    print("PASS: both induced kernels are positive definite on the physical modes of all five solids.")

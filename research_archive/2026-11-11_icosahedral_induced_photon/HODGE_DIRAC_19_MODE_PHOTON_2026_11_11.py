#!/usr/bin/env python3
"""Reduce the parameter-free incidence kernel K_E (Hessian of -Tr|B| at the cochain vacuum of the
icosahedron) to the 30 ordinary link phases theta_e and compare with the Maxwell form M = d1^T d1,
whose propagator trace is the exact 15 Tr M^+ = 137.
A link phase theta_e on edge e=(v,v') is the incidence-phase difference a(e,v') - a(e,v).
Two reductions: 'frozen' (other incidence modes held fixed) and 'relaxed' (Schur complement)."""
import sys, os, json, numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import HODGE_DIRAC_FLUX_VACUUM_2026_11_11 as HV
def levels(x,d=7):
    r=np.round(np.asarray(x,float),d)+0.0; return [(float(v),int((r==v).sum())) for v in sorted(set(r))]
d0,d1=HV.complex_of(HV.SOL["icosahedron"]); B0=np.hstack([d0,d1.T]); nE,nc=B0.shape; idx=np.argwhere(B0!=0); L=len(idx); nV=d0.shape[1]
th0=np.angle(B0[idx[:,0],idx[:,1]]+0j)
def gE(th):
    B=np.zeros((nE,nc),complex); B[idx[:,0],idx[:,1]]=np.exp(1j*th); U,sv,Vh=np.linalg.svd(B,full_matrices=False)
    return -(np.conj((U@Vh)[idx[:,0],idx[:,1]])*1j*B[idx[:,0],idx[:,1]]).real
h=1e-5; HE=np.array([(gE(th0+h*np.eye(L)[k])-gE(th0-h*np.eye(L)[k]))/(2*h) for k in range(L)]); HE=.5*(HE+HE.T)
pos={(int(a),int(b)):k for k,(a,b) in enumerate(idx)}
T=np.zeros((L,nE))                                   # theta_e -> incidence phases
for e in range(nE):
    vs=np.where(d0[e]!=0)[0]
    for v in vs: T[pos[(e,v)],e]=0.5*d0[e,v]          # a(e,v') - a(e,v) = theta_e with d0 orientation
M=d1.T@d1; w,U=np.linalg.eigh(M); Bp=U[:,w>1e-9]; mM=w[w>1e-9]; assert Bp.shape[1]==19
Kf=T.T@HE@T
# relaxed: minimise over the complement of range(T) (pseudo-inverse handles gauge null space)
Q=np.linalg.svd(np.eye(L)-T@np.linalg.pinv(T))[0][:,:L-nE]
Kr=Kf-(T.T@HE@Q)@np.linalg.pinv(Q.T@HE@Q)@(Q.T@HE@T)
out={"15TrMplus":float(15*np.sum(1/mM)),"M_levels":levels(mM)}
for name,K in (("frozen",Kf),("relaxed",Kr)):
    A=Bp.T@K@Bp; kv=np.linalg.eigvalsh(A)
    kap=np.linalg.eigvalsh((Bp/np.sqrt(mM)).T@K@(Bp/np.sqrt(mM)))
    out[name]={"ward":float(np.linalg.norm(K@d0)),"commutator_with_M":float(np.linalg.norm(K@M-M@K)),
               "K_levels":levels(kv,6),"kappa=K/M_levels":levels(kap,6),"15_Tr_Kplus":float(15*np.sum(1/kv)),"Tr_K":float(kv.sum()),
               "pairs(M,K)":[(round(float(m),6),round(float(np.mean(np.linalg.eigvalsh(Bp[:,np.abs(mM-m)<1e-6].T@K@Bp[:,np.abs(mM-m)<1e-6]))),6)) for m in sorted(set(np.round(mM,6)))]}
print(json.dumps(out,indent=1))
json.dump(out,open(os.path.join(os.path.dirname(os.path.abspath(__file__)),"HODGE_DIRAC_19_MODE_PHOTON_2026_11_11.json"),"w"),indent=1)
# the frozen reduction is NOT gauge invariant (edge-face phases must compensate); only the relaxed one is a photon kernel
assert out["relaxed"]["ward"]<1e-5 and out["frozen"]["ward"]>1e-2 and abs(out["15TrMplus"]-137)<1e-9
assert min(v for v,_ in out["relaxed"]["K_levels"])>0
print("PASS: relaxed 19-mode kernel is gauge invariant and positive; kappa = K/M is not constant (no exact Maxwell form).")

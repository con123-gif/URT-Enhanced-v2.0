import sys, numpy as np, scipy.linalg as sl
import os; D=os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0,D)
import INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10 as K, INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10 as VS
nl=K.nlink; th=np.load(D+"/theta_star_2026_11_10.npy"); pb=VS.physical_basis()
def loopmat(cs):
    C=np.zeros((len(cs),nl))
    for i,c in enumerate(cs):
        for l,sg in c: C[i,l]+=sg
    return C
C3=loopmat(VS.cycles(3)); C4=loopmat(VS.cycles(4))
def report(name,theta,C):
    Pi,_,_=K.kernels(K.H_of(theta),theta=theta)
    A=pb.T@Pi@pb; M=pb.T@(C.T@C)@pb
    w,V=np.linalg.eigh(M); keep=w>1e-9*w.max(); r=int(keep.sum())
    T=V[:,keep]/np.sqrt(w[keep]); k=np.linalg.eigvalsh(T.T@A@T)
    hs=np.sum(A*M)/np.sum(M*M); res=np.linalg.norm(A-hs*M)/np.linalg.norm(A)
    print(f"{name:34s} rank(M)={r:3d}/481  kappa min {k.min():+.5f} median {np.median(k):+.5f} max {k.max():+.5f} | best single kappa {hs:.6f} (4pi*k={4*np.pi*hs:.4f}), residual {100*res:.1f}%")
z=np.zeros(nl)
report("theta*  triangles",th,C3); report("theta*  triangles+squares",th,np.vstack([C3,C4])); report("theta*  squares",th,C4)
report("theta=0 triangles",z,C3); report("theta=0 triangles+squares",z,np.vstack([C3,C4]))

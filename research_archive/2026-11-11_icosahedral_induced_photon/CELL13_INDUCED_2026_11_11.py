import sys,os,json,numpy as np
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
from cell13_lib import *
n,E,F,d0,d1=build(True); m=len(E)
M=d1.T@d1; P,g,H=Pi_logdet(E,n)
w,U=np.linalg.eigh(M); B=U[:,w>1e-9]; out={"links":m,"faces":len(F),"physical_modes":int(B.shape[1])}
out["det_H13"]=float(np.linalg.det(H).real); out["grad_norm"]=float(np.linalg.norm(g)); out["ward"]=float(np.linalg.norm(P@d0))
out["M_levels"]=levels(w[w>1e-9]); out["15TrMplus"]=float(15*np.sum(1/w[w>1e-9])); out["13TrMplus"]=float(13*np.sum(1/w[w>1e-9]))
A=B.T@P@B; out["Pi_levels"]=levels(np.linalg.eigvalsh(A)); out["comm_Pi_M"]=float(np.linalg.norm(P@M-M@P))
pw=np.linalg.eigvalsh(A); pos=pw[pw>1e-9]; out["TrPiplus_on_positive"]=float(np.sum(1/pos)); out["n_pos"]=int(len(pos)); out["n_neg"]=int((pw<-1e-9).sum())
print(json.dumps(out,indent=1))

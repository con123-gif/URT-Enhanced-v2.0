import sys, math, numpy as np
from scipy.linalg import expm, expm_frechet, eigh
sys.path.insert(0,'/mnt/data');import active_core as m
phi=m.phi; Delta=m.delta; D=3

def eigenframe(H):
 H=(H+H.conj().T)/2; w,v=np.linalg.eigh(H);return v[:,np.argsort(w)]
# passive quark
S5,S43,S45=m.S_ch;TQ=S5-S43+S45;crossQ=m.heat_cross(TQ,m.eta_Q,6);LQ,RQ=m.grading_basis(10);bQ=m.blocks(crossQ,LQ,RQ)
Ku=bQ[3,0].conj().T@bQ[3,0];Kd=bQ[0,0].conj().T@bQ[0,0]
# passive lepton work/entropy
_,L43,L45=m.L_ch;TL=L43-L45;alpha=float(np.linalg.eigvalsh(TL)[-1]);AL=m.eta_L*(TL-alpha*np.eye(TL.shape[0]));heat=expm(AL)
f43=expm_frechet(AL,m.eta_L*L43,compute_expm=False);f45=expm_frechet(AL,-m.eta_L*L45,compute_expm=False)
inc=np.kron(m.D,np.eye(3))
def dc(K):return inc@K[30:,:30]@inc.T
LL,RL=m.grading_basis(56);be=m.blocks(dc(heat),LL,RL);b43=m.blocks(dc(f43),LL,RL);b45=m.blocks(dc(f45),LL,RL)
Ke=be[0,0].conj().T@be[0,0];Kn=b43[3,0].conj().T@b43[3,0]+b45[3,0].conj().T@b45[3,0]
charges={'u':np.array([1.,3.,-4.]),'d':np.array([1.,-3.,2.]),'e':np.array([-3.,-3.,6.]),'nu':np.array([-3.,3.,0.])}
Ks={'u':Ku,'d':Kd,'e':Ke,'nu':Kn}

def load(q,a,b):
 q=q/np.linalg.norm(q);P=np.outer(q,q);return math.exp(a)*P+math.exp(b)*(np.eye(3)-P)
def genframe(K,Z,mode):
 if mode=='generalized':
  w,v=eigh((K+K.conj().T)/2,Z);return v[:,np.argsort(w)]
 if mode=='sandwich':
  wz,Vz=np.linalg.eigh(Z);Zh=Vz@np.diag(wz**-.5)@Vz.T;return eigenframe(Zh@K@Zh)

def obs(F):
 V=F['u'].conj().T@F['d'];U=F['e'].conj().T@F['nu'];A=np.abs(U);s13=A[0,2]**2
 J=lambda X:float(np.imag(X[0,0]*X[1,1]*np.conj(X[0,1])*np.conj(X[1,0])))
 return [abs(V[0,1]),abs(V[1,2]),abs(V[0,2]),J(V),A[0,1]**2/(1-s13),A[1,2]**2/(1-s13),s13,J(U)]
forms=[]
for mode in ['generalized','sandwich']:
 for a,b,label in [(math.log(phi),-math.log(phi),'phi_pm1'),(2*math.log(phi),-2*math.log(phi),'phi_pm2'),(math.log(phi),0,'phi_parallel'),(0,math.log(phi),'phi_perp'),(Delta*phi**3,-Delta*phi**3,'gap_phi3'),(Delta*phi**6,-Delta*phi**6,'gap_phi6')]:
  F={s:genframe(Ks[s],load(charges[s],a,b),mode) for s in Ks}; forms.append((mode,label,obs(F)))
for x in forms:print(x)
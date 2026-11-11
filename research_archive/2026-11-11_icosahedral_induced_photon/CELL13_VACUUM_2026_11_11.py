import sys,os,json,collections,numpy as np
from scipy.optimize import minimize
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
from cell13_lib import *
n,E,F,d0,d1=build(True); m=len(E)
def fg(th):
    H=Hadj(E,n,th); G=np.linalg.inv(H); g=np.empty(m)
    for k,(i,j) in enumerate(E):
        u=np.exp(1j*th[k]); g[k]=-((G[j,i]*1j*u)+(G[i,j]*(-1j)*np.conj(u))).real
    return -np.linalg.slogdet(H)[1], g
w,U=np.linalg.eigh(d0@d0.T); PB=U[:,w<1e-9]          # 30 physical (coexact+harmonic) directions
rng=np.random.default_rng(13); found=[]
N=int(sys.argv[1]) if len(sys.argv)>1 else 60
for t in range(N):
    r=minimize(fg,rng.uniform(-np.pi,np.pi,m),jac=True,method="L-BFGS-B",options={"maxiter":4000,"gtol":1e-11,"ftol":1e-16})
    th=r.x
    for _ in range(6):
        P,g,H=Pi_logdet(E,n,th); b=PB.T@g
        if np.linalg.norm(b)<1e-13: break
        A=PB.T@P@PB
        if np.linalg.eigvalsh(A).min()<1e-9: break
        th=th-PB@np.linalg.solve(A,b)
    P,g,H=Pi_logdet(E,n,th); A=PB.T@P@PB; hw=np.linalg.eigvalsh(A)
    fl=(d1@th+np.pi)%(2*np.pi)-np.pi
    found.append((round(fg(th)[0],9),float(np.linalg.norm(PB.T@g)),hw,fl,th))
G0=fg(np.zeros(m))[0]
vals=collections.Counter(f[0] for f in found)
print("Gamma(0) =",G0," = -log 1500 =",-np.log(1500))
for v,c in sorted(vals.items()):
    f=next(x for x in found if x[0]==v)
    outer=collections.Counter(np.round(np.abs(f[3][:20])/np.pi,6)); inner=collections.Counter(np.round(np.abs(f[3][20:])/np.pi,6))
    print(f"Gamma={v:.9f} x{c}  exp(-Gamma)=|det|={np.exp(-v):.6f}  |grad|={f[1]:.1e}  Hess min {f[2].min():.6f} max {f[2].max():.6f} #<=1e-8: {(f[2]<1e-8).sum()}")
    print("    outer-face |flux|/pi:",dict(sorted(outer.items())),"\n    inner-face |flux|/pi:",dict(sorted(inner.items())))
best=min(found,key=lambda x:x[0]); np.save("cell13_theta_star.npy",best[4])
print("Hessian levels at best:",levels(best[2],6))
print("|eig H| levels at best:",levels(np.abs(np.linalg.eigvalsh(Hadj(E,n,best[4]))),7))

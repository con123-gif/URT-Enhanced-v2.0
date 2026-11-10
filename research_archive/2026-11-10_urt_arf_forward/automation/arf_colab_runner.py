"""Newton's Cathedral: no-fit 64-history/24-clock verification and 3-minute Colab research loop.
Run once: python arf_colab_runner.py --once
Run repeatedly: python arf_colab_runner.py --minutes 3
The periodic loop requires an active process (e.g., Colab runtime). No physical ARF is presumed.
"""
import argparse, json, math, time, datetime, os
import numpy as np
from itertools import product
from scipy.spatial import ConvexHull

def check():
    phi=(1+math.sqrt(5))/2; r=math.pi/math.e
    delta=3/20-80*math.pi/(1053*phi)
    verts=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
    faces=sorted({tuple(sorted(map(int,t))) for t in ConvexHull(verts).simplices})
    C=np.zeros((20,12));adj=np.zeros((20,20))
    for i,f in enumerate(faces):
        C[i,list(f)]=1
        for j in range(i):
            if len(set(f)&set(faces[j]))==2:adj[i,j]=adj[j,i]=1
    L=3*np.eye(20)-adj
    Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
    P3=Ph@(5*np.eye(20)-L)/2;P5=Ph@(L-3*np.eye(20))/2
    pairs=[];remain=set(range(12))
    while remain:
        i=min(remain);j=min(remain-{i},key=lambda k:np.linalg.norm(verts[i]+verts[k]))
        pairs.append((i,j));remain-={i,j}
    M=np.zeros((64,20))
    for s in range(64):
        chosen={pairs[i][(s>>i)&1] for i in range(6)}
        for k,f in enumerate(faces):
            if set(f).issubset(chosen):M[s,k]=1
    U=M@Ph/math.sqrt(2)
    isometry=float(np.linalg.norm(U.T@U-Ph))
    ranks=[int(np.linalg.matrix_rank(U@P,tol=1e-9)) for P in (P3,P5,Ph)]
    # Full 24-clock resolvent: Fourier eigenvalues and direct inverse agree.
    q=2; theta=2*math.pi/phi**2; N=24
    D=np.zeros((N,N),complex)
    for t in range(N):D[t,(t+1)%N]=1;D[t,t]=-np.exp(1j*q*theta)
    clockL=D.conj().T@D
    k=2*math.pi*np.arange(N)/N
    lam=2-2*np.cos(k-q*theta)
    # Test all 24 eigenvalues as multisets; uniform link gauge can shift Fourier labels.
    spectral_error=float(np.max(np.abs(np.sort(np.linalg.eigvalsh(clockL))-np.sort(lam))))
    resolvent={}; corrlength={}
    for name,E in [('3',18),('5',16)]:
        A=E*np.eye(N)+r*r*clockL
        inverse=np.linalg.inv(A)
        # Circulant Fourier reconstruction, with eigenvalue from directly measured D on Fourier mode.
        F=np.exp(1j*np.outer(np.arange(N),k))/math.sqrt(N)
        spectral_diag=np.real(np.diag(F.conj().T@clockL@F))
        reconstruction=(F*(1/(E+r*r*spectral_diag))[None,:])@F.conj().T
        resolvent[name]=float(np.linalg.norm(inverse-reconstruction))
        corrlength[name]=float(1/math.acosh(1+E/(2*r*r)))
    # Exact six-step finite-memory symbolic URT shift, with no fitted parameters.
    Q=np.zeros((64,64))
    for h in range(64):Q[h,(2*h)%64]+=.5;Q[h,(2*h+1)%64]+=.5
    ranksQ=[];power=np.eye(64)
    for j in range(7):
        ranksQ.append(int(np.linalg.matrix_rank(power,tol=1e-10)))
        power=power@Q
    sixstep=float(np.linalg.norm(np.linalg.matrix_power(Q,6)-np.ones((64,64))/64))
    assert isometry<1e-10 and ranks==[4,4,8]
    assert spectral_error<1e-10 and max(resolvent.values())<1e-10
    assert ranksQ==[64,32,16,8,4,2,1] and sixstep<1e-10
    return dict(utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),delta=delta,hidden_isometry_error=isometry,hidden_ranks=ranks,clock_spectrum_error=spectral_error,clock_inverse_errors=resolvent,clock_correlation_lengths=corrlength,history_ranks=ranksQ,six_step_mixing_error=sixstep,physical_four_ARFs_derived=False)

def main():
    p=argparse.ArgumentParser();p.add_argument('--once',action='store_true');p.add_argument('--minutes',type=float,default=3);p.add_argument('--output',default='arf_results.jsonl');args=p.parse_args()
    while True:
        try:
            result=check()
            print(json.dumps(result),flush=True)
            with open(args.output,'a') as f:f.write(json.dumps(result)+'\n')
        except Exception as exc:
            print('CHECK FAILED:',repr(exc),flush=True)
            raise
        if args.once:break
        time.sleep(max(1,args.minutes*60))
if __name__=='__main__':main()
#!/usr/bin/env python3
"""Native 3D golden-flux vacuum + onsite URT quantum gain + same-state horizon diagnostics.
Only the dynamics after a declared pump pulse is autonomous; the pulse itself is
externally driven, and no causal gravitational-horizon identification is assumed.
"""
import numpy as np
import sys
from math import pi,e,sqrt,log,sin,cos
from itertools import product

alpha=pi/e
phi=(1+sqrt(5))/2
theta=2*pi/phi**2
s=sqrt(alpha*alpha-1)

def native(n,f):
    xyz=list(product(range(n),repeat=3)); m=len(xyz);pos={x:i for i,x in enumerate(xyz)}
    L=np.zeros((m,m),complex)
    edges=[]
    for i,x in enumerate(xyz):
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y not in pos:continue
            j=pos[y];U=np.exp(1j*f*x[(a-1)%3]);v=np.zeros(m,complex);v[i]=1;v[j]=-np.conj(U)
            L+=np.outer(v,v.conj());edges.append((i,j,v))
    return xyz,L,edges

def real(H):return np.block([[H.real,-H.imag],[H.imag,H.real]])

def sqroot(H):
    lam,U=np.linalg.eigh(H); assert min(lam)>1e-9
    return (U*np.sqrt(lam))@U.T,(U*(1/np.sqrt(lam)))@U.T

def ent(gamma,choice):
    nt=gamma.shape[0]//2; sites=np.array(choice,dtype=int); num=len(sites)
    ids=np.r_[sites,nt+sites]
    G=gamma[np.ix_(ids,ids)]
    U=np.zeros((num,num));I=np.eye(num);Omega=np.block([[U,I],[-I,U]])
    chol=np.linalg.cholesky(G)
    M=1j*(chol.T@Omega@chol)
    vals=np.linalg.eigvalsh(M);nu=vals[num:]
    assert np.max(abs(nu+vals[:num][::-1]))<1e-7
    assert min(nu)>.5-5e-8,(min(nu),num)
    n=np.maximum(nu-.5,0)
    terms=np.log1p(n)+np.where(n>1e-13,n*np.log1p(1/np.maximum(n,1e-300)),0)
    return float(sum(terms))

def gates(m):
    I=np.eye(m)
    A=np.block([[alpha*I,s*I],[s*I,alpha*I]])
    B=np.block([[alpha*I,-s*I],[-s*I,alpha*I]])
    t=np.block([[cos(theta)*A,-sin(theta)*B],[sin(theta)*A,cos(theta)*B]])
    nt=2*m;O=np.block([[np.zeros((nt,nt)),np.eye(nt)],[-np.eye(nt),np.zeros((nt,nt))]])
    assert np.linalg.norm(t@O@t.T-O)<1e-10
    return t

def free(m,W,t):
    lam,V=np.linalg.eigh(W);assert min(lam)>0
    C=(V*np.cos(lam*t))@V.T
    S=(V*np.sin(lam*t))@V.T
    WSin=(V*(lam*np.sin(lam*t)))@V.T
    WInvSin=(V*(np.sin(lam*t)/lam))@V.T
    I=np.eye(m);z=np.zeros((m,m))
    Cq=np.block([[C,z],[z,cos(t)*I]])
    Sp=np.block([[WInvSin,z],[z,sin(t)*I]])
    Wq=np.block([[-WSin,z],[z,-sin(t)*I]])
    Cp=Cq
    return np.block([[Cq,Sp],[Wq,Cp]])

def redshift_diag(n,xyz,edges,cut,L,W,WInv,G):
    M=len(xyz);m=2*M;nt=2*m
    sel=np.array([i for i,x in enumerate(xyz) if x[0]<cut]);Lsel=len(sel)
    cr=np.r_[sel,M+sel]; region=np.r_[cr,m+cr]
    d=np.array([cut-.5-xyz[i][0] for i in sel]);D=np.diag(d)
    local={x:i for i,x in enumerate(sel)}
    Lw=np.zeros((Lsel,Lsel),complex)
    for i,j,v in edges:
        if i not in local or j not in local:continue
        vv=v[sel]; Lw+=.5*(d[local[i]]+d[local[j]])*np.outer(vv,vv.conj())
    vals=np.linalg.eigvalsh(np.diag(np.sqrt(d))@Lw@np.diag(np.sqrt(d)))
    assert min(vals)>0
    eR=sum(np.sqrt(vals))
    Q=G[np.ix_(cr,cr)];P=G[np.ix_(nt+cr,nt+cr)]
    E=.5*(np.trace(real(D)@P)+np.trace(real(Lw)@Q))
    XR=E-eR
    return XR,E,eR,cr,region

def case(n,f,alltimes=(0.,.6,1.2)):
    xyz,L,edges=native(n,f);M=len(xyz);m=2*M;nt=2*m;K=real(L)
    W,Winv=sqroot(K)
    m0=np.zeros((nt,nt));Q=m0.copy();P=m0.copy()
    Q[:m,:m]=.5*Winv;P[:m,:m]=.5*W
    Q[m:,m:]=.5*np.eye(m);P[m:,m:]=.5*np.eye(m)
    vac=np.block([[Q,m0],[m0,P]])
    pump=gates(m)
    Gu=np.zeros((m,m))
    for i in range(M):
        ang=theta*(i+1);cs,sn=np.cos(ang),np.sin(ang)
        Gu[i,i]=cs;Gu[i,M+i]=-sn
        Gu[M+i,i]=sn;Gu[M+i,M+i]=cs
    G=np.block([[Gu,np.zeros_like(Gu)],[np.zeros_like(Gu),Gu]])
    Gb=np.block([[G,np.zeros_like(G)],[np.zeros_like(G),G]])
    assert np.linalg.norm(pump@Gb-Gb@pump)<1e-10
    g0=pump@vac@pump.T
    Hess=np.block([[np.block([[K,np.zeros((m,m))],[np.zeros((m,m)),np.eye(m)]]),np.zeros((nt,nt))],[np.zeros((nt,nt)),np.eye(nt)]])
    Er=lambda g:.5*np.trace(Hess@g)
    Ev=Er(vac);E0=Er(g0)
    def component_energies(g):
        q=g[:nt,:nt];p=g[nt:,nt:]
        ES=.5*(np.trace(K@q[:m,:m])+np.trace(p[:m,:m]))
        EI=.5*(np.trace(q[m:,m:])+np.trace(p[m:,m:]))
        return ES,EI
    ES0,EI0=component_energies(vac)
    ESp,EIp=component_energies(g0)
    assert ESp>ES0 and EIp>EI0
    assert abs((ESp-ES0)+(EIp-EI0)-(E0-Ev))<1e-8
    assert E0>Ev
    cap=(alpha*alpha-1)*np.trace(K@(.5*Winv)+.5*np.eye(m))
    cut=n//2
    Bseam=np.zeros_like(L)
    crossing=0
    for i,j,v in edges:
        if (xyz[i][0]<cut)!=(xyz[j][0]<cut):
            crossing+=1
            Bseam+=np.outer(v,v.conj())
    assert crossing==n*n
    Lsplit=L-Bseam
    Wsplit,_=sqroot(real(Lsplit))
    energy_seam=lambda g:.5*np.trace(real(Bseam)@g[:m,:m])
    assert energy_seam(g0)>0
    sel=[i for i,x in enumerate(xyz) if x[0]<cut];signal=np.r_[sel, M+np.array(sel)]
    region=np.r_[signal,m+signal]
    S0=ent(vac,region)
    Ssig0=ent(vac,signal)
    Sfull0=ent(g0,region)
    Ssigpump=ent(g0,signal)
    assert abs(Sfull0-S0)<1e-8,(Sfull0,S0)
    assert Ssigpump>Ssig0
    for t in alltimes:
        F=free(m,W,t);g=F@g0@F.T
        E=Er(g)
        assert abs(E-E0)<1e-8*E0,(n,f,t,E,E0)
        ES,EI=component_energies(g)
        assert abs(ES-ESp)<1e-8*E0 and abs(EI-EIp)<1e-8*E0
        Sfull=ent(g,region);Ssig=ent(g,signal)
        g_split=free(m,Wsplit,t)@g0@free(m,Wsplit,t).T
        Ssplit=ent(g_split,region)
        assert abs(Ssplit-S0)<1e-8,(n,f,t,Ssplit,S0)
        XR,ER,eR,_,_=redshift_diag(n,xyz,edges,cut,L,W,Winv,g)
        XRsplit,_,_,_,_=redshift_diag(n,xyz,edges,cut,L,W,Winv,g_split)
        deltaS=Sfull-Ssplit
        deltaXR=XR-XRsplit
        if t>0:print(f'   causal_crosscut_delta_S={deltaS:.10f} causal_delta_Xred={deltaXR:.10f} ratio_2pi_deltaX_per_deltaS={2*pi*deltaXR/deltaS:.9f} area_entropy={Sfull/n**2:.10f}',flush=True)
        if t==0:
            XRvac,_,_,_,_=redshift_diag(n,xyz,edges,cut,L,W,Winv,vac)
            assert XR>XRvac
            print(f'  initial true-vacuum redshift X_R={XRvac:.12f}; pumped X_R={XR:.12f}; entropy unchanged={abs(Ssplit-S0):.3e}',flush=True)
        print(f'cube={n} flux={f:+.6f} t={t:.2f} Etotal={E:.10f} dE_pump={E0-Ev:.10f} S_full_A={Sfull:.10f} S_signal_A={Ssig:.10f} S_no_seam={Ssplit:.10f} seam_E={energy_seam(g):.10f} X_redshift_signal={XR:.10f} eta_signal={2*pi*XR/Ssig:.10f}',flush=True)
    print(f'initial n={n} flux={f:+.6f} entropy cut S0={S0:.10f} after onsite pump={Sfull0:.10f}; signal-only initial={Ssig0:.10f} after={Ssigpump:.10f}; dE_signal={ESp-ES0:.10f} dE_idler={EIp-EI0:.10f} dE_total={E0-Ev:.10f}',flush=True)

if __name__=='__main__':
    sizes=(2,3,4,5) if '--full' in sys.argv else (2,4)
    for n in sizes:
        for f in (-theta,pi-theta):
            case(n,f)
    print('PASS: native N=2,4 quick / N=2..5 full two-sector exact onsite quantum gain; pump-induced local entropy not horizon entropy; only true cross-cut native seams change bipartite entropy; exact closed free dynamics conserves total energy; same-state redshift response not universal')

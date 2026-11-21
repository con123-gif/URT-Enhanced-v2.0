#!/usr/bin/env python3
"""Native magnetic sheet Gaussian covariance + CLASSICAL rotor Ehrenfest exchange."""
import math
import numpy as np
from scipy.linalg import eigh
from scipy.integrate import solve_ivp
phi=(1+math.sqrt(5))/2;theta=2*math.pi/phi**2

def graph(eps):
    f=float(np.angle(eps*np.exp(-1j*theta)));L=np.zeros((4,4),complex)
    for y in range(2):
        for x in range(2):
            i=x+2*y
            for xx,yy,power in ((x+1,y,0),(x,y+1,x)):
                if xx>=2 or yy>=2:continue
                j=xx+2*yy;w=np.exp(1j*f*power)
                L[i,i]+=1;L[j,j]+=1;L[i,j]-=w;L[j,i]-=w.conjugate()
    return L
def realify(L):
    return np.block([[L.real,-L.imag],[L.imag,L.real]])
def blockdiag(A,B):
    z=np.zeros_like(A);return np.block([[A,z],[z,B]])

def run(eps):
    L=graph(eps);Ks=realify(L);Ki=realify(L.conj());m=4;d=2*m
    eigs,Us=eigh(Ks);eig_i,Ui=eigh(Ki)
    assert min(eigs)>0 and min(eig_i)>0
    W=(Us*np.sqrt(eigs))@Us.T;Wi=(Ui*np.sqrt(eig_i))@Ui.T
    V=(Us/np.sqrt(eigs))@Us.T;Vi=(Ui/np.sqrt(eig_i))@Ui.T
    K=blockdiag(Ks,Ki);n=2*d
    Q0=blockdiag(.5*V,.5*Vi);P0=blockdiag(.5*W,.5*Wi)
    Sigma0=blockdiag(Q0,P0)
    f=abs(float(np.angle(eps*np.exp(-1j*theta))))
    g2=1-math.cos(f/4);g=.5*math.sqrt(g2);inertia=1.
    J=np.block([[np.zeros((n,n)),np.eye(n)],[-np.eye(n),np.zeros((n,n))]])
    y0=np.r_[Sigma0.reshape(-1),np.zeros(m),np.ones(m)]
    def matrices(chi):
        a=np.r_[g*np.sin(chi),-g*np.sin(chi)]
        A=np.diag(a);z=np.zeros((d,d))
        X=np.block([[z,A],[A,z]])
        Hmat=np.block([[K,X],[X.T,np.eye(n)]])
        return Hmat,X
    def fun(t,y):
        Sig=y[:(2*n)**2].reshape((2*n,2*n))
        chi=y[(2*n)**2:(2*n)**2+m];pp=y[(2*n)**2+m:]
        Hmat,X=matrices(chi);F=J@Hmat
        Sdot=F@Sig+Sig@F.T;S_PQ=Sig[n:,:n]
        fchi=np.zeros(m)
        for x in range(m):
            dx=np.zeros((d,d))
            dx[x,x]=g*math.cos(chi[x])
            dx[x+m,x+m]=-g*math.cos(chi[x])
            DX=np.block([[np.zeros((d,d)),dx],[dx,np.zeros((d,d))]])
            fchi[x]=-float(np.trace(DX@S_PQ).real)
        return np.r_[Sdot.reshape(-1),pp/inertia,fchi]
    def energies(y):
        Sig=y[:(2*n)**2].reshape((2*n,2*n))
        chi=y[(2*n)**2:(2*n)**2+m];pp=y[(2*n)**2+m:]
        Hmat,X=matrices(chi)
        field=.5*float(np.trace(Hmat@Sig).real)
        free=.5*float(np.trace(K@Sig[:n,:n]+Sig[n:,n:]).real)
        rot=float(np.sum(pp**2)/(2*inertia))
        return field,free,rot,field+rot
    sol=solve_ivp(fun,[0,6],y0,method='DOP853',rtol=3e-10,
                  atol=1e-11,t_eval=[0,2,4,6])
    assert sol.success,sol.message
    ee=[energies(sol.y[:,k]) for k in range(len(sol.t))]
    assert max(abs(v[-1]-ee[0][-1]) for v in ee)<1e-6,(eps,ee)
    assert abs(ee[-1][2]-ee[0][2])>1e-6
    print('eps',eps,'time, field, free, rotor, total:')
    for t,e in zip(sol.t,ee):
        print(f' t={t:.0f}: '+', '.join(f'{x:.12f}' for x in e))
for e in (1,-1):run(e)
print('PASS: native conjugate magnetic sheet, time-independent local Gaussian+rotor mean-field dynamics, energy conserved')
print('NOT full rotor quantum dynamics or URT-selected creation law')

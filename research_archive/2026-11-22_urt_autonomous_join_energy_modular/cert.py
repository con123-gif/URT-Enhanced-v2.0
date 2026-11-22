#!/usr/bin/env python3
"""Native 3D golden-flux SHEET-PREPARATION and joining driven by a classical actuator.

A Gaussian quantum field + classical mechanical switch is an energy-conserving
semiclassical Hamiltonian. One sheet register is preexisting in a unit-frequency dormant state, NOT
created from nothing. The actuator supplies energy for activation and joining.
"""
from math import pi,e,sqrt,cos,sin,log
from itertools import product
import numpy as np
from scipy.integrate import solve_ivp
from scipy.linalg import eigh
import sys

alpha=pi/e
phi=(1+sqrt(5))/2
theta=2*pi/phi**2

def lattice(f,n=2):
    xyz=list(product(range(n),range(n),range(n+1)))
    ids={x:i for i,x in enumerate(xyz)}
    nsite=len(xyz)
    L=np.zeros((nsite,nsite),complex);B=np.zeros_like(L)
    seam=0
    for i,x in enumerate(xyz):
        for axis in range(3):
            y=list(x); y[axis]+=1;y=tuple(y)
            if y not in ids:continue
            j=ids[y]
            v=np.zeros(nsite,complex);v[i]=1
            # Preserve exact ORIGINAL source link Uaxis; vector v gives L_ij=-U.
            U=np.exp(1j*f*x[(axis-1)%3]);v[j]=-np.conj(U)
            mat=np.outer(v,v.conj());L+=mat
            if (x[2]<n)!=(y[2]<n):B+=mat;seam+=1
    Loff=L-B
    Nold=n**3;Ns=n*n
    old=np.array([i for i,x in enumerate(xyz) if x[2]<n])
    sheet=np.array([i for i,x in enumerate(xyz) if x[2]==n])
    assert seam==Ns
    assert np.max(abs(Loff[np.ix_(old,sheet)]))<1e-12
    assert np.linalg.eigvalsh(Loff)[0]>0
    return xyz,Loff,L,B,old,sheet

def r(H):return np.block([[H.real,-H.imag],[H.imag,H.real]])

def sqrtm_pair(K):
    w,V=np.linalg.eigh(K);assert min(w)>0
    return (V*np.sqrt(w))@V.T,(V*(1/np.sqrt(w)))@V.T

def gswitch(s):
    if s<=0:return 0.,0.
    if s>=1:return 1.,0.
    return 3*s*s-2*s*s*s,6*s-6*s*s

def entropy(cov, sites, nsite):
    # spatial subsystem includes both realifications and their momenta
    n=len(sites);nreal=2*nsite; d=4*nsite
    qindex=np.r_[sites,nsite+sites]
    pick=np.r_[qindex,nreal+qindex]
    G=cov[np.ix_(pick,pick)]
    H=np.zeros((2*n,2*n));I=np.eye(2*n)
    Omega=np.block([[H,I],[-I,H]])
    C=np.linalg.cholesky(G)
    vals=np.linalg.eigvalsh(1j*C.T@Omega@C)
    nu=vals[2*n:];assert min(nu)>.5-3e-9,(min(nu),n)
    occ=np.maximum(nu-.5,0)
    terms=np.log1p(occ)+np.where(occ>1e-12,occ*np.log1p(1/np.maximum(occ,1e-300)),0)
    return sum(terms)


def modular_and_redshift(Gfin,Wfull,Vfull,sheet,nsite,sheetL,Esheet):
    """Actual reduced-state modular energy and declared midpoint redshift.

    Reference state is the genuine fully linked magnetic Gaussian ground state.
    Relative entropy identity uses its exact Gaussian modular Hamiltonian.
    """
    nreal=2*nsite; site=np.asarray(sheet)
    qidx=np.r_[site,nsite+site]
    pidx=nreal+qidx
    Qref=.5*Vfull[np.ix_(qidx,qidx)]
    Pref=.5*Wfull[np.ix_(qidx,qidx)]
    Qcur=Gfin[np.ix_(qidx,qidx)]
    Pcur=Gfin[np.ix_(pidx,pidx)]
    Qp=2*Qref; Pp=2*Pref
    wq,vq=np.linalg.eigh(Qp)
    assert min(wq)>0
    qhalf=(vq*np.sqrt(wq))@vq.T
    qinvhalf=(vq/np.sqrt(wq))@vq.T
    lam,U=np.linalg.eigh(qhalf@Pp@qhalf)
    w=np.sqrt(lam)
    assert min(w)>1+1e-7,(min(w),w)
    eps=np.log((w+1)/(w-1))
    Aq=qinvhalf@(U*(eps*w))@U.T@qinvhalf
    Ap=qhalf@(U*(eps/w))@U.T@qhalf
    dK=.5*(np.trace(Aq@(Qcur-Qref))+np.trace(Ap@(Pcur-Pref)))
    n= len(sheet)
    d=2*nreal
    zero=np.zeros((nreal,nreal))
    Gref=np.block([[.5*Vfull,zero],[zero,.5*Wfull]])
    Sref=entropy(Gref,sheet,nsite)
    Scur=entropy(Gfin,sheet,nsite)
    dS=Scur-Sref
    relative_entropy=dK-dS
    assert relative_entropy>-2e-7,(dK,dS,relative_entropy)
    # Static lapse at the sheet (distance .5 from junction); unchanged
    # magnetic sheet stiffness, distinct from the true modular Hamiltonian.
    Dred=.5*np.eye(2*n)
    Mred=.5*r(sheetL)
    HRref=.5*(np.trace(Dred@Pref)+np.trace(Mred@Qref))
    HRcur=.5*(np.trace(Dred@Pcur)+np.trace(Mred@Qcur))
    XR_ref=HRref-.5*Esheet
    XR_cur=HRcur-.5*Esheet
    residual_quad=np.linalg.norm(Aq-2*pi*Mred)+np.linalg.norm(Ap-2*pi*Dred)
    assert residual_quad>1e-4
    print(f'modular_vs_boost_generator_frobenius_residual={residual_quad:.12f}')
    print(f'modular_reference_S={Sref:.12f} modular_dS={dS:.12f} modular_deltaK={dK:.12f} relative_entropy={relative_entropy:.12f} two_pi_delta_X_red={2*pi*(XR_cur-XR_ref):.12f}')
    print(f'X_red_ref={XR_ref:.12f} X_red_final={XR_cur:.12f} entropy_final={Scur:.12f} modular_residual_ratio={dK/dS if abs(dS)>1e-10 else float("nan"):.8f}')
    return dK,dS,relative_entropy,2*pi*(XR_cur-XR_ref)

def run(f,n=2,inertia=120.,full=False):
    xyz,Loff,Lfull,B,old,sheet=lattice(f,n)
    nsite=len(xyz); nreal=2*nsite; d=2*nreal
    # Dormant unit-frequency sheet register; native internal sheet links and
    # original seam BOTH activated by an autonomous mechanical switch.
    dormant=Loff.copy()
    dormant[np.ix_(sheet,sheet)]=np.eye(len(sheet))
    Koff=r(dormant); Kfull=r(Lfull); KB=Kfull-Koff
    assert np.linalg.eigvalsh(Koff)[0]>0
    # Native local U(1) gauge covariance of *every intermediate switch value*.
    ph=np.exp(1j*theta*np.arange(nsite)**2)
    gauge=np.diag(ph)
    Greal=r(gauge)
    for gtest in (0,.25,.75,1):
        zt=r((1-gtest)*(gauge@dormant@gauge.conj().T)+gtest*(gauge@Lfull@gauge.conj().T))
        direct=(1-gtest)*Koff+gtest*Kfull
        assert np.linalg.norm(zt-Greal@direct@Greal.T)<1e-10
    W0,V0=sqrtm_pair(Koff); W1,V1=sqrtm_pair(Kfull)
    Q0=V0/2;P0=W0/2
    Z=np.zeros_like(Q0)
    Gamma0=np.block([[Q0,Z],[Z,P0]])
    En0=.5*np.trace(W0)
    Enon=.5*np.trace(W1)
    sheetE=np.sum(np.sqrt(np.linalg.eigvalsh(Loff[np.ix_(sheet,sheet)])))
    joinE=Enon-En0
    # True decomposition: on-shell final vacuum = old + prepared native sheet
    # + original seam work. Initial dormant register has n^2 units of energy.
    Eold=np.sum(np.sqrt(np.linalg.eigvalsh(Loff[np.ix_(old,old)])))
    Edorm=len(sheet)*1.0
    Ejoin_native=Enon-Eold-sheetE
    assert abs(joinE-((sheetE-Edorm)+Ejoin_native))<1e-10
    urt_budget=2*(alpha**4-1)*sheetE
    one_cycle=2*(alpha**2-1)*sheetE
    kinetic_initial=urt_budget-Edorm
    # Crucially, reserve the DORMANT oscillator energy inside the SAME
    # two-cycle supply before placing remaining energy in the actuator.
    # Then full source budget pays native sheet preparation AND seam work.
    assert one_cycle < (joinE+Edorm) < urt_budget,(f,one_cycle,joinE+Edorm,urt_budget)
    assert kinetic_initial>joinE
    p0=sqrt(2*inertia*kinetic_initial)
    Id=np.eye(nreal)
    def area(s):
        gs,gd=gswitch(s)
        H=Koff+gs*KB
        return np.block([[Z,Id],[-H,Z]])
    def system(t,y):
        s,p=y[0],y[1]
        F=y[2:].reshape(d,d)
        # Symplectic dynamics on ORIGINAL off/full magnetic stiffness.
        A=area(s)
        g,der=gswitch(s)
        field=F[:nreal,:]
        Q=field@Gamma0@field.T
        # Hamiltonian force: derivative of quantum field energy.
        pprime=-.5*der*np.trace(KB@Q)
        return np.r_[p/inertia,pprime,(A@F).ravel()]
    init=np.r_[0.,p0,np.eye(d).ravel()]
    def finish(t,y):return y[0]-1
    finish.terminal=True;finish.direction=1
    tmax=max(70., 6*np.sqrt(inertia))
    solution=solve_ivp(system,(0,tmax),init,events=finish,rtol=8e-12,atol=8e-14,method='DOP853',max_step=.05)
    assert solution.success and len(solution.t_events[0])==1,(solution.message,solution.y[0,-1],f)
    tf=solution.t_events[0][0]
    yf=solution.y_events[0][0]
    def energy(s,p,F):
        gf,_=gswitch(s)
        cov=F@Gamma0@F.T
        H=Koff+gf*KB
        Efield=.5*(np.trace(H@cov[:nreal,:nreal])+np.trace(cov[nreal:,nreal:]))
        return float(Efield),float(p*p/(2*inertia)),cov
    Efin,Kfin,Gfin=energy(yf[0],yf[1],yf[2:].reshape(d,d))
    Etotal0=En0+kinetic_initial
    Etotal1=Efin+Kfin
    assert abs(Etotal1-Etotal0)<3e-7,(Etotal0,Etotal1)
    assert yf[0]>=.999999 and yf[1]>0 and Kfin>0
    assert Efin>=Enon-2e-9,(Efin,Enon)
    # New source budget identity: old native energy + the FULL two-cycle
    # reservoir equals final quantum energy + residual actuator energy.
    assert abs((Eold+urt_budget)-(Efin+Kfin))<3e-7
    # Source budget includes initial dormant sheet energy, not just the
    # classical actuator. The active native sheet+seam plus residual source
    # closes *exactly* to the original old native ground + assigned budget.
    assert abs((Efin-Eold)+Kfin-urt_budget)<3e-7
    Eex=Efin-Enon
    Espent=En0+kinetic_initial-Efin
    assert abs(Espent-Kfin)<3e-7
    assert (Efin-En0) >=joinE-1e-9
    assert kinetic_initial> Efin-En0
    C=np.block([[Z,Id],[-Id,Z]])
    Fend=yf[2:].reshape(d,d)
    assert np.linalg.norm(Fend@C@Fend.T-C)<3e-7
    S0=entropy(Gamma0,sheet,nsite)
    Sf=entropy(Gfin,sheet,nsite)
    assert S0<1e-6 and Sf>S0+1e-4,(Sf,S0)
    work_exact=Efin-En0
    print('sector=',round(f,9),'n=',n,'inertia=',inertia,'t_final=',tf,'switch_position=',yf[0],'seam_links=',n*n)
    print('sheet_ground=',sheetE,'dormant_sheet_ground=',Edorm,'native_seam_ground_work=',Ejoin_native,'native_sheet_activation_ground_work=',sheetE-Edorm,'one_cycle_budget=',one_cycle,'two_cycle_budget=',urt_budget)
    print('dormant_plus_old_ground=',En0,'native_full_ground=',Enon,'activation_plus_join_min_work=',joinE)
    print('full_source_delivered_to_native=',Efin-Eold,'remaining_source_actuator=',Kfin,'full_source_budget=',urt_budget)
    print('actual_quantum_work=',work_exact,'nonadiabatic_excitation=',Eex,'remaining_actuator_kinetic=',Kfin,'total_energy_error=',Etotal1-Etotal0)
    print('S_cut_before=',S0,'S_cut_after=',Sf,'S_cut_per_seam=',Sf/(n*n),'symplectic_error=',np.linalg.norm(Fend@C@Fend.T-C))
    dK,dS,Drel,dXR=modular_and_redshift(Gfin,W1,V1,sheet,nsite,Loff[np.ix_(sheet,sheet)],sheetE)
    # Across the original seam, the vacuum and the joined state need not be
    # thermal for the previously declared weighted horizon Hamiltonian.
    # Compare exact entanglement first law / relative entropy against
    # the actual FINAL joined ground state as a fixed reference, if faithful.
    return dict(n=n,f=f,tf=tf,joinE=joinE,actualWork=work_exact,exc=Eex,Sf=Sf,Kfin=Kfin,totalError=Etotal1-Etotal0,budget=urt_budget,sheetE=sheetE,dK=dK,dS=dS,Drel=Drel,dXR=dXR)

if __name__=='__main__':
    inertias=(150.,300.,1000.,4000.) if '--full' in sys.argv else (300.,)
    for I in inertias:
        for f in (-theta,pi-theta):
            run(f,inertia=I)
    print('PASS: native 3D sheet and seam preparation under a Hamiltonian classical actuator; assigned pi/e two-cycle source budget pays all dormant/activation/join costs; gauge covariance, energy conservation, entanglement and exact modular/relative-entropy ledger; geometric boost mismatch remains')

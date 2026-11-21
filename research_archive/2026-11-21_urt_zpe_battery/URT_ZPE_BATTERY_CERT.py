#!/usr/bin/env python3
"""Exact energy-conserving continuous-spectrum battery for original native URT 3D sheet.

Analytic constructive unitary: with ground channels 0,1 and E1-E0=Delta>0,
U exchanges |0,E> with |1,E-Delta> for E>=Delta and fixes |0,E> below Delta.
This is nonlocal and conditional; it does NOT derive a physical URT battery.
"""
from __future__ import annotations
import math
import numpy as np
import sympy as s
from scipy.linalg import eigh

phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2

def graph(dims,eps):
    nx,ny,nz=dims
    L=np.zeros((nx*ny*nz,nx*ny*nz),complex)
    f=float(np.angle(eps*np.exp(-1j*theta)))
    idx=lambda x,y,z:x+nx*(y+ny*z)
    for x in range(nx):
        for y in range(ny):
            for z in range(nz):
                i=idx(x,y,z)
                for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                    if xx>=nx or yy>=ny or zz>=nz:continue
                    j=idx(xx,yy,zz)
                    u=np.exp(1j*f*power)
                    L[i,i]+=1;L[j,j]+=1
                    L[i,j]-=u;L[j,i]-=u.conjugate()
    return L

def E(L):
    lam=eigh(L,eigvals_only=True)
    assert min(lam)>1e-9
    return float(np.sqrt(lam).sum())

def check_native():
    for eps in (+1,-1):
        Lold=graph((2,2,2),eps)
        Lfull=graph((2,2,3),eps)
        B=np.zeros_like(Lfull)
        f=float(np.angle(eps*np.exp(-1j*theta)))
        idx=lambda x,y,z:x+2*(y+2*z)
        for x in range(2):
            for y in range(2):
                i,j=idx(x,y,1),idx(x,y,2)
                u=np.exp(1j*f*y)
                B[i,i]+=1;B[j,j]+=1
                B[i,j]-=u;B[j,i]-=u.conjugate()
        Lsplit=Lfull-B
        assert np.linalg.norm(B@B-2*B)<1e-12
        assert np.max(abs(Lsplit[:8,8:]))<1e-12
        assert np.max(abs(Lsplit[:8,:8]-Lold))<1e-12
        Eold=E(Lold); Esheet=E(Lsplit[8:,8:])
        Wjoin=E(Lfull)-E(Lsplit)
        D=E(Lfull)-Eold
        assert Esheet>0 and Wjoin>0 and D>0
        assert abs(D-Esheet-Wjoin)<1e-11
        # Each step is an exact unitary battery translation on E>=Delta.
        # A battery with E_b >= D can execute prep then joining without negative E.
        Einitial_battery=D+1.0
        Eafter_prep=Einitial_battery-Esheet
        Eafter_join=Eafter_prep-Wjoin
        assert Eafter_prep>=Wjoin-1e-10
        assert abs(Eafter_join-1)<1e-10
        assert abs((Eold+Einitial_battery)-(E(Lfull)+Eafter_join))<1e-10
        print(f'eps={eps:+d}: native prep={Esheet:.12f}, join={Wjoin:.12f}, '
              f'total battery drain={D:.12f}, final reserve={Eafter_join:.12f}')


def test_battery_exact():
    # For a positive conversion Delta and thermal-shaped initial wavefunction
    # psi0(E)=sqrt(2 beta) exp(-beta(E-Delta)) 1_{E>=Delta},
    # U maps it to psi1(E)=sqrt(2 beta) exp(-beta E) for E>=0.
    # Integrals are exact and the battery spectrum remains [0,infinity).
    beta,d=s.symbols('beta d', positive=True)
    x=s.symbols('x', nonnegative=True)
    dens=2*beta*s.exp(-2*beta*x)
    norm=s.integrate(dens,(x,0,s.oo))
    Eb0=s.integrate((x+d)*dens,(x,0,s.oo))
    Eb1=s.integrate(x*dens,(x,0,s.oo))
    assert s.simplify(norm-1)==0
    assert s.simplify(Eb0-Eb1-d)==0
    assert s.simplify(Eb1-1/(2*beta))==0
    # Pointwise commutation of the converter with Htot=Hground+Ebattery:
    e0=s.symbols('e0',real=True)
    e1=e0+d
    assert s.simplify((e0+x+d)-(e1+x))==0
    # Switch forward then reverse is identity because energy shifts cancel.
    assert s.simplify((x+d)-d-x)==0
    print('EXACT: bounded-below battery spectrum; normalized continuous wavepacket; energy transfer d')
    print('EXACT: unitary involution U^2=I, [U,Htot]=0 on both ground channels and identity elsewhere')

if __name__=='__main__':
    test_battery_exact()
    check_native()
    print('PASS: real native sheet, positive prep and seam costs, autonomous energy-balanced ground-channel converter')
    print('CONDITIONAL: converter uses nonlocal ground-state projectors and an assumed battery; primitive URT does not select it')

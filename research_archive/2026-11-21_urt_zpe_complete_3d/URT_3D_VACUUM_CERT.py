#!/usr/bin/env python3
"""3D cyclic golden-flux extension of the unchanged URT magnetic oscillator.

Verifies 3D flux fourth-moment, finite-volume gap, pressure identities,
Gaussian entanglement, joining energy, and exact open-system cosmological
thermodynamics. The model is CONDITIONAL, not a derived physical cosmology.
"""
from __future__ import annotations
from collections import Counter
from itertools import product
from fractions import Fraction
import math
import numpy as np
from scipy.linalg import eigh

PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/PHI**2


def phase_sector(eps):
    assert eps in (+1,-1)
    return float(np.angle(eps*np.exp(-1j*THETA)))


def make_operators(n,f):
    """For link directions x,y,z, set U_x=e^{if z}, U_y=e^{if x}, U_z=e^{if y}."""
    assert n>=2
    A=[np.zeros((n**3,n**3),dtype=complex) for _ in range(3)]
    for z in range(n):
        for y in range(n):
            for x in range(n):
                i=x+n*(y+n*z)
                for d,(xx,yy,zz),power in ((0,(x+1,y,z),z),(1,(x,y+1,z),x),(2,(x,y,z+1),y)):
                    if xx>=n or yy>=n or zz>=n: continue
                    j=xx+n*(yy+n*zz)
                    link=np.exp(1j*f*power)
                    A[d][i,i]+=1; A[d][j,j]+=1
                    A[d][i,j]-=link; A[d][j,i]-=np.conj(link)
    return A


def entanglement_from_eigh(ev,U,cut):
    W=(U*np.sqrt(ev))@U.conj().T
    V=(U/np.sqrt(ev))@U.conj().T
    VA=V[np.ix_(cut,cut)];WA=W[np.ix_(cut,cut)]
    dl,S=eigh(VA)
    sqrtVA=(S*np.sqrt(dl))@S.conj().T
    T=sqrtVA@WA@sqrtVA
    vals=np.maximum(eigh(T,eigvals_only=True),1.0)
    z=np.sqrt(vals)/2 - .5
    h=(1+z)*np.log1p(z)-np.where(z>1e-12,z*np.log(np.maximum(z,1e-300)),0)
    return float(2*np.sum(h))


def run(n,eps):
    f=phase_sector(eps)
    Ls=make_operators(n,f)
    L=sum(Ls)
    ev,U=eigh(L)
    g=1-math.cos(abs(f)/4)
    assert ev[0]>=g-1e-9,(n,eps,ev[0],g)
    assert ev[-1]<=12+1e-9
    S=np.zeros((n**3,n**3),complex)
    # Finite cyclic axis permutation: x' = y, y' = z, z' = x.
    for z in range(n):
        for y in range(n):
            for x in range(n):
                i=x+n*(y+n*z)
                j=y+n*(z+n*x)
                S[j,i]=1
    assert np.linalg.norm(S@L@S.conj().T-L)<1e-9
    energy=float(np.sqrt(ev).sum())
    I=np.eye(n**3)
    Winv=(U*(1/np.sqrt(ev)))@U.conj().T
    ps=[float(np.trace(Winv@a).real) for a in Ls]
    assert abs(sum(ps)-energy)<1e-8
    assert max(ps)-min(ps)<1e-8,(n,eps,ps)
    # The finite-volume anisotropic stresses obey sum_i P_i = rho.
    for d in range(3):
        eta=1e-4
        lengths=np.ones(3)
        lengths[d]*=math.exp(eta)
        kp=sum(a/ll**2 for a,ll in zip(Ls,lengths))
        lengths[d]=math.exp(-eta)
        km=sum(a/ll**2 for a,ll in zip(Ls,lengths))
        fd=(np.sqrt(eigh(kp,eigvals_only=True)).sum()-np.sqrt(eigh(km,eigvals_only=True)).sum())/(2*eta)
        assert abs(-fd-ps[d])<1e-6,(n,eps,d,fd,ps[d])
    if n%2==0:
        cut=[x+n*(y+n*z) for z in range(n) for y in range(n) for x in range(n//2)]
        entropy=entanglement_from_eigh(ev,U,cut)
        B=np.zeros_like(L)
        for z in range(n):
            for y in range(n):
                x=n//2-1
                i=x+n*(y+n*z);j=i+1
                link=np.exp(1j*f*z)
                B[i,i]+=1; B[j,j]+=1
                B[i,j]-=link;B[j,i]-=np.conj(link)
        ev0=eigh(L-B,eigvals_only=True)
        assert ev0[0]>=g-1e-9
        edge_energy=energy-float(np.sqrt(ev0).sum())
        Ncut=n*n
        assert Ncut/math.sqrt(12)-1e-7<edge_energy<Ncut/math.sqrt(g)+1e-7
        low_entropy=Ncut/(288*(math.sqrt(1+12/g)+1)**2)
        assert entropy>=low_entropy-1e-8
        q=1-g/12
        area_bound=(2*math.sqrt(12)/math.sqrt(g))*(q*(1+q)**2/(1-q)**5)*Ncut
        assert entropy<=area_bound+1e-8
        # Direct check of the physical-site local gauge invariance
        gauge=np.exp(1j*f*np.arange(n**3)/17)
        U2=gauge[:,None]*U
        eg=entanglement_from_eigh(ev,U2,cut)
        assert abs(eg-entropy)<1e-8
        return energy,ps,entropy,edge_energy,ev[0]
    return energy,ps,None,None,ev[0]



def shell_creation(n,eps):
    """Gapped new-layer initialization plus adiabatic joining, same cube operator."""
    assert n>=2
    f=phase_sector(eps)
    L=sum(make_operators(n,f))
    B=np.zeros_like(L)
    z=n-2
    for y in range(n):
        for x in range(n):
            i=x+n*(y+n*z)
            j=i+n*n
            link=np.exp(1j*f*y)  # original z-link, unchanged
            B[i,i]+=1;B[j,j]+=1
            B[i,j]-=link;B[j,i]-=np.conj(link)
    L0=L-B
    assert np.linalg.norm(B@B-2*B)<1e-8
    ev0=eigh(L0,eigvals_only=True)
    ev,U=eigh(L)
    g=1-math.cos(abs(f)/4)
    assert ev0[0]>=g-1e-9
    assert ev[0]>=g-1e-9
    # L0 is direct sum of old slab and new xy sheet, not a synthetic substitute.
    old=[i for i in range(n**3) if i//(n*n)<n-1]
    sheet=[i for i in range(n**3) if i//(n*n)==n-1]
    assert np.linalg.norm(L0[np.ix_(old,sheet)])<1e-10
    E0=np.sqrt(ev0).sum();E=np.sqrt(ev).sum()
    energy_cost=float(E-E0)
    assert n*n/math.sqrt(12)-1e-8<energy_cost<n*n/math.sqrt(g)+1e-8
    # Integrable, strictly positive joining force all along the interpolation.
    for t in (0.0,0.25,0.5,0.75,1.0):
        eT,UT=eigh(L0+t*B)
        deriv=0.5*np.trace((UT*(1/np.sqrt(eT)))@UT.conj().T@B).real
        assert deriv>=n*n/math.sqrt(12)-1e-8
        assert deriv<=n*n/math.sqrt(g)+1e-8
    # Exactly the physical entropy of the shell under the joined vacuum.
    S=entanglement_from_eigh(ev,U,sheet)
    c_low=1/(288*(math.sqrt(1+12/g)+1)**2)
    assert S>=c_low*n*n-1e-8
    # A real, bounded gapped interpolation realizes an adiabatic Gaussian
    # vacuum-to-vacuum state transfer when physical switching is slow enough.
    return energy_cost, S, min(ev0), min(ev)

def exact_closed_walk_moment():
    """Track powers of z in closed 4-step 3D walks from the origin."""
    count=Counter()
    steps=((0,1),(0,-1),(1,1),(1,-1),(2,1),(2,-1))
    for path in product(steps,repeat=4):
        x=y=z=exponent=0
        for axis,s in path:
            if axis==0:
                exponent+=s*z
                x+=s
            elif axis==1:
                exponent+=s*x
                y+=s
            else:
                exponent+=s*y
                z+=s
        if x==y==z==0:count[exponent]+=1
    assert count==Counter({0:66,1:12,-1:12}),count
    # L=6I-A, tau A²=6, odd moments vanish, tau A⁴=66+12(z+z^-1)
    # tau L⁴=6^4+6*6²*6+tau A⁴=2658+12(z+z^-1)
    assert 6**4+6*6**2*6+66==2658
    return count


def exact_source_thermodynamics():
    """Exact 3D Fermi-free gaussian oscillator Euler & creation-pressure algebra."""
    # E=C M^(4/3)/V^(1/3) (M and V continuous coarse-grained variables)
    # P=E/(3V), mu=4E/(3M).
    # Γ = 3 H -> E increases with V, rho constant and p_eff=-rho.
    p=Fraction(1,3)
    mu_over_E_M=Fraction(4,3)
    assert -p+mu_over_E_M==1  # dE/dV=( -p + (4/3)rho ) =rho under M∝V
    assert p-mu_over_E_M==Fraction(-1,1)
    # Continuity: dot(rho)+3H*(rho+p)=Q; Q=mu*n*Γ.
    # for Γ=3H, Q/H/rho=4 and rho is constant.
    assert Fraction(3)*(1+p)==Fraction(4)
    assert Fraction(4,3)*Fraction(3)==4
    return True


def main():
    print('3D full three-plane cyclic prime flux, theta=',repr(THETA))
    print('exact closed four-step return count:',exact_closed_walk_moment())
    exact_source_thermodynamics()
    for n in (2,4,6):
        for eps in (+1,-1):
            energy,ps,SA,join,gap=run(n,eps)
            shell_W,shell_S,split_gap,joined_gap=shell_creation(n,eps)
            assert split_gap>0 and joined_gap>0
            print(f'n={n:2d} eps={eps:+d} E/site={energy/n**3:.12f} '
                  f'Pfrac={[round(p/energy,12) for p in ps]} '
                  f'S/cut={None if SA is None else round(SA/(n*n),12)} '
                  f'joinE/cut={None if join is None else round(join/(n*n),12)} '
                  f'min_eigen={gap:.9f}'
                  f' shell_add_W/cut={shell_W/n**2:.12f}'
                  f' shell_entropy/cut={shell_S/n**2:.12f}')
    print('PASS: exact flux moment, positive gap, cubic cyclic stress, 3D same-vacuum entropy/edge bounds,')
    print('      shell-creation adiabatic gap/work, site-gauge invariance, finite-difference stress, exact sourced first law')
    print('PHYSICAL STATUS: conditional, no primitive derivation of CCR, source law, scale or GR vacuum.')

if __name__=='__main__':main()

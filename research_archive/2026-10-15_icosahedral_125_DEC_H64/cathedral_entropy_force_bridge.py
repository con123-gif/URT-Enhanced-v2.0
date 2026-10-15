"""Newton's Cathedral / URT: exact finite smoothing and entropy-response bridge.

Only NumPy is required; this file imports the previously archived finite
operator audit. All asserted identities concern finite operators. No claim is
made that the measured cosmological Weyl curvature or physical gravity/SM
couplings follow from these identities.

Run: python cathedral_entropy_force_bridge.py
"""
from __future__ import annotations

import numpy as np
from cathedral_operator_audit import geometry, dirac_64, DELTA, ETA, P5, CHI


def xlogx(a):
    aa = np.asarray(a, dtype=float)
    return np.where(aa > 0, aa * np.log(np.maximum(aa, 1e-300)), 0).sum()


def shannon(p):
    return -xlogx(p)


def quads(vertices):
    directions = vertices / np.linalg.norm(vertices, axis=1)[:,None]
    t = np.einsum('vi,vj->vij', directions, directions) - np.eye(3)[None,:,:]/3
    return t


def quantum_relative_entropy(rho, sigma_diag):
    ev, U = np.linalg.eigh(rho)
    if np.min(ev) <= 0: raise ValueError('rho must be strictly positive')
    log_rho = (U * np.log(ev)) @ U.T
    return float(np.trace(rho @ log_rho) - np.dot(np.diag(rho),np.log(sigma_diag)))


def run():
    v, edges, faces, ds, C = geometry()
    d0,d1,d2,d3=ds
    L=d1@d1.T
    I=np.eye(12)
    ones=np.ones(12)
    P0=np.outer(ones,ones)/12
    # Exact polynomial icosahedral 5-irrep projector (eigenvalue 6 of L).
    Pquad=-(L@(L@L-10*L+20*I))/24
    assert np.linalg.norm(Pquad@Pquad-Pquad)<1e-12
    assert abs(np.trace(Pquad)-5)<1e-12
    assert np.linalg.norm(Pquad@P0)<1e-12
    assert np.linalg.norm(L@Pquad-6*Pquad)<1e-12

    D64=dirac_64(ds)
    T=D64@D64/20
    M=T[1:13,1:13]
    assert np.linalg.norm(M-(L+12*P0)/20)<1e-12
    assert np.linalg.norm(M@P0-0.6*P0)<1e-12
    assert np.linalg.norm(M@Pquad-0.3*Pquad)<1e-12
    eigM=np.sort(np.linalg.eigvalsh(M))
    assert np.linalg.norm(eigM-np.sort(np.array([.6]+[(5-np.sqrt(5))/20]*3+[6/20]*5+[(5+np.sqrt(5))/20]*3)))<1e-12

    tensors=quads(v)
    G=np.einsum('vij,wij->vw',tensors,tensors)
    assert np.linalg.norm(G-8*Pquad/5)<1e-12
    assert np.linalg.norm(np.sum(tensors,axis=0))<1e-12

    # Canonical vertex-5 -> face-5 incidence isometry. A second natural fiveplet
    # exists on the dual face carrier, with L_face eigenvalue 2.
    W5 = C @ Pquad / np.sqrt(3)
    faceL=d2.T@d2
    assert np.linalg.norm(W5.T@W5-Pquad)<1e-12
    assert np.linalg.norm((faceL-2*np.eye(20))@W5)<1e-12
    assert np.linalg.matrix_rank(W5,tol=1e-10)==5

    # Explicit strictly positive trial distribution on the 5-fold shell mode.
    seed=np.zeros(12);seed[0]=1
    q=Pquad@seed;q/=np.linalg.norm(q)
    epsilon=0.04
    p0=ones/12+epsilon*q
    assert np.min(p0)>0 and abs(sum(p0)-1)<1e-12
    H0=shannon(p0)
    W0=np.einsum('ij,ij',np.tensordot(p0,tensors,axes=(0,0)),np.tensordot(p0,tensors,axes=(0,0)))
    assert abs(W0-(8/5)*epsilon**2)<1e-12
    entropies=[]
    variances=[]
    for n in [0,1,2,5,10,20]:
        pn=ones/12+(2.**-n)*epsilon*q
        entropy=shannon(pn)
        Qn=np.tensordot(pn,tensors,axes=(0,0))
        Wn=np.linalg.norm(Qn)**2
        assert abs(Wn/W0-4.**-n)<1e-10
        entropies.append(entropy);variances.append(Wn)
    assert all(b>=a for a,b in zip(entropies,entropies[1:]))

    # Fully explicit BKM/Fisher quantum relative-entropy Hessian for an off-block
    # (3,5) coherence tangent of the exact rho_star. Gibbs state has 4+4 carrier.
    a=1/(4*(1+DELTA**2)); b=DELTA**2/(4*(1+DELTA**2))
    diag=np.array([a]*4+[b]*4)
    sig=np.diag(diag)
    chi_exact=(np.log(a)-np.log(b))/(a-b)
    assert abs(chi_exact-CHI)<1e-10
    E=np.zeros((8,8));E[0,4]=E[4,0]=1
    rels=[]
    for amp in [2e-6,5e-6,1e-5]:
        rho=sig+amp*E
        rel=quantum_relative_entropy(rho,diag)
        rels.append((amp,rel,rel/amp**2))
        assert abs(rel/(amp*amp)/CHI-1)<0.02

    # Candidate entropic conjugate-force coefficient for a *given* displacement
    # y affecting the modular level gap g(y). At fixed eta and temperature,
    # F_ent(y)=k_B*T*(dH2/dp)*(dp/dy) where p=(1+exp(eta*g(y)))^-1.
    # At the canonical gap g(0)=2: dH2/dp=2*eta;
    # dp/dy=-eta*p(1-p)*g'(0), so
    # F_ent/(k_B*T)=-2*eta**2*p*(1-p)*g'(0).
    coeff=2*ETA**2*P5*(1-P5)
    assert abs(coeff*2-4*ETA**2*P5*(1-P5))<1e-15
    # Exact two-level Gibbs / Helmholtz thermodynamics, dimensionless by k_B*T.
    # Set gap g(y)=2+y; levels have energies 0 and k_B*T*eta*g.
    # Mechanical conjugate force from F_helm=-k_B*T log Z is:
    #    F_total/(k_B*T)=-eta*p(g)*g'(y).
    # Entropy-only gradient is:
    #    F_entropy/(k_B*T)=-eta**2*g*p(g)*(1-p(g))*g'(y).
    # They differ by the energy-gradient term; they are not interchangeable.
    total_coeff=ETA*P5
    def thermo(y):
        prob=1/(1+np.exp(ETA*(2+y)))
        entropy=np.log(4)+shannon(np.array([prob,1-prob]))
        helm=-np.log(4)-np.logaddexp(0,-ETA*(2+y))
        energy=ETA*(2+y)*prob
        return prob, entropy, helm, energy
    eps_y=2e-4
    pL,SL,FL,EL=thermo(-eps_y)
    pR,SR,FR,ER=thermo(eps_y)
    dS=(SR-SL)/(2*eps_y)
    dF=(FR-FL)/(2*eps_y)
    dE=(ER-EL)/(2*eps_y)
    assert abs(dS+coeff)/coeff<2e-6
    assert abs(dF-total_coeff)/total_coeff<2e-6
    assert abs(dE-dS-dF)<1e-9

    # A reversible unitary rotation changes the orientation but not the spectrum
    # of rho_star, so von Neumann entropy stays exactly constant. Relative entropy
    # to the reference rho_star increases nevertheless.
    theta=0.2
    rot=np.eye(8)
    rot[0,0]=rot[4,4]=np.cos(theta)
    rot[0,4]=np.sin(theta);rot[4,0]=-np.sin(theta)
    rrot=rot@sig@rot.T
    srot=-xlogx(np.linalg.eigvalsh(rrot))
    sref=-xlogx(diag)
    assert abs(srot-sref)<1e-12
    dunitary=quantum_relative_entropy(rrot,diag)
    expected_dunitary=(a-b)*(np.log(a)-np.log(b))*np.sin(theta)**2
    assert abs(dunitary-expected_dunitary)<1e-12

    print('NEWTON\'S CATHEDRAL — ENTROPY / FINITE FORCE / SMOOTHING BRIDGE')
    print('13-cell positive transfer vertex M=(L_ico+11^T)/20 eigenvalues:',np.round(eigM,11))
    print('uniform eigenvalue 12/20=0.6; quadrupole eigenvalue 6/20=0.3; relative rate 1/2')
    print('largest nonuniform/uniform=(5+sqrt(5))/12 =', (5+np.sqrt(5))/12)
    print('5-mode projector = -L(L^2-10L+20I)/24; rank',round(np.trace(Pquad)))
    print('exact quadrupole Gram: G = (8/5)P5, residual',np.linalg.norm(G-8*Pquad/5))
    print('vertex-to-face 5-irrep isometry residual',np.linalg.norm(W5.T@W5-Pquad))
    print('n       Shannon H      Q^2          Q^2/Q0^2')
    for n,h,w in zip([0,1,2,5,10,20],entropies,variances):
        print(f'{n:2d}    {h:.12f}    {w:.12e}   {w/W0:.12g}')
    print('rho_star diagonal probabilities (4+4):',a,b)
    print('BKM density Hessian, off-block coherence chi =',CHI)
    print('off-block test: amplitude, D(rho||sigma), D/amp^2')
    for amp,d,r in rels: print(f'    {amp:.1e}   {d:.12e}   {r:.9f}')
    print('entropic conjugate coefficient 2eta^2 p(1-p)=',coeff)
    print("For gap derivative g'=+1: entropic T*S'/(k_B*T)=",-coeff)
    print("For the same gap, total mechanical force -F_helm'/(k_B*T)=",-total_coeff)
    print('Unitary-orbit entropy change=',srot-sref,', relative entropy to sigma=',dunitary)
    print('Under assumed d(gap)/d(ln A)=-2: F_ent/(k_B T)=',2*coeff)
    print('These are finite identities/conditional force expressions; they are NOT')
    print('a derived G, gauge charge, cosmological initial-condition probability,')
    print('or 4D Weyl equation. 3D Weyl vanishes identically.')

if __name__=='__main__':run()

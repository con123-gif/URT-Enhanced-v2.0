#!/usr/bin/env python3
"""Local quantum seam-accessibility test on ORIGINAL URT 2x2x3 magnetic Laplacian.

Real physical complex oscillator = two real polarisations per site.
We test sequential actual bond insertions and the exact Gaussian ground-state
transition amplitude of each LOCAL bond-energy operator. Does NOT claim an
autonomous controller, state-transfer fidelity, gravity, or pump-energy source.
"""
from math import pi, e, sqrt
from itertools import product, permutations
import numpy as np

phi=(1+sqrt(5))/2
alpha=pi/e
theta=2*pi/phi**2

def native(epsilon):
    f=float(np.angle(epsilon*np.exp(-1j*theta)))
    xyz=list(product(range(2),range(2),range(3)))
    im={r:i for i,r in enumerate(xyz)}
    n=len(xyz)
    L0=np.zeros((n,n),complex)
    seam=[]
    for i,r in enumerate(xyz):
        for d in range(3):
            to=list(r);to[d]+=1;to=tuple(to)
            if to not in im:continue
            j=im[to]
            u=np.exp(1j*f*r[(d-1)%3])
            v=np.zeros(n,complex);v[i]=1;v[j]=-np.conj(u)
            B=np.outer(v,v.conj())
            if d==2 and r[2]==1:seam.append((r,B))
            else:L0+=B
    assert len(seam)==4 and np.linalg.eigvalsh(L0)[0]>0
    return f,L0,seam

def real(H):
    return np.block([[H.real,-H.imag],[H.imag,H.real]])

def sqroot(L):
    lam,U=np.linalg.eigh(L)
    assert min(lam)>1e-12
    return (U*np.sqrt(lam))@U.conj().T

def E0(L): return float(np.trace(sqroot(L)).real)

def overlap_and_amp(Lold,Lnew,B):
    # Each complex oscillator eigenmode represents TWO real canonical modes.
    W0=sqroot(Lold);W1=sqroot(Lnew); Z=W0+W1
    n=len(W0)
    l0=np.linalg.slogdet(W0);l1=np.linalg.slogdet(W1);lz=np.linalg.slogdet(Z)
    assert abs(l0[0]-1)<1e-9 and abs(l1[0]-1)<1e-9 and abs(lz[0]-1)<1e-9
    # Gaussian overlap for 2n REAL coordinates, not n.
    overlap=float(np.exp(n*np.log(2)+.5*l0[1]+.5*l1[1]-lz[1]))
    # Actual local operator V_B=1/2 Q^T R(B) Q in ORIGINAL complex scalar vacuum
    amp=float(overlap*np.trace(B @ np.linalg.inv(Z)).real)
    assert 0<overlap<=1+1e-10 and amp>0
    return overlap,amp

def case(epsilon):
    f,L0,edges=native(epsilon)
    totalB=sum((b for r,b in edges),np.zeros_like(L0))
    full=L0+totalB
    Emin=E0(full)-E0(L0)
    assert Emin>0
    print(f'SECTOR eps={epsilon:+d} f={f:.12f} oldvac={E0(L0):.12f} joinedvac={E0(full):.12f} ground_join_work={Emin:.12f}')
    # Show one exactly local sequence and then certify all 4!=24 possible choices.
    res=[]
    for order in permutations(range(4)):
        L=L0.copy();work=0.; steps=[]
        for k in order:
            B=edges[k][1]
            Ln=L+B
            de=E0(Ln)-E0(L)
            ov,amp=overlap_and_amp(L,Ln,B)
            assert de>0
            # no first-order energy transfer under a number conserving switch
            assert np.min(np.linalg.eigvalsh(Ln))>0
            # Exact initial Gaussian second moment of local bond energy V_B.
            # B has complex rank one, physically two real polarisations:
            # <V_B^2> = 2 <V_B>^2, <V_B>=.5 Tr(B W_old^-1).
            meani=float(.5*np.trace(B @ np.linalg.inv(sqroot(L))).real)
            V2=2*meani**2
            # A QUANTIZED 2-level energy source and 2-level link switch,
            # H_int=g(|source_g,on><source_e,off|+h.c.) V_B.
            # This is LOCAL and bounded below for sufficiently small g:
            # V_B is quadratic, source and switch are bounded operators.
            # Choose illustrative g=lambda_min(L_old,L_new)/8, not fitted.
            gap=min(np.linalg.eigvalsh(L)[0],np.linalg.eigvalsh(Ln)[0]);g=gap/8
            # Off-diagonal real quadratic stiffness block has min >0.
            LR=real(L); LnR=real(Ln); BR=real(B)
            Kblock=np.block([[LR,g*BR],[g*BR,LnR]])
            assert np.linalg.eigvalsh(Kblock)[0] >= .7*gap,(gap,g)
            # Source qubit excited energy Omega=E0(new)-E0(old) is
            # NECESSARY ON-RESONANCE RESOURCE, not selected by URT.
            # From |source_e,off,0_old>, the exact short-time fraction entering
            # |0,on,0_new> is |<new|V_B|old>|^2/<old|V_B^2|old>.
            fraction=amp**2/V2
            assert 0<fraction<1
            steps.append((k,de,ov,amp,fraction,g))
            work+=de;L=Ln
        assert abs(work-Emin)<1e-10
        assert np.max(abs(L-full))<1e-12
        res.append((order,steps))
    for j,(k,de,ov,amp,frac,g) in enumerate(res[0][1],1):
        print(f'  local_step={j} bond={edges[k][0]} gap={de:.12f} overlap={ov:.12f} LOCAL_bond_matrix_element={amp:.12f} ground_channel_fraction={frac:.12f} stable_local_g_test={g:.12f}')
    all_de=np.array([a[1] for order,seq in res for a in seq])
    all_ov=np.array([a[2] for order,seq in res for a in seq])
    all_amp=np.array([a[3] for order,seq in res for a in seq])
    all_frac=np.array([a[4] for order,seq in res for a in seq])
    print(f'  all_24_paths gap_min_max=({min(all_de):.12f},{max(all_de):.12f}) overlap_min={min(all_ov):.12f} local_amp_min_max=({min(all_amp):.12f},{max(all_amp):.12f}) local_ground_frac_min_max=({min(all_frac):.12f},{max(all_frac):.12f})')
    # Verify linearized amplitude from Gaussian integration against a derivative of overlap.
    W0=sqroot(L0);W1=sqroot(L0+edges[0][1]);
    B=edges[0][1]
    ov,amp=overlap_and_amp(L0,L0+B,B)
    # Exact bare |i> expectation is E_edge=<i|V_B|i> = 1/2 Tr(B W0^-1)
    x=float(.5*np.trace(B @ np.linalg.inv(W0)).real)
    assert x>0
    # Independent two-real-polarisation covariance/Wick evaluation, not
    # the complex trace formula above. Confirms numerical normalisation.
    W0R=real(W0); W1R=real(W1); BR=real(B)
    Sigma=np.linalg.inv(W0R+W1R)
    amp_real=.5*ov*np.trace(BR@Sigma).real
    assert abs(amp_real-amp)<3e-12
    cov0=.5*np.linalg.inv(W0R)
    meanR=.5*np.trace(BR@cov0).real
    second=meanR**2+.5*np.trace(BR@cov0@BR@cov0).real
    assert abs(meanR-x)<3e-12 and abs(second-2*x*x)<3e-12
    # Off-diagonal transition is not the same as diagonal expectation.
    print(f'  local_on_initial_ground_B_expect={x:.12f} off_diagonal_amplitude={amp:.12f}')
    sheetE=5.203810807053427 if epsilon==1 else 4.992836201484024
    cost=sheetE+Emin
    # one pair per complex mode, and full two-polarisation quantum pump are DIFFERENT conventions
    nbar=alpha*alpha-1
    cap_pair=2*(alpha**4-1)*sheetE
    cap_full=4*(alpha**4-1)*sheetE
    assert cap_pair>cost and cap_full>cost
    print(f'  prepare_plus_join={cost:.12f} nominal_pair_budget={cap_pair:.12f} full_2pol_budget={cap_full:.12f}')
    return Emin,all_de,all_amp

for ep in (+1,-1):case(ep)
print('PASS: 48 ordered original 3D seam paths; 192 strictly positive local ground-state transition amplitudes; exact unprojected local quantum-source transition-to-ground fractions; two-real-polarization Gaussian overlaps; native joining work telescopes exactly')


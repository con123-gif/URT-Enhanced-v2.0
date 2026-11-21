#!/usr/bin/env python3
"""Finite prime-holonomy plaquette: oscillator vacuum response and obstructions.
This validates exact finite mathematics for a DECLARED URT prime connection.
It does NOT derive canonical quantisation, physical spacetime, ZPE density, or RH.
"""
import math
import cmath
from itertools import product
from collections import Counter
import numpy as np
import sympy as sp

PHI = (1 + math.sqrt(5))/2
THETA = 2*math.pi/PHI**2
A_URT = math.pi/math.e

def adjacency(c):
    assert abs(abs(c) - 1) < 1e-13
    A = np.zeros((4,4), dtype=complex)
    for i,j,w in ((0,1,1), (0,2,1), (1,3,c), (2,3,1)):
        A[i,j] = w
        A[j,i] = complex(w).conjugate()
    return A

def check_symbolic():
    l,z=sp.symbols('l z',nonzero=True)
    Adj = sp.zeros(4)
    for i,j,w in ((0,1,1), (0,2,1), (1,3,z), (2,3,1)):
        Adj[i,j]=w
        Adj[j,i]=sp.conjugate(w) if w==1 else 1/z
    p=sp.factor((l*sp.eye(4)-Adj).det())
    expected=l**4-4*l**2+2-z-1/z
    assert sp.simplify(p-expected)==0
    assert sp.simplify((2*sp.eye(4)-Adj).det()-(2-z-1/z))==0
    print('SYMBOLIC PASS: chi_A(lambda)=lambda^4-4lambda^2+2-z-z^-1')
    print('SYMBOLIC PASS: det(L_square)=2-z-z^-1')

def response(eps):
    c=eps*cmath.exp(-1j*THETA)
    flux=abs(cmath.phase(c))
    L=2*np.eye(4)-adjacency(c)
    spectrum=np.linalg.eigvalsh(L)
    assert spectrum[0]>0
    explicit=np.array([2-2*math.cos(flux/4),2-2*math.sin(flux/4),
                       2+2*math.sin(flux/4),2+2*math.cos(flux/4)])
    assert np.allclose(spectrum, np.sort(explicit), atol=5e-14)
    det=2-2*eps*math.cos(THETA)
    assert abs(float(np.linalg.det(L).real)-det)<2e-13
    # A complex magnetic L cannot be coupled to a single real oscillator: its
    # imaginary antisymmetric part would vanish. Realify L: two real components
    # per complex site, with the same positive eigenvalues each repeated twice.
    # This is a charged (two-component) oscillator field, canonical quantization
    # and omega0 are ADDITIONAL physical assumptions, not consequences of URT.
    Lreal=np.block([[L.real,-L.imag],[L.imag,L.real]])
    assert np.max(np.abs(Lreal-Lreal.T)) < 1e-13
    spec_real=np.linalg.eigvalsh(Lreal)
    assert np.allclose(spec_real,np.repeat(spectrum,2),atol=3e-13)
    # K=m omega0^2 R(L); omega_j=omega0 sqrt(lambda_j), 8 real modes.
    e0_over_hbaromega0=0.5*np.sqrt(spec_real).sum()
    exact_e0=2*((1+math.sqrt(2))*math.cos(flux/8)+math.sin(flux/8))
    assert abs(e0_over_hbaromega0-exact_e0)<5e-14
    # <q_i q_i> /(hbar/(2m omega0)) = (L^(-1/2))_ii
    ev,vec=np.linalg.eigh(L)
    invroot=(vec*ev**(-0.5))@vec.conj().T
    variance_site=float(invroot[0,0].real)
    assert np.max(np.abs(np.diag(invroot).real-variance_site))<2e-13
    # A local, diagonal U(1) transformation must preserve all invariant spectra
    gauge=np.exp(1j*np.array([0.3,-0.7,1.1,2.4]))
    G=np.diag(gauge)
    L2=G@L@G.conj().T
    assert np.max(np.abs(np.linalg.eigvalsh(L2)-spectrum))<2e-13
    return {'eps':eps,'c':c,'flux':flux,'gap':float(spectrum[0]),
            'det':det,'e0':e0_over_hbaromega0,'site_variance':variance_site,
            'spectrum':spectrum}

def closed_walk_flux_moment():
    # Each four-step closed walk records its enclosed signed plaquette area.
    moves=((1,0),(-1,0),(0,1),(0,-1))
    counts=Counter()
    for steps in product(range(4), repeat=4):
        x=y=phase_exponent=0
        for s in steps:
            dx,dy=moves[s]
            if dy:phase_exponent+=x*dy
            x+=dx;y+=dy
        if x==y==0:counts[phase_exponent]+=1
    assert dict(counts)=={0:28,1:4,-1:4}, counts
    print('EXACT LOOP COUNT: 28 phase-neutral and 4 +flux, 4 -flux')
    return counts

def lattice_adjacency(k,c):
    M=k*k; A=np.zeros((M,M),dtype=complex)
    for x in range(k):
        for y in range(k):
            a=k*x+y
            if x+1<k:
                b=k*(x+1)+y; A[a,b]=A[b,a]=1
            if y+1<k:
                b=k*x+y+1; phase=c**x
                A[a,b]=phase;A[b,a]=phase.conjugate()
    return A

def finite_volume_response():
    # Complex scalar has two real oscillator components per lattice site;
    # complex-site vacuum energy density / hbar omega0 = mean sqrt(L eigenvalues).
    for k in (5,9,15,25):
        data={}
        for eps in (+1,-1,0):
            c=eps*cmath.exp(-1j*THETA) if eps else 1+0j
            A=lattice_adjacency(k,c)
            L=4*np.eye(k*k)-A
            spec=np.linalg.eigvalsh(L)
            assert spec[0]>-1e-12
            density=np.sqrt(np.maximum(spec,0)).mean()
            data[eps]=(float(spec[0]),float(density))
            if k==9:
                center=k*(k//2)+(k//2)
                A2=A@A
                m4=float(np.vdot(A2[:,center],A2[:,center]).real)
                assert abs(m4-(28+8*c.real))<2e-12
        assert data[+1][0] >= (1-math.cos(THETA))/4-1e-8
        assert data[-1][0] >= (1+math.cos(THETA))/4-1e-8
        print(f'box {k}x{k}: vacuum E density/(hbar omega0): '
              f'+ {data[+1][1]:.9f}, - {data[-1][1]:.9f}, '
              f'zero {data[0][1]:.9f}; delta +- {data[+1][1]-data[-1][1]:.9f}')
    print('FINITE CHECK PASS: full lattice fluctuations and bulk 4-step flux moments')

def test():
    check_symbolic()
    closed_walk_flux_moment()
    outcomes={eps:response(eps) for eps in (+1,-1)}
    for eps,r in outcomes.items():
        print('eps=',eps,'flux=',format(r['flux'],'.12f'),
              'gap=',format(r['gap'],'.12f'),
              'det=',format(r['det'],'.12f'),
              'E0/(hbar omega0)=',format(r['e0'],'.12f'),
              'site <q^2>/(hbar/(2 m omega0))=',format(r['site_variance'],'.12f'))
        print('  L eigenvalues:',[round(a,10) for a in r['spectrum']])
    plus,minus=outcomes[+1],outcomes[-1]
    print('Delta_E0 (+ minus -)/(hbar omega0)=',f"{plus['e0']-minus['e0']:.12f}")
    print('E0 ratio + / - =',f"{plus['e0']/minus['e0']:.12f}")
    print('one REAL component site fluctuation variance -/+ =',f"{minus['site_variance']/plus['site_variance']:.12f}")
    print('untwisted normalized square 0 mode: min eig', min(np.linalg.eigvalsh(2*np.eye(4)-adjacency(1))))
    print('alpha=pi/e =',f'{A_URT:.15f}', 'does not fix omega0 or units')
    assert abs(plus['e0']-minus['e0'])>0.01
    assert abs(minus['site_variance']-plus['site_variance'])>0.01
    finite_volume_response()
    print('PASS: flux-dependent 4-complex-site (8-real-mode) quantum oscillator *model*')
    print('NOTE: quantization, complex charged field, and omega0 are not derived from URT')
    print('NO-GO: no multiplicative homomorphism N_x -> operators with VpVq!=VqVp')
    print('OPEN: derivation of [q,p]=i hbar, spacetime observable, vacuum density, RH correspondence')

if __name__=='__main__':test()

#!/usr/bin/env python3
"""Q103: exact all-time chiral Born current and 24-step counting laws.

Rebuilds Q101's 13-contact, whole-five 190-cochain/50-vertex source and H64
hidden-transition network. New: proves two oriented edge A5 orbits, derives
current from spectral trace derivatives, and 24-step exact trinomial counting.
All dynamical identification is conditional on Q101's Peierls/Born observation.
No empirical constants, physical ARF labels, or fitted coefficients used.
"""
from pathlib import Path
import math, runpy, networkx as nx
import numpy as np
import sympy as sy
from scipy.linalg import expm

root=Path(__file__).resolve().parents[1]
prior=root/'2026-11-14_q101_moving_arf'/'MOVING_ARF_DERIVATION.py'
assert prior.exists(), prior
r=runpy.run_path(str(prior))
ids=r['parts'][0];G=r['G'];B0=r['B'];states=r['minima'];icoedges=r['edges'];V=np.array(r['v'],float)
B=np.array(B0.extract(ids,ids),dtype=int)
A=np.array([[int(G.has_edge(ids[i],ids[j])) for j in range(30)]
    for i in range(30)],dtype=int)
assert np.array_equal(A,abs(B)) and np.all(A.sum(axis=1)==4)
assert np.all(B.sum(axis=1)==0) and np.array_equal(B,-B.T)
assert np.count_nonzero(B==1)==np.count_nonzero(B==-1)==60

# Native proper A5 must act transitively on each directed edge sign class.
ico=nx.Graph();ico.add_nodes_from(range(12));ico.add_edges_from(icoedges)
lookup={states[index][0]:i for i,index in enumerate(ids)}
proper=[]
for perm in nx.isomorphism.GraphMatcher(ico,ico).isomorphisms_iter():
    img=[perm[i] for i in range(12)]
    R=np.linalg.lstsq(V,V[img],rcond=None)[0]
    assert np.linalg.norm(V@R-V[img])<1e-10
    if np.linalg.det(R)>0:proper.append(img)
assert len(proper)==60
P=[]
for perm in proper:
    mapped=[]
    for state_index in ids:
        bits=states[state_index][0]
        transformed=sum(((bits>>i)&1)<<perm[i] for i in range(12))
        mapped.append(lookup[transformed])
    assert np.array_equal(A[np.ix_(mapped,mapped)],A)
    assert np.array_equal(B[np.ix_(mapped,mapped)],B)
    P.append(mapped)
for sign in (1,-1):
    start=next((i,j) for i in range(30) for j in range(30) if B[i,j]==sign)
    orbit={(p[start[0]],p[start[1]]) for p in P}
    expected={(i,j) for i in range(30) for j in range(30) if B[i,j]==sign}
    assert orbit==expected and len(orbit)==60
print('Original A5 proper rotations: +60 and -60 directed-link orbits EXACT PASS')

# Original Q101 spectral polynomial, used as all-time response generator.
for c,s in [(sy.Rational(3,5),sy.Rational(4,5)),
            (sy.Rational(-5,13),sy.Rational(12,13))]:
    lam=sy.Symbol('lambda')
    H=c*sy.Matrix(A)+sy.I*s*sy.Matrix(B)
    cubic=lam**3+2*c*lam**2-(4*c*c+8*s*s)*lam+8*c*(s*s-c*c)
    expected=(lam-4*c)*(lam**2-2*c*lam-4*c*c)**3 * \
        (lam**2-c*c-5*s*s)**4*cubic**5
    assert sy.expand(H.charpoly(lam).as_expr()-expected)==0
print('Full homogeneous c,s spectral polynomial at two rational phases: EXACT PASS')

phi=(1+math.sqrt(5))/2
eps=math.pi/(3*phi**12)
alpha_g=eps/24
for alpha in (alpha_g,0.1,0.3,0.8,1.4):
    c,s=math.cos(alpha),math.sin(alpha)
    H=c*A+1j*s*B;dHa=-s*A+1j*c*B
    assert np.linalg.norm(H-H.conj().T)<1e-12
    v=math.sqrt(c*c+5*s*s)
    cubic_roots=np.roots([1,2*c,-(4*c*c+8*s*s),8*c*(s*s-c*c)])
    assert np.max(abs(np.imag(cubic_roots)))<1e-8
    cubic_roots=cubic_roots.real
    spectral=np.array([4*c]+[c*(1+math.sqrt(5))]*3 +
        [c*(1-math.sqrt(5))]*3 +[v]*4+[-v]*4+
        [float(q) for q in cubic_roots for _ in range(5)])
    assert np.max(abs(np.sort(spectral)-np.linalg.eigvalsh(H)))<1e-7
    levels=[4*c,c*(1+math.sqrt(5)),c*(1-math.sqrt(5)),v,-v,*cubic_roots]
    mult=[1,3,3,4,4,5,5,5]
    for tau in (0.03,0.2,0.5,1.0,2.7):
        U=expm(-1j*tau*H)
        T=abs(U)**2
        assert np.linalg.norm(U.conj().T@U-np.eye(30))<1e-11
        assert np.max(abs(T.sum(axis=0)-1))<1e-11
        assert np.max(abs(T.sum(axis=1)-1))<1e-11
        for sign in (1,-1):
            x=U[B==sign]
            assert np.max(abs(x-x[0]))<2e-12
        zt=-1j*np.trace(H@U)
        za=-1j*tau*np.trace(dHa@U)
        Zspec=sum(m*np.exp(-1j*tau*value) for m,value in zip(mult,levels))
        assert abs(Zspec-np.trace(U))<2e-8
        jdirect=float(np.sum(B*T).real/30)
        jtrace=float(np.imag(zt*np.conj(za))/(1800*tau))
        assert abs(jdirect-jtrace)<3e-12,(alpha,tau,jdirect,jtrace)
        SA=1j*(c*zt-s*za/tau)
        SB=-(s*zt+c*za/tau)
        uplus=(SA+SB)/120
        uminus=(SA-SB)/120
        pplus=2*abs(uplus)**2
        pminus=2*abs(uminus)**2
        p0=1-pplus-pminus
        assert pplus>=0 and pminus>=0 and p0>=-1e-12
        assert abs(pplus-2*np.mean(T[B==1]))<1e-12
        assert abs(pminus-2*np.mean(T[B==-1]))<1e-12
        assert abs(jdirect-(pplus-pminus))<3e-12
        # IID observable current increments under projective observations.
        for xi in (-0.5,0.2,0.7):
            tilted=T*np.exp(xi*B)
            generating=p0+pplus*math.exp(xi)+pminus*math.exp(-xi)
            assert np.max(abs(tilted.sum(axis=0)-generating))<5e-12
            assert np.max(abs(tilted.sum(axis=1)-generating))<5e-12
            direct_mgf=float(np.ones(30)@
                       np.linalg.matrix_power(tilted,24)@np.ones(30)/30)
            exact_mgf=generating**24
            assert abs(direct_mgf-exact_mgf)<1e-10*max(1,exact_mgf)
        if pplus>0 and pminus>0:
            aff=math.log(pplus/pminus)
            coarse_entropy=24*(pplus-pminus)*aff
            assert coarse_entropy>=-1e-13
            good=(T>1e-30)&(T.T>1e-30)
            full_entropy=float(np.sum((T*np.log(np.maximum(T,1e-30)/
                np.maximum(T.T,1e-30)))[good])/30*24)
            assert full_entropy+1e-8>=coarse_entropy
        if abs(alpha-alpha_g)<1e-15 and tau in (0.03,0.5,1.0):
            print('golden alpha',alpha,'tau',tau,'J',jdirect,'p+',pplus,
                  'p-',pminus,'C_24',24*jdirect,'entropy24',coarse_entropy)
print('25 direct vs all-time spectral traces + 75 independent 24-step MGFs: PASS')
print('All-time exact: J=Im(Z_tau conjugate(Z_alpha))/(1800 tau)')
print('24 step exact MGF=[1+p+(e^chi-1)+p-(e^-chi-1)]^24')
print('kappa1=24(p+-p-), kappa2=24[p++p--(p+-p-)^2]')
print('coarse FT: Prob(C24=k)/Prob(C24=-k)=(p+/p-)^k')
print('Q103 ALLTIME CHIRAL SPECTRAL/COUNTING CERTIFICATE: PASS')

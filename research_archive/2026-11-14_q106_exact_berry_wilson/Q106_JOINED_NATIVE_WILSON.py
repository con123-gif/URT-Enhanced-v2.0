#!/usr/bin/env python3
"""Q106 original charged v61 sea + geometric Berry bands.

Native v61 file REQUIRED; no local reference substitutions on GitHub.
The unit Kronecker-sum moving/spatial action is a declared conditional model.
"""
from pathlib import Path
import math,runpy,importlib.util,sys
import numpy as np
from scipy.linalg import eigh,expm,block_diag
from fractions import Fraction as Fr
ROOT=Path(__file__).resolve().parents[2]
HERE=Path(__file__).resolve().parent
z=runpy.run_path(str(HERE/'Q106_EXACT_BERRY_SPECTRUM.py'))
rt=math.sqrt(5);phi=(1+rt)/2
def nf(p):return float(p[0])+rt*float(p[1])
pauli=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]],complex)
nu=np.array([[nf(c) for c in n] for n in z['ns']])
S=np.einsum('aj,jkl->akl',nu,pauli)
A=np.zeros((30,30),int);M=np.zeros((60,60),complex)
scale=math.sqrt(2-2*rt/5)
for a,b in z['links']:A[a,b]=A[b,a]=1
for a in range(30):
    for b,q in z['nbr'][a]:
        M[a*2:a*2+2,b*2:b*2+2]=scale*(nf(q[0])*np.eye(2)+
            1j*np.einsum('j,jkl->kl',[nf(v) for v in q[1:]],pauli))
assert np.linalg.norm(M-M.conj().T)<1e-12
values=np.linalg.eigvalsh(M)
assert np.max(abs(values[::2]-values[1::2]))<1e-11
weak=values[::2];plain=np.linalg.eigvalsh(A)
assert len(weak)==len(plain)==30
# Original all-five Hodge 190, 50->8->12, hidden 4_3/4_5, H64 source.
o=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py'))
original={o['minima'][idx][0]:idx for idx in o['parts'][0]}
assert set(original)==set(z['masks'])
for a,b in z['links']:
    assert abs(o['B'][original[z['masks'][a]],original[z['masks'][b]]])==1
print('Native five-solid 190/50/H64 moving source and Berry graph: MATCH')
# Spontaneous charged Q16 internal direction; no fake A5 action on Wilson sites.
Y=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0])
T=[block_diag(*([u/2]*4+[np.zeros((1,1))]*8)) for u in pauli]
Q=[Y+sum(n[j]*T[j] for j in range(3)) for n in nu]
for a,b in z['links']:
    d=float(nu[a]@nu[b]);assert abs(d-(1-rt)/4)<1e-12
    U=(np.eye(2)+S[a]@S[b])/math.sqrt(2*(1+d))
    U16=block_diag(U,U,U,U,np.eye(8))
    assert np.linalg.norm(Q[a]@U16-U16@Q[b])<1e-11
    for angle in (0.13,-0.27):
        assert np.linalg.norm(expm(1j*angle*Q[a])@U16@
             expm(-1j*angle*Q[b])-U16)<1e-11
print('Joint moving/spatial local U1 gauge transport: 60 native links PASS')
# ACTUAL archived Wilson kernel, not a surrogate.
path=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert path.is_file(), ('Original v61 source missing',path)
spec=importlib.util.spec_from_file_location('original_native_v61_q106',path)
v61=importlib.util.module_from_spec(spec);sys.modules[spec.name]=v61;spec.loader.exec_module(v61)
gamma,g5=v61.gamma_matrices()
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
G5=np.kron(np.eye(48),g5);I192=np.eye(192,dtype=complex)
def h(t,v):return G5@(v61.wilson_operator_from_links(
    np.exp(1j*t*v.reshape(48,11)))-float(v61.M_EXACT)*I192)
site=lambda s:v61.SITE_INDEX[s]
face=[((0,0,0,0),0,1),((0,1,0,0),1,1),((0,0,1,0),0,-1),((0,0,0,0),1,-1)]
probe=np.zeros(528);div=np.zeros(48)
J=np.zeros((192,192),complex);W=np.zeros((192,192),complex)
for xyz,k,sgn in face:
    a=site(xyz);b=site(v61.periodic_shift(xyz,v61.DIRECTIONS[k]))
    probe[11*a+k]+=sgn;div[a]+=sgn;div[b]-=sgn
    tt=g5@(.5*(gamma[k+1]-float(v61.R_EXACT)*np.eye(4)))*v61.antiperiodic_sign(xyz,v61.DIRECTIONS[k])
    aa=slice(4*a,4*a+4);bb=slice(4*b,4*b+4)
    J[aa,bb]+=sgn*1j*tt;J[bb,aa]-=sgn*1j*tt.conj().T
    W[aa,bb]-=tt;W[bb,aa]-=tt.conj().T
assert np.linalg.norm(div)==0
H0=h(0,probe);e,V=eigh(H0)
assert np.linalg.norm(H0-H0.conj().T)<1e-11
assert (sum(e<0),sum(e>0))==(96,96) and min(abs(e))>.8
dt=2e-4
assert np.linalg.norm((h(dt,probe)-h(-dt,probe))/(2*dt)-J)<1e-6
assert np.linalg.norm((h(dt,probe)+h(-dt,probe)-2*H0)/dt**2-W)<1e-5
Wh=np.diag(V.conj().T@W@V).real
Jh=V.conj().T@J@V
def curvature(mu):
    occupied=e+mu<0;empty=~occupied
    contact=float(Wh[occupied].sum())
    para=(float(-2*np.sum(abs(Jh[np.ix_(occupied,empty)])**2/
       (e[empty][None,:]-e[occupied][:,None]))) if occupied.any() and empty.any() else 0.)
    return contact+para,contact,para,float(min(abs(e+mu)))
K0,C0,P0,_=curvature(0.)
assert abs(C0-.31810633296210533)<1e-8
assert abs(P0+2.6683413620433596)<1e-8
assert abs(K0+2.3502350290812544)<1e-8
print('Original v61 plaquette sea: contact',C0,'paramag',P0,'net',K0)
# Exact all-orders Q96 U1 charge moments; no empirical charge adjustments.
charges=[Fr(-1),Fr(-2,3),Fr(-1,3),Fr(0),Fr(1,3),Fr(2,3),Fr(1)]
mult=[6,18,18,12,18,18,6]
for power in range(1,11):
    moment=sum(n*q**power for n,q in zip(mult,charges))
    expected=Fr(0) if power%2 else Fr(12)+Fr(36*(1+2**power),3**power)
    assert moment==expected
assert sum(n*q*q for n,q in zip(mult,charges))==32
assert sum(n*q**4 for n,q in zip(mult,charges))==Fr(176,9)
print('Full Q96 charge moments exact: M2=32, M4=176/9, odd=0 PASS')
# 30x96x192 conditional sum: each chirality weak 30-band carries total q²=16,
# and each right-handed 30-band carries q²=16, including 3 gens + conjugates.
kw=sum(curvature(mu)[0] for mu in weak)
ks=sum(curvature(mu)[0] for mu in plain)
K=16*(kw+ks)
assert min(curvature(mu)[3] for mu in np.r_[weak,plain])>8e-3
assert abs(kw+27.744460751340064)<1e-6
assert abs(ks+18.897779696194874)<1e-6
assert abs(K+746.275847160559)<1e-5
print('Joined conditional sea: weak',kw,'singlets',ks,'total',K,'per configuration',K/30)
def energy(t):
    v=0.
    for q,n in ((1.,3),(1/3,9),(2/3,9)):
        for sign in (-1.,1.):
            ee=np.linalg.eigvalsh(h(sign*q*t,probe))
            for sector in (weak,plain):
                v+=n*np.minimum(ee[:,None]+sector[None,:],0).sum()
    return float(v)
E0=energy(0.)
for dt in (.001,.002,.004):
    check=(energy(dt)+energy(-dt)-2*E0)/dt**2
    assert abs(check-K)<3e-2*(dt/.006)**2+2e-3
    print('Independent full Q96 filled-sea second derivative',dt,check)
print('Q106 JOINED ORIGINAL v61 WILSON/EXACT BERRY CURVATURE: PASS')

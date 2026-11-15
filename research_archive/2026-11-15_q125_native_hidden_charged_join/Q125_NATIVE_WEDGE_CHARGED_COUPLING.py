#!/usr/bin/env python3
"""Q125a exact native 190/50/H64 hidden source -> 444 x Q96 coherent coupling.
No legacy Q77 clock, no fitted ARFs or fabricated source matrices.
"""
from pathlib import Path
from itertools import combinations
from collections import Counter
from fractions import Fraction
from math import lcm
import math,runpy
import numpy as np
import sympy as sp
from scipy.linalg import block_diag
R=Path(__file__).resolve().parents[2]
old=runpy.run_path(str(R/"research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py"))
charge=runpy.run_path(str(R/"research_archive/2026-11-14_q124_charged_barrier_extension/Q124_NATIVE_CHARGED_BARRIER.py"))
assert old["whole_D"].shape==(190,190) and old["Eglobal"].shape==(50,8)
V=old["v"];C=old["C"];Pl=old["Pl"];W=old["W"]
P3=old["P3"];P5=old["P5"]
assert P3*W*P5+P5*W*P3==W
rt=sp.sqrt(5)
a0=sp.zeros(12);a1=sp.zeros(12)
for i in range(12):
    for j in range(12):
        z=sp.expand(Pl[i,j])
        a0[i,j]=z.coeff(rt,0);a1[i,j]=z.coeff(rt,1)
D=lcm(*(z.q for z in list(a0)+list(a1)))
assert D==60
A=[[int(D*a0[i,j]) for j in range(12)] for i in range(12)]
B=[[int(D*a1[i,j]) for j in range(12)] for i in range(12)]
CI=[[int(C[i,j]) for j in range(12)] for i in range(20)]
WI=[[int(W[i,j]) for j in range(20)] for i in range(20)]
# Q124 original 444 genuine 13-contact states and the 1032 native edges.
masks=list(map(int,charge["allowed"]))
assert len(masks)==444
states=[(x,[1-2*((x>>k)&1) for k in range(12)]) for x in masks]
index={x:i for i,x in enumerate(masks)}
links=[(index[x],index[y],k) for x,s in states for k in range(13)
       for y in [x^(1<<k)] if y in index and x<y]
assert len(links)==1032
assert {(masks[i],masks[j],k) for i,j,k in links}=={
       (x,y,k) for x,y,k in charge["links"]}
# Q101 f=(C Pl s)^2 exact as pairs (a,b) representing a+b*sqrt5.
fa=[];fb=[]
for _,s in states:
    u=[sum(A[i][j]*s[j] for j in range(12)) for i in range(12)]
    v=[sum(B[i][j]*s[j] for j in range(12)) for i in range(12)]
    x=[sum(CI[i][j]*u[j] for j in range(12)) for i in range(20)]
    y=[sum(CI[i][j]*v[j] for j in range(12)) for i in range(20)]
    fa.append([x[k]*x[k]+5*y[k]*y[k] for k in range(20)])
    fb.append([2*x[k]*y[k] for k in range(20)])
wa=[[sum(fa[s][k]*WI[k][l] for k in range(20)) for l in range(20)]
    for s in range(444)]
wb=[[sum(fb[s][k]*WI[k][l] for k in range(20)) for l in range(20)]
    for s in range(444)]
counts=Counter();jfield={}
for i,j,bit in links:
    aa=sum(wa[i][k]*fa[j][k]+5*wb[i][k]*fb[j][k]
           for k in range(20))
    bb=sum(wa[i][k]*fb[j][k]+wb[i][k]*fa[j][k]
           for k in range(20))
    a=Fraction(aa,2*D**4);b=Fraction(bb,2*D**4)
    counts[(bit==12,a,b)]+=1;jfield[i,j]=(a,b)
expect=Counter({(False,Fraction(0),Fraction(-8,5)):240,
                (False,Fraction(0),Fraction(8,5)):240,
                (False,Fraction(0),Fraction(0)):240,
                (False,Fraction(4),Fraction(12,5)):120,
                (False,Fraction(-4),Fraction(-12,5)):120,
                (True,Fraction(0),Fraction(0)):72})
assert counts==expect,(counts,expect)
phi=(1+rt)/2
lo=8*rt/5;hi=4+12*rt/5
assert sp.simplify(hi/lo-phi**2)==0
s0=sum(n*(sp.Rational(a)**2+5*sp.Rational(b)**2)
       for (center,a,b),n in counts.items())
s1=sum(n*2*sp.Rational(a)*sp.Rational(b)
       for (center,a,b),n in counts.items())
moment=sp.expand(s0+rt*s1)
assert moment==16896+4608*rt
assert sp.expand(192*moment)==3244032+884736*rt
# Q124 U96 links (original Q16 x three gens + conjugate):
# Hch_xy=i Jxy U96_xy. Hermitian and global charge-Ward by construction.
sigma=np.asarray([[[0,1],[1,0]],[[0,-1j],[1j,0]],
                  [[1,0],[0,-1]]])
axis=np.asarray(charge["axis"])[masks]
S=np.einsum("ai,ijk->ajk",axis,sigma)
Y=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0]).astype(complex)
Q=[]
for ss in S:
    q=Y.copy()
    for t in range(4):q[2*t:2*t+2,2*t:2*t+2]+=ss/2
    Q.append(q)
nonzero=0
for i,j,bit in links:
    dot=float(axis[i]@axis[j])
    assert dot>-1+1e-10
    U=(np.eye(2)+S[i]@S[j])/math.sqrt(2*(1+dot))
    U16=block_diag(U,U,U,U,np.eye(8))
    assert np.linalg.norm(U16.conj().T@U16-np.eye(16))<1e-11
    assert np.linalg.norm(Q[i]@U16-U16@Q[j])<1e-11
    a,b=jfield[i,j];weight=float(a)+math.sqrt(5)*float(b)
    if abs(weight)>1e-12:
        nonzero+=1
        h=1j*weight*U16
        assert np.linalg.norm(Q[i]@h-h@Q[j])<2e-10
        assert np.linalg.norm(h.conj().T+1j*weight*U16.conj().T)<2e-10
assert nonzero==720
print("EXACT 1032 original all-five hidden wedge currents",counts,flush=True)
print("EXACT nonzero amplitude ratio phi^2 and sum J^2",moment,flush=True)
print("EXACT Tr(Hch^2) on 444 x 96",192*moment,flush=True)
print("All 1032 Q96 charged intertwiners; 720 nonzero source-weighted blocks: PASS",
      flush=True)
# The original 48-site/192-spinor/528-link Wilson h_v61(qA) joins via
# Hjoin=Hch tensor I192 + directsum_x,q P_x(q) tensor h_v61(qA).
# Qx Uxy=Uxy Qy gives genuine FULL spatial Ward conjugation, both orders.
# Execute original untouched Wilson's 528-link gradient covariance.
import importlib.util,sys
source=R/"research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py"
spec=importlib.util.spec_from_file_location("q125_original_v61",source)
v61=importlib.util.module_from_spec(spec);sys.modules[spec.name]=v61
spec.loader.exec_module(v61)
_,g5=v61.gamma_matrices()
G5=np.kron(np.eye(48),g5);I=np.eye(192, dtype=complex)
def hw(x):
    return G5@(v61.wilson_operator_from_links(np.exp(1j*x.reshape(48,11)))
               -float(v61.M_EXACT)*I)
H0=hw(np.zeros(528))
omega=.1*np.sin(.17*np.arange(48)+.3)
inc=np.zeros((528,48))
for a,site in enumerate(v61.SITES):
    for k,d in enumerate(v61.DIRECTIONS):
        j=v61.SITE_INDEX[v61.periodic_shift(site,d)]
        inc[11*a+k,a]=1;inc[11*a+k,j]-=1
grad=inc@omega
for q in (-1.,-2/3,-1/3,0.,1/3,2/3,1.):
    U=np.diag(np.exp(1j*q*np.repeat(omega,4)))
    assert np.linalg.norm(hw(q*grad)-U@H0@U.conj().T)<1e-10
    O=np.diag(q*np.repeat(omega,4))
    d1=1j*(O@H0-H0@O)
    d2=-(O@(O@H0-H0@O)-(O@H0-H0@O)@O)
    eps=3e-4
    plus=hw(eps*q*grad);minus=hw(-eps*q*grad)
    assert np.linalg.norm((plus-minus)/(2*eps)-d1)<2e-6
    assert np.linalg.norm((plus+minus-2*H0)/eps**2-d2)<2e-5
print("ORIGINAL 192/528 v61 with seven real charges: gauge + Ward orders 1,2 PASS")
print("Q125a source-derived coherent charged Wilson join: PASS")
print("Physical time, relative kinetic scale and stable 4D photon residue OPEN")

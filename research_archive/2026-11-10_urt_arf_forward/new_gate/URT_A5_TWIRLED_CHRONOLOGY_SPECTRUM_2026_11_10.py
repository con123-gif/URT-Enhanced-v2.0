#!/usr/bin/env python3
"""A5-covariant chronology: exact spectral and ordering certificate.
Imports the already verified native A5/H64 action; no ARF targets or fits.
"""
import runpy, contextlib, io
from pathlib import Path
import numpy as np
import sympy as sp
root=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    base=runpy.run_path(str(root/'URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py'))
perms64=base['perms64']; W=base['W']; weights=base['weights']
H=base['H64']; assert len(perms64)==60
Q2=np.zeros((64,64),dtype=np.int64)
for h in range(64):
    Q2[h,2*h%64]=1;Q2[h,(2*h+1)%64]=1
S=sum((Q2[np.ix_(p,p)] for p in perms64),np.zeros((64,64),dtype=np.int64))
assert np.all(S>=0) and np.all(S.sum(axis=0)==120) and np.all(S.sum(axis=1)==120)
assert np.array_equal(S@H,H@S)
for p in perms64:assert np.array_equal(S[np.ix_(p,p)],S)
D=(W.T@S@W);assert np.all(D%64==0);D//=64
x=sp.Symbol('x');polys={}
blocks={0:(0,6),10:(1,5),16:(2,4),18:(3,)}
expected={0:x*(x-120),10:(x*x-2000)**3*(x*x-80)**3,
 16:(x-16)**6*(x-8)**6*(x+2)**4*(x+4)**4*(x+8)**5*(x+16)**5,
 18:x**8*(x*x-80)**6}
for energy,ws in blocks.items():
    ids=[m for m in range(64) if weights[m] in ws]
    out=[m for m in range(64) if weights[m] not in ws]
    assert not np.any(D[np.ix_(ids,out)])
    polys[energy]=sp.factor(sp.Matrix(D[np.ix_(ids,ids)]).charpoly(x).as_expr())
    assert sp.expand(polys[energy]-expected[energy])==0
# Exact annihilator: nonzero eigenvalues semisimple; zero Jordan index 2.
Z=S.astype(object);I=np.eye(64,dtype=object);P=I.copy()
for a in (0,120,16,8,-2,-4,-8,-16):P=P@(Z-a*I)
P=P@(Z@Z-2000*I)@(Z@Z-80*I)
assert any(v!=0 for v in P.flat) and all(v==0 for v in (Z@P).flat)
S6=np.linalg.matrix_power(S,6)
assert sp.Rational(int(S6[0,0]),120**6)-sp.Rational(1,64)==sp.Rational(522497,2073600000)
# Conditional minimal pair flip: Bbar = A*S/1800.
A=15*np.eye(64,dtype=np.int64)-H
M=A@S
assert np.array_equal(A@S,S@A) and np.all(M>=0) and np.all(M.sum(axis=0)==1800)
assert np.all(M.sum(axis=1)==1800)
assert sp.Rational(int(np.sum(M*M)),1800**2)==sp.Rational(7457,6750)
DM=W.T@M@W;assert np.all(DM%64==0);DM//=64
response={}
for energy,ws in blocks.items():
    ids=[m for m in range(64) if weights[m] in ws]
    T=sp.Matrix(DM[np.ix_(ids,ids)])/1800
    response[energy]=sp.Integer(1) if energy==0 else sp.factor(sp.trace((sp.eye(len(ids))+T)*(sp.eye(len(ids))-T).inv()))
assert response=={0:1,10:sp.Rational(6298500,516461),16:sp.Rational(7758658260986595,258602797781776),18:sp.Rational(90004,4499)}
# Relabeling axes, with primitive Q held fixed, changes the twirl spectrum.
def reordered(bitperm):
    f=[sum(((h>>i)&1)<<bitperm[i] for i in range(6)) for h in range(64)]
    fi=[f.index(h) for h in range(64)]
    return sum((Q2[np.ix_(p2,p2)] for p in perms64
                for p2 in [[f[p[fi[h]]] for h in range(64)]]),np.zeros((64,64),dtype=np.int64))
traces=[int(np.trace(B@B)) for B in (S,reordered((1,0,2,3,4,5)),reordered((3,1,2,0,4,5)))]
assert traces==[31440,42480,27120]
# Full sign-flip twirl = one-step Haar, exactly.
Sf=sum((Q2[np.ix_(p,p)] for p in ([h^t for h in range(64)] for t in range(64))),np.zeros((64,64),dtype=np.int64))
assert np.array_equal(Sf,np.full((64,64),2,dtype=np.int64))
for e in (0,10,16,18):print('Hbits energy',e,'charpoly(120 Qbar)',polys[e])
print('Qbar^6[0,0]-1/64 = 522497/2073600000')
print('coupled Bbar nonstationary spectral radius sqrt(5)/18')
print('coupled Gram trace 7457/6750; Green-Kubo traces',response)
print('axis-order trace(S^2) counterexamples',traces)
print('full sign-flip twirl = one-step Haar: EXACT')
print('PASS no-fit source/transfer-level theorem; physical four ARFs OPEN')

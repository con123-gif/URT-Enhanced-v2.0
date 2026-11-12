#!/usr/bin/env python3
"""Native 64-history/24-clock rate and flux readout (conditional). No fitted data."""
import argparse, contextlib, io, runpy
from pathlib import Path
from math import pi, e, sqrt
import numpy as np
from scipy.optimize import minimize_scalar
p=argparse.ArgumentParser();p.add_argument('--reconstruction');args=p.parse_args()
if args.reconstruction:
    with contextlib.redirect_stdout(io.StringIO()):
        x=runpy.run_path(args.reconstruction)
    P3,P5,u,v=x['P3'],x['P5'],x['u'],x['v']
    B,H=x['B'],x['H'];delta=x['Delta']
    theta=2*pi/((1+sqrt(5))/2)**2;r=pi/e
else:
    prev=Path(__file__).resolve().parents[1]/'2026-11-12_native_emergent_time/NATIVE_TIME_INTERFACE_VERIFY.py'
    with contextlib.redirect_stdout(io.StringIO()):
        x=runpy.run_path(str(prev))
    P3,P5,u,v=x['P3'],x['P5'],x['u'],x['v']
    B,H=x['B'],x['H'];delta=x['Delta']
    theta=x['m']['theta'];r=x['m']['r']
N=24;S=np.roll(np.eye(N),1,axis=0)
def L(t):return 2*np.eye(N)-np.exp(2j*t)*S-np.exp(-2j*t)*S.T
ell=np.linalg.eigvalsh(L(theta));kin=r*r*ell
assert np.min(ell)>0
assert np.max(np.abs((18+kin)-(16+kin)-2))<2e-14
ratio=(18+kin)/(16+kin)
assert ratio.max()-ratio.min()>.03
A0=B@H;T=A0.T@A0
assert np.linalg.eigvalsh(T).min()>-1e-12 and np.linalg.eigvalsh(T).max()<1+1e-12
au=A0@u;av=A0@v
m=(au**2+av**2)/2;b=au*av
assert np.max(abs(b.imag))<1e-13
def stats(t):
    pj=m+b*np.cos(2*t);dj=-2*b*np.sin(2*t)
    p=float(pj.sum());dp=float(dj.sum())
    return dp*dp/(p*(1-p)), float((dj*dj/pj).sum()+dp*dp/(1-p))
def peak(k):
    f=lambda t: stats(t)[k]
    ts=np.linspace(.005,np.pi-.005,1000);z=ts[int(np.argmax([f(float(t)) for t in ts]))]
    out=minimize_scalar(lambda t:-f(t),bounds=(max(.000001,z-.01),min(np.pi-.000001,z+.01)),method='bounded')
    return -out.fun
fb=peak(0);ft=peak(1)
assert abs(fb-.3264301477404643)<1e-8
assert abs(ft-.7303592989515282)<1e-8
# Real Haar dictionary: even under t -> -t on all 24 measured tracks.
for t in [.3,.8,1.2]:
    assert np.max(abs(m+b*np.cos(2*t)-m-b*np.cos(-2*t)))<1e-14
# Dress the ORIGINAL history source by its ORIGINAL q=2 clock Schur blocks.
def dress(ang,src=A0):
    w=L(ang)
    return np.linalg.solve(18*np.eye(N)+r*r*w,src@P3)+delta*np.linalg.solve(16*np.eye(N)+r*r*w,src@P5)
A=dress(theta)
assert np.linalg.svd(A,compute_uv=False)[0]<1
z=(A@u).conj()*(A@v);odd=float(np.linalg.norm(z.imag))
assert odd>1e-8
assert np.max(abs((dress(0)@u).conj()*(dress(0)@v)).imag)<1e-13
assert np.linalg.norm(dress(-theta)-A.conj())<1e-12
# q=2 large gauge shift, also rotate the charged source frame.
shift=pi/N;D=np.diag(np.exp(2j*np.arange(N)*shift))
assert np.linalg.norm(L(theta+shift)-D@L(theta)@D.conj().T)<1e-12
assert np.linalg.norm(dress(theta+shift,D@A0)-D@A)<1e-12
for t in [.3,.8]:
    psi=(u+np.exp(2j*t)*v)/sqrt(2)
    assert np.max(abs(abs(dress(theta+shift,D@A0)@psi)**2-abs(A@psi)**2))<1e-13
print('NATIVE_ADDITIVE_CLOCK_GAP',2,'at all',N,'modes')
print('NATIVE_SCHUR_RATIO_RANGE',float(ratio.min()),float(ratio.max()))
print('BINARY_FISHER',fb,'TRACK_FISHER',ft,'QFI',4.0)
print('GOLDEN_FLUX_ODD_QUADRATURE',odd,'SIGNED_SUM',float(z.imag.sum()))
print('STATUS: conditional information readout; no physical Lorentz/time derivation')
print('PASS local named-operator check')

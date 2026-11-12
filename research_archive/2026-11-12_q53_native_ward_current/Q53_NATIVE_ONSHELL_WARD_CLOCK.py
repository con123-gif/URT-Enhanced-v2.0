#!/usr/bin/env python3
"""Q53: native 190/64/24 on-shell charge-two Ward-link current.
Original archived Nov 7 model only; no Haar history-clock dictionary or fitted data.
Here "on shell" refers to eliminated 64-history Gaussian field, not all 190 cochains.
"""
import contextlib, io, runpy
from pathlib import Path
from math import pi, sqrt
import numpy as np

root=Path(__file__).resolve().parents[2]
native=root/"research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py"
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(native))
N=24;theta=m["theta"];r=m["r"];delta=m["Delta"]
assert m["D"].shape==(190,190) and m["Hbits"].shape==(64,64)
assert abs(np.trace(m["D"]@m["D"])-720)<1e-9
assert np.linalg.norm(m["Eglobal"].T@m["Eglobal"]-np.eye(8))<1e-12
assert np.linalg.norm(m["Uh"].T@m["Uh"]-m["P3"]-m["P5"])<1e-11
a=np.eye(8)[0]+np.eye(8)[3]
v50=m["Eglobal"]@a
h30,h50=m["hidden_source"](v50)
A=float(np.vdot(h30,h30).real);B=float(np.vdot(h50,h50).real)
assert A>0 and B>0
z0=np.zeros(190,complex)
for name in m["names"]:
    g=m["geom"][name]
    o,nv,ov=g["offset"],g["V"],g["v_offset"]
    z0[o:o+nv]=v50[ov:ov+nv]
assert abs(np.vdot(z0,z0).real-2)<1e-12

def current(fields,q,angles):
    nextfields=np.roll(fields,-1,axis=0)
    return q*r*r*np.imag(np.sum(np.conj(nextfields)*np.exp(1j*q*angles)[:,None]*fields,axis=1))

def history_source(ang,h3,h5):
    return m["history_source_solve"](h3,h5,ang)

for winding in (0,3,12,15):
    k=2*pi*winding/N
    phase=np.exp(1j*k*np.arange(N))
    z=phase[:,None]*z0
    h3=phase[:,None]**2*h30
    h5=phase[:,None]**2*h50
    ang=np.full(N,theta)
    V,y=history_source(ang,h3,h5)
    E,ys,Vs,hs3,hs5=m["reduced_action"](z,ang)
    assert abs(V-Vs)<2e-10
    assert np.linalg.norm(ys-y)<2e-10
    assert np.linalg.norm(hs3-h3)<2e-11 and np.linalg.norm(hs5-h5)<2e-11
    ell=2-2*np.cos(2*(theta-k))
    jh=2*r*r*np.sin(2*(theta-k))*(A/(18+r*r*ell)**2+delta**2*B/(16+r*r*ell)**2)
    jg=r*r*np.sin(theta-k)*2
    Jh=current(y,2,ang);Jg=current(z,1,ang)
    assert np.max(abs(Jh-jh))<3e-12
    assert np.max(abs(Jg-jg))<3e-12
    # Envelope/Schur derivative, on each native Wilson link.
    eps=1e-5;j=7
    ap=ang.copy();am=ang.copy();ap[j]+=eps;am[j]-=eps
    deriv=(m["reduced_action"](z,ap)[0]-m["reduced_action"](z,am)[0])/(2*eps)
    assert abs(deriv-(Jh[j]+Jg[j]))<2e-7
    # Independently compare direct uneliminated and reduced action.
    assert abs(m["full_action"](z,y,ang)-E)<2e-9
    # Local U(1): charge-one cochains and charge-two histories.
    alpha=.15*np.sin(2*pi*np.arange(N)/N)+.09*np.cos(4*pi*np.arange(N)/N)
    ag=ang+np.roll(alpha,-1)-alpha
    zg=np.exp(1j*alpha)[:,None]*z
    Eg,yg,*_=m["reduced_action"](zg,ag)
    assert abs(Eg-E)<2e-9
    assert np.linalg.norm(yg-np.exp(2j*alpha)[:,None]*y)<2e-10
    assert np.max(abs(current(yg,2,ag)-Jh))<2e-11
    assert np.max(abs(current(zg,1,ag)-Jg))<2e-11
    assert abs(m["full_action"](zg,yg,ag)-Eg)<2e-9
    # Conjugating source and reversing flux reverses both currents.
    Em,ym,*_=m["reduced_action"](np.conj(z),-ang)
    assert abs(Em-E)<2e-9
    assert np.max(abs(current(ym,2,-ang)+Jh))<2e-11
    assert np.max(abs(current(np.conj(z),1,-ang)+Jg))<2e-11
    print("Q53",winding,"source3",A,"source5",B,"J_history",jh,"J_geom",jg,
          "J_total",jg+jh,"finite_diff",deriv)
assert abs(theta/pi-2/((1+sqrt(5))/2)**2)<1e-13
print("Q53_NATIVE_ONSHELL_WARD_CLOCK_PASS: original five-solid cochains, 64 histories, 24 Wilson tracks.")

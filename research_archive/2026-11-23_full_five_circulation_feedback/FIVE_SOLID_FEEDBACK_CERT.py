#!/usr/bin/env python3
"""Original-operator full-Cathedral five-solid circulation feedback certificate."""
from pathlib import Path
import sys
import numpy as np
sys.path.insert(0,str(Path(__file__).resolve().parents[2]))
from cathedral_core.circulation_feedback import FiveSolidCirculationDynamics
from cathedral_core.full_dynamics import NativeURTFullDynamics
from cathedral_core.native_urt import NativeURTState

def close(a,b,t=1e-8):
    assert abs(a-b) <= t*max(1.,abs(a),abs(b)),(a,b)

def run():
    d=FiveSolidCirculationDynamics.from_archive()
    assert (d.N,d.full_dimension,d.history_dimension)==(24,190,64)
    rng=np.random.default_rng(20261123)
    z=.12*(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))
    y=.03*(rng.normal(size=(24,64))+1j*rng.normal(size=(24,64)))
    st=NativeURTState(z,np.full(24,d.golden_angle),y)
    E,G,parts=d.circulation_energy_gradient(z)
    assert len(parts)==5 and min(parts.values())>1e-8
    close(sum(parts.values()),E)
    assert np.linalg.norm(G)>1e-8
    for s in d.surfaces:
        o,v,e=s.offset,s.V,s.E
        for idx in (o,o+v,o+v+e-1):
            direction=np.zeros_like(z);direction[0,idx]=1+.37j
            eps=2e-6
            diff=(d.circulation_energy_gradient(z+eps*direction)[0]-
                  d.circulation_energy_gradient(z-eps*direction)[0])/(2*eps)
            close(diff,np.vdot(G,direction).real,4e-7)
        # Curl feedback produces only solenoidal edge variations.
        assert np.linalg.norm(G[:,o+v:o+v+e]@s.b1.T)<1e-9
        zz=z.copy()
        xi=rng.normal(size=(24,v))+1j*rng.normal(size=(24,v))
        zz[:,o+v:o+v+e]+=xi@s.b1
        close(d.circulation_energy_gradient(zz)[0],E,2e-11)
        assert d.circulation_energy_gradient(z,frozenset([s.name]))[0]<E
    U=np.exp(1j*np.sin(np.arange(24)*d.golden_angle))[:,None]
    Er,Gr,_=d.circulation_energy_gradient(z*U)
    close(Er,E,2e-12)
    assert np.linalg.norm(Gr-G*U)<1e-9
    E0,G0,Y0=NativeURTFullDynamics.full_energy_and_gradient(d,st)
    E1,G1,Y1=d.full_energy_and_gradient(st)
    close(E1-E0,E,2e-11)
    assert np.linalg.norm(G1-G0-G)<1e-9
    assert np.array_equal(Y1,Y0)
    dz,dy=d.hamiltonian_rhs(st)
    dEdt=(np.vdot(G1,dz)+np.vdot(Y1,dy)).real
    dQdt=2*np.vdot(z,dz).real+4*np.vdot(y,dy).real
    assert abs(dEdt)<1e-8*max(1.,abs(E1))
    assert abs(dQdt)<1e-8*max(1.,np.vdot(z,z).real+np.vdot(y,y).real)
    vnorm=enorm=0.
    for s in d.surfaces:
        o,v,e=s.offset,s.V,s.E
        vnorm+=np.linalg.norm(G[:,o:o+v])**2
        enorm+=np.linalg.norm(G[:,o+v:o+v+e])**2
    assert vnorm>1e-8 and enorm>1e-8

    def plain_rhs(st):
        _,a,b=NativeURTFullDynamics.full_energy_and_gradient(d,st)
        return -1j*a,-1j*b
    def coupled_rhs(st):
        return d.hamiltonian_rhs(st)
    def step(st,h,rhs):
        a,b=rhs(st)
        mid=NativeURTState(st.z+.5*h*a,st.theta,st.y+.5*h*b)
        aa,bb=rhs(mid)
        return NativeURTState(st.z+h*aa,st.theta,st.y+h*bb)
    x0=st;x1=st
    for _ in range(5):
        x0=step(x0,.002,plain_rhs)
        x1=step(x1,.002,coupled_rhs)
    assert np.linalg.norm(x1.z-x0.z)>1e-9
    _,h30,h50=d.sources(x0.z)
    _,h31,h51=d.sources(x1.z)
    deltaHidden=np.linalg.norm(h31-h30)+np.linalg.norm(h51-h50)
    deltaHistory=np.linalg.norm(x1.y-x0.y)
    assert deltaHidden>1e-12,deltaHidden
    assert deltaHistory>1e-14,deltaHistory
    print("Five original solid energies:",parts)
    print("Coupling energy:",E,"original energy:",E0)
    print("vertex-gradient norm:",vnorm**.5,"edge-gradient norm:",enorm**.5)
    print("hidden source change:",deltaHidden,"H64 evolution change:",deltaHistory)
    print("dE/dt:",dEdt,"dQ/dt:",dQdt)
    print("PASS: full original 190/64/24 model plus all-five coexact circulation feedback")
if __name__=="__main__": run()

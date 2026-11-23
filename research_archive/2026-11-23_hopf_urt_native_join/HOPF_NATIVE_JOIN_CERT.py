#!/usr/bin/env python3
"""Original operator five-solid Hopf/URT/flow/H64/24-clock joined certificate."""
from pathlib import Path
import sys
import numpy as np
sys.path.insert(0,str(Path(__file__).resolve().parents[2]))
from cathedral_core.hopf_urt_join import FiveSolidHopfURTDynamics
from cathedral_core.circulation_feedback import FiveSolidCirculationDynamics
from cathedral_core.native_urt import NativeURTState

def eq(a,b,atol=1e-8):
    assert abs(a-b)<atol*max(1.,abs(a),abs(b)),(a,b)

def main():
    d=FiveSolidHopfURTDynamics.from_archive()
    assert len(d.hopf_surfaces)==5
    assert (d.N,d.full_dimension,d.history_dimension)==(24,190,64)
    rng=np.random.default_rng(20261123)
    z=.12*(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))
    y=.03*(rng.normal(size=(24,64))+1j*rng.normal(size=(24,64)))
    st=NativeURTState(z,np.full(24,d.golden_angle),y)
    Eh,Gh,parts=d.hopf_energy_gradient(z)
    eq(Eh,sum(parts.values()))
    assert np.linalg.norm(Gh)>1e-6
    assert min(abs(np.sum(s.fluxq)) for s in d.hopf_surfaces)>6
    currents=d.hopf_edge_currents(z)
    for s in d.hopf_surfaces:
        assert len(s.flux0)==s.F and len(s.fluxq)==s.F
        eq(np.sum(s.flux0),2*np.pi,1e-12)
        eq(np.sum(s.fluxq),2*np.pi,1e-12)
        assert np.std(s.fluxq)>1e-4
        assert s.Bq.shape==(s.E,s.V)
        assert s.B0.shape==(s.E,s.V)
        assert s.name in parts
        o,v=s.offset,s.V
        # Exact derivative of magnetic replacement for real and complex fields.
        for k in (o,o+v//2,o+v-1):
            dz=np.zeros_like(z)
            dz[0,k]=1+.37j
            eps=2e-6
            fd=(d.hopf_energy_gradient(z+eps*dz)[0]-
                d.hopf_energy_gradient(z-eps*dz)[0])/(2*eps)
            eq(fd,np.vdot(Gh,dz).real,3e-7)
        psi=z[:,o:o+v]
        # Static local Hopf frame gauge change: psi and link frames co-transform.
        chi=np.linspace(-.33,.72,v)
        phase=np.exp(1j*chi)
        uq2=s.uq*np.exp(1j*(chi[s.j]-chi[s.i]))
        B2=np.zeros_like(s.Bq)
        B2[np.arange(s.E),s.i]=-uq2
        B2[np.arange(s.E),s.j]=1.
        a=np.linalg.norm(psi@s.Bq.T)**2
        b=np.linalg.norm((psi*phase)@B2.T)**2
        eq(a,b,1e-11)
        current,curled=currents[s.name]
        assert current.shape==(24,s.E) and curled.shape==(24,s.F)
        assert np.linalg.norm(curled)>1e-8
        current2=np.imag(np.conj((psi*phase)[:,s.j])*uq2[None,:]*(psi*phase)[:,s.i])
        assert np.max(abs(current2-current))<1e-11
        assert abs(d.hopf_energy_gradient(z,frozenset([s.name]))[0]-(Eh-parts[s.name]))<1e-10

    # Existing 24-clock charge-one covariance for the complete added term.
    theta=np.sin(np.arange(24)*d.golden_angle)
    phase=np.exp(1j*theta)[:,None]
    ef,gf,_=d.hopf_energy_gradient(z*phase)
    eq(ef,Eh,1e-11)
    assert np.linalg.norm(gf-Gh*phase)<1e-9

    baseE,baseG,baseY=FiveSolidCirculationDynamics.full_energy_and_gradient(d,st)
    E,G,Y=d.full_energy_and_gradient(st)
    eq(E-baseE,Eh,1e-10)
    assert np.linalg.norm(G-baseG-Gh)<1e-9
    assert np.array_equal(Y,baseY)
    dz,dy=d.hamiltonian_rhs(st)
    edot=(np.vdot(G,dz)+np.vdot(Y,dy)).real
    qdot=2*np.vdot(z,dz).real+4*np.vdot(y,dy).real
    assert abs(edot)<1e-8*max(1,abs(E))
    assert abs(qdot)<1e-8*max(1,d.noether_charge(st))

    def rhs(st,with_hopf):
        if with_hopf:
            return d.hamiltonian_rhs(st)
        _,a,b=FiveSolidCirculationDynamics.full_energy_and_gradient(d,st)
        return -1j*a,-1j*b

    def step(st,h,with_hopf):
        a,b=rhs(st,with_hopf)
        mid=NativeURTState(st.z+.5*h*a,st.theta,st.y+.5*h*b)
        aa,bb=rhs(mid,with_hopf)
        return NativeURTState(st.z+h*aa,st.theta,st.y+h*bb)

    x0=st; x1=st
    for _ in range(5):
        x0=step(x0,.002,False)
        x1=step(x1,.002,True)
    _,h30,h50=d.sources(x0.z)
    _,h31,h51=d.sources(x1.z)
    hidden_change=float(np.linalg.norm(h31-h30)+np.linalg.norm(h51-h50))
    history_change=float(np.linalg.norm(x1.y-x0.y))
    assert hidden_change>1e-8,hidden_change
    assert history_change>1e-12,history_change
    print("Primitive q",d.primitive_q)
    print("Projective URT-Hopf original-to-current Berry flux by solid:",
          {s.name:float(np.sum(s.fluxq)) for s in d.hopf_surfaces})
    print("Native magnetic-minus-free energy per solid:",parts)
    print("New magnetic-minus-free energy",Eh,"pre-existing five-solid energy",baseE)
    print("Nonzero edge current curls:",{k:float(np.linalg.norm(v[1])) for k,v in currents.items()})
    print("Five-step hidden-source difference",hidden_change,"H64 history difference",history_change)
    print("Full Hamiltonian dE/dt",edot,"Noether dQ/dt",qdot)
    print("PASS native five-solid q/Hopf magnetic flow, original 190/64/24 circulation and H64 interaction")
if __name__=="__main__":
    main()

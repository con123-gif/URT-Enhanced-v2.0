"""Native all-five projective-URT/Hopf magnetic kinetic in the existing Cathedral.

Uses ORIGINAL five Platonic coordinates/boundaries. The projective Hopf map
and minimal magnetic replacement are explicit model choices, not a uniquely
derived Lorentzian/Standard Model coupling. No fitted experimental inputs.
"""
from dataclasses import dataclass
import numpy as np
from cathedral_core.circulation_feedback import FiveSolidCirculationDynamics

@dataclass(frozen=True)
class HopfSurface:
    name: str
    offset: int
    V: int
    E: int
    F: int
    i: np.ndarray
    j: np.ndarray
    b2: np.ndarray
    B0: np.ndarray
    Bq: np.ndarray
    uq: np.ndarray
    flux0: np.ndarray
    fluxq: np.ndarray

def spinors(points):
    p=np.asarray(points,dtype=float)
    p=p/np.linalg.norm(p,axis=1)[:,None]
    out=[]
    for x,y,z in p:
        h=np.array([[z,x-1j*y],[x+1j*y,-z]],dtype=complex)
        out.append(np.linalg.eigh(h)[1][:,1])
    return np.asarray(out)

def link_operators(geometry,q):
    points=geometry["points"]; b1=np.asarray(geometry["b1"],float)
    b2=np.asarray(geometry["b2"],float)
    V,E=b1.shape; F=b2.shape[1]
    start=np.argmax(b1==-1,axis=0)
    finish=np.argmax(b1==1,axis=0)
    assert np.all(b1[start,np.arange(E)]==-1)
    assert np.all(b1[finish,np.arange(E)]==1)
    zp=spinors(points)
    zq=zp.copy()
    zq[:,1]*=q
    zq/=np.linalg.norm(zq,axis=1)[:,None]

    def build(z):
        overlap=np.einsum("ei,ei->e",z[start].conj(),z[finish])
        assert np.min(abs(overlap))>1e-8
        u=overlap/abs(overlap)
        B=np.zeros((E,V),complex)
        B[np.arange(E),start]=-u
        B[np.arange(E),finish]=1
        # The oriented link holonomy is exp(i B2^T arg(u)).
        fphase=np.angle(np.exp(1j*(np.angle(u)@b2)))
        return B,u,fphase

    B0,u0,f0=build(zp)
    Bq,uq,fq=build(zq)
    assert np.max(abs(B0-b1.T))>1e-4
    assert np.max(abs(f0-2*np.pi/F))<1e-10
    assert abs(np.sum(f0)-2*np.pi)<1e-10
    assert abs(np.sum(fq)-2*np.pi)<1e-10
    assert np.std(fq)>1e-4
    return start,finish,b2,B0,Bq,uq,f0,fq

class FiveSolidHopfURTDynamics(FiveSolidCirculationDynamics):
    """Replaces original free vertex gradient by projective URT Hopf covariant
    vertex gradient, on each of five solids. Retains original cross-solid
    bridge, face/edge Hodge terms, circulation quartic, H64, 24 clock and KMS.

    At each solid: + 1/2 ||Bq psi||^2 - 1/2 ||b1.T psi||^2.
    The subtraction avoids duplicating the original vertex gradient term.
    """
    def __init__(self,native):
        super().__init__(native)
        q=self.r*np.exp(1j*self.golden_angle)
        self.primitive_q=q
        surfaces=[]
        for s in self.surfaces:
            i,j,b2,B0,Bq,uq,f0,fq=link_operators(native["geom"][s.name],q)
            surfaces.append(HopfSurface(s.name,s.offset,s.V,s.E,s.F,i,j,b2,s.b1.T,Bq,uq,f0,fq))
        self.hopf_surfaces=tuple(surfaces)

    def hopf_energy_gradient(self,z,excluded=frozenset()):
        z=np.asarray(z,complex)
        assert z.shape==(self.N,190)
        energy=0.
        G=np.zeros_like(z)
        per={}
        for s in self.hopf_surfaces:
            if s.name in excluded:continue
            o,v=s.offset,s.V
            psi=z[:,o:o+v]
            wq=psi@s.Bq.T
            w0=psi@s.B0.T
            diff=.5*(np.vdot(wq,wq).real-np.vdot(w0,w0).real)
            gg=wq@s.Bq.conj()-w0@s.B0
            energy+=diff
            G[:,o:o+v]+=gg
            per[s.name]=float(diff)
        return float(energy),G,per

    def hopf_edge_currents(self,z):
        """Gauge-invariant discrete edge current and its face circulation."""
        out={}
        for s in self.hopf_surfaces:
            psi=np.asarray(z)[:,s.offset:s.offset+s.V]
            j=np.imag(np.conj(psi[:,s.j])*s.uq[None,:]*psi[:,s.i])
            curl=j@s.b2
            out[s.name]=(j,curl)
        return out

    def full_energy_and_gradient(self,state):
        E,gz,gy=super().full_energy_and_gradient(state)
        Eh,gh,_=self.hopf_energy_gradient(state.z)
        return E+Eh,gz+gh,gy

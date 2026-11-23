"""All-five Platonic circulation-to-hidden feedback, preserving the original Cathedral engine.

The dimensionless unit coefficient is an explicit model premise, NOT selected
by primitive URT. Original 190 cochains, H64, 24 clock and KMS remain live.
"""
from __future__ import annotations
from dataclasses import dataclass
import numpy as np
from cathedral_core.full_dynamics import NativeURTFullDynamics

@dataclass(frozen=True)
class Surface:
    name: str
    offset: int
    V: int
    E: int
    F: int
    b1: np.ndarray
    b2: np.ndarray
    W: np.ndarray

def read_surfaces(native):
    result=[]
    totals=[0,0,0]
    for name,g in native["geom"].items():
        o=int(g["offset"]); v,e,f=[int(g[k]) for k in ("V","E","F")]
        b1=np.asarray(g["b1"],dtype=float)
        b2=np.asarray(g["b2"],dtype=float)
        assert b1.shape==(v,e) and b2.shape==(e,f)
        assert np.max(abs(b1@b2)) < 1e-12
        membership=abs(b1)@abs(b2)
        assert np.max(abs(membership[membership>0]-2))<1e-12
        membership=(membership>0).astype(float)
        assert np.all(membership.sum(axis=0)>=3)
        W=membership/membership.sum(axis=0)[None,:]
        result.append(Surface(str(name),o,v,e,f,b1,b2,W))
        totals=np.array(totals)+[v,e,f]
    assert len(result)==5 and tuple(totals)==(50,90,50)
    assert sum(s.E-np.linalg.matrix_rank(s.b1) for s in result)==45
    return tuple(result)

class FiveSolidCirculationDynamics(NativeURTFullDynamics):
    """Preserves every original term. Adds local positive quartic curl feedback.

    E_add = (1/2) sum_{j,f} mean_{v in f}|z_{j,v}|^2
                                      |sum_e b2[e,f] z_{j,e}|^2.
    Invariant under clock-local U(1) rotations of all z components and under
    exact edge shifts z_edge -> z_edge + b1.T epsilon.
    """
    def __init__(self,native):
        super().__init__(native)
        self.surfaces=read_surfaces(native)

    def circulation_energy_gradient(self,z,excluded=frozenset()):
        z=np.asarray(z,dtype=complex)
        assert z.shape==(24,190)
        G=np.zeros_like(z)
        total=0.
        parts={}
        for s in self.surfaces:
            if s.name in excluded: continue
            o,v,e=s.offset,s.V,s.E
            zv=z[:,o:o+v]
            za=z[:,o+v:o+v+e]
            curl=za@s.b2
            dens=abs(zv)**2@s.W
            strength=abs(curl)**2
            en=.5*np.sum(dens*strength)
            total+=en
            parts[s.name]=float(en)
            G[:,o:o+v]+=zv * (strength@s.W.T)
            G[:,o+v:o+v+e]+=(dens*curl)@s.b2.T
        return float(total),G,parts

    def full_energy_and_gradient(self,state):
        E,gz,gy=super().full_energy_and_gradient(state)
        Ec,gc,_=self.circulation_energy_gradient(state.z)
        return E+Ec,gz+gc,gy

"""Full dynamical, nonlinear 190-geometric/64-history/24-clock URT.

An explicit canonical Hamiltonian *candidate* evolving BOTH z and y.
Unlike the energy-descent prototype, it preserves the action and U(1)
Noether charge in continuous time. No new fitted physical constants.
The choice of canonical symplectic time is declared, not derived from URT.
"""
from __future__ import annotations
from dataclasses import dataclass
import numpy as np
from .native_urt import NativeURTEngine, NativeURTState

@dataclass
class CanonicalStep:
    state: NativeURTState
    energy_before: float
    energy_after: float
    charge_before: float
    charge_after: float
    dt: float

class NativeURTFullDynamics(NativeURTEngine):
    """Dynamical completion of original full (z,y) action without eliminating y."""

    def full_energy_and_gradient(self, state: NativeURTState):
        if state.y is None:
            raise ValueError("Full dynamics requires independent 24x64 history y")
        z = np.asarray(state.z, dtype=complex)
        y = np.asarray(state.y, dtype=complex)
        theta = np.asarray(state.theta, dtype=float)
        if z.shape != (self.N, 190) or y.shape != (self.N, 64):
            raise ValueError("Expected z:(24,190), y:(24,64)")
        L1 = self.clock_laplacian(theta, 1)
        L2 = self.clock_laplacian(theta, 2)
        diffz = np.roll(z,-1,axis=0)-np.exp(1j*theta)[:,None]*z
        diffy = np.roll(y,-1,axis=0)-np.exp(2j*theta)[:,None]*y
        geom = .5*np.vdot(z,z@self.H.T).real +.5*self.r**2*np.vdot(diffz,diffz).real
        gy_geom = z@self.H.T + self.r**2*(L1@z)
        f,h3,h5=self.sources(z)
        source=(h3+self.Delta*h5)@self.Uh.T
        h_energy=(.5*np.vdot(y,y@self.Hbits.T).real
             +.5*self.r**2*np.vdot(diffy,diffy).real
             +.25*(np.vdot(h3,h3).real+self.Delta**2*np.vdot(h5,h5).real)
             -np.vdot(y,source).real)
        gy=y@self.Hbits.T + self.r**2*(L2@y)-source
        E3=.25*np.sum(np.abs(h3)**2,axis=1)
        E5=.25*self.Delta**2*np.sum(np.abs(h5)**2,axis=1)
        w3=-self.eta*E3
        w5=2*np.log(self.Delta)-self.eta*E5
        top=np.maximum(w3,w5)
        p3=np.exp(w3-top)
        p5=np.exp(w5-top)
        denom=p3+p5
        p3/=denom
        p5/=denom
        entropy=-np.sum(top+np.log(denom)-np.log1p(self.Delta**2))/self.eta
        uy=y@self.Uh
        g3=.5*(1+p3[:,None])*h3-uy@self.P3
        g5=.5*self.Delta**2*(1+p5[:,None])*h5-self.Delta*(uy@self.P5)
        gf=2*np.conj(f)*(g3+g5)
        gz=gy_geom+(gf@self._face_vertex)@self._V
        energy=float(geom+h_energy+entropy)
        return energy,gz,gy

    def hamiltonian_rhs(self,state:NativeURTState):
        """Canonical symplectic dynamics: dz/dt=-i δS/δz*, dy/dt=-i δS/δy*.

        Gradient uses dS=Re<gz,dz>+Re<gy,dy>, hence the indicated
        generator is a factor-of-two convention choice for time scale.
        """
        _,gz,gy=self.full_energy_and_gradient(state)
        return -1j*gz,-1j*gy

    @staticmethod
    def noether_charge(state:NativeURTState):
        if state.y is None:
            raise ValueError("History required")
        return float(np.vdot(state.z,state.z).real+2*np.vdot(state.y,state.y).real)

    def canonical_step(self,state:NativeURTState,dt:float):
        """Explicit RK4 approximation to energy/Noether-charge preserving flow."""
        if not np.isfinite(dt) or dt<=0:
            raise ValueError("dt must be positive and finite")
        if state.y is None:
            raise ValueError("History required")
        e0,_,_=self.full_energy_and_gradient(state)
        q0=self.noether_charge(state)
        theta=state.theta
        z0=state.z;y0=state.y
        def rhs(z,y):
            return self.hamiltonian_rhs(NativeURTState(z,theta,y))
        k1z,k1y=rhs(z0,y0)
        k2z,k2y=rhs(z0+dt*k1z/2,y0+dt*k1y/2)
        k3z,k3y=rhs(z0+dt*k2z/2,y0+dt*k2y/2)
        k4z,k4y=rhs(z0+dt*k3z,y0+dt*k3y)
        s=NativeURTState(z0+dt*(k1z+2*k2z+2*k3z+k4z)/6,theta.copy(),
                         y0+dt*(k1y+2*k2y+2*k3y+k4y)/6)
        e1,_,_=self.full_energy_and_gradient(s)
        return CanonicalStep(s,e0,e1,q0,self.noether_charge(s),float(dt))

    def linearized_spectrum(self):
        """All 24x(190+64) eigenvalues of exactly linearized native action.

        Quartic hidden sources vanish at z=0. Hence H_geom and Hbits do
        not mix at quadratic order; golden charge1/charge2 clock shifts do.
        """
        g=np.linalg.eigvalsh(self.H)
        h=np.linalg.eigvalsh(self.Hbits)
        m=np.arange(self.N)
        ell1=2-2*np.cos(self.golden_angle-2*np.pi*m/self.N)
        ell2=2-2*np.cos(2*self.golden_angle-2*np.pi*m/self.N)
        zg=(g[None,:]+self.r**2*ell1[:,None]).ravel()
        yh=(h[None,:]+self.r**2*ell2[:,None]).ravel()
        return {"geometry":np.sort(zg),"history":np.sort(yh),
                "minimum_geom":float(zg.min()),"minimum_history":float(yh.min()),
                "history_native_spectrum":np.unique(np.round(h,8),return_counts=True),
                "clock_minimum_mode":int(np.argmin(ell1)),
                "history_minimum_mode":int(np.argmin(ell2)),
                "total_modes":int(zg.size+yh.size)}
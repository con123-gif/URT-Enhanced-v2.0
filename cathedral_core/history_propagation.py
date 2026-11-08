"""Finite native URT-H64 history propagation and exact long-wave cumulants.

The generator is exactly H64=sum_{i<j}(I-X_i X_j), not a new fitted
stochastic network. It has two closed, 32-state parity components.
Six fixed icosahedral axes define the spatial displacement readout
Y_t=(pi/e) int_0^t sum_i s_i(u_i) ds.

The real-tilt cumulant generating rate is the principal eigenvalue of
    -L_parity + (pi/e)*k dot X.
Its expansion is derived from the Walsh character recursion, not fitted.
This is a stochastic history-propagation result. It does not identify the
Hamiltonian time of the separate, interacting full-state URT v3 engine.
"""
from __future__ import annotations
import math
import itertools
import numpy as np

PHI=(1.0+math.sqrt(5.0))/2.0
R=math.pi/math.e


def native_six_axes():
    """One representative from each antipodal icosahedron vertex pair."""
    p=PHI
    raw=np.array([[0,1,p],[0,1,-p],[1,p,0],[1,-p,0],[p,0,1],[p,0,-1]],float)
    return raw/np.linalg.norm(raw,axis=1)[:,None]


class NativeHistoryPropagation:
    """Full 64-state history generator, restricted only to its invariant parity sectors."""

    def __init__(self):
        self.axes=native_six_axes()
        self.states=np.array(list(itertools.product((-1,1),repeat=6)),int)
        self.positions=self.states@self.axes
        self.parity=np.prod(self.states,axis=1)
        address={tuple(s):i for i,s in enumerate(self.states)}
        L=np.eye(64)*15.0
        for i,s in enumerate(self.states):
            for a in range(6):
                for b in range(a+1,6):
                    t=s.copy();t[a]*=-1;t[b]*=-1
                    L[i,address[tuple(t)]]=-1.0
        self.L=L
        self.restrictions={}
        for p in (-1,1):
            ids=np.flatnonzero(self.parity==p)
            self.restrictions[p]=(ids,L[np.ix_(ids,ids)])

    @staticmethod
    def _unit(direction):
        d=np.asarray(direction,float)
        if d.shape!=(3,) or not np.all(np.isfinite(d)):
            raise ValueError("direction must be a finite three-vector")
        norm=np.linalg.norm(d)
        if norm==0:raise ValueError("nonzero direction required")
        return d/norm

    @property
    def max_speed(self):
        """Exact finite microscopic speed bound for the 64 native histories."""
        return R*math.sqrt(6+2*math.sqrt(5))

    def causal_radius(self,time):
        """Support of displacement stays inside this radius for all paths."""
        if time<0 or not np.isfinite(time):raise ValueError("nonnegative finite time required")
        return self.max_speed*time

    @property
    def diffusion_coefficient(self):
        return R*R/5.0

    def covariance_at(self,time):
        """Exact stationary displacement covariance, in either parity sector."""
        if time<0 or not np.isfinite(time):raise ValueError("time must be nonnegative")
        component=4*R*R*(time/10.0+math.expm1(-10*time)/100.0)
        return np.eye(3)*component

    def tilted_generator(self,direction,amplitude=1.0,parity=1):
        n=self._unit(direction)
        if parity not in self.restrictions:raise ValueError("parity must be +1 or -1")
        if not np.isfinite(amplitude):raise ValueError("finite amplitude required")
        indices,L=self.restrictions[parity]
        values=self.positions[indices]@n
        return -L+(R*amplitude)*np.diag(values)

    def dominant_rate(self,direction,amplitude,parity=1):
        return float(np.linalg.eigvalsh(self.tilted_generator(direction,amplitude,parity))[-1])

    def moment_generating_function(self,direction,amplitude,time,parity=1):
        """Exact E_stationary(exp(amplitude * n dot Y_t)) for finite time."""
        if time<0 or not np.isfinite(time):raise ValueError("nonnegative finite time required")
        op=self.tilted_generator(direction,amplitude,parity)
        w,v=np.linalg.eigh(op)
        overlaps=(v.T@np.ones(32))**2/32.0
        return float(overlaps@np.exp(time*w))

    def spatial_fourier_generator(self, wavevector, parity=1):
        """Exact Fourier symbol of the 64-velocity 3D transport equation.

        A_q=-L_parity-i*r*diag(q dot X(s)); p_t=-r*X(s) dot grad p-Lp.
        This retains all 32 velocities in the chosen invariant parity sector.
        """
        k=np.asarray(wavevector,float)
        if k.shape!=(3,) or not np.all(np.isfinite(k)):
            raise ValueError("wavevector must be a finite three-vector")
        if parity not in self.restrictions:raise ValueError("parity must be +1 or -1")
        ids,L=self.restrictions[parity]
        return -L-1j*R*np.diag(self.positions[ids]@k)

    def spatial_fourier_characteristic(self, wavevector, time, parity=1):
        """Exact characteristic function E(exp(-i k.Y_t)) at finite time.

        Initial history is uniform in the chosen parity sector and Y_0=0.
        The transfer is the full 32x32 kinetic Fourier semigroup, not a
        Gaussian or truncated long-wave diffusion kernel.
        """
        if time<0 or not np.isfinite(time):raise ValueError("time must be nonnegative")
        from scipy.linalg import expm  # scipy is in the native-engine optional dependencies
        M=expm(time*self.spatial_fourier_generator(wavevector,parity))
        return complex(np.sum(M)/32.0)

    def history_transfer(self, time, *, quantum=False):
        """Original H64 supports heat/Markov or unitary spectral evolution.

        quantum=False: exp(-time*H64) is a nonnegative stochastic matrix.
        quantum=True:  exp(-i*time*H64) is unitary. Their relation by
        analytic continuation is exact for this *finite bare history*.
        The U1-twisted 24-clock full Hamiltonian is not a Markov generator.
        """
        if not np.isfinite(time):
            raise ValueError("time must be finite")
        if not quantum and (np.iscomplexobj(time) or time<0):
            raise ValueError("Markov time must be real and nonnegative")
        eigen,base=np.linalg.eigh(self.L)
        weights=np.exp((-1j if quantum else -1.0)*time*eigen)
        return (base*weights)@base.T

    def cumulant_rates(self,direction,parity=1):
        """Exact degree 2,4,6 Taylor coefficients, evaluated on a direction.

        For a_i=(pi/e)(n.u_i), S_j=sum_i a_i^j, A=prod_i a_i,
        lambda(k n)=S2 k^2/10 + (S2^2/4000-S4/800) k^4
             +(S2^3/300000-S2*S4/40000+S6/24000+parity*A/640) k^6
             +O(k^8).
        """
        n=self._unit(direction)
        a=R*(self.axes@n)
        s2=float(np.sum(a**2));s4=float(np.sum(a**4));s6=float(np.sum(a**6));p6=float(np.prod(a))
        return {2:s2/10,4:s2*s2/4000-s4/800,
                6:s2**3/300000-s2*s4/40000+s6/24000+parity*p6/640}

    def long_wave_rate(self,direction,amplitude,parity=1,order=6):
        if order not in (2,4,6):raise ValueError("order must be 2, 4, or 6")
        coeff=self.cumulant_rates(direction,parity)
        return sum(coeff[k]*amplitude**k for k in (2,4,6) if k<=order)
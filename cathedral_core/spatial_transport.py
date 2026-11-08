"""Exact spatial propagation from the ORIGINAL 64-state Cathedral pair-flip history.

No spatial PDE is inserted. The signed icosahedral history readout drives a
velocity-jump Markov process; the spatial Fourier generator is the finite 64x64
native history generator plus a diagonal source tilt. The eigenvalue expansion
is rigorously fixed through sixth order and separates the two history parities.

This is a derived transport model for a specified history-to-position readout,
not a derivation of the physical Maxwell/Einstein/Standard Model equations.
"""
from __future__ import annotations
from dataclasses import dataclass
from math import pi, e, sqrt
from pathlib import Path
import runpy
import numpy as np
from scipy.linalg import expm, eigvals

@dataclass(frozen=True)
class TransportSpectrum:
    parity: int
    wavevector: tuple[float, float, float]
    pole: complex
    second_order: float
    fourth_order: float
    sixth_order: float
    through_sixth: float

class NativeURTSpatialTransport:
    """Propagator tied to actual 64 signed histories and six icosahedral axes."""
    def __init__(self, Hbits: np.ndarray, axes: np.ndarray, scale: float=pi/e):
        self.history = np.asarray(Hbits, float)
        self.axes = np.asarray(axes, float)
        self.scale = float(scale)
        if self.history.shape != (64,64) or self.axes.shape != (6,3):
            raise ValueError('Expected full 64x64 history and six 3D axes')
        if np.linalg.norm(self.axes.T @ self.axes - 2*np.eye(3)) > 1e-9:
            raise ValueError('Six axes must be a normalized icosahedral 2-frame')
        if abs(self.scale-pi/e)>1e-10:
            raise ValueError('This native prediction uses the frozen URT pi/e scale')
        states = np.arange(64, dtype=np.int64)
        self.signs=1-2*((states[:,None]>>np.arange(6))&1)
        self.parity=np.prod(self.signs,axis=1)
        self.position_signal=self.signs@self.axes
        if np.linalg.norm(self.history-self.history.T)>1e-10:
            raise ValueError('Original history must be reversible')
        if np.linalg.norm(self.history@self.position_signal-10*self.position_signal)>1e-9:
            raise ValueError('H64 vector mode does not match native operator')
        for parity in (-1,1):
            idx=self.sector_indices(parity)
            block=self.history[np.ix_(idx,idx)]
            val=np.linalg.eigvalsh(block)
            if len(idx)!=32 or abs(val[0])>1e-9 or abs(val[1]-10)>1e-9:
                raise ValueError('Native history parity sector is not ergodic with gap 10')
        if abs(sum((self.axes @ np.array([1.,0.,0.]))**4)-6/5)>1e-9:
            raise ValueError('Native icosahedral fourth-order identity fails')

    @classmethod
    def from_archive(cls, source_path: str | Path | None=None):
        if source_path is None:
            source_path=(Path(__file__).resolve().parents[1]/'research_archive'/
                         '2026-11-07_joint_interacting_native'/
                         'cathedral_constructed_joint_dynamics_2026_11_07.py')
        orig=runpy.run_path(str(source_path))
        points=orig['points']
        axes=np.array([points[a]/np.linalg.norm(points[a]) for a,b in orig['pairs']])
        return cls(orig['Hbits'],axes,orig['r'])

    def sector_indices(self, parity: int):
        if parity not in (-1,1):
            raise ValueError('parity must be +1 or -1')
        return np.flatnonzero(self.parity==parity)

    def tilted_generator(self, k: np.ndarray, parity: int):
        """Feynman-Kac spatial Fourier generator of the genuine 32-history class."""
        k=np.asarray(k,float)
        if k.shape!=(3,): raise ValueError('k must be a 3-vector')
        idx=self.sector_indices(parity)
        return (-self.history[np.ix_(idx,idx)]
                +1j*self.scale*np.diag(self.position_signal[idx]@k))

    def hydrodynamic_pole(self, k: np.ndarray, parity: int):
        """Eigenvalue continuing the single zero at k=0: negative decay rate."""
        eig=eigvals(self.tilted_generator(k,parity))
        return complex(eig[np.argmin(abs(eig))])

    def decay_series(self, k: np.ndarray, parity: int) -> TransportSpectrum:
        """Exact Taylor coefficients of minus the hydrodynamic pole to O(|k|^8).

        mu(k)=D|k|^2+(r^4/2000)|k|^4+
          r^6[(sum_i (u_i.n)^6-4/5)/24000+parity prod_i(u_i.n)/640]|k|^6
          +O(|k|^8), for |k| small and n=k/|k|.
        """
        k=np.asarray(k,float)
        if k.shape!=(3,): raise ValueError('k must be a 3-vector')
        if parity not in (-1,1): raise ValueError('parity must be +1 or -1')
        q=float(np.linalg.norm(k))
        a=self.axes@(k/q) if q else np.zeros(6)
        r=self.scale
        d2=r**2/5*q**2
        d4=r**4/2000*q**4
        d6=r**6*((np.sum(a**6)-4/5)/24000+parity*np.prod(a)/640)*q**6
        return TransportSpectrum(parity,tuple(map(float,k)),
                                 self.hydrodynamic_pole(k,parity),d2,d4,d6,d2+d4+d6)

    def characteristic_function(self,k:np.ndarray,time:float,parity:int):
        """Exact E[exp(i k.Y_t)] for stationary parity history, Y_t=r int X(S_u)du."""
        if time<0:raise ValueError('time must be nonnegative')
        t=expm(time*self.tilted_generator(k,parity))
        return complex(np.mean(t@np.ones(32)))

    def covariance_per_axis(self,time:float):
        """Exact finite-time variance for either parity and all three directions."""
        if time<0:raise ValueError('time must be nonnegative')
        r=self.scale
        return 2*(r*r/5)*time-(r*r/25)*(1-np.exp(-10*time))

    @property
    def long_time_diffusion(self):
        return self.scale**2/5
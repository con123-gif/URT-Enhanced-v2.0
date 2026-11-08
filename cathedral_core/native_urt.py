"""Executable full-state upgrade of the original scalar URT prototype.

Uses the preserved *native* five-Platonic / 64-history / 24-clock
construction and its original source-loaded positive action.  This is
an algorithmic interface, not a claim that the action is uniquely physical.

The original `cathedral_core.urt.urt_step` is unchanged for reproducibility.
Dependencies: numpy, scipy, mpmath (the latter two from original archive).
"""
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import runpy
import numpy as np


@dataclass
class NativeURTState:
    """One coupled state: 24 clock positions, complete 190-cochain field.

    ``y`` is the exact 24×64 history minimizer of the native coupled action;
    it is recomputed on each step rather than discarded.
    """
    z: np.ndarray
    theta: np.ndarray
    y: np.ndarray | None = None


@dataclass
class NativeURTStep:
    state: NativeURTState
    energy_before: float
    energy_after: float
    gradient_norm: float
    step_size: float
    accepted: bool


class NativeURTEngine:
    """Native original-operator URT upgrade; no alpha/beta/theta_h defaults.

    - z: complex [24, 190] all five oriented Platonic cochains
    - y: complex [24, 64] full signed-history field
    - source: 50→8→12→20 via original Q, C, P3, P5
    - clock: 24-charge-1 / charge-2 covariant transport
    - energy: original geometric + exact H64 Schur + eight-state KMS term
    - update: actual energy-decreasing gradient flow, Armijo step selection

    Loading the archive runs its self-checks once, keeping original operators
    intact.  No input observed masses, calibration or fitted constants.
    """

    @classmethod
    def from_archive(cls, source_path: str | Path | None = None) -> "NativeURTEngine":
        if source_path is None:
            source_path = (Path(__file__).resolve().parents[1]
                           / "research_archive" / "2026-11-07_joint_interacting_native"
                           / "cathedral_constructed_joint_dynamics_2026_11_07.py")
        source_path = Path(source_path)
        if not source_path.is_file():
            raise FileNotFoundError(f"Original native Cathedral model not found: {source_path}")
        return cls(runpy.run_path(str(source_path)))

    def __init__(self, native: dict):
        self.D = np.array(native["D"], dtype=float)
        # Use the ORIGINAL interacting action's geometric Hessian, not the
        # separate D² Gaussian reference used in some Wick calculations.
        # The original potential omits the edge-exact b1.T b1 block to
        # preserve its internal edge gauge redundancy.
        self.H = np.array(native["Cbridge"], dtype=float).copy()
        for block in native["geom"].values():
            o,nv,ne,nf = block["offset"],block["V"],block["E"],block["F"]
            b1,b2=block["b1"],block["b2"]
            self.H[o:o+nv,o:o+nv] += b1@b1.T
            self.H[o+nv:o+nv+ne,o+nv:o+nv+ne] += b2@b2.T
            self.H[o+nv+ne:o+nv+ne+nf,o+nv+ne:o+nv+ne+nf] += b2.T@b2
        self.H = (self.H + self.H.T) / 2
        self.Q = np.array(native["Plinear"], dtype=float)
        self.C = np.array(native["C"], dtype=float)
        self.P3 = np.array(native["P3"], dtype=float)
        self.P5 = np.array(native["P5"], dtype=float)
        self.Uh = np.array(native["Uh"], dtype=float)
        self.Hbits = np.array(native["Hbits"], dtype=float)
        self.r = float(native["r"])
        self.golden_angle = float(native["theta"])
        self.Delta = float(native["Delta"])
        self.eta = float(native["eta"])
        self.N = int(native["N"])
        self.full_dimension = 190
        self.history_dimension = 64
        self._face_vertex = self.C @ self.Q  # 20x50
        self._V = np.zeros((50, 190))  # extract 50 vertices, retaining all five
        for g in native["geom"].values():
            a, b, n = g["v_offset"], g["offset"], g["V"]
            self._V[a:a+n,b:b+n] = np.eye(n)
        assert self._V.shape == (50, 190)
        assert self._face_vertex.shape == (20, 50)
        assert self.Uh.shape == (64, 20)
        assert abs(np.trace(self.P3)-4) < 1e-8
        assert abs(np.trace(self.P5)-4) < 1e-8
        assert abs(np.trace(self.D @ self.D)-720) < 1e-7
        self._hvals, self._hvecs = np.linalg.eigh(self.Hbits)

    def new_state(self, z: np.ndarray | None = None,
                  theta: np.ndarray | None = None) -> NativeURTState:
        if z is None:
            z = np.zeros((self.N, self.full_dimension), dtype=complex)
        if theta is None:
            theta = np.full(self.N, self.golden_angle)
        z = np.asarray(z, dtype=complex)
        theta = np.asarray(theta, dtype=float)
        if z.shape != (self.N, self.full_dimension):
            raise ValueError("z must be complex 24×190 (all five cochains)")
        if theta.shape != (self.N,):
            raise ValueError("theta must have 24 link phases")
        return NativeURTState(z.copy(), theta.copy())

    def clock_laplacian(self, theta: np.ndarray, charge: int) -> np.ndarray:
        L = 2 * np.eye(self.N, dtype=complex)
        for j in range(self.N):
            k = (j+1) % self.N
            phase = np.exp(1j*charge*theta[j])
            L[k,j] -= phase
            L[j,k] -= np.conj(phase)
        return L

    def sources(self, z: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
        """Actual all-five source; no 13-state replacement."""
        v = z @ self._V.T          # [24,50]
        f = v @ self._face_vertex.T   # [24,20]
        h = f*f
        return f, h @ self.P3, h @ self.P5

    def reduced_energy_and_gradient(self, state: NativeURTState,
                                    drive: np.ndarray | None = None
                                    ) -> tuple[float, np.ndarray, np.ndarray]:
        """Exactly eliminate y and differentiate the ORIGINAL reduced action.

        Gradient convention: dS = Re vdot(gradient, dz).
        `drive` is optional external algorithmic forcing, not a new particle law.
        """
        z = state.z
        theta = state.theta
        L1 = self.clock_laplacian(theta, 1)
        L2 = self.clock_laplacian(theta, 2)
        geometric = 0.5 * np.vdot(z, z @ self.H.T).real
        cov = np.roll(z, -1, axis=0) - np.exp(1j*theta)[:,None]*z
        geometric += 0.5*self.r*self.r*np.vdot(cov,cov).real
        gradient = z @ self.H.T + self.r*self.r*(L1 @ z)

        f, h3, h5 = self.sources(z)
        A3 = 18*np.eye(self.N) + self.r*self.r*L2
        A5 = 16*np.eye(self.N) + self.r*self.r*L2
        v3 = np.linalg.solve(A3,h3)
        v5 = np.linalg.solve(A5,h5)
        yopt = (v3 + self.Delta*v5) @ self.Uh.T  # all 64 histories
        hist = (0.25*(np.vdot(h3,h3).real+self.Delta**2*np.vdot(h5,h5).real)
                -0.5*np.vdot(h3,v3).real
                -0.5*self.Delta**2*np.vdot(h5,v5).real)
        # Eight-state KMS minimiser at each original clock site.
        E3 = .25*np.sum(abs(h3)**2,axis=1)
        E5 = .25*self.Delta**2*np.sum(abs(h5)**2,axis=1)
        w3 = -self.eta*E3
        w5 = 2*np.log(self.Delta)-self.eta*E5
        mx = np.maximum(w3,w5)
        a3, a5 = np.exp(w3-mx),np.exp(w5-mx)
        den = a3+a5
        p3,p5=a3/den,a5/den
        kms = -np.sum(mx+np.log(den)-np.log1p(self.Delta**2))/self.eta
        gh3 = (.5+.5*p3[:,None])*h3-v3
        gh5 = self.Delta**2*((.5+.5*p5[:,None])*h5-v5)
        gv = 2*(np.conj(f)*(gh3+gh5)) @ self._face_vertex
        gradient += gv @ self._V
        energy = float(geometric+hist+kms)
        if drive is not None:
            drive = np.asarray(drive,dtype=complex)
            if drive.shape != z.shape:
                raise ValueError("drive must have shape 24×190")
            energy -= np.vdot(drive,z).real
            gradient -= drive
        return energy,gradient,yopt

    def update(self, state: NativeURTState,
               drive: np.ndarray | None = None,
               step_size: float | None = None) -> NativeURTStep:
        """A genuine numerical URT state update with guaranteed action descent.

        Backtracking chooses a computational step, not a physical coupling.
        Exact history minimisation and KMS adaptation are performed each time.
        """
        before,grad,y0 = self.reduced_energy_and_gradient(state,drive)
        norm2 = float(np.vdot(grad,grad).real)
        if norm2 < 1e-28:
            return NativeURTStep(NativeURTState(state.z.copy(),state.theta.copy(),y0),
                                 before,before,np.sqrt(norm2),0.0,False)
        if step_size is None:
            step_size = 1.0/(1.0+np.linalg.eigvalsh(self.H)[-1]+4*self.r*self.r)
        if step_size <= 0:
            raise ValueError("step_size must be positive")
        step = step_size
        for _ in range(40):
            candidate = NativeURTState(state.z-step*grad,state.theta)
            after,_,ynext = self.reduced_energy_and_gradient(candidate,drive)
            if np.isfinite(after) and after <= before-0.25*step*norm2:
                candidate.y=ynext
                return NativeURTStep(candidate,before,after,np.sqrt(norm2),step,True)
            step /= 2.0
        raise ArithmeticError("Line search failed; state unchanged")

    def evolve(self, state: NativeURTState, steps: int,
               drive: np.ndarray | None = None) -> tuple[NativeURTState,list[float]]:
        if steps < 0:
            raise ValueError("steps must be nonnegative")
        energies = []
        s = state
        for _ in range(steps):
            one = self.update(s,drive)
            s = one.state
            energies.append(one.energy_after)
        return s, energies

    def relax_history(self, state: NativeURTState,
                      y: np.ndarray, dt: float) -> np.ndarray:
        """Exact driven positive 64-history semigroup at fixed geometry/source.

        y(dt) = yopt + exp[-dt(Hbits+r² L24^(2))] (y(0)-yopt).
        """
        if dt < 0:
            raise ValueError("dt must be nonnegative")
        y = np.asarray(y,dtype=complex)
        if y.shape != (self.N, self.history_dimension):
            raise ValueError("y must be complex 24×64")
        _,_,yopt = self.reduced_energy_and_gradient(state)
        clk, U = np.linalg.eigh(self.clock_laplacian(state.theta,2))
        error = U.conj().T @ (y-yopt) @ self._hvecs
        error *= np.exp(-dt*(self.r*self.r*clk[:,None]+self._hvals[None,:]))
        return yopt + U @ error @ self._hvecs.T

    @staticmethod
    def gauge_transform(state: NativeURTState, phases: np.ndarray) -> NativeURTState:
        a=np.asarray(phases,dtype=float)
        if a.shape!=state.theta.shape:
            raise ValueError("one phase per clock position required")
        theta=state.theta+np.roll(a,-1)-a
        z=np.exp(1j*a)[:,None]*state.z
        y=None if state.y is None else np.exp(2j*a)[:,None]*state.y
        return NativeURTState(z,theta,y)
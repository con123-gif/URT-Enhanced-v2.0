"""Original full Cathedral interacting 190+64+24 Hamiltonian with native 3D history transport.

Adds the *derived* history velocities v_s=(pi/e)sum_i s_i u_i to the
PRE-EXISTING native nonlinear action, pointwise in three external spatial
coordinates. The transport term is the self-adjoint first-order momentum
operator A=-i sum_a diag(v_a)partial_a on the full 64 histories.

For spatially uniform fields the action and RHS are exactly v3 (per cell).
This is a defined spatial Hamiltonian completion of the native 64-history
readout, NOT an independent derivation of physical spacetime or gauge fields.
An exact periodic FFT differentiation is used for discrete spatial samples;
the strict finite-speed theorem applies to the underlying continuum PDE,
not to the band-limited periodic Fourier interpolant at finite grid size.
"""
from __future__ import annotations
from dataclasses import dataclass
from pathlib import Path
import runpy
import numpy as np
from .full_dynamics import NativeURTFullDynamics
from .native_urt import NativeURTState


@dataclass
class SpatialState:
    z:np.ndarray  # spatial_shape + (24,190)
    y:np.ndarray  # spatial_shape + (24,64)
    theta:np.ndarray  # (24,), shared across physical space


@dataclass
class SpatialStep:
    state:SpatialState
    energy_before:float
    energy_after:float
    charge_before:float
    charge_after:float
    dt:float


class NativeURTSpatialDynamics(NativeURTFullDynamics):
    """Conservative nonlinear original Cathedral + exact finite-velocity history transport."""

    @classmethod
    def from_archive(cls, source_path=None, spacing=(1.,1.,1.)):
        if source_path is None:
            source_path=(Path(__file__).resolve().parents[1]
                         / 'research_archive/2026-11-07_joint_interacting_native'
                         / 'cathedral_constructed_joint_dynamics_2026_11_07.py')
        source_path=Path(source_path)
        if not source_path.is_file():
            raise FileNotFoundError(f'Native Cathedral source missing: {source_path}')
        return cls(runpy.run_path(str(source_path)),spacing=spacing)

    def __init__(self,native:dict, spacing=(1.,1.,1.)):
        super().__init__(native)
        if len(spacing)!=3 or any((not np.isfinite(v)) or v<=0 for v in spacing):
            raise ValueError('spacing must be a positive finite 3-vector')
        self.spacing=tuple(float(s) for s in spacing)
        points=np.asarray(native['points'],float)
        pairs=native['pairs']
        assert len(pairs)==6
        # Coordinates exactly match the original integer-bit history ordering.
        self.axes=np.array([points[a]/np.linalg.norm(points[a]) for a,b in pairs])
        signs=np.array([[1-2*((s>>i)&1) for i in range(6)] for s in range(64)])
        self.velocities=self.r*(signs@self.axes)
        Hcheck=15*np.eye(64)
        for s in range(64):
            for i in range(6):
                for j in range(i+1,6):
                    Hcheck[s,s^(1<<i)^(1<<j)]-=1
        if not np.allclose(Hcheck,self.Hbits,atol=1e-12):
            raise AssertionError('Original history ordering does not match pair-flip generator')
        if np.linalg.norm(self.axes.T@self.axes-2*np.eye(3))>1e-12:
            raise AssertionError('Native icosahedral axes lose isotropic second moment')
        self.max_speed=float(np.max(np.linalg.norm(self.velocities,axis=1)))
        self.expected_speed=self.r*np.sqrt(6+2*np.sqrt(5))
        if abs(self.max_speed-self.expected_speed)>1e-12:
            raise AssertionError('Native 64-history speed inconsistent with six-axis theorem')

    def new_spatial_state(self, spatial_shape=(1,1,1), z=None, y=None, theta=None):
        if len(spatial_shape)!=3 or any(int(n)!=n or n<1 for n in spatial_shape):
            raise ValueError('spatial_shape must contain three positive integers')
        shape=tuple(int(n) for n in spatial_shape)
        if z is None:z=np.zeros(shape+(self.N,190),complex)
        if y is None:y=np.zeros(shape+(self.N,64),complex)
        if theta is None:theta=np.full(self.N,self.golden_angle)
        z=np.asarray(z,complex);y=np.asarray(y,complex);theta=np.asarray(theta,float)
        if z.shape!=shape+(self.N,190) or y.shape!=shape+(self.N,64) or theta.shape!=(self.N,):
            raise ValueError('Wrong native spatial state shapes: z=space+(24,190), y=space+(24,64), theta=(24,)')
        return SpatialState(z.copy(),y.copy(),theta.copy())

    def _k_dot_v(self,shape):
        k=[2*np.pi*np.fft.fftfreq(n,d=dx) for n,dx in zip(shape,self.spacing)]
        return (k[0][:,None,None,None]*self.velocities[:,0]
              + k[1][None,:,None,None]*self.velocities[:,1]
              + k[2][None,None,:,None]*self.velocities[:,2]) # shape (nx,ny,nz,64)

    def native_history_spatial_operator(self,y):
        """Apply self-adjoint -i v_s.grad to full 24x64 complex history fields."""
        y=np.asarray(y,complex)
        if y.ndim!=5 or y.shape[-2:]!=(self.N,64):
            raise ValueError('history should have spatial shape (nx,ny,nz,24,64)')
        symbol=self._k_dot_v(y.shape[:3])[...,None,:]
        return np.fft.ifftn(symbol*np.fft.fftn(y,axes=(0,1,2)),axes=(0,1,2))

    def exact_history_advection(self,y,dt):
        """Exact unitary free history translation on a periodic FFT spatial grid."""
        if not np.isfinite(dt):raise ValueError('finite dt required')
        y=np.asarray(y,complex)
        if y.ndim!=5 or y.shape[-2:]!=(self.N,64):
            raise ValueError('history should have spatial shape (nx,ny,nz,24,64)')
        symbol=self._k_dot_v(y.shape[:3])[...,None,:]
        return np.fft.ifftn(np.exp(-1j*dt*symbol)*np.fft.fftn(y,axes=(0,1,2)),axes=(0,1,2))

    def energy_gradient(self,state:SpatialState):
        z,y,theta=state.z,state.y,state.theta
        if z.ndim!=5 or y.shape!=z.shape[:3]+(self.N,64) or z.shape[-2:]!=(self.N,190) or theta.shape!=(self.N,):
            raise ValueError('Invalid spatial geometry/history/clock dimensions')
        gz=np.empty_like(z);gy=np.empty_like(y)
        e=0.0
        for xyz in np.ndindex(z.shape[:3]):
            local=NativeURTState(z[xyz],theta,y[xyz])
            val,zgrad,ygrad=self.full_energy_and_gradient(local)
            e+=val;gz[xyz]=zgrad;gy[xyz]=ygrad
        adv=self.native_history_spatial_operator(y)
        e+=0.5*np.vdot(y,adv).real
        gy+=adv
        return float(e),gz,gy

    @staticmethod
    def charge_density(state:SpatialState):
        """Pointwise original charge-one plus twice charge-two density."""
        return (np.sum(np.abs(state.z)**2,axis=(-2,-1))
                +2*np.sum(np.abs(state.y)**2,axis=(-2,-1)))

    def charge_current(self,state:SpatialState):
        """Physical-space continuity current from the SAME 64 native velocities.

        In the continuum PDE: partial_t rho + div J = 0 exactly. For an FFT
        collocation grid, local Leibniz identities need adequate de-aliasing,
        although global charge stays exactly conserved in the semi-discrete ODE.
        """
        return 2*np.einsum('...js,sa->...a',np.abs(state.y)**2,self.velocities)

    @staticmethod
    def charge(state:SpatialState):
        return float(np.vdot(state.z,state.z).real+2*np.vdot(state.y,state.y).real)

    def rhs(self,state:SpatialState):
        _,gz,gy=self.energy_gradient(state)
        return -1j*gz,-1j*gy

    def step(self,state:SpatialState,dt:float):
        """RK4 on the Fourier semi-discrete Hamiltonian; not exactly symplectic."""
        if not np.isfinite(dt) or dt<=0:raise ValueError('dt must be finite and positive')
        e0,_,_=self.energy_gradient(state);q0=self.charge(state)
        z,y,theta=state.z,state.y,state.theta
        def rhs(a,b):return self.rhs(SpatialState(a,b,theta))
        a1,b1=rhs(z,y)
        a2,b2=rhs(z+dt*a1/2,y+dt*b1/2)
        a3,b3=rhs(z+dt*a2/2,y+dt*b2/2)
        a4,b4=rhs(z+dt*a3,y+dt*b3)
        nxt=SpatialState(z+dt*(a1+2*a2+2*a3+a4)/6,
                         y+dt*(b1+2*b2+2*b3+b4)/6,theta.copy())
        en,_,_=self.energy_gradient(nxt)
        return SpatialStep(nxt,e0,en,q0,self.charge(nxt),float(dt))

    def background_clock_gauge_transform(self,state,alpha):
        """Clock-local U(1) gauge action constant across physical x.

        Arbitrary spatially dependent gauge transforms require spatial
        connections, which are not introduced into this first integration.
        """
        a=np.asarray(alpha,float)
        if a.shape!=(self.N,):raise ValueError('one phase per clock site')
        zz=state.z*np.exp(1j*a)[None,None,None,:,None]
        yy=state.y*np.exp(2j*a)[None,None,None,:,None]
        theta=state.theta+np.roll(a,-1)-a
        return SpatialState(zz,yy,theta)
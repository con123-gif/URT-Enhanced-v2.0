"""Full original 190×64×24 model with 3D native H64 velocities (no surrogate).
Run: PYTHONPATH=. OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -m pytest -q tests/test_spatial_dynamics.py
"""
from pathlib import Path
import runpy
import numpy as np
from cathedral_core.spatial_dynamics import NativeURTSpatialDynamics,SpatialState
from cathedral_core.native_urt import NativeURTState
from cathedral_core.history_propagation import NativeHistoryPropagation

ORIG=Path(__file__).resolve().parents[1]/'research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py'

# Reuse one heavy original model construction across all checks.
ENGINE=None
def engine():
    global ENGINE
    if ENGINE is None: ENGINE=NativeURTSpatialDynamics.from_archive(ORIG)
    return ENGINE


def test_original_complete_uniform_limit():
    e=engine();rng=np.random.default_rng(371)
    z=(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*.023
    y=(rng.normal(size=(24,64))+1j*rng.normal(size=(24,64)))*.007
    theta=np.full(24,e.golden_angle)
    baseline, gz,gy=e.full_energy_and_gradient(NativeURTState(z,theta,y))
    original=runpy.run_path(str(ORIG))
    assert abs(baseline-original['full_action'](z,y,theta))<1e-9
    st=e.new_spatial_state((3,1,1),z=np.broadcast_to(z,(3,1,1,24,190)),y=np.broadcast_to(y,(3,1,1,24,64)))
    val,dz,dy=e.energy_gradient(st)
    assert abs(val-3*baseline)<1e-8
    assert np.linalg.norm(dz-np.broadcast_to(gz,dz.shape))<1e-10
    assert np.linalg.norm(dy-np.broadcast_to(gy,dy.shape))<1e-10
    print('PASS native uniform 3D limit exactly 3× original 190×64×24 action')


def test_history_generator_six_axes_and_two_parity_components():
    e=engine();base=NativeHistoryPropagation()
    np.testing.assert_allclose(np.sort(np.linalg.eigvalsh(e.Hbits)),np.sort(np.linalg.eigvalsh(base.L)),atol=1e-12)
    np.testing.assert_allclose(e.axes.T@e.axes,2*np.eye(3),atol=1e-12)
    expected=e.r*np.sqrt(6+2*np.sqrt(5))
    assert abs(e.max_speed-expected)<1e-12
    parity=np.array([(-1)**s.bit_count() for s in range(64)])
    assert np.linalg.norm(e.Hbits@parity)<1e-11
    assert np.linalg.norm(e.Hbits@np.ones(64))<1e-11
    assert np.max(abs(np.linalg.norm(e.velocities,axis=1)))<=expected+1e-12
    print('PASS original 64 states / parity / 3D native axes / strict continuum speed',expected)


def test_exact_3d_advection_unitary_and_spatial_fourier_dispersion():
    e=engine();n=(7,3,2);s=e.new_spatial_state(n)
    rng=np.random.default_rng(103)
    y=rng.normal(size=s.y.shape)+1j*rng.normal(size=s.y.shape)
    adv=e.native_history_spatial_operator(y)
    h=np.vdot(y,adv)
    assert abs(h.imag)<1e-9, h
    dt=.19;ya=e.exact_history_advection(y,dt)
    assert abs(np.vdot(ya,ya).real-np.vdot(y,y).real)<1e-9
    assert np.linalg.norm(e.exact_history_advection(ya,-dt)-y)<2e-12
    # Full, non-axis-aligned 3D Fourier plane wave; q=(1,-1,0).
    xx=np.arange(7)[:,None,None];yy=np.arange(3)[None,:,None]; zz=np.arange(2)[None,None,:]
    k=np.array([2*np.pi/7,-2*np.pi/3,0])
    wave=np.exp(1j*(xx*k[0]+yy*k[1]+zz*k[2]))
    sel=19;mask=np.zeros(n+(24,64),complex);mask[...,2,sel]=wave
    out=e.exact_history_advection(mask,dt)
    target=mask*np.exp(-1j*dt*(e.velocities[sel]@k))
    assert np.linalg.norm(out-target)<2e-13
    # Exact spectral relationship: tilted H64 Markov and Hamiltonian branches.
    q=np.array([.027,-.013,.019]);d=np.diag(e.velocities@q)
    lam=np.linalg.eigvalsh(e.Hbits+d)
    tilted=np.linalg.eigvalsh(-e.Hbits-d)
    assert abs(lam.min()+tilted.max())<2e-13
    # The long-wave branch is forced by the native Green–Kubo coefficient.
    alpha=.01
    small=np.linalg.eigvalsh(e.Hbits+alpha*np.diag(e.velocities[:,0])).min()
    D=e.r**2/5
    assert abs(small+D*alpha**2)<5e-8
    print('PASS exact unitary 3D advection, native finite cone, Markov/quantum dispersion relation, D',D)


def test_full_nonlocal_gradient_gauge_energy_charge():
    e=engine();rng=np.random.default_rng(1234)
    nx=(4,1,1)
    z=(rng.normal(size=nx+(24,190))+1j*rng.normal(size=nx+(24,190)))*.023
    y=(rng.normal(size=nx+(24,64))+1j*rng.normal(size=nx+(24,64)))*.008
    st=e.new_spatial_state(nx,z,y)
    val,gz,gy=e.energy_gradient(st)
    dz=rng.normal(size=z.shape)+1j*rng.normal(size=z.shape)
    dy=rng.normal(size=y.shape)+1j*rng.normal(size=y.shape)
    nn=np.sqrt(np.vdot(dz,dz).real+np.vdot(dy,dy).real)
    dz/=nn;dy/=nn
    eps=2e-5
    fp=e.energy_gradient(SpatialState(z+eps*dz,y+eps*dy,st.theta))[0]
    fm=e.energy_gradient(SpatialState(z-eps*dz,y-eps*dy,st.theta))[0]
    fd=(fp-fm)/(2*eps)
    analytic=(np.vdot(gz,dz)+np.vdot(gy,dy)).real
    assert abs(fd-analytic)<1e-6,(fd,analytic)
    rhsz,rhsy=e.rhs(st)
    denergy=(np.vdot(gz,rhsz)+np.vdot(gy,rhsy)).real
    dcharge=2*(np.vdot(z,rhsz).real+2*np.vdot(y,rhsy).real)
    assert abs(denergy)<1e-10
    assert abs(dcharge)<1e-10
    a=rng.uniform(-1,1,24)
    gauged=e.background_clock_gauge_transform(st,a)
    eg,ggz,ggy=e.energy_gradient(gauged)
    assert abs(eg-val)<1e-8
    assert np.linalg.norm(ggz-gz*np.exp(1j*a)[None,None,None,:,None])<1e-8
    assert np.linalg.norm(ggy-gy*np.exp(2j*a)[None,None,None,:,None])<1e-8
    print('PASS full spatial nonlinear gradient, clock gauge, exact ODE conservation derivatives',denergy,dcharge)


def test_history_motion_reaches_geometry_through_actual_nonlinear_source():
    e=engine();rng=np.random.default_rng(27)
    xsz=(7,1,1)
    base=(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*.07
    z=np.broadcast_to(base,xsz+(24,190)).copy()
    allzero=np.zeros(xsz+(24,64),complex)
    baseline=e.new_spatial_state(xsz,z,allzero)
    nonzero_y=np.zeros_like(allzero)
    # All 64 histories occupied on one site; source image of original full geometry.
    h3=e.sources(base)[1];h5=e.sources(base)[2]
    injection=(h3+e.Delta*h5)@e.Uh.T
    assert np.linalg.norm(injection)>0
    nonzero_y[2]=2.3*injection
    transported=e.exact_history_advection(nonzero_y,.2)
    assert np.linalg.norm(transported[3])>1e-8
    st=SpatialState(z,transported,baseline.theta)
    _,g0,_=e.energy_gradient(baseline)
    _,g1,_=e.energy_gradient(st)
    assert np.linalg.norm(g1[3]-g0[3])>1e-9
    assert np.linalg.norm(g1[2]-g0[2])>1e-9
    print('PASS native history transport induces nonlinear all-five geometric response at another spatial site',np.linalg.norm(g1[3]-g0[3]))


def test_rk4_three_space_full_interacting_motion():
    e=engine();rng=np.random.default_rng(10309)
    n=(3,1,1)
    z=(rng.normal(size=n+(24,190))+1j*rng.normal(size=n+(24,190)))*.022
    y=(rng.normal(size=n+(24,64))+1j*rng.normal(size=n+(24,64)))*.006
    s=e.new_spatial_state(n,z,y)
    energies=[e.energy_gradient(s)[0]];charges=[e.charge(s)]
    for i in range(3):
        step=e.step(s,0.0005)
        s=step.state;energies.append(step.energy_after);charges.append(step.charge_after)
    assert abs(energies[-1]-energies[0])<1e-7
    assert abs(charges[-1]-charges[0])<1e-8
    assert np.linalg.norm(s.z-z)>1e-7
    assert np.linalg.norm(s.y-y)>1e-7
    print('PASS spatial 190+64×24 interacting RK4 with energy/charge drift',energies[-1]-energies[0],charges[-1]-charges[0])


def test_local_charge_continuity_on_resolved_spatial_modes():
    e=engine(); rng=np.random.default_rng(910)
    n=(11,1,1)
    z0=(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*.022
    z=np.broadcast_to(z0,n+(24,190)).copy()
    y=np.zeros(n+(24,64),complex)
    k=2*np.pi/11
    x=np.arange(11)
    y[:,0,0,4,19]=.008+.004*np.exp(1j*k*x)
    st=e.new_spatial_state(n,z,y)
    rhsz,rhsy=e.rhs(st)
    qdot=(2*np.real(np.sum(np.conj(z)*rhsz,axis=(-2,-1)))
           +4*np.real(np.sum(np.conj(y)*rhsy,axis=(-2,-1))))
    current=e.charge_current(st)
    div=np.fft.ifft(1j*(k*np.fft.fftfreq(11)*11)[:,None,None]
                     *np.fft.fft(current[...,0],axis=0),axis=0).real
    residual=np.max(abs(qdot+div))
    assert residual<1e-11,residual
    assert abs(np.sum(qdot))<1e-12
    print('PASS exact local charge continuity for spatially resolved modes; max residual',residual)
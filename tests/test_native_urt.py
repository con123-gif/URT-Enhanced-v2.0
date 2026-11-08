"""End-to-end regression for the actual 190 / 64 / 24 upgraded URT."""
import numpy as np
from pathlib import Path
from cathedral_core.native_urt import NativeURTEngine

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'research_archive'/'2026-11-07_joint_interacting_native'/'cathedral_constructed_joint_dynamics_2026_11_07.py'

def test_native_state_gradient_descent_and_gauge():
    engine=NativeURTEngine.from_archive(SOURCE)
    rng=np.random.default_rng(20261108)
    z=(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*.035
    state=engine.new_state(z)
    f,h3,h5=engine.sources(z)
    assert h3.shape==(24,20) and h5.shape==(24,20)
    assert np.linalg.norm(h3)>0 and np.linalg.norm(h5)>0
    before,g,y=engine.reduced_energy_and_gradient(state)
    assert y.shape==(24,64)
    # Original source archived action: independent check, same matrices and model.
    import runpy
    native=runpy.run_path(str(SOURCE))
    archived= native['reduced_action'](state.z,state.theta)[0]
    assert abs(before-archived)<1e-8,(before,archived)
    probe=(rng.normal(size=z.shape)+1j*rng.normal(size=z.shape))
    probe/=np.linalg.norm(probe)
    eps=1e-5
    pert=engine.new_state(z+eps*probe)
    pertm=engine.new_state(z-eps*probe)
    fd=(engine.reduced_energy_and_gradient(pert)[0]-engine.reduced_energy_and_gradient(pertm)[0])/(2*eps)
    analytic=np.vdot(g,probe).real
    assert abs(fd-analytic)<1e-6,(fd,analytic)
    alpha=rng.uniform(-2,2,24)
    gs=engine.gauge_transform(state,alpha)
    gauged,gg,yg=engine.reduced_energy_and_gradient(gs)
    assert abs(gauged-before)<1e-8,(gauged,before)
    assert np.linalg.norm(gg-np.exp(1j*alpha)[:,None]*g)<1e-7
    assert np.linalg.norm(yg-np.exp(2j*alpha)[:,None]*y)<1e-7
    one=engine.update(state)
    assert one.accepted
    assert one.energy_after<one.energy_before
    s,energies=engine.evolve(state,5)
    assert all(b<a for a,b in zip([before]+energies,energies))
    assert s.y.shape==(24,64)
    # Positive full-history semigroup, beyond instantaneous Schur elimination.
    yinitial=y+(.001*(rng.normal(size=y.shape)+1j*rng.normal(size=y.shape)))
    yhalf=engine.relax_history(state,yinitial,dt=.25)
    yfull=engine.relax_history(state,yhalf,dt=.25)
    ysingle=engine.relax_history(state,yinitial,dt=.5)
    assert np.linalg.norm(yfull-ysingle)<1e-9
    assert np.linalg.norm(yhalf-y)<np.linalg.norm(yinitial-y)
    print('PASS native full-state v2: source, original model, analytic gradient, gauge, descent, H64 semigroup')
    print('source energy',before,'after',one.energy_after,'5 steps',energies[-1])

if __name__=='__main__':
    test_native_state_gradient_descent_and_gauge()
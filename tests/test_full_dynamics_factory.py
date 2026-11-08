from pathlib import Path
import numpy as np
from cathedral_core.urt import native_urt_full_dynamics


def test_factory_and_quadratic_hessian():
    root=Path(__file__).resolve().parents[1]
    path=root/'research_archive'/'2026-11-07_joint_interacting_native'/'cathedral_constructed_joint_dynamics_2026_11_07.py'
    eng=native_urt_full_dynamics(path)
    modes=eng.linearized_spectrum()
    assert len(modes['geometry'])==190*24
    assert len(modes['history'])==64*24
    assert modes['total_modes']==6096
    rng=np.random.default_rng(20261108)
    state=eng.new_state((rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*1e-6)
    state.y=(rng.normal(size=(24,64))+1j*rng.normal(size=(24,64)))*1e-6
    e,gz,gy=eng.full_energy_and_gradient(state)
    theta=state.theta
    linearz=state.z@eng.H.T+eng.r**2*(eng.clock_laplacian(theta,1)@state.z)
    lineary=state.y@eng.Hbits.T+eng.r**2*(eng.clock_laplacian(theta,2)@state.y)
    assert np.linalg.norm(gz-linearz)<1e-8
    assert np.linalg.norm(gy-lineary)<1e-8
    assert modes['minimum_geom']>0
    assert modes['minimum_history']>0
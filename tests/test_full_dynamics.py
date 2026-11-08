"""Check the native 190 geometry + independent full 64 histories on 24 clock steps."""
import numpy as np
from pathlib import Path
import runpy
from cathedral_core.full_dynamics import NativeURTFullDynamics

ROOT=Path(__file__).resolve().parents[1]
ORIGINAL=ROOT/'research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py'

def main():
    engine=NativeURTFullDynamics.from_archive(ORIGINAL)
    rng=np.random.default_rng(26081108)
    theta=np.full(24,engine.golden_angle)
    z=(rng.normal(size=(24,190))+1j*rng.normal(size=(24,190)))*.035
    y=(rng.normal(size=(24,64))+1j*rng.normal(size=(24,64)))*.006
    state=engine.new_state(z,theta);state.y=y
    E,gz,gy=engine.full_energy_and_gradient(state)
    orig=runpy.run_path(str(ORIGINAL))
    e_orig=orig['full_action'](z,y,theta)
    assert abs(E-e_orig)<1e-8,(E,e_orig)
    dz=rng.normal(size=z.shape)+1j*rng.normal(size=z.shape)
    dy=rng.normal(size=y.shape)+1j*rng.normal(size=y.shape)
    norm=np.sqrt(np.vdot(dz,dz).real+np.vdot(dy,dy).real)
    dz/=norm;dy/=norm
    eps=1e-5
    fp=engine.full_energy_and_gradient(type(state)(z+eps*dz,theta,y+eps*dy))[0]
    fm=engine.full_energy_and_gradient(type(state)(z-eps*dz,theta,y-eps*dy))[0]
    fd=(fp-fm)/(2*eps)
    calc=(np.vdot(gz,dz)+np.vdot(gy,dy)).real
    assert abs(fd-calc)<1e-6,(fd,calc)
    alpha=rng.uniform(-2,2,24)
    gauged=engine.gauge_transform(state,alpha)
    energy2,ggz,ggy=engine.full_energy_and_gradient(gauged)
    assert abs(E-energy2)<1e-8
    assert np.linalg.norm(ggz-np.exp(1j*alpha)[:,None]*gz)<1e-7
    assert np.linalg.norm(ggy-np.exp(2j*alpha)[:,None]*gy)<1e-7
    rhsz,rhsy=engine.hamiltonian_rhs(state)
    assert abs((np.vdot(gz,rhsz)+np.vdot(gy,rhsy)).real)<1e-12
    noether_rate=2*(np.vdot(z,rhsz).real+2*np.vdot(y,rhsy).real)
    assert abs(noether_rate)<1e-9,noether_rate
    modes=engine.linearized_spectrum()
    assert modes['total_modes']==24*(190+64)
    assert modes['clock_minimum_mode']==9
    assert modes['history_minimum_mode']==18
    assert modes['minimum_geom']>0 and modes['minimum_history']>0
    print('modes',modes['total_modes'])
    print('full linearized geometry gap',modes['minimum_geom'])
    print('full linearized history gap',modes['minimum_history'])
    print('Hbits distinct eigenvalues/multiplicities',modes['history_native_spectrum'])
    print('original full-action diff',E-e_orig,'finite difference',fd,'analytical',calc)
    print('exact continuous-time Noether derivative',noether_rate)
    _,_,yopt=engine.reduced_energy_and_gradient(engine.new_state(z,theta))
    emin=engine.full_energy_and_gradient(type(state)(z,theta,yopt))[0]
    ereduced=engine.reduced_energy_and_gradient(engine.new_state(z,theta))[0]
    assert abs(emin-ereduced)<1e-8,(emin,ereduced)
    yz_before=float(np.vdot(y,y).real)
    yy_derivative=2*np.vdot(y,rhsy).real
    assert abs(yy_derivative)>1e-6,yy_derivative
    print('history norm squared time derivative (energy exchange witness)',yy_derivative)
    s=state
    energies=[E];charges=[engine.noether_charge(s)]
    for j in range(6):
        res=engine.canonical_step(s,dt=.001)
        s=res.state
        energies.append(res.energy_after)
        charges.append(res.charge_after)
    print('Hamiltonian flow 6×dt=0.001 initial/final E',energies[0],energies[-1], 'drift',energies[-1]-energies[0]);
    print('Noether charge initial/final',charges[0],charges[-1],'drift',charges[-1]-charges[0])
    print('history norm squared initial/final',yz_before,float(np.vdot(s.y,s.y).real),'change',float(np.vdot(s.y,s.y).real)-yz_before)
    assert abs(energies[-1]-E)<1e-7
    assert abs(charges[-1]-charges[0])<1e-7
    assert np.linalg.norm(s.z-z)>1e-7
    assert np.linalg.norm(s.y-y)>1e-7
    print('PASS: full 190+64 at 24, original action, exact gradients, gauge, symplectic conservation, RK4, fluctuation spectrum')

if __name__=='__main__':main()
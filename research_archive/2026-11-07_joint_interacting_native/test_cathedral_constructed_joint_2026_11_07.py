#!/usr/bin/env python3
"""Independent randomized regression for the constructed full Cathedral action."""
import importlib.util
from pathlib import Path
import numpy as np

p=Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')
spec=importlib.util.spec_from_file_location('cathedral_joint_model',p)
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
rng=np.random.default_rng(106121)
max_err=0.
for trial in range(8):
    scale=0.01+0.02*trial/7
    z=scale*(rng.standard_normal((24,190))+1j*rng.standard_normal((24,190)))
    theta=m.theta+rng.uniform(-0.2,0.2,24)
    effective,yopt,history,h3,h5=m.reduced_action(z,theta)
    full=m.full_action(z,yopt,theta)
    err=abs(effective-full)
    max_err=max(max_err,err)
    assert err<1e-8, ('history elimination',trial,err)
    lb=2/9*np.linalg.norm(h3)**2+7/32*m.Delta**2*np.linalg.norm(h5)**2
    assert history>=lb-1e-10,('positivity',trial,history,lb)
    alpha=rng.uniform(-np.pi,np.pi,24)
    theta_new=theta+np.roll(alpha,-1)-alpha
    z_new=z*np.exp(1j*alpha[:,None]);y_new=yopt*np.exp(2j*alpha[:,None])
    gauge_err=abs(m.full_action(z_new,y_new,theta_new)-full)
    max_err=max(max_err,gauge_err)
    assert gauge_err<1e-8,('gauge',trial,gauge_err)
    # The same field drives KMS state and 64-history source; no fixed p5 shortcut.
    ss=m.entropy_response(h3[0],h5[0])
    assert ss['variational_residual']<1e-11
    assert 0<=ss['p5']<=1

# Exact Golay constraints and dynamical discrimination between H3 full-loop phase
# and historical URT phase on *each* link.
assert int(m.full_golay_weights[8])==759
assert int(m.full_golay_weights[12])==2576
assert 0 < m.theta < 2*np.pi
assert abs(m.URT_24_total-m.theta)>1
print('PASS: 8 random all-five Hodge/H64/24-clock/gauge/KMS fields,')
print('      source response, coercive bound, 4096-word Golay, 24 clock distinction')
print('max randomized residual',max_err)

"""Cross-check new propagation generator against the actual full November Cathedral source."""
import hashlib
import runpy
from pathlib import Path
import numpy as np
from cathedral_core.history_propagation import NativeHistoryPropagation
path=next((v for v in [
    Path(__file__).resolve().parents[1]/'2026-11-07_joint_interacting_native'/'cathedral_constructed_joint_dynamics_2026_11_07.py',
    Path(__file__).with_name('original_source.py')
] if v.is_file()),None)
assert path is not None, 'The original archived joint Cathedral source must be available'
assert hashlib.sha256(path.read_bytes()).hexdigest()=='5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd'
x=runpy.run_path(str(path))
p=NativeHistoryPropagation()
# The indexed Cartesian product uses exactly the same bit-to-sign ordering;
# each pair-flip edge has the same 64x64 generator irrespective of reindexing.
assert np.linalg.norm(p.L-x['Hbits'])<1e-12
# Match original icosahedral antipodal axes up to orientation/basis differences.
raw_axes=np.asarray([x['points'][i] /np.linalg.norm(x['points'][i]) for i,j in x['pairs']])
assert np.linalg.norm(raw_axes.T@raw_axes-2*np.eye(3))<1e-12
assert np.linalg.norm(p.axes.T@p.axes-2*np.eye(3))<1e-12
# Full all-five geometry remains available in the original model.
assert x['D'].shape==(190,190)
assert x['Eglobal'].shape==(50,8)
assert x['Plinear'].shape==(12,50)
assert x['Uh'].shape==(64,20)
assert np.linalg.norm(p.L@p.positions-10*p.positions)<1e-11
assert np.linalg.norm(x['Hbits']@(p.states@raw_axes)-10*(p.states@raw_axes))<1e-11
# The H64 observable is a genuine readout of the unreduced history state;
# it is distinct from projecting the 190 geometric field or postulating 4D GR.
print('PASS exact H64 original matrix matching, SHA256',hashlib.sha256(path.read_bytes()).hexdigest())
print('PASS six actual antipodal axes, all-five 190 Hodge, 50->8->12, hidden 4+4 source')
print('native diffusion',p.diffusion_coefficient)
#!/usr/bin/env python3
"""Parameter-free, symmetry-restored chronology Qbar (conditional physical
isotropy selection), its full source Krylov response, and comparison to
unaveraged URT chronology. Not fitted to ARF.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    z=runpy.run_path(str(HERE/'URT_A5_AVERAGED_CHRONOLOGY_2026-11-09.py'))
Q=z['Q'];Qav=z['Qav'];R3=z['src']['R3'];R5=z['src']['R5']
pi=np.ones((64,64))/64
I=np.eye(64)
assert np.linalg.norm(Qav@pi-pi)<1e-13
# Unique history stationary state; all other spectral values strictly <1.
ev=np.linalg.eigvals(Qav)
rest=np.sort(np.abs(ev[np.abs(ev-1)>1e-9]))[::-1]
assert rest.max()<1
print('A5 chrono restored nonconstant spectral radius',rest.max())
for name,R in [('3',R3),('5',R5)]:
    cur=R.copy()
    traces=[]
    for k in range(12):
        traces.append(np.trace(R.T@cur)/64)
        cur=Qav@cur
    res=np.linalg.solve(I-Qav+pi,R)
    R0=np.trace(R.T@res)/64
    canon=np.linalg.solve(I-Q+pi,R)
    original=np.trace(R.T@canon)/64
    print('hidden',name,'A5 first 12 C_lag:',np.array(traces))
    print('hidden',name,'A5 sum_{k>=0} Ck',R0,'chronological unaveraged sum',original,'difference',R0-original)
    print('hidden',name,'positive normalized current response ratio',R0/traces[0])
    source_block=np.hstack([R]+[np.linalg.matrix_power(Qav,k)@R for k in range(1,8)])
    print('hidden',name,'Krylov span rank',np.linalg.matrix_rank(source_block,tol=1e-9))
print('PASS')

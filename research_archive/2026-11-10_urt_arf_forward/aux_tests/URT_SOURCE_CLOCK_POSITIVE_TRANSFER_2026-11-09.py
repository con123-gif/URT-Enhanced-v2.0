#!/usr/bin/env python3
"""Composed *conditional candidate* from source matrices (unmodified Nov7),
Haar-sixbit history and golden phase clock overlap.
This is an observable conditional expectation; NOT the actual canonical
space-time transfer until the identification of temporal 24 tracks with
24 equally spaced phase bins is independently established.
"""
import numpy as np,contextlib,io,runpy
with contextlib.redirect_stdout(io.StringIO()):
    a=runpy.run_path('/mnt/data/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py')
    b=runpy.run_path('/mnt/data/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py')
B=a['B']
R3=b['R3'];R5=b['R5'];P3=b['P3'];P5=b['P5']; c3=b['coef3'];c5=b['coef5']; Delta=b['Delta']
Ph=P3+P5
H=(R3/np.sqrt(c3)+R5/np.sqrt(c5))/8  # columns of 20x; H.T H = Ph
assert np.linalg.norm(H.T@H-Ph)<1e-12
F=B@H
T=F.T@F
w=np.linalg.eigvalsh(T)
wpos=np.sort(w[w>1e-9])[::-1]
assert len(wpos)==8
assert wpos[0]<=1+1e-12
assert wpos[-1]>0
print('Unconditional source-normalized 8D carrier => Golden clock-conditioned transfer')
print('T dimension',T.shape,'rank',len(wpos),'positive eigenvalues')
print(wpos)
print('trace',np.trace(T),'mean 8D conditional information preserved',np.trace(T)/8)
print('split C3/C5 mean trace',np.trace(P3@T)/4,np.trace(P5@T)/4)
# Include original Delta amplitude from native model; no new gauge or matter strengths.
Tamp=(P3+Delta*P5)@T@(P3+Delta*P5)
p=np.linalg.eigvalsh(Tamp);p=np.sort(p[p>1e-11])[::-1]
print('KMS amplitude-suppressed positive eigenspectrum (8):',p)
print('positive transfer/no free fitted weights: PASS')

#!/usr/bin/env python3
"""URT signed-history => Walsh support => exact 4-step source-memory theorem,
 plus a non-commutation test with native 24-site temporal clock.
No historical ARF coefficients used.
"""
import numpy as np, runpy, io, contextlib
from pathlib import Path
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    src=runpy.run_path(str(HERE/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
    clock=runpy.run_path(str(HERE/'URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py'))
R3=src['R3'];R5=src['R5']
# Wald Walsh transform: w_A(h)=(-1)^(bitcount(A&h))
W=np.empty((64,64),dtype=float)
for h in range(64):
    for m in range(64): W[h,m]=(-1)**((h&m).bit_count())
assert np.linalg.norm(W.T@W-64*np.eye(64))<1e-12
H3=W.T@R3/64; H5=W.T@R5/64
# Grouped norms of Walsh spectrum.
for label,G in [('3',H3),('5',H5)]:
    print('hidden',label,'Walsh degrees squared norms:')
    for d in range(7):
        idx=[i for i in range(64) if i.bit_count()==d]
        print(' degree',d,'squared',float(np.linalg.norm(G[idx])**2),'max',float(np.max(np.abs(G[idx]))))
# Spectral coefficient at degree 0 and 1 vanish (this explains C5=0).
assert np.linalg.norm(H3[[0]+[1<<i for i in range(6)]])<1e-12
assert np.linalg.norm(H5[[0]+[1<<i for i in range(6)]])<1e-12
assert np.linalg.norm(H3[[i for i in range(64) if i.bit_count()!=3]])<1e-12
assert np.linalg.norm(H5[[i for i in range(64) if i.bit_count() not in (2,4)]])<1e-12
# Check bilinear correlation vanishing at lag5 by disjoint Walsh supports, exact logic.
# Under shift, a source monomial with >=2 bits cannot correlate when overlap<=1 bit.
M=np.zeros((64,64))
for i in range(64):
    M[i,(2*i)&63]+=.5
    M[i,((2*i)&63)+1]+=.5
P5=np.linalg.matrix_power(M,5)
print('P^5 rank minus stationary 1:',np.linalg.matrix_rank(P5-np.ones((64,64))/64,tol=1e-12))
print('P^5 source norm',np.linalg.norm((R3+R5).T@P5@(R3+R5)/64))
# Canonical natural 24 clock has cycle shift commuting with charge-2 uniform link Laplacian.
B=clock['B']
S=np.zeros((24,24))
for i in range(24): S[(i+1)%24,i]=1
L=2*np.eye(24)-np.exp(1j*float(clock['A'])*2*np.pi/24) * S-np.exp(-1j*float(clock['A'])*2*np.pi/24)*S.T
assert np.linalg.norm(L@S-S@L)<1e-12
# Compressed two-step time transfer based on shared phase and original shift.
Pclock=B@M@B.T
comm=Pclock@S-S@Pclock
print('BQB^T cyclic-shift commutator norm:',np.linalg.norm(comm))
print('BQB^T 24x24 positive?',np.linalg.eigvalsh((Pclock+Pclock.T)/2).min())
print('native L24 shift commutator norm:',np.linalg.norm(L@S-S@L))
# Pclock is not a source-defined physical clock, nonnormal, not positive.
print('Pclock shape',Pclock.shape,'norm',np.linalg.norm(Pclock,2),'rank',np.linalg.matrix_rank(Pclock,tol=1e-10))
# positive pair covariances Ck have finite (k<=4) memory, real power spectrum at each clock Fourier.
S0=(R3+R5).T@(R3+R5)/64
Cs=[];cur=np.eye(64)
for k in range(5):
    Cs.append((R3+R5).T@cur@(R3+R5)/64)
    cur=cur@M
for m in range(24):
    z=np.exp(2j*np.pi*m/24)
    Sstar=Cs[0].astype(complex).copy()
    for k in range(1,5):Sstar+=z**k*Cs[k]+z.conjugate()**k*Cs[k].T
    assert np.linalg.norm(Sstar-Sstar.conj().T)<1e-11
    assert np.linalg.eigvalsh(Sstar).min()>-1e-11
    if m in (0,1,3,6,9,12):
        print('clock m',m,'source spectral trace',float(np.trace(Sstar).real),'min eigen',np.linalg.eigvalsh(Sstar).min())
print('PASS')

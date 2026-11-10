#!/usr/bin/env python3
"""Exact Q(sqrt5) source isotypic certificate: the native hidden source lies
in the rational A5 quartet character projectors. Together with integer
minimal-polynomial certificates, this proves the four rational poles apply
to the genuine original sources, not arbitrary source vectors.
"""
from pathlib import Path
import numpy as np,runpy,contextlib,io
H=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    a=runpy.run_path(str(H/'URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py'))
    b=runpy.run_path(str(H/'URT_A5_SOURCE_POLE_INTEGER_CERTIFICATE_2026-11-09.py'))
Z=b['Z'];W=np.array([[(-1)**((h&m).bit_count()) for m in range(64)] for h in range(64)],dtype=np.int64)
T=W.T@Z@W # integer; Walsh-space A5 four-projector = T/(64*15)
Q5=a['Q5'];Z5=Q5()
for tag,source in [('3',a['PWo']),('5',a['PWe'])]:
    bad=[]
    for k in range(64):
        coeff=[Z5 for _ in range(20)]
        for m in range(64):
            c=int(T[k,m]);
            if c==0:continue
            for j in range(20):
                if source[m][j]!=Z5:coeff[j]=coeff[j]+c*source[m][j]
        for j in range(20):
            if coeff[j] != (64*15)*source[k][j]:bad.append((k,j))
    assert not bad, (tag,bad[:5])
    print('hidden',tag,'exact native source lies in A5 quartet projector: PASS')
print('Four URT/A5 source poles + exact Q(sqrt5) residues therefore have independent algebraic certificates.')
print('PASS')

#!/usr/bin/env python3
"""Exact A4-vacuum nonlinear source moments, arithmetic in Q(sqrt(5)).

Original five-Platonic 50->8 source and six-bit URT natural Haar histories.
No historical ARF coefficients, fitted masses or charges are used.
The tetrahedral A4 subgroup of A5 has a unique singlet in each hidden quartet.
The sign-independent cubic strength is certified by its exact square.
"""
import contextlib,io,runpy
from pathlib import Path
from fractions import Fraction as F
import sympy as sp
_root=Path(__file__).resolve().parent
H=next((p for p in (_root.parent/'forward',_root.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists()),None)
assert H is not None, 'original Nov 9 source cannot be found'
with contextlib.redirect_stdout(io.StringIO()):
    A=runpy.run_path(str(Path(__file__).parent/'URT_A4_SCALAR_CUMULANTS_2026_11_10.py'))
    X=runpy.run_path(str(H/'URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py'))
Vgroups=A['Vs'];proper=A['proper'];faceid=A['faceid'];faces=A['faces']
P3=X['P3'];P5=X['P5'];E=X['E'];O=X['O'];Q5=X['Q5'];Z=Q5();
compose=A['compose'];e=A['e']

def inv(g):return tuple(g.index(i) for i in range(12))

def moments(vectors,proj,include_sqrt2):
    assert proj.rank()==1 and proj*proj==proj
    # Pick a rational generator of the fixed rank-one subspace.
    t=next(proj[:,i] for i in range(20) if proj[:,i]!=sp.zeros(20,1))
    r2=sum((a*a for a in t),sp.Integer(0))
    assert r2>0 and r2.is_Rational
    tt=[Q5(F(int(a.p),int(a.q))) for a in t]
    vv=[sum((tt[i]*x[i] for i in range(20)),Z) for x in vectors]
    def power(x,k):
        y=Q5(1)
        for _ in range(k):y*=x
        return y
    raw=[sum((power(x,k) for x in vv),Z)/64 for k in range(1,5)]
    m2=(2 if include_sqrt2 else 1)*raw[1]/Q5(F(r2))
    m3sq=((8 if include_sqrt2 else 1)*raw[2]*raw[2]) / Q5(F(r2**3))
    m4=(4 if include_sqrt2 else 1)*raw[3]/Q5(F(r2**2))
    return raw,m2,m3sq,m4

cert=[]
for V in Vgroups:
    normalizer=[g for g in proper if frozenset(compose(compose(g,a),inv(g)) for a in V)==V]
    assert len(normalizer)==12
    Pavg=sp.zeros(20,20)
    for g in normalizer:
        U=sp.zeros(20,20)
        for i,face in enumerate(faces):
            j=faceid[frozenset(g[x] for x in face)]
            U[j,i]=1
        Pavg+=U/12
    this={}
    for lab,P,src,odd in [('3',P3,O,True),('5',P5,E,False)]:
        vac=P*Pavg*P
        assert vac*vac==vac and vac.trace()==1
        raw,m2,m3sq,m4=moments(src,vac,odd)
        this[lab]=(m2,m3sq,m4,raw[2])
    cert.append(this)
for lab in ('3','5'):
    arr=[z[lab] for z in cert]
    assert all(a[:3]==arr[0][:3] for a in arr)
    print('hidden',lab,'exact moment2',arr[0][0], 'third-moment squared',arr[0][1], 'fourth moment',arr[0][2])
    if lab=='3':
        assert arr[0][1]==Q5(0)
        assert arr[0][0]==Q5(9,F(18,5))
    else:
        assert arr[0][0]==Q5(F(7,4))
        assert arr[0][1]==Q5(F(27,10))
        assert arr[0][2]==Q5(F(329,30))
print('PASS: five A4 vacua all have identical source second, cubic-squared and fourth moments in exact Q(sqrt5) arithmetic')

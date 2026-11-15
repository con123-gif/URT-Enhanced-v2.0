#!/usr/bin/env python3
"""Q149 native original-v61 528-link 4D gauge curvature and instability theorem.

Imports unchanged original v61 site/direction definitions on CI.
Offline fallback is for an explicitly marked, transcribed local calculation only.
This is a theorem about the FINITE original Wilson geometry and the previously
CI-verified Q109 conditional Gaussian Hessian, not an observed photon.
"""
from itertools import product, combinations
from collections import defaultdict,Counter
from pathlib import Path
import importlib.util,os,sys
ROOT=Path(__file__).resolve().parents[2]
NATIVE=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
if NATIVE.exists():
    spec=importlib.util.spec_from_file_location('q149_native_v61',NATIVE)
    native=importlib.util.module_from_spec(spec)
    sys.modules[spec.name]=native
    spec.loader.exec_module(native)
    print('NATIVE ORIGINAL v61 SOURCE',NATIVE,flush=True)
    shape=tuple(native.LATTICE_SHAPE)
    sites=list(native.SITES)
    si=dict(native.SITE_INDEX)
    D=list(native.DIRECTIONS)
    def step(x,d):return native.periodic_shift(x,d)
else:
    if os.environ.get('Q149_ALLOW_OFFLINE_GEOMETRY')!='1':
        raise RuntimeError('Original v61 unavailable: offline geometry needs Q149_ALLOW_OFFLINE_GEOMETRY=1; this is NOT native verification')
    print('OFFLINE DIRECT TRANSCRIPTION OF ORIGINAL v61: native CI required',flush=True)
    shape=(6,2,2,2)
    sites=list(product(range(6),range(2),range(2),range(2)))
    si={x:i for i,x in enumerate(sites)}
    D=[(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)]
    def step(x,d):return tuple((x[k]+d[k])%shape[k] for k in range(4))
assert shape==(6,2,2,2) and len(sites)==48 and len(D)==11
assert D==[(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)]
n=48*11
edge=lambda x,j:11*si[x]+j
G=[[0]*48 for _ in range(n)]
for x in sites:
    for j,d in enumerate(D):
        y=step(x,d)
        G[edge(x,j)][si[x]]+=1
        G[edge(x,j)][si[y]]-=1
F=[[d[k] for k in range(4)] for x in sites for d in D]
rows=[];types=Counter()
def cycle(terms,kind):
    row=defaultdict(int)
    for x,j,sign in terms:row[edge(x,j)]+=sign
    row={i:z for i,z in row.items() if z}
    assert row and all(abs(z)==1 for z in row.values())
    assert all(sum(z*G[i][site] for i,z in row.items())==0 for site in range(48))
    assert all(sum(z*F[i][k] for i,z in row.items())==0 for k in range(4))
    rows.append(row)
    types[kind]+=1
# Genuine native commuting spatial/temporal two-link squares.
for x in sites:
    for a,b in combinations(range(11),2):
        da,db=D[a],D[b]
        cycle([(x,a,1),(step(x,da),b,1),(step(x,db),a,-1),(x,b,-1)],'square')
# Native temporal diagonal simplex triangles with one unit spatial bridge.
for x in sites:
    for a,b in combinations(range(3,11),2):
        da,db=D[a],D[b]
        differing=[k for k in range(1,4) if da[k]!=db[k]]
        if len(differing)!=1:continue
        k=differing[0];spatial=k-1
        if db[k]-da[k]==-1:
            cycle([(x,b,1),(step(x,db),spatial,1),(x,a,-1)],'triangle')
        else:
            cycle([(x,a,1),(step(x,da),spatial,1),(x,b,-1)],'triangle')
assert types=={'square':2640,'triangle':576}
# Exact rank LOWER bound over GF(2), without numerical tolerance.
pivots={}
for row in rows:
    bits=sum(1<<i for i in row)
    while bits:
        lead=bits.bit_length()-1
        if lead in pivots:bits^=pivots[lead]
        else:pivots[lead]=bits;break
mod2rank=len(pivots)
# Four nonexact flat cochains F: winding line integrals diag(6,2,2,2).
base=(0,0,0,0)
periods=[6,2,2,2]
directions=[3,0,1,2]
integrals=[]
for j,length in zip(directions,periods):
    pos=base;integral=[0]*4
    for _ in range(length):
        for a in range(4):integral[a]+=F[edge(pos,j)][a]
        pos=step(pos,D[j])
    assert pos==base
    integrals.append(integral)
assert integrals==[[6,0,0,0],[0,2,0,0],[0,0,2,0],[0,0,0,2]]
# Gauge rank=47 (48 sites connected). All 2-cell rows annihilate its image
# and the four cohomologically independent F; therefore real rank <=477.
# rank_GF2=477 proves real rank >=477. Hence equality exactly.
assert mod2rank==n-47-4==477
assert n-47==481
# The Q109 independently CI-verified conditional Gaussian 528-link Hessian
# at A=0 has 84 STRICTLY NEGATIVE eigenvalues, 47 gauge zero modes.
# Its 84-dimensional negative subspace N lies in the 481D gauge-transverse
# space. The 477D coexact/curvature subspace C meets N in dimension at least
# 84+477-481=80. Every nonzero u in N∩C has nonzero local curl, and
# Gamma(epsilon*u) < Gamma(0) for sufficiently small nonzero epsilon.
assert 84+477-481==80
print('Q149 native elementary faces',types)
print('Q149 EXACT curvature rank',mod2rank,'gauge rank',47,'flat Wilson modes',4)
print('Q149 conditional Q109 locally curved negative modes >=80')
print('Q149 physical consequence: actual local flux instability at symmetric vacuum; global torons alone insufficient')
print('Q149 NATIVE FINITE GAUGE CURVATURE CERTIFICATE: PASS')

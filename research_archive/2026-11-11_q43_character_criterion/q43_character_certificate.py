#!/usr/bin/env python3
"""Q43 native A5-orbital Walsh/character cancellation certificate.

Original Q3 and Q28 sources are Git-blob pinned; no 64-mask census is used.
Computes the exact middle-flip squared orbital defect by a 128-edge,
80-orbital character convolution, then solves its eight-character spectrum.
No measured constants, fitted inputs or historical ARF values.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from itertools import permutations
from pathlib import Path
import hashlib, json, runpy
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
Q3 = ROOT / '2026-11-11_q3_twirled_chronology_classes' / 'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28 = ROOT / '2026-11-11_q28_twirled_third_trace' / 'q28_twirled_third_trace.py'

def git_blob(path):
    b = path.read_bytes()
    return hashlib.sha1(b'blob ' + str(len(b)).encode() + b'\0' + b).hexdigest()
assert git_blob(Q3) == 'bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984'
assert git_blob(Q28) == '6e22cb7654176c6499ee138737f4f85240619ec7'
with redirect_stdout(StringIO()):
    src = runpy.run_path(str(Q28))
perms, actions, bits, Q = (src[k] for k in ('perms','actions','bits','Q'))
assert len(perms) == len(actions) == 60
assert np.all(Q.sum(axis=1) == 2)
assert all(Q[h,2*h%64] == Q[h,(2*h+1)%64] == 1 for h in range(64))

# Orbitals of the original 60 geometric rotations on ordered 64-code pairs.
orb = -np.ones((64,64),dtype=np.int16)
for u in range(64):
    for v in range(64):
        if orb[u,v] < 0:
            label = int(orb.max()) + 1
            for p in perms:
                orb[p[u],p[v]] = label
assert int(orb.max()) + 1 == 80
assert np.all(np.bincount(orb.ravel(),minlength=80) > 0)

remaining=set(permutations(range(6)))
orders=[]
while remaining:
    o=min(remaining)
    orbit={tuple(a[0][i] for i in o) for a in actions}
    assert len(orbit)==60 and orbit <= remaining
    remaining -= orbit
    orders.append(o)
assert len(orders)==12

# Orbital fibre Fourier transform W[d,q,O] = sum_z (-1)^(q.z)
# * 1[orb(z,z XOR d)=O].  This uses the original A5 orbitals, not
# the 64 signed dictionaries or a substitute chronology matrix.
chi=np.array([[1 if (q & z).bit_count()%2==0 else -1
               for z in range(64)] for q in range(64)],dtype=np.int64)
z=np.arange(64,dtype=np.int64)
W=np.zeros((64,64,80),dtype=np.int64)
for d in range(64):
    labels=orb[z,z^d]
    for q in range(64):
        W[d,q]=np.bincount(labels,weights=chi[q],minlength=80).astype(np.int64)

h=np.arange(64,dtype=np.int64)
succ=np.r_[2*h%64,(2*h+1)%64]
heads=np.r_[h,h]
MIDDLE=12
K=tuple(k for k in range(64) if (k&MIDDLE).bit_count()%2)
assert len(K)==32
SUPPORT={0,15,17,30,34,45,51,60}
GENERATORS=(15,17,34)
assert {0,15,17,30,34,45,51,60} == {
    (a*15)^(b*17)^(c*34) for a in range(2) for b in range(2) for c in range(2)}

def parity(x):return x.bit_count() & 1

def character_coefficients(order):
    # Original Q2 edges, with unsigned order and zero mask.
    code=(bits << np.asarray(order,dtype=np.int64)).sum(axis=1)
    xs=code[heads]; ds=xs^code[succ]
    assert len(xs)==len(ds)==128
    # Unnormalised 64-point Walsh coefficients C[k,O] of the orbital
    # count c_O(s), obtained directly by the orbit-fibre character identity.
    C=np.zeros((64,80),dtype=np.int64)
    for k in range(64):
        q=sum(((k>>i)&1)<<order[i] for i in range(6))
        signs=chi[q,xs]
        for e in range(128):
            C[k] += int(signs[e])*W[int(ds[e]),q]
    # Inversion symmetry of Q2 pairs eliminates all odd-weight characters.
    assert np.all(C[[k for k in range(64) if parity(k)],:] == 0)
    # Exact inverse character identity on two nontrivial masks, not a census.
    for s in (0,5,16):
        t=sum(((s>>i)&1)<<order[i] for i in range(6))
        direct=np.bincount(orb[xs^t,code[succ]^t],minlength=80)
        via=(chi[:,s]@C)
        assert np.array_equal(via,64*direct), (order,s)
    # Middle-flip defect: d_O(s) = (1/32) sum_{k in K} C[k,O] chi_k(s).
    # Its squared Euclidean norm has Walsh coefficients
    # e[r] = (1/1024) sum_{k in K, k XOR r in K} C[k] . C[k XOR r].
    coeff={}
    for r in range(64):
        numerator=sum(int(C[k]@C[k^r]) for k in K if (k^r) in K)
        assert numerator % 1024 == 0, (order,r,numerator)
        if numerator:
            coeff[r]=numerator//1024
    assert set(coeff) <= SUPPORT, (order,coeff)
    assert set(coeff) & {0} == {0}
    return coeff

# The three characters are independent. Their common kernel has 8
# sign masks. Solving 8 character triples, not enumerating 64 masks,
# gives all possible zero defects and exact affine solution cosets.
def solve_parities(target):
    """Solve three F2 linear equations by elimination, 2^3 free choices only."""
    rows=[[int(g), int(t<0)] for g,t in zip(GENERATORS,target)]
    pivots=[]
    for col in range(6):
        pivot=next((r for r in range(len(pivots),len(rows)) if (rows[r][0]>>col)&1),None)
        if pivot is None:
            continue
        rows[len(pivots)],rows[pivot]=rows[pivot],rows[len(pivots)]
        for r in range(len(rows)):
            if r!=len(pivots) and (rows[r][0]>>col)&1:
                rows[r][0]^=rows[len(pivots)][0]
                rows[r][1]^=rows[len(pivots)][1]
        pivots.append(col)
    assert len(pivots)==3
    free=[i for i in range(6) if i not in pivots]
    solutions=set()
    for mask in range(1<<len(free)):
        s=sum(((mask>>j)&1)<<col for j,col in enumerate(free))
        for row,col in zip(rows,pivots):
            s |= (row[1]^parity(row[0]&s))<<col
        assert tuple(chi[g,s] for g in GENERATORS)==target
        solutions.add(s)
    assert len(solutions)==8
    return solutions

V=solve_parities((1,1,1))
assert V == {0,12,21,25,38,42,51,63}
assert len(V)==8 and all(a^b in V for a in V for b in V)

results=[]
for order in orders:
    coeff=character_coefficients(order)
    energies={}
    for signs in ((a,b,c) for a in (1,-1) for b in (1,-1) for c in (1,-1)):
        a,b,c=signs
        value=0
        for r,weight in coeff.items():
            # r lies in the 3-character group, uniquely r = a*15 XOR b*17 XOR c*34.
            abcs=next((i,j,k) for i in range(2) for j in range(2) for k in range(2)
                      if r == (i*15)^(j*17)^(k*34))
            value += weight * (a**abcs[0]) * (b**abcs[1]) * (c**abcs[2])
        assert value >= 0
        energies[signs]=value
    zero=[key for key,value in energies.items() if value==0]
    assert len(zero) in (0,1), (order,zero)
    if zero:
        target=zero[0]
        solutions=solve_parities(target)
        seed=min(solutions)
        assert solutions=={seed^v for v in V}
        assert len(solutions)==8
        # Q42's two quartet seeds, modulo middle flip and global inversion.
        quartets=sorted({min({s,s^12,s^63,s^51}) for s in solutions})
        assert len(quartets)==2
    else:
        seed=None;quartets=[]
    results.append({'order':order,'walsh_coefficients':coeff,'zero_character':zero,
                    'quartet_seeds':quartets,'energies':energies})

expected={
    (0,1,2,3,4,5):(5,16), (0,1,2,3,5,4):(5,16),
    (0,1,2,5,3,4):(2,23), (0,1,4,2,5,3):(1,20),
    (0,1,4,5,2,3):(7,18), (0,1,4,5,3,2):(7,18)}
assert {r['order']:tuple(r['quartet_seeds']) for r in results if r['zero_character']} == expected
assert sum(bool(r['zero_character']) for r in results)==6
assert sum(not r['zero_character'] for r in results)==6
assert all(len(r['walsh_coefficients']) <= 8 for r in results)
assert all(len(r['energies']) == 8 for r in results)

print(json.dumps({
    'task':'Q43', 'type':'THEOREM / exact native character criterion',
    'original_source_git_blobs':[git_blob(Q3),git_blob(Q28)],
    'native_edges':128,'native_A5_orbitals':80,'unsigned_orders':12,
    'character_support':sorted(SUPPORT),'generators':GENERATORS,
    'common_kernel':sorted(V),
    'exceptional_classes':[{ 'order':list(r['order']),
        'two_quartet_seeds':r['quartet_seeds'],
        'zero_character':r['zero_character'],
        'coefficients':{str(k):v for k,v in sorted(r['walsh_coefficients'].items())}}
        for r in results if r['zero_character']],
    'nonexceptional_classes':6,
    'mask_enumeration_used':False,
    'physical_ARFs':'not derived',
    'status':'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING'
},indent=2,sort_keys=True))

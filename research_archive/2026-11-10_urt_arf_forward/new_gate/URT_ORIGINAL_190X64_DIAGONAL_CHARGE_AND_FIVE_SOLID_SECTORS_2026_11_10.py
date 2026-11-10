#!/usr/bin/env python3
"""Native original (unchanged) 190-cochain nonlinear source and 64x24
charged-history action: exact diagonal temporal U(1) covariance, charge-2
hidden source, 15 symmetric-square five-solid charge sectors, and failure
of independent U(1)^5 invariance without new bridge fields.

This executes only original model definitions before its demo/test harness;
no source code is modified. Physical electromagnetic identification unproved.
"""
from pathlib import Path
import numpy as np
from math import pi

p=Path('/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py')
src=p.read_text();marker='rng=np.random.default_rng(20261107)'
assert src.count(marker)==1
scope={'__file__':str(p),'__name__':'cathedral_source_import_for_ward'}
exec(compile(src.split(marker)[0],str(p),'exec'),scope)
for k in ('Plinear','C','P3','P5','geom','names','hidden_source','full_action','Cbridge','U0','L5','D','Hbits','Delta'):
    assert k in scope
Plinear=scope['Plinear'];C=scope['C'];P3=scope['P3'];P5=scope['P5']
geom=scope['geom'];names=scope['names']; hidden_source=scope['hidden_source']
full_action=scope['full_action'];Cbridge=scope['Cbridge'];U0=scope['U0'];L5=scope['L5']
assert Plinear.shape==(12,50) and C.shape==(20,12)
assert np.max(np.abs(U0.T@Cbridge@U0-L5))<1e-12

rng=np.random.default_rng(20261110)
T=24
z=(rng.normal(size=(T,190))+1j*rng.normal(size=(T,190)))*.008
y=(rng.normal(size=(T,64))+1j*rng.normal(size=(T,64)))*.008
theta=np.full(T,2*pi/((1+np.sqrt(5))/2)**2)
lam=rng.normal(scale=.25,size=T)
z_g=z*np.exp(1j*lam)[:,None]
y_g=y*np.exp(2j*lam)[:,None]
theta_g=theta+np.roll(lam,-1)-lam
s0=full_action(z,y,theta)
s1=full_action(z_g,y_g,theta_g)
assert abs(s1-s0)<2e-10,(s0,s1,s1-s0)

# Hidden source is exactly quadratic, hence charge two under common U(1).
for t in [0,3,11,23]:
    v=np.zeros(50,dtype=complex)
    for name in names:
        g=geom[name];o=g['offset'];nv=g['V'];vo=g['v_offset']
        v[vo:vo+nv]=z[t,o:o+nv]
    h3,h5=hidden_source(v)
    h3g,h5g=hidden_source(v*np.exp(1j*lam[t]))
    assert np.max(np.abs(h3g-np.exp(2j*lam[t])*h3))<1e-13
    assert np.max(np.abs(h5g-np.exp(2j*lam[t])*h5))<1e-13

# Decompose the original 50-vertex input into five spatial-solid blocks.
# The quadratic source expands as sum_{s<=t} h_st with charge e_s+e_t.
v=np.zeros(50,dtype=complex)
for name in names:
    g=geom[name];o=g['offset'];nv=g['V'];vo=g['v_offset']
    v[vo:vo+nv]=z[0,o:o+nv]
xs=[]
for name in names:
    g=geom[name];vo=g['v_offset'];nv=g['V']
    vv=np.zeros(50,dtype=complex);vv[vo:vo+nv]=v[vo:vo+nv]
    xs.append(C@(Plinear@vv))
sector=[]
for s in range(5):
    for t in range(s,5):
        h=(xs[s]*xs[t])*(2 if s!=t else 1)
        sector.append((s,t,P3@h,P5@h))
h3,h5=hidden_source(v)
assert np.max(np.abs(sum((row[2] for row in sector),np.zeros(20,dtype=complex))-h3))<1e-12
assert np.max(np.abs(sum((row[3] for row in sector),np.zeros(20,dtype=complex))-h5))<1e-12
norms=[float(np.linalg.norm(a)+np.linalg.norm(b)) for _,_,a,b in sector]
assert len(sector)==15 and min(norms)>1e-12,(norms,min(norms))
# Each of the 15 components transforms with its own independent U(1)^5
# weight vector e_s+e_t. Only for equal phases do they share charge two.
phases=rng.normal(scale=.3,size=5)
vg=v.copy()
for s,name in enumerate(names):
    g=geom[name];vo=g['v_offset'];nv=g['V'];vg[vo:vo+nv]*=np.exp(1j*phases[s])
h3g,h5g=hidden_source(vg)
re3=sum((np.exp(1j*(phases[s]+phases[t]))*a for s,t,a,b in sector),np.zeros(20,dtype=complex))
re5=sum((np.exp(1j*(phases[s]+phases[t]))*b for s,t,a,b in sector),np.zeros(20,dtype=complex))
assert np.max(np.abs(h3g-re3))<1e-12
assert np.max(np.abs(h5g-re5))<1e-12
# Independent phases do not act as a single scalar charge-two section.
assert np.linalg.norm(h3g-np.exp(2j*phases[0])*h3)>1e-7
# Original Cbridge locks the independent solid phases: only diagonal survives.
Uphase=np.diag(np.exp(1j*phases))
assert np.linalg.norm(Uphase.conj().T@L5@Uphase-L5)>1e-2
assert np.max(np.abs(np.ones(5)@L5))<1e-12
# Explicit noninvariance of full 190-cochain action for solid-dependent phases.
z_ind=z.copy()
for s,name in enumerate(names):
    g=geom[name];o=g['offset'];dim=g['V']+g['E']+g['F']
    z_ind[:,o:o+dim]*=np.exp(1j*phases[s])
s_ind=full_action(z_ind,y,theta)
assert abs(s_ind-s0)>1e-8
print('native original cochain sizes: 190 spatial, 64 signed histories, 24 clock, 5 solids')
print('full original nonlinear source action: diagonal temporal U(1) variation',s1-s0)
print('native source charges: geometry +1, quadratic hidden history +2')
print('original source decomposes into exactly 15 nonzero unordered five-solid charge sectors')
print('sectors: five 2e_s plus ten e_s+e_t, s<t (not 15 extra independent history states)')
print('native bridge on five scalar harmonics: U0^T Cbridge U0 = L5 exactly')
print('independent five-solid phase variation of native full action:',s_ind-s0)
print('PASS: native diagonal gauge symmetry; U(1)^5 extension requires charged bridge/dressing')
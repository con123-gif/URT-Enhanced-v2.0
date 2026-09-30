#!/usr/bin/env python3
"""Target-free URT four-gate closure audit."""
from __future__ import annotations
import itertools, json, math
from pathlib import Path
import mpmath as mp
import numpy as np

OUT = Path('/mnt/data')
mp.mp.dps = 60

# 1. Geometric rail -> logistic parameter
phi_mp = (1 + mp.sqrt(5))/2
gamma = mp.mpf(1)/81
delta_star = (1-gamma)*mp.pi/(13*phi_mp)
delta_cl = mp.mpf(3)/20
Delta = delta_cl-delta_star
eta_delta = -mp.log(Delta)

def f(x,r): return r*x*(1-x)
def f6(x,r):
    for _ in range(6): x=f(x,r)
    return x
r_star = mp.findroot(lambda r:f6(delta_star,r)-delta_star,
                     (mp.mpf('3.84165'),mp.mpf('3.84169')))
cycle=[delta_star]
for _ in range(5): cycle.append(f(cycle[-1],r_star))
cycle_sorted=sorted(cycle)
mult=mp.mpf(1)
for x in cycle: mult*=r_star*(1-2*x)
lyap=mp.log(abs(mult))/6

# 2. A5 branch quotient on the six unoriented axes
phi=float(phi_mp)
V=np.array([[0,1,phi],[0,1,-phi],[0,-1,phi],[0,-1,-phi],
            [1,phi,0],[1,-phi,0],[-1,phi,0],[-1,-phi,0],
            [phi,0,1],[phi,0,-1],[-phi,0,1],[-phi,0,-1]],float)
D=np.linalg.norm(V[:,None,:]-V[None,:,:],axis=2)
A=(np.abs(D-2)<1e-8).astype(float); np.fill_diagonal(A,0)
ref=(0,1,4); X=V[list(ref)].T; G=X.T@X
rots=[]; perms=[]
for imgs in itertools.permutations(range(12),3):
    Y=V[list(imgs)].T
    if np.max(np.abs(Y.T@Y-G))>1e-8: continue
    R=Y@np.linalg.inv(X)
    if np.max(np.abs(R.T@R-np.eye(3)))>1e-8 or np.linalg.det(R)<1-1e-8: continue
    p=[]; ok=True
    for v in V:
        ds=np.linalg.norm(V-R@v,axis=1); j=int(np.argmin(ds))
        if ds[j]>1e-7: ok=False; break
        p.append(j)
    if ok and tuple(p) not in perms: rots.append(R); perms.append(tuple(p))

Uv=V/np.linalg.norm(V,axis=1,keepdims=True)
ant={i:int(np.argmin(np.linalg.norm(Uv+v,axis=1))) for i,v in enumerate(Uv)}
pairs=sorted({tuple(sorted((i,ant[i]))) for i in range(12)})
lookup={p:i for i,p in enumerate(pairs)}
axis_perms=[]; orders=[]
for p in perms:
    ap=tuple(lookup[tuple(sorted((p[a],p[b])))] for a,b in pairs)
    axis_perms.append(ap); cur=list(range(6))
    for n in range(1,7):
        cur=[ap[cur[i]] for i in range(6)]
        if cur==list(range(6)): orders.append(n); break
rho6=[]
for p in axis_perms:
    M=np.zeros((6,6))
    for s,t in enumerate(p): M[t,s]=1
    rho6.append(M)
rho6=np.asarray(rho6)
order2=[i for i,o in enumerate(orders) if o==2]
order5=[i for i,o in enumerate(orders) if o==5]

def grading(i):
    p=axis_perms[i]; seen=set(); trans=[]; fixed=[]
    for a,b in enumerate(p):
        if a in seen: continue
        if a==b: fixed.append(a); seen.add(a)
        else: trans.append(tuple(sorted((a,b)))); seen.update((a,b))
    trans=sorted(set(trans)); fixed=sorted(fixed); E=np.eye(6)
    L=np.column_stack([(E[:,a]-E[:,b])/math.sqrt(2) for a,b in trans])
    R=np.column_stack([(E[:,a]+E[:,b])/math.sqrt(2) for a,b in trans]+[E[:,a] for a in fixed])
    return L,R

valid=set()
for t in order2:
    L,R=grading(t)
    for r in order5:
        Y=R.T@rho6[r]@L
        if abs(np.sum(Y*Y)-1.5)<1e-9 and np.all(np.linalg.norm(Y,axis=1)>1e-10):
            valid.add((t,r))
idx={p:i for i,p in enumerate(perms)}
def compose(p,q): return tuple(p[q[i]] for i in range(len(p)))
mul=np.empty((60,60),int)
for i,p in enumerate(perms):
    for j,q in enumerate(perms): mul[i,j]=idx[compose(p,q)]
e=idx[tuple(range(12))]
inv=np.empty(60,int)
for i in range(60): inv[i]=int(np.where(mul[i]==e)[0][0])
unseen=set(valid); orbits=[]
while unseen:
    t,r=next(iter(unseen)); orb=set()
    for g in range(60):
        tg=mul[mul[g,t],inv[g]]; rg=mul[mul[g,r],inv[g]]
        if (tg,rg) in valid: orb.add((tg,rg))
    orbits.append(orb); unseen-=orb

# 3. Canonical finite action
d=float(Delta)
a=16*(100+183*d*d)/75
b=(976/27+(384/5)*d+(99584/225)*d**2+(1728/5)*d**3+(420592/1875)*d**4)
rhoH=b/a**2

# 4. Frozen entropy scale + one-loop SM RG diagnostic
etaIR=phi**2*float(eta_delta)
sigmaIR=(10/13)*etaIR
ratio=math.exp(-sigmaIR)
alpha_inv=137+(17572/1215)*d-(9/65)*d*d
inv_e2=alpha_inv/(4*math.pi)
b1,b2,b3=41/10,-19/6,-7
c1=b1*sigmaIR/(8*math.pi**2); c2=b2*sigmaIR/(8*math.pi**2); c3=b3*sigmaIR/(8*math.pi**2)
x=(inv_e2-(5/3)*c1-c2)/(8/3)
g1sq=1/(x+c1); g2sq=1/(x+c2); g3sq=1/(x+c3); gYsq=(3/5)*g1sq
pred_s2=gYsq/(gYsq+g2sq); pred_as=g3sq/(4*math.pi)
# Required beta differences for frozen targets
s2t=3/13; ast=0.118343195266; e2=4*math.pi/alpha_inv
g1t=(5/3)*e2/(1-s2t); g2t=e2/s2t; g3t=4*math.pi*ast
q=[1/g1t,1/g2t,1/g3t]
req12=8*math.pi**2/sigmaIR*(q[0]-q[1]); req23=8*math.pi**2/sigmaIR*(q[1]-q[2])
th12=req12-(b1-b2); th23=req23-(b2-b3)

report={
 'rail':{'delta_star':str(delta_star),'Delta':str(Delta),'eta_delta':str(eta_delta),
         'r_star':str(r_star),'cycle_sorted':[str(v) for v in cycle_sorted],
         'multiplier':str(mult),'lyapunov_per_step':str(lyap),
         'neighbor_minus_3_over_20':str(cycle_sorted[1]-delta_cl)},
 'matter_quotient':{'A5_rotations':len(rots),'order2':len(order2),'order5':len(order5),
                    'full_support_pairs':len(valid),'orbit_sizes':[len(o) for o in orbits]},
 'canonical_action':{'a':a,'b':b,'b_over_a2':rhoH,'sin2_boundary':3/8,
                     'lambda_over_g2_squared':rhoH,
                     'gravity':'kappa^-2=(31/(8g^2))*Lambda_C^2'},
 'scale_rg':{'eta_IR':etaIR,'sigma_IR':sigmaIR,'mu_IR_over_Lambda_C':ratio,
             'predicted_sin2':pred_s2,'predicted_alpha_s':pred_as,
             'required_Delta_b1_minus_Delta_b2':th12,
             'required_Delta_b2_minus_Delta_b3':th23}}
(OUT/'urt_four_gate_closure_audit.json').write_text(json.dumps(report,indent=2))
print(json.dumps(report,indent=2))
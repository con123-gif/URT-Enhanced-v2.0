#!/usr/bin/env python3
"""Original Q101 six-axis history embedding, 444 frustration ground parity,
and native KMS chiral coherence: no free scale or fitted quantity."""
import contextlib,io,runpy, numpy as np
from collections import Counter
from itertools import combinations
with contextlib.redirect_stdout(io.StringIO()): src=runpy.run_path(str(__import__('pathlib').Path(__file__).with_name('cathedral_full_machine_bridge_2026_11_17.py')))
verts=src['v']; faces=src['faces']; Ph=src['Ph'];P3=src['P3'];P5=src['P5'];W=src['W']; states=src['states']; index=src['state_index'];phi=src['phi']
opp={i:next(j for j in range(12) if np.linalg.norm(verts[i]+verts[j])<1e-10) for i in range(12)}
pairs=[]; rem=set(range(12))
while rem:
 i=min(rem);j=opp[i];pairs.append((i,j));rem.remove(i);rem.remove(j)
assert len(pairs)==6
hist=np.zeros((64,20))
for mask in range(64):
 selected={pairs[k][(mask>>k)&1] for k in range(6)}
 for f,face in enumerate(faces):hist[mask,f]=float(set(face).issubset(selected))
U=hist@Ph/np.sqrt(2)
assert np.max(abs(U.T@U-Ph))<2e-13
inv64=np.array([i^63 for i in range(64)])
Pfaces=np.zeros((20,20))
for i,f in enumerate(faces):
 ant=tuple(sorted(opp[j] for j in f))
 j=faces.index(ant);Pfaces[i,j]=1
assert np.max(abs(hist[inv64]-hist@Pfaces))<1e-13
assert np.max(abs(Pfaces@P3+P3))<1e-12
assert np.max(abs(Pfaces@P5-P5))<1e-12
X=P5-P3
assert np.max(abs(U[inv64]-U@X))<2e-13
assert np.max(abs(X@W@X+W))<2e-12
print('NATIVE H64: complement |h>→|h xor 63> acts as X=P5-P3 on hidden eight: PASS')

# Pair structure of all 444 sublevel states and 60 minima.
patterns=Counter();by_lev=Counter();ground=[]
for mask,c,s,E in states:
 n_same_plus=sum(s[i]==s[j]==1 for i,j in pairs)
 n_same_minus=sum(s[i]==s[j]==-1 for i,j in pairs)
 n_opposed=sum(s[i]!=s[j] for i,j in pairs)
 assert n_same_plus+n_same_minus+n_opposed==6
 lev=0 if abs(E-(-6-4*phi))<1e-9 else 1 if abs(E-(-8-2*phi))<1e-9 else 2
 patterns[(lev,n_same_plus,n_same_minus,n_opposed)]+=1
 if lev==0:ground.append((mask,c,s))
print('HISTORY axes under 444 frustration (level, ++pairs, --pairs, opposite pairs):')
for k,v in sorted(patterns.items()):print(' ',k,'=',v)
print('GROUND 60 history-axis patterns:',{k[1:]:v for k,v in patterns.items() if k[0]==0})

# Actual canonical Walsh pair-flip generator is parity-preserving and C64-even.
H=np.diag(np.full(64,15.,dtype=float))
for h in range(64):
 for i,j in combinations(range(6),2):H[h,h^(1<<i)^(1<<j)]-=1
assert np.max(abs(H[inv64,:][:,inv64]-H))<1e-13
assert np.max(abs(H@U@P3-18*U@P3))<1e-12
assert np.max(abs(H@U@P5-16*U@P5))<1e-12
print('NATIVE H64 Hbits pair-flip evolution is complement invariant; hidden energies 18/16: PASS')

# Coherent KMS max-positivity states are an exact doublet exchanged by complement.
D=.15-80*np.pi/(1053*phi)
chi=1j*W/np.sqrt(15)
rho=(P3+D*D*P5)/(4*(1+D*D))
rplus=rho+D*chi/(4*(1+D*D))
rminus=rho-D*chi/(4*(1+D*D))
assert np.linalg.norm(rplus.conj().T-rplus)<1e-11
assert np.linalg.norm(rminus.conj().T-rminus)<1e-11
assert np.linalg.norm(X@rplus@X-rminus)<1e-11
p=np.linalg.eigvalsh(rplus)
assert np.max(abs(p[-4:]-1/4))<1e-11 and np.max(abs(p[:16]))<1e-11
mplus=np.trace(rplus@chi).real;mminus=np.trace(rminus@chi).real
assert abs(mplus+mminus)<1e-12 and abs(mplus-2*D/(1+D*D))<1e-11
p5=D*D/(1+D*D)
entropy=-p5*np.log(p5)-(1-p5)*np.log(1-p5)
print('NATIVE KMS chiral ± coherent states: Tr(rho_± chi)=',format(mplus,'.14g'),format(mminus,'.14g'))
print('KMS coherence entropy gap H2(p5)=',format(entropy,'.14g'),'nats')
print('rho_KMS=(rho_+ + rho_-)/2; both states have same hidden energy but opposite chiral sign')

# Natural compatibility relation: an oriented history must choose the anti-centre
# spin on each mixed antipodal pair. On the two aligned pairs, either choice is
# compatible. Verify each minimum admits exactly four histories and count how
# the 64 history labels distribute across the 30-ground A5 branch.
from itertools import product
completions={}
h_counts_by_c={+1:Counter(),-1:Counter()}
for mask,c,s in ground:
 choices=[]
 for k,(i,j) in enumerate(pairs):
  if s[i]!=s[j]:
   choices.append([0 if s[i]==-c else 1])
  else:
   assert s[i]==s[j]==c
   choices.append([0,1])
 masks=[sum(b<<k for k,b in enumerate(bits)) for bits in product(*choices)]
 assert len(masks)==4
 completions[mask,c]=set(masks)
 for h in masks:h_counts_by_c[c][h]+=1
assert sum(h_counts_by_c[1].values())==120
assert sum(h_counts_by_c[-1].values())==120
for mask,c,s in ground:
 invert=(mask^4095,-c)
 assert completions[(mask,c)]==completions[invert]
print('FRUSTRATION selects 4 of 64 compatible orientations per ground state (2 free axes): PASS')
for c in (1,-1):
 print('  c=',c,'distribution of 64 history completion multiplicities:',dict(sorted(Counter(h_counts_by_c[c][h] for h in range(64)).items())))
print('The two global-inversion ground partners have IDENTICAL relative-to-centre compatible history sets')

# Parameter-free frustration-to-history incidence Gram transfer.
plus=sorted((mask,c) for mask,c,s in ground if c==1)
F=np.zeros((len(plus),64),dtype=int)
for row,key in enumerate(plus):
 for h in completions[key]:F[row,h]=1
assert F.shape==(30,64) and np.all(F.sum(axis=1)==4)
assert np.all(np.diag(F.T@F)==np.array([h_counts_by_c[1][h] for h in range(64)]))
Gram=F.T@F
nonzero=np.linalg.eigvalsh(Gram); nz=nonzero[nonzero>1e-9]
print('FRUSTRATION-H64 INCIDENCE: F shape',F.shape,'rank',np.linalg.matrix_rank(F),'Tr(F^T F)',np.trace(Gram))
print('Gram nonzero eigenvalue clusters',[(float(k),sum(abs(nz-k)<1e-6)) for k in sorted({round(float(x),6) for x in nz})])
print('Tr Gram^2',np.trace(Gram@Gram),'Tr Gram^3',np.trace(Gram@Gram@Gram))
# Spatial H64 pair flip couples inside and outside the support.
support=np.array([h_counts_by_c[1][h]>0 for h in range(64)])
assert sum(support)==32
A=15*np.eye(64)-H
cut=np.sum(A[np.ix_(support,~support)])
internal=np.sum(A[np.ix_(support,support)])/2
exterior=np.sum(A[np.ix_(~support,~support)])/2
print('Hbits on frustration-selected 32 histories: internal edges',internal,'boundary edges',cut,'outside edges',exterior)
print('H64 support swapped by full bitwise complement?',bool(np.all(~support==support[inv64])))
# 30-state moving graph derived from minima: Hamming distance 2 connections.
Mmove=np.zeros((30,30),int)
for i,(mask,c) in enumerate(plus):
 for j,(mask2,c2) in enumerate(plus):
  if i!=j and (mask^mask2).bit_count()==2:Mmove[i,j]=1
assert np.array_equal(Mmove,Mmove.T) and np.all(Mmove.sum(axis=1)==4)
shared=F@F.T
print('History overlap counts on 30-state moving adjacency:',sorted(set(int(shared[i,j]) for i,j in zip(*np.where(Mmove==1)))))
print('History overlap counts on moving nonedges:',sorted(set(int(shared[i,j]) for i,j in zip(*np.where((Mmove==0)&(~np.eye(30,dtype=bool)))))))
print('Gram 30-dimensional moving commutator norm',np.linalg.norm(shared@Mmove-Mmove@shared))
print('H64 complement overlap selected/support:',int(np.sum(support & support[inv64])),'selected/excluded:',int(np.sum(support & ~support[inv64])))
print('Selected history bit parity counts:',sum(support[h] for h in range(64) if h.bit_count()%2==0),sum(support[h] for h in range(64) if h.bit_count()%2==1))

# Exact characteristic polynomial of the 30x30 gram (integer matrices).
import sympy as sp
poly=sp.factor(sp.Matrix(F@F.T).charpoly('x').as_expr())
expected=sp.Symbol('x')**5*(sp.Symbol('x')-16)*(sp.Symbol('x')-1)**4*(sp.Symbol('x')-3)**4*(sp.Symbol('x')**2-16*sp.Symbol('x')+44)**3*(sp.Symbol('x')**2-8*sp.Symbol('x')+4)**5
assert sp.expand(poly-expected)==0
print('EXACT integral Gram characteristic polynomial:',poly)

# Entropic distribution of histories under uniform ground state and uniform
# per-ground compatible history. Counts are 5 (12 histories), 3 (20), 0 (32).
p_hist=np.array([h_counts_by_c[1][h]/120 for h in range(64)])
H_hist=-sum(p*np.log(p) for p in p_hist if p)
H_cond=np.log(4.)
print('HISTORY Shannon entropy per uniformly selected ground branch',format(H_hist,'.14g'),'nats')
print('COND history entropy given ground',H_cond,'nats')
print('Frustration ground-history mutual information',format(H_hist-H_cond,'.14g'),'nats')
print('Entropy reduction from uniform H64',format(np.log(64)-H_hist,'.14g'),'nats')
assert abs(H_hist-0.5*np.log(960.))<1e-12

# Extend natural compatibility to ALL 444 states: select -c on mixed axes,
# allow both orientations on aligned pairs. This is a declared channel rule.
K=np.zeros((444,64),dtype=int); typ=Counter()
for ix,(mask,c,s,E) in enumerate(states):
 opts=[]
 for j,(i,k) in enumerate(pairs):
  if s[i]!=s[k]:opts.append([0 if s[i]==-c else 1])
  else:opts.append([0,1])
 for bits in product(*opts):K[ix,sum(b<<j for j,b in enumerate(bits))]=1
 lev=0 if abs(E-(-6-4*phi))<1e-9 else 1 if abs(E-(-8-2*phi))<1e-9 else 2
 typ[lev,K[ix].sum()]+=1
assert np.all(K.sum(axis=1)>=1)
print('FULL 444 compatibility multiplicities (level, compatible histories):',dict(sorted(typ.items())))
print('FULL 444 total state/history incidence links',int(K.sum()))
assert K.sum()==1944
# Thermal marginal includes excited states, but does it keep the support?
Dm=.15-80*np.pi/(1053*phi);bm=-np.log(Dm)
Ev=np.array([s[3] for s in states]); q=np.exp(-bm*(Ev-Ev.min()));q/=q.sum()
Mnat=(q/K.sum(axis=1))@K
assert abs(Mnat.sum()-1)<1e-12
print('KMS history marginal mass on 32 ground-supported histories',format(Mnat[support].sum(),'.14g'))
print('KMS history marginal mass on 32 ground-unsupported histories',format(Mnat[~support].sum(),'.14g'))
# Universal rational leakage coefficients by energy shell and choice count.
from fractions import Fraction
leaks=Counter()
for ix,(mask,c,s,E) in enumerate(states):
 lev=0 if abs(E-(-6-4*phi))<1e-9 else 1 if abs(E-(-8-2*phi))<1e-9 else 2
 total=int(K[ix].sum());supported=int(K[ix,support].sum())
 leaks[(lev,total,supported)]+=1
print('HISTORY support/energy/orientation classes (level,total_choices,in_support):',dict(sorted(leaks.items())))
for lev in range(3):
 group=[(tot,s,n) for (ll,tot,s),n in leaks.items() if ll==lev]
 n=sum(n for _,_,n in group)
 mean_out=sum(Fraction((tot-s)*num,tot) for tot,s,num in group)/n
 print('  energy level',lev,'mean outside 32-support fraction',mean_out,'=',float(mean_out))
print('Frustration-to-history Gram complement commutator Frobenius norm',np.linalg.norm(Gram[np.ix_(inv64,inv64)]-Gram))
print('Frustration/history Gram commutator with original Hbits Frobenius norm',np.linalg.norm(Gram@H-H@Gram))
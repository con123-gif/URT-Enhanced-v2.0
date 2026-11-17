#!/usr/bin/env python3
"""Independent 13-spin icosahedral low-energy transition calculation.

Build the physical 444-state sublevel H<=-10 (all 8192 enumerated), exact
single-spin-flip incidence, and specified continuous-time heat-bath generator
with unit attempt frequency. Compute its reversible symmetric representation,
spectral gap, and compare to the low-temperature 29/15 asymptotic.
This is a CONDITIONAL kinetic model; physical time units, matter baryon violation,
and continuum physics are not established by this computation.
"""
import numpy as np
from itertools import product,combinations
from collections import Counter
from scipy.sparse import coo_matrix,csgraph,diags
from scipy.sparse.linalg import eigsh
from scipy.special import expit

phi=(1+np.sqrt(5))/2
Delta=.15-80*np.pi/(1053*phi)
eta=-np.log(Delta)
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)] + [(a,b*phi,0) for a,b in product((-1,1),repeat=2)] + [(b*phi,0,a) for a,b in product((-1,1),repeat=2)])
edge=[(i,j) for i,j in combinations(range(12),2) if abs(np.sum((v[i]-v[j])**2)-4)<1e-9]
assert len(edge)==30
Eg=-6-4*phi; Ei=-8-2*phi; Es=-10
states={}
for cbit in (0,1):
  c=1-2*cbit
  for word in range(4096):
    spin=np.array([1 if (word>>i)&1 else -1 for i in range(12)],int)
    E=sum(spin[i]*spin[j] for i,j in edge)-phi*c*spin.sum()
    if E<=-10+1e-9:
      lev=int(np.argmin(np.abs(np.array([Eg,Ei,Es])-E)))
      assert abs(E-[Eg,Ei,Es][lev])<1e-8
      states[word|(cbit<<12)]=(float(E),lev,cbit)
assert len(states)==444
seq=sorted(states); ind={x:i for i,x in enumerate(seq)}; N=len(seq)
link=[];count=Counter()
for x in seq:
  for bit in range(13):
    y=x^(1<<bit)
    if y in ind and x<y:
      a,b=ind[x],ind[y]
      link.append((a,b,bit))
      count[('center' if bit==12 else 'outer',min(states[x][1],states[y][1]),max(states[x][1],states[y][1]))]+=1
assert len(link)==1032
assert count=={('outer',0,1):360,('outer',1,2):600,('center',2,2):72},count

# Construct symmetric similarity of heat bath generator Q, qxy=(1+exp(beta(Ey-Ex)))^-1
# Symmetric -Q has L_offdiag=-sqrt(qxy*qyx), L_diag=sum outgoing qxy.
energies=np.array([states[x][0] for x in seq]); cbits=np.array([states[x][2] for x in seq]);
assert all(cbits[a]==cbits[b] for a,b,bit in link if bit<12)
assert all(cbits[a]!=cbits[b] for a,b,bit in link if bit==12)
rows=[];cols=[];vals=[]
for a,b,_ in link:
    rows.extend((a,b));cols.extend((b,a));vals.extend((1,1))
g=coo_matrix((vals,(rows,cols)),shape=(N,N)).tocsr()
ncomponents,labels=csgraph.connected_components(g)
assert ncomponents==1,ncomponents

def gap(beta):
  r=[];co=[];data=[]
  diag=np.zeros(N)
  for a,b,_ in link:
    rate_ab=expit(-beta*(energies[b]-energies[a]));rate_ba=expit(-beta*(energies[a]-energies[b]))
    diag[a]+=rate_ab;diag[b]+=rate_ba
    t=-np.sqrt(rate_ab*rate_ba)
    r.extend((a,b));co.extend((b,a));data.extend((t,t))
  L=coo_matrix((data,(r,co)),shape=(N,N)).tocsr()+diags(diag)
  w=np.linalg.eigvalsh(L.toarray())[:4]
  assert abs(w[0])<3e-13,w
  return w[1:4],w[0]

print('Original geometry: N='+str(N)+' undirected links='+str(len(link))+' components='+str(ncomponents))
print('energy levels', Counter(states[x][1] for x in seq))
print('link distribution',dict(count))
print('Delta',Delta,'eta',eta,'barrier',Es-Eg)
for beta in (3.0,4.0,eta,7.5,9.0):
  w,z=gap(beta)
  pred=(29/15)*np.exp(-beta*(Es-Eg))
  print(f'beta={beta:.8f} exact gap={w[0]:.12e}, Eyring asym={pred:.12e}, ratio={w[0]/pred:.9f}; next gaps {w[1]:.7e},{w[2]:.7e}')
# state distribution and charge-neutral mode
beta=eta
p=np.exp(-beta*(energies-Eg));p=p/p.sum()
print('beta=eta equilibrium c+ probability',p[cbits==0].sum(), 'c- probability',p[cbits==1].sum())
# Exact weighted populations for the selected heat-bath thermal ensemble.
levels=[Eg,Ei,Es]
weights=np.exp(-eta*(np.array(levels)-Eg))
level_counts=np.array([60,240,144])
Z=float(level_counts@weights)
pops=level_counts*weights/Z
assert abs(pops.sum()-1)<1e-14
print('beta=eta equilibrium population ground/intermediate/saddle',*[f'{x:.12e}' for x in pops])
print('central-contact thermal flips per attempt-time unit',pops[2]/2)

# Exact model current moment (native distribution is independently certified in Q125a).
import sympy as sp
rt=sp.sqrt(5)
j1=8*rt/5; j2=4+12*rt/5
moment=sp.simplify(480*j1**2+240*j2**2)
assert moment==16896+4608*rt
assert sp.expand(moment*192)==3244032+884736*rt
print('Q125 certified current census 480+j1, 240+j2, 312 zero; exact moment:',moment)

# Physical resonance test, using ACTUAL 20-face dual adjacency, not 6I-CC^TC.
face=[(i,j,k) for i,j,k in combinations(range(12),3) if
      all(tuple(sorted(pair)) in edge for pair in ((i,j),(j,k),(i,k)))]
assert len(face)==20
C=np.zeros((20,12),dtype=int)
for f,(i,j,k) in enumerate(face): C[f,[i,j,k]]=1
AI=np.zeros((12,12))
for i,j in edge: AI[i,j]=AI[j,i]=1
LI=5*np.eye(12)-AI
AD=np.zeros((20,20))
for i,j in combinations(range(20),2):
 if C[i]@C[j]==2: AD[i,j]=AD[j,i]=1
assert np.all(AD.sum(axis=1)==3)
LD=3*np.eye(20)-AD
assert np.allclose(C.T@C,15*np.eye(12)-2*LI)
Ddet=LI@C.T-C.T@(LD+2*np.eye(20))
spec=np.linalg.eigvalsh(Ddet@Ddet.T)
assert np.allclose(spec,[0]*6+[12]*5+[60],atol=1e-11)
print('full geometry resonant +2 sheet, Ddet Ddet^T eigenvalues: 0x6, 12x5, 60x1')
print('sheet detuning alternatives: delta=0 selects singlet; delta=2 both triplets; delta=4 quintet')

# Exact late-2026 saddle capacity supplement. Original 444-state graph above.
from fractions import Fraction
saddle_contacts=Counter()
for a,b,bit in link:
  if bit!=12: continue
  assert states[seq[a]][1]==states[seq[b]][1]==2
  def downhill(i):
    word=seq[i]
    return sum(((word^(1<<j)) in states and states[word^(1<<j)][1]==1) for j in range(12))
  k1,k2=downhill(a),downhill(b)
  assert k1==k2 and k1 in (4,5)
  saddle_contacts[k1]+=1
assert saddle_contacts=={4:60,5:12},saddle_contacts
capacity=sum((Fraction(n*k,2*(k+1)) for k,n in saddle_contacts.items()),Fraction(0))
assert capacity==29
exact_prefactor=2*capacity/30
assert exact_prefactor==Fraction(29,15)
print('EXACT barrier saddle capacity:',capacity,'low-T spectral-gap prefactor:',exact_prefactor)

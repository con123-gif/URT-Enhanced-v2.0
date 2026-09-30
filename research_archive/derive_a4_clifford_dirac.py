#!/usr/bin/env python3
import itertools, math, json, runpy
from pathlib import Path
import numpy as np
from scipy.linalg import null_space

# Load exact group/Clebsch construction from audit (prints; suppress by minimal rederive via runpy)
ns=runpy.run_path('/mnt/data/cathedral_finite_dirac_trace_audit.py')
group=ns['group']; reps=ns['reps']; T_of_h=ns['T_of_h']; compose=ns['compose']; inverse=ns['inverse']; order=ns['order']; identity=ns['identity']

# Select an A4 subgroup and fixed vector t in the 4 carrier.
def subgroup(gens):
    S={identity}; changed=True
    while changed:
        changed=False
        for a in list(S):
            for b in gens+list(S):
                for c in (compose(a,b),compose(b,a)):
                    if c not in S: S.add(c); changed=True
    return S
A4=None
for p,q in itertools.combinations(group,2):
    H=subgroup([p,q])
    if len(H)==12:
        counts={k:sum(order(x)==k for x in H) for k in [1,2,3,5]}
        if counts=={1:1,2:3,3:8,5:0}:
            A4=H; break
assert A4 is not None
A=np.vstack([reps[p][2]-np.eye(4) for p in A4])
_,_,vh=np.linalg.svd(A); t=vh[-1]; t/=np.linalg.norm(t)
if t[np.argmax(np.abs(t))]<0:t=-t
Pl=np.outer(t,t); Pc=np.eye(4)-Pl

# Exterior algebra basis bitmasks for R^4
masks=list(range(16)); even=[m for m in masks if m.bit_count()%2==0]; odd=[m for m in masks if m.bit_count()%2==1]
idx={m:i for i,m in enumerate(masks)}

def wedge_sign(mask,a):
    # e_a wedge form: number of occupied indices lower than a
    return -1 if sum((mask>>j)&1 for j in range(a))%2 else 1

def contract_sign(mask,a):
    # i_{e_a}: position among occupied indices
    return -1 if sum((mask>>j)&1 for j in range(a))%2 else 1

C=[]
for a in range(4):
    M=np.zeros((16,16))
    for m in masks:
        j=idx[m]
        if not ((m>>a)&1):
            mp=m|(1<<a); M[idx[mp],j]+=wedge_sign(m,a)
        if (m>>a)&1:
            mp=m&~(1<<a); M[idx[mp],j]+=contract_sign(m,a)
    C.append(M)
C=np.array(C)
# Clifford audit
cliff=max(np.linalg.norm(C[a]@C[b]+C[b]@C[a]-2*(a==b)*np.eye(16)) for a in range(4) for b in range(4))
# odd -> even blocks
Co=np.array([M[np.ix_(even,odd)] for M in C]) # 4 x 8 x 8

# Generation Clebsch matrices T_b: 3 -> 3'
E4=np.eye(4); T=np.array([T_of_h(E4[:,b]) for b in range(4)])

# Internal projectors in odd forms. First 4 odd masks are degree1? identify.
odd_deg1=[i for i,m in enumerate(odd) if m.bit_count()==1]
odd_deg3=[i for i,m in enumerate(odd) if m.bit_count()==3]
# embedding V -> Lambda1 is obvious columns e_a.
E1=np.zeros((8,4))
for a in range(4): E1[odd.index(1<<a),a]=1
# Hodge embedding V -> Lambda3: * e_a, orientation 0123
E3=np.zeros((8,4))
for a in range(4):
    comp=((1<<4)-1)^(1<<a)
    # e_a wedge (*e_a)=vol => star sign (-1)^a in standard ordering
    E3[odd.index(comp),a]=(-1)**a
assert np.linalg.norm(E1.T@E1-np.eye(4))<1e-12 and np.linalg.norm(E3.T@E3-np.eye(4))<1e-12

# Build Dirac amplitude M(G)=sum_ab G_ab C_a tensor T_b (odd*3 -> even*3)
def amplitude(zl,zc):
    G=zl*Pl+zc*Pc
    M=np.zeros((24,24),complex)
    for a in range(4):
        for b in range(4):
            M += G[a,b]*np.kron(Co[a],T[b])
    return M

def species_K(M,E,P):
    # restrict K=M^dag M to subspace E P of odd internal, trace/average over its internal rank
    # obtain columns via eigenspace P in V then embed into odd forms
    wp,Vp=np.linalg.eigh(P)
    Q=E@Vp[:,wp>0.5]
    K=M.conj().T@M
    tensor=K.reshape(8,3,8,3)
    Kg=np.einsum('ia,iAjB,jb->AB',Q.conj(),tensor,Q,optimize=True)/Q.shape[1]
    return (Kg+Kg.conj().T)/2

def frame(K):
    w,U=np.linalg.eigh(K); o=np.argsort(w); return w[o],U[:,o]
def jarl(U): return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
def outputs(zl,zc):
    M=amplitude(zl,zc)
    Ks={
      'u':species_K(M,E1,Pc),'nu':species_K(M,E1,Pl),
      'd':species_K(M,E3,Pc),'e':species_K(M,E3,Pl)}
    F={}; eig={}
    for k,v in Ks.items(): eig[k],F[k]=frame(v)
    V=F['u'].conj().T@F['d']; L=F['e'].conj().T@F['nu']
    return Ks,eig,V,L

cases={
 'unbroken':(1,1),
 'metric_real':(math.sqrt(3),math.sqrt(5)),
 'metric_complex':(math.sqrt(3),1j*math.sqrt(5)),
 'unit_quadrature':(1,1j),
 'gap_loaded':(1,math.sqrt(ns['Delta'])*1j),
}
out={'clifford_error':float(cliff),'t':t.tolist(),'cases':{}}
for name,(zl,zc) in cases.items():
    Ks,eig,V,L=outputs(zl,zc)
    out['cases'][name]={
      'zl':[float(np.real(zl)),float(np.imag(zl))], 'zc':[float(np.real(zc)),float(np.imag(zc))],
      'eigenvalues':{k:v.tolist() for k,v in eig.items()},
      'CKM_abs':np.abs(V).tolist(),'CKM_J':jarl(V),
      'PMNS_abs':np.abs(L).tolist(),'PMNS_J':jarl(L),
      'K_pair_differences':{
       'u_d':float(np.linalg.norm(Ks['u']-Ks['d'])),
       'e_nu':float(np.linalg.norm(Ks['e']-Ks['nu'])),
       'u_nu':float(np.linalg.norm(Ks['u']-Ks['nu'])),
       'd_e':float(np.linalg.norm(Ks['d']-Ks['e']))}}

Path('/mnt/data/a4_clifford_dirac_results.json').write_text(json.dumps(out,indent=2))
print('Clifford error',cliff)
for name,d in out['cases'].items():
 print('\n',name)
 print('|V|=\n',np.array(d['CKM_abs']))
 print('JQ',d['CKM_J'])
 print('|L|=\n',np.array(d['PMNS_abs']))
 print('JL',d['PMNS_J'])
 print('pair diffs',d['K_pair_differences'])
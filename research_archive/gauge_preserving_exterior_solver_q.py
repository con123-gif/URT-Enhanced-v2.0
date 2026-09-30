import json, math, itertools
from pathlib import Path
import numpy as np
import torch

torch.set_default_dtype(torch.float64)
# Load existing exact geometry/operator definitions.
ns={}
exec(Path('/mnt/data/run_endpoint_test.py').read_text().split('# torch constants')[0],ns)
J5,J43,J45=ns['J5'],ns['J43'],ns['J45']
E3,E5=ns['E3'],ns['E5']
charges=ns['charges']; gcov=ns['gcov']; Delta=ns['Delta']
Aedge=ns['edge_alphabet']; precision=ns['precision']
eta_delta=ns['eta_delta']; eta_conf=ns['eta_conf']; classical_minimum=ns['classical_minimum']
phi=(1+math.sqrt(5))/2; gamma=1/81
names=['u','d','e','nu']

# Exterior Fock basis ordered by degree.
full=[]
for k in range(5): full += list(itertools.combinations(range(4),k))
idx={I:i for i,I in enumerate(full)}
# Full Clifford generators c_a^dag+c_a.
Cfull=[]
for a in range(4):
    C=np.zeros((16,16))
    for J in full:
        j=idx[J]
        if a not in J:
            pos=sum(x<a for x in J); I=tuple(sorted((a,*J)))
            C[idx[I],j]=(-1)**pos
        if a in J:
            pos=J.index(a); I=J[:pos]+J[pos+1:]
            C[idx[I],j]=(-1)**pos
    Cfull.append(C)
Cfull=np.asarray(Cfull)

# Source bases Lambda1 and Lambda3. Use Hodge-related Lambda3 basis *e_a.
B1=np.zeros((16,4)); B3=np.zeros((16,4))
for a in range(4): B1[idx[(a,)],a]=1
# Hodge star on 1-forms: *e_a = sign * complement.
def parity(seq):
    inv=sum(seq[i]>seq[j] for i in range(len(seq)) for j in range(i+1,len(seq)))
    return -1 if inv%2 else 1
for a in range(4):
    comp=tuple(i for i in range(4) if i!=a)
    sign=parity((a,)+comp)
    B3[idx[comp],a]=sign

# Lambda2 selfdual/anti-selfdual bases.
pairs=[(0,1),(0,2),(0,3),(1,2),(1,3),(2,3)]
B2=np.zeros((16,6))
for j,p in enumerate(pairs): B2[idx[p],j]=1
# star matrix in pair basis
S2=np.zeros((6,6))
for j,p in enumerate(pairs):
    comp=tuple(i for i in range(4) if i not in p)
    seq=p+comp; sign=parity(seq)
    k=pairs.index(tuple(sorted(comp)))
    # if complement tuple sorting changes orientation, but comp already ascending
    S2[k,j]=sign
w,V=np.linalg.eigh(S2)
Bplus2=V[:,w>0.5]
Bminus2=V[:,w<-0.5]
# deterministic signs/order via standard templates
stdplus=np.array([[1,0,0,0,0,1],[0,1,0,0,-1,0],[0,0,1,1,0,0]],float).T/math.sqrt(2)
stdminus=np.array([[1,0,0,0,0,-1],[0,1,0,0,1,0],[0,0,1,-1,0,0]],float).T/math.sqrt(2)
Bplus2=stdplus; Bminus2=stdminus
# target Weyl bases E+ = Lambda0 + Lambda2+, E- = Lambda2- + Lambda4
Bp=np.zeros((16,4)); Bm=np.zeros((16,4))
Bp[idx[()],0]=1; Bp[:,1:]=B2@Bplus2
Bm[:,:3]=B2@Bminus2; Bm[idx[(0,1,2,3)],3]=1
# projected sigma matrices, target x source
Sup=np.array([np.diag([1,math.sqrt(2),math.sqrt(2),math.sqrt(2)])@Bp.T@Cfull[a]@B1 for a in range(4)])
Sdn=np.array([np.diag([math.sqrt(2),math.sqrt(2),math.sqrt(2),1])@Bm.T@Cfull[a]@B3 for a in range(4)])
# audits
orth_up=max(np.linalg.norm(Sup[a].T@Sup[a]-np.eye(4)) for a in range(4))
orth_dn=max(np.linalg.norm(Sdn[a].T@Sdn[a]-np.eye(4)) for a in range(4))
# Weyl Clifford relation sigma_a^T sigma_b + sigma_b^T sigma_a=2delta
weyl_up=max(np.linalg.norm(Sup[a].T@Sup[b]+Sup[b].T@Sup[a]-(2*np.eye(4) if a==b else 0)) for a in range(4) for b in range(4))
weyl_dn=max(np.linalg.norm(Sdn[a].T@Sdn[b]+Sdn[b].T@Sdn[a]-(2*np.eye(4) if a==b else 0)) for a in range(4) for b in range(4))
print('audits',orth_up,orth_dn,weyl_up,weyl_dn)

# Assign first three shafts to colours, fourth to lepton.
up_species=['u','u','u','nu']
dn_species=['d','d','d','e']

TJ5=torch.tensor(J5); TJ43=torch.tensor(J43); TJ45=torch.tensor(J45)
TE3=torch.tensor(E3); TE5=torch.tensor(E5)
TA=torch.tensor(Aedge); TP=torch.tensor(precision)
TSup=torch.tensor(Sup,dtype=torch.complex128); TSdn=torch.tensor(Sdn,dtype=torch.complex128)
Tq={s:torch.tensor(charges[s]) for s in names}; Tg={s:torch.tensor(gcov(charges[s])) for s in names}

def unvec(v): return v.reshape(3,3).T

def yblocks(x, normalization='stiffness'):
    out={}
    for s in names:
        if normalization=='declared':
            z=TJ5@x[:5]+TJ43@(x[5:9]+TE3@Tq[s]/3)
            w=TJ45@(x[9:]+Delta*TE5@Tg[s]/5)
        elif normalization=='stiffness':
            z=TJ5@x[:5]+TJ43@(x[5:9]+TE3@Tq[s]/math.sqrt(3))
            w=TJ45@(x[9:]+Delta*TE5@Tg[s]/math.sqrt(5))
        out[s]=unvec(z).to(torch.complex128)+1j*unvec(w).to(torch.complex128)
    return out

def circuits(x,norm):
    Y=yblocks(x,norm)
    Mu=torch.zeros((12,12),dtype=torch.complex128)
    Md=torch.zeros((12,12),dtype=torch.complex128)
    for a,s in enumerate(up_species): Mu += torch.kron(TSup[a].contiguous(),Y[s].contiguous())
    for a,s in enumerate(dn_species): Md += torch.kron(TSdn[a].contiguous(),Y[s].contiguous())
    return Mu,Md,Y

def car_scalar(v): return .5*v*torch.tanh(.5*v)-torch.log(torch.cosh(.5*v))
def classical(x,eta):
    logits=eta*(TA@x)
    return .5*torch.dot(TP*x,x)-(torch.logsumexp(logits,0)-math.log(30))/eta

def action(x,eta,norm,weight):
    Mu,Md,_=circuits(x,norm)
    sv=torch.cat([torch.linalg.svdvals(Mu),torch.linalg.svdvals(Md)])
    return classical(x,eta)+weight*2*torch.sum(car_scalar(sv))/eta

def solve(eta,norm,weight):
    starts=[classical_minimum(eta)]
    for j in range(0,30,3):
        row=Aedge[j]; starts.append(np.r_[.9*row[:5],.15*row[5:9],.15*row[9:]])
    best=None
    for st in starts:
        x=torch.tensor(st,requires_grad=True)
        opt=torch.optim.LBFGS([x],lr=.5,max_iter=500,tolerance_grad=1e-11,tolerance_change=1e-14,line_search_fn='strong_wolfe')
        def closure():
            opt.zero_grad(); v=action(x,eta,norm,weight); v.backward(); return v
        try: opt.step(closure)
        except Exception as exc: print('opt warning',exc)
        val=float(action(x.detach(),eta,norm,weight))
        if best is None or val<best[0]: best=(val,x.detach().numpy())
    return best

def npY(x,norm):
    out={}
    for s in names:
        if norm=='declared':
            z=J5@x[:5]+J43@(x[5:9]+E3@charges[s]/3)
            w=J45@(x[9:]+Delta*E5@gcov(charges[s])/5)
        else:
            z=J5@x[:5]+J43@(x[5:9]+E3@charges[s]/math.sqrt(3))
            w=J45@(x[9:]+Delta*E5@gcov(charges[s])/math.sqrt(5))
        out[s]=z.reshape(3,3,order='F')+1j*w.reshape(3,3,order='F')
    return out

def make_np_circuits(Y):
    Mu=sum(np.kron(Sup[a],Y[s]) for a,s in enumerate(up_species))
    Md=sum(np.kron(Sdn[a],Y[s]) for a,s in enumerate(dn_species))
    return Mu,Md

def shaft_grams(M):
    # source exterior shaft a has 3 generation columns, all target rows.
    K=[]
    for a in range(4):
        cols=slice(3*a,3*(a+1))
        A=M[:,cols]
        K.append(A.conj().T@A)
    return K

def frame(K):
    e,V=np.linalg.eigh((K+K.conj().T)/2); ii=np.argsort(e)
    return e[ii],V[:,ii]
def jarl(U): return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
def observe(x,norm):
    Y=npY(x,norm); Mu,Md=make_np_circuits(Y)
    Ku=shaft_grams(Mu); Kd=shaft_grams(Md)
    # colours are shafts 0..2; verify equal; use average to preserve colour symmetry.
    K_u=sum(Ku[:3])/3; K_nu=Ku[3]
    K_d=sum(Kd[:3])/3; K_e=Kd[3]
    vals={}; F={}
    for s,K in [('u',K_u),('d',K_d),('e',K_e),('nu',K_nu)]:
        ev,V=frame(K); vals[s]=np.sqrt(np.maximum(ev,0)); F[s]=V
    CKM=F['u'].conj().T@F['d']; PMNS=F['e'].conj().T@F['nu']
    a=np.abs(PMNS); s13=a[0,2]**2
    return {
      'x':x.tolist(),'norms':[float(np.linalg.norm(x[:5])),float(np.linalg.norm(x[5:9])),float(np.linalg.norm(x[9:]))],
      'CKM':np.abs(CKM).tolist(),'JQ':jarl(CKM),'PMNS':a.tolist(),'JL':jarl(PMNS),
      'angles':[float(a[0,1]**2/(1-s13)),float(a[1,2]**2/(1-s13)),float(s13)],
      'spectra':{s:(vals[s]/vals[s][-1]).tolist() for s in names},
      'colour_gram_spread_up':float(max(np.linalg.norm(Ku[i]-K_u) for i in range(3))),
      'colour_gram_spread_dn':float(max(np.linalg.norm(Kd[i]-K_d) for i in range(3))),
      'circuit_singular_up':(np.linalg.svd(Mu,compute_uv=False)/np.linalg.svd(Mu,compute_uv=False)[0]).tolist(),
      'circuit_singular_dn':(np.linalg.svd(Md,compute_uv=False)/np.linalg.svd(Md,compute_uv=False)[0]).tolist(),
    }

out={'audits':{'orth_up':orth_up,'orth_dn':orth_dn,'weyl_up':weyl_up,'weyl_dn':weyl_dn},'Sup':Sup.tolist(),'Sdn':Sdn.tolist(),'results':{}}
for lab,eta in [('delta',eta_delta),('conf',eta_conf)]:
    out['results'][lab]={}
    for norm in ['declared','stiffness']:
        out['results'][lab][norm]={}
        for wn,wgt in [('gamma',gamma),('per16',1/16),('one',1.0)]:
            print('solve',lab,norm,wn,flush=True)
            val,x=solve(eta,norm,wgt); o=observe(x,norm); o['action']=val
            out['results'][lab][norm][wn]=o
            print('norms',o['norms']);print('CKM',np.array(o['CKM']));print('angles',o['angles'],'J',o['JQ'],o['JL'])
Path('/mnt/data/gauge_preserving_exterior_q_results.json').write_text(json.dumps(out,indent=2))
print('saved')
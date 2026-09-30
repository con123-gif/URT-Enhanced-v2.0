from __future__ import annotations
import math,json,sys
import numpy as np
from scipy.linalg import polar
sys.path.insert(0,'/mnt/data');import active_core as ac
ns={};exec(open('/mnt/data/run_endpoint_test.py').read().split('# torch constants')[0],ns)
E3,E5=np.asarray(ns['E3']),np.asarray(ns['E5']);charges={k:np.asarray(v) for k,v in ns['charges'].items()};gcov=ns['gcov'];Delta=float(ns['Delta']);eta=float(ns['eta_delta'])
J5,J43,J45=np.asarray(ac.J5),np.asarray(ac.J43),np.asarray(ac.J45)
def vm(v):return np.asarray(v).reshape(3,3).T
def qterm(s,chi):
 q=charges[s];g=np.asarray(gcov(q));return vm(J43@(E3@q/3)+1j*chi*(J45@(Delta*(E5@g)/5)))
def sg(a,b,chi):return vm((J5@ac.shell5[a,b])/7+(J43@ac.shell3[a,b])/3+1j*chi*(J45@ac.shellh5[a,b])/5)
def dg(a,b,chi):return vm((J43@ac.dual3[a,b])/3+1j*chi*(J45@ac.dual5[a,b])/5)
def up3(M):
 U,_=polar(M);return U*np.exp(-1j*np.angle(np.linalg.det(U))/3)
def lift_raw(M):
 Z=np.zeros((3,3),complex);return np.block([[Z,M.conj().T],[M,Z]])
def lift_unitary(M):
 U=up3(M);Z=np.zeros((3,3),complex);return np.block([[Z,U.conj().T],[U,Z]])
def graph(n,geom,chi):
 nbr=[];tr={}
 for a in range(n):
  row=[];vals=[]
  for b in range(n):
   G=geom(a,b,chi) if a!=b else np.zeros((3,3))
   if a!=b and np.linalg.norm(G)>1e-12:row.append(b);vals.append(float(np.linalg.norm(G,'fro')**2))
  z=sum(vals)
  for b,v in zip(row,vals):tr[a,b]=v/z
  nbr.append(row)
 return nbr,tr
def paths(nbr,L=6):
 o=[]
 for s in range(len(nbr)):
  def rec(p):
   if len(p)==L:
    if s in nbr[p[-1]]:o.append(tuple(p+[s]));return
   else:
    for b in nbr[p[-1]]:rec(p+[b])
  rec([s])
 return o
def hpair(a,b,chi):
 n=np.ones(3)/math.sqrt(3);qa,qb=charges[a],charges[b];h=float(qa@qb)+1j*chi*float(n@np.cross(qa,qb));return h/abs(h)
def sector_pair(sa,sb,n,geom,chi,eta_use):
 nbr,tr=graph(n,geom,chi);P=paths(nbr);ha=hpair(sa,sb,chi);qta=qterm(sa,chi);qtb=qterm(sb,chi)
 eraw_a={};eraw_b={};euni_a={};euni_b={}
 for a in range(n):
  for b in nbr[a]:
   Ma=geom(a,b,chi)+qta;Mb=geom(a,b,chi)+qtb
   eraw_a[a,b]=lift_raw(Ma);eraw_b[a,b]=lift_raw(Mb);euni_a[a,b]=lift_unitary(Ma);euni_b[a,b]=lift_unitary(Mb)
 Ws=[];LP=[];AA=[];AB=[]
 for path in P:
  Ua=np.eye(6,dtype=complex);Ub=np.eye(6,dtype=complex);Aa=np.eye(6,dtype=complex);Ab=np.eye(6,dtype=complex);lp=-math.log(n)
  for a,b in zip(path[:-1],path[1:]):
   Ua=euni_a[a,b]@Ua;Ub=euni_b[a,b]@Ub;Aa=eraw_a[a,b]@Aa;Ab=eraw_b[a,b]@Ab;lp+=math.log(tr[a,b])
  # Six links return to the same Galois sheet; use the unprimed block.
  Uarel=Ua[:3,:3]; Ubrel=Ub[:3,:3]
  rel=Uarel.conj().T@Ubrel
  W=-float(np.real(ha*np.trace(rel)/3))
  Ws.append(W);LP.append(lp);AA.append(Aa[:3,:3]);AB.append(Ab[:3,:3])
 Ws=np.asarray(Ws);LP=np.asarray(LP);logw=LP-eta_use*Ws;m=float(logw.max());w=np.exp(logw-m);p=w/w.sum()
 Aae=sum(pi*A for pi,A in zip(p,AA));Abe=sum(pi*A for pi,A in zip(p,AB))
 def frame(A):
  ev,V=np.linalg.eigh(A.conj().T@A);ix=np.argsort(ev);return np.sqrt(np.maximum(ev[ix],0)),V[:,ix]
 xa,Va=frame(Aae);xb,Vb=frame(Abe);Mix=Va.conj().T@Vb
 F=-(m+math.log(float(w.sum())))/eta_use
 return {'F':F,'count':len(P),'Wmean':float(p@Ws),'hphase':float(np.angle(ha)),'spec_a':(xa/max(xa)).tolist(),'spec_b':(xb/max(xb)).tolist(),'mix':Mix}
def J(V):return float(np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0])))
def ang(U):
 A=np.abs(U);s13=A[0,2]**2;return {'s12':float(A[0,1]**2/(1-s13)),'s23':float(A[1,2]**2/(1-s13)),'s13':float(s13)}
def run(route_depth=False):
 out=[]
 for chi in (1,-1):
  eq=ac.eta_Q if route_depth else eta;el=ac.eta_L if route_depth else eta
  q=sector_pair('u','d',6,sg,chi,eq);l=sector_pair('e','nu',10,dg,chi,el);V=q.pop('mix');U=l.pop('mix')
  out.append({'chirality':chi,'F':q['F']+l['F'],'quark':q,'lepton':l,'CKM_abs':np.abs(V).tolist(),'J_CKM':J(V),'PMNS_abs':np.abs(U).tolist(),'J_PMNS':J(U),'angles':ang(U)})
 return {'route_depth':route_depth,'eta_delta':eta,'eta_Q':ac.eta_Q,'eta_L':ac.eta_L,'branches':out,'selected':min(out,key=lambda x:x['F'])}
r={'universal_eta':run(False),'route_eta':run(True)}
print(json.dumps(r,indent=2));open('/mnt/data/urtfinish/oriented_joint_wilson_typed_results.json','w').write(json.dumps(r,indent=2))
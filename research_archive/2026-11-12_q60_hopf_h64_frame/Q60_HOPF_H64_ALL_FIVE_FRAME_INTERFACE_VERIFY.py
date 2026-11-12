#!/usr/bin/env python3
"""Q60: original all-five/H64 hidden source -> new Hopf/2I four-sector isometry.
A fixed proper icosahedral face-frame is audited; local U(1) source join is NOT selected.
"""
import argparse,runpy,contextlib,io,itertools
from pathlib import Path
import numpy as np
p=argparse.ArgumentParser()
p.add_argument('--old-reconstruction');p.add_argument('--hopf-reconstruction');opt=p.parse_args()
ROOT=Path(__file__).resolve().parents[2]
nov7=ROOT/'research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py'
q55=ROOT/'research_archive/2026-11-12_q55_hopf_wilson/Q55_HOPF_WILSON_CHARGED_OPERATOR_VERIFY.py'
with contextlib.redirect_stdout(io.StringIO()):
 old=runpy.run_path(str(Path(opt.old_reconstruction) if opt.old_reconstruction else nov7))
 hopf=runpy.run_path(str(Path(opt.hopf_reconstruction) if opt.hopf_reconstruction else q55))
if opt.hopf_reconstruction:
 D=hopf
 def get_TH(n):
  b=D['Bl'][n%10];F=D['F'];P=D['P3']+D['P5']
  return b.conj().T@F@P,b.conj().T@D['L']@b
else:
 D=hopf['d']
 def get_TH(n):
  H,T,W,K,E=hopf['results'][n]
  return T,H
old_geom=old['geom']['icosahedron']
oldverts=np.asarray(old_geom['points']);oldverts=oldverts/np.linalg.norm(oldverts,axis=1,keepdims=True)
newverts=np.asarray(D['verts'])
oldfaces=np.asarray([np.mean(old_geom['points'][f],axis=0) for f in old_geom['faces']]);oldfaces/=np.linalg.norm(oldfaces,axis=1,keepdims=True)
newfaces=np.asarray(D['faces'])
assert oldverts.shape==newverts.shape==(12,3)
assert oldfaces.shape==newfaces.shape==(20,3)
Uh=old['Uh'];P3=old['P3'];P5=old['P5'];Ph=P3+P5
assert Uh.shape==(64,20) and np.linalg.norm(Uh.T@Uh-Ph)<1e-11
choices=[]
for perm in itertools.permutations(range(3)):
 for signs in itertools.product((-1,1),repeat=3):
  R=np.eye(3)[list(perm)]*np.asarray(signs)[:,None]
  if np.linalg.det(R)<0:continue
  dv=np.linalg.norm((oldverts@R.T)[:,None,:]-newverts[None,:,:],axis=2)
  if np.max(np.min(dv,axis=1))>1e-7:continue
  df=np.linalg.norm((oldfaces@R.T)[:,None,:]-newfaces[None,:,:],axis=2)
  ids=np.argmin(df,axis=1)
  if len(set(map(int,ids)))!=20 or np.max(np.min(df,axis=1))>1e-7:continue
  J=np.zeros((20,20));J[ids,np.arange(20)]=1
  if np.linalg.norm(J@P3@J.T-D['P3'])>1e-10:continue
  if np.linalg.norm(J@P5@J.T-D['P5'])>1e-10:continue
  choices.append((perm,signs,R,J))
assert choices,'native Hopf-to-original face frame not found'
perm,signs,R,J=choices[0]
assert np.linalg.norm(J.T@J-np.eye(20))<1e-12
print('FRAME_PERM',perm,signs,'FACE_MATCH',np.argmax(J,axis=0).tolist(),'VALID_FRAMES',len(choices))
P8=Uh@Ph@Uh.T
M={};H={}
for n in (2,-2,4,-4):
 T,HopfL=get_TH(n)
 M[n]=T@J@Uh.T
 H[n]=HopfL
 assert M[n].shape==(12,64) and np.linalg.norm(HopfL@M[n]-15*M[n])<3e-10
Mfull=np.vstack([M[n] for n in (2,-2,4,-4)])
projector=Mfull.conj().T@Mfull
kinetic=sum(M[n].conj().T@H[n]@M[n] for n in (2,-2,4,-4))
assert np.linalg.matrix_rank(projector,tol=1e-9)==8
assert np.linalg.norm(projector-P8)<1e-10
assert np.linalg.norm(kinetic-15*P8)<1e-9
v50=old['Eglobal']@(np.eye(8)[0]+np.eye(8)[3])
h3,h5=old['hidden_source'](v50)
Delta=old['Delta']
b=Uh@(h3+Delta*h5)
charged=Mfull@b
norm=np.vdot(b,b).real
chargednorm=np.vdot(charged,charged).real
chargedkin=sum(np.vdot(M[n]@b,H[n]@(M[n]@b)).real for n in M)
assert norm>0 and abs(norm-chargednorm)<2e-10
assert abs(chargedkin-15*norm)<3e-9
print('ORIGINAL_FULL_FIVE_SOURCE',norm,'CHARGED_NORM',chargednorm,'CHARGED_KINETIC',chargedkin)
print('ERROR_PROJECTOR',np.linalg.norm(projector-P8),'ERROR_KINETIC',np.linalg.norm(kinetic-15*P8))
phi=(1+np.sqrt(5))/2
alpha=2*np.pi/phi**2
for n in (2,-2,4,-4):
 defect=np.linalg.norm(M[n]*(np.exp(2j*alpha)-np.exp(1j*n*alpha)))
 if n==2: assert defect<1e-12
 else: assert defect>1e-4
 print('GLOBAL_CHARGE_INTERTWINER_DEFECT',n,defect)
print('Q60_HOPF_H64_FIXED_FRAME_INTERFACE_PASS')

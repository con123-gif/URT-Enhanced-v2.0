#!/usr/bin/env python3
"""Q154 original-v61 finite-momentum charged electromagnetic response at Q152 vacuum.
No Maxwell ansatz, no ARF fitting, no historical Q77; physical photon remains open.
"""
from pathlib import Path
from io import BytesIO
import runpy,urllib.request,hashlib,json,math
import numpy as np
from scipy.linalg import null_space,eigh
from scipy.sparse import csr_matrix

ROOT=Path(__file__).resolve().parents[2]
import argparse
parser=argparse.ArgumentParser()
parser.add_argument('--output-dir',default='/tmp/q154_native_photon_response')
out=Path(parser.parse_args().output_dir);out.mkdir(parents=True,exist_ok=True)
PIN='8941bd77ef73d7962fb540b9f753cad427548fdc'
BLOB='ad746e6f14a5332e8d3b84fb8a2cd46eff65e258'
url='https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+PIN+'/compute/q152-native-physical-hessian-and-newton/outputs/Q152_best_native_gauge_angles.npy'
with urllib.request.urlopen(url,timeout=45) as f:raw=f.read()
assert hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==BLOB
A=np.load(BytesIO(raw),allow_pickle=False)
assert A.shape==(528,) and A.dtype==np.float64
q109=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
q149=ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'
r=runpy.run_path(str(q109));w=runpy.run_path(str(q149))
v61=r['v61'];inc=np.asarray(r['inc'],float);action_grad=r['action_grad'];g0=r['gamma0']
sites=list(v61.SITES);deltas=list(v61.DIRECTIONS);site_index=v61.SITE_INDEX
shape=tuple(v61.LATTICE_SHAPE)
assert shape==(6,2,2,2) and len(sites)==48 and len(deltas)==11
assert np.linalg.matrix_rank(inc)==47 and w['mod2rank']==477
assert len(w['rows'])==3216
start=np.empty((528,4));mid=np.empty((528,4));displacement=np.empty((528,4))
for x in sites:
 for j,d in enumerate(deltas):
  l=11*site_index[x]+j
  start[l]=x;displacement[l]=d
  mid[l]=np.asarray(x)+np.asarray(d)/2
  y=v61.periodic_shift(x,d)
  target=np.zeros(48);target[site_index[x]]+=1;target[site_index[y]]-=1
  assert np.array_equal(inc[l],target)
ri=[];ci=[];val=[]
for i,row in enumerate(w['rows']):
 for j,z in row.items():ri.append(i);ci.append(j);val.append(z)
curl=csr_matrix((val,(ri,ci)),shape=(3216,528))
assert np.max(np.abs(curl@inc))<1e-12
assert np.max(np.abs(curl@displacement))<1e-12
g0action,gradient=action_grad(A)
assert abs(g0action-g0+7389.662520594167)<1e-3
assert np.linalg.norm(gradient)<1e-4 and np.linalg.norm(inc.T@gradient)<1e-6
modes=[(0,0,0,0),(1,0,0,0),(2,0,0,0),(3,0,0,0),
       (0,1,0,0),(0,0,1,0),(0,0,0,1),
       (1,1,0,0),(1,0,1,0),(1,0,0,1)]
def field(n):
 k=2*np.pi*np.asarray(n,float)/np.asarray(shape)
 t=displacement@k/2
 V=displacement*(np.sinc(t/np.pi)*np.exp(1j*(mid@k)))[:,None]
 chi=np.exp(1j*(np.asarray(sites,float)@k))
 err=(np.linalg.norm(V@(-1j*k)-inc@chi)/
     max(1.,np.linalg.norm(inc@chi))) if any(n) else 0.
 assert err<1e-12,(n,err)
 T=np.eye(4) if not any(n) else null_space(k.reshape(1,4))
 U=V@T;M=U.conj().T@U
 assert np.min(np.linalg.eigvalsh(M))>1e-6
 if not any(n):assert np.max(np.abs(curl@U))<1e-10
 return k,U,M,float(err)
def apply_h(V):
 HV=np.zeros(V.shape,complex)
 for j in range(V.shape[1]):
  for part in (0,1):
   v=V[:,j].real if part==0 else V[:,j].imag
   norm=np.linalg.norm(v)
   if norm<1e-12:continue
   e=1e-4/norm
   gp=action_grad(A+e*v)[1];gm=action_grad(A-e*v)[1]
   z=(gp-gm)/(2*e)
   HV[:,j]+=z if part==0 else 1j*z
 return HV
records=[]
for n in modes:
 k,U,M,err=field(n)
 HV=apply_h(U);K=U.conj().T@HV
 Kh=(K+K.conj().T)/2
 eig=eigh(Kh,M,eigvals_only=True)
 assert np.min(eig)>0,(n,eig)
 F=curl@U
 geom=F.conj().T@F;maxwell=eigh((geom+geom.conj().T)/2,M,eigvals_only=True)
 mixing=float(np.linalg.norm(HV-U@np.linalg.solve(M,Kh),'fro')/
              max(1.,np.linalg.norm(HV,'fro')))
 symmetry=float(np.linalg.norm(K-K.conj().T,'fro')/
                max(1.,np.linalg.norm(Kh,'fro')))
 rec={'momentum_index':list(n),'k_squared_lattice':float(sum((2*np.sin(k/2))**2)),
      'transverse_dim':U.shape[1],'exact_gauge_gradient_residual':err,
      'response_eigenvalues_per_link':[float(x) for x in eig],
      'local_Maxwell_geometry_eigenvalues':[float(x) for x in maxwell],
      'momentum_mixing_fraction':mixing,'hermiticity_defect':symmetry}
 records.append(rec)
 print('Q154',n,'source response',np.round(eig,6),'bare Maxwell',np.round(maxwell,6),
       'mixing',mixing,flush=True)
result={'source':'actual native Q109/v61 charged Gaussian action at Q152 stationary flux vacuum',
 'Q152_pinned_state':PIN,'Q152_native_blob':BLOB,
 'geometry':{'links':528,'sites':48,'local_curvature_rank':477,'flat_torons':4},
 'gradient':float(np.linalg.norm(gradient)),
 'ward_residual':float(np.linalg.norm(inc.T@gradient)),
 'all_finite_momentum_transverse_eigenvalues_positive':True,
 'momentum_records':records,
 'model_premise':'conditional equal moving/spatial kinetic coefficients',
 'warning':'6x2x2x2 finite lattice; inhomogeneous flux can mix Fourier momentum; no continuum q->0 extrapolation',
 'physical_massless_photon_derived':False,'physical_alpha_derived':False}
(out/'Q154_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q154 RESULT',json.dumps(result,sort_keys=True),flush=True)

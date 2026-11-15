#!/usr/bin/env python3
"""Q159: original v61/Q106 analytic Bloch current/seagull electromagnetic kernel.

Original Q109 charge-weighted Gaussian Hessian is reproduced in all 48 4D
momentum blocks to ~1e-13, using only 4x4 fermion matrices. Then SAME
model (no fitted parameters) is evaluated on original Wilson geometries
with temporal length 6 and spatial length 2,3,4,5,6. Also proves a REAL
zero of the conditional finite-Gaussian kernel at a continuous spatial
momentum for the original native moving-singlet eigenvalue -2.

This is conditional on original Q109 Gaussian action/kinetic normalization
and v61 inherited Wilson constants, NOT a primitive URT continuum photon.
"""
from pathlib import Path
from io import BytesIO
from itertools import product
from hashlib import sha1
import importlib.util,sys,runpy,argparse,urllib.request,json
import numpy as np
import sympy as sp

ap=argparse.ArgumentParser()
ap.add_argument('--output-dir',default='/tmp/q159_native_continuum')
args=ap.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
ROOT=Path(__file__).resolve().parents[2]
src=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert src.is_file()
spec=importlib.util.spec_from_file_location('q159_original_v61',src)
v61=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=v61;spec.loader.exec_module(v61)
q106=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py'))
assert tuple(v61.LATTICE_SHAPE)==(6,2,2,2)
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
assert q106['multiplicity']==sp.Matrix([4,4,8,12])
assert len(q106['links'])==60

# Exact original moving-operator eigenvalue multiplicities:
# half of each Q106 quaternionic Kramers pair, plus native singlet graph.
scale=np.sqrt(2-2*np.sqrt(5)/5)
weak=[]
for fct,mult in zip(q106['factors'],q106['multiplicity']):
 coef=np.array([float(c) for c in sp.Poly(fct,q106['x']).all_coeffs()])
 roots=np.roots(coef)
 assert max(abs(z.imag) for z in roots)<1e-10
 for z in roots:weak.extend([scale*float(z.real)]*(int(mult)//2))
A30=np.zeros((30,30),int)
for i,j in q106['links']:A30[i,j]=A30[j,i]=1
assert np.count_nonzero(A30)//2==60 and np.all(A30.sum(axis=1)==4)
sing=np.linalg.eigvalsh(A30)
root5=np.sqrt(5)
expected=np.sort(np.array([-2]*10+[1-root5]*3+[-1]*4+[1]*4+[2]*5+
                     [1+root5]*3+[4],float))
assert np.max(abs(sing-expected))<1e-12
mu=np.array(weak+list(sing),float)
assert len(mu)==60
r=float(v61.R_EXACT);m=float(v61.M_EXACT)
gamma,g5=v61.gamma_matrices()
I=np.eye(4,complex) if False else np.eye(4,dtype=complex)
D=np.asarray(v61.DIRECTIONS,float)
F=[];B=[]
for j in range(11):
 if j<3:
  F.append(.5*(gamma[j+1]-r*I))
  B.append(.5*(-gamma[j+1]-r*I))
 else:
  F.append((gamma[0]-I)/16)
  B.append((-gamma[0]-I)/16)
F=np.asarray(F);B=np.asarray(B)

def fermion_p(shape):
 # Exact native v61 anti-periodic temporal spin structure:
 # p_t=2*pi*(n_t+1/2)/6, spatial p=2*pi*n_s/NS.
 for n in product(*(range(t) for t in shape)):
  yield np.array([2*np.pi*(n[i]+(0.5 if i==0 else 0))/shape[i]
                  for i in range(4)])

def h(p):
 e=np.exp(1j*(D@p))
 mat=(3*r+1-m)*I + np.einsum('j,jab->ab',e,F)+\
                          np.einsum('j,jab->ab',e.conj(),B)
 out=g5@mat
 assert np.linalg.norm(out-out.conj().T)<1e-10
 return out

def vertex(p,k):
 e1=np.exp(1j*(D@p))
 e2=np.exp(-1j*(D@(p+k)))
 return 1j*np.einsum('ab,jbc->jac',g5,F*e1[:,None,None]-B*e2[:,None,None])

def seagull(p):
 e=np.exp(1j*(D@p))
 return -np.einsum('ab,jbc->jac',g5,F*e[:,None,None]+B*e.conj()[:,None,None])

def response(shape,n):
 k=2*np.pi*np.asarray(n,float)/np.asarray(shape,float)
 mom=list(fermion_p(shape));volume=len(mom)
 polarization=np.zeros((11,11),complex);min_gap=float('inf')
 for p in mom:
  hp=h(p);hpk=h(p+k);V=vertex(p,k);S=seagull(p)
  for shift in mu:
   ep=np.linalg.eigvalsh(hp+shift*I)
   ek=np.linalg.eigvalsh(hpk+shift*I)
   min_gap=min(min_gap,float(min(np.min(abs(ep)),np.min(abs(ek)))))
   Gp=np.linalg.inv(hp+shift*I)
   Gpk=np.linalg.inv(hpk+shift*I)
   t=np.einsum('ab,ibc,cd->iad',Gpk,V,Gp)
   polarization+=np.einsum('iab,jab->ij',t,V.conj())
   polarization[np.diag_indices(11)]-=np.einsum('ab,jba->j',Gp,S)
 # Original Q109 has SUM of squared charges = 16 across the 96 registry.
 # Current V convention maps momentum k to -k relative to Q157's Fourier
 # link basis: conjugation restores identical complex 11x11 blocks.
 polarization=(16/volume*polarization).conj()
 assert np.linalg.norm(polarization-polarization.conj().T)<1e-6
 return (polarization+polarization.conj().T)/2,min_gap

# Native original Q157b matrix blocks frozen (independently native CI verified).
ref_commit='e76948b0f885e195ae05aa46b12f0ffce6b7473b'
ref_sha='d17d016b7a99e042fc2fba4d209a19bf8ef3297e'
url='https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+ref_commit+'/compute/q157b-native-4d-photon-instability-persist/outputs/Q157_ORIGINAL_4D_HESSIAN_FOURIER_BLOCKS.npz'
with urllib.request.urlopen(url,timeout=45) as f:ref_bytes=f.read()
assert sha1(b'blob '+str(len(ref_bytes)).encode()+b'\0'+ref_bytes).hexdigest()==ref_sha
reference=np.load(BytesIO(ref_bytes),allow_pickle=False)['blocks']
assert reference.shape==(48,11,11)
max_relative=0.;original_gap=None
for n in product(range(6),range(2),range(2),range(2)):
 calc,gap=response((6,2,2,2),n)
 index=np.ravel_multi_index(n,(6,2,2,2))
 err=float(np.linalg.norm(calc-reference[index],'fro')/
           np.linalg.norm(reference[index],'fro'))
 max_relative=max(max_relative,err)
 original_gap=gap
assert max_relative<1e-8,max_relative
print('Q159 ORIGINAL v61 all48 11x11 polarization BLOCK MATCH: relative max',
      max_relative,flush=True)

# Exact thermodynamic spatial gap-crossing proof from native rational v61:
# h(p)^2=E(p)^2 I4; the genuine moving singlet adjacency has mu=-2 (x10).
# At anti-periodic p_t=pi/6 and diagonal spatial p=(s,s,s), E(s)
# continuously crosses 2 as s goes from 0 to pi/2.
rs=sp.Rational(v61.R_EXACT.numerator,v61.R_EXACT.denominator)
ms=sp.Rational(v61.M_EXACT.numerator,v61.M_EXACT.denominator)
co=sp.sqrt(3)/2;sn=sp.Rational(1,2)
E0sq=sp.expand((1-ms-co)**2+sn**2)
E1sq=sp.expand((3*rs+1-ms+(co-sn)/4)**2+3+((sn+co)/4)**2)
assert sp.sign(4-E0sq)==1
assert sp.sign(E1sq-4)==1
assert sum(abs(sing+2)<1e-10)==10
assert abs(float(E0sq)-0.6816043197577927)<1e-11
assert abs(float(E1sq)-4.985561282920486)<1e-11
print('Q159 EXACT IVT GAP CROSSING: E(pi/6,0,0,0)^2<4< E(pi/6,pi/2,pi/2,pi/2)^2,',
      'native moving singlet mu=-2 mult10',flush=True)

# Genuine original matter/gauge polarization on successively larger 4D
# finite spatial lattices. No changed Wilson mass, kinetic or source.
probes=[]
for N in (2,3,4,5,6):
 shape=(6,N,N,N)
 for n in ((0,0,0,0),(0,1,0,0),(1,1,0,0)):
  K,gap=response(shape,n)
  eig=np.linalg.eigvalsh(K)
  rec={'spatial_linear_size':N,'temporal_size':6,'sites':6*N**3,
       'mode':list(n),'spatial_q':float(2*np.pi*n[1]/N),
       'minimum_original_matter_gap':gap,
       'negative_physical_modes':int(np.sum(eig<-1e-6)),
       'smallest_eigenvalue':float(eig[0]),
       'all_eigenvalues':[float(x) for x in eig]}
  probes.append(rec)
  print('Q159 larger-original-Wilson',N,n,'gap',gap,
        'negative',rec['negative_physical_modes'],'smallest',eig[0],flush=True)
assert [p['negative_physical_modes'] for p in probes if p['mode']==[0,1,0,0]]==[4,6,4,4,1]
assert all(p['negative_physical_modes']==0 for p in probes if p['mode']==[0,0,0,0])
result={
 'source':'original native v61 R_EXACT/M_EXACT, gamma, directions, native Q106 30-state charged/moving and original Q157b Fourier response',
 'model_status':'original Q109 Gaussian action with inherited Wilson constants and conditional equal moving/spatial kinetic, NOT primitive URT nature',
 'complete_original_528_Hessian_relative_block_error':max_relative,
 'original_48_site_minimum_shifted_fermion_gap':original_gap,
 'exact_gap_crossing_proved_by_IVT':True,
 'exact_gap_proof':'native sing mu=-2 (mult10); E(pi/6,0,0,0)^2 < 4 < E(pi/6,pi/2,pi/2,pi/2)^2',
 'E0_squared_exact':str(E0sq),'E1_squared_exact':str(E1sq),
 'E0_squared_numeric':float(E0sq),'E1_squared_numeric':float(E1sq),
 'uniform_matter_resolvent_gap_under_spatial_refinement':False,
 'no_uniform_inverse_bound_for_current_conditional_gaussian_action':True,
 'same_Wilson_definitions_spatial_sizes':[2,3,4,5,6],
 'negative_mode_first_spatial_q_sectors':[4,6,4,4,1],
 'mode_records':probes,
 'large_lattice_physical_nonuniform_vacua_recomputed':False,
 'physical_massless_photon_derived':False,
 'unique_URT_time_or_relative_kinetic_selection_derived':False,
}
(out/'Q159_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q159 RESULT',json.dumps({k:v for k,v in result.items() if k!='mode_records'},sort_keys=True),flush=True)

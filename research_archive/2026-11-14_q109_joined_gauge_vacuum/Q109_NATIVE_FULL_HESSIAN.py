#!/usr/bin/env python3
"""Q109 528-link original-v61 Gaussian charged moving determinant.

Uses real Q101 whole-five/H64 and exact Q106 charged Berry spectrum.
Equal moving/spatial kinetic weights + Gaussian Grassmann measure are
explicit CONDITIONAL premises; no observed inputs or old ARF targets.
"""
from pathlib import Path
import importlib.util,sys,runpy,math,os
from scipy.linalg import eigh
from scipy.optimize import minimize_scalar
import numpy as np
ROOT=Path(__file__).resolve().parents[2]
z=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py'))
orig=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py'))
mask={orig['minima'][i][0]:i for i in orig['parts'][0]}
assert set(mask)==set(z['masks'])
for a,b in z['links']:
    assert abs(orig['B'][mask[z['masks'][a]],mask[z['masks'][b]]])==1
print('Original all-five 190-cochain / 50-vertex / H64 source matches Q106: PASS',flush=True)
f=lambda x:float(x[0])+math.sqrt(5)*float(x[1])
pauli=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]],complex)
M=np.zeros((60,60),complex);A=np.zeros((30,30))
for a,b in z['links']:A[a,b]=A[b,a]=1
scale=math.sqrt(2-2*math.sqrt(5)/5)
for a in range(30):
 for b,q in z['nbr'][a]:
    M[2*a:2*a+2,2*b:2*b+2]=scale*(f(q[0])*np.eye(2)+
       1j*np.einsum('j,jkl->kl',[f(x) for x in q[1:]],pauli))
assert np.linalg.norm(M-M.conj().T)<1e-11
spin=np.linalg.eigvalsh(M)
assert np.max(abs(spin[::2]-spin[1::2]))<1e-10
weak=spin[::2];sing=np.linalg.eigvalsh(A)
shift=np.r_[weak,sing]
path=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert path.is_file()
if os.environ.get('Q109_V61_LOCAL_REFERENCE')=='1':
 print('OFFLINE TRANSCRIPTION, NOT ORIGINAL v61 SOURCE: independent CI required',flush=True)
else:
 import hashlib
 print('Original v61 SHA256:',hashlib.sha256(path.read_bytes()).hexdigest(),flush=True)
spec=importlib.util.spec_from_file_location('q109_v61',path)
v61=importlib.util.module_from_spec(spec);sys.modules[spec.name]=v61;spec.loader.exec_module(v61)
g,g5=v61.gamma_matrices();G5=np.kron(np.eye(48),g5);Id=np.eye(192)
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
def hw(theta):return G5@(v61.wilson_operator_from_links(
    np.exp(1j*theta.reshape(48,11)))-float(v61.M_EXACT)*Id)
H0=hw(np.zeros(528));e,V=eigh(H0);VH=V.conj().T
assert np.linalg.norm(H0-H0.conj().T)<1e-11 and min(abs(e))>.8
assert min(abs(e[:,None]+shift[None,:]).ravel())>.008
inv=1/(e[None,:]+shift[:,None]);r1=16*inv.sum(axis=0);r2=16*inv.T@inv
J=np.empty((528,192*192),complex);contact=np.empty(528);inc=np.zeros((528,48))
r=float(v61.R_EXACT)
for l in range(528):
 a,k=divmod(l,11);site=v61.SITES[a]
 b=v61.SITE_INDEX[v61.periodic_shift(site,v61.DIRECTIONS[k])]
 inc[l,a]+=1;inc[l,b]-=1
 forward=.5*(g[k+1]-r*np.eye(4)) if k<3 else (g[0]-np.eye(4))/16
 t=g5@forward*v61.antiperiodic_sign(site,v61.DIRECTIONS[k])
 X=V[4*a:4*a+4,:];Y=V[4*b:4*b+4,:];L=X.conj().T@t@Y
 J[l]=(1j*(L-L.conj().T)).ravel()
 contact[l]=2*np.dot(r1,np.diag(L).real)
assert np.linalg.matrix_rank(inc)==47
absweights=np.sqrt(abs(r2)).ravel()
weighted=J*absweights[None,:]
Hess=np.real((weighted*np.sign(r2).ravel()[None,:])@weighted.conj().T)
Hess=(Hess+Hess.T)/2
Hess[np.diag_indices(528)]+=contact
werr=np.linalg.norm(Hess@inc)
assert werr<max(1e-6,np.linalg.norm(Hess)*1e-9)
levels,vec=np.linalg.eigh(Hess)
threshold=max(abs(levels))*1e-9
negative=int(sum(levels< -threshold));positive=int(sum(levels>threshold));zero=528-positive-negative
assert (positive,negative,zero)==(397,84,47),(positive,negative,zero)
print('FULL 528 native physical spectrum: 397 positive, 84 negative, 47 gauge null; Ward',werr,flush=True)
print('Extreme Hessian eigenvalues',levels[0],levels[-1],flush=True)
face=[((0,0,0,0),0,1),((0,1,0,0),1,1),((0,0,1,0),0,-1),((0,0,0,0),1,-1)]
probe=np.zeros(528)
for site,k,sgn in face:probe[11*v61.SITE_INDEX[site]+k]+=sgn
assert np.linalg.norm(inc.T@probe)<1e-12
K=float(probe@Hess@probe)
assert abs(K-1746.6696095963016)<1e-5
print('Physical closed-plaquette induced contact+current K',K,flush=True)
# The 96 original Q16 particle + conjugate charges, split equally
# into weak-moving and singlet-moving sectors, total q^2=16+16.
qs=((1.,3),(2/3,9),(1/3,9),(-1.,3),(-2/3,9),(-1/3,9))
def gamma(theta):
 out=0.
 for q,m in qs:
    eig=np.linalg.eigvalsh(hw(q*theta))
    x=np.abs(eig[:,None]+shift[None,:])
    assert np.min(x)>1e-6
    out-=m*np.log(x).sum()
 return float(out)
g0=gamma(np.zeros(528))
for eps in (0.0002,0.0004):
 fd=(gamma(eps*probe)+gamma(-eps*probe)-2*g0)/eps**2
 assert abs(fd-K)<.02
 print('Independent all-charge logdet FD epsilon',eps,'curvature',fd,flush=True)
# All charge representations are conjugate paired, so Gamma[A]=Gamma[-A].
v=vec[:,0].real
assert np.linalg.norm(inc.T@v)<1e-9
assert abs(gamma(.3*v)-gamma(-.3*v))<1e-6
obj=lambda t:gamma(t*v)-g0
assert obj(.01)<0
# Bracketing (0.3,0.5,0.8) is NOT guaranteed to surround a minimum:
# an earlier original-native CI run raised ValueError before checking physics.
# A positive nonzero descent is sufficient for the scoped instability result;
# bounded minimization is robust to different eigenvector orientations.
fit=minimize_scalar(obj,bounds=(0.,1.5),method='bounded',
                    options={'xatol':1e-8,'maxiter':200})
assert fit.success and fit.x>1e-8 and fit.fun<-1
# Check whether the line minimizer is interior before using the word extremum.
interior=(fit.x>1e-5 and fit.x<1.5-1e-5)
if interior:
    diff=(obj(fit.x+1e-4)-obj(fit.x-1e-4))/(2e-4)
    assert abs(diff)<.1,('line derivative',diff)
print('Nonzero one-line bounded descent amplitude',fit.x,'DeltaGamma',fit.fun,
      'interior_stationary',interior,flush=True)
print('Q109 CONDITIONAL JOINED 528 GAUGE DETERMINANT: PASS')
print('Still missing unique relative kinetic normalization + stable full-spatial vacuum + continuum physical source.')

#!/usr/bin/env python3
"""Newton-Scale all-five-solids Planck PR3 full-covariance joint screening.
The templates are phenomenological sine waves in ln(ell), NOT primordial
sine waves in ln(k). Full covariance and official Planck best-fit Dl.
"""
import os, json, math, hashlib, urllib.request
from pathlib import Path
import numpy as np
from scipy.io import FortranFile
from scipy.linalg import cho_factor, cho_solve
from scipy.stats import chi2

DEST=Path("newton-scale/data-planck")
DEST.mkdir(parents=True,exist_ok=True)
BASE="https://raw.githubusercontent.com/heatherprince/planck-lite-py/master/data/planck2018_plik_lite/"
P={"cl_cmb_plik_v22.dat":BASE+"cl_cmb_plik_v22.dat",
   "c_matrix_plik_v22.dat":BASE+"c_matrix_plik_v22.dat",
   "blmin.dat":BASE+"blmin.dat","blmax.dat":BASE+"blmax.dat",
   "bweight.dat":BASE+"bweight.dat",
   "COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt":
   "https://irsa.ipac.caltech.edu/data/Planck/release_3/ancillary-data/cosmoparams/COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt"}
hashes={}
for name,url in P.items():
    dest=DEST/name
    if not dest.exists():
        request=urllib.request.Request(url,headers={"User-Agent":"Newton-Scale-independent-analysis/1.0"})
        with urllib.request.urlopen(request,timeout=100) as response:
            dest.write_bytes(response.read())
    data=dest.read_bytes()
    hashes[name]={"sha256":hashlib.sha256(data).hexdigest(),"size":len(data),"url":url}

ell,obs,sigma=np.loadtxt(DEST/"cl_cmb_plik_v22.dat",unpack=True)
assert len(ell)==613
mn=np.loadtxt(DEST/"blmin.dat",dtype=int)
mx=np.loadtxt(DEST/"blmax.dat",dtype=int)
wt=np.loadtxt(DEST/"bweight.dat")
data=np.loadtxt(DEST/"COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt")
e=data[:,0].astype(int)
assert np.array_equal(e,np.arange(2,2509))
lens=[215,199,199]; slices=[slice(0,215),slice(215,414),slice(414,613)]
m=[]
for typ,n in enumerate(lens):
    D=data[:,typ+1]
    C=D/(e*(e+1)/(2*np.pi))
    for i in range(n):
        lo,hi=mn[i],mx[i]
        ls=np.arange(lo,hi+1)+30
        m.append(float(wt[lo:hi+1]@C[ls-2]))
model=np.asarray(m)
c=FortranFile(DEST/"c_matrix_plik_v22.dat","r").read_reals(np.float64)
assert c.size==613**2
c=c.reshape(613,613)
# Same convention as PlanckLitePy: trust the stored LOWER triangle.
c=np.tril(c)+np.tril(c,-1).T
assert np.all(np.isfinite(c))
ch=cho_factor(c,lower=True)
res=obs-model
chi0=float(res@cho_solve(ch,res))
phi=(1+np.sqrt(5))/2
ratios={"cube":1/np.sqrt(3),"octahedron":np.sqrt(2/3),
 "dodecahedron":phi**-2,"icosahedron":phi**-1}
beta=np.log(4/3)/(2*np.log(phi))
rng=np.random.default_rng(20261014)
output={"data":hashes,"chi2_baseline":chi0,"n":613,"calibration_not_refitted":True,
 "fixed_bestfit_not_refitted":True,"is_primordial_forward_model":False,
 "four_platonic_length_ratios":ratios,"fixed_envelope_beta":beta,"fits":{}}

def fit(F):
    CF=cho_solve(ch,F)
    gram=F.T@CF
    rhs=F.T@cho_solve(ch,res)
    pars=np.linalg.solve(gram,rhs)
    dchi=float(rhs@pars)
    return {"delta_chi2":dchi,"baseline_chi2":chi0,"parameters":pars.tolist(),
      "naive_p":float(chi2.sf(dchi,F.shape[1]))}

def design(w,mode,shared):
    basis=np.array([np.sin(w*np.log(ell)),np.cos(w*np.log(ell))]).T
    factor=model if "fractional" in mode else np.ones(613)
    if "envelope" in mode:factor*=np.power(ell/300.,-beta)
    x=basis*factor[:,None]
    if shared:return x
    F=np.zeros((613,6))
    for i,sl in enumerate(slices):F[sl,2*i:2*i+2]=x[sl]
    return F

for mode in ("additive","fractional","fractional_envelope"):
 for param in ("shared2","separate6"):
    label=f"{mode}_{param}"
    output["fits"][label]={}
    Fs=[];scores=[]
    for name,s in ratios.items():
        om=2*np.pi/np.log(1/s)
        F=design(om,mode,param=="shared2")
        q=fit(F);q["omega"]=om
        if param=="separate6":
            q["independent_segments"]={}
            for typ,sl in zip(("TT","TE","EE"),slices):
                h=cho_factor(c[sl,sl],lower=True)
                v=F[sl,2*("TT","TE","EE").index(typ):2*("TT","TE","EE").index(typ)+2]
                y=res[sl]
                rv=v.T@cho_solve(h,y)
                gg=v.T@cho_solve(h,v)
                p=np.linalg.solve(gg,rv)
                q["independent_segments"][typ]={"delta_chi2":float(rv@p),
                   "p_2dof":float(chi2.sf(rv@p,2))}
        output["fits"][label][name]=q
        Fs.append(F)
        scores.append(q["delta_chi2"])
    stack=np.column_stack(Fs)
    G=stack.T@cho_solve(ch,stack)
    G=(G+G.T)*0.5
    n=30000
    projections=rng.normal(size=(n,stack.shape[1]))@np.linalg.cholesky(G).T
    d=Fs[0].shape[1]
    improvement=np.zeros((n,4))
    for k in range(4):
        y=projections[:,k*d:(k+1)*d]
        invG=np.linalg.inv(G[k*d:(k+1)*d,k*d:(k+1)*d])
        improvement[:,k]=np.einsum("ij,jk,ik->i",y,invG,y)
    max_null=np.max(improvement,axis=1)
    observed=max(scores)
    output["fits"][label]["global4freq_p_MC"]=float((1+(max_null>=observed).sum())/(n+1))
    output["fits"][label]["max_delta_chi2"]=observed
    output["fits"][label]["MC_trials"]=n
    print(label,[(name,round(output["fits"][label][name]["delta_chi2"],3))
                for name in ratios],
          "global p",round(output["fits"][label]["global4freq_p_MC"],4),flush=True)
Path("newton-scale/PLANCK_JOINT_EMPIRICAL_RESULTS.json").write_text(json.dumps(output,indent=2))
print("RESULT FILE WRITTEN; baseline chi2",chi0)

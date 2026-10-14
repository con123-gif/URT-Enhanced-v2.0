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
mn=np.loadtxt(DEST/"blmin.dat").astype(int)
mx=np.loadtxt(DEST/"blmax.dat").astype(int)
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
    factor=model.copy() if "fractional" in mode else np.ones(613)
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

# Independent data-split predictions with fully conditional Gaussian covariance.
def cross_predict(F,train,hold):
    ct=c[np.ix_(train,train)]
    chold=c[np.ix_(hold,hold)]
    xcov=c[np.ix_(hold,train)]
    tF=F[train]
    hF=F[hold]
    yt=res[train]
    yh=res[hold]
    cc=cho_factor(ct,lower=True)
    tf_ci=cho_solve(cc,tF)
    b=np.linalg.solve(tF.T@tf_ci,tF.T@cho_solve(cc,yt))
    yc=yh-xcov@cho_solve(cc,yt)
    FC=hF-xcov@tf_ci
    ccov=chold-xcov@cho_solve(cc,xcov.T)
    hchol=cho_factor(ccov,lower=True)
    prediction=FC@b
    strength=float(prediction@cho_solve(hchol,prediction))
    matched=float(yc@cho_solve(hchol,prediction))
    gain=2*matched-strength
    z=matched/np.sqrt(strength) if strength>0 else None
    return {"heldout_delta_chi2":float(gain),"matched_filter_z":float(z),
            "prediction_squared_norm":strength,"training_amplitude":b.tolist(),
            "ntrain":len(train),"nhold":len(hold)}

idx=np.arange(613)
temperature=idx[:215]
polarization=idx[215:]
lowTT=temperature[ell[:215]<900]
highTT=temperature[ell[:215]>=900]
output["cross_validation"]={}
for mode in ("fractional","fractional_envelope"):
    output["cross_validation"][mode]={}
    for name,s in ratios.items():
        F=design(2*np.pi/np.log(1/s),mode,True)
        output["cross_validation"][mode][name]={
          "TT_train_pol_test":cross_predict(F,temperature,polarization),
          "pol_train_TT_test":cross_predict(F,polarization,temperature),
          "lowTT_train_highTT_test":cross_predict(F,lowTT,highTT),
          "highTT_train_lowTT_test":cross_predict(F,highTT,lowTT)}
# Family-wise correction for every inspected frequency x template x parameter count.
# Simulate jointly through exact template covariance; shared and separate
# templates span overlapping subspaces and cannot use a naive independent count.
allF=[]
tests=[]
for mode in ("additive","fractional","fractional_envelope"):
    for variant in ("shared2","separate6"):
        label=f"{mode}_{variant}"
        for solid,s in ratios.items():
            F=design(2*np.pi/np.log(1/s),mode,variant=="shared2")
            allF.append(F)
            tests.append({"name":label+"_"+solid,"cols":F.shape[1],
                "observed":output["fits"][label][solid]["delta_chi2"]})
stack=np.column_stack(allF)
G=stack.T@cho_solve(ch,stack)
G=(G+G.T)*.5
v,U=np.linalg.eigh(G)
v=np.maximum(v,0)
rng=np.random.default_rng(20261014+1)
samples=rng.normal(size=(30000,len(v)))@(U*np.sqrt(v)).T
offset=0
minp=np.ones(30000)
observed_min=1.
for test in tests:
    d=test["cols"]
    gs=G[offset:offset+d,offset:offset+d]
    yy=samples[:,offset:offset+d]
    score=np.einsum("bi,ij,bj->b",yy,np.linalg.inv(gs),yy)
    minp=np.minimum(minp,chi2.sf(score,d))
    observed_min=min(observed_min,float(chi2.sf(test["observed"],d)))
    offset+=d
output["all_six_models_4_frequencies"]={
  "tests":24,
  "min_observed_naive_p":observed_min,
  "global_min_p_MC":float((1+(minp<=observed_min).sum())/(len(minp)+1)),
  "null_samples":len(minp),
  "note":"Conditional fixed-baseline Gaussian probability only; not a physical cosmology likelihood"}

Path("newton-scale/PLANCK_JOINT_EMPIRICAL_RESULTS.json").write_text(json.dumps(output,indent=2))
print('HOLDOUT',json.dumps(output['cross_validation'],indent=2))
print('ALL-MODEL FAMILY-WISE',output['all_six_models_4_frequencies'])
print("RESULT FILE WRITTEN; baseline chi2",chi0)

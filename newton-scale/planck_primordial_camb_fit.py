#!/usr/bin/env python3
"""Newton-Scale four-geometry primordial k-feature Planck PR3 test.

This uses CAMB Boltzmann transfer functions to transform an actual primordial
curvature-power modulation sin(omega ln(k/.05)) or cos(...) into TT/TE/EE.
It then fits one common amplitude/phase against full Plik Lite 613x613
covariance. Cosmological/nuisance parameters are frozen (screening only).
Requires pip install numpy scipy camb.
"""
import json, math, hashlib, urllib.request
from pathlib import Path
import numpy as np
from scipy.linalg import cho_factor,cho_solve
from scipy.io import FortranFile
from scipy.stats import chi2
import camb

root=Path("newton-scale/data-planck");root.mkdir(exist_ok=True,parents=True)
url_base="https://raw.githubusercontent.com/heatherprince/planck-lite-py/master/data/planck2018_plik_lite/"
files={"c_matrix_plik_v22.dat":url_base+"c_matrix_plik_v22.dat",
       "cl_cmb_plik_v22.dat":url_base+"cl_cmb_plik_v22.dat",
       "blmin.dat":url_base+"blmin.dat","blmax.dat":url_base+"blmax.dat",
       "bweight.dat":url_base+"bweight.dat",
       "COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt":
       "https://irsa.ipac.caltech.edu/data/Planck/release_3/ancillary-data/cosmoparams/COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt"}
hashes={}
for name,url in files.items():
    p=root/name
    if not p.exists():
        with urllib.request.urlopen(urllib.request.Request(url,headers={"User-Agent":"Newton-Platonic independent Planck analysis"}),timeout=120) as fd:
            p.write_bytes(fd.read())
    hashes[name]=hashlib.sha256(p.read_bytes()).hexdigest()
assert hashes["c_matrix_plik_v22.dat"]=="ad90378c50bd67841764179c90ae6711fa4317c649966ab2b0712143b31e0a32"
assert hashes["COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt"]=="50eecd4422e22026070bdacf9fa8a7e7ef3badf4fa50fffea040df669715cf51"
ell,obs,sig=np.loadtxt(root/"cl_cmb_plik_v22.dat",unpack=True)
mi=np.loadtxt(root/"blmin.dat").astype(int)
ma=np.loadtxt(root/"blmax.dat").astype(int)
wt=np.loadtxt(root/"bweight.dat")
ref=np.loadtxt(root/"COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt")
c=FortranFile(root/"c_matrix_plik_v22.dat","r").read_reals(np.float64).reshape(613,613)
c=np.tril(c)+np.tril(c,-1).T
ch=cho_factor(c,lower=True)
nb=[215,199,199]
def binD(D):
    allc=[]
    for i,n in zip([0,3,1],nb): # CAMB total spectra [TT,EE,BB,TE]
        Cl=np.divide(D[:,i],np.arange(len(D))*(np.arange(len(D))+1)/(2*np.pi),
           out=np.zeros(len(D)),where=np.arange(len(D))>1)
        for j in range(n):
            ls=np.arange(mi[j],ma[j]+1)+30
            allc.append(float(wt[mi[j]:ma[j]+1]@Cl[ls]))
    return np.array(allc)
Dofficial=np.zeros((2509,4))
# file [L,TT,TE,EE,BB,PP], slot CAMB = TT,EE,BB,TE
Dofficial[ref[:,0].astype(int),:]=ref[:,[1,3,4,2]]
model=binD(Dofficial)
res=obs-model
chi0=float(res@cho_solve(ch,res))
phi=(1+np.sqrt(5))/2
ratios={"cube":1/np.sqrt(3),"octahedron":np.sqrt(2/3),
        "dodecahedron":phi**-2,"icosahedron":phi**-1}
par={"H0":67.36,"ombh2":0.02237,"omch2":0.1200,
     "tau":0.0544,"As":2.100549e-9,"ns":0.9649,"mnu":0.06}
cp=camb.CAMBparams()
cp.set_cosmology(H0=par["H0"],ombh2=par["ombh2"],omch2=par["omch2"],
                 tau=par["tau"],mnu=par["mnu"])
cp.InitPower.set_params(As=par["As"],ns=par["ns"],pivot_scalar=0.05)
cp.set_for_lmax(2508,lens_potential_accuracy=1)
cp.set_accuracy(AccuracyBoost=1.3,lSampleBoost=1.3,lAccuracyBoost=1.3)
# Lower thread count for deterministic resource use.
def compute(power):
    if power is None:
        cp.InitPower=camb.initialpower.InitialPowerLaw()
        cp.InitPower.set_params(As=par["As"],ns=par["ns"],pivot_scalar=0.05)
    else:
        cp.set_initial_power_function(power,kmin=1e-6,kmax=2.0,
             N_min=3000,rtol=1e-6,effective_ns_for_nonlinear=par["ns"])
    return camb.get_results(cp).get_cmb_power_spectra(
        cp,CMB_unit="muK",lmax=2508)["total"][:2509,:]
base=compute(None)
reconcile=binD(base)
relative_rms=float(np.sqrt(np.mean(((reconcile-model)/np.maximum(np.abs(model),1e-8))**2)))
print("CAMB reference agreement (RMS relative binned) =",relative_rms,flush=True)
eps=.02
fits={}
Flist=[]
for solid,scale in ratios.items():
    w=2*np.pi/np.log(1/scale)
    fs=[]
    for trig in ("sin","cos"):
        def init(k, trig=trig,w=w):
            f=np.sin(w*np.log(k/.05)) if trig=="sin" else np.cos(w*np.log(k/.05))
            return par["As"]*(k/.05)**(par["ns"]-1)*(1+eps*f)
        cmod=compute(init)
        fs.append((binD(cmod)-reconcile)/eps)
    F=np.column_stack(fs)
    G=F.T@cho_solve(ch,F)
    b=F.T@cho_solve(ch,res)
    pars=np.linalg.solve(G,b)
    dchi=float(b@pars)
    fits[solid]={"omega":float(w),"delta_chi2":dchi,
      "amplitude":float(np.linalg.norm(pars)),
      "phase":float(np.arctan2(pars[1],pars[0])),
      "naive_p_2dof":float(chi2.sf(dchi,2)),
      "parameters":pars.tolist()}
    Flist.append(F)
    print(solid,w,dchi,"A",np.linalg.norm(pars),flush=True)


# Held-out conditional predictions, using a single primordial phase/amplitude.
def cross_predict(F,train,hold,y):
    ct=c[np.ix_(train,train)]
    xc=c[np.ix_(hold,train)]
    cH=c[np.ix_(hold,hold)]
    h=cho_factor(ct,lower=True)
    a=cho_solve(h,F[train])
    pars=np.linalg.solve(F[train].T@a,F[train].T@cho_solve(h,y[train]))
    Y=y[hold]-xc@cho_solve(h,y[train])
    X=F[hold]-xc@a
    cc=cH-xc@cho_solve(h,xc.T)
    chh=cho_factor(cc,lower=True)
    pred=X@pars
    strength=float(pred@cho_solve(chh,pred))
    corr=float(Y@cho_solve(chh,pred))
    return {"delta_chi2_heldout":2*corr-strength,
       "matched_filter_z":corr/np.sqrt(strength) if strength>0 else None,
       "prediction_norm2":strength,"n_train":len(train),
       "n_heldout":len(hold),"train_coeffs":pars.tolist()}
inds=np.arange(613)
T=inds[:215]; Pol=inds[215:]
low=T[ell[:215]<900]; high=T[ell[:215]>=900]
for solid,F in zip(ratios,Flist):
    fits[solid]["heldout"]={
      "TT_to_TE_EE":cross_predict(F,T,Pol,res),
      "TE_EE_to_TT":cross_predict(F,Pol,T,res),
      "lowTT_to_highTT":cross_predict(F,low,high,res),
      "highTT_to_lowTT":cross_predict(F,high,low,res)}
    # Fit exactly the same physical feature using the independent CAMB
    # reference rather than the official Planck minimum-theory baseline.
    alternative=obs-reconcile
    v=F.T@cho_solve(ch,alternative)
    G=F.T@cho_solve(ch,F)
    p=np.linalg.solve(G,v)
    fits[solid]["alternate_CAMB_baseline"]={
       "baseline_chi2":float(alternative@cho_solve(ch,alternative)),
       "delta_chi2":float(v@p),
       "amplitude":float(np.linalg.norm(p))}

# Four-frequency correlated trial correction.
stack=np.column_stack(Flist)
GG=stack.T@cho_solve(ch,stack)
GG=.5*(GG+GG.T)
rng=np.random.default_rng(20261014)
v=rng.standard_normal((50000,8))@np.linalg.cholesky(GG).T
sim=np.zeros((50000,4))
for j in range(4):
    y=v[:,2*j:2*j+2]
    sim[:,j]=np.einsum("bi,ij,bj->b",y,np.linalg.inv(GG[2*j:2*j+2,2*j:2*j+2]),y)
max_score=max(z["delta_chi2"] for z in fits.values())
p=float((1+(np.max(sim,axis=1)>=max_score).sum())/(len(sim)+1))
out={"data_hashes":hashes,"cosmology_frozen":par,"camb_version":camb.__version__,
 "model":"primordial P(k)=As(k/.05)^(ns-1)*[1+A*sin(omega ln(k/.05)+phase)]",
 "epsilon_perturbation":eps,"n_bandpowers":613,"baseline_chi2":chi0,
 "camb_vs_official_model_relative_rms":relative_rms,
 "fits":fits,"four_frequency_global_p":p,"MC_null_draws":len(sim),
 "limitation":"Fixed cosmology and Planck Lite covariance; non-linear lensing and nuisance effects not refit; exploratory physics test"}
Path("newton-scale/PLANCK_PRIMORDIAL_CAMB_RESULTS.json").write_text(json.dumps(out,indent=2))
print("DONE global p",p,flush=True)

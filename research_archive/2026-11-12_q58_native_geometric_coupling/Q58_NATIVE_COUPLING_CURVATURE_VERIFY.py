#!/usr/bin/env python3
"""Q58 — native 190/64/24 coupling-to-Hessian-curvature audit. No fitted constants."""
from pathlib import Path
import contextlib, io, runpy, math
import numpy as np

ROOT=Path(__file__).resolve().parents[2]
SOURCE=ROOT/"research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py"
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(SOURCE))
assert m["D"].shape==(190,190) and m["Eglobal"].shape==(50,8)
assert abs(np.trace(m["D"]@m["D"])-720)<1e-8
assert abs(np.trace(m["D"]@m["D"]@m["D"]@m["D"])-3456)<1e-7
r,theta,delta,eta=m["r"],m["theta"],m["Delta"],m["eta"]
assert 0<delta<1 and eta>0
N=24
Z=[]
for idx in (0,3):
    v=m["Eglobal"]@np.eye(8)[idx]
    z=np.zeros(190)
    for name in m["names"]:
        g=m["geom"][name]
        z[g["offset"]:g["offset"]+g["V"]]=v[g["v_offset"]:g["v_offset"]+g["V"]]
    Z.append(z)
Z=np.asarray(Z)
assert np.linalg.norm(Z@Z.T-np.eye(2))<2e-12
H=m["D"]@m["D"]+m["Cbridge"]
G0=Z@H@Z.T
X=(m["C"]@m["Plinear"]@m["Eglobal"]@np.eye(8)[:,[0,3]]).T
P=[m["P3"],m["P5"]]

def evaluate(q,mode,weight=1):
    """Closed analytic first, second, third derivatives of full reduced action."""
    q=np.asarray(q,float)
    k=2*math.pi*mode/N
    ell1=2-2*math.cos(theta-k)
    ell2=2-2*math.cos(2*(theta-k))
    G=G0+r*r*ell1*np.eye(2)
    alphas=np.array([.25-.5/(18+r*r*ell2),.25-.5/(16+r*r*ell2)])
    assert np.min(alphas)>0
    l=q@X;f=l*l;df=2*X*l[None,:]
    d2f=2*np.einsum("af,bf->abf",X,X)
    es=[];ds=[];d2s=[];d3s=[]
    for s in range(2):
        h=P[s]@f
        dh=(P[s]@df.T).T
        d2h=np.einsum("uf,abf->abu",P[s],d2f)
        t=(1 if s==0 else delta*delta)/4
        es.append(t*(h@h))
        ds.append(2*t*np.einsum("f,if->i",h,dh))
        d2s.append(2*t*(np.einsum("if,jf->ij",dh,dh)+np.einsum("f,ijf->ij",h,d2h)))
        d3s.append(2*t*(np.einsum("ijf,kf->ijk",d2h,dh)+np.einsum("ikf,jf->ijk",d2h,dh)+np.einsum("jkf,if->ijk",d2h,dh)))
    es,ds,d2s,d3s=map(np.asarray,(es,ds,d2s,d3s))
    lw=-eta*es+np.array([0,2*math.log(delta)])
    a=lw.max();p=np.exp(lw-a);p/=p.sum()
    mu=np.einsum("s,si->i",p,ds)
    cov=np.einsum("s,si,sj->ij",p,ds,ds)-np.outer(mu,mu)
    Gf=N*mu
    Hf=N*(np.einsum("s,sij->ij",p,d2s)-eta*cov)
    d=ds[0]-ds[1];D=d2s[0]-d2s[1];pp=p[0]*p[1]
    cov3=pp*(np.einsum("ij,k->ijk",D,d)+np.einsum("ik,j->ijk",D,d)+np.einsum("jk,i->ijk",D,d))
    cum3=pp*(p[1]-p[0])*np.einsum("i,j,k->ijk",d,d,d)
    Cf=N*(np.einsum("s,sijk->ijk",p,d3s)-eta*cov3+eta*eta*cum3)
    beta=4*alphas
    Q=N/2*q@G@q
    V=N*beta@es
    F=N*(math.log1p(delta*delta)-(a+math.log(np.exp(lw-a).sum())))/eta
    value=Q+weight*(V+F)
    grad=N*G@q+weight*(N*np.einsum("s,si->i",beta,ds)+Gf)
    g=N*G+weight*(N*np.einsum("s,sij->ij",beta,d2s)+Hf)
    C=weight*(N*np.einsum("s,sijk->ijk",beta,d3s)+Cf)
    assert np.linalg.eigvalsh(g).min()>0
    v12=C[0,1,:];v11=C[0,0,:];v22=C[1,1,:]
    K=(v12@np.linalg.solve(g,v12)-v11@np.linalg.solve(g,v22))/(4*np.linalg.det(g))
    return float(value),grad,g,C,float(K)

q=np.array([.5,.5])
expected={0:0.00014065859303015473,9:0.0016662017246930267,12:0.000973025157985634}
for mode in (0,9,12):
    val,grad,g,C,K=evaluate(q,mode)
    z=np.exp(2j*math.pi*mode*np.arange(N)/N)[:,None]*(q@Z)[None,:]
    native=m["reduced_action"](z,np.full(N,theta))[0]
    assert abs(val-native)<1e-9,(mode,val,native)
    assert abs(K-expected[mode])<2e-9,(mode,K,expected[mode])
    for idx in (0,1):
        d=np.eye(2)[idx];eps=1e-5
        finite=(evaluate(q+eps*d,mode)[0]-evaluate(q-eps*d,mode)[0])/(2*eps)
        assert abs(finite-grad[idx])<3e-7
        analyticThird=C[:,:,idx]
        finiteThird=(evaluate(q+eps*d,mode)[2]-evaluate(q-eps*d,mode)[2])/(2*eps)
        assert np.linalg.norm(analyticThird-finiteThird)<2e-5
    assert q@grad>0
    assert evaluate(q,mode,0)[-1]==0
    doubled=evaluate(q,mode,2)
    assert doubled[-1]>K
    assert q@doubled[1]>0
    if mode==9:
        Gamma=np.einsum("ad,bcd->abc",np.linalg.inv(g),C)/2
        assert abs(Gamma[0,1,1]-0.3697244442255359)<1e-8
        print("NATIVE_CONNECTION",Gamma[0,1,1],Gamma[1,0,0])
    print("NATIVE_MODE",mode,"CURVATURE_BASE",K,"CURVATURE_DOUBLE",doubled[-1],"NATIVE_ERROR",abs(val-native))

# Primitive URT F_alpha(x)=2x+alpha (mod1) is conjugate to doubling by T_alpha.
# Therefore the golden shift by itself leaves Lebesgue KS entropy at ln(2).
alpha=((1+math.sqrt(5))/2)**-2
for x in [0.0,0.1,0.3,0.7]:
    lhs=(2*(x-alpha)+alpha+alpha)%1
    assert abs(lhs-((2*x)%1))<1e-12
print("URT_AFFINE_SHIFT_KS",math.log(2))
print("Q58_PASS native action, analytic third derivatives, Hessian curvature and golden-shift entropy")

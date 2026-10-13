"""Independent audit: remaining entropy-gravity gates (2026-10-13).

Checks frozen rail instrument, modular energy operator, finite boundary
entropy response, and correct normalization of an area/population
identity. This does NOT prove Einstein dynamics or a physical bounce.
"""
import math
import numpy as np
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(Delta)
p=Delta**2/(1+Delta**2)
h2=lambda q: -q*math.log(q)-(1-q)*math.log(1-q)
P3=np.diag([1.]*4+[0.]*4)
P5=np.eye(8)-P3
I8=np.eye(8)
parent=I8/8
Bp=(P3+Delta*P5)/math.sqrt(1+Delta**2)
Bm=(Delta*P3+P5)/math.sqrt(1+Delta**2)
assert np.allclose(Bp.T@Bp+Bm.T@Bm,I8)
rp0=Bp@parent@Bp.T
rm0=Bm@parent@Bm.T
prp=float(np.trace(rp0)); prm=float(np.trace(rm0))
rp=rp0/prp; rm=rm0/prm
assert abs(prp-0.5)<1e-14 and abs(prm-0.5)<1e-14
assert np.allclose((rp+rm)/2,parent)
def S(x):
    ev=np.linalg.eigvalsh(x)
    return float(-np.sum(ev*np.log(ev)))
mutual=S(parent)-(prp*S(rp)+prm*S(rm))
assert abs(mutual-(math.log(2)-h2(p)))<1e-10
K=eta*(3*P3+5*P5)
C=8*math.pi**2/15
R=1.7
Tprojected=(2*eta/(C*R**4))*P5
rng=np.random.default_rng(2026)
for _ in range(100):
    A=rng.normal(size=(8,8))
    X=(A+A.T)/2
    X-=np.trace(X)*I8/8
    assert np.isclose(np.trace(K@X),C*R**4*np.trace(Tprojected@X))
Y=np.diag([1.,-1.]+[0.]*6)
assert np.isclose(np.trace(K@Y),0)
assert np.isclose(np.trace(Y@Y),2)
rho4=np.eye(4)/4
Z=np.diag([0.5,-0.5,0.,0.])
h=1e-3
s1=(S(rho4+h*Z)-S(rho4-h*Z))/(2*h)
s2=(S(rho4+h*Z)-2*S(rho4)+S(rho4-h*Z))/h**2
assert abs(s1)<1e-10
assert abs(s2+4*np.trace(Z@Z))<1e-5
chi=8*eta*(1+Delta**2)/(1-Delta**2)
# Under equality delta A/(4G)=2eta delta p, dA/dp=8G eta.
# Older candidate printed 8pi G chi/eta; it does not follow from equality.
old_over_correct=math.pi*chi/eta**2
assert abs(old_over_correct-1)>1
Cpop=4*math.pi**2/(15*eta)
dp=Cpop*1e-7
Drel=(p+dp)*math.log((p+dp)/p)+(1-p-dp)*math.log((1-p-dp)/(1-p))
assert Drel>0
print("Delta",Delta,"eta",eta,"pstar",p)
print("daughter entropy",S(rp),"mutual information",mutual)
print("Cpop",Cpop,"dp sample",dp,"relative entropy",Drel)
print("required dA/dp per G",8*eta)
print("2026-10-12 proposed slope / required slope",old_over_correct)
print("fixed I4/4 entropy derivatives",s1,s2)
print("PASS: all independent finite checks")

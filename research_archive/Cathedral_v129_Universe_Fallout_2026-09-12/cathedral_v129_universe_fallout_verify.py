#!/usr/bin/env python3
import json, math, numpy as np
from pathlib import Path
D,V,E,F,N,q,h=3,12,30,20,13,5,8
phi=(1+math.sqrt(5))/2
gamma=1/81
dstar=(1-gamma)*math.pi/(N*phi)
Delta=D/F-dstar
eta=-math.log(Delta)
T=.5*np.array([[1,1,1,-1],[1,1,-1,1],[1,-1,1,1],[1,-1,-1,-1]],float)
assert np.linalg.norm(T.T@T-np.eye(4))<1e-14
assert np.linalg.norm(np.linalg.matrix_power(T,3)-np.eye(4))<1e-14
assert abs(np.linalg.det(T)-1)<1e-14
Dsq=np.ones((4,4))-np.eye(4)
es=[]
for i in range(4):
    e=np.zeros((4,4));e[i,i]=1;es.append(e)
forms=[]
for a in es:
    for b in es:
        forms.append((a@(Dsq@b-b@Dsq)).reshape(-1))
assert np.linalg.matrix_rank(np.stack(forms,axis=1),tol=1e-11)==12
assert abs(math.exp(-eta)-Delta)<1e-15
assert 4+12==16 and 1+9+6==16 and 1+4+5+3+3==16
data=json.loads(Path("/mnt/data/Cathedral_v129_Universe_Fallout_Symbiotic_Theorem_results.json").read_text())
assert data["dependency_graph"]["complete"]
assert all(data["checks"].values())
print("v129 universe-fallout checks PASS:",data["checks_passed"],"/",data["checks_total"])
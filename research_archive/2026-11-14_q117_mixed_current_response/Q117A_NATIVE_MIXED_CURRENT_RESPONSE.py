#!/usr/bin/env python3
"""Q117a: native Q112 selected-clock H64 and Q116 hidden quartet current."""
from pathlib import Path
from contextlib import redirect_stdout
from io import StringIO
import runpy
import numpy as np
import networkx as nx
from scipy.linalg import eigh

root=Path(__file__).resolve().parents[2]
with redirect_stdout(StringIO()):
    q=runpy.run_path(str(root/"research_archive/2026-11-14_q112_native_hidden_clock_leak/Q112_NATIVE_G5_CLOCK_LEAK.py"))
    w=runpy.run_path(str(root/"research_archive/2026-11-14_q116_local_hidden_golden_bridge/Q116_EXACT_LOCAL_WEDGE_BRIDGE.py"))

# Match the two ORIGINAL vertex/face indexing conventions by genuine
# icosahedral graph isomorphism instead of assuming identical numbering.
facesq=[tuple(sorted(map(int,f))) for f in q["ns"].faces]
facesw=[tuple(sorted(map(int,f))) for f in w["faces"]]
assert len(set(facesq))==len(set(facesw))==20
Gq=nx.Graph();Gq.add_nodes_from(range(12))
for f in facesq:
    Gq.add_edges_from(((f[0],f[1]),(f[1],f[2]),(f[0],f[2])))
iso=next(nx.isomorphism.GraphMatcher(w["G"],Gq).isomorphisms_iter())
lookup={f:i for i,f in enumerate(facesq)}
order=[lookup[tuple(sorted(iso[v] for v in f))] for f in facesw]
assert sorted(order)==list(range(20))
P5=np.asarray(q["P5"],float)
assert np.linalg.norm(P5[np.ix_(order,order)]-np.asarray(w["P"],float))<1e-11
Uh=np.asarray(q["Mh"],float)/np.sqrt(2)
P=np.asarray(q["G5"],float)
assert Uh.shape==(64,20) and P.shape==(64,64)
assert np.linalg.norm(Uh@P5@Uh.T-P)<1e-10
assert np.linalg.norm(P5@(Uh.T@Uh)@P5-P5)<1e-10

J=[]
for B in w["stars"]:
    Bb=np.zeros((20,20))
    Bb[np.ix_(order,order)]=np.asarray(B,float)
    j=1j*Uh@P5@Bb@P5@Uh.T
    assert np.linalg.norm(j-j.conj().T)<1e-11
    assert np.linalg.norm(P@j@P-j)<1e-11
    J.append(j)
J=np.asarray(J)
H=np.asarray(w["H"],float)
gram=np.asarray([[np.trace(j@k).real for k in J] for j in J])
assert np.max(abs(gram-2*H))<1e-10
assert np.linalg.norm(J.sum(axis=0))<1e-10
assert sum(np.linalg.eigvalsh(H)>1e-9)==6
print("Original Q112 hidden U_h plus native Q116 oriented current: Gram 2H PASS",flush=True)

Abar=np.asarray(q["Abar"],float)
Hbits=15*np.eye(64)
for a in range(6):
    for b in range(a+1,6):
        mask=(1<<a)|(1<<b)
        for h in range(64):
            Hbits[h,h^mask]-=1
assert np.linalg.norm(Hbits@P-16*P)<1e-10
for c in (0.1,1.,2.):
    K=Hbits+c*Abar-16*np.eye(64)
    eig,V=eigh(K)
    weights=np.einsum("ij,ij->j",V,P@V).real/4
    assert abs(sum(weights)-1)<1e-10
    def heat(s):
        return (V*np.exp(-s*eig)[None,:])@V.T
    def amp(s):
        return float(np.dot(weights,np.exp(-s*eig)))
    for beta,t in ((1.,0.),(1.,0.3),(1.,0.5)):
        Eb,Et=heat(beta-t),heat(t)
        assert np.linalg.norm(P@Eb@P-amp(beta-t)*P)<1e-9
        assert np.linalg.norm(P@Et@P-amp(t)*P)<1e-9
        corr=np.asarray([[np.trace(P@Eb@j@Et@k@P).real/(4*amp(beta))
                            for k in J] for j in J])
        factor=amp(t)*amp(beta-t)/(2*amp(beta))
        assert np.max(abs(corr-factor*H))<1e-9
        assert factor>0
        if t==0.: assert np.max(abs(corr-H/2))<1e-9
        print("c=",c,"t=",t,"scalar factor=",factor,flush=True)
    # Physical expectation uses the NORMALIZED Gibbs state.  The old
    # unnormalized heat can have trace ~e^16 and accumulates roundoff.
    rho=heat(1.)
    rho=rho/np.trace(rho)
    assert np.linalg.norm(rho-rho.T)<1e-11
    assert max(abs(np.trace(rho@j)) for j in J)<1e-10

phi=(1+np.sqrt(5))/2
positive=np.linalg.eigvalsh(H)[-6:]
assert abs(np.sqrt(positive[-1]/positive[0])-phi)<1e-10
print("Zero real-equilibrium one-point current; positive rank6 source correlation: PASS",flush=True)
print("Q117a original Q112/Q116 mixed-current transfer: PASS, physical Wilson coupling OPEN")

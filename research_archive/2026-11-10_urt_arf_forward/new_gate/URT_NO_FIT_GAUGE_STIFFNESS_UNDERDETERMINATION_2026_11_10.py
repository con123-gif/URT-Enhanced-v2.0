#!/usr/bin/env python3
"""A sharp, finite all-five-solid nonuniqueness test.

Holds original URT, 50/90/50 Platonic incidence, U(1) compact charge chart,
and O(N)-local plaquette update fixed. Two unfitted golden-ratio rules both
meet those axioms but yield different physical transverse stiffness.
No measured coupling or historical ARF input used.
"""
import numpy as np, runpy, contextlib, io
from pathlib import Path
root=Path(__file__).resolve().parents[1]
candidates=[root/'forward'/'cathedral_constructed_joint_dynamics_2026_11_07.py',root/'urt_arf_forward_2026_11_09'/'cathedral_constructed_joint_dynamics_2026_11_07.py']
source=next(p for p in candidates if p.exists())
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(source))
G=d['geom'];names=d['names'];phi=d['phi']
# For each Platonic solid, b1: VxE and b2: ExF, satisfying b1 b2=0.
K=np.zeros((90,90));edge_base=0
face_total=0;edge_total=0;vertex_total=0
for name in names:
    g=G[name];b1=g['b1'];b2=g['b2'];V,E=b1.shape;F=b2.shape[1]
    assert np.linalg.norm(b1@b2)<1e-12
    assert np.linalg.matrix_rank(b2,tol=1e-9)==F-1
    K[edge_base:edge_base+E,edge_base:edge_base+E]=b2@b2.T
    edge_base+=E;vertex_total+=V;edge_total+=E;face_total+=F
assert (vertex_total,edge_total,face_total)==(50,90,50)
assert np.linalg.matrix_rank(K,tol=1e-9)==45
w=np.linalg.eigvalsh(K);pos=w[w>1e-8]
assert len(pos)==45 and pos.min()>0
# Gauge invariance: b2^T (A + b1^T lambda) = b2^T A.
rg=np.random.default_rng(5)
for name in names:
    g=G[name];b1=g['b1'];b2=g['b2'];v=rg.normal(size=g['V']);a=rg.normal(size=g['E'])
    flux=b2.T@a;flux_new=b2.T@(a+b1.T@v)
    assert np.linalg.norm(flux-flux_new)<1e-13
# Natural but distinct parameter-free rules use only the pre-existing golden constant.
kappa1=1/phi;kappa2=1/phi**2
assert 0<kappa2<kappa1<1
# Gauge invariant local Wilson plaquette energy S=kappa sum_f(1-cos F_f).
# Its zero-field Hessian is kappa (b2 b2^T), exact.
ratio=(kappa1*pos)/(kappa2*pos)
assert np.allclose(ratio,phi,rtol=1e-13,atol=1e-13)
# For any transverse K eigenvector, covariance scales as 1/kappa.
print('Platonic (vertices,edges,faces):',vertex_total,edge_total,face_total)
print('Hessian rank:',len(pos),'gauge+harmonic kernel:',90-len(pos))
print('kappa(phi^-1):',format(kappa1,'.17g'))
print('kappa(phi^-2):',format(kappa2,'.17g'))
print('transverse stiffness ratio kappa1/kappa2:',format(kappa1/kappa2,'.17g'))
print('unit-charge fixed; both local Wilson U(1) actions positive and gauge invariant')
print('both use one plaquette stencil per face = O(V+E+F) operations')
print('CONCLUSION: O(N), full Platonic geometry, URT seed, gauge invariance and a positive cap do NOT by themselves select electromagnetic stiffness')
print('PASS')

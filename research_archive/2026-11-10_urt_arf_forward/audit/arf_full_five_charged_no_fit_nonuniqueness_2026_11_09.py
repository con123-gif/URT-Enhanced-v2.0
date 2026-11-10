#!/usr/bin/env python3
"""All five Platonic graphs + exact Cathedral charge16: prove unique charge response
is not determined by geometry, golden contraction, gauge covariance, and no fitting.
This constructs two alternative completions, not the user's canonical matter action.
"""
from pathlib import Path
import numpy as np, sympy as sp
source=Path('/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py')
exec(compile(source.read_text().split('rng=np.random.default_rng(20261107)')[0], str(source),'exec'), globals())
A=np.zeros((50,50),complex)
for name,g in geom.items():
    start=g['v_offset']
    for k in range(g['E']):
        i,j=np.flatnonzero(g['b1'][:,k]); i+=start; j+=start
        A[i,j]=1;A[j,i]=1
assert np.trace(A@A)==180 and sum(g['E'] for g in geom.values())==90
assert max(A.sum(axis=0).real)==5
# Physical one-family integer-electron charge normalization.
Q=np.array([2/3,-1/3]*3+[0,-1]+[2/3]*3+[-1/3]*3+[-1,0],float)
assert abs(Q@Q-16/3)<1e-14
ico=geom['icosahedron'];u,v=np.flatnonzero(ico['b1'][:,0])+ico['v_offset']

def response(t):
    D0=13*np.eye(50)-t*A
    G=np.linalg.inv(D0)
    d=np.zeros_like(A);dd=np.zeros_like(A)
    d[u,v]=-1j*t;d[v,u]=1j*t
    dd[u,v]=t;dd[v,u]=t
    chi=float(Q@Q*(np.trace(G@d@G@d)-np.trace(G@dd)).real)
    assert np.linalg.eigvalsh(D0).min()>7
    return chi,D0

results=[]
for power in [1,2]:
    t=phi**(-power)
    chi,D0=response(t)
    exact=lambda n: float(n)
    results.append(dict(power=power,t=t,chi=chi,trD2=np.trace(D0@D0).real))
    assert abs(results[-1]['trD2']-(8450+180*t*t))<1e-10
    # Spatial local U(1) covariance for every primitive charge; the resulting
    # field is on all 50 vertices and 90 links.
    phases=np.arange(50)*0.01
    for q in (-1.,2/3,-1/3):
        Dg=D0.copy()
        for name,g in geom.items():
            start=g['v_offset']
            for col in range(g['E']):
                a,b=np.flatnonzero(g['b1'][:,col])+start
                Dg[a,b]=-t*np.exp(1j*q*(phases[a]-phases[b]));Dg[b,a]=Dg[a,b].conjugate()
        U=np.diag(np.exp(1j*q*phases))
        assert np.linalg.norm(Dg-U@D0@U.conj().T)<1e-12
assert abs(results[0]['chi']-results[1]['chi'])>0.001
# Exact icosahedral resolvent formula for the local edge current.
t=sp.symbols('t',real=True)
spec=[(sp.Integer(5),1),(sp.sqrt(5),3),(-sp.Integer(1),5),(-sp.sqrt(5),3)]
g0=sum(m/(13-t*l) for l,m in spec)/12
g1=sum(m*l/(13-t*l) for l,m in spec)/60
chi=sp.factor(sp.Rational(16,3)*(2*t*t*(g0*g0-g1*g1)-2*t*g1))
for d in results:
    t_exact=((sp.sqrt(5)-1)/2)**d['power']
    assert abs(float(chi.subs(t,t_exact))-d['chi'])<1e-12
print('Full geometry 50 vertices 90 links, physical charge16 Q²=16/3, same Ward symmetry')
for d in results:print('golden contraction',d['power'],'hopping',d['t'],'IR-link-Hessian',d['chi'],'Tr D²',d['trD2'])
print('Difference:',results[0]['chi']-results[1]['chi'])
print('Exact all-five background matter operator trace: Tr D_t²=8450+180t²')
print('Exact local-link determinant Hessian chi(t)=',chi)
print('PASS: both parameter-free candidate completions satisfy the same given symmetry, geometry, charge and contraction conditions, yet have distinct physical responses.')
print('Therefore the specified partial axioms alone do not select the ARF gauge response; the actual canonical matter action must be specified/derived.')

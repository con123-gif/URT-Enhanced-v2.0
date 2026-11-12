import numpy as np, itertools, runpy, io, contextlib, sys
from math import sqrt, pi, e, acosh, sin, cos
sys.argv=["x"]
with contextlib.redirect_stdout(io.StringIO()):
    H=runpy.run_path("research_archive/2026-11-12_hopf_charged_carrier/hopf_charged_carrier.py")
G,mult,zi,names,chars,table,idx,key,qc=H["G"],H["mult"],H["zi"],H["names"],H["chars"],H["table"],H["idx"],H["key"],H["qc"]
phi=(1+sqrt(5))/2
print("=== PATH 2a: 600-cell Laplacian = fibre part + base part, sector by sector ===")
one=idx[key(np.array([1.,0,0,0]))]
nbr=[i for i in range(120) if abs(G[i][0]-phi/2)<1e-9]; assert len(nbr)==12
R=lambda j: (lambda M:(M.__setitem__((np.arange(120),mult[np.arange(120),j]),1),M)[1])(np.zeros((120,120)))
A=sum(R(j) for j in nbr); Af=R(zi[1])+R(zi[9]); Ab=A-Af
assert zi[1] in nbr and zi[9] in nbr
L=12*np.eye(120)-A
om=np.exp(2j*pi/10)
lam={a:12-12*chars[a][nbr[0]]/chars[a][one] for a in names}
print("eigenvalue by 2I irrep:",{a:round(v,4) for a,v in lam.items()})
for n in range(6):
    Pn=sum(om**(n*k)*R(zi[k]) for k in range(10))/10
    ev=np.linalg.eigvalsh((Pn@L@Pn+Pn.conj().T@L@Pn.conj().T).real/2 if False else (Pn.conj().T@L@Pn))
    ev=np.sort(ev[np.abs(ev)>1e-9]) if n else np.sort(np.linalg.eigvalsh(Pn.conj().T@L@Pn))[-12:]
    fib=np.linalg.eigvalsh(Pn.conj().T@(2*np.eye(120)-Af)@Pn); fibv=fib[np.abs(fib)>1e-9]
    m2=4*sin(pi*n/10)**2
    vals=sorted(set(np.round(ev[-12:] if n else ev,6)))
    print(f" charge {n}: fibre term m_n^2=4sin^2(pi n/10)={m2:.6f}; total L levels {vals}; base p^2 levels {[round(v-m2,6) for v in vals]}")
    assert np.allclose(fibv,m2,atol=1e-9) if n else True
print("identity L = (2-A_fibre) + (10-A_base) holds exactly; in each sector E^2 := L gives E^2 = p^2 + m_n^2.")
print("continuum S^3 check: spin-k/2 Laplacian k(k+2) = 4[j(j+1)-n^2/4] + n^2 with j=k/2  (identity)")

print("\n=== PATH 2b: the native history/clock kernel read as a Euclidean action ===")
r=pi/e; th=2*pi/phi**2
E=lambda h: acosh(1+h/(2*r*r))
print(f" r=pi/e={r:.6f}; pole energies per clock tick: E(18)={E(18):.6f}  E(16)={E(16):.6f}  rest beat={E(18)-E(16):.6f}")
print("   K (shared extra kernel, e.g. spatial p^2) | beat(K) | beat/beat0 | lattice 1/gamma = sinh E0/sinh E_K | continuum m/E")
b0=E(18)-E(16)
from math import sinh
for K in (0,1,2,5,10,20,50,100):
    b=E(18+K)-E(16+K); Em=E(17); EK=E(17+K)
    print(f"   {K:5.0f} | {b:.6f} | {b/b0:.6f} | {sinh(Em)/sinh(EK):.6f} | {sqrt(17/(17+K)):.6f}")

print("\n=== PATH 5: is there a geometry-canonical ordering of the six axes? ===")
with contextlib.redirect_stdout(io.StringIO()):
    sys.argv=["x"]
    B=runpy.run_path("research_archive/2026-11-12_gate_b_v61_internal_symmetry/gate_b_v61_internal_symmetry.py") if False else None
# six axes from the icosahedron vertices; A5 as permutations of axes
V=[]
for s1 in (1,-1):
    for s2 in (1,-1):
        V+=[(0,s1,s2*phi),(s1,s2*phi,0),(s2*phi,0,s1)]
V=np.array(V,float)
ax=[];used=set()
for i in range(12):
    if i in used: continue
    j=next(j for j in range(12) if np.allclose(V[j],-V[i])); used|={i,j}; ax.append(i)
def axis_of(v): return next(k for k,i in enumerate(ax) if np.allclose(v,V[i]) or np.allclose(v,-V[i]))
import networkx as nx
Ed=[(i,j) for i in range(12) for j in range(i+1,12) if abs(np.linalg.norm(V[i]-V[j])-2)<1e-9]
auts=list(nx.algorithms.isomorphism.GraphMatcher(nx.Graph(Ed),nx.Graph(Ed)).isomorphisms_iter())
def proper(a):
    Rm=np.linalg.lstsq(V,np.array([V[a[i]] for i in range(12)]),rcond=None)[0]; return np.linalg.det(Rm)>0
A5={tuple(axis_of(V[a[ax[k]]]) for k in range(6)) for a in auts if proper(a)}
assert len(A5)==60
comp=lambda p,q: tuple(p[q[i]] for i in range(6)); inv=lambda p: tuple(sorted(range(6),key=lambda i:p[i]))
Nrm=[p for p in itertools.permutations(range(6)) if all(comp(comp(p,g),inv(p)) in A5 for g in A5)]
print(" normaliser of A5 in S6 has order",len(Nrm),"(= PGL(2,5) = S5)")
def cyc(p):
    seen=set();out=[]
    for i in range(6):
        if i in seen: continue
        c=[i]
        while p[c[-1]]!=i: c.append(p[c[-1]])
        seen|=set(c);out.append(tuple(c))
    return out
six=[p for p in Nrm if len(cyc(p))==1]
print(" 6-cycles in the normaliser:",len(six)," (in A5 itself:",sum(1 for p in six if p in A5),")")
# orderings o: digit i -> axis o[i]; A5 classes of orderings
def cls(o): return min(tuple(g[x] for x in o) for g in A5)
allcls=sorted({cls(o) for o in itertools.permutations(range(6))}); assert len(allcls)==12
# Q45 criterion: A5's unique 5-orbit T on synthemes; exceptional iff pulled-back T contains P1,P3 or P5
def synthemes():
    out=set()
    for p in itertools.permutations(range(6)):
        out.add(frozenset({frozenset(p[0:2]),frozenset(p[2:4]),frozenset(p[4:6])}))
    return out
SY=synthemes(); assert len(SY)==15
act=lambda g,s: frozenset(frozenset(g[x] for x in pr) for pr in s)
orbs=[];left=set(SY)
while left:
    s=next(iter(left)); o={act(g,s) for g in A5}; orbs.append(o); left-=o
print(" A5 orbits on the 15 synthemes: sizes",sorted(len(o) for o in orbs))
T=next(o for o in orbs if len(o)==5)
mk=lambda prs: frozenset(frozenset(p) for p in prs)
P1,P3,P5=mk([(0,1),(2,3),(4,5)]),mk([(0,3),(2,5),(4,1)]),mk([(0,5),(2,1),(4,3)])
def exceptional(o):
    io=inv(o); To={frozenset(frozenset(io[x] for x in pr) for pr in s) for s in T}
    return bool(To & {P1,P3,P5})
exc=[c for c in allcls if exceptional(c)]
print(" exceptional classes by the Q45 syntheme criterion:",len(exc),"of 12")
can=set()
for p in six:
    for start in range(6):
        o=[start]
        for _ in range(5): o.append(p[o[-1]])
        can.add(cls(tuple(o)))
print(" classes of orderings read off the normaliser's 6-cycles:",len(can),"; of these exceptional:",sum(1 for c in can if c in exc))
print(" exceptional classes not from 6-cycles:",len([c for c in exc if c not in can]),"; 6-cycle classes not exceptional:",len([c for c in can if c not in exc]))

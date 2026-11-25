# Fixed odd-prime dyadic stabilization of the strict cohomology
25 November 2026. Human derivation from classical class field theory and Washington's 1978 theorem; no Lean replay, no independent novelty claim, no RH proof. Continues 9c7751fd (exact descent) and eeedab3e (linear character orbits). Read both prior notes. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, Formalism/GaloisCohomology/Statement.lean (Sha, qzTw, shaLen); source absolute-H1 interpretation as in prior descent note. No external preprint imported and no physical gates changed.

## 1. The statement (uniform in positive twist, not in field or coefficient prime)
Fix q,d distinct primes q=3 mod8,d=7 mod16, and an odd prime l. Put K_e=Q(zeta_(2^(e+2)))^+(sqrt(-q),sqrt(-d)), F_e=K_e(mu_l), and M_j=Q_l/Z_l(-j), j>=1. Let S(K,j) be the intrinsic strict kernel in H1(K,M_j): restriction zero on inertia at finite v not over l and on decomposition groups over l. This identifies with source Sha by inflation-restriction for the unramified quotient and transport of compatible places (not independently replayed in Lean).

There exists e0=e0(q,d,l), independent of j, such that restriction is an isomorphism S(K_(e-1),j) -> S(K_e,j) for every e>=e0 and every j>=1. In particular all new odd-primary dyadic sectors are zero beyond e0; if lengths are finite their values stabilize simultaneously for every twist (values can still depend on j). This is a fixed-tower result, not uniform over the changing q,d,l in VWinAt.

## 2. Explicit local stabilization
F_0 has odd conductor dividing lqd, so is disjoint from the real 2-power cyclotomic tower; F_e is its cyclotomic Z_2-extension layer. At l the residue degree of F_0/Q is f in {1,2}: Q(mu_l) is totally ramified there, and the two quadratic local extensions have compositum with residue degree at most 2 (over the odd local prime the unique unramified quadratic accounts for the unramified part). The relative Frobenius at l in the real tower is the class of l^f modulo 2^(e+2) up to sign. Write a=l^f, v=v2(a-s), with s=1 if a=1 mod4 and s=-1 otherwise. Its order in units/{±1} is 2^max(0,e+2-v), by elementary repeated squaring or the lifting-the-exponent identity. Since v<=v2(l^2-1), for e>=v2(l^2-1)-1 the residue degree doubles at step F_e/F_(e-1). No place over l splits at any such step. For l=3 the sufficient threshold is e>=2, for l=7 it is e>=3.

## 3. Residual strict kernel controlled by ordinary class groups plus local defects
The module M_j[l] is one dimensional over F_l, trivial as a G_{F_e}-module because F_e contains mu_l. The exact coefficient sequence 0->M_j[l]->M_j --l-> M_j ->0 shows S(F_e,j)[l] is a quotient of a subspace C_e of H1(F_e,M_j[l]). Define C_e by requiring inertia restriction zero away from l and, at each v|l, restriction in the image of the connecting homomorphism delta_v:M_j^{G_{F_e,v}}/l M_j^{G_{F_e,v}} -> H1(F_{e,v},M_j[l]). Every strict l-torsion class lifts to C_e: outside l the full module has trivial inertia action, so a coboundary restricts to zero as a cocycle; at l exactness supplies delta_v. The kernel of C_e -> direct sum_v im(delta_v) consists of residual homomorphisms unramified everywhere finite and locally zero at l; real-place inertia has order 2 and cannot contribute. By class field theory this kernel embeds in Hom(Cl(F_e),F_l). All maps equivariant under Gal(F_e/F_(e-1)); the action on residual coefficients is trivial as lifts fix mu_l.

At nonsplitting steps, the nontrivial involution fixes every v|l. Its lift in the local decomposition group of F_(e-1) acts on M_j^{G_{F_e,v}} by a cyclotomic scalar congruent to 1 mod l. Thus acts trivially on the quotient modulo l and its connecting image. This quotient is at most one dimensional because local invariants are finite cyclic (local cyclotomic image open, j>0). The local defect space has zero negative eigenspace. Since l odd, taking negative eigenspaces is exact; hence
 dim_Fl S(F_e,j)[l]^- <= dim_Fl Hom(Cl(F_e),F_l)^-
 <= v_l(h(F_e)/h(F_(e-1)))
where the last valuation refers to the l-primary growth, an integer >=0. Indeed norm times extension is multiplication by 2, so ideal extension injects on l-primary groups and identifies the invariant summand (norm/extension also give 1+sigma). This intermediate bound is valid for all j simultaneously, not a bound on full length.

## 4. Eliminate new sectors
Classical Washington theorem: for fixed abelian base F_0 and its cyclotomic Z_p-extension, the l-primary class-number valuation for l!=p is eventually constant. Reference L. C. Washington, The non-p-part of the class number in a cyclotomic Z_p-extension, Invent. Math. 49 (1978), 87-97, DOI 10.1007/BF01399512. Apply p=2. Once h(F_e)'s l-valuation stabilizes and the local threshold is reached, the displayed residual bound is zero for every j. The full strict kernel is l-primary torsion (continuous cocycles from compact profinite groups into discrete torsion modules have finite image). A nonzero negative sector would have nonzero l-torsion. Hence S(F_e,j)^-=0. Restriction K_e->F_e is injective because its degree divides l-1, and is equivariant under the step involution by disjointness of the 2-power real tower from odd conductor base. Thus S(K_e,j)^-=0 too. The earlier prime-to-2 invariant descent identifies its whole module with S(K_(e-1),j).

This does NOT assert a uniform cutoff in q,d,l, or control the stabilized lengths as j grows. Washington's fixed-base theorem cannot be substituted for CorG or CountV without a quantitative bound sufficient for the actual varying host parameters and all-prime sum. Nor does it bound coefficient prime 2. It is a strict strengthening of mere orbit compression for fixed tower, not a solution of the global cancellation inequality. No URT required.

## 5. Executed check
Local CPython exhaustive prime loop l odd<1000, f=1,2, e=0..16: 5678 exact modular Frobenius order/threshold checks passed. Reproduction:
```python
from math import isqrt
def v2(n): return (n & -n).bit_length()-1
def ord_pm(a,e):
 m=1<<(e+2); k=0; a%=m
 while a not in (1,m-1):
  a=a*a%m;k+=1
  assert k<=e
 return 1<<k
n=0
for l in range(3,1000,2):
 if any(l%p==0 for p in range(3,isqrt(l)+1,2)):continue
 for f in (1,2):
  a=l**f;v=v2(a-1 if a%4==1 else a+1)
  for e in range(17):
   o=ord_pm(a,e);assert o==1<<max(0,e+2-v)
   if e>=v2(l*l-1)-1:assert e>=1 and o==2*ord_pm(a,e-1)
   n+=1
assert n==5678
```
This validates the finite arithmetic part only. No class groups computed, no CI or Lean kernel run. RESUME HERE: find quantitative class-group stabilization bounds uniform in q,d,l or a direct length bound; compare the required x-window scaling before pursuing this route further. If not adequate, resume the native CorG inequality rather than translating more abstract adapters. HANDOFF TO math, Galois, audit, editor.

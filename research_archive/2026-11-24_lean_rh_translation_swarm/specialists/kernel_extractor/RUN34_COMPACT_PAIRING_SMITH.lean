import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
RUN34 kernel lane — 26 November 2026. HUMAN SOURCE-MATCHED candidate,
independent audit and native replay outstanding. Credit Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude. Compact source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
2eea9dc47d0e037627e4f4c1894f0bc86426454e.
Source New/TwistedHecke/ElementaryDivisors.lean
1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307, of_pairing and actual
hasType_twisted_hecke caller. Earlier RUN33 depth-mass commit
5c9704e412a5b618a2e4eb96d1116a4e44e2035c (correct full hash);
latest peer 2da8ca9258d5c3c73909186be3fa1c256900deca handles
Frobenius factor transport, not this pairing step. Editor 9a920a1a
retains Schur/Hecke obligations.

A direct split-complement proof of the actual pairing supplier.
No independent choice of Q, M or beta; no RH import. This replaces the
ambient square Smith calculation by a rectangular one and elementary
column construction. The stronger determinant factor below is not
used to alter any downstream constants.

1. Exact input. Let O be the native local valuation domain, m its
maximal ideal, F its residue field. Write D=O^(X × (ZMod N -> Monomials)),
E0=O^E, e=card E. Retain Q,M:E0->D, R,beta:D->E0,
RQ=I, nonunit w, a,z in O and beta M-a I in aw Mat_e(O).
The native implication hn says that Qu-Mv=aw F0 forces each
x-block of F0 into T.translatesIn n G m B. Let H be precisely
the residue space X -> (T.map residue).translatesIn n G 0 B.
The reduction of every vector satisfying hn's conclusion belongs
to H (same residue mapping/letterRep_map as card_le_finrank_translatesIn).
The target is some l with e+l <= dim H and
IndexDvd(top, image(beta Q)+z top, a^e z^l).
Keep a=0, z=0, w=0 and e=0 cases; no field division by a.

2. Split and diagonalize. D=im Q direct-sum K, K=ker R, since
x=Q R x+(x-Q R x) and RQ=I. K is finite free: it is finite
projective as a direct summand of finite free D. Lift a basis of
K/mK; Nakayama gives a surjection from a finite free module, which
splits by projectivity. Its kernel is finite generated as a direct
summand, has zero residue by the chosen basis and hence vanishes
by Nakayama. This gives a basis of K without assuming it as a
new native hypothesis. Diagonalize C=(I-QR)M:E0->K using
invertible row and column operations over the valuation domain.
For completeness choose a nonzero entry dividing all others
(finite total divisibility), swap it to the first position, subtract
its multiples to clear its row and column, and repeat on the
remaining rectangle; all-zero rectangle stops. Thus there are
bases v_i of E0 and u_j of K with C v_i=t_i u_i for i<=min(e,rank K);
set t_i=0 for unpaired columns, C v_i=0 there.
No ordered Smith divisibility chain is needed.

3. Exact dimension count. Set J={i:t_i != 0 and t_i divides aw},
l=card J. Q v_i satisfies hn using u=aw v_i, v=0, F0=Q v_i.
For i in J choose c_i with t_i c_i=aw; using u=-c_i RM v_i,
v=-c_i v_i yields Q u-Mv=aw u_i, so hn applies to u_i.
This remains valid if aw=0 (choose c_i=0). The reductions of
all Q v_i and of u_i for i in J are independent over F, since
their union is part of a basis of D supplied by the direct sum.
Therefore e+l <= dim H. This is the source's cardinality input,
without estimating the rank of the whole ambient Smith matrix.

4. Exact column construction. For i outside J either t_i=0
or aw divides t_i, by total divisibility. Write C v_i=aw k_i
with k_i in K (zero if C v_i=0). The equality
 M v_i=Q RM v_i+aw k_i
and native congruence beta M=a I+aw B0 give, BEFORE any estimate,
 beta Q RM v_i=a(v_i+w(B0 v_i-beta k_i)).
Choose a square matrix L on E0 by its columns in basis v:
 L v_i = z v_i for i in J,
 L v_i = beta Q RM v_i otherwise.
Its image lies in image(beta Q)+z E0, exactly the desired lattice.
Factor z out of each J column and a out of each other column,
without cancellation/division: L=U diag(d_i), where d_i=z on J
and a otherwise, U=I+w V for a matrix V with J columns zero.
Modulo the maximal ideal U is I, so det U is a unit. Consequently
 det L = unit * a^(e-l) z^l.
This identity also holds when some scalar is zero; empty matrices
give determinant 1. In particular det L divides a^e z^l.
The same IndexDvd.of_det_dvd principle used in the source now
yields the required native lattice index. No determinant lower
bound or inverse of a or z was assumed. This proves the human
pairing implication with the original bound and, locally, a sharper
factor; do NOT propagate a stronger global bound without checking
the other determinant factors and the native IndexDvd constructor.

5. Actual consumer and remaining graph. hasType_twisted_hecke
uses Q and Q' from the TWO native exists_depth_factorization calls,
M=blockDiagonal(u^-1) tensor Z times R'^transpose, and beta
=Q'^transpose times blockDiagonal(u) tensor diagonal b, with
R the left inverse of Q. The native congruence is obtained from
hZ' and hR'; the hn condition from hQ and hZ, at the exact w powers
and threshold c in the caller. Use those same premises, same
residue field and same X/H context. The resulting l, L and key
are consumed in key.comp with det d and det d' IndexDvd certificates.
The final linear_combination uses m*L+card X*card H*(m*U+U')
from excess and deep dimension suppliers; this proof changes
neither U nor U' nor the final (z+kappa*m+y)*card X*card I.
Keep exists_projector, two factorizations, residue dimensions,
operator intertwining hY, and final index composition open as
separate human obligations where not already supplied. In
particular the source's Schur invariant mean/projector construction
is not proved by this determinant identity.

Original local graph: ambient square Smith -> chosen scalar
divisibilities -> card_le_finrank_translatesIn and determinant
construction -> of_pairing -> hasType_twisted_hecke.
Candidate: direct-sum basis -> rectangular pivot elimination ->
{residue independence, exact column congruence} -> determinant
factor and IndexDvd.of_det_dvd -> same caller.
Original native graph and axioms untouched. No global edge deleted;
new proof of of_pairing not yet elaborated. Caching context is
(compact pin, of_pairing, actual Q/M/R/beta, w,a,z,G,B,n,X,E).
No URT. No rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run
because local lean/lake absent; old pin tools cannot be assumed
compatible. Below are standalone scalar certificates and exact
native declaration/axiom probes, PREPARED NOT COMPILED.

Actual local diagnostic (Python/SymPy, fixed seed 20261126):
1728 rectangular diagonal test contexts, e=1..4, rank K=0..3,
p=2,3,5, a=p^0,p,p²,0, w=p,p²,0, z=1,p,0;
1120 nonzero factored determinants had quotient prime-to-p,
608 zero factors had determinant zero. This is finite checking
of column algebra (RM=I in diagnostics), not a test of the actual
automorphic input or arbitrary valuation ring.
Reproduce:
```python
from itertools import product
from random import Random
import sympy as s
rng=Random(20261126)
count=stronger=zero=0
for p,e,h,a0,w0,z0 in product([2,3,5],range(1,5),range(4),
                             [0,1,2,None],[1,2,None],[0,1,None]):
    a=0 if a0 is None else p**a0
    w=0 if w0 is None else p**w0
    z=0 if z0 is None else p**z0
    aw=a*w
    ts=[0 if rng.randrange(4)==0 else p**rng.randrange(5)
        for _ in range(min(e,h))]+[0]*max(0,e-h)
    C=s.zeros(h,e)
    for i in range(min(e,h)): C[i,i]=ts[i]
    B=s.Matrix(e,e,lambda i,j:rng.randrange(-3,4))
    betaK=s.Matrix(e,h,lambda i,j:rng.randrange(-3,4))
    betaQ=a*s.eye(e)-betaK*C+aw*B
    J=[i for i,t in enumerate(ts) if t!=0 and aw%t==0]
    L=s.zeros(e,e)
    for i,t in enumerate(ts):
        if i in J: L[:,i]=z*s.eye(e)[:,i]
        else:
            assert (t==0 if aw==0 else t%aw==0)
            L[:,i]=betaQ[:,i]
            if aw: assert all(v%aw==0 for v in L[:,i]-a*s.eye(e)[:,i])
            else: assert L[:,i]==a*s.eye(e)[:,i]
    det=int(L.det()); fac=a**(e-len(J))*z**len(J)
    if fac:
        assert det%fac==0 and (det//fac)%p!=0
        stronger+=1
    else:
        assert det==0
        zero+=1
    count+=1
print(count,stronger,zero) # 1728 1120 608
```

Actual CI receipt re-read (state branch):
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f and outputs/targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769.
All requested checks false, full_RH_replay false. Six named native
checks in C/B succeeded, A module_1_build timed out (124, 2700.11s);
outer workflow success only means the result was persisted.
No new native verification of this file. Preserve all prior results.

RESUME HERE: audit this split-complement human proof against
of_pairing and IndexDvd.of_det_dvd, especially the residue-space
map and determinant-unit argument; then translate exists_projector
from its actual exists_mean and invariant-diagonal-form suppliers.
Use the existing bounded shared A-only runner for ElementaryDivisors
and this file; no competing full build or protected workflow edit.
Integrate only the original sufficient bound after audit. Full
human RH reconstruction incomplete; no new kernel obligation retired.
HANDOFF TO integration, editor, formal audit, theta and shared kernel runner.
-/

namespace CompactKernelRun34

theorem exact_pairing_column {O : Type*} [CommRing O]
    (a w b q t u d s : O) (hM : b = q + t*u)
    (hb : b = a + a*w*d) (ht : t = a*w*s) :
    q = a + a*w*(d-s*u) := by
  calc
    q = b - t*u := by rw [hM]; ring
    _ = a + a*w*(d-s*u) := by rw [hb, ht]; ring

theorem pairing_factor_dvd {O : Type*} [CommRing O] (a z : O)
    (e l : ℕ) (hl : l ≤ e) : a^(e-l)*z^l ∣ a^e*z^l := by
  refine ⟨a^l, ?_⟩
  calc
    a^e*z^l = (a^(e-l)*a^l)*z^l := by rw [← pow_add, Nat.sub_add_cancel hl]
    _ = (a^(e-l)*z^l)*a^l := by ring

end CompactKernelRun34

#check TwistingData.card_le_finrank_translatesIn
#check TwistingData.of_pairing
#check TwistingData.exists_depth_factorization
#check TwistingData.exists_projector
#check TwistingData.hasType_twisted_hecke
#print axioms TwistingData.of_pairing
#print axioms TwistingData.hasType_twisted_hecke
#print axioms CompactKernelRun34.exact_pairing_column
#print axioms CompactKernelRun34.pairing_factor_dvd

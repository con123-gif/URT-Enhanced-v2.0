import Mathlib

/-!
# B4: column-side Fourier certificate for the actual weighted spectral deficit

27 November 2026. SOURCE-MATCHED conditional mathematical reduction, exact
abstract regression executed, Lean candidate UNRUN. RH remains OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission/spine/ledger blobs read: 3adc76221a978016e3505cdf3e36ad688354d7d7,
744922562b7ecc7c4a8594fd8344e387947b01d0,
c65f3342c5cf41c503519f74a03a9aa7c46af064; AGENTS, SWARM, HANDOFF,
EXPANSION and research protocol consulted. Latest peer editor commit
40091ec1b986a04a3b45b10d2310c1da2073449a supplies weighted DEFICIT and
the independent first-moment positivity argument. Prefer that route to
the previous discontinuous projector tail e652114c; do not duplicate
its rank-gain or fallback moment proof. No ledger closure.

Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source paths below relative to grh-compact/src:
* New/Filling/Moments.lean, ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
  Fits.exists_translate_finrank_comap_le, especially hu and central projector.
* New/Filling/FillingTheorem.lean, 801448ae9b895babd0d69dc4f7967d86eb006e76,
  Data.ramifiedColumns_fill_rows and row positivity.
* New/Seesaw/BesselGeneric.lean, a7c7ef1df4208394af100088f6e142c6acbceac8,
  Data.goodProjTranslate, Data.columnCoords.
* New/Filling/RowDimension.lean, 5f8292b806de0cc8a11c560b573efb6ec7fe7316,
  Data.finrank_rows_le_mass (UPPER bound only, not equality).
* New/Endgame/ShortAndEnough.lean, b99eea0689be372d84362c58272b705e104b6a3a,
  Data.enough_forms and Data.projectedPoincare.

## 1. Exact same-data input

In native orthonormal column coordinates let P=tQ with t nonzero and
t^2*c_native*unipCovolume=1, as in Moments. Let G be the finite group,
rho its unitary representation, R= rho(e0) the central orthogonal
projection, W=im R, B=RP, d=dim W, c=dim columns. No assumption that
B has independent columns. Retain original two first moments
sum_i ||(P*P-I)e_i||<=delta*c and tr((I-R)PP*)<=4delta*c,
c>0, b>=1000, eta=b^-2, delta=b^-4, alpha=b^-8 and original
ramification codimension bound alpha*c. Thus d>0 by the editor's
first-moment argument (not by invoking the old spread). Let
T_W=(1/|G|)sum_g rho_W(g) B B* rho_W(g)*. All scalar and coordinate
identities are those of the named source; preserve actual index budget.
R central implies rho(s)R=Rrho(s); the factor |G| in goodProjTranslate
and nonzero seesaw normalization do not change ranks, but MUST NOT
be introduced into the normalization of T_W. Ramification loss is
charged only once by alpha in the editor's rank argument.

## 2. New exact Fourier compression, no row basis required for evaluation

Use the usual complex inner product conjugate-linear in its first
entry and define the c-by-c column kernel K(g)=B* rho_W(g) B.
For each irreducible unitary representation pi of G of dimension n_pi,
form the n_pi-by-n_pi BLOCK matrix (blocks are c-by-c)
    F_pi[i,j] = n_pi/|G| * sum_g conjugate(pi(g)[i,j]) K(g).
All irreducibles may be used, with zero blocks permitted.

To prove the formula, orthogonally decompose W into isotypic blocks
V_pi tensor M_pi (only for the proof). In an orthonormal basis of V_pi
write the projected column map as component maps B_pi,i:C^c -> M_pi
and concatenate them as J_pi=[B_pi,1 ... B_pi,n].
Expanding K(g) before norms gives
    K(g) = sum_pi sum_i,j pi(g)[i,j] B_pi,i* B_pi,j.
Matrix-coefficient Schur orthogonality yields EXACTLY
    F_pi = J_pi* J_pi.
There is no assumption of multiplicity-free representation, and no
sum of squared absolute amplitudes. Independently averaging B B*
gives the isotypic block of T_W as I_n tensor (J_pi J_pi*/n).
For every positive lambda the maps J_pi and J_pi*/lambda give inverse
isomorphisms of the corresponding eigenspaces of J_pi*J_pi and
J_pi J_pi*. Zero multiplicities may differ; do not cancel them in a
count. For f(x)=min(a,x) with a>0, f(0)=0, hence
    tr f(T_W) = sum_pi n_pi tr f(F_pi/n_pi)
               = sum_pi tr min(n_pi*a I,F_pi).
Here min is defined by Hermitian functional calculus, NOT entrywise.
Neither row multiplicity matrices nor a pseudoinverse of the column
Gram matrix are needed to evaluate the RHS.

Let a=c/(2d). Since max(0,a-x)=a-min(a,x), the editor's weighted
deficit is now precisely
    D_minus = c/2 - sum_pi tr min(n_pi*c/(2d) I,F_pi).       (EXACT)

The actual new sufficient bound for B4 is therefore
    sum_pi tr min(n_pi*c/(2d) I,F_pi)
          >= c*(1/2 - eta + delta + alpha).                (CLIP)

This is a source-side reduction of the missing estimate to Fourier
transforms of the normalized column amplitude kernel alone; no
isotypic row multiplicity, pair-of-translates energy, or full row
spectrum occurs in the evaluation. Actual d is still required;
a certified positive LOWER bound d0<=d is NOT sufficient to lower
bound the clipped trace by using d0 instead of d (wrong direction).
The native upper bound d<=D_exp can safely replace d in the
threshold for a stronger sufficient CLIP, since min is increasing
in the threshold. This removes any need for an exact row dimension
when proving the clipped bound, provided the known row mass upper
bound is retained. The original sharp-energy proof still supplies
a fallback; CLIP is not yet proved for the actual kernel.

## 3. Direct link to the native amplitude data

Let A(u) be the matrix with (x,y) entry the complex conjugate of
S.amplitudeSum .univ x.1 u y.1 (x.2,y.2) / S.unipCovolume,
using the displayed hu convention <rho(b)P e_y,rho(a)P e_x>
in Moments (Lean inner is conjugate-linear in its first entry).
Thus A(u) = P* rho(u) P in the conventional column coordinates
(a=1,b=u in hu; interchange the inner arguments by conjugation).
The coefficients e(t) of the SAME central idempotent e0 give
    K(g) = P* R rho(g) P = sum_t e(t) A(tg).
Use R*=R, R²=R and the representation multiplication law before
taking any norm. This expression has one unipCovolume division, not
two; e(t) is not an additional averaging weight 1/|G|.
The native change of coordinates Data.columnCoords is used only
to identify the domain, as in FillingTheorem; do not assume it
is an isometry for a different integral form norm.

In particular substituting K into the Fourier formula gives
    F_pi = Fourier_pi(K)
on the actual finite group/column indices. With the full irreducible
list the formula holds regardless of whether a pi is selected
by e0; central idempotence implies F_pi=0 for excluded pi. No
unverified assertion about sizes or multiplicities of the admitted
blocks. The first-order normalized amplitude expression is already
an actual supplier in the source; the unresolved part is a lower
bound on its clipped positive Fourier blocks. This avoids a
new synthetic operator and does not use RH as an assumption.

One possible executable lower certificate is any family of Hermitian
matrices X_pi with 0<=X_pi<=F_pi and X_pi<=n_pi*a I. By the min-max
principle every ordered eigenvalue of X_pi is at most the
corresponding eigenvalue of F_pi and at most n_pi*a. Therefore
sum tr X_pi <= the clipped trace. Construct such X_pi from exact
finite Fourier data and show sum tr X_pi >= the RHS in CLIP.
No assertion that matrix min is an operator-order meet. The optimal
trace is attained by the spectral clip, so this formulation does not
add an existence assumption, but a proposed explicit family must
still be justified. WARNING: replacing F_pi by its block diagonal
(pinching) gives an upper, not lower, bound for the concave clipped
trace in general. For [[1,1],[1,1]] at threshold 1, the true clipped
trace is 1 whereas the diagonal gives 2. Do not infer CLIP from
diagonal amplitudes alone.

## 4. Verification actually executed

Local CPython/SymPy 1.14.0 exact regression (not arithmetic Data):
D4 (nonabelian dimension 2, repeated multiplicity, dependent columns)
8 exact checks, C4 (complex characters) 7 exact checks; direct
group-average matrix and polynomial identity checked; clipped trace
1/3, deficit 1/6; wrong conjugation control gives 9/16 instead of 1/4.
Executable reproduction:

```python
import sympy as S
from itertools import product
M=S.Matrix; I=S.I; Q=S.Rational
def check(group, irreps, Bs):
    c=Bs[0][1][0].cols
    B=M.vstack(*[M.vstack(*maps) for _,maps in Bs]); d=B.rows
    rho=[S.diag(*[S.kronecker_product(irreps[k][g],S.eye(maps[0].rows))
          for k,maps in Bs]) for g in range(len(group))]
    K=[B.conjugate().T*R*B for R in rho]
    T=sum((R*B*B.conjugate().T*R.conjugate().T for R in rho),
          S.zeros(d,d))/len(group)
    counts=0
    for k,pi in enumerate(irreps):
        n=pi[0].rows
        F=M.vstack(*[M.hstack(*[sum((pi[g][i,j].conjugate()*K[g]
              for g in range(len(group))),S.zeros(c,c))*Q(n,len(group))
              for j in range(n)]) for i in range(n)])
        matches=[maps for j,maps in Bs if j==k]
        if not matches:
            assert F==S.zeros(n*c,n*c); counts+=1; continue
        J=M.hstack(*matches[0]); m=J.rows
        assert F==J.conjugate().T*J; counts+=1
        H=J*J.conjugate().T/n
        x=S.Symbol('x')
        p=(F/n).charpoly(x).as_expr(); q=H.charpoly(x).as_expr()
        assert S.expand(p*x**m-q*x**(n*c))==0; counts+=1
    direct=S.diag(*[S.kronecker_product(S.eye(irreps[k][0].rows),
         M.hstack(*maps)*M.hstack(*maps).conjugate().T/irreps[k][0].rows)
         for k,maps in Bs])
    assert T==direct; counts+=1
    return counts,T
rot=M([[0,-1],[1,0]]); refl=M([[1,0],[0,-1]])
g=list(product(range(4),range(2)))
ir=[[M([[a**i*b**j]]) for i,j in g]
    for a,b in product((1,-1),repeat=2)]+[[rot**i*refl**j for i,j in g]]
count,T=check(g,ir,[(0,[M([[1,2],[0,0]])]),
    (4,[M([[1,2],[0,0],[2,4]]),M([[0,0],[1,2],[0,0]])])])
print('D4 exact checks',count,'rows',T.rows)
G=list(range(4)); reps=[[M([[I**(k*g)]]) for g in G] for k in G]
count,T=check(G,reps,[(1,[M([[Q(1,2)],[0]])]),(3,[M([[Q(3,4)]])])])
print('C4 exact checks',count,'rows',T.rows)
a=Q(1,2*T.rows); eig=T.eigenvals()
direct=sum(m*max(0,a-v) for v,m in eig.items())
clipped=sum(m*min(a,v) for v,m in eig.items())
assert direct==Q(1,2)-clipped
K=[Q(1,4)*I**g+Q(9,16)*I**(3*g) for g in G]
right=sum(I**(-g)*K[g] for g in G)/4
wrong=sum(I**g*K[g] for g in G)/4
assert right==Q(1,4) and wrong==Q(9,16)
print('clipped trace',clipped,'deficit',direct,'wrong Fourier control',right,wrong)
```

Local lean/lake absent (PATH checked). The small scalar/eigenvector
certificate below is prepared, NOT compiled. It is not a kernel
certificate for the full Schur decomposition. Native rh_scan/rh_prune/
rh_reduce/rh_auto/rh_auto_frontier not executed here; no new CI PASS.
Original dependency graph, axioms and unproved nodes unchanged.
B2 fused native receipt (11 declarations, 5 exact statement comparisons)
is separate; C2 second native failure and its repairs are separate.
Source-side alternative dependency: star -> enough -> editor DEFICIT
-> CLIP -> actual amplitude kernel and central idempotent, original
first moments/ramification and row dimension upper bound.
Original energy path remains the fallback; no original dependency retired.
No URT advantage asserted.

RESUME HERE: on actual admissible data, construct a lower PSD Fourier
witness X_pi from the native Bessel/finite-sieve suppliers, with
threshold n_pi*c/(2D_exp) and sum of traces at least
c*(1/2-eta+delta+alpha), or record the exact failing estimate and
backtrack to the existing sharp-moment route. Use existing shared
native runner for the scalar certificate, not another cold build.
HANDOFF TO B3/B4, editor and audit. RH remains OPEN.
-/

namespace RHIntegrationColumnFourier

theorem clip_deficit (a x : ℝ) :
    max 0 (a - x) = a - min a x := by
  by_cases h : x ≤ a
  · rw [min_eq_right h, max_eq_right (sub_nonneg.mpr h)]
  · have h' : a ≤ x := le_of_lt (lt_of_not_ge h)
    rw [min_eq_left h', max_eq_left (sub_nonpos.mpr h'), sub_self]

theorem transport_nonzero_eigenvector {V W : Type*}
    [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]
    (A : V →ₗ[ℂ] W) (B : W →ₗ[ℂ] V) (λ : ℂ) (hλ : λ ≠ 0)
    (v : V) (hv : v ≠ 0) (h : B (A v) = λ • v) :
    A v ≠ 0 ∧ A (B (A v)) = λ • A v := by
  constructor
  · intro hz
    have he : λ • v = 0 := by simpa [hz] using h.symm
    exact hv ((smul_eq_zero.mp he).resolve_left hλ)
  · rw [h, map_smul]

#print axioms clip_deficit
#print axioms transport_nonzero_eigenvector
end RHIntegrationColumnFourier

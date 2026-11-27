import New.Filling.CrudeEnergy
import Mathlib.Tactic

/-!
# RUN76 — symmetric class-size product: exact factor 1/2 at actual pair caller
27 November 2026. HUMAN SOURCE-MATCHED conditional strengthening;
scalar Lean certificates prepared, NOT compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. No RH root closure.

Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean
dbd5db70bc11b35f18fa5751216ab335321e7bfc reread.
Current default Main blob 6feb2eac1ed5fe318526ae74b89f92bc83be8c9f
uses New.zeta_zeros_on_line New.grh; not imported, pins unchanged.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission a69122b6ad568910a45d2bc13961ab9da4855143 incl mandatory engine,
AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity and opening
research state/log/protocol read. Latest state summary 66f9044c unrelated
to proof replay. Latest branch commits inspected, particularly independent
audit 446c68f902063258f4a5f1a9ba5058318105063c, which agrees with RUN75
and replaces its finite-level recursion by a sharper geometric norm sum.
This run does NOT duplicate that audit; it attacks the pointwise retained
supplier explicitly requested there. Other recent peer commit titles
6a47079d, bd652fd1, 82672996, fab4aba0, 80f4ff6e, c8d08359, b892a87c,
788d56c5, f1abc81e, 2f004f32 inspected for collision avoidance.

## 1. Fix the actual context and expand exact denominators

CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
energy_le_of_level_pairs lines 130--155: pointwise comparison.
BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
pairInvariant, classGauge, termWeight, pairWeight (lines 341--389).
LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416,
one_le_xRowsIndex_and_saturationIndex, exists_link_split_le_classGauge,
pairInvariant_mul_le. SchurTest.lean classSize, Setup.lean
622e7ebe5c04b7ae87652e460762da7fb2e40727 (tailScale, codimFactor,
le_g, count parameters), CrudeBoundDefs.lean
0ba0d2532b14c414b9032466b79e10d4d60c3d18 (countWeight).
BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
(sum_pairWeight_le, tsum_invPowWeight_le_of_codim_le, sum_latticeDisc_inv_le).
All retrieved from pinned compact source.

Fix the SAME S admissible, c,c',s in Omega, gamma,gamma' in the
congruent kept level-j terms of the actual complement of the kept-link
diagonal; same X!=0, FixesNormAtLeast s X and h1/h2 energy triggers.
Let k=shape.k, f=numInfPlaces, r=min(j,rho), ell=(j-rho)_+,
V=commonLink(gamma,gamma'), m=k-dim V, L=latticeDisc c V>0.
Set o,o' to the frameValueIndex (a=1,V) of the two terms, d,d'
to their saturationIndex. Native split and index lemmas give
o,o',d,d'>=1 and G,G'>0 for G=classGauge(j,c,c',gamma).
V is symmetric, so L and m are the SAME in both orientations.
M0=countWeight 0>0, M_m=M0*(2*tau^2)^m, tau=tailScale>=2,
D=mainEnergy if top, else tau^13/(tau^32)^j*besselEnergy.
The native classSize product is exactly
    K = tau^4*D / (M0*g^(2*r*k*f)*(G*G')^((k+1)/2)).
Here fractional powers mean positive real powers, equivalently
sqrt((G*G')^(k+1)); no square root of a signed term.
The pair weights on these actual kept congruent terms are
    W = 1/(M_m*g^(2*r*k*f)*L^(k+1)*(o*d')^k),
    W'= 1/(M_m*g^(2*r*k*f)*L^(k+1)*(o'*d)^k).
This uses [Ohat:g Ohat]=g^(2f) (r copies) as in the source
submoduleIndex_smul_intVectors and genIndex_natCast, not a new
index hypothesis. All factors finite and nonzero on this support.

## 2. Keep the arithmetic symmetry BEFORE replacing square roots

Native pairInvariant_mul_le gives a single i with m<=i+ell,
i=0 implies equal links, and
    L^2*o*d*o'*d'*X0^2 <= (2/g)^(2*i*f)*G*G',
where X0=X if j>rho and i=0, otherwise 1.
Put a=o*d', b0=o'*d (the two CROSS products occurring in W,W'),
q=X0*(g/2)^(i*f). Then a,b0,q>=1 (g>=b^19>=2).
Consequently G*G'>=L^2*a*b0*q^2.
Taking the positive square root, and dropping only factors >=1,
    1/sqrt((a*b0)^(k+1)*q^(2*(k+1)))
       <= q^(-k)*sqrt(a^(-k)*b0^(-k))
       <= q^(-k)*(a^(-k)+b0^(-k))/2.             (S)
The second inequality is exactly AM-GM, not an unsymmetrized
norm bound; equality possible for a=b0=q=1. No assumption that
individual weights agree. Equivalently square (S): put
U=q^(-k)*a^(-k), V0=q^(-k)*b0^(-k), z=1/(q^2*a*b0)<=1.
The left square is z*U*V0, and
    ((U+V0)/2)^2-z*U*V0=(U-V0)^2/4+(1-z)*U*V0>=0.
This is the decisive exact cancellation. It retains the same link
and Liouville discriminant suppliers; it does not prove them.

Substitute the exact weights before estimating the remaining budget:
    K <= (tau^4*D*(2*tau^2)^m*q^(-k))*(W+W')/2.
Since m<=i+ell and b>=2,
    (2*tau^2)^m*q^(-k)
      <= (2*tau^2)^ell * codimFactor^i / X0^k,
where codimFactor=(b/g)^(kf)*(2*tau^2).
More precisely one may retain the extra factor (2/b)^(i*k*f).
The source H at CrudeEnergy lines 136--145 proves that the resulting
coefficient is <= C/tau^3, with the SAME h1/h2 triggers, including
the top-level omitted-link condition when i=0. Do not delete H
or change its upstream hypotheses. Thus the actual pointwise bound
strengthens to
    classSize(j,G)*classSize(j,G') <= C/(2*tau^3)*(W+W'). (P)
The previous caller loses the 1/2 when replacing each weight by its
sum before multiplying. The sharper factor is a local inequality,
not an extra assumption or an orthogonality claim.

## 3. At the actual aggregate consumer

Retain the exact existing absolute-summability, fiberwise link
expansion, injection dropping s,pi, and the kept diagonal. Each
orientation of W has total at most 2*tau^2 by the native
sum_pairWeight_le (swap a,b over the full, same index set).
Thus normalized cut energy <= w+(C/(2*tau^3))*4*tau^2
    = w+2*C/tau.
This improves RUN75's raw bound w+4*C/tau by a factor 2 on the
error. It is compatible with the independent geometric level sum
446c68f9; that approach can still use the old per-level theorem.
No global admissibility relaxation or deletion from the native DAG.
In particular, the finite geometric level estimate in the audit
is stronger than merely using a uniform cap, so do not replace it
with a weaker bound just because the raw cap improved.

## 4. Remaining packing frontier, with exact codimension check

BlockBound.sum_pairWeight_le fibers over m,t,c,V,q,p. Its two
tsum_invPowWeight_le_of_codim_le calls have codimension m and
m+rho+1. The latter is V intersect ker of the restricted
frameMiddle^H map: codim = m+rank(restricted map), by rank-nullity,
and rank <= rho+1. This is a valid local refinement but no claim
of a uniform smaller rank. Both lattice index divisibility
suppliers, the positive-definite middle-form zero implication,
the lift construction, the actual coloring injection, and
sum_latticeDisc_inv_le remain. The packing sum is NOT proved anew
by (P); it is the next retained supplier. Do not infer the
arithmetic count from a finite regression or from H.

Original source-visible edges: energy_le_of_level_pairs ->
{link split, pairInvariant_mul_le, positive index lemmas, H,
pointwise classSize algebra, absolute expansion, injection,
sum_pairWeight_le, scalar tailScale}.
Reduced HUMAN candidate: same edges with pointwise classSize
algebra replaced by (S),(P), then one symmetric sum and exact
normalization. No original graph or previous axiom record removed.
Context key: source pin, S,c,c',s,j,gamma,gamma',V, i,m,r,ell,
G,G',o,o',d,d',L,X,X0,q,C,D,tau,b,g,k,f, same omitted diagonal.
No optional URT used. Native engines not runnable in local
container (command -v lean/lake no output), no new kernel check.
Historical receipts actually fetched: state branch
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717 both pass/returncode 0;
these are runs 45577239749 and 45576756833, not a test of this file.
Conditional strip root reports propext, Classical.choice, Quot.sound.
No fresh axiom result or actual native root dependency retirement.

Actual local exact regression, stdlib Python Fraction:
    from fractions import Fraction as F
    from itertools import product
    n=0
    for k,o,s,op,sp,q in product(range(1,6),range(1,5),range(1,5),
        range(1,5),range(1,5),(F(1),F(3,2),F(2),F(5))):
        a=o*sp;b=op*s
        lhs=F(1,a*b)**(k+1)/q**(2*(k+1))
        rhs=((F(1,a)**k+F(1,b)**k)/(2*q**k))**2
        assert lhs<=rhs
        n+=1
    assert F(1,1)**2 > ((F(1)+F(1))/3)**2
    print(n,'exact squared comparisons; 1 sharpness control')
Output: 5120 exact squared comparisons; 1 sharpness control.
This checks only the scalar formula, not native adelic data.
The proof is the algebra above, not these finite comparisons.

RESUME HERE: independently audit (P) at the exact CrudeEnergy
pointwise consumer and replay the scalar lemmas below with native
positive-index substitution. Then attack the retained coloring
injection and divisibility in BlockBound.tsum_invPowWeight_le_of_codim_le
(lines 130--216), followed by the two index-lift suppliers at
sum_pairWeight_le; keep all original native graphs and axioms,
coherent/Rallis and A/C primitive obligations and prime-window
lower bound open.
HANDOFF TO integration, audit, positivity, native runner.
-/

namespace CompactLandauRun76

theorem symmetric_square_bound (t a b z : ℝ)
    (ht : 0 ≤ t) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hz : z ≤ 1) (h : t^2 ≤ z*a*b) :
    t ≤ (a+b)/2 := by
  have hab : 0 ≤ a*b := mul_nonneg ha hb
  have hza : z*(a*b) ≤ a*b := by
    simpa using mul_le_mul_of_nonneg_right hz hab
  have hprod : z*a*b ≤ a*b := by
    simpa only [mul_assoc] using hza
  have hsq : t^2 ≤ ((a+b)/2)^2 := by
    nlinarith only [h.trans hprod, sq_nonneg (a-b)]
  by_contra! hn
  have hp : 0 < (t-(a+b)/2)*(t+(a+b)/2) :=
    mul_pos (by linarith) (by linarith)
  nlinarith only [hp, hsq]

theorem half_pair_budget (C τ ν P Q F w : ℝ)
    (hC : 0 ≤ C) (hτ : 0 < τ) (hν : 0 < ν)
    (hP : P ≤ 2*τ^2) (hQ : Q ≤ 2*τ^2)
    (hF : F ≤ w*ν^2 + (C/(2*τ^3))*ν^2*(P+Q)) :
    F/ν^2 ≤ w+2*C/τ := by
  apply (div_le_iff₀ (by positivity : 0 < ν^2)).2
  calc
    F ≤ w*ν^2 + (C/(2*τ^3))*ν^2*(P+Q) := hF
    _ ≤ w*ν^2 + (C/(2*τ^3))*ν^2*(2*τ^2+2*τ^2) := by gcongr
    _ = (w+2*C/τ)*ν^2 := by field_simp; ring

#print axioms symmetric_square_bound
#print axioms half_pair_budget
end CompactLandauRun76
#check Filling.energy_le_of_level_pairs
#check Filling.sum_pairWeight_le
#check Filling.pairInvariant_mul_le
#print axioms Filling.energy_le_of_level_pairs

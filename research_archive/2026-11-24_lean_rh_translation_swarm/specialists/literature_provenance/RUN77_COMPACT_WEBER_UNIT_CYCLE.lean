import Lib.CM.LocalHeight.IntegralParameter
import Mathlib.Tactic

/-!
# RUN77 — Weber unit without a Weber class-invariant black box
27 Nov 2026. HUMAN SOURCE-MATCHED independent reduction at A3.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7 (including mandatory
pipeline), live spine 67e542df1b5557b2e1314643931ef1355bbdc50d,
ledger 073d86374ebc415e217a2732814dde7b0f3dfb9d, AGENTS, swarm,
handoff, expansion read. RUN76 f1ef185f retained; peer 82672996
relative different is separate. Search of commit messages for Weber
returned no hits; not an exhaustive source graph scan.

## Actual supplier, not generic potential good reduction
Lib/CM/LocalHeight/IntegralParameter.lean blob
9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
CMLattice.norm_disc_eq_one [PrimeSevenModEight d] (iota : C ->+* C_p)
asserts |iota(a1)^4-64|=1 for every prime p, on the actual normalized
model y^2+a1*x*y=x^3+x. It has an explicit proof body: class-group
cycle induction, two degree-2 lattice identities, ultrametric grind.
Not an axiom. Direct consumers norm_a₁_le_one, naiveHeight_spec,
and thence formal-height / parameter construction, as in RUN76.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7
supplies CMLattice, disc_eq, g₂_eq, a₁_sq, normalized lattice
existence and ideal scaling, mul_mem_or_mul_sub_t_mem.
The following removes the need for a separate Weber theorem, and
replaces the long complex theta expansion with two root differences
and a single finite-cycle argument. No need to assume algebraicity
of a1 for this lemma. All norms below are after the SAME iota.

## 1. Exact complex algebra before norms
Put omega=(1+sqrt(-d))/2, T=omega*t, e1=wp(t),
e2=wp(T), e3=wp(t-T), r=e3-e1, s=e2-e1.
These are the three distinct roots of wp's cubic because omega and
1-omega act as the two nontrivial complementary idempotents on E[2]
(O_K/2=F_2 x F_2), and t has nonzero projection in both factors
by quadGen_mul_t_notMem. The source normalization wp''(t)=2 gives
r*s=1, and e1=-(r+s)/3. The discriminant in the source is
 b=a1^4-64=16(r-s)^2.
Using g2=60 G4 and sumInvPow(t-T,4)=wp''(t-T)/6
=e3^2-g2/12=(r^2-1)/3, the native parameter is exactly
 v=240 G4/sumInvPow(t-T,4)-16 =16/(r^2*(r^2-1)).
Here r!=0 and r^2!=1, since the roots are distinct.
All quantities used are invariant under homothety of the lattice
with its marked half-period; r^2 in this formula represents the
ratio (e3-e1)/(e2-e1), and a1^4 of the normalized model is fixed.

Take the degree-2 quotient by T, corresponding to lattice enlargement
Lambda + Z*T, or multiplication by the fractional ideal
O_K + O_K*(-omega/2), up to a complex homothety. The latter has
index two over O_K since omega is a rank-one idempotent mod 2.
In x=wp-e2, y=wp'/2 the source is
 y^2=x(x^2+A*x+B), A=2s-r, B=s(s-r).
The standard quotient is
 Y^2=X(X^2-2A*X+A^2-4B), X=x+A+B/x,
 Y=y*(1-B/x^2).
Its kernel is {O,(0,0)}; its equation follows by substitution.
The map extends between smooth projective curves, preserves O, and
has degree 2 (x satisfies a quadratic over X; the two roots are x
and B/x, and translation by (0,0) interchanges the generic points).
The images of the two other half-periods are the same nonzero
2-torsion point (0,0) of the quotient.

The quotient is O_K-linear. The image of t has omega=0, hence is
the nonzero (1-omega)-line of D[2]. Thus the root 0 of the quotient
cubic is e3' (t_D-T_D), not the mixed marked root e1'. The other
two roots, u and w, are A +/- 2 sqrt(B), in either order; mark
e1'=u and e2'=w. The ratio in the expression for v is scale
invariant, so r_D^2=u/(u-w), regardless of the normalization
scale or which root is u. Hence
 v_D=16*(u-w)^2/(u*w)
    =256*B/(A^2-4B)
    =-256*(r^2-1)/r^4 = -b*v.
For T=r^2 (scalar, not the torsion point), the second native identity
 (48+v+b)*(-v_D)=4096
 follows from the polynomial cancellation
 48*T*(T-1)+16+16*(T-1)^3=16*T^3.
This reconstructs the exact two identities in norm_disc_eq_one
without the native theta-square / lattice fourth-power sum expansion.
Do not replace b by the discriminant of an arbitrarily rescaled
Weierstrass equation; all b here refer to normalized C.

## 2. Finite cycle, including p=2, without induction on path cases
The finite class group makes repeated multiplication by that SAME
fractional ideal periodic up to homothety. CMLattice existence for
each ideal is retained. The marked t is unique mod the lattice:
the unique mixed nonzero element in the direct sum of two F_2 lines.
Therefore the v-values return exactly after a finite positive
number of steps; no Galois continuity or product over embeddings.

For each edge put x=|v|>0, y=|v_D|>0, z=|b|>0, c=|4096| in (0,1].
Then y=x*z and c=y*|48+v+b|, with |48|<=1. Use only the ultrametric
maximum bound, and equality when one summand strictly dominates.

(i) If x<c then z<=1 would imply c<=y<=x<c. Thus z>1 and dominates
both |48| and x; y*z=c, hence y^2=c*x. Consequently x<y<c.
An orbit entering (0,c) stays there and strictly increases, impossible
on a finite cycle. All x>=c.

(ii) If the largest cycle value x is >1, its successor y<=x gives
z<=1. Now v dominates 48 and b, so c=x*y, yielding y<c, a
contradiction to (i). Thus all x<=1.

(iii) On [c,1], an increase y>x would imply z>1 and hence y^2=c*x
<=x^2, impossible. Thus all edges are nonincreasing. Periodicity
forces equality on every edge, giving the desired z=y/x=1.

This is the complete human cycle implication, valid even at p=2
where c=2^-12. It proves the exact original supplier provided the
standard lattice/cubic and ideal existence inputs are retained.
It uses the same CM split premise, not RH, and does not assume
good reduction in order to prove good reduction.

## 3. Literature provenance / dependency boundary
Birch, Weber's class invariants, Mathematika 16 (1969), 283-294,
DOI 10.1112/S0025579300008251, Cambridge landing-page extract read:
https://www.cambridge.org/core/journals/mathematika/article/abs/webers-class-invariants/A6D813F0131A55822F190969340E5325
The extract does NOT state the needed exact discriminant unit with
the source marking. Full Birch theorem, Deuring and Lang not
directly inspected this run; do not claim verified citation bridge.
Generic potential good reduction also fails to guarantee a unit
discriminant of THIS model. Instead the above argument removes the
black-box Weber citation at this interface. The standard quotient
formula is corroborated by Magma Handbook Morphisms, example
H131E17: https://magma.maths.usyd.edu.au/magma/handbook/text/1551
and is derived here algebraically, not an imported axiom.
Original source graph (partial source edges) norm_disc_eq_one ->
class-group induction, lattice fourth-power sums, theta identity,
norm comparisons. Candidate reduced human graph -> class-group
periodicity and ideal existence, half-period normalization,
degree-2 quotient, rational cancellation, norm-cycle. Both
preserved; original source files unchanged; global retirement not
claimed. Cache key pin,d,C,mark,omega-ideal,iota,p. If quotient
uniformization normalization is disputed, backtrack to native
lattice identities and retain the new cycle proof. All A1--E1 root
obligations remain in live ledger. Native theorem has a body but
its transitive axioms and replacement caller not checked this run.

## 4. Actual checks
Local Python/SymPy, exit 0, five exact rational identities:
    import sympy as S
    r=S.symbols('r',nonzero=True);s=1/r;e=-(r+s)/3
    g2=12*e**2-4;den=(e+r)**2-g2/12
    v=4*g2/den-16;b=16*(r-s)**2
    A=2*s-r;B=s*(s-r);w=256*B/(A*A-4*B)
    for name,f in [('den',den-(r*r-1)/3),
        ('v',v-16/(r*r*(r*r-1))),('edge',w+b*v),
        ('product',(48+v+b)*(-w)-4096)]:
        print(name,S.factor(f)); assert S.cancel(f)==0
    x,A,B=S.symbols('x A B',nonzero=True)
    X=x+A+B/x; f=x*(x*x+A*x+B); Y2=f*(1-B/x**2)**2
    print('quotient',S.cancel(Y2-X*(X*X-2*A*X+A*A-4*B)))
    assert S.cancel(Y2-X*(X*X-2*A*X+A*A-4*B))==0
Output den 0; v 0; edge 0; product 0; quotient 0.
These check algebra, not lattice existence or finite class group.

Lean/lake absent on local PATH. Scalar certificates below PREPARED,
not compiled. Native rh_scan/prune/reduce/auto/frontier unavailable
in this run; no fabricated pruning or axiom results. Shared old-pin
CI receipts read: 45577239749, 45576756833 exit 0, not this theorem.
New peer B2 receipt read: Actions 45986308748, status blob
d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d, actual results
compute/rh-compact-b2-human-replay-20261127/outputs/b2_native_results.json
reports 8 new helpers and 6 original caller axiom probes, standard
axioms only, negative guard control rejected. caller_replacements_checked
=false, human_assembly_verified=false, full_RH_replay=false. No A3
coverage inferred. Do not duplicate B2 job or edit protected workflows.

RESUME HERE: request one shared A3 replay of the original
norm_disc_eq_one, norm_a₁_le_one and exists_unit_coeff_degree_le,
including #print axioms and the two RUN76/77 scalar certificate files;
check the existing compute queue before registration. Retain full
geometry caller replacement as distinct from this scalar replay.
Literature next: audit the retained CM algebraicity/ideal-existence
interface in RUN76 only if there is an actual unproved premise.
RH remains OPEN.
-/

namespace CompactLiteratureRun77

theorem weber_polynomial (T : ℂ) :
    48*T*(T-1)+16+16*(T-1)^3 = 16*T^3 := by ring

theorem no_rise (x y c : ℝ) (hx : 0 < x) (hc : c ≤ x)
    (h : y^2 = c*x) : y ≤ x := by
  by_contra hn
  have hy : x < y := lt_of_not_ge hn
  have h1 : 0 < (y-x)*(y+x) :=
    mul_pos (sub_pos.mpr hy) (by linarith)
  have h2 : 0 ≤ (x-c)*x :=
    mul_nonneg (sub_nonneg.mpr hc) hx.le
  nlinarith

theorem low_trap (x y c : ℝ) (hx : 0 < x) (hy : 0 < y)
    (hc : x < c) (h : y^2 = c*x) : x < y ∧ y < c := by
  constructor
  · by_contra hn
    have h1 : 0 ≤ (x-y)*(x+y) :=
      mul_nonneg (sub_nonneg.mpr (le_of_not_gt hn)) (by linarith)
    have h2 : 0 < (c-x)*x := mul_pos (sub_pos.mpr hc) hx
    nlinarith
  · by_contra hn
    have h1 : 0 ≤ (y-c)*(y+c) :=
      mul_nonneg (sub_nonneg.mpr (le_of_not_gt hn)) (by linarith)
    have h2 : 0 < (c-x)*c := mul_pos (sub_pos.mpr hc) (hx.trans hc)
    nlinarith

#print axioms weber_polynomial
#print axioms no_rise
#print axioms low_trap
#check CMLattice.norm_disc_eq_one
#print axioms CMLattice.norm_disc_eq_one
#check CMLattice.norm_a₁_le_one
#print axioms CMLattice.norm_a₁_le_one

end CompactLiteratureRun77

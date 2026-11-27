import New.Exchange.RealPair
import New.Exchange.EqualRankValue

/-!
# RUN74 — real-period supplier at the actual top-of-tower exchange
27 November 2026. SOURCE-MATCHED human derivation; candidate local
replacement and prepared scalar certificate, not native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original mirror pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Mission latest blob a69122b6ad568910a45d2bc13961ab9da4855143;
AGENTS, protocol, queue, expansion, continuity and recent commits inspected.
RUN73 a9740422 retained. Integration RUN77 847ff2e5 handles the separate
absolute theta-term unfolding, not the real period supplier below.
Latest observed branch head bdfcbcdc3c0cfaabb291a7d9806980b93c7ca701
(Galois radius); peer titles 0e9b893e, d8ec62f2, d12d3e65, 0a9f1882,
e8b07e40, 7e6fe010, 4a597803 and 52a17e4e reviewed for overlap.

Actual native paths and blobs:
New/Exchange/RealPair.lean f2a4ed6190f46b592334117dda62a72b3e6d4704:
exists_contDiff_witt, exists_rapid_with_realSlice, exists_stdExchange_top.
New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
stdExchange_of_periods, thetaOnRealData_boxProd_eq_mul,
thetaLarge_eq_apply_one_of_even_rank, equalRankThetaRatio, StdExchange.
Lib/Weil/MixedModel/RapidSections.lean 91ee9addb3ad3d7f9ec6c42353afd260fd1f647d:
MixedModel.exists_section (retain actual Fourier/rapid estimates).
New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d:
exchange_of_partners uses the actual exists_stdExchange_top.

## 1. Replace the general inverse-function-theorem Witt step at this caller

At every infinite place the actual frame in exists_stdExchange_top is
x0=(I;0), J=diag(J0,J1), where J0,J1 are the sign involutions.
For y=(A;C) close to x0, A is invertible. Write Z=C A^-1 and
Z#=J0 Z* J1. Let
    T=[I,-Z#; Z,I], D0=I+Z#Z, D1=I+ZZ#.
The exact block multiplication is
    T* J T=diag(J0 D0,J1 D1).
For Z sufficiently small in any fixed submultiplicative operator norm,
define X=D0^(-1/2), Y=D1^(-1/2) by their convergent binomial power series
at I (real coefficients, convergence for ||Z#Z||,||ZZ#||<1). These commute
with their respective D's and satisfy X*J0=J0 X, Y*J1=J1 Y, since the
D's are self-adjoint for their sign forms. Hence
    k=T diag(X,Y), k*Jk=J, k x0=(I;Z)X,
    y=k x0 (X^-1 A).
No positivity of the indefinite form is assumed. For a global smooth
unitary k as required by exists_section, choose nested small coordinate
balls around x0 on which A is invertible and both norms are <1. Replace Z
outside the smaller ball by its product with a smooth real bump supported
strictly inside the larger ball, and by zero off the larger ball. The
extended Z remains uniformly small because the bump is in [0,1].
Use the same formula globally; it equals I off the support. This
also works when a block has size zero. Finite product of places gives
the required smooth family. Thus the GENERAL smooth Witt theorem and
its local inverse-function argument can be bypassed for this frame;
this is a proposed human caller replacement, not deletion of the
general theorem from other consumers.

## 2. Projection and the common support; no character-dependent choices

The source defines z(x)=x gamma(x*Jx) x*J x0, gamma a globally smooth
extension of inverse near J0. Where gamma is the actual inverse,
P_x=x(x*Jx)^-1 x*J is the J-orthogonal projection to the frame and
    P_(xB)=P_x, z(xB)=z(x)   for every B invertible.
Indeed (B* G B)^-1=B^-1 G^-1 (B*)^-1; cancellation is BEFORE norms.
For a frame in graph coordinates z(x)=(I;Z)(J0+Z*J1Z)^-1 J0.
The support proof does not assume gamma is an inverse at arbitrary x:
if sigma(z(x)) nonzero then z(x) has invertible Gram by the support
choice, hence its right square multiplier in x is invertible and
x has the same span and Gram signature. Section 1 gives the actual
represented-class witness required by hz in stdExchange_of_periods.
Choose the nonnegative smooth bump sigma with compact support
in the above neighborhood, sigma(x0)>0. Set w(y,x)=k(y)^-1 x.
If sigma(y)sigma(w(y,x)) is nonzero then x lies in the continuous
image of supp(sigma) x supp(sigma) under (y,w)->k(y)w, hence in
one compact set. This is the actual support for the large-side section.

Let n=2j and M_tau=toNat(mu_tau). The source small-side scalar is
    a(B)=sigma(x0 B) product_tau |det B_tau|^(2(j+M_tau)).
It is smooth, nonnegative, compactly supported (the embedding B->x0B
has closed image and continuous inverse on that image), and positive
at B=I. The native opposite zero-term law then normalizes the small
section by one scalar kappa: the integral of a against the actual
positive real measure is strictly positive, and the fixed Jacobian
in symm_homSource_zeroTerm_eq_integral is retained. This supplies
realSlice D.symm V' 0 x'=v, NOT an arbitrary independently normalized
slice. Apply MixedModel.exists_section as in RealPair to the fixed
rapid v, v1 and their product: the large-side slice is
    tau(y,x)=sigma(y)sigma(w(y,x))
      * [product_tau conj(det(top(w_tau)))^(2 M_tau)] * kappa
      * realPairWeil(j-M,0;1,k(y))(v boxProd v1)
evaluated at y=z(x). Keep its exact weight twist and the source's
rapid product/Fourier bounds. All choices precede arbitrary tame
character of weight mu (the integer M is fixed). When no such
character exists the universal clause is vacuous; for each actual
character its weight_pos justifies mu=M. No assertion that arbitrary
smooth Fock-valued sections are rapid is used.

## 3. The actual hc callback — cancel B and the auxiliary phase first

For h in the real target group, take y=z(h^-1 x0) and
rho(h)=sigma(y). Its Gram is J0 so the actual inverse is used.
rho is nonnegative and nonzero on a neighborhood of identity.
If rho(h) nonzero, the represented-class witness and Witt equality
give u in U(J0), q in U(J1) such that
    h k(y) diag(u,I)=diag(I,q).
Take the native correction p=(u,q^-1), in its product coordinates.
Then (sum p) h k(y)=I (the two block-diagonal factors commute), and
for x=h^-1 x0 u^-1 B the identity is w(y,x)=x0 B. B is any
invertible real frame. The source chooses p before B, finite datum,
point and integration variable. If sigma(y)=0 take an arbitrary
correction; the support argument below forces zero. For this case
one uses any u (e.g. I) in x and need not assert the displayed
block diagonal equality.

A subtle guard: z(x) equals y only WHEN gamma is the actual inverse.
If sigma(w(y',x))=0 for every y', both proposed tau values are zero.
Otherwise at a point y' where sigma(w) is nonzero,
x*Jx=w*Jw lies in the chosen inverse neighborhood of J0.
Thus gamma is the inverse and right-GL invariance proves z(x)=y,
even for arbitrary B. This is precisely the branch in the native
proof after 'show tau _ x = tau y x'. It must not be dropped by
extending the inverse formula globally. It also handles rho=0:
tau(y,x)=0 and therefore the large slice vanishes.

With rho nonzero, apply the exact native real Weil action law
(realPairWeil including determinant twists); the preceding
group product is identity. The thetaOnRealData_boxProd_eq_mul
identity then separates the small theta term and the (W1,W1)
theta integral, using the SAME real and finite data. The
equal-rank constancy thetaLarge_eq_apply_one_of_even_rank gives
l(c)=thetaLarge W1 W1 c v1 (stdColDatum c.chi 1) 1.
Keep the finite normalized standard column datum and quotient Haar.
No phase is selected independently after this equality.

The remaining scalar is exact. For d=det B_tau !=0:
    conj(d)^(2 M) / |d|^(2(j+M))
       = (conj(d)/d)^M |d|^(-2j).
Proof multiply through by (d conj(d))^(j+M) and use pow_add
and mul_pow. Products over places give exactly
1/[nu.baseChange(z) * sqrt(ideleAbs(z))^n] with z the adelic
determinant from hc, using the native baseChange_apply_inf,
ideleAbs_eq_prod_of_v_eq_one and n=2j. These native identities
fix the character orientation; reversing d and conj(d) generally
changes the result. Do NOT divide by sigma(x0 B), which can be zero:
multiply the identity by the common bump and kappa. This is the
real-period equality hc, with a single rho and l(c), not just
a modulus bound. Attach it to stdExchange_of_periods together
with section 2's support witness and rapid sections:
    StdExchange X (V'.sum W1) V' mu sigma' x x'
      (equalRankThetaRatio W1 · v1).
This is the exact conclusion of exists_stdExchange_top and its
opposite slice condition, conditional on the named analytic/model
inputs. Retain the other exchange primitives from RUN65–73
and independent audit. In particular thetaLarge constancy uses
the source's automorphic-function criterion, not pointwise
constancy inferred from the real scalar.

## 4. Evidence and graphs

Original source-visible graph:
exchange_of_partners -> exists_stdExchange_top ->
{exists_contDiff_witt, exists_rapid_with_realSlice,
 MixedModel.exists_section, stdExchange_of_periods,
 thetaLarge_eq_apply_one_of_even_rank, exact Weil/character laws}.
Candidate human graph replaces the local inverse-function branch
at this canonical frame by block congruence + convergent binomial
series + smooth bump. Retains all remaining edges, native graph,
axiom evidence and unresolved all-prime/host/row obligations.
No global deletion or RH-scale prime bound. Cache key includes
source pin, signs J0,J1, canonical x0, support, real measure,
fixed weight and same datum v,v1; not merely declaration name.
No URT comparison warranted.

Actual local execution: command -v lean/lake/elan returned no
executables. SymPy exact two-block scalar specialization checked
T*JT diagonal (4 entries), projection chart (2 entries), and
81 determinant exponent cases j,M=0..8. Reproducible:
    z,w,a,b = symbols('z w a b', nonzero=True)
    J=diag(a,b)
    T=Matrix([[1,-a*w*b],[z,1]])
    Td=Matrix([[1,w],[-a*z*b,1]])
    R=Td*J*T-diag(a+b*w*z,b+a*w*z)
    assert all(rem(rem(expand(v),a*a-1,a),b*b-1,b)==0 for v in R)
    r,rb=symbols('r rb',nonzero=True)
    x=Matrix([r,z*r]); xd=Matrix([[rb,w*rb]])
    G=(xd*J*x)[0]
    assert all(simplify(v)==0 for v in
      x/G*(xd*J*Matrix([1,0]))[0]-Matrix([1,z])*a/(a+b*w*z))
    d,c=symbols('d c', nonzero=True)
    for j in range(9):
      for m in range(9):
        assert cancel(c**(2*m)/(d*c)**(j+m)-(c/d)**m/(d*c)**j)==0
These are local arithmetic sanity checks only; general matrix proof
above is algebraic, not inferred from dimension one or finite exponents.
Latest actual shared CI receipt re-read:
cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six named checks standard three axioms, one module timeout124,
all_requested_checks_ok=false, full_RH_replay=false.
New certificate below prepared only. No native rh_prune/rh_scan,
rh_reduce/rh_auto execution in this environment; no new CI PASS.
Shared runner may batch this with RUN73; no registry/workflow changes.
No new root obligation claimed kernel-discharged.

RESUME HERE: integrate sections 1–3 at exists_stdExchange_top and
audit the exact realPairWeil weight and baseChange_apply_inf signs;
then check the remaining finite standard-row epsilon normalization
in stdExchange_of_periods and combine the C rank-two determinant
measure with the actual exchange_of_partners descent. Keep the
rapid-section Fourier estimates and equal-rank constancy supplier
explicit; do not rederive the graph chart or the same scalar.
HANDOFF TO integration/editor, literature, formal audit, native runner.
RH remains open, and the target prime inequality is not established.
-/

namespace CompactCharacterBoxes74

theorem determinant_cross_mult {d c : ℂ} (j m : ℕ) :
    c ^ (2 * m) * (d * c) ^ j * d ^ m =
      c ^ m * (d * c) ^ (j + m) := by
  rw [Nat.mul_comm 2 m, pow_mul]
  simp only [pow_add, mul_pow]
  ring

theorem real_period_support_zero {a b c : ℂ} (h : a = 0) :
    a * b * c = 0 := by simp [h]

#check exists_contDiff_witt
#check exists_rapid_with_realSlice
#check MixedModel.exists_section
#check exists_stdExchange_top
#check stdExchange_of_periods
#check exchange_of_partners
#print axioms exists_stdExchange_top
#print axioms stdExchange_of_periods
#print axioms determinant_cross_mult
#print axioms real_period_support_zero

end CompactCharacterBoxes74

import Mathlib

/-!
# RUN54 — actual Frobenius matching and six-copy depth witness
26 November 2026. Human source-matched argument, with explicit retained
formal-parameter and size inputs; scalar Lean checks PREPARED, not compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
b2f589b5fe6c96a650f3fd30c654e0d0bbdc05c3, determinant contract
7ad9c7c64f53c621ad20422226ad9d0b756ee28e. Read AGENTS, protocol,
handoff, expansion. Continue own RUN53 15b7768e; latest theta
c22bb6a0 addresses marked elementary divisors, not this C depth witness.
Read peers bb09b6c2 (cache), 0807db85 (editor), f4015a87 (native audit).
No competing compute queue or edits to protected workflows.

Source ledger (actual bodies, not elaborated graph):
New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e
  IsFrobPacking, Data.exists_isFrobPacking, exists_hasLargeSplit_of_pairs.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
  exists_frame_rows_frob, coeff_sum_frob_ne_zero_iff,
  thetaProducts_normal_form (inert derivative half).
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425
  CMLattice.exists_formal_parameter, norm_coeff_le_of_deriv.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
  three_term, thick_eq_neg_one_mod, nominalWeight.
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
  placeClass_of_thick, log-bound machinery.
New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a
  nominalWeight_mem_Icc, nominalWeight_add_le.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  localAsk, forcedPart, hasSum_live_inv_pow.
New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e
  depth_indicator_jet (actual consumer).
New/Curve/KatzDivisibility.lean 910b6f88933a9debb15df537fa834762f8da0723
  katz_divisibility_limit (previous RUN52 retained).

## 1. Construct the same packing: large inert p

Write S=Data.s, w_sigma=nominalWeight, c=ceil(60b/k),
A_sigma=(max(n_sigma-c,0)+1)...(max(n_sigma-c,0)+c).
depthLossInt=A_sigma^2. Let g=placeOfInt(-p), p nonsplit;
p is prime to N1 by the native chiK_eq_one_of_dvd.
For k<p the ramified case p=d is excluded by the native size bound
d<=k. Thus chi=-1. Set i_sigma=1 for every sigma and
 y_sigma=min(n_(g sigma), floor(max(n_sigma-c,0)/p)).
This is exactly the source witness. No smaller odd positive exponent
exists, so the noncollision clause is empty.
The source h0 says floor(max(n_sigma-c,0)/p)<=c; indeed
n_sigma<=2b and c>=60b/k with p>k. At t the sole possible incoming
edge comes from g^-1 t. Its y is <=min(c,n_t), while p y_t<=max(n_t-c,0).
Their sum <=n_t, including n_t<c. No disjointness of endpoints
is needed in this regime.

Put m=max(n_sigma-c,0), h=floor(m/p). Then n_sigma! divides
m! A_sigma (equality if n_sigma>=c). Legendre gives
v_p(m!)=h+v_p(h!). Since h<=c, h! divides A_sigma: a product
of c consecutive positive integers is divisible by c!, and h!|c!.
Consequently v_p(n_sigma!)<=h+2v_p(A_sigma).
Subtract the chosen y before estimating, obtaining
 v_p(n_sigma!)-y_sigma <= (h-n_(g sigma))_+ + v_p(depthLossInt).
Since c>=x^42, m<=w_sigma, n_(g sigma)>=w_(g sigma),
this is <=(w_sigma/p-w_(g sigma))_+ + v_p(depthLossInt).
The first term is the e=1 contribution to localAsk (omega=1).
All other terms nonnegative. Summing gives the first branch
of exists_isFrobPacking exactly, without a factor for the group size.

## 2. Small p: genuine matching, not independent choices

For p<=k, let an eligible edge sigma -> g^e sigma have
0<e<S, e odd, p!=d, and both endpoints thick. The native N
in DepthPairs excludes any two distinct positive powers i<j<=324*S
from a thick start ending at thick places. Here is its reason:
project to the modulus 2^S. The relation
 phi(g^i)^j=phi(g^j)^i
is exact. Data.three_term forces phi(g^i)=1. Native
two_pow_le_of_pow_eq_one forces 2^S<=|(-p)^i-1|;
the size guard used in N (p<=k, j<=324*S) excludes this.
Keep that explicit source size guard; no assertion for arbitrary S,k.
For the ramified p=d case even the permitted live exponents cannot
take thick to thick: placeClass_of_thick forces the projected
-p^e to be 1, contradicted by pow_d_ne_neg_one in
Data.ne_d_of_placeClass_eq.

For each sigma choose its unique eligible edge if it exists, with
i_sigma=e and y_sigma=floor(n_sigma/p^e); otherwise i=y=0.
There is no collision of incoming edges: if
g^i sigma=g^j t and i>j>0 then t=g^(i-j) sigma,
so sigma has two distinct thick endpoints at powers i-j and i.
N forbids this. If i=j, multiplication is bijective, hence t=sigma.
The same argument rules out any earlier odd j<i from another
positive-y source, which is precisely the noncollision clause.
No positive incoming edge can be followed by a positive outgoing
edge: this would give a thick start and endpoints at i and i+j,
both <=2*S<=324*S. Thus the positive edges form a matching.
At a source the expenditure is p^i y<=n_sigma. At a target t
the only expenditure is y_sigma<=n_sigma/p<=n_t: both thick
weights equal w=a/x, n_sigma<=w+x^42<=2w and p>=13.
At isolated places expenditure is zero. This proves all three
IsFrobPacking fields for the actual witness, including y=0 for p=d.

Quantitative estimate: write omega=(1-chi)/2, rho=nonsplitWeight.
For each live e use n_sigma/p^e, and compare with
  (w_sigma/p^e-w_(g^e sigma))_+
   + 1_(e=i_sigma) y_sigma + c/(p*2^(e+1)).
For e<S, if eligible, the floor loses <1 and the first term is
nonnegative. Otherwise at least one endpoint is thin (including
ramified by the preceding argument), and the difference from
the positive part is <= b2+x^42, since the thin weight is a/x1<=b2.
The source htheta size inequality
  2(b2+a/x1)<=c/(p*2^(e+1)), e<=S,
and x^42+1<=a/x1 cover both. For e>=S, retain the source
tail size inequality n_sigma/p^e<=c/(p*2^(e+1))
(the hL branch of DepthPairs). This is a size-bookkeeping input,
not a new general claim without scale assumptions. For non-live e
the left side is zero. Sum and multiply by omega, using
hasSum_live_inv_pow and geometric sum over e>=0 equal to c/p.
In the inert case omega=1; in the ramified case omega=1/2 and y=0.
In both cases
 (1/(p-1)-rho)n_sigma - y_sigma <= localAsk(w_sigma,sigma)+c/p.
By the e=0 htheta bound and a/x1>=1,
 c/p>=4b2+4. Also v_p(A_sigma)>=floor(c/p) since c!|A_sigma.
Thus c/p+4b2<=2floor(c/p)<=v_p(depthLossInt).
Add 4b2 and sum to get the second source branch exactly.
This derivation retains native htheta, hL, the order-size guard,
and their Data logarithmic bounds as premises pending separate
human expansion. It does not derive those size inequalities from
the abstract matching statement. No additional asymptotic uniformity
is required outside the native D.

## 3. Inert derivative support: why cancellation cannot erase it

Use the actual thetaProducts_normal_form construction at chi=-1,
r=1 and with the SAME tight frame and p-unit scaling. Write
F=Theta(varpi X)=exp(kappa Psi) V,
|varpi|=p^-rho, |kappa|=p^(1-1/(p-1)).
Here Psi,V integral, Psi(0)=0, V(0)=1 by Theta(0)=1.
In the residue field, formal_parameter supplies e=2, u0=0,
u1 a unit, and t_a-t_a^(p^2)=L_a, with L_a linear,
t_a(0)=0, Psi_bar=sum_a (u1 t_a^(p+1)+u2 t_a^(p+p^2)).
Modulo any fixed degree, t_a=sum_(h>=0) L_a^(p^(2h));
the high powers vanish coefficientwise. In characteristic p,
d_x t_a=d_x L_a=r_(x,a), and d_x(t_a^(p+p^2))=0. Hence
 d_x Psi_bar = u1 sum_(h>=0,y) (sum_a r_(y,a)^(p^(2h+1))
                                            r_(x,a)) X_y^(p^(2h+1)).
The source frame identity exists_frame_rows_frob is exactly
 sum_a r_(y,a)^(p^j) r_(x,a)
   = 1_(x=pr_j(y)) beta^(p^j+1) M, j odd,
within each same copy. Its proof applies native frob_ext to the
conjugate row entries (clear the N1 denominator, a p-unit),
then applies the tight-frame Hermitian orthogonality identity.
Since p does not divide M and beta,u1 are units, the displayed
coefficients are nonzero exactly at the specified partner monomials.
Distinct (j,y) have distinct monomials, so there is no cancellation.
This is the exact support needed in DepthPairs, not merely an upper
bound. Retain native frob_ext and CMLattice.exists_formal_parameter
(in particular its unit coefficient u1 and its modulus) as deep
inputs. The general null-cone half of thetaProducts_normal_form
is not proved by this derivative argument and remains available
in its original graph for other consumers.

## 4. Construct the six-copy witness using the packing

Use the SAME i,y from sections 1 or 2. For each of the y_sigma
copies differentiate in its target t=pr_i(sigma). At any step
define integral Q recursively, starting Q=1:
 Q_new=(d_t Psi) Q + kappa^-1 (d_t Q+Q (d_t V)/V).
The inverse of V is integral since its constant is a unit.
Thus Q_new integral and reduction mod maximal ideal kills the
second term, since |kappa^-1|<1 (p>=13). The exact derivative
identity is d_t(QF)=kappa Q_new F. No inequality is used there.

Assign weight 1 to each active source variable and p^(max i)
to inactive source variables. In d_t Psi_bar the selected
monomial X_sigma^(p^i) is the unique lowest-weight monomial:
an active j<i partner is excluded by IsFrobPacking, j=i is
unique by bijectivity of pr_i, and inactive j>=1 has strictly
larger weight. Higher active j also have larger weight.
Products preserve unique lowest term, multiplying nonzero
coefficients in the residue field. After all derivatives,
Q has unit coefficient at M0=sum_sigma p^i y_sigma e_sigma.
Let tau=sum_sigma y_sigma e_(pr_i sigma). The derivative identity
iterated gives d^tau F=kappa^|tau| QF. In the all-zero packing,
Q=1, tau=M0=0, no inert premise needed.

Write Q=F^-1*(QF). The coefficient at M0 is a finite convolution
and has norm one. Ultrametricity chooses gamma+beta=M0 with
 |[X^gamma]F^-1 * [X^beta](QF)|>=1.
Differentiate exactly before bounding:
 |kappa|^|tau| |beta!| |[X^beta](QF)|
      = |(beta+tau)!| |[X^(beta+tau)]F|.
Since (beta+tau)!/(beta! tau!) is an integral product of binomials,
the same summand yields
 |[X^gamma]F^-1 [X^(beta+tau)]F|
      >= |kappa|^|tau| / |tau!|.
Set b=M0+tau. The capacity field proves b<=n componentwise,
and tau<=b. The degrees are exactly
 |b|=sum y_sigma(p^i_sigma+1), |tau|=sum y_sigma.
Rescaling back from F to Theta multiplies the product norm by
p^(rho |b|), since the total degree of the two coefficients is |b|.
The five-copy inverse and one-copy forward carrier from RUN53
concatenate for this SAME b, preserving coefficient indices.
Consequently the actual required lower bound is
 HasLargeSplit N 6 b
  (p^((1-1/(p-1))|tau|+rho|b|+sum_x v_p(tau_x!))).
No replacement of N, no loss by number of derivatives or convolution
terms. For the ramified zero packing the bound is 1 by the
constant coefficient (and both degrees zero). This is the native
exists_hasLargeSplit_of_pairs conclusion. RUN52 combines it with
Katz's complementary six-copy bound, and RUN53 transfers the
twelve-copy result to depth_indicator_jet -> hd -> heightLe_inv_ratio
-> signed Hecke repayment in (U,W,S). Keep those same witnesses.

## Verification and next obligation

Native command -v lean and lake returned empty locally. The actual
RUN28 output targeted_results.json on state branch was retrieved:
all_requested_checks_ok=true for its 14 checks only. The latest
primitive run 45803534769 output blob
088cd2ec0e935ee1a282f10096949bcf671cc804 was also retrieved:
all_requested_checks_ok=false; TiltingLemma and Filling.Moments
each have three named checks with returncode 0 and standard axioms
propext, Classical.choice, Quot.sound; JetExponentBound build
returncode 124, no probe. Neither run checks this file.
Old rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier use another
pin; no native execution or axiom report for this new file. Below
are prepared scalar certificates only; do not count as native PASS.
Keep original and reduced graphs intact; static edges
depth_indicator_jet -> exists_isFrobPacking -> three_term+order-size
+live-sum+depthLoss; -> exists_hasLargeSplit_of_pairs ->
thetaProducts_normal_form -> formal_parameter+frob_ext+frame
-> derivative recursion+convolution+factorial+carriers.
No global node deletion or claim that graph is elaborated.
Context cache key D,p,iota,frame,Theta,N,n,i,y, not theorem name alone.

RESUME HERE: expand CMLattice.exists_formal_parameter's actual
normalized inverse Z coefficient at q=p^e and the unit u1 for
inert e=2, with the norm_coeff_le_of_deriv tail bound. Audit the
explicit htheta/hL and two_pow size guards using Data.Magnitudes,
rather than repeat the matching or determinant argument. Native
batch to check this file and the actual DepthPairs and ThetaProducts
declarations when approved resources allow; preserve unresolved
formal group, reciprocity, integral frame, row/Selmer and A/B inputs.
HANDOFF TO: integration/editor/audit, kernel batch and theta lane.
-/

namespace CompactCharacterBoxes54

-- Large p capacity after substituting the actual incoming and outgoing witnesses.
theorem capacity (n c outgoing incoming : ℕ)
    (ho : outgoing ≤ n - c) (hi : incoming ≤ c) (hn : incoming ≤ n) :
    outgoing + incoming ≤ n := by
  omega

-- Small p depth loss absorbs the residual geometric budget, after the
-- actual consecutive-product valuation supplies the final premise.
theorem loss_budget (z b l : ℝ) (hz : 4*b + 4 ≤ z)
    (hl : z - 1 ≤ l) : z + 4*b ≤ 2*l := by
  linarith

-- Signed estimate used at the original first branch; no absolute-value loss.
theorem signed_remainder (h y n w v a : ℝ)
    (hy : y = min h n) (hh : h ≤ w) (hn : v ≤ n) :
    h - y + a ≤ max (w-v) 0 + a := by
  rw [hy, min_def]
  split <;> linarith [le_max_left (w-v) (0:ℝ), le_max_right (w-v) (0:ℝ)]

#print axioms capacity
#print axioms loss_budget
#print axioms signed_remainder
end CompactCharacterBoxes54

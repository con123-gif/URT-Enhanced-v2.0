import Mathlib

/-!
# RUN64 — compact signed value-family bridge (character_boxes, lane 6)
26 Nov 2026. Human derivation of the actual ValueFamilies.exists_isFamily
consumer, retaining its native measure suppliers. Scalar certificates below
are prepared, NOT newly Lean-replayed.

Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. ValueFamilies.lean blob
22b608a059e66ce3154e8e8e2d42d779cff0acad (same blob observed at main).
Other sources: New/Selmer/Corepresentable.lean
3e401695d96b8ea826d60dadf0174d366f85d37c;
New/Selmer/LevelPlacesChosen.lean d0bc51f21f85ddd396d3c6b33d045206a4a30565;
New/Selmer/AptTuples.lean 49699d4679d83a7bc7714afc53b7e2757ae4adf3;
New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d;
New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754;
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14;
Lib/General/NumberTheory/Valuation.lean c899d1a8a4d57c8e996b653e805d26ab5309f82d.
Credit underlying proof: Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude. No assumption of the RH conclusion.

Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, latest
completion-first allocation. Prior work RUN63 9661d855dd7d891db792904a35f3b392be046d88.
Avoid duplication: common roots already reconstructed in RUN50 and integration
fcd5da816a64d76e94c89f51ed0c766ff22b39a4; sharp Fitting and tied-prime
comparison by kernel RUN28. Latest peer Galois RUN64 d121241191355eac839a53886699e123688b9b39
addresses triangular recursion, not this signed value family.

## 1. Measure and exact sign transfer

Fix the actual Data D, embedding iota at ell, chosen w away from ell,
ramified pair p and s in {+1,-1}. Write z=p.z. Retain the native
Data.Pair.exists_isIntegralMeasure supplier:
there is ONE function F, K subset {0,1}, and m>=0 such that F(1)!=0,
there is integral group-ring interpolation at every tame modulus,
insertion of an unramified prime P without changing the underlying
character multiplies F by
  product_(k in K, e=+/-1) (1-(Y T)^e/q^(z-k)),
and for each actual twist tau,
  F(tau)=F(1)*levelNorm(tau)^m*ratio(p,tau)^(m+1).
Y is p.nu.baseChange.atUnif P, T is tau.baseChange.atUnif P,
q=P.q. The signs here are NOT independent of the later sign s.

The native two cases are z>1: intAlgPart, K={0}, m=0; and z=1:
F=|Mk*N*detPeriod(tau)|^2, K={0,1}, m=1. Here Mk=D.chosenGroupOrder
and N is the common bound from exists_modKernel_integral_bound.
For the latter, if A(tau)=sum_a c_a tau(u_a), the exact product
A(tau)*conj(A(tau)) = sum_(a,b) c_a*conj(c_b)*tau(u_a/u_b)
is a finite group-ring element, since tame characters are unitary.
No triangle bound, square-root or denominator for the character occurs.
Its coefficients are integral away from the modulus whenever both
coefficients and their conjugates are integral at every embedding there.
The source supplies this using Mk divisibility of the class stabilizers,
the common determinant-kernel bound J and the integral representative
construction. This explains the actual norm_sq step. Retain
isIntegralMeasure_intAlgPart, intAlgPart_eq_mul_L, detPeriod_insert,
stdClassSum_det_modKernel_eq, exists_modKernel_integral_bound,
the relevant Euler-product erasure and p.lValueProd_eq as lower-level
obligations; this run does not reprove their analytic/integral content.

For an auxiliary set I, every q_v is prime and v excludes
badPlaces D ell. If q_v divides ell*gProd*N, the corresponding rational
integer belongs to v since q_v does; contradiction. Hence the product
of q_v is prime to ell and to gProd*N. This is precisely
coprime_q_of_isAuxiliary, not a claim for arbitrary level primes.

Choose the finite interpolation support at I using the integral-measure
supplier for the trivial tame character with declared modulus I.
Write it sum_a c_a theta(u_a). All coefficients are ell-integral at iota.
Choose y_a with y_a/bar(y_a)=u_a (exists_divStar); the source equality
eq_of_mem_integralU1 identifies evaluation on u_a with the base-change
evaluation on y_a. Choose an Artin lift g_a once for each y_a.
Define, for arbitrary multiplicative Galois character chi,
  val(I,chi) = sum_a iota(c_a) chi(g_a^(-s)).
The finite support is fixed before chi is varied; the native finsum
reduces to this one finite sum for admissible I. For chi=tau.invAvatar,
the Artin identity is chi(g_a)=iota(BC(tau)(y_a))^(-1).
Thus exactly
  val(I,tau.invAvatar)=iota(F(tau^s with declared modulus I)).
In particular val(empty,1)=iota(F(1)) != 0, and this value is integral.
Do not require the exact conductor to equal I: the source accepts
enlarging the declared tame modulus while holding the character fixed.

For the converse at an insertion, IsFromU1 provides an idele character
factorization trivial on rational U(1) and the required congruence
kernel at I. It descends to the tame quotient; applying iota inverse
and choosing its inverse character yields tau with Q=I and
chi=tau.invAvatar. Equality follows on the surjective Artin image.
This is the existing exists_tameChar_invAvatar_eq proof structure;
retain its quotient and Artin surjectivity inputs. No arbitrary
Galois character is assumed to have such a descent.

## 2. Euler factor and tame generator

Use nu_(k,e) equal to the avatar of
(p.hasWeight.zpow e).toAlgebraic 0 (-(z-k)), k in Fin 2, e in Z^units.
Each is continuous by the native avatar construction. At a new split
prime P off the declared I and the bad set, apply the unramified
avatar_frob formula with the native Frobenius orientation. The exact
factor after replacing tau by tau^s is
 iota(1-(Y*T^s)^e/q^(z-k))
     = 1 - nu_(k,-e)(phi)*chi(phi)^(s*e).
This is the signed substitution (k,-e),(s*e) in hc in the native
exists_isFamily proof. The product has at most four factors, so if
each ellVal is <=c, ellVal_mul_le gives the insertion loss <=4c<=8c.
Use the native 8c for downstream compatibility. This argument
uses only one chi and the same val at both declared moduli; a
separate minimizing character per factor would not suffice.
Zero factors are excluded by the finite upper bound on their valuation.
If the earlier val is zero the extended-real inequality is automatic.

At the chosen w away from ell, let sigma be its actual tame generator,
and gamma the generating residue-field unit in the local Artin formula.
The tame local avatar identity (avatar_localArtin and
baseChange_finPart_locIdele) identifies nu_(k,e)(sigma) with a sign
power of iota(p.psi_w(gamma)); the unramified norm factor is trivial
on this inertia and p.psi at the conjugate chosen-place partner is
trivial by the source's chosen-place and support guards. Ramification
of p at w gives x=nu_(k,e)(sigma) !=1, x^(q_w-1)=1.
Put n=q_w-1. All x^j are units. The geometric sum is zero, so
 n = sum_(a=0)^(n-1) (1-x^a)
   = (1-x) sum_(a=1)^(n-1) sum_(j=0)^(a-1) x^j.
The last factor is integral; hence |n|_ell<=|1-x|_ell and
ellVal(x-1)<=ellVal(q_w-1), including ell dividing q_w-1.
This gives the exact tame-generator input to IsFamily.
No assertion that the difference is always an ell-adic unit.

## 3. Exact repayment and actual caller

For actual twist tau and its allowed s-power, set
b=val(empty,1), a=val(Q,tau.invAvatar), R=iota(p.ratio tau s).
By the signed transfer and native measure identity,
 a=b* iota(levelNorm(tau^s))^m * R^(m+1).
The levelNorm is prime to ell by auxiliary coprimality and has norm
one. If ellVal(a)<=ellVal(b)+c with finite c>=0, b!=0 integral,
then a!=0 and R!=0. The source ellVal is the nonnegative valuation
with infinity at zero. For nonzero x define signed real
v(x)=-log_ell|x|. On integral b (and a, by measure) v=ellVal.
Exact cancellation BEFORE any estimate gives
  v(a)-v(b)=(m+1)*v(R).
If v(R)<0 then ellVal(R)=0; otherwise divide by m+1>=1 to obtain
ellVal(R)<=c. In particular no extra conductor valuation is paid.
Do not assert signed additivity for truncated ellVal of arbitrary
nonintegral elements. This proves the final repayment in
exists_isFamily under the explicit measure, avatar and support inputs.

At TwistForRows.exists_mFoldTwist_selmerLengthLe, choose these families
for ALL ramified p and BOTH signs s, with one common external chosen
w and the same iota as the balanced rows. Since w.q=D.g i, the
AptTuples.ellVal_le_crudeUnit lemma at d=1 bounds the preceding
tame valuation by cr=crudeUnit D ell. Set eta=cr>0 in
exists_anticyclotomic_twist. The native bound on growth is
8*cr+eta=9*cr for every family and every power of the single twist.
The repayment then gives |iota((p.ratio theta s)^(-1))| <=
exp(9*cr*log ell). This is the ratio field in the actual row-twist
existential, used by FitTwistsExist.exists_isFitFamily. No loss
proportional to the number of families or signs; common selection
rather than separate optimizers is essential. The normalized
Selmer length bound is a distinct field, NOT proved by the ratio
calculation. Preserve the native all-prime budget and pointwise
balanced/pencil, reciprocity, local crystalline and row-length suppliers.

## Source-level graph and evidence

Original local call graph (names, not kernel graph):
 FitTwistsExist.exists_isFitFamily
 -> TwistForRows.exists_mFoldTwist_selmerLengthLe
 -> exists_anticyclotomic_twist + ValueFamilies.exists_isFamily
 -> Data.Pair.exists_isIntegralMeasure + coprime_q_of_isAuxiliary
    + exists_tameChar_invAvatar_eq + invAvatar_eq_of_artinMap_eq
    + avatar_frob + avatar_localArtin + norm_natCast_le_norm_sub_of_pow_eq_one.
Reduced human argument: same endpoints and all deep suppliers;
local repayment is the scalar identity v(a)-v(b)=(m+1)v(R)
and sign-preserving interpolation, no new assumptions. No globally
deleted declarations or axiom edges claimed. Existing original/reduced
graphs and all unresolved obligations preserved. Context cache key:
source pin, D,p,s,iota,w; never merge distinct s or embeddings.
The principal RH conclusion does not justify dropping the auxiliary
ramified characters or the all-prime family.

Native Lean/Lake unavailable locally. No rh_prune/rh_scan/rh_reduce/
rh_auto/rh_auto_frontier run on this caller; those tools require the
native environment. Previous CI actually re-read from state branch:
run 45799225653, compute/rh-compact-targeted-replay-20261126/
outputs/targeted_results.json, all_requested_checks_ok=true,
10 native named theorem checks and 4 independent scalar certificates;
RootsOfUnityPoints two actual theorem checks and axioms propext,
Classical.choice, Quot.sound. This is NOT a new replay of this file or
ValueFamilies. New scalar certificates below have no sorry or imports
of the RH theorem; execution and axiom output pending.
No full human proof or new native verification claimed.

RESUME HERE: incorporate this signed family at the actual TwistForRows
caller; prove remaining detPeriod_insert / integral determinant-period
measure supplier against native arguments, or close the outstanding
balanced-row primitive if already assigned by integration. Kernel lane:
target ValueFamilies.exists_isFamily, Data.Pair.exists_isIntegralMeasure
and the three scalar certificates; preserve resource guard.
-/

namespace CompactCharacterBoxes64

theorem ratio_payment (base total ratio conductor c : ℝ) (m : ℕ)
    (hc : 0 ≤ c) (hcond : conductor = 0)
    (h : total = base + (m : ℝ) * conductor + ((m : ℝ) + 1) * ratio)
    (hbound : total ≤ base + c) : max 0 ratio ≤ c := by
  rw [hcond, mul_zero, add_zero] at h
  have hm : 0 ≤ (m : ℝ) := by positivity
  have hr : ratio ≤ c := by
    by_cases hp : 0 ≤ ratio
    · nlinarith [mul_nonneg hm hp]
    · linarith
  exact max_le hc hr

theorem euler_payment (a b c d C : ℝ) (hC : 0 ≤ C)
    (ha : a ≤ C) (hb : b ≤ C) (hc : c ≤ C) (hd : d ≤ C) :
    a + b + c + d ≤ 8 * C := by linarith

theorem common_budget (cr c eta : ℝ) (hc : c ≤ cr) (he : eta = cr) :
    8 * c + eta ≤ 9 * cr := by linarith

#print axioms ratio_payment
#print axioms euler_payment
#print axioms common_budget

end CompactCharacterBoxes64

import New.Rows.GluedFormTheta
import Mathlib.Tactic

/-!
# RUN63 — one common frame supplies BOTH six-copy fillers in C
26 Nov 2026. HUMAN SOURCE-MATCHED, independent audit pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
predecessor b96a0bbd981922e95fe3abb64d7e7be9f8693b36. Read manuscript,
AGENTS, protocol, handoff, expansion and recent peers 93617ad4 (period
poles), 708be3d5 (Tate triangle), f2750806 (A numerical jet exponent),
e1c6215b (conjugate vacuum audit), 8f02772b (C rank-one repayment),
44a5d463 (moving vacuum), ce737b23 (finite Weil law). Do not repeat
those results. This supplies the previously implicit hC and F
bridges in RUN52–54 at the ACTUAL depth_indicator_jet, not JetExponentBound
(which is a different A upper-norm caller).

Source ledger (static, actual bodies):
New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e
  Data.depth_indicator_jet lines 33–143, specifically 50–113.
New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4
  exists_isTightFrame, norm_periodFactor_mul_conj_le_one,
  norm_iota_periodFactor_eq_one.
Lib/General/Algebra/DepthBounds.lean 76c0218d912404747bba4f33b6261ddbf9e86d17
  exists_monomial_max_norm_coeff, coeff_subst_linearSeries,
  IsCarriedBy.mul, IsLowestTerm.mul.
Lib/CM/LocalHeight/EulerAdditionFormula.lean 1bf5479d1d6e25211a8e8c09394a78d3fa546ae4
  multiPhiRing, subst_mem_multiPhiRing.
New/Curve/KatzDivisibility.lean 910b6f88933a9debb15df537fa834762f8da0723
  CMLattice.katz_divisibility_limit.
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
  thetaProducts_normal_form, exists_frame_rows_frob.
New/Curve/DepthPairs.lean d53a0d9e22baa06916be8cc331c4394340483e3e
  exists_hasLargeSplit_of_pairs.
New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84
  heightLe_inv_ratio, actual consumer.

## 1. The common finite maximum is chosen before splitting
Fix the native D, multi-index n, prime p and embedding iota. In
depth_indicator_jet use the RUN62 frame of length M=gProd and
R=3|n|. Its original scale guard is exactly (d N1)^6(R+1)<=M,
as supplied by the native HasLogBound and nominal-weight guards.
Let c_i be its multiplicities, S=periodFactor, and
  mu_i(x)=iota(S conj(Phi_x(w_i))).
All mu_i(x) are integral by norm_periodFactor_mul_conj_le_one;
one index i_* has |mu_i_*(x)|=1 for EVERY x, by RUN62.
Put L_i=sum_x mu_i(x) X_x and f_i=taylorVia(translatedWpDeriv)(L_i).
Each f_i has zero constant term (native HasSubst guard).
Theta is the product of taylorVia(theta)(L_i)^c_i; Theta(0)=1.
The ring R_mu=multiPhiRing(mu) is the image of integral formal
series in the f_i, not all integral series in the X_x.

For each exponent a, truncate the input formal series in f_i to total
degree <=|a|. Since f_i(0)=0, higher degrees cannot contribute to
[X^a](G Theta); the same holds even if Theta is not integral.
The finitely many eligible monomials f^e have |e|<=|a|, and one
maximizes the coefficient norm. Fix one maximizer e(a) for each a
and N(a)=|[X^a](f^e(a) Theta)|. Ultrametricity, with integral input
coefficients, proves |[X^a](G Theta)|<=N(a) for EVERY G in R_mu.
No compactness of C_p and no optimizing again after splitting.
This is exists_monomial_max_norm_coeff and hTheta in the caller.

RUN53 constructs Theta^-1 carried by five copies of this same N.
For any G in R_mu the exact identity (G Theta)Theta^-1=G
and finite coefficient convolution give IsCarriedBy N 6 G:
pick a maximum summand of the coefficient convolution, then concatenate
the one- and five-copy exponents. This proves the native h6, including
zero coefficients (the antidiagonal has (0,a)). The same e(a) witnesses
will be used for the final twelve-copy jet. No additional prime loss.

## 2. Katz filler hC — one univariate function and one common unit row
For any multi-index a, set A=|a| and rho=nonsplitWeight(d,p).
The Katz theorem (RUN52, addition/formal parameter suppliers RUN55–59)
gives g_A in phiSeriesRing with
  |A! [T^A]g_A| >= p^((rho-1/(p-1)) A).
Substitute ONLY the distinguished linear form L_i_*; this is an element
of R_mu by subst_mem_multiPhiRing. The multinomial theorem gives EXACTLY
 [X^a]g_A(L_i_*) =
 ([T^A]g_A) A! prod_x mu_i_*(x)^a_x / prod_x a_x!.
No other degree of g_A can contribute because L_i_* is homogeneous.
Take the norm after cancellation of A!, using simultaneous units:
 |[X^a]g_A(L_i_*)| >=
 p^((rho-1/(p-1)) A + sum_x v_p(a_x!)).
Apply h6 to this G. Thus the actual hC is
 HasLargeSplit N 6 a (p^((rho-1/(p-1))|a|+sum v_p(a_x!))).
This also holds a=0, with threshold 1. In particular this does not
require independent univariate maximizers at each place, nor a
different frame for each a. It works at p|N1 too; the special
cyclotomic unit vector from RUN62 is necessary there.

## 3. The better large-inert-prime filler F, exact Gram cancellation
When p is nonsplit the native chiK_eq_one_of_dvd implies p does not
divide N1; also p does not divide M=gProd because each chosen
factor of gProd is split (g_modEq_one, g_prime). Hence both S
and conj(S) have norm one by norm_iota_periodFactor_eq_one applied
to iota and iota composed with conjugation. In R_mu define
  H_x=sum_i c_i iota(conj(S) Phi_x(w_i)) f_i .
The scalar coefficients are integral by the conjugate-embedding
version of norm_periodFactor_mul_conj_le_one, and c_i are integers.
The translatedWpDeriv generator has zero constant and linear
coefficient 1 (the normalization in the native monomial calculation).
Thus the linear term of H_x is
 sum_y [sum_i c_i iota(conj(S) Phi_x(w_i)) mu_i(y)] X_y
 = iota(conj(S) S M) X_x.
The equality is the EXACT Gram matrix of the SAME frame; no
absolute value or bound is taken before orthogonality. Every
off-diagonal coefficient is zero, not merely small. Higher terms
have total degree >=2. Multiply F_a=prod_x H_x^a_x, which belongs
to R_mu. The only total-degree-|a| term of F_a is
 iota(conj(S) S M)^|a| X^a.
Its coefficient has norm one, all other terms of degree <=|a|
vanish. This is the native IsLowestTerm 1 F a witness at lines
95–105. Apply h6 to F_a to obtain HasLargeSplit N 6 a 1.
The p-unit assumption on M and the two period factors is essential;
do not apply this replacement in the split-prime case indiscriminately.

## 4. Substitution at the exact same twelve-copy caller
RUN52–54 give the inverse-carrier and Frobenius pack (i,y), with
b<=n, T=sum y, tau<=n, |b|=sum y_x(p^i_x+1), |tau|=T,
and HasLargeSplit N 6 b with exponent
  (1-1/(p-1))T+rho|b|+sum_x v_p(tau_x!).
Keep the N defined in section 1, not a second N.
For split p use hC at n and at 0. For nonsplit use a=n-b.
In the first packing alternative, i=1 and rho=1/(p^2-1);
collect the exact exponent before bounding:
  (1-1/(p-1))T+rho(p+1)T = T.
Combine with the unit F_a from section 3. In the other alternative
combine with hC at a from section 2. The factorial estimates and
packing inequalities in RUN52 then give, in all cases,
 HasLargeSplit N 12 n (p^(sum v_p(n_x!) - forcedPart(p)
                            - sum v_p(depthLossInt(n_x)))).
The original multiplicity condition c_i>=3|n| guarantees
3 e(alpha_j)_i<=c_i for each of the actual twelve split exponents:
e(alpha_j)_i<=|alpha_j|<=|n|. Thus the original finite-part
theta construction of RUN53 applies without enlarging the frame.
Use the already reconstructed indicator decomposition to supply
the exact inequality with t=Q u fixed BEFORE p and modulus are
chosen. Q=gProd^(24f) prod depthLossInt(n_x), u is the one nonzero
integral vacuum value. At heightLe_inv_ratio the n_x are
pair.c(x)-pair.z, and the modulus is D.𝔪 ϑ 1 false. Its call to
depth_indicator_jet explicitly instantiates these and the
native weight bounds. No substitute family, change of modulus,
or independent t is allowed. Peer 8f02772b handles the downstream
rank-one repayment; this is the missing same-frame bridge into it.

Original selected graph preserved:
depth_indicator_jet -> exists_isTightFrame, monomial maximum,
carrier inverse, Katz, packing, normal form, finitePart, vacuum.
Reduced human DAG: one frame -> same mu, Gram and i_*;
monomial maximum + inverse -> h6; h6+Katz+unit row -> hC;
h6+Gram+period units -> F_a; hC/F_a + packing -> twelve split;
same c_i -> finitePart -> indicator -> heightLe_inv_ratio.
Remaining explicit dependencies: RUN52–62 derivations need
independent audit, actual theta/CM generator and vacuum facts
and native magnitude guards retained as source-matched inputs.
No claim of global deletion or closure of Theorem C, A, B or RH.
Cache by pin,D,n,p,iota,frame,mu,e,N,modulus; sharing allowed only
within this context.

Local command -v lean/lake/elan returned no executables.
Old-pin reduction engines cannot be run on this compact toolchain.
Actual CI output re-read: 45803534769,
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, six native named
checks with only propext/Classical.choice/Quot.sound, one build
timed out (124); all_requested_checks_ok=false. Earlier targeted
receipt blob 23de197bd48f404ca2074c69676de289c4f7934e also read.
New scalar identities and native #checks below PREPARED, not run.
No finite numerical tests or synthetic data; exact human derivation.
RESUME HERE: editor splice sections 1–4 into the common C depth
proof with RUN52–62, retaining all actual guards. For this lane,
return to the remaining uniform C arithmetic suppliers in
New/Selmer/AptTuples and TwistForRows after checking peer coverage;
do not repeat the already sufficient theta jet assembly.
HANDOFF TO integration/editor, formal audit, theta, kernel and
arithmetic lanes. Human RH proof remains incomplete.
-/

namespace CompactCharacterBoxes63

theorem gram_scalar_cancel (s t M : ℂ) :
    s * (t * M) = t * s * M := by ring

theorem inert_exponent (q rho p T : ℝ) (h : rho * (p+1) = q) :
    (1-q)*T + rho*((p+1)*T) = T := by
  calc
    (1-q)*T + rho*((p+1)*T) = (1-q)*T+(rho*(p+1))*T := by ring
    _ = T := by rw [h]; ring

theorem carrier_cancel {R : Type*} [CommRing R] (G T U : R)
    (h : T*U = 1) : (G*T)*U = G := by rw [mul_assoc, h, mul_one]

end CompactCharacterBoxes63

#check exists_monomial_max_norm_coeff
#check coeff_subst_linearSeries
#check IsCarriedBy.mul
#check CMLattice.katz_divisibility_limit
#check Parameters.exists_isTightFrame
#check Data.depth_indicator_jet
#print axioms CompactCharacterBoxes63.gram_scalar_cancel
#print axioms CompactCharacterBoxes63.inert_exponent
#print axioms CompactCharacterBoxes63.carrier_cancel
#print axioms Data.depth_indicator_jet

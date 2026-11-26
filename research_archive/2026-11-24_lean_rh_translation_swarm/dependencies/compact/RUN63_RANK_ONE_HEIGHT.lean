import New.Rows.HeckeValueHeight
import Mathlib.Tactic

/-!
# RUN63 — rank-one test forms and height repayment at the C caller
26 Nov 2026. Human source-matched derivation, conditional on the named
native suppliers below; scalar certificates prepared, not compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10. Predecessor
7ab69780bb5236594ff427175c5dfd07c650412e. Observed branch head e1c6215b.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, CONTINUITY_PROTOCOL, current
manuscript (d6bcd686...), latest peer commits including 059f9ed6
(crystalline chart), b96a0bbd (tight frame), 34b19e8c (period basis),
f2750806 (A marked charge), 4b7508c2 (Cartan audit). No duplication of
their primitive supplier proofs.

Native bodies inspected:
- New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84:
  exists_twisted_classSum_ge, exists_factorisation_le, Pair.xiSum_mem,
  Pair.smul_apply_xiSum, exists_test_form_inner_kernelForm,
  heightLe_inv_ratio, heightLe_inv_heckeValueProd_div.
- New/Selmer/RankOneDenominator.lean 18776ac0e6b71a1f66075e9c7276e3aff757f18b:
  inner_twistedCentralOp, twistedCentralOp_kernelForm/trivialLift,
  DenominatorLe.rank_one_bound.
- New/Selmer/FitTwists.lean c62935a73ccbef6c7fc42f45c83f111e811a5825:
  IsTested, IsTestForm, DenominatorLe, IsRankOne, IsFitFamily.
- New/Rows/MonomialCoefficientVector.lean 18eefab455e1da09f1ad14995afb31a9da4c1959:
  exists_int_vector_harmonicPoly_eq, norm_conj_intAlgPart_le.
- New/Rows/GluedFormTheta.lean c5f883f964a7a968320874ac8edad52a14678c3e:
  depth_indicator_jet (exact statement and initial construction read).
- New/Rows/MemberOrthogonality.lean aca8828d477a4510ab80964e1572f34ef220a2c1:
  descentsVanish_hypSum, stdClassSum_period_eq_zero.
- New/Rows/Separation.lean cbd60ebb20b771dc6107f3d54df0397ee7707e4d:
  heightLe_norm_trivialLift_sq.
- New/Exchange/TriangleLevelExponent.lean e1b3a17423c1f003c1d5311ef484638973750ac4:
  ratio_eq_intAlgPart_div, intAlgPart_ne_zero, trivialLift_ne_zero.
- New/Exchange/AlgebraicPartDefs.lean 7d791291bd2f9b6e9bd1a21b20254632c3a3606c;
  New/Exchange/AlgebraicPartConjugates.lean 51b22723fa447dab6fd6161dbd12fbf73ae5dc63;
  New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518.
- New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b;
  New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
  primeSum_eq_sum_localAsk; New/Data/AdmissibleData.lean: dirCost.

## 1. Two exact finite selection identities, with no loss of class number

Let C be the U(1) double class group at the specified level, N=|C|.
The stabilizer hypothesis makes its class sum the ordinary sum. Choose
z inverse to the representative of the identity class, so one sample
g_c z=1 exactly. For s_c=s(g_c z), Fourier inversion at that class gives
s(1)=sum_{psi in C^} [N^{-1} sum_c psi(c) s_c],
since sum_psi psi(c)=N at the identity and zero elsewhere.
At the chosen embedding the ultrametric inequality selects one psi
whose normalized class sum has norm at least |iota(s(1))|. In the
native caller each psi extends to an actual weight-zero tame character:
this uses AutChar.exists_mem_tameChars and the stated containment of
principal level and rational points. It is not a claim that every
arbitrary collection of phases has that extension. There is no
additional |N|_l^{-1} loss after Fourier inversion.

Independently for the finite tame-character group G, suppose
V^|G|=prod_chi A_chi B_chi. Fix the selected psi and reindex A by
chi -> psi chi^{-1}, a bijection. Taking the norm after reindexing,
|iota V|^|G|=prod_chi |iota(A_(psi chi^{-1}) B_chi)|.
The maximal factor is at least |iota V|. This also works at zero,
though all factors of V in the actual caller are nonzero. The two
characters obtained multiply to the required psi, rather than being
selected independently. At infinity the same argument with psi=1
bounds every conjugate of V by the uniform bound for one such product.

## 2. Rank-one denominator: why a single gamma_l, not r gamma_l

Write L for the nonzero scaled or unscaled trivial lift; its span
is unchanged by the nonzero scaling. Let P_L be its orthogonal
projection and T_z=twistedCentralOp z. These operators have adjoints
T_(z^{-1}), fix L, and T_(z^{-1}) kernelForm(g)=kernelForm(g z).
Choose the representatives s_i integral above l as in the native
exists_reps_integralAbove, and form Y=sum_i T_(s_i^{-1}) Xi'.
The Weyl gauge transformation by these integral invertible central
scalars preserves integrality (the determinant-character multiplier
is a p-adic unit). In fact every embedding is permitted, though only
the distinguished embedding is required for Y. The sum is integral
by the ultrametric inequality. Xi is integral at all embeddings by
IsTestForm.

For a vector in the testing intersection in L^perp, central
translation preserves the finite idempotent image and Hecke kernel:
both commute with central scalar action. Translate that vector by
the inverse adjoints and sum. Its pairing against each kernel form
is the class sum of the translated kernels, namely a pairing against
the trivial lift, which is zero by L^perp. Hence the sum lies in
ker theta. The original tested property of Xi' (orthogonality to
the intersection with ker theta) gives zero pairing against Y.
This proves the required tested property of Y for L^perp; one must
not simply identify ker theta with L^perp.

Exactly P_L Y=N P_L Xi', since T_z fixes L and is unitary.
The one-by-one determinant of the denominator theorem is therefore
N <Xi,P_L Xi'>. Here dim span(L)=1 AND the source-side rank is 1
(U(1)); the latter is why exp(gamma_l), not exp(r gamma_l), occurs.
The native zero-lift case is trivial, but actual rank-one lifts are
nonzero. Thus for any two tested forms at the same l,
  |iota(N <Xi,P_L Xi'>)| <= exp(gamma_l).

## 3. Actual test form construction and its remaining supplier boundary

For p.IsRankOne j, use rank 12,4,4,2z-20 and the chosen three flat
partners q1,q2,q3. The integral coefficient functional for alpha
is v_i=coefficient_alpha(nablaBasis_i) in Z. Pairing against the
Fock polynomial gives prod_tau dg_tau! / prod alpha! times the
monomial, by the integral dual Gram identity (RUN62). If the selected
columns of g are the identity columns, transpose row substitution
fixes this monomial, hence the dual functional is fixed by the
specified Weyl representation. This is the actual
exists_int_vector_harmonicPoly_eq input, retaining the basis and
Fock covariance hypotheses.

Let F(h1,h2,h3) be the actual point form on the four blocks in
exists_test_form_inner_kernelForm. Use the SAME coefficient functional
and residue x0 throughout. The source forms
 Xi=xiSum_(q2,theta) xiSum_(q3,1) xiSum_(q1,1) F.
Each xiSum multiplies a class sum by chosenGroupOrder. Every class
automorphism order divides this integer; the remaining coefficient
is den/levelNorm^(rank-1) times gramForm(1, den*trivialLift).
The gramForm lies in the embedding valuation ring by the native
point-kernel gauge and integral Gram pairing. The denominator
levelNorm is a unit at l (also for the two trivial twists).
Point forms start integral by the integral vector and residue
construction. Induction on the three sums yields integrality at
every embedding. No conjugate choice of the vector is made.

Tested orthogonality is a different premise: the outer flat-block
period sum vanishes by stdClassSum_period_eq_zero at the actual
non-lift caller. Reflection sums kill the selected label image,
the non-lift vector is in ker theta and the off-level Hecke kernel,
the twist character is nontrivial at its twist places, the large
rank guard is supplied by IsRankOne, and the identity residue
columns give the stabilizer condition. This uses the native
period-vanishing theorem, whose full analytic proof is retained;
it is not an automatic consequence of integrality.

Applying smul_apply_xiSum three times gives the exact native pairing
formula, with X=lValueData(p,theta), K12 the specified rank-12
modKernel, and I_a=intAlgPart(q_a, chosen twist):
  <Xi,X.kernelForm(g)> * N^3 * vacuumScale^(2z-20+8)
    = (prod dg_tau! / prod alpha!) I1 I3 I2 K12(g).
This needs the native block factorization of the modular kernel and
the exact product of auxiliary characters; both are kept as supplier
edges, not replaced by an inequality. At the actual K caller the
depth_indicator_jet supplies a single nonzero t, uniformly bounded
over all complex conjugates, and for each embedding a monomial and
residue point with the normalized coefficient at least l^{-F_l}.
Apply section 1 first to that rank-12 kernel, then to the product
of untwisted flat values, including t, using the selected character
psi. The partners q1,q3 use exactly the resulting two factors of psi.
Using the displayed pairing formula, the native kernel-to-lift
normalization, jet coefficient identity and
q2.ratio=I2(theta)/I2(1), the actual K contract is
  |iota V| l^{-F_l} <= |iota(N^2 <Xi,L_theta>/rho2)|.
Here V^|G|=prod_chi I3(chi,1)*I1(chi,1)*t*I2(1).
The last normalization/jet coefficient conversion is source-matched
as a retained exact interface; a full independent reconstruction of
the modular kernel equality and depth coefficient theorem is OPEN.
In particular a large coefficient of an arbitrary polynomial would
not supply K. The conjugate bound for V follows by section 1:
each of its three flat factors is bounded by exp(x^34) and t by
exp(f*m*b/k), with 3*x^34+f*m*b/k <= B0 from the native scale guards.
Thus |sigma V| <= exp B0 for ALL sigma, and V is nonzero.

## 4. Local conjugate pairing removes the square-root and all N losses

Fix iota and separately apply K at iota composed with complex
conjugation. These are both embeddings into the same local field
and their possibly different test forms Xi,Xi' are legitimate
because IsTestForm requires ALL embeddings. rho2 is real and nonzero;
L_theta is nonzero. Multiply the two inequalities, BEFORE bounding
the individual pairings. Since the inner product is conjugate-linear
in its first variable,
  <Xi,P_L Xi'> = <Xi,L><L,Xi'> / ||L||^2.
Therefore the product of the two local right sides equals
  |iota(N <Xi,P_L Xi'>)| * |iota(N^3 ||L||^2/rho2^2)|.
The left side is |iota(V star(V))| l^{-2 F_l}.
By the previous denominator estimate,
  |iota(V star(V) rho2^2/(N^3 ||L||^2))|
      <= exp(gamma_l + 2 F_l log l).
This is the actual local HeightLe witness, with the exponent 2F_l,
not F_l, and N^3, not N^4. No inequality comparing complex absolute
value with p-adic absolute value was used. Its archimedean exponent
is 2B0 since conjugation permutes the automorphisms. The sum of
gamma_l is bounded by B0 for every finite prime set by IsFitFamily.

Put S=sum_sigma jetSize(w_0(sigma)), A=sum_sigma
primeSum(nominalWeight(sigma),sigma). For each U>=ceil(x1), the native
primeSum_eq_sum_localAsk and the finite interchange give EXACTLY
 A = sum_{l<U, prime} 2 F_l log l, dirCost=S-A.
No extrapolation of finite samples and no unproved tail estimate:
the native finite support identity applies because nominalWeight<=a.

Thus the height of y2=rho2^2/(N^3 ||L_theta||^2) is <=3B0+A.
The constant untwisted norm ||L_1||^2 has height <=B0-S by
heightLe_norm_trivialLift_sq. This uses the SAME rank flat comparator
and the common conjugate period constant; see Separation and
AlgebraicPartConjugates. The q2 inverse squared ratio has height
<=2*x^999, since q2 is ramified by its actual choice omega. Multiply
the three families: rho2 cancels EXACTLY; the result is
  y=||L_1||^2/(N^3 ||L_theta||^2).
Its height is bounded by
 (B0-S)+2*x^999+(3B0+A) <= 6B0-dirCost,
using x^999<=B0. The desired inverse ratio is
  rho_p(theta)^(-1)=levelNorm^(rank-1) ||L_1||^2/||L_theta||^2.
Thus at iota its norm is <= |iota y|: the level norm is a unit and
|iota(N^3)|<=1. Monotonicity of HeightLe supplies the actual
heightLe_inv_ratio conclusion. This final step does NOT require N
prime to l. Together with the exact counts in RUN62 it feeds
heightLe_inv_heckeValueProd_div, then heightLe_liftVolume_ratio,
then LongForms and star_inequality. The rank-one argument is now
assembled at its real caller conditional on the retained inputs.

## Dependency and verification ledger

Source-visible, not elaborated:
heightLe_inv_ratio -> K (depth_indicator_jet, twisted_classSum,
factorisation, integral test form, exact kernel-to-lift normalization),
rank_one_bound (integral representatives, central covariance,
DenominatorLe), norm_conj_intAlgPart_le, heightLe_norm_trivialLift_sq
(conjugate period and integral measure), ramified height,
primeSum_eq_sum_localAsk, HeightLe.mul/mono.
Reduced human graph shares the same V,t,N,L and rho2 across the two
embedding inequalities and one HeightLe witness. All named
supplier edges survive; no deletion from the kernel graph or
change to the original pin. In particular fit-family existence,
period vanishing, the depth coefficient theorem, conjugate period
estimates and finite modular block identities are not discharged
by the scalar algebra. No RH theorem used as premise.

No Lean/Lake on PATH in local execution. Prepared scalar identities
below for actual compact namespace. Old-pin rh_scan/rh_prune/
rh_reduce/rh_auto/rh_auto_frontier cannot be honestly run against
this compact environment. Preserve all old graph and axiom evidence.
Retrieved actual compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json and run 45803534769 job steps:
six native declarations in TiltingLemma and Filling.Moments with
only propext, Classical.choice, Quot.sound; module_1 timed out
2700.11s, all_requested_checks_ok=false. This does not verify any
new certificate. No PASS or new independent kernel discharge claimed.
Do not modify the protected runner/workflows.

RESUME HERE: inspect remaining primitive depth_indicator_jet in
New/Rows/GluedFormTheta.lean, especially coefficient extraction from
the actual tight frame and FrobPacking, and bridge its precise
normalization to K. Compare peer b96a0bbd before reconstructing.
Also close the modular block kernel equality at the native
exists_test_form_inner_kernelForm caller, retaining period vanishing.
HANDOFF TO integration/editor/audit/kernel. Parent observed e1c6215b,
previous lane SHA 7ab69780bb5236594ff427175c5dfd07c650412e.
-/

namespace CompactDependencyRun63

theorem conjugate_product_budget (u v a b c d E : ℝ)
    (hu : 0 ≤ u) (hv : 0 ≤ v) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (h1 : u ≤ a) (h2 : v ≤ b)
    (hc : 0 ≤ c) (hd : 0 ≤ d)
    (he : a*b = c*d) (hden : c ≤ E) :
    u*v ≤ E*d := by
  calc
    u*v ≤ a*b := mul_le_mul h1 h2 hv ha
    _ = c*d := he
    _ ≤ E*d := mul_le_mul_of_nonneg_right hden hd

theorem exact_rank_one_budget (B S A X U : ℝ)
    (hU : U = S-A) (hX : X ≤ B) :
    (B-S) + 2*X + (3*B+A) ≤ 6*B-U := by
  linarith

theorem ratio_cancellation (L0 Lt R N : ℂ)
    (hR : R ≠ 0) (hLt : Lt ≠ 0) (hN : N ≠ 0) :
    L0 * R⁻¹^2 * (R^2/(N^3*Lt)) = L0/(N^3*Lt) := by
  field_simp [hR, hLt, hN]

end CompactDependencyRun63

#check exists_twisted_classSum_ge
#check Data.exists_factorisation_le
#check DenominatorLe.rank_one_bound
#check Data.exists_test_form_inner_kernelForm
#check Data.heightLe_inv_ratio
#print axioms CompactDependencyRun63.conjugate_product_budget
#print axioms CompactDependencyRun63.exact_rank_one_budget
#print axioms CompactDependencyRun63.ratio_cancellation

import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN48 — level-prime scalar, standard datum and actual local caller
27 November 2026. SOURCE-MATCHED human derivation, PREPARED Lean probes;
no new kernel replay. Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Prior RUN46 14196cf5 and RUN47 43ff3e37 retained, not treated as native checks.
Latest manuscript blob 29820c25acc91450aa8ec712774b57b3d0051c41;
peer integration head observed 392d881d. No Main or RH theorem import.

## 1. Exact scalar transport across pairs
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48,
Data.norm_detCharAt_diagN_le, Data.chain₂_pairTranslates_eq_smul_chain;
New/Seesaw/NamesAtSplitLevel.lean f404d684189e658efb32374c500cd05900e12ba7,
pairWeilFinite_name, LiftLaw.u₀_charDatum_eq_fourierOp, compUpTo_pairs_eq_smul.
The same-pin readable companion grh/src/New/UpperBound/Divisibility/ValuationAtLevel.lean
68bd72c2e9fa90664a2e91614f4cf706031bd98f makes the factors explicit; use
only the weaker compact budget, not the companion's final theorem.

Write q=varrho+1, m=2q, n_j=rank X_j, C=m f b.
For a lift j let A_j(r,g)=detCharAt((chainChar ϑ (j+1)).baseChange r,g).
For g,k on the split places, the exact finite Weil formula and lift equivariance give
    L_j[f(k^-1 T g)]φ =
      A_j(n_(j+1),g)/A_j(n_j,k) · ρ_(j+1)(k)L_j[f]ρ_j(g^-1)φ.
Integral invertible g,k give character factor 1 by the actual unramified condition.
Let d_j=diagPointN j. Move the two diagonal changes in a pair's translated
data through the lifts using this identity. The intermediate
ρ_(2i+1)(d_(2i+1)) and its inverse cancel, before taking norms.
The remaining outer operator is ρ_(2i+2)(u0), in the conjugated bases,
where u0 is diag(1,...,1,N^-1) on S=nonInducedPlaces. Its coefficient d_i
is the product of two A_j values at diagN on piPlaces and S minus piPlaces
(respectively first and second lift). The native compact character bound
is N^(2fb) per value; hence |d_i|_N <= N^(4fb).
The rank shift coefficient is
    γ_j=A_j(n_(j+1),diagN_on_S)/A_j(n_j,diagN_on_S).
The determinants of the two diagonal matrices agree at every place,
even though their ranks differ. Since n_j<=n_(j+1), the native
norm_detCharAt_diagN_anti gives |γ_j|_N<=1. Denominator nonzero because
the characters take values in units. Do not bound numerator and denominator
separately by upper bounds and then divide.

For the primitive residue vectors y (unit coordinate at each place),
integral GL transitivity sends lastBasisVector to y. LiftLaw.integral_equivariant
therefore identifies every term after the adjacent actions cancel.
Nonprimitive vectors contribute zero via eq_zero_of_smul_invariant and the
actual ramified hypothesis, not by character orthogonality on arbitrary forms.
The Fourier commutation identity is
    F_(j+1) B_j φ = γ_j B_j F_j φ
for B_j=L_j[lastColDatum lastBasisVector] and ramified φ.
The ramified condition persists along B_j and powers of F_j by the native
scalar-commutation proof in compUpTo_pairs_eq_smul: a scalar central action
witness commutes with F, and integral equivariance transports the witness
through B_j. Induct on j, then on the number of pairs. The factor is exactly
    t = ∏_(i<q) (d_i o_i ∏_(j<2i+2) γ_j),
where o_i is the cardinality of the primitive vectors. Each o_i is a natural
number, so its N-adic norm is at most one (even if zero); there is no
division by o_i and no archimedean factor. In particular
    |t|_N <= (N^(4fb))^q = N^(2C).
The scalar is independent of the finite data v and φ; hence it factors
out of the later good-datum sum. This is the actual compact bound, not a
claim of the stronger readable companion exponent. Original primitive
vector existence and LiftLaw hypotheses remain.

## 2. Standard datum at N: no denominator from the jet weight
TwistedHeckeType.name_lastColDatum_mem_raises;
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
isAdmissibleComb_name, standardData;
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
mem_raises_of_standardData, Kernel.smul_mem_raises.
At the induced place the residue map q_K on O_K has kernel |ι(x)|<1.
The residue field has cardinal N by the native N_modEq_one guard.
Choose integer c with q_K(c)=q_K(c₀(P.d)), and a=c₀(P.d)-c.
The map at every induced embedding agrees on K, so a vanishes at every
induced place; conjugate a vanishes at the noninduced places.
If u=q_K(c₀), then q_K(star a)=1-2u and (1-2u)^2=-q_K(P.d).
Since N does not divide P.d, this square is nonzero, hence
q_K(star a*P.d) != 0. Thus |ι(star a*P.d)|>=1 (indeed equality by
integrality), and a!=0. This uses split level, not a generic residue field.

Choose the actual modulus whose places are S and whose ideal contains N and
star a as in the compact proof. The last-column indicator takes only 0,1
and hence is integral. Fourier expand it on the finite residue matrix
module: inverse transform costs the order of the module, dividing
    c_N = absNorm((N))^(n_j n_(j+1)) = N^(2 f n_j n_(j+1)).
The primitive additive character orthogonality and lifted translations in
isAdmissibleComb_name give c_N times the datum as an integral combination
of Heisenberg translates of the projected vacuum, with a times their
translation coordinates integral above N. Projection of the original
translated vacuum is either zero or that translate with coordinates
integral on the conjugation closure of the modulus: this is exactly
projOn_finHeisOp and boxIndicator_apply, not an assumption that every
original translate is N-integral. The surviving translates lie in
standardData(a) by finHeisOp_mem_standardData. Consequently
c_N·Θ is standardData(a). The source theorem for its jet gauge gives
    (|ι(star piG)|/|ι(star a*P.d)|)^boxes <= 1.
No jet-degree loss remains, since numerator <=1 by integrality and
denominator >=1 by the nonzero residue argument. Divide by c_N only now:
    raise(Θ) <= |ι(c_N^-1)| = N^(2 f n_j n_(j+1)) <= N^(fb).
Last inequality: n_j,n_(j+1)<=n_m and 2 n_m²<=b by the source scale
guard. Retain the standard-data jet theorem and its hypotheses; the
explicit new derivation is the level-prime construction and cancellation.

## 3. Level-equivariance, actual chain and valuation
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7,
IsGoodDatum.gaugeLe_chain, IsGoodDatum.chain_at_N;
TwistedHeckeType.Data.gaugeLe_Bmu_at_N.
In bases d_j,d_(j+1), a level pair has local components A,B in the
mirabolic (RUN47): A e_last=e_last, B e_last=e_last modulo N. On integral
matrices the indicator of T e_last=e_last is invariant under B^-1 T A,
because (B^-1 T A)e_last=B^-1 T e_last. Integrality is preserved in both
directions by integral inverses; off the integral matrices both indicators
are zero. This is the actual compact caller's pairWeil_name_of_mem and
liftIntegralFn_mul identity, retaining the native integral level and
character conditions. Conjugating the datum by ω(d_j,d_(j+1)) transfers
the gauge from (1,1) to (d_j,d_(j+1)) by the group law, and the preceding
invariance gives the required ht for IsGoodDatum.gaugeLe_chain.
Use the native good-datum joint invariance and exists_chain_eq_sum to
evaluate the chain over class representatives. Each individual propagated
gauge is <= N^(sum_j fb)=N^C; Ψ coefficients have norm <=1 by coprimality.
Ultrametric summation keeps the same bound, with no number-of-classes
or number-of-translations factor. This also explains why it is not valid
to treat arbitrary unrelated chains as pointwise sums with integral
coefficients: the native joint-invariance identity is used first.
For F^q φ integral at d_0, combine the same scalar t from step 1 with
H.chain_at_N and restrict to Y using GaugeLe.restrictToY_of_diag:
    GaugeLe 1 N^(3C) (Bμ ϑ Ψ φ).
No separate choices of t for different terms.

Actual consumer New/Columns/LocalStatement.lean
9d5bd0d698b0db2850cbd306d8d400d7e99a3547,
Data.exists_indexDvd_Bmu_divisible, p=N branch.
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
allowedLoss(N)=4C (split case). From RUN46/47 Fourier index on integral
columns, take the same comap S={φ:F^q φ integral at d_0} and its index
witness exponent <=4C dim(Column). This choice is independent of Ψ and ϑ.
For the native integer β<1-4C and C>=1, 3C<=-β.
Since |N^-β|_N=N^β, multiplication gives gauge <=N^(β+3C)<=1.
This supplies the p=N divisibility branch with the original budget.
It does not discharge the other prime branches, the earlier determinant
witness audit, or the standard-data jet supplier as an independent theorem.

## Kernel evidence and dependency ledger
Read actual persisted compute/rh-compact-primitives-replay-20261126/status.json
and outputs/targeted_results.json on cathedral-research-state, run 45803534769,
job source SHA 2ba4fee750f6f5cbd30f2db9e6b44bf3931ca84c.
Overall status ERROR, wall 5147.99 s. Native module 0 New.Selmer.TiltingLemma
build 1051.08 s, probe 4.62 s return 0; IsPencil.length_le_of_unseen_class,
tilting, IsPencil.length_le_of_drop_ties each only propext, Classical.choice,
Quot.sound. Module 2 New.Filling.Moments build 1291.02 s, probe 4.88 s
return 0; Filling.energy_fixingSet_le, Filling.sum_le_of_positive_type,
Filling.Fits.exists_translate_finrank_comap_le same three axioms. Module 1
build timed out 2700.11 s, exit 124; all_requested_checks_ok=false.
Workflow job success alone does NOT signify theorem replay success.
This is six actual named checks in the existing batch, not RUN48 or
whole RH verification. Preserve partial evidence separately from error.
Local command -v lean/lake/elan yielded no paths; no fresh native
rh_scan, rh_prune, rh_reduce, rh_auto or caller replacement replay.
The below certificate is PREPARED only. No independent audit yet.
No duplicate CI build or protected workflow edit.

Original visible chain (not complete elaborated DAG):
short_forms -> exists_indexDvd_Bmu_divisible(p=N) ->
exists_indexDvd_fourierOp_pow AND gaugeLe_Bmu_at_N ->
chain₂_pairTranslates_eq_smul_chain + name_lastColDatum_mem_raises +
IsGoodDatum.gaugeLe_chain -> LiftLaw, finite Fourier standardData, jet bounds.
Reduced human route: common scalar + residue unit + m gauge steps +
original Fourier index. Retain every original edge, pending native
declaration/axiom evidence, and non-N branches. Context includes pin,
D, N, twist, each rank, level pair, modulus, gauge d_j and support Ψ.
No global pruning asserted; do not substitute a proof of the claimed RH.

RESUME HERE: independently audit RUN46–48 at LocalStatement p=N;
then attack Columns.hasType_markOperator in TwistedHeckeType, specifically
the exact parahoric double-coset injection and tensor comparison with
TwistingData.hasType_twisted_hecke. Use peer marked-stage results without
repeating already derived stage counts. Native A replay remains blocked
by build budget; split only via existing runner and coordinate with
acceleration. HANDOFF TO integration, theta, audit.
-/

namespace RUN48

theorem residue_unit {K : Type*} [Field K] (u d : K)
    (hd : d ≠ 0) (h : (1 - 2*u)^2 = -d) :
    (1 - 2*u)*d ≠ 0 := by
  apply mul_ne_zero _ hd
  intro hz
  rw [hz, zero_pow (by decide : (2 : ℕ) ≠ 0)] at h
  exact hd (neg_eq_zero.mp h.symm)

theorem level_exponent_budget (C beta : ℝ)
    (hC : 1 ≤ C) (hb : beta < 1 - 4*C) :
    beta + 3*C ≤ 0 := by linarith

theorem pair_budget (q m f b : ℝ) (hm : m = 2*q) :
    q*(4*f*b) = 2*(m*f*b) := by rw [hm]; ring

#print axioms residue_unit
#print axioms level_exponent_budget
#print axioms pair_budget
#check Data.norm_detCharAt_diagN_le
#print axioms Data.norm_detCharAt_diagN_le
#check Data.name_lastColDatum_mem_raises
#print axioms Data.name_lastColDatum_mem_raises
#check Data.chain₂_pairTranslates_eq_smul_chain
#print axioms Data.chain₂_pairTranslates_eq_smul_chain
#check Data.gaugeLe_Bmu_at_N
#print axioms Data.gaugeLe_Bmu_at_N
#check Data.exists_indexDvd_Bmu_divisible
#print axioms Data.exists_indexDvd_Bmu_divisible
end RUN48

import New.Seesaw.SeesawTheorem
import Mathlib.Tactic

/-!
# RUN74 — last-stage branching period, common finite mean, and actual seesaw consumer
27 Nov 2026. Source-matched HUMAN DERIVATION; prepared Lean scalar certificates and
native declaration probes, not executed. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission latest blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
including completion-first and mandatory engine; read AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION, continuity and compact manuscript. RUN73
229904885da630e98098edb9463e6ca2f3b62b70. Recent peers 392d881d (integration),
47dd3858 (Casimir), 2a198f50 (CM generator), 72775cce (level gauge),
2057d58e (Fourier band). The already integrated theta RUN51 3180f6da
establishes the admissible datum mechanism with retained branching period;
do NOT duplicate denominator clearing K^(2m), glued projection or stage cuts.
This run supplies the retained last-stage period argument from its actual
proof body. No URT, no new asymptotic claim.

## 1. Compact rank-one averaging produces exactly the prescribed branching map

At BranchingPeriod.lean 148–172 fix standard V, the specified rank-one
block embedding j, actual branching matrix A and hA : SpansBranchingMaps,
linear functional t and vector c (the latter is the highest vector at the
DegreeBounds consumer). Let H=G_inf(V), compact with the native Haar
volume, S(x)=conjWeylMatrix_(κ₀,e₀)(x),
T(x)=conjWeylMatrix_(κ,e)(j_inf(x,1)). The source average is the
rectangular rank-one matrix M=c t, not a square projector:
  B = ∫_H S(x) M T(x)^(-1) dx.
All spaces here are finite-dimensional and the integrand continuous; the
integral is entrywise. For y in H,
  S(y) B T(y)^(-1)
    = ∫_H S(yx) M T(yx)^(-1) dx = B.
The inverse order in T(yx)^(-1) is essential. Multiplying on the right
gives B T(y)=S(y)B. Every complex linear functional commutes with this
finite-dimensional integral. This reconstructs the actual
exists_intertwining_mean application, with the same measure, no
probability renormalization imposed by hand.

To invoke hA, whose statement is written for weylRep and NOT conjWeylRep,
take any tuple g of complex unitary matrices and use the element y of H
whose matrices are the entrywise conjugates of g. Conjugation preserves
unitarity, and commutes with the block embedding diag(g,1) and reindexing.
Then S(y)=weylRep_(κ₀,e₀)(g), T(y)=weylRep_(κ,e)(diag(g,1)).
Consequently the intertwining equation is precisely the antecedent of
SpansBranchingMaps (Branching.lean 139–141), and hA gives ONE C with
B=C A. This C is fixed by t,c and the fixed representations/measure,
before choosing ψ, Φ, u, L or level K. It may be zero. We have not
assumed A is an orthogonal projection or derived branching multiplicity
one from Haar invariance; the actual hA (D.branching.2.2.2) survives.

## 2. The block period on the actual adelic quotient

For the actual smooth algebraic form ψ, finite rank-one point u, and
automorphic Φ(x,g)=L_g(S(x)c), let v_g=ψ(j((1,g),1,u)). By algFormCoeff_apply
the other factor at (x,g) equals t(T(x)^(-1)v_g). Therefore the product
at fixed g is exactly L_g(S(x) M T(x)^(-1)v_g).
Apply the linear functional X↦L_g(Xv_g) to B=C A. This integrates the
product over the real compact group to C L_g(A v_g), with no bound,
absolute value or separate scalar for each g.

The product is automorphic: Φ already is; the block coefficient is
left invariant under rational points by the rational equivariance of ψ
and j, continuous, and fixed on the right by the preimage of a finite
open stabilizer of ψ under the continuous finite block embedding.
The product's stabilizer is the intersection with the stabilizer of Φ.
Use integral_eq_classIntegral_of_isLevel at the actual level K ≤ Kf.
Its exact normalization is [Kf:K]^(-1), not [K:Kf] or an unweighted class
sum. The proof refines to the common open stabilizer ∩ K, uses the
quotient class sum with reciprocal stabilizers and cancels relative
indices by multiplicativity. We retain these measure/quotient identities
as named foundations. Substitution yields exactly
  ∫_[V] Φ(h) algFormCoeff(1,t,ψ)(j(h,1,u)) dh
      = C/[Kf:K] classIntegral(K, g↦ L_g(A v_g)).
This is the conclusion of integral_algFormCoeff_blockEmb in the
compact pin, with C uniform in all variables quantified after it.

## 3. Exact cancellation of the last-stage dimension and branching scale

At DegreeBounds.lean 18–34 set M=D.m by its equality e. The last Y
is standard and lastGrading has no isotropic coordinates split off.
Use the source relabeling along lastIndexEquiv: equality of rational
coordinate matrices implies equality of points (rat-coordinate embedding
injective). Thus F(inclX k)=algFormCoeff(1,t,ψ)(blockEmb(k,1))
describes F everywhere. The source mem_besselGroup_iff for lastGrading
gives ratBessel=the full rational group; the two quotient measures agree
under this identification. This step would not hold for arbitrary earlier
graded stages.

Write xAlg=toAlgForm(D.isHCParam_Y)(x), v⁺=highestVector,
d=card(WeylIndex on last Y), and
  b=∏_τ Φ_τ(star(D.π))^(D.branchExp τ)  ≠ 0.
Each factor nonzero since D.π is nonzero and the exponents are integers;
d>0 by the actual nonempty WeylIndex. In compact ColumnDefs.lean 93–97,
restrictToY is exactly b^(-1) times the branching matrix applied to
ψ(borderU g). The sign of branchExp in restrictToY is negative.
Use star_ofAlgForm and ofAlgForm_toAlgForm to identify the test function:
  star x(x∞,g)=gramForm(xAlg(g))(S(x∞)v⁺).
Set
  Q=classIntegral(Kf, g ↦ gramForm(xAlg(g))(A ψ(borderU g))).
This is ONE finite mean used on both sides. At K=Kf the index is 1;
the result of section 2 with u=1 gives the period I=C Q.

Define the actual linear map R=(toAlgForm)^(-1) ∘ restrictToY.
By integral_mul_eq_classIntegral, applied to the SAME test form
star x and algebraic form restrictToY ψ, and the exact Petersson
inner-product convention (conjugate linear first, linear second),
  <x,Rψ> = d^(-1) b^(-1) Q.
It follows, cancelling d,b BEFORE norms or inequalities, that
  I = (C d b) <x,Rψ>.                                    (★)
This is exactly the scalar in DegreeBounds.exists_last_stage_map.
The companion at the same pin grh/src/New/UpperBound/Seesaw/SeesawIdentity.lean
90–149 spells out the two sides; it was used for clarity, not imported
as a proof or treated as identical source. Compact b and d above were
checked against the actual compact definitions. No division by C, Q,
the period, or the test vector norm. The case C=0 is included.

## 4. Actual caller and one common scale for every twist

The first field of exists_last_stage_map now follows by applying
toAlgForm to liftChainY=R(chainComb) and cancelling its inverse:
iota(ϑ,y)=Bμ(ϑ,Ψ,φ), using GradingsOfY.Data.ι and
CrudeModularData.Data.Bμ. This is a direct equality, not a norm estimate.

At SeesawTheorem.seesaw the earlier stage unfolding gives the scalar a
and finite tensor w_ϑ; the reduced-vacuum substitution gives C_vac and
d₀=cutBound^(2m). They are independent of twist as required by their
quantifier scopes. Use the already integrated good-datum construction
(RUN51), with u=normUnit(a C_vac/d₀), to obtain Ψ_ϑ for the tensor
u a w_ϑ. The last-stage coefficient identity (★) supplies the specific
function of ξ used by the unfolding, not a second arbitrary constant.
For every test form Ξ, apply unfolding with z=conj Ξ and L equal to
the composition of the paired lift, R, and innerₛₗ(Ξ). It gives
  <Ξ,liftChainY(ϑ,P(u φ))> = <Ξ,R(chainComb(ϑ,Ψ_ϑ,φ))>.
The coefficient u enters in the second slot, so no conjugate of u is
introduced. Nondegeneracy in the Hilbert space gives equality of forms
(take Ξ equal to the difference); apply the first field above. This
explains the exact ext_inner_left and linear-map equality in seesaw,
with exists u∈ℂˣ forall ϑ exists Ψ forall φ in that order. No claim
that a or C_vac is nonzero; normUnit is a unit even at zero. The
normalization at zero is handled by the retained admissible-combination
proof, not by division by these scalars.

At ShortAndEnough.lean 114–121,146–162 the SAME u defines
scaledInclusion and projectedPoincare. The same good Ψ for each twist
supplies BOTH the archimedean weylNormSq_Bmu_le and local
exists_indexDvd_Bmu_divisible consumers. No extra scalar can be chosen
for each prime, twist, row, or test form. This connects the local
RUN72–73 stage-support derivation to the actual A consumer through the
last-stage period. Retain all prior A local and archimedean primitive
obligations, including hA/hM for pairEvalY and all named earlier
unfolding/branching/CM inputs; this is not a proof of Theorem A
independent of those foundations and not a prime-window bound.

## Source and graph ledger

All paths below relative to compact src, exact blobs:
Lib/Weil/CompactLift/BranchingPeriod.lean 9ed09fe6527b822004076503163d1a9cb8859d91 148–172
Lib/GLn/SchurModule/SchurOrthogonality.lean 38fc814129f5fb9216021443b33a42769d18374d 22–24,39–40,60–71
Lib/GLn/Branching/Branching.lean 669d2de08c3fa16386120153629ca6cde94e5dde 137–141
Lib/Adelic/CuspForms/AlgebraicForms.lean 87364d2fbd0c35cc9e06c67916be8345f68a8725 26–51,55–62,87
New/Filling/DegreeBounds.lean ce002c043a5f5e1d8f5902fe47eebd7ae03c87ba 14–34
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65 78–97
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b 61–62
New/Seesaw/SeesawTheorem.lean 0e6f5541f15ddb75c30751d22163bfdbd4194d91 final seesaw
New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9 43–82,121–136
New/Seesaw/AdmissibleComb.lean 6519d031bf78b2243efbb71d09f47e500c1bf32c 79–83
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a 114–121,138–168.

Original selected edges: star_inequality -> Data.short_forms -> Data.seesaw
-> {exists_isAdmissibleComb_unfolding, exists_isAdmissibleComb_reducedVacuum,
exists_isGoodDatum_of_invariant, exists_last_stage_map, unfoldStage_even}.
Last-stage -> {integral_algFormCoeff_blockEmb, integral_mul_eq_classIntegral,
toAlgForm, restrictToY, lastGrading identification}; blockEmb period ->
{exists_intertwining_mean, SpansBranchingMaps, integral_eq_classIntegral_of_isLevel,
automorphic coefficient}. Reduced human chain uses the one matrix B,
one finite mean Q and exact (★); all named hypotheses above survive
unless proved here. No global native-edge deletion; keep original
and reduced graphs and axiom evidence. Cache key: compact pin, D,
last stage, j, A, t, c, measures, K, φ, Ψ, same test Ξ. No reuse across
incompatible weights or measures.

Native lean/lake/elan not on PATH (checked). No execution of native
rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier; scalar certificates
and original theorem probes prepared below. Existing CI receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 was actually fetched:
six B/C declaration axiom checks with propext, Classical.choice, Quot.sound;
A module timeout exit 124 at 2700.11s; all_requested_checks_ok=false,
full_RH_replay=false. No new PASS or fresh kernel audit.

RESUME HERE: integrate (★) with theta RUN51 and prime RUN72–73; independent
audit of Haar conjugation and the last grading measure identification.
Next unresolved actual A supplier: hA/hM of isAdmissibleEval_pairEvalY
(GoodDatumExists 21–38), specifically exact integrality of middle and
last neighbour vector under the common lattice witnesses, checking
latest theta peers first. Do not redo normalization, branching average
or stage-cut scalar induction. Shared native runner: batch these named
checks and the certificates when the compact A build is available.
All B/C and analytic obligations remain in existing ledger.
HANDOFF TO integration, editor, theta, formal audit, native runner.
-/

namespace CompactPrimeRun74

theorem common_mean_cancel (C d b Q I innerVal : ℂ)
    (hd : d ≠ 0) (hb : b ≠ 0)
    (hI : I = C * Q) (hinner : innerVal = d⁻¹ * b⁻¹ * Q) :
    I = (C * d * b) * innerVal := by
  rw [hI, hinner]
  field_simp
  <;> ring

theorem rank_one_scalar (C L a : ℂ) :
    L * (C * a) = C * (L * a) := by ring

theorem common_scale_chain (u a z : ℂ) :
    u * (a * z) = (u * a) * z := by ring

#print axioms common_mean_cancel
#print axioms rank_one_scalar
#print axioms common_scale_chain

end CompactPrimeRun74

#check exists_intertwining_mean
#check integral_algFormCoeff_blockEmb
#check Space.integral_eq_classIntegral_of_isLevel
#check Space.integral_mul_eq_classIntegral
#check Data.restrictToY
#check Data.exists_last_stage_map
#check Data.seesaw
#check Data.short_forms
#print axioms integral_algFormCoeff_blockEmb
#print axioms Data.exists_last_stage_map

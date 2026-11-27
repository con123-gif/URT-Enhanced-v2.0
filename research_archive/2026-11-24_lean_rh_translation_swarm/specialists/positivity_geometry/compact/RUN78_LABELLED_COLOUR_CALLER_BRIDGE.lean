import New.Filling.BlockBound

/-!
# RUN78 — independent B2 fibre audit, exact label/canonical-representative bridge
27 Nov 2026. HUMAN REVIEW (source-matched), new caller bridge PREPARED.
Native verification has materially advanced for earlier RUN73/74/75:
the shared compact batch has actually passed. No root closure.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Read mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
67e542df1b5557b2e1314643931ef1355bbdc50d, ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d, protocol, queue, expansion,
AGENTS, continuity and prior RUN77 2cb53847. Peer B2 batch registration
ad1f75da855bce77875d2443938844391f1144f6 and live preferred B2 chain.
Do not repeat RUN73/74/75 algebra or enqueue their replay again.

Actual source:
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
lines 130–216, specifically 208–210.
New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0
lines 17–53, 55–82, 86–122.
New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce
lines 145–151, 259–267, 311–317.
New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641
lines 270–299, 335–395, 407–418.
Actual source-visible path enough_forms -> ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs -> sum_pairWeight_le
-> tsum_invPowWeight_le_of_codim_le. Not a new kernel graph extraction.

## 1. The final fibre proof needs a common label, not merely near representatives

RUN73's prose calls the last supplier IsNearRep.eq_of_frameImage_eq.
The exact native declaration is IsLabelledTerm.eq_of_frameImage_eq
(VolumeKernel). The proof does not use the nearness inequality or level
condition once equal corrected frame images are known; it DOES use
the common second component of the finite group decomposition.
The actual BlockBound fibre supplies it by F(hB a).1 and F(hB b).1.
Do not infer equality of rational terms or right class from equality
of frame images alone. In a general group, agreement on a frame leaves
a nontrivial stabilizer.

Let p=(d,gamma), p'=(d',gamma') be the two chosen representatives,
with same left class c and same finite label t, u,u' in classUnip0(c).
Write A=u gamma, A'=u' gamma'. The native multiplication of terms
shows that A and A' still have their original reductions s and s',
since u,u' have reduction 1. Let k,k' be their integral positions.
By frameImage_termPosition the right class drops out of the frame
image: frameImage(k)=C_c frameImage(A), and likewise for k'.
Thus equal rational frames imply k'^(-1)k fixes the standard frame
and in particular lies in the finite-adelic Bessel subgroup.
After reduction s'^(-1)s is in the reduced Bessel subgroup.
This is exactly the quotient equality used in VolumeKernel; do not
assume the subgroup normal. The fixed decomposition is a bijection
of underlying types G ≃ G/H × H, not a group direct product.
The second components are equal by the common label t. Injectivity of
the decomposition then forces s=s'. This is the missing justification
for applying the same-reduction term lemma to different right classes.

Now A^(-1) A' fixes the standard frame and its position at (d,d') lies
in the principal level because the reductions agree. The native
NearTerms.eq_and_mem_classUnip_of_besselS gives d=d' and membership in
classUnip(d). This retains admissibility, which the proof uses via
the column level and automorphism/class-representative separation.
The stronger frame-fixing fact upgrades membership to classUnip0(d);
this is exactly termsOver.eq_and_mem_classUnip₀. Put x=A^(-1)A'.
Then gamma'=u'^(-1)u gamma x, so the two rational elements represent
the same double coset with left class c and now the SAME right class d.
Both are the fixed canonical out representatives, hence gamma=gamma'.
Therefore p=p'. Neither gamma's nearness nor the numerical level j
enters this last uniqueness proof. Both must remain at the full
BlockBound caller for earlier geometric estimates.

This is a source-matched independent audit of the final fibre step.
The two actual corrections from RUN75 and RUN73 are composable:
first u_p aligns lower rows; then r in classUnip0(c) with zero middle
parameter adds g sigma P only to upper rows. Use u=r*u_p, u'=u_q.
Both belong to the same left stabilizer. Their frame equality follows
from the existing skew identity and aligned lower rows, not from a
new geometric assumption. The label is unchanged by either correction.

## 2. Audit the weighted colour step at its actual finite lattice context

For fixed integral Z and level j put n=rho+1, Y=paddedLeading j Z,
d0=det Y nonzero, M=q0^(n^4), c0=M*g*d0*star(d0).
Write R=O_hat_E, A_f the finite adeles. The module K in the
VolumeKernel counting theorem is
   K = g colLattice(xRows(Z)^*) + preimageLattice((g^-1 Y^-1)^*).
Here preimageLattice means vectors mapped INTO R^n, not the image
of the displayed inverse. The required containment c0 R^n <= K
follows exactly: for v integral,
   (g^-1 Y^-1)^* (c0 v) = M*d0*adj(Y)^* v ∈ R^n.
This uses g,M rational integers, integral Y, and invertibility;
it proves the actual final obligation at BlockBound 214–216.
Also preimageLattice((g^-1 Y^-1)^*)=g Y^* R^n, so K <= R^n.
No assumption that the class-coordinate X0 lattice is standard.

Fix a subspace T of dimension r=k-l, l<=s. The primitive matrix
in the count is the actual class-coordinate basis for T composed
with the unimodular middle form. Retain its native integral left
inverse and primitive completion. In VolumeKernel notation the
target row count is n, input column count k+1, primitive column
count r, and complement count l+1 (NOT l). This extra 1 is the
z coordinate. Complete the primitive matrix to an integral
invertible matrix U; write the transformed Y(a) as [W_a,C_a],
where W_a=Y(a)m has r columns and C_a has l+1 columns.
Do not confuse this Y(a)=frameMiddle(k_a)^* with paddedLeading Y.

By valuation-pair Hermite normal form the module L_a generated
by W_a admits a list of n generators in R^n (padding with zeros
if needed). Retain the exact Hermite supplier; this does not
follow for arbitrary commutative rings. Colour by the residues
of these n generators and the l+1 complement columns modulo
c0 R^n. This gives at most I^[n(n+l+1)] colours,
I=[R:c0 R]=genIndex(principalIdele c0). Within a nonempty colour
the module L=K+L_a is independent of a, since corresponding
generators differ by members of K. Put D=[L:K], finite positive
because c0 R^n <= K <= R^n. The first isomorphism theorem gives
   D=[L_a:L_a intersect K] | n(a)
by the actual caller divisibility. Here n(a) is the natural
weight denominator, not frame size n.

Each W_a column modulo K is in the same quotient L/K of D
elements, giving at most D^r colours. Complement columns are
already congruent modulo K. Since U has integral inverse,
same transformed columns modulo K imply the original columns
are congruent modulo K. The geometric RUN75/RUN73 fibre argument
therefore gives the same unweighted fibre bound x, not x per
choice of another right class. On nonzero denominators,
n(a)^(-k) <= D^(-k); zero denominators have weight zero in the
actual invPowWeight definition. The weight over this first colour
is bounded by the EXACT cancellation
                  D^r D^(-k) x <= x  (r<=k, D>=1).
This is the counting argument in VolumeKernel 17–53 with its
actual rank, integrality and divisor inputs; no separate
estimate per prime. All sums may be taken as nonnegative tsums;
finite colour count and x finite suffice. The second upper
colour after correction has I^(rho*n) possibilities and each
fibre has at most one member by section 1. Hence for fixed Z
the aggregate count exponent is
        n(n+l+1)+rho*n = 2n^2+n*l.
The number of integral Z matrices is bounded using the exact
native norm bound and integral-vector packing, not a volume
argument for arbitrary rational entries. With f infinite places,
genIndex(c0)<=b^[(22 n^4+22 n^3+46) f] follows from the stated
g<=b^23, q0<=b^11, |Phi(d0)|²<=b^(11n³), and the CM norm product.
Together the native 2000 n^6(s+1) f envelope is more than enough.
No change to the constant, no optimization of unrelated exponents.

Audit verdict: AGREE under the named native primitive completion,
Hermite, class separation, frame transports, near bounds and
level inputs. The last representative proof can drop near/level
locally; the full counting theorem cannot. This is not a proof of
the upstream primitives themselves. Preserve old graph and all
axioms. Original local edges: BlockBound -> {VolumeKernel count,
middle alignment, integral skew, labelled uniqueness, index
inclusion, primitive completion, near bounds}. Reduced local
interface: canonical representative + same finite label + corrected
frame equality, with the exact preimage and aggregate quotient
cancellation. No transitive edge deletion or global minimality.
Cache key: compact pin,S,c,j,t,Z,T,chosen first colour, K,L,
both separate right classes, their fixed label witnesses,
integral U and common divisor D. Do not reuse across distinct K.

## 3. Actual verification newly available

Shared batch rh-compact-b2-human-replay-20261127 on
cathedral-research-state, Actions run 45986308748, UTC 2026-11-27
11:14:10, source commit 78cb422113cbccffb0b17a1fb798836831e43d.
status.json actual returncode 0, wall 1013.3s; all three jobs
completed successfully. Read actual outputs/b2_native_results.json,
input_manifest.json (blob 2d77205f8f1d5cde60b50193d4d6f8427250e9f4),
pins.json (611284f755002d37aa5904bc0f024ee834fa8019),
negative_missing_projector_guard.log (c5dc81aa9ec8dbcecb86dc7d67bd06f1b2ff0654),
original_callers.log (121365b564aabdcfba262fec16e2033b0e3b140a).
Native build and all eight helpers returned 0:
RUN73 skew_correction_mul, shared_vector_exponent;
RUN74 pairing_transport, positive_difference;
RUN75 project_residual, short_residual, supported_rows, reconstruct.
Six original caller axiom probes returned 0 with standard
propext/Classical.choice/Quot.sound only. The negative control
without P*C=C returned 1 with the expected unsolved goal.
all_requested_checks_ok=true; caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false.
This is actual new native evidence on the compact pin, not an
old-pin conditional root test. Do not schedule the same batch again.
Local lean/lake/elan absent on PATH. The new theorem below is
PREPARED only; no new rh_scan/rh_prune/rh_reduce/rh_auto/frontier
execution claimed. No import of the RH theorem, no URT comparison.

## 4. Single caller replacement to test

The following is a weakened copy of the exact native uniqueness
proof (NOT a call to the old uniqueness theorem). The second
theorem is an original-statement bridge. In a scratch pinned
BlockBound copy with the new lemma in scope, replace only
  (F (hB a)).1.eq_of_frameImage_eq (mul_mem (hr (by simp)) (hu _ a))
    (hu _ b) (F (hB b)).1
with
  RHPositivityRun78.labelled_frame_unique
    (mul_mem (hr (by simp)) (hu _ a)) (hu _ b)
    (F (hB a)).1 (F (hB b)).1
and leave the subsequent frame equality proof unchanged.
Keep the original file immutable. This is a concrete caller
replacement plan, not a replay receipt. The bridge alone does
not validate all of the human counting assembly.

RESUME HERE: coordinate with the existing shared compute runner
to elaborate the two new declarations and the actual one-line
BlockBound scratch caller replacement, inspect axiom output and
preserve any failed logs. Then integration can mark this exact
local edge audited/replayed only if it succeeds. Do not re-run
the already successful eight-helper batch. Remaining primitive
and B1/B3/A/C/prime-window gaps remain open.
HANDOFF TO integration/editor/native audit.
-/

namespace Filling.RHPositivityRun78

open Fin ENNReal Finset MatMul Matrix Pointwise Submodule

attribute [local simp] gIdele_val mulVec Matrix.mul_apply splitGram frameGram middleGram
  Units.smul_def dotProduct funext_iff mul_pow

variable {E} [Field E] [CMType E] {𝔰} {S : Filling E 𝔰} {c}

theorem canonical_label_frame_unique [S.IsAdmissible]
    {t : S.reducedImage besselS} {p p' : S.Classes × S.G E} {u u'}
    (hu : u ∈ S.classUnip₀ c) (hu' : u' ∈ S.classUnip₀ c) :
    ((DoubleCoset.mk (S.classUnip₀ c) (S.classUnip₀ p.1) p.2).out = p.2 ∧
      ∃ s, p.2 ∈ S.termsOver c s p.1 ∧
        (Subgroup.groupEquivQuotientProdSubgroup s).2 = t) →
    ((DoubleCoset.mk (S.classUnip₀ c) (S.classUnip₀ p'.1) p'.2).out = p'.2 ∧
      ∃ s, p'.2 ∈ S.termsOver c s p'.1 ∧
        (Subgroup.groupEquivQuotientProdSubgroup s).2 = t) →
    frameImage (u * p.2).1.1 = frameImage (u' * p'.2).1.1 → p = p' := by
  rintro ⟨o, s, h, rfl⟩ ⟨o', r, g, e⟩ f
  obtain ⟨⟨k, rfl, a⟩, k', rfl, a'⟩ := one_mul s ▸ termsOver.mul hu.1.2 h,
    one_mul r ▸ termsOver.mul hu'.1.2 g
  refine (termsOver.eq_and_mem_classUnip₀ ⟨k, rfl, a⟩ ⟨_, Equiv.injective _
    (Prod.ext (QuotientGroup.eq.2 ?_) e), a'⟩ f).rec fun e x ↦ Prod.ext e (by rw [← o,
    (DoubleCoset.eq (b := p'.2)).2 ⟨_, mul_mem (inv_mem hu') hu, _, x, by group⟩, e, o'])
  use k'⁻¹ * k, mem_besselS_iff_frameImage.2 (by erw [frameImage_inv_mul_eq_iff.2] <;> simp [*,
    frameImage_termPosition]), by simp

theorem labelled_frame_unique [S.IsAdmissible]
    {j t p p' u u'} (hu : u ∈ S.classUnip₀ c) (hu' : u' ∈ S.classUnip₀ c) :
    S.IsLabelledTerm j c t p → S.IsLabelledTerm j c t p' →
    frameImage (u * p.2).1.1 = frameImage (u' * p'.2).1.1 → p = p' := by
  intro h h' f
  exact canonical_label_frame_unique hu hu' ⟨h.1.1.2, h.2⟩ ⟨h'.1.1.2, h'.2⟩ f

end Filling.RHPositivityRun78

#check Filling.tsum_invPowWeight_le_of_codim_le
#print axioms Filling.RHPositivityRun78.canonical_label_frame_unique
#print axioms Filling.RHPositivityRun78.labelled_frame_unique

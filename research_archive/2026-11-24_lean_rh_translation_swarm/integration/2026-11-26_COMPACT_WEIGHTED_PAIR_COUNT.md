# B pair-weight bound: actual finite congruence counting and summation
26 November 2026, compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Direct work on remaining B primitive, not another endgame rearrangement. The following proves the native inverse-index colouring estimate and the complete final scalar summation of pair weights, retaining the exact geometric injectivity and divisibility premises of BlockBound. No native replay of these human arguments.

## 1. Weighted inverse-index colouring lemma

Read New/RealPlace/VolumeKernel.tsum_inv_index_pow_le_of_congr. Use its actual variables: R=O_hat_E, c integral idele, K an R-submodule containing c R^sigma (not necessarily contained in R^sigma), Y_a integral sigma-by-pi matrices, and primitive m: R^tau -> R^pi with pi=tau+s. Write d(a)=[M_a:M_a∩K] for M_a=Y_a m R^tau, and suppose d(a)|n(a), l>=tau. A class of indices with every pair Y_a-Y_b having columns in K contains at most x elements. Then
 sum_a n(a)^(-l) <= [R:cR]^(sigma(sigma+s)) x,
where zero n has weight zero, exactly as native inverse convention.

Proof. Complete primitive m to the first tau columns of an invertible integral matrix U using the valuation-pair primitive-column theorem. This is legitimate over the product of local DVRs, with the native integral inverse. Replace Y_a by Y_a U, so its first tau columns span M_a and its last s columns are integral. Integral right multiplication by U and U^-1 preserves the congruence-of-all-columns criterion.

Choose for each M_a a list of sigma integral generators (pad by zeros). The native Hermite matrix theorem over R supplies these even at nonconstant local rank: use the local Hermite generators at each place, then combine componentwise. Colour a by the residues modulo cR of those sigma column generators, together with the s remaining columns of Y_a U. There are at most [R:cR]^(sigma(sigma+s)) colours. Within a colour all M_a have the SAME image H in (R^sigma+K)/K: corresponding generators agree modulo cR^sigma⊆K. Thus every d(a)=|H| is the same finite number d≥1 (the quotient is finite as cR^sigma⊆K). Each of the first tau columns has its class in H, so at most d^tau tuples of residues modulo K are possible. The last s columns already agree modulo K. Each tuple class contains at most x elements by the actual hypothesis on Y. Every a with n(a)≠0 has n(a)≥d because d|n(a); with n(a)=0 its weight is zero. Therefore the weighted sum per colour is ≤d^tau x d^-l≤x. The finite colours give exactly the asserted estimate, including infinite index sets via nonnegative summation. This replaces the native two successive colourings with one explicit generator-colour construction; it does not weaken primitive completion or the geometric hypothesis on congruence fibres.

## 2. Actual pair-weight scalar consumer

Write n=ρ+1, k=|κ|, f=#infinite places, τ0=b^(kf/4) (not the column index τ in §1). Native BoxPartition.termWeight for pair p=(c',γ), p'=(c',γ') with commonLink V of codimension i is
 W_i(p,p',V)= [|Sbar| #Classes N^(-kf) (2τ0²)^i]^-1
              · disc_c(V)^(-k-1)
              · [G_j o(p,V)]^-k · sat(p')^-k,
where G_j=[R:gR]^min(j,ρ), o=frameValueIndex(a=1), sat=saturationIndex. The support condition is precisely congruent kept near terms of level j; the finite label t is the Sbar component of the common reduction. Group by (i,t,c,V,p,p') and overcount by the actual native labelled-term sets. Since the reduction is unique for a term, every nonzero pair occurs in this grouping; extra nonnegative summands are harmless.

The native BlockBound inner counting application uses W=V∩ker((frameMiddle(p))_X0^*) over E. Its codimension is ≤i+n because restriction to V of this map has range dimension ≤n. For the congruent p' with commonLink exactly V, the geometric index divisibility in the native proof is
 frameValueIndex(p',g,W) | sat(p').
Use actual congruence of termPosition, commonLink orthogonality and integral saturation, not a divisibility assertion for arbitrary pairs. The outer application uses
 frameValueIndex(p,g,V) | G_j o(p,V)
by the native relative-index product and scalar multiplication identity. These two explicit divisibility statements are required premises here; §1 does not prove them. The remaining geometric derivation of the first is precisely the P,w construction and saturation argument of BlockBound.sum_pairWeight_le. The outer one is ordinary index arithmetic in the native colLattice.

Now apply the source tsum_invPowWeight_le_of_codim_le first at codimension i+n and then at i, obtaining the factor
 b^[2000 n^6 f (i+n+1)] b^[2000 n^6 f(i+1)]
 = b^[2000 n^6 f(2i+n+2)].
Both sums use the same fixed c,t,V, and in the first sum the actual fixed p. They are upper bounds uniform in p; no exchange of conditional sums. Since 2i+n+2 ≤(n+2)(i+1)≤3n(i+1) for n≥1, and k≥1000(2n)^9=512000 n^9,
 2000 n^6(2i+n+2) ≤6000 n^7(i+1) ≤ (k/4)(i+1).
Thus the two weighted term sums together contribute at most τ0^(i+1).

The native lattice discriminant estimate at codimension i is
 sum_c sum_{codim V=i} disc_c(V)^(-k-1) ≤ #Classes N^(-kf) τ0^(i+1).
Sum over t (exactly |Sbar| labels) and divide by countWeight_i. Everything cancels before estimation:
 total at codim i ≤ τ0^(2i+2)/(2τ0²)^i = τ0² 2^-i.
Summing the nonnegative geometric series (actual i<=k; enlarging to all i>=0) proves
 sum_{c,c',γ,γ'} pairWeight_j(c,c',γ,γ') ≤2τ0².
This is the exact required native constant, independent of the number of classes and labels. Combining with CrudeEnergy's pairInvariant/classGauge bounds and its energy recurrence gives the negligible-pair budget used in e3228b19. Those pointwise pairInvariant and classSize bounds remain necessary; do not infer them from a counting sum.

## 3. Remaining geometric suppliers are explicit

The native tsum_invPowWeight_le_of_codim_le uses §1 with c=M*g*det(Y Y*) and primitive basis of V, where Y=paddedLeading and M=q0^(n^4), followed by a second colouring of upper-frame entries modulo c. Its required fibre count one is a strong assertion: after an integral class-unipotent correction to align the middle rows, the upper-frame discrepancy X is removed by the native skew matrix σ=M[det(Y*)T-det(Y)T*-(Pα)*T], with α=(xRows(Y.adjugate^T))^T and T=Xα. This depends on the native shared-vector smallness and vanishing of X adj(Y) in the later columns, and the exact level/j congruence hypotheses. We have not independently reconstructed this entire geometric injection; it must be retained, along with the lattice discriminant estimate sum_latticeDisc_inv_le (uses sublatticeDisc, primitive bases and the class integral). The complete abstract weighted count and final pair-weight summation above are new human derivations; they do not establish these suppliers. No claim of full B closure, exact native replay or completion of the human RH proof.

Sources compact pin: New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0; New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd; BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641; CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18; CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727. Peer fc278308 covers bottom Schur and real band damping with shell/geometry suppliers still open. Preserve all native hypotheses and proof dependencies.

## 4. 27 November — reconcile the actual inner divisor and its index convention

The human geometric construction retained in §2 is supplied by
[RUN74, §§1–3](../specialists/positivity_geometry/compact/RUN74_SATURATION_PAIR_DIVISIBILITY.lean).
Use that existing proof rather than repeat its scalar pairing identities.
The exact inner interface is now extracted as
[`Filling.b2_active_inner_frameValueIndex_dvd`](B2_ACTIVE_CALLER_REPLACEMENT.lean):
for y=(c',γ'), a rational γ, T=commonLink(γ,γ'), and
CongruentTerms(c,c',γ,γ'), set
L=T∩ker(frameMiddle(γ)^*). Then

    frameValueIndex(c,termElem(c,y),g,L) | saturationIndex(termElem(c,y)).

This local interface has no separate labelled-term, IsNearRep or HasLevel
argument. The enclosing weighted count retains its level and near-term
assumptions. Both class-position witnesses in the inner congruence use c'=y.1;
the right class carried by the outer labelled q is not silently substituted
for c'. Its outer divisor is evaluated at q's own termElem. The support map
is an overcount, not a class-uniqueness assertion.

The index convention matters. AdelicRingDefs defines submoduleIndex(A,B)
as the additive relative index [B:A∩B], with value 0 when infinite; the pinned
Mathlib GroupTheory/Index definition uses Nat.card. Thus, if the saturation
index is 0, the displayed divisibility is automatic. In the nonzero case
Sat/A is finite and RUN74's exact map gives

    M/(M∩gB) ↪ gF(Sat)/gB ≅ F(Sat)/B,

where the last quotient is an image of Sat/A. Its order therefore divides
the saturation index. This explains why the local divisor can omit the
level-based nonzero-index supplier. It does not remove that supplier from
the outer divisor, inverse-weight count or surrounding energy estimate.
The source's primitive bases, class Gram transport, principal-level
congruence and positive X0 difference-vector argument are retained.

Native evidence is precise and partial: run 45994173721 accepted this inner
theorem with only propext, Classical.choice and Quot.sound, but the complete
file exited 1 on an outer lambda-layout error. See
[actual compiler log](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-compact-b2-callers-replay-20261127/outputs/active_b2_callers.log),
blob acf075f047d1b374d2ef5379d39b7742470b15a4. The repaired pair/energy run
45998845682 is pending. Eight generic helper proofs from RUN73/74/75 passed
the separate earlier batch; they are not a native proof of the complete
weighted count. The prepared skew/count caller patch is tested separately.
Full B2, the complete human assembly and RH remain OPEN.

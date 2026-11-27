import New.Filling.BlockBound

/-!
# RUN77 — B2 weighted packing: audit the actual labelled fibre and class coordinates
27 November 2026. Independent source-matched human REVIEW and a native
label-uniqueness certificate PREPARED, not compiled. No RH completion.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Read latest mission 4aed2e68e6bd724826bc1e669c07a48e0b95eddd,
spine 67e542df1b5557b2e1314643931ef1355bbdc50d,
ledger 3a1f76d4fd27365b792f13161196a1032918e923,
protocol, queue, expansion, AGENTS; recent commits fd66e09e,39478bf0,
f8c4e65a,e5803774,dd97e28a, and peer 80f4ff6e,446c68f9,b495c708.
Use prior RUN73/74/75, integration 26-Nov weighted-pair and lattice
saturation notes, not new copies of those derivations.

Actual source: New/Filling/BlockBound.lean
6c68e80e3b1ea2b7983696716305493a37f2b1fd lines 130–216, 222–292;
BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641
lines 335–395; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
termsOver; CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f
energy_le_of_level_pairs; ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5.
Root-visible path: enough_forms -> ramifiedColumns_fill_rows ->
Fits.exists_translate_finrank_comap_le -> energy_fixingSet_le ->
energy_le_of_linkEnergy_le -> energy_le_of_level_pairs -> sum_pairWeight_le.

## 1. Important distinction at actual Sigma fibre
Fix S,j,c. Write q=(d,gamma), p=(d',delta). BlockBound's expanded
Sigma domain consists of i,t,c,T,q,p with
  finrank T+i=k, IsLabelledTerm j c t q,
  IsLabelledTerm j c t p,
  CongruentTerms c d' gamma delta,
  commonLink gamma delta=T.
It maps to (c,d',gamma,delta). The source deliberately uses a
NONNEGATIVE OVERCOUNT, not a bijection on this entire domain.
In particular, it does not explicitly require d=d'. One must not
identify the termPosition for q used in its OUTER weight with the
termPosition of gamma used in the INNER congruence argument.
No proof of global class uniqueness follows just from uniqueness of
reduction at fixed c,d,gamma. The source does not need that claim.

The prior integration scalar derivation and RUN74 are sound with
this distinction. At the inner application use the witnesses
k,k' from CongruentTerms c d' gamma delta: BOTH positions are in
class pair (c,d'). Its first term k need NOT equal termElem c q
in the outer sum. The rational subspace
  W=T intersect ker((frameMiddle gamma).toRows1^*)
depends on gamma alone, so is unchanged by the choice of right class.
The finite class transport in RUN74 uses k=C_c gamma C_d'^(-1),
k'=C_c delta C_d'^(-1), exactly the SAME d' for those two. Thus
gamma' gamma^-1 transports as k' k^-1, with no extra right-class
factor. Apply RUN74 G1–G3 using these witnesses, not q's label witness.
This gives frameValueIndex(c,k',g,W) | saturationIndex(k').
The OUTER application instead uses termElem c q at (c,d), with
RUN74 section 3, and needs no congruence with a second term.
This checks the actual two separate calls and preserves the broader
native domain. No extra compatibility of their class charts is assumed.

## 2. Exact restricted reindexing; no class-uniqueness premise
At a fixed (c,d',gamma) the reduction witness k is unique because
its underlying element is termPosition(c,d',gamma) and membership
proofs are propositions. Hence s and t=second component of the
fixed decomposition of s are unique. The prepared native lemmas
below prove just these two facts. Restrict the above Sigma domain
to d=d'. For each supported ordered quadruple (c,d',gamma,delta)
there is exactly one tuple: use its unique common s and t,
T=commonLink, and i=k-finrank T (native finrank<=k).
Conversely a restricted tuple gives exactly the support predicate
of pairWeight. Weights coincide definitionally, since q=(d',gamma),
p=(d',delta), and termWeight uses the frameValueIndex of q and
saturationIndex of p, in THAT orientation. Thus the pair sum
equals the restricted nonnegative Sigma sum, which is bounded by
the larger original Sigma sum. No division by a label multiplicity,
no global class uniqueness, no cancellation of positive weights.

This gives a short exact support-to-count bridge and an alternative
human route: keep the same-class restricted fibre during the inner
count, then enlarge to the labelled domain only at each counting
bound. Equivalently keep the original native overcount and use
the distinct witnesses described in section 1. Do not silently
replace the original overcount by equality.

## 3. Check the weighted packing caller
For fixed i,t,c,T,q, use the inner index divisor above and
rank-nullity on the restricted frameMiddle map:
  codim(W)=i+rank(frameMiddle_gamma^* restricted to T)<=i+n,
where n=rho+1. Then the native tsum_invPowWeight_le_of_codim_le
gives the inner budget b^[2000 n^6 f(i+n+1)], uniformly in q.
For the outer call, let B be the span of the conjugate first rho
rows, A the frame-value lattice for T, N the span of the first
min(j,rho) rows. Using finite [B:N] from the actual level,
  [A:A intersect gB]
    =[A:A intersect B]*[A intersect B:A intersect gB]
    divides [A:A intersect B]*[B:gB].
Since multiplication by g is injective, comparing the finite
indices of gN<=N<=B and gN<=gB<=B gives [B:gB]=[N:gN].
The latter divides [R^r:gR^r], r=min(j,rho), by the surjection
from R^r onto N followed by reduction modulo g. Equality of
ranks is NOT needed in this last step (though the native leading
minor also gives it). This suffices for the actual outer divisor
with G_j=[R^r:gR^r]. Retain finite [B:N], g integral nonzero,
and actual row generators. The inner and outer applications
therefore give the product of the native budgets recorded in
integration/2026-11-26_COMPACT_WEIGHTED_PAIR_COUNT.md section 2.
No rederivation of the final scalar geometric sum or class average:
use that note and editor 80f4ff6e. They supply <=2 tau^2 conditional
on the actual weighted colouring and lattice-discriminant bounds.

Audit verdict: AGREE on this packing assembly with the right-class
witness distinction and finite-index divisibility (not an assumed
rank equality). The existing geometric suppliers RUN73–75 and
the marked-row class bound remain separate; source proof bodies
are not replaced by an abstract bound. The next actual outstanding
B2 check is independent audit of the geometric colouring primitive
at BlockBound.tsum_invPowWeight_le_of_codim_le, including the
finite representative uniqueness and middle-row correction on
its actual colour fibre. No proof from a test of generic matrices.

Original graph: sum_pairWeight_le -> {tsum_fiberwise/support
overcount, inner and outer weighted counting, rank-nullity,
two divisors, lattice discriminant sum, scale comparison}.
Reduced human interface: exact restricted support reindexing
and controlled enlargement, same two count calls with separate
class-coordinate witnesses, outer index divisibility instead of
requiring full generator rank. No native global edges removed.
Context cache: compact pin,S,j,c,d,d',gamma,delta,t,T,i,
fixed actual congruence witnesses, separate outer q term,
native finite-level/positive-index evidence.
All original/reduced graph and axiom evidence retained.

Actual verification: native lean/lake absent on local PATH.
Read status.json for runs 45577239749 and 45576756833: historical
returncode 0; old-pin conditional strip root and bounded scan
(324 pending names), not checks of this compact file. Read compact
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named original theorem checks standard three axioms only,
module_1_build timeout 124; all_requested_checks_ok=false,
full_RH_replay=false. Source definitions and exact caller inspected;
no fresh native engine execution, no claimed PASS, no URT use.
Prepared Lean lemmas below require the same pinned built imports.
Replay with lake env lean FILE from the compact root and inspect
the printed axiom reports. No import of claimed RH.

RESUME HERE: independently audit the actual geometric colouring
primitive at BlockBound.tsum_invPowWeight_le_of_codim_le
lines 130–216, using RUN73 and RUN75 and retaining precise
integrality/near representative hypotheses; send this class-witness
audit and native uniqueness certificate to integration and audit.
No repeated scalar optimisation; all A/C, B1/B3 and the decisive
prime inequality remain open.
-/

namespace RHPositivityRun77

open Set
variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}

/-- The finite reduction is unique for a fixed rational term and fixed class pair. -/
theorem reduction_unique {c d : S.Classes} {γ : S.G E} {s t}
    (hs : γ ∈ S.termsOver c s d) (ht : γ ∈ S.termsOver c t d) :
    s = t := by
  rcases hs with ⟨a, ha, hpos⟩
  rcases ht with ⟨b, hb, hpos'⟩
  have e : a = b := Subtype.ext (hpos.trans hpos'.symm)
  subst b
  exact ha.symm.trans hb

/-- Label uniqueness only with the same outer class and pair. -/
theorem label_unique [StablyUnram E] {c : S.Classes}
    {j : Fin (𝔰.ϱ + 2)} {p : S.Classes × S.G E} {t t'}
    (h : S.IsLabelledTerm j c t p)
    (h' : S.IsLabelledTerm j c t' p) : t = t' := by
  rcases h.2 with ⟨s, hs, es⟩
  rcases h'.2 with ⟨s', hs', es'⟩
  have e := reduction_unique hs hs'
  subst s'
  exact es.symm.trans es'

end RHPositivityRun77

#check Filling.sum_pairWeight_le
#check Filling.tsum_invPowWeight_le_of_codim_le
#check Filling.submoduleIndex_gIdele_smul
#print axioms RHPositivityRun77.reduction_unique
#print axioms RHPositivityRun77.label_unique

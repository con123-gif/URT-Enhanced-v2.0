import New.Selmer.ReciprocityLaw

/-!
RUN67 — direct dimension proof of the actual prime-to-index count B.
27 Nov 2026. HUMAN SOURCE-MATCHED SPECIALIZATION, pending independent
audit and native replay. No claim of a new RH proof.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first and
mandatory unified engine); AGENTS, continuity, protocol, handoff,
expansion, manuscript 944957c6f43b63df7a845472b31492dc0ca1cb8f read.
Latest peers 219694f2, cbe51302, cbcefcda, 47701c80, c632a8e0.
RUN53 (blob 2bfff7c308435654e2f7a8aa4f64e0324c38a3af) already derives
the GENERAL Higman theorem and central devissage; not a novel result
here. RUN65 and its audit provide actual count B and the two-prime
root-detection witness. RUN66 Artin bridge audited by cbcefcda;
accept its removal of redundant factor two only in that component
context with x(cmConj)=0. This run specializes the general count
directly to the actual rank-one W, prime-to-index O, z=1,n=0 caller.
It removes the need for the equality case, general projectivity
and general lattice comparison in this one human proof branch.
It does NOT delete those dependencies from other native callers.

Pinned bodies inspected (relative to grh-compact/src):
New/Selmer/ReciprocityLaw.lean 7b82ced3dd3ff2be7eedbfa63f92f2f743093223
  exists_isLaw, local B, W, psi, O, s', c, and m witness.
Lib/ClassField/GreenbergWiles/ProjectiveCount.lean 3e305e3ad3797609b9c4b4783ce7901ce828c3e9
  card_trivialised_of_isHigmanProjective.
Lib/ClassField/GreenbergWiles/EquivariantUnits.lean ad78d13af1fecc0fedc8ac48944e44b62300b66c
  dirichlet_fixedSUnits.
Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03
  power_residue_reciprocity (forward half only for this count).
Lib/ClassField/GreenbergWiles/SelmerBasic.lean 5d8e27cabe1e4c5c486f7acdfc939499d0b0564e
  SplitPlaces and root detection.
Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211
  card_mul_pow_le.
Lib/ClassField/GaloisCohomology/DiscreteUnits.lean 8f36777d8514e71b861507c96eee9d56f6d8fa61
  trivialisedCocycles, HasFewCocycles.

1. Actual specialized hypotheses.
Write G=Gal(Omega/K), U=O, H=G/U, F=Omega^U, W=M[ell].
By actual B in exists_isLaw, W has dimension ONE over F_ell,
U acts trivially, fixes mu_ell, and |H| divides (ell-1)^2.
Let E be the q-units of F, X the places of Omega over q and infinity,
Z=X/U (finite places of F over q and infinity, as H-set),
d=card of the ENLARGED auxiliary family s', equal to |iota|+2.
All SplitPlaces guards are retained, including principal ideles
and class group generation. In this context the native m with
z=1,n=0 says exactly: if ell*r in E and all auxiliary Frobenii fix
r then U fixes r. This was established using the two extra primes
in RUN65; no root assumption added. No assumption that K or F is
totally complex is used in this bound.

2. Rank-one regulator comparison, via a direct idempotent.
Let E0=E/torsion, L=E0 direct sum Z_integer, and P=Z[Z].
The ordinary S-unit theorem with regulator gives an H-equivariant
real isomorphism L_R ~= P_R: the valuations/logarithms identify
E0_R with the product-formula hyperplane, and the added integer
maps to a constant archimedean direction outside that hyperplane.
Use local-degree normalized logs so the product-formula sum is
H-invariant; its value on that added direction is nonzero.
The native dirichlet_fixedSUnits alternatively gives the same
isomorphism by linear independence and the S-unit rank.
The equivariant maps from L_Q to P_Q are the solutions of linear
equations over Q. Their scalar extension to R contains an
invertible matrix. The determinant polynomial is not identically
zero on the rational solution space, so (Q infinite) there is
an invertible rational solution. Thus L_Q ~= P_Q equivariantly.
This is NOT an integral regulator inverse.

Choose the character lambda:H->F_ell^* of W. Lift it via the
Teichmuller roots of unity in Z_ell^* (ell=2 gives lambda=1).
On each free Z_ell-lattice A=L or P tensored with Z_ell use
  e_lambda=|H|^(-1) sum_h lambda_tilde(h)^(-1) h.
This is an integral idempotent; image and kernel split over
Z_ell. Its image rank is the dimension after reduction mod ell,
because the direct summands are finite free. Rational equivariant
isomorphism gives equal ranks for L and P after Q_ell extension.
For rank-one W, Hom_H(A/ell A,W) has dimension equal to the
lambda-isotypic dimension: maps are zero on (1-e_lambda)A,
and on e_lambda A arbitrary linear maps intertwine. Therefore
  dim Map_H(Z,W) = dim Hom_H(E0,W) + dim W^H.
Hom denotes additive equivariant homomorphisms, hence F_ell-linear
on reduction. Hom_H(E0,W) embeds into Hom_H(E,W) by precomposition
with the quotient; no claim that torsion has zero image.
This proves exactly the comparison needed for B by an integral
rank-one projection, no general Higman trace or character
comparison in modular nonsemisimple cases.

3. Direct residue-symbol extension and dimension of relations.
Use native b_i:E->F_ell from power_residue_reciprocity. Define
  beta(y)_(i,h)=b_i(h y),  h in H.
This factors through E/ell E. If beta(y)=0, choose ell*r=y
in Omega units. In particular every b_i(y)=0, so every phi_i
fixes r by the native root-symbol identity and its injective
root-of-unity coordinate. The exact root-detection witness above
gives U fixes r. Also r is a q-unit (its ell-th power is one at
all excluded valuations in the valuation-unit sense). Thus
r belongs to E, and y in ell E. Hence beta is injective on E/ell E.

Equip F_ell^(iota' x H) with (g f)(i,h)=f(i,hg); beta is equivariant.
For an equivariant map f:E->W, extend f beta^{-1} from im beta
linearly to L0 on the full finite vector space. Replace L0 by
  L(v)=|H|^(-1) sum_g g L0(g^-1 v).
This is equivariant and agrees with f on beta(E). With e_(i,h)
the coordinate basis, L(e_(i,h))=h^-1 L(e_(i,1)).
Consequently the native residue map WITHOUT the extra integer
coordinate,
  j0: W^d -> Hom_H(E,W),
  j0(a)(y)=sum_(i,h) b_i(h y) h^-1 a_i,
is surjective. Its kernel dimension is d - dim Hom_H(E,W).
This uses the root-detection implication directly (z=1,n=0);
the general z-n injectivity device is unnecessary here.

4. Actual trivialised cocycles and the single dimension cancellation.
Use native sign: T consists of (f,c) with continuous c, c|I=0,
  rho(g) f(x) = f(gx)+c(g).
The native forward reciprocity law gives a linear map
  r:T->ker j0, (f,c) |-> (c(gamma_i))_i.
If r=0, forward tame detection says c|U=0. The cocycle then
descends to H, and the trivialisation equation with u in U
shows f descends to Z. Every cocycle on H is a coboundary:
write m=|H|^-1 sum_h c(h), reindex the cocycle sum to obtain
c(g)=m-gm=d0(-m)(g), where d0(a)(g)=ga-a.
No H-fixed base point or complex-place condition required.
Projection ker r -> B^1(H,W) is onto: for a constant f=a,
c=d0(a), and c vanishes on I and gamma_i because these lie in U.
Its kernel is Map_H(Z,W). Thus ker r is finite and
  dim ker r = dim Map_H(Z,W)+1-dim W^H
            = 1+dim Hom_H(E0,W).
Since im r is contained in the finite ker j0, T is finite.
The entire needed inequality is now a single dimension sum:
  dim T <= 1+dim Hom_H(E0,W)+d-dim Hom_H(E,W) <= d+1.
Equivalently |T|<=ell^(d+1); nonempty since zero is a pair.
This is HasFewCocycles in the exact instance called by B.
No equality case, Kummer converse or central-element devissage
used in this particular cardinality inequality. The Kummer converse
IS still required by the earlier exists_split_primes_relations,
so it is not globally removable.

5. Actual consumer.
Substitute into card_mul_pow_le with s', not the old family:
  |Z_tors| ell^(a+b+r_inf) <= ell^(|iota|+3+a).
Here Z_tors is RUN65's ell-torsion cocycle module (not the place
set Z above), a=# prescribed ell-adic places, b=# other places.
Use RUN65's exact local bounds and injection into enlarged W
cocycles, r_inf>=4 and b>=k. Cancel ell^(a+3), giving
  |Z_tors| ell^(k+1) <= ell^|iota|.
Thus B -> exists_isLaw -> exists_isPrimeTriangle -> Tate triangle
-> Ribet -> C uses the direct rank-one count with its original cost.
The proof is local to actual B; no claim about all-prime-power
central bounds or other GreenbergWilesBound consumers.

Source-visible original path: regulator -> general Higman lattice
comparison + general projective count -> B; local replacement:
regulator -> rank-one integral projector; root detector -> beta
injection -> residue map onto; forward reciprocity -> dim ker r;
these -> rank-one count -> B. Preserve original/reduced global
graphs, axioms, all other consumers and unresolved leaves.
Context cache key: compact pin, K,F,U,H,ell, actual W, same s',
q, auxiliary roots, normalized logs, and actual Galois action.
No reuse across different character/level/field contexts.
No RH premise, no URT, no synthetic numerical evidence.

Verification: local command -v lean/lake/elan returned no executables.
Actual state branch compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769 re-read. Six native TiltingLemma/Filling.Moments
checks with propext, Classical.choice, Quot.sound; A module build
return 124; all_requested_checks_ok=false; full_RH_replay=false.
No fresh native rh_scan/prune/reduce/auto/frontier; old-pin engines
do not certify this compact human substitution. Below is the
prepared scalar dimension certificate and native declaration probes,
not a kernel-checked proof of the whole replacement.

RESUME HERE: integrate the rank-one count at exists_isLaw B in
the manuscript (not the general count in RUN53). Independent audit
of integral idempotent and beta action, then focus on genuinely
unresolved quantitative local defect at OnePlaceDefect (opposite
window, short arc and few-low-jumps). Retain exact Kummer converse
at the distinct split-prime relations consumer; do not repeat
general projective-count reconstruction.
HANDOFF TO integration/editor, formal audit and compact native replay.
Human RH reconstruction remains incomplete.
-/

namespace RHGaloisRun67

-- Prepared dimension-level certificate, not a proof of its suppliers.
theorem dimension_budget (t kerR imR d h0 h : ℕ)
    (ht : t = kerR + imR) (hk : kerR = 1 + h0)
    (hi : imR + h ≤ d) (hh : h0 ≤ h) : t ≤ d + 1 := by
  omega

#print axioms dimension_budget
#check dirichlet_fixedSUnits
#check SplitPlaces.power_residue_reciprocity
#check SplitPlaces.card_trivialised_of_isHigmanProjective
#check selmerZ1.card_mul_pow_le
#check exists_isLaw
#print axioms exists_isLaw

end RHGaloisRun67

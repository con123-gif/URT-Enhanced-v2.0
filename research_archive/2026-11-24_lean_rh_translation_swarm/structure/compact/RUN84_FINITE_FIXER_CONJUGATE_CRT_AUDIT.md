# RUN84 — finite-fixer determinant: conjugate CRT and descending relation audit

27 November 2026. HUMAN SOURCE-MATCHED REVIEW / AGREE, conditional on
the named native CRT, character-conductor and integral Eichler suppliers.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
No new kernel verification or RH completion.

Preflight: latest ONE_EQUATION_MISSION, LIVE_PROOF_SPINE, LIVE_OBLIGATIONS,
HUMAN_PROOF_COMPACT (relevant B2 material), SWARM_PROTOCOL, AGENTS,
research state/log/protocol, continuity and CI summary retrieved.
Binding allocation amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20
read. RUN83 5fa763aa and integration's 26-November
COMPACT_LINK_DISCRIMINANT_PRIMITIVES section 5a and 27-November
INTERACTIVE_LINK_PAIR_CALLER_AUDIT (E) consulted. This is an independent
audit of that existing proof, not a duplicate energy derivation.
Latest peer commits inspected by listing: 94189600 (live ledger and
shared B2 receipts), 3660c679 (fused count/energy candidate),
daaaa1e6 (projection-role adapter); no competing finite-fixer result
identified in the live ledger. Do not redo the checked pair/energy files.

## 1. Exact native premises and source

New/Filling/BoxPartition.lean blob 53f11966247a892d94cf688e8b366e887a92f641,
158–213, le_genIndex_det_of_fixesNormAtLeast. New/Filling/CrudeBoundDefs.lean
blob 0ba0d2532b14c414b9032466b79e10d4d60c3d18, 19–34;
New/Filling/LevelBridge.lean blob e2d344c09aa5a8da8707dc49b49f407005ddc487,
117–152; Setup.lean 34–40, 141–142, 389–396; EichlerFlag.lean
161–175; Lib/DiscreteSeries/Bruhat/EichlerMaps.lean blob
c1d16d7a700fa344bce743a2ead6ecee7ab0fa8a, 18–27.
Actual caller LinkPairing.lean blob a802533ca5a385d6f44c3254f1a4d600b28fc416,
193–232, especially 214–230.

Fix S', CM E, StablyUnram E, k in its integral lattice stabilizer,
s=reduction(k) agreeing, x natural, and the two integral form columns
t, with (framePair k)^* t=P, isotropic rows of BOTH halves of P zero,
and the specified equivalence rho: tau' ~= Unit+Unit. Let R=Ohat_E,
F0=frameImage(1), F1=frameImage(k) over R (using integral lift of k).
Write h=shape.rho, frame coordinates 0,...,h, and

    Q=t^* [F0,F1],    C=Q restricted to the two last columns.

Use rho to order those two columns; Q^*=P, C^*=P.submatrix g id.
All columns of Q except the two last ones are zero. Let d=det C.
The hypothesis is that det(C^*) is a unit in the ADELIC RING,
not a unit of R. Thus d is integral and an adelic unit. The
conjugate transpose does not change generalized index:
[det(C^*)]=[d]. This distinction matters for the Boolean sectors.

## 2. One CRT map, including both conjugates

For each label a=(w,b), where w ranges over the disjoint chosen
places above the two level primes and b is Boolean, set

    r_a(z)=reduceAt(w)(star^b z).

These are ring maps with the SAME residue field for the two
labels over w. Setup.chosenPlaces_injective and
star_notMem_chosenPlaces distinguish every underlying place
(including a chosen place from all conjugates). The actual
CrudeBoundDefs.exists_reduceAboveG_eq gives simultaneous
surjectivity of the product of ALL r_a, not just one sector.
Fix b and one chosen w=p. Choose any section L of that full
surjection and define

    o(v)=L(single_(p,b) v)-L(0).

Then o(0)=0 EXACTLY, and for every chosen q,

    r_(q,b)(o(v)) = v if q=p, else 0;
    r_(q,b)(star(o(v))) = r_(q,!b)(o(v)) = 0.

No additivity or multiplicativity of o is needed. In particular,
zeros in individual lifted row coordinates stay literal zeros.
The second identity is the essential guard in BoxPartition.184–185.
A one-sector lift alone cannot guarantee it. Nor do we need
both sectors' starred terms to vanish at once, which would
contradict the nonzero selected residue.

Use K_b=idOrInvAdjoint(b)(s_w) at a residue field. LevelBridge.130
identifies it with the actual integral matrix k reduced via r_(w,b).
It is a GROUP AUTOMORPHISM (including the inverse-transpose and
Gram conjugation in the true sector), so any intertwining identity
verified in the fixed b sector at every chosen q is equivalent,
by its injectivity, to the original reduction identity for s.

## 3. The full relation space has no nonzero first coordinate vector
when the selected determinant is nonzero

At a fixed label (p,b) write F for the coordinate frame over
its field, M=K_b, F'=MF. Assume r_(p,b)(d)!=0. Pairing a relation

    F X=F' Y

with r_(p,b)(t^*) shows that its terminal pair (X_h,-Y_h)
lies in the kernel of r_(p,b)(C), hence X_h=Y_h=0.
This applies to EVERY relation, not just the fixed vector.

Descending induction: assume for all relations all first-frame
coordinates X_j above a are zero (a<h). Set U=shift(X),
V=shift(Y), inserting zero at the beginning and dropping the
last entry. Let W be the sum of the spans of the first-frame
columns indexed <=a and the moved-frame columns indexed <h.
To produce a corrected relation with first-frame coordinates
U_j for j>=a+1 and moved terminal coordinate V_h, it is exactly
enough to show FU-F'V lies in W. By finite-dimensional
annihilator duality it is enough that for every row m killing W,

    m F U=m F' V.                                 (1)

For that actual m, apply the native integral Eichler supplier
twice. For the first take j=o composed with X and row o composed
with m; for the second take j'=o composed with Y and row o
composed with mM. The frame is a coordinate inclusion, so the
support restrictions are exact in R: X_j=0 for j>=a+1, mF
zero on j<a+1; Y_h=0, mF' zero for j<h. The integral
unimodular split Gram identifies either lifted row with v^*J
for an integral vector v; StablyUnram gives TraceOne. These
are precisely the premises of
EichlerFlag.exists_mem_besselU_eq_eichlerMap, not merely residue
orthogonality. For each r in R it gives integral Bessel
unipotents u,u' with simple-root sums r A and r A', where

    A  = o(mF)  dot shift(o(X)),
    A' = o(mF') dot shift(o(Y)).

Here o on a row is entrywise. In the fixed b sector the
conjugate-row part of the Eichler map disappears because
r_(q,b)(star(o(X_j)))=0 for every q,j (similarly Y).
At p the remaining reductions are exactly

    I+r_(p,b)(r)(FX)m,
    I+r_(p,b)(r)(FY)(mM).

They intertwine M because FX=MFY; at every other q both
matrices are I. The automorphism argument above yields the
actual S'.reduction(u) s = s S'.reduction(u'). Thus agreement
and the EXACT source definition unipotentChar (including the
minus sign and different generator in selfDualChar) give

    forall r in R, selfDualChar(r*(A-A')/g)=1.

LevelBridge.142–152 forces (A-A')/g in R, hence every
r_(q,c)(A-A')=0 by the native g-divisibility equivalence.
At (p,b), the section property and o(0)=0 identify this
with (1). No equality of the lifted A and A' in R is claimed,
and no additive/multiplicative section is assumed.

Therefore FU-F'V in W, so subtract suitable first-frame
coordinates <=a and add suitable moved-frame coordinates <h
to obtain a corrected relation F U'=F'V'. In particular
U'_(a+1)=U_(a+1)=X_a. By the all-relations induction hypothesis
U'_(a+1)=0, so X_a=0. This proves all X vanish. Since F'
is an injective frame, Y vanishes too. This actually excludes
any nonzero intersection of the two residue frame spans under
the nonzero-determinant premise. For the required native
vectorFixer, take X=Y equal to the specified nonzero fixed
vector; contradiction. Consequently r_a(d)=0 at every
label a in the SAME FixesNormAtLeast witness set A.

## 4. Exact index and caller handoff

Restrict the surjective CRT map in section 2 to the witness
set A. Its kernel contains dR, so the induced map

    R/dR -> product_(a in A) ResField(w_a)

is surjective. The ideal inclusion has this direction even
when A is empty. R/dR is finite because d is an integral
adelic unit. The source genIndex_eq_card gives its cardinal;
card_resField_eq_levelPrime and the witness's norm product
give

    [det(C^*)]=[d]=|R/dR| >= product_(a in A) q_a >= x.

This resolves the paired-conjugate bookkeeping: the vanishing
is proved for d=det C, NOT det(C^*) at the identical label.
Conjugation exchanges the Boolean labels; the equality of
indices permits using the original determinant without
requiring A to be star-stable. Reindexing the two last columns
by rho contributes no extra index. No factor of two, or
square root of the residue norm, is lost when A contains both
labels above one split rational prime.

In LinkPairing.214–230 the actual two integral forms are the
ambient lift matrix multiplied by the integral split Gram.
Its isotropic annihilator is q in that proof, and the
paired-frame identity supplies the last-row matrix e. The
rank-two equivalence g is provided by the full quotient
hypothesis at i=0 and the top-level rank guard. Thus the above
bound is exactly the x-enhanced determinant-index input of
liouville_gram there; at other levels ordinary index >=1
is used. The rest of (E)–(H) in the existing caller audit
is unchanged. This audit does not supply a new rank-two
proof, replace the Gram/index suppliers, or claim a new kernel
check of the finite-fixer declaration.

## 5. Rejected routes / verification boundary

Rejected: (a) lift only one residue sector and assume starred
lifts vanish; (b) carry the induction for a single fixed
relation, instead of all relations (the corrected relation
need not be fixed); (c) apply r_a to det(C^*) at the same
label without accounting for the conjugate; (d) assume d
is a unit in R rather than in the adeles; (e) test only a
single r in the character identity. Each removes a premise
used in an explicit step above. For (a,c), the elementary
involution (u,v)->(v,u) on a product of two residue fields
shows the mismatch: (1,0) has zero second component, but
its star does not. This is an algebraic countermodel to the
shortcut, not a counterexample to native Filling.

Verification actually performed: retrieved the named pinned
source bodies and exact caller, compared the previous human
derivation's selector, annihilator and index steps against
BoxPartition.158–213, and derived the explicit sector/index
bridge above. Local command -v lean/lake/elan found none.
No Lean run, numerical stand-in, new graph export or global
dependency deletion. Latest live receipt reports seven B2
declarations and four exact statements checked in shared run
46006832164, separate skew/count checked; graph ERROR and
fused chain still pending. That receipt is not a verification
of this new human note. CI summary 46010807219 concerns
Cathedral checks, not this proof. Existing shared runner
remains the native replay route.

URT candidate: decompose by paired conjugate label, then
eliminate all higher flag coordinates before descending;
ordinary CRT, automorphism equivariance and annihilator
duality prove the result. The source uses the same structure;
no observed speedup or unsupported O(N) claim. No change to
mathematical premises or prior source graph.

RESUME HERE: audit LinkPairing.HasLevel.abs_norm_bordered_det
(lines 25 onward) against section 3 (L5) of the 26-November
COMPACT_LINK_DISCRIMINANT_PRIMITIVES note, retaining the exact
top vs lower level and inverse-frame last-row determinant
normalization. This is a distinct retained primitive in (A);
do not redo the finite-fixer argument or the already checked
weighted pair/energy and count patches.
HANDOFF: integration/audit may consume this explicit CRT,
all-relations and conjugate-index bridge as human audit
evidence for (E). No live ledger, workflow, schedule or
physics edits.

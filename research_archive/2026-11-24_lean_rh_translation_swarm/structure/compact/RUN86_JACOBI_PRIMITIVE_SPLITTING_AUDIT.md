# RUN86 — Jacobi complementary discriminant: explicit primitive splitting and index direction

27 November 2026. HUMAN SOURCE-MATCHED INDEPENDENT AUDIT / PARTIAL at root.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: current mission 3adc7622, spine 87e949a9, ledger 261b9e8b,
HUMAN_PROOF_COMPACT 619ae01b (relevant link entries), SWARM_PROTOCOL
4b77b161, AGENTS 8db0201d, handoff, expansion, research-state/log/protocol,
continuity and CI summary 46027918531 (physical checks, not RH).
Binding allocation amendment 99cfbd1f read. Latest relevant peer 8ca5ebf9
records completed local B2/C2 recursive graph audits; B4 peer 4cc35bab
addresses a different deficit caller. Do not infer root closure.
Continue RUN85 09539463. Reuse L3 in
integration/2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md and
integration/2026-11-27_INTERACTIVE_EXACT_LINK_DISCRIMINANT.md, section 3.
The new contribution is checking both native conclusions, both rank
alternatives and the exact basis inverse and index orientation, not
a second competing determinant exposition.

## 1. Actual source and rank guard

Lib/General/Algebra/LatticeComplement.lean 68–103,
blob 2af8405ff10f2d3fd924d048627b67397f0c5960:
Filling.jacobi_perp_discriminant. Let R=Ohat_E, A=finite adeles, or
the native commutative star adelic pair. Keep the native topological
and valuation-pair assumptions. In size notation d=s+t, let J be
Hermitian and integral with integral inverse, F integral d-by-s,
n primitive d-by-t, F*Jn=0, p d-by-b arbitrary, c an A-unit. The
star is conjugate transpose. Define
    B = [F,p]* J [F,p] + diag(0,c I_b).
The native guard is HasLeftInv F OR genIndex(det B) != 0.
No positivity or invertibility of F*JF is assumed, and c need not
be integral or self-adjoint for this identity.

The second alternative genuinely supplies the first. The native
genIndex.apply_ne_zero_iff makes det B a unit, hence B invertible.
For the inclusion E_s of the first s coordinates, and its projection E_s*,
    B E_s = [F,p]* J F,
    (E_s* B^-1 [F,p]* J) F = I_s.
This explicit left inverse resolves the disjunction without assuming
a field or inferring full rank merely from a nonzero scalar at one
place. At the actual LinkPairing.78–83 caller the nonzero determinant
comes from RUN85 and minorNorm_pos. This is exactly the second native
guard; no new rank hypothesis was introduced.

## 2. Primitive basis inverse: no informal extension at paired primes

Apply the existing valuation-pair supplier
exists_preimageLattice_eq_colLattice (68–71), obtaining a in GL_s(A),
F0=Fa primitive and preimageLattice(R,F)=a R^s. Use the actual primitive
witnesses r F0=I_s and l n=I_t with both r,l integral. (Definition:
Lib/Adelic/Witt/FrameAction.lean 28–29, blob
cd3f13d59a5f2351c2fa22267765c723bd3b6001.) J=J* is part of IsUnimodular
(AdelicRingDefs.109, blob 868168201f51f7fce6ea57bf492629294dbac8f8).
Set
    P=F0* J, Q=J^-1 r*,
    U=[Q,n], V=[P; l-l Q P].
Then PQ=I_s (take adjoint of r F0=I_s), Pn=0, and
    V U = [[PQ,Pn],[lQ-lQPQ,ln-lQPn]]=I_d.       (86.1)
Since the matrices are square over a commutative ring, the determinant
of U is a unit and V=U^-1 by adjugate. Every entry of both U and V
is integral: J and J^-1, F0, n, r, l are integral and R is star stable.
Consequently both determinants have generalized index 1. This is
the exact native P,Q and k,k1 construction (LatticeComplement.88–95).
It avoids any assertion that a rational Gram basis change preserves
the integral lattice. In particular it works unchanged at a split
prime: r* uses the conjugate component, whose integral left inverse
is already part of the adelic witness. No same-place conjugation
assumption is needed.

The other conclusion of the native lemma is now explicit. We have
U*JF0=[I_s;0] by (86.1) and Hermitian symmetry. For every u with
n*Ju=0, put v0=Q*Ju. Then U*J(u-F0 v0)=0. Since U*J is invertible,
    u=F0 v0=F (a Q*Ju).                          (86.2)
Thus the required span inclusion holds, with an actual coefficient
witness, not a dimension argument over a product of fields.
Also ker(F0*J) is precisely n A^t by applying the upper block of V.
For integral vectors its kernel is exactly n R^t, since V is integral.
This supplies the saturation/complement identification in the
earlier exact-link note. It uses the SAME n, not an independently
chosen basis of its rational span.

## 3. Index direction and determinant, including singular restrictions

F integral implies R^s subset a R^s. The actual source uses
    i = submoduleIndex(R^s,a R^s)=|a R^s/R^s|
      = |R^s/a^-1 R^s| = genIndex(det(a^-1)).
For the middle equality apply a^-1. Equivalently
GeneralisedIndex.lean 33–36 (blob c4255a256be4186cf22dbf0f5a0dc03e91109a99)
says the index ratio for a R^s relative to R^s equals [det a];
its numerator is 1 here, so [det a]=1/i. The injective F maps the
first quotient isomorphically to
    (R^d intersect F A^s) / F R^s.
Thus i is the saturation index of the selected columns, not its
reciprocal and not the saturation index of all frame columns.
Use multiplicativity and star invariance of genIndex globally.
All these statements use the native adelic ring axioms.

Put H=n*(J+c^-1 J p p* J)n. Reuse the single bordered matrix proof
in L3, now with F unrescaled:
    K=[[J, JF, Jp],[F*J,0,0],[p*J,0,-c I_b]].
Eliminate J to obtain det K=(-1)^(s+b) det J det B. Eliminate
-c I_b instead to obtain (-c)^b det [[J',JF],[F*J,0]],
J'=J+c^-1 J p p* J. Congruence by diag(U,I_s) of that latter
matrix yields, with C=a^-1,
    [[X,Y,C],[Z,H,0],[C*,0,0]],
because U*JF=[C;0] and F*JU=[C*,0].
Swap the first s and last s column blocks (leaving the middle
block in place): sign (-1)^(s^2+2st)=(-1)^s. The result is block
upper or lower triangular as far as the corner determinant is
concerned: explicitly rows are [C,Y,X], [0,H,Z], [0,0,C*].
Its determinant is det C det H det C*, even when H is singular.
The change of basis contributes only unit index. Taking the
native generalized index, with [det J]=1 and signs of index 1,
therefore proves exactly
    [det H] i^2 [c]^b = [det B].                 (86.3)
This handles zero-sized blocks by the empty determinant convention.
Only J and c are inverted in the bordered calculation. It works
even in the HasLeftInv F branch with singular B, so no cancellation
of a possibly zero discriminant is hidden. The native source uses
det_one_add_mul_comm instead of the larger bordered matrix; the
formulas agree under the same premises.

At LinkPairing.78–99 take F equal to the selected isotropic columns
of termPosition, n=classCoord(c)u[[a_l,z0],[0,e]], p the transported
[s0,z,gamma z], c=N, b=q+2. Distinguish a_l (lift lattice coefficient)
from a above (saturating F). The block count is the native
finrank_link plus card_congr r, not an assumption that the full
isotropic pair matrix is independent. RUN85 supplies
    [det B]=(N^(2f) D)^2,
    [det H]=[det a_l]^2 N^(-2fq) linkDiscSq(v,e).
Combining with (86.3) and [N]=N^(2f) gives L7 exactly:
    linkDiscSq(v,e) [det a_l]^2 i^2 = D^2.         (86.4)
The quotient divisibilities L8 from the existing note can now
be applied to the SAME primitive witness to obtain the required
inequality. This audit does not replace L8 by an unverified equality
or retire the separate minorNorm lower-bound or common-link inputs.

## 4. Negative controls and actual verification

- Reverse index orientation: take J=I_2, F=2e1, n=e2, p absent.
  Then a=1/2, i=[2]>1, H=1, B=(4); (86.3) requires i^2, not i^-2.
  This is an exact counterexample within the number-field adelic
  setting (the rational integer 2 has norm >1).
- Drop primitivity: same data but n=2e2, then H=(4), and the
  asserted left side would be [2]^4 instead of [2]^2. Merely having
  full rational column rank cannot replace an integral left inverse.
- Drop both rank alternatives: J=I_2, F=0, n=e2, p absent gives
  e1 in n-perp but outside span(F). A nonzero at one place is not
  the required adelic unit determinant.
- Inverting F*JF or J' is not justified: e.g. J=[[0,1],[1,0]],
  F=e1, n=e1, p absent gives F*JF=0, H=0, B=0 while F is
  primitive and the first guard holds. Formula (86.3) remains valid.

Actual verification: pinned source statements and helper bodies
fetched and read, including both branches, the primitive inverse
and generalized-index ratio; algebra above checked by exact symbolic
reasoning. No new numeric suite, no fresh Lean replay. Prior shared
eleven-declaration/five-statement B2 native receipt and eight-root
recursive graph audit are real but not a replay of this particular
human replacement of the Jacobi primitive. The full RH reconstruction,
human assembly and root-level audit remain open.

URT selection isolated the same integral block inverse and eliminated
the irrelevant corner blocks. Conventional adjugate and block
elimination prove the result; no URT premise and no speed claim.
No live ledger, protected workflow, or schedule changes.

RESUME HERE: audit the actual two-row epsilon/termDisc identity in
LinkPairing.minorNorm_sq_le_linkDiscSq_mul against L11–L12 of the
26-November primitive note, specifically the rank-one lower-level
case and the top-level two-row determinant normalization, reusing
RUN84 finite-fixer and RUN85 bordered determinant. Do not repeat
the audited Jacobi primitive.
HANDOFF: integration/audit may reuse (86.1)–(86.4) as human audit
evidence for L3/L7. Native replay remains separate.

# RUN80 — one integral cross determinant supplies the pointwise pair bound

27 November 2026. B2 live obligation, source-matched conditional human derivation; not a native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207 (Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679).

Preflight: current mission and live ledger/spine at b87bfdd480120cc20496ba7c6044bcac1f106ed6, archived binding amendment 99cfbd1f, HUMAN_PROOF_COMPACT, protocol, handoff, AGENTS and continuity read. RUN79 adddfacc supplies the flag classification; c9e286fb supplies the single-index interpretation, explicitly not the lift existence comparison. Recent B2 peer checkpoints b495c708, 80f4ff6e, 446c68f9 concern averaging/aggregation, not this determinant. Choose the missing pointwise pair step before another weighted packing calculation. No change to shared ledger, physics or schedules.

## Exact interface

New/Filling/LinkPairing.lean blob a802533ca5a385d6f44c3254f1a4d600b28fc416, lines 239–278 and 284–315, Filling.pairInvariant_mul_le. Let E be the native CM field, StablyUnram E, f its number of infinite places, g the positive native level integer. Let gamma and gamma' be level j, over the SAME (c,s,c'), with S.Agrees s and S.FixesNormAtLeast s x. Keep all these native hypotheses. Write L,L' for their links, H for linkMetric, J for linkForm, and C=L intersect L'. Source BoxPartition.lean blob 53f11966247a892d94cf688e8b366e887a92f641, lines 42–65, 84–118, 125–138, 351–367. Both links are self-orthogonal for J and have dimension k+1. H is positive definite at all complex embeddings. Put i=k+1-dim C and x'=x if rho<j and i=0, else 1.

Retained upstream supplier: exists_link_split_le_classGauge (apply in both orders, using the same C). It provides k<=dim commonLink+i+(j-rho)_+, i=0 implies L=L', and rational i-column complement matrices Y,Y' with trivial intersection with C and with integral-lift matrices MZ+YV, M'Z'+Y'V' (adelic notation; M,M' span C, V,V' invertible). Put D=linkDiscSq(Y,V), D'=linkDiscSq(Y',V'), P=pairInvariant(c,c',gamma,gamma'), P' reversed, G=classGauge(j,c,c',gamma), G' reversed. The two native inequalities are

    (P x')² D <= G²,       (P' x')² D' <= G'².          (1)

The missing downstream implication is

    P P' (x')² <= (2/g)^(2if) G G'.                    (2)

This note reconstructs (2), not the still-open Jacobi/perpendicular or primitive-completion part of the supplier (1).

## Cross determinant, exactly once

Use the native diagonal matrix Q=diag(diag J / diag H). The actual identities checked at LinkPairing.293–299 are H Q=J and Q* J=4H; H is diagonal with nonzero diagonal entries by BoxPartition.106–108. Thus Q* H Q=4H. No indefinite form is used in a Cauchy–Schwarz inequality.

Let B=Y* J Y'. It is nonsingular: if Bt=0 then y'=Y't in L' pairs trivially with Y. It also pairs trivially with C (C subset L' and L' isotropic). Since C+col(Y)=L, y' lies in L^{perp_J}=L. Hence y' lies in C, so the complement property of Y' gives t=0. The zero-dimensional case is included by det(empty)=1.

The cross pairing of the full integral lifts, with J, is exactly V* B V'. Indeed every mixed term involving M or M' vanishes: C lies in both isotropic links. This is why one can forget the otherwise nonintegral rational complements only AFTER keeping the adelic factors V,V' and the common summands in the lift witness.

For clarity derive the integrality of the divided cross pairing without separate entry estimates. Write A,A' for the rational ambient lifts in HasIntegralLifts and absorb the adelic coefficient matrices into them, and let U,U' be their images by classCoord c. Then U,U' are integral matrices. Let K=h_c^{-1} gamma h_c', K'=h_c^{-1} gamma' h_c' be the actual integral adelic term positions (with the native rational-to-finite map understood). The equal reduction s gives K K'^{-1} in principalLevel. In the integral chart principalLevel=unitaryLevel(Ohat,gIdele) by LevelBridge.lean 150–157; hence (I-K K'^{-1})/g is integral. J_lat denotes the integral unimodular split Gram in this chart.

BoxPartition.gram_linkMatrix_mul with coefficients a=c=1 and the exact classCoord_gram and termPosition conjugation identities give

    V* (B/g) V' = U* J_lat ((I-K K'^{-1})/g) U'.         (3)

All rational matrices on the left are mapped to finite adeles. The sign can equivalently be obtained by negating the congruence difference K K'^{-1}-I, as in LinkPairing.308–313. Equation (3) is integral entrywise. Its determinant is nonzero and a unit in the finite ADELE RING (since V,V' invertible and B rational nonsingular), not necessarily a unit in Ohat. Its genIndex is >=1 by the native integral determinant lemma. Neither the equality of reductions alone for unrelated c,c' nor rational orthogonality of Y,Y' alone implies (3).

## Single positive Gram bound

At each infinite place the positive Gram Cauchy–Schwarz determinant inequality (or exterior-power Cauchy–Schwarz) for A0=g^{-1}Y and B0=QY' yields

    |det(A0* H B0)|² <= det(A0* H A0) det(B0* H B0).

Because E is CM, the absolute field norm is the product of squared complex absolute values over the f chosen embeddings. Multiplying this inequality over those embeddings, and the exact squared finite determinant indices of V,V', gives the native BoxPartition.liouville_gram bound with lower index x=1. Using (3), H Q=J, Q* H Q=4H, and [E:Q]=2f, it is precisely

    1 <= (2/g)^(4if) D D'.                              (4)

For an independent check of the exponent: scaling A0's Gram determinant by g^{-2i} contributes g^{-4if} to its absolute field norm; scaling B0's Gram determinant by 4^i contributes 2^{4if}. No archimedean factor may be counted again in genIndex. This proof uses the product formula for rational determinants and conjugation invariance of the adelic index, exactly the dependencies of liouville_gram. Retain StablyUnram E. With i=0 all determinants and adelic indices are 1, and (4) remains valid.

Multiply (1), then use (4) BEFORE taking square roots:

    (P P' (x')²)² <= (2/g)^(4if) (G G')².

Nonnegativity of P,P',G,G', g>0 and x'>=0 give (2). Thus the native pointwise pair bound follows from ONE cross determinant and TWO supplied lift inequalities. The dimension and equal-link guards are exactly those from (1), not inferred from the determinant inequality. In CrudeEnergy.130–133 this supplies pairInvariant_mul_le for the two terms in the same sigma-indexed congruence fiber.

## Failed shortcut and verification boundary

Rejected: replace the cross determinant by the product of individual integral Gram determinants without using congruence. That loses g^{-4if} in (4), the entire incoherence gain. Also rejected: assume cross pairing nondegenerate just because H is positive. For J an indefinite form, two identical isotropic links have zero cross pairing; it is quotient complement injectivity and self-perpendicularity, not H positivity, that prove the nonzero determinant. In particular rank i must be the codimension of their actual intersection.

URT-inspired selection: identify the invariant shared intersection first, cancel common directions, retain only the cross determinant. Conventional quotient linear algebra and determinant Cauchy–Schwarz already produce the same native proof; no distinct speedup or complexity bound established. No fresh Lean execution, no synthetic test, no claim of CI PASS for this new contribution. This is an independently checkable human derivation conditional on both actual lift comparisons, exact native chart identities, product formula and Gram inequality. Original external formal certification and our human reconstruction remain distinct. Prior orchestrator summary run 45977324146 is unrelated to new compact verification.

RESUME HERE: LinkPairing.exists_link_split_le_classGauge lines 246–278: reconstruct its two orthogonal splits and the sublatticeDisc_mul_index_sq_le caller, preserving the remaining Jacobi lift comparison at lines 55–122; then consume the established pair bound at CrudeEnergy.energy_le_of_level_pairs lines 127–160 without repeating the finite averaging or geometric aggregation.
HANDOFF TO integration/audit: use equations (1)–(4) as the pointwise pair step in B2, conditional on the exact native lift supplier; no whole B2 closure.

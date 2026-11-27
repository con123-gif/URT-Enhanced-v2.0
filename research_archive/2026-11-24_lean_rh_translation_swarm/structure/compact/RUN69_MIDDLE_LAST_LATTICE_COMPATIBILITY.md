# RUN69 — middle/last pair lattice compatibility (compact seesaw)
27 November 2026. Status PARTIAL — source-matched human derivation; independent audit pending. No fresh Lean invocation. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Read latest ONE_EQUATION_MISSION (including allocation and completion-first amendments), HUMAN_PROOF_COMPACT, SWARM_PROTOCOL, AGENTS and continuity/preflight records. Resume RUN68 (58afe07e). The manuscript already contains peer 3180f6da's global good-datum coefficient/projection assembly, so do not count that again as new. The missing bridge targeted here is the explicit local hA/hM compatibility used by isAdmissibleEval_finEval, not another equivalent statement of seesaw.

## 1. Chart inverse, including the exceptional middle coordinate
Native sources:
- New/Seesaw/GoodDatumExists.lean cc6f93272fb65dd22d8079236a66454b034182b9, isAdmissibleEval_pairEvalY 21–38.
- New/Seesaw/AdmissibleEvaluation.lean 4a0070f1658927e4faf4e596cceb0009478b6c2d, inv_xFin_mulVec_mem_of_spansLattice 32–42, IsNeighbourVector 60–62, hA/hM 167–172.
- New/Seesaw/LatticeAndTorsionDefs.lean d92de3b66fe1dc9c9a356de9a50779dc36289ac0, gradedLatticeBasis and SpansLattice 13–26.
- New/Seesaw/PairTensorData.lean ade3783be65d0ac72f29b46220354147ffdca110, spansLattice_gradingY 204–205.
- New/Seesaw/GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8, 191–212.
- New/Seesaw/EdgePair.lean 02588c1ebc8eed128efaa107d9a9e1b5863d4d02, middlePair and lastPair 235–256.

Write O for the integral finite adeles, r=divStar(a), epsilon=Weil.normNegOne (epsilon in O and epsilon*bar(epsilon)=-1), and P_N for the native split places of N. Suppress reindexing by each grading index equivalence; it is a permutation, not a new lattice. For an odd string the chart matrix G has grade-zero columns the identity except for e, whose column is e/bar(pi)+u z/(bar(pi)*pi), with z the unique middle string coordinate. Other string columns are u times the coordinate columns. The native finite frame is x_f=G k with k in GL(O). A vector with grade-zero coordinates x_j and only one possibly nonzero string coordinate v_z has chart preimage
    (x_j for j != e, bar(pi)*x_e, v_z/u - pi^-1*x_e at z, zeros on other string coordinates).
Indeed multiplication by the exceptional e column contributes u*pi^-1*x_e at z. Thus x_f^-1 v is integral whenever these displayed entries are integral: multiply the integral vector by k^-1 in GL(O). This is the full odd-chart cancellation in inv_xFin_mulVec_mem_of_spansLattice; no inversion of pi inside O is asserted. It suffices that the *difference* v_z/u-pi^-1*x_e is integral. It would be false to demand separately that x_e or pi^-1*x_e be integral.

## 2. Actual middle-pair hM: two chart calls, one shared residue
Fix i<rho, let u=r^(rho-i+1) be the scale of the first odd chart and intervening even chart in GoodDatumExists 23–34. The next odd chart has scale u/r. This is exactly the two specializations L((rho-i).succ), L(rho-i) at lines 32–34 (retain spansLattice_gradingY). Write x=(x_L,x_R), with exceptional last grade-zero coordinates x_e,x_e''. Let c be the neighbour scalar. Its five hypotheses in IsNeighbourVector are
    delta*c=c;
    x_j in O for j not e,e'';
    bar(pi)*x_j in O for every j;
    A=c-pi^-1*x_e in O;
    B=bar(epsilon)*c-pi^-1*x_e'' in O.
The hM variables s,t satisfy s*r=bar(epsilon)*delta and t*s=1. These are the actual finite-coordinate scalars in the caller, not arbitrary normalizations.

The middlePair inclusion has hyperbolic columns (z-z'')/(2N), z+z'' and the grade-zero coordinate inclusions. In hM the first hyperbolic column is multiplied by zero, the second by s*u*c, and grade-zero coordinates are (s*x_L,x_R) because kappa=1 in this branch. Applying the external t to the left block leaves grade-zero x_L and middle coordinate u*c. The right block has grade-zero x_R and middle coordinate s*u*c. Hence the two exceptional preimage entries from section 1 are precisely
    (u*c)/u - pi^-1*x_e = A,
    (s*u*c)/(u/r) - pi^-1*x_e'' = s*r*c-pi^-1*x_e''
                                           = bar(epsilon)*c-pi^-1*x_e'' = B.
Both are integral by the same neighbour vector; the ordinary coordinates and bar(pi)*x_e, bar(pi)*x_e'' are integral by its other clauses. This establishes hM for every neighbour column at the middle pair. No extra 2N denominator: the column carrying it is exactly annihilated by the zero entry in the hM witness. No approximate symmetry or estimate is used.

## 3. Actual last-pair hM: the missing plane is replaced by a cancellation
For i=rho the first string has length 1, the next length 0, and the final space is standard with no string. The left odd-chart scale in L(1) is r. The lastPair inclusion keeps ordinary grade-zero coordinates and sends its extra final coordinate to z/pi; the native piIdele here is the rational pi in that inclusion (GoodDatumExists 38). There are no hyperbolic columns. The kappa weight is delta on this one extra coordinate and 1 on all ordinary coordinates. Thus after applying t the left ordinary coordinates are x_L and the middle coordinate is t*delta*pi^-1*x_e''. By s*r=bar(epsilon)*delta and t*s=1 we have t*delta/r=1/bar(epsilon)=-epsilon. Consequently its exceptional chart preimage is
    (t*delta*pi^-1*x_e'')/r - pi^-1*x_e
       = -epsilon*pi^-1*x_e'' - pi^-1*x_e
       = (c-pi^-1*x_e) + epsilon*(bar(epsilon)*c-pi^-1*x_e'')
       = A + epsilon*B in O.
Here the cancellation is c+epsilon*bar(epsilon)*c=0; using a positive norm-one scalar in place of normNegOne would invalidate it. This reproduces the precise add_mem a (mul_mem Weil.normNegOne.1.2 b) at GoodDatumExists 34–35. The remaining final standard coordinates are ordinary x_R coordinates (not the relocated e''), hence integral; the final frame is standard as used at 35–37. This proves the terminal hM without a second odd chart or an extra denominator.

## 4. Weight match and actual caller
Take beta=D.piGBar and alpha=D.chosenIdele, delta=alpha/bar(alpha). The valuation identity v_chosenIdele (PairTensorData 191–193) gives, place by place,
    v(bar(beta)*delta)=v(beta).
The same delta has delta*bar(delta)=1. The chosen support is disjoint from places over N (the native not_isChosen_of_N_mem and generator_spec used in GoodDatumExists 27–31); there alpha=1 and beta is a local unit. Retain D.isSplitLevel_piPlaces, piIdele_spec, and the native hdelta relation to divStar(a) in AdmissibleEvaluation 53–56. On ordinary grade-zero columns the source and target side of selfOrConj(beta) agree and kappa=1. In the middle pair all retained columns are of this type. In the last pair the single extra right column goes into the left string coordinate. Its old weight is bar(beta), so multiplying by kappa=delta makes its weight valuation exactly v(beta), matching the left target. This is the nonzero-entry alternative of hA; all other entries of the inclusion on these columns are zero. Both required integrality weights in hG hold: for unchanged columns beta and bar(beta) are integral, and for the relocated column bar(beta)*delta has the valuation of beta. Thus the explicit hA/hM arguments discharge the compatibility inputs of the actual isAdmissibleEval_finEval caller with the retained native split, grading and chosen-idele hypotheses. The upstream frame-existence and idele valuation lemmas are not newly reconstructed here. No claim to have reconstructed all their hypotheses.

## 5. Denominator and consumer ledger (reuse, not newly counted)
GoodDatumExists 43–82 already uses two transported vacuum names, their bilinear arrowProduct (denominators multiply, conjugate l1 sizes multiply), then the just-established admissible evaluation. Each paired combination uses the original sufficient cutBound^4 denominator and size 1 under the untwisted guard. The source establishes divisibility using absNorm_piGBar, card_Ohat_quot_span, card_X and n_mono (76–78); do not replace that cardinal calculation with a heuristic numerical estimate. The pure tensor over rho+1 pairs therefore has denominator cutBound^(4(rho+1))=cutBound^(2m) (m=2rho+2), size 1, and common scalar product C=prod C_i, independent of y and theta. These are exact exponents, not another new result: peer 3180f6da and HUMAN_PROOF_COMPACT already record this assembly and the subsequent projection. The new sections 1–4 fill the compatibility formerly retained by RUN68 and used by this denominator assembly. Keep original name/character integrality assumptions and peer reconstruction in place.

## Method and limitations
The structure-led search isolated a single exceptional coordinate in each odd chart. Ordinary block multiplication and exact cancellation give the proof. Comparison: the native proof invokes the inverse-chart lemma twice for middlePair and once for lastPair; the human derivation uses the identical two/one applications with explicit residuals. No measured acceleration or complexity claim. Rejected routes: require integrality of each of the two terms of the chart residual; charge the killed hyperbolic column's 2N denominator; carry middle-pair second chart into terminal pair; replace epsilon by norm-one phase. These either strengthen the hypotheses incorrectly or lose exact cancellation. No new Lean check; no independent review yet; external formal certification is not our incomplete human reconstruction. Source-matched derivation for the local compatibility bridge, not a new root closure.

RESUME HERE: GoodDatumExists 47–82, specifically derive the remaining native name-expansion/cardinality divisibility and determinant-character unit guards from their definitions, checking existing peer coverage before duplicating. If already discharged, move to SeesawTheorem.exists_stage_cut 52–75 near-lines compact-cut and conjugated principal congruence supplier. HANDOFF TO integration/audit: merge only sections 1–4 with RUN68 and existing good-datum seesaw section; retain frame/idele hypotheses until independently supplied. No protected files modified.

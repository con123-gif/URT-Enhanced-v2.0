# C: actual tested-form agreement and simultaneous Gram determinant

26 November 2026. HUMAN SOURCE-MATCHED / PARTIAL; native replay pending. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Working snapshot 1a7f9457f10c20e3c3308c7ce5027405ddf76cf2. Read current mission including primitive closure and mandatory reduction engine, AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, current manuscript, research-state/protocol and CI summary. Peer 7cc78b2f requests precisely the final caller; 20cc89bf comparison normalization and 1a7f9457 crystalline few-low-jump overlap are separate suppliers. No URT premise or new endgame assembly.

## Exact source ledger

- New/Selmer/DenominatorBound.lean, denominatorLe_rowBudget, lines 43–166, blob 5889d96fe1a6ad7926e0df09a7d183232f91c534.
- New/Patching/OnePrimeTie.lean, BaseLevel.exists_diagOp_mem_ellIntegralForms, lines 185–304, blob d161966411413f049b0ae5a6baee8fdd4bcc0a26.
- New/Selmer/HeckeStableSubspaces.lean, le_of_isotypic_mem and orthogonal_mem_invtSubmodule_hecke, be64542e80d1a93f47f65abae6adba9823e5a76e.
- New/Selmer/HeckeString.lean, isRoot_hecke_string, e687e4e029036374decd6f30a289c0f709212cc2.
- New/Selmer/BaseLevelOfLabel.lean, exists_baseLevel, 3b0eff13f173100f929210c4004753e9f091d8df.
- New/Selmer/FitTwists.lean, AuxPair.IsTested, DenominatorLe, Data.IsFitFamily, c62935a73ccbef6c7fc42f45c83f111e811a5825.
- New/Selmer/DeterminantBound.lean, norm_gram_det_le_of_operators, 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df.
- New/Selmer/FitTwistsExist.lean, exists_isFitFamily, da769eba595af2f883eed9b82dbd322a521aea14.

## 1. Same cut, same operator, exact support

Let A be the native spanning set of the cut Z, j=toSmoothForm, and H=D.chosenGroupOrder. For the nonzero distinguished p in A choose its actual apt label c and label projection P_c, with im P_c contained in im(groupAlgAction E). The proof's dichotomy z says each v in A either P_c v=0 or P_c v=v and jv is nonzero in an isotypic component x. (Zero vectors may be put in the first case.) All those x are in the actual predicate X. The base-level supplier embeds j(im P_c) into the same base level B, and H j(P_c y) is ell-integral if jy was ell-integral. The same B defines the auxiliary level and the eigensystem lift xi.

Peer 7cc78b2f reconstructs the Ribet top coefficient s from F=C(b)f and b | P^k-(p(0)H^2)^k A_sep^k; retain all its trace-ideal, root-string, integral-endomorphism and depth hypotheses. In particular its integral-diagonal conclusion is universal in the auxiliary function used to test support and agreement, not merely an equality at pi. For any function t, put E_t=diagOp(t) o j and G_t=E_t P_c. On every v in A the diagonal action is either zero or t(xi)jv. Thus if t vanishes on X then G_t vanishes on A and hence on Z. This discharges the exact first universal hypothesis at the actual y=jw for w in Z; no new pointwise assumption on arbitrary forms. The distinguished eigenvalue bound from the top coefficient is exp(-gamma)<=|iota(l) H^3| with gamma=card(r)*rowBudget(D,ell)*log ell, using the actual Ribet budget. Nonzero jp makes this scalar unique.

## 2. Agreement, proved via one invariant intersection

Let Xi'_b be an actual tested form and x_b=pr_Z Xi'_b. For any t with t(xi)=0 whenever p(b(xi))=0, prove G_t Xi'_b=G_t x_b. This is the second universal hypothesis of the integral-diagonal theorem; t is arbitrary, distinct from the selected Ribet s.

Choose one split place w off the actual base level and ell, and satisfying the native split/level guards, using the filter intersection at lines 145–147. Put K_w=ker H_w(testValue(w)), F=im(groupAlgAction E), and
  W=im P_c intersect Z^perp intersect (F intersect K_w)^perp.
The vector u=P_c(Xi'_b-x_b) lies in W:
- x_b is the orthogonal projection and P_c is symmetric. Since its action on the spanning set is 0 or identity, it preserves Z and Z^perp.
- For v in F intersect K_w, pairing with u equals pairing Xi'_b-x_b with P_c v. P_c commutes with H_w and its image is in F; when v is in the actual (F intersect K_w) test subspace, the source proves the required test orthogonality via the inner product with u using v in W's test complement and the fact u is already in Z^perp. More explicitly, the source constructs u perpendicular to F intersect K_w: for a in F intersect K_w, P_c a lies in the same intersection; decompose P_c a into pr_Z(P_c a) and its Z^perp component. Z is Hecke-stable and is contained in F (by all native label-range hypotheses), so pr_Z commutes with the split Hecke operator and preserves F. Hence the residual belongs to F intersect K_w intersect Z^perp, precisely the subspace in IsTested. Pairing Xi'_b with that residual is zero, and x_b is orthogonal to it. Equivalently one can use the native displayed subspace inclusion at lines 151–154. No orthogonality of Xi'_b to the whole false-lift kernel is assumed.
- All factors of W are stable under the off-level Hecke polynomials: the native invariant range, orthogonal-complement stability, and commuting Hecke operators justify the intersections and complements. Use the SAME w, not a distinct place per vector.

Take a nonzero isotypic v in W, with lifted system y=xi(v). If E_t v !=0 then t(y)!=0. The annihilating polynomial z' from lines 92–94 vanishes on the systems which have some g with det(N_y(g)-1)!=0 (the complement of the native set s). Hence t(y)!=0 forces 1 to be a root of charpoly(N_y(g)) for EVERY g. By isRoot_hecke_string at the SAME w, the actual Hecke polynomial has all roots in the required string, in particular the root corresponding to O.testValue w (rankDiff>0). This uses spherical local-global compatibility and the actual normalization of testValue, not a converse from a single Frobenius. Thus v is in K_w. Also v in im P_c subset F. But v is perpendicular to F intersect K_w, forcing inner(v,v)=0, contrary to jv!=0. Therefore E_t v=0. The native le_of_isotypic_mem then puts W in ker E_t (off-level Hecke invariance essential). In particular E_t u=0, proving
  G_t Xi'_b = G_t pr_Z Xi'_b   for EVERY t with the stated annihilation property.

This is a human derivation of the previously missing agreement, not a proof of the prior root-string, representation attachment or generic annihilator supplier. Preserve those original edges.

## 3. Feed the same integral diagonal operator into the determinant

Fix the selected s and G=G_s. If w in Z satisfies jw=G x_b, then the exact support and agreement of §§1–2 apply to y=jw and l=j(P_c Xi'_b). The base-level projection supplies H l integral. The native diagonal theorem, with c=H and d=H, gives H^2 times the appropriate diagonal image integral in its equality e at lines 139–143 (the source uses e to obtain the tested integral form). More directly in the actual caller, its left/right forms and e give H^2 jw integral; retain the exact h.2/e substitution and do not assert integrality of arbitrary projected forms. The final line 163–166 applies Xi_a.norm_inner_le_one, integrality of Xi_a at every embedding, and classAut order dividing H. Consequently
  |H^3 iota(inner(Xi_a,w))| <= 1.
The two factors H for the integral form and the third H for the pairing are different costs, all using the SAME chosenGroupOrder. No replacement by H^2 at the determinant level.

For completeness the generic operator-to-determinant step has a short elementary derivation. Let d=dim Z; d=0 is immediate. Choose a basis omega_k from A. For each p=1,...,d let G_p be the actual operator supplied for distinguished omega_p, and let G_p omega_k=l_pk j omega_k. Define M=H^3 and B_ak=iota(eta_a(omega_k)) with eta_a(v)=inner(Xi_a,v). Expand x_b=sum_k P_kb omega_k, write P for its coefficient matrix after iota. The matrix B diag(M iota(l_pk)) P has integral entries for every p, because w_pb=sum_k P_kb (before iota) l_pk omega_k lies in Z and jw_pb=G_p x_b. The norm bound applies entrywise.

For each k choose a nonzero coefficient M iota(l_pk) of largest norm (there is one since the diagonal p=k satisfies the positive lower bound). Normalize the kth linear form by this coefficient, reducing to a nonzero linear form on the residue field. The residue field of the algebraic closure of Q_ell is infinite, so choose one residue vector outside the finite union of their proper kernels and lift its coordinates d_p integrally. (Over a small finite residue field the same argument can fail; do not discard this guard.) Then
  S_k=sum_p d_p M iota(l_pk),
  |S_k|=max_p |M iota(l_pk)| >= exp(-gamma)
simultaneously. The SAME combination of the integral matrices gives the integral matrix B diag(S_k) P. Taking its determinant and using multiplicativity BEFORE norms yields
  1 >= |det(BP)| prod_k |S_k| >= |det(BP)| exp(-d gamma).
Therefore |iota det(inner(Xi_a,pr_Z Xi'_b))| <= exp(d gamma), exactly DenominatorLe iota O E Z (rowBudget D ell * log ell). No bound on a separately chosen basis change is needed; no cancellation of a potentially zero determinant occurs. This is the native determinant lemma via an explicit residue avoidance argument, not a new assumption on gamma.

FitTwistsExist uses the SAME m-fold twist family for this bound on good-lift spans and on rank-one spans. This run does not reprove the Ribet/Selmer budget, actual row existence, local attachment, comparison-line integrality, or the other fit-family arithmetic. Original root and reduced graph remain unchanged; source-level implication only, no elaborated edge retired.

## Reproducible diagnostics and verification boundary

Executed JavaScript sandbox exact integer diagnostics: enumerate all 2x2 matrices with entries -1,0,1. For each of the 36 L with nonzero diagonal choose d0,d1 in F3 so both resulting column sums are nonzero mod 3. For all 81^2 B,P check both C=B diag(sum_p d_p L_pk) P=sum_p d_p B diag(L_pk) P and det C=det(BP) times the two sums. 236196 exact cases, 36 successful common choices. Negative control: X,Y,X+Y have no common nonzero evaluation in F2 (all four pairs enumerated). These are diagnostic finite checks, not proof of residue avoidance over the actual field, automorphic invariance, native compilation, or RH.

Local command -v lean/lake/elan returned no executables. Actual committed CI status for 45799225653 is pass, 912.12s; for 45803534769 it is error, 5147.99s (partial B/C checks, A timeout); the wrapper jobs all succeeded, which does not turn the second native batch into PASS. Existing axiom/graph records retained, no new axioms inferred. Old rh_prune/rh_scan/rh_reduce/rh_auto/frontier are not executed on this compact environment; manual same-context premise and exact determinant reductions above. No protected workflows changed and no competing job launched.

Prepared native probe (uncompiled; use shared compact runner):
```lean
import New.Selmer.DenominatorBound
import New.Selmer.FitTwistsExist
#check BaseLevel.exists_diagOp_mem_ellIntegralForms
#check le_of_isotypic_mem
#check isRoot_hecke_string
#check norm_gram_det_le_of_operators
#check denominatorLe_rowBudget
#print axioms BaseLevel.exists_diagOp_mem_ellIntegralForms
#print axioms denominatorLe_rowBudget
#print axioms exists_isFitFamily
```
A probe checks the pinned native declarations, not equivalence of all human derivations.

RESUME HERE: independently audit the precise projection/orthogonality inclusions in §2 and scalar substitution e in §3, then supply the outstanding local tie/string and Ribet_columns estimates at the same caller; no further determinant re-expression. Integrate the latest marked A, B packet and crystalline peers at their actual consumers. Preserve all original/reduced graphs and axiom evidence. HANDOFF TO mathematics, Galois, literature, audit, human editor and shared kernel runner. Human reconstruction remains incomplete.

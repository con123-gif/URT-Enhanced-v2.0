# Recursive full-Lean reduction: replace eigenvalue-by-eigenvalue row matching by one total dimension budget
25 Nov 2026. Status: proved human local implication from the stated premises, source-matched, not Lean-replayed or RH closure. Continues ce407759 (rank upper instead of equality), fb122c58 (three cylinder counts), e1cd5d8f (row-tie pruning). No URT. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Read updated mission, latest prior reduction, recent commits, peer geometry fcf4bc5a. No claim about complete original proof dependencies.

## 1. Actual proof body and unused requirements
ThirdPlaceSeries/BaseRowsEqRecordRows.lean c224498f474ad9be9f8fe4fb0a9d9cb60f2a6615, theorem base_rows_eq_record_rows_alt:
  obtain ⟨cOf, -, -, h3⟩ := hL
  have e1 := sum_finrank P.S0.Ep (Ep_decomp P h).1 (Ep_decomp P h).2
  ...
  exact Finset.sum_congr rfl fun c _ => (h3 c).symm
The declared hp : RowSideDeterminedAlt T P is not used in this proof body (it is explicitly included in source signature). Neither T nor either of the first two RowsHoldLam3 clauses is used in the body. Source ColumnsFunctionAtSubspaces.lean f97a49cbd9e1996c4934c6bca177eab5dc643ac2 defines RowsHoldLam3 as existence of cOf:FT -> Ix with (i) independence and spanning equality for the isotypic spaces at each level/column, (ii) equality of lambda values at each used tuple, level and character, (iii) per-column row-count equality. The last clause alone is used, to derive the total sum. RowSideDeterminedAlt (ThirdPlaceSeries/RowSideDetermined.lean 15b5e4b987bd2b4461951d68211132b50662d6cb) has six fields lowerMap, lowerMapTw, buDef, ambS, faces, gamDvd. None is needed for this specific dimension proof. Do not infer these are unused elsewhere. The previous checkpoint removed the projection surjectivity input, so no need to reintroduce those conditions for the replacement upper-bound argument.

## 2. Direct aggregate replacement
Fix the actual source RowSideFamily P; put F=D.what2.LL, E_c=P.S0.Ep c subset F^(P.S0.D). For any fixed family constant R>=0 assume
  sum_c dim_F E_c <= R*D.what2.D0,
  sum_c E_c = F^(P.S0.D).
These follow with R=1 from the third RowsHoldLam3 clause and Ep_decomp: the fibers of cOf partition FT and sum_sigma nRows0 sigma = D0 by the source sigma-fiber equivalence. No independence is needed: the linear addition map from the external direct sum of E_c onto the ambient space is surjective, so rank-nullity gives P.S0.D <= sum_c dim_F E_c. In particular one need not construct cOf or identify individual row multiplicities if an independent aggregate budget is available. A weaker per-column upper inequality with cOf also suffices, by summing the fibers; for original input R=1, exact equality gives it automatically. No extra row-to-character bijection is assumed.

NormalizedHeckeFactors/BaseRowsEqRecordRows.lean de4ad89a82942891d722dba018a7385cdea991bf proves finrank_Mj_eq_dW P i by the actual tied basis, no hp or hL; dW_eq_D P h i uses RowsHold0_3 via wf0 and rows0; Ep_decomp P h uses the same h. Keep the original h (or prove independently the weaker spanning and dW<=D conditions); do not drop these merely because independence is not needed.
For all allowed j=i+1:
 dim_C Z_j(mu0) <= dim_C M_j = P.S0.dW i = P.S0.D <= R D0.
This is precisely the rank-factor hypothesis from ce407759, including D0=0. Replacing R by a uniform family constant retains the same local upper bound after multiplying the DIVinN constant by R. Need eventual common threshold and R uniform in x,i and j (may depend on fixed family). This is a genuine weaker local prerequisite, not an automatic bound on the unknown aggregate in the actual host.

## 3. Consequence for actual TopShape input
ThirdPlaceSeries/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd: hLamP occurs exactly twice (intro and sole link_alt_alt_alt call). ThirdPlaceSeries/Link.lean 2e303ba7a042b38d3edb0630fee6b519442b546f uses hLamP for rank_zero_of_row_conditions_alt; source theorem already analyzed in ce407759. Thus in a specialized replacement for this actual assembly, the entire hLamP requirement may be replaced by the aggregate budget with uniform R, and hp is no longer needed in the local rank derivation. Keep selP and any row-side compatibility used in other branches. Retain RowsHold0_3 or prove the stated weaker conditions. This is not a global removal of RowSideDeterminedAlt from the original Lean DAG, nor proof of a new unconditional host estimate. The original producer of hLamP may have other consumers; audit before deleting code.

## 4. Source checks and limitations
Fetched pinned bodies of TopShape, Link, BaseRowsEqRecordRows (native and third-place), ColumnsFunctionAtSubspaces, IndefUse (5d4285a51bfbbcd683a8c81bace984185ad9ed63), ExtNRowsGen (f4264346a207a595657ad837fba7a52c13d31898), RowSideDetermined, RowsRowPin (bf9534ad99aff4ce231b83b78124aaac9a2f8962). V8 checked hLamP occurrence count 2 in TopShape, sole call anchor, no hp token in base theorem body, hL third projection. Proof is elementary rank-nullity, no numerical tests required, no Lean execution or CI replay. No full archive audit or independent proof of RH.
RESUME HERE: identify actual hLamP producer and prove aggregate upper budget directly, without proving isotypic independence or spectral-value equalities unless independently needed. Combine with rank relaxation and one-sided cylinder estimates into the specialized topDesWin assembly. HANDOFF TO theta, geometry, dependency, integration, formal audit. RH OPEN.

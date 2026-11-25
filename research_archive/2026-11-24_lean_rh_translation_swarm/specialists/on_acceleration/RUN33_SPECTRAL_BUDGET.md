# Run 33 — direct spectral density budget (25 Nov 2026)

Status: source-matched conditional mathematical reduction; Lean candidate PREPARED / NOT COMPILED. RH OPEN. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Mission latest read, including mandatory engine section; follows Run32 d41c3276. Peer checkpoints read: fdb0ad7a, 0e1b92ab, 3e1000ef, a910af41, d91e1e45, 1b03d6e3. This addresses the spectral row consumer, not their CM normalization or analytic work.

## Result

At RowsInputPOfTermsFiniteSig.rowsDomAtP_of the only uses of the density-set membership and its global nonnegativity are to produce sd >= 0 and dn(gamma) <= sd for each eligible (gamma,w), where sd = supDens. Replace those outputs by the two inequalities directly. Preserve restricted local type, exact PartnerSumC and exact FiberCntC, and ALL original contextual guards. The old supplier implies the replacement by Real.sSup_nonneg and le_csSup. For alpha>0 the exact normalization identity n0(nc*alpha)*(dn/alpha)=n0(nc)*dn holds (native proof retained). The actual matrix domination is then PSD of (sd/alpha) K - RowGram(nc*alpha); dom_points and every subsequent congruence/zero case are copied byte for byte. The new caller produces original RowsInputP, via original rowsInputP_of and rowsFinAt_of, without needing density membership in the new supplier. Thus a direct uniform bound on the coefficients of the exact fiber identity suffices, rather than their individual identification as elements of densSet.

Important: Run32 raw counts alone do NOT prove the complex FiberCntC identity; a count upper bound cannot be substituted for that equality. No new bound on sd has been proved. Formula guard and BddAbove are retained (the latter is explicitly threaded into the new supplier); FormulaC cannot yet be deleted globally. No removal of phase, multiplicity, local support, or exceptional zero cases. Axiom evidence for new declarations pending; original graph unchanged.

## Source and graph

- src/Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/RowsInputPOfTermsFiniteSig.lean, blob c01da1ef958071738274486ac807f2ed21c85ce5: RowsDatumP, rowsDomAtP_of, rowsInputP_of, rowsInputP_of_termsFinite_sig.
- src/Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/DataCut.lean, blob ba94a5f0910644b63687222a7a3a3affcff8fe82: dom_points.
- src/Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/DataInst.lean, blob 0faa5aa11af43f784043da332f8075db9b8cf734: RowsPSD, rowVec, rowsInput_of.
- src/Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/SpectralTiesReal.lean, blob 81a088d768af684e8f3b09c874918b5a9f12513c: theoremS_rec. Source-reference chain from theoremS_closedP via theoremS_rec3P/2P to theoremS_rec; no claim of new elaborated dependency extraction.

Original graph: rowsInputP_of_termsFinite_sig -> rowsInputP_of + rowsFinAt_of + rowsDomAtP_of -> RowsDatumP + sSup_nonneg + le_csSup + dom_points. Reduced overlay: rh33_rowsInputP_of_budget -> rowsInputP_of + rowsFinAt_of + rh33_rowsDomAtP_of_budget -> RH33RowsDatumBudgetP + dom_points. Original bridge uses rh33_budget_of_datum (and both supremum lemmas). All other edges preserved; no original file replaced. Cache key must include upstream SHA, D, local models M/delta, L, words, row flags and reps, varpi, nc, alpha, and eligibility; no cross-context reuse without proof. Backtrack to original caller if candidate fails replay.

## Verification

14 fail-on-error source transformation checks executed in connector JavaScript, including exact downstream-body equality, unique replacements, pinned blob, original guards and identities preserved, and no proof placeholders. These are static checks, not a Lean kernel verdict. Earlier engine and conditional strip CI status JSON retrieved, returncode 0 for runs 45577239749 and 45576756833; not a verification of this candidate. No runtime or URT advantage claimed. Native command in pinned built environment with the three engine modules: lake env lean RUN33_SPECTRAL_BUDGET.lean. Inspect full output and axiom list; no PASS until executed. Original proof graph and axiom logs remain in prior commits.

RESUME HERE: derive FiberCntC directly from the raw mass identity (Run32) and exact partner/phase data, and bound its actual coefficient dn by the same native sd without reconstructing density membership; replay the new caller in pinned Lean. If exact fiber equality is not obtained, retain original FormulaC. Do not confuse numerical count upper bound with a complex kernel inequality.
HANDOFF TO: geometry, kernel, audit, integration.

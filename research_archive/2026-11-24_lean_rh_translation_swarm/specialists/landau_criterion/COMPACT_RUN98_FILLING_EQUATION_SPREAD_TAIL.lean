/-
RUN98 — generated filling equation at the actual spread caller.
28 November 2026. SOURCE-MATCHED / PREPARED, NOT native verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger read: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION read. Latest peer theta RUN100 a8f3a857
keeps the independent A2 short-span and leaf checks separate; reuse, do
not duplicate. RUN95 actual shared compute run 46120566249 was inspected:
the pick completed and job run (rh-compact-b3-caller-layout-repair-20261128)
is in progress; all three state receipt paths returned 404. Not a PASS,
not a mathematical failure, no duplicate queue registration.

Actual source New/Filling/FillingTheorem.lean blob
801448ae9b895babd0d69dc4f7967d86eb006e76, Data.ramifiedColumns_fill_rows,
line 31: (filling.eq_1 D ▸ D.le_of_hasLogBound).
The same proof also simplifies with filling at line 37, uses
D.filling_fits.petersson_poincare, D.columnCoords.finrank_eq,
D.ramifyingOp_finrank_comap_and_short and the generic
Fits.exists_translate_finrank_comap_le. These are not interchangeable
supplier edges. A source-level reference to the generated equation remains
even after retargeting the data-bearing definition and fitted maps.
New/Filling/FillingData.lean blob 0ef8b0dfe13173b16bd0a8820a4924f10124e278:
the filling constructor contains the A2 freeness proof and the B3 chosen
Bessel system. The generated equation is a possible independent path to
both old suppliers through its statement, proof, or constructor fields.

Reduction: write F(D)=C(D,p,choose(q)), where p proves freeness and q
proves the Bessel existential; C includes ALL other unchanged fields.
For p',q' proving identical propositions, proof irrelevance gives
F'(D) definitional equality with F(D); this is not equality of arbitrary
Bessel witnesses. Transport the *generated equation theorem itself* in
both type and value, replacing the actual old definition and any directly
embedded old proof terms. This keeps the original numeric comparison and
all the same D, c, rank, representation, Bessel normalization, sharp
fixing/complement bounds and ramifying operator. No new premise or choice.
The explicit equation edge must be present in the actual spread proof,
otherwise stop and inspect its elaborated expression: source occurrence
alone is not evidence that kernel retained it.

Reuse theta RUN87 blob ba1101caf13444d28a19de3682c83e1c38a92255,
Landau RUN97 f78990023a3f63f776d0801ef1e4ec569e9a5fc2,
RUN96 acfcc5706081c0f598b55fb9e7cfaae90fd8e2c8.
Integration's common-star candidate blob
26a1965f8ef58960b7045fcc32ab65f795a9d22b selects the B2-only Fits at
Data.ramifiedColumns_fill_rows_run87; substituting only that Fits would
not transport the real Bessel choice or the generated equation.
Provide the exact joined spread result below as a single replacement
supplier to integration; do not duplicate the rows/enough/family/star
chain or retarget those before checking their dependent map statements.

Actual connector JS preflight: 29/29 authenticated file and source-anchor
checks across six files, 7/7 explicit source-subgraph controls (baseline,
joint routing and each of five omitted substitutions). In the MODEL
only, omitting the generated equation restores the old filling path,
omitting any of the fit/coordinate/map substitutions restores the old
real Bessel path, and omitting Fits restores both old energy/trace
paths. Not a full elaborated graph. Original and reduced full graph
audits are pending. Local command -v lean/lake/elan returned no executable.
No new native rh_scan/prune/reduce/auto/frontier execution, no native
PASS, no quantitative bound or RH proof. Preserve original graphs,
all axioms and every other obligation.

RESUME HERE: after the running RUN95 and independent A2/B2/RUN96/RUN97
receipts are accepted, append this tail AFTER RUN97 in the same generated
ThetaTransportRun87 module (private helpers are file-local), adding
import RHRun96B2B3 at the TOP with the existing imports. Compile once
with normal kernel. Require the two new THETA87_CHECKED markers and the
RUN98 marker; export old/new equation and spread roots with the existing
strict constructor-inclusive graph exporter (four roots). Check both
type and value edge roles, new real Bessel and both B2/B3 branches,
A2 and ramification, record any indirect original dependencies including
petersson_poincare, unfolding, auxiliary simp proofs and finrank_rows_le_mass.
If the explicit equation edge has been normalized away, inspect rather
than deleting the guard. On acceptance hand the joined spread to
integration's existing common-map chain; its A and C suppliers remain.
No Main import, no duplicate cold build. HANDOFF integration/theta/audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

run_cmd do
  let f := ( ``Data.filling, ``Data.filling_a2_b3_joined)
  let a := ( ``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)
  let b := ( ``Data.exists_besselSystem, ``Data.exists_besselSystem_via_directChart)
  let e := ( ``Data.filling.eq_1, `Data.filling_equation_a2_b3_joined)
  theta87Transport e.1 e.2 #[f,a,b] #[f.1]
  let ei ← Lean.getConstInfo e.2
  unless ei.type.getUsedConstants.contains f.2 do
    Lean.throwError "RUN98 generated equation did not retarget the filling type"
  let fs := ( ``Data.filling_run86, f.2)
  let h := ( ``Data.filling_fits_run87, ``Data.filling_fits_a2_b3_joined)
  let c := ( ``Data.columnCoords_run87, ``Data.columnCoords_a2_b3_joined)
  let q := ( ``Data.poincare_run87, ``Data.poincare_a2_b3_joined)
  let m := ( ``Filling.Fits.exists_translate_finrank_comap_le,
             ``Filling.Fits.exists_translate_finrank_comap_le_b2_b3_joined)
  let old := ``Data.ramifiedColumns_fill_rows_run87
  let fresh := `Data.ramifiedColumns_fill_rows_a2_b3_joined
  theta87Transport old fresh #[fs,f,h,c,q,e,m] #[h.1,c.1,q.1,e.1,m.1]
  let ni ← Lean.getConstInfo fresh
  let some nv := ni.value? (allowOpaque := true) |
    Lean.throwError "RUN98 missing spread proof"
  let deps := ni.type.getUsedConstants ++ nv.getUsedConstants
  unless nv.getUsedConstants.contains e.2 && nv.getUsedConstants.contains m.2 &&
      deps.contains ``Data.ramifyingOp_finrank_comap_and_short_run84 &&
      deps.contains h.2 && deps.contains c.2 && deps.contains q.2 &&
      !deps.contains e.1 && !deps.contains m.1 do
    Lean.throwError "RUN98 lost joined spread/equation or retained required old edge"
  Lean.logInfo "RUN98_JOINED_EQUATION_SPREAD_GUARDS"

#print axioms Data.filling.eq_1
#print axioms Data.filling_equation_a2_b3_joined
#print axioms Data.ramifiedColumns_fill_rows_run87
#print axioms Data.ramifiedColumns_fill_rows_a2_b3_joined

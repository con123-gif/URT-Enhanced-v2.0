/-
RUN95 — join actual A2 short-only and B4 rank-only branches at the SAME
independent family. 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 /
579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES;
latest kernel bb260a3d34 (bounded prune acceptance), integration 77afc7926f,
editor 1c21daa8f6, prime 557eeda77e (separate conditional endpoint).
No duplicate cold build. No new URT assumption.

Specific issue: RUN93 and RUN94 independently cut the joint rank/short
proof, but still reference the original freeness-dependent column span
and one-factor rank supplier, respectively. Moreover RUN85's actual
A/B witness replaces only A, not enough_forms. This tail composes both
cuts with the already prepared RUN84 freeness transport and RUN85
height/index transports. Keep original Poincare, projectedPoincare,
scaledInclusion, D, q and all quantitative predicates unchanged on BOTH
branches. Do not mix the RUN87 alternative maps with only one branch.
This intentionally retains the old filling-definition path and any
other transitive original paths, pending separate full audit.

Exact mathematics at the joined caller (LongForms.lean):
A supplies q>0, B_s=q P_s, S spanning the ramified columns, common
size h and index bounds. B supplies t with |t| dim(Column)<=
5 rowDim log(1+b^2), and lower bound (1-4/b^2) rowDim on the span
of ranges P_s for s in t. Since q is nonzero, range(q P_s)=range(P_s).
Since span(S)=top, span(Y)=sum_{s in t} range(P_s) for
Y={B_s phi | s in t, phi in S}. Extract ONE basis y of span(Y)
and use A's index and size estimates on that same y. Hadamard gives
the stated covolume bound. No separate choice of D, S, t, or y in the
size and index branches. This is the actual original caller argument,
not a new proof of its geometric or arithmetic suppliers. No new
premise, changed numerical bound or strengthened conclusion.

Source verification actually performed in connector JS:
four exact blobs authenticated, 17 anchors across 7 actual
declaration bodies; 17/17 deleted-anchor controls rejected.
Blobs: RUN93 72aef826d8ed4ba777d272b43c470d726ae77ae8, RUN94 e95b401fff71040ada447d8c821428b07c25c448,
ShortAndEnough b99eea0689be372d84362c58272b705e104b6a3a, LongForms 9eff36cf003ac398fbd24361e80e95a03d0b0e05.
Local shell has no lean/lake and GitHub git DNS failed.
Latest actual state read: A1/A2 46023465491 ERROR, blob
07a2b14930c38095e6771ae9ed1a10a3cf1bf678; A1 retry 46075703055
ERROR blob 9838f1d1c9d36c9906c2736d5d8d4f08fe98042f.
Original cache artifact 15236761794 remains the designated recovery.
No new native execution, no rh_scan/prune/reduce/auto/frontier
execution or PASS. All original and reduced source graphs retained;
native exact statement, value edges, axioms and constructor-inclusive
graph remain pending. No global deletion or root closure.

RESUME HERE: execute RUN92 leaf in the authenticated retained workspace
first; only on acceptance compile RUN93 and RUN94 as external modules
ThetaShortRun93.olean and ThetaRankRun94.olean. In the generated RUN91
combined caller source (RUN88-based), add imports ThetaShortRun93 and
ThetaRankRun94 in the initial import block and append this tail in the
same module as private theta84Transport. Reuse accepted objects; don't
rebuild old source. Require all original and new guards, including the
seven fresh THETA84_CHECKED markers and this join marker, actual exit 0
and no unexpected axioms. Export original/reduced constructor-inclusive
graphs at Data.exists_family_covolumeSq_le and its run95 counterpart.
Keep surviving definition paths. Do not select the old B2/B3 suppliers
over more recent accepted replacements: send only the accepted A2/B4
supplier delta to integration. HANDOFF kernel/integration/audit.
A2/B4/star/RH OPEN.
-/

run_cmd do
  theta84Transport ``Data.span_short_ramifiedColumns_run93 `Data.span_short_ramifiedColumns_run95
    #[(``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)]
  theta84Transport ``Data.ramifyingOp_finrank_comap_run94 `Data.ramifyingOp_finrank_comap_run95
    #[(``Data.finrank_ker_one_sub_centralGen_le, ``Data.finrank_ker_one_sub_centralGen_le_run84)]
  theta84Transport ``Data.ramifiedColumns_fill_rows_run94 `Data.ramifiedColumns_fill_rows_run95
    #[(``Data.ramifyingOp_finrank_comap_run94, `Data.ramifyingOp_finrank_comap_run95)]
  theta84Transport ``Data.finrank_rows_ne_zero_run94 `Data.finrank_rows_ne_zero_run95
    #[(``Data.ramifiedColumns_fill_rows_run94, `Data.ramifiedColumns_fill_rows_run95)]
  theta84Transport ``Data.short_forms `Data.short_forms_run95
    #[(``Data.span_short_ramifiedColumns, `Data.span_short_ramifiedColumns_run95), (``Data.weylNormSq_Bmu_le, ``Data.weylNormSq_Bmu_le_run85), (``Data.exists_indexDvd_Bmu_divisible, ``Data.exists_indexDvd_Bmu_divisible_run85)]
  theta84Transport ``Data.enough_forms `Data.enough_forms_run95
    #[(``Data.finrank_rows_ne_zero, `Data.finrank_rows_ne_zero_run95), (``Data.ramifiedColumns_fill_rows, `Data.ramifiedColumns_fill_rows_run95)]
  theta84Transport ``Data.exists_family_covolumeSq_le `Data.exists_family_covolumeSq_le_run95
    #[(``Data.short_forms, `Data.short_forms_run95), (``Data.enough_forms, `Data.enough_forms_run95)]
  theta84Audit ``Data.span_short_ramifiedColumns ``Data.span_short_ramifiedColumns_run95
  theta84Audit ``Data.ramifiedColumns_fill_rows ``Data.ramifiedColumns_fill_rows_run95
  theta84Audit ``Data.finrank_rows_ne_zero ``Data.finrank_rows_ne_zero_run95
  Lean.logInfo "THETA95_COMMON_AB_JOIN_CHECKED"

#print axioms Data.short_forms_run95
#print axioms Data.enough_forms_run95
#print axioms Data.exists_family_covolumeSq_le_run95

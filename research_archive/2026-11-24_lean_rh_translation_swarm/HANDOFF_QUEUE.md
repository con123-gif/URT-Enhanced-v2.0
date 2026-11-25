# RH Proof Translator — continuous staggered handoff queue

**Operating model:** Five *existing* ChatGPT research automations, each runs hourly, intentionally staggered every 12 minutes on the clock around the hour. Bots are **not** exact completion-triggered and do not represent a guaranteed continuous compute process. A commit from one lane is the next lane's handoff and also triggers the existing GitHub CI orchestrator on touched research code. If one finishes early, the next planned bot reads its latest checkpoint at its scheduled time; if one runs late, peers choose non-overlapping tasks.

**SCHEDULE — Europe/London**
- :00 — RH Proof Integration Bot: merge peer results, update coverage/next assignments.
- :12 — RH Dependency Extraction Bot: source/import/DAG/kernel-term dependencies.
- :24 — RH URT Compression Bot: structural sieve and matched baseline benchmarks.
- :36 — RH Mathematics Translator Bot: exact human-readable derivations.
- :48 — RH Formal Proof Audit Bot: audit assumptions and translation soundness.

**Handoff contract — mandatory each session**
1. Read this handoff queue and SWARM_PROTOCOL.md, check all five lane RESUME HERE sections and latest commits, then select one nonduplicate next action. Preserve earlier logs.
2. Work on a specific theorem/dependency set, pin source commit and declaration path, record complete inputs, exact limitations and tests.
3. Write to lane-specific file and mark the task **DONE / PARTIAL / BLOCKED** with evidence. Never delete unproved inputs or omit quantifier scopes; URT may reorder narrative but not proof obligations.
4. In the lane checkpoint leave `RESUME HERE: <one exact next task>` and `HANDOFF TO: <lane or all>`. Include commit SHA if successfully pushed.
5. Integration worker updates this queue with short progress entries so later agents do not repeat solved work. Do not change RH final status from OPEN until source completeness and independent proof-translation audits pass.

**Starting backlog by dependency:**
- DEP: enumerate exact input source file and declaration coverage; distinguish source static references from elaborated kernel references.
- STRUCT: compare proof-obligation DAG dominators and structural compression against fixed URT π/e golden-angle ranking.
- MATH: explain `every_character_of_literature_of_vWin` with all subtheorem hypotheses and why `EveryCharacter` follows.
- AUDIT: recheck extracted `rh_of_every`/`critLine` proof and the admissible source assumptions with independent Lean kernel where available.
- INTEGRATION: assemble a source-linked human proof trace and status coverage dashboard.

**Current verified setup:** bot schedule changes succeeded 2026-11-24, five separate hourly schedules set to 12-minute offsets. Source project remains OPEN. Automated run completion times, code execution availability, or zero idle gaps are not guaranteed.

## Progress
- 2026-11-24: coordination protocol created (GitHub commit `9aa5afbc7805d61f2f49737c41e7e31c616c6ab1`); existing five bot prompts redirected and schedules staggered.


## 2026-11-24 — user-approved external RH blueprint and reconstruction checkpoint

**Required reading for every RH lane:** [rh_lean_blueprint_v2.pdf, draft 24 November 2026, 76 pages](https://drive.google.com/file/d/1-3dAIG1_cmfzkZieK-lw8S5F-v_C9_dI/view?pli=1). Drive file ID 1-3dAIG1_cmfzkZieK-lw8S5F-v_C9_dI; metadata size 1,027,825 bytes, modified 06:02:01 UTC. Accessible via Drive connector at ingestion. This is a linked external reference, not a locally vendored PDF or an independent proof certificate. The blueprint reports reading approximately 1,100 of 175,187 files closely and does not reproduce all proofs or rerun kernel checks. Source claims remain subject to verification against the pinned upstream code. Do not duplicate its explanatory work; use its numbered theorems as a navigation aid, not as assumptions.

**Priority gaps:** Section 2.1 TopG/Green-regular closed definite-side linkage; Section 5.8 exact cancellation and hypotheses; Appendix A.3 ultrafilter patching (s5, chainAbs, cohLim, galOut), trace-formula leaves, principalisation-to-resolution, zero-density proof and explicit formula, prismatic Dieudonne/de Rham identification. Distinguish used obligations from unused library material using actual dependency evidence. Assign these to relevant lanes; preserve all existing work and scheduled starts. Do not silently infer proof from the blueprint. No physical Cathedral gate changes.

### Source-matched correction to Proposition 4.7 (human algebra, not kernel replay)
Upstream pinned revision: 40e56bab026552e089d7afcfeff08d2defb9c005.
- src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean (blob a3ece4b4aea97a95ba2977fa9e8d437e72677774), SizeWindows and GrowthSizeBound are predicates, not standalone proved theorems.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean (blob 4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b), SZ.T1–T4 and proposition_size_bound are the actual proof. The blueprint's step m^2/k <= 1 assumes epsilon <= 1; SizeWindows only requires epsilon > 0. The Lean proof avoids that extra restriction.

Write Q=nT*m*b>0, d=nT2/n>=x^(-eps)>0, P=x^(C*eps)>=1, Y=x^(1/2+13*eps/8)>=1, X=x^(1/2+eps)<=Y. By the original SizeWindows hypotheses:
1. nT*aE <= 2Q*(x/m) <= 2QY.
2. nT*aE*m^2/k <= 2*nT*x*b*m/x = 2Q <= 2QY (since k>=xm). No upper restriction on eps.
3. 2*n*m^2*b*x^eps <= 4Q*m*x^(9*eps/8) <= 4QY, since n/nT <= 2*x^(eps/8) and m <= x^(1/2+eps/2).
4. m*nT2*k*b*x^(2*eps)/n^2 <= 2Q*x^(1/2+9*eps/8) <= 2QY, since nT2<=n, k<=n^2*x^(1/2-eps), n/nT<=2*x^(eps/8).
Hence Err<=10PQY. The growth inequality gives d*(G-4X)<=20PY+4/x<=22PY (x>=3, PY>=1). Divide by d>0, obtaining G<=4X+22PY*x^eps<=26*x^(1/2+(C+21/8)*eps)<=x^(1/2+(C+3)*eps), by 26<=x^(3eps/8). This preserves all hypotheses of proposition_size_bound. The model x/m+m explains the leading exponent but is not by itself the proof. Status SOURCE-MATCHED / human derivation; Lean replay not run. The zeta-only route is not assumed to be on the Main.lean GRH route.

### Next source-matched bridge
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean (blob ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5), theorem Deduction.ch_top: five hypotheses IdentU, SizeData2 (Lean identifier uses subscript 2), ErrWindows, BNBoundsU, LargeX; identifies gapA=ASK-Main via ch_top_main_eq and IdentU; obtains pointwise bound from each_unit_bound_statement; applies errX5at_le and cardinality/error comparison from BNBoundsU. This is a conditional assembly, not the geometric proof of its premises.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean (blob e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef), key_identity5 is the exact cancellation equality (using Data.key_identity), Ga_bound5 and each_unit_bound_statement assemble the pointwise bound with all eleven premises. Blueprint 5.26 is only an approximate narrative of this.
**RESUME HERE:** Expand PointwiseBoundVariant and Data.key_identity, then translate the exact equality key_identity5 and the eleven premises of each_unit_bound_statement into a self-contained human argument; trace each upstream proof to its actual source. In parallel, the Galois lane should take the named patching gaps, and dependency/audit lanes should verify reachable source rather than the blueprint's import counts.
**HANDOFF TO:** all RH reconstruction lanes. No claimed full proof, kernel run, or URT speedup.


## 2026-11-25 — user-directed simplicity pivot (core mechanism first)
User: "This is exactly what we dont want we need to find the simple answer". Prioritize discovering a short, independent mathematical argument over increasing manuscript volume. Preserve prior evidence and audits; do not overwrite or weaken the full reconstruction closure criteria. Do not assume URT, positivity, or symmetry proves RH. Treat the following as a sufficient target, not as a new theorem or a proven bound.

Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005: Main -> rhOfAll -> allChi -> everyCharacter -> actual third-place theta/Green/TopG route -> Comparison₂.formB -> Deduction.zeroFree_of_rpow_window. See specialists/landau_criterion/RUN24_ACTUAL_THIRD_PLACE_MAIN_LANDAU_ROUTE.md. The decisive analytic inequality is Gm F y <= C*y^theta throughout [Y,Y^(1+delta)] for arbitrarily large Y, fixed delta>0, 0<theta<1; sufficient to exclude zeros Re(s)>theta. At theta=1/2 this is a square-root upper bound; alternatively establish it separately at every theta>1/2 and take the logical limit, with all family coverage preserved. CharFamily.lean defines Gm as sum of positive a_i times Re Gchi, Gchi as corrected von Mangoldt ramp sums. The pinned Main route passes C=1, delta=la-1 through Comparison₂.formB; do not conflate this with a globally uniform bound or a zeta-only estimate. The functional equation handles reflection. All are source-matched conditional implications; no independent Lean replay here.

Priority for every lane: (1) find the shortest exact derivation of the needed window bound and family coverage, with explicit inputs; (2) identify which upstream lemmas supply genuinely new cancellation or sign constraints versus adapters and standard results; (3) exploit positive-weight pole residues, exact arithmetic cancellation, graph dominators and symmetry only where mathematically justified; (4) try replacing long supplier chains with direct identities/inequalities, with counterexamples and proof-obligation comparison; (5) editor maintains a concise core argument separately from supporting reference volumes. No page count target is a proof criterion. No claims of success from a restatement of RH or an equivalent unproved inequality. Use original URT as a tested search/ranking heuristic, not a proof assumption; compare to conventional baselines. Report the smallest unresolved mathematical obstruction, not document counts. Retain source pins and do not mix upstream revisions.

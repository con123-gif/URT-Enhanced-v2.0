# Recursive reduction: remove the unused global row-tie premise in LinkIRR
2026-11-25. Human source-matched replacement implication, not a new Lean theorem or RH proof. Continues fb122c58 (three one-sided counts, polynomial distortion) and theta peer 91a5aa50 (unused Green upper bound). Pin 40e56bab026552e089d7afcfeff08d2defb9c005; no URT used.

## Exact second-stage pruning
Formalism/LocalToGlobal/HilbertRowConditions/AllJoin.lean (8cf42dabfd854b527238d32c3d4847f217be91ba) defines AllJoinA A as TWO fields:
- bundle : PlaceDegreeData.RowsTie D A.B
- level : LevelSharp A, requiring a nontrivial additive character psi0 at each type prime and eVec k v = eJk D k psi0 at every place.
AllJoinP.lean (b16f840493df138a7de9eb764b7dae874bef0ef8) theorem tieVecW_of_join uses only hJ.level; it does not use hJ.bundle. It returns TieVecW, which is WEAKER even than LevelSharp: each vector may be either the Whittaker idempotent eUk or the Jacquet idempotent eJk for the same nontrivial additive character.
weight_of_join hL hA hR hJ is literally weightAllRows_of A hL hA hR (tieVecW_of_join hJ). Hence in the actual LinkIRROfJoinEx.linkIRR_of_join_ex call, replace AllJoinA A by TieVecW A and use weightAllRows_of directly. The whole RowsTie bundle and all-Jacquet restriction need not be supplied for this isolated branch. Keep hL (weakened three-clause admLq by peer), TieAdmG, RangeW and sizes. Do not assert the global RowsTie theory is redundant for other consumers.

ArithmeticCylinders.lean (34d5b6f5ffafa0e56248c9e2eefb5ae0483edd81) confirms LabelCountGoodInjective has universal exact dimension matching, inc injectivity, label compatibility of inc, and goodTuple iff inc image. Last checkpoint proved dimension matching needed only for 3 cylinders and label compatibility unused. Combining yields reduced LinkIRR input:
(1) inc injectivity and good iff inc image (or direct n-m <= b0+b1 and m<=n);
(2) exact dim/row matching only for full cylinder and two bad ones if used to estimate counts;
(3) TieVecW (not AllJoinA), local weight comparison as needed to bound bad mass, actual sizes;
(4) one-sided polynomial-distortion counts as in fb122c58.
Then delp <= x^(a+b)(W0+W1) <= exp(-x^(eta/7)) eventually. No deep new estimate is asserted.

## Upstream supplier trace and limitation
Read NonemptyHypsOfPublishedUE.lean (8ea1bf9b962d746476ec8eb0f57362d09af14a63), NonemptyHypsOfAllRows.lean (9d3dea8e99f58e83ae7ebeb8d6c00410c1406e8d): in that assembly, hA.c30 gives a joint RowL containing h30 and irrC, passed through classSel; irrC stored in resulting Hyps. The file is a candidate upstream supplier in the Hyps architecture, but its reachability on the actual third-place Main route has not been authenticated. FockModels/EveryCharacterE.lean (01e60174b728fc6b473a308c5bf5dbffbe017afe) calls hypsE2 and plugAll; do not conflate this alternative with actual Main third-place route. Guessed files EveryCharacterOfThetaIntegralsLocalMatching.lean, EveryCharacterOfGreenVWin.lean and ZeroFreeAllOfGreenVWin.lean in ThirdPlaceSeries returned 404. Need actual producer names from dependency lane. No independent Lean replay or CI, no numerical tests (pure source projection). The removal of an unused argument is an exact human implication by the above theorem bodies, not an assertion about whole-project dependency elimination.
RESUME HERE: follow actual third-place irrC producer, determine which RowsTie fields have distinct consumers and which can be pruned or replaced by TieVecW. Do not translate eliminated premises merely to satisfy the old strong input. HANDOFF TO theta, geometry, dependency, integration and formal audit.

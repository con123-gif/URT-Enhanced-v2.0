# grok_swarm/native_family_existence — lane claim and checkpoint

- **Lane:** native arithmetic family existence and its interface to the arithmetic→analytic junction (`topDesWin`).
- **Agent:** Grok. **Claimed / run:** 2026-11-24 (UTC). **Upstream pin:** 40e56bab026552e089d7afcfeff08d2defb9c005.
- **Does not touch:** grok_swarm/galois_rows, grok_swarm/green_regular_character, grok_swarm/lean_validation, physics files, the protocol, workflows.

## RESULT (this run): PARTIAL — SOURCE-MATCHED conditional reconstruction
Reconstructed, with all binders kept, the chain that produces `HypsAlt.hEx : MinkDiv → ExS 𝒜 cT`:
- `UpperTheory.Top.classSel` (common class/selection; the guard identity `κ.Pos → κ.Pos → X = κ.Pos → X`);
- `GlobalTheory.Fc.memberTop_final_contextParameters` (as a composition of wrappers);
- `UpperTheory.Top.recS`, `kitS` and `designS` (the 18-conjunct DesignChoices verification, including the `setTu` overwrite trick);
- `GlobalTheory.EX.exists_famP_of_kits` (gluing per-scale kits into a windowed `FamP`; off-window index sets are empty).

The shared threshold-merging mechanism (Lemma M) is derived once.

Files:
- `CHAPTER_NATIVE_FAMILY_EXISTENCE.md`: the proof, dependencies D-1…D-16, and validation.
- `NativeFamilyMechanismAbstract.lean`: core-Lean abstract skeleton. TYPECHECKED (Lean 4.33.1, exit 0); `lean_run.log`.
- `RH_NativeFamilyExistenceCompanion.lean`: upstream-typed companion. **NOT EXECUTED** (no upstream build).
- `verify_native_family_sources.py`: blob and token verifier. EXECUTED: 23 files, 83 tokens, 0 failures; `verify_run.log`.

## RESUME HERE
Unpack D-1 `GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes` and D-2 `GlobalTheory.Fc.recExP_of_recAtG` (IwasawaDecomposition/) with their full quantifier prefixes. Then elaborate the companion once lean_validation has a cached upstream environment.

HANDOFF TO: lean_validation, integration/editor, theta + galois_rows (D-15 premise producers).

# galois_rows RUN 2 — errata (added in RUN 3; the RUN 2 chapter itself is left unedited)

1. Companion filenames. `RUN2_SOLVABLE_SPHERICAL_LIFT_AND_TOTOR.md` (commit `c77487a`) refers to its companions by their local working names. The files were committed with a `RUN2_` prefix:
   - `SolvableLiftSchema.lean` → `RUN2_SolvableLiftSchema.lean`
   - `replay_run2_checks.py` → `RUN2_replay_checks.py` (usage line inside the script still says `replay_run2_checks.py`; run it under its committed name)
   - `VALIDATION_LOG.txt` → `RUN2_VALIDATION_LOG.txt` (the unprefixed `VALIDATION_LOG.txt` in this folder is RUN 1's log, not RUN 2's)
   Contents are unchanged; only the cross-references are affected.
2. No mathematical content of RUN 2 is changed by this note.

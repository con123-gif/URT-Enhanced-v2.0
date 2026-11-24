# Tier C: full pinned environment (175,187 modules) — NOT COMPLETED

**Result:** no `#print axioms` output was obtained for `riemannHypothesis`, `primesRel_holds`,
`massRatio_all_unramified_cmFields` or the full companion `integration/RH_ProofCarryingThetaV2.lean`.
Nothing in this file is a PASS.

## What ran
1. All 175,187 published archives fetched and sha256-checked against the pinned manifest (`logs/tierC_fetch.log`:
   175,177 companion-closure archives = 4.37 GB new in 635 s, plus the 10 remaining).
2. Packed into 15 zstd-3 squashfs images, 30 GB total, nothing discarded (`logs/tierC_squash.log`); 175,187 `.olean`
   counted through the merged view (`logs/olean_count.txt`).
3. Unmodified `integration/run_proof_companion_cached.sh /workspace/rh_orig OUT` with the images merged by
   `fuse-overlayfs` at `.lake/build`: every pin check passed and `Main.olean` was present, so no 105 GB download.
   **I stopped it** (SIGTERM, `SCRIPT_EXIT=143`, `logs/companion_script.log`) during `lake build --no-build`, ~8 min in.
   It had written 143,185 of ≈525k `.hash` files through FUSE (~5 MB/s), which starved everything else.
4. `tierC/TierC_PrintAxioms.lean` with the images kernel loop-mounted and merged by a symlink farm
   (`tierC/run_tierC.sh`, `tools/symlink_farm.py`): all ≈208k olean mappings were established (VmSize ≈ 104 GB).
   Then `Lean.finalizeImport` ran (gdb backtrace: `Lean.finalizeImport` → `finalizeImport_spec__9/15` loops).
   After 1,018 s (9 min 17 s CPU) it had read 129.7 GB from the block layer, more than the 30 GB of images
   (page-cache thrash: 16 GB RAM, ≈10 GB available). RssAnon was only 592 MB and growing about 8 MB per 30 s.
   **I stopped it** (EXIT=143, `logs/tierC_print_axioms.log`) to stay inside the time cap and to free shared I/O.
   The memory/disk watchdog (`tools/memwatch.sh`, which kills only this lane's processes) never fired;
   MemAvailable stayed ≥ 8 GB and free disk ≥ 62 GB.

## Diagnosis and next routes (in order)
* The bottleneck is random 4 KB faults amplified into 128 KB squashfs block decompressions, under memory pressure.
  1. Rebuild the images with `mksquashfs -b 16K` (or 4K), or squash only `.olean` and drop `.ilean`/`.c` to save ~6%.
  2. Put the ≈10 GB hottest modules (the Mathlib + CritLine closure) on plain ext4 and keep the rest squashed.
  3. Run on a host with ≥ 128 GB RAM. Published runs used 503 GB; the exporter peaked at 163 GB.
* Smaller targets already pass on this box (Tiers A and B); another lane compiles bounded closures
  (`grok_swarm/native_family_existence/08_*, 09_*`: ExceptionalPair.main closure 30/30; primesRel_holds 485-module
  closure in progress). Do not duplicate that.

## State left on the box (for the next run; delete to free 31 GB)
`/workspace/rh_squash/batch00..14.sqfs` (30 GB), loop-mounted read-only at `batch*.kmnt`; symlink farm
`/workspace/rh_full_build` (708 MB); FUSE overlay upper `/workspace/rh_squash/upper` (hash files, ≈0.3 GB).
`vm.max_map_count` was raised to 1048576 (resets on reboot). Clean-up:
`for m in /workspace/rh_squash/*.kmnt; do sudo umount $m; done; rm -rf /workspace/rh_squash /workspace/rh_full_build`.

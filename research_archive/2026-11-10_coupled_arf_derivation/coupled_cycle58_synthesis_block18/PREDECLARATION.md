# Coupled cycle 58 predeclaration — SYNTHESIS update and BLOCK18

Date: 2026-11-10 (Europe/London)

This cycle performs no new numerical experiment. It updates
`SYNTHESIS.md` from the cycle-54/49 text by adding coupled
cycles 55–57, writes a new index `BLOCK18.md`, and integrates
alt routes 64–66 *if and only if* a `REPORT.md` exists on disk
under

    /workspace/arf_research/alt_cycle64*/
    /workspace/arf_research/alt_cycle65*/
    /workspace/arf_research/alt_cycle66*/

at the time of writing. If a directory is absent, or contains
no REPORT.md, that alt cycle is skipped and the skip is noted.
If a REPORT.md is later present, it is integrated from that
report and not duplicated: the scratch-copy substitution of
geometric H13 for G13, the H13 isotype sector assignment, and
the D=3 coincidence catalogue are not recomputed here. Existing
cycle reports, ledgers and tests are not edited. `LEDGER.md` in
the working directory is appended to, not rewritten. New files
only are added under
`research_archive/2026-11-10_coupled_arf_derivation/`. The
archive’s own `SYNTHESIS.md` may be updated; no pre-existing
repo file or workflow is overwritten.

Questions A–E are kept current. No ARF target is used.
Classification: PROVED as a compilation (and as a documented
skip, if that is what the disk contains).

# Coupled cycle 64 predeclaration — SYNTHESIS update, BLOCK20,
# and a pause-point section

Date: 2026-11-10 (Europe/London)

This cycle performs no new numerical experiment. It updates
`SYNTHESIS.md` from the cycle-63 text by integrating alt
routes 71–73 *if and only if* a `REPORT.md` exists on disk
under

    /workspace/arf_research/alt_cycle71*/
    /workspace/arf_research/alt_cycle72*/
    /workspace/arf_research/alt_cycle73*/

at the time of writing, writes a new index `BLOCK20.md`, and
adds a clear section “Pause point / what would unblock”
listing the four required new inputs already named on the
coupled line:

1. a unique derived 4D coframe and K_γ;
2. a canonical hidden-51 embedding into H64, together with
   the continuum Coulomb residue that would fix C_IR;
3. a derived potential or compact domain for y_even;
4. a derived spectrum of three nondegenerate charged singlets.

If a directory is absent, or contains no REPORT.md, that alt
cycle is skipped and the skip is noted. Alt 71–73 internals
are not recomputed here. Existing cycle reports, ledgers and
tests are not edited. `LEDGER.md` in the working directory is
appended to, not rewritten. New files only are added under
`research_archive/2026-11-10_coupled_arf_derivation/`. The
archive’s own `SYNTHESIS.md` may be updated; no pre-existing
repo file or workflow is overwritten.

Questions A–E are kept current. No ARF target is used.
Classification: PROVED as a compilation (and as a documented
skip, if that is what the disk contains).

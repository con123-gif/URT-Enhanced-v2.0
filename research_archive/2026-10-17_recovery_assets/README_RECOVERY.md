# Source recovery bundle — 17 October 2026

This archive repairs the **missing executable source files** for the numerous October 17 Markdown-only reports on the default `newtons-cathedral` branch. The original source material was recovered from the 65-file Grok handoff and earlier original October 8 archived scripts.

## Apply without overwriting existing work

Extract this ZIP anywhere. From that directory, run:

```bash
python restore_into_checkout.py /path/to/your/URT-Enhanced-v2.0
python restore_into_checkout.py /path/to/your/URT-Enhanced-v2.0 --apply
```

The first command lists missing or different files; the second adds missing files while preserving pre-existing changes. The script **does not** push or commit anything. Check `git status`, test the code and commit from your local checkout afterward. Use `--overwrite` only if you intentionally reconcile conflicts.

Critical example tests (run from repository root, after restoring):

```bash
python research_archive/2026-10-17_source_first_recovery/source_order_regression.py
python research_archive/2026-10-17_exact_14D_H64_reduction/native_h64_exact_14_to4.py
python research_archive/2026-10-17_exact_14D_H64_reduction/execute_exact_full64_to3.py
python research_archive/2026-10-17_full_six_triplet_photon/six_triplet_photon_cumulant.py
```

The large original source archive is copied without overwriting anything under `research_archive/2026-10-17_original_oct08_source`. These are historical/conditional models, **not** a uniquely validated physical H64 action. Some scripts require NumPy, SymPy, SciPy or NetworkX. The `RECOVERY_MANIFEST.json` records SHA256 checksums for every file.

**Unrecovered:** full original `kl_urt_koide_action.py` source; a uniquely selected photon/current/charged-pole H64 physical operator; complete raw conversational research history. These are not silently fabricated by this recovery bundle.

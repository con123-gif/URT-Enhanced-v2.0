# Full-source obligation pooling and stream retry

Prior real challenge run: https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45348756372 failed solely at explicit byte-count check. Actual raw length 350862311, expected 350862970; SHA256 bd484ac9886a96f26b1d9a7a59ebd45b7a70d102c015d4f31f9302bbdd6ab2b9 matched the pinned digest exactly. No closure was produced in that run. Correct expected length, keep SHA256 and solution checks unchanged; new job rh-stream-closure-retry-20261124 registered. Actual completion not yet checked.

Source pool extension: research_archive/2026-11-24_lean_rh_translation_swarm/structure/rh_full_scoped_pool.mjs. Scan every pinned source file, preserve exact candidate lines and occurrence coordinates, scope by module, literal explicit binder string and command-context epoch, rank repetition via frequency histogram. This is a deliberately limited lexical record-field candidate finder, not a Lean parser. Multiline continuations may make a retained line only a prefix of a proof expression; every candidate must be verified against full statement/body and elaborated context before semantic reuse. No automatic proof deletion. Full-source job rh-full-source-obligation-pool-20261124 registered; no full scan result yet.

Actual executed tests (tool V8): {"scopeIsolation":true,"roundtrip":true,"unsupportedContinuationBoundary":true}
Actual retrieved pinned source examples: [
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "blob": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "groups": 9,
    "fields": 212,
    "distinct": 156,
    "duplicates": 56,
    "top40": 96,
    "skipped": 0
  },
  {
    "path": "src/Formalism/SharpRestriction/GlobalSchurBounds/TuSizeOfRealPlaceSecondLayer.lean",
    "blob": "4230332858ed8dc6f11f53ec5df0a0ba05e359b5",
    "groups": 0,
    "fields": 0,
    "distinct": 0,
    "duplicates": 0,
    "top40": 0,
    "skipped": 0
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/FockModels/EveryCharacterE.lean",
    "blob": "01e60174b728fc6b473a308c5bf5dbffbe017afe",
    "groups": 0,
    "fields": 0,
    "distinct": 0,
    "duplicates": 0,
    "top40": 0,
    "skipped": 0
  }
]
Prior single-interface benchmark: exact 212 field lines, 156 RHS strings, 56 redundant lexical occurrences; pure golden phase inferior to frequency, hybrid matched frequency. Do not describe source-text duplicates as discharged proof obligations or extrapolate speedup. Full-source runner requires Node, Git, zstd. Source scan core linear in bytes under ordinary map assumptions; per-group duplicate field detection is linear in group size per field (quadratic worst-case within huge groups). Exact round-trip is for recorded lines only.

RESUME HERE: inspect retry and pool job status on cathedral-research-state. For verified expression closure, use actual named dependencies to filter candidate pool, then independently audit shared producers and translate a single canonical argument only if types and hypotheses match. Use frequency as current baseline; no unsupported URT superiority.

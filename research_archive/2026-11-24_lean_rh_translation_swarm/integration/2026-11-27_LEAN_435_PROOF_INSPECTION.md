# Inspect theorem bodies explicitly

27 November 2026. This records a verifier repair, not a new mathematical
assumption or a completed RH proof. Lean 4.35.0, commit
eb6cafb7290e8bd5f2937522d8d804f58f02bafc; compact source pin
72fead102f663d5c7a407964a13dc0cf9d977207.

The release's `Lean/Declaration.lean`, `ConstantInfo.value?`, returns only
definition values by default. Theorems and opaque declarations require:

```lean
let some value := info.value? (allowOpaque := true) |
  Lean.throwError "No inspectable proof value"
let deps := value.getUsedConstants
```

Our earlier pair/energy inspectors omitted that argument. The proof bodies
were accepted, then the inspector rejected them. Run 45998845682 is therefore
ERROR, despite its successful source build and the pair block's standard
axiom reports. The corrected access inspects the actual proof; kernel
checking, exact statement comparison and dependency guards remain required.

The same run printed the energy axiom `Classical.choice` as `choice` after
`open Classical`. Force `pp.fullNames=true` before parsing axiom reports.
Retain the exact allowlist `propext`, `Classical.choice`, `Quot.sound` and
reject unknown names and `sorryAx`. Do not silently whitelist abbreviated
names. The prepared C2 runner adapts the peer's proof-accessor command in
a derived copy, retaining the authenticated original source unchanged.

The separate skew/count candidate failed because `neg_mul` did not rewrite
a rectangular matrix product. Its adapter now uses `Matrix.neg_mul`. The
generic skew helper had passed; that does not certify the caller adapter.

The native cache from this run is authenticated and restored locally;
fresh seven-declaration and repaired skew/count execution is in progress.
Successful proof-body elaboration, a successful whole-file exit, exact
caller guards and the recursive graph audit have separate statuses. None
of these local checks establishes the complete human assembly or RH.

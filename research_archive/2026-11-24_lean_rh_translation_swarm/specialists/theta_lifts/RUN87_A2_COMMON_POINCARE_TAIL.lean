/-
RUN87 — common Poincare map at the A2/B4 interface, SOURCE-MATCHED / PREPARED.
27 Nov 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs read this run:
3adc76221a978016e3505cdf3e36ad688354d7d7 /
509fdba8772c61988cbe780d414d726579db7f54 /
b094c82e0c910f74a6f7b31dbcc0351f9053deab.
Read AGENTS, SWARM, HANDOFF, EXPANSION, RUN84–86; peer RUN60
5cb346a2880bd3c785c831103b354d7a2189d769 and jet RUN84
8cb17975bfaabbbdd7982bdb6407873936b5aace (distinct repairs).

Actual source:
New/Seesaw/BesselGeneric.lean a7c7ef1df4208394af100088f6e142c6acbceac8:
  Data.filling_fits -> Data.filling (type), exists_besselSystem, exists_spaceY.
  Data.columnCoords -> Data.filling_fits, centralRep.apply_bijective.
New/Filling/PoincareSeries.lean 737911da73203b5704ef225eec5ffe7c26cfc899:
  Filling.Fits fields: isBessel, index_eq, isIdempotentKernel, point_eq, central.
  Fits.poincareMap is a chosen linear map, not an arbitrary replacement.
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:
  Data.poincare -> filling_fits.poincareMap, columnCoords.
  Data.ramifiedColumns_fill_rows -> poincare (statement), filling_fits,
     ramifyingOp_finrank_comap_and_short, Fits.exists_translate_finrank_comap_le,
     finrank_rows_le_mass, filling.eq_1.
  Data.finrank_rows_ne_zero -> ramifiedColumns_fill_rows, columnCoords.

Specific new bridge: replacing the freeness proof inside Filling.mk is not
sufficient unless the fitted coordinate map and the Poincare map remain the
SAME maps used in Theorem A and B. No new Bessel system or choice of Q may
be made. Write F' = F with only the equal-proposition proof field replaced.
If the fitting certificates h,h' prove definitionally identical propositions,
proof irrelevance gives h ≡ h'. Thus the very same choice functions yield
  C' ≡ C,  Q' ≡ Q,  P' = Q' ∘ C' ≡ Q ∘ C = P.
The equalities are conditional on actual kernel definitional equality.
Do not infer equality from existence of some fitting object or some linear
map. The guard below also covers the possibility that a data-bearing
definition is not definitionally equal: reject, do not transport further.
For the spread statement use exactly original c : ℂˣ, D, ramifyingOp,
and goodProjTranslate, hence no new choice of scale or row space.
Both the old and candidate maps give the same subspace ranks; positivity
of row dimension is the original consequence of this same spread theorem.
All quantitative suppliers remain unchanged. No closure of B4 claimed.

RUN87 source-only preflight actually executed against pinned connector
responses: 15 anchors (including retained suppliers) and 15 individually
deleted anchor controls rejected. No local lean/lake/elan on PATH.
Actual shared status compute/rh-compact-a1-a2-transport-20261127/status.json
blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678 remains error, rc=1,
run 46023465491, source 936316769c22ce71f4f24fa79624ee38741b55b7.
a1_transport.json a836b217995972d757d2b82163d86c78adb4fd2c: generated
failed baseline bacc8d571342525149fb6eba8f062568988ce0d2; rc=1 at transport.
No fresh repair receipt. No rh_scan/prune/reduce/auto/frontier execution,
no native PASS, no URT claim.

This tail does not touch the original definitions. For each actual caller,
substitute the named constants simultaneously, in both statement and value
when present; keep exact universe arguments. Check all actually changed
direct constant edges separately for type/value; no silent missing required
edge. Retain all other constants. Require kernel addDecl with ordinary
checking, full statement definitional equality and, for definitions, term
definitional equality. Reuse the RUN86 axiom guards and original/new direct
edge logs. These are NOT a complete constructor-inclusive graph. In
particular filling.eq_1 and all its old proof paths, finrank_rows_le_mass,
FillingAdmissible, the recursive unfoldStage, seesaw, scaledInclusion and
projectedPoincare, enough_forms and the A/B combined root retain their
existing dependencies until separately audited. A1–A3/B1–B4/C/D/E/V
remain open. This does not supersede the existing live verification queue.

RESUME HERE: ONLY after RUN84–86 succeed in the original LongForms
workspace, copy that generated module to ThetaTransportRun87.lean, append
this exact tail and run lake env lean --tstack=400000 on the resulting
absolute filename. Require exit 0 and five THETA87_CHECKED markers with
exact type/value and no-new-axiom guards; preserve compiler log and export
strict old/new graphs using the accepted 4.35 adapter. If RUN84–86 have
not compiled, repair their first real diagnostic instead. No cold job.
HANDOFF TO kernel, acceleration, integration, audit. RH/star OPEN.
-/

private def theta87Replace (e : Lean.Expr) (subs : Array (Lean.Name × Lean.Name)) :
    Lean.Expr :=
  e.replace fun x => match x with
    | .const n us =>
      match subs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none

private def theta87Edges (before after : Lean.Expr)
    (subs : Array (Lean.Name × Lean.Name)) :
    Lean.Elab.Command.CommandElabM Unit := do
  let a := before.getUsedConstants
  let b := after.getUsedConstants
  let active := subs.filter (fun p => a.contains p.1)
  unless active.all (fun p => !a.contains p.2) do
    Lean.throwError "THETA87 prior expression already contains replacement"
  let expected := (a.filter (fun n => !active.any (fun p => p.1 == n))) ++ active.map (·.2)
  unless expected.all (fun n => b.contains n) && b.all (fun n => expected.contains n) do
    Lean.throwError "THETA87 unexpected changed direct edge"
  unless active.all (fun p => !b.contains p.1 && b.contains p.2) do
    Lean.throwError "THETA87 stale directly replaced edge"

private def theta87Transport (old fresh : Lean.Name)
    (subs : Array (Lean.Name × Lean.Name)) (required : Array Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let info ← Lean.getConstInfo old
  let some v := info.value? (allowOpaque := true) |
    Lean.throwError "THETA87 no original value"
  let before := info.type.getUsedConstants ++ v.getUsedConstants
  for a in required do
    unless before.contains a && subs.any (fun p => p.1 == a) do
      Lean.throwError m!"THETA87 required actual edge missing {old} -> {a}"
  for (a,b) in subs do
    if before.contains a then
      theta84SameType (← Lean.getConstInfo a) (← Lean.getConstInfo b)
  let ty := theta87Replace info.type subs
  let val := theta87Replace v subs
  theta87Edges info.type ty subs
  theta87Edges v val subs
  theta86DefEq info.type ty
  match info with
  | .thmInfo i =>
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl
      { name := fresh, levelParams := i.levelParams, type := ty, value := val })
  | .defnInfo i =>
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.defnDecl
      { i with name := fresh, type := ty, value := val })
    let us := i.levelParams.map Lean.Level.param
    theta86DefEq (.const old us) (.const fresh us)
  | _ => Lean.throwError "THETA87 unsupported original declaration kind"
  let checked ← Lean.getConstInfo fresh
  let some cv := checked.value? (allowOpaque := true) |
    Lean.throwError "THETA87 checked value missing"
  unless checked.type == ty && checked.levelParams == info.levelParams do
    Lean.throwError "THETA87 changed intended checked statement"
  theta87Edges info.type checked.type subs
  theta87Edges v cv subs
  theta86Axioms old fresh
  Lean.logInfo m!"THETA87_CHECKED|{fresh}"

run_cmd do
  let f := (``Data.filling, ``Data.filling_run86)
  let h := (``Data.filling_fits, `Data.filling_fits_run87)
  let c := (``Data.columnCoords, `Data.columnCoords_run87)
  let p := (``Data.poincare, `Data.poincare_run87)
  let r := (``Data.ramifiedColumns_fill_rows, `Data.ramifiedColumns_fill_rows_run87)
  let s := (``Data.ramifyingOp_finrank_comap_and_short,
            ``Data.ramifyingOp_finrank_comap_and_short_run84)
  theta87Transport h.1 h.2 #[f] #[f.1]
  theta87Transport c.1 c.2 #[f,h] #[h.1]
  theta87Transport p.1 p.2 #[f,h,c] #[h.1,c.1]
  theta87Transport r.1 r.2 #[f,h,c,p,s] #[h.1,p.1,s.1]
  theta87Transport ``Data.finrank_rows_ne_zero `Data.finrank_rows_ne_zero_run87
    #[f,h,c,p,r] #[c.1,r.1]

#print axioms Data.filling_fits
#print axioms Data.filling_fits_run87
#print axioms Data.columnCoords
#print axioms Data.columnCoords_run87
#print axioms Data.poincare
#print axioms Data.poincare_run87
#print axioms Data.ramifiedColumns_fill_rows
#print axioms Data.ramifiedColumns_fill_rows_run87
#print axioms Data.finrank_rows_ne_zero
#print axioms Data.finrank_rows_ne_zero_run87

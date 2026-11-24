#!/usr/bin/env bash
# Independent new-version test: imported cache versus fresh collector without extension.
set -euo pipefail
lane="$(cd "$(dirname "$0")" && pwd)"
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"; out="$(cd "$2" && pwd)"
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT; cd "$work"
asset=lean-4.37.0-rc1-linux.tar.zst
curl --fail --location --retry 3 --output "$asset" "https://github.com/leanprover/lean4/releases/download/v4.37.0-rc1/$asset"
echo "2e1bbb832870bb81b7131cb70b13aec2cc7ed9f22e2bdbb236b86076ae20382d  $asset" | sha256sum -c - | tee "$out/release_sha256.txt"
tar --zstd -xf "$asset"
lean="$work/lean-4.37.0-rc1-linux/bin/lean"
"$lean" --version | tee "$out/lean_version.txt"
grep -F '0b77e12952ad39077d80d8bd6b66d601f225c321' "$out/lean_version.txt"
export LEAN_PATH="$work"
cp "$lane/AxiomCycleBase.lean.txt" AxiomCycleBase.lean
cp "$lane/AxiomCycleImport.lean.txt" AxiomCycleImport.lean
"$lean" -o AxiomCycleBase.olean AxiomCycleBase.lean >"$out/cycle_local.log" 2>&1
"$lean" AxiomCycleImport.lean >"$out/cycle_imported.log" 2>&1
cat >FreshCycle.lean <<'LEAN'
import Lean
import AxiomCycleBase
open Lean
run_cmd do
  let env := (← getEnv).setExporting false
  let p : Name := .str (.str .anonymous "CathedralAxiomCycle") "Witness"
  let roots : Array Name := #[p, .str p "plain", .str p "guarded"]
  for root in roots do
    let cached ← Lean.collectAxioms root
    let fresh := Lean.CollectAxioms.runM env
      (Lean.CollectAxioms.collectAndGet (fun _ _ => none) root)
    let j := Json.mkObj [("root", toJson root.toString),
      ("cached", toJson (cached.map Name.toString)),
      ("fresh", toJson (fresh.map Name.toString))]
    IO.println ("CYCLE_RESULT " ++ j.compress)
LEAN
cp FreshCycle.lean "$out/FreshCycle.lean"
"$lean" FreshCycle.lean >"$out/fresh.log" 2>&1
python3 - "$out" <<'PY'
import pathlib,json,sys
p=pathlib.Path(sys.argv[1]); prefix='CYCLE_RESULT '
rows=[json.loads(x[len(prefix):]) for x in (p/'fresh.log').read_text().splitlines() if x.startswith(prefix)]
root='CathedralAxiomCycle.Witness'; ax='CathedralAxiomCycle.guardProp'
assert [r['root'] for r in rows]==[root,root+'.plain',root+'.guarded'],rows
assert all(r['fresh']==[ax] for r in rows),rows
assert all(set(r['cached']) <= {ax} for r in rows),rows
# Cache equality is measured, never stipulated for the new Lean version.
(p/'rc1_result.json').write_text(json.dumps({'status':'NATIVE_SYNTHETIC_FRESH_VS_IMPORTED_CACHE','rows':rows,'cache_disagreements':[r['root'] for r in rows if r['cached']!=r['fresh']]},indent=2)+'\n')
PY

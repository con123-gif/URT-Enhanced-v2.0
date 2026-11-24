#!/usr/bin/env bash
# Retry after actual rc1 unknown identifier. Exact upstream collector body, isolated namespace.
set -euo pipefail
lane="$(cd "$(dirname "$0")" && pwd)"
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"; out="$(cd "$2" && pwd)"
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT; cd "$work"
pin=0b77e12952ad39077d80d8bd6b66d601f225c321
asset=lean-4.37.0-rc1-linux.tar.zst
curl --fail --location --retry 3 --output "$asset" "https://github.com/leanprover/lean4/releases/download/v4.37.0-rc1/$asset"
echo "2e1bbb832870bb81b7131cb70b13aec2cc7ed9f22e2bdbb236b86076ae20382d  $asset" | sha256sum -c - | tee "$out/release_sha256.txt"
tar --zstd -xf "$asset"
lean="$work/lean-4.37.0-rc1-linux/bin/lean"
"$lean" --version | tee "$out/lean_version.txt"
grep -F "$pin" "$out/lean_version.txt"
export LEAN_PATH="$work"
cp "$lane/AxiomCycleBase.lean.txt" AxiomCycleBase.lean
cp "$lane/AxiomCycleImport.lean.txt" AxiomCycleImport.lean
"$lean" -o AxiomCycleBase.olean AxiomCycleBase.lean >"$out/cycle_local.log" 2>&1
"$lean" AxiomCycleImport.lean >"$out/cycle_imported.log" 2>&1
curl --fail --location --retry 3 --output "$out/CollectAxioms.lean" "https://raw.githubusercontent.com/leanprover/lean4/$pin/src/Lean/Util/CollectAxioms.lean"
python3 - "$out/CollectAxioms.lean" FreshCycle.lean <<'PY'
import hashlib, pathlib, sys
src=pathlib.Path(sys.argv[1]).read_bytes()
assert hashlib.sha1(b'blob '+str(len(src)).encode()+b'\0'+src).hexdigest()=='e789f33849debe5cc1f1d9bc60aa3e54a56df0d9'
s=src.decode()
begin='namespace Lean\n\nnamespace CollectAxioms\n'
end='\nend CollectAxioms\n'
assert s.count(begin)==s.count(end)==1
body=s.split(begin)[1].split(end)[0]
assert 'env.checked.get.find? c' in body and 'seen := s.seen.insert c #[]' in body
header=s.split('\nmodule\n',1)[0]
generated=header+'\nimport Lean\nimport AxiomCycleBase\n\nnamespace Lean\n\nnamespace CathedralFreshCollectAxioms\n'+body+'\nend CathedralFreshCollectAxioms\nend Lean\n'
pathlib.Path(sys.argv[2]).write_text(generated)
PY
cat >>FreshCycle.lean <<'LEAN'
open Lean
run_cmd do
  let env := (← getEnv).setExporting false
  let p : Name := .str (.str .anonymous "CathedralAxiomCycle") "Witness"
  let roots : Array Name := #[p, .str p "plain", .str p "guarded"]
  let noneLookup : Environment → Name → Option (Array Name) := fun _ _ => none
  for root in roots do
    let cached ← Lean.collectAxioms root
    let fresh := Lean.CathedralFreshCollectAxioms.runM env
      (Lean.CathedralFreshCollectAxioms.collectAndGet noneLookup root)
    let j := Json.mkObj [("root", toJson root.toString),
      ("cached", toJson (cached.map Name.toString)),
      ("fresh", toJson (fresh.map Name.toString))]
    IO.println ("CYCLE_RESULT " ++ j.compress)
  let orders : Array (Array Name) := #[roots, #[roots[1]!, roots[0]!, roots[2]!], #[roots[2]!, roots[0]!, roots[1]!]]
  for order in orders do
    let results := Lean.CathedralFreshCollectAxioms.runM env do
      order.mapM fun n => Lean.CathedralFreshCollectAxioms.collectAndGet noneLookup n
    let j := Json.mkObj [("roots", toJson (order.map Name.toString)),
      ("axioms", toJson (results.map (fun xs => xs.map Name.toString)))]
    IO.println ("CYCLE_SHARED " ++ j.compress)
LEAN
cp FreshCycle.lean "$out/FreshCycle.lean"
"$lean" FreshCycle.lean >"$out/fresh.log" 2>&1
python3 - "$out" <<'PY'
import pathlib,json,sys
p=pathlib.Path(sys.argv[1])
lines=(p/'fresh.log').read_text().splitlines()
def rows(prefix): return [json.loads(x[len(prefix):]) for x in lines if x.startswith(prefix)]
r=rows('CYCLE_RESULT '); shared=rows('CYCLE_SHARED ')
root='CathedralAxiomCycle.Witness'; ax='CathedralAxiomCycle.guardProp'
names=[root,root+'.plain',root+'.guarded']
assert [x['root'] for x in r]==names,r
assert all(x['fresh']==[ax] for x in r),r
assert all(set(x['cached']) <= {ax} for x in r),r
assert [x['roots'] for x in shared]==[names,[names[1],names[0],names[2]],[names[2],names[0],names[1]]],shared
assert all(len(x['axioms'])==3 and x['axioms'][0]==[ax] and all(set(a)<={ax} for a in x['axioms']) for x in shared),shared
(p/'rc1_result.json').write_text(json.dumps({'status':'NATIVE_SYNTHETIC_ISOLATED_UPSTREAM_COLLECTOR_COPY_NOT_RH_RECHECK','rows':r,'cache_disagreements':[x['root'] for x in r if x['cached']!=x['fresh']],'shared_orders':shared},indent=2)+'\n')
PY

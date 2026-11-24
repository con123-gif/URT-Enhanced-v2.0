#!/usr/bin/env bash
# Follow-up native experiment: independent explicit-reference paths from each cycle member.
set -euo pipefail
lane="$(cd "$(dirname "$0")" && pwd)"
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"; out="$(cd "$2" && pwd)"
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT; cd "$work"
asset=lean-4.33.1-linux.tar.zst
curl --fail --location --retry 3 --output "$asset" "https://github.com/leanprover/lean4/releases/download/v4.33.1/$asset"
echo "890afd185370f85666025b883914ab4f4b339136f8c96167b69cfb62aecaf235  $asset" | sha256sum -c - | tee "$out/release_sha256.txt"
tar --zstd -xf "$asset"
lean="$work/lean-4.33.1-linux/bin/lean"
"$lean" --version | tee "$out/lean_version.txt"
export LEAN_PATH="$work"
cp "$lane/AxiomCycleBase.lean.txt" AxiomCycleBase.lean
cp "$lane/AxiomCycleImport.lean.txt" AxiomCycleImport.lean
"$lean" -o AxiomCycleBase.olean AxiomCycleBase.lean >"$out/cycle_local.log" 2>&1
"$lean" AxiomCycleImport.lean >"$out/cycle_imported.log" 2>&1
python3 - "$lane" <<'PY'
import pathlib,sys
p=pathlib.Path(sys.argv[1])
s=(p/'KernelGraphExport_v3.lean').read_text()
assert s.count('import Main\n') == 1
assert s.count('\nset_option maxHeartbeats 0 in\n') == 1
s=s.replace('import Main\n','import AxiomCycleBase\n',1).split('\nset_option maxHeartbeats 0 in\n')[0]
s+='''
set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
run_cmd do
  let parent : Name := .str (.str .anonymous "CathedralAxiomCycle") "Witness"
  let roots : Array (Name × String) := #[(parent, "inductive"), (.str parent "plain", "plain"), (.str parent "guarded", "guarded")]
  let env := (← getEnv).setExporting false
  let output ← IO.getEnv "CATHEDRAL_CYCLE_DIR"
  let dir := System.FilePath.mk (output.getD ".")
  for (root, label) in roots do
    let axs ← Lean.collectAxioms root
    CathedralKernelGraph.exportGraph env root axs (dir / (label ++ ".jsonl"))
'''
pathlib.Path('CycleGraphDriver.lean').write_text(s)
PY
export CATHEDRAL_CYCLE_DIR="$out"
"$lean" --tstack=400000 CycleGraphDriver.lean >"$out/cycle_driver.log" 2>&1
for k in inductive plain guarded; do
  node "$lane/native_witness_audit.mjs" "$out/$k.jsonl" >"$out/$k.audit.json"
done
python3 - "$out" <<'PY'
import json,pathlib,sys
p=pathlib.Path(sys.argv[1])
a={k:json.loads((p/(k+'.audit.json')).read_text()) for k in ['inductive','plain','guarded']}
ax='CathedralAxiomCycle.guardProp'
plain=a['plain']
w=[x for x in plain['core']['axioms'] if x['name']==ax]
assert w and w[0]['path']==['CathedralAxiomCycle.Witness.plain','CathedralAxiomCycle.Witness','CathedralAxiomCycle.Witness.guarded',ax],plain
assert all(ax in [x['name'] for x in v['core']['axioms']] for v in a.values()),a
# Record actual cached result without asserting it has to disagree.
(p/'cycle_witness_result.json').write_text(json.dumps({'status':'NATIVE_SYNTHETIC_REFERENCE_PATHS','plain_cached':plain['builtin'],'plain_core_witness':w[0],'plain_cached_agreement':plain['agreement'],'all_roots':{k:{'agreement':v['agreement'],'builtin':v['builtin'],'core_axioms':v['core']['axioms']} for k,v in a.items()}},indent=2)+'\n')
PY

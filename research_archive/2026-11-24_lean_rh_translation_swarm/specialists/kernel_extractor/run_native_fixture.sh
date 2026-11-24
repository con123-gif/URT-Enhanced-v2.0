#!/usr/bin/env bash
# Native Lean fixture only. No RH compilation or verification.
set -euo pipefail
lane="$(cd "$(dirname "$0")" && pwd)"
if [[ "$#" != 2 || "$1" != "--out" ]]; then echo "usage: $0 --out DIR" >&2; exit 2; fi
mkdir -p "$2"
out="$(cd "$2" && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
cd "$work"
asset=lean-4.33.1-linux.tar.zst
url="https://github.com/leanprover/lean4/releases/download/v4.33.1/$asset"
curl --fail --location --retry 3 --output "$asset" "$url"
echo "890afd185370f85666025b883914ab4f4b339136f8c96167b69cfb62aecaf235  $asset" | sha256sum -c - | tee "$out/release_sha256.txt"
tar --zstd -xf "$asset"
lean="$work/lean-4.33.1-linux/bin/lean"
"$lean" --version | tee "$out/lean_version.txt"
grep -F '4.33.1' "$out/lean_version.txt"
export LEAN_PATH="$work"
cp "$lane/KernelFixture.lean" .
"$lean" -o KernelFixture.olean KernelFixture.lean >"$out/fixture_compile.log" 2>&1
# Inject a synthetic root into the driver; never modify the original RH source.
python3 - "$lane" <<'PY'
import pathlib, sys
p=pathlib.Path(sys.argv[1])
s=(p/'KernelGraphExport_v2.lean').read_text()
needle='import Main\n'
assert s.count(needle)==1
s=s.replace(needle,'import KernelFixture\n\n'+(p/'FixtureRoot.lean.txt').read_text()+'\n',1)
pathlib.Path('FixtureDriver.lean').write_text(s)
PY
export CATHEDRAL_RH_GRAPH="$out/fixture_graph.jsonl"
"$lean" --tstack=400000 FixtureDriver.lean >"$out/export_compile.log" 2>&1
node "$lane/verify_graph_v2.mjs" --self-test >"$out/checker_tests.json"
# Nonstandard fixture axiom intentionally makes the default trust policy exit 1.
set +e
node "$lane/verify_graph_v2.mjs" "$out/fixture_graph.jsonl" >"$out/fixture_audit.json" 2>"$out/fixture_audit.stderr"
rc=$?
set -e
test "$rc" = 1
python3 - "$out" <<'PY'
import json,pathlib,sys
p=pathlib.Path(sys.argv[1])
a=json.loads((p/'fixture_audit.json').read_text())
assert a['status']=='REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT',a
assert a['missing']==a['bodyMissing']==0,a
assert a['nonstandardAxioms']==[[['s','KernelFixture'],['s','witness']]],a
assert not a['sorryAxInBuiltin'] and not a['sorryAxInStructuralClosure'],a
rows=[json.loads(l) for l in (p/'fixture_graph.jsonl').read_text().splitlines()]
nodes={r['display']:r for r in rows if r['record']=='node'}
assert nodes['KernelFixture.natValue']['value_nat_literal']
assert nodes['KernelFixture.strValue']['value_str_literal']
assert all(k in nodes for k in ['Eq','Quot','Quot.mk','Quot.lift','Quot.ind','Nat','Char.ofNat','String.ofList'])
assert any('hidden' in k and 'KernelFixture' in k for k in nodes),list(nodes)[:40]
(p/'fixture_result.json').write_text(json.dumps({'status':'NATIVE_FIXTURE_ONLY','actual_lean_compilation':True,'audit':a},indent=2)+'\n')
PY

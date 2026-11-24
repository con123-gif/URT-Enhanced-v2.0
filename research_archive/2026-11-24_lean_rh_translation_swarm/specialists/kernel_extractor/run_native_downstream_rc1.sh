#!/usr/bin/env bash
# Native downstream test. Preserve exact roles; never stipulate a cache mismatch.
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
python3 - "$lane" <<'PY'
import pathlib,sys,hashlib
p=pathlib.Path(sys.argv[1])
for name,expected in [('AxiomCycleBase.lean.txt','5f35a7222275457208eb8c65ffb7ff304a9dddba'),('KernelGraphExport_v3.lean','ee4efebb066f6775fa551ae9104cfa973e585071'),('native_witness_audit.mjs','cf17e212d4d7ca294bdde9036545c6cbd51cd0dc')]:
 b=(p/name).read_bytes()
 assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==expected,name
PY
cp "$lane/AxiomCycleBase.lean.txt" AxiomCycleBase.lean
cp AxiomCycleBase.lean "$out/"
cat >AxiomCycleDownstream.lean <<'LEAN'
module
public import AxiomCycleBase
namespace CathedralAxiomCycleDownstream
open CathedralAxiomCycle
@[expose] public def aliasPlain : Witness := Witness.plain
@[expose] public def consume : Witness → Nat := fun _ => 0
@[expose] public def guardTag : Prop := guardProp
@[expose] public def cleanTag : Prop := True
end CathedralAxiomCycleDownstream
#print axioms CathedralAxiomCycleDownstream.aliasPlain
#print axioms CathedralAxiomCycleDownstream.consume
#print axioms CathedralAxiomCycleDownstream.guardTag
#print axioms CathedralAxiomCycleDownstream.cleanTag
LEAN
cat >AxiomCycleThird.lean <<'LEAN'
module
public import AxiomCycleDownstream
namespace CathedralAxiomCycleThird
open CathedralAxiomCycle CathedralAxiomCycleDownstream
@[expose] public def aliasAgain : Witness := aliasPlain
@[expose] public def viaConsumer : Nat := consume Witness.plain
end CathedralAxiomCycleThird
#print axioms CathedralAxiomCycleThird.aliasAgain
#print axioms CathedralAxiomCycleThird.viaConsumer
LEAN
cat >AxiomCycleDownstreamImport.lean <<'LEAN'
module
import AxiomCycleThird
#print axioms CathedralAxiomCycle.Witness
#print axioms CathedralAxiomCycle.Witness.plain
#print axioms CathedralAxiomCycle.Witness.guarded
#print axioms CathedralAxiomCycleDownstream.aliasPlain
#print axioms CathedralAxiomCycleDownstream.consume
#print axioms CathedralAxiomCycleDownstream.guardTag
#print axioms CathedralAxiomCycleDownstream.cleanTag
#print axioms CathedralAxiomCycleThird.aliasAgain
#print axioms CathedralAxiomCycleThird.viaConsumer
LEAN
cp AxiomCycleDownstream.lean AxiomCycleThird.lean AxiomCycleDownstreamImport.lean "$out/"
"$lean" -o AxiomCycleBase.olean AxiomCycleBase.lean >"$out/base.log" 2>&1
"$lean" -o AxiomCycleDownstream.olean AxiomCycleDownstream.lean >"$out/downstream_local.log" 2>&1
"$lean" -o AxiomCycleThird.olean AxiomCycleThird.lean >"$out/third_local.log" 2>&1
"$lean" AxiomCycleDownstreamImport.lean >"$out/imported.log" 2>&1
python3 - "$lane" <<'PY'
import pathlib,sys
p=pathlib.Path(sys.argv[1])
s=(p/'KernelGraphExport_v3.lean').read_text()
assert s.count('import Main\n')==1 and s.count('\nset_option maxHeartbeats 0 in\n')==1
s=s.replace('import Main\n','import AxiomCycleThird\n',1).split('\nset_option maxHeartbeats 0 in\n')[0]
s+='''
set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
run_cmd do
  let ns := Name.str .anonymous "CathedralAxiomCycleDownstream"
  let ts := Name.str .anonymous "CathedralAxiomCycleThird"
  let bs := Name.str .anonymous "CathedralAxiomCycle"
  let w := Name.str bs "Witness"
  let roots : Array (Name × String) := #[
    (w, "Witness"), (.str w "plain", "plain"), (.str w "guarded", "guarded"),
    (.str ns "aliasPlain", "aliasPlain"), (.str ns "consume", "consume"),
    (.str ns "guardTag", "guardTag"), (.str ns "cleanTag", "cleanTag"),
    (.str ts "aliasAgain", "aliasAgain"), (.str ts "viaConsumer", "viaConsumer")]
  let env := (← getEnv).setExporting false
  let dir := System.FilePath.mk ((← IO.getEnv "CATHEDRAL_CYCLE_DIR").getD ".")
  for (root, label) in roots do
    let axs ← Lean.collectAxioms root
    CathedralKernelGraph.exportGraph env root axs (dir / (label ++ ".jsonl"))
'''
pathlib.Path('DownstreamGraphDriver.lean').write_text(s)
PY
cp DownstreamGraphDriver.lean "$out/"
export CATHEDRAL_CYCLE_DIR="$out"
"$lean" --tstack=400000 DownstreamGraphDriver.lean >"$out/driver.log" 2>&1
for k in Witness plain guarded aliasPlain consume guardTag cleanTag aliasAgain viaConsumer; do
  node "$lane/native_witness_audit.mjs" "$out/$k.jsonl" >"$out/$k.audit.json"
done
python3 - "$out" <<'PY'
import pathlib,json,sys,re
p=pathlib.Path(sys.argv[1])
def parse(file):
 out={}
 for line in (p/file).read_text().splitlines():
  m=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line)
  if m:
   k=m.group(1); assert k not in out
   out[k]=sorted(x.strip() for x in (m.group(2) or '').split(',') if x.strip())
 return out
local={**parse('downstream_local.log'),**parse('third_local.log')}
imported=parse('imported.log')
def key(n): return tuple(tuple(z) for z in n)
def name(n): return '.'.join(z[1] for z in n)
ns='CathedralAxiomCycle'
ax=ns+'.guardProp'; w=ns+'.Witness'; plain=w+'.plain'
ds=ns+'Downstream.'; ts=ns+'Third.'
labels={'Witness':w,'plain':plain,'guarded':w+'.guarded','aliasPlain':ds+'aliasPlain','consume':ds+'consume','guardTag':ds+'guardTag','cleanTag':ds+'cleanTag','aliasAgain':ts+'aliasAgain','viaConsumer':ts+'viaConsumer'}
assert len(imported)==9 and len(local)==6,(local,imported)
rows=[]
for label,full in labels.items():
 records=[json.loads(x) for x in (p/(label+'.jsonl')).read_text().splitlines()]
 h,f=records[0],records[-1]
 g={key(r['id']):r for r in records[1:-1]}
 assert f['nodes']==len(g)==len(records)-2 and f['missing']==0
 r=g[key(h['root'])]; assert r['display']==full
 audit=json.loads((p/(label+'.audit.json')).read_text())
 assert not audit['full']['missing'] and not audit['full']['bodyMissing']
 def closure(seeds):
  todo=[key(x) for x in seeds]; seen=set(); axs=set()
  while todo:
   k=todo.pop()
   if k in seen: continue
   seen.add(k); n=g[k]
   if n['kind']=='axiom': axs.add(n['display'])
   if n['kind']=='quotient': continue
   deps=n['type_constants']+n['value_constants']+(n['constructors'] if n['kind']=='inductive' else [])
   todo.extend(key(d) for d in deps)
  return sorted(axs)
 typ,val=r['type_constants'],r['value_constants']
 ca=sorted(x['name'] for x in audit['core']['axioms'])
 built=sorted(name(x) for x in h['lean_collect_axioms'])
 assert built==imported[full],(label,built,imported[full])
 # Preserve exact tagged names alongside display; roles are direct .const
 # roots. Full constructor-inclusive closure is measured separately.
 row={'root':full,'kind':r['kind'],'typeDirect':typ,'valueDirect':val,'typeAxioms':closure(typ),'valueAxioms':closure(val),'coreAxioms':ca,'builtinImported':built,'builtinLocal':local.get(full),'coreAxiomPaths':audit['core']['axioms']}
 rows.append(row)
by={r['root']:r for r in rows}
# Positive and negative control on independently traversed graph.
assert ax in by[ds+'guardTag']['coreAxioms'] and ax not in by[ds+'cleanTag']['coreAxioms']
alias=by[ds+'aliasPlain']
assert [name(x) for x in alias['typeDirect']]==[w]
assert [name(x) for x in alias['valueDirect']]==[plain]
assert ax in alias['typeAxioms'] and ax in alias['valueAxioms']
# Do not force public cache agreement/disagreement. Record it and
# record actual direct roles of viaConsumer (not source guess).
summary={'status':'NATIVE_DOWNSTREAM_ROLE_EXPERIMENT_NOT_RH_RECHECK','rows':rows,'guardOmissions':[r['root'] for r in rows if ax in r['coreAxioms'] and ax not in r['builtinImported']],'aliasCombinedMasks':ax in alias['builtinImported'] and ax not in by[plain]['builtinImported']}
(p/'downstream_result.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({'guardOmissions':summary['guardOmissions'],'aliasCombinedMasks':summary['aliasCombinedMasks'],'roots':len(rows)}))
PY

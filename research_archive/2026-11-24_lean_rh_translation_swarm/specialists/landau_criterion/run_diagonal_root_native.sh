#!/usr/bin/env bash
# Pinned analytic closure only. Does not build Main or assume RH.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
lane="$(cd "$(dirname "$0")" && pwd)"
swarm="$(cd "$lane/../.." && pwd)"
k="$swarm/specialists/kernel_extractor"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
src="$work/src"
mkdir -p "$src"
copy_checked() {
  test "$(git hash-object "$1")" = "$2"
  cp "$1" "$src/$3"
}
copy_checked "$k/RHProofTermPrune.lean" f6d3e7f6047a7895ecf183be3fb54c203f4fc46a RHProofTermPrune.lean
copy_checked "$k/RHRecursiveReductionFixed.lean" 976c28572f11ffb00e1ae730555e938eeb564cb7 RHRecursiveReductionFixed.lean
copy_checked "$k/RHRecursiveReductionAutoV3.lean" a113dc56ea987abac3bf29eb480782140b82ab4a RHRecursiveReductionAutoV3.lean
copy_checked "$lane/RUN32_SINGLETON_POLE_DATA.lean" d65329bb19571dd9af6a20b44b5525456a82323b RH32SingletonPoleData.lean
copy_checked "$swarm/audit/RUN33_DIRECT_LOG_WINDOW.lean" 6ed424ef5516af4b0a494744e77de7c77fcdeb1a RH33DirectLogWindow.lean
cp "$lane/RUN33_DIAGONAL_WINDOW_ROOT.lean" "$src/RH33DiagonalRoot.lean"
git hash-object "$lane/RUN33_DIAGONAL_WINDOW_ROOT.lean" > "$out/candidate_blob.txt"
cd "$work"
asset=lean-4.33.1-linux.tar.zst
curl --fail --location --retry 3 --output "$asset" "https://github.com/leanprover/lean4/releases/download/v4.33.1/$asset"
sha256sum "$asset" > "$out/lean_release_sha256.txt"
tar --zstd -xf "$asset"
export PATH="$work/lean-4.33.1-linux/bin:$PATH"
lean --version | tee "$out/lean_version.txt"
grep -F 'version 4.33.1' "$out/lean_version.txt"
grep -F '819816b2e0a3' "$out/lean_version.txt"
pin=0df444a360eaa60ab8c11dca51a86af692955474
git init -q mathlib
git -C mathlib remote add origin https://github.com/leanprover-community/mathlib4.git
git -C mathlib fetch --depth=1 origin "$pin"
git -C mathlib checkout --detach FETCH_HEAD
test "$(git -C mathlib rev-parse HEAD)" = "$pin"
printf '%s\n' "$pin" > "$out/mathlib_pin.txt"
cd mathlib
test "$(cat lean-toolchain)" = 'leanprover/lean4:v4.33.1'
lake exe cache get Mathlib 2>&1 | tee "$out/mathlib_cache.log"
# Resolve exact actual source import DAG recursively; no broad corpus build.
lake env python3 - "$src" "$out" <<'PY'
import os, pathlib, re, sys, subprocess, json, hashlib, urllib.request, time
src,out=map(pathlib.Path,sys.argv[1:])
pin='40e56bab026552e089d7afcfeff08d2defb9c005'
base='https://raw.githubusercontent.com/leanprover-community/riemann-hypothesis/'+pin+'/src/'
expected={
 'Development.AutomorphicArithmetic.DedekindLFunctions.CharFamily':'81c8dfd66d910d083d5bc88c664c7917fdbdfe96',
 'Development.AutomorphicArithmetic.DedekindLFunctions.LandauZeroFreeCriterion':'54fd0de979e0dad6ac7709ad8ecbec8a29e21872',
 'Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow':'2ed00ad3aa862f3e522686557fb8f559b17fc002',
 'Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.lemmaL':'6c37aebd05121b6d68e3532d8529f0ce8357386f',
 'Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.poleData':'1f7fdc4409d2f1185700764c51d5c17a907d76e1',
 'Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow':'7915058f10b33a52652290cd887cbccdc00e676a',
 'Formalism.GammaFactorNonvanishing.RhOfRight':'3604637147a33e72248faddd775ea750e7846ead'}
local={'RHProofTermPrune','RHRecursiveReductionFixed','RHRecursiveReductionAutoV3',
       'RH32SingletonPoleData','RH33DirectLogWindow','RH33DiagonalRoot'}
manifest={}; order=[]; visiting=set()
def visit(m):
 if m.split('.')[0] in ('Mathlib','Lean','Init','Std','Batteries','Aesop','Qq','ProofWidgets','ImportGraph','Plausible'): return
 if m in manifest:return
 if m in visiting:raise RuntimeError('cycle '+m)
 if m not in local and not (m.startswith('Development.AutomorphicArithmetic.DedekindLFunctions.') or m=='Formalism.GammaFactorNonvanishing.RhOfRight'):
  raise RuntimeError('unexpected source dependency, inspect explicitly: '+m)
 visiting.add(m)
 path=m.replace('.','/')+'.lean'
 f=src/path
 if m not in local:
  for i in range(3):
   try:
    with urllib.request.urlopen(base+path,timeout=60) as u: data=u.read()
    break
   except Exception:
    if i==2:raise
    time.sleep(2**i)
  f.parent.mkdir(parents=True,exist_ok=True);f.write_bytes(data)
 else:data=f.read_bytes()
 sha=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()
 if m in expected:assert sha==expected[m],(m,sha)
 # All imports in this pinned subgraph are top-level single-line declarations.
 deps=[]
 for line in data.decode().splitlines():
  z=re.match(r'^(?:public |private )?import\s+([A-Za-z0-9_.]+)\s*(?:--.*)?$',line)
  if z:deps.append(z.group(1))
  elif re.match(r'^(?:public |private )?import\s+',line):raise RuntimeError('unhandled import '+line)
 # Detect only header imports; no generated dependency guesses.
 for d in deps:visit(d)
 manifest[m]={'blob':sha,'imports':deps,'origin':'local overlay' if m in local else pin}
 order.append(m);visiting.remove(m)
visit('RH33DiagonalRoot')
assert set(expected)<=set(manifest),set(expected)-set(manifest)
(out/'import_dag.json').write_text(json.dumps({'pin':pin,'modules':manifest,'order':order},indent=2))
env=os.environ.copy();env['LEAN_PATH']=str(src)+os.pathsep+env.get('LEAN_PATH','')
for i,m in enumerate(order):
 path=m.replace('.','/')
 logfile=out/('compile_%03d_%s.log'%(i,m.split('.')[-1]))
 with logfile.open('w') as log:
  res=subprocess.run(['lean','--root='+str(src),'-o',path+'.olean',path+'.lean'],cwd=src,env=env,stdout=log,stderr=subprocess.STDOUT)
 print(m,res.returncode,flush=True)
 if res.returncode:
  print(logfile.read_text()[-10000:],flush=True)
  raise SystemExit(res.returncode)
 # Reject sorry declarations even if warningAsError was not used for source.
 if re.search(r'declaration uses .sorry.',logfile.read_text()):
  raise RuntimeError('sorry warning in '+m)
logs='\n'.join(f.read_text() for f in sorted(out.glob('compile_*.log')))
names={'Deduction.rh33_diagonal_of_original','Deduction.rh33_fixed_window_of_diagonal',
 'Deduction.rh33_right_of_diagonal','Deduction.rh33_rh_of_diagonal',
 'Deduction.rh33_original_root_bridge','Deduction.rh32_principal_pole_data',
 'Deduction.rh33_principal_interface','Deduction.zeroFree_of_rpow_window'}
seen={}
for line in logs.splitlines():
 m=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
 if m:seen[m.group(1)]=[v.strip() for v in (m.group(2) or '').split(',') if v.strip()]
assert names<=set(seen),names-set(seen)
allowed={'propext','Classical.choice','Quot.sound'}
assert all(set(seen[n])<=allowed for n in names),seen
assert 'ROOT_SCAN root=Deduction.rh33_rh_of_diagonal' in logs
assert 'ROOT_SCAN root=Deduction.zeroFree_of_rpow_window' in logs
(out/'result.json').write_text(json.dumps({'status':'CONDITIONAL_DIAGONAL_WINDOW_TO_RH_ONLY','axioms':{n:seen[n] for n in sorted(names)},'scan_lines':[l for l in logs.splitlines() if 'ROOT_SCAN ' in l or 'BINDER_REDUCTION' in l or 'PRUNED ' in l]},indent=2))
print('Conditional diagonal analytic bridge checked; arithmetic premise not proved.')
PY

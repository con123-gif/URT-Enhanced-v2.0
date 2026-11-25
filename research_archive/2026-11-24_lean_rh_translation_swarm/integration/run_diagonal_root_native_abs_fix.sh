#!/usr/bin/env bash
# Integration RUN37 — 25 Nov 2026; verification-first, PREPARED/QUEUED ONLY.
# Mission cd0a176134d46b5b624896e56843a24915c14477 read first. SWARM, AGENTS,
# HANDOFF and living proof reviewed. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005,
# Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
# Actual peer CI run 45663493094, status error, returncode 1, 217.06s.
# RH32SingletonPoleData compiled (exit 0); RH33DirectLogWindow failed at
# line 156 col 35 unexpected token '|*', causing an unsolved goal and sorryAx.
# In the failed parser state the reported 9->6 binder reduction is NOT
# admissible evidence: its original declaration had sorryAx.
# Native source WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
# uses spaced |C| * delta; the seven unspaced occurrences in the peer
# direct log-window theorem are replaced with (abs C) only in the ephemeral
# overlay. In Lean |C| denotes abs C: no mathematical change or new premise.
# Human bound: for K=abs(C)*delta>=0, eta>0 and U>=max(1,4K/eta^2),
# K*U <= (eta*U/2)^2 <= exp(eta*U). The nonnegative window majorant
# R(u)=abs(C)*exp(theta*u) has exact weighted integral K*U. This retains
# every original quantifier and does not prove the arithmetic window.
# Original and reduced source/constructor/value graphs untouched:
# zeroFree_of_rpow_window -> WindowHyp -> WindowHypU -> landau_window;
# candidate direct log bridge -> same WindowHypU -> same landau_window.
# No new global deletion. Preserve all previous scan and axiom evidence.
# Actual original audit source blob 6ed424ef5516af4b0a494744e77de7c77fcdeb1a; original v3 runner 65393035ccca99686a26a7d7d72544750d2755b0.
# Static checks executed: original CI failure/exit codes, pinned audit blob,
# unique theorem range, exactly 7 occurrences, reversible text replacement,
# unique runner path/hook. Local lean/lake absent; no new native PASS.
# Native baseline 45577239749 / 45576756833 retrieved status pass; not this file.
# Peers latest: ddc287ea finite Haar transport; 14e7d708 H2/K theory;
# 746b39e7 exceptional inertia; 63c2b13c CountQ twist; 6b66fdef VVle;
# 97a3d534 rank volume; 18c72c4c residual trace; bb0948b0 fixed layer;
# 490330a6 principal window; 1d03f804 prior replay; bb971bc3 rigidity;
# 904a3009 fiber mass; 3f25eb66 evidence gate; f5cc7b7b Landherr.
# All VWinAt(1,401), same-host rows, entropy, local gain and uniform arithmetic
# remain OPEN. No root mathematical leaf closed here, no URT speedup.
# RESUME HERE: read compute/rh-landau-diagonal-root-abs-fix-20261125/status.json
# on cathedral-research-state, then actual compiler/scan/bridge logs; reject
# sorryAx even if a prune reports success. On success integrate the conditional
# analytic certificate and move to VWinAt and geometry, not further endpoint
# rewrites. On failure backtrack to native windowHyp_of_rpow and
# windowHypU_of_windowHyp with actual singleton equality.
# HANDOFF TO Landau, kernel, audit, editor. RH OPEN.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
swarm="$(cd "$(dirname "$0")/.." && pwd)"
lane="$swarm/specialists/landau_criterion"
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
copy_checked "$swarm/integration/2026-11-25_1700_RH32_MEASURABILITY_REPLAY.lean" 3503e256477e1244f88d483719577514f50929aa RH32SingletonPoleData.lean
copy_checked "$swarm/audit/RUN33_DIRECT_LOG_WINDOW.lean" 6ed424ef5516af4b0a494744e77de7c77fcdeb1a RH33DirectLogWindow.lean
copy_checked "$lane/RUN33_DIAGONAL_WINDOW_ROOT.lean" 6eb76edaa36dfe2135b7215109daeb7836c9184c RH33DiagonalRoot.lean
# Only audit command names are changed, in the ephemeral copy.
python3 - "$src/RH33DirectLogWindow.lean" <<'PYFIX'
import pathlib,sys
p=pathlib.Path(sys.argv[1]); s=p.read_text()
for a,b in [("rh_scan zeroFree_of_rpow_window","rh_scan Deduction.zeroFree_of_rpow_window"),("rh_scan rh33_original_interface","rh_scan Deduction.rh33_original_interface"),("rh_scan rh33_principal_interface","rh_scan Deduction.rh33_principal_interface"),("rh_prune rh33_direct_windowU","rh_prune Deduction.rh33_direct_windowU")]:
 assert s.count(a)==1,a
 s=s.replace(a,b)
# Lean 4.33.1 tokenizes |* as one token in the old unspaced absolute
# value expressions. Use the same absolute-value function explicitly.
a=s.index("theorem rh33_direct_windowU")
b=s.index("theorem rh33_original_interface",a)
body=s[a:b]
assert body.count("|C|")==7
fixed=body.replace("|C|","(abs C)")
assert fixed.replace("(abs C)","|C|")==body
s=s[:a]+fixed+s[b:]
p.write_text(s)
PYFIX
for f in RH32SingletonPoleData RH33DirectLogWindow RH33DiagonalRoot; do
 git hash-object "$src/$f.lean"
done > "$out/actual_overlay_blobs.txt"
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
 # Parse only the Lean header; block comments nest. Do not read Python
 # examples or apparent imports in theorem bodies as module dependencies.
 deps=[]; depth=0
 for line in data.decode().splitlines():
  clean=[]; i=0
  while i<len(line):
   pair=line[i:i+2]
   if depth:
    if pair=='/-':depth+=1;i+=2
    elif pair=='-/':depth-=1;i+=2
    else:i+=1
   elif pair=='--':break
   elif pair=='/-':depth+=1;i+=2;clean.append(' ')
   else:clean.append(line[i]);i+=1
  t=''.join(clean).strip()
  if not t or t in ('module','prelude'):continue
  z=re.fullmatch(r'(?:(?:public|private|meta)\s+)*import\s+([A-Za-z0-9_.]+)',t)
  if z:deps.append(z.group(1));continue
  if re.match(r'(?:(?:public|private|meta)\s+)*import\b',t):
   raise RuntimeError('unhandled header import '+t)
  break
 if depth:raise RuntimeError('unterminated header comment in '+m)
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
# Enforce every actual overlay scan and prune, not just two substrings.
scans=[]; prunes=[]
for m in ('RH32SingletonPoleData','RH33DirectLogWindow','RH33DiagonalRoot'):
 for line in (src/(m+'.lean')).read_text().splitlines():
  a=re.fullmatch(r'rh_scan (\S+) limit (\d+)',line)
  if a: scans.append((m,a[1],int(a[2])))
  b=re.fullmatch(r'rh_prune (\S+) as (\S+)',line)
  if b: prunes.append((m,b[1],b[2]))
assert len(scans)==10 and len(prunes)==3,(scans,prunes)
scan_ledger=[]; bridge_ledger=[]
for m,root,limit in scans:
 idx=order.index(m); log=(out/('compile_%03d_%s.log'%(idx,m))).read_text()
 hits=re.findall(r'ROOT_SCAN root='+re.escape(root)+r' visited=(\d+) values=(\d+) noValue=(\d+) axioms=(\d+) missing=(\d+) pending=(\d+)',log)
 assert len(hits)==1,(m,root,hits)
 v,val,nv,ax,missing,pending=map(int,hits[0])
 assert 0<v<=limit and v==val+nv and missing==0,(m,root,hits)
 scan_ledger.append(dict(module=m,root=root,visited=v,values=val,noValue=nv,axioms=ax,missing=missing,pending=pending))
for m,root,dst in prunes:
 idx=order.index(m); log=(out/('compile_%03d_%s.log'%(idx,m))).read_text()
 hits=re.findall(r'PRUNED '+re.escape(root)+r': (\d+) -> (\d+) binders; original bridge checked',log)
 none=re.findall(r'NO_BINDER_REDUCTION '+re.escape(root)+r'(?:\s|$)',log)
 assert len(hits)+len(none)==1,(root,hits,none)
 if none:
  bridge_ledger.append(dict(root=root,status='NO_BINDER_REDUCTION'))
  continue
 old,new=map(int,hits[0]);assert new<old
 f=src/('AuditGenerated_'+m+'.lean')
 f.write_text('import '+m+'\n#print axioms '+dst+'\n#print axioms '+dst+'.original\n')
 result=subprocess.run(['lean','--root='+str(src),f.name],cwd=src,env=env,capture_output=True,text=True)
 (out/('generated_bridge_'+m+'.log')).write_text(result.stdout+result.stderr)
 assert result.returncode==0,(m,result.stdout,result.stderr)
 axmap={}
 for line in result.stdout.splitlines():
  hit=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
  if hit:axmap[hit[1]]=[a.strip() for a in (hit[2] or '').split(',') if a.strip()]
 assert set(axmap)=={dst,dst+'.original'} and all(set(a)<=allowed for a in axmap.values()),axmap
 bridge_ledger.append(dict(root=root,dst=dst,old=old,new=new,axioms=axmap,status='LOCAL_BRIDGE_CHECKED'))
(out/'scan_bridge_ledger.json').write_text(json.dumps({'scans':scan_ledger,'prunes':bridge_ledger,'scope':'bounded; pending nodes retained, not complete Main graph'},indent=2))
(out/'result.json').write_text(json.dumps({'status':'CONDITIONAL_DIAGONAL_WINDOW_TO_RH_ONLY','axioms':{n:seen[n] for n in sorted(names)},'scan_lines':[l for l in logs.splitlines() if 'ROOT_SCAN ' in l or 'BINDER_REDUCTION' in l or 'PRUNED ' in l]},indent=2))
print('Conditional diagonal analytic bridge checked; arithmetic premise not proved.')
PY

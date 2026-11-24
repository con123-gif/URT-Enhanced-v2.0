#!/usr/bin/env bash
# Execute ONLY against the pinned frozen source/cache on a sufficiently provisioned machine.
# This checks the new companion, not an independent build of the original proof.
set -euo pipefail
if [[ $# != 2 ]]; then echo "usage: bash $0 FROZEN_REPO OUT_DIR" >&2; exit 2; fi
lane="$(cd "$(dirname "$0")" && pwd)"
frozen="$(cd "$1" && pwd)"
mkdir -p "$2"; out="$(cd "$2" && pwd)"
cd "$frozen"
pin=40e56bab026552e089d7afcfeff08d2defb9c005
frozenpin=4e8bb36faa8c9e3f1bda144ccf5a637f8b96066e
test "$(git rev-parse HEAD)" = "$frozenpin"
git cat-file -e "$pin:src"
test "$(git rev-parse "$pin:src")" = b41b516b1f7baee4d83ced235ecc71fd43c97695
test "$(git rev-parse HEAD:src)" = 24df20b62d9976ccd20da819bc20b16f808f0fdd
test "$(git diff --name-status "$pin" HEAD -- src)" = "$(printf 'A\tsrc/Challenge.lean')"
test "$(git rev-parse HEAD:lake-manifest.json)" = b4d1ec31575a26b2159ec3a262b482bc051f3f6f
test "$(git rev-parse HEAD:lean-toolchain)" = a8afa7d1b02d96f0671eba854a8dc4b416beb473
git diff --exit-code HEAD -- src lean-toolchain lake-manifest.json lakefile.toml
test -z "$(git ls-files --others --exclude-standard src)"
command -v lake >/dev/null
if [[ ! -f .lake/build/lib/lean/Main.olean ]]; then
  free=$(df -Pk . | awk 'NR==2{print $4}')
  if [[ "$free" -lt 110000000 ]]; then echo "BLOCKED: published cache needs approximately 105 GB free" >&2; exit 3; fi
  lake exe cache get 2>&1 | tee "$out/cache.log"
fi
lake build --no-build 2>&1 | tee "$out/cache_check.log"
lake env lean --version | tee "$out/lean_version.txt"
grep -F '4.33.1' "$out/lean_version.txt"
export LEAN_ABORT_ON_PANIC=1
lake env lean --tstack=400000 "$lane/RH_ProofCarryingThetaV2.lean" >"$out/companion.log" 2>&1
python3 - "$out" <<'PY'
import pathlib,re,json,sys
out=pathlib.Path(sys.argv[1])
s=(out/'companion.log').read_text()
names=['GlobalTheory.Fc.S0.StageU.cathedral_stageU','UpperTheory.Lit.cathedral_closedBound','UpperTheory.Top.cathedral_zeroFree','UpperTheory.Top.cathedral_everyCharacter','UpperTheory.Lit.cathedral_thetaWindow','CathedralRHReadableV2.sevenInput','CathedralRHReadableV2.allCharactersFromRow','CathedralRHReadableV2.zetaRight','CathedralRHReadableV2.reconstructedRH']
allow={'propext','Classical.choice','Quot.sound'}
reports={}
for name in names:
    m=re.search(r"['`]?"+re.escape(name)+r"['`]? depends on axioms:\s*\[([^\]]*)\]",s)
    if m:
        vals={a.strip() for a in m.group(1).split(',') if a.strip()}
    elif re.search(r"['`]?"+re.escape(name)+r"['`]? does not depend on any axioms",s):
        vals=set()
    else:
        raise SystemExit('missing axiom report '+name)
    if not vals<=allow: raise SystemExit('unexpected axiom '+name+': '+str(vals-allow))
    reports[name]=sorted(vals)
(out/'summary.json').write_text(json.dumps({'status':'COMPANION_KERNEL_CHECK_USING_PUBLISHED_CACHE','axioms':reports,'independent_original_kernel_recheck':False,'prose_equivalence_checked':False},indent=2)+'\n')
PY

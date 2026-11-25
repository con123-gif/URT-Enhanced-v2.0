#!/usr/bin/env bash
# Native Lean verification of local recursive reduction prototype, not full RH.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
lane="$(cd "$(dirname "$0")" && pwd)"
src="$lane/RHRecursiveReductionAuto.lean"
test "$(git hash-object "$src")" = ac897e4590d28b6b6989b11b6fefb419c38e7276
cp "$src" "$out/"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
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
lake env lean -DwarningAsError=true "$out/RHRecursiveReductionAuto.lean" 2>&1 | tee "$out/lean_check.log"
python3 - "$out/lean_check.log" "$out/result.json" <<'PY'
import json,re,sys,pathlib
log=pathlib.Path(sys.argv[1]).read_text()
expected={'rank_upper','scalar_budget','auto_rank','auto_factor','auto_local_chain','reject_unproved'}
seen={}
for line in log.splitlines():
    m=re.fullmatch(r"'RHReductionAuto\.([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
    if m:
        seen[m.group(1)]=[s.strip() for s in (m.group(2) or '').split(',') if s.strip()]
assert set(seen)==expected,seen
allowed={'propext','Classical.choice','Quot.sound'}
assert all(set(a)<=allowed for a in seen.values()),seen
pathlib.Path(sys.argv[2]).write_text(json.dumps({'status':'LOCAL_LEAN_REDUCTION_CERTIFICATES_CHECKED_NOT_RH','axioms':seen},indent=2)+'\n')
PY

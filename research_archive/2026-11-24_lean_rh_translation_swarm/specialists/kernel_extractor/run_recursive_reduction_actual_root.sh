#!/usr/bin/env bash
# Native Lean verification of local recursive reduction prototype, not full RH.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
lane="$(cd "$(dirname "$0")" && pwd)"
src="$lane/RHRecursiveReductionAutoFixed.lean"
test "$(git hash-object "$src")" = b4d4223d321d14650f92dd205792cde454fe945f
cp "$src" "$out/"
test "$(git hash-object "$lane/RHRecursiveReductionFixed.lean")" = 976c28572f11ffb00e1ae730555e938eeb564cb7
cp "$lane/RHRecursiveReductionFixed.lean" "$out/"
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
lake env lean -DwarningAsError=true "$out/RHRecursiveReductionFixed.lean" 2>&1 | tee "$out/lean_v1_check.log"
# Import the exact root adapter from the pinned RH source, not Main.lean.
# This avoids using the claimed upstream RH theorem to prove itself.
curl --fail --location --retry 3 --output "$out/RhOfRight.lean" "https://raw.githubusercontent.com/leanprover-community/riemann-hypothesis/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/GammaFactorNonvanishing/RhOfRight.lean"
test "$(git hash-object "$out/RhOfRight.lean")" = 3604637147a33e72248faddd775ea750e7846ead
python3 - "$out" <<'PYROOT'
import pathlib,sys
p=pathlib.Path(sys.argv[1])
base=(p/'RHRecursiveReductionFixed.lean').read_text()
root=(p/'RhOfRight.lean').read_text()
assert root.startswith('import Mathlib\n')
combined=base+'\n'+root.removeprefix('import Mathlib\n')+'''
namespace RHActualRoot
theorem reduced_root
    (hz : ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s ≠ 0) :
    RiemannHypothesis := by
  rh_reduce 2 using [Formalism.VW.rh_of_right]

#print axioms Formalism.VW.rh_of_right
#print axioms RHActualRoot.reduced_root
end RHActualRoot
'''
(p/'RHActualRoot.lean').write_text(combined)
PYROOT
lake env lean -DwarningAsError=true "$out/RHActualRoot.lean" 2>&1 | tee "$out/lean_actual_root.log"

lake env lean -DwarningAsError=true "$out/RHRecursiveReductionAutoFixed.lean" 2>&1 | tee "$out/lean_check.log"
python3 - "$out/lean_check.log" "$out/result.json" "$out/lean_v1_check.log" "$out/lean_actual_root.log" <<'PY'
import json,re,sys,pathlib
log=pathlib.Path(sys.argv[1]).read_text()
expected={'rank_upper','scalar_budget','auto_rank','auto_factor','auto_local_chain','reject_unproved','frontier_rank'}
seen={}
for line in log.splitlines():
    m=re.fullmatch(r"'RHReductionAuto\.([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
    if m:
        seen[m.group(1)]=[s.strip() for s in (m.group(2) or '').split(',') if s.strip()]
assert set(seen)==expected,seen
v1={}
for line in pathlib.Path(sys.argv[3]).read_text().splitlines():
    m=re.fullmatch(r"'RHReduction\.([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
    if m: v1[m.group(1)]=[s.strip() for s in (m.group(2) or '').split(',') if s.strip()]
assert set(v1)=={'signed_factor','level_rank_upper','three_count_transfer','budget_transfer','recursive_chain','backtrack_test','rank_test'},v1
root={}
for line in pathlib.Path(sys.argv[4]).read_text().splitlines():
    m=re.fullmatch(r"'((?:RHActualRoot|Formalism\.VW)\.[^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
    if m: root[m.group(1)]=[s.strip() for s in (m.group(2) or '').split(',') if s.strip()]
assert set(root)=={'Formalism.VW.rh_of_right','RHActualRoot.reduced_root'},root
allowed={'propext','Classical.choice','Quot.sound'}
assert all(set(a)<=allowed for a in root.values()),root
assert all(set(a)<=allowed for a in list(seen.values())+list(v1.values())),(seen,v1)
pathlib.Path(sys.argv[2]).write_text(json.dumps({'status':'LOCAL_LEAN_REDUCTION_CERTIFICATES_CHECKED_NOT_RH','axioms':seen,'v1_axioms':v1,'root_axioms':root,'root_status':'CONDITIONAL_NONVANISHING_TO_RH_ONLY'},indent=2)+'\n')
PY

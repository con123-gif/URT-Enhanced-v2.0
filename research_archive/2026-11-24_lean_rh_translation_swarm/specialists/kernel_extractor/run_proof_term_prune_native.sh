#!/usr/bin/env bash
# Verify proof-term pruning, then scan the actual pinned RH functional-equation adapter.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
lane="$(cd "$(dirname "$0")" && pwd)"
test "$(git hash-object "$lane/RHProofTermPrune.lean")" = f6d3e7f6047a7895ecf183be3fb54c203f4fc46a
cp "$lane/RHProofTermPrune.lean" "$out/"
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

# The core prototype has no Mathlib dependency.
lean -DwarningAsError=true "$out/RHProofTermPrune.lean" 2>&1 | tee "$out/prune_core.log"
lake exe cache get Mathlib 2>&1 | tee "$out/mathlib_cache.log"
curl --fail --location --retry 3 --output "$out/RhOfRight.lean" "https://raw.githubusercontent.com/leanprover-community/riemann-hypothesis/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/GammaFactorNonvanishing/RhOfRight.lean"
test "$(git hash-object "$out/RhOfRight.lean")" = 3604637147a33e72248faddd775ea750e7846ead
python3 - "$out" <<'PY'
import pathlib,sys
p=pathlib.Path(sys.argv[1])
core=(p/'RHProofTermPrune.lean').read_text()
root=(p/'RhOfRight.lean').read_text()
assert core.startswith('import Lean\n') and root.startswith('import Mathlib\n')
(p/'RHProofTermPruneActual.lean').write_text('import Mathlib\n'+core.removeprefix('import Lean\n')+'\n'+root.removeprefix('import Mathlib\n')+'\n'+'rh_prune Formalism.VW.rh_of_right as RHPrunedActualRoot\nrh_scan Formalism.VW.rh_of_right limit 2000\n')
PY
lake env lean -DwarningAsError=true "$out/RHProofTermPruneActual.lean" 2>&1 | tee "$out/prune_actual.log"
python3 - "$out" <<'PY'
import pathlib,sys,re,json
p=pathlib.Path(sys.argv[1])
core=(p/'prune_core.log').read_text()
actual=(p/'prune_actual.log').read_text()
assert 'PRUNED RHPruneUnused: 4 -> 2 binders' in core,core
assert 'PRUNED RHPruneDependent: 3 -> 2 binders' in core,core
assert 'NO_BINDER_REDUCTION RHPruneNoDrop' in core,core
assert 'ROOT_SCAN root=Formalism.VW.rh_of_right' in actual,actual
axioms={}
for l in core.splitlines():
    m=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",l.strip())
    if m: axioms[m[1]]=[x.strip() for x in (m[2] or '').split(',') if x.strip()]
assert set(axioms)=={'RHPruneUnusedReduced','RHPruneUnusedReduced.original','RHPruneDependentReduced','RHPruneDependentReduced.original'},axioms
assert all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axioms.values()),axioms
root=[l for l in actual.splitlines() if 'ROOT_SCAN root=Formalism.VW.rh_of_right' in l]
(p/'result.json').write_text(json.dumps({'status':'PRUNING_CONTROLS_CHECKED_AND_BOUNDED_NATIVE_ROOT_SCAN_NOT_RH','axioms':axioms,'root_scan':root},indent=2)+'\n')
PY

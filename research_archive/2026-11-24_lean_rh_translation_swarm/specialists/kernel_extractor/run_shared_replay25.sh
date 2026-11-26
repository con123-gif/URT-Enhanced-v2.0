#!/usr/bin/env bash
# Shared replay queue owner lane 11; prepared, no native result yet.
set -euo pipefail
[[ "$#" == 2 && "$1" == "--out" ]] || exit 2
mkdir -p "$2"
out="$(cd "$2" && pwd)"
lane="$(cd "$(dirname "$0")" && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
cd "$work"
asset=lean-4.33.1-linux.tar.zst
curl --fail --location --retry 3 --output "$asset" "https://github.com/leanprover/lean4/releases/download/v4.33.1/$asset"
sha256sum "$asset" > "$out/lean_release_sha256.txt"
tar --zstd -xf "$asset"
rm "$asset"
export PATH="$work/lean-4.33.1-linux/bin:$PATH"
lean --version | tee "$out/lean_version.txt"
grep -F 'version 4.33.1' "$out/lean_version.txt"
grep -F '819816b2e0a3' "$out/lean_version.txt"
git init -q mathlib
git -C mathlib remote add origin https://github.com/leanprover-community/mathlib4.git
git -C mathlib fetch --depth=1 origin 0df444a360eaa60ab8c11dca51a86af692955474
git -C mathlib checkout --detach FETCH_HEAD
git init -q rh
git -C rh remote add origin https://github.com/leanprover-community/riemann-hypothesis.git
git -C rh fetch --depth=1 origin 40e56bab026552e089d7afcfeff08d2defb9c005
git -C rh checkout --detach FETCH_HEAD
git -C rh rev-parse HEAD > "$out/rh_pin.txt"
git -C mathlib rev-parse HEAD > "$out/mathlib_pin.txt"
test "$(cat rh/lean-toolchain)" = 'leanprover/lean4:v4.33.1'
cd mathlib
lake exe cache get Mathlib 2>&1 | tee "$out/mathlib_cache.log"
lake env python3 -u "$lane/RUN25_SHARED_REPLAY.py" --source "$work/rh" --mathlib "$work/mathlib" --out "$out" --build "$work/build"

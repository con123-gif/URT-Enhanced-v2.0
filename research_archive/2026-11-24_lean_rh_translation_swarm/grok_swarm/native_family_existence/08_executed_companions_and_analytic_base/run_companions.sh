#!/bin/bash
# Typecheck companion files with core `lean` against: deps oleans in /workspace/rh_green_lean/.lake/packages
# (read-only; pins identical to upstream lake-manifest.json) + upstream modules compiled by build_closure.py.
PK=/workspace/rh_green_lean/.lake/packages
LP=$(for p in $(ls $PK); do d=$PK/$p/.lake/build/lib/lean; [ -d $d ] && printf "%s:" $d; done)/workspace/nfe8/build
LEAN=~/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean
for f in "$@"; do
  echo "=== $(basename $f)  sha256=$(sha256sum $f | cut -c1-16)  start $(date '+%H:%M:%S %Z')"
  LEAN_PATH=$LP OMP_NUM_THREADS=1 nice $LEAN -DautoImplicit=false -DrelaxedAutoImplicit=false -DmaxSynthPendingDepth=3 -DmaxHeartbeats=4000000 --tstack=400000 $f
  echo "--- exit=$? $(basename $f)"
done

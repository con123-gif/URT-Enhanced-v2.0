#!/usr/bin/env python3
"""Native dark-support no-go. Execute beside exact source module."""
from pathlib import Path
import runpy, contextlib, io
with contextlib.redirect_stdout(io.StringIO()):
    s=runpy.run_path(str(Path(__file__).with_name("URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py")))
K=s["Q5"]; n5=s["n"]; n3=s["n3"]; zero=K(0)
d=[K(-(-1)**h.bit_count()) if n5[h]==zero else zero for h in range(64)]
assert sum(x!=zero for x in d)==24
assert all(d[h]*n5[h]==zero and d[h]*n3[h]==zero for h in range(64))
assert all(n3[h]==zero and n5[h]==zero for h in range(64) if d[h]!=zero)
Q=s["Q"]
assert any(x!=zero for x in Q(d))
assert all(x==zero for x in Q([d[h]*n5[h] for h in range(64)]))
assert all(x==zero for x in Q([d[h]*n3[h] for h in range(64)]))
print("PASS: 24 dark-support histories; d*h3=d*h5=0; Qd nonzero")

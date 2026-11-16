#!/usr/bin/env python3
"""Fail-on-error registry stage partition integrity certificate (CI infrastructure only)."""
from pathlib import Path
import tomllib
p = Path(__file__).resolve().parents[1] / "cathedral_arf_runner" / "registry.toml"
reg = tomllib.loads(p.read_text())
checks = reg["check"]
ids = [c["id"] for c in checks]
assert len(ids) == len(set(ids)), "duplicate check id"
buckets = ["research_a", "research_b", "research_c", "research_d"]
counts = [sum(c["stage"] == stage for c in checks) for stage in buckets]
assert counts == [39,39,39,38], counts
assert not any(c["stage"] == "research" for c in checks)
assert all(c.get("run") and c.get("claim") for c in checks)
print("CI partition certificate: 155 original research checks retained, stages 39/39/39/38; IDs unique.")

"""Regression for the original October 17 Cathedral research-file recovery.

Only verifies byte integrity and source-first / hidden-history reproducibility.
It does not interpret these conditional operators as proven physical lepton masses.
"""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE = ROOT/'research_archive'
REPAIR = ARCHIVE/'2026-10-17_recovery_assets'

def test_manifest_file_hashes():
    manifest=json.loads((REPAIR/'RECOVERY_MANIFEST.json').read_text())
    records=manifest if isinstance(manifest,list) else manifest.get('files',[])
    assert len(records)>=55
    for r in records:
        path=r.get('path') or r.get('destination') or r.get('destination_path')
        if path and path.startswith('payload/'):
            path=path[len('payload/'):]
        if not path or not path.startswith('research_archive/'):
            continue
        target=ROOT/path
        assert target.is_file(), f'missing original file {path}'
        assert hashlib.sha256(target.read_bytes()).hexdigest()==r['sha256'], f'corrupt {path}'

def test_source_first_and_active_reductions():
    paths=[
        '2026-10-17_source_first_recovery/source_order_regression.py',
        '2026-10-17_exact_14D_H64_reduction/native_h64_exact_14_to4.py',
        '2026-10-17_exact_14D_H64_reduction/execute_exact_full64_to3.py',
    ]
    for rel in paths:
        p=ARCHIVE/rel
        subprocess.run([sys.executable,str(p)],check=True,cwd=p.parent,stdout=subprocess.DEVNULL,timeout=90)

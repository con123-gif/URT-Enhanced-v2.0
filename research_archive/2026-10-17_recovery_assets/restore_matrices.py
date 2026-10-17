#!/usr/bin/env python3
"""Byte-exact restoration of two Oct 2026 H64 matrix snapshots.

Only standard library used. Works offline from the committed .partXX blobs.
Checks original SHA256 before writing. Never overwrites a differing file unless
--force is explicitly supplied. Safe to run repeatedly.
"""
from __future__ import annotations
import argparse
import hashlib
from pathlib import Path

ARCHIVE_SHA256 = '00715b3891570814eb346387017ea7abcaf166f215d5e83655b17673c23e1b58'
PARTS = 6
DATA_TARGETS = [
    'research_archive/2026-10-17_h64_quadratic_koide_phase/combined_signed_source_operators.npz',
    'research_archive/2026-10-17_original_oct08_source/combined_source_work/species/combined_signed_source_operators.npz',
]

def sha256(b: bytes) -> str:
    return hashlib.sha256(b).hexdigest()

def restore(repo_root: Path, force: bool=False, verify_only: bool=False) -> None:
    assets = repo_root / 'research_archive' / '2026-10-17_recovery_assets'
    chunks = [assets / ('combined_signed_source_operators.part%02d' % i) for i in range(PARTS)]
    missing = [str(p) for p in chunks if not p.is_file()]
    if missing:
        raise FileNotFoundError('Missing Git-tracked original-data chunk(s): ' + ', '.join(missing))
    original = b''.join(p.read_bytes() for p in chunks)
    if sha256(original) != ARCHIVE_SHA256:
        raise ValueError('Reassembled matrix checksum mismatch: refused to write')
    for dest in (repo_root / p for p in DATA_TARGETS):
        if dest.exists():
            actual = sha256(dest.read_bytes())
            if actual == ARCHIVE_SHA256:
                print('VERIFIED', dest)
                continue
            if not force:
                raise RuntimeError('Refusing to overwrite different existing data: ' + str(dest))
        if verify_only:
            raise FileNotFoundError('Missing restored data: '+str(dest))
        dest.parent.mkdir(parents=True,exist_ok=True)
        dest.write_bytes(original)
        print('RESTORED', dest, len(original),'bytes', ARCHIVE_SHA256)

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--repo-root',type=Path,default=Path(__file__).resolve().parents[2])
    p.add_argument('--verify',action='store_true')
    p.add_argument('--force',action='store_true')
    args=p.parse_args()
    restore(args.repo_root,force=args.force,verify_only=args.verify)

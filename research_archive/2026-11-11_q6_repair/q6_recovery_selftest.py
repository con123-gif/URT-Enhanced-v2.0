#!/usr/bin/env python3
"""Fail-on-error structural regression of Q6 post-Q13 companion-copy invariants.
No synthetic physics operators: temporary byte strings test only archive plumbing.
The registered Q6 check verifies actual original archive files and SHA256.
"""
from pathlib import Path
from tempfile import TemporaryDirectory
import hashlib

HISTORICAL = (
    'golden_species_operators.npz', 'correlated_hat_k5_checks.json',
    'outer_history_operators.npz', 'theory_input_v5.md',
    'a4_entropy_gaussian.py', 'compact_source_normalization_operators.npz',
    'grounded_charged_amplitude_operators.npz', 'combined_chat_recovery.json',
    'original_h64_species_link_source.npz', 'run_endpoint_test.py',
)
RECOVERED = {'golden_species_operators.npz', 'original_h64_species_link_source.npz'}
NO_COPY = set(HISTORICAL) - RECOVERED - {'run_endpoint_test.py'}
assert len(HISTORICAL) == len(set(HISTORICAL)) == 10
assert len(RECOVERED) == 2 and len(NO_COPY) == 7
assert len(set(HISTORICAL)-RECOVERED) == 8

def check_copy(src: Path, dst: Path, digest: str) -> None:
    assert src.is_file() and dst.is_file()
    assert hashlib.sha256(src.read_bytes()).hexdigest() == digest
    assert hashlib.sha256(dst.read_bytes()).hexdigest() == digest

with TemporaryDirectory() as td:
    base=Path(td)
    for name in RECOVERED:
        src=base/'archive'/name
        dst=base/'consumer'/name
        src.parent.mkdir(parents=True,exist_ok=True)
        dst.parent.mkdir(parents=True,exist_ok=True)
        payload=(name+' : exact archive companion regression').encode()
        src.write_bytes(payload)
        dst.write_bytes(payload)
        digest=hashlib.sha256(payload).hexdigest()
        check_copy(src,dst,digest)
        dst.write_bytes(payload+b' changed')
        try:check_copy(src,dst,digest)
        except AssertionError:pass
        else:raise AssertionError('mutated companion not detected')
        dst.unlink()
        try:check_copy(src,dst,digest)
        except AssertionError:pass
        else:raise AssertionError('missing recovered companion not detected')
print('PASS local structural certificate: historical 10, recovered 2, still absent 8, no-copy 7; exact SHA256 detects tampering and deletion')
